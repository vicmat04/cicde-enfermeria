import Link from "next/link";

interface AreaCardProps {
  id: string;
  code: string;
  name: string;
  description: string | null;
}

export function AreaCard({ code, name, description }: AreaCardProps) {
  return (
    <Link href={`/areas/${code}`} className="block h-full">
      <div className="h-full overflow-hidden rounded-lg bg-white shadow hover:shadow-md transition-shadow border border-gray-100 flex flex-col">
        <div className="p-5 flex-1">
          <div className="flex items-center justify-between mb-2">
            <span className="inline-flex items-center rounded-md bg-indigo-50 px-2 py-1 text-xs font-medium text-indigo-700 ring-1 ring-inset ring-indigo-700/10">
              {code}
            </span>
            <span className="text-xs text-gray-400">Progreso: --%</span>
          </div>
          <h3 className="text-lg font-semibold text-gray-900 mb-1">{name}</h3>
          {description && (
            <p className="text-sm text-gray-500 line-clamp-2">{description}</p>
          )}
        </div>
        <div className="bg-gray-50 px-5 py-3 border-t border-gray-100">
          <span className="text-sm font-medium text-indigo-600 hover:text-indigo-500">
            Explorar área &rarr;
          </span>
        </div>
      </div>
    </Link>
  );
}