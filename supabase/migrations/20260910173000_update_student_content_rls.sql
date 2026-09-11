BEGIN;

DROP POLICY IF EXISTS "lessons_select_student" ON public.lessons;
DROP POLICY IF EXISTS "lesson_sections_select_student" ON public.lesson_sections;
DROP POLICY IF EXISTS "lesson_sources_select_student" ON public.lesson_sources;
DROP POLICY IF EXISTS "sources_select_student" ON public.sources;

CREATE POLICY "lessons_select_student"
ON public.lessons
FOR SELECT
TO authenticated
USING (
  (
    status IN ('SOURCE_VALIDATED', 'VERIFIED') AND is_current = true
    AND EXISTS (
      SELECT 1 FROM public.profiles
      WHERE id = (SELECT auth.uid()) AND role = 'STUDENT' AND is_active = true
    )
  )
  OR
  EXISTS (
    SELECT 1 FROM public.profiles
    WHERE id = (SELECT auth.uid()) AND role = 'ADMIN' AND is_active = true
  )
);

CREATE POLICY "lesson_sections_select_student"
ON public.lesson_sections
FOR SELECT
TO authenticated
USING (
  (
    EXISTS (
      SELECT 1 FROM public.lessons
      WHERE id = lesson_sections.lesson_id
      AND status IN ('SOURCE_VALIDATED', 'VERIFIED') AND is_current = true
    )
    AND EXISTS (
      SELECT 1 FROM public.profiles
      WHERE id = (SELECT auth.uid()) AND role = 'STUDENT' AND is_active = true
    )
  )
  OR
  EXISTS (
    SELECT 1 FROM public.profiles
    WHERE id = (SELECT auth.uid()) AND role = 'ADMIN' AND is_active = true
  )
);

CREATE POLICY "lesson_sources_select_student"
ON public.lesson_sources
FOR SELECT
TO authenticated
USING (
  (
    EXISTS (
      SELECT 1 FROM public.lessons
      WHERE id = lesson_sources.lesson_id
      AND status IN ('SOURCE_VALIDATED', 'VERIFIED') AND is_current = true
    )
    AND EXISTS (
      SELECT 1 FROM public.profiles
      WHERE id = (SELECT auth.uid()) AND role = 'STUDENT' AND is_active = true
    )
  )
  OR
  EXISTS (
    SELECT 1 FROM public.profiles
    WHERE id = (SELECT auth.uid()) AND role = 'ADMIN' AND is_active = true
  )
);

CREATE POLICY "sources_select_student"
ON public.sources
FOR SELECT
TO authenticated
USING (
  (
    EXISTS (
      SELECT 1 FROM public.lesson_sources ls
      JOIN public.lessons l ON l.id = ls.lesson_id
      WHERE ls.source_id = sources.id
      AND l.status IN ('SOURCE_VALIDATED', 'VERIFIED') AND l.is_current = true
    )
    AND EXISTS (
      SELECT 1 FROM public.profiles
      WHERE id = (SELECT auth.uid()) AND role = 'STUDENT' AND is_active = true
    )
  )
  OR
  EXISTS (
    SELECT 1 FROM public.profiles
    WHERE id = (SELECT auth.uid()) AND role = 'ADMIN' AND is_active = true
  )
);

COMMIT;