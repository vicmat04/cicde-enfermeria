import { LessonBody } from "./LessonBody";

interface LessonSectionProps {
  section: {
    id: string;
    title: string;
    body: string;
    sort_order: number;
  };
}

type SectionKind =
  | "memorize"
  | "errors"
  | "exam"
  | "safety"
  | "priority"
  | "quality"
  | "sources"
  | "standard";

const sectionVariants: Record<Exclude<SectionKind, "standard">, string> = {
  memorize: "border-[#b8acd5] bg-[#faf8ff]",
  errors: "border-[#d9aaa2] bg-[#fff9f7]",
  exam: "border-[#d9ae61] bg-[#fffaf0]",
  safety: "border-[#75aaa0] bg-[#f0f8f5]",
  priority: "border-[#9ab9d0] bg-[#f4f9fc]",
  quality: "border-[#a9beb9] bg-[#f6faf9]",
  sources: "border-[#c4b0cc] bg-[#fbf8fc]",
};

const sectionAccents: Record<SectionKind, string> = {
  memorize: "bg-[#8975ad]",
  errors: "bg-[#b9675c]",
  exam: "bg-[#c68c2b]",
  safety: "bg-[#0d706d]",
  priority: "bg-[#4f819d]",
  quality: "bg-[#5c817a]",
  sources: "bg-[#8a6894]",
  standard: "bg-[#b8cdc8]",
};

function sectionKind(title: string): SectionKind {
  const normalized = title
    .normalize("NFD")
    .replace(/[\u0300-\u036f]/g, "")
    .toLowerCase();

  if (normalized.includes("que memorizar")) {
    return "memorize";
  }
  if (normalized.includes("errores frecuentes")) {
    return "errors";
  }
  if (normalized.includes("situaciones tipo examen")) {
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
  if (normalized.includes("control de calidad")) {
    return "quality";
  }
  if (normalized.includes("fuentes")) {
    return "sources";
  }

  return "standard";
}

export function lessonSectionAnchor(id: string) {
  return `section-${id}`;
}

export function LessonSection({ section }: LessonSectionProps) {
  const kind = sectionKind(section.title);
  const isChapterDivider = !section.body.trim();
  const isSpecial = kind !== "standard";
  const sectionClassName = isChapterDivider
    ? "lesson-chapter-divider border-y border-[#b9d0ca] bg-[#f5faf7] py-6 sm:py-8"
    : isSpecial
      ? `rounded-2xl border p-5 sm:p-6 ${sectionVariants[kind]}`
      : "border-t border-[#d9e4e1] pt-9";

  return (
    <section
      id={lessonSectionAnchor(section.id)}
      className={`lesson-anchor ${sectionClassName}`}
      aria-labelledby={`heading-${section.id}`}
      data-section-kind={kind}
      data-chapter-divider={isChapterDivider || undefined}
    >
      <div className="flex gap-3">
        <span
          className={`mt-1 h-7 w-1 shrink-0 rounded-full ${
            isChapterDivider ? "bg-[#0d706d]" : sectionAccents[kind]
          }`}
          aria-hidden="true"
        />
        <div>
          <p className="text-xs font-bold uppercase tracking-[.16em] text-[#617170]">
            {isChapterDivider ? "Capítulo" : `Sección ${section.sort_order}`}
          </p>
          <h3
            id={`heading-${section.id}`}
            className={`mt-1 font-bold tracking-tight text-[#173a37] ${
              isChapterDivider ? "text-2xl sm:text-3xl" : "text-xl sm:text-2xl"
            }`}
          >
            {section.title}
          </h3>
        </div>
      </div>
      {!isChapterDivider && <div className="mt-5"><LessonBody body={section.body} /></div>}
    </section>
  );
}
