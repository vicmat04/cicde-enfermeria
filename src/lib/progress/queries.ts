/**
 * Progress Queries
 * 
 * Read operations for user_lesson_progress table.
 * Based on Backend Progress Contract.
 */

import { createClient } from "@/lib/supabase/server";
import type { UserLessonProgress, GlobalProgress, AreaProgress } from "@/types/progress";

/**
 * Check if user has started a lesson
 * Returns null if no progress record exists
 */
export async function getLessonProgress(lessonId: string): Promise<UserLessonProgress | null> {
  const supabase = await createClient();
  
  const { data, error } = await supabase
    .from('user_lesson_progress')
    .select('*')
    .eq('lesson_id', lessonId)
    .maybeSingle();

  if (error) {
    console.error('Error fetching lesson progress:', error);
    return null;
  }

  return data;
}

/**
 * Get all user's progress records
 */
export async function getAllUserProgress(): Promise<UserLessonProgress[]> {
  const supabase = await createClient();
  
  const { data, error } = await supabase
    .from('user_lesson_progress')
    .select('*')
    .order('updated_at', { ascending: false });

  if (error) {
    console.error('Error fetching all progress:', error);
    return [];
  }

  return data || [];
}

/**
 * Calculate global progress metrics
 * 
 * Returns completed count, total count, and percentage
 */
export async function getGlobalProgress(): Promise<GlobalProgress> {
  const supabase = await createClient();

  // Get completed lessons count
  const { count: completedCount, error: completedError } = await supabase
    .from('user_lesson_progress')
    .select('*', { count: 'exact', head: true })
    .eq('completed', true);

  // Get total visible lessons count
  const { count: totalCount, error: totalError } = await supabase
    .from('lessons')
    .select('*', { count: 'exact', head: true })
    .eq('is_current', true)
    .in('status', ['SOURCE_VALIDATED', 'VERIFIED']);

  if (completedError || totalError) {
    console.error('Error calculating global progress:', { completedError, totalError });
    return {
      totalLessons: 0,
      completedLessons: 0,
      progressPercent: 0,
      areasProgress: [],
    };
  }

  const total = totalCount || 0;
  const completed = completedCount || 0;
  const percent = total > 0 ? Math.round((completed / total) * 100) : 0;

  return {
    totalLessons: total,
    completedLessons: completed,
    progressPercent: percent,
    areasProgress: [], // Area breakdown computed separately if needed
  };
}

/**
 * Calculate progress for a specific area
 */
export async function getAreaProgress(areaId: string): Promise<AreaProgress | null> {
  const supabase = await createClient();

  // Get area info
  const { data: area, error: areaError } = await supabase
    .from('areas')
    .select('id, code, name')
    .eq('id', areaId)
    .single();

  if (areaError || !area) {
    console.error('Error fetching area:', areaError);
    return null;
  }

  // Get total lessons in area
  const { count: totalCount, error: totalError } = await supabase
    .from('lessons')
    .select(`
      *,
      topics!inner(area_id)
    `, { count: 'exact', head: true })
    .eq('is_current', true)
    .in('status', ['SOURCE_VALIDATED', 'VERIFIED'])
    .eq('topics.area_id', areaId);

  // Get completed lessons in area
  const { data: completedLessons, error: completedError } = await supabase
    .from('user_lesson_progress')
    .select(`
      lesson_id,
      lessons!inner(
        id,
        topics!inner(area_id)
      )
    `)
    .eq('completed', true)
    .eq('lessons.topics.area_id', areaId);

  if (totalError || completedError) {
    console.error('Error calculating area progress:', { totalError, completedError });
    return null;
  }

  const total = totalCount || 0;
  const completed = completedLessons?.length || 0;
  const percent = total > 0 ? Math.round((completed / total) * 100) : 0;

  return {
    areaId: area.id,
    areaCode: area.code,
    areaName: area.name,
    totalLessons: total,
    completedLessons: completed,
    progressPercent: percent,
  };
}

/**
 * Get last studied lesson (most recently visited)
 * Uses effective_last_visit (COALESCE(last_visited_at, updated_at))
 * Returns null if no progress exists
 */
export async function getLastStudiedLesson() {
  const supabase = await createClient();

  const { data: progressData, error } = await supabase
    .from('user_lesson_progress')
    .select(`
      *,
      lessons!inner(
        id,
        title,
        topics!inner(
          id,
          code,
          areas!inner(name)
        )
      )
    `)
    .order('effective_last_visit', { ascending: false })
    .limit(1)
    .maybeSingle();

  if (error || !progressData) {
    return null;
  }

  const lesson = progressData.lessons;
  const topic = Array.isArray(lesson.topics) ? lesson.topics[0] : lesson.topics;
  const area = Array.isArray(topic.areas) ? topic.areas[0] : topic.areas;

  return {
    progress: progressData as UserLessonProgress,
    lessonId: lesson.id,
    lessonTitle: lesson.title,
    topicCode: topic.code,
    areaName: area.name,
  };
}
