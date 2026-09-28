"use server";

/**
 * Server actions for lesson progress
 * 
 * These run on the server and can be called from client components
 */

import { revalidatePath } from "next/cache";
import { 
  markLessonStarted, 
  markLessonCompleted, 
  unmarkLessonCompleted,
  updateLastSection 
} from "@/lib/progress/mutations";
import { createClient } from "@/lib/supabase/server";

/**
 * Mark lesson as started (called when user opens lesson)
 */
export async function startLessonAction(lessonId: string) {
  const supabase = await createClient();
  const { data: { user } } = await supabase.auth.getUser();

  if (!user) {
    return { error: "No autenticado" };
  }

  const { data, error } = await markLessonStarted(lessonId, user.id);

  if (error) {
    return { error: error.message };
  }

  revalidatePath('/dashboard');

  return { success: true, data };
}

/**
 * Toggle lesson completion status
 */
export async function toggleCompletionAction(lessonId: string, currentlyCompleted: boolean) {
  const { data, error } = currentlyCompleted 
    ? await unmarkLessonCompleted(lessonId)
    : await markLessonCompleted(lessonId);

  if (error) {
    return { error: error.message };
  }

  revalidatePath('/dashboard');

  return { success: true, data };
}

/**
 * Update last visited section for resume functionality
 */
export async function updateLastSectionAction(
  lessonId: string,
  sectionId: string | null
) {
  const { data, error } = await updateLastSection(lessonId, sectionId);

  if (error) {
    return { error: error.message };
  }

  revalidatePath('/dashboard');

  return { success: true, data };
}
