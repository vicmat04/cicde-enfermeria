-- ================================================================
-- Promote Pediatrics to SOURCE_VALIDATED
-- 
-- After documentary validation, promote 6 Pediatrics lessons from
-- REVIEW to SOURCE_VALIDATED. All lessons verified against filesystem:
-- - Titles match local SPEC
-- - Sections match (163 total)
-- - Bodies non-empty
-- - Sources verified (77 distinct)
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
  peds_topics_count INT;
  peds_review_count INT;
  peds_sv_count INT;
  peds_sections_count INT;
  peds_empty_bodies INT;
  baseline_sv INT;
  verified_count INT;
BEGIN
  -- Verify PEDS baseline
  SELECT COUNT(*) INTO peds_topics_count
  FROM topics WHERE code LIKE 'PEDS-%';
  
  IF peds_topics_count != 6 THEN
    RAISE EXCEPTION 'Expected 6 PEDS topics, found %', peds_topics_count;
  END IF;
  
  SELECT COUNT(*) INTO peds_review_count
  FROM lessons l
  JOIN topics t ON t.id = l.topic_id
  WHERE t.code LIKE 'PEDS-%' AND l.status = 'REVIEW';
  
  IF peds_review_count != 6 THEN
    RAISE EXCEPTION 'Expected 6 PEDS REVIEW lessons, found %', peds_review_count;
  END IF;
  
  SELECT COUNT(*) INTO peds_sv_count
  FROM lessons l
  JOIN topics t ON t.id = l.topic_id
  WHERE t.code LIKE 'PEDS-%' AND l.status = 'SOURCE_VALIDATED';
  
  IF peds_sv_count != 0 THEN
    RAISE EXCEPTION 'Expected 0 PEDS SOURCE_VALIDATED lessons, found %', peds_sv_count;
  END IF;
  
  -- Verify content integrity
  SELECT COUNT(*) INTO peds_sections_count
  FROM lesson_sections ls
  JOIN lessons l ON l.id = ls.lesson_id
  JOIN topics t ON t.id = l.topic_id
  WHERE t.code LIKE 'PEDS-%';
  
  IF peds_sections_count != 163 THEN
    RAISE EXCEPTION 'Expected 163 PEDS sections, found %', peds_sections_count;
  END IF;
  
  SELECT COUNT(*) INTO peds_empty_bodies
  FROM lesson_sections ls
  JOIN lessons l ON l.id = ls.lesson_id
  JOIN topics t ON t.id = l.topic_id
  WHERE t.code LIKE 'PEDS-%'
    AND (ls.body IS NULL OR btrim(ls.body) = '');
  
  IF peds_empty_bodies != 0 THEN
    RAISE EXCEPTION 'Expected 0 empty section bodies, found %', peds_empty_bodies;
  END IF;
  
  -- Verify baseline preserved
  SELECT COUNT(*) INTO baseline_sv
  FROM lessons WHERE status = 'SOURCE_VALIDATED';
  
  IF baseline_sv != 55 THEN
    RAISE EXCEPTION 'Expected 55 SOURCE_VALIDATED baseline, found %', baseline_sv;
  END IF;
  
  SELECT COUNT(*) INTO verified_count
  FROM lessons WHERE status = 'VERIFIED';
  
  IF verified_count != 0 THEN
    RAISE EXCEPTION 'Expected 0 VERIFIED, found %', verified_count;
  END IF;
  
  RAISE NOTICE 'Preconditions PASS';
END $$;

-- ================================================================
-- PROMOTE PEDIATRICS TO SOURCE_VALIDATED
-- ================================================================

UPDATE lessons
SET status = 'SOURCE_VALIDATED'
WHERE id IN (
  SELECT l.id
  FROM lessons l
  JOIN topics t ON t.id = l.topic_id
  WHERE t.code LIKE 'PEDS-%'
    AND l.status = 'REVIEW'
);

-- ================================================================
-- POSTCONDITIONS
-- ================================================================

DO $$
DECLARE
  peds_review_count INT;
  peds_sv_count INT;
  total_sv INT;
  verified_count INT;
  peds_reviewed_at_set INT;
  peds_reviewed_by_set INT;
BEGIN
  -- Verify promotion
  SELECT COUNT(*) INTO peds_review_count
  FROM lessons l
  JOIN topics t ON t.id = l.topic_id
  WHERE t.code LIKE 'PEDS-%' AND l.status = 'REVIEW';
  
  IF peds_review_count != 0 THEN
    RAISE EXCEPTION 'Expected 0 PEDS REVIEW after promotion, found %', peds_review_count;
  END IF;
  
  SELECT COUNT(*) INTO peds_sv_count
  FROM lessons l
  JOIN topics t ON t.id = l.topic_id
  WHERE t.code LIKE 'PEDS-%' AND l.status = 'SOURCE_VALIDATED';
  
  IF peds_sv_count != 6 THEN
    RAISE EXCEPTION 'Expected 6 PEDS SOURCE_VALIDATED, found %', peds_sv_count;
  END IF;
  
  -- Verify new total
  SELECT COUNT(*) INTO total_sv
  FROM lessons WHERE status = 'SOURCE_VALIDATED';
  
  IF total_sv != 61 THEN
    RAISE EXCEPTION 'Expected 61 total SOURCE_VALIDATED (55 + 6), found %', total_sv;
  END IF;
  
  -- Verify no VERIFIED
  SELECT COUNT(*) INTO verified_count
  FROM lessons WHERE status = 'VERIFIED';
  
  IF verified_count != 0 THEN
    RAISE EXCEPTION 'Expected 0 VERIFIED, found %', verified_count;
  END IF;
  
  -- Verify provenance NOT set
  SELECT COUNT(*) INTO peds_reviewed_at_set
  FROM lessons l
  JOIN topics t ON t.id = l.topic_id
  WHERE t.code LIKE 'PEDS-%' AND l.reviewed_at IS NOT NULL;
  
  IF peds_reviewed_at_set != 0 THEN
    RAISE EXCEPTION 'Expected 0 PEDS with reviewed_at set, found %', peds_reviewed_at_set;
  END IF;
  
  SELECT COUNT(*) INTO peds_reviewed_by_set
  FROM lessons l
  JOIN topics t ON t.id = l.topic_id
  WHERE t.code LIKE 'PEDS-%' AND l.reviewed_by IS NOT NULL;
  
  IF peds_reviewed_by_set != 0 THEN
    RAISE EXCEPTION 'Expected 0 PEDS with reviewed_by set, found %', peds_reviewed_by_set;
  END IF;
  
  RAISE NOTICE 'Postconditions PASS';
  RAISE NOTICE 'Pediatrics promoted: 6 lessons now SOURCE_VALIDATED';
  RAISE NOTICE 'Total SOURCE_VALIDATED: 61 (Adult 29 + Mental 10 + Public 13 + OBGYN 3 + Pediatrics 6)';
END $$;

COMMIT;

-- ================================================================
-- IMPORTANT: This promotion is ready for execution
-- ================================================================
