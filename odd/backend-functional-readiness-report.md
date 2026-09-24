# CICDE Functional Backend Readiness Report

**Date:** 2025-01-24  
**Mode:** READ-ONLY (no migrations created, no writes, no commits)  
**Audited:** Backend schema + content inventory  
**Parallel Work:** PRINCIPAL agent actively integrating content in master branch

---

## 1. Existing Backend

### Progress-Related Tables
❌ **NONE** — No `user_lesson_progress`, `lesson_completion`, or similar tables exist.

### Question-Related Tables
❌ **NONE** — No `questions`, `question_bank`, `question_options` tables exist.

### Mock-Related Tables
❌ **NONE** — No `mock_exams`, `exam_attempts`, `assessments` tables exist.

### Existing Enums (Unused)
✅ **EXIST** but NO tables reference them:

```sql
-- From 20260908214500_create_enums.sql
create type public.question_type as enum (
  'MEMORY',
  'COMPREHENSION',
  'CLINICAL_CASE',
  'PRIORITY',
  'PAE',
  'PHARMACOLOGY',
  'CALCULATION',
  'ETHICS'
);

create type public.difficulty_level as enum (
  'EASY',
  'MEDIUM',
  'HARD'
);

create type public.assessment_type as enum (
  'PRACTICE',
  'MODULE_EXAM',
  'MOCK_EXAM'
);

create type public.attempt_status as enum (
  'IN_PROGRESS',
  'COMPLETED',
  'ABANDONED'
);
```

**Note:** These enums suggest prior design intent for questions/assessment system, but no tables were ever created to use them.

### Existing Core Tables (Reusable)
✅ **Content Infrastructure:**
- `profiles` (id, full_name, role: ADMIN|STUDENT, is_active)
- `areas` (id, code, name, description, sort_order, is_active)
- `topics` (id, area_id, parent_topic_id, code, title, sort_order, is_active)
- `lessons` (id, topic_id, title, summary, status: DRAFT|REVIEW|SOURCE_VALIDATED|VERIFIED|ARCHIVED, version, is_current)
- `lesson_sections` (id, lesson_id, section_key, title, body, sort_order)
- `sources` (id, source_type: CICDE|PANAMA_OFFICIAL|COMPLEMENTARY, title, authors, verified)
- `lesson_sources` (lesson_id, source_id, is_primary)

**RLS:** Already configured for authenticated students (read-only for DRAFT/REVIEW content, full access to SOURCE_VALIDATED/VERIFIED).

**Verdict:** ✅ **Content infrastructure is complete and reusable.** No changes needed to core tables.

---

## 2. Real Question Bank

### Exists
❌ **NO**

### Evidence Searched
Exhaustively searched:
- `/content/validated/` (9 areas: adult, mental, salud-publica, obgyn, pediatria, administracion, ethics, pharm, research)
- 87 lesson spec files (`.json` + `.md` pairs)
- Scripts directory
- Migrations

### What Was Found
✅ **Study content with embedded exam-prep sections:**
- Lessons contain sections named: "Situaciones tipo examen", "Preguntas rápidas de repaso", "Casos clínicos", "Distractores frecuentes"
- Example: ETHICS-02 has "18 situaciones originales tipo examen"
- Format: **Narrative case studies** embedded in lesson markdown

❌ **NOT FOUND:**
- No structured questions with:
  - Stem (question text)
  - 4 options (A, B, C, D)
  - Correct answer marked
  - Distractors
  - Rationale/explanation
- No separate question bank files (`.json`, `.csv`, `.sql`)
- No question generation scripts
- No fixtures or seed data for questions

### Can Build 200-Question Mock
❌ **NO** — Zero structured questions exist.

### Critical Gap
🚨 **P0 ACADEMIC BLOCKER**

The platform has **ZERO independent practice questions**. All "exam prep" content is **narrative study material** embedded within lessons, not standalone assessable questions.

To build a functional mock exam (200 questions, 240 minutes), the academic team must:
1. Design question format/schema
2. Author 200+ structured questions (minimum 250-300 recommended for variety)
3. Map questions to areas/topics
4. Write explanations
5. Source/verify each question

**Estimated effort:** 4-6 weeks for academic content creation (before any backend/frontend work).

---

## 3. Progress Backend Design

### Recommended Table

```sql
create table public.user_lesson_progress (
  id uuid primary key default gen_random_uuid(),
  user_id uuid not null references auth.users(id) on delete cascade,
  lesson_id uuid not null references public.lessons(id) on delete cascade,
  started_at timestamptz not null default now(),
  completed_at timestamptz,
  last_visited_section_id uuid references public.lesson_sections(id) on delete set null,
  reading_progress_percent integer not null default 0,
  updated_at timestamptz not null default now(),
  
  constraint uq_user_lesson unique (user_id, lesson_id),
  constraint chk_progress_percent check (reading_progress_percent >= 0 and reading_progress_percent <= 100)
);

create index user_lesson_progress_user_id_idx on public.user_lesson_progress(user_id);
create index user_lesson_progress_lesson_id_idx on public.user_lesson_progress(lesson_id);
create index user_lesson_progress_completed_at_idx on public.user_lesson_progress(completed_at) where completed_at is not null;
```

### Columns

| Column | Type | Purpose | Nullable |
|--------|------|---------|----------|
| id | uuid | PK | No |
| user_id | uuid | FK to auth.users | No |
| lesson_id | uuid | FK to lessons | No |
| started_at | timestamptz | First access | No |
| completed_at | timestamptz | Completion timestamp | Yes |
| last_visited_section_id | uuid | Resume point | Yes |
| reading_progress_percent | integer | 0-100 | No |
| updated_at | timestamptz | Last activity | No |

**Removed from UI proposal:**
- `visited_chapters` jsonb — Lessons don't have formal "chapters" in schema
- `visited_sections` jsonb — Too granular for MVP
- `last_visited_chapter_id` — Not in schema

**Simplified to:**
- `last_visited_section_id` — Direct FK to lesson_sections
- `reading_progress_percent` — Calculated by UI, stored for dashboard

### Constraints
- `uq_user_lesson` — One progress record per user-lesson pair
- `chk_progress_percent` — Enforce 0-100 range

### RLS

```sql
alter table public.user_lesson_progress enable row level security;

-- Students: own progress only
create policy "Students read own progress"
  on public.user_lesson_progress for select
  using (auth.uid() = user_id);

create policy "Students insert own progress"
  on public.user_lesson_progress for insert
  with check (auth.uid() = user_id);

create policy "Students update own progress"
  on public.user_lesson_progress for update
  using (auth.uid() = user_id);

-- Admins: read all (no write — preserve audit trail)
create policy "Admins read all progress"
  on public.user_lesson_progress for select
  using (
    exists (
      select 1 from public.profiles
      where id = auth.uid() and role = 'ADMIN' and is_active = true
    )
  );
```

### Indexes
- `user_id` — For dashboard queries (user's progress)
- `lesson_id` — For lesson-specific analytics
- `completed_at (partial)` — For completion counts (WHERE completed_at IS NOT NULL)

---

## 4. Questions Backend Design

### ⚠️ BLOCKED BY ACADEMIC CONTENT

Cannot finalize schema without real question data.

### Recommended Waiting Strategy

1. **DO NOT** create `questions` table yet
2. **WAIT** for academic team to:
   - Define question format
   - Author sample questions (50-100 minimum)
   - Decide: JSON options vs child `question_options` table
   - Clarify: case-based questions with sub-questions?
3. **THEN** design schema matching actual data structure

### Placeholder Schema (DO NOT IMPLEMENT)

```sql
-- PLACEHOLDER — Not ready for migration
create table public.questions (
  id uuid primary key default gen_random_uuid(),
  area_id uuid references public.areas(id) on delete restrict,
  topic_id uuid references public.topics(id) on delete restrict,
  lesson_id uuid references public.lessons(id) on delete set null, -- optional linkage
  question_type public.question_type not null,
  difficulty public.difficulty_level not null default 'MEDIUM',
  stem text not null,
  options jsonb not null, -- OR separate question_options table (TBD)
  correct_answer text not null, -- OR index into options (TBD)
  explanation text not null,
  tags text[] default array[]::text[],
  status public.content_status not null default 'DRAFT',
  is_active boolean not null default true,
  created_at timestamptz not null default now(),
  updated_at timestamptz not null default now()
);
```

**Issues to resolve first:**
- Options format: JSON array vs child table?
- Correct answer: text value vs option index?
- Case-based questions: single row vs parent-child?
- Images: URL in stem or separate `question_media` table?

---

## 5. Attempts

### ⚠️ BLOCKED BY QUESTIONS TABLE

Cannot design attempts without questions.

### Conceptual Model (After Questions Exist)

```sql
create table public.question_attempts (
  id uuid primary key default gen_random_uuid(),
  user_id uuid not null references auth.users(id) on delete cascade,
  question_id uuid not null references public.questions(id) on delete cascade,
  user_answer text not null,
  is_correct boolean not null,
  time_spent_seconds integer,
  attempted_at timestamptz not null default now()
);
```

**Scoring:** Server-side comparison of `user_answer` against `questions.correct_answer`.

**Review Support:** Query by user_id + is_correct=false for "review incorrect" feature.

---

## 6. Mock Exam

### ⚠️ BLOCKED BY QUESTION BANK

Cannot assemble 200-question mock without 200+ real questions.

### Conceptual Schema (After Questions Exist)

```sql
create table public.mock_exams (
  id uuid primary key default gen_random_uuid(),
  user_id uuid not null references auth.users(id) on delete cascade,
  status public.attempt_status not null default 'IN_PROGRESS',
  started_at timestamptz not null default now(),
  submitted_at timestamptz,
  time_limit_minutes integer not null default 240,
  elapsed_time_seconds integer default 0,
  question_ids uuid[] not null, -- array of 200 question IDs
  answers jsonb default '{}'::jsonb, -- { "question_id": "user_answer" }
  score_percent numeric(5,2),
  pass_threshold_percent integer not null default 61,
  area_scores jsonb, -- { "area_code": { "correct": X, "total": Y } }
  created_at timestamptz not null default now(),
  updated_at timestamptz not null default now(),
  
  constraint chk_mock_status check (status in ('IN_PROGRESS', 'COMPLETED', 'ABANDONED')),
  constraint chk_elapsed_time check (elapsed_time_seconds >= 0),
  constraint chk_score_percent check (score_percent is null or (score_percent >= 0 and score_percent <= 100)),
  constraint chk_questions_count check (array_length(question_ids, 1) = 200)
);
```

### 200-Question Support
❌ **NOT POSSIBLE** — Zero questions available.

**Minimum needed:** 250-300 questions (for variety across multiple mock attempts).

### 240-Minute Support
✅ **Schema ready** — `time_limit_minutes` field supports it.

### Resume/Refresh
✅ **Supported** — `status='IN_PROGRESS'` + `elapsed_time_seconds` + `answers` JSONB.

### Submission
✅ **Supported** — Set `status='COMPLETED'`, `submitted_at=now()`, calculate `score_percent` and `area_scores` server-side.

### Scoring
Server-side RPC/function:
1. Compare each `answers[question_id]` against `questions.correct_answer`
2. Calculate total correct / 200
3. Calculate per-area breakdown
4. Store in `score_percent` and `area_scores`

### History
✅ **Supported** — Query `mock_exams` WHERE `user_id` ORDER BY `started_at DESC`.

---

## 7. UI Contract

### Exact Operations UI Will Need

#### Lesson Progress

**SELECT own progress:**
```sql
SELECT 
  lesson_id,
  started_at,
  completed_at,
  last_visited_section_id,
  reading_progress_percent
FROM public.user_lesson_progress
WHERE user_id = auth.uid();
```

**UPSERT lesson progress:**
```sql
INSERT INTO public.user_lesson_progress (
  user_id,
  lesson_id,
  last_visited_section_id,
  reading_progress_percent
)
VALUES ($1, $2, $3, $4)
ON CONFLICT (user_id, lesson_id)
DO UPDATE SET
  last_visited_section_id = EXCLUDED.last_visited_section_id,
  reading_progress_percent = EXCLUDED.reading_progress_percent,
  updated_at = now();
```

**Mark lesson complete:**
```sql
UPDATE public.user_lesson_progress
SET 
  completed_at = now(),
  reading_progress_percent = 100,
  updated_at = now()
WHERE user_id = auth.uid() AND lesson_id = $1;
```

#### Questions (After Questions Exist)

**SELECT practice questions:**
```sql
SELECT 
  id,
  question_type,
  difficulty,
  stem,
  options,
  tags
FROM public.questions
WHERE is_active = true
  AND status IN ('SOURCE_VALIDATED', 'VERIFIED')
ORDER BY random()
LIMIT 20;
```

**Note:** DO NOT send `correct_answer` to client before submission.

**Submit answer:**
```sql
-- Server-side RPC
CREATE FUNCTION public.submit_question_answer(
  p_question_id uuid,
  p_user_answer text
) RETURNS jsonb
LANGUAGE plpgsql SECURITY DEFINER
AS $$
DECLARE
  v_is_correct boolean;
  v_explanation text;
BEGIN
  -- Verify question + get correct answer
  SELECT 
    user_answer = correct_answer,
    explanation
  INTO v_is_correct, v_explanation
  FROM public.questions
  WHERE id = p_question_id;
  
  -- Store attempt
  INSERT INTO public.question_attempts (
    user_id,
    question_id,
    user_answer,
    is_correct
  ) VALUES (
    auth.uid(),
    p_question_id,
    p_user_answer,
    v_is_correct
  );
  
  -- Return result
  RETURN jsonb_build_object(
    'is_correct', v_is_correct,
    'explanation', v_explanation
  );
END;
$$;
```

**AUTH BEHAVIOR:**
- All RLS policies enforce `auth.uid() = user_id`
- NO service_role from frontend
- Admins: read-only analytics

---

## 8. Dashboard

### Can Derive Metrics Without Migration C
✅ **YES** — Direct queries sufficient for MVP.

**Lessons completed:**
```sql
SELECT count(*)
FROM public.user_lesson_progress
WHERE user_id = auth.uid()
  AND completed_at IS NOT NULL;
```

**Questions attempted (after questions exist):**
```sql
SELECT 
  count(*) as total,
  count(*) FILTER (WHERE is_correct) as correct
FROM public.question_attempts
WHERE user_id = auth.uid();
```

**Mock exams completed (after mock exists):**
```sql
SELECT 
  count(*) as total,
  max(score_percent) as best_score
FROM public.mock_exams
WHERE user_id = auth.uid()
  AND status = 'COMPLETED';
```

### Recommendation
❌ **DO NOT** create dashboard views/RPCs prematurely.

✅ **WAIT** until Migration A + B are applied and UI needs optimization.

---

## 9. Proposed Migration A — Progress

### Specification

**File:** `supabase/migrations/YYYYMMDDHHMMSS_add_lesson_progress.sql`

```sql
-- CICDE Enfermería 2026
-- Add lesson progress tracking

create table public.user_lesson_progress (
  id uuid primary key default gen_random_uuid(),
  user_id uuid not null references auth.users(id) on delete cascade,
  lesson_id uuid not null references public.lessons(id) on delete cascade,
  started_at timestamptz not null default now(),
  completed_at timestamptz,
  last_visited_section_id uuid references public.lesson_sections(id) on delete set null,
  reading_progress_percent integer not null default 0,
  updated_at timestamptz not null default now(),
  
  constraint uq_user_lesson unique (user_id, lesson_id),
  constraint chk_progress_percent check (reading_progress_percent >= 0 and reading_progress_percent <= 100)
);

create index user_lesson_progress_user_id_idx on public.user_lesson_progress(user_id);
create index user_lesson_progress_lesson_id_idx on public.user_lesson_progress(lesson_id);
create index user_lesson_progress_completed_at_idx on public.user_lesson_progress(completed_at) where completed_at is not null;

-- RLS
alter table public.user_lesson_progress enable row level security;

create policy "Students read own progress"
  on public.user_lesson_progress for select
  using (auth.uid() = user_id);

create policy "Students insert own progress"
  on public.user_lesson_progress for insert
  with check (auth.uid() = user_id);

create policy "Students update own progress"
  on public.user_lesson_progress for update
  using (auth.uid() = user_id);

create policy "Admins read all progress"
  on public.user_lesson_progress for select
  using (
    exists (
      select 1 from public.profiles
      where id = auth.uid() and role = 'ADMIN' and is_active = true
    )
  );

-- Grants
grant select, insert, update on table public.user_lesson_progress to authenticated;
```

### Dependencies
- `auth.users` (exists)
- `public.lessons` (exists)
- `public.lesson_sections` (exists)
- `public.profiles` (exists)

### Rollback
```sql
drop table if exists public.user_lesson_progress cascade;
```

### **DO NOT CREATE** — This is specification only.

---

## 10. Proposed Migration B — Questions/Practice/Mock

### ⚠️ BLOCKED

Cannot specify Migration B without:
1. Real question data format
2. Academic team authoring 200+ questions
3. Finalized options structure (JSON vs child table)

### Placeholder Structure

**Tables needed (after question format decided):**
- `public.questions` (structure TBD)
- `public.question_attempts`
- `public.mock_exams`

**RLS:** Students own attempts/exams only.

**Estimated DDL size:** ~150 lines

### **DO NOT CREATE** — Waiting on academic content.

---

## 11. Release Scope

### RELEASE CORE (Must-Have This Week)

**1. Lesson Progress Persistence (P0)**
- ✅ **READY TO IMPLEMENT**
- Migration A: `user_lesson_progress` table
- Backend effort: 1 migration (~30 lines DDL)
- UI effort: 2-4 hours (persistence hooks in LessonStudyShell)
- Test: Student marks lesson complete → exits → returns → sees progress

**Verdict:** ✅ **CAN RELEASE** — No blockers.

### POST-RELEASE (Cannot Release Without Questions)

**2. Practice/Questions (P0)**
- ❌ **BLOCKED BY ACADEMIC CONTENT**
- Blocker: Zero structured questions exist
- Academic effort: 4-6 weeks (author 200+ questions)
- Backend effort: 1 migration after questions ready (~100 lines DDL)
- UI effort: 8-12 hours (practice routes, question components)

**3. Mock Exam (P0)**
- ❌ **BLOCKED BY QUESTION BANK**
- Blocker: Need 250-300 questions for variety
- Backend effort: Included in Migration B
- UI effort: 12-16 hours (mock exam flow, timer, scoring)

**4. Dashboard Metrics (P1)**
- ⚠️ **DEPENDS ON A + B**
- Can release with placeholder after A is deployed
- Can add real metrics after B is deployed

**5. Weak Areas / Review (P1)**
- ❌ **BLOCKED BY QUESTIONS**

**6. Study History (P2)**
- ⚠️ **DEPENDS ON A**
- Can defer to v2

---

## 12. P0 Blockers

### Backend-Side

**1. ❌ NO PROGRESS TABLE**
- **Blocker:** Student progress lost on refresh
- **Status:** Ready to implement (Migration A)
- **Effort:** 2 hours (write migration + test)
- **Can release:** ✅ YES

### Academic-Side

**2. 🚨 NO QUESTION BANK**
- **Blocker:** Cannot build practice or mock exam
- **Status:** Zero questions exist
- **Effort:** 4-6 weeks academic content creation
- **Can release:** ❌ NO

---

## 13. Recommended Implementation Order

### Immediate (This Week)

**1. Migration A — Lesson Progress**
- Write migration: 1 hour
- Test locally: 30 minutes
- Apply to Supabase remote: 15 minutes
- Document contract for UI: 30 minutes
- **Total:** ~2.5 hours
- **Unblocks:** UI lesson progress persistence

### After Migration A Deployed

**2. UI Integration — Lesson Progress**
- Add persistence hooks to LessonStudyShell
- Load progress on mount
- Save on chapter navigation, section expand, exit
- Add "Continue where you left off" to dashboard
- **Total:** 3-4 hours UI work

### Parallel (Academic Team)

**3. Question Authoring**
- Design question format
- Author 250-300 structured questions
- Map to areas/topics
- Write explanations
- Source/verify
- **Total:** 4-6 weeks

### After Question Bank Ready

**4. Migration B — Questions/Practice/Mock**
- Finalize schema based on real question data
- Write migration
- Test
- Apply
- **Total:** 4-6 hours backend

**5. UI Implementation — Questions/Mock**
- Practice routes
- Question components
- Mock exam flow (200q, 240min timer)
- Scoring/results
- **Total:** 20-28 hours UI work

---

## 14. Verdict

### READY TO IMPLEMENT (Migration A Only)

✅ **Lesson Progress Persistence**
- Schema finalized
- No dependencies
- No blockers
- Ready to write migration

### BLOCKED BY QUESTION CONTENT (Migration B)

🚨 **Questions/Practice/Mock Exam**
- **Cannot proceed** without academic question bank
- **Zero questions** currently exist
- **4-6 weeks** academic content creation required
- Backend/UI work **cannot start** until questions ready

### Phased Release Strategy

**Phase 1 (This Week):**
- Deploy Migration A
- UI integrates lesson progress
- Students can: browse content + track progress + see completion
- Platform status: **Content browser with progress tracking**

**Phase 2 (After Questions Ready):**
- Deploy Migration B
- UI builds practice/mock flows
- Students can: practice questions + take mock exams
- Platform status: **Full exam preparation tool**

### NO WRITES (Per User Request)

Migration specifications provided but **NOT CREATED**.  
Waiting for PRINCIPAL agent to coordinate deployment.

---

**Report Complete** — Ready for coordination with PRINCIPAL and academic team.
