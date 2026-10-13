begin;
create table public.applications (
  id uuid primary key default gen_random_uuid(),
  name text not null check (char_length(btrim(name)) between 1 and 80),
  contact text not null check (char_length(btrim(contact)) between 3 and 160),
  message text not null default '' check (char_length(message) <= 2000),
  created_at timestamptz not null default now()
);
alter table public.applications enable row level security;
alter table public.applications force row level security;
revoke all on public.applications from public, anon, authenticated;
grant insert (name, contact, message) on public.applications to anon, authenticated;
grant all on public.applications to service_role;
create policy applications_insert_only on public.applications
for insert to anon, authenticated with check (true);
comment on table public.applications is '한끼가볍게 신청. 브라우저는 INSERT만 허용, 읽기/수정/삭제 금지.';
notify pgrst, 'reload schema';
commit;
