import fs from "fs";
import path from "path";
import crypto from "crypto";

const CICDE_CONTENT_NAMESPACE = "b6b8b0e0-c8f2-4b2a-a0a3-f0e0c0b8b8b8";
const areaCode = "PUBLIC_HEALTH";
const expectedTopics = Array.from(
  { length: 13 },
  (_, index) => `PUBLIC-${String(index + 1).padStart(2, "0")}`,
);
const baseDir = path.join(process.cwd(), "content", "validated", "salud-publica");
const topicsMigrationName = "20260910170000_seed_public_health_topics.sql";
const lessonsMigrationName = "20260910171000_seed_public_health_lessons_sources.sql";

function generateUuidV5(name) {
  const namespaceBuffer = Buffer.from(
    CICDE_CONTENT_NAMESPACE.replace(/-/g, ""),
    "hex",
  );
  const hash = crypto
    .createHash("sha1")
    .update(namespaceBuffer)
    .update(Buffer.from(name, "utf8"))
    .digest();

  hash[6] = (hash[6] & 0x0f) | 0x50;
  hash[8] = (hash[8] & 0x3f) | 0x80;

  const hex = hash.toString("hex");
  return [
    hex.substring(0, 8),
    hex.substring(8, 12),
    hex.substring(12, 16),
    hex.substring(16, 20),
    hex.substring(20, 32),
  ].join("-");
}

function sqlString(value) {
  return `'${String(value).replace(/'/g, "''")}'`;
}

function sqlNullable(value) {
  return value === null || value === undefined || value === ""
    ? "NULL"
    : sqlString(value);
}

function sourceDeduplicationKey(source) {
  const sourceType = (source.source_type || "COMPLEMENTARY").trim();
  const title = (source.title || "").trim();
  const authors = (source.authors || "").trim();
  const organization = (source.organization || "").trim();
  const publisher = (source.publisher || "").trim();
  const publicationYear = source.publication_year || source.year || null;
  const edition = (source.edition || "").trim();
  const url = (source.url || "").trim();

  return `${sourceType}|${title.toLowerCase()}|${authors.toLowerCase()}|${organization.toLowerCase()}|${publisher.toLowerCase()}|${publicationYear}|${edition.toLowerCase()}|${url.toLowerCase()}`;
}

function readPackage(topicCode) {
  const folderPath = path.join(baseDir, topicCode);
  if (!fs.existsSync(folderPath)) {
    throw new Error(`Missing package directory: ${topicCode}`);
  }

  const files = fs.readdirSync(folderPath).filter((file) => !file.startsWith("."));
  const markdownFiles = files.filter((file) => file.endsWith("_VALIDADO.md"));
  const specificationFiles = files.filter((file) => file.endsWith("_SPEC.json"));
  if (markdownFiles.length !== 1 || specificationFiles.length !== 1) {
    throw new Error(`Expected one Markdown and one JSON specification for ${topicCode}`);
  }

  let specification;
  try {
    specification = JSON.parse(
      fs.readFileSync(path.join(folderPath, specificationFiles[0]), "utf8"),
    );
  } catch (error) {
    throw new Error(`Invalid JSON specification for ${topicCode}: ${error.message}`);
  }
  if (
    specification.topic_code !== topicCode ||
    specification.area_code !== areaCode ||
    specification.status !== "REVIEW" ||
    specification.version !== 1 ||
    specification.is_current !== true ||
    !specification.title ||
    !specification.summary
  ) {
    throw new Error(`Invalid lesson metadata in ${topicCode}`);
  }

  const sources = specification.sources || specification.source_records;
  if (!Array.isArray(sources)) {
    throw new Error(`Sources array missing in ${topicCode}`);
  }
  for (const source of sources) {
    if (!source.title || !source.source_type) {
      throw new Error(`Incomplete source metadata in ${topicCode}`);
    }
  }

  return {
    markdown: fs.readFileSync(path.join(folderPath, markdownFiles[0]), "utf8"),
    specification,
  };
}

function splitSections(markdown, topicCode, lessonId) {
  const sections = [];
  const lines = markdown.split("\n");
  let currentTitle = "Introducción";
  let currentBody = [];
  let sortOrder = 1;

  for (const line of lines) {
    const heading = line.match(/^(#{1,6})\s+(.*)$/);
    if (heading) {
      if (currentBody.length > 0 || sortOrder > 1) {
        const sectionKey = `sec_${sortOrder}`;
        sections.push({
          id: generateUuidV5(`section:${topicCode}:v1:${sectionKey}`),
          lessonId,
          sectionKey,
          title: currentTitle.trim(),
          body: currentBody.join("\n").trim(),
          sortOrder,
        });
        sortOrder += 1;
        currentBody = [];
      }
      currentTitle = heading[2].trim();
    } else {
      currentBody.push(line);
    }
  }

  if (currentBody.length > 0) {
    const sectionKey = `sec_${sortOrder}`;
    sections.push({
      id: generateUuidV5(`section:${topicCode}:v1:${sectionKey}`),
      lessonId,
      sectionKey,
      title: currentTitle.trim(),
      body: currentBody.join("\n").trim(),
      sortOrder,
    });
  }

  const headingCount = lines.filter((line) => /^(#{1,6})\s+/.test(line)).length;
  // The first H1 is the package document title; the lesson title carries it separately.
  if (sections.length !== headingCount - 1) {
    throw new Error(`Section preservation check failed for ${topicCode}`);
  }

  return sections;
}

const uniqueSources = new Map();
const lessons = [];
const sections = [];
const lessonSources = [];

for (const topicCode of expectedTopics) {
  const { markdown, specification } = readPackage(topicCode);
  const lessonId = generateUuidV5(`lesson:${topicCode}:v1`);
  lessons.push({
    id: lessonId,
    topicCode,
    title: specification.title,
    summary: specification.summary,
  });
  sections.push(...splitSections(markdown, topicCode, lessonId));

  const relationshipsForLesson = new Set();
  for (const source of specification.sources || specification.source_records) {
    const deduplicationKey = sourceDeduplicationKey(source);
    let mappedSource = uniqueSources.get(deduplicationKey);
    if (!mappedSource) {
      const publicationYear = source.publication_year || source.year || null;
      mappedSource = {
        id: generateUuidV5(`source:${deduplicationKey}`),
        sourceType: source.source_type.trim(),
        title: source.title.trim(),
        authors: (source.authors || "").trim(),
        organization: (source.organization || "").trim(),
        publisher: (source.publisher || "").trim(),
        publicationYear,
        edition: (source.edition || "").trim(),
        url: (source.url || "").trim(),
        citationText: source.title.trim(),
      };
      uniqueSources.set(deduplicationKey, mappedSource);
    }

    if (relationshipsForLesson.has(mappedSource.id)) {
      throw new Error(`Duplicate lesson-source relationship in ${topicCode}`);
    }
    relationshipsForLesson.add(mappedSource.id);
    lessonSources.push({
      lessonId,
      sourceId: mappedSource.id,
      usageNote: (source.usage || source.notes || "").trim(),
      isPrimary: source.role === "primary",
    });
  }
}

const topicsSql = `-- CICDE Enfermeria 2026
-- Auto-generated seed for PUBLIC_HEALTH topics
BEGIN;

INSERT INTO public.topics (area_id, code, title, sort_order)
SELECT area.id, topic.code, topic.title, topic.sort_order
FROM public.areas AS area
CROSS JOIN (
  VALUES
${lessons
  .map(
    (lesson, index) =>
      `    (${sqlString(lesson.topicCode)}, ${sqlString(lesson.title)}, ${index + 1})`,
  )
  .join(",\n")}
) AS topic(code, title, sort_order)
WHERE area.code = ${sqlString(areaCode)}
ON CONFLICT (code) DO NOTHING;

COMMIT;
`;

let lessonsSql = `-- CICDE Enfermeria 2026
-- Auto-generated migration for PUBLIC_HEALTH lessons, sections, and sources
BEGIN;

-- 1. Insert globally deduplicated sources. All source verification provenance is NULL.
`;
for (const source of uniqueSources.values()) {
  lessonsSql += `INSERT INTO public.sources (id, source_type, title, authors, organization, publisher, publication_year, edition, url, citation_text, verified, verified_at, verified_by)
VALUES (${sqlString(source.id)}, ${sqlString(source.sourceType)}, ${sqlString(source.title)}, ${sqlNullable(source.authors)}, ${sqlNullable(source.organization)}, ${sqlNullable(source.publisher)}, ${source.publicationYear || "NULL"}, ${sqlNullable(source.edition)}, ${sqlNullable(source.url)}, ${sqlString(source.citationText)}, false, NULL, NULL)
ON CONFLICT (id) DO NOTHING;
`;
}

lessonsSql += `\n-- 2. Insert REVIEW lessons with null reviewer provenance.\n`;
for (const lesson of lessons) {
  lessonsSql += `INSERT INTO public.lessons (id, topic_id, title, summary, status, version, is_current, reviewed_at, reviewed_by)
SELECT ${sqlString(lesson.id)}, id, ${sqlString(lesson.title)}, ${sqlString(lesson.summary)}, 'REVIEW', 1, true, NULL, NULL
FROM public.topics
WHERE code = ${sqlString(lesson.topicCode)}
ON CONFLICT (topic_id, version) DO NOTHING;
`;
}

lessonsSql += `\n-- 3. Insert all Markdown sections in source order.\n`;
for (const section of sections) {
  lessonsSql += `INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES (${sqlString(section.id)}, ${sqlString(section.lessonId)}, ${sqlString(section.sectionKey)}, ${sqlString(section.title)}, ${sqlString(section.body)}, ${section.sortOrder})
ON CONFLICT (lesson_id, section_key) DO NOTHING;
`;
}

lessonsSql += `\n-- 4. Insert lesson-source relationships.\n`;
for (const lessonSource of lessonSources) {
  lessonsSql += `INSERT INTO public.lesson_sources (lesson_id, source_id, reference_detail, usage_note, is_primary)
VALUES (${sqlString(lessonSource.lessonId)}, ${sqlString(lessonSource.sourceId)}, NULL, ${sqlNullable(lessonSource.usageNote)}, ${lessonSource.isPrimary})
ON CONFLICT (lesson_id, source_id) DO NOTHING;
`;
}
lessonsSql += "\nCOMMIT;\n";

const topicsMigrationPath = path.join(process.cwd(), "supabase", "migrations", topicsMigrationName);
const lessonsMigrationPath = path.join(process.cwd(), "supabase", "migrations", lessonsMigrationName);
fs.writeFileSync(topicsMigrationPath, topicsSql);
fs.writeFileSync(lessonsMigrationPath, lessonsSql);

const duplicateReferencesEliminated = lessonSources.length - uniqueSources.size;
const report = `# Public Health Content Import Report

## Execution Summary

- Validated packages: **13/13**.
- Area: **PUBLIC_HEALTH**.
- Topics: **${lessons.length}** (PUBLIC-01 through PUBLIC-13).
- Lessons: **${lessons.length}**.
- Lesson sections: **${sections.length}**.
- Lesson-source relationships: **${lessonSources.length}**.
- Distinct referenced sources: **${uniqueSources.size}**.
- Global duplicate source references eliminated: **${duplicateReferencesEliminated}**.
- Topic migration: \`${topicsMigrationName}\`.
- Lesson/source migration: \`${lessonsMigrationName}\`.

## Import Invariants

- Every lesson is imported with \`status=REVIEW\`, \`version=1\`, and \`is_current=true\`.
- Reviewer provenance is not invented: \`reviewed_at=NULL\` and \`reviewed_by=NULL\`.
- Every source is imported with \`verified=false\`, \`verified_at=NULL\`, and \`verified_by=NULL\`. None is human-verified.
- Each Markdown content section (after its package document title) is preserved as one ordered lesson section; all generated section and relationship foreign keys reference generated deterministic lesson/source IDs.
- The migrations are idempotent through \`ON CONFLICT DO NOTHING\` on the applicable unique keys.

## Deterministic IDs and Source Deduplication

UUID v5 (RFC 4122) uses the stable namespace \`${CICDE_CONTENT_NAMESPACE}\` and these names:

- Lessons: \`lesson:<topicCode>:v1\`
- Sections: \`section:<topicCode>:v1:sec_<sort_order>\`
- Sources: \`source:<canonicalSourceKey>\`

The global source deduplication key is \`source_type | title | authors | organization | publisher | publication_year | edition | url\`, with text fields trimmed and normalized to lowercase. This is compatible with the Adult and Mental generators: one canonical source ID is reused by all Public Health lesson-source relationships with identical source metadata.

## Required Re-verification and Audit Notes

- **PUBLIC-01:** The Sala/Albaladejo record has the intentional \`[KNOWN_METADATA_GAP]\` for organization/publisher. No metadata was invented.
- **PUBLIC-05:** Re-verify the documentary record after 18 September 2026 for a possible PABS Annex/Pandemic Agreement status change.
- **PUBLIC-08:** Audit the Panama 2026 health-system structure/context documents before integration.
- **PUBLIC-11:** Audit the Panama 2026 national vaccination schedule and documented updates before integration.
- These notes do not confer human verification; none of the imported sources is human-verified.
`;

fs.writeFileSync(
  path.join(process.cwd(), "docs", "PUBLIC_HEALTH_CONTENT_IMPORT_REPORT.md"),
  report,
);

console.log(`Generated migration: ${topicsMigrationName}`);
console.log(`Generated migration: ${lessonsMigrationName}`);
console.log("Report written to docs/PUBLIC_HEALTH_CONTENT_IMPORT_REPORT.md");
console.log(
  `Counts: topics=${lessons.length}, lessons=${lessons.length}, lesson_sections=${sections.length}, lesson_sources=${lessonSources.length}, distinct_sources=${uniqueSources.size}, duplicates_eliminated=${duplicateReferencesEliminated}`,
);
