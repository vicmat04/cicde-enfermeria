"use client";

import { useEffect } from "react";
import { startLessonAction } from "@/app/topics/[code]/actions";

interface LessonStartTrackerProps {
  lessonId: string;
}

export function LessonStartTracker({ lessonId }: LessonStartTrackerProps) {
  useEffect(() => {
    void startLessonAction(lessonId);
  }, [lessonId]);

  return null;
}
