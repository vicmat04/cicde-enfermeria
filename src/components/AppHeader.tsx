import Link from "next/link";
import { User } from "@supabase/supabase-js";
import { logout } from "@/app/dashboard/actions";

interface AppHeaderProps {
  user: User | null;
}

export function AppHeader({ user }: AppHeaderProps) {
  return (
    <nav className="bg-white shadow-sm sticky top-0 z-10">
      <div className="mx-auto max-w-7xl px-4 sm:px-6 lg:px-8">
        <div className="flex h-16 justify-between">
          <div className="flex items-center">
            <Link href="/dashboard" className="text-xl font-bold text-indigo-600 hover:text-indigo-500">
              CICDE Enfermería 2026
            </Link>
          </div>
          <div className="flex items-center space-x-4">
            {user && (
              <span className="text-sm font-medium text-gray-700 hidden sm:block">
                {user.email}
              </span>
            )}
            <form action={logout}>
              <button
                type="submit"
                className="rounded-md bg-white px-3 py-2 text-sm font-semibold text-gray-900 shadow-sm ring-1 ring-inset ring-gray-300 hover:bg-gray-50 transition-colors"
              >
                Cerrar sesión
              </button>
            </form>
          </div>
        </div>
      </div>
    </nav>
  );
}