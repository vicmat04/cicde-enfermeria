-- Migration: Add resume position tracking to user lesson progress
-- Date: 2026-09-24
-- Purpose: Enable students to resume at exact section where they stopped studying
-- 
-- FINAL CORRECTED DESIGN:
-- - Composite FK for section-lesson validation (NO DELETE CASCADE/SET NULL)
-- - Trigger for safe cleanup when section deleted (only nulls last_section_id)
-- - Generated column for legacy ordering fallback
-- - No SECURITY DEFINER functions (RLS handles security)

-- =============================================================================
-- STEP 1: Add supporting UNIQUE constraint to lesson_sections
-- =============================================================================

-- Composite FK requires UNIQUE(id, lesson_id) on referenced table
-- Safe because id is already PK (globally unique)
ALTER TABLE public.lesson_sections
  ADD CONSTRAINT uq_lesson_section_id_lesson UNIQUE (id, lesson_id);

COMMENT ON CONSTRAINT uq_lesson_section_id_lesson ON public.lesson_sections IS
  'Supports composite FK from user_lesson_progress to ensure section belongs to same lesson';

-- =============================================================================
-- STEP 2: Add new columns to user_lesson_progress
-- =============================================================================

ALTER TABLE public.user_lesson_progress
  ADD COLUMN IF NOT EXISTS last_section_id UUID,
  ADD COLUMN IF NOT EXISTS last_visited_at TIMESTAMPTZ;

COMMENT ON COLUMN public.user_lesson_progress.last_section_id IS 
  'Last section visited within this lesson; composite FK ensures it belongs to same lesson_id; NULL for legacy rows or lesson top';

COMMENT ON COLUMN public.user_lesson_progress.last_visited_at IS 
  'Most recent meaningful study interaction; distinct from started_at (first visit) and updated_at (any modification)';

-- =============================================================================
-- STEP 3: Add generated column for legacy ordering fallback
-- =============================================================================

-- Effective last visit = COALESCE(last_visited_at, updated_at)
-- Allows "get last lesson" to work for both new (last_visited_at) and legacy (updated_at) rows
ALTER TABLE public.user_lesson_progress
  ADD COLUMN IF NOT EXISTS effective_last_visit TIMESTAMPTZ 
  GENERATED ALWAYS AS (COALESCE(last_visited_at, updated_at)) STORED;

COMMENT ON COLUMN public.user_lesson_progress.effective_last_visit IS
  'Computed as COALESCE(last_visited_at, updated_at); enables deterministic ordering for both new and legacy rows';

-- =============================================================================
-- STEP 4: Add composite foreign key for section-lesson validation
-- =============================================================================

-- Composite FK guarantees last_section_id belongs to same lesson_id
-- NO DELETE action specified (default NO ACTION) - trigger handles cleanup
ALTER TABLE public.user_lesson_progress
  ADD CONSTRAINT fk_resume_section_belongs_to_lesson
  FOREIGN KEY (last_section_id, lesson_id)
  REFERENCES public.lesson_sections(id, lesson_id);

COMMENT ON CONSTRAINT fk_resume_section_belongs_to_lesson ON public.user_lesson_progress IS
  'Composite FK guarantees last_section_id belongs to same lesson_id; prevents cross-lesson section assignment; cleanup handled by trigger';

-- =============================================================================
-- STEP 5: Add trigger for safe section deletion cleanup
-- =============================================================================

-- When a section is deleted, set last_section_id to NULL (preserving lesson_id and all other fields)
-- This is safer than ON DELETE SET NULL which would null BOTH columns in composite FK
CREATE OR REPLACE FUNCTION public.clear_deleted_section_from_progress()
RETURNS TRIGGER
LANGUAGE plpgsql
AS $$
BEGIN
  -- Set last_section_id to NULL for any progress referencing the deleted section
  -- Preserves lesson_id, started_at, completed, completed_at, and all other fields
  -- Materializes updated_at into last_visited_at for legacy rows to preserve effective_last_visit semantic
  -- (BEFORE UPDATE trigger will change updated_at, but COALESCE captures the old value first)
  UPDATE public.user_lesson_progress
  SET last_section_id = NULL,
      last_visited_at = COALESCE(last_visited_at, updated_at)
  WHERE last_section_id = OLD.id;
  
  RETURN OLD;
END;
$$;

CREATE TRIGGER clear_deleted_section_trigger
  BEFORE DELETE ON public.lesson_sections
  FOR EACH ROW
  EXECUTE FUNCTION public.clear_deleted_section_from_progress();

COMMENT ON FUNCTION public.clear_deleted_section_from_progress IS
  'Safely nulls last_section_id (not lesson_id) when section deleted; preserves progress row and lesson_id';

-- =============================================================================
-- STEP 6: Create indexes for resume position queries
-- =============================================================================

-- Index for "get last lesson" query (orders by effective_last_visit)
CREATE INDEX IF NOT EXISTS idx_user_lesson_progress_effective_last_visit 
  ON public.user_lesson_progress(user_id, effective_last_visit DESC NULLS LAST);

-- Index for section lookups
CREATE INDEX IF NOT EXISTS idx_user_lesson_progress_last_section
  ON public.user_lesson_progress(last_section_id)
  WHERE last_section_id IS NOT NULL;

-- =============================================================================
-- FRONTEND INTEGRATION GUIDE
-- =============================================================================
-- 
-- No SECURITY DEFINER functions. Frontend uses direct RLS-protected queries.
-- 
-- RLS policies already enforce:
-- - Active students can SELECT/INSERT/UPDATE own progress
-- - Inactive students and anon denied
-- - Admin can SELECT all
--
-- =============================================================================
-- 1. UPDATE RESUME POSITION (idempotent UPSERT)
-- =============================================================================
-- 
-- Frontend TypeScript:
-- 
-- const { data, error } = await supabase
--   .from('user_lesson_progress')
--   .upsert({
--     user_id: (await supabase.auth.getUser()).data.user.id,
--     lesson_id: lessonId,
--     last_section_id: sectionId,
--     last_visited_at: new Date().toISOString()
--     // Do NOT include started_at - it has DEFAULT now() for INSERT
--   }, {
--     onConflict: 'user_id,lesson_id'
--   });
--
-- Behavior:
-- - INSERT: started_at set to now() by DEFAULT, other fields as provided
-- - UPDATE: only last_section_id and last_visited_at updated, started_at preserved
-- - Composite FK validates section belongs to lesson (FK violation if cross-lesson)
-- - RLS validates user_id = auth.uid() and active student
--
-- =============================================================================
-- 2. GET LAST LESSON STUDIED
-- =============================================================================
--
-- Frontend TypeScript:
--
-- const { data, error } = await supabase
--   .from('user_lesson_progress')
--   .select(`
--     lesson_id,
--     effective_last_visit,
--     completed,
--     started_at,
--     lessons:lesson_id (id, title, topic_id)
--   `)
--   .order('effective_last_visit', { ascending: false, nullsFirst: false })
--   .limit(1)
--   .single();
--
-- Uses effective_last_visit (generated column) for deterministic ordering:
-- - New rows: orders by last_visited_at
-- - Legacy rows: orders by updated_at (fallback)
--
-- =============================================================================
-- 3. GET LAST SECTION FOR LESSON
-- =============================================================================
--
-- Frontend TypeScript:
--
-- const { data, error } = await supabase
--   .from('user_lesson_progress')
--   .select(`
--     last_section_id,
--     lesson_sections:last_section_id (
--       id,
--       section_key,
--       title,
--       sort_order
--     )
--   `)
--   .eq('lesson_id', lessonId)
--   .single();
--
-- Returns null for lesson_sections if last_section_id is NULL (legacy or lesson top)
--
-- =============================================================================
-- 4. GET RECENT LESSONS
-- =============================================================================
--
-- Frontend TypeScript:
--
-- const { data, error } = await supabase
--   .from('user_lesson_progress')
--   .select(`
--     lesson_id,
--     effective_last_visit,
--     completed,
--     lessons:lesson_id (id, title, topic_id)
--   `)
--   .order('effective_last_visit', { ascending: false, nullsFirst: false })
--   .limit(5);
--
-- =============================================================================
-- VALIDATION GUARANTEES
-- =============================================================================
--
-- 1. Section belongs to lesson (composite FK)
--    - PASS: INSERT (user, lesson_a, section_from_lesson_a)
--    - FAIL: INSERT (user, lesson_a, section_from_lesson_b) -> FK violation
--
-- 2. Section deletion behavior (trigger)
--    - DELETE section -> last_section_id set to NULL
--    - lesson_id PRESERVED (not nulled)
--    - Progress row PRESERVED (not deleted)
--
-- 3. started_at immutability
--    - First INSERT: started_at = now() (DEFAULT)
--    - Subsequent UPDATE: started_at unchanged (not in UPDATE clause)
--
-- 4. Legacy compatibility
--    - Existing rows: last_section_id = NULL, last_visited_at = NULL
--    - effective_last_visit = updated_at (fallback)
--    - Ordering works correctly
--
-- =============================================================================
