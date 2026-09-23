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

- [ ] Create helper function to get user profile from Supabase
- [ ] Update AppHeader component to display name and role
- [ ] Update dashboard page to fetch and pass profile data
- [ ] Test with student and admin accounts
- [ ] Verify responsive design

## Commits
