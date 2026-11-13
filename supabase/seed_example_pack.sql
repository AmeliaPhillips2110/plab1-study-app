-- PLABoratory example SBA pack (Q42–Q51) + glossary terms
-- Exact stems/options/answers/explanations from Amelia screenshot transcription
-- (passmed-seed-content.md). SAMPLE/UNVERIFIED study seed; UK English.
-- Safe to re-run: fixed UUIDs with ON CONFLICT / delete+reinsert options.
--
-- Amelia (usual): paste THIS FILE alone in Supabase SQL → Run → hard-refresh the site.
-- Fresh project / missing tables: paste APPLY_ALL.sql once instead, then optionally this pack again.
-- Confirm: select count(*) from public.questions
--   where id between 'a4000000-0000-4000-8000-000000000042'
--     and 'a4000000-0000-4000-8000-000000000051';  -- expect 10

do $$
begin
  if to_regclass('public.exams') is null then
    raise exception 'Schema missing: public.exams not found. Paste supabase/APPLY_ALL.sql first (full file), then re-run seed_example_pack.sql.';
  end if;
end $$;

-- Prerequisites (idempotent): exam, settings, topics + tags this pack FKs
insert into public.exams (id, slug, name, description, is_active)
values (
  'a1000000-0000-4000-8000-000000000001',
  'plab1',
  'PLAB 1',
  'PLAB 1 single best answer study bank (PLABoratory).',
  true
)
on conflict (slug) do update
  set name = excluded.name,
      description = excluded.description,
      is_active = excluded.is_active,
      updated_at = now();

insert into public.exam_settings (exam_id, pass_mark_percent, default_mock_question_count, default_mock_minutes)
values ('a1000000-0000-4000-8000-000000000001', 65.00, 180, 180)
on conflict (exam_id) do update set pass_mark_percent = excluded.pass_mark_percent;

insert into public.topics (id, exam_id, slug, name, sort_order, is_active) values
  ('a2000000-0000-4000-8000-000000000004', 'a1000000-0000-4000-8000-000000000001', 'endocrine', 'Endocrine, Diabetes and Metabolic', 80, true),
  ('a2000000-0000-4000-8000-000000000005', 'a1000000-0000-4000-8000-000000000001', 'renal', 'Renal', 250, true),
  ('a2000000-0000-4000-8000-000000000031', 'a1000000-0000-4000-8000-000000000001', 'urology', 'Urology', 310, true),
  ('a2000000-0000-4000-8000-000000000032', 'a1000000-0000-4000-8000-000000000001', 'vascular', 'Vascular', 320, true),
  ('a2000000-0000-4000-8000-000000000006', 'a1000000-0000-4000-8000-000000000001', 'neurology', 'Neurosciences', 180, true),
  ('a2000000-0000-4000-8000-000000000008', 'a1000000-0000-4000-8000-000000000001', 'obstetrics-gynaecology', 'Obstetrics and Gynaecology', 190, true),
  ('a2000000-0000-4000-8000-000000000010', 'a1000000-0000-4000-8000-000000000001', 'infectious-disease', 'Infectious Disease', 140, true)
on conflict (id) do update
  set slug = excluded.slug,
      name = excluded.name,
      sort_order = excluded.sort_order,
      is_active = true;

insert into public.tags (id, exam_id, slug, label, category) values
  ('a3000000-0000-4000-8000-000000000001', 'a1000000-0000-4000-8000-000000000001', 'uk-practice', 'UK practice', 'uk_practice'),
  ('a3000000-0000-4000-8000-000000000002', 'a1000000-0000-4000-8000-000000000001', 'sample-unverified', 'Sample / unverified', 'meta')
on conflict (id) do update
  set slug = excluded.slug,
      label = excluded.label,
      category = excluded.category;

-- Glossary terms matching this pack
insert into public.glossary_terms (exam_id, term, definition, aliases, section, is_active) values
  ('a1000000-0000-4000-8000-000000000001', 'statin', 'HMG-CoA reductase inhibitor used to lower LDL cholesterol. Contraindicated in pregnancy — stop before trying to conceive; switching dose or statin does not remove the contraindication. Ezetimibe is also not recommended in pregnancy. In familial hypercholesterolaemia pregnancy care focuses on non-pharmacological measures; bile acid sequestrants are specialist-only.', array['statins', 'atorvastatin', 'simvastatin'], 'Endocrine', true),
  ('a1000000-0000-4000-8000-000000000001', 'familial hypercholesterolaemia', 'Inherited disorder of high LDL cholesterol with premature cardiovascular risk; pregnancy needs specialist lipid advice and usually stopping teratogenic lipid drugs.', array['FH', 'familial hypercholesterolemia'], 'Endocrine', true),
  ('a1000000-0000-4000-8000-000000000001', 'ezetimibe', 'Cholesterol absorption inhibitor sometimes used with or instead of a statin; not recommended in pregnancy.', array[]::text[], 'Endocrine', true),
  ('a1000000-0000-4000-8000-000000000001', 'combined oral contraceptive', 'Oestrogen–progestogen pill (e.g. Microgynon 30). If started after day 5 of the cycle, it is not reliable until 7 consecutive days of correct use (FSRH).', array['COC', 'combined pill', 'Microgynon 30', 'combined oral contraceptive pill'], 'Obstetrics & Gynaecology', true),
  ('a1000000-0000-4000-8000-000000000001', 'FSRH quick-start contraception', 'Quick reference for when contraception becomes reliable: copper IUD immediate; progestogen-only pill 2 days; combined oral contraceptive / injection / implant / IUS typically 7 days when started outside the ideal cycle window.', array['contraception quick start', 'FSRH'], 'Obstetrics & Gynaecology', true),
  ('a1000000-0000-4000-8000-000000000001', 'tamsulosin', 'Selective alpha-1 blocker for lower urinary tract symptoms of benign prostatic hyperplasia. Alpha-1 antagonism causes vasodilation → dizziness and postural hypotension (BNF). Erectile dysfunction and reduced libido are more typical of finasteride.', array[]::text[], 'Renal', true),
  ('a1000000-0000-4000-8000-000000000001', 'BPH', 'Benign prostatic hyperplasia — non-malignant prostate enlargement causing LUTS.', array['benign prostatic hyperplasia', 'benign prostatic hypertrophy'], 'Renal', true),
  ('a1000000-0000-4000-8000-000000000001', 'gestational hypertension', 'New hypertension ≥140/90 mmHg after 20 weeks without significant proteinuria (or other features of pre-eclampsia).', array['pregnancy-induced hypertension'], 'Obstetrics & Gynaecology', true),
  ('a1000000-0000-4000-8000-000000000001', 'pre-eclampsia', 'Pregnancy-specific syndrome after 20 weeks with hypertension plus proteinuria and/or maternal organ dysfunction or uteroplacental dysfunction. Proteinuria helps distinguish from gestational hypertension.', array['preeclampsia', 'PET', 'mild pre-eclampsia', 'moderate pre-eclampsia'], 'Obstetrics & Gynaecology', true),
  ('a1000000-0000-4000-8000-000000000001', 'papilloedema', 'Optic disc swelling from raised intracranial pressure; nearly always bilateral. Early signs include venous engorgement and loss of venous pulsation, then blurred disc margin, elevation of the disc, loss of the cup, and Paton''s lines. Causes include space-occupying lesion, malignant hypertension, idiopathic intracranial hypertension, hydrocephalus, and hypercapnia; rare associations include hypoparathyroidism/hypocalcaemia and vitamin A toxicity.', array['papilledema', 'Paton''s lines', 'Patons lines'], 'Neurology', true),
  ('a1000000-0000-4000-8000-000000000001', 'giardiasis', 'Infection with Giardia lamblia (Giardia duodenalis) causing prolonged watery non-bloody diarrhoea, anorexia, and bloating — often after travel. Duration and bloating favour Giardia over typical short travellers'' diarrhoea.', array['Giardia', 'Giardia lamblia', 'Giardia duodenalis'], 'Infectious Disease', true),
  ('a1000000-0000-4000-8000-000000000001', 'ALS', 'Amyotrophic lateral sclerosis — motor neurone disease with mixed upper and lower motor neurone signs (e.g. fasciculations/wasting with brisk reflexes elsewhere). Fasciculations point toward MND; sensation is typically spared.', array['amyotrophic lateral sclerosis'], 'Neurology', true),
  ('a1000000-0000-4000-8000-000000000001', 'MND', 'Motor neurone disease — progressive degeneration of motor neurones (includes ALS). Progressive muscular atrophy is a predominantly LMN variant; ALS is mixed UMN+LMN.', array['motor neurone disease', 'motor neuron disease', 'progressive muscular atrophy'], 'Neurology', true),
  ('a1000000-0000-4000-8000-000000000001', 'surgical antibiotic prophylaxis', 'Single timed perioperative antibiotic dose to reduce surgical-site infection for selected procedures (e.g. appendicectomy — clean-contaminated). NICE: usually single-dose prophylaxis. Clean procedures such as tonsillectomy, diagnostic colonoscopy, inguinal hernia repair, and tunnelled intravascular catheter insertion generally do not need routine prophylaxis.', array['antibiotic prophylaxis', 'perioperative antibiotic prophylaxis'], 'Infectious Disease', true),
  ('a1000000-0000-4000-8000-000000000001', 'Bell''s palsy', 'Acute idiopathic lower motor neurone facial nerve palsy. Forehead is affected (cannot raise eyebrow on the weak side). Upper motor neurone lesions typically spare the forehead.', array['Bells palsy', 'idiopathic facial palsy'], 'Neurology', true),
  ('a1000000-0000-4000-8000-000000000001', 'OGTT', 'Oral glucose tolerance test (WHO protocol). Type 2 diabetes diagnosis thresholds: fasting ≥7.0 mmol/L; random or 2-hour ≥11.1 mmol/L; asymptomatic patients need two abnormal occasions; HbA1c ≥48 mmol/mol (6.5%). Impaired fasting glucose and impaired glucose tolerance are intermediate categories when values fall between normal and diabetes cut-offs.', array['oral glucose tolerance test', 'glucose tolerance test', 'impaired fasting glucose', 'impaired glucose tolerance', 'IFG', 'IGT'], 'Endocrine', true)
on conflict (exam_id, term) do update
  set definition = excluded.definition,
      aliases = excluded.aliases,
      section = excluded.section,
      is_active = true,
      updated_at = now();

-- Q42 lipids / pregnancy
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values (
  'a4000000-0000-4000-8000-000000000042',
  'a1000000-0000-4000-8000-000000000001',
  'a2000000-0000-4000-8000-000000000008',
  'sba',
  'A 33-year-old woman who is known to have familial hypercholesterolaemia comes for review. She is planning to have children and asks for advice regarding medication as she currently takes atorvastatin 80mg on. What is the most appropriate advice?',
  'SAMPLE/UNVERIFIED study seed from Amelia transcription. Statins are contraindicated in pregnancy — stop atorvastatin before trying to conceive. Switching dose or to another statin does not remove the contraindication; ezetimibe is also not recommended. In FH pregnancy, focus on non-pharmacological measures; bile acid sequestrants are specialist-only.',
  3, true, true, '{}'::jsonb
) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, difficulty = excluded.difficulty, is_uk_practice = excluded.is_uk_practice, updated_at = now();
delete from public.question_options where question_id = 'a4000000-0000-4000-8000-000000000042';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('a5000000-0000-4000-8000-004200000000', 'a4000000-0000-4000-8000-000000000042', 'A', 'Switch to atorvastatin 10mg', false, 0),
  ('a5000000-0000-4000-8000-004200000001', 'a4000000-0000-4000-8000-000000000042', 'B', 'Continue current drug at same dose', false, 1),
  ('a5000000-0000-4000-8000-004200000002', 'a4000000-0000-4000-8000-000000000042', 'C', 'Stop atorvastatin before trying to conceive', true, 2),
  ('a5000000-0000-4000-8000-004200000003', 'a4000000-0000-4000-8000-000000000042', 'D', 'Switch to ezetimibe', false, 3),
  ('a5000000-0000-4000-8000-004200000004', 'a4000000-0000-4000-8000-000000000042', 'E', 'Switch to simvastatin 40mg', false, 4);
insert into public.question_tags (question_id, tag_id) values
  ('a4000000-0000-4000-8000-000000000042', 'a3000000-0000-4000-8000-000000000002'),
  ('a4000000-0000-4000-8000-000000000042', 'a3000000-0000-4000-8000-000000000001')
on conflict do nothing;

-- Q43 contraception / COC quick start
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values (
  'a4000000-0000-4000-8000-000000000043',
  'a1000000-0000-4000-8000-000000000001',
  'a2000000-0000-4000-8000-000000000008',
  'sba',
  'A 19-year-old female starts Microgynon 30 (combined oral contraceptive pill) on day 8 of her cycle. How long will it take before it can be relied upon as a method of contraception?',
  'SAMPLE/UNVERIFIED study seed from Amelia transcription. FSRH: if the combined oral contraceptive is started after day 5 of the cycle, it takes 7 days before it can be relied upon. Quick-start tip: copper IUD immediate; POP 2 days; COC/injection/implant/IUS typically 7 days.',
  2, true, true, '{}'::jsonb
) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, difficulty = excluded.difficulty, is_uk_practice = excluded.is_uk_practice, updated_at = now();
delete from public.question_options where question_id = 'a4000000-0000-4000-8000-000000000043';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('a5000000-0000-4000-8000-004300000000', 'a4000000-0000-4000-8000-000000000043', 'A', 'Immediately', false, 0),
  ('a5000000-0000-4000-8000-004300000001', 'a4000000-0000-4000-8000-000000000043', 'B', '2 days', false, 1),
  ('a5000000-0000-4000-8000-004300000002', 'a4000000-0000-4000-8000-000000000043', 'C', '5 days', false, 2),
  ('a5000000-0000-4000-8000-004300000003', 'a4000000-0000-4000-8000-000000000043', 'D', '7 days', true, 3),
  ('a5000000-0000-4000-8000-004300000004', 'a4000000-0000-4000-8000-000000000043', 'E', 'Until first day of next period', false, 4);
insert into public.question_tags (question_id, tag_id) values
  ('a4000000-0000-4000-8000-000000000043', 'a3000000-0000-4000-8000-000000000002'),
  ('a4000000-0000-4000-8000-000000000043', 'a3000000-0000-4000-8000-000000000001')
on conflict do nothing;

-- Q44 tamsulosin side-effects
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values (
  'a4000000-0000-4000-8000-000000000044',
  'a1000000-0000-4000-8000-000000000001',
  'a2000000-0000-4000-8000-000000000005',
  'sba',
  'A 69-year-old man is started on tamsulosin for benign prostatic hyperplasia. Which one of the following best describes the side-effects he may experience?',
  'SAMPLE/UNVERIFIED study seed from Amelia transcription. Tamsulosin is an alpha-1 antagonist → vasodilation → dizziness and postural hypotension (BNF). Erectile dysfunction and reduced libido are more typical of finasteride.',
  2, true, true, '{}'::jsonb
) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, difficulty = excluded.difficulty, is_uk_practice = excluded.is_uk_practice, updated_at = now();
delete from public.question_options where question_id = 'a4000000-0000-4000-8000-000000000044';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('a5000000-0000-4000-8000-004400000000', 'a4000000-0000-4000-8000-000000000044', 'A', 'Urgency and insomnia', false, 0),
  ('a5000000-0000-4000-8000-004400000001', 'a4000000-0000-4000-8000-000000000044', 'B', 'Dizziness and postural hypotension', true, 1),
  ('a5000000-0000-4000-8000-004400000002', 'a4000000-0000-4000-8000-000000000044', 'C', 'Urinary retention and nausea', false, 2),
  ('a5000000-0000-4000-8000-004400000003', 'a4000000-0000-4000-8000-000000000044', 'D', 'Urgency and erectile dysfunction', false, 3),
  ('a5000000-0000-4000-8000-004400000004', 'a4000000-0000-4000-8000-000000000044', 'E', 'Erectile dysfunction and reduced libido', false, 4);
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
  'A 37-year-old woman presents for review. She is 26 weeks pregnant. Her blood pressure is 144/92 mmHg; booking blood pressure was 110/80 mmHg. Urine dipstick is negative for protein, leucocytes and blood. What is the most appropriate description of her blood pressure?',
  'SAMPLE/UNVERIFIED study seed from Amelia transcription. New hypertension ≥140/90 mmHg after 20 weeks without proteinuria is gestational hypertension (not pre-eclampsia, and not pre-existing hypertension from booking).',
  2, true, true, '{}'::jsonb
) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, difficulty = excluded.difficulty, is_uk_practice = excluded.is_uk_practice, updated_at = now();
delete from public.question_options where question_id = 'a4000000-0000-4000-8000-000000000045';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('a5000000-0000-4000-8000-004500000000', 'a4000000-0000-4000-8000-000000000045', 'A', 'Moderate pre-eclampsia', false, 0),
  ('a5000000-0000-4000-8000-004500000001', 'a4000000-0000-4000-8000-000000000045', 'B', 'Mild pre-eclampsia', false, 1),
  ('a5000000-0000-4000-8000-004500000002', 'a4000000-0000-4000-8000-000000000045', 'C', 'Gestational hypertension', true, 2),
  ('a5000000-0000-4000-8000-004500000003', 'a4000000-0000-4000-8000-000000000045', 'D', 'Normal physiological change', false, 3),
  ('a5000000-0000-4000-8000-004500000004', 'a4000000-0000-4000-8000-000000000045', 'E', 'Pre-existing hypertension', false, 4);
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
  'Whilst examining a patient the following is found on fundoscopy: swollen optic disc with blurred margins (papilloedema appearance). What is this finding most suggestive of?',
  'SAMPLE/UNVERIFIED study seed from Amelia transcription. The fundoscopic appearance is papilloedema (optic disc swelling from raised intracranial pressure). It is nearly always bilateral. Early signs include venous engorgement and loss of venous pulsation, then blurred margin, disc elevation, loss of cup, and Paton''s lines.',
  2, true, false, '{}'::jsonb
) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, difficulty = excluded.difficulty, is_uk_practice = excluded.is_uk_practice, updated_at = now();
delete from public.question_options where question_id = 'a4000000-0000-4000-8000-000000000046';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('a5000000-0000-4000-8000-004600000000', 'a4000000-0000-4000-8000-000000000046', 'A', 'Central retinal artery occlusion', false, 0),
  ('a5000000-0000-4000-8000-004600000001', 'a4000000-0000-4000-8000-000000000046', 'B', 'Normal fundus', false, 1),
  ('a5000000-0000-4000-8000-004600000002', 'a4000000-0000-4000-8000-000000000046', 'C', 'Papilloedema', true, 2),
  ('a5000000-0000-4000-8000-004600000003', 'a4000000-0000-4000-8000-000000000046', 'D', 'Untreated glaucoma', false, 3),
  ('a5000000-0000-4000-8000-004600000004', 'a4000000-0000-4000-8000-000000000046', 'E', 'Optic atrophy', false, 4);
insert into public.question_tags (question_id, tag_id) values
  ('a4000000-0000-4000-8000-000000000046', 'a3000000-0000-4000-8000-000000000002')
on conflict do nothing;

-- Q47 Giardia
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values (
  'a4000000-0000-4000-8000-000000000047',
  'a1000000-0000-4000-8000-000000000001',
  'a2000000-0000-4000-8000-000000000010',
  'sba',
  'A 55-year-old business man presents with a 15-day history of watery non-bloody diarrhoea, anorexia and bloating. Symptoms started 4 days after return from Pakistan. He is apyrexial with dry mucous membranes and normal skin turgor. What is the most likely causative organism?',
  'SAMPLE/UNVERIFIED study seed from Amelia transcription. Prolonged watery diarrhoea with bloating after travel points to Giardia lamblia, even though Escherichia coli is a common cause of shorter travellers'' diarrhoea.',
  2, true, true, '{}'::jsonb
) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, difficulty = excluded.difficulty, is_uk_practice = excluded.is_uk_practice, updated_at = now();
delete from public.question_options where question_id = 'a4000000-0000-4000-8000-000000000047';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('a5000000-0000-4000-8000-004700000000', 'a4000000-0000-4000-8000-000000000047', 'A', 'Salmonella', false, 0),
  ('a5000000-0000-4000-8000-004700000001', 'a4000000-0000-4000-8000-000000000047', 'B', 'Giardia lamblia', true, 1),
  ('a5000000-0000-4000-8000-004700000002', 'a4000000-0000-4000-8000-000000000047', 'C', 'Shigella', false, 2),
  ('a5000000-0000-4000-8000-004700000003', 'a4000000-0000-4000-8000-000000000047', 'D', 'Escherichia coli', false, 3),
  ('a5000000-0000-4000-8000-004700000004', 'a4000000-0000-4000-8000-000000000047', 'E', 'Norovirus', false, 4);
insert into public.question_tags (question_id, tag_id) values
  ('a4000000-0000-4000-8000-000000000047', 'a3000000-0000-4000-8000-000000000002'),
  ('a4000000-0000-4000-8000-000000000047', 'a3000000-0000-4000-8000-000000000001')
on conflict do nothing;

-- Q48 ALS
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values (
  'a4000000-0000-4000-8000-000000000048',
  'a1000000-0000-4000-8000-000000000001',
  'a2000000-0000-4000-8000-000000000006',
  'sba',
  'A 64-year-old man presents with an eight-month history of generalised weakness. Examination shows fasciculation and weakness in both arms with absent reflexes; in the lower limbs there is increased tone and exaggerated reflexes. Sensation is normal and there are no cerebellar signs. What is the most likely diagnosis?',
  'SAMPLE/UNVERIFIED study seed from Amelia transcription. Fasciculations point toward motor neurone disease. Mixed lower motor neurone signs in the arms and upper motor neurone signs in the legs with preserved sensation is amyotrophic lateral sclerosis (ALS). Progressive muscular atrophy is a predominantly LMN variant.',
  3, true, false, '{}'::jsonb
) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, difficulty = excluded.difficulty, is_uk_practice = excluded.is_uk_practice, updated_at = now();
delete from public.question_options where question_id = 'a4000000-0000-4000-8000-000000000048';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('a5000000-0000-4000-8000-004800000000', 'a4000000-0000-4000-8000-000000000048', 'A', 'Progressive muscular atrophy', false, 0),
  ('a5000000-0000-4000-8000-004800000001', 'a4000000-0000-4000-8000-000000000048', 'B', 'Amyotrophic lateral sclerosis', true, 1),
  ('a5000000-0000-4000-8000-004800000002', 'a4000000-0000-4000-8000-000000000048', 'C', 'Vitamin B12 deficiency', false, 2),
  ('a5000000-0000-4000-8000-004800000003', 'a4000000-0000-4000-8000-000000000048', 'D', 'Syringomyelia', false, 3),
  ('a5000000-0000-4000-8000-004800000004', 'a4000000-0000-4000-8000-000000000048', 'E', 'Multiple sclerosis', false, 4);
insert into public.question_tags (question_id, tag_id) values
  ('a4000000-0000-4000-8000-000000000048', 'a3000000-0000-4000-8000-000000000002')
on conflict do nothing;

-- Q49 surgical prophylaxis
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values (
  'a4000000-0000-4000-8000-000000000049',
  'a1000000-0000-4000-8000-000000000001',
  'a2000000-0000-4000-8000-000000000010',
  'sba',
  'You are a Foundation Year 1 doctor on a surgical rotation. Which one of the following procedures require prophylactic antibiotics?',
  'SAMPLE/UNVERIFIED study seed from Amelia transcription. Appendicectomy is clean-contaminated and NICE supports single-dose surgical antibiotic prophylaxis. Tonsillectomy, diagnostic colonoscopy, inguinal hernia repair, and tunnelled intravascular catheter insertion are generally clean / do not need routine prophylaxis.',
  3, true, true, '{}'::jsonb
) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, difficulty = excluded.difficulty, is_uk_practice = excluded.is_uk_practice, updated_at = now();
delete from public.question_options where question_id = 'a4000000-0000-4000-8000-000000000049';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('a5000000-0000-4000-8000-004900000000', 'a4000000-0000-4000-8000-000000000049', 'A', 'Tonsillectomy', false, 0),
  ('a5000000-0000-4000-8000-004900000001', 'a4000000-0000-4000-8000-000000000049', 'B', 'Diagnostic colonoscopy', false, 1),
  ('a5000000-0000-4000-8000-004900000002', 'a4000000-0000-4000-8000-000000000049', 'C', 'Appendicectomy', true, 2),
  ('a5000000-0000-4000-8000-004900000003', 'a4000000-0000-4000-8000-000000000049', 'D', 'Inguinal hernia repair', false, 3),
  ('a5000000-0000-4000-8000-004900000004', 'a4000000-0000-4000-8000-000000000049', 'E', 'Intravascular catheter insertion (tunnelled)', false, 4);
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
  'A 25-year-old man presents with a 2-day history of left ear pain followed by facial paralysis. The left side of his mouth droops and he cannot close his left eye. Bell''s palsy is suspected. If he is asked to raise his left eyebrow, what finding is expected and why?',
  'SAMPLE/UNVERIFIED study seed from Amelia transcription. Bell''s palsy is a lower motor neurone facial nerve lesion, so the forehead is affected — inability to raise the left eyebrow. Upper motor neurone lesions typically spare the forehead.',
  2, true, true, '{}'::jsonb
) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, difficulty = excluded.difficulty, is_uk_practice = excluded.is_uk_practice, updated_at = now();
delete from public.question_options where question_id = 'a4000000-0000-4000-8000-000000000050';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('a5000000-0000-4000-8000-005000000000', 'a4000000-0000-4000-8000-000000000050', 'A', 'Ability to raise left eyebrow as Bell''s palsy only affects below the eyebrow', false, 0),
  ('a5000000-0000-4000-8000-005000000001', 'a4000000-0000-4000-8000-000000000050', 'B', 'Inability to raise left eyebrow because this is an upper motor neurone lesion', false, 1),
  ('a5000000-0000-4000-8000-005000000002', 'a4000000-0000-4000-8000-000000000050', 'C', 'Inability to raise left eyebrow because this is a lower motor neurone lesion', true, 2),
  ('a5000000-0000-4000-8000-005000000003', 'a4000000-0000-4000-8000-000000000050', 'D', 'Ability to raise left eyebrow as Bell''s palsy does not affect the facial nerve', false, 3),
  ('a5000000-0000-4000-8000-005000000004', 'a4000000-0000-4000-8000-000000000050', 'E', 'Ability to raise left eyebrow as frontalis is not affected', false, 4);
insert into public.question_tags (question_id, tag_id) values
  ('a4000000-0000-4000-8000-000000000050', 'a3000000-0000-4000-8000-000000000002'),
  ('a4000000-0000-4000-8000-000000000050', 'a3000000-0000-4000-8000-000000000001')
on conflict do nothing;

-- Q51 OGTT
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values (
  'a4000000-0000-4000-8000-000000000051',
  'a1000000-0000-4000-8000-000000000001',
  'a2000000-0000-4000-8000-000000000004',
  'sba',
  'A 46-year-old man has an oral glucose tolerance test using the WHO protocol. Results: 0 hour 5.7 mmol/l; 2 hour 7.6 mmol/l. How should these results be interpreted?',
  'SAMPLE/UNVERIFIED study seed from Amelia transcription. Both fasting and 2-hour values are within normal limits, so the OGTT is normal. Diabetes thresholds: fasting ≥7.0 mmol/L; random/2-hour ≥11.1 mmol/L; asymptomatic patients need two abnormal occasions; HbA1c ≥48 mmol/mol (6.5%).',
  2, true, true, '{}'::jsonb
) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, difficulty = excluded.difficulty, is_uk_practice = excluded.is_uk_practice, updated_at = now();
delete from public.question_options where question_id = 'a4000000-0000-4000-8000-000000000051';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('a5000000-0000-4000-8000-005100000000', 'a4000000-0000-4000-8000-000000000051', 'A', 'Normal', true, 0),
  ('a5000000-0000-4000-8000-005100000001', 'a4000000-0000-4000-8000-000000000051', 'B', 'Impaired fasting glucose and impaired glucose tolerance', false, 1),
  ('a5000000-0000-4000-8000-005100000002', 'a4000000-0000-4000-8000-000000000051', 'C', 'Diabetes mellitus', false, 2),
  ('a5000000-0000-4000-8000-005100000003', 'a4000000-0000-4000-8000-000000000051', 'D', 'Impaired glucose tolerance', false, 3),
  ('a5000000-0000-4000-8000-005100000004', 'a4000000-0000-4000-8000-000000000051', 'E', 'Impaired fasting glucose', false, 4);
insert into public.question_tags (question_id, tag_id) values
  ('a4000000-0000-4000-8000-000000000051', 'a3000000-0000-4000-8000-000000000002'),
  ('a4000000-0000-4000-8000-000000000051', 'a3000000-0000-4000-8000-000000000001')
on conflict do nothing;

-- Verify pack loaded (expect example_pack_questions = 10, example_pack_options = 50)
select
  (select count(*) from public.questions
    where id between 'a4000000-0000-4000-8000-000000000042'
      and 'a4000000-0000-4000-8000-000000000051') as example_pack_questions,
  (select count(*) from public.question_options
    where question_id between 'a4000000-0000-4000-8000-000000000042'
      and 'a4000000-0000-4000-8000-000000000051') as example_pack_options;
