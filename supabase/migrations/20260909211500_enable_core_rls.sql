-- CICDE Enfermeria 2026
-- Enable Row Level Security on core tables

alter table public.profiles enable row level security;
alter table public.areas enable row level security;
alter table public.topics enable row level security;