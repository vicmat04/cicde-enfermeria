interface StudyIconProps {
  code: string;
  className?: string;
}

type IconName =
  | "adult"
  | "mental"
  | "publicHealth"
  | "obgyn"
  | "pediatrics"
  | "administration"
  | "research"
  | "ethicsLegal"
  | "pharmacology"
  | "cicde";

const areaIcons: Record<string, IconName> = {
  ADULT: "adult",
  MENTAL: "mental",
  PUBLIC_HEALTH: "publicHealth",
  OBGYN: "obgyn",
  PEDIATRICS: "pediatrics",
  ADMINISTRATION: "administration",
  RESEARCH: "research",
  ETHICS_LEGAL: "ethicsLegal",
  PHARMACOLOGY: "pharmacology",
  CICDE: "cicde",
};

function IconPaths({ name }: { name: IconName }) {
  switch (name) {
    case "adult":
      return (
        <>
          <circle cx="12" cy="6.5" r="3" />
          <path d="M6.5 21v-3.5a5.5 5.5 0 0 1 11 0V21M12 10v6" />
        </>
      );
    case "mental":
      return (
        <>
          <path d="M8.5 20.5H7a3 3 0 0 1-3-3v-4a3 3 0 0 1 3-3h.5A5.2 5.2 0 0 1 12 4a5.2 5.2 0 0 1 4.5 6.5h.5a3 3 0 0 1 3 3v4a3 3 0 0 1-3 3h-1.5" />
          <path d="M9 10.5a2.2 2.2 0 0 1 3-2 2.2 2.2 0 0 1 3 2c0 1.3-1 1.8-1.8 2.5-.6.5-.7 1-.7 1.5M12 18h.01" />
        </>
      );
    case "publicHealth":
      return (
        <>
          <path d="M12 21a9 9 0 1 0 0-18 9 9 0 0 0 0 18Z" />
          <path d="M3.5 12h17M12 3c2.2 2.4 3.3 5.4 3.3 9S14.2 18.6 12 21c-2.2-2.4-3.3-5.4-3.3-9S9.8 5.4 12 3Z" />
        </>
      );
    case "obgyn":
      return (
        <>
          <path d="M12 20.5c-4.2-2.4-7-5.7-7-9.4A3.8 3.8 0 0 1 8.8 7c1.4 0 2.6.8 3.2 1.8.6-1 1.8-1.8 3.2-1.8A3.8 3.8 0 0 1 19 11.1c0 3.7-2.8 7-7 9.4Z" />
          <path d="M12 11v5M9.5 13.5h5" />
        </>
      );
    case "pediatrics":
      return (
        <>
          <circle cx="12" cy="7" r="3" />
          <path d="M5.5 20v-1.5a6.5 6.5 0 0 1 13 0V20M8.5 13.5 6 11M15.5 13.5 18 11" />
        </>
      );
    case "administration":
      return (
        <>
          <rect x="5" y="3.5" width="14" height="17" rx="2" />
          <path d="M9 3.5h6v3H9zM8.5 11h7M8.5 15h5" />
        </>
      );
    case "research":
      return (
        <>
          <circle cx="10.5" cy="10.5" r="5.5" />
          <path d="m14.5 14.5 5 5M8 10.5h5M10.5 8v5" />
        </>
      );
    case "ethicsLegal":
      return (
        <>
          <path d="M12 3v18M7 6h10M5 20h14" />
          <path d="m7 6-3 6h6L7 6ZM17 6l-3 6h6l-3-6Z" />
        </>
      );
    case "pharmacology":
      return (
        <>
          <path d="M9 4.5 19.5 15a3.5 3.5 0 0 1-5 5L4 9.5" />
          <path d="m7.5 6 10.5 10.5M4.5 13.5h6" />
        </>
      );
    case "cicde":
    default:
      return (
        <>
          <path d="M4 5.5A2.5 2.5 0 0 1 6.5 3H11v15H6.5A2.5 2.5 0 0 0 4 20.5v-15ZM20 5.5A2.5 2.5 0 0 0 17.5 3H13v15h4.5a2.5 2.5 0 0 1 2.5 2.5v-15Z" />
          <path d="M8 7h1.5M14.5 7H16M8 11h1.5M14.5 11H16" />
        </>
      );
  }
}

/** A distinct inline icon for each study area, with a brand fallback. */
export function StudyIcon({ code, className = "" }: StudyIconProps) {
  const icon = areaIcons[code.toUpperCase()] ?? "cicde";

  return (
    <svg
      viewBox="0 0 24 24"
      fill="none"
      stroke="currentColor"
      strokeWidth="1.65"
      strokeLinecap="round"
      strokeLinejoin="round"
      className={className}
      aria-hidden="true"
    >
      <IconPaths name={icon} />
    </svg>
  );
}
