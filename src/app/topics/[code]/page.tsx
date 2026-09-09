import { createClient } from "@/lib/supabase/server";
import { notFound } from "next/navigation";
import { AppHeader } from "@/components/AppHeader";
import { Breadcrumbs } from "@/components/Breadcrumbs";
import { EmptyLessonState } from "@/components/EmptyLessonState";

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

  // Next.js Supabase typed join resolution
  // We type cast just for safety if Supabase types aren't fully generated
  const area = Array.isArray(topic.areas) ? topic.areas[0] : topic.areas;

  if (!area) {
    notFound();
  }

  const breadcrumbs = [
    { name: "Áreas", href: "/dashboard" },
    { name: area.name, href: `/areas/${area.code}` },
    { name: topic.title },
  ];

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

        {/* Content Section - Placeholder since lessons don't exist yet */}
        <section className="mt-8">
          <EmptyLessonState />
        </section>
      </main>
    </div>
  );
}