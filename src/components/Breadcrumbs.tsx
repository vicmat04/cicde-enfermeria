import Link from "next/link";

interface BreadcrumbItem {
  name: string;
  href?: string;
}

interface BreadcrumbsProps {
  items: BreadcrumbItem[];
}

export function Breadcrumbs({ items }: BreadcrumbsProps) {
  return (
    <nav className="mb-7 overflow-x-auto" aria-label="Ruta de navegación">
      <ol className="flex min-w-max items-center gap-2 text-sm">
        <li>
          <Link
            href="/dashboard"
            className="inline-flex min-h-11 items-center rounded-md px-1 font-semibold text-[#0d706d] hover:text-[#075957]"
          >
            Áreas
          </Link>
        </li>
        {items.map((item, index) => {
          const isLast = index === items.length - 1;

          return (
            <li
              key={`${item.name}-${index}`}
              className="flex items-center gap-2"
            >
              <span className="text-[#9aadaa]" aria-hidden="true">
                /
              </span>
              {isLast || !item.href ? (
                <span
                  className="max-w-52 truncate font-medium text-[#617170]"
                  aria-current="page"
                >
                  {item.name}
                </span>
              ) : (
                <Link
                  href={item.href}
                  className="inline-flex min-h-11 items-center rounded-md px-1 font-medium text-[#46615e] hover:text-[#075957]"
                >
                  {item.name}
                </Link>
              )}
            </li>
          );
        })}
      </ol>
    </nav>
  );
}
