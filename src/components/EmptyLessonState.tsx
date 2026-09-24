export function EmptyLessonState() {
  return (
    <section
      className="paper-shadow rounded-3xl border border-[#c9ddd7] bg-[#fffefd] px-6 py-12 text-center sm:px-12"
      aria-labelledby="empty-lesson-title"
    >
      <span
        className="mx-auto grid h-14 w-14 place-items-center rounded-2xl bg-[#e7f2ee] text-2xl text-[#0d706d]"
        aria-hidden="true"
      >
        ✦
      </span>
      <h2
        id="empty-lesson-title"
        className="mt-5 text-2xl font-bold tracking-tight text-[#173a37]"
      >
        Contenido en preparación
      </h2>
      <p className="mx-auto mt-3 max-w-lg leading-7 text-[#617170]">
        La lección disponible para este tema todavía se está preparando. Vuelve
        pronto para consultar el material cuando esté listo.
      </p>
    </section>
  );
}
