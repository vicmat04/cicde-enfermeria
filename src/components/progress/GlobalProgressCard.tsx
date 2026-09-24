/**
 * GlobalProgressCard
 * 
 * Displays global progress stats on dashboard.
 * Accepts progress data via props (decoupled from backend).
 */

import type { GlobalProgress } from "@/types/progress";

interface GlobalProgressCardProps {
  progress: GlobalProgress | null;
  isLoading?: boolean;
}

export function GlobalProgressCard({ progress, isLoading }: GlobalProgressCardProps) {
  if (isLoading) {
    return (
      <div className="rounded-2xl border border-[#d9e4e1] bg-[#fffefd] p-5">
        <p className="text-sm font-semibold text-[#617170]">
          Tu progreso
        </p>
        <div className="mt-2 h-6 w-32 animate-pulse rounded bg-[#edf1f0]" />
      </div>
    );
  }

  if (!progress) {
    return (
      <div className="rounded-2xl border border-[#d9e4e1] bg-[#fffefd] p-5">
        <p className="text-sm font-semibold text-[#617170]">
          Tu preparación
        </p>
        <p className="mt-2 text-base leading-6 text-[#173a37]">
          Elige un área para comenzar. El progreso se construye lección a
          lección.
        </p>
      </div>
    );
  }

  return (
    <div className="rounded-2xl border border-[#d9e4e1] bg-[#fffefd] p-5">
      <p className="text-sm font-semibold text-[#617170]">
        Tu progreso
      </p>
      <p className="mt-2 text-2xl font-bold text-[#173a37]">
        {progress.completedLessons} / {progress.totalLessons}
      </p>
      <p className="mt-1 text-sm text-[#617170]">
        {progress.progressPercent}% completado
      </p>
      {progress.progressPercent > 0 && (
        <div className="mt-3 h-2 overflow-hidden rounded-full bg-[#edf1f0]">
          <div
            className="h-full rounded-full bg-[#0d706d] transition-all"
            style={{ width: `${progress.progressPercent}%` }}
            role="progressbar"
            aria-valuenow={progress.progressPercent}
            aria-valuemin={0}
            aria-valuemax={100}
            aria-label={`Progreso global: ${progress.progressPercent} por ciento`}
          />
        </div>
      )}
    </div>
  );
}
