DO $$
DECLARE
  adult_codes text[] := ARRAY['ADULT-01', 'ADULT-02', 'ADULT-03', 'ADULT-04', 'ADULT-05', 'ADULT-06', 'ADULT-07', 'ADULT-08', 'ADULT-09', 'ADULT-10', 'ADULT-11', 'ADULT-12', 'ADULT-13', 'ADULT-14', 'ADULT-15', 'ADULT-16', 'ADULT-17', 'ADULT-18', 'ADULT-19', 'ADULT-20', 'ADULT-21', 'ADULT-22', 'ADULT-23', 'ADULT-24', 'ADULT-25', 'ADULT-26', 'ADULT-27', 'ADULT-28', 'ADULT-29'];
  mental_codes text[] := ARRAY['MENTAL-01', 'MENTAL-02', 'MENTAL-03', 'MENTAL-04', 'MENTAL-05', 'MENTAL-06', 'MENTAL-07', 'MENTAL-08', 'MENTAL-09', 'MENTAL-10'];
  public_codes text[] := ARRAY['PUBLIC-01', 'PUBLIC-02', 'PUBLIC-03', 'PUBLIC-04', 'PUBLIC-05', 'PUBLIC-06', 'PUBLIC-07', 'PUBLIC-08', 'PUBLIC-09', 'PUBLIC-10', 'PUBLIC-11', 'PUBLIC-12', 'PUBLIC-13'];
  all_codes text[] := adult_codes || mental_codes || public_codes;

  c_adult int;
  c_mental int;
  c_public int;

  post_adult int;
  post_mental int;
  post_public int;
  post_total_sv int;
  post_total_ver int;
  post_null_review int;
BEGIN
  -- Preconditions
  SELECT COUNT(*) INTO c_adult FROM public.lessons l JOIN public.topics t ON t.id = l.topic_id WHERE t.code = ANY(adult_codes) AND l.status = 'REVIEW' AND l.version = 1 AND l.is_current = true AND l.reviewed_at IS NULL AND l.reviewed_by IS NULL;
  IF c_adult <> 29 THEN RAISE EXCEPTION 'Precondition failed for ADULT: %', c_adult; END IF;

  SELECT COUNT(*) INTO c_mental FROM public.lessons l JOIN public.topics t ON t.id = l.topic_id WHERE t.code = ANY(mental_codes) AND l.status = 'REVIEW' AND l.version = 1 AND l.is_current = true AND l.reviewed_at IS NULL AND l.reviewed_by IS NULL;
  IF c_mental <> 10 THEN RAISE EXCEPTION 'Precondition failed for MENTAL: %', c_mental; END IF;

  SELECT COUNT(*) INTO c_public FROM public.lessons l JOIN public.topics t ON t.id = l.topic_id WHERE t.code = ANY(public_codes) AND l.status = 'REVIEW' AND l.version = 1 AND l.is_current = true AND l.reviewed_at IS NULL AND l.reviewed_by IS NULL;
  IF c_public <> 13 THEN RAISE EXCEPTION 'Precondition failed for PUBLIC: %', c_public; END IF;

  -- The update
  UPDATE public.lessons l
  SET status = 'SOURCE_VALIDATED'
  FROM public.topics t
  WHERE t.id = l.topic_id
  AND t.code = ANY(all_codes)
  AND l.status = 'REVIEW' AND l.version = 1 AND l.is_current = true AND l.reviewed_at IS NULL AND l.reviewed_by IS NULL;

  -- Postconditions
  SELECT COUNT(*) INTO post_adult FROM public.lessons l JOIN public.topics t ON t.id = l.topic_id WHERE t.code = ANY(adult_codes) AND l.status = 'SOURCE_VALIDATED';
  IF post_adult <> 29 THEN RAISE EXCEPTION 'Postcondition failed for ADULT: %', post_adult; END IF;

  SELECT COUNT(*) INTO post_mental FROM public.lessons l JOIN public.topics t ON t.id = l.topic_id WHERE t.code = ANY(mental_codes) AND l.status = 'SOURCE_VALIDATED';
  IF post_mental <> 10 THEN RAISE EXCEPTION 'Postcondition failed for MENTAL: %', post_mental; END IF;

  SELECT COUNT(*) INTO post_public FROM public.lessons l JOIN public.topics t ON t.id = l.topic_id WHERE t.code = ANY(public_codes) AND l.status = 'SOURCE_VALIDATED';
  IF post_public <> 13 THEN RAISE EXCEPTION 'Postcondition failed for PUBLIC: %', post_public; END IF;

  SELECT COUNT(*) INTO post_total_sv FROM public.lessons WHERE status = 'SOURCE_VALIDATED';
  IF post_total_sv <> 52 THEN RAISE EXCEPTION 'Postcondition total SOURCE_VALIDATED failed: %', post_total_sv; END IF;

  SELECT COUNT(*) INTO post_total_ver FROM public.lessons WHERE status = 'VERIFIED';
  IF post_total_ver <> 0 THEN RAISE EXCEPTION 'Postcondition total VERIFIED failed: %', post_total_ver; END IF;

  SELECT COUNT(*) INTO post_null_review FROM public.lessons WHERE status = 'SOURCE_VALIDATED' AND reviewed_at IS NULL AND reviewed_by IS NULL;
  IF post_null_review <> 52 THEN RAISE EXCEPTION 'Postcondition null review failed: %', post_null_review; END IF;

END $$;