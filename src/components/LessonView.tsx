import { LessonSection } from "./LessonSection";
import { LessonSources } from "./LessonSources";
import { ContentStatusBadge } from "./ContentStatusBadge";

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

export function LessonView({ lesson }: { lesson: Lesson }) {
  // Sort sections by sort_order
  const sections = [...(lesson.lesson_sections || [])].sort(
    (a, b) => a.sort_order - b.sort_order,
  );

  return (
    <div className="bg-white shadow sm:rounded-lg mb-8">
      <div className="px-4 py-5 sm:p-6 border-b border-gray-200">
        <div className="flex items-center justify-between mb-4">
          <h2 className="text-2xl font-bold leading-7 text-gray-900 sm:truncate sm:tracking-tight">
            {lesson.title}
          </h2>
          <ContentStatusBadge status={lesson.status} />
        </div>
        {lesson.summary && (
          <p className="text-base text-gray-600 mb-4">{lesson.summary}</p>
        )}
      </div>

      <div className="px-4 py-5 sm:p-6 space-y-12">
        {sections.map((section) => (
          <LessonSection key={section.id} section={section} />
        ))}
      </div>

      {lesson.lesson_sources && lesson.lesson_sources.length > 0 && (
        <div className="px-4 py-5 sm:p-6 bg-gray-50 border-t border-gray-200 sm:rounded-b-lg">
          <h3 className="text-lg font-medium leading-6 text-gray-900 mb-4">
            Fuentes de Referencia
          </h3>
          <LessonSources sources={lesson.lesson_sources} />
        </div>
      )}
    </div>
  );
}
