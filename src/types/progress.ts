/**
 * Progress types for CICDE UI v1
 * 
 * Based on official Backend Progress Contract:
 * Table: user_lesson_progress
 * Migration: 20260910280000_create_user_lesson_progress.sql
 */

/**
 * Database row from user_lesson_progress table
 * Matches backend schema exactly
 */
export interface UserLessonProgress {
  id: string;                    // UUID
  user_id: string;               // UUID (FK to profiles.id)
  lesson_id: string;             // UUID (FK to lessons.id)
  completed: boolean;            // Default: false
  started_at: string;            // ISO timestamp (auto-set on INSERT)
  completed_at: string | null;   // ISO timestamp (auto-set when completed=true)
  updated_at: string;            // ISO timestamp (auto-updated)
}

/**
 * Area progress summary for dashboard
 */
export interface AreaProgress {
  areaId: string;
  areaCode: string;
  areaName: string;
  totalLessons: number;
  completedLessons: number;
  progressPercent: number;
}

/**
 * Global progress summary for dashboard
 */
export interface GlobalProgress {
  totalLessons: number;
  completedLessons: number;
  progressPercent: number;
  areasProgress: AreaProgress[];
}

/**
 * Props for components that display progress
 */
export interface ProgressDisplayProps {
  progress: GlobalProgress | null;
  isLoading?: boolean;
  error?: Error | null;
}

export interface LessonCompletionProps {
  lessonId: string;
  isCompleted: boolean;
  isLoading?: boolean;
  onToggleComplete?: (lessonId: string, completed: boolean) => void | Promise<void>;
}

export interface AreaProgressCardProps {
  areaProgress: AreaProgress;
}
