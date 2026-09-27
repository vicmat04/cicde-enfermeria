"use client";

import {
  useEffect,
  useRef,
  useState,
  type Dispatch,
  type RefObject,
  type SetStateAction,
} from "react";
import { updateLastSectionAction } from "@/app/topics/[code]/actions";
import { ContentStatusBadge } from "./ContentStatusBadge";
import { LessonBody } from "./LessonBody";
import { LessonSection, lessonSectionAnchor } from "./LessonSection";
import { LessonSources } from "./LessonSources";
import {
  isSourcesTitle,
  lessonSectionKind,
  type LessonChapter,
  type LessonSectionKind,
  type LessonShellData,
  type LessonStructureSection,
  type SourceWrapper,
} from "./lessonStructure";
import { normalizeNavigationLabel } from "@/lib/normalizeLabel";

type ReaderMode = "study" | "full";

interface LessonStudyShellProps {
  lessonId: string;
  areaName: string;
  topicCode: string;
  topicTitle: string;
  topicDescription: string | null;
  lesson: LessonShellData;
  chapters: LessonChapter[];
  sectionCount: number;
  initialSectionId?: string | null;
}

const studySectionVariants = {
  memorize: "border-[#b8acd5] bg-[#faf8ff]",
  errors: "border-[#d9aaa2] bg-[#fff9f7]",
  exam: "border-[#d9ae61] bg-[#fffaf0]",
  safety: "border-[#75aaa0] bg-[#f0f8f5]",
  priority: "border-[#9ab9d0] bg-[#f4f9fc]",
  quality: "border-[#a9beb9] bg-[#f6faf9]",
  sources: "border-[#c4b0cc] bg-[#fbf8fc]",
} as const satisfies Record<Exclude<LessonSectionKind, "standard">, string>;

function totalVisitableUnits(chapters: LessonChapter[]) {
  return chapters.reduce(
    (total, chapter) =>
      total + (chapter.sections.length > 0 ? chapter.sections.length : 1),
    0,
  );
}

function studyOpenSections(chapter: LessonChapter) {
  if (isSourcesTitle(chapter.root.title)) {
    return new Set<string>();
  }

  const firstReadable = chapter.sections.find(
    (section) => lessonSectionKind(section.title) !== "sources",
  );
  return new Set(firstReadable ? [firstReadable.id] : []);
}

function scrollTo(element: HTMLElement | null) {
  if (!element) return;
  const reducedMotion = window.matchMedia(
    "(prefers-reduced-motion: reduce)",
  ).matches;
  element.scrollIntoView({
    behavior: reducedMotion ? "auto" : "smooth",
    block: "start",
  });
}

function findSectionElement(sectionId: string) {
  return document.querySelector<HTMLElement>(
    `[id="${lessonSectionAnchor(sectionId)}"]`,
  );
}

function studyRootSectionClassName(kind: LessonSectionKind) {
  if (kind === "standard") {
    return "border-b border-[#d9e4e1] pb-7";
  }

  return "rounded-2xl border border-[#b8acd5] bg-[#faf8ff] p-5 sm:p-6";
}

function studySubsectionClassName(kind: LessonSectionKind) {
  if (kind === "standard") {
    return "border-b border-[#d9e4e1]";
  }

  return `rounded-2xl border ${studySectionVariants[kind]}`;
}

function sourcePlacementChapterIndex(chapters: LessonChapter[]) {
  const sourceChapterIndex = chapters.findIndex((chapter) =>
    isSourcesTitle(chapter.root.title),
  );
  if (sourceChapterIndex >= 0) {
    return sourceChapterIndex;
  }

  return Math.max(0, chapters.length - 1);
}

function modeButtonClassName(isActive: boolean) {
  if (isActive) {
    return "min-h-11 flex-1 rounded-lg bg-[#0d706d] px-3 text-sm font-bold text-white";
  }

  return "min-h-11 flex-1 rounded-lg px-3 text-sm font-bold text-[#526966]";
}

function indexButtonClassName(isActive: boolean) {
  if (isActive) {
    return "flex min-h-11 w-full items-center gap-2 rounded-lg bg-[#dff0eb] px-3 py-2 text-left text-sm font-bold leading-5 text-[#075957] transition-colors motion-reduce:transition-none";
  }

  return "flex min-h-11 w-full items-center gap-2 rounded-lg px-3 py-2 text-left text-sm leading-5 text-[#526966] transition-colors hover:bg-[#eaf3f0] hover:text-[#075957] motion-reduce:transition-none";
}

function indexIndicatorClassName(isActive: boolean, wasVisited: boolean) {
  const base =
    "flex h-5 w-5 shrink-0 items-center justify-center rounded-full border text-xs";
  if (isActive) {
    return `${base} border-[#0d706d] bg-[#0d706d] text-white`;
  }
  if (wasVisited) {
    return `${base} border-[#75aaa0] bg-[#f0f8f5] text-[#075957]`;
  }

  return `${base} border-[#9bb4ae] text-transparent`;
}

function indexChapterDescription(isActive: boolean, wasVisited: boolean) {
  if (isActive) {
    return "Capítulo actual: ";
  }
  if (wasVisited) {
    return "Capítulo visitado: ";
  }

  return "Capítulo sin visitar: ";
}

function ChapterIndex({
  chapters,
  activeIndex,
  visited,
  onSelect,
}: {
  chapters: LessonChapter[];
  activeIndex: number;
  visited: Set<string>;
  onSelect: (index: number) => void;
}) {
  return (
    <ol className="space-y-1">
      {chapters.map((chapter, index) => {
        const active = index === activeIndex;
        const wasVisited = visited.has(chapter.id);
        return (
          <li key={chapter.id}>
            <button
              type="button"
              onClick={() => onSelect(index)}
              aria-current={active ? "step" : undefined}
              data-lesson-index-button={index}
              className={indexButtonClassName(active)}
            >
              <span
                className={indexIndicatorClassName(active, wasVisited)}
                aria-hidden="true"
              >
                {wasVisited && !active ? "✓" : "•"}
              </span>
              <span>
                <span className="sr-only">
                  {indexChapterDescription(active, wasVisited)}
                </span>
                {normalizeNavigationLabel(chapter.root.title)}
              </span>
            </button>
          </li>
        );
      })}
    </ol>
  );
}

function focusActiveIndexButton(
  indexContainer: HTMLElement | null,
  activeIndex: number,
) {
  indexContainer
    ?.querySelector<HTMLButtonElement>(
      `button[data-lesson-index-button="${activeIndex}"]`,
    )
    ?.focus({ preventScroll: true });
}

function SourcesDisclosure({
  sources,
  open,
  onToggle,
  expanded,
}: {
  sources: SourceWrapper[];
  open: boolean;
  onToggle: () => void;
  expanded: boolean;
}) {
  if (!sources.length) return null;
  if (expanded) {
    return (
      <section
        className="mt-8 border-t border-[#d9e4e1] pt-7"
        aria-labelledby="lesson-sources-heading"
      >
        <h3
          id="lesson-sources-heading"
          className="text-xl font-bold text-[#173a37]"
        >
          Fuentes de referencia
        </h3>
        <p className="mt-1 text-sm text-[#617170]">
          Materiales vinculados a esta lección.
        </p>
        <div className="mt-5">
          <LessonSources sources={sources} />
        </div>
      </section>
    );
  }

  const contentId = "lesson-reference-sources";
  return (
    <section className="mt-8 border-t border-[#d9e4e1] pt-5">
      <button
        type="button"
        onClick={onToggle}
        aria-expanded={open}
        aria-controls={contentId}
        className="flex min-h-11 w-full items-center justify-between rounded-lg px-1 text-left font-bold text-[#173a37] hover:text-[#075957]"
      >
        <span>Fuentes de referencia</span>
        <span aria-hidden="true">{open ? "−" : "+"}</span>
      </button>
      {open && (
        <div id={contentId} className="mt-4">
          <LessonSources sources={sources} />
        </div>
      )}
    </section>
  );
}

function StudySection({
  section,
  open,
  onToggle,
  caseLabel,
}: {
  section: LessonStructureSection;
  open: boolean;
  onToggle: () => void;
  caseLabel?: string;
}) {
  const kind = lessonSectionKind(section.title);
  const contentId = `study-section-${section.id}`;
  return (
    <section
      className={studySubsectionClassName(kind)}
      aria-labelledby={`study-heading-${section.id}`}
    >
      <h3 id={`study-heading-${section.id}`}>
        <button
          type="button"
          onClick={onToggle}
          aria-expanded={open}
          aria-controls={contentId}
          className="flex min-h-11 w-full items-center justify-between gap-4 px-4 py-3 text-left sm:px-5"
        >
          <span>
            {caseLabel && (
              <span className="mb-1 block text-xs font-bold uppercase tracking-[.14em] text-[#805c1d]">
                {caseLabel}
              </span>
            )}
            <span className="font-bold text-[#173a37]">{section.title}</span>
          </span>
          <span className="text-xl text-[#0d706d]" aria-hidden="true">
            {open ? "−" : "+"}
          </span>
        </button>
      </h3>
      {open && (
        <div id={contentId} className="px-4 pb-5 sm:px-5">
          <LessonBody body={section.body} />
        </div>
      )}
    </section>
  );
}

function ReadingProgress({
  activeIndex,
  chapterCount,
  visitedCount,
  totalUnits,
}: {
  activeIndex: number;
  chapterCount: number;
  visitedCount: number;
  totalUnits: number;
}) {
  const readingProgress =
    totalUnits === 0 ? 0 : Math.round((visitedCount / totalUnits) * 100);

  return (
    <div className="lesson-reading-progress sticky top-16 z-20 border-b border-[#d9e4e1] bg-[#fffefd] px-4 py-4 sm:px-8 sm:py-5">
      <div className="rounded-2xl border border-[#cce8df] bg-[#f4f9fc] p-4 shadow-sm sm:px-6 sm:py-5">
        <div className="flex flex-col gap-3">
          <div className="flex flex-wrap items-end justify-between gap-x-4 gap-y-2 text-sm text-[#526966]">
            <div className="flex flex-wrap items-baseline gap-x-3 gap-y-1">
              <span className="font-bold text-[#173a37]">
                Avance de lectura
              </span>
              <span className="font-medium">
                {visitedCount} / {totalUnits} revisadas · {readingProgress}%
              </span>
            </div>
            <span className="shrink-0 font-medium">
              Capítulo {activeIndex + 1} de {chapterCount}
            </span>
          </div>
          <progress
            className="lesson-progress-bar h-1.5 w-full rounded-full"
            aria-label={`Avance de lectura: ${visitedCount} de ${totalUnits} unidades revisadas, ${readingProgress} por ciento`}
            max={totalUnits}
            value={visitedCount}
          />
        </div>
      </div>
    </div>
  );
}

function caseLabelForSection(
  section: LessonStructureSection,
  caseSections: LessonStructureSection[],
) {
  const casePosition = caseSections.findIndex((item) => item.id === section.id);
  if (casePosition < 0 || caseSections.length <= 1) {
    return undefined;
  }

  return `Caso ${casePosition + 1} de ${caseSections.length}`;
}

function StudyChapterView({
  activeChapter,
  activeIndex,
  chapterCount,
  openSections,
  sources,
  sourcesOpen,
  showSources,
  onToggleSection,
  onExpandAll,
  onCollapseAll,
  onToggleSources,
  onPrevious,
  onNext,
  onReturnToIndex,
}: {
  activeChapter: LessonChapter;
  activeIndex: number;
  chapterCount: number;
  openSections: Set<string>;
  sources: SourceWrapper[];
  sourcesOpen: boolean;
  showSources: boolean;
  onToggleSection: (sectionId: string) => void;
  onExpandAll: () => void;
  onCollapseAll: () => void;
  onToggleSources: () => void;
  onPrevious: () => void;
  onNext: () => void;
  onReturnToIndex: () => void;
}) {
  const caseSections = activeChapter.sections.filter(
    (section) => lessonSectionKind(section.title) === "exam",
  );

  return (
    <div className="px-5 pb-8 sm:px-8 sm:pb-10">
      <section
        id={lessonSectionAnchor(activeChapter.root.id)}
        className={studyRootSectionClassName(
          lessonSectionKind(activeChapter.root.title),
        )}
        aria-labelledby={`chapter-${activeChapter.id}`}
      >
        <p className="text-xs font-bold uppercase tracking-[.16em] text-[#617170]">
          Capítulo {activeIndex + 1}
        </p>
        <h2
          id={`chapter-${activeChapter.id}`}
          className="mt-1 text-2xl font-bold tracking-tight text-[#173a37] sm:text-3xl"
        >
          {activeChapter.root.title}
        </h2>
        {activeChapter.root.body.trim() && (
          <div className="mt-5">
            <LessonBody body={activeChapter.root.body} />
          </div>
        )}
      </section>
      {activeChapter.sections.length > 0 && (
        <div className="mt-6">
          <div className="mb-3 flex flex-wrap justify-end gap-2">
            <button
              type="button"
              onClick={onExpandAll}
              className="min-h-11 rounded-lg px-3 text-sm font-bold text-[#075957] hover:bg-[#eaf3f0]"
            >
              Expandir todo
            </button>
            <button
              type="button"
              onClick={onCollapseAll}
              className="min-h-11 rounded-lg px-3 text-sm font-bold text-[#075957] hover:bg-[#eaf3f0]"
            >
              Contraer todo
            </button>
          </div>
          <div className="space-y-3">
            {activeChapter.sections.map((section) => (
              <StudySection
                key={section.id}
                section={section}
                open={openSections.has(section.id)}
                onToggle={() => onToggleSection(section.id)}
                caseLabel={caseLabelForSection(section, caseSections)}
              />
            ))}
          </div>
        </div>
      )}
      {showSources && (
        <SourcesDisclosure
          sources={sources}
          open={sourcesOpen}
          onToggle={onToggleSources}
          expanded={false}
        />
      )}
      <nav
        className="lesson-study-controls mt-9 flex flex-wrap items-center justify-between gap-3 border-t border-[#d9e4e1] pt-6"
        aria-label="Navegación entre capítulos"
      >
        <button
          type="button"
          disabled={activeIndex === 0}
          onClick={onPrevious}
          className="min-h-11 rounded-lg border border-[#bdd0cb] px-4 text-sm font-bold text-[#173a37] disabled:cursor-not-allowed disabled:opacity-45"
        >
          Anterior
        </button>
        <button
          type="button"
          onClick={onReturnToIndex}
          className="min-h-11 rounded-lg px-4 text-sm font-bold text-[#075957] hover:bg-[#eaf3f0]"
        >
          Volver al índice
        </button>
        <button
          type="button"
          disabled={activeIndex === chapterCount - 1}
          onClick={onNext}
          className="min-h-11 rounded-lg border border-[#bdd0cb] px-4 text-sm font-bold text-[#173a37] disabled:cursor-not-allowed disabled:opacity-45"
        >
          Siguiente
        </button>
      </nav>
    </div>
  );
}

function FullReadingView({
  chapters,
  sources,
}: {
  chapters: LessonChapter[];
  sources: SourceWrapper[];
}) {
  return (
    <div className="px-5 pb-8 sm:px-8 sm:pb-10">
      <p className="mb-8 text-sm leading-6 text-[#526966]">
        Lectura completa muestra toda la lección de forma continua para buscar,
        revisar o imprimir.
      </p>
      <div className="space-y-10">
        {chapters.map((chapter) => (
          <div key={chapter.id} className="space-y-8">
            <LessonSection section={chapter.root} headingLevel="h2" />
            {chapter.sections.map((section) => (
              <LessonSection
                key={section.id}
                section={section}
                headingLevel="h3"
              />
            ))}
          </div>
        ))}
      </div>
      <SourcesDisclosure
        sources={sources}
        open
        onToggle={() => undefined}
        expanded
      />
    </div>
  );
}

function ReaderHeader({
  areaName,
  topicCode,
  topicTitle,
  topicDescription,
  lesson,
  sectionCount,
  mode,
  onStudyMode,
  onFullMode,
}: {
  areaName: string;
  topicCode: string;
  topicTitle: string;
  topicDescription: string | null;
  lesson: LessonShellData;
  sectionCount: number;
  mode: ReaderMode;
  onStudyMode: () => void;
  onFullMode: () => void;
}) {
  const description = lesson.summary || topicDescription;
  const sectionLabel = sectionCount === 1 ? "sección" : "secciones";

  return (
    <header className="border-b border-[#d9e4e1] bg-[linear-gradient(120deg,#f8fcfa,#eef7f3)] px-5 py-6 sm:px-8 sm:py-7">
      <div className="flex flex-wrap items-center justify-between gap-3">
        <p className="text-sm font-bold uppercase tracking-[.16em] text-[#0d706d]">
          {areaName} · {topicCode}
        </p>
        <ContentStatusBadge status={lesson.status} />
      </div>
      <h1 className="mt-3 text-2xl font-bold tracking-tight text-[#173a37] sm:text-3xl">
        {topicTitle}
      </h1>
      {description && (
        <p className="mt-3 max-w-3xl text-base leading-7 text-[#526966]">
          {description}
        </p>
      )}
      <p className="mt-4 text-sm font-medium text-[#617170]">
        Versión {lesson.version} · {sectionCount} {sectionLabel}
      </p>
      <div
        className="lesson-mode-selector mt-5 flex rounded-xl border border-[#cbdcd7] bg-[#fffefd] p-1"
        role="group"
        aria-label="Modo de lectura"
      >
        <button
          type="button"
          onClick={onStudyMode}
          aria-pressed={mode === "study"}
          className={modeButtonClassName(mode === "study")}
        >
          Modo estudio
        </button>
        <button
          type="button"
          onClick={onFullMode}
          aria-pressed={mode === "full"}
          className={modeButtonClassName(mode === "full")}
        >
          Lectura completa
        </button>
      </div>
    </header>
  );
}

function useFullReadingChapterObserver(
  chapters: LessonChapter[],
  mode: ReaderMode,
  setActiveIndex: Dispatch<SetStateAction<number>>,
) {
  useEffect(() => {
    if (mode !== "full") return;

    const observer = new IntersectionObserver(
      (entries) => {
        const current = entries
          .filter((entry) => entry.isIntersecting)
          .sort(
            (left, right) =>
              Math.abs(left.boundingClientRect.top) -
              Math.abs(right.boundingClientRect.top),
          )[0];
        if (!current) return;

        const chapterIndex = chapters.findIndex(
          (chapter) =>
            lessonSectionAnchor(chapter.root.id) === current.target.id,
        );
        if (chapterIndex < 0) return;

        setActiveIndex(chapterIndex);
      },
      { rootMargin: "-10% 0px -65% 0px", threshold: 0 },
    );

    chapters.forEach((chapter) => {
      const element = findSectionElement(chapter.root.id);
      if (element) observer.observe(element);
    });

    return () => observer.disconnect();
  }, [chapters, mode, setActiveIndex]);
}

function useFullReadingVisitObserver(
  chapters: LessonChapter[],
  mode: ReaderMode,
  setVisitedUnits: Dispatch<SetStateAction<Set<string>>>,
) {
  useEffect(() => {
    if (mode !== "full") return;

    const elementToUnitId = new Map<Element, string>();
    const observer = new IntersectionObserver(
      (entries) => {
        const newlyVisited = entries
          .filter((entry) => entry.isIntersecting)
          .map((entry) => elementToUnitId.get(entry.target))
          .filter((id): id is string => id !== undefined);

        if (newlyVisited.length > 0) {
          setVisitedUnits((current) => {
            let changed = false;
            const next = new Set(current);
            newlyVisited.forEach((id) => {
              if (!next.has(id)) {
                next.add(id);
                changed = true;
              }
            });
            return changed ? next : current;
          });
        }
      },
      { rootMargin: "-15% 0px -15% 0px", threshold: 0 },
    );

    chapters.forEach((chapter) => {
      const unitIds =
        chapter.sections.length > 0
          ? chapter.sections.map((s) => s.id)
          : [chapter.root.id];

      unitIds.forEach((unitId) => {
        const element = findSectionElement(unitId);
        if (element) {
          elementToUnitId.set(element, unitId);
          observer.observe(element);
        }
      });
    });

    return () => observer.disconnect();
  }, [chapters, mode, setVisitedUnits]);
}

interface ReaderNavigationRefs {
  readerStart: RefObject<HTMLElement | null>;
  mobileIndex: RefObject<HTMLElement | null>;
  desktopIndex: RefObject<HTMLElement | null>;
}

interface ReaderNavigationSetters {
  setMode: Dispatch<SetStateAction<ReaderMode>>;
  setActiveIndex: Dispatch<SetStateAction<number>>;
  setVisited: Dispatch<SetStateAction<Set<string>>>;
  setVisitedUnits: Dispatch<SetStateAction<Set<string>>>;
  setOpenSections: Dispatch<SetStateAction<Set<string>>>;
  setSourcesOpen: Dispatch<SetStateAction<boolean>>;
  setMobileIndexOpen: Dispatch<SetStateAction<boolean>>;
}

function visitChapter(
  chapter: LessonChapter,
  setVisited: Dispatch<SetStateAction<Set<string>>>,
) {
  setVisited((current) => new Set(current).add(chapter.id));
}

function markVisitedUnits(
  chapter: LessonChapter,
  currentOpenSections: Set<string>,
  setVisitedUnits: Dispatch<SetStateAction<Set<string>>>,
) {
  setVisitedUnits((current) => {
    const next = new Set(current);
    if (chapter.sections.length === 0) {
      next.add(chapter.root.id);
    } else {
      currentOpenSections.forEach((id) => next.add(id));
    }
    return next;
  });
}

function activateStudyChapter(
  chapters: LessonChapter[],
  index: number,
  { readerStart }: ReaderNavigationRefs,
  {
    setActiveIndex,
    setVisited,
    setVisitedUnits,
    setOpenSections,
    setSourcesOpen,
    setMobileIndexOpen,
  }: ReaderNavigationSetters,
) {
  const chapter = chapters[index];
  if (!chapter) return;

  setActiveIndex(index);
  visitChapter(chapter, setVisited);
  const opened = studyOpenSections(chapter);
  setOpenSections(opened);
  markVisitedUnits(chapter, opened, setVisitedUnits);
  setSourcesOpen(false);
  setMobileIndexOpen(false);
  window.requestAnimationFrame(() => scrollTo(readerStart.current));
}

interface SelectFromReaderIndexOptions {
  mode: ReaderMode;
  chapters: LessonChapter[];
  index: number;
  refs: ReaderNavigationRefs;
  setters: ReaderNavigationSetters;
}

function selectFromReaderIndex({
  mode,
  chapters,
  index,
  refs,
  setters,
}: SelectFromReaderIndexOptions) {
  if (mode === "study") {
    activateStudyChapter(chapters, index, refs, setters);
    return;
  }

  const chapter = chapters[index];
  if (!chapter) return;

  setters.setActiveIndex(index);
  visitChapter(chapter, setters.setVisited);
  setters.setMobileIndexOpen(false);
  window.requestAnimationFrame(() =>
    scrollTo(findSectionElement(chapter.root.id)),
  );
}

function returnToReaderIndex(
  activeIndex: number,
  { mobileIndex, desktopIndex }: ReaderNavigationRefs,
  setMobileIndexOpen: Dispatch<SetStateAction<boolean>>,
) {
  const isDesktop = window.matchMedia("(min-width: 1024px)").matches;
  if (isDesktop) {
    focusActiveIndexButton(desktopIndex.current, activeIndex);
    return;
  }

  setMobileIndexOpen(true);
  window.requestAnimationFrame(() => {
    scrollTo(mobileIndex.current);
    focusActiveIndexButton(mobileIndex.current, activeIndex);
  });
}

function returnToStudyMode(
  mode: ReaderMode,
  activeChapter: LessonChapter | undefined,
  { readerStart }: ReaderNavigationRefs,
  {
    setMode,
    setVisited,
    setVisitedUnits,
    setOpenSections,
    setSourcesOpen,
    setMobileIndexOpen,
  }: ReaderNavigationSetters,
) {
  if (mode !== "full" || !activeChapter) return;

  setMode("study");
  visitChapter(activeChapter, setVisited);
  const opened = studyOpenSections(activeChapter);
  setOpenSections(opened);
  markVisitedUnits(activeChapter, opened, setVisitedUnits);
  setSourcesOpen(false);
  setMobileIndexOpen(false);
  window.requestAnimationFrame(() => scrollTo(readerStart.current));
}

function toggledSectionSet(current: Set<string>, sectionId: string) {
  const next = new Set(current);
  if (next.has(sectionId)) {
    next.delete(sectionId);
  } else {
    next.add(sectionId);
  }
  return next;
}

function toggleStudySection(
  sectionId: string,
  openSections: Set<string>,
  setOpenSections: Dispatch<SetStateAction<Set<string>>>,
  setVisitedUnits: Dispatch<SetStateAction<Set<string>>>,
) {
  const isOpening = !openSections.has(sectionId);
  setOpenSections((current) => toggledSectionSet(current, sectionId));
  if (isOpening) {
    setVisitedUnits((current) => new Set(current).add(sectionId));
  }
}

function expandStudySections(
  activeChapter: LessonChapter | undefined,
  setOpenSections: Dispatch<SetStateAction<Set<string>>>,
  setVisitedUnits: Dispatch<SetStateAction<Set<string>>>,
) {
  if (!activeChapter) return;
  const sectionIds = activeChapter.sections.map((section) => section.id);
  setOpenSections(new Set(sectionIds));
  setVisitedUnits((current) => {
    const next = new Set(current);
    sectionIds.forEach((id) => next.add(id));
    return next;
  });
}

function collapseStudySections(
  setOpenSections: Dispatch<SetStateAction<Set<string>>>,
) {
  setOpenSections(new Set());
}

function toggleDisclosure(setOpen: Dispatch<SetStateAction<boolean>>) {
  setOpen((open) => !open);
}

function closeDisclosure(setOpen: Dispatch<SetStateAction<boolean>>) {
  setOpen(false);
}

function enableFullReading(setMode: Dispatch<SetStateAction<ReaderMode>>) {
  setMode("full");
}

interface CreateReaderNavigationActionsOptions {
  chapters: LessonChapter[];
  mode: ReaderMode;
  activeIndex: number;
  activeChapter: LessonChapter | undefined;
  openSections: Set<string>;
  refs: ReaderNavigationRefs;
  setters: ReaderNavigationSetters;
}

function createReaderNavigationActions({
  chapters,
  mode,
  activeIndex,
  activeChapter,
  openSections,
  refs,
  setters,
}: CreateReaderNavigationActionsOptions) {
  return {
    activateStudyChapter: (index: number) =>
      activateStudyChapter(chapters, index, refs, setters),
    selectFromIndex: (index: number) =>
      selectFromReaderIndex({ mode, chapters, index, refs, setters }),
    returnToIndex: () =>
      returnToReaderIndex(activeIndex, refs, setters.setMobileIndexOpen),
    returnToStudyMode: () =>
      returnToStudyMode(mode, activeChapter, refs, setters),
    toggleSection: (sectionId: string) =>
      toggleStudySection(
        sectionId,
        openSections,
        setters.setOpenSections,
        setters.setVisitedUnits,
      ),
    expandAllSections: () =>
      expandStudySections(
        activeChapter,
        setters.setOpenSections,
        setters.setVisitedUnits,
      ),
    collapseAllSections: () => collapseStudySections(setters.setOpenSections),
    toggleSources: () => toggleDisclosure(setters.setSourcesOpen),
    toggleMobileIndex: () => toggleDisclosure(setters.setMobileIndexOpen),
    closeMobileIndex: () => closeDisclosure(setters.setMobileIndexOpen),
    setFullMode: () => enableFullReading(setters.setMode),
  };
}

function useReaderNavigation(
  chapters: LessonChapter[],
  refs: ReaderNavigationRefs,
  startingIndex: number,
) {
  const [mode, setMode] = useState<ReaderMode>("study");
  const [activeIndex, setActiveIndex] = useState(startingIndex);
  const [visited, setVisited] = useState(() => new Set<string>());
  const [openSections, setOpenSections] = useState(() => {
    const chapter = chapters[startingIndex] || chapters[0];
    return chapter ? studyOpenSections(chapter) : new Set<string>();
  });
  const [visitedUnits, setVisitedUnits] = useState(() => {
    const initial = new Set<string>();
    const chapter = chapters[startingIndex] || chapters[0];
    if (chapter) {
      const opened = studyOpenSections(chapter);
      if (chapter.sections.length === 0) {
        initial.add(chapter.root.id);
      } else {
        opened.forEach((id) => initial.add(id));
      }
    }
    return initial;
  });
  const [sourcesOpen, setSourcesOpen] = useState(false);
  const [mobileIndexOpen, setMobileIndexOpen] = useState(false);
  const activeChapter = chapters[activeIndex];
  const setters = {
    setMode,
    setActiveIndex,
    setVisited,
    setVisitedUnits,
    setOpenSections,
    setSourcesOpen,
    setMobileIndexOpen,
  };

  useFullReadingChapterObserver(chapters, mode, setActiveIndex);
  useFullReadingVisitObserver(chapters, mode, setters.setVisitedUnits);

  return {
    mode,
    activeIndex,
    visited,
    visitedUnits,
    totalUnits: totalVisitableUnits(chapters),
    openSections,
    sourcesOpen,
    mobileIndexOpen,
    activeChapter,
    ...createReaderNavigationActions({
      chapters,
      mode,
      activeIndex,
      activeChapter,
      openSections,
      refs,
      setters,
    }),
  };
}

export function LessonStudyShell({
  lessonId,
  areaName,
  topicCode,
  topicTitle,
  topicDescription,
  lesson,
  chapters,
  sectionCount,
  initialSectionId,
}: LessonStudyShellProps) {
  // Resume: find chapter containing initialSectionId if provided
  const resumeChapterIndex = initialSectionId
    ? chapters.findIndex(
        (chapter) =>
          chapter.root.id === initialSectionId ||
          chapter.sections.some((s) => s.id === initialSectionId)
      )
    : -1;
  
  const startingChapterIndex = resumeChapterIndex >= 0 ? resumeChapterIndex : 0;
  const readerStart = useRef<HTMLElement>(null);
  const mobileIndex = useRef<HTMLElement>(null);
  const desktopIndex = useRef<HTMLElement>(null);
  const reader = useReaderNavigation(
    chapters, 
    {
      readerStart,
      mobileIndex,
      desktopIndex,
    },
    startingChapterIndex
  );
  const sourcePlacementIndex = sourcePlacementChapterIndex(chapters);

  // Persist active section for resume (debounced to avoid excessive writes)
  useEffect(() => {
    if (!reader.activeChapter) return;
    
    // Determine which section to save:
    // - If chapter has subsections and some are open, save first open subsection
    // - Otherwise save chapter root
    let sectionToSave = reader.activeChapter.root.id;
    
    if (reader.activeChapter.sections.length > 0 && reader.openSections.size > 0) {
      const firstOpenSubsection = reader.activeChapter.sections.find(
        (s) => reader.openSections.has(s.id)
      );
      if (firstOpenSubsection) {
        sectionToSave = firstOpenSubsection.id;
      }
    }
    
    // Debounce: save after user settles on a section
    const timeoutId = setTimeout(() => {
      updateLastSectionAction(lessonId, sectionToSave).catch((err) => {
        console.error('Failed to save section progress:', err);
      });
    }, 1500); // 1.5s debounce
    
    return () => clearTimeout(timeoutId);
  }, [lessonId, reader.activeChapter, reader.openSections]);

  // Resume: scroll to initial section after mount
  useEffect(() => {
    if (!initialSectionId) return;
    
    // Wait for DOM to be ready
    const timeoutId = setTimeout(() => {
      const targetElement = findSectionElement(initialSectionId);
      if (targetElement) {
        scrollTo(targetElement);
      }
    }, 100);
    
    return () => clearTimeout(timeoutId);
    // eslint-disable-next-line react-hooks/exhaustive-deps
  }, []); // Only on mount - initialSectionId is stable from server

  if (!reader.activeChapter) return null;

  const index = (
    <ChapterIndex
      chapters={chapters}
      activeIndex={reader.activeIndex}
      visited={reader.visited}
      onSelect={reader.selectFromIndex}
    />
  );

  return (
    <div className="lesson-study-shell">
      <div className="lesson-mobile-index-toggle mb-5 flex flex-wrap items-center justify-between gap-3 lg:hidden">
        <button
          type="button"
          onClick={reader.toggleMobileIndex}
          aria-expanded={reader.mobileIndexOpen}
          aria-controls="lesson-mobile-index"
          className="flex min-h-11 items-center gap-2 rounded-lg border border-[#bdd0cb] bg-[#fffefd] px-4 text-sm font-bold text-[#173a37]"
        >
          <span>Contenido</span>
          <span aria-hidden="true">{reader.mobileIndexOpen ? "⌃" : "⌄"}</span>
        </button>
      </div>
      {reader.mobileIndexOpen && (
        <aside
          ref={mobileIndex}
          id="lesson-mobile-index"
          className="lesson-mobile-index mb-5 rounded-2xl border border-[#d5e3df] bg-[#fffefd] p-4 lg:hidden"
          aria-label="Contenido de la lección"
        >
          <div className="mb-3 flex items-center justify-between gap-3">
            <h2 className="text-sm font-bold uppercase tracking-[.14em] text-[#46615e]">
              Contenido
            </h2>
            <button
              type="button"
              onClick={reader.closeMobileIndex}
              className="min-h-11 rounded-lg px-3 text-sm font-bold text-[#075957]"
            >
              Cerrar
            </button>
          </div>
          {index}
        </aside>
      )}

      <div className="grid gap-7 lg:grid-cols-[15rem_minmax(0,1fr)] xl:grid-cols-[17rem_minmax(0,1fr)]">
        <aside
          ref={desktopIndex}
          className="sticky top-24 hidden h-[calc(100vh-7rem)] self-start overflow-y-auto overscroll-contain rounded-2xl border border-[#d5e3df] bg-[#fffefd] p-4 lg:block"
          aria-label="Índice de la lección"
        >
          <h2 className="px-3 pb-3 text-sm font-bold uppercase tracking-[.14em] text-[#46615e]">
            Contenido
          </h2>
          {index}
        </aside>
        <article
          ref={readerStart}
          className="lesson-reader paper-shadow overflow-clip rounded-3xl border border-[#d5e3df] bg-[#fffefd]"
        >
          <ReaderHeader
            areaName={areaName}
            topicCode={topicCode}
            topicTitle={topicTitle}
            topicDescription={topicDescription}
            lesson={lesson}
            sectionCount={sectionCount}
            mode={reader.mode}
            onStudyMode={reader.returnToStudyMode}
            onFullMode={reader.setFullMode}
          />
          <ReadingProgress
            activeIndex={reader.activeIndex}
            chapterCount={chapters.length}
            visitedCount={reader.visitedUnits.size}
            totalUnits={reader.totalUnits}
          />
          {reader.mode === "study" ? (
            <StudyChapterView
              activeChapter={reader.activeChapter}
              activeIndex={reader.activeIndex}
              chapterCount={chapters.length}
              openSections={reader.openSections}
              sources={lesson.lesson_sources}
              sourcesOpen={reader.sourcesOpen}
              showSources={reader.activeIndex === sourcePlacementIndex}
              onToggleSection={reader.toggleSection}
              onExpandAll={reader.expandAllSections}
              onCollapseAll={reader.collapseAllSections}
              onToggleSources={reader.toggleSources}
              onPrevious={() =>
                reader.activateStudyChapter(reader.activeIndex - 1)
              }
              onNext={() => reader.activateStudyChapter(reader.activeIndex + 1)}
              onReturnToIndex={reader.returnToIndex}
            />
          ) : (
            <FullReadingView
              chapters={chapters}
              sources={lesson.lesson_sources}
            />
          )}
        </article>
      </div>
    </div>
  );
}
