-- Test suite for resume progress backend (CORRECTED)
-- Purpose: Validate composite FK constraint for section-lesson integrity
-- Note: RLS tests require real authenticated contexts

BEGIN;

-- Test 1: Schema validation - columns exist
DO $$
BEGIN
  -- Verify last_section_id column exists
  IF NOT EXISTS (
    SELECT 1 FROM information_schema.columns
    WHERE table_schema = 'public'
      AND table_name = 'user_lesson_progress'
      AND column_name = 'last_section_id'
  ) THEN
    RAISE EXCEPTION 'Column last_section_id does not exist';
  END IF;
  
  -- Verify last_visited_at column exists
  IF NOT EXISTS (
    SELECT 1 FROM information_schema.columns
    WHERE table_schema = 'public'
      AND table_name = 'user_lesson_progress'
      AND column_name = 'last_visited_at'
  ) THEN
    RAISE EXCEPTION 'Column last_visited_at does not exist';
  END IF;
  
  RAISE NOTICE 'Test 1 PASS: Schema columns exist';
END;
$$;

-- Test 2: Composite FK constraint exists
DO $$
BEGIN
  -- Verify composite FK constraint exists
  IF NOT EXISTS (
    SELECT 1 FROM information_schema.table_constraints
    WHERE table_schema = 'public'
      AND table_name = 'user_lesson_progress'
      AND constraint_name = 'fk_resume_section_belongs_to_lesson'
      AND constraint_type = 'FOREIGN KEY'
  ) THEN
    RAISE EXCEPTION 'Composite FK constraint fk_resume_section_belongs_to_lesson does not exist';
  END IF;
  
  -- Verify supporting UNIQUE constraint on lesson_sections
  IF NOT EXISTS (
    SELECT 1 FROM information_schema.table_constraints
    WHERE table_schema = 'public'
      AND table_name = 'lesson_sections'
      AND constraint_name = 'uq_lesson_section_id_lesson'
      AND constraint_type = 'UNIQUE'
  ) THEN
    RAISE EXCEPTION 'Supporting UNIQUE(id, lesson_id) on lesson_sections does not exist';
  END IF;
  
  RAISE NOTICE 'Test 2 PASS: Composite FK constraint exists';
END;
$$;

-- Test 3: Cross-lesson section assignment rejected by FK
DO $$
DECLARE
  v_student_id UUID;
  v_topic_a UUID;
  v_topic_b UUID;
  v_lesson_a UUID;
  v_lesson_b UUID;
  v_section_a UUID;
  v_section_b UUID;
  v_area_id UUID;
BEGIN
  -- Create test student (via auth.users + trigger)
  v_student_id := gen_random_uuid();
  
  INSERT INTO auth.users (
    instance_id,
    id,
    aud,
    role,
    email,
    email_confirmed_at,
    raw_user_meta_data,
    created_at,
    updated_at
  ) VALUES (
    '00000000-0000-0000-0000-000000000000',
    v_student_id,
    'authenticated',
    'authenticated',
    'test-student-fk@test.local',
    now(),
    jsonb_build_object('full_name', 'Test Student FK'),
    now(),
    now()
  );
  -- Trigger on_auth_user_created creates public.profiles automatically
  
  -- Get any area for synthetic topics
  SELECT id INTO v_area_id FROM public.areas LIMIT 1;
  
  -- Create synthetic topics (isolated from academic content)
  INSERT INTO public.topics (area_id, code, title, sort_order)
  VALUES (v_area_id, 'TEST_TOPIC_A_FK_3', 'Test Topic A FK', 9000)
  RETURNING id INTO v_topic_a;
  
  INSERT INTO public.topics (area_id, code, title, sort_order)
  VALUES (v_area_id, 'TEST_TOPIC_B_FK_3', 'Test Topic B FK', 9001)
  RETURNING id INTO v_topic_b;
  
  -- Create test lessons on synthetic topics
  INSERT INTO public.lessons (topic_id, title, status)
  VALUES (v_topic_a, 'Test Lesson A FK', 'SOURCE_VALIDATED')
  RETURNING id INTO v_lesson_a;
  
  INSERT INTO public.lessons (topic_id, title, status)
  VALUES (v_topic_b, 'Test Lesson B FK', 'SOURCE_VALIDATED')
  RETURNING id INTO v_lesson_b;
  
  -- Create test sections
  INSERT INTO public.lesson_sections (lesson_id, section_key, title, body, sort_order)
  VALUES (v_lesson_a, 'section-a-fk', 'Section A FK', 'Content A', 1)
  RETURNING id INTO v_section_a;
  
  INSERT INTO public.lesson_sections (lesson_id, section_key, title, body, sort_order)
  VALUES (v_lesson_b, 'section-b-fk', 'Section B FK', 'Content B', 1)
  RETURNING id INTO v_section_b;
  
  -- Attempt to insert progress with section from different lesson (should fail with FK violation)
  BEGIN
    INSERT INTO public.user_lesson_progress (user_id, lesson_id, last_section_id)
    VALUES (v_student_id, v_lesson_a, v_section_b);  -- section_b belongs to lesson_b, not lesson_a
    
    RAISE EXCEPTION 'Test 3 FAIL: FK did not prevent cross-lesson section assignment';
  EXCEPTION
    WHEN foreign_key_violation THEN
      RAISE NOTICE 'Test 3 PASS: Composite FK correctly prevents cross-lesson section';
  END;
  
  -- Cleanup (auth.users ON DELETE CASCADE removes public.profiles)
  DELETE FROM public.user_lesson_progress WHERE user_id = v_student_id;
  DELETE FROM public.lesson_sections WHERE id IN (v_section_a, v_section_b);
  DELETE FROM public.lessons WHERE id IN (v_lesson_a, v_lesson_b);
  DELETE FROM public.topics WHERE id IN (v_topic_a, v_topic_b);
  DELETE FROM auth.users WHERE id = v_student_id;
END;
$$;

-- Test 4: Valid same-lesson section assignment works
DO $$
DECLARE
  v_student_id UUID;
  v_topic_id UUID;
  v_lesson_id UUID;
  v_section_id UUID;
  v_area_id UUID;
BEGIN
  -- Create test student (via auth.users + trigger)
  v_student_id := gen_random_uuid();
  
  INSERT INTO auth.users (
    instance_id,
    id,
    aud,
    role,
    email,
    email_confirmed_at,
    raw_user_meta_data,
    created_at,
    updated_at
  ) VALUES (
    '00000000-0000-0000-0000-000000000000',
    v_student_id,
    'authenticated',
    'authenticated',
    'test-student-valid-fk@test.local',
    now(),
    jsonb_build_object('full_name', 'Test Student Valid FK'),
    now(),
    now()
  );
  
  -- Get any area for synthetic topic
  SELECT id INTO v_area_id FROM public.areas LIMIT 1;
  
  -- Create synthetic topic
  INSERT INTO public.topics (area_id, code, title, sort_order)
  VALUES (v_area_id, 'TEST_TOPIC_VALID_FK_4', 'Test Topic Valid FK', 9002)
  RETURNING id INTO v_topic_id;
  
  -- Create test lesson on synthetic topic
  INSERT INTO public.lessons (topic_id, title, status)
  VALUES (v_topic_id, 'Test Lesson Valid FK', 'SOURCE_VALIDATED')
  RETURNING id INTO v_lesson_id;
  
  -- Create test section
  INSERT INTO public.lesson_sections (lesson_id, section_key, title, body, sort_order)
  VALUES (v_lesson_id, 'valid-section-fk', 'Valid Section FK', 'Content', 1)
  RETURNING id INTO v_section_id;
  
  -- Insert progress with valid same-lesson section (should succeed)
  INSERT INTO public.user_lesson_progress (user_id, lesson_id, last_section_id, last_visited_at)
  VALUES (v_student_id, v_lesson_id, v_section_id, now());
  
  -- Verify insert succeeded
  IF NOT EXISTS (
    SELECT 1 FROM public.user_lesson_progress
    WHERE user_id = v_student_id
      AND lesson_id = v_lesson_id
      AND last_section_id = v_section_id
  ) THEN
    RAISE EXCEPTION 'Test 4 FAIL: Valid same-lesson section assignment did not work';
  END IF;
  
  RAISE NOTICE 'Test 4 PASS: Valid same-lesson section assignment works';
  
  -- Cleanup
  DELETE FROM public.user_lesson_progress WHERE user_id = v_student_id;
  DELETE FROM public.lesson_sections WHERE id = v_section_id;
  DELETE FROM public.lessons WHERE id = v_lesson_id;
  DELETE FROM public.topics WHERE id = v_topic_id;
  DELETE FROM auth.users WHERE id = v_student_id;
END;
$$;

-- Test 5: NULL section accepted (legacy rows or lesson top)
DO $$
DECLARE
  v_student_id UUID;
  v_topic_id UUID;
  v_lesson_id UUID;
  v_area_id UUID;
BEGIN
  -- Create test student (via auth.users + trigger)
  v_student_id := gen_random_uuid();
  
  INSERT INTO auth.users (
    instance_id,
    id,
    aud,
    role,
    email,
    email_confirmed_at,
    raw_user_meta_data,
    created_at,
    updated_at
  ) VALUES (
    '00000000-0000-0000-0000-000000000000',
    v_student_id,
    'authenticated',
    'authenticated',
    'test-student-null-fk@test.local',
    now(),
    jsonb_build_object('full_name', 'Test Student NULL FK'),
    now(),
    now()
  );
  
  -- Get any area for synthetic topic
  SELECT id INTO v_area_id FROM public.areas LIMIT 1;
  
  -- Create synthetic topic
  INSERT INTO public.topics (area_id, code, title, sort_order)
  VALUES (v_area_id, 'TEST_TOPIC_NULL_FK_5', 'Test Topic NULL FK', 9003)
  RETURNING id INTO v_topic_id;
  
  -- Create test lesson on synthetic topic
  INSERT INTO public.lessons (topic_id, title, status)
  VALUES (v_topic_id, 'Test Lesson NULL FK', 'SOURCE_VALIDATED')
  RETURNING id INTO v_lesson_id;
  
  -- Insert progress with NULL section (legacy behavior)
  INSERT INTO public.user_lesson_progress (user_id, lesson_id, last_section_id, completed)
  VALUES (v_student_id, v_lesson_id, NULL, false);
  
  -- Verify insert succeeded with NULL
  IF NOT EXISTS (
    SELECT 1 FROM public.user_lesson_progress
    WHERE user_id = v_student_id
      AND lesson_id = v_lesson_id
      AND last_section_id IS NULL
  ) THEN
    RAISE EXCEPTION 'Test 5 FAIL: NULL section was not accepted';
  END IF;
  
  RAISE NOTICE 'Test 5 PASS: NULL section accepted (legacy/lesson top)';
  
  -- Cleanup
  DELETE FROM public.user_lesson_progress WHERE user_id = v_student_id;
  DELETE FROM public.lessons WHERE id = v_lesson_id;
  DELETE FROM public.topics WHERE id = v_topic_id;
  DELETE FROM auth.users WHERE id = v_student_id;
END;
$$;

-- Test 6: Legacy rows work after migration
DO $$
DECLARE
  v_student_id UUID;
  v_topic_id UUID;
  v_lesson_id UUID;
  v_area_id UUID;
BEGIN
  -- Create test student (via auth.users + trigger)
  v_student_id := gen_random_uuid();
  
  INSERT INTO auth.users (
    instance_id,
    id,
    aud,
    role,
    email,
    email_confirmed_at,
    raw_user_meta_data,
    created_at,
    updated_at
  ) VALUES (
    '00000000-0000-0000-0000-000000000000',
    v_student_id,
    'authenticated',
    'authenticated',
    'test-student-legacy-fk@test.local',
    now(),
    jsonb_build_object('full_name', 'Test Student Legacy FK'),
    now(),
    now()
  );
  
  -- Get any area for synthetic topic
  SELECT id INTO v_area_id FROM public.areas LIMIT 1;
  
  -- Create synthetic topic
  INSERT INTO public.topics (area_id, code, title, sort_order)
  VALUES (v_area_id, 'TEST_TOPIC_LEGACY_FK_6', 'Test Topic Legacy FK', 9004)
  RETURNING id INTO v_topic_id;
  
  -- Create test lesson on synthetic topic
  INSERT INTO public.lessons (topic_id, title, status)
  VALUES (v_topic_id, 'Test Lesson Legacy FK', 'SOURCE_VALIDATED')
  RETURNING id INTO v_lesson_id;
  
  -- Insert progress simulating pre-migration row (no resume fields)
  INSERT INTO public.user_lesson_progress (user_id, lesson_id, completed)
  VALUES (v_student_id, v_lesson_id, false);
  
  -- Verify legacy row works with NULL values
  IF NOT EXISTS (
    SELECT 1 FROM public.user_lesson_progress
    WHERE user_id = v_student_id
      AND lesson_id = v_lesson_id
      AND last_section_id IS NULL
      AND last_visited_at IS NULL
  ) THEN
    RAISE EXCEPTION 'Test 6 FAIL: Legacy row does not work';
  END IF;
  
  RAISE NOTICE 'Test 6 PASS: Legacy rows work with NULL resume fields';
  
  -- Cleanup
  DELETE FROM public.user_lesson_progress WHERE user_id = v_student_id;
  DELETE FROM public.lessons WHERE id = v_lesson_id;
  DELETE FROM public.topics WHERE id = v_topic_id;
  DELETE FROM auth.users WHERE id = v_student_id;
END;
$$;

-- Test 7: Completion and started_at unchanged by resume update
DO $$
DECLARE
  v_student_id UUID;
  v_topic_id UUID;
  v_lesson_id UUID;
  v_section_id UUID;
  v_original_started_at TIMESTAMPTZ;
  v_new_started_at TIMESTAMPTZ;
  v_area_id UUID;
BEGIN
  -- Create test student (via auth.users + trigger)
  v_student_id := gen_random_uuid();
  
  INSERT INTO auth.users (
    instance_id,
    id,
    aud,
    role,
    email,
    email_confirmed_at,
    raw_user_meta_data,
    created_at,
    updated_at
  ) VALUES (
    '00000000-0000-0000-0000-000000000000',
    v_student_id,
    'authenticated',
    'authenticated',
    'test-student-preserve-fk@test.local',
    now(),
    jsonb_build_object('full_name', 'Test Student Preserve FK'),
    now(),
    now()
  );
  
  -- Get any area for synthetic topic
  SELECT id INTO v_area_id FROM public.areas LIMIT 1;
  
  -- Create synthetic topic
  INSERT INTO public.topics (area_id, code, title, sort_order)
  VALUES (v_area_id, 'TEST_TOPIC_PRESERVE_FK_7', 'Test Topic Preserve FK', 9005)
  RETURNING id INTO v_topic_id;
  
  -- Create test lesson on synthetic topic
  INSERT INTO public.lessons (topic_id, title, status)
  VALUES (v_topic_id, 'Test Lesson Preserve FK', 'SOURCE_VALIDATED')
  RETURNING id INTO v_lesson_id;
  
  -- Create test section
  INSERT INTO public.lesson_sections (lesson_id, section_key, title, body, sort_order)
  VALUES (v_lesson_id, 'preserve-section-fk', 'Preserve Section FK', 'Content', 1)
  RETURNING id INTO v_section_id;
  
  -- Insert initial progress (uncompleted first, then mark completed via trigger)
  INSERT INTO public.user_lesson_progress (user_id, lesson_id, completed, started_at)
  VALUES (v_student_id, v_lesson_id, false, now() - interval '1 day');
  
  -- Mark as completed (trigger will set completed_at automatically)
  UPDATE public.user_lesson_progress
  SET completed = true
  WHERE user_id = v_student_id AND lesson_id = v_lesson_id
  RETURNING started_at INTO v_original_started_at;
  
  -- Simulate resume position update (preserves started_at and completed)
  UPDATE public.user_lesson_progress
  SET last_section_id = v_section_id,
      last_visited_at = now()
  WHERE user_id = v_student_id AND lesson_id = v_lesson_id
  RETURNING started_at INTO v_new_started_at;
  
  -- Verify started_at unchanged
  IF v_original_started_at != v_new_started_at THEN
    RAISE EXCEPTION 'Test 7 FAIL: started_at was modified by resume update';
  END IF;
  
  -- Verify completion unchanged
  IF NOT EXISTS (
    SELECT 1 FROM public.user_lesson_progress
    WHERE user_id = v_student_id
      AND lesson_id = v_lesson_id
      AND completed = true
      AND completed_at IS NOT NULL
  ) THEN
    RAISE EXCEPTION 'Test 7 FAIL: completion was affected by resume update';
  END IF;
  
  RAISE NOTICE 'Test 7 PASS: Completion and started_at preserved after resume update';
  
  -- Cleanup
  DELETE FROM public.user_lesson_progress WHERE user_id = v_student_id;
  DELETE FROM public.lesson_sections WHERE id = v_section_id;
  DELETE FROM public.lessons WHERE id = v_lesson_id;
  DELETE FROM public.topics WHERE id = v_topic_id;
  DELETE FROM auth.users WHERE id = v_student_id;
END;
$$;

-- Test 8: Section deletion trigger behavior (preserves lesson_id and effective_last_visit)
DO $$
DECLARE
  v_student_id UUID;
  v_topic_id UUID;
  v_lesson_id UUID;
  v_section_modern UUID;
  v_section_legacy UUID;
  v_effective_before_modern TIMESTAMPTZ;
  v_effective_after_modern TIMESTAMPTZ;
  v_effective_before_legacy TIMESTAMPTZ;
  v_effective_after_legacy TIMESTAMPTZ;
  v_area_id UUID;
BEGIN
  -- Create test student (via auth.users + trigger)
  v_student_id := gen_random_uuid();
  
  INSERT INTO auth.users (
    instance_id,
    id,
    aud,
    role,
    email,
    email_confirmed_at,
    raw_user_meta_data,
    created_at,
    updated_at
  ) VALUES (
    '00000000-0000-0000-0000-000000000000',
    v_student_id,
    'authenticated',
    'authenticated',
    'test-student-delete-fk@test.local',
    now(),
    jsonb_build_object('full_name', 'Test Student Delete FK'),
    now(),
    now()
  );
  
  -- Get any area for synthetic topic
  SELECT id INTO v_area_id FROM public.areas LIMIT 1;
  
  -- Create synthetic topic
  INSERT INTO public.topics (area_id, code, title, sort_order)
  VALUES (v_area_id, 'TEST_TOPIC_DELETE_FK_8', 'Test Topic Delete FK', 9006)
  RETURNING id INTO v_topic_id;
  
  -- Create test lesson on synthetic topic
  INSERT INTO public.lessons (topic_id, title, status)
  VALUES (v_topic_id, 'Test Lesson Delete FK', 'SOURCE_VALIDATED')
  RETURNING id INTO v_lesson_id;
  
  -- Create two test sections
  INSERT INTO public.lesson_sections (lesson_id, section_key, title, body, sort_order)
  VALUES (v_lesson_id, 'delete-section-modern-fk', 'Delete Section Modern FK', 'Content', 1)
  RETURNING id INTO v_section_modern;
  
  INSERT INTO public.lesson_sections (lesson_id, section_key, title, body, sort_order)
  VALUES (v_lesson_id, 'delete-section-legacy-fk', 'Delete Section Legacy FK', 'Content', 2)
  RETURNING id INTO v_section_legacy;
  
  -- Case A: Modern record (last_visited_at != NULL)
  INSERT INTO public.user_lesson_progress (user_id, lesson_id, last_section_id, last_visited_at)
  VALUES (v_student_id, v_lesson_id, v_section_modern, now() - interval '5 days');
  
  -- Capture effective_last_visit BEFORE delete
  SELECT effective_last_visit INTO v_effective_before_modern
  FROM public.user_lesson_progress
  WHERE user_id = v_student_id AND lesson_id = v_lesson_id;
  
  -- Delete section (trigger should preserve effective_last_visit for modern record)
  DELETE FROM public.lesson_sections WHERE id = v_section_modern;
  
  -- Capture effective_last_visit AFTER delete
  SELECT effective_last_visit INTO v_effective_after_modern
  FROM public.user_lesson_progress
  WHERE user_id = v_student_id AND lesson_id = v_lesson_id;
  
  -- Verify modern record: effective_last_visit unchanged
  IF v_effective_before_modern != v_effective_after_modern THEN
    RAISE EXCEPTION 'Test 8A FAIL: effective_last_visit changed for modern record (% -> %)',
      v_effective_before_modern, v_effective_after_modern;
  END IF;
  
  -- Verify lesson_id preserved and last_section_id nulled
  IF NOT EXISTS (
    SELECT 1 FROM public.user_lesson_progress
    WHERE user_id = v_student_id
      AND lesson_id = v_lesson_id
      AND last_section_id IS NULL
  ) THEN
    RAISE EXCEPTION 'Test 8A FAIL: last_section_id not nulled for modern record';
  END IF;
  
  RAISE NOTICE 'Test 8A PASS: Modern record - effective_last_visit preserved during section delete';
  
  -- Reset for Case B: Legacy record (last_visited_at = NULL)
  DELETE FROM public.user_lesson_progress WHERE user_id = v_student_id;
  
  INSERT INTO public.user_lesson_progress (user_id, lesson_id, last_section_id, completed)
  VALUES (v_student_id, v_lesson_id, v_section_legacy, false);
  -- Note: last_visited_at intentionally NULL to simulate legacy row
  
  -- Wait 1 second to ensure updated_at is in the past
  PERFORM pg_sleep(1);
  
  -- Capture effective_last_visit BEFORE delete (should be = updated_at)
  SELECT effective_last_visit INTO v_effective_before_legacy
  FROM public.user_lesson_progress
  WHERE user_id = v_student_id AND lesson_id = v_lesson_id;
  
  -- Delete section (trigger should materialize updated_at into last_visited_at)
  DELETE FROM public.lesson_sections WHERE id = v_section_legacy;
  
  -- Capture effective_last_visit AFTER delete
  SELECT effective_last_visit INTO v_effective_after_legacy
  FROM public.user_lesson_progress
  WHERE user_id = v_student_id AND lesson_id = v_lesson_id;
  
  -- Verify legacy record: effective_last_visit unchanged (semantic preservation)
  IF v_effective_before_legacy != v_effective_after_legacy THEN
    RAISE EXCEPTION 'Test 8B FAIL: effective_last_visit changed for legacy record (% -> %)',
      v_effective_before_legacy, v_effective_after_legacy;
  END IF;
  
  -- Verify lesson_id preserved and last_section_id nulled
  IF NOT EXISTS (
    SELECT 1 FROM public.user_lesson_progress
    WHERE user_id = v_student_id
      AND lesson_id = v_lesson_id
      AND last_section_id IS NULL
  ) THEN
    RAISE EXCEPTION 'Test 8B FAIL: last_section_id not nulled for legacy record';
  END IF;
  
  RAISE NOTICE 'Test 8B PASS: Legacy record - effective_last_visit preserved during section delete';
  RAISE NOTICE 'Test 8 PASS: Trigger correctly preserves lesson_id and effective_last_visit (both cases)';
  
  -- Cleanup
  DELETE FROM public.user_lesson_progress WHERE user_id = v_student_id;
  DELETE FROM public.lessons WHERE id = v_lesson_id;
  DELETE FROM public.topics WHERE id = v_topic_id;
  DELETE FROM auth.users WHERE id = v_student_id;
END;
$$;

-- Test 9: effective_last_visit generated column and index
DO $$
DECLARE
  v_student_id UUID;
  v_topic_id UUID;
  v_lesson_id UUID;
  v_effective_visit TIMESTAMPTZ;
  v_area_id UUID;
BEGIN
  -- Create test student (via auth.users + trigger)
  v_student_id := gen_random_uuid();
  
  INSERT INTO auth.users (
    instance_id,
    id,
    aud,
    role,
    email,
    email_confirmed_at,
    raw_user_meta_data,
    created_at,
    updated_at
  ) VALUES (
    '00000000-0000-0000-0000-000000000000',
    v_student_id,
    'authenticated',
    'authenticated',
    'test-student-effective@test.local',
    now(),
    jsonb_build_object('full_name', 'Test Student Effective'),
    now(),
    now()
  );
  
  -- Get any area for synthetic topic
  SELECT id INTO v_area_id FROM public.areas LIMIT 1;
  
  -- Create synthetic topic
  INSERT INTO public.topics (area_id, code, title, sort_order)
  VALUES (v_area_id, 'TEST_TOPIC_EFFECTIVE_9', 'Test Topic Effective', 9007)
  RETURNING id INTO v_topic_id;
  
  -- Create test lesson on synthetic topic
  INSERT INTO public.lessons (topic_id, title, status)
  VALUES (v_topic_id, 'Test Lesson Effective', 'SOURCE_VALIDATED')
  RETURNING id INTO v_lesson_id;
  
  -- Insert legacy progress (no last_visited_at)
  INSERT INTO public.user_lesson_progress (user_id, lesson_id, completed)
  VALUES (v_student_id, v_lesson_id, false);
  
  -- Verify effective_last_visit is populated from updated_at
  SELECT effective_last_visit INTO v_effective_visit
  FROM public.user_lesson_progress
  WHERE user_id = v_student_id AND lesson_id = v_lesson_id;
  
  IF v_effective_visit IS NULL THEN
    RAISE EXCEPTION 'Test 9 FAIL: effective_last_visit is NULL for legacy row';
  END IF;
  
  -- Update with last_visited_at
  UPDATE public.user_lesson_progress
  SET last_visited_at = now() + interval '1 hour'
  WHERE user_id = v_student_id AND lesson_id = v_lesson_id;
  
  -- Verify effective_last_visit now uses last_visited_at (newer than updated_at)
  SELECT effective_last_visit INTO v_effective_visit
  FROM public.user_lesson_progress
  WHERE user_id = v_student_id AND lesson_id = v_lesson_id;
  
  -- effective_last_visit should now be ~1 hour in future
  IF v_effective_visit <= now() THEN
    RAISE EXCEPTION 'Test 9 FAIL: effective_last_visit did not use last_visited_at';
  END IF;
  
  RAISE NOTICE 'Test 9 PASS: effective_last_visit generated column works';
  
  -- Cleanup
  DELETE FROM public.user_lesson_progress WHERE user_id = v_student_id;
  DELETE FROM public.lessons WHERE id = v_lesson_id;
  DELETE FROM public.topics WHERE id = v_topic_id;
  DELETE FROM auth.users WHERE id = v_student_id;
END;
$$;

-- Test 10: Indexes created
DO $$
BEGIN
  -- Verify effective_last_visit index exists
  IF NOT EXISTS (
    SELECT 1 FROM pg_indexes
    WHERE schemaname = 'public'
      AND tablename = 'user_lesson_progress'
      AND indexname = 'idx_user_lesson_progress_effective_last_visit'
  ) THEN
    RAISE EXCEPTION 'Test 10 FAIL: idx_user_lesson_progress_effective_last_visit does not exist';
  END IF;
  
  -- Verify last_section index exists
  IF NOT EXISTS (
    SELECT 1 FROM pg_indexes
    WHERE schemaname = 'public'
      AND tablename = 'user_lesson_progress'
      AND indexname = 'idx_user_lesson_progress_last_section'
  ) THEN
    RAISE EXCEPTION 'Test 10 FAIL: idx_user_lesson_progress_last_section does not exist';
  END IF;
  
  RAISE NOTICE 'Test 10 PASS: Indexes created';
END;
$$;

-- Summary
DO $$
BEGIN
  RAISE NOTICE '===================================';
  RAISE NOTICE 'Resume Progress Backend Tests';
  RAISE NOTICE '===================================';
  RAISE NOTICE 'All composite FK, trigger, and schema tests passed';
  RAISE NOTICE '';
  RAISE NOTICE 'Validated:';
  RAISE NOTICE '- Composite FK prevents cross-lesson section';
  RAISE NOTICE '- Trigger nulls only last_section_id (preserves lesson_id)';
  RAISE NOTICE '- effective_last_visit fallback for legacy rows';
  RAISE NOTICE '- Completion and started_at preservation';
  RAISE NOTICE '';
  RAISE NOTICE 'RLS tests require authenticated context:';
  RAISE NOTICE '- Active student can update own progress';
  RAISE NOTICE '- Student B cannot update Student A progress';
  RAISE NOTICE '- Inactive student denied';
  RAISE NOTICE '- Anon denied';
  RAISE NOTICE '- Admin can SELECT all progress';
  RAISE NOTICE '===================================';
END;
$$;

ROLLBACK;
