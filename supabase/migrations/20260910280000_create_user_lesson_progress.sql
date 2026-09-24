-- Migration: Create user lesson progress tracking
-- Date: 2026-09-10
-- Purpose: Enable persistent student lesson progress for v1

-- Create user_lesson_progress table
CREATE TABLE IF NOT EXISTS public.user_lesson_progress (
  id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
  user_id UUID NOT NULL REFERENCES public.profiles(id) ON DELETE CASCADE,
  lesson_id UUID NOT NULL REFERENCES public.lessons(id) ON DELETE CASCADE,
  completed BOOLEAN NOT NULL DEFAULT false,
  started_at TIMESTAMPTZ NOT NULL DEFAULT now(),
  completed_at TIMESTAMPTZ,
  updated_at TIMESTAMPTZ NOT NULL DEFAULT now(),
  
  -- Ensure one progress record per user per lesson
  CONSTRAINT unique_user_lesson UNIQUE (user_id, lesson_id),
  
  -- Ensure completed_at is set only when completed is true
  CONSTRAINT completed_at_consistency CHECK (
    (completed = false AND completed_at IS NULL) OR
    (completed = true AND completed_at IS NOT NULL)
  ),
  
  -- Ensure completed_at is not before started_at
  CONSTRAINT completion_after_start CHECK (
    completed_at IS NULL OR completed_at >= started_at
  )
);

-- Create indexes for common queries
CREATE INDEX idx_user_lesson_progress_user_id ON public.user_lesson_progress(user_id);
CREATE INDEX idx_user_lesson_progress_lesson_id ON public.user_lesson_progress(lesson_id);
CREATE INDEX idx_user_lesson_progress_completed ON public.user_lesson_progress(completed) WHERE completed = true;

-- Add comment
COMMENT ON TABLE public.user_lesson_progress IS 'Tracks authenticated student progress through lessons';

-- Enable RLS
ALTER TABLE public.user_lesson_progress ENABLE ROW LEVEL SECURITY;

-- RLS Policy: ANON - NO ACCESS
-- (implicit - RLS enabled with no policy for anon means denied)

-- RLS Policy: Active STUDENT - SELECT own progress
CREATE POLICY "Students can view their own progress"
  ON public.user_lesson_progress
  FOR SELECT
  TO authenticated
  USING (
    user_id = auth.uid() AND
    EXISTS (
      SELECT 1 FROM public.profiles
      WHERE id = auth.uid()
        AND role = 'STUDENT'
        AND is_active = true
    )
  );

-- RLS Policy: Active STUDENT - INSERT own progress
CREATE POLICY "Students can create their own progress"
  ON public.user_lesson_progress
  FOR INSERT
  TO authenticated
  WITH CHECK (
    user_id = auth.uid() AND
    EXISTS (
      SELECT 1 FROM public.profiles
      WHERE id = auth.uid()
        AND role = 'STUDENT'
        AND is_active = true
    )
  );

-- RLS Policy: Active STUDENT - UPDATE own progress
CREATE POLICY "Students can update their own progress"
  ON public.user_lesson_progress
  FOR UPDATE
  TO authenticated
  USING (
    user_id = auth.uid() AND
    EXISTS (
      SELECT 1 FROM public.profiles
      WHERE id = auth.uid()
        AND role = 'STUDENT'
        AND is_active = true
    )
  )
  WITH CHECK (
    user_id = auth.uid() AND
    EXISTS (
      SELECT 1 FROM public.profiles
      WHERE id = auth.uid()
        AND role = 'STUDENT'
        AND is_active = true
    )
  );

-- RLS Policy: ADMIN - Read all progress (for admin dashboard if needed)
CREATE POLICY "Admins can view all progress"
  ON public.user_lesson_progress
  FOR SELECT
  TO authenticated
  USING (
    EXISTS (
      SELECT 1 FROM public.profiles
      WHERE id = auth.uid()
        AND role = 'ADMIN'
        AND is_active = true
    )
  );

-- Create trigger to update updated_at timestamp
CREATE OR REPLACE FUNCTION public.update_user_lesson_progress_updated_at()
RETURNS TRIGGER AS $$
BEGIN
  NEW.updated_at = now();
  RETURN NEW;
END;
$$ LANGUAGE plpgsql;

CREATE TRIGGER update_user_lesson_progress_updated_at_trigger
  BEFORE UPDATE ON public.user_lesson_progress
  FOR EACH ROW
  EXECUTE FUNCTION public.update_user_lesson_progress_updated_at();

-- Create trigger to set completed_at when completed changes to true
CREATE OR REPLACE FUNCTION public.set_user_lesson_progress_completed_at()
RETURNS TRIGGER AS $$
BEGIN
  -- If completed changed from false to true, set completed_at
  IF NEW.completed = true AND (OLD.completed = false OR OLD.completed IS NULL) THEN
    NEW.completed_at = now();
  END IF;
  
  -- If completed changed from true to false, clear completed_at
  IF NEW.completed = false AND OLD.completed = true THEN
    NEW.completed_at = NULL;
  END IF;
  
  RETURN NEW;
END;
$$ LANGUAGE plpgsql;

CREATE TRIGGER set_user_lesson_progress_completed_at_trigger
  BEFORE UPDATE ON public.user_lesson_progress
  FOR EACH ROW
  EXECUTE FUNCTION public.set_user_lesson_progress_completed_at();
