# Backend Requirements for PRINCIPAL (ui-premium → master)

**Generated:** 2025-01-24  
**Source:** UI Production Readiness Audit  
**Branch:** ui-premium requests these for production deployment

## CRITICAL (P0) — Blocks Production

### 1. Lesson Progress Persistence

**Feature:** Student lesson completion tracking

**Existing Evidence:**
- UI has visual ReadingProgress component (LessonStudyShell.tsx)
- Uses React state (setVisited, setVisitedUnits) - NOT persistent
- Student can navigate chapters, expand sections
- NO backend table exists

**Required Backend:**

```sql
create table public.user_lesson_progress (
  id uuid primary key default gen_random_uuid(),
  user_id uuid not null references auth.users(id) on delete cascade,
  lesson_id uuid not null references public.lessons(id) on delete cascade,
  started_at timestamptz not null default now(),
  completed_at timestamptz,
  last_visited_chapter_id uuid,
  last_visited_section_id uuid,
  visited_chapters jsonb default '[]'::jsonb,
  visited_sections jsonb default '[]'::jsonb,
  reading_progress_percent integer default 0,
  updated_at timestamptz not null default now(),
  constraint uq_user_lesson unique (user_id, lesson_id),
  constraint chk_progress_percent check (reading_progress_percent >= 0 and reading_progress_percent <= 100)
);

create index user_lesson_progress_user_id_idx on public.user_lesson_progress(user_id);
create index user_lesson_progress_lesson_id_idx on public.user_lesson_progress(lesson_id);

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
      where id = auth.uid() and role = 'ADMIN'
    )
  );
```

**UI Impact:**
- LessonStudyShell needs client-side persistence hooks
- Save progress on chapter navigation, section expand, mode switch
- Load progress on mount
- Show "Continue where you left off" on dashboard

**Priority:** P0 — Student cannot use platform for real studying without this

---

### 2. Questions Bank & Attempts

**Feature:** Question practice, attempts tracking, scoring, explanations

**Existing Evidence:**
- NO implementation in UI
- NO backend tables
- `attempt_status` enum exists but unused
- Mock exam requirement: 200 questions, 240 minutes, 61% threshold, >=80% target

**Required Backend:**

```sql
-- Questions
create table public.questions (
  id uuid primary key default gen_random_uuid(),
  area_id uuid references public.areas(id) on delete restrict,
  topic_id uuid references public.topics(id) on delete restrict,
  question_type text not null default 'MULTIPLE_CHOICE',
  stem text not null,
  options jsonb not null,
  correct_answer text not null,
  explanation text not null,
  difficulty text default 'MEDIUM',
  tags text[] default array[]::text[],
  status public.content_status not null default 'DRAFT',
  is_active boolean not null default true,
  created_at timestamptz not null default now(),
  updated_at timestamptz not null default now(),
  constraint chk_question_type check (question_type in ('MULTIPLE_CHOICE', 'TRUE_FALSE', 'CASE_BASED'))
);

create index questions_area_id_idx on public.questions(area_id);
create index questions_topic_id_idx on public.questions(topic_id);
create index questions_status_idx on public.questions(status);

-- Question Attempts (Individual practice)
create table public.question_attempts (
  id uuid primary key default gen_random_uuid(),
  user_id uuid not null references auth.users(id) on delete cascade,
  question_id uuid not null references public.questions(id) on delete cascade,
  user_answer text not null,
  is_correct boolean not null,
  time_spent_seconds integer,
  attempted_at timestamptz not null default now(),
  constraint chk_time_spent check (time_spent_seconds is null or time_spent_seconds >= 0)
);

create index question_attempts_user_id_idx on public.question_attempts(user_id);
create index question_attempts_question_id_idx on public.question_attempts(question_id);
create index question_attempts_attempted_at_idx on public.question_attempts(attempted_at);

-- Mock Exams
create table public.mock_exams (
  id uuid primary key default gen_random_uuid(),
  user_id uuid not null references auth.users(id) on delete cascade,
  status text not null default 'IN_PROGRESS',
  started_at timestamptz not null default now(),
  submitted_at timestamptz,
  time_limit_minutes integer not null default 240,
  elapsed_time_seconds integer default 0,
  question_ids uuid[] not null,
  answers jsonb default '{}'::jsonb,
  score_percent numeric(5,2),
  pass_threshold_percent integer not null default 61,
  area_scores jsonb,
  created_at timestamptz not null default now(),
  updated_at timestamptz not null default now(),
  constraint chk_mock_status check (status in ('IN_PROGRESS', 'SUBMITTED', 'ABANDONED')),
  constraint chk_elapsed_time check (elapsed_time_seconds >= 0),
  constraint chk_score_percent check (score_percent is null or (score_percent >= 0 and score_percent <= 100)),
  constraint chk_questions_count check (array_length(question_ids, 1) = 200)
);

create index mock_exams_user_id_idx on public.mock_exams(user_id);
create index mock_exams_status_idx on public.mock_exams(status);
create index mock_exams_started_at_idx on public.mock_exams(started_at);

-- RLS for questions (students see only active)
alter table public.questions enable row level security;

create policy "Students read active questions"
  on public.questions for select
  using (is_active = true and status in ('SOURCE_VALIDATED', 'VERIFIED'));

create policy "Admins manage questions"
  on public.questions for all
  using (
    exists (
      select 1 from public.profiles
      where id = auth.uid() and role = 'ADMIN'
    )
  );

-- RLS for attempts (students own only)
alter table public.question_attempts enable row level security;

create policy "Students read own attempts"
  on public.question_attempts for select
  using (auth.uid() = user_id);

create policy "Students insert own attempts"
  on public.question_attempts for insert
  with check (auth.uid() = user_id);

-- RLS for mock exams (students own only)
alter table public.mock_exams enable row level security;

create policy "Students read own mock exams"
  on public.mock_exams for select
  using (auth.uid() = user_id);

create policy "Students manage own mock exams"
  on public.mock_exams for insert, update
  with check (auth.uid() = user_id);

create policy "Admins read all mock exams"
  on public.mock_exams for select
  using (
    exists (
      select 1 from public.profiles
      where id = auth.uid() and role = 'ADMIN'
    )
  );
```

**UI Impact:**
- New routes: `/questions`, `/questions/practice`, `/questions/review`
- New routes: `/mock-exam`, `/mock-exam/[id]`, `/mock-exam/[id]/results`
- Dashboard cards for question stats, mock exam history
- Question components: QuestionCard, QuestionOption, Explanation, Timer
- Mock exam: 200-question assembly, 240-minute timer, autosave, navigation, scoring

**Priority:** P0 — Platform is content-viewer only without question practice and mock exams

---

## HIGH (P1) — Core Functionality

### 3. Dashboard Real Progress Metrics

**Feature:** Real student progress on dashboard instead of placeholder text

**Existing Evidence:**
- Dashboard shows real topic counts
- "Tu preparación" card shows placeholder: "Elige un área para comenzar. El progreso se construye lección a lección."
- NO real metrics: lessons completed, questions attempted, mock exam history

**Required Backend:**
- Depends on #1 (user_lesson_progress)
- Depends on #2 (question_attempts, mock_exams)

**Computed Metrics:**
```sql
-- View: student dashboard metrics
create or replace view public.student_dashboard_metrics as
select
  p.id as user_id,
  p.full_name,
  count(distinct ulp.lesson_id) filter (where ulp.completed_at is not null) as lessons_completed,
  count(distinct qa.question_id) as questions_attempted,
  count(distinct qa.id) filter (where qa.is_correct) as correct_answers,
  count(distinct me.id) filter (where me.status = 'SUBMITTED') as mock_exams_completed,
  max(me.score_percent) as best_mock_score
from public.profiles p
left join public.user_lesson_progress ulp on ulp.user_id = p.id
left join public.question_attempts qa on qa.user_id = p.id
left join public.mock_exams me on me.user_id = p.id
where p.role = 'STUDENT'
group by p.id, p.full_name;

-- RLS
alter view public.student_dashboard_metrics owner to authenticated;

create policy "Students read own metrics"
  on public.student_dashboard_metrics for select
  using (auth.uid() = user_id);
```

**UI Impact:**
- Replace placeholder card with real metrics
- Show: X lessons completed, Y questions practiced, Z correct (W%), last mock score

**Priority:** P1 — Dashboard is misleading with placeholder text

---

### 4. Weak Areas / Review Queue

**Feature:** Identify weak topics based on incorrect answers, surface them for review

**Existing Evidence:**
- NO implementation
- Mentioned in dashboard placeholder structure

**Required Backend:**
```sql
create or replace view public.student_weak_areas as
select
  qa.user_id,
  q.area_id,
  a.name as area_name,
  q.topic_id,
  t.title as topic_title,
  count(*) as attempts,
  count(*) filter (where qa.is_correct) as correct,
  count(*) filter (where not qa.is_correct) as incorrect,
  round(100.0 * count(*) filter (where qa.is_correct) / count(*), 1) as accuracy_percent
from public.question_attempts qa
join public.questions q on q.id = qa.question_id
join public.areas a on a.id = q.area_id
left join public.topics t on t.id = q.topic_id
group by qa.user_id, q.area_id, a.name, q.topic_id, t.title
having count(*) >= 3 and accuracy_percent < 70
order by accuracy_percent asc, attempts desc;
```

**UI Impact:**
- New route: `/review`
- Dashboard card: "Áreas débiles" with top 3 weak topics
- Review page shows incorrect questions for re-attempt

**Priority:** P1 — Core exam prep feature

---

## MEDIUM (P2) — Enhancement

### 5. Study History / Activity Log

**Feature:** Timeline of student activity for motivation and tracking

**Required Backend:**
```sql
-- Optional: explicit activity log, or computed from existing tables
create or replace view public.student_activity_log as
select
  user_id,
  'lesson' as activity_type,
  lesson_id as reference_id,
  started_at as activity_at
from public.user_lesson_progress
union all
select
  user_id,
  'question' as activity_type,
  question_id as reference_id,
  attempted_at as activity_at
from public.question_attempts
union all
select
  user_id,
  'mock_exam' as activity_type,
  id as reference_id,
  started_at as activity_at
from public.mock_exams
order by activity_at desc;
```

**UI Impact:**
- Dashboard: Recent activity section
- History page: Full activity timeline

**Priority:** P2 — Nice to have, not blocking

---

## Summary Table

| Feature | Priority | Backend Required | UI Ready | Blocker? |
|---------|----------|------------------|----------|----------|
| Lesson progress persistence | P0 | ❌ | ⚠️ (UI exists, no backend) | ✅ YES |
| Questions/Quiz system | P0 | ❌ | ❌ | ✅ YES |
| Mock exam (200q, 240min) | P0 | ❌ | ❌ | ✅ YES |
| Dashboard real metrics | P1 | ❌ (depends on P0) | ⚠️ (placeholder) | NO |
| Weak areas / Review | P1 | ❌ | ❌ | NO |
| Study history | P2 | ❌ | ❌ | NO |

## Implementation Order (Recommended for PRINCIPAL)

1. **Migration A:** `user_lesson_progress` table + RLS
2. **Migration B:** Questions + attempts + mock_exams tables + RLS
3. **Migration C:** Dashboard metrics view + weak areas view
4. **Migration D:** Activity log view (optional)

After Migration A → UI can persist lesson progress  
After Migration B → UI can build question practice + mock exam flows  
After Migration C → UI can replace placeholder dashboard metrics
