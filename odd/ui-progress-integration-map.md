# UI Progress Integration Map

**Version:** 1.0  
**Date:** 2025-01-24  
**Status:** Prepared for backend integration (not connected)

## Purpose

This document maps EXACTLY what progress data each page needs to read/write when PRINCIPAL delivers the Progress Backend Contract.

**Important:** Field names are UI-level only. DO NOT assume they match database columns.

---

## Dashboard (`/dashboard`)

### What Progress It Needs

**Global Progress:**
- `totalLessons` (number) — Count of all SOURCE_VALIDATED lessons
- `completedLessons` (number) — Count of lessons user completed
- `progressPercent` (number) — Calculated: (completedLessons / totalLessons) * 100

**Area Progress (optional for v1.1):**
- Array of `AreaProgress`:
  - `areaId` (string)
  - `areaCode` (string)
  - `areaName` (string)
  - `totalLessons` (number) — Lessons in this area
  - `completedLessons` (number) — Lessons user completed in this area
  - `progressPercent` (number)

### Current Implementation

**File:** `src/app/dashboard/page.tsx`

**Current behavior:**
- Shows real topic count (good)
- Shows placeholder text: "Elige un área para comenzar..." (acceptable for now)

**After Backend Contract:**
- Replace `GlobalProgressCard` placeholder with real data
- Query user's progress on mount
- Show: "X / Y lecciones completadas" + progress bar

**Component:** `GlobalProgressCard` (already prepared in `src/components/progress/`)

**Query pattern (conceptual):**
```typescript
// After backend contract received
const { data: progress } = await supabase
  .from('user_lesson_progress') // exact table name TBD
  .select('...') // exact columns TBD
  .eq('user_id', user.id);

// Transform to GlobalProgress type
const globalProgress: GlobalProgress = {
  totalLessons: ...,
  completedLessons: ...,
  progressPercent: ...,
  areasProgress: [],
};
```

---

## Area Page (`/areas/[code]`)

### What Progress It Needs

**Area-Specific Progress:**
- `completedLessons` (number) — For this area
- `totalLessons` (number) — For this area
- `progressPercent` (number)

**Per-Topic Progress (optional):**
- For each topic in the area:
  - `topicId` (string)
  - `hasCompletedLesson` (boolean) — True if the topic's current lesson is completed

### Current Implementation

**File:** `src/app/areas/[code]/page.tsx`

**Current behavior:**
- Shows topic count: "X temas disponibles"
- No progress shown

**After Backend Contract:**
- Add area progress card above topics
- Optionally: Show checkmark on topics with completed lessons

**Component:** `AreaProgressCard` (already prepared)

**Query pattern (conceptual):**
```typescript
// Query lessons for this area + user progress
const { data: areaLessons } = await supabase
  .from('lessons')
  .select('id, topic_id, ...') // with progress join
  .eq('area_id', area.id)
  .eq('is_current', true);

// Calculate area progress
```

---

## Topic Page (`/topics/[code]`)

### What Progress It Needs

**Lesson Progress:**
- `isCompleted` (boolean) — For the current lesson of this topic
- `progressPercent` (number) — Optional: reading progress within lesson
- `lastVisitedSectionId` (string | null) — Optional: for "resume where you left off"

### Current Implementation

**File:** `src/app/topics/[code]/page.tsx`

**Current behavior:**
- Renders lesson via `LessonView` component
- No completion UI shown

**After Backend Contract:**
- Add `LessonCompletionButton` at end of lesson
- Query user's progress for this lesson on mount
- Pass `isCompleted` and `onToggleComplete` handler

**Component:** `LessonCompletionButton` (already prepared)

**Where to Place:**
- End of `LessonView` component
- Or in `LessonStudyShell` after last chapter

**Query pattern (conceptual):**
```typescript
// Query user's progress for this lesson
const { data: lessonProgress } = await supabase
  .from('user_lesson_progress')
  .select('...')
  .eq('user_id', user.id)
  .eq('lesson_id', lesson.id)
  .single();

const isCompleted = lessonProgress?.completed_at !== null;
```

**Write pattern (conceptual):**
```typescript
async function handleToggleComplete(lessonId: string, completed: boolean) {
  if (completed) {
    // Mark as completed
    await supabase
      .from('user_lesson_progress')
      .upsert({
        user_id: user.id,
        lesson_id: lessonId,
        completed_at: new Date(),
        progress_percent: 100,
      });
  } else {
    // Mark as incomplete
    await supabase
      .from('user_lesson_progress')
      .update({ completed_at: null, progress_percent: 0 })
      .eq('user_id', user.id)
      .eq('lesson_id', lessonId);
  }
  
  // Revalidate or refetch
}
```

---

## Lesson Reading Progress (Future)

### What It Needs

**Within-Lesson Progress:**
- `lastVisitedSectionId` (string | null) — Resume point
- `visitedSections` (string[]) — Optional: for visual indicators
- `progressPercent` (number) — Optional: reading progress bar

### Current Implementation

**File:** `src/components/LessonStudyShell.tsx`

**Current behavior:**
- Tracks visited chapters/sections in React state (NOT persistent)
- Shows reading progress bar (resets on refresh)

**After Backend Contract:**
- Save progress on:
  - Chapter navigation
  - Section expand
  - Mode switch (study ↔ full reading)
  - Page unload/exit
- Load progress on mount
- Restore last visited section

**Debounce strategy:**
- Debounce writes (e.g., 2 seconds) to avoid excessive DB calls
- Use optimistic UI updates

**Query pattern (conceptual):**
```typescript
// On mount
const { data: progress } = await supabase
  .from('user_lesson_progress')
  .select('last_visited_section_id, progress_percent')
  .eq('user_id', user.id)
  .eq('lesson_id', lesson.id)
  .single();

// Restore state
if (progress?.last_visited_section_id) {
  // Scroll to section or set active chapter
}
```

**Write pattern (conceptual - debounced):**
```typescript
const debouncedSaveProgress = debounce(async (sectionId: string, percent: number) => {
  await supabase
    .from('user_lesson_progress')
    .upsert({
      user_id: user.id,
      lesson_id: lesson.id,
      last_visited_section_id: sectionId,
      progress_percent: percent,
      updated_at: new Date(),
    });
}, 2000);
```

---

## Refresh Behavior

### What Must Persist

**After page refresh:**
- Global progress (dashboard)
- Area progress (area page)
- Lesson completion status (topic page)
- Last visited section (optional)

**All progress data should:**
- Be fetched fresh on mount
- NOT use localStorage (backend is source of truth)
- Show loading states while fetching

---

## Logout/Login Behavior

### What Must Persist

**After logout → login:**
- ALL progress data (stored per user_id in backend)
- User should see exact same progress on any device

**What resets:**
- Nothing (backend is persistent)

---

## Data Flow Summary

```
User Action                  → UI Component                    → Backend Operation
─────────────────────────────────────────────────────────────────────────────────
Visit dashboard             → GlobalProgressCard              → SELECT progress summary
Visit area page             → AreaProgressCard                → SELECT area progress
View lesson                 → LessonView + CompletionButton   → SELECT lesson progress
Mark lesson complete        → LessonCompletionButton          → UPSERT completed_at
Navigate chapter            → LessonStudyShell                → UPSERT last_section (debounced)
Refresh page                → All components                  → SELECT fresh data
Logout → Login              → All components                  → SELECT fresh data (new session)
```

---

## Backend Contract Requirements

When PRINCIPAL delivers Progress Backend Contract, it must specify:

1. **Table name(s):** Exact table(s) to query
2. **Column names:** Exact fields to SELECT/UPDATE
3. **RLS policies:** Confirm students can read/write own progress
4. **Unique constraints:** How to upsert (user_id + lesson_id?)
5. **Timestamp fields:** `completed_at`, `started_at`, `updated_at`?
6. **Progress calculation:** Server-side or client-side?
7. **Area aggregation:** Query pattern for area-level progress
8. **Global aggregation:** Query pattern for dashboard summary

---

## Component Status

| Component | Status | Path |
|-----------|--------|------|
| `GlobalProgressCard` | ✅ Ready | `src/components/progress/GlobalProgressCard.tsx` |
| `AreaProgressCard` | ✅ Ready | `src/components/progress/AreaProgressCard.tsx` |
| `LessonCompletionButton` | ✅ Ready | `src/components/progress/LessonCompletionButton.tsx` |
| `ProgressEmptyState` | ✅ Ready | `src/components/progress/ProgressEmptyState.tsx` |

**All components:**
- Accept data via props
- Do NOT call Supabase directly
- Show loading/empty/error states
- Are responsive
- Have proper TypeScript types

---

## Integration Checklist

When Backend Contract is received:

- [ ] Update `src/types/progress.ts` with exact field names from backend
- [ ] Create `src/lib/progress/queries.ts` with query functions
- [ ] Create `src/lib/progress/mutations.ts` with write functions
- [ ] Integrate `GlobalProgressCard` into dashboard
- [ ] Integrate `AreaProgressCard` into area page
- [ ] Integrate `LessonCompletionButton` into topic/lesson page
- [ ] Add debounced progress save to `LessonStudyShell`
- [ ] Test: mark complete → logout → login → verify persisted
- [ ] Test: read lesson → refresh → verify resume point
- [ ] Test: complete lesson → dashboard shows updated count

---

**Document Complete** — UI is prepared and waiting for backend contract.
