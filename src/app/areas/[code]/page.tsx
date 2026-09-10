import { notFound } from "next/navigation";
import { AppHeader } from "@/components/AppHeader";
import { Breadcrumbs } from "@/components/Breadcrumbs";
import { StudyIcon } from "@/components/StudyIcon";
import { TopicList } from "@/components/TopicList";
import { createClient } from "@/lib/supabase/server";

interface AreaPageProps {
  params: Promise<{ code: string }>;
}

interface LessonSummary {
  status: string;
  is_current: boolean;
}

function normalizeLessons(
  lessons: LessonSummary | LessonSummary[] | null,
): LessonSummary[] {
  if (!lessons) return [];
  return Array.isArray(lessons) ? lessons : [lessons];
}

export default async function AreaPage({ params }: AreaPageProps) {
  const { code } = await params;
  const supabase = await createClient();
  const {
    data: { user },
  } = await supabase.auth.getUser();
  const { data: area } = await supabase
    .from("areas")
    .select("id, code, name, description")
    .eq("code", code)
    .eq("is_active", true)
    .single();

  if (!area) {
    notFound();
  }

  const { data: topicRows } = await supabase
    .from("topics")
    .select("id, code, title, description, lessons(status, is_current)")
    .eq("area_id", area.id)
    .eq("is_active", true)
    .order("sort_order", { ascending: true });
  const topics = (topicRows || []).map((topic) => {
    const lessons = normalizeLessons(topic.lessons);
    const currentLesson = lessons.find(
      (lesson: { is_current: boolean }) => lesson.is_current,
    );

    return {
      id: topic.id,
      code: topic.code,
      title: topic.title,
      description: topic.description,
      lessonStatus: currentLesson?.status || null,
    };
  });
  const breadcrumbs = [{ name: area.name }];

  return (
    <div className="page-wash min-h-screen">
      <AppHeader user={user} />
      <main className="mx-auto max-w-7xl px-4 py-8 sm:px-6 sm:py-10 lg:px-8">
        <Breadcrumbs items={breadcrumbs} />
        <section
          className="paper-shadow mb-9 overflow-hidden rounded-3xl border border-[#c9ddd7] bg-[#f9fdfb] p-6 sm:p-9"
          aria-labelledby="area-title"
        >
          <div className="flex flex-col gap-5 sm:flex-row sm:items-start">
            <span className="grid h-14 w-14 shrink-0 place-items-center rounded-2xl bg-[#0d706d] text-white">
              <StudyIcon code={area.code} className="h-7 w-7" />
            </span>
            <div>
              <p className="text-sm font-bold uppercase tracking-[.16em] text-[#0d706d]">
                Área {area.code}
              </p>
              <h1
                id="area-title"
                className="mt-1 text-3xl font-bold tracking-tight text-[#173a37] sm:text-4xl"
              >
                {area.name}
              </h1>
              {area.description && (
                <p className="mt-3 max-w-3xl text-lg leading-8 text-[#526966]">
                  {area.description}
                </p>
              )}
              <p className="mt-5 inline-flex rounded-full bg-[#e6f2ee] px-3 py-1.5 text-sm font-bold text-[#075957]">
                {topics.length} {topics.length === 1 ? "tema disponible" : "temas disponibles"}
              </p>
            </div>
          </div>
        </section>
        <section aria-labelledby="topics-title">
          <h2 id="topics-title" className="mb-4 text-xl font-bold text-[#173a37]">
            Unidades de aprendizaje
          </h2>
          <TopicList topics={topics} />
        </section>
      </main>
    </div>
  );
}
