import { User } from "@supabase/supabase-js";
import Link from "next/link";
import { logout } from "@/app/dashboard/actions";
import type { UserProfile } from "@/lib/supabase/profiles";

interface AppHeaderProps {
  user: User | null;
  profile: UserProfile | null;
}

export function AppHeader({ user, profile }: AppHeaderProps) {
  return (
    <header className="sticky top-0 z-30 border-b border-[#d9e4e1]/90 bg-[#fffefd]/92 backdrop-blur-md">
      <nav
        className="mx-auto flex min-h-16 max-w-7xl items-center justify-between gap-3 px-4 sm:px-6 lg:px-8"
        aria-label="Principal"
      >
        <Link
          href="/dashboard"
          className="flex min-h-11 items-center gap-2.5 rounded-lg font-bold text-[#173a37]"
          aria-label="NexNurse, inicio"
        >
          <span className="grid h-9 w-9 place-items-center rounded-xl bg-[#0d706d] text-white shadow-sm">
            <svg className="h-5 w-5" viewBox="0 0 24 24" fill="none" xmlns="http://www.w3.org/2000/svg">
              <path d="M12 2L2 7L12 12L22 7L12 2Z" stroke="currentColor" strokeWidth="2" strokeLinecap="round" strokeLinejoin="round"/>
              <path d="M2 17L12 22L22 17" stroke="currentColor" strokeWidth="2" strokeLinecap="round" strokeLinejoin="round"/>
              <path d="M2 12L12 17L22 12" stroke="currentColor" strokeWidth="2" strokeLinecap="round" strokeLinejoin="round"/>
            </svg>
          </span>
          <span className="leading-tight font-bold text-[#173a37]">
            NexNurse
          </span>
        </Link>
        <div className="flex items-center gap-2 sm:gap-4">
          <Link
            href="/dashboard"
            className="hidden min-h-11 items-center rounded-lg px-3 text-sm font-semibold text-[#46615e] transition-colors hover:bg-[#eef5f2] hover:text-[#075957] motion-reduce:transition-none md:flex"
          >
            Áreas de estudio
          </Link>
          {user && profile && (
            <div className="hidden flex-col items-end gap-0.5 lg:flex">
              <span
                className="max-w-48 truncate text-sm font-semibold text-[#173a37]"
                title={profile.full_name ?? user.email ?? undefined}
              >
                {profile.full_name || "Usuario"}
              </span>
              <span className="text-xs font-medium text-[#617170]">
                {profile.role === "ADMIN" ? "Administrador" : "Estudiante"}
              </span>
            </div>
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
