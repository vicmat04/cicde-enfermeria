import { createClient } from "@/lib/supabase/server";
import { notFound } from "next/navigation";
import { AppHeader } from "@/components/AppHeader";
import { Breadcrumbs } from "@/components/Breadcrumbs";
import { TopicList } from "@/components/TopicList";

interface AreaPageProps {
  params: Promise<{ code: string }>;
}

export default async function AreaPage({ params }: AreaPageProps) {
  const { code } = await params;
  const supabase = await createClient();
  const {
    data: { user },
  } = await supabase.auth.getUser();

  // Fetch the area
  const { data: area } = await supabase
    .from("areas")
    .select("id, code, name, description")
    .eq("code", code)
    .eq("is_active", true)
    .single();

  if (!area) {
    notFound();
  }

  // Fetch topics for this area
  const { data: topics } = await supabase
    .from("topics")
    .select("id, code, title, description")
    .eq("area_id", area.id)
    .eq("is_active", true)
    .order("sort_order", { ascending: true });

  const breadcrumbs = [
    { name: "Áreas", href: "/dashboard" },
    { name: area.name },
  ];

  return (
    <div className="min-h-screen bg-gray-50">
      <AppHeader user={user} />

      <main className="mx-auto max-w-7xl px-4 py-8 sm:px-6 lg:px-8">
        <Breadcrumbs items={breadcrumbs} />
        
        <div className="mb-8">
          <div className="flex items-center gap-4 mb-2">
            <span className="inline-flex items-center rounded-md bg-indigo-50 px-2.5 py-1.5 text-sm font-medium text-indigo-700 ring-1 ring-inset ring-indigo-700/10">
              {area.code}
            </span>
            <h1 className="text-3xl font-bold tracking-tight text-gray-900">
              {area.name}
            </h1>
          </div>
          {area.description && (
            <p className="mt-2 text-lg text-gray-600">{area.description}</p>
          )}
          <p className="mt-2 text-sm text-gray-500">
            {topics?.length || 0} {(topics?.length === 1) ? "tema" : "temas"} en esta área
          </p>
        </div>

        <TopicList topics={topics || []} />
      </main>
    </div>
  );
}