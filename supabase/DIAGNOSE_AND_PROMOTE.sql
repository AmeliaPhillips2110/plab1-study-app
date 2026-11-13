-- =============================================================================
-- DIAGNOSE_AND_PROMOTE.sql  (one paste)
-- profiles columns are: id, email, display_name, role, created_at, updated_at
-- (NO username column — usernames live as auth email local-part @plaboratory.app)
--
-- What this does:
--   1) Lists auth.users
--   2) Inserts any missing public.profiles rows from auth.users
--   3) Promotes profiles whose email OR display_name starts with amelia (ci)
--      OR every profile if there is only one user
--   4) Prints who was promoted + final admin list
--
-- Paste into Supabase → SQL → New query → Run.
-- Then hard-refresh the app (or sign out / in).
-- =============================================================================

-- 1) Auth users (source of truth for signup)
select
  '1_auth_users' as step,
  u.id,
  u.email,
  u.created_at,
  u.raw_user_meta_data->>'display_name' as meta_display_name
from auth.users u
order by u.created_at;

-- 2) Profiles before repair
select
  '2_profiles_before' as step,
  p.id,
  p.email,
  p.display_name,
  p.role
from public.profiles p
order by p.created_at;

-- 3) Create missing profiles for every auth user (idempotent)
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
on conflict (id) do update
  set email = excluded.email,
      display_name = coalesce(nullif(trim(public.profiles.display_name), ''), excluded.display_name),
      updated_at = now();

-- Also ensure preferences exist
insert into public.user_preferences (user_id)
select u.id
from auth.users u
where not exists (select 1 from public.user_preferences up where up.user_id = u.id)
on conflict (user_id) do nothing;

-- Sync profile.email from auth when blank / mismatched local-part empty
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

select
  '3_profiles_after_insert' as step,
  p.id,
  p.email,
  p.display_name,
  p.role,
  u.email as auth_email
from public.profiles p
left join auth.users u on u.id = p.id
order by p.created_at;

-- 4) Promote: amelia* email/display_name, or sole profile
-- Bypass client role-guard trigger (SQL editor has no auth.uid / is_admin).
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
    -- email local-part or full email starts with amelia
    lower(split_part(coalesce(p.email, ''), '@', 1)) like 'amelia%'
    or lower(coalesce(p.email, '')) like 'amelia%'
    or lower(split_part(coalesce(u.email, ''), '@', 1)) like 'amelia%'
    or lower(coalesce(u.email, '')) like 'amelia%'
    -- display_name starts with amelia (spaces stripped)
    or lower(replace(coalesce(p.display_name, ''), ' ', '')) like 'amelia%'
    -- known gmail used in early setup notes
    or lower(coalesce(p.email, '')) = 'ameliaphillips1324@gmail.com'
    or lower(coalesce(u.email, '')) = 'ameliaphillips1324@gmail.com'
    -- only one account in the project → promote them
    or sole.n = 1
)
update public.profiles p
set
  role = 'admin',
  display_name = 'Amelia',
  updated_at = now()
from targets t
where p.id = t.id
returning
  '4_promoted' as step,
  p.id,
  p.email,
  p.display_name,
  p.role,
  p.updated_at;

alter table public.profiles enable trigger profiles_protect_role;

-- 5) Final admin check
select
  '5_admins' as step,
  p.id,
  p.email,
  p.display_name,
  p.role,
  u.email as auth_email
from public.profiles p
left join auth.users u on u.id = p.id
where p.role = 'admin'
order by p.updated_at desc;

-- 6) If this returns 0 rows, no auth users exist yet — Create account in the app first
select
  '6_counts' as step,
  (select count(*) from auth.users) as auth_user_count,
  (select count(*) from public.profiles) as profile_count,
  (select count(*) from public.profiles where role = 'admin') as admin_count;
