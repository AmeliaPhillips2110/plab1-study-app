-- =============================================================================
-- Promote Amelia to Administrator (shorter path)
-- profiles: id, email, display_name, role — NO username column
-- Prefer: supabase/DIAGNOSE_AND_PROMOTE.sql
--
-- Always sets email from auth.users.email and display_name = 'Amelia' on promote.
-- Paste → Run → sign out / in.
-- =============================================================================

-- Missing profiles: email MUST be non-null (from auth.users.email)
insert into public.profiles (id, email, display_name, role)
select
  u.id,
  coalesce(
    nullif(trim(u.email), ''),
    lower(coalesce(nullif(trim(u.raw_user_meta_data->>'display_name'), ''), 'user'))
      || '@plaboratory.app'
  ),
  coalesce(
    nullif(trim(u.raw_user_meta_data->>'display_name'), ''),
    nullif(split_part(coalesce(u.email, ''), '@', 1), ''),
    'user'
  ),
  'student'::public.user_role
from auth.users u
where not exists (select 1 from public.profiles p where p.id = u.id);

insert into public.user_preferences (user_id)
select u.id
from auth.users u
where not exists (select 1 from public.user_preferences up where up.user_id = u.id)
on conflict (user_id) do nothing;

-- Sync email from auth
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
returning p.id, p.email, p.display_name, p.role, p.updated_at;

alter table public.profiles enable trigger profiles_protect_role;

select p.id, p.email, p.display_name, p.role, u.email as auth_email, p.updated_at
from public.profiles p
left join auth.users u on u.id = p.id
where p.role = 'admin'
order by p.updated_at desc;
