-- ================================================================
-- Corrective Migration: Deduplicate OBGYN Source
-- 
-- Issue: Migration 20260910175000 inserted duplicate source:
--   - "Enfermería en Gineco obstetricia" (canonical)
--   - "Enfermería en Gineco-obstetricia" (duplicate, hyphen variant)
--
-- Same bibliographic identity (Espinoza et al., 2022)
-- 
-- This migration:
-- 1. Reassigns lesson_sources from duplicate to canonical
-- 2. Deletes the duplicate source
-- 3. Verifies exactly 29 distinct OBGYN sources remain
-- ================================================================

BEGIN;

-- ================================================================
-- PRECONDITIONS
-- ================================================================

DO $$
DECLARE
  migration_applied BOOLEAN;
  corrective_applied BOOLEAN;
  obgyn_topics_count INT;
  obgyn_lessons_count INT;
  obgyn_review_count INT;
  obgyn_sections_count INT;
  obgyn_lesson_sources_count INT;
  source_validated_count INT;
  verified_count INT;
  canonical_source_count INT;
  duplicate_source_count INT;
  canonical_source_id UUID;
  duplicate_source_id UUID;
BEGIN
  -- Check migration 20260910175000 is applied
  SELECT EXISTS (
    SELECT 1 FROM supabase_migrations.schema_migrations 
    WHERE version = '20260910175000'
  ) INTO migration_applied;
  
  IF NOT migration_applied THEN
    RAISE EXCEPTION 'Migration 20260910175000 not applied';
  END IF;
  
  -- Check this corrective migration not already applied
  SELECT EXISTS (
    SELECT 1 FROM supabase_migrations.schema_migrations 
    WHERE version = '20260910180000'
  ) INTO corrective_applied;
  
  IF corrective_applied THEN
    RAISE EXCEPTION 'Corrective migration 20260910180000 already applied';
  END IF;
  
  -- Verify OBGYN baseline
  SELECT COUNT(*) INTO obgyn_topics_count FROM topics WHERE code LIKE 'OBGYN%';
  IF obgyn_topics_count != 3 THEN
    RAISE EXCEPTION 'Expected 3 OBGYN topics, found %', obgyn_topics_count;
  END IF;
  
  SELECT COUNT(*) INTO obgyn_lessons_count
  FROM lessons l JOIN topics t ON t.id = l.topic_id WHERE t.code LIKE 'OBGYN%';
  IF obgyn_lessons_count != 3 THEN
    RAISE EXCEPTION 'Expected 3 OBGYN lessons, found %', obgyn_lessons_count;
  END IF;
  
  SELECT COUNT(*) INTO obgyn_review_count
  FROM lessons l JOIN topics t ON t.id = l.topic_id
  WHERE t.code LIKE 'OBGYN%' AND l.status = 'REVIEW';
  IF obgyn_review_count != 3 THEN
    RAISE EXCEPTION 'Expected 3 OBGYN REVIEW lessons, found %', obgyn_review_count;
  END IF;
  
  SELECT COUNT(*) INTO obgyn_sections_count
  FROM lesson_sections ls JOIN lessons l ON l.id = ls.lesson_id
  JOIN topics t ON t.id = l.topic_id WHERE t.code LIKE 'OBGYN%';
  IF obgyn_sections_count != 143 THEN
    RAISE EXCEPTION 'Expected 143 OBGYN sections, found %', obgyn_sections_count;
  END IF;
  
  SELECT COUNT(*) INTO obgyn_lesson_sources_count
  FROM lesson_sources lsrc JOIN lessons l ON l.id = lsrc.lesson_id
  JOIN topics t ON t.id = l.topic_id WHERE t.code LIKE 'OBGYN%';
  IF obgyn_lesson_sources_count != 39 THEN
    RAISE EXCEPTION 'Expected 39 OBGYN lesson_sources, found %', obgyn_lesson_sources_count;
  END IF;
  
  SELECT COUNT(*) INTO source_validated_count FROM lessons WHERE status = 'SOURCE_VALIDATED';
  IF source_validated_count != 52 THEN
    RAISE EXCEPTION 'Expected 52 SOURCE_VALIDATED, found %', source_validated_count;
  END IF;
  
  SELECT COUNT(*) INTO verified_count FROM lessons WHERE status = 'VERIFIED';
  IF verified_count != 0 THEN
    RAISE EXCEPTION 'Expected 0 VERIFIED, found %', verified_count;
  END IF;
  
  -- Verify canonical source exists exactly once
  SELECT COUNT(*) INTO canonical_source_count
  FROM sources
  WHERE title = 'Enfermería en Gineco obstetricia'
    AND authors = 'P. Espinoza; A. Guaraca; P. Calderón; A. Guapacasa'
    AND publication_year = 2022;
  
  IF canonical_source_count != 1 THEN
    RAISE EXCEPTION 'Expected exactly 1 canonical source (Gineco obstetricia), found %', canonical_source_count;
  END IF;
  
  SELECT id INTO canonical_source_id FROM sources
  WHERE title = 'Enfermería en Gineco obstetricia'
    AND authors = 'P. Espinoza; A. Guaraca; P. Calderón; A. Guapacasa'
    AND publication_year = 2022;
  
  -- Verify duplicate source exists exactly once
  SELECT COUNT(*) INTO duplicate_source_count
  FROM sources
  WHERE title = 'Enfermería en Gineco-obstetricia'
    AND authors = 'P. Espinoza; A. Guaraca; P. Calderón; A. Guapacasa'
    AND publication_year = 2022;
  
  IF duplicate_source_count != 1 THEN
    RAISE EXCEPTION 'Expected exactly 1 duplicate source (Gineco-obstetricia), found %', duplicate_source_count;
  END IF;
  
  SELECT id INTO duplicate_source_id FROM sources
  WHERE title = 'Enfermería en Gineco-obstetricia'
    AND authors = 'P. Espinoza; A. Guaraca; P. Calderón; A. Guapacasa'
    AND publication_year = 2022;
  
  -- Verify duplicate has no non-OBGYN references
  DECLARE
    non_obgyn_refs INT;
  BEGIN
    SELECT COUNT(*) INTO non_obgyn_refs
    FROM lesson_sources lsrc
    JOIN lessons l ON l.id = lsrc.lesson_id
    JOIN topics t ON t.id = l.topic_id
    WHERE lsrc.source_id = duplicate_source_id
      AND t.code NOT LIKE 'OBGYN%';
    
    IF non_obgyn_refs > 0 THEN
      RAISE EXCEPTION 'Duplicate source has % non-OBGYN references, cannot safely delete', non_obgyn_refs;
    END IF;
  END;
  
  RAISE NOTICE 'Preconditions PASS';
  RAISE NOTICE 'Canonical source ID: %', canonical_source_id;
  RAISE NOTICE 'Duplicate source ID: %', duplicate_source_id;
END $$;

-- ================================================================
-- REASSIGN LESSON_SOURCES
-- ================================================================

-- Reassign lesson_sources from duplicate to canonical
-- (lesson_sources has ON CONFLICT DO NOTHING on PK, so this is safe)
DO $$
DECLARE
  canonical_source_id UUID;
  duplicate_source_id UUID;
  reassigned_count INT := 0;
BEGIN
  -- Get source IDs
  SELECT id INTO canonical_source_id FROM sources
  WHERE title = 'Enfermería en Gineco obstetricia'
    AND authors = 'P. Espinoza; A. Guaraca; P. Calderón; A. Guapacasa'
    AND publication_year = 2022;
  
  SELECT id INTO duplicate_source_id FROM sources
  WHERE title = 'Enfermería en Gineco-obstetricia'
    AND authors = 'P. Espinoza; A. Guaraca; P. Calderón; A. Guapacasa'
    AND publication_year = 2022;
  
  -- Update lesson_sources to point to canonical
  UPDATE lesson_sources
  SET source_id = canonical_source_id
  WHERE source_id = duplicate_source_id;
  
  GET DIAGNOSTICS reassigned_count = ROW_COUNT;
  
  RAISE NOTICE 'Reassigned % lesson_sources from duplicate to canonical', reassigned_count;
END $$;

-- ================================================================
-- DELETE DUPLICATE SOURCE
-- ================================================================

DO $$
DECLARE
  duplicate_source_id UUID;
  remaining_refs INT;
BEGIN
  -- Get duplicate source ID
  SELECT id INTO duplicate_source_id FROM sources
  WHERE title = 'Enfermería en Gineco-obstetricia'
    AND authors = 'P. Espinoza; A. Guaraca; P. Calderón; A. Guapacasa'
    AND publication_year = 2022;
  
  -- Verify no remaining references
  SELECT COUNT(*) INTO remaining_refs
  FROM lesson_sources
  WHERE source_id = duplicate_source_id;
  
  IF remaining_refs > 0 THEN
    RAISE EXCEPTION 'Duplicate source still has % lesson_sources references', remaining_refs;
  END IF;
  
  -- Delete duplicate source
  DELETE FROM sources WHERE id = duplicate_source_id;
  
  RAISE NOTICE 'Deleted duplicate source: %', duplicate_source_id;
END $$;

-- ================================================================
-- POSTCONDITIONS
-- ================================================================

DO $$
DECLARE
  obgyn_distinct_sources_count INT;
  obgyn_lesson_sources_count INT;
  obgyn_empty_citation_count INT;
  obgyn_sections_count INT;
  obgyn_empty_body_count INT;
  duplicate_remaining INT;
  source_validated_count INT;
  verified_count INT;
BEGIN
  -- Count distinct OBGYN sources
  SELECT COUNT(DISTINCT s.id) INTO obgyn_distinct_sources_count
  FROM sources s
  JOIN lesson_sources lsrc ON lsrc.source_id = s.id
  JOIN lessons l ON l.id = lsrc.lesson_id
  JOIN topics t ON t.id = l.topic_id
  WHERE t.code LIKE 'OBGYN%';
  
  IF obgyn_distinct_sources_count != 29 THEN
    RAISE EXCEPTION 'Expected 29 distinct OBGYN sources, found %', obgyn_distinct_sources_count;
  END IF;
  
  -- Verify lesson_sources still 39
  SELECT COUNT(*) INTO obgyn_lesson_sources_count
  FROM lesson_sources lsrc
  JOIN lessons l ON l.id = lsrc.lesson_id
  JOIN topics t ON t.id = l.topic_id
  WHERE t.code LIKE 'OBGYN%';
  
  IF obgyn_lesson_sources_count != 39 THEN
    RAISE EXCEPTION 'Expected 39 OBGYN lesson_sources, found %', obgyn_lesson_sources_count;
  END IF;
  
  -- Verify all OBGYN sources have citation_text
  SELECT COUNT(*) INTO obgyn_empty_citation_count
  FROM sources s
  JOIN lesson_sources lsrc ON lsrc.source_id = s.id
  JOIN lessons l ON l.id = lsrc.lesson_id
  JOIN topics t ON t.id = l.topic_id
  WHERE t.code LIKE 'OBGYN%'
    AND (s.citation_text IS NULL OR btrim(s.citation_text) = '');
  
  IF obgyn_empty_citation_count != 0 THEN
    RAISE EXCEPTION 'Expected 0 OBGYN sources with empty citation_text, found %', obgyn_empty_citation_count;
  END IF;
  
  -- Verify sections still 143
  SELECT COUNT(*) INTO obgyn_sections_count
  FROM lesson_sections ls
  JOIN lessons l ON l.id = ls.lesson_id
  JOIN topics t ON t.id = l.topic_id
  WHERE t.code LIKE 'OBGYN%';
  
  IF obgyn_sections_count != 143 THEN
    RAISE EXCEPTION 'Expected 143 OBGYN sections, found %', obgyn_sections_count;
  END IF;
  
  -- Verify all section bodies non-empty
  SELECT COUNT(*) INTO obgyn_empty_body_count
  FROM lesson_sections ls
  JOIN lessons l ON l.id = ls.lesson_id
  JOIN topics t ON t.id = l.topic_id
  WHERE t.code LIKE 'OBGYN%'
    AND (ls.body IS NULL OR btrim(ls.body) = '');
  
  IF obgyn_empty_body_count != 0 THEN
    RAISE EXCEPTION 'Expected 0 OBGYN sections with empty body, found %', obgyn_empty_body_count;
  END IF;
  
  -- Verify duplicate no longer exists
  SELECT COUNT(*) INTO duplicate_remaining
  FROM sources
  WHERE title = 'Enfermería en Gineco-obstetricia'
    AND authors = 'P. Espinoza; A. Guaraca; P. Calderón; A. Guapacasa'
    AND publication_year = 2022;
  
  IF duplicate_remaining != 0 THEN
    RAISE EXCEPTION 'Expected 0 duplicate sources remaining, found %', duplicate_remaining;
  END IF;
  
  -- Verify baseline preserved
  SELECT COUNT(*) INTO source_validated_count FROM lessons WHERE status = 'SOURCE_VALIDATED';
  IF source_validated_count != 52 THEN
    RAISE EXCEPTION 'Expected 52 SOURCE_VALIDATED lessons, found %', source_validated_count;
  END IF;
  
  SELECT COUNT(*) INTO verified_count FROM lessons WHERE status = 'VERIFIED';
  IF verified_count != 0 THEN
    RAISE EXCEPTION 'Expected 0 VERIFIED lessons, found %', verified_count;
  END IF;
  
  RAISE NOTICE 'Postconditions PASS';
  RAISE NOTICE 'OBGYN deduplication complete: 29 distinct sources, 39 lesson_sources preserved';
END $$;

COMMIT;

-- ================================================================
-- IMPORTANT: This corrective migration is ready for review
-- DO NOT EXECUTE without explicit authorization
-- ================================================================
