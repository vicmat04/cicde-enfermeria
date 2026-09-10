export interface LessonStructureSection {
  id: string;
  title: string;
  body: string;
  sort_order: number;
}

export interface LessonChapter {
  id: string;
  root: LessonStructureSection;
  sections: LessonStructureSection[];
}

export interface LessonSource {
  id: string;
  source_type: string;
  title: string;
  authors: string | null;
  publication_year: number | null;
  url: string | null;
  verified: boolean;
}

export interface SourceWrapper {
  is_primary: boolean;
  usage_note: string | null;
  sources: LessonSource;
}

export interface Lesson {
  id: string;
  title: string;
  summary: string | null;
  status: string;
  version: number;
  is_current: boolean;
  lesson_sections: LessonStructureSection[];
  lesson_sources: SourceWrapper[];
}

export interface LessonShellData {
  summary: string | null;
  status: string;
  version: number;
  lesson_sources: SourceWrapper[];
}

export type LessonSectionKind =
  | "memorize"
  | "errors"
  | "exam"
  | "safety"
  | "priority"
  | "quality"
  | "sources"
  | "standard";

/** Classifies authored titles only; section body content is never inspected. */
export function lessonSectionKind(title: string): LessonSectionKind {
  const normalized = title
    .normalize("NFD")
    .replace(/[\u0300-\u036f]/g, "")
    .toLowerCase();

  if (normalized.includes("que memorizar")) return "memorize";
  if (normalized.includes("errores frecuentes")) return "errors";
  if (
    /\bcasos?\b/.test(normalized) ||
    normalized.includes("situaciones tipo examen")
  ) {
    return "exam";
  }
  if (
    normalized.includes("seguridad") ||
    normalized.includes("importante") ||
    normalized.includes("nunca")
  ) {
    return "safety";
  }
  if (normalized.includes("prioridad") || normalized.includes("clave")) {
    return "priority";
  }
  if (normalized.includes("control de calidad")) return "quality";
  if (normalized.includes("fuentes")) return "sources";
  return "standard";
}

export function isSourcesTitle(title: string) {
  return lessonSectionKind(title) === "sources";
}

const numberedTitle = /^\s*\d+\.\s+\S/;

function isEmptyBody(section: LessonStructureSection) {
  return !section.body.trim();
}

/**
 * Groups authored sections without interpreting or changing their content.
 * Empty-body sections express the primary hierarchy. Numbered titles are used
 * only when no later authored divider exists.
 */
export function buildLessonChapters(
  sections: LessonStructureSection[],
): LessonChapter[] {
  const sortedSections = sections
    .map((section, index) => ({ section, index }))
    .sort(
      (left, right) =>
        left.section.sort_order - right.section.sort_order ||
        left.index - right.index,
    )
    .map(({ section }) => section);

  if (!sortedSections.length) {
    return [];
  }

  const hasAuthoredDividers = sortedSections
    .slice(1)
    .some((section) => isEmptyBody(section));
  const isBoundary = (section: LessonStructureSection, index: number) =>
    index === 0 ||
    (hasAuthoredDividers
      ? isEmptyBody(section)
      : numberedTitle.test(section.title));

  const chapters: LessonChapter[] = [];
  let chapter: LessonChapter | undefined;

  sortedSections.forEach((section, index) => {
    if (isBoundary(section, index)) {
      chapter = { id: section.id, root: section, sections: [] };
      chapters.push(chapter);
      return;
    }

    chapter?.sections.push(section);
  });

  return chapters;
}
