import { createClient } from "@/lib/supabase/server";
import { AppHeader } from "@/components/AppHeader";
import { AreaCard } from "@/components/AreaCard";

export default async function DashboardPage() {
  const supabase = await createClient();
  const {
    data: { user },
  } = await supabase.auth.getUser();

  // Fetch active areas ordered by sort_order
  const { data: areas } = await supabase
    .from("areas")
    .select("id, code, name, description")
    .eq("is_active", true)
    .order("sort_order", { ascending: true });

  return (
    <div className="min-h-screen bg-gray-50">
      <AppHeader user={user} />

      <main>
        <div className="mx-auto max-w-7xl px-4 py-8 sm:px-6 lg:px-8">
          <div className="mb-8">
            <h1 className="text-2xl font-bold tracking-tight text-gray-900">
              Áreas de Estudio CICDE
            </h1>
            <p className="mt-2 text-sm text-gray-600">
              Selecciona un área para comenzar tu preparación.
            </p>
          </div>

          <div className="grid grid-cols-1 gap-6 sm:grid-cols-2 lg:grid-cols-3">
            {areas?.map((area) => (
              <AreaCard
                key={area.id}
                id={area.id}
                code={area.code}
                name={area.name}
                description={area.description}
              />
            ))}
            {(!areas || areas.length === 0) && (
              <div className="col-span-full rounded-lg border-2 border-dashed border-gray-300 p-12 text-center">
                <p className="text-gray-500">
                  No se encontraron áreas activas en este momento.
                </p>
              </div>
            )}
          </div>
        </div>
      </main>
    </div>
  );
}