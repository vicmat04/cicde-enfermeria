import { ContentStatusBadge } from "./ContentStatusBadge";
import { LessonFocusShell } from "./LessonFocusShell";
import { LessonSection, lessonSectionAnchor } from "./LessonSection";
import { LessonSources } from "./LessonSources";

interface Section {
  id: string;
  title: string;
  body: string;
  sort_order: number;
}

interface SourceWrapper {
  is_primary: boolean;
  usage_note: string | null;
  sources: {
    id: string;
    source_type: string;
    title: string;
    authors: string | null;
    publication_year: number | null;
    url: string | null;
    verified: boolean;
  };
}

export interface Lesson {
  id: string;
  title: string;
  summary: string | null;
  status: string;
  version: number;
  is_current: boolean;
  lesson_sections: Section[];
  lesson_sources: SourceWrapper[];
}

interface TableOfContentsProps {
  sections: Section[];
  compact?: boolean;
}

function TableOfContents({ sections, compact = false }: TableOfContentsProps) {
  const links = (
    <ol className={compact ? "mt-3 space-y-1" : "space-y-1"}>
      {sections.map((section, index) => (
        <li key={section.id}>
          <a
            href={`#${lessonSectionAnchor(section.id)}`}
            className="flex min-h-11 items-center rounded-lg px-3 py-2 text-sm leading-5 text-[#526966] hover:bg-[#eaf3f0] hover:text-[#075957]"
          >
            <span className="mr-2 text-xs font-bold text-[#0d706d]">
              {String(index + 1).padStart(2, "0")}
            </span>
            {section.title}
          </a>
        </li>
      ))}
    </ol>
  );

  if (compact) {
    return (
      <details className="rounded-xl border border-[#d5e3df] bg-[#fffefd] p-4 lg:hidden">
        <summary className="cursor-pointer list-none text-sm font-bold text-[#173a37]">
          Índice de la lección
          <span className="float-right text-[#0d706d]" aria-hidden="true">⌄</span>
        </summary>
        {links}
      </details>
    );
  }

  return (
    <aside className="hidden lg:block" aria-label="Índice de la lección">
      <div className="sticky top-24 max-h-[calc(100vh-7rem)] overflow-y-auto rounded-2xl border border-[#d5e3df] bg-[#fffefd] p-4">
        <h3 className="px-3 pb-3 text-sm font-bold uppercase tracking-[.14em] text-[#46615e]">
          En esta lección
        </h3>
        {links}
      </div>
    </aside>
  );
}

interface LessonViewProps {
  lesson: Lesson;
  topicCode?: string;
}

export function LessonView({ lesson, topicCode }: LessonViewProps) {
  const sections = [...(lesson.lesson_sections || [])].sort(
    (a, b) => a.sort_order - b.sort_order,
  );

  return (
    <LessonFocusShell>
      <div className="lesson-toc mb-5 lg:hidden">
        <TableOfContents sections={sections} compact />
      </div>
      <div className="lesson-content-grid grid gap-7 lg:grid-cols-[15rem_minmax(0,1fr)] xl:grid-cols-[17rem_minmax(0,1fr)]">
        <div className="lesson-toc">
          <TableOfContents sections={sections} />
        </div>
        <article className="lesson-article paper-shadow overflow-hidden rounded-3xl border border-[#d5e3df] bg-[#fffefd]">
          <header className="border-b border-[#d9e4e1] bg-[linear-gradient(120deg,#f8fcfa,#eef7f3)] px-5 py-7 sm:px-8 sm:py-9">
            <div className="flex flex-wrap items-center justify-between gap-3">
              <p className="text-sm font-bold uppercase tracking-[.16em] text-[#0d706d]">
                {topicCode ? `${topicCode} · ` : ""}
                Lección actual · versión {lesson.version}
              </p>
              <ContentStatusBadge status={lesson.status} />
            </div>
            <h2 className="mt-4 text-2xl font-bold tracking-tight text-[#173a37] sm:text-3xl">
              {lesson.title}
            </h2>
            {lesson.summary && (
              <p className="mt-4 max-w-3xl text-base leading-7 text-[#526966]">
                {lesson.summary}
              </p>
            )}
            <p className="mt-5 text-sm font-medium text-[#617170]">
              {sections.length} {sections.length === 1 ? "sección" : "secciones"} de lectura
            </p>
          </header>
          <div className="px-5 py-8 sm:px-8 sm:py-10">
            <div className="space-y-10">
              {sections.map((section) => (
                <LessonSection key={section.id} section={section} />
              ))}
            </div>
          </div>
          {lesson.lesson_sources?.length > 0 && (
            <footer className="border-t border-[#d9e4e1] bg-[#f7faf8] px-5 py-7 sm:px-8">
              <h3 className="text-xl font-bold text-[#173a37]">Fuentes de referencia</h3>
              <p className="mt-1 text-sm text-[#617170]">
                Materiales vinculados a esta lección.
              </p>
              <div className="mt-5">
                <LessonSources sources={lesson.lesson_sources} />
              </div>
            </footer>
          )}
        </article>
      </div>
    </LessonFocusShell>
  );
}
