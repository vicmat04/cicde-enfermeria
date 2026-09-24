/**
 * ProgressEmptyState
 * 
 * Shown when progress data is not yet available.
 * Used during v1 before backend integration is complete.
 */

export function ProgressEmptyState() {
  return (
    <div className="rounded-2xl border border-dashed border-[#b5cbc5] bg-[#fffefd]/70 p-8 text-center">
      <p className="text-sm font-semibold text-[#617170]">
        Seguimiento de progreso
      </p>
      <p className="mt-2 text-base leading-6 text-[#526966]">
        Tu progreso estará disponible próximamente. Por ahora, continúa
        estudiando las lecciones disponibles.
      </p>
    </div>
  );
}
