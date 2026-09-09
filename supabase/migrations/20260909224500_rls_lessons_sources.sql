-- CICDE Enfermeria 2026
-- RLS policies for lessons and sources

alter table public.sources enable row level security;
alter table public.lessons enable row level security;
alter table public.lesson_sections enable row level security;
alter table public.lesson_sources enable row level security;

-- STUDENT policies (Read only VERIFIED / active content)
-- For sources, students can read them if they are verified.
create policy "sources_select_student"
on public.sources
for select
to authenticated
using (
  verified = true
  or
  exists (
    select 1 from public.profiles
    where id = auth.uid() and role = 'ADMIN'
  )
);

-- For lessons, students can only read VERIFIED and current.
create policy "lessons_select_student"
on public.lessons
for select
to authenticated
using (
  (status = 'VERIFIED' and is_current = true)
  or
  exists (
    select 1 from public.profiles
    where id = auth.uid() and role = 'ADMIN'
  )
);

-- For lesson_sections, they can read if the parent lesson is readable by them.
create policy "lesson_sections_select_student"
on public.lesson_sections
for select
to authenticated
using (
  exists (
    select 1 from public.lessons
    where id = lesson_sections.lesson_id
    and (
      (status = 'VERIFIED' and is_current = true)
      or
      exists (
        select 1 from public.profiles
        where id = auth.uid() and role = 'ADMIN'
      )
    )
  )
);

-- For lesson_sources, they can read if the parent lesson is readable.
create policy "lesson_sources_select_student"
on public.lesson_sources
for select
to authenticated
using (
  exists (
    select 1 from public.lessons
    where id = lesson_sources.lesson_id
    and (
      (status = 'VERIFIED' and is_current = true)
      or
      exists (
        select 1 from public.profiles
        where id = auth.uid() and role = 'ADMIN'
      )
    )
  )
);

-- ADMIN policies (Full access)
create policy "sources_all_admin"
on public.sources
for all
to authenticated
using (
  exists (
    select 1 from public.profiles
    where id = auth.uid() and role = 'ADMIN'
  )
);

create policy "lessons_all_admin"
on public.lessons
for all
to authenticated
using (
  exists (
    select 1 from public.profiles
    where id = auth.uid() and role = 'ADMIN'
  )
);

create policy "lesson_sections_all_admin"
on public.lesson_sections
for all
to authenticated
using (
  exists (
    select 1 from public.profiles
    where id = auth.uid() and role = 'ADMIN'
  )
);

create policy "lesson_sources_all_admin"
on public.lesson_sources
for all
to authenticated
using (
  exists (
    select 1 from public.profiles
    where id = auth.uid() and role = 'ADMIN'
  )
);
