"use client";

import { useActionState } from "react";
import { login } from "./actions";

export default function LoginPage() {
  const [state, formAction, isPending] = useActionState(
    async (
      _prevState: { error: string } | null | undefined,
      formData: FormData,
    ) => {
      return await login(formData);
    },
    null,
  );

  return (
    <div className="page-wash flex min-h-screen flex-col items-center justify-center px-4 py-16 sm:px-6 lg:px-8">
      {/* Card */}
      <div className="paper-shadow w-full max-w-sm overflow-hidden rounded-3xl border border-[#d5e3df] bg-[#fffefd]">
        {/* Header band */}
        <div className="relative overflow-hidden border-b border-[#d9e4e1] bg-[#f5fbf8] px-8 py-8">
          {/* Decorative blob */}
          <div
            className="pointer-events-none absolute -right-10 -top-10 h-36 w-36 rounded-full bg-[#cce8df]/50 blur-2xl"
            aria-hidden="true"
          />
          <div className="relative flex flex-col items-center gap-4">
            {/* Brand mark */}
            <div className="flex h-14 w-14 items-center justify-center rounded-2xl bg-[#0d706d] text-white shadow-sm">
              <svg className="h-7 w-7" viewBox="0 0 24 24" fill="none" xmlns="http://www.w3.org/2000/svg">
                <path d="M12 2L2 7L12 12L22 7L12 2Z" stroke="currentColor" strokeWidth="2" strokeLinecap="round" strokeLinejoin="round"/>
                <path d="M2 17L12 22L22 17" stroke="currentColor" strokeWidth="2" strokeLinecap="round" strokeLinejoin="round"/>
                <path d="M2 12L12 17L22 12" stroke="currentColor" strokeWidth="2" strokeLinecap="round" strokeLinejoin="round"/>
              </svg>
            </div>
            <div className="text-center">
              <h1 className="text-2xl font-bold tracking-tight text-[#173a37]">
                NexNurse
              </h1>
              <p className="mt-0.5 text-sm font-medium text-[#617170]">
                Preparación para certificación de enfermería
              </p>
            </div>
          </div>
        </div>

        {/* Form */}
        <div className="px-8 py-8">
          <p className="mb-6 text-center text-sm text-[#526966]">
            Inicia sesión para continuar con tu preparación
          </p>

          <form action={formAction} className="flex flex-col gap-5" noValidate>
            {/* Email */}
            <div className="flex flex-col gap-1.5">
              <label
                htmlFor="email-address"
                className="text-sm font-semibold text-[#2f4f4c]"
              >
                Correo electrónico
              </label>
              <input
                id="email-address"
                name="email"
                type="email"
                autoComplete="email"
                required
                disabled={isPending}
                className="block w-full rounded-xl border border-[#bdd0cb] bg-white px-4 py-2.5 text-sm text-[#173a37] placeholder:text-[#9ab9ae] transition-colors focus:border-[#0d706d] focus:outline-none focus:ring-2 focus:ring-[#0d706d]/20 disabled:opacity-60"
                placeholder="tu@correo.com"
              />
            </div>

            {/* Password */}
            <div className="flex flex-col gap-1.5">
              <label
                htmlFor="password"
                className="text-sm font-semibold text-[#2f4f4c]"
              >
                Contraseña
              </label>
              <input
                id="password"
                name="password"
                type="password"
                autoComplete="current-password"
                required
                disabled={isPending}
                className="block w-full rounded-xl border border-[#bdd0cb] bg-white px-4 py-2.5 text-sm text-[#173a37] placeholder:text-[#9ab9ae] transition-colors focus:border-[#0d706d] focus:outline-none focus:ring-2 focus:ring-[#0d706d]/20 disabled:opacity-60"
                placeholder="••••••••"
              />
            </div>

            {/* Error message */}
            {state?.error && (
              <div
                role="alert"
                className="flex items-start gap-2 rounded-xl border border-[#f0c6c0] bg-[#fff8f7] px-4 py-3 text-sm text-[#8b2e2e]"
              >
                <span
                  aria-hidden="true"
                  className="mt-px shrink-0 text-base leading-none"
                >
                  ⚠
                </span>
                <span>{state.error}</span>
              </div>
            )}

            {/* Submit */}
            <button
              type="submit"
              disabled={isPending}
              className="mt-1 flex min-h-11 w-full items-center justify-center gap-2 rounded-xl bg-[#0d706d] px-5 py-2.5 text-sm font-bold text-white shadow-sm transition-colors hover:bg-[#0a5e5c] focus-visible:outline focus-visible:outline-2 focus-visible:outline-offset-2 focus-visible:outline-[#0d706d] disabled:cursor-not-allowed disabled:opacity-60"
            >
              {isPending ? (
                <>
                  <span
                    className="inline-block h-4 w-4 animate-spin rounded-full border-2 border-white/30 border-t-white"
                    aria-hidden="true"
                  />
                  Iniciando sesión…
                </>
              ) : (
                "Iniciar sesión"
              )}
            </button>
          </form>
        </div>
      </div>

      {/* Footer note */}
      <p className="mt-8 text-center text-xs text-[#8fa8a4]">
        Acceso exclusivo para estudiantes de enfermería
      </p>
    </div>
  );
}
