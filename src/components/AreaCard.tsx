import Link from "next/link";
import { StudyIcon } from "./StudyIcon";

interface AreaCardProps {
  id: string;
  code: string;
  name: string;
  description: string | null;
  topicCount: number;
}

export function AreaCard({ code, name, description, topicCount }: AreaCardProps) {
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
          <h2 className="text-xl font-bold tracking-tight text-[#173a37]">{name}</h2>
          <p className="mt-3 text-sm leading-6 text-[#617170]">
            {description || "Material organizado para avanzar con una preparación rigurosa."}
          </p>
        </div>
        <footer className="flex items-center justify-between border-t border-[#e0e9e6] bg-[#fbfcfb] px-6 py-4">
          <span className="text-sm font-medium text-[#46615e]">
            {topicCount} {topicCount === 1 ? "tema activo" : "temas activos"}
          </span>
          <span className="text-sm font-bold text-[#0d706d]">
            Explorar <span aria-hidden="true">→</span>
          </span>
        </footer>
      </article>
    </Link>
  );
}
