"use client";

import { useState, type ReactNode } from "react";

export function LessonFocusShell({ children }: { children: ReactNode }) {
  const [focused, setFocused] = useState(false);

  return (
    <div className={`lesson-focus-shell ${focused ? "is-focused" : ""}`}>
      <div className="mb-5 flex justify-end">
        <button
          type="button"
          aria-pressed={focused}
          onClick={() => setFocused((value) => !value)}
          className="min-h-11 rounded-lg border border-[#bdd0cb] bg-[#fffefd] px-3 text-sm font-semibold text-[#174642] transition-colors hover:bg-[#eef5f2] motion-reduce:transition-none"
        >
          {focused ? "Salir del modo enfoque" : "Modo enfoque"}
        </button>
      </div>
      {children}
    </div>
  );
}
