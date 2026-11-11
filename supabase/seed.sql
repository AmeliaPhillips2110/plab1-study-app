-- PLABoratory Stage a seed — original SAMPLE/UNVERIFIED teaching items (not from commercial banks)
-- Run AFTER migrations. Safe to re-run for exam/topics if using ON CONFLICT.

insert into public.exams (id, slug, name, description, is_active)
values (
  'a1000000-0000-4000-8000-000000000001',
  'plab1',
  'PLAB 1',
  'PLAB 1 single best answer study bank (PLABoratory).',
  true
)
on conflict (slug) do update set name = excluded.name, description = excluded.description, is_active = excluded.is_active, updated_at = now();

insert into public.exam_settings (exam_id, pass_mark_percent, default_mock_question_count, default_mock_minutes)
values ('a1000000-0000-4000-8000-000000000001', 65.00, 180, 180)
on conflict (exam_id) do update set pass_mark_percent = excluded.pass_mark_percent;

insert into public.topics (id, exam_id, slug, name, sort_order, is_active) values ('a2000000-0000-4000-8000-000000000001', 'a1000000-0000-4000-8000-000000000001', 'cardiology', 'Cardiology', 10, true) on conflict (exam_id, slug) do update set name = excluded.name, sort_order = excluded.sort_order, is_active = true;
insert into public.topics (id, exam_id, slug, name, sort_order, is_active) values ('a2000000-0000-4000-8000-000000000002', 'a1000000-0000-4000-8000-000000000001', 'respiratory', 'Respiratory', 20, true) on conflict (exam_id, slug) do update set name = excluded.name, sort_order = excluded.sort_order, is_active = true;
insert into public.topics (id, exam_id, slug, name, sort_order, is_active) values ('a2000000-0000-4000-8000-000000000003', 'a1000000-0000-4000-8000-000000000001', 'gastroenterology', 'Gastroenterology', 30, true) on conflict (exam_id, slug) do update set name = excluded.name, sort_order = excluded.sort_order, is_active = true;
insert into public.topics (id, exam_id, slug, name, sort_order, is_active) values ('a2000000-0000-4000-8000-000000000004', 'a1000000-0000-4000-8000-000000000001', 'endocrine', 'Endocrinology', 40, true) on conflict (exam_id, slug) do update set name = excluded.name, sort_order = excluded.sort_order, is_active = true;
insert into public.topics (id, exam_id, slug, name, sort_order, is_active) values ('a2000000-0000-4000-8000-000000000005', 'a1000000-0000-4000-8000-000000000001', 'renal', 'Renal', 50, true) on conflict (exam_id, slug) do update set name = excluded.name, sort_order = excluded.sort_order, is_active = true;
insert into public.topics (id, exam_id, slug, name, sort_order, is_active) values ('a2000000-0000-4000-8000-000000000006', 'a1000000-0000-4000-8000-000000000001', 'neurology', 'Neurology', 60, true) on conflict (exam_id, slug) do update set name = excluded.name, sort_order = excluded.sort_order, is_active = true;
insert into public.topics (id, exam_id, slug, name, sort_order, is_active) values ('a2000000-0000-4000-8000-000000000007', 'a1000000-0000-4000-8000-000000000001', 'psychiatry', 'Psychiatry', 70, true) on conflict (exam_id, slug) do update set name = excluded.name, sort_order = excluded.sort_order, is_active = true;
insert into public.topics (id, exam_id, slug, name, sort_order, is_active) values ('a2000000-0000-4000-8000-000000000008', 'a1000000-0000-4000-8000-000000000001', 'obstetrics-gynaecology', 'Obstetrics & Gynaecology', 80, true) on conflict (exam_id, slug) do update set name = excluded.name, sort_order = excluded.sort_order, is_active = true;
insert into public.topics (id, exam_id, slug, name, sort_order, is_active) values ('a2000000-0000-4000-8000-000000000009', 'a1000000-0000-4000-8000-000000000001', 'paediatrics', 'Paediatrics', 90, true) on conflict (exam_id, slug) do update set name = excluded.name, sort_order = excluded.sort_order, is_active = true;
insert into public.topics (id, exam_id, slug, name, sort_order, is_active) values ('a2000000-0000-4000-8000-000000000010', 'a1000000-0000-4000-8000-000000000001', 'infectious-disease', 'Infectious Disease', 100, true) on conflict (exam_id, slug) do update set name = excluded.name, sort_order = excluded.sort_order, is_active = true;
insert into public.topics (id, exam_id, slug, name, sort_order, is_active) values ('a2000000-0000-4000-8000-000000000011', 'a1000000-0000-4000-8000-000000000001', 'musculoskeletal', 'Musculoskeletal', 110, true) on conflict (exam_id, slug) do update set name = excluded.name, sort_order = excluded.sort_order, is_active = true;
insert into public.topics (id, exam_id, slug, name, sort_order, is_active) values ('a2000000-0000-4000-8000-000000000012', 'a1000000-0000-4000-8000-000000000001', 'dermatology', 'Dermatology', 120, true) on conflict (exam_id, slug) do update set name = excluded.name, sort_order = excluded.sort_order, is_active = true;
insert into public.topics (id, exam_id, slug, name, sort_order, is_active) values ('a2000000-0000-4000-8000-000000000013', 'a1000000-0000-4000-8000-000000000001', 'ethics-uk-practice', 'Ethics & UK Practice', 130, true) on conflict (exam_id, slug) do update set name = excluded.name, sort_order = excluded.sort_order, is_active = true;
insert into public.topics (id, exam_id, slug, name, sort_order, is_active) values ('a2000000-0000-4000-8000-000000000014', 'a1000000-0000-4000-8000-000000000001', 'haematology', 'Haematology', 140, true) on conflict (exam_id, slug) do update set name = excluded.name, sort_order = excluded.sort_order, is_active = true;

insert into public.tags (id, exam_id, slug, label, category) values
  ('a3000000-0000-4000-8000-000000000001', 'a1000000-0000-4000-8000-000000000001', 'uk-practice', 'UK practice', 'uk_practice'),
  ('a3000000-0000-4000-8000-000000000002', 'a1000000-0000-4000-8000-000000000001', 'sample-unverified', 'Sample / unverified', 'meta')
on conflict (exam_id, slug) do nothing;

-- Minimal glossary
insert into public.glossary_terms (exam_id, term, definition, aliases, is_active) values
  ('a1000000-0000-4000-8000-000000000001', 'SBA', 'Single Best Answer — one correct option among several.', array['single best answer'], true),
  ('a1000000-0000-4000-8000-000000000001', 'CURB-65', 'Severity score for community-acquired pneumonia (Confusion, Urea, Respiratory rate, Blood pressure, age ≥65).', array['CURB65'], true)
on conflict (exam_id, term) do nothing;

-- Clear previous sample questions (by meta tag) is skipped for safety; inserts use fixed IDs.

-- Q1
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('a4000000-0000-4000-8000-000000000001', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000001', 'sba', 'A 58-year-old man presents with central chest pain radiating to the left arm for 40 minutes. He is sweaty and nauseated. ECG shows ST elevation in leads II, III and aVF. Which coronary artery is most likely occluded?', 'SAMPLE/UNVERIFIED teaching item. Inferior STEMI typically reflects right coronary artery occlusion (less often circumflex).', 2, true, false, '{}'::jsonb) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, difficulty = excluded.difficulty, is_uk_practice = excluded.is_uk_practice, updated_at = now();
delete from public.question_options where question_id = 'a4000000-0000-4000-8000-000000000001';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('a5000000-0000-4000-8000-000100000000', 'a4000000-0000-4000-8000-000000000001', 'A', 'Left anterior descending', false, 0),
  ('a5000000-0000-4000-8000-000100000001', 'a4000000-0000-4000-8000-000000000001', 'B', 'Right coronary artery', true, 1),
  ('a5000000-0000-4000-8000-000100000002', 'a4000000-0000-4000-8000-000000000001', 'C', 'Left circumflex', false, 2),
  ('a5000000-0000-4000-8000-000100000003', 'a4000000-0000-4000-8000-000000000001', 'D', 'Left main stem', false, 3),
  ('a5000000-0000-4000-8000-000100000004', 'a4000000-0000-4000-8000-000000000001', 'E', 'Posterior descending only', false, 4);
insert into public.question_tags (question_id, tag_id) values ('a4000000-0000-4000-8000-000000000001', 'a3000000-0000-4000-8000-000000000002') on conflict do nothing;

-- Q2
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('a4000000-0000-4000-8000-000000000002', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000001', 'sba', 'A 72-year-old woman with heart failure has orthopnoea and bilateral basal crackles. Which first-line oral loop diuretic is most appropriate for acute fluid overload in primary care pending review?', 'SAMPLE/UNVERIFIED. Furosemide is commonly used as a loop diuretic for symptomatic fluid overload.', 3, true, false, '{}'::jsonb) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, difficulty = excluded.difficulty, is_uk_practice = excluded.is_uk_practice, updated_at = now();
delete from public.question_options where question_id = 'a4000000-0000-4000-8000-000000000002';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('a5000000-0000-4000-8000-000200000000', 'a4000000-0000-4000-8000-000000000002', 'A', 'Furosemide', true, 0),
  ('a5000000-0000-4000-8000-000200000001', 'a4000000-0000-4000-8000-000000000002', 'B', 'Spironolactone', false, 1),
  ('a5000000-0000-4000-8000-000200000002', 'a4000000-0000-4000-8000-000000000002', 'C', 'Amlodipine', false, 2),
  ('a5000000-0000-4000-8000-000200000003', 'a4000000-0000-4000-8000-000000000002', 'D', 'Digoxin', false, 3),
  ('a5000000-0000-4000-8000-000200000004', 'a4000000-0000-4000-8000-000000000002', 'E', 'Atenolol', false, 4);
insert into public.question_tags (question_id, tag_id) values ('a4000000-0000-4000-8000-000000000002', 'a3000000-0000-4000-8000-000000000002') on conflict do nothing;

-- Q3
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('a4000000-0000-4000-8000-000000000003', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000001', 'sba', 'According to common UK practice for suspected ACS in primary care before transfer, which immediate treatment is usually given if not contraindicated?', 'SAMPLE/UNVERIFIED UK-practice style item. Aspirin 300 mg is standard early antiplatelet therapy when ACS is suspected.', 3, true, true, '{}'::jsonb) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, difficulty = excluded.difficulty, is_uk_practice = excluded.is_uk_practice, updated_at = now();
delete from public.question_options where question_id = 'a4000000-0000-4000-8000-000000000003';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('a5000000-0000-4000-8000-000300000000', 'a4000000-0000-4000-8000-000000000003', 'A', 'IV heparin bolus only', false, 0),
  ('a5000000-0000-4000-8000-000300000001', 'a4000000-0000-4000-8000-000000000003', 'B', 'Routine thrombolysis in GP surgery', false, 1),
  ('a5000000-0000-4000-8000-000300000002', 'a4000000-0000-4000-8000-000000000003', 'C', 'Aspirin 300 mg', true, 2),
  ('a5000000-0000-4000-8000-000300000003', 'a4000000-0000-4000-8000-000000000003', 'D', 'Immediate digoxin loading', false, 3),
  ('a5000000-0000-4000-8000-000300000004', 'a4000000-0000-4000-8000-000000000003', 'E', 'High-dose ibuprofen', false, 4);
insert into public.question_tags (question_id, tag_id) values ('a4000000-0000-4000-8000-000000000003', 'a3000000-0000-4000-8000-000000000002') on conflict do nothing;
insert into public.question_tags (question_id, tag_id) values ('a4000000-0000-4000-8000-000000000003', 'a3000000-0000-4000-8000-000000000001') on conflict do nothing;

-- Q4
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('a4000000-0000-4000-8000-000000000004', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000002', 'sba', 'A 24-year-old with known asthma presents with wheeze, RR 28, speaking in short phrases, PEFR 45% of best. Which is the most appropriate initial nebulised treatment?', 'SAMPLE/UNVERIFIED. Nebulised salbutamol is first-line bronchodilator therapy in acute asthma.', 2, true, false, '{}'::jsonb) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, difficulty = excluded.difficulty, is_uk_practice = excluded.is_uk_practice, updated_at = now();
delete from public.question_options where question_id = 'a4000000-0000-4000-8000-000000000004';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('a5000000-0000-4000-8000-000400000000', 'a4000000-0000-4000-8000-000000000004', 'A', 'Salbutamol', true, 0),
  ('a5000000-0000-4000-8000-000400000001', 'a4000000-0000-4000-8000-000000000004', 'B', 'Ipratropium alone without beta-agonist', false, 1),
  ('a5000000-0000-4000-8000-000400000002', 'a4000000-0000-4000-8000-000000000004', 'C', 'IV aminophylline first', false, 2),
  ('a5000000-0000-4000-8000-000400000003', 'a4000000-0000-4000-8000-000000000004', 'D', 'Oral prednisolone only', false, 3),
  ('a5000000-0000-4000-8000-000400000004', 'a4000000-0000-4000-8000-000000000004', 'E', 'Nebulised adrenaline', false, 4);
insert into public.question_tags (question_id, tag_id) values ('a4000000-0000-4000-8000-000000000004', 'a3000000-0000-4000-8000-000000000002') on conflict do nothing;

-- Q5
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('a4000000-0000-4000-8000-000000000005', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000002', 'sba', 'A 68-year-old smoker has progressive dyspnoea and a chronic productive cough for 3 years. Spirometry shows FEV1/FVC 0.58. What is the most likely diagnosis?', 'SAMPLE/UNVERIFIED. Persistent productive cough + obstructive spirometry in a smoker suggests COPD.', 3, true, false, '{}'::jsonb) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, difficulty = excluded.difficulty, is_uk_practice = excluded.is_uk_practice, updated_at = now();
delete from public.question_options where question_id = 'a4000000-0000-4000-8000-000000000005';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('a5000000-0000-4000-8000-000500000000', 'a4000000-0000-4000-8000-000000000005', 'A', 'Asthma', false, 0),
  ('a5000000-0000-4000-8000-000500000001', 'a4000000-0000-4000-8000-000000000005', 'B', 'COPD', true, 1),
  ('a5000000-0000-4000-8000-000500000002', 'a4000000-0000-4000-8000-000000000005', 'C', 'Pulmonary fibrosis', false, 2),
  ('a5000000-0000-4000-8000-000500000003', 'a4000000-0000-4000-8000-000000000005', 'D', 'Bronchiectasis only', false, 3),
  ('a5000000-0000-4000-8000-000500000004', 'a4000000-0000-4000-8000-000000000005', 'E', 'Heart failure', false, 4);
insert into public.question_tags (question_id, tag_id) values ('a4000000-0000-4000-8000-000000000005', 'a3000000-0000-4000-8000-000000000002') on conflict do nothing;

-- Q6
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('a4000000-0000-4000-8000-000000000006', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000002', 'sba', 'A patient with community-acquired pneumonia is CURB-65 = 0 and clinically stable. In typical UK ambulatory care, which antibiotic class is commonly considered first-line (local guidance permitting)?', 'SAMPLE/UNVERIFIED. Amoxicillin is a frequent first-line choice for low-severity CAP when local resistance patterns allow.', 3, true, true, '{}'::jsonb) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, difficulty = excluded.difficulty, is_uk_practice = excluded.is_uk_practice, updated_at = now();
delete from public.question_options where question_id = 'a4000000-0000-4000-8000-000000000006';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('a5000000-0000-4000-8000-000600000000', 'a4000000-0000-4000-8000-000000000006', 'A', 'Amoxicillin', true, 0),
  ('a5000000-0000-4000-8000-000600000001', 'a4000000-0000-4000-8000-000000000006', 'B', 'IV vancomycin', false, 1),
  ('a5000000-0000-4000-8000-000600000002', 'a4000000-0000-4000-8000-000000000006', 'C', 'IV meropenem', false, 2),
  ('a5000000-0000-4000-8000-000600000003', 'a4000000-0000-4000-8000-000000000006', 'D', 'Oral ciprofloxacin routinely first', false, 3),
  ('a5000000-0000-4000-8000-000600000004', 'a4000000-0000-4000-8000-000000000006', 'E', 'No antibiotic ever', false, 4);
insert into public.question_tags (question_id, tag_id) values ('a4000000-0000-4000-8000-000000000006', 'a3000000-0000-4000-8000-000000000002') on conflict do nothing;
insert into public.question_tags (question_id, tag_id) values ('a4000000-0000-4000-8000-000000000006', 'a3000000-0000-4000-8000-000000000001') on conflict do nothing;

-- Q7
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('a4000000-0000-4000-8000-000000000007', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000003', 'sba', 'A 45-year-old man has epigastric pain relieved by food and worse at night. Urea breath test is positive. What is the most appropriate next management principle?', 'SAMPLE/UNVERIFIED. H. pylori positive dyspepsia is managed with eradication therapy (PPI + antibiotics per local protocol).', 2, true, false, '{}'::jsonb) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, difficulty = excluded.difficulty, is_uk_practice = excluded.is_uk_practice, updated_at = now();
delete from public.question_options where question_id = 'a4000000-0000-4000-8000-000000000007';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('a5000000-0000-4000-8000-000700000000', 'a4000000-0000-4000-8000-000000000007', 'A', 'Immediate laparotomy', false, 0),
  ('a5000000-0000-4000-8000-000700000001', 'a4000000-0000-4000-8000-000000000007', 'B', 'Long-term NSAID increase', false, 1),
  ('a5000000-0000-4000-8000-000700000002', 'a4000000-0000-4000-8000-000000000007', 'C', 'H. pylori eradication therapy', true, 2),
  ('a5000000-0000-4000-8000-000700000003', 'a4000000-0000-4000-8000-000000000007', 'D', 'High-dose opioids', false, 3),
  ('a5000000-0000-4000-8000-000700000004', 'a4000000-0000-4000-8000-000000000007', 'E', 'No treatment', false, 4);
insert into public.question_tags (question_id, tag_id) values ('a4000000-0000-4000-8000-000000000007', 'a3000000-0000-4000-8000-000000000002') on conflict do nothing;

-- Q8
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('a4000000-0000-4000-8000-000000000008', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000003', 'sba', 'A 60-year-old with cirrhosis develops confusion and a flapping tremor. Which emergency complication is most likely?', 'SAMPLE/UNVERIFIED. Asterixis with confusion in cirrhosis suggests hepatic encephalopathy.', 3, true, false, '{}'::jsonb) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, difficulty = excluded.difficulty, is_uk_practice = excluded.is_uk_practice, updated_at = now();
delete from public.question_options where question_id = 'a4000000-0000-4000-8000-000000000008';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('a5000000-0000-4000-8000-000800000000', 'a4000000-0000-4000-8000-000000000008', 'A', 'Acute pancreatitis', false, 0),
  ('a5000000-0000-4000-8000-000800000001', 'a4000000-0000-4000-8000-000000000008', 'B', 'Hepatic encephalopathy', true, 1),
  ('a5000000-0000-4000-8000-000800000002', 'a4000000-0000-4000-8000-000000000008', 'C', 'Myxoedema coma', false, 2),
  ('a5000000-0000-4000-8000-000800000003', 'a4000000-0000-4000-8000-000000000008', 'D', 'Hypocalcaemic tetany', false, 3),
  ('a5000000-0000-4000-8000-000800000004', 'a4000000-0000-4000-8000-000000000008', 'E', 'Addisonian crisis', false, 4);
insert into public.question_tags (question_id, tag_id) values ('a4000000-0000-4000-8000-000000000008', 'a3000000-0000-4000-8000-000000000002') on conflict do nothing;

-- Q9
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('a4000000-0000-4000-8000-000000000009', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000003', 'sba', 'A 28-year-old has bloody diarrhoea, urgency and cramping for 3 weeks. Colonoscopy shows continuous mucosal inflammation from the rectum. What is the most likely diagnosis?', 'SAMPLE/UNVERIFIED. Continuous rectal-starting colitis suggests ulcerative colitis rather than patchy Crohn''s.', 2, true, false, '{}'::jsonb) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, difficulty = excluded.difficulty, is_uk_practice = excluded.is_uk_practice, updated_at = now();
delete from public.question_options where question_id = 'a4000000-0000-4000-8000-000000000009';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('a5000000-0000-4000-8000-000900000000', 'a4000000-0000-4000-8000-000000000009', 'A', 'Ulcerative colitis', true, 0),
  ('a5000000-0000-4000-8000-000900000001', 'a4000000-0000-4000-8000-000000000009', 'B', 'Coeliac disease', false, 1),
  ('a5000000-0000-4000-8000-000900000002', 'a4000000-0000-4000-8000-000000000009', 'C', 'Diverticulitis', false, 2),
  ('a5000000-0000-4000-8000-000900000003', 'a4000000-0000-4000-8000-000000000009', 'D', 'IBS only', false, 3),
  ('a5000000-0000-4000-8000-000900000004', 'a4000000-0000-4000-8000-000000000009', 'E', 'Peptic ulcer', false, 4);
insert into public.question_tags (question_id, tag_id) values ('a4000000-0000-4000-8000-000000000009', 'a3000000-0000-4000-8000-000000000002') on conflict do nothing;

-- Q10
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('a4000000-0000-4000-8000-000000000010', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000004', 'sba', 'A 34-year-old woman has weight loss, heat intolerance, tremor and a smooth goitre. TSH is suppressed and free T4 is high. What is the most likely diagnosis?', 'SAMPLE/UNVERIFIED. Suppressed TSH with high T4 and typical symptoms indicate thyrotoxicosis (e.g. Graves'').', 2, true, false, '{}'::jsonb) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, difficulty = excluded.difficulty, is_uk_practice = excluded.is_uk_practice, updated_at = now();
delete from public.question_options where question_id = 'a4000000-0000-4000-8000-000000000010';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('a5000000-0000-4000-8000-001000000000', 'a4000000-0000-4000-8000-000000000010', 'A', 'Hypothyroidism', false, 0),
  ('a5000000-0000-4000-8000-001000000001', 'a4000000-0000-4000-8000-000000000010', 'B', 'Addison''s disease', false, 1),
  ('a5000000-0000-4000-8000-001000000002', 'a4000000-0000-4000-8000-000000000010', 'C', 'Cushing''s syndrome', false, 2),
  ('a5000000-0000-4000-8000-001000000003', 'a4000000-0000-4000-8000-000000000010', 'D', 'Thyrotoxicosis', true, 3),
  ('a5000000-0000-4000-8000-001000000004', 'a4000000-0000-4000-8000-000000000010', 'E', 'Hyperprolactinaemia', false, 4);
insert into public.question_tags (question_id, tag_id) values ('a4000000-0000-4000-8000-000000000010', 'a3000000-0000-4000-8000-000000000002') on conflict do nothing;

-- Q11
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('a4000000-0000-4000-8000-000000000011', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000004', 'sba', 'A patient with type 1 diabetes is sweaty, tremulous and confused with capillary glucose 2.4 mmol/L. What is the immediate priority?', 'SAMPLE/UNVERIFIED. Treat hypoglycaemia first with fast-acting carbohydrate (or glucagon/IV glucose if unable to swallow).', 3, true, false, '{}'::jsonb) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, difficulty = excluded.difficulty, is_uk_practice = excluded.is_uk_practice, updated_at = now();
delete from public.question_options where question_id = 'a4000000-0000-4000-8000-000000000011';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('a5000000-0000-4000-8000-001100000000', 'a4000000-0000-4000-8000-000000000011', 'A', 'Give fast-acting carbohydrate', true, 0),
  ('a5000000-0000-4000-8000-001100000001', 'a4000000-0000-4000-8000-000000000011', 'B', 'Give additional insulin', false, 1),
  ('a5000000-0000-4000-8000-001100000002', 'a4000000-0000-4000-8000-000000000011', 'C', 'Start metformin', false, 2),
  ('a5000000-0000-4000-8000-001100000003', 'a4000000-0000-4000-8000-000000000011', 'D', 'Order HbA1c only', false, 3),
  ('a5000000-0000-4000-8000-001100000004', 'a4000000-0000-4000-8000-000000000011', 'E', 'Fluid restrict', false, 4);
insert into public.question_tags (question_id, tag_id) values ('a4000000-0000-4000-8000-000000000011', 'a3000000-0000-4000-8000-000000000002') on conflict do nothing;

-- Q12
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('a4000000-0000-4000-8000-000000000012', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000004', 'sba', 'In UK practice, what is a common first-line oral medication for type 2 diabetes when lifestyle measures are insufficient and eGFR is adequate?', 'SAMPLE/UNVERIFIED. Metformin remains a usual first-line oral agent when not contraindicated.', 3, true, true, '{}'::jsonb) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, difficulty = excluded.difficulty, is_uk_practice = excluded.is_uk_practice, updated_at = now();
delete from public.question_options where question_id = 'a4000000-0000-4000-8000-000000000012';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('a5000000-0000-4000-8000-001200000000', 'a4000000-0000-4000-8000-000000000012', 'A', 'Gliclazide always first', false, 0),
  ('a5000000-0000-4000-8000-001200000001', 'a4000000-0000-4000-8000-000000000012', 'B', 'Metformin', true, 1),
  ('a5000000-0000-4000-8000-001200000002', 'a4000000-0000-4000-8000-000000000012', 'C', 'Insulin detemir immediately for all', false, 2),
  ('a5000000-0000-4000-8000-001200000003', 'a4000000-0000-4000-8000-000000000012', 'D', 'Pioglitazone for everyone first', false, 3),
  ('a5000000-0000-4000-8000-001200000004', 'a4000000-0000-4000-8000-000000000012', 'E', 'Acarbose only', false, 4);
insert into public.question_tags (question_id, tag_id) values ('a4000000-0000-4000-8000-000000000012', 'a3000000-0000-4000-8000-000000000002') on conflict do nothing;
insert into public.question_tags (question_id, tag_id) values ('a4000000-0000-4000-8000-000000000012', 'a3000000-0000-4000-8000-000000000001') on conflict do nothing;

-- Q13
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('a4000000-0000-4000-8000-000000000013', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000005', 'sba', 'A 55-year-old on an ACE inhibitor starts an NSAID and develops rising creatinine. Which mechanism best explains the acute kidney injury risk?', 'SAMPLE/UNVERIFIED. Combined ACE inhibitor + NSAID can impair glomerular filtration pressure autoregulation.', 3, true, false, '{}'::jsonb) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, difficulty = excluded.difficulty, is_uk_practice = excluded.is_uk_practice, updated_at = now();
delete from public.question_options where question_id = 'a4000000-0000-4000-8000-000000000013';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('a5000000-0000-4000-8000-001300000000', 'a4000000-0000-4000-8000-000000000013', 'A', 'Direct ureteric obstruction', false, 0),
  ('a5000000-0000-4000-8000-001300000001', 'a4000000-0000-4000-8000-000000000013', 'B', 'Massive rhabdomyolysis only', false, 1),
  ('a5000000-0000-4000-8000-001300000002', 'a4000000-0000-4000-8000-000000000013', 'C', 'Reduced glomerular filtration pressure', true, 2),
  ('a5000000-0000-4000-8000-001300000003', 'a4000000-0000-4000-8000-000000000013', 'D', 'Acute tubular necrosis from alcohol only', false, 3),
  ('a5000000-0000-4000-8000-001300000004', 'a4000000-0000-4000-8000-000000000013', 'E', 'Hypercalcaemia', false, 4);
insert into public.question_tags (question_id, tag_id) values ('a4000000-0000-4000-8000-000000000013', 'a3000000-0000-4000-8000-000000000002') on conflict do nothing;

-- Q14
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('a4000000-0000-4000-8000-000000000014', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000005', 'sba', 'A urinalysis shows 3+ blood and 3+ protein with red cell casts. Which renal syndrome pattern does this most suggest?', 'SAMPLE/UNVERIFIED. Red cell casts with proteinuria/haematuria point toward a glomerular (nephritic) process.', 2, true, false, '{}'::jsonb) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, difficulty = excluded.difficulty, is_uk_practice = excluded.is_uk_practice, updated_at = now();
delete from public.question_options where question_id = 'a4000000-0000-4000-8000-000000000014';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('a5000000-0000-4000-8000-001400000000', 'a4000000-0000-4000-8000-000000000014', 'A', 'Nephritic/glomerular disease', true, 0),
  ('a5000000-0000-4000-8000-001400000001', 'a4000000-0000-4000-8000-000000000014', 'B', 'Simple dehydration', false, 1),
  ('a5000000-0000-4000-8000-001400000002', 'a4000000-0000-4000-8000-000000000014', 'C', 'Isolated lower UTI only', false, 2),
  ('a5000000-0000-4000-8000-001400000003', 'a4000000-0000-4000-8000-000000000014', 'D', 'Nephrotic syndrome without active sediment', false, 3),
  ('a5000000-0000-4000-8000-001400000004', 'a4000000-0000-4000-8000-000000000014', 'E', 'Renal artery stenosis alone', false, 4);
insert into public.question_tags (question_id, tag_id) values ('a4000000-0000-4000-8000-000000000014', 'a3000000-0000-4000-8000-000000000002') on conflict do nothing;

-- Q15
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('a4000000-0000-4000-8000-000000000015', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000005', 'sba', 'A patient with CKD stage 4 has phosphate 2.1 mmol/L. Which dietary advice is most relevant?', 'SAMPLE/UNVERIFIED. Hyperphosphataemia in advanced CKD is managed with phosphate restriction and binders as indicated.', 3, true, false, '{}'::jsonb) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, difficulty = excluded.difficulty, is_uk_practice = excluded.is_uk_practice, updated_at = now();
delete from public.question_options where question_id = 'a4000000-0000-4000-8000-000000000015';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('a5000000-0000-4000-8000-001500000000', 'a4000000-0000-4000-8000-000000000015', 'A', 'High phosphate diet', false, 0),
  ('a5000000-0000-4000-8000-001500000001', 'a4000000-0000-4000-8000-000000000015', 'B', 'Phosphate restriction', true, 1),
  ('a5000000-0000-4000-8000-001500000002', 'a4000000-0000-4000-8000-000000000015', 'C', 'Unlimited cola intake', false, 2),
  ('a5000000-0000-4000-8000-001500000003', 'a4000000-0000-4000-8000-000000000015', 'D', 'High potassium diet always', false, 3),
  ('a5000000-0000-4000-8000-001500000004', 'a4000000-0000-4000-8000-000000000015', 'E', 'Stop all fluids', false, 4);
insert into public.question_tags (question_id, tag_id) values ('a4000000-0000-4000-8000-000000000015', 'a3000000-0000-4000-8000-000000000002') on conflict do nothing;

-- Q16
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('a4000000-0000-4000-8000-000000000016', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000006', 'sba', 'A 70-year-old develops sudden right-sided weakness and aphasia lasting 20 minutes that fully resolves. CT head is normal. What is the most likely diagnosis?', 'SAMPLE/UNVERIFIED. Transient focal neurology resolving within 24 hours with normal CT suggests TIA (time definitions evolve; clinical teaching item).', 2, true, false, '{}'::jsonb) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, difficulty = excluded.difficulty, is_uk_practice = excluded.is_uk_practice, updated_at = now();
delete from public.question_options where question_id = 'a4000000-0000-4000-8000-000000000016';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('a5000000-0000-4000-8000-001600000000', 'a4000000-0000-4000-8000-000000000016', 'A', 'Transient ischaemic attack', true, 0),
  ('a5000000-0000-4000-8000-001600000001', 'a4000000-0000-4000-8000-000000000016', 'B', 'Migraine with aura only always', false, 1),
  ('a5000000-0000-4000-8000-001600000002', 'a4000000-0000-4000-8000-000000000016', 'C', 'Generalised tonic-clonic seizure', false, 2),
  ('a5000000-0000-4000-8000-001600000003', 'a4000000-0000-4000-8000-000000000016', 'D', 'Peripheral neuropathy', false, 3),
  ('a5000000-0000-4000-8000-001600000004', 'a4000000-0000-4000-8000-000000000016', 'E', 'Myasthenia crisis', false, 4);
insert into public.question_tags (question_id, tag_id) values ('a4000000-0000-4000-8000-000000000016', 'a3000000-0000-4000-8000-000000000002') on conflict do nothing;

-- Q17
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('a4000000-0000-4000-8000-000000000017', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000006', 'sba', 'A young adult has unilateral throbbing headache with photophobia and nausea, without fever or focal signs. What is the most likely primary headache type?', 'SAMPLE/UNVERIFIED. Migraine typically features unilateral throbbing pain with photo/phonophobia and nausea.', 3, true, false, '{}'::jsonb) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, difficulty = excluded.difficulty, is_uk_practice = excluded.is_uk_practice, updated_at = now();
delete from public.question_options where question_id = 'a4000000-0000-4000-8000-000000000017';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('a5000000-0000-4000-8000-001700000000', 'a4000000-0000-4000-8000-000000000017', 'A', 'Cluster headache', false, 0),
  ('a5000000-0000-4000-8000-001700000001', 'a4000000-0000-4000-8000-000000000017', 'B', 'Tension-type only', false, 1),
  ('a5000000-0000-4000-8000-001700000002', 'a4000000-0000-4000-8000-000000000017', 'C', 'Migraine', true, 2),
  ('a5000000-0000-4000-8000-001700000003', 'a4000000-0000-4000-8000-000000000017', 'D', 'Trigeminal neuralgia', false, 3),
  ('a5000000-0000-4000-8000-001700000004', 'a4000000-0000-4000-8000-000000000017', 'E', 'SAH', false, 4);
insert into public.question_tags (question_id, tag_id) values ('a4000000-0000-4000-8000-000000000017', 'a3000000-0000-4000-8000-000000000002') on conflict do nothing;

-- Q18
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('a4000000-0000-4000-8000-000000000018', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000006', 'sba', 'A patient presents with thunderclap headache reaching maximum intensity within seconds. What is the most important diagnosis to exclude first?', 'SAMPLE/UNVERIFIED. Thunderclap headache requires urgent exclusion of subarachnoid haemorrhage.', 3, true, false, '{}'::jsonb) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, difficulty = excluded.difficulty, is_uk_practice = excluded.is_uk_practice, updated_at = now();
delete from public.question_options where question_id = 'a4000000-0000-4000-8000-000000000018';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('a5000000-0000-4000-8000-001800000000', 'a4000000-0000-4000-8000-000000000018', 'A', 'Tension headache', false, 0),
  ('a5000000-0000-4000-8000-001800000001', 'a4000000-0000-4000-8000-000000000018', 'B', 'Sinusitis', false, 1),
  ('a5000000-0000-4000-8000-001800000002', 'a4000000-0000-4000-8000-000000000018', 'C', 'Medication overuse', false, 2),
  ('a5000000-0000-4000-8000-001800000003', 'a4000000-0000-4000-8000-000000000018', 'D', 'Migraine without investigation', false, 3),
  ('a5000000-0000-4000-8000-001800000004', 'a4000000-0000-4000-8000-000000000018', 'E', 'Subarachnoid haemorrhage', true, 4);
insert into public.question_tags (question_id, tag_id) values ('a4000000-0000-4000-8000-000000000018', 'a3000000-0000-4000-8000-000000000002') on conflict do nothing;

-- Q19
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('a4000000-0000-4000-8000-000000000019', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000007', 'sba', 'A 22-year-old describes low mood, anhedonia, early morning waking and guilt for 6 weeks with impaired work function. What is the most likely diagnosis?', 'SAMPLE/UNVERIFIED. Duration and biological features with functional impairment suggest a depressive episode.', 2, true, false, '{}'::jsonb) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, difficulty = excluded.difficulty, is_uk_practice = excluded.is_uk_practice, updated_at = now();
delete from public.question_options where question_id = 'a4000000-0000-4000-8000-000000000019';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('a5000000-0000-4000-8000-001900000000', 'a4000000-0000-4000-8000-000000000019', 'A', 'Normal bereavement only', false, 0),
  ('a5000000-0000-4000-8000-001900000001', 'a4000000-0000-4000-8000-000000000019', 'B', 'Depressive episode', true, 1),
  ('a5000000-0000-4000-8000-001900000002', 'a4000000-0000-4000-8000-000000000019', 'C', 'Mania', false, 2),
  ('a5000000-0000-4000-8000-001900000003', 'a4000000-0000-4000-8000-000000000019', 'D', 'OCD', false, 3),
  ('a5000000-0000-4000-8000-001900000004', 'a4000000-0000-4000-8000-000000000019', 'E', 'Simple stress without disorder', false, 4);
insert into public.question_tags (question_id, tag_id) values ('a4000000-0000-4000-8000-000000000019', 'a3000000-0000-4000-8000-000000000002') on conflict do nothing;

-- Q20
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('a4000000-0000-4000-8000-000000000020', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000007', 'sba', 'A patient on a typical antipsychotic develops fever, rigidity and autonomic instability. What serious adverse reaction must be considered?', 'SAMPLE/UNVERIFIED. Neuroleptic malignant syndrome presents with rigidity, fever and autonomic instability.', 3, true, false, '{}'::jsonb) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, difficulty = excluded.difficulty, is_uk_practice = excluded.is_uk_practice, updated_at = now();
delete from public.question_options where question_id = 'a4000000-0000-4000-8000-000000000020';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('a5000000-0000-4000-8000-002000000000', 'a4000000-0000-4000-8000-000000000020', 'A', 'Neuroleptic malignant syndrome', true, 0),
  ('a5000000-0000-4000-8000-002000000001', 'a4000000-0000-4000-8000-000000000020', 'B', 'Serotonin syndrome from antibiotics', false, 1),
  ('a5000000-0000-4000-8000-002000000002', 'a4000000-0000-4000-8000-000000000020', 'C', 'Simple viral illness only', false, 2),
  ('a5000000-0000-4000-8000-002000000003', 'a4000000-0000-4000-8000-000000000020', 'D', 'Akathisia alone', false, 3),
  ('a5000000-0000-4000-8000-002000000004', 'a4000000-0000-4000-8000-000000000020', 'E', 'Tardive dyskinesia only', false, 4);
insert into public.question_tags (question_id, tag_id) values ('a4000000-0000-4000-8000-000000000020', 'a3000000-0000-4000-8000-000000000002') on conflict do nothing;

-- Q21
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('a4000000-0000-4000-8000-000000000021', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000007', 'sba', 'In UK acute mental health practice, which principle is central when assessing risk after expressing suicidal ideation?', 'SAMPLE/UNVERIFIED. Structured risk assessment including intent, plans, protective factors and urgent safety planning is essential.', 3, true, true, '{}'::jsonb) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, difficulty = excluded.difficulty, is_uk_practice = excluded.is_uk_practice, updated_at = now();
delete from public.question_options where question_id = 'a4000000-0000-4000-8000-000000000021';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('a5000000-0000-4000-8000-002100000000', 'a4000000-0000-4000-8000-000000000021', 'A', 'Ignore ideation if polite', false, 0),
  ('a5000000-0000-4000-8000-002100000001', 'a4000000-0000-4000-8000-000000000021', 'B', 'Discharge without safety plan always', false, 1),
  ('a5000000-0000-4000-8000-002100000002', 'a4000000-0000-4000-8000-000000000021', 'C', 'Assess risk and arrange appropriate support/safety planning', true, 2),
  ('a5000000-0000-4000-8000-002100000003', 'a4000000-0000-4000-8000-000000000021', 'D', 'Mandatory admission for every fleeting thought', false, 3),
  ('a5000000-0000-4000-8000-002100000004', 'a4000000-0000-4000-8000-000000000021', 'E', 'Only family can assess', false, 4);
insert into public.question_tags (question_id, tag_id) values ('a4000000-0000-4000-8000-000000000021', 'a3000000-0000-4000-8000-000000000002') on conflict do nothing;
insert into public.question_tags (question_id, tag_id) values ('a4000000-0000-4000-8000-000000000021', 'a3000000-0000-4000-8000-000000000001') on conflict do nothing;

-- Q22
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('a4000000-0000-4000-8000-000000000022', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000008', 'sba', 'A 28-year-old at 8 weeks'' gestation has unilateral pelvic pain and spotting. β-hCG is positive and transvaginal ultrasound shows an empty uterus with an adnexal mass. What is the most likely diagnosis?', 'SAMPLE/UNVERIFIED. Pregnancy + empty uterus + adnexal mass/pain suggests ectopic pregnancy until proven otherwise.', 3, true, false, '{}'::jsonb) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, difficulty = excluded.difficulty, is_uk_practice = excluded.is_uk_practice, updated_at = now();
delete from public.question_options where question_id = 'a4000000-0000-4000-8000-000000000022';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('a5000000-0000-4000-8000-002200000000', 'a4000000-0000-4000-8000-000000000022', 'A', 'Ectopic pregnancy', true, 0),
  ('a5000000-0000-4000-8000-002200000001', 'a4000000-0000-4000-8000-000000000022', 'B', 'Inevitable miscarriage only', false, 1),
  ('a5000000-0000-4000-8000-002200000002', 'a4000000-0000-4000-8000-000000000022', 'C', 'Ovarian torsion without pregnancy', false, 2),
  ('a5000000-0000-4000-8000-002200000003', 'a4000000-0000-4000-8000-000000000022', 'D', 'Appendicitis only', false, 3),
  ('a5000000-0000-4000-8000-002200000004', 'a4000000-0000-4000-8000-000000000022', 'E', 'Fibroid degeneration', false, 4);
insert into public.question_tags (question_id, tag_id) values ('a4000000-0000-4000-8000-000000000022', 'a3000000-0000-4000-8000-000000000002') on conflict do nothing;

-- Q23
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('a4000000-0000-4000-8000-000000000023', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000008', 'sba', 'A 19-year-old has heavy irregular periods since menarche, normal exam, and negative pregnancy test. What is a common initial management approach for anovulatory bleeding in adolescents?', 'SAMPLE/UNVERIFIED. After excluding pregnancy/red flags, hormonal regulation (e.g. combined hormonal contraception if suitable) is often used.', 2, true, false, '{}'::jsonb) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, difficulty = excluded.difficulty, is_uk_practice = excluded.is_uk_practice, updated_at = now();
delete from public.question_options where question_id = 'a4000000-0000-4000-8000-000000000023';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('a5000000-0000-4000-8000-002300000000', 'a4000000-0000-4000-8000-000000000023', 'A', 'Immediate hysterectomy', false, 0),
  ('a5000000-0000-4000-8000-002300000001', 'a4000000-0000-4000-8000-000000000023', 'B', 'High-dose warfarin', false, 1),
  ('a5000000-0000-4000-8000-002300000002', 'a4000000-0000-4000-8000-000000000023', 'C', 'Routine laparoscopy first', false, 2),
  ('a5000000-0000-4000-8000-002300000003', 'a4000000-0000-4000-8000-000000000023', 'D', 'Hormonal cycle regulation if appropriate', true, 3),
  ('a5000000-0000-4000-8000-002300000004', 'a4000000-0000-4000-8000-000000000023', 'E', 'Ignore indefinitely', false, 4);
insert into public.question_tags (question_id, tag_id) values ('a4000000-0000-4000-8000-000000000023', 'a3000000-0000-4000-8000-000000000002') on conflict do nothing;

-- Q24
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('a4000000-0000-4000-8000-000000000024', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000008', 'sba', 'A pregnant woman at 28 weeks reports reduced fetal movements. What is the most appropriate immediate advice in typical UK maternity pathways?', 'SAMPLE/UNVERIFIED. Reduced fetal movements warrant same-day assessment (contact maternity unit), not waiting for routine clinic.', 3, true, true, '{}'::jsonb) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, difficulty = excluded.difficulty, is_uk_practice = excluded.is_uk_practice, updated_at = now();
delete from public.question_options where question_id = 'a4000000-0000-4000-8000-000000000024';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('a5000000-0000-4000-8000-002400000000', 'a4000000-0000-4000-8000-000000000024', 'A', 'Wait two weeks for next clinic', false, 0),
  ('a5000000-0000-4000-8000-002400000001', 'a4000000-0000-4000-8000-000000000024', 'B', 'Contact maternity services for same-day assessment', true, 1),
  ('a5000000-0000-4000-8000-002400000002', 'a4000000-0000-4000-8000-000000000024', 'C', 'Start aspirin only', false, 2),
  ('a5000000-0000-4000-8000-002400000003', 'a4000000-0000-4000-8000-000000000024', 'D', 'Increase exercise intensely', false, 3),
  ('a5000000-0000-4000-8000-002400000004', 'a4000000-0000-4000-8000-000000000024', 'E', 'Stop all fluids', false, 4);
insert into public.question_tags (question_id, tag_id) values ('a4000000-0000-4000-8000-000000000024', 'a3000000-0000-4000-8000-000000000002') on conflict do nothing;
insert into public.question_tags (question_id, tag_id) values ('a4000000-0000-4000-8000-000000000024', 'a3000000-0000-4000-8000-000000000001') on conflict do nothing;

-- Q25
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('a4000000-0000-4000-8000-000000000025', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000009', 'sba', 'A 2-year-old has barky cough, hoarse voice and stridor that worsens at night. He is otherwise well and saturating normally. What is the most likely diagnosis?', 'SAMPLE/UNVERIFIED. Barking cough and stridor in a toddler commonly indicate croup (viral laryngotracheitis).', 2, true, false, '{}'::jsonb) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, difficulty = excluded.difficulty, is_uk_practice = excluded.is_uk_practice, updated_at = now();
delete from public.question_options where question_id = 'a4000000-0000-4000-8000-000000000025';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('a5000000-0000-4000-8000-002500000000', 'a4000000-0000-4000-8000-000000000025', 'A', 'Croup', true, 0),
  ('a5000000-0000-4000-8000-002500000001', 'a4000000-0000-4000-8000-000000000025', 'B', 'Epiglottitis (classic drooling toxic child)', false, 1),
  ('a5000000-0000-4000-8000-002500000002', 'a4000000-0000-4000-8000-000000000025', 'C', 'Asthma only', false, 2),
  ('a5000000-0000-4000-8000-002500000003', 'a4000000-0000-4000-8000-000000000025', 'D', 'Foreign body always', false, 3),
  ('a5000000-0000-4000-8000-002500000004', 'a4000000-0000-4000-8000-000000000025', 'E', 'Pneumonia', false, 4);
insert into public.question_tags (question_id, tag_id) values ('a4000000-0000-4000-8000-000000000025', 'a3000000-0000-4000-8000-000000000002') on conflict do nothing;

-- Q26
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('a4000000-0000-4000-8000-000000000026', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000009', 'sba', 'A 6-week-old exclusively breastfed infant has projectile non-bilious vomiting and a palpable pyloric olive. What is the most likely diagnosis?', 'SAMPLE/UNVERIFIED. Projectile non-bilious vomiting at ~2–8 weeks with pyloric mass suggests pyloric stenosis.', 3, true, false, '{}'::jsonb) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, difficulty = excluded.difficulty, is_uk_practice = excluded.is_uk_practice, updated_at = now();
delete from public.question_options where question_id = 'a4000000-0000-4000-8000-000000000026';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('a5000000-0000-4000-8000-002600000000', 'a4000000-0000-4000-8000-000000000026', 'A', 'Gastro-oesophageal reflux alone', false, 0),
  ('a5000000-0000-4000-8000-002600000001', 'a4000000-0000-4000-8000-000000000026', 'B', 'Intussusception', false, 1),
  ('a5000000-0000-4000-8000-002600000002', 'a4000000-0000-4000-8000-000000000026', 'C', 'Pyloric stenosis', true, 2),
  ('a5000000-0000-4000-8000-002600000003', 'a4000000-0000-4000-8000-000000000026', 'D', 'Hirschsprung disease', false, 3),
  ('a5000000-0000-4000-8000-002600000004', 'a4000000-0000-4000-8000-000000000026', 'E', 'Coeliac disease', false, 4);
insert into public.question_tags (question_id, tag_id) values ('a4000000-0000-4000-8000-000000000026', 'a3000000-0000-4000-8000-000000000002') on conflict do nothing;

-- Q27
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('a4000000-0000-4000-8000-000000000027', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000009', 'sba', 'A child with petechiae, fever and looking unwell should prompt urgent consideration of which life-threatening infection?', 'SAMPLE/UNVERIFIED. Non-blanching rash with fever/unwell child raises concern for meningococcal disease.', 2, true, false, '{}'::jsonb) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, difficulty = excluded.difficulty, is_uk_practice = excluded.is_uk_practice, updated_at = now();
delete from public.question_options where question_id = 'a4000000-0000-4000-8000-000000000027';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('a5000000-0000-4000-8000-002700000000', 'a4000000-0000-4000-8000-000000000027', 'A', 'Simple viral exanthem always', false, 0),
  ('a5000000-0000-4000-8000-002700000001', 'a4000000-0000-4000-8000-000000000027', 'B', 'Meningococcal disease', true, 1),
  ('a5000000-0000-4000-8000-002700000002', 'a4000000-0000-4000-8000-000000000027', 'C', 'Atopic eczema', false, 2),
  ('a5000000-0000-4000-8000-002700000003', 'a4000000-0000-4000-8000-000000000027', 'D', 'Impetigo only', false, 3),
  ('a5000000-0000-4000-8000-002700000004', 'a4000000-0000-4000-8000-000000000027', 'E', 'Urticaria', false, 4);
insert into public.question_tags (question_id, tag_id) values ('a4000000-0000-4000-8000-000000000027', 'a3000000-0000-4000-8000-000000000002') on conflict do nothing;

-- Q28
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('a4000000-0000-4000-8000-000000000028', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000010', 'sba', 'A traveller returns from a malaria-endemic region with fever, rigors and headache. What investigation is essential?', 'SAMPLE/UNVERIFIED. Urgent malaria films/antigen testing is required in fever after travel to endemic areas.', 2, true, false, '{}'::jsonb) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, difficulty = excluded.difficulty, is_uk_practice = excluded.is_uk_practice, updated_at = now();
delete from public.question_options where question_id = 'a4000000-0000-4000-8000-000000000028';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('a5000000-0000-4000-8000-002800000000', 'a4000000-0000-4000-8000-000000000028', 'A', 'Malaria blood tests', true, 0),
  ('a5000000-0000-4000-8000-002800000001', 'a4000000-0000-4000-8000-000000000028', 'B', 'Only throat swab', false, 1),
  ('a5000000-0000-4000-8000-002800000002', 'a4000000-0000-4000-8000-000000000028', 'C', 'Only urine culture', false, 2),
  ('a5000000-0000-4000-8000-002800000003', 'a4000000-0000-4000-8000-000000000028', 'D', 'Ignore fever', false, 3),
  ('a5000000-0000-4000-8000-002800000004', 'a4000000-0000-4000-8000-000000000028', 'E', 'Routine lipid profile', false, 4);
insert into public.question_tags (question_id, tag_id) values ('a4000000-0000-4000-8000-000000000028', 'a3000000-0000-4000-8000-000000000002') on conflict do nothing;

-- Q29
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('a4000000-0000-4000-8000-000000000029', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000010', 'sba', 'A patient develops watery diarrhoea 5 days after broad-spectrum antibiotics. What organism is an important cause to consider?', 'SAMPLE/UNVERIFIED. Clostridioides difficile is a classic antibiotic-associated colitis pathogen.', 3, true, false, '{}'::jsonb) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, difficulty = excluded.difficulty, is_uk_practice = excluded.is_uk_practice, updated_at = now();
delete from public.question_options where question_id = 'a4000000-0000-4000-8000-000000000029';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('a5000000-0000-4000-8000-002900000000', 'a4000000-0000-4000-8000-000000000029', 'A', 'Helicobacter pylori', false, 0),
  ('a5000000-0000-4000-8000-002900000001', 'a4000000-0000-4000-8000-000000000029', 'B', 'Mycobacterium tuberculosis', false, 1),
  ('a5000000-0000-4000-8000-002900000002', 'a4000000-0000-4000-8000-000000000029', 'C', 'Treponema pallidum', false, 2),
  ('a5000000-0000-4000-8000-002900000003', 'a4000000-0000-4000-8000-000000000029', 'D', 'Clostridioides difficile', true, 3),
  ('a5000000-0000-4000-8000-002900000004', 'a4000000-0000-4000-8000-000000000029', 'E', 'Plasmodium falciparum', false, 4);
insert into public.question_tags (question_id, tag_id) values ('a4000000-0000-4000-8000-000000000029', 'a3000000-0000-4000-8000-000000000002') on conflict do nothing;

-- Q30
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('a4000000-0000-4000-8000-000000000030', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000010', 'sba', 'Needle-stick injury from a known hepatitis B positive source: what is the key immediate principle after first aid?', 'SAMPLE/UNVERIFIED UK occupational health style. Urgent risk assessment and hepatitis B immunoglobulin/vaccination pathway as indicated.', 2, true, true, '{}'::jsonb) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, difficulty = excluded.difficulty, is_uk_practice = excluded.is_uk_practice, updated_at = now();
delete from public.question_options where question_id = 'a4000000-0000-4000-8000-000000000030';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('a5000000-0000-4000-8000-003000000000', 'a4000000-0000-4000-8000-000000000030', 'A', 'Wait one month then test only', false, 0),
  ('a5000000-0000-4000-8000-003000000001', 'a4000000-0000-4000-8000-000000000030', 'B', 'Urgent occupational health / post-exposure pathway', true, 1),
  ('a5000000-0000-4000-8000-003000000002', 'a4000000-0000-4000-8000-000000000030', 'C', 'No action if gloves worn briefly', false, 2),
  ('a5000000-0000-4000-8000-003000000003', 'a4000000-0000-4000-8000-000000000030', 'D', 'Start chemotherapy', false, 3),
  ('a5000000-0000-4000-8000-003000000004', 'a4000000-0000-4000-8000-000000000030', 'E', 'Routine dental check', false, 4);
insert into public.question_tags (question_id, tag_id) values ('a4000000-0000-4000-8000-000000000030', 'a3000000-0000-4000-8000-000000000002') on conflict do nothing;
insert into public.question_tags (question_id, tag_id) values ('a4000000-0000-4000-8000-000000000030', 'a3000000-0000-4000-8000-000000000001') on conflict do nothing;

-- Q31
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('a4000000-0000-4000-8000-000000000031', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000011', 'sba', 'A 65-year-old has morning stiffness lasting over an hour, symmetrical small-joint swelling, and positive rheumatoid factor. What is the most likely diagnosis?', 'SAMPLE/UNVERIFIED. Symmetrical inflammatory polyarthritis with prolonged morning stiffness suggests rheumatoid arthritis.', 2, true, false, '{}'::jsonb) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, difficulty = excluded.difficulty, is_uk_practice = excluded.is_uk_practice, updated_at = now();
delete from public.question_options where question_id = 'a4000000-0000-4000-8000-000000000031';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('a5000000-0000-4000-8000-003100000000', 'a4000000-0000-4000-8000-000000000031', 'A', 'Rheumatoid arthritis', true, 0),
  ('a5000000-0000-4000-8000-003100000001', 'a4000000-0000-4000-8000-000000000031', 'B', 'Osteoarthritis only', false, 1),
  ('a5000000-0000-4000-8000-003100000002', 'a4000000-0000-4000-8000-000000000031', 'C', 'Gout of first MTP only', false, 2),
  ('a5000000-0000-4000-8000-003100000003', 'a4000000-0000-4000-8000-000000000031', 'D', 'Fibromyalgia', false, 3),
  ('a5000000-0000-4000-8000-003100000004', 'a4000000-0000-4000-8000-000000000031', 'E', 'Mechanical back pain', false, 4);
insert into public.question_tags (question_id, tag_id) values ('a4000000-0000-4000-8000-000000000031', 'a3000000-0000-4000-8000-000000000002') on conflict do nothing;

-- Q32
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('a4000000-0000-4000-8000-000000000032', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000011', 'sba', 'A middle-aged man has sudden severe pain and swelling in the first MTP joint overnight. Synovial fluid shows needle-shaped negatively birefringent crystals. Diagnosis?', 'SAMPLE/UNVERIFIED. Monosodium urate crystals indicate gout.', 3, true, false, '{}'::jsonb) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, difficulty = excluded.difficulty, is_uk_practice = excluded.is_uk_practice, updated_at = now();
delete from public.question_options where question_id = 'a4000000-0000-4000-8000-000000000032';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('a5000000-0000-4000-8000-003200000000', 'a4000000-0000-4000-8000-000000000032', 'A', 'Pseudogout', false, 0),
  ('a5000000-0000-4000-8000-003200000001', 'a4000000-0000-4000-8000-000000000032', 'B', 'Septic arthritis only always', false, 1),
  ('a5000000-0000-4000-8000-003200000002', 'a4000000-0000-4000-8000-000000000032', 'C', 'Gout', true, 2),
  ('a5000000-0000-4000-8000-003200000003', 'a4000000-0000-4000-8000-000000000032', 'D', 'RA flare', false, 3),
  ('a5000000-0000-4000-8000-003200000004', 'a4000000-0000-4000-8000-000000000032', 'E', 'Fracture', false, 4);
insert into public.question_tags (question_id, tag_id) values ('a4000000-0000-4000-8000-000000000032', 'a3000000-0000-4000-8000-000000000002') on conflict do nothing;

-- Q33
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('a4000000-0000-4000-8000-000000000033', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000011', 'sba', 'Back pain with saddle anaesthesia and urinary retention requires urgent recognition of which syndrome?', 'SAMPLE/UNVERIFIED. Red-flag neurology suggests cauda equina syndrome needing emergency imaging/referral.', 3, true, false, '{}'::jsonb) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, difficulty = excluded.difficulty, is_uk_practice = excluded.is_uk_practice, updated_at = now();
delete from public.question_options where question_id = 'a4000000-0000-4000-8000-000000000033';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('a5000000-0000-4000-8000-003300000000', 'a4000000-0000-4000-8000-000000000033', 'A', 'Simple mechanical pain', false, 0),
  ('a5000000-0000-4000-8000-003300000001', 'a4000000-0000-4000-8000-000000000033', 'B', 'Cauda equina syndrome', true, 1),
  ('a5000000-0000-4000-8000-003300000002', 'a4000000-0000-4000-8000-000000000033', 'C', 'Anxiety only', false, 2),
  ('a5000000-0000-4000-8000-003300000003', 'a4000000-0000-4000-8000-000000000033', 'D', 'Vitamin D deficiency alone', false, 3),
  ('a5000000-0000-4000-8000-003300000004', 'a4000000-0000-4000-8000-000000000033', 'E', 'Plantar fasciitis', false, 4);
insert into public.question_tags (question_id, tag_id) values ('a4000000-0000-4000-8000-000000000033', 'a3000000-0000-4000-8000-000000000002') on conflict do nothing;

-- Q34
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('a4000000-0000-4000-8000-000000000034', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000012', 'sba', 'A child has a highly itchy web-space and wrist rash worse at night; several family members itch. What is most likely?', 'SAMPLE/UNVERIFIED. Nocturnal itch with family clustering and classical sites suggests scabies.', 2, true, false, '{}'::jsonb) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, difficulty = excluded.difficulty, is_uk_practice = excluded.is_uk_practice, updated_at = now();
delete from public.question_options where question_id = 'a4000000-0000-4000-8000-000000000034';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('a5000000-0000-4000-8000-003400000000', 'a4000000-0000-4000-8000-000000000034', 'A', 'Scabies', true, 0),
  ('a5000000-0000-4000-8000-003400000001', 'a4000000-0000-4000-8000-000000000034', 'B', 'Psoriasis only', false, 1),
  ('a5000000-0000-4000-8000-003400000002', 'a4000000-0000-4000-8000-000000000034', 'C', 'Melanoma', false, 2),
  ('a5000000-0000-4000-8000-003400000003', 'a4000000-0000-4000-8000-000000000034', 'D', 'Cellulitis of the face', false, 3),
  ('a5000000-0000-4000-8000-003400000004', 'a4000000-0000-4000-8000-000000000034', 'E', 'Vitiligo', false, 4);
insert into public.question_tags (question_id, tag_id) values ('a4000000-0000-4000-8000-000000000034', 'a3000000-0000-4000-8000-000000000002') on conflict do nothing;

-- Q35
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('a4000000-0000-4000-8000-000000000035', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000012', 'sba', 'An expanding annular erythema after a tick bite in a Lyme-endemic area most likely represents?', 'SAMPLE/UNVERIFIED. Erythema migrans is the classic early Lyme presentation.', 3, true, false, '{}'::jsonb) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, difficulty = excluded.difficulty, is_uk_practice = excluded.is_uk_practice, updated_at = now();
delete from public.question_options where question_id = 'a4000000-0000-4000-8000-000000000035';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('a5000000-0000-4000-8000-003500000000', 'a4000000-0000-4000-8000-000000000035', 'A', 'Tinea corporis always', false, 0),
  ('a5000000-0000-4000-8000-003500000001', 'a4000000-0000-4000-8000-000000000035', 'B', 'Fixed drug eruption only', false, 1),
  ('a5000000-0000-4000-8000-003500000002', 'a4000000-0000-4000-8000-000000000035', 'C', 'Erysipelas of the ear', false, 2),
  ('a5000000-0000-4000-8000-003500000003', 'a4000000-0000-4000-8000-000000000035', 'D', 'Erythema migrans', true, 3),
  ('a5000000-0000-4000-8000-003500000004', 'a4000000-0000-4000-8000-000000000035', 'E', 'Acne', false, 4);
insert into public.question_tags (question_id, tag_id) values ('a4000000-0000-4000-8000-000000000035', 'a3000000-0000-4000-8000-000000000002') on conflict do nothing;

-- Q36
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('a4000000-0000-4000-8000-000000000036', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000013', 'sba', 'A competent adult refuses a recommended blood transfusion for religious reasons. What is the most appropriate ethical/legal approach in UK practice?', 'SAMPLE/UNVERIFIED. Respect informed refusal by a capacitous adult; explore understanding and document, offer alternatives.', 2, true, true, '{}'::jsonb) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, difficulty = excluded.difficulty, is_uk_practice = excluded.is_uk_practice, updated_at = now();
delete from public.question_options where question_id = 'a4000000-0000-4000-8000-000000000036';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('a5000000-0000-4000-8000-003600000000', 'a4000000-0000-4000-8000-000000000036', 'A', 'Respect capacitated refusal after ensuring understanding', true, 0),
  ('a5000000-0000-4000-8000-003600000001', 'a4000000-0000-4000-8000-000000000036', 'B', 'Transfuse secretly', false, 1),
  ('a5000000-0000-4000-8000-003600000002', 'a4000000-0000-4000-8000-000000000036', 'C', 'Ask the family to override capacity', false, 2),
  ('a5000000-0000-4000-8000-003600000003', 'a4000000-0000-4000-8000-000000000036', 'D', 'Discharge without discussion', false, 3),
  ('a5000000-0000-4000-8000-003600000004', 'a4000000-0000-4000-8000-000000000036', 'E', 'Assume lack of capacity solely due to religion', false, 4);
insert into public.question_tags (question_id, tag_id) values ('a4000000-0000-4000-8000-000000000036', 'a3000000-0000-4000-8000-000000000002') on conflict do nothing;
insert into public.question_tags (question_id, tag_id) values ('a4000000-0000-4000-8000-000000000036', 'a3000000-0000-4000-8000-000000000001') on conflict do nothing;

-- Q37
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('a4000000-0000-4000-8000-000000000037', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000013', 'sba', 'When is it generally appropriate to breach confidentiality in UK clinical practice?', 'SAMPLE/UNVERIFIED. Confidentiality may be breached when required by law or when there is a serious risk of harm that outweighs the duty (proportionate disclosure).', 3, true, true, '{}'::jsonb) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, difficulty = excluded.difficulty, is_uk_practice = excluded.is_uk_practice, updated_at = now();
delete from public.question_options where question_id = 'a4000000-0000-4000-8000-000000000037';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('a5000000-0000-4000-8000-003700000000', 'a4000000-0000-4000-8000-000000000037', 'A', 'Whenever a relative asks', false, 0),
  ('a5000000-0000-4000-8000-003700000001', 'a4000000-0000-4000-8000-000000000037', 'B', 'To gossip with colleagues socially', false, 1),
  ('a5000000-0000-4000-8000-003700000002', 'a4000000-0000-4000-8000-000000000037', 'C', 'When required by law or to prevent serious harm (proportionate)', true, 2),
  ('a5000000-0000-4000-8000-003700000003', 'a4000000-0000-4000-8000-000000000037', 'D', 'Never under any circumstances', false, 3),
  ('a5000000-0000-4000-8000-003700000004', 'a4000000-0000-4000-8000-000000000037', 'E', 'Only after newspaper enquiry', false, 4);
insert into public.question_tags (question_id, tag_id) values ('a4000000-0000-4000-8000-000000000037', 'a3000000-0000-4000-8000-000000000002') on conflict do nothing;
insert into public.question_tags (question_id, tag_id) values ('a4000000-0000-4000-8000-000000000037', 'a3000000-0000-4000-8000-000000000001') on conflict do nothing;

-- Q38
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('a4000000-0000-4000-8000-000000000038', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000013', 'sba', 'Before a procedure, valid consent in UK practice requires which core element?', 'SAMPLE/UNVERIFIED. Consent requires capacity, adequate information (benefits/risks/alternatives), and voluntariness.', 2, true, true, '{}'::jsonb) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, difficulty = excluded.difficulty, is_uk_practice = excluded.is_uk_practice, updated_at = now();
delete from public.question_options where question_id = 'a4000000-0000-4000-8000-000000000038';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('a5000000-0000-4000-8000-003800000000', 'a4000000-0000-4000-8000-000000000038', 'A', 'Signature alone without discussion', false, 0),
  ('a5000000-0000-4000-8000-003800000001', 'a4000000-0000-4000-8000-000000000038', 'B', 'Capacity, information and voluntariness', true, 1),
  ('a5000000-0000-4000-8000-003800000002', 'a4000000-0000-4000-8000-000000000038', 'C', 'Family consent for all competent adults', false, 2),
  ('a5000000-0000-4000-8000-003800000003', 'a4000000-0000-4000-8000-000000000038', 'D', 'Payment first', false, 3),
  ('a5000000-0000-4000-8000-003800000004', 'a4000000-0000-4000-8000-000000000038', 'E', 'Two consultants always', false, 4);
insert into public.question_tags (question_id, tag_id) values ('a4000000-0000-4000-8000-000000000038', 'a3000000-0000-4000-8000-000000000002') on conflict do nothing;
insert into public.question_tags (question_id, tag_id) values ('a4000000-0000-4000-8000-000000000038', 'a3000000-0000-4000-8000-000000000001') on conflict do nothing;

-- Q39
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('a4000000-0000-4000-8000-000000000039', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000014', 'sba', 'A patient has fatigue, glossitis and a macrocytic anaemia with low B12. Neurological pins and needles are present. What is an important cause to consider?', 'SAMPLE/UNVERIFIED. B12 deficiency can cause macrocytosis and neurological features (e.g. pernicious anaemia).', 3, true, false, '{}'::jsonb) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, difficulty = excluded.difficulty, is_uk_practice = excluded.is_uk_practice, updated_at = now();
delete from public.question_options where question_id = 'a4000000-0000-4000-8000-000000000039';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('a5000000-0000-4000-8000-003900000000', 'a4000000-0000-4000-8000-000000000039', 'A', 'Vitamin B12 deficiency', true, 0),
  ('a5000000-0000-4000-8000-003900000001', 'a4000000-0000-4000-8000-000000000039', 'B', 'Iron deficiency only', false, 1),
  ('a5000000-0000-4000-8000-003900000002', 'a4000000-0000-4000-8000-000000000039', 'C', 'Thalassaemia trait only', false, 2),
  ('a5000000-0000-4000-8000-003900000003', 'a4000000-0000-4000-8000-000000000039', 'D', 'Acute blood loss yesterday only', false, 3),
  ('a5000000-0000-4000-8000-003900000004', 'a4000000-0000-4000-8000-000000000039', 'E', 'Polycythaemia vera', false, 4);
insert into public.question_tags (question_id, tag_id) values ('a4000000-0000-4000-8000-000000000039', 'a3000000-0000-4000-8000-000000000002') on conflict do nothing;

-- Q40
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('a4000000-0000-4000-8000-000000000040', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000014', 'sba', 'A postoperative patient develops unilateral calf swelling and pain. What diagnosis must be considered?', 'SAMPLE/UNVERIFIED. Unilateral calf swelling/pain postoperatively raises concern for deep vein thrombosis.', 2, true, false, '{}'::jsonb) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, difficulty = excluded.difficulty, is_uk_practice = excluded.is_uk_practice, updated_at = now();
delete from public.question_options where question_id = 'a4000000-0000-4000-8000-000000000040';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('a5000000-0000-4000-8000-004000000000', 'a4000000-0000-4000-8000-000000000040', 'A', 'Cellulitis always', false, 0),
  ('a5000000-0000-4000-8000-004000000001', 'a4000000-0000-4000-8000-000000000040', 'B', 'Baker''s cyst only', false, 1),
  ('a5000000-0000-4000-8000-004000000002', 'a4000000-0000-4000-8000-000000000040', 'C', 'Arterial ulcer', false, 2),
  ('a5000000-0000-4000-8000-004000000003', 'a4000000-0000-4000-8000-000000000040', 'D', 'Deep vein thrombosis', true, 3),
  ('a5000000-0000-4000-8000-004000000004', 'a4000000-0000-4000-8000-000000000040', 'E', 'Gout of the knee only', false, 4);
insert into public.question_tags (question_id, tag_id) values ('a4000000-0000-4000-8000-000000000040', 'a3000000-0000-4000-8000-000000000002') on conflict do nothing;

-- ---------------------------------------------------------------------------
-- Amelia / admin bootstrap (run AFTER she creates her Auth user)
-- Replace the email with her real signup email. Do NOT put passwords here.
-- ---------------------------------------------------------------------------
-- update public.profiles
-- set role = 'admin', display_name = coalesce(display_name, 'Amelia')
-- where email = 'ameliaphillips1324@gmail.com';

-- Optional student example (after Hlib signs up):
-- update public.profiles set role = 'student' where email = 'hlib@example.com';
