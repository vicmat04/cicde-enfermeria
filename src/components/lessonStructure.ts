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
 * Improved navigation derivation that exposes meaningful structure
 * across diverse lesson formats.
 * 
 * Strategy:
 * 1. Authored dividers (empty body sections) create primary chapters
 * 2. When no dividers exist, numbered sections become navigation items
 * 3. When neither exists, expose all titled sections as navigation
 * 4. Filter out non-navigational metadata sections
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

  // Filter out metadata-only sections from navigation
  const navigableSections = sortedSections.filter(section => {
    const normalized = section.title
      .normalize("NFD")
      .replace(/[\u0300-\u036f]/g, "")
      .toLowerCase()
      .trim();
    // Keep most sections, filter only clear metadata
    if (normalized.includes("estado academico del paquete")) return false;
    if (normalized === "estado para integracion") return false;
    return true;
  });

  if (!navigableSections.length) {
    return [];
  }

  // Check for authored dividers (empty body sections)
  const hasAuthoredDividers = navigableSections
    .slice(1)
    .some((section) => isEmptyBody(section));

  if (hasAuthoredDividers) {
    // Use authored dividers as primary boundaries
    return buildChaptersFromDividers(navigableSections);
  }

  // Check for numbered sections ("1. Title", "2. Title")
  const numberedSections = navigableSections.filter((s, i) => 
    i > 0 && numberedTitle.test(s.title)
  );

  if (numberedSections.length >= 3) {
    // Sufficient numbered structure exists
    return buildChaptersFromNumbered(navigableSections);
  }

  // Fallback: expose titled sections directly as chapters
  // Limit to avoid overwhelming sidebar (max 20 top-level items)
  return buildChaptersFromTitles(navigableSections, 20);
}

function buildChaptersFromDividers(
  sections: LessonStructureSection[],
): LessonChapter[] {
  const chapters: LessonChapter[] = [];
  let chapter: LessonChapter | undefined;

  sections.forEach((section, index) => {
    if (index === 0 || isEmptyBody(section)) {
      chapter = { id: section.id, root: section, sections: [] };
      chapters.push(chapter);
      return;
    }
    chapter?.sections.push(section);
  });

  return chapters;
}

function buildChaptersFromNumbered(
  sections: LessonStructureSection[],
): LessonChapter[] {
  const chapters: LessonChapter[] = [];
  let chapter: LessonChapter | undefined;

  sections.forEach((section, index) => {
    if (index === 0 || numberedTitle.test(section.title)) {
      chapter = { id: section.id, root: section, sections: [] };
      chapters.push(chapter);
      return;
    }
    chapter?.sections.push(section);
  });

  return chapters;
}

function buildChaptersFromTitles(
  sections: LessonStructureSection[],
  maxItems: number,
): LessonChapter[] {
  // For lessons without clear structure, expose all titled sections
  // but limit to avoid overwhelming sidebar
  const toExpose = sections.slice(0, maxItems);
  
  return toExpose.map(section => ({
    id: section.id,
    root: section,
    sections: [],
  }));
}
