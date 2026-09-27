import { AppHeader } from "@/components/AppHeader";
import { AreaCard } from "@/components/AreaCard";
import { GlobalProgressCard } from "@/components/progress/GlobalProgressCard";
import { AreaProgressCard } from "@/components/progress/AreaProgressCard";
import { createClient } from "@/lib/supabase/server";
import { getUserProfile } from "@/lib/supabase/profiles";
import { getGlobalProgress, getAreaProgress, getLastStudiedLesson } from "@/lib/progress/queries";
import { ContinueStudyingCard } from "@/components/progress/ContinueStudyingCard";

export default async function DashboardPage() {
  const supabase = await createClient();
  const {
    data: { user },
  } = await supabase.auth.getUser();
  const profile = await getUserProfile();
  
  const [{ data: areas }, { data: activeTopics }, globalProgress, lastStudied] = await Promise.all([
    supabase
      .from("areas")
      .select("id, code, name, description")
      .eq("is_active", true)
      .order("sort_order", { ascending: true }),
    supabase.from("topics").select("area_id").eq("is_active", true),
    getGlobalProgress(),
    getLastStudiedLesson(),
  ]);
  
  const topicCounts = (activeTopics || []).reduce<Record<string, number>>(
    (counts, topic) => {
      counts[topic.area_id] = (counts[topic.area_id] || 0) + 1;
      return counts;
    },
    {},
  );
  const totalTopics = activeTopics?.length || 0;

  // Fetch area progress for all areas
  const areaProgressData = await Promise.all(
    (areas || []).map(area => getAreaProgress(area.id))
  );
  const areaProgressMap = new Map(
    areaProgressData
      .filter((p): p is NonNullable<typeof p> => p !== null)
      .map(p => [p.areaId, p])
  );

  return (
    <div className="page-wash min-h-screen">
      <AppHeader user={user} profile={profile} />
      <main className="mx-auto max-w-7xl px-4 py-8 sm:px-6 sm:py-12 lg:px-8">
        <section
          className="paper-shadow relative overflow-hidden rounded-3xl border border-[#c9ddd7] bg-[#f9fdfb] px-6 py-10 sm:px-10 sm:py-14"
          aria-labelledby="dashboard-title"
        >
          <div
            className="absolute -right-16 -top-20 h-64 w-64 rounded-full bg-[#cce8df]/60 blur-3xl"
            aria-hidden="true"
          />
          <div className="relative max-w-2xl">
            <p className="mb-4 text-sm font-bold uppercase tracking-[.18em] text-[#0d706d]">
              Plan de estudio académico
            </p>
            <h1
              id="dashboard-title"
              className="text-4xl font-bold tracking-tight text-[#173a37] sm:text-5xl"
            >
              Prepárate para el CICDE 2026
            </h1>
            <p className="mt-5 max-w-xl text-lg leading-8 text-[#526966]">
              Recorre las áreas activas, estudia a tu ritmo y consulta contenido
              estructurado para una preparación clínica responsable.
            </p>
          </div>
        </section>

        <section
          className="mt-8 grid gap-4 sm:grid-cols-2 lg:grid-cols-3"
          aria-label="Resumen de preparación"
        >
          <div className="rounded-2xl border border-[#d9e4e1] bg-[#fffefd] p-5">
            <p className="text-sm font-semibold text-[#617170]">
              Material disponible
            </p>
            <p className="mt-2 text-2xl font-bold text-[#173a37]">
              {globalProgress.totalLessons}{" "}
              {globalProgress.totalLessons === 1 ? "lección" : "lecciones"}
            </p>
            <p className="mt-1 text-xs text-[#617170]">
              {totalTopics} {totalTopics === 1 ? "tema" : "temas"}
            </p>
          </div>
          <GlobalProgressCard progress={globalProgress.completedLessons > 0 ? globalProgress : null} />
          <div className="sm:col-span-2 lg:col-span-1">
            <ContinueStudyingCard lastProgress={lastStudied} />
          </div>
        </section>

        {globalProgress.completedLessons > 0 && areaProgressMap.size > 0 && (
          <section className="mt-8" aria-label="Progreso por área">
            <h2 className="mb-4 text-lg font-bold text-[#173a37]">
              Tu progreso por área
            </h2>
            <div className="grid grid-cols-2 gap-3 sm:grid-cols-3 lg:grid-cols-4">
              {areas?.map((area) => {
                const progress = areaProgressMap.get(area.id);
                return progress && progress.completedLessons > 0 ? (
                  <AreaProgressCard key={area.id} areaProgress={progress} />
                ) : null;
              })}
            </div>
          </section>
        )}

        <section className="mt-12" aria-labelledby="areas-title">
          <div className="mb-6 flex items-end justify-between gap-4">
            <div>
              <p className="text-sm font-bold uppercase tracking-[.16em] text-[#0d706d]">
                Biblioteca de estudio
              </p>
              <h2
                id="areas-title"
                className="mt-1 text-2xl font-bold tracking-tight text-[#173a37]"
              >
                Áreas disponibles
              </h2>
            </div>
          </div>
          <div className="grid grid-cols-1 gap-5 sm:grid-cols-2 lg:grid-cols-3">
            {areas?.map((area) => (
              <AreaCard
                key={area.id}
                id={area.id}
                code={area.code}
                name={area.name}
                description={area.description}
                topicCount={topicCounts[area.id] || 0}
              />
            ))}
            {(!areas || areas.length === 0) && (
              <div className="col-span-full rounded-2xl border border-dashed border-[#b5cbc5] bg-[#fffefd]/70 p-12 text-center text-[#617170]">
                No se encontraron áreas activas en este momento.
              </div>
            )}
          </div>
        </section>
      </main>
    </div>
  );
}
