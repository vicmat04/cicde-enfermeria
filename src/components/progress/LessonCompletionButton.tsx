"use client";

/**
 * LessonCompletionButton
 * 
 * Toggle button for marking lesson as complete/incomplete.
 * Connected to real backend via server actions.
 * 
 * States: not completed, completed, saving, error
 */

import { useOptimistic, useTransition } from "react";
import { toggleCompletionAction } from "@/app/topics/[code]/actions";

interface LessonCompletionButtonProps {
  lessonId: string;
  isCompleted: boolean;
}

export function LessonCompletionButton({
  lessonId,
  isCompleted,
}: LessonCompletionButtonProps) {
  const [isPending, startTransition] = useTransition();
  const [optimisticCompleted, setOptimisticCompleted] = useOptimistic(isCompleted);

  const handleToggle = () => {
    startTransition(async () => {
      // Optimistic UI update
      setOptimisticCompleted(!optimisticCompleted);

      // Server action
      const result = await toggleCompletionAction(lessonId, optimisticCompleted);

      if (result.error) {
        console.error('Error toggling completion:', result.error);
        // Optimistic update will revert on re-render
      }
    });
  };

  return (
    <button
      type="button"
      onClick={handleToggle}
      disabled={isPending}
      className={`
        min-h-11 w-full rounded-xl px-5 py-2.5 text-sm font-bold
        transition-colors disabled:cursor-not-allowed disabled:opacity-60
        ${
          optimisticCompleted
            ? "border border-[#75aaa0] bg-[#f0f8f5] text-[#075957] hover:bg-[#e6f2ee]"
            : "border border-[#0d706d] bg-[#0d706d] text-white hover:bg-[#0a5e5c]"
        }
      `}
    >
      {isPending ? (
        <span className="flex items-center justify-center gap-2">
          <span
            className="inline-block h-4 w-4 animate-spin rounded-full border-2 border-current border-t-transparent"
            aria-hidden="true"
          />
          Guardando…
        </span>
      ) : optimisticCompleted ? (
        <span className="flex items-center justify-center gap-2">
          <span aria-hidden="true">✓</span>
          Lección completada
        </span>
      ) : (
        "Marcar como completada"
      )}
    </button>
  );
}
