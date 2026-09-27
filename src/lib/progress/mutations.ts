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
 * INSERT-first strategy to avoid degrading completion status:
 * - First visit: INSERT with completed=false, started_at auto-set
 * - Revisit: UPDATE only last_visited_at (future), never touches completed
 * 
 * Database triggers handle started_at (INSERT) and updated_at (always)
 */
export async function markLessonStarted(
  lessonId: string,
  userId: string
): Promise<{ data: UserLessonProgress | null; error: Error | null }> {
  const supabase = createClient();

  // Try INSERT first (new lesson start)
  const { data: insertData, error: insertError } = await supabase
    .from('user_lesson_progress')
    .insert({
      lesson_id: lessonId,
      user_id: userId,
      completed: false,
    })
    .select()
    .single();

  if (!insertError) {
    return { data: insertData, error: null };
  }

  // Conflict (23505 = unique_violation): lesson already started
  if (insertError.code === '23505') {
    // UPDATE to touch updated_at (auto) without degrading completed
    // Future: will also update last_visited_at here
    const { data: updateData, error: updateError } = await supabase
      .from('user_lesson_progress')
      .update({
        // Touch record to update updated_at (backend auto-manages it)
        // We send lesson_id just to have a field in the UPDATE
        // (Supabase requires at least one field to update)
        lesson_id: lessonId,
      })
      .eq('lesson_id', lessonId)
      .eq('user_id', userId)
      .select()
      .single();

    if (updateError) {
      console.error('Error updating lesson visit:', updateError);
      return { data: null, error: new Error(updateError.message) };
    }

    return { data: updateData, error: null };
  }

  // Other error
  console.error('Error marking lesson started:', insertError);
  return { data: null, error: new Error(insertError.message) };
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

/**
 * Update last visited section for resume functionality
 * 
 * Saves section resume point without touching:
 * - completed, completed_at
 * - started_at
 * - any scroll position (scrollY not persisted)
 * 
 * Backend auto-updates updated_at and effective_last_visit
 */
export async function updateLastSection(
  lessonId: string,
  sectionId: string | null
): Promise<{ data: UserLessonProgress | null; error: Error | null }> {
  const supabase = createClient();

  const { data, error } = await supabase
    .from('user_lesson_progress')
    .update({
      last_section_id: sectionId,
      last_visited_at: new Date().toISOString(),
    })
    .eq('lesson_id', lessonId)
    .select()
    .single();

  if (error) {
    console.error('Error updating last section:', error);
    return { data: null, error: new Error(error.message) };
  }

  return { data, error: null };
}
