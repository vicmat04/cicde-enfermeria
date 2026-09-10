import { User } from "@supabase/supabase-js";
import Link from "next/link";
import { logout } from "@/app/dashboard/actions";
import { StudyIcon } from "./StudyIcon";

interface AppHeaderProps {
  user: User | null;
}

export function AppHeader({ user }: AppHeaderProps) {
  return (
    <header className="sticky top-0 z-30 border-b border-[#d9e4e1]/90 bg-[#fffefd]/92 backdrop-blur-md">
      <nav
        className="mx-auto flex min-h-16 max-w-7xl items-center justify-between gap-3 px-4 sm:px-6 lg:px-8"
        aria-label="Principal"
      >
        <Link
          href="/dashboard"
          className="flex min-h-11 items-center gap-2.5 rounded-lg font-bold text-[#173a37]"
          aria-label="CICDE Enfermería, inicio"
        >
          <span className="grid h-9 w-9 place-items-center rounded-xl bg-[#0d706d] text-white shadow-sm">
            <StudyIcon code="CICDE" className="h-5 w-5" />
          </span>
          <span className="leading-tight">
            CICDE{" "}
            <span className="hidden text-[#0d706d] sm:inline">Enfermería</span>
            <small className="ml-1 font-medium text-[#617170]">2026</small>
          </span>
        </Link>
        <div className="flex items-center gap-2 sm:gap-4">
          <Link
            href="/dashboard"
            className="hidden min-h-11 items-center rounded-lg px-3 text-sm font-semibold text-[#46615e] transition-colors hover:bg-[#eef5f2] hover:text-[#075957] motion-reduce:transition-none md:flex"
          >
            Áreas de estudio
          </Link>
          {user && (
            <span
              className="hidden max-w-48 truncate text-sm text-[#617170] lg:block"
              title={user.email ?? undefined}
            >
              {user.email}
            </span>
          )}
          <form action={logout}>
            <button
              type="submit"
              className="min-h-11 rounded-lg border border-[#bdd0cb] bg-white px-3 text-sm font-semibold text-[#174642] transition-colors hover:border-[#78aaa1] hover:bg-[#eef5f2] motion-reduce:transition-none sm:px-4"
            >
              Cerrar sesión
            </button>
          </form>
        </div>
      </nav>
    </header>
  );
}
