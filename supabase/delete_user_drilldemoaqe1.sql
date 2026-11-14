-- =============================================================================
-- Delete demo/auth user: drilldemoaqe1
-- Paste in Supabase SQL Editor (service role / dashboard). Safe to re-run.
--
-- Username auth maps User → {username}@plaboratory.app (see DIAGNOSE_AND_PROMOTE.sql).
-- Child rows (attempts, study_sessions, spaced_repetition_state, user_preferences,
-- question_flags, mistake_tags via attempts) cascade from profiles / auth.users.
-- =============================================================================

do $$
declare
  target_id uuid;
  target_email text := 'drilldemoaqe1@plaboratory.app';
begin
  select p.id into target_id
  from public.profiles p
  where lower(coalesce(p.display_name, '')) = 'drilldemoaqe1'
     or lower(coalesce(p.email, '')) = target_email
  limit 1;

  if target_id is null then
    select u.id into target_id
    from auth.users u
    where lower(coalesce(u.email, '')) = target_email
       or lower(coalesce(u.raw_user_meta_data->>'display_name', '')) = 'drilldemoaqe1'
    limit 1;
  end if;

  if target_id is null then
    raise notice 'No user found for drilldemoaqe1 — nothing to delete.';
    return;
  end if;

  -- Prefer deleting auth.users; profiles + dependents cascade via FK.
  delete from auth.users where id = target_id;

  -- Belt-and-braces if orphan profile remains (e.g. auth already gone).
  delete from public.profiles where id = target_id;

  raise notice 'Deleted user drilldemoaqe1 (id %).', target_id;
end $$;

-- Verify
select 'auth.users' as source, id, email
from auth.users
where lower(coalesce(email, '')) = 'drilldemoaqe1@plaboratory.app'
   or lower(coalesce(raw_user_meta_data->>'display_name', '')) = 'drilldemoaqe1';

select 'profiles' as source, id, email, display_name, role
from public.profiles
where lower(coalesce(display_name, '')) = 'drilldemoaqe1'
   or lower(coalesce(email, '')) = 'drilldemoaqe1@plaboratory.app';
