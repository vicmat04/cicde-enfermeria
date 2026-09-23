# Feature: User Identity in Header

**Status**: In Progress  
**Created**: 2025-01-24

## Goal
Show user's full name and role (Student/Admin) in the top-right corner of the header when logged in, replacing the current email display.

## Context
- Currently `AppHeader` shows `user.email` from Supabase Auth
- Database has `profiles` table with `full_name` and `role` (ADMIN/STUDENT)
- Need to fetch profile data and display it properly

## Tasks

- [x] Create helper function to get user profile from Supabase
- [x] Update AppHeader component to display name and role
- [x] Update dashboard page to fetch and pass profile data
- [x] Update areas and topics pages to fetch and pass profile data
- [x] Verify TypeScript compilation and build

## Implementation Details

- Created `src/lib/supabase/profiles.ts` with `getUserProfile()` helper and `UserProfile` type
- Updated `AppHeader` component to show `full_name` and `role` in a two-line display
- Role is displayed as "Administrador" for ADMIN and "Estudiante" for STUDENT
- Display is hidden on small screens (lg:flex) to maintain mobile responsiveness
- All pages using AppHeader now fetch and pass profile data

## Commits

- `214b814` - feat(ui): show user name and role in header
