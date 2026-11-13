-- =============================================================================
-- Expand / rename PLAB 1 topics (safe to re-run)
-- profiles/questions unchanged. Amelia: paste this in Supabase SQL → Run
-- (or re-run APPLY_ALL / seed.sql which embeds the same list).
-- =============================================================================

-- Rename existing specialties to requested spellings
update public.topics
set name = 'Obstetrics and Gynaecology', updated_at = now()
where id = 'a2000000-0000-4000-8000-000000000008';

update public.topics
set name = 'Nephrology (Renal)', updated_at = now()
where id = 'a2000000-0000-4000-8000-000000000005';

update public.topics
set name = 'Respiratory', updated_at = now()
where id = 'a2000000-0000-4000-8000-000000000002';

-- Upsert full required set (existing IDs kept; new IDs 015+)
insert into public.topics (id, exam_id, slug, name, sort_order, is_active) values
  ('a2000000-0000-4000-8000-000000000001', 'a1000000-0000-4000-8000-000000000001', 'cardiology', 'Cardiology', 10, true),
  ('a2000000-0000-4000-8000-000000000002', 'a1000000-0000-4000-8000-000000000001', 'respiratory', 'Respiratory', 20, true),
  ('a2000000-0000-4000-8000-000000000003', 'a1000000-0000-4000-8000-000000000001', 'gastroenterology', 'Gastroenterology', 30, true),
  ('a2000000-0000-4000-8000-000000000004', 'a1000000-0000-4000-8000-000000000001', 'endocrine', 'Endocrinology', 40, true),
  ('a2000000-0000-4000-8000-000000000005', 'a1000000-0000-4000-8000-000000000001', 'renal', 'Nephrology (Renal)', 50, true),
  ('a2000000-0000-4000-8000-000000000006', 'a1000000-0000-4000-8000-000000000001', 'neurology', 'Neurology', 60, true),
  ('a2000000-0000-4000-8000-000000000007', 'a1000000-0000-4000-8000-000000000001', 'psychiatry', 'Psychiatry', 70, true),
  ('a2000000-0000-4000-8000-000000000008', 'a1000000-0000-4000-8000-000000000001', 'obstetrics-gynaecology', 'Obstetrics and Gynaecology', 80, true),
  ('a2000000-0000-4000-8000-000000000009', 'a1000000-0000-4000-8000-000000000001', 'paediatrics', 'Paediatrics', 90, true),
  ('a2000000-0000-4000-8000-000000000010', 'a1000000-0000-4000-8000-000000000001', 'infectious-disease', 'Infectious Disease', 100, true),
  ('a2000000-0000-4000-8000-000000000011', 'a1000000-0000-4000-8000-000000000001', 'musculoskeletal', 'Musculoskeletal', 110, true),
  ('a2000000-0000-4000-8000-000000000012', 'a1000000-0000-4000-8000-000000000001', 'dermatology', 'Dermatology', 120, true),
  ('a2000000-0000-4000-8000-000000000013', 'a1000000-0000-4000-8000-000000000001', 'ethics-uk-practice', 'Ethics & UK Practice', 130, true),
  ('a2000000-0000-4000-8000-000000000014', 'a1000000-0000-4000-8000-000000000001', 'haematology', 'Haematology', 140, true),
  ('a2000000-0000-4000-8000-000000000015', 'a1000000-0000-4000-8000-000000000001', 'ophthalmology', 'Ophthalmology', 150, true),
  ('a2000000-0000-4000-8000-000000000016', 'a1000000-0000-4000-8000-000000000001', 'orthopaedics', 'Orthopaedics', 160, true),
  ('a2000000-0000-4000-8000-000000000017', 'a1000000-0000-4000-8000-000000000001', 'palliative-end-of-life-care', 'Palliative and End of Life Care', 170, true),
  ('a2000000-0000-4000-8000-000000000018', 'a1000000-0000-4000-8000-000000000001', 'perioperative-anaesthesia', 'Perioperative Medicine and Anaesthesia', 180, true),
  ('a2000000-0000-4000-8000-000000000019', 'a1000000-0000-4000-8000-000000000001', 'rheumatology', 'Rheumatology', 190, true),
  ('a2000000-0000-4000-8000-000000000020', 'a1000000-0000-4000-8000-000000000001', 'sexual-health', 'Sexual Health', 200, true),
  ('a2000000-0000-4000-8000-000000000021', 'a1000000-0000-4000-8000-000000000001', 'social-population-health', 'Social and Population Health', 210, true)
on conflict (id) do update
  set slug = excluded.slug,
      name = excluded.name,
      sort_order = excluded.sort_order,
      is_active = true;

-- Confirm
select slug, name, sort_order
from public.topics
where exam_id = 'a1000000-0000-4000-8000-000000000001'
order by sort_order;
