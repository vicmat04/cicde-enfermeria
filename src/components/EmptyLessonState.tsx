export function EmptyLessonState() {
  return (
    <div className="rounded-lg border-2 border-dashed border-gray-300 p-12 text-center bg-white">
      <svg
        className="mx-auto h-12 w-12 text-gray-400"
        fill="none"
        viewBox="0 0 24 24"
        stroke="currentColor"
        aria-hidden="true"
      >
        <path
          vectorEffect="non-scaling-stroke"
          strokeLinecap="round"
          strokeLinejoin="round"
          strokeWidth={2}
          d="M9 13h6m-3-3v6m5 5H7a2 2 0 01-2-2V5a2 2 0 012-2h5.586a1 1 0 01.707.293l5.414 5.414a1 1 0 01.293.707V19a2 2 0 01-2 2z"
        />
      </svg>
      <h3 className="mt-2 text-sm font-semibold text-gray-900">
        Contenido en preparación
      </h3>
      <p className="mt-1 text-sm text-gray-500">
        La lección verificada para este tema aún no está disponible. Vuelve más
        tarde.
      </p>
    </div>
  );
}
