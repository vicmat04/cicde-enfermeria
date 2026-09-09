-- CICDE Enfermeria 2026
-- Initial RLS policies for authenticated students

create policy "profiles_select_own"
on public.profiles
for select
to authenticated
using (auth.uid() = id);

create policy "areas_select_active"
on public.areas
for select
to authenticated
using (is_active = true);

create policy "topics_select_active"
on public.topics
for select
to authenticated
using (is_active = true);