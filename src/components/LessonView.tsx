import { LessonStudyShell } from "./LessonStudyShell";
import { buildLessonChapters, type Lesson } from "./lessonStructure";

interface LessonViewProps {
    lesson: Lesson;
    areaName: string;
    topicCode: string;
    topicTitle: string;
    topicDescription: string | null;
}

/** Keeps lesson grouping on the server; the interactive reader receives data only. */
export function LessonView({
    lesson,
    areaName,
    topicCode,
    topicTitle,
    topicDescription,
}: LessonViewProps) {
    const sections = lesson.lesson_sections || [];
    const chapters = buildLessonChapters(sections);

    return (
        <LessonStudyShell
            areaName={areaName}
            topicCode={topicCode}
            topicTitle={topicTitle}
            topicDescription={topicDescription}
            lesson={{
                summary: lesson.summary,
                status: lesson.status,
                version: lesson.version,
                lesson_sources: lesson.lesson_sources || [],
            }}
            chapters={chapters}
            sectionCount={sections.length}
        />
    );
}
