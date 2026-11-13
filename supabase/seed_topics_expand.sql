-- =============================================================================
-- Expand / rename PLAB 1 topics to Amelia’s full list (safe to re-run)
-- Amelia: paste this in Supabase SQL → Run → hard-refresh the site
-- Display order is alphabetical by name (sort_order + UI order by name).
-- =============================================================================
-- IMPORTANT: public.topics has NO updated_at column (only created_at).
-- Do not set updated_at here — that caused ERROR 42703.
-- Existing topic IDs kept (question FKs stay valid). Slugs for remapped rows
-- stay stable. New rows: Urology, Vascular (IDs 031–032).
-- Renal renamed from “Renal and Urology”. ENT kept. All seeded topics stay
-- is_active = true so Home shows every specialty even with 0 questions.

insert into public.topics (id, exam_id, slug, name, sort_order, is_active) values
  ('a2000000-0000-4000-8000-000000000023', 'a1000000-0000-4000-8000-000000000001', 'acute-emergency-medicine', 'Acute and Emergency Medicine', 10, true),
  ('a2000000-0000-4000-8000-000000000022', 'a1000000-0000-4000-8000-000000000001', 'breast-surgery', 'Breast Surgery', 20, true),
  ('a2000000-0000-4000-8000-000000000024', 'a1000000-0000-4000-8000-000000000001', 'cancer', 'Cancer', 30, true),
  ('a2000000-0000-4000-8000-000000000001', 'a1000000-0000-4000-8000-000000000001', 'cardiology', 'Cardiovascular', 40, true),
  ('a2000000-0000-4000-8000-000000000025', 'a1000000-0000-4000-8000-000000000001', 'clinical-imaging', 'Clinical Imaging', 50, true),
  ('a2000000-0000-4000-8000-000000000012', 'a1000000-0000-4000-8000-000000000001', 'dermatology', 'Dermatology', 60, true),
  ('a2000000-0000-4000-8000-000000000026', 'a1000000-0000-4000-8000-000000000001', 'ent', 'ENT', 70, true),
  ('a2000000-0000-4000-8000-000000000004', 'a1000000-0000-4000-8000-000000000001', 'endocrine', 'Endocrine, Diabetes and Metabolic', 80, true),
  ('a2000000-0000-4000-8000-000000000013', 'a1000000-0000-4000-8000-000000000001', 'ethics-uk-practice', 'Ethics and UK Practice', 90, true),
  ('a2000000-0000-4000-8000-000000000003', 'a1000000-0000-4000-8000-000000000001', 'gastroenterology', 'Gastroenterology', 100, true),
  ('a2000000-0000-4000-8000-000000000027', 'a1000000-0000-4000-8000-000000000001', 'general-practice-primary-healthcare', 'General Practice and Primary Healthcare', 110, true),
  ('a2000000-0000-4000-8000-000000000014', 'a1000000-0000-4000-8000-000000000001', 'haematology', 'Haematology', 120, true),
  ('a2000000-0000-4000-8000-000000000028', 'a1000000-0000-4000-8000-000000000001', 'human-factors-quality-improvement', 'Human Factors and Quality Improvement', 130, true),
  ('a2000000-0000-4000-8000-000000000010', 'a1000000-0000-4000-8000-000000000001', 'infectious-disease', 'Infectious Disease', 140, true),
  ('a2000000-0000-4000-8000-000000000029', 'a1000000-0000-4000-8000-000000000001', 'medicine-older-adult', 'Medicine of the Older Adult', 150, true),
  ('a2000000-0000-4000-8000-000000000007', 'a1000000-0000-4000-8000-000000000001', 'psychiatry', 'Mental Health', 160, true),
  ('a2000000-0000-4000-8000-000000000011', 'a1000000-0000-4000-8000-000000000001', 'musculoskeletal', 'Musculoskeletal', 170, true),
  ('a2000000-0000-4000-8000-000000000006', 'a1000000-0000-4000-8000-000000000001', 'neurology', 'Neurosciences', 180, true),
  ('a2000000-0000-4000-8000-000000000008', 'a1000000-0000-4000-8000-000000000001', 'obstetrics-gynaecology', 'Obstetrics and Gynaecology', 190, true),
  ('a2000000-0000-4000-8000-000000000015', 'a1000000-0000-4000-8000-000000000001', 'ophthalmology', 'Ophthalmology', 200, true),
  ('a2000000-0000-4000-8000-000000000016', 'a1000000-0000-4000-8000-000000000001', 'orthopaedics', 'Orthopaedics', 210, true),
  ('a2000000-0000-4000-8000-000000000009', 'a1000000-0000-4000-8000-000000000001', 'paediatrics', 'Paediatrics', 220, true),
  ('a2000000-0000-4000-8000-000000000017', 'a1000000-0000-4000-8000-000000000001', 'palliative-end-of-life-care', 'Palliative Care and End of Life', 230, true),
  ('a2000000-0000-4000-8000-000000000018', 'a1000000-0000-4000-8000-000000000001', 'perioperative-anaesthesia', 'Perioperative and Anaesthesia', 240, true),
  ('a2000000-0000-4000-8000-000000000005', 'a1000000-0000-4000-8000-000000000001', 'renal', 'Renal', 250, true),
  ('a2000000-0000-4000-8000-000000000002', 'a1000000-0000-4000-8000-000000000001', 'respiratory', 'Respiratory', 260, true),
  ('a2000000-0000-4000-8000-000000000019', 'a1000000-0000-4000-8000-000000000001', 'rheumatology', 'Rheumatology', 270, true),
  ('a2000000-0000-4000-8000-000000000020', 'a1000000-0000-4000-8000-000000000001', 'sexual-health', 'Sexual Health', 280, true),
  ('a2000000-0000-4000-8000-000000000021', 'a1000000-0000-4000-8000-000000000001', 'social-population-health', 'Social and Population Health', 290, true),
  ('a2000000-0000-4000-8000-000000000030', 'a1000000-0000-4000-8000-000000000001', 'surgery', 'Surgery', 300, true),
  ('a2000000-0000-4000-8000-000000000031', 'a1000000-0000-4000-8000-000000000001', 'urology', 'Urology', 310, true),
  ('a2000000-0000-4000-8000-000000000032', 'a1000000-0000-4000-8000-000000000001', 'vascular', 'Vascular', 320, true)
on conflict (id) do update
  set slug = excluded.slug,
      name = excluded.name,
      sort_order = excluded.sort_order,
      is_active = true;

-- Ensure every seeded specialty is visible (do not hide empty banks)
update public.topics
set is_active = true
where exam_id = 'a1000000-0000-4000-8000-000000000001'
  and slug in (
    'acute-emergency-medicine', 'breast-surgery', 'cancer', 'cardiology',
    'clinical-imaging', 'dermatology', 'ent', 'endocrine', 'ethics-uk-practice',
    'gastroenterology', 'general-practice-primary-healthcare', 'haematology',
    'human-factors-quality-improvement', 'infectious-disease', 'medicine-older-adult',
    'psychiatry', 'musculoskeletal', 'neurology', 'obstetrics-gynaecology',
    'ophthalmology', 'orthopaedics', 'paediatrics', 'palliative-end-of-life-care',
    'perioperative-anaesthesia', 'renal', 'respiratory', 'rheumatology',
    'sexual-health', 'social-population-health', 'surgery', 'urology', 'vascular'
  );

-- Alphabetical sort_order from name
with ranked as (
  select id, (row_number() over (order by lower(name))) * 10 as sort_order
  from public.topics
  where exam_id = 'a1000000-0000-4000-8000-000000000001'
    and is_active = true
)
update public.topics t
set sort_order = ranked.sort_order
from ranked
where t.id = ranked.id;

-- Confirm (alphabetical) — expect Urology, Vascular, ENT among others
select slug, name, sort_order, is_active
from public.topics
where exam_id = 'a1000000-0000-4000-8000-000000000001'
  and is_active = true
order by name;
