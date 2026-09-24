/**
 * Progress Mutations
 * 
 * Write operations for user_lesson_progress table.
 * Based on Backend Progress Contract.
 * 
 * IMPORTANT: 
 * - completed_at and updated_at are managed by database triggers
 * - Do NOT set them manually
 */

import { createClient } from "@/lib/supabase/client";
import type { UserLessonProgress } from "@/types/progress";

/**
 * Mark lesson as started (or update if already started)
 * 
 * Uses UPSERT to be idempotent - safe to call multiple times
 * Database triggers handle started_at on first INSERT
 */
export async function markLessonStarted(
  lessonId: string,
  userId: string
): Promise<{ data: UserLessonProgress | null; error: Error | null }> {
  const supabase = createClient();

  const { data, error } = await supabase
    .from('user_lesson_progress')
    .upsert(
      {
        lesson_id: lessonId,
        user_id: userId,
        completed: false,
      },
      {
        onConflict: 'user_id,lesson_id',
        ignoreDuplicates: false,
      }
    )
    .select()
    .single();

  if (error) {
    console.error('Error marking lesson started:', error);
    return { data: null, error: new Error(error.message) };
  }

  return { data, error: null };
}

/**
 * Mark lesson as completed
 * 
 * Database trigger automatically sets completed_at
 */
export async function markLessonCompleted(
  lessonId: string
): Promise<{ data: UserLessonProgress | null; error: Error | null }> {
  const supabase = createClient();

  const { data, error } = await supabase
    .from('user_lesson_progress')
    .update({ completed: true })
    .eq('lesson_id', lessonId)
    .select()
    .single();

  if (error) {
    console.error('Error marking lesson completed:', error);
    return { data: null, error: new Error(error.message) };
  }

  return { data, error: null };
}

/**
 * Unmark lesson as completed
 * 
 * Database trigger automatically clears completed_at
 */
export async function unmarkLessonCompleted(
  lessonId: string
): Promise<{ data: UserLessonProgress | null; error: Error | null }> {
  const supabase = createClient();

  const { data, error } = await supabase
    .from('user_lesson_progress')
    .update({ completed: false })
    .eq('lesson_id', lessonId)
    .select()
    .single();

  if (error) {
    console.error('Error unmarking lesson completed:', error);
    return { data: null, error: new Error(error.message) };
  }

  return { data, error: null };
}

/**
 * Toggle lesson completion status
 */
export async function toggleLessonCompletion(
  lessonId: string,
  currentlyCompleted: boolean
): Promise<{ data: UserLessonProgress | null; error: Error | null }> {
  if (currentlyCompleted) {
    return unmarkLessonCompleted(lessonId);
  } else {
    return markLessonCompleted(lessonId);
  }
}
