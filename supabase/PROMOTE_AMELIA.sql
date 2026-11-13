-- =============================================================================
-- Promote Amelia to Administrator
-- profiles columns: id, email, display_name, role, created_at, updated_at
-- (NO username column — app maps User → {sanitized}@plaboratory.app)
--
-- Prefer the fuller one-paste: supabase/DIAGNOSE_AND_PROMOTE.sql
-- This file is the shorter promote path (still repairs missing profiles).
--
-- Run AFTER APPLY_ALL and AFTER she has Create-account'd at least once.
-- Paste into Supabase → SQL → New query → Run → hard-refresh / sign out+in.
-- =============================================================================

-- Repair: insert profiles for auth users that somehow missed the signup trigger
insert into public.profiles (id, email, display_name, role)
select
  u.id,
  coalesce(nullif(trim(u.email), ''), u.id::text || '@plaboratory.app'),
  coalesce(
    nullif(trim(u.raw_user_meta_data->>'display_name'), ''),
    nullif(split_part(coalesce(u.email, ''), '@', 1), ''),
    'user'
  ),
  'student'::public.user_role
from auth.users u
where not exists (select 1 from public.profiles p where p.id = u.id)
on conflict (id) do nothing;

insert into public.user_preferences (user_id)
select u.id
from auth.users u
where not exists (select 1 from public.user_preferences up where up.user_id = u.id)
on conflict (user_id) do nothing;

-- Keep profile.email aligned with auth.users
update public.profiles p
set
  email = coalesce(nullif(trim(u.email), ''), p.email),
  display_name = coalesce(
    nullif(trim(p.display_name), ''),
    nullif(trim(u.raw_user_meta_data->>'display_name'), ''),
    nullif(split_part(coalesce(u.email, ''), '@', 1), ''),
    p.display_name
  ),
  updated_at = now()
from auth.users u
where u.id = p.id
  and (
    nullif(trim(p.email), '') is null
    or (nullif(trim(u.email), '') is not null and lower(p.email) is distinct from lower(u.email))
  );

-- Bypass client role-guard (SQL editor has no auth.uid / is_admin)
alter table public.profiles disable trigger profiles_protect_role;

with sole as (
  select count(*)::int as n from public.profiles
),
targets as (
  select p.id
  from public.profiles p
  left join auth.users u on u.id = p.id
  cross join sole
  where
    lower(split_part(coalesce(p.email, ''), '@', 1)) like 'amelia%'
    or lower(coalesce(p.email, '')) like 'amelia%'
    or lower(split_part(coalesce(u.email, ''), '@', 1)) like 'amelia%'
    or lower(coalesce(u.email, '')) like 'amelia%'
    or lower(replace(coalesce(p.display_name, ''), ' ', '')) like 'amelia%'
    or lower(coalesce(p.email, '')) = 'ameliaphillips1324@gmail.com'
    or lower(coalesce(u.email, '')) = 'ameliaphillips1324@gmail.com'
    or sole.n = 1
)
update public.profiles p
set
  role = 'admin',
  display_name = 'Amelia',
  updated_at = now()
from targets t
where p.id = t.id
returning p.id, p.email, p.display_name, p.role, p.updated_at;

alter table public.profiles enable trigger profiles_protect_role;

-- Confirm admins
select p.id, p.email, p.display_name, p.role, u.email as auth_email, p.updated_at
from public.profiles p
left join auth.users u on u.id = p.id
where p.role = 'admin'
order by p.updated_at desc;
