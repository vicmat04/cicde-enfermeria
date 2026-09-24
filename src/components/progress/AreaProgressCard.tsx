/**
 * AreaProgressCard
 * 
 * Displays progress for a specific area.
 * Can be used in dashboard or area page.
 */

import type { AreaProgress } from "@/types/progress";

interface AreaProgressCardProps {
  areaProgress: AreaProgress;
}

export function AreaProgressCard({ areaProgress }: AreaProgressCardProps) {
  const { areaName, completedLessons, totalLessons, progressPercent } = areaProgress;

  return (
    <div className="rounded-2xl border border-[#d9e4e1] bg-[#fffefd] p-4">
      <p className="text-sm font-semibold text-[#173a37]">{areaName}</p>
      <div className="mt-2 flex items-baseline gap-2">
        <p className="text-lg font-bold text-[#173a37]">
          {completedLessons} / {totalLessons}
        </p>
        <p className="text-xs text-[#617170]">
          lecciones
        </p>
      </div>
      {progressPercent > 0 && (
        <div className="mt-2 h-1.5 overflow-hidden rounded-full bg-[#edf1f0]">
          <div
            className="h-full rounded-full bg-[#0d706d]"
            style={{ width: `${progressPercent}%` }}
            role="progressbar"
            aria-valuenow={progressPercent}
            aria-valuemin={0}
            aria-valuemax={100}
            aria-label={`${areaName}: ${progressPercent} por ciento completado`}
          />
        </div>
      )}
    </div>
  );
}
