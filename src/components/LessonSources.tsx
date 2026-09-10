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

export function LessonSources({ sources }: LessonSourceProps) {
  return (
    <ul role="list" className="divide-y divide-gray-200">
      {sources.map((item, idx) => (
        <li
          key={item.sources.id || idx}
          className="py-4 flex flex-col space-y-2"
        >
          <div className="flex items-start justify-between">
            <div className="text-sm font-medium text-gray-900">
              {item.sources.title}
            </div>
            <span className="inline-flex items-center px-2 py-0.5 rounded text-xs font-medium bg-blue-100 text-blue-800">
              {item.sources.source_type}
            </span>
          </div>
          {item.sources.authors && (
            <div className="text-sm text-gray-500">
              Autor(es): {item.sources.authors}
            </div>
          )}
          {item.sources.publication_year && (
            <div className="text-sm text-gray-500">
              Año: {item.sources.publication_year}
            </div>
          )}
          {item.usage_note && (
            <div className="text-sm text-gray-600 bg-gray-100 p-2 rounded mt-2">
              Uso: {item.usage_note}
            </div>
          )}
        </li>
      ))}
    </ul>
  );
}
