interface ContentStatusBadgeProps {
  status: string | null | undefined;
}

const states: Record<string, { label: string; className: string }> = {
  REVIEW: {
    label: "En revisión",
    className: "bg-[#fff4d8] text-[#805c1d]",
  },
  VERIFIED: {
    label: "Verificado",
    className: "bg-[#e3f3e9] text-[#17653f]",
  },
  DRAFT: {
    label: "Borrador",
    className: "bg-[#edf1f0] text-[#526966]",
  },
};

export function ContentStatusBadge({ status }: ContentStatusBadgeProps) {
  const state = status ? states[status] : undefined;
  const label = state?.label ?? "En preparación";
  const className = state?.className ?? "bg-[#edf1f0] text-[#526966]";

  return (
    <span
      className={`inline-flex items-center rounded-full px-3 py-1 text-xs font-bold ${className}`}
      aria-label={`Estado del contenido: ${label}`}
    >
      {label}
    </span>
  );
}
