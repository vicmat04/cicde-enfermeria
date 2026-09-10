import { LessonBody } from "./LessonBody";
import {
  lessonSectionKind,
  type LessonSectionKind,
  type LessonStructureSection,
} from "./lessonStructure";

interface LessonSectionProps {
  section: LessonStructureSection;
  headingLevel?: "h2" | "h3";
}

const sectionVariants = {
  memorize: "border-[#b8acd5] bg-[#faf8ff]",
  errors: "border-[#d9aaa2] bg-[#fff9f7]",
  exam: "border-[#d9ae61] bg-[#fffaf0]",
  safety: "border-[#75aaa0] bg-[#f0f8f5]",
  priority: "border-[#9ab9d0] bg-[#f4f9fc]",
  quality: "border-[#a9beb9] bg-[#f6faf9]",
  sources: "border-[#c4b0cc] bg-[#fbf8fc]",
} as const satisfies Record<Exclude<LessonSectionKind, "standard">, string>;

const sectionAccents = {
  memorize: "bg-[#8975ad]",
  errors: "bg-[#b9675c]",
  exam: "bg-[#c68c2b]",
  safety: "bg-[#0d706d]",
  priority: "bg-[#4f819d]",
  quality: "bg-[#5c817a]",
  sources: "bg-[#8a6894]",
  standard: "bg-[#b8cdc8]",
} as const satisfies Record<LessonSectionKind, string>;

export function lessonSectionAnchor(id: string) {
  return `section-${id}`;
}

function lessonSectionClassName(
  isChapterDivider: boolean,
  kind: LessonSectionKind,
) {
  if (isChapterDivider) {
    return "lesson-chapter-divider border-y border-[#b9d0ca] bg-[#f5faf7] py-6 sm:py-8";
  }

  if (kind === "standard") {
    return "border-t border-[#d9e4e1] pt-9";
  }

  return `rounded-2xl border p-5 sm:p-6 ${sectionVariants[kind]}`;
}

function lessonSectionAccentClassName(
  isChapterDivider: boolean,
  kind: LessonSectionKind,
) {
  if (isChapterDivider) {
    return "bg-[#0d706d]";
  }

  return sectionAccents[kind];
}

function lessonSectionLabel(isChapterDivider: boolean, sortOrder: number) {
  if (isChapterDivider) {
    return "Capítulo";
  }

  return `Sección ${sortOrder}`;
}

function lessonSectionHeadingClassName(isChapterDivider: boolean) {
  if (isChapterDivider) {
    return "text-2xl sm:text-3xl";
  }

  return "text-xl sm:text-2xl";
}

export function LessonSection({
  section,
  headingLevel: Heading = "h3",
}: LessonSectionProps) {
  const kind = lessonSectionKind(section.title);
  const isChapterDivider = !section.body.trim();

  return (
    <section
      id={lessonSectionAnchor(section.id)}
      className={`lesson-anchor ${lessonSectionClassName(isChapterDivider, kind)}`}
      aria-labelledby={`heading-${section.id}`}
      data-section-kind={kind}
      data-chapter-divider={isChapterDivider || undefined}
    >
      <div className="flex gap-3">
        <span
          className={`mt-1 h-7 w-1 shrink-0 rounded-full ${lessonSectionAccentClassName(isChapterDivider, kind)}`}
          aria-hidden="true"
        />
        <div>
          <p className="text-xs font-bold uppercase tracking-[.16em] text-[#617170]">
            {lessonSectionLabel(isChapterDivider, section.sort_order)}
          </p>
          <Heading
            id={`heading-${section.id}`}
            className={`mt-1 font-bold tracking-tight text-[#173a37] ${lessonSectionHeadingClassName(isChapterDivider)}`}
          >
            {section.title}
          </Heading>
        </div>
      </div>
      {!isChapterDivider && (
        <div className="mt-5">
          <LessonBody body={section.body} />
        </div>
      )}
    </section>
  );
}
