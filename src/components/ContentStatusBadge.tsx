export function ContentStatusBadge({ status }: { status: string }) {
  let bgColor = "bg-gray-100";
  let textColor = "text-gray-800";
  let label = status;

  switch (status) {
    case "SOURCE_VALIDATED":
      bgColor = "bg-blue-100";
      textColor = "text-blue-800";
      label = "Validado con fuentes";
      break;
    case "REVIEW":
      bgColor = "bg-yellow-100";
      textColor = "text-yellow-800";
      label = "EN REVISIÓN";
      break;
    case "VERIFIED":
      bgColor = "bg-green-100";
      textColor = "text-green-800";
      label = "VERIFICADO";
      break;
    case "DRAFT":
      bgColor = "bg-gray-100";
      textColor = "text-gray-800";
      label = "BORRADOR";
      break;
  }

  return (
    <span
      className={`inline-flex items-center px-2.5 py-0.5 rounded-full text-xs font-medium ${bgColor} ${textColor}`}
    >
      {label}
    </span>
  );
}
