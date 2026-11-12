-- PLABoratory example SBA pack (Q42–Q51) + glossary terms
-- Original SAMPLE/UNVERIFIED teaching scaffolds for study (UK English).
-- Topics: lipids/pregnancy, contraception, tamsulosin/BPH, gestational hypertension,
-- papilloedema, giardiasis, ALS/MND, surgical prophylaxis, Bell's palsy, OGTT/diabetes.
-- Safe to re-run: fixed UUIDs with ON CONFLICT / delete+reinsert options.

-- Extra glossary terms pulled from this pack
insert into public.glossary_terms (exam_id, term, definition, aliases, section, is_active) values
  ('a1000000-0000-4000-8000-000000000001', 'statin', 'HMG-CoA reductase inhibitor used to lower LDL cholesterol and cardiovascular risk; usually deferred in pregnancy and breastfeeding unless specialist advice says otherwise.', array['statins', 'HMG-CoA reductase inhibitor'], 'Endocrine', true),
  ('a1000000-0000-4000-8000-000000000001', 'UKMEC', 'UK Medical Eligibility Criteria — Faculty of Sexual & Reproductive Healthcare categories for contraceptive method safety by medical condition.', array['UK Medical Eligibility Criteria', 'FSRH UKMEC'], 'Obstetrics & Gynaecology', true),
  ('a1000000-0000-4000-8000-000000000001', 'combined oral contraceptive', 'Oestrogen–progestogen pill for contraception; VTE and migraine-with-aura risks guide UKMEC category.', array['COC', 'combined pill', 'combined oral contraceptive pill'], 'Obstetrics & Gynaecology', true),
  ('a1000000-0000-4000-8000-000000000001', 'tamsulosin', 'Selective alpha-1 blocker used for lower urinary tract symptoms of benign prostatic hyperplasia; may cause postural hypotension and retrograde ejaculation.', array[]::text[], 'Renal', true),
  ('a1000000-0000-4000-8000-000000000001', 'BPH', 'Benign prostatic hyperplasia — non-malignant prostate enlargement causing LUTS (hesitancy, weak stream, nocturia).', array['benign prostatic hyperplasia', 'benign prostatic hypertrophy'], 'Renal', true),
  ('a1000000-0000-4000-8000-000000000001', 'LUTS', 'Lower urinary tract symptoms — voiding and storage symptoms such as hesitancy, frequency, urgency, and nocturia.', array['lower urinary tract symptoms'], 'Renal', true),
  ('a1000000-0000-4000-8000-000000000001', 'gestational hypertension', 'New hypertension after 20 weeks without significant proteinuria or other features of pre-eclampsia; needs close monitoring because it can progress.', array['pregnancy-induced hypertension'], 'Obstetrics & Gynaecology', true),
  ('a1000000-0000-4000-8000-000000000001', 'pre-eclampsia', 'Pregnancy-specific syndrome after 20 weeks with hypertension plus proteinuria and/or maternal organ dysfunction or uteroplacental dysfunction.', array['preeclampsia', 'PET'], 'Obstetrics & Gynaecology', true),
  ('a1000000-0000-4000-8000-000000000001', 'papilloedema', 'Optic disc swelling from raised intracranial pressure; urgent neuroimaging pathway when suspected.', array['papilledema'], 'Neurology', true),
  ('a1000000-0000-4000-8000-000000000001', 'giardiasis', 'Infection with Giardia duodenalis causing prolonged watery diarrhoea, bloating, and malabsorption; often after travel or contaminated water.', array['Giardia', 'Giardia duodenalis', 'Giardia lamblia'], 'Infectious Disease', true),
  ('a1000000-0000-4000-8000-000000000001', 'metronidazole', 'Antibiotic/antiprotozoal used for anaerobic and some protozoal infections (e.g. giardiasis, bacterial vaginosis); avoid alcohol during and shortly after courses.', array[]::text[], 'Infectious Disease', true),
  ('a1000000-0000-4000-8000-000000000001', 'ALS', 'Amyotrophic lateral sclerosis — a form of motor neurone disease with mixed upper and lower motor neurone signs; progressive weakness.', array['amyotrophic lateral sclerosis'], 'Neurology', true),
  ('a1000000-0000-4000-8000-000000000001', 'MND', 'Motor neurone disease — progressive degeneration of motor neurones (includes ALS); bulbar and respiratory involvement need early support planning.', array['motor neurone disease', 'motor neuron disease'], 'Neurology', true),
  ('a1000000-0000-4000-8000-000000000001', 'surgical antibiotic prophylaxis', 'Single timed perioperative antibiotic dose to reduce surgical-site infection for selected procedures; usually not continued postoperatively without indication.', array['antibiotic prophylaxis', 'perioperative antibiotic prophylaxis'], 'Infectious Disease', true),
  ('a1000000-0000-4000-8000-000000000001', 'Bell''s palsy', 'Acute idiopathic lower motor neurone facial nerve palsy; early oral corticosteroids improve recovery when started promptly.', array['Bells palsy', 'idiopathic facial palsy'], 'Neurology', true),
  ('a1000000-0000-4000-8000-000000000001', 'OGTT', 'Oral glucose tolerance test — standardised glucose load with timed plasma glucose samples used to diagnose diabetes or gestational diabetes.', array['oral glucose tolerance test', 'glucose tolerance test'], 'Endocrine', true),
  ('a1000000-0000-4000-8000-000000000001', 'gestational diabetes', 'Diabetes first recognised in pregnancy; UK pathways use OGTT thresholds and lifestyle ± metformin/insulin.', array['GDM', 'gestational diabetes mellitus'], 'Endocrine', true)
on conflict (exam_id, term) do update
  set definition = excluded.definition,
      aliases = excluded.aliases,
      section = excluded.section,
      is_active = true,
      updated_at = now();

-- Q42 lipids / pregnancy — stop statin
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values (
  'a4000000-0000-4000-8000-000000000042',
  'a1000000-0000-4000-8000-000000000001',
  'a2000000-0000-4000-8000-000000000008',
  'sba',
  'A 32-year-old woman on atorvastatin for familial hypercholesterolaemia has a positive pregnancy test at 6 weeks'' gestation. She feels well. What is the most appropriate immediate action regarding her lipid therapy?',
  'SAMPLE/UNVERIFIED teaching item. Statins are generally avoided in pregnancy; stop the statin and seek specialist lipid/obstetric advice rather than continuing or switching within the same class without guidance.',
  3, true, true, '{}'::jsonb
) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, difficulty = excluded.difficulty, is_uk_practice = excluded.is_uk_practice, updated_at = now();
delete from public.question_options where question_id = 'a4000000-0000-4000-8000-000000000042';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('a5000000-0000-4000-8000-004200000000', 'a4000000-0000-4000-8000-000000000042', 'A', 'Continue atorvastatin at the same dose throughout pregnancy', false, 0),
  ('a5000000-0000-4000-8000-004200000001', 'a4000000-0000-4000-8000-000000000042', 'B', 'Stop the statin and seek specialist advice', true, 1),
  ('a5000000-0000-4000-8000-004200000002', 'a4000000-0000-4000-8000-000000000042', 'C', 'Double the atorvastatin dose to cover pregnancy', false, 2),
  ('a5000000-0000-4000-8000-004200000003', 'a4000000-0000-4000-8000-000000000042', 'D', 'Switch immediately to high-dose niacin without review', false, 3),
  ('a5000000-0000-4000-8000-004200000004', 'a4000000-0000-4000-8000-000000000042', 'E', 'Start fenofibrate and keep the statin', false, 4);
insert into public.question_tags (question_id, tag_id) values
  ('a4000000-0000-4000-8000-000000000042', 'a3000000-0000-4000-8000-000000000002'),
  ('a4000000-0000-4000-8000-000000000042', 'a3000000-0000-4000-8000-000000000001')
on conflict do nothing;

-- Q43 contraception — migraine with aura
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values (
  'a4000000-0000-4000-8000-000000000043',
  'a1000000-0000-4000-8000-000000000001',
  'a2000000-0000-4000-8000-000000000008',
  'sba',
  'A 27-year-old woman requests combined oral contraception. She describes migraines with visual aura lasting 20–30 minutes before headache. She is a non-smoker with BMI 24. Which method is most appropriate first-line among the options?',
  'SAMPLE/UNVERIFIED. Migraine with aura is a UKMEC contraindication to combined hormonal contraception because of stroke risk; a progestogen-only method is usually preferred.',
  3, true, true, '{}'::jsonb
) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, difficulty = excluded.difficulty, is_uk_practice = excluded.is_uk_practice, updated_at = now();
delete from public.question_options where question_id = 'a4000000-0000-4000-8000-000000000043';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('a5000000-0000-4000-8000-004300000000', 'a4000000-0000-4000-8000-000000000043', 'A', 'Combined oral contraceptive pill', false, 0),
  ('a5000000-0000-4000-8000-004300000001', 'a4000000-0000-4000-8000-000000000043', 'B', 'Combined contraceptive patch', false, 1),
  ('a5000000-0000-4000-8000-004300000002', 'a4000000-0000-4000-8000-000000000043', 'C', 'Progestogen-only pill', true, 2),
  ('a5000000-0000-4000-8000-004300000003', 'a4000000-0000-4000-8000-000000000043', 'D', 'Combined vaginal ring', false, 3),
  ('a5000000-0000-4000-8000-004300000004', 'a4000000-0000-4000-8000-000000000043', 'E', 'No contraception is acceptable with migraine', false, 4);
insert into public.question_tags (question_id, tag_id) values
  ('a4000000-0000-4000-8000-000000000043', 'a3000000-0000-4000-8000-000000000002'),
  ('a4000000-0000-4000-8000-000000000043', 'a3000000-0000-4000-8000-000000000001')
on conflict do nothing;

-- Q44 tamsulosin / BPH
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values (
  'a4000000-0000-4000-8000-000000000044',
  'a1000000-0000-4000-8000-000000000001',
  'a2000000-0000-4000-8000-000000000005',
  'sba',
  'A 68-year-old man has bothersome lower urinary tract symptoms (hesitancy, weak stream, nocturia). Digital rectal examination shows a smooth enlarged prostate. PSA is not raised. After lifestyle advice, which drug class is most appropriate first-line for moderate LUTS due to BPH?',
  'SAMPLE/UNVERIFIED. An alpha-blocker such as tamsulosin is commonly first-line for moderate bothersome LUTS attributed to BPH when conservative measures are insufficient.',
  2, true, true, '{}'::jsonb
) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, difficulty = excluded.difficulty, is_uk_practice = excluded.is_uk_practice, updated_at = now();
delete from public.question_options where question_id = 'a4000000-0000-4000-8000-000000000044';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('a5000000-0000-4000-8000-004400000000', 'a4000000-0000-4000-8000-000000000044', 'A', 'Tamsulosin (alpha-blocker)', true, 0),
  ('a5000000-0000-4000-8000-004400000001', 'a4000000-0000-4000-8000-000000000044', 'B', 'High-dose oral furosemide', false, 1),
  ('a5000000-0000-4000-8000-004400000002', 'a4000000-0000-4000-8000-000000000044', 'C', 'Immediate radical prostatectomy', false, 2),
  ('a5000000-0000-4000-8000-004400000003', 'a4000000-0000-4000-8000-000000000044', 'D', 'Long-term ciprofloxacin without infection', false, 3),
  ('a5000000-0000-4000-8000-004400000004', 'a4000000-0000-4000-8000-000000000044', 'E', 'Oxybutynin as sole first therapy for obstructive voiding', false, 4);
insert into public.question_tags (question_id, tag_id) values
  ('a4000000-0000-4000-8000-000000000044', 'a3000000-0000-4000-8000-000000000002'),
  ('a4000000-0000-4000-8000-000000000044', 'a3000000-0000-4000-8000-000000000001')
on conflict do nothing;

-- Q45 gestational hypertension
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values (
  'a4000000-0000-4000-8000-000000000045',
  'a1000000-0000-4000-8000-000000000001',
  'a2000000-0000-4000-8000-000000000008',
  'sba',
  'A 29-year-old woman at 28 weeks'' gestation has new blood pressure 152/98 mmHg on two readings. There is no proteinuria, headache, or visual disturbance. Urine dipstick shows no protein. What is the most likely diagnosis?',
  'SAMPLE/UNVERIFIED. New hypertension after 20 weeks without proteinuria or other pre-eclampsia features is gestational hypertension; still requires close surveillance.',
  2, true, true, '{}'::jsonb
) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, difficulty = excluded.difficulty, is_uk_practice = excluded.is_uk_practice, updated_at = now();
delete from public.question_options where question_id = 'a4000000-0000-4000-8000-000000000045';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('a5000000-0000-4000-8000-004500000000', 'a4000000-0000-4000-8000-000000000045', 'A', 'Chronic hypertension diagnosed before pregnancy', false, 0),
  ('a5000000-0000-4000-8000-004500000001', 'a4000000-0000-4000-8000-000000000045', 'B', 'Gestational hypertension', true, 1),
  ('a5000000-0000-4000-8000-004500000002', 'a4000000-0000-4000-8000-000000000045', 'C', 'Eclampsia', false, 2),
  ('a5000000-0000-4000-8000-004500000003', 'a4000000-0000-4000-8000-000000000045', 'D', 'HELLP syndrome', false, 3),
  ('a5000000-0000-4000-8000-004500000004', 'a4000000-0000-4000-8000-000000000045', 'E', 'Normal pregnancy blood pressure', false, 4);
insert into public.question_tags (question_id, tag_id) values
  ('a4000000-0000-4000-8000-000000000045', 'a3000000-0000-4000-8000-000000000002'),
  ('a4000000-0000-4000-8000-000000000045', 'a3000000-0000-4000-8000-000000000001')
on conflict do nothing;

-- Q46 papilloedema
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values (
  'a4000000-0000-4000-8000-000000000046',
  'a1000000-0000-4000-8000-000000000001',
  'a2000000-0000-4000-8000-000000000006',
  'sba',
  'A 24-year-old woman has worsening headaches worse on lying flat, transient visual obscurations, and pulsatile tinnitus. Fundoscopy shows bilateral swollen optic discs with blurred margins. What is the most important next investigation priority?',
  'SAMPLE/UNVERIFIED. Bilateral disc swelling suggesting papilloedema needs urgent imaging to exclude a space-occupying lesion or other cause of raised intracranial pressure before lumbar puncture.',
  3, true, false, '{}'::jsonb
) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, difficulty = excluded.difficulty, is_uk_practice = excluded.is_uk_practice, updated_at = now();
delete from public.question_options where question_id = 'a4000000-0000-4000-8000-000000000046';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('a5000000-0000-4000-8000-004600000000', 'a4000000-0000-4000-8000-000000000046', 'A', 'Urgent neuroimaging (e.g. CT/MRI head)', true, 0),
  ('a5000000-0000-4000-8000-004600000001', 'a4000000-0000-4000-8000-000000000046', 'B', 'Routine outpatient optician review in 3 months', false, 1),
  ('a5000000-0000-4000-8000-004600000002', 'a4000000-0000-4000-8000-000000000046', 'C', 'Immediate lumbar puncture without imaging', false, 2),
  ('a5000000-0000-4000-8000-004600000003', 'a4000000-0000-4000-8000-000000000046', 'D', 'Start high-dose aspirin only', false, 3),
  ('a5000000-0000-4000-8000-004600000004', 'a4000000-0000-4000-8000-000000000046', 'E', 'Reassure and discharge without follow-up', false, 4);
insert into public.question_tags (question_id, tag_id) values
  ('a4000000-0000-4000-8000-000000000046', 'a3000000-0000-4000-8000-000000000002')
on conflict do nothing;

-- Q47 giardiasis
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values (
  'a4000000-0000-4000-8000-000000000047',
  'a1000000-0000-4000-8000-000000000001',
  'a2000000-0000-4000-8000-000000000010',
  'sba',
  'A 35-year-old backpacker returns from rural South Asia with 3 weeks of watery diarrhoea, bloating, and flatulence. Stool microscopy shows Giardia cysts. What is the most appropriate first-line treatment?',
  'SAMPLE/UNVERIFIED. Giardiasis is typically treated with metronidazole (or tinidazole where used); supportive care alone is insufficient once the organism is confirmed and symptoms persist.',
  2, true, true, '{}'::jsonb
) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, difficulty = excluded.difficulty, is_uk_practice = excluded.is_uk_practice, updated_at = now();
delete from public.question_options where question_id = 'a4000000-0000-4000-8000-000000000047';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('a5000000-0000-4000-8000-004700000000', 'a4000000-0000-4000-8000-000000000047', 'A', 'Metronidazole', true, 0),
  ('a5000000-0000-4000-8000-004700000001', 'a4000000-0000-4000-8000-000000000047', 'B', 'Oral vancomycin', false, 1),
  ('a5000000-0000-4000-8000-004700000002', 'a4000000-0000-4000-8000-000000000047', 'C', 'IV ceftriaxone', false, 2),
  ('a5000000-0000-4000-8000-004700000003', 'a4000000-0000-4000-8000-000000000047', 'D', 'Albendazole for malaria', false, 3),
  ('a5000000-0000-4000-8000-004700000004', 'a4000000-0000-4000-8000-000000000047', 'E', 'No antimicrobial therapy ever', false, 4);
insert into public.question_tags (question_id, tag_id) values
  ('a4000000-0000-4000-8000-000000000047', 'a3000000-0000-4000-8000-000000000002'),
  ('a4000000-0000-4000-8000-000000000047', 'a3000000-0000-4000-8000-000000000001')
on conflict do nothing;

-- Q48 ALS / MND
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values (
  'a4000000-0000-4000-8000-000000000048',
  'a1000000-0000-4000-8000-000000000001',
  'a2000000-0000-4000-8000-000000000006',
  'sba',
  'A 58-year-old man has progressive limb weakness, fasciculations, brisk reflexes in wasted arms, and dysarthria. Sensation is preserved. EMG supports motor neurone disease. What is the most likely diagnosis among the options?',
  'SAMPLE/UNVERIFIED. Mixed upper and lower motor neurone signs with fasciculations and bulbar involvement, with preserved sensation, points to ALS/MND rather than pure myopathy or sensory neuropathy.',
  3, true, false, '{}'::jsonb
) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, difficulty = excluded.difficulty, is_uk_practice = excluded.is_uk_practice, updated_at = now();
delete from public.question_options where question_id = 'a4000000-0000-4000-8000-000000000048';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('a5000000-0000-4000-8000-004800000000', 'a4000000-0000-4000-8000-000000000048', 'A', 'Amyotrophic lateral sclerosis (motor neurone disease)', true, 0),
  ('a5000000-0000-4000-8000-004800000001', 'a4000000-0000-4000-8000-000000000048', 'B', 'Guillain–Barré syndrome with ascending sensory loss', false, 1),
  ('a5000000-0000-4000-8000-004800000002', 'a4000000-0000-4000-8000-000000000048', 'C', 'Polymyalgia rheumatica', false, 2),
  ('a5000000-0000-4000-8000-004800000003', 'a4000000-0000-4000-8000-000000000048', 'D', 'Carpal tunnel syndrome alone', false, 3),
  ('a5000000-0000-4000-8000-004800000004', 'a4000000-0000-4000-8000-000000000048', 'E', 'Multiple sclerosis with only sensory tracts', false, 4);
insert into public.question_tags (question_id, tag_id) values
  ('a4000000-0000-4000-8000-000000000048', 'a3000000-0000-4000-8000-000000000002')
on conflict do nothing;

-- Q49 surgical prophylaxis
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values (
  'a4000000-0000-4000-8000-000000000049',
  'a1000000-0000-4000-8000-000000000001',
  'a2000000-0000-4000-8000-000000000010',
  'sba',
  'A fit adult is listed for elective clean-contaminated bowel surgery. Local antimicrobial guidelines recommend surgical antibiotic prophylaxis. When should the prophylactic antibiotic ideally be given?',
  'SAMPLE/UNVERIFIED UK-practice style item. Prophylaxis is usually a single dose timed so tissue levels are adequate at incision (typically within about 60 minutes before knife-to-skin), not a prolonged postoperative course without indication.',
  3, true, true, '{}'::jsonb
) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, difficulty = excluded.difficulty, is_uk_practice = excluded.is_uk_practice, updated_at = now();
delete from public.question_options where question_id = 'a4000000-0000-4000-8000-000000000049';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('a5000000-0000-4000-8000-004900000000', 'a4000000-0000-4000-8000-000000000049', 'A', 'Single dose shortly before incision (per local timing guidance)', true, 0),
  ('a5000000-0000-4000-8000-004900000001', 'a4000000-0000-4000-8000-000000000049', 'B', 'Start antibiotics 1 week before surgery and continue for a month', false, 1),
  ('a5000000-0000-4000-8000-004900000002', 'a4000000-0000-4000-8000-000000000049', 'C', 'Give the first dose only after discharge home', false, 2),
  ('a5000000-0000-4000-8000-004900000003', 'a4000000-0000-4000-8000-000000000049', 'D', 'Never use prophylaxis for bowel surgery', false, 3),
  ('a5000000-0000-4000-8000-004900000004', 'a4000000-0000-4000-8000-000000000049', 'E', 'Use vancomycin indefinitely as default prophylaxis', false, 4);
insert into public.question_tags (question_id, tag_id) values
  ('a4000000-0000-4000-8000-000000000049', 'a3000000-0000-4000-8000-000000000002'),
  ('a4000000-0000-4000-8000-000000000049', 'a3000000-0000-4000-8000-000000000001')
on conflict do nothing;

-- Q50 Bell's palsy
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values (
  'a4000000-0000-4000-8000-000000000050',
  'a1000000-0000-4000-8000-000000000001',
  'a2000000-0000-4000-8000-000000000006',
  'sba',
  'A 40-year-old man wakes with unilateral facial weakness affecting the forehead and eye closure on the same side. There is no limb weakness and no rash in the ear canal. Onset was within the last 48 hours. What is the most appropriate first-line drug treatment?',
  'SAMPLE/UNVERIFIED. Idiopathic Bell''s palsy with lower motor neurone facial involvement is treated with early oral corticosteroids (e.g. prednisolone) when started promptly; antivirals alone are not first-line for uncomplicated cases.',
  2, true, true, '{}'::jsonb
) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, difficulty = excluded.difficulty, is_uk_practice = excluded.is_uk_practice, updated_at = now();
delete from public.question_options where question_id = 'a4000000-0000-4000-8000-000000000050';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('a5000000-0000-4000-8000-005000000000', 'a4000000-0000-4000-8000-000000000050', 'A', 'Oral prednisolone', true, 0),
  ('a5000000-0000-4000-8000-005000000001', 'a4000000-0000-4000-8000-000000000050', 'B', 'IV alteplase', false, 1),
  ('a5000000-0000-4000-8000-005000000002', 'a4000000-0000-4000-8000-000000000050', 'C', 'Long-term warfarin', false, 2),
  ('a5000000-0000-4000-8000-005000000003', 'a4000000-0000-4000-8000-000000000050', 'D', 'Oral flucloxacillin alone', false, 3),
  ('a5000000-0000-4000-8000-005000000004', 'a4000000-0000-4000-8000-000000000050', 'E', 'No treatment and no eye care advice', false, 4);
insert into public.question_tags (question_id, tag_id) values
  ('a4000000-0000-4000-8000-000000000050', 'a3000000-0000-4000-8000-000000000002'),
  ('a4000000-0000-4000-8000-000000000050', 'a3000000-0000-4000-8000-000000000001')
on conflict do nothing;

-- Q51 OGTT / diabetes diagnosis
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values (
  'a4000000-0000-4000-8000-000000000051',
  'a1000000-0000-4000-8000-000000000001',
  'a2000000-0000-4000-8000-000000000004',
  'sba',
  'A 34-year-old woman at 26 weeks'' gestation has a 75 g oral glucose tolerance test. Fasting plasma glucose is 5.2 mmol/L and 2-hour value is 8.9 mmol/L. She has no prior diabetes history. What is the most appropriate interpretation?',
  'SAMPLE/UNVERIFIED teaching scaffold. A raised 2-hour OGTT value in pregnancy in this range is consistent with gestational diabetes on common UK diagnostic pathways (exact local thresholds may vary slightly — teach the principle of OGTT-based GDM diagnosis).',
  3, true, true, '{}'::jsonb
) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, difficulty = excluded.difficulty, is_uk_practice = excluded.is_uk_practice, updated_at = now();
delete from public.question_options where question_id = 'a4000000-0000-4000-8000-000000000051';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('a5000000-0000-4000-8000-005100000000', 'a4000000-0000-4000-8000-000000000051', 'A', 'Normal pregnancy glucose tolerance', false, 0),
  ('a5000000-0000-4000-8000-005100000001', 'a4000000-0000-4000-8000-000000000051', 'B', 'Gestational diabetes mellitus', true, 1),
  ('a5000000-0000-4000-8000-005100000002', 'a4000000-0000-4000-8000-000000000051', 'C', 'Diabetic ketoacidosis', false, 2),
  ('a5000000-0000-4000-8000-005100000003', 'a4000000-0000-4000-8000-000000000051', 'D', 'Type 1 diabetes diagnosed only by autoantibodies here', false, 3),
  ('a5000000-0000-4000-8000-005100000004', 'a4000000-0000-4000-8000-000000000051', 'E', 'Hypoglycaemia requiring glucose infusion now', false, 4);
insert into public.question_tags (question_id, tag_id) values
  ('a4000000-0000-4000-8000-000000000051', 'a3000000-0000-4000-8000-000000000002'),
  ('a4000000-0000-4000-8000-000000000051', 'a3000000-0000-4000-8000-000000000001')
on conflict do nothing;
