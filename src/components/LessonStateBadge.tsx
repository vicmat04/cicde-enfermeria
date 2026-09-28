/**
 * LessonStateBadge
 * 
 * Visual indicator for lesson progress state.
 * 
 * States:
 * - NOT_STARTED: No progress row exists
 * - IN_PROGRESS: Progress row exists, completed=false
 * - COMPLETED: Progress row exists, completed=true
 */

export type LessonState = "NOT_STARTED" | "IN_PROGRESS" | "COMPLETED";

interface LessonStateBadgeProps {
  state: LessonState;
  compact?: boolean;
}

export function LessonStateBadge({ state, compact = false }: LessonStateBadgeProps) {
  if (state === "NOT_STARTED") {
    return null; // Don't show badge for not started (cleaner UI)
  }

  if (state === "IN_PROGRESS") {
    return (
      <span className="inline-flex items-center gap-1 rounded-full bg-[#fff7e6] px-2 py-0.5 text-xs font-semibold text-[#856404]">
        <span aria-hidden="true">•</span>
        {compact ? "En progreso" : "En progreso"}
      </span>
    );
  }

  // COMPLETED
  return (
    <span className="inline-flex items-center gap-1 rounded-full bg-[#e6f2ee] px-2 py-0.5 text-xs font-semibold text-[#075957]">
      <span aria-hidden="true">✓</span>
      {compact ? "Completada" : "Completada"}
    </span>
  );
}

/**
 * Determine lesson state from progress data
 */
export function getLessonState(progress: { completed: boolean } | null | undefined): LessonState {
  if (!progress) {
    return "NOT_STARTED";
  }
  return progress.completed ? "COMPLETED" : "IN_PROGRESS";
}
