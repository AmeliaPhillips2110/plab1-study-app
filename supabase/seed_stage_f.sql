-- Stage f incremental seed (safe to re-run). Prefer full seed.sql on new projects.
-- Adds patient-centred tag, extra glossary terms, long-stem Q41.

insert into public.tags (id, exam_id, slug, label, category) values
  ('a3000000-0000-4000-8000-000000000003', 'a1000000-0000-4000-8000-000000000001', 'patient-centred', 'Patient-centred', 'communication')
on conflict (exam_id, slug) do nothing;

insert into public.glossary_terms (exam_id, term, definition, aliases, is_active) values
  ('a1000000-0000-4000-8000-000000000001', 'NICE', 'National Institute for Health and Care Excellence — UK guidance body.', array['NICE guideline'], true),
  ('a1000000-0000-4000-8000-000000000001', 'GMC', 'General Medical Council — UK medical regulator; Good Medical Practice sets professional standards.', array['General Medical Council'], true),
  ('a1000000-0000-4000-8000-000000000001', 'ACS', 'Acute coronary syndrome — unstable angina / NSTEMI / STEMI spectrum.', array['acute coronary syndrome'], true),
  ('a1000000-0000-4000-8000-000000000001', 'STEMI', 'ST-elevation myocardial infarction — ECG ST elevation with coronary occlusion pattern.', array['ST elevation MI'], true),
  ('a1000000-0000-4000-8000-000000000001', 'COPD', 'Chronic obstructive pulmonary disease — progressive airflow limitation, usually smoking-related.', array[]::text[], true),
  ('a1000000-0000-4000-8000-000000000001', 'PEFR', 'Peak expiratory flow rate — bedside measure of airway obstruction in asthma.', array['peak flow'], true),
  ('a1000000-0000-4000-8000-000000000001', 'capacity', 'Mental capacity (UK MCA 2005): ability to understand, retain, weigh and communicate a decision.', array['mental capacity'], true)
on conflict (exam_id, term) do nothing;

insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values (
  'a4000000-0000-4000-8000-000000000041',
  'a1000000-0000-4000-8000-000000000001',
  'a2000000-0000-4000-8000-000000000013',
  'sba',
  'A 67-year-old woman with COPD attends your UK GP surgery with her daughter. She has had three days of worsening dyspnoea, a productive cough with green sputum, and fever. She remains able to speak in full sentences, oxygen saturations are 94% on air (her usual baseline), and CURB-65 is 1. She is anxious about hospital admission after a difficult stay last year and asks whether she can be treated at home if safety-netted carefully. Her daughter is worried and wants a frank discussion of risks. You review NICE-style community pneumonia and COPD guidance and consider shared decision-making, capacity, and patient-centred priorities. Which next step best reflects UK ambulatory care and a patient-centred approach when clinically appropriate?',
  'SAMPLE/UNVERIFIED. For low-severity infection in a stable patient who prefers home care, shared decision-making with clear safety-netting and appropriate oral antibiotics (local guidance) aligns with UK ambulatory / patient-centred practice rather than default admission.',
  3,
  true,
  true,
  '{}'::jsonb
) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, difficulty = excluded.difficulty, is_uk_practice = excluded.is_uk_practice, updated_at = now();
delete from public.question_options where question_id = 'a4000000-0000-4000-8000-000000000041';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('a5000000-0000-4000-8000-004100000000', 'a4000000-0000-4000-8000-000000000041', 'A', 'Admit immediately for IV antibiotics regardless of preference', false, 0),
  ('a5000000-0000-4000-8000-004100000001', 'a4000000-0000-4000-8000-000000000041', 'B', 'Agree a supervised home plan with oral antibiotics, safety-net advice, and early review', true, 1),
  ('a5000000-0000-4000-8000-004100000002', 'a4000000-0000-4000-8000-000000000041', 'C', 'Refuse to discuss options and insist on ED transfer only', false, 2),
  ('a5000000-0000-4000-8000-004100000003', 'a4000000-0000-4000-8000-000000000041', 'D', 'Start steroids alone and discharge without follow-up', false, 3),
  ('a5000000-0000-4000-8000-004100000004', 'a4000000-0000-4000-8000-000000000041', 'E', 'Refer for elective bronchoscopy before any treatment', false, 4);
insert into public.question_tags (question_id, tag_id) values
  ('a4000000-0000-4000-8000-000000000041', 'a3000000-0000-4000-8000-000000000002'),
  ('a4000000-0000-4000-8000-000000000041', 'a3000000-0000-4000-8000-000000000001'),
  ('a4000000-0000-4000-8000-000000000041', 'a3000000-0000-4000-8000-000000000003')
on conflict do nothing;

insert into public.question_tags (question_id, tag_id) values
  ('a4000000-0000-4000-8000-000000000036', 'a3000000-0000-4000-8000-000000000003'),
  ('a4000000-0000-4000-8000-000000000037', 'a3000000-0000-4000-8000-000000000003'),
  ('a4000000-0000-4000-8000-000000000038', 'a3000000-0000-4000-8000-000000000003')
on conflict do nothing;
