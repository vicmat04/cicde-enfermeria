import Link from "next/link";
import { StudyIcon } from "./StudyIcon";
import type { AreaProgressWithLastTopic } from "@/types/progress";

interface AreaCardProps {
  id: string;
  code: string;
  name: string;
  description: string | null;
  topicCount: number;
  progress?: AreaProgressWithLastTopic | null;
}

export function AreaCard({
  code,
  name,
  topicCount,
  progress,
}: AreaCardProps) {
  const hasProgress = progress && progress.totalLessons > 0;
  const isCompleted = hasProgress && progress.progressPercent === 100;
  const isStarted = hasProgress && progress.completedLessons > 0;
  
  const getCTA = () => {
    if (isCompleted) return "Volver a revisar";
    if (isStarted) return "Continuar";
    return "Comenzar";
  };
  return (
    <Link
      href={`/areas/${code}`}
      className="group block h-full rounded-2xl focus-visible:outline-offset-4"
      aria-label={`Explorar ${name}`}
    >
      <article className="paper-shadow flex h-full min-h-64 flex-col overflow-hidden rounded-2xl border border-[#d9e4e1] bg-[#fffefd] transition duration-200 group-hover:-translate-y-1 group-hover:border-[#9ac7bd] group-hover:shadow-[0_18px_42px_rgba(17,82,75,.13)] motion-reduce:transform-none motion-reduce:transition-none">
        <div className="flex flex-1 flex-col p-6">
          <div className="mb-6 flex items-start justify-between gap-3">
            <span className="grid h-12 w-12 place-items-center rounded-xl bg-[#e5f2ee] text-[#0d706d]">
              <StudyIcon code={code} className="h-6 w-6" />
            </span>
            <span className="rounded-full bg-[#f1f5f3] px-3 py-1 text-xs font-semibold text-[#46615e]">
              {code}
            </span>
          </div>
          <h2 className="text-xl font-bold tracking-tight text-[#173a37]">
            {name}
          </h2>
          
          {hasProgress ? (
            <div className="mt-3 space-y-2">
              {isCompleted && (
                <div className="inline-flex items-center gap-1.5 rounded-full bg-[#d4f1e8] px-2.5 py-1 text-xs font-semibold text-[#0d706d]">
                  <svg className="h-3.5 w-3.5" fill="currentColor" viewBox="0 0 20 20">
                    <path fillRule="evenodd" d="M10 18a8 8 0 100-16 8 8 0 000 16zm3.857-9.809a.75.75 0 00-1.214-.882l-3.483 4.79-1.88-1.88a.75.75 0 10-1.06 1.061l2.5 2.5a.75.75 0 001.137-.089l4-5.5z" clipRule="evenodd" />
                  </svg>
                  Módulo completado
                </div>
              )}
              
              <div className="flex items-center gap-2">
                <div className="text-2xl font-bold text-[#0d706d]">
                  {progress.progressPercent}%
                </div>
                <div className="text-sm text-[#617170]">
                  completado
                </div>
              </div>
              
              <div className="h-1.5 w-full overflow-hidden rounded-full bg-[#e5f2ee]">
                <div 
                  className="h-full rounded-full bg-[#0d706d] transition-all"
                  style={{ width: `${progress.progressPercent}%` }}
                />
              </div>
              
              <p className="text-xs text-[#617170]">
                {progress.completedLessons} de {progress.totalLessons} {progress.totalLessons === 1 ? 'lección completada' : 'lecciones completadas'}
              </p>
              
              {progress.lastTopic && (
                <p className="text-xs text-[#46615e]">
                  <span className="font-medium">Último tema:</span>{" "}
                  {progress.lastTopic.topicTitle}
                </p>
              )}
            </div>
          ) : (
            <p className="mt-3 text-sm leading-6 text-[#617170]">
              Aún no iniciado
            </p>
          )}
        </div>
        <footer className="flex items-center justify-between border-t border-[#e0e9e6] bg-[#fbfcfb] px-6 py-4">
          <span className="text-sm font-medium text-[#46615e]">
            {topicCount} {topicCount === 1 ? "tema activo" : "temas activos"}
          </span>
          <span className="text-sm font-bold text-[#0d706d]">
            {getCTA()} <span aria-hidden="true">→</span>
          </span>
        </footer>
      </article>
    </Link>
  );
}
