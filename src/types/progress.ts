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
 * 
 * Resume fields added in migration 0db32b5:
 * - last_section_id: UUID of last visited section (nullable)
 * - last_visited_at: explicit visit timestamp (nullable)
 * - effective_last_visit: COALESCE(last_visited_at, updated_at) - computed/generated
 */
export interface UserLessonProgress {
  id: string;                    // UUID
  user_id: string;               // UUID (FK to profiles.id)
  lesson_id: string;             // UUID (FK to lessons.id)
  completed: boolean;            // Default: false
  started_at: string;            // ISO timestamp (auto-set on INSERT)
  completed_at: string | null;   // ISO timestamp (auto-set when completed=true)
  updated_at: string;            // ISO timestamp (auto-updated)
  last_section_id: string | null;     // UUID (FK to lesson_sections.id) - resume point
  last_visited_at: string | null;     // ISO timestamp - explicit section visit
  effective_last_visit: string;       // ISO timestamp - generated/computed column
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

export interface AreaProgressWithLastTopic extends AreaProgress {
  lastTopic: {
    topicTitle: string;
    lessonTitle: string;
  } | null;
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
