-- ================================================================
-- Promote Administration Lessons to SOURCE_VALIDATED
-- 
-- Documentary validation passed for all 11 lessons
-- Promoting from REVIEW to SOURCE_VALIDATED
-- ================================================================

BEGIN;

-- ================================================================
-- PRECONDITIONS
-- ================================================================

DO $$
DECLARE
  admin_review INT;
  baseline_sv INT;
  verified INT;
BEGIN
  -- Verify 11 Administration lessons in REVIEW
  SELECT COUNT(*) INTO admin_review
  FROM lessons l
  JOIN topics t ON t.id = l.topic_id
  WHERE t.code LIKE 'ADMIN-%' AND l.status = 'REVIEW';
  
  IF admin_review != 11 THEN
    RAISE EXCEPTION 'Expected 11 Administration REVIEW lessons, found %', admin_review;
  END IF;
  
  -- Verify baseline
  SELECT COUNT(*) INTO baseline_sv FROM lessons WHERE status = 'SOURCE_VALIDATED';
  IF baseline_sv != 61 THEN RAISE EXCEPTION 'Expected 61 SOURCE_VALIDATED baseline, found %', baseline_sv; END IF;
  
  SELECT COUNT(*) INTO verified FROM lessons WHERE status = 'VERIFIED';
  IF verified != 0 THEN RAISE EXCEPTION 'Expected 0 VERIFIED, found %', verified; END IF;
  
  RAISE NOTICE 'Preconditions PASS';
END $$;

-- ================================================================
-- PROMOTE TO SOURCE_VALIDATED
-- ================================================================

UPDATE lessons
SET status = 'SOURCE_VALIDATED'
WHERE topic_id IN (
  SELECT id FROM topics WHERE code LIKE 'ADMIN-%'
)
AND status = 'REVIEW';

-- ================================================================
-- POSTCONDITIONS
-- ================================================================

DO $$
DECLARE
  admin_sv INT;
  admin_review INT;
  total_sv INT;
  verified INT;
BEGIN
  -- Verify promotion
  SELECT COUNT(*) INTO admin_sv
  FROM lessons l
  JOIN topics t ON t.id = l.topic_id
  WHERE t.code LIKE 'ADMIN-%' AND l.status = 'SOURCE_VALIDATED';
  
  IF admin_sv != 11 THEN
    RAISE EXCEPTION 'Expected 11 Administration SOURCE_VALIDATED, found %', admin_sv;
  END IF;
  
  SELECT COUNT(*) INTO admin_review
  FROM lessons l
  JOIN topics t ON t.id = l.topic_id
  WHERE t.code LIKE 'ADMIN-%' AND l.status = 'REVIEW';
  
  IF admin_review != 0 THEN
    RAISE EXCEPTION 'Expected 0 Administration REVIEW after promotion, found %', admin_review;
  END IF;
  
  -- Verify new baseline
  SELECT COUNT(*) INTO total_sv FROM lessons WHERE status = 'SOURCE_VALIDATED';
  IF total_sv != 72 THEN
    RAISE EXCEPTION 'Expected 72 total SOURCE_VALIDATED (61+11), found %', total_sv;
  END IF;
  
  SELECT COUNT(*) INTO verified FROM lessons WHERE status = 'VERIFIED';
  IF verified != 0 THEN RAISE EXCEPTION 'Expected 0 VERIFIED, found %', verified; END IF;
  
  RAISE NOTICE 'Postconditions PASS';
  RAISE NOTICE 'Administration promoted: % SOURCE_VALIDATED', admin_sv;
  RAISE NOTICE 'New baseline: % SOURCE_VALIDATED total', total_sv;
END $$;

COMMIT;

-- ================================================================
-- Administration promotion complete
-- New baseline: 72 SOURCE_VALIDATED (61 + 11 Administration)
-- ================================================================
