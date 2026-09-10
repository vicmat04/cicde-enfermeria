import { createClient } from "@/lib/supabase/server";
import { notFound } from "next/navigation";
import { AppHeader } from "@/components/AppHeader";
import { Breadcrumbs } from "@/components/Breadcrumbs";
import { EmptyLessonState } from "@/components/EmptyLessonState";
import { LessonView } from "@/components/LessonView";

interface TopicPageProps {
  params: Promise<{ code: string }>;
}

export default async function TopicPage({ params }: TopicPageProps) {
  const { code } = await params;
  const supabase = await createClient();
  const {
    data: { user },
  } = await supabase.auth.getUser();

  // Fetch the topic and its parent area
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
    { name: "Áreas", href: "/dashboard" },
    { name: area.name, href: `/areas/${area.code}` },
    { name: topic.title },
  ];

  // Fetch the lesson
  // We use the regular authenticated client, so RLS fully applies.
  // Student won't see REVIEW lessons. Admin will.
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

  // Fix up Supabase array vs object types for sources
  const lesson = lessonData
    ? {
        ...lessonData,
        lesson_sources: (lessonData.lesson_sources || []).map(
          (ls: {
            is_primary: boolean;
            usage_note: string | null;
            sources: unknown;
          }) => ({
            ...ls,
            sources: Array.isArray(ls.sources) ? ls.sources[0] : ls.sources,
          }),
        ),
      }
    : null;

  return (
    <div className="min-h-screen bg-gray-50">
      <AppHeader user={user} />

      <main className="mx-auto max-w-4xl px-4 py-8 sm:px-6 lg:px-8">
        <Breadcrumbs items={breadcrumbs} />

        <div className="mb-8">
          <div className="flex items-center gap-4 mb-2">
            <span className="inline-flex items-center rounded-md bg-indigo-50 px-2.5 py-1.5 text-sm font-medium text-indigo-700 ring-1 ring-inset ring-indigo-700/10">
              {topic.code}
            </span>
            <h1 className="text-3xl font-bold tracking-tight text-gray-900">
              {topic.title}
            </h1>
          </div>
          {topic.description && (
            <p className="mt-4 text-lg text-gray-600 bg-white p-4 rounded-lg shadow-sm border border-gray-100">
              {topic.description}
            </p>
          )}
        </div>

        {/* Content Section */}
        <section className="mt-8">
          {/* SAFETY: The mapped object strictly matches the Lesson interface shape after resolving Supabase arrays */}
          {lesson ? (
            <LessonView
              lesson={
                lesson as unknown as import("@/components/LessonView").Lesson
              }
            />
          ) : (
            <EmptyLessonState />
          )}
        </section>
      </main>
    </div>
  );
}
