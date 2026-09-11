import fs from 'fs';

function fail(msg) {
  console.error(`❌ Validation failed: ${msg}`);
  process.exit(1);
}

function pass(msg) {
  console.log(`✅ ${msg}`);
}

const fileA = 'supabase/migrations/20260910172000_add_source_validated_content_status.sql';
const fileB = 'supabase/migrations/20260910173000_update_student_content_rls.sql';
const fileC = 'supabase/migrations/20260910174000_promote_source_validated_lessons.sql';
const fileBadge = 'src/components/ContentStatusBadge.tsx';

if (!fs.existsSync(fileA)) fail(`${fileA} not found.`);
if (!fs.existsSync(fileB)) fail(`${fileB} not found.`);
if (!fs.existsSync(fileC)) fail(`${fileC} not found.`);
if (!fs.existsSync(fileBadge)) fail(`${fileBadge} not found.`);

const contentA = fs.readFileSync(fileA, 'utf-8');
const contentB = fs.readFileSync(fileB, 'utf-8');
const contentC = fs.readFileSync(fileC, 'utf-8');
const contentBadge = fs.readFileSync(fileBadge, 'utf-8');

// --- A Validation ---
if (!/ALTER TYPE\s+public\.content_status\s+ADD VALUE\s+IF NOT EXISTS\s+'SOURCE_VALIDATED'\s+BEFORE\s+'VERIFIED';/i.test(contentA)) {
  fail('A must contain exact ALTER TYPE public.content_status ADD VALUE IF NOT EXISTS \'SOURCE_VALIDATED\' BEFORE \'VERIFIED\';');
}
const statementsA = contentA.split(';').filter(s => s.trim().length > 0);
if (statementsA.length > 1) {
  fail('A must be an isolated migration without other statements or transactions.');
}
pass('A (172000) validated.');

// --- B Validation ---
if (!/BEGIN;/i.test(contentB) || !/COMMIT;/i.test(contentB)) {
  fail('B must be a single transaction (BEGIN; ... COMMIT;).');
}
const policies = ['lessons_select_student', 'lesson_sections_select_student', 'lesson_sources_select_student', 'sources_select_student'];
for (const p of policies) {
  if (!new RegExp(`DROP POLICY IF EXISTS "${p}"`, 'i').test(contentB)) fail(`B missing DROP POLICY for ${p}`);
  if (!new RegExp(`CREATE POLICY "${p}"`, 'i').test(contentB)) fail(`B missing CREATE POLICY for ${p}`);
}
if (/SECURITY DEFINER/i.test(contentB)) fail('B must not contain SECURITY DEFINER.');
if (/GRANT /i.test(contentB)) fail('B must not contain grants.');
if (!contentB.includes("role = 'STUDENT'") || !contentB.includes("is_active = true") || !contentB.includes("auth.uid()")) {
  fail('B missing active STUDENT checks.');
}
if (contentB.match(/sources\.verified/i)) fail('B lesson_sources must not query sources.verified.');
if (!contentB.includes("status IN ('SOURCE_VALIDATED', 'VERIFIED')") && !contentB.includes("status in ('SOURCE_VALIDATED', 'VERIFIED')")) {
  fail("B missing status IN ('SOURCE_VALIDATED', 'VERIFIED').");
}
pass('B (173000) validated.');

// --- C Validation ---
if (/LIKE/i.test(contentC)) fail('C must not use LIKE.');

const extractExpected = (prefix, count) => Array.from({length: count}, (_, i) => `${prefix}-${String(i+1).padStart(2, '0')}`);
const expectedAdult = extractExpected('ADULT', 29);
const expectedMental = extractExpected('MENTAL', 10);
const expectedPublic = extractExpected('PUBLIC', 13);

const extractActual = (prefix) => {
  const matches = contentC.match(new RegExp(`'${prefix}-\\d{2}'`, 'g')) || [];
  return [...new Set(matches.map(c => c.replace(/'/g, '')))].sort();
};

if (extractActual('ADULT').join(',') !== expectedAdult.join(',')) fail('C adult codes mismatch.');
if (extractActual('MENTAL').join(',') !== expectedMental.join(',')) fail('C mental codes mismatch.');
if (extractActual('PUBLIC').join(',') !== expectedPublic.join(',')) fail('C public codes mismatch.');

if (!contentC.includes('RAISE EXCEPTION')) fail('C must include RAISE EXCEPTION in a DO block.');

const updateMatch = contentC.match(/UPDATE\s+public\.lessons(?:\s+\w+)?\s+SET\s+([\s\S]*?)WHERE/i);
if (!updateMatch) fail("C missing UPDATE statement for public.lessons");
const setClause = updateMatch[1].trim();
// Also remove the FROM clause from setClause if present, for validation
const setClauseWithoutFrom = setClause.replace(/\s*FROM\s+public\.topics\s+\w+\s*$/i, '').trim();
if (setClauseWithoutFrom !== "status = 'SOURCE_VALIDATED'") {
  fail("C UPDATE must ONLY set status = 'SOURCE_VALIDATED'. Found: " + setClause);
}

if (!contentC.includes("version = 1") || !contentC.includes("is_current = true") || !contentC.includes("reviewed_at IS NULL")) fail("C missing preconditions.");

// New TDD conditions for JOINs
if (/(FROM|UPDATE)\s+public\.lessons(\s+WHERE|\s+SET)[\s\S]*?\bcode\s*=/i.test(contentC)) {
  fail("C must not query public.lessons directly by code without a JOIN to public.topics.");
}

if (!contentC.includes("JOIN public.topics t ON t.id = l.topic_id") && !contentC.includes("JOIN public.topics t ON l.topic_id = t.id")) {
  fail("C preconditions and postconditions must explicitly JOIN public.topics t on topic_id.");
}

if (!contentC.includes("t.code = ANY")) {
  fail("C must use t.code for array inclusion checks.");
}

if (!contentC.includes("FROM public.topics t") || (!contentC.includes("t.id = l.topic_id") && !contentC.includes("l.topic_id = t.id"))) {
  fail("C UPDATE must have FROM public.topics t and link t.id = l.topic_id.");
}

pass('C (174000) validated.');

// --- D Validation ---
if (!contentBadge.includes('case "SOURCE_VALIDATED":')) fail('Badge missing case "SOURCE_VALIDATED".');
if (!contentBadge.includes('label = "Validado con fuentes";')) fail('Badge missing label "Validado con fuentes".');
if (contentBadge.includes('verificado') || contentBadge.includes('revisado') || contentBadge.includes('certificado')) fail('Badge must not call it verificado/revisado/certificado.');
pass('D (Badge) validated.');

console.log('✅ All validations passed.');
process.exit(0);
