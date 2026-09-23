import { notFound } from "next/navigation";
import { AppHeader } from "@/components/AppHeader";
import { Breadcrumbs } from "@/components/Breadcrumbs";
import { EmptyLessonState } from "@/components/EmptyLessonState";
import { LessonView } from "@/components/LessonView";
import type { Lesson, LessonSource } from "@/components/lessonStructure";
import { createClient } from "@/lib/supabase/server";
import { getUserProfile } from "@/lib/supabase/profiles";

interface TopicPageProps {
  params: Promise<{ code: string }>;
}

function normalizeSourceRelation(
  source: LessonSource | LessonSource[] | null,
): LessonSource | null {
  if (Array.isArray(source)) {
    return source[0] ?? null;
  }

  return source;
}

export default async function TopicPage({ params }: TopicPageProps) {
  const { code } = await params;
  const supabase = await createClient();
  const {
    data: { user },
  } = await supabase.auth.getUser();
  const profile = await getUserProfile();
  const { data: topic } = await supabase
    .from("topics")
    .select(`
      id,
      code,
      title,
      description,
      area_id,
      areas (
        id,
        code,
        name
      )
    `)
    .eq("code", code)
    .eq("is_active", true)
    .single();

  if (!topic) {
    notFound();
  }

  const area = Array.isArray(topic.areas) ? topic.areas[0] : topic.areas;
  if (!area) {
    notFound();
  }

  const breadcrumbs = [
    { name: area.name, href: `/areas/${area.code}` },
    { name: topic.title },
  ];

  // This regular authenticated client leaves visibility entirely under RLS.
  const { data: lessonData } = await supabase
    .from("lessons")
    .select(`
      id,
      title,
      summary,
      status,
      version,
      is_current,
      lesson_sections (
        id,
        title,
        body,
        sort_order
      ),
      lesson_sources (
        is_primary,
        usage_note,
        sources (
          id,
          source_type,
          title,
          authors,
          publication_year,
          url,
          verified
        )
      )
    `)
    .eq("topic_id", topic.id)
    .eq("is_current", true)
    .single();

  const lesson = lessonData
    ? {
        ...lessonData,
        lesson_sources: (lessonData.lesson_sources || []).map(
          (lessonSource) => ({
            ...lessonSource,
            sources: normalizeSourceRelation(lessonSource.sources),
          }),
        ),
      }
    : null;
  // SAFETY: The query selects every LessonView field and normalizes its source relation to one object.
  const renderedLesson = lesson as unknown as Lesson | null;

  return (
    <div className="page-wash min-h-screen">
      <AppHeader user={user} profile={profile} />
      <main className="mx-auto max-w-7xl px-4 py-8 sm:px-6 sm:py-10 lg:px-8">
        <Breadcrumbs items={breadcrumbs} />
        {renderedLesson ? (
          <section aria-label="Contenido de la lección">
            <LessonView
              lesson={renderedLesson}
              areaName={area.name}
              topicCode={topic.code}
              topicTitle={topic.title}
              topicDescription={topic.description}
            />
          </section>
        ) : (
          <section aria-label="Contenido de la lección">
            <header className="mb-8 max-w-4xl" aria-labelledby="topic-title">
              <p className="text-sm font-bold uppercase tracking-[.16em] text-[#0d706d]">
                {area.name} · {topic.code}
              </p>
              <h1
                id="topic-title"
                className="mt-2 text-3xl font-bold tracking-tight text-[#173a37] sm:text-4xl"
              >
                {topic.title}
              </h1>
              {topic.description && (
                <p className="mt-4 text-lg leading-8 text-[#526966]">
                  {topic.description}
                </p>
              )}
            </header>
            <EmptyLessonState />
          </section>
        )}
      </main>
    </div>
  );
}
