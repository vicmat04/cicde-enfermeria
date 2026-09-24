-- ================================================================
-- Promote OBGYN to SOURCE_VALIDATED
-- 
-- After documentary validation, promote 3 OBGYN lessons from REVIEW
-- to SOURCE_VALIDATED. All lessons verified against filesystem:
-- - Titles match local SPEC
-- - Sections match (37, 52, 54 total = 143)
-- - Bodies non-empty
-- - Sources verified (29 distinct, 39 lesson_sources)
-- - Provenance clean (reviewed_at/by NULL)
-- 
-- This does NOT constitute human clinical review.
-- SOURCE_VALIDATED means: content audited documentally.
-- ================================================================

BEGIN;

-- ================================================================
-- PRECONDITIONS
-- ================================================================

DO $$
DECLARE
  obgyn_topics_count INT;
  obgyn_review_count INT;
  obgyn_sv_count INT;
  obgyn_sections_count INT;
  obgyn_empty_bodies INT;
  obgyn_lesson_sources_count INT;
  obgyn_distinct_sources INT;
  baseline_sv INT;
  verified_count INT;
BEGIN
  -- Verify OBGYN baseline
  SELECT COUNT(*) INTO obgyn_topics_count
  FROM topics WHERE code LIKE 'OBGYN%';
  
  IF obgyn_topics_count != 3 THEN
    RAISE EXCEPTION 'Expected 3 OBGYN topics, found %', obgyn_topics_count;
  END IF;
  
  SELECT COUNT(*) INTO obgyn_review_count
  FROM lessons l
  JOIN topics t ON t.id = l.topic_id
  WHERE t.code LIKE 'OBGYN%' AND l.status = 'REVIEW';
  
  IF obgyn_review_count != 3 THEN
    RAISE EXCEPTION 'Expected 3 OBGYN REVIEW lessons, found %', obgyn_review_count;
  END IF;
  
  SELECT COUNT(*) INTO obgyn_sv_count
  FROM lessons l
  JOIN topics t ON t.id = l.topic_id
  WHERE t.code LIKE 'OBGYN%' AND l.status = 'SOURCE_VALIDATED';
  
  IF obgyn_sv_count != 0 THEN
    RAISE EXCEPTION 'Expected 0 OBGYN SOURCE_VALIDATED lessons, found %', obgyn_sv_count;
  END IF;
  
  -- Verify content integrity
  SELECT COUNT(*) INTO obgyn_sections_count
  FROM lesson_sections ls
  JOIN lessons l ON l.id = ls.lesson_id
  JOIN topics t ON t.id = l.topic_id
  WHERE t.code LIKE 'OBGYN%';
  
  IF obgyn_sections_count != 143 THEN
    RAISE EXCEPTION 'Expected 143 OBGYN sections, found %', obgyn_sections_count;
  END IF;
  
  SELECT COUNT(*) INTO obgyn_empty_bodies
  FROM lesson_sections ls
  JOIN lessons l ON l.id = ls.lesson_id
  JOIN topics t ON t.id = l.topic_id
  WHERE t.code LIKE 'OBGYN%'
    AND (ls.body IS NULL OR btrim(ls.body) = '');
  
  IF obgyn_empty_bodies != 0 THEN
    RAISE EXCEPTION 'Expected 0 empty section bodies, found %', obgyn_empty_bodies;
  END IF;
  
  SELECT COUNT(*) INTO obgyn_lesson_sources_count
  FROM lesson_sources lsrc
  JOIN lessons l ON l.id = lsrc.lesson_id
  JOIN topics t ON t.id = l.topic_id
  WHERE t.code LIKE 'OBGYN%';
  
  IF obgyn_lesson_sources_count != 39 THEN
    RAISE EXCEPTION 'Expected 39 OBGYN lesson_sources, found %', obgyn_lesson_sources_count;
  END IF;
  
  SELECT COUNT(DISTINCT s.id) INTO obgyn_distinct_sources
  FROM sources s
  JOIN lesson_sources lsrc ON lsrc.source_id = s.id
  JOIN lessons l ON l.id = lsrc.lesson_id
  JOIN topics t ON t.id = l.topic_id
  WHERE t.code LIKE 'OBGYN%';
  
  IF obgyn_distinct_sources != 29 THEN
    RAISE EXCEPTION 'Expected 29 distinct OBGYN sources, found %', obgyn_distinct_sources;
  END IF;
  
  -- Verify baseline preserved
  SELECT COUNT(*) INTO baseline_sv
  FROM lessons WHERE status = 'SOURCE_VALIDATED';
  
  IF baseline_sv != 52 THEN
    RAISE EXCEPTION 'Expected 52 SOURCE_VALIDATED baseline, found %', baseline_sv;
  END IF;
  
  SELECT COUNT(*) INTO verified_count
  FROM lessons WHERE status = 'VERIFIED';
  
  IF verified_count != 0 THEN
    RAISE EXCEPTION 'Expected 0 VERIFIED, found %', verified_count;
  END IF;
  
  RAISE NOTICE 'Preconditions PASS';
END $$;

-- ================================================================
-- PROMOTE OBGYN TO SOURCE_VALIDATED
-- ================================================================

UPDATE lessons
SET status = 'SOURCE_VALIDATED'
WHERE id IN (
  SELECT l.id
  FROM lessons l
  JOIN topics t ON t.id = l.topic_id
  WHERE t.code LIKE 'OBGYN%'
    AND l.status = 'REVIEW'
);

-- ================================================================
-- POSTCONDITIONS
-- ================================================================

DO $$
DECLARE
  obgyn_review_count INT;
  obgyn_sv_count INT;
  total_sv INT;
  verified_count INT;
  obgyn_reviewed_at_set INT;
  obgyn_reviewed_by_set INT;
BEGIN
  -- Verify promotion
  SELECT COUNT(*) INTO obgyn_review_count
  FROM lessons l
  JOIN topics t ON t.id = l.topic_id
  WHERE t.code LIKE 'OBGYN%' AND l.status = 'REVIEW';
  
  IF obgyn_review_count != 0 THEN
    RAISE EXCEPTION 'Expected 0 OBGYN REVIEW after promotion, found %', obgyn_review_count;
  END IF;
  
  SELECT COUNT(*) INTO obgyn_sv_count
  FROM lessons l
  JOIN topics t ON t.id = l.topic_id
  WHERE t.code LIKE 'OBGYN%' AND l.status = 'SOURCE_VALIDATED';
  
  IF obgyn_sv_count != 3 THEN
    RAISE EXCEPTION 'Expected 3 OBGYN SOURCE_VALIDATED, found %', obgyn_sv_count;
  END IF;
  
  -- Verify new total
  SELECT COUNT(*) INTO total_sv
  FROM lessons WHERE status = 'SOURCE_VALIDATED';
  
  IF total_sv != 55 THEN
    RAISE EXCEPTION 'Expected 55 total SOURCE_VALIDATED (52 + 3), found %', total_sv;
  END IF;
  
  -- Verify no VERIFIED
  SELECT COUNT(*) INTO verified_count
  FROM lessons WHERE status = 'VERIFIED';
  
  IF verified_count != 0 THEN
    RAISE EXCEPTION 'Expected 0 VERIFIED, found %', verified_count;
  END IF;
  
  -- Verify provenance NOT set
  SELECT COUNT(*) INTO obgyn_reviewed_at_set
  FROM lessons l
  JOIN topics t ON t.id = l.topic_id
  WHERE t.code LIKE 'OBGYN%' AND l.reviewed_at IS NOT NULL;
  
  IF obgyn_reviewed_at_set != 0 THEN
    RAISE EXCEPTION 'Expected 0 OBGYN with reviewed_at set, found %', obgyn_reviewed_at_set;
  END IF;
  
  SELECT COUNT(*) INTO obgyn_reviewed_by_set
  FROM lessons l
  JOIN topics t ON t.id = l.topic_id
  WHERE t.code LIKE 'OBGYN%' AND l.reviewed_by IS NOT NULL;
  
  IF obgyn_reviewed_by_set != 0 THEN
    RAISE EXCEPTION 'Expected 0 OBGYN with reviewed_by set, found %', obgyn_reviewed_by_set;
  END IF;
  
  RAISE NOTICE 'Postconditions PASS';
  RAISE NOTICE 'OBGYN promoted: 3 lessons now SOURCE_VALIDATED';
  RAISE NOTICE 'Total SOURCE_VALIDATED: 55 (Adult 29 + Mental 10 + Public 13 + OBGYN 3)';
END $$;

COMMIT;

-- ================================================================
-- IMPORTANT: This promotion is ready for execution
-- ================================================================
