import Link from "next/link";
import { ContentStatusBadge } from "./ContentStatusBadge";

interface Topic {
  id: string;
  code: string;
  title: string;
  description: string | null;
  lessonStatus?: string | null;
}

interface TopicListProps {
  topics: Topic[];
}

export function TopicList({ topics }: TopicListProps) {
  if (topics.length === 0) {
    return (
      <div className="rounded-2xl border border-dashed border-[#b5cbc5] bg-[#fffefd]/70 p-12 text-center text-[#617170]">
        No hay temas disponibles para esta área en este momento.
      </div>
    );
  }

  return (
    <ol className="grid gap-3" aria-label="Temas del área">
      {topics.map((topic, index) => (
        <li key={topic.id}>
          <Link
            href={`/topics/${topic.code}`}
            className="group flex min-h-28 items-center gap-4 rounded-2xl border border-[#d9e4e1] bg-[#fffefd] p-4 transition duration-200 hover:-translate-y-0.5 hover:border-[#9ac7bd] hover:shadow-[0_12px_26px_rgba(17,82,75,.1)] motion-reduce:transform-none motion-reduce:transition-none sm:gap-6 sm:p-5"
          >
            <span className="grid h-11 w-11 shrink-0 place-items-center rounded-xl bg-[#eaf3f0] text-sm font-bold text-[#0d706d]">
              {String(index + 1).padStart(2, "0")}
            </span>
            <span className="min-w-0 flex-1">
              <span className="mb-1 block text-xs font-bold uppercase tracking-[.14em] text-[#0d706d]">
                {topic.code}
              </span>
              <span className="block text-lg font-bold text-[#173a37]">
                {topic.title}
              </span>
              {topic.description && (
                <span className="mt-1 block line-clamp-2 text-sm leading-6 text-[#617170]">
                  {topic.description}
                </span>
              )}
            </span>
            <span className="shrink-0 text-right">
              <ContentStatusBadge status={topic.lessonStatus} />
              <span
                className="mt-2 block text-lg text-[#0d706d]"
                aria-hidden="true"
              >
                →
              </span>
            </span>
          </Link>
        </li>
      ))}
    </ol>
  );
}
