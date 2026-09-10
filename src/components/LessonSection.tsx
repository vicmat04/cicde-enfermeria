interface LessonSectionProps {
  section: {
    id: string;
    title: string;
    body: string;
    sort_order: number;
  };
}

export function LessonSection({ section }: LessonSectionProps) {
  return (
    <div className="prose prose-indigo max-w-none">
      <h3 className="text-xl font-bold text-gray-900 mb-4 pb-2 border-b border-gray-200">
        {section.title}
      </h3>
      <div className="text-gray-700 whitespace-pre-wrap">{section.body}</div>
    </div>
  );
}
