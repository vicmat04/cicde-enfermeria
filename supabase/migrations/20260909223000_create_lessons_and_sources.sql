-- CICDE Enfermeria 2026
-- Create lessons and sources tables

create table public.sources (
  id uuid primary key default gen_random_uuid(),
  source_type public.source_type not null,
  title text not null,
  authors text,
  organization text,
  publisher text,
  publication_year integer,
  edition text,
  url text,
  isbn text,
  citation_text text not null,
  notes text,
  verified boolean not null default false,
  verified_at timestamptz,
  verified_by uuid references public.profiles (id) on delete restrict,
  created_at timestamptz not null default now(),
  updated_at timestamptz not null default now(),
  constraint chk_source_verified check (
    (verified = true and verified_at is not null and verified_by is not null) or
    (verified = false)
  )
);

create table public.lessons (
  id uuid primary key default gen_random_uuid(),
  topic_id uuid not null references public.topics (id) on delete restrict,
  title text not null,
  summary text,
  status public.content_status not null default 'DRAFT',
  version integer not null default 1,
  is_current boolean not null default true,
  reviewed_at timestamptz,
  reviewed_by uuid references public.profiles (id) on delete restrict,
  created_at timestamptz not null default now(),
  updated_at timestamptz not null default now(),
  constraint chk_lesson_version check (version > 0),
  constraint uq_lesson_topic_version unique (topic_id, version),
  constraint chk_lesson_verified check (
    status != 'VERIFIED' or
    (status = 'VERIFIED' and reviewed_at is not null and reviewed_by is not null)
  )
);

create index lessons_topic_id_idx on public.lessons (topic_id);
create index lessons_status_idx on public.lessons (status);
create unique index uq_lessons_topic_current on public.lessons (topic_id) where is_current = true;

create table public.lesson_sections (
  id uuid primary key default gen_random_uuid(),
  lesson_id uuid not null references public.lessons (id) on delete cascade,
  section_key text not null,
  title text not null,
  body text not null,
  sort_order integer not null,
  created_at timestamptz not null default now(),
  updated_at timestamptz not null default now(),
  constraint chk_lesson_sections_sort_order check (sort_order > 0),
  constraint uq_lesson_section_key unique (lesson_id, section_key),
  constraint uq_lesson_section_sort unique (lesson_id, sort_order)
);

create index lesson_sections_lesson_id_idx on public.lesson_sections (lesson_id);
create index lesson_sections_sort_order_idx on public.lesson_sections (sort_order);

create table public.lesson_sources (
  lesson_id uuid not null references public.lessons (id) on delete cascade,
  source_id uuid not null references public.sources (id) on delete restrict,
  reference_detail text,
  usage_note text,
  is_primary boolean not null default false,
  primary key (lesson_id, source_id)
);

create index lesson_sources_source_id_idx on public.lesson_sources (source_id);

-- Enforce explicit GRANTS
-- Revoke all permissions from anon role globally for these tables.
revoke all privileges on table public.sources from anon;
revoke all privileges on table public.lessons from anon;
revoke all privileges on table public.lesson_sections from anon;
revoke all privileges on table public.lesson_sources from anon;

-- Grant RLS-gated access to authenticated role.
grant select, insert, update, delete on table public.sources to authenticated;
grant select, insert, update, delete on table public.lessons to authenticated;
grant select, insert, update, delete on table public.lesson_sections to authenticated;
grant select, insert, update, delete on table public.lesson_sources to authenticated;
