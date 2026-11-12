-- =============================================================================
-- Promote Amelia to Administrator
-- Run AFTER supabase/APPLY_ALL.sql and AFTER she has created her account
-- (User: amelia → Auth email amelia@plaboratory.app).
-- Safe to re-run. Paste into Supabase → SQL → New query → Run.
-- Then hard-refresh the app (or sign out / in) so the Admin badge appears.
-- =============================================================================

update public.profiles
set
  role = 'admin',
  display_name = coalesce(nullif(trim(display_name), ''), 'amelia'),
  updated_at = now()
where lower(coalesce(display_name, '')) in ('amelia', 'ameliabelsey', 'amelia belsey')
   or lower(email) in (
     'amelia@plaboratory.app',
     'ameliaphillips1324@gmail.com',
     'ameliabelsey@plaboratory.app'
   )
   or lower(email) like 'amelia%@plaboratory.app'
   or lower(split_part(email, '@', 1)) like 'amelia%';

-- Confirm (expect role = admin):
select id, email, display_name, role, updated_at
from public.profiles
where role = 'admin'
   or lower(coalesce(display_name, '')) like 'amelia%'
   or lower(email) like 'amelia%'
order by updated_at desc;
