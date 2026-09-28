/**
 * ContinueStudyingCard
 * 
 * Displays last studied lesson with continue button.
 * Helps students resume their study session.
 */

import Link from "next/link";
import type { UserLessonProgress } from "@/types/progress";

interface ContinueStudyingCardProps {
  lastProgress: {
    progress: UserLessonProgress;
    lessonTitle: string;
    topicCode: string;
    areaName: string;
  } | null;
}

export function ContinueStudyingCard({ lastProgress }: ContinueStudyingCardProps) {
  if (!lastProgress) {
    return (
      <div className="rounded-2xl border border-[#d9e4e1] bg-[#fffefd] p-6">
        <p className="text-sm font-semibold text-[#617170]">
          Comienza tu preparación
        </p>
        <p className="mt-2 text-base leading-6 text-[#173a37]">
          Elige un área para comenzar. Tu progreso se guardará automáticamente.
        </p>
      </div>
    );
  }

  const { progress, lessonTitle, topicCode, areaName } = lastProgress;
  const isCompleted = progress.completed;
  
  // Build resume URL with section query param if available
  const lastSectionId = progress.last_section_id;
  const resumeHref = lastSectionId 
    ? `/topics/${topicCode}?section=${lastSectionId}`
    : `/topics/${topicCode}`;

  return (
    <div className="rounded-2xl border border-[#0d706d]/20 bg-gradient-to-br from-[#f0f8f5] to-[#fffefd] p-6">
      <p className="text-sm font-bold uppercase tracking-[.16em] text-[#0d706d]">
        {isCompleted ? "Última completada" : "Continuar estudiando"}
      </p>
      <h3 className="mt-3 text-lg font-bold text-[#173a37]">
        {lessonTitle}
      </h3>
      <p className="mt-1 text-sm text-[#617170]">
        {areaName}
      </p>
      <div className="mt-1 flex items-center gap-2 text-sm">
        {isCompleted ? (
          <span className="inline-flex items-center gap-1 rounded-full bg-[#e6f2ee] px-2 py-0.5 text-xs font-semibold text-[#075957]">
            <span aria-hidden="true">✓</span>
            Completada
          </span>
        ) : (
          <span className="inline-flex items-center gap-1 rounded-full bg-[#fff7e6] px-2 py-0.5 text-xs font-semibold text-[#856404]">
            <span aria-hidden="true">•</span>
            En progreso
          </span>
        )}
      </div>
      <Link
        href={resumeHref}
        className="mt-5 inline-flex items-center gap-2 rounded-xl bg-[#0d706d] px-5 py-2.5 text-sm font-bold text-white transition-colors hover:bg-[#0a5e5c]"
      >
        {isCompleted ? "Revisar" : "Continuar"}
        <span aria-hidden="true">→</span>
      </Link>
    </div>
  );
}
