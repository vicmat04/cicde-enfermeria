interface LessonSourceProps {
  sources: Array<{
    is_primary: boolean;
    usage_note: string | null;
    sources: {
      id: string;
      source_type: string;
      title: string;
      authors: string | null;
      publication_year: number | null;
      url: string | null;
      verified: boolean;
    };
  }>;
}

function parseExternalUrl(value: string | null): URL | null {
  if (!value) {
    return null;
  }

  try {
    const url = new URL(value);
    return url.protocol === "http:" || url.protocol === "https:" ? url : null;
  } catch {
    return null;
  }
}

export function LessonSources({ sources }: LessonSourceProps) {
  return (
    <ul className="grid gap-3" aria-label="Fuentes de referencia">
      {sources.map((item, index) => {
        const source = item.sources;
        const externalUrl = parseExternalUrl(source.url);

        return (
          <li
            key={source.id || index}
            className="rounded-xl border border-[#d5e3df] bg-[#fffefd] p-4"
          >
            <div className="flex flex-wrap items-start justify-between gap-3">
              <div>
                <h4 className="font-bold text-[#173a37]">{source.title}</h4>
                {(source.authors || source.publication_year) && (
                  <p className="mt-1 text-sm text-[#617170]">
                    {[source.authors, source.publication_year]
                      .filter(Boolean)
                      .join(" · ")}
                  </p>
                )}
              </div>
              <div className="flex flex-wrap gap-2">
                <span className="rounded-full bg-[#eaf3f0] px-2.5 py-1 text-xs font-bold text-[#075957]">
                  {source.source_type}
                </span>
                {item.is_primary && (
                  <span className="rounded-full bg-[#f7efdc] px-2.5 py-1 text-xs font-bold text-[#805c1d]">
                    Fuente principal
                  </span>
                )}
                {source.verified && (
                  <span className="rounded-full bg-[#e4f3ea] px-2.5 py-1 text-xs font-bold text-[#17653f]">
                    Verificada
                  </span>
                )}
              </div>
            </div>
            {item.usage_note && (
              <p className="mt-3 border-l-2 border-[#9cc9be] pl-3 text-sm leading-6 text-[#526966]">
                Uso: {item.usage_note}
              </p>
            )}
            {externalUrl ? (
              <a
                href={externalUrl.href}
                target="_blank"
                rel="noreferrer noopener"
                className="mt-3 inline-flex min-h-11 items-center rounded-lg text-sm font-bold text-[#0d706d] underline decoration-[#9ac7bd] underline-offset-4"
              >
                Consultar fuente{" "}
                <span className="ml-1" aria-hidden="true">
                  ↗
                </span>
              </a>
            ) : (
              source.url && (
                <p className="mt-3 break-words text-sm text-[#617170]">
                  <span className="font-semibold">URL: </span>
                  {source.url}
                </p>
              )
            )}
          </li>
        );
      })}
    </ul>
  );
}
