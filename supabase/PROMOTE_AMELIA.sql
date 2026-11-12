-- =============================================================================
-- Promote Amelia to Administrator
-- Run AFTER supabase/APPLY_ALL.sql and AFTER she has created her account
-- (User: amelia → Auth email amelia@plaboratory.app).
-- Paste into Supabase → SQL → New query → Run.
-- =============================================================================

update public.profiles
set
  role = 'admin',
  display_name = coalesce(nullif(trim(display_name), ''), 'amelia'),
  updated_at = now()
where lower(coalesce(display_name, '')) = 'amelia'
   or lower(email) in ('amelia@plaboratory.app', 'ameliaphillips1324@gmail.com')
   or lower(email) like 'amelia%@plaboratory.app';

-- Confirm:
select id, email, display_name, role
from public.profiles
where role = 'admin'
order by created_at;
