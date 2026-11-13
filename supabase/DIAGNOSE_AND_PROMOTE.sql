-- =============================================================================
-- DIAGNOSE_AND_PROMOTE.sql  (one paste)
-- profiles columns: id, email, display_name, role, created_at, updated_at
-- (NO username column — app maps User → {sanitized}@plaboratory.app)
--
-- 1) Lists auth.users
-- 2) Inserts missing profiles with email = auth.users.email (NOT NULL)
-- 3) Promotes amelia* (ci) on email/display OR sole user
--    → role = admin, display_name = 'Amelia', email synced from auth
-- 4) Prints clear SELECT results
--
-- Supabase → SQL → New query → Paste → Run → sign out / in.
-- =============================================================================

-- 1) Auth users
select
  '1_auth_users' as step,
  u.id,
  u.email as auth_email,
  u.created_at,
  u.raw_user_meta_data->>'display_name' as meta_display_name
from auth.users u
order by u.created_at;

-- 2) Profiles before
select
  '2_profiles_before' as step,
  p.id,
  p.email,
  p.display_name,
  p.role
from public.profiles p
order by p.created_at;

-- 3) Insert missing profiles — email ALWAYS from auth.users.email (never null)
insert into public.profiles (id, email, display_name, role)
select
  u.id,
  coalesce(
    nullif(trim(u.email), ''),
    lower(coalesce(nullif(trim(u.raw_user_meta_data->>'display_name'), ''), 'user'))
      || '@plaboratory.app'
  ) as email,
  coalesce(
    nullif(trim(u.raw_user_meta_data->>'display_name'), ''),
    nullif(split_part(coalesce(u.email, ''), '@', 1), ''),
    'user'
  ) as display_name,
  'student'::public.user_role
from auth.users u
where not exists (select 1 from public.profiles p where p.id = u.id);

insert into public.user_preferences (user_id)
select u.id
from auth.users u
where not exists (select 1 from public.user_preferences up where up.user_id = u.id)
on conflict (user_id) do nothing;

-- Sync every profile.email from auth.users.email (auth is source of truth)
update public.profiles p
set
  email = coalesce(
    nullif(trim(u.email), ''),
    nullif(trim(p.email), ''),
    p.id::text || '@plaboratory.app'
  ),
  updated_at = now()
from auth.users u
where u.id = p.id
  and p.email is distinct from coalesce(
    nullif(trim(u.email), ''),
    nullif(trim(p.email), ''),
    p.id::text || '@plaboratory.app'
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

-- 4) Promote (bypass client role-guard — SQL editor has no auth.uid)
alter table public.profiles disable trigger profiles_protect_role;

with sole as (
  select count(*)::int as n from public.profiles
),
targets as (
  select p.id
  from public.profiles p
  inner join auth.users u on u.id = p.id
  cross join sole
  where
    lower(split_part(coalesce(u.email, p.email, ''), '@', 1)) like 'amelia%'
    or lower(coalesce(u.email, '')) like 'amelia%'
    or lower(coalesce(p.email, '')) like 'amelia%'
    or lower(replace(coalesce(p.display_name, ''), ' ', '')) like 'amelia%'
    or lower(coalesce(u.email, p.email, '')) = 'ameliaphillips1324@gmail.com'
    or sole.n = 1
)
update public.profiles p
set
  role = 'admin',
  display_name = 'Amelia',
  email = coalesce(
    nullif(trim(u.email), ''),
    nullif(trim(p.email), ''),
    'amelia@plaboratory.app'
  ),
  updated_at = now()
from targets t
inner join auth.users u on u.id = t.id
where p.id = t.id
returning
  '4_promoted' as step,
  p.id,
  p.email,
  p.display_name,
  p.role,
  p.updated_at;

alter table public.profiles enable trigger profiles_protect_role;

-- 5) Admins
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

-- 6) Counts
select
  '6_counts' as step,
  (select count(*) from auth.users) as auth_user_count,
  (select count(*) from public.profiles) as profile_count,
  (select count(*) from public.profiles where role = 'admin') as admin_count;
