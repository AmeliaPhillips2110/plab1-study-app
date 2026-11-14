-- =============================================================================
-- PLAB 1 bank v6 part 01: Q1–200 (source plab1-xlsx-v6)
-- Source: PLAB1_Question_Bank_6.xlsx — additive; does not clear v1/v2/v3/v4
-- Safe to re-run (stable UUIDs).
-- =============================================================================

-- Ensure exam exists
insert into public.exams (id, slug, name, description, is_active) values ('a1000000-0000-4000-8000-000000000001', 'plab1', 'PLAB 1', 'PLAB 1 single best answer study bank (PLABoratory).', true) on conflict (slug) do update set name = excluded.name, is_active = true;


-- Q1
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('2f8e9151-7f26-558e-8d61-e6a4c982590f', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000023', 'sba', 'A 30 year old man has been stabbed in the right chest. He is breathless, with absent breath sounds and dullness to percussion on the right. BP is 90/60. What is the SINGLE most likely diagnosis?', 'Haemothorax: dull percussion and reduced breath sounds. Massive haemothorax (over 1.5 L, or over 200 mL/hour ongoing) needs a large-bore chest drain, resuscitation and thoracotomy. Tension pneumothorax is hyperresonant with tracheal deviation.', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v6')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = '2f8e9151-7f26-558e-8d61-e6a4c982590f';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('2f202da1-0bf2-506d-80f7-982786f0185c', '2f8e9151-7f26-558e-8d61-e6a4c982590f', 'A', 'Simple pneumothorax', false, 0),
  ('06748133-cb69-54b9-9448-45c1ca381c04', '2f8e9151-7f26-558e-8d61-e6a4c982590f', 'B', 'Massive haemothorax', true, 1),
  ('875e3942-d8dd-56bc-b9bf-f98e09e5f106', '2f8e9151-7f26-558e-8d61-e6a4c982590f', 'C', 'Flail chest', false, 2),
  ('4fac3efd-7833-5232-9b84-039907cd0fcd', '2f8e9151-7f26-558e-8d61-e6a4c982590f', 'D', 'Tension pneumothorax', false, 3),
  ('af0821d1-6efc-5157-9e39-1acf80ea115f', '2f8e9151-7f26-558e-8d61-e6a4c982590f', 'E', 'Cardiac tamponade', false, 4);

-- Q2
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('37147064-c312-55b7-8cd2-7919a3dbfd61', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000023', 'sba', 'A 40 year old man was rescued from a burning building. He has soot around his nostrils, singed nasal hair and a hoarse voice. SpO2 is 97%. What is the SINGLE most important immediate concern?', 'Inhalation injury signs: facial burns, singed hair, soot in the mouth or nose, hoarseness, stridor and carbonaceous sputum. Airway swelling can progress quickly, so early intubation by an experienced anaesthetist is often needed. Give 100% oxygen (CO and cyanide risk).', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v6')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = '37147064-c312-55b7-8cd2-7919a3dbfd61';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('fb58bed0-abe8-552b-bd19-ba7b5efbe1fc', '37147064-c312-55b7-8cd2-7919a3dbfd61', 'A', 'Fluid resuscitation first', false, 0),
  ('77ec2df2-34a5-5d90-a03f-c325f6c9e8b1', '37147064-c312-55b7-8cd2-7919a3dbfd61', 'B', 'Carbon monoxide only', false, 1),
  ('b01a4c0a-c716-5610-8ea3-e5c185a0739d', '37147064-c312-55b7-8cd2-7919a3dbfd61', 'C', 'Airway burn with risk of rapid airway oedema; early senior anaesthetic review for intubation', true, 2),
  ('67f49ecc-70a1-5f5c-954b-b003f4e559fe', '37147064-c312-55b7-8cd2-7919a3dbfd61', 'D', 'Skin graft planning', false, 3),
  ('d472484b-df2c-5aa3-bc06-0ff1c6e4625d', '37147064-c312-55b7-8cd2-7919a3dbfd61', 'E', 'Tetanus status', false, 4);

-- Q3
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('41efefc3-f18a-51a4-8abd-05a53f6669b2', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000023', 'sba', 'A 35 year old woman has burns to 25% of her body surface area. She weighs 60 kg. Using the Parkland formula, what is the total fluid requirement in the first 24 hours?', 'Parkland formula: 4 mL x weight (kg) x % TBSA burned of Hartmann''s solution over 24 hours, with half in the first 8 hours from the time of injury. Titrate to urine output (0.5 mL/kg/hour in adults). Superficial (erythema only) burns are not counted.', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v6')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = '41efefc3-f18a-51a4-8abd-05a53f6669b2';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('da2dc08d-e61c-557d-b2e2-2e1614e1f063', '41efefc3-f18a-51a4-8abd-05a53f6669b2', 'A', '1,500 mL', false, 0),
  ('bf76b592-0878-537a-b951-33aa6d75a710', '41efefc3-f18a-51a4-8abd-05a53f6669b2', 'B', '3,000 mL', false, 1),
  ('158c905d-3a46-5eb0-888c-8221188fa8e0', '41efefc3-f18a-51a4-8abd-05a53f6669b2', 'C', '6,000 mL (4 x 60 x 25), half in the first 8 hours from the time of the burn', true, 2),
  ('ead2a895-d6ca-546e-8cfa-e074afab6642', '41efefc3-f18a-51a4-8abd-05a53f6669b2', 'D', '12,000 mL', false, 3),
  ('c492282e-1384-5386-98d3-5f653585c492', '41efefc3-f18a-51a4-8abd-05a53f6669b2', 'E', '600 mL', false, 4);

-- Q4
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('4644aad3-0906-555d-b39d-11fcc91de863', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000023', 'sba', 'A 50 year old man has a full-thickness circumferential burn of his chest. He is struggling to breathe, with high ventilator pressures after intubation. What is the SINGLE most appropriate intervention?', 'Circumferential full-thickness burns form a rigid eschar that can restrict chest expansion or limb circulation. Escharotomy (incising the eschar) relieves this. Full-thickness burns are painless, white or leathery and need grafting.', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v6')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = '4644aad3-0906-555d-b39d-11fcc91de863';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('892f1418-d286-5cf3-bfcf-a44763c010f6', '4644aad3-0906-555d-b39d-11fcc91de863', 'A', 'Escharotomy', true, 0),
  ('1691152a-c61d-5f76-9aff-d2bcbe856e96', '4644aad3-0906-555d-b39d-11fcc91de863', 'B', 'Fasciotomy of the legs', false, 1),
  ('80590886-443f-5d07-9450-91ac36ed520d', '4644aad3-0906-555d-b39d-11fcc91de863', 'C', 'Increase sedation', false, 2),
  ('09456c04-29b5-5a3a-90c5-a1af2eaac4fd', '4644aad3-0906-555d-b39d-11fcc91de863', 'D', 'Skin grafting immediately', false, 3),
  ('9d69bfb1-589d-551c-961c-e86cd4cba38d', '4644aad3-0906-555d-b39d-11fcc91de863', 'E', 'Chest drain', false, 4);

-- Q5
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('a6a4dfa3-9bbd-5e24-a84d-d3719ebe822f', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000023', 'sba', 'A 22 year old man had a seizure after taking ecstasy (MDMA) at a festival. He drank a lot of water. Sodium is 118 mmol/L. What is the SINGLE most likely cause of the low sodium?', 'MDMA causes hyponatraemia (ADH release plus excess water), hyperthermia, serotonin syndrome, rhabdomyolysis and arrhythmias. Severe symptomatic hyponatraemia (seizures, reduced consciousness) needs hypertonic saline (e.g. 150 mL 2.7% or 3% saline boluses) with careful monitoring.', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v6')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = 'a6a4dfa3-9bbd-5e24-a84d-d3719ebe822f';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('96512db9-6ce2-57bd-ab6a-a98e487e7c73', 'a6a4dfa3-9bbd-5e24-a84d-d3719ebe822f', 'A', 'Hyperglycaemia', false, 0),
  ('d48756ed-7eaf-5e32-9f14-8f20b1755860', 'a6a4dfa3-9bbd-5e24-a84d-d3719ebe822f', 'B', 'Vomiting only', false, 1),
  ('4106e8a4-999b-5f3e-bd08-826c3a5d2c7f', 'a6a4dfa3-9bbd-5e24-a84d-d3719ebe822f', 'C', 'Addison''s disease', false, 2),
  ('cadd767d-cc7d-5a6b-90be-e26e8ec2a95c', 'a6a4dfa3-9bbd-5e24-a84d-d3719ebe822f', 'D', 'MDMA-induced SIADH combined with excessive water intake', true, 3),
  ('7a38e01b-9fbd-5a0d-a684-f44f404b9b86', 'a6a4dfa3-9bbd-5e24-a84d-d3719ebe822f', 'E', 'Diuretic use', false, 4);

-- Q6
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('9e6817cf-548c-5609-912b-201292a71870', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000023', 'sba', 'A 45 year old man is brought in with agitation, sweating, tachycardia, hypertension and dilated pupils after using cocaine. His temperature is 39°C. What is the SINGLE most appropriate first-line treatment?', 'Cocaine and other stimulant toxicity causes sympathetic overactivity. Benzodiazepines are first-line for agitation, hypertension and tachycardia. Cool actively. Avoid beta-blockers. Look for complications (ACS, dissection, stroke, rhabdomyolysis).', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v6')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = '9e6817cf-548c-5609-912b-201292a71870';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('91c1fed3-1092-560a-951a-c1213e8d8deb', '9e6817cf-548c-5609-912b-201292a71870', 'A', 'IV benzodiazepine (e.g. diazepam or lorazepam) and active cooling', true, 0),
  ('2639c40a-5c5f-5251-91e2-6dc40ee53cba', '9e6817cf-548c-5609-912b-201292a71870', 'B', 'Haloperidol', false, 1),
  ('d59e2a1b-a43d-50b2-a882-2f763eaeb949', '9e6817cf-548c-5609-912b-201292a71870', 'C', 'Flumazenil', false, 2),
  ('2be2862e-ce77-58c0-8f54-4da667ff94d2', '9e6817cf-548c-5609-912b-201292a71870', 'D', 'Beta-blocker', false, 3),
  ('ede65647-d0a5-5c04-a282-19591bf7b789', '9e6817cf-548c-5609-912b-201292a71870', 'E', 'Naloxone', false, 4);

-- Q7
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('cdc63ae3-8d72-5bee-b642-d71a6780b370', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000023', 'sba', 'A 30 year old woman has taken an overdose of 50 tablets of her lithium. Her level is very high and she has confusion and tremor. What is the SINGLE most appropriate treatment?', 'Lithium is not adsorbed by activated charcoal. Treatment: IV fluids, stopping interacting drugs, whole bowel irrigation for modified-release preparations, and haemodialysis for severe toxicity (neurological features, renal failure, very high levels).', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v6')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = 'cdc63ae3-8d72-5bee-b642-d71a6780b370';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('5b3ed5d3-475f-57cf-952f-4226f98b26b1', 'cdc63ae3-8d72-5bee-b642-d71a6780b370', 'A', 'Activated charcoal', false, 0),
  ('8361612e-0a20-55c0-9d0d-28ba53df628f', 'cdc63ae3-8d72-5bee-b642-d71a6780b370', 'B', 'Acetylcysteine', false, 1),
  ('3bbcc3f1-8261-5e89-bbd3-871b1f47bbd0', 'cdc63ae3-8d72-5bee-b642-d71a6780b370', 'C', 'Naloxone', false, 2),
  ('fa1e70af-8beb-5aa5-9f94-57659bbc5534', 'cdc63ae3-8d72-5bee-b642-d71a6780b370', 'D', 'Flumazenil', false, 3),
  ('3170a6af-bca6-56f1-b178-3a023699d5ee', 'cdc63ae3-8d72-5bee-b642-d71a6780b370', 'E', 'IV fluids and haemodialysis for severe toxicity (activated charcoal does not bind lithium)', true, 4);

-- Q8
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('a636ce29-45a9-5fda-b347-67b9ad308932', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000023', 'sba', 'A 70 year old woman with known heart failure is found to have a potassium of 2.4 mmol/L with muscle weakness. ECG shows U waves. What is the SINGLE most appropriate treatment?', 'Severe hypokalaemia (below 2.5 or with symptoms or ECG changes): IV potassium, usually up to 10 mmol/hour peripherally (faster via central line with monitoring). Check and replace magnesium. ECG: U waves, ST depression, flat T waves and arrhythmias.', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v6')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = 'a636ce29-45a9-5fda-b347-67b9ad308932';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('dc24d70e-62de-50c8-bee0-1bfe78c50daf', 'a636ce29-45a9-5fda-b347-67b9ad308932', 'A', 'IV potassium as a bolus', false, 0),
  ('db302d1f-5daf-552c-866c-c4ba26d2520b', 'a636ce29-45a9-5fda-b347-67b9ad308932', 'B', 'Oral potassium only', false, 1),
  ('8fd0cc92-35bb-5fcd-a94f-f7aee4d0eb91', 'a636ce29-45a9-5fda-b347-67b9ad308932', 'C', 'Calcium gluconate', false, 2),
  ('50778ae1-0736-5aeb-b41a-70622b948101', 'a636ce29-45a9-5fda-b347-67b9ad308932', 'D', 'IV potassium chloride (no faster than 10 mmol/hour via peripheral line) with cardiac monitoring', true, 3),
  ('93e9d69d-e375-5375-b715-b95752644dce', 'a636ce29-45a9-5fda-b347-67b9ad308932', 'E', 'Insulin and glucose', false, 4);

-- Q9
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('d903fc25-8e50-566f-8a1d-943c5650291d', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000023', 'sba', 'A 65 year old woman has a sodium of 112 mmol/L. She is confused and drowsy. She has been taking a thiazide diuretic. What is the SINGLE most appropriate initial treatment?', 'Severe symptomatic hyponatraemia needs hypertonic saline to raise sodium by 4-6 mmol/L quickly. Avoid overly rapid correction (osmotic demyelination syndrome), especially in chronic hyponatraemia. Stop thiazides.', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v6')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = 'd903fc25-8e50-566f-8a1d-943c5650291d';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('8bb7d62a-a5e7-5fba-a49f-dfc40bd2e82a', 'd903fc25-8e50-566f-8a1d-943c5650291d', 'A', 'Fluid restriction alone', false, 0),
  ('0ce4411e-bdec-555e-83c2-a9ff015637a2', 'd903fc25-8e50-566f-8a1d-943c5650291d', 'B', 'Rapid correction with large volumes of 0.9% saline', false, 1),
  ('afd87c66-d057-5f5d-8d20-52b94a61bff3', 'd903fc25-8e50-566f-8a1d-943c5650291d', 'C', 'Tolvaptan first-line', false, 2),
  ('37a13f5a-519a-5f56-8de9-b4d147615b91', 'd903fc25-8e50-566f-8a1d-943c5650291d', 'D', 'No treatment', false, 3),
  ('ca4d6d41-19e5-5d37-982d-f59efb828cdb', 'd903fc25-8e50-566f-8a1d-943c5650291d', 'E', 'Hypertonic saline (e.g. 150 mL 3% bolus) with close sodium monitoring, limiting correction to 10 mmol/L in 24 hours', true, 4);

-- Q10
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('7039214c-55fa-5ebd-9349-a961fa957c67', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000023', 'sba', 'A 50 year old man is brought in after an electrical injury at work. He has a small entry wound on his hand and exit wound on his foot. He feels well. What is the SINGLE most important investigation?', 'High-voltage electrical injuries can cause extensive deep tissue damage beneath small skin wounds, arrhythmias, rhabdomyolysis, AKI and compartment syndrome. Monitor ECG, check CK, urine for myoglobin and renal function.', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v6')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = '7039214c-55fa-5ebd-9349-a961fa957c67';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('b9739ef3-2396-540e-874f-1a66b908bbb8', '7039214c-55fa-5ebd-9349-a961fa957c67', 'A', 'CT head', false, 0),
  ('00cbd97c-3e80-5985-817a-38412dc3e7b2', '7039214c-55fa-5ebd-9349-a961fa957c67', 'B', 'Skull X-ray', false, 1),
  ('2e41bd13-9992-5678-8f77-3e42f9b2941c', '7039214c-55fa-5ebd-9349-a961fa957c67', 'C', 'Chest X-ray only', false, 2),
  ('08b8e47f-9457-52bd-993d-962aeb80e725', '7039214c-55fa-5ebd-9349-a961fa957c67', 'D', 'ECG with cardiac monitoring and check CK and renal function', true, 3),
  ('be544ac6-1a49-5fad-9095-704b4e74963b', '7039214c-55fa-5ebd-9349-a961fa957c67', 'E', 'No investigations', false, 4);

-- Q11
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('0757f59f-914f-5260-bfa1-a559d99f47c6', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000023', 'sba', 'A 60 year old man has a sudden onset of chest pain and collapses in the ED. The monitor shows ventricular fibrillation. What is the SINGLE most appropriate immediate action?', 'Shockable rhythms (VF and pulseless VT): one shock, then CPR 30:2 for 2 minutes, then reassess. Adrenaline 1 mg after the third shock and every 3-5 minutes; amiodarone 300 mg after the third shock. Treat reversible causes (4 Hs and 4 Ts).', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v6')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = '0757f59f-914f-5260-bfa1-a559d99f47c6';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('99f76c49-a939-5abf-9f5d-19d172808703', '0757f59f-914f-5260-bfa1-a559d99f47c6', 'A', 'Precordial thump in all cases', false, 0),
  ('a46b2a5b-e847-5896-97fa-2a7de1e47b07', '0757f59f-914f-5260-bfa1-a559d99f47c6', 'B', 'Defibrillation (one shock), then immediately resume CPR for 2 minutes', true, 1),
  ('278bdf3f-123a-5ea7-9f50-45ddbbfff6f0', '0757f59f-914f-5260-bfa1-a559d99f47c6', 'C', 'IV amiodarone first', false, 2),
  ('96978171-a3cb-50d0-8ac3-31632bbb0e4e', '0757f59f-914f-5260-bfa1-a559d99f47c6', 'D', 'Check pulse for 1 minute', false, 3),
  ('5c14cc59-c158-5ef1-99a7-1633d4301418', '0757f59f-914f-5260-bfa1-a559d99f47c6', 'E', 'Give adrenaline before shocking', false, 4);

-- Q12
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('f647938f-bf03-5631-bb16-41612f44e42e', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000023', 'sba', 'A 75 year old woman is in cardiac arrest. The monitor shows pulseless electrical activity. What is the SINGLE most appropriate drug and when should it be given?', 'Non-shockable rhythms (PEA and asystole): CPR 30:2, give adrenaline 1 mg as soon as IV/IO access is available, then every 3-5 minutes. Look for reversible causes: Hypoxia, Hypovolaemia, Hypo/hyperkalaemia and metabolic, Hypothermia, Thrombosis, Tamponade, Toxins and Tension pneumothorax.', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v6')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = 'f647938f-bf03-5631-bb16-41612f44e42e';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('765c9751-d39d-55a5-b32c-e9fe97114c5c', 'f647938f-bf03-5631-bb16-41612f44e42e', 'A', 'Adrenaline 1 mg IV as soon as possible, then every 3-5 minutes', true, 0),
  ('c98dbdda-7ce4-5b7a-a908-b637db1d4509', 'f647938f-bf03-5631-bb16-41612f44e42e', 'B', 'No drugs in PEA', false, 1),
  ('5029c44c-16f8-5279-ace7-3a98ed68d974', 'f647938f-bf03-5631-bb16-41612f44e42e', 'C', 'Atropine 3 mg', false, 2),
  ('0d849afc-1c84-5f8f-9ced-da792b786e17', 'f647938f-bf03-5631-bb16-41612f44e42e', 'D', 'Adenosine 6 mg', false, 3),
  ('551a27af-8697-586b-9342-8be3b8c62749', 'f647938f-bf03-5631-bb16-41612f44e42e', 'E', 'Amiodarone 300 mg', false, 4);

-- Q13
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('af89cfbf-b461-524f-98a6-8d1102c95493', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000023', 'sba', 'A 40 year old woman has had pain in her neck after a car crash. She is alert with no neurological deficit and can rotate her neck 45 degrees each way. She is 40 and had a low-speed rear-end collision. What is the SINGLE most appropriate imaging decision?', 'Canadian C-spine rule: high-risk factors (age 65 or over, dangerous mechanism, paraesthesia in limbs) mean imaging (CT). Low-risk factors allow assessment of neck rotation; if able to rotate 45 degrees each way, no imaging is needed.', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v6')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = 'af89cfbf-b461-524f-98a6-8d1102c95493';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('17f0e631-efc9-574a-828c-6038e860318c', 'af89cfbf-b461-524f-98a6-8d1102c95493', 'A', 'Flexion-extension X-rays', false, 0),
  ('ca1b8bed-97b2-5488-8d17-0782b33c93a9', 'af89cfbf-b461-524f-98a6-8d1102c95493', 'B', 'CT cervical spine in all', false, 1),
  ('793fc815-f14d-5dc1-ae0f-f3d148ad60ed', 'af89cfbf-b461-524f-98a6-8d1102c95493', 'C', 'No imaging needed (Canadian C-spine rule low risk with ability to rotate the neck)', true, 2),
  ('940ee029-6843-54f3-88fe-f5954e91de19', 'af89cfbf-b461-524f-98a6-8d1102c95493', 'D', 'Plain X-ray of the whole spine', false, 3),
  ('643a9fad-7fa4-508d-8476-aa066f392dc6', 'af89cfbf-b461-524f-98a6-8d1102c95493', 'E', 'MRI cervical spine', false, 4);

-- Q14
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('d619757c-0552-5c8e-900e-a28abb075aed', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000023', 'sba', 'A 6 year old boy fell from a tree and hit his head. He vomited three times and is drowsy. GCS is 13. What is the SINGLE most appropriate action?', 'NICE NG232 in children: CT within 1 hour if suspected non-accidental injury, post-traumatic seizure, GCS below 14 on assessment (below 15 under 1 year), suspected open or depressed skull fracture, basal skull fracture signs or focal deficit. More than one risk factor (e.g. 3 or more vomits, dangerous mechanism, abnormal drowsiness) also triggers CT.', null, true, true, jsonb_build_object('source', 'plab1-xlsx-v6', 'guidelines_text', 'NICE NG232')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = 'd619757c-0552-5c8e-900e-a28abb075aed';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('3c28776b-f0c8-5832-8242-7884c139b250', 'd619757c-0552-5c8e-900e-a28abb075aed', 'A', 'Skull X-ray', false, 0),
  ('1c3c36d7-ef74-570f-ac82-88ec6018630e', 'd619757c-0552-5c8e-900e-a28abb075aed', 'B', 'MRI in 1 week', false, 1),
  ('fcfb465f-c744-5cfd-84e4-9457702976b2', 'd619757c-0552-5c8e-900e-a28abb075aed', 'C', 'CT head within 1 hour', true, 2),
  ('af8bc7a9-24de-584c-a0ca-9353654f155b', 'd619757c-0552-5c8e-900e-a28abb075aed', 'D', 'Observe at home', false, 3),
  ('eba3744b-373f-5bc4-a311-a732f03ab6d4', 'd619757c-0552-5c8e-900e-a28abb075aed', 'E', 'Discharge with head injury advice', false, 4);

-- Q15
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('8e6f2a0b-6cd0-5ce3-aa4b-3532b671e02b', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000023', 'sba', 'A 30 year old man has been brought in after a motorbike crash. He has a pelvic fracture and is hypotensive. What is the SINGLE most appropriate immediate step?', 'Unstable pelvic fractures can cause massive bleeding. Apply a pelvic binder (at the level of the greater trochanters), give blood products in a balanced ratio and tranexamic acid within 3 hours, then angioembolisation or surgery. Avoid repeated pelvic springing. Check for urethral injury before catheterising.', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v6')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = '8e6f2a0b-6cd0-5ce3-aa4b-3532b671e02b';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('5290e392-ea1a-5327-bcd7-41149b7b982e', '8e6f2a0b-6cd0-5ce3-aa4b-3532b671e02b', 'A', 'MRI pelvis', false, 0),
  ('dc04db6a-c4a0-5741-b9a2-055169522fc5', '8e6f2a0b-6cd0-5ce3-aa4b-3532b671e02b', 'B', 'Apply a pelvic binder and activate the major haemorrhage protocol', true, 1),
  ('c58faf88-baaf-50b7-a598-2377d5885b0d', '8e6f2a0b-6cd0-5ce3-aa4b-3532b671e02b', 'C', 'Fluids without blood products', false, 2),
  ('da2295be-3360-5fb9-8257-5a81dac86910', '8e6f2a0b-6cd0-5ce3-aa4b-3532b671e02b', 'D', 'Examine the pelvis repeatedly by springing it', false, 3),
  ('9e0387e6-74ce-5520-aa2e-64618b9dc239', '8e6f2a0b-6cd0-5ce3-aa4b-3532b671e02b', 'E', 'Urethral catheter immediately', false, 4);

-- Q16
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('ab93b18b-90f1-5e14-8b5d-d7165105c26f', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000001', 'sba', 'A 55 year old man has stable angina. He has had an MI. He is now pain-free on treatment. What target should his LDL be on lipid-lowering therapy?', 'Secondary prevention: atorvastatin 80 mg. NICE NG238 recommends aiming for LDL of 2.0 mmol/L or less (or non-HDL 2.6 or less). If not reached, add ezetimibe, then consider inclisiran or PCSK9 inhibitors.', null, true, true, jsonb_build_object('source', 'plab1-xlsx-v6', 'guidelines_text', 'NICE NG238')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = 'ab93b18b-90f1-5e14-8b5d-d7165105c26f';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('5ecd1f8c-346d-5d29-8013-21d76c7c6995', 'ab93b18b-90f1-5e14-8b5d-d7165105c26f', 'A', 'Target HDL only', false, 0),
  ('26c09376-9faf-509e-b1bd-014324457066', 'ab93b18b-90f1-5e14-8b5d-d7165105c26f', 'B', 'Aim for a reduction in non-HDL cholesterol of over 40% (and NICE now suggests LDL of 2.0 mmol/L or less, or non-HDL 2.6 or less)', true, 1),
  ('9d0a7c22-3311-52b3-ae57-fa88ba84b22c', 'ab93b18b-90f1-5e14-8b5d-d7165105c26f', 'C', 'LDL below 5.0', false, 2),
  ('41298b8d-404d-55a0-8df0-f3d098324862', 'ab93b18b-90f1-5e14-8b5d-d7165105c26f', 'D', 'Stop statin when normal', false, 3),
  ('c3dbcafe-93d2-55b7-ab91-a72b1c772f63', 'ab93b18b-90f1-5e14-8b5d-d7165105c26f', 'E', 'No target needed', false, 4);

-- Q17
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('07007b83-0dc5-5129-a0ae-aa7f7c6fc770', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000001', 'sba', 'A 70 year old woman has had palpitations. ECG shows frequent ventricular ectopic beats. Echo is normal. She has no other symptoms. What is the SINGLE most appropriate management?', 'Isolated ventricular ectopics with a structurally normal heart are usually benign. Check electrolytes, TFTs and echo. Reduce triggers (caffeine, alcohol, stress). Beta-blockers for troublesome symptoms. Very frequent ectopics can cause cardiomyopathy.', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v6')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = '07007b83-0dc5-5129-a0ae-aa7f7c6fc770';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('9f024401-88c7-582f-bda1-d277e31fe60a', '07007b83-0dc5-5129-a0ae-aa7f7c6fc770', 'A', 'Start amiodarone', false, 0),
  ('8d71f19f-ba75-508e-9485-355faf0775f3', '07007b83-0dc5-5129-a0ae-aa7f7c6fc770', 'B', 'Catheter ablation in all', false, 1),
  ('8b7c8122-b88b-54f2-aba2-b1413a1f28ef', '07007b83-0dc5-5129-a0ae-aa7f7c6fc770', 'C', 'Warfarin', false, 2),
  ('ccb7b375-8489-5916-b29e-3522362d9f97', '07007b83-0dc5-5129-a0ae-aa7f7c6fc770', 'D', 'Reassure, reduce caffeine and alcohol, check electrolytes and thyroid function', true, 3),
  ('253956c2-390b-5571-95fc-64c8de90f2c8', '07007b83-0dc5-5129-a0ae-aa7f7c6fc770', 'E', 'Implant a defibrillator', false, 4);

-- Q18
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('8add759c-f36c-517f-874c-5ec2761dcd67', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000001', 'sba', 'A 45 year old man has had a sudden onset of palpitations. ECG shows a regular broad-complex tachycardia at 180 bpm. He is stable. What is the SINGLE most appropriate first treatment?', 'A regular broad-complex tachycardia should be assumed to be VT. Stable patients: IV amiodarone. Unstable patients: synchronised DC cardioversion. Verapamil can cause cardiovascular collapse in VT.', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v6')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = '8add759c-f36c-517f-874c-5ec2761dcd67';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('1a19ec5f-09bd-53bf-bceb-5b2f4cccdb91', '8add759c-f36c-517f-874c-5ec2761dcd67', 'A', 'Oral bisoprolol', false, 0),
  ('996079f7-00fe-531c-9043-fe62c3605643', '8add759c-f36c-517f-874c-5ec2761dcd67', 'B', 'Carotid massage only', false, 1),
  ('22693e90-d55a-5a38-9b87-55f30f6ae3ba', '8add759c-f36c-517f-874c-5ec2761dcd67', 'C', 'IV verapamil', false, 2),
  ('ee6f29c6-d4be-506e-9372-80412f321106', '8add759c-f36c-517f-874c-5ec2761dcd67', 'D', 'IV amiodarone 300 mg over 10-60 minutes (assume ventricular tachycardia)', true, 3),
  ('1b095bd7-286c-50ea-ae49-40ccd13b1bb3', '8add759c-f36c-517f-874c-5ec2761dcd67', 'E', 'IV adenosine for all broad-complex tachycardias', false, 4);

-- Q19
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('cedbcd71-97c3-50e5-a6a5-1a1b675c438c', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000001', 'sba', 'A 65 year old man with heart failure has an ejection fraction of 30% and a QRS duration of 160 ms with LBBB despite optimal medical therapy. He is in sinus rhythm with NYHA class III symptoms. What is the SINGLE most appropriate device therapy?', 'CRT (biventricular pacing) improves symptoms and survival in HFrEF with a wide QRS (especially LBBB with QRS 150 ms or more). An ICD is added (CRT-D) for those at risk of sudden death.', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v6')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = 'cedbcd71-97c3-50e5-a6a5-1a1b675c438c';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('dd825e12-f3bd-59fc-be5d-3935c3b97541', 'cedbcd71-97c3-50e5-a6a5-1a1b675c438c', 'A', 'No device', false, 0),
  ('d9127b5b-d0b6-5519-9e6e-169f4f45801c', 'cedbcd71-97c3-50e5-a6a5-1a1b675c438c', 'B', 'Left ventricular assist device first', false, 1),
  ('84809112-6824-5fa2-981c-60e21cfba0a3', 'cedbcd71-97c3-50e5-a6a5-1a1b675c438c', 'C', 'Permanent single-chamber pacemaker', false, 2),
  ('5e9faf52-3e02-5f49-995d-73de7feca376', 'cedbcd71-97c3-50e5-a6a5-1a1b675c438c', 'D', 'Implantable loop recorder', false, 3),
  ('4878e2ec-44a3-5672-aed1-44099f86fc64', 'cedbcd71-97c3-50e5-a6a5-1a1b675c438c', 'E', 'Cardiac resynchronisation therapy (CRT-P or CRT-D)', true, 4);

-- Q20
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('71764ffe-17ed-5dae-8efb-b8d4cbf366ad', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000001', 'sba', 'A 40 year old woman has had breathlessness, haemoptysis and AF. She has a loud first heart sound and a mid-diastolic murmur. She is 32 weeks pregnant. What is the MOST likely valve lesion?', 'Mitral stenosis is poorly tolerated in pregnancy because of increased heart rate and blood volume, causing pulmonary oedema and AF. Management: beta-blockers, diuretics, anticoagulation for AF, and balloon valvotomy if severe.', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v6')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = '71764ffe-17ed-5dae-8efb-b8d4cbf366ad';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('c269a330-2f75-5f91-8805-aa7fd0ae2f67', '71764ffe-17ed-5dae-8efb-b8d4cbf366ad', 'A', 'Mitral stenosis (worsened by the increased cardiac output of pregnancy)', true, 0),
  ('02a90226-b45b-5f0b-9be7-d13cd3d0b091', '71764ffe-17ed-5dae-8efb-b8d4cbf366ad', 'B', 'Pulmonary stenosis', false, 1),
  ('976fabf5-3f13-5ed5-a34d-ee38b14c167f', '71764ffe-17ed-5dae-8efb-b8d4cbf366ad', 'C', 'Aortic regurgitation', false, 2),
  ('9afc869a-ac3c-5dd2-8d4d-75a2d2820a24', '71764ffe-17ed-5dae-8efb-b8d4cbf366ad', 'D', 'Tricuspid regurgitation', false, 3),
  ('353471b6-c425-5f10-9756-ae394dabab9f', '71764ffe-17ed-5dae-8efb-b8d4cbf366ad', 'E', 'Mitral valve prolapse', false, 4);

-- Q21
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('540f824b-17d0-5e01-abf8-e1102e029aa0', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000001', 'sba', 'A 25 year old man has had a heart murmur since childhood. He has a widely split, fixed second heart sound and an ejection systolic murmur at the left upper sternal edge. ECG shows right bundle branch block. What is the SINGLE most likely diagnosis?', 'ASD causes fixed splitting of S2, a pulmonary flow murmur and RBBB (secundum ASD with right axis deviation). It may be found in adulthood with AF, breathlessness or paradoxical embolism. Closure (percutaneous or surgical) for significant shunts.', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v6')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = '540f824b-17d0-5e01-abf8-e1102e029aa0';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('5ac59753-5940-5022-bc31-6f2ec659b962', '540f824b-17d0-5e01-abf8-e1102e029aa0', 'A', 'Coarctation of the aorta', false, 0),
  ('ada1a6e2-5618-5f7a-837a-6fd1234a9c81', '540f824b-17d0-5e01-abf8-e1102e029aa0', 'B', 'Patent ductus arteriosus', false, 1),
  ('c4a2e2ea-fedd-578f-a586-ab7df4d6762b', '540f824b-17d0-5e01-abf8-e1102e029aa0', 'C', 'Atrial septal defect', true, 2),
  ('e2fa549e-f490-5c38-b348-55eff76827ed', '540f824b-17d0-5e01-abf8-e1102e029aa0', 'D', 'Aortic stenosis', false, 3),
  ('f8eb35b5-f691-53ed-be7b-a36712768076', '540f824b-17d0-5e01-abf8-e1102e029aa0', 'E', 'Ventricular septal defect', false, 4);

-- Q22
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('3f91830a-7348-54e0-a4b5-1f3e314c984b', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000001', 'sba', 'A 3 day old baby born at 30 weeks has a continuous ''machinery'' murmur and bounding pulses. What is the SINGLE most likely diagnosis?', 'PDA is common in preterm babies. It causes a continuous machinery murmur, bounding pulses and wide pulse pressure, and can cause heart failure. Treatment: NSAIDs (ibuprofen or indomethacin) or paracetamol to close it, or surgical ligation.', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v6')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = '3f91830a-7348-54e0-a4b5-1f3e314c984b';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('0610fa6f-34d1-5626-a392-1bb94025abd5', '3f91830a-7348-54e0-a4b5-1f3e314c984b', 'A', 'Patent ductus arteriosus', true, 0),
  ('ffbcdeaf-d03c-58fb-9c56-5f75486c9749', '3f91830a-7348-54e0-a4b5-1f3e314c984b', 'B', 'Tetralogy of Fallot', false, 1),
  ('cdac727b-ab1a-5fcf-a83f-d0de8f694fbd', '3f91830a-7348-54e0-a4b5-1f3e314c984b', 'C', 'Atrial septal defect', false, 2),
  ('0d4ee9ff-8745-5c65-a76b-dae1e600dd97', '3f91830a-7348-54e0-a4b5-1f3e314c984b', 'D', 'Coarctation of the aorta', false, 3),
  ('c7500248-e065-55e9-bb04-1787d337214a', '3f91830a-7348-54e0-a4b5-1f3e314c984b', 'E', 'Ventricular septal defect', false, 4);

-- Q23
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('f1469298-b33f-5c55-84e6-b47836862810', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000001', 'sba', 'A 68 year old man has had a 24-hour tape for palpitations, showing pauses of 4 seconds with episodes of fast AF. He has had dizziness. What is the SINGLE most likely diagnosis and treatment?', 'Sick sinus syndrome causes sinus bradycardia, pauses and alternating tachycardias (often AF). Symptomatic bradycardia needs a pacemaker, which then allows rate-controlling drugs for the tachycardia. Anticoagulate for AF.', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v6')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = 'f1469298-b33f-5c55-84e6-b47836862810';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('0b0e528b-2b07-5133-9446-05464bb499db', 'f1469298-b33f-5c55-84e6-b47836862810', 'A', 'Complete heart block; atropine only', false, 0),
  ('a557b06c-304c-5f4a-a07b-d8017b5c14db', 'f1469298-b33f-5c55-84e6-b47836862810', 'B', 'Vasovagal syncope; reassure', false, 1),
  ('e9b08f1b-6dea-5d4e-b8bf-893485eea89c', 'f1469298-b33f-5c55-84e6-b47836862810', 'C', 'WPW; ablation', false, 2),
  ('d630035f-83b3-5b67-a484-b85fc0c79c10', 'f1469298-b33f-5c55-84e6-b47836862810', 'D', 'Long QT; beta-blocker alone', false, 3),
  ('33f96114-9dc9-5d88-9583-60ca4f722d8e', 'f1469298-b33f-5c55-84e6-b47836862810', 'E', 'Sick sinus syndrome (tachy-brady syndrome); permanent pacemaker plus rate control', true, 4);

-- Q24
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('9f74299b-5a99-576a-b47e-7438f8dd17c3', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000001', 'sba', 'A 50 year old man has had a sudden onset of chest pain radiating to the back and a new early diastolic murmur. BP is 190/100. What is the SINGLE most appropriate investigation?', 'Aortic dissection: tearing pain radiating to the back, BP differences between arms, new aortic regurgitation murmur, pulse deficits and neurological signs. CT angiography confirms (TOE if unstable). Type A needs emergency surgery. Avoid thrombolysis.', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v6')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = '9f74299b-5a99-576a-b47e-7438f8dd17c3';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('861ad1d2-74e7-519a-aa74-1231b5bdf373', '9f74299b-5a99-576a-b47e-7438f8dd17c3', 'A', 'Echo in 6 weeks', false, 0),
  ('bcc8f8dc-8f7f-5a26-9f1c-f15a2df60071', '9f74299b-5a99-576a-b47e-7438f8dd17c3', 'B', 'CT aortic angiography', true, 1),
  ('a9dcb1f2-3dac-5746-9aa9-4caed66b1135', '9f74299b-5a99-576a-b47e-7438f8dd17c3', 'C', 'Exercise ECG', false, 2),
  ('97dce262-1d30-512c-b5dd-b3a44d618a75', '9f74299b-5a99-576a-b47e-7438f8dd17c3', 'D', 'Chest X-ray only', false, 3),
  ('4042e1bb-3454-5226-9eee-1430ec1e31e0', '9f74299b-5a99-576a-b47e-7438f8dd17c3', 'E', 'Coronary angiography first', false, 4);

-- Q25
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('587d1d1c-5f74-51e2-bc84-8f25f6e6c9c3', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000006', 'sba', 'A 65 year old man has had progressive memory loss over 6 months and jerky movements. EEG shows periodic sharp wave complexes. MRI shows cortical ribboning. What is the SINGLE most likely diagnosis?', 'Sporadic CJD causes rapidly progressive dementia, myoclonus, ataxia and visual disturbance, with death within about a year. MRI (DWI) shows cortical ribboning and basal ganglia signal; CSF RT-QuIC is highly specific. It is notifiable. Variant CJD affects younger people with psychiatric symptoms.', null, true, true, jsonb_build_object('source', 'plab1-xlsx-v6')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = '587d1d1c-5f74-51e2-bc84-8f25f6e6c9c3';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('7c56e253-3bca-5ffd-8876-4f1e56235ed2', '587d1d1c-5f74-51e2-bc84-8f25f6e6c9c3', 'A', 'Alzheimer''s disease', false, 0),
  ('1549d727-d918-5e8b-a0ef-6b689d44f3f1', '587d1d1c-5f74-51e2-bc84-8f25f6e6c9c3', 'B', 'Vascular dementia', false, 1),
  ('0dc2dfc1-08e7-5f2a-a82a-db6da695a527', '587d1d1c-5f74-51e2-bc84-8f25f6e6c9c3', 'C', 'Creutzfeldt-Jakob disease', true, 2),
  ('3e85baaf-97e3-5b05-8d45-994a78ef767a', '587d1d1c-5f74-51e2-bc84-8f25f6e6c9c3', 'D', 'Lewy body dementia', false, 3),
  ('6cf13292-8cd3-5032-92d2-517d8b4b0faf', '587d1d1c-5f74-51e2-bc84-8f25f6e6c9c3', 'E', 'Huntington''s disease', false, 4);

-- Q26
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('7e5c7a19-e2a5-5d4e-8291-b0b469ac4181', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000006', 'sba', 'A 40 year old woman has had episodes of a rising feeling in her stomach, an odd smell and lip-smacking, lasting 1 minute, with no memory of the episode. What type of seizure is this?', 'Temporal lobe seizures: aura (epigastric rising, déjà vu, smells), automatisms (lip-smacking, fumbling) and impaired awareness. Focal seizures may become bilateral tonic-clonic. First-line treatment: lamotrigine or levetiracetam. MRI looks for hippocampal sclerosis.', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v6')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = '7e5c7a19-e2a5-5d4e-8291-b0b469ac4181';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('4a68ef19-52f0-5259-8c28-15a62bab11e0', '7e5c7a19-e2a5-5d4e-8291-b0b469ac4181', 'A', 'Tonic-clonic seizure', false, 0),
  ('703133f3-fde9-536c-9cbf-68a0e22b57a7', '7e5c7a19-e2a5-5d4e-8291-b0b469ac4181', 'B', 'Focal impaired awareness seizure (temporal lobe)', true, 1),
  ('c58c25bb-aca6-56a0-9f21-d66b197c5fa8', '7e5c7a19-e2a5-5d4e-8291-b0b469ac4181', 'C', 'Non-epileptic attack', false, 2),
  ('846738bf-dd0c-5cf0-8151-13ee3765f333', '7e5c7a19-e2a5-5d4e-8291-b0b469ac4181', 'D', 'Absence seizure', false, 3),
  ('40c1cada-fc65-51a2-ad1a-c5aa06e5697b', '7e5c7a19-e2a5-5d4e-8291-b0b469ac4181', 'E', 'Myoclonic seizure', false, 4);

-- Q27
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('fab4a963-f4fe-5c7e-b8a3-3f91dd90739d', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000006', 'sba', 'A 30 year old woman has had episodes of unresponsiveness lasting 10 minutes with side-to-side head movements, eyes tightly closed and pelvic thrusting. EEG during an episode is normal. What is the SINGLE most likely diagnosis?', 'Functional seizures: prolonged episodes, eyes closed, side-to-side head movements, asynchronous movements, pelvic thrusting and recall of events. Video-EEG telemetry confirms. Treatment: explanation and psychological therapy. Antiepileptics should be stopped if not needed.', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v6')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = 'fab4a963-f4fe-5c7e-b8a3-3f91dd90739d';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('4a41a08e-7cdf-5f1f-90d5-3ab0a3a40ba3', 'fab4a963-f4fe-5c7e-b8a3-3f91dd90739d', 'A', 'Hypoglycaemia', false, 0),
  ('6133c114-0e7b-5a1e-8480-085bf37ff980', 'fab4a963-f4fe-5c7e-b8a3-3f91dd90739d', 'B', 'Functional (dissociative/non-epileptic) seizures', true, 1),
  ('82fadc67-0042-5687-9da0-55068faa8f11', 'fab4a963-f4fe-5c7e-b8a3-3f91dd90739d', 'C', 'Frontal lobe epilepsy', false, 2),
  ('62a0eca4-eebe-566d-bffc-3f2db5298c91', 'fab4a963-f4fe-5c7e-b8a3-3f91dd90739d', 'D', 'Absence epilepsy', false, 3),
  ('fc251f8d-81db-5687-bcce-ab81ffb7e5cf', 'fab4a963-f4fe-5c7e-b8a3-3f91dd90739d', 'E', 'Syncope', false, 4);

-- Q28
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('669681ad-fdcd-5c06-8942-fdef48794a54', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000006', 'sba', 'A 50 year old woman has had ascending tingling and weakness over 3 days. Her reflexes are absent, and she has ataxia and ophthalmoplegia. Anti-GQ1b antibodies are positive. What is the SINGLE most likely diagnosis?', 'Miller Fisher syndrome is a variant of GBS with the triad of ophthalmoplegia, ataxia and areflexia, associated with anti-GQ1b antibodies. It usually has a good prognosis. Treatment is like GBS (IVIG).', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v6')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = '669681ad-fdcd-5c06-8942-fdef48794a54';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('4314f8db-9dbd-5f65-8294-7ea59a3692e6', '669681ad-fdcd-5c06-8942-fdef48794a54', 'A', 'Botulism', false, 0),
  ('73213a5a-dae2-5fce-8fd7-fdfee2fb6718', '669681ad-fdcd-5c06-8942-fdef48794a54', 'B', 'Myasthenia gravis', false, 1),
  ('de359d03-d066-585c-baaf-dd62607a24a3', '669681ad-fdcd-5c06-8942-fdef48794a54', 'C', 'Miller Fisher syndrome', true, 2),
  ('bbc77237-7bdb-528c-b991-79a2aa506650', '669681ad-fdcd-5c06-8942-fdef48794a54', 'D', 'Wernicke''s encephalopathy', false, 3),
  ('eb58ecd8-5566-532b-9145-7d6ccc0dc3c8', '669681ad-fdcd-5c06-8942-fdef48794a54', 'E', 'Guillain-Barré syndrome (classic)', false, 4);

-- Q29
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('0fe6213c-c773-56d9-970b-6dfaa2869d42', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000006', 'sba', 'A 55 year old man with alcohol dependence is confused, ataxic and has nystagmus with ophthalmoplegia. What is the SINGLE most appropriate immediate treatment?', 'Wernicke''s encephalopathy (confusion, ataxia, ophthalmoplegia/nystagmus) is caused by thiamine deficiency. Treat with high-dose IV thiamine; give before glucose to avoid worsening. Untreated, it can progress to Korsakoff''s syndrome (amnesia with confabulation).', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v6')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = '0fe6213c-c773-56d9-970b-6dfaa2869d42';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('e7e1fe78-22ee-5a17-9e4d-24022a1e874f', '0fe6213c-c773-56d9-970b-6dfaa2869d42', 'A', 'Oral thiamine only', false, 0),
  ('ff54d7bc-fd86-5fcf-aab1-abf08f3f9bf4', '0fe6213c-c773-56d9-970b-6dfaa2869d42', 'B', 'IV thiamine (Pabrinex) before glucose', true, 1),
  ('ea27982b-e459-5b49-9a78-8c368c593f63', '0fe6213c-c773-56d9-970b-6dfaa2869d42', 'C', 'Benzodiazepines only', false, 2),
  ('2bf0e260-f303-5743-8397-a3cb0e4c5944', '0fe6213c-c773-56d9-970b-6dfaa2869d42', 'D', 'IV glucose first', false, 3),
  ('d4912fd4-2aa5-571a-9b3c-9f9d37f7d184', '0fe6213c-c773-56d9-970b-6dfaa2869d42', 'E', 'Haloperidol', false, 4);

-- Q30
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('56416cbe-29a3-55e9-bc52-7e3b90e26263', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000006', 'sba', 'A 25 year old man has had back pain, leg weakness and urinary retention over 24 hours after an epidural steroid injection. He has fever. MRI shows an epidural collection. What is the SINGLE most likely diagnosis?', 'Spinal epidural abscess: back pain, fever and neurological deficit. Risk factors: IV drug use, diabetes, spinal procedures and bacteraemia. MRI with contrast confirms. Treatment: IV antibiotics (often S. aureus) and urgent surgical decompression.', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v6')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = '56416cbe-29a3-55e9-bc52-7e3b90e26263';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('0854856c-002d-521b-b5dc-343659fb7e81', '56416cbe-29a3-55e9-bc52-7e3b90e26263', 'A', 'Disc prolapse', false, 0),
  ('d0e887f6-97ee-5ee0-9678-9534fe4984df', '56416cbe-29a3-55e9-bc52-7e3b90e26263', 'B', 'Transverse myelitis', false, 1),
  ('7b755365-45b1-58e3-aa6c-bbefb282c80b', '56416cbe-29a3-55e9-bc52-7e3b90e26263', 'C', 'Guillain-Barré syndrome', false, 2),
  ('6a482df2-c333-55e1-9abb-6ddc5c460109', '56416cbe-29a3-55e9-bc52-7e3b90e26263', 'D', 'Multiple sclerosis', false, 3),
  ('a4ec8923-bf37-56f7-8ed7-9d08e7acc3b2', '56416cbe-29a3-55e9-bc52-7e3b90e26263', 'E', 'Spinal epidural abscess', true, 4);

-- Q31
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('db9f516e-b7ba-5fbf-9a45-798c76bbb1ab', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000006', 'sba', 'A 35 year old woman has had numbness in a stocking distribution and absent ankle reflexes. She has had a gastric bypass. Which deficiency should be checked FIRST alongside B12?', 'After bariatric surgery, deficiencies of B12, thiamine, copper, folate, iron, vitamin D and calcium are common. Copper deficiency causes a myeloneuropathy similar to B12 deficiency. Lifelong supplements and monitoring are needed.', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v6')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = 'db9f516e-b7ba-5fbf-9a45-798c76bbb1ab';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('33e72983-2775-5db5-937d-071826966603', 'db9f516e-b7ba-5fbf-9a45-798c76bbb1ab', 'A', 'Vitamin A', false, 0),
  ('91b7ea68-a14e-5cfe-ab7f-f51eaad2a557', 'db9f516e-b7ba-5fbf-9a45-798c76bbb1ab', 'B', 'Copper (and thiamine)', true, 1),
  ('eec41e39-1331-5b9d-a701-7b0377d14841', 'db9f516e-b7ba-5fbf-9a45-798c76bbb1ab', 'C', 'Zinc only', false, 2),
  ('d0199d84-967f-58b3-9b13-09c83fcd6c62', 'db9f516e-b7ba-5fbf-9a45-798c76bbb1ab', 'D', 'Iron only', false, 3),
  ('66b6aa9b-822d-5eb7-9b13-2b8a198dcfa4', 'db9f516e-b7ba-5fbf-9a45-798c76bbb1ab', 'E', 'Vitamin C', false, 4);

-- Q32
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('2a048557-e1e2-5bc8-91be-8229fcfbb55a', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000006', 'sba', 'A 70 year old man has had an acute stroke. CT shows a large intracerebral haemorrhage. He takes apixaban. What is the SINGLE most appropriate step?', 'Intracerebral haemorrhage on anticoagulants needs urgent reversal (warfarin: PCC and vitamin K; dabigatran: idarucizumab; factor Xa inhibitors: andexanet alfa or PCC). Lower systolic BP to around 140 mmHg within an hour (if 150-220). Neurosurgical referral if hydrocephalus or deteriorating.', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v6')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = '2a048557-e1e2-5bc8-91be-8229fcfbb55a';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('6b4614ac-79b3-5364-b454-82a552ab2399', '2a048557-e1e2-5bc8-91be-8229fcfbb55a', 'A', 'Thrombolysis', false, 0),
  ('8bb12497-b0f8-5f52-8a71-4fc744f28391', '2a048557-e1e2-5bc8-91be-8229fcfbb55a', 'B', 'Start aspirin', false, 1),
  ('f2f0d16f-165c-5b8c-b6fc-8e52f65c32a4', '2a048557-e1e2-5bc8-91be-8229fcfbb55a', 'C', 'Continue apixaban', false, 2),
  ('e09b1af7-5c44-58f9-b685-74cd9e0fb18b', '2a048557-e1e2-5bc8-91be-8229fcfbb55a', 'D', 'Give heparin', false, 3),
  ('14e0adad-71e2-5950-99b7-48edad934444', '2a048557-e1e2-5bc8-91be-8229fcfbb55a', 'E', 'Reverse anticoagulation (andexanet alfa or prothrombin complex concentrate) and control BP', true, 4);

-- Q33
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('a2350134-409c-5f8b-bef5-0dcdb77b4081', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000006', 'sba', 'A 45 year old woman has had progressive weakness of her hands with wasting of the small muscles and loss of pain and temperature sensation in a cape-like distribution. Light touch is preserved. What is the SINGLE most likely diagnosis?', 'Syringomyelia is a fluid-filled cavity in the spinal cord, damaging crossing spinothalamic fibres (cape-like loss of pain and temperature) and anterior horn cells (wasting of hand muscles). Often associated with Chiari malformation. MRI confirms.', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v6')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = 'a2350134-409c-5f8b-bef5-0dcdb77b4081';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('f9d930dd-55e3-5065-9de3-0af5f64873b5', 'a2350134-409c-5f8b-bef5-0dcdb77b4081', 'A', 'Cervical spondylosis', false, 0),
  ('8c906605-bc93-5abf-9064-dedd89637a51', 'a2350134-409c-5f8b-bef5-0dcdb77b4081', 'B', 'Motor neurone disease', false, 1),
  ('7d078954-c05b-5f0c-8808-4d4a9709197f', 'a2350134-409c-5f8b-bef5-0dcdb77b4081', 'C', 'Carpal tunnel syndrome', false, 2),
  ('8a94725d-85d3-5b38-89ad-f4c9558b62a0', 'a2350134-409c-5f8b-bef5-0dcdb77b4081', 'D', 'Syringomyelia', true, 3),
  ('fdc506b9-602f-5382-859d-ec0a0c6afdb0', 'a2350134-409c-5f8b-bef5-0dcdb77b4081', 'E', 'Multiple sclerosis', false, 4);

-- Q34
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('0cc8105d-9179-54aa-afae-7b17dcdaa335', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000006', 'sba', 'A 30 year old woman has had progressive pain in one hand after a minor fracture. The hand is swollen, red, sweaty and extremely sensitive to touch. What is the SINGLE most likely diagnosis?', 'CRPS causes severe pain out of proportion, allodynia, swelling, colour, temperature and sweating changes, and trophic changes after injury. Diagnosed using the Budapest criteria. Treatment: early physiotherapy and occupational therapy, pain management and psychological support.', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v6')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = '0cc8105d-9179-54aa-afae-7b17dcdaa335';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('e7d28288-1b3a-57b0-bc79-1169321f1e85', '0cc8105d-9179-54aa-afae-7b17dcdaa335', 'A', 'DVT of the arm', false, 0),
  ('a31c71f5-fe67-5205-8444-a73439d090d2', '0cc8105d-9179-54aa-afae-7b17dcdaa335', 'B', 'Complex regional pain syndrome', true, 1),
  ('350100c4-f4c4-5fa6-9ec9-bef48ec464ee', '0cc8105d-9179-54aa-afae-7b17dcdaa335', 'C', 'Cellulitis', false, 2),
  ('597fe7ae-f48e-5dd8-9291-47b027943a97', '0cc8105d-9179-54aa-afae-7b17dcdaa335', 'D', 'Gout', false, 3),
  ('f12f93a8-75db-55d3-9587-b808f0cd45d9', '0cc8105d-9179-54aa-afae-7b17dcdaa335', 'E', 'Carpal tunnel syndrome', false, 4);

-- Q35
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('2524bce3-fa92-579e-a10d-0dbf8cb4f4d1', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000006', 'sba', 'A 50 year old man has had an itchy rash and neuropathic pain in a band around his chest for 4 months after shingles. What is the SINGLE most appropriate first-line treatment?', 'Post-herpetic neuralgia is pain persisting 3 months or more after shingles. Treat as neuropathic pain. Capsaicin cream or lidocaine plasters for localised pain. The shingles vaccine reduces the risk.', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v6')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = '2524bce3-fa92-579e-a10d-0dbf8cb4f4d1';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('b890b949-0c26-5147-ad0c-e19792cac474', '2524bce3-fa92-579e-a10d-0dbf8cb4f4d1', 'A', 'Oral steroids', false, 0),
  ('a59d4754-f7e0-57f5-b306-bf0dba9c1d7b', '2524bce3-fa92-579e-a10d-0dbf8cb4f4d1', 'B', 'Amitriptyline, duloxetine, gabapentin or pregabalin (or topical lidocaine for localised pain)', true, 1),
  ('55b4d71d-c077-5386-97d6-bb433095311f', '2524bce3-fa92-579e-a10d-0dbf8cb4f4d1', 'C', 'Long-term oral aciclovir', false, 2),
  ('e67c3be7-1619-536c-b385-2d724a874cfc', '2524bce3-fa92-579e-a10d-0dbf8cb4f4d1', 'D', 'Strong opioids first-line', false, 3),
  ('be11ff4b-25b6-5cae-91b2-0b6d2fdf5d1f', '2524bce3-fa92-579e-a10d-0dbf8cb4f4d1', 'E', 'Antibiotics', false, 4);

-- Q36
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('a882e4de-565e-5da7-85c6-5cad71f0f148', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000006', 'sba', 'A 35 year old woman has had numbness and tingling of her hands. Her Tinel''s sign is positive at the elbow, with weakness of finger abduction and numbness of the little finger. What is the SINGLE most likely diagnosis?', 'Ulnar nerve compression at the elbow causes numbness of the little and ring fingers and weakness of the intrinsic hand muscles. Worse with prolonged elbow flexion. Management: avoid elbow flexion, night splints, and surgical decompression for persistent symptoms.', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v6')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = 'a882e4de-565e-5da7-85c6-5cad71f0f148';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('ca3c0839-f17a-5ab8-8681-398287f19f89', 'a882e4de-565e-5da7-85c6-5cad71f0f148', 'A', 'Cubital tunnel syndrome (ulnar nerve entrapment at the elbow)', true, 0),
  ('38c54581-e967-50b4-8f28-dc91fde9459a', 'a882e4de-565e-5da7-85c6-5cad71f0f148', 'B', 'C6 radiculopathy', false, 1),
  ('e903e54d-7b73-587a-9db1-2dd1112c93a9', 'a882e4de-565e-5da7-85c6-5cad71f0f148', 'C', 'Guyon''s canal syndrome only', false, 2),
  ('828a858d-766c-5e5c-b1b4-01af531cd007', 'a882e4de-565e-5da7-85c6-5cad71f0f148', 'D', 'Carpal tunnel syndrome', false, 3),
  ('f379ebce-a135-528a-a4e1-27847de17ed0', 'a882e4de-565e-5da7-85c6-5cad71f0f148', 'E', 'Thoracic outlet syndrome', false, 4);

-- Q37
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('d39a2f95-73d6-5a30-b82b-9b1a548b4bf1', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000005', 'sba', 'A 70 year old woman with diabetes has had a urinary tract infection with fever, flank pain and gas in the kidney on CT. She is septic. What is the SINGLE most likely diagnosis?', 'Emphysematous pyelonephritis is a severe necrotising infection with gas formation, usually in people with diabetes or obstruction. Treatment: IV antibiotics, drainage and sometimes nephrectomy. High mortality.', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v6')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = 'd39a2f95-73d6-5a30-b82b-9b1a548b4bf1';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('1dd0db14-b4f3-5b97-9446-702a1d0a34d3', 'd39a2f95-73d6-5a30-b82b-9b1a548b4bf1', 'A', 'Renal abscess', false, 0),
  ('3f351540-5848-5b58-adbd-db26edb39ae3', 'd39a2f95-73d6-5a30-b82b-9b1a548b4bf1', 'B', 'Simple pyelonephritis', false, 1),
  ('7667a26b-b3cd-5b81-a7eb-b9101b8f4d25', 'd39a2f95-73d6-5a30-b82b-9b1a548b4bf1', 'C', 'Kidney stone', false, 2),
  ('2233df71-9db5-5ccd-b5f5-ff00b1cd277d', 'd39a2f95-73d6-5a30-b82b-9b1a548b4bf1', 'D', 'Emphysematous pyelonephritis', true, 3),
  ('eb648600-9e11-5690-8f20-8999294f9153', 'd39a2f95-73d6-5a30-b82b-9b1a548b4bf1', 'E', 'Renal infarct', false, 4);

-- Q38
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('8652b670-0892-5535-9323-1199a043de3f', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000005', 'sba', 'A 45 year old woman has had progressive kidney disease. She has had analgesic use for years and sterile pyuria. Ultrasound shows small kidneys with papillary calcification. What is the SINGLE most likely diagnosis?', 'Long-term analgesic use (especially combination analgesics and NSAIDs) causes chronic interstitial nephritis and papillary necrosis. Other causes of papillary necrosis: diabetes, sickle cell disease, pyelonephritis and obstruction. Sterile pyuria also suggests renal TB.', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v6')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = '8652b670-0892-5535-9323-1199a043de3f';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('53fdf07b-0bae-5b64-9fad-6ed794a9245c', '8652b670-0892-5535-9323-1199a043de3f', 'A', 'Alport syndrome', false, 0),
  ('2a84d7ef-19a8-5775-a994-25b874f594a9', '8652b670-0892-5535-9323-1199a043de3f', 'B', 'Renal TB', false, 1),
  ('d6d7b511-1abe-5a72-afcf-bffd17c3c6a6', '8652b670-0892-5535-9323-1199a043de3f', 'C', 'Membranous nephropathy', false, 2),
  ('7c3e0320-6a6c-5919-8b81-1c8df2f43aa4', '8652b670-0892-5535-9323-1199a043de3f', 'D', 'Polycystic kidney disease', false, 3),
  ('bbc81946-0145-52f2-8e78-62bbf2fd2ea6', '8652b670-0892-5535-9323-1199a043de3f', 'E', 'Analgesic nephropathy (papillary necrosis)', true, 4);

-- Q39
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('0d21e287-ae10-5487-90d6-f71bcdbec42b', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000005', 'sba', 'A 50 year old man with chronic kidney disease has a raised parathyroid hormone, raised calcium and raised phosphate after years of dialysis. What is the SINGLE most likely diagnosis?', 'Secondary hyperparathyroidism (low or normal calcium, high PTH) occurs in CKD and vitamin D deficiency. Long-standing stimulation can lead to autonomous parathyroid secretion with hypercalcaemia (tertiary). Treatment: cinacalcet or parathyroidectomy.', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v6')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = '0d21e287-ae10-5487-90d6-f71bcdbec42b';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('9b9a901b-9d26-50d6-b635-1dfc016e290c', '0d21e287-ae10-5487-90d6-f71bcdbec42b', 'A', 'Vitamin D deficiency', false, 0),
  ('255b9926-2c35-5fb2-acbd-9d6fc91b5cf9', '0d21e287-ae10-5487-90d6-f71bcdbec42b', 'B', 'Secondary hyperparathyroidism', false, 1),
  ('a777ff96-58c8-5660-8476-9fd441d194d2', '0d21e287-ae10-5487-90d6-f71bcdbec42b', 'C', 'Pseudohypoparathyroidism', false, 2),
  ('208145aa-326c-5e3e-82ac-6b12473baeb4', '0d21e287-ae10-5487-90d6-f71bcdbec42b', 'D', 'Primary hyperparathyroidism', false, 3),
  ('13da8601-1d03-52a0-99f6-7da81cb9caa5', '0d21e287-ae10-5487-90d6-f71bcdbec42b', 'E', 'Tertiary hyperparathyroidism', true, 4);

-- Q40
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('db689e30-44c4-5dd0-a086-c1fc4854f762', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000005', 'sba', 'A 25 year old woman has had fever and loin pain. She is 28 weeks pregnant. Urine culture grows E. coli. What is the SINGLE most appropriate antibiotic?', 'Pyelonephritis in pregnancy: admit if unwell and give IV antibiotics; cefalexin orally for milder cases. Nitrofurantoin is not suitable for upper tract infection. Avoid trimethoprim in the first trimester, quinolones and tetracyclines. Asymptomatic bacteriuria in pregnancy is treated.', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v6')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = 'db689e30-44c4-5dd0-a086-c1fc4854f762';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('b24a5087-4c52-59d7-9463-779afe738683', 'db689e30-44c4-5dd0-a086-c1fc4854f762', 'A', 'Nitrofurantoin for pyelonephritis', false, 0),
  ('4881075e-6570-5e15-a4a7-79625ede2f3b', 'db689e30-44c4-5dd0-a086-c1fc4854f762', 'B', 'Cefalexin (or IV cefuroxime if unwell), as per local guidance', true, 1),
  ('4d14d3c0-0c75-56d7-a0c3-4953e1307578', 'db689e30-44c4-5dd0-a086-c1fc4854f762', 'C', 'Doxycycline', false, 2),
  ('83efc047-f00e-519a-897b-18a8fbb66087', 'db689e30-44c4-5dd0-a086-c1fc4854f762', 'D', 'Trimethoprim in the first trimester', false, 3),
  ('108d61e9-4b85-5942-8a60-4a4c7b482677', 'db689e30-44c4-5dd0-a086-c1fc4854f762', 'E', 'Ciprofloxacin', false, 4);

-- Q41
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('37eae083-7381-5106-bda0-d1a1fa005a6e', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000005', 'sba', 'A 65 year old man had a contrast CT 3 days ago. His creatinine has risen from 110 to 200 µmol/L. He has diabetes. What is the SINGLE most likely cause?', 'Contrast-associated AKI peaks at 2-5 days. Risk factors: CKD, diabetes, dehydration, heart failure and nephrotoxic drugs. Prevention: hydration, withholding nephrotoxins and metformin. Most recover; management is supportive.', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v6')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = '37eae083-7381-5106-bda0-d1a1fa005a6e';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('8362603c-d8be-59db-bba5-1382ebf81cc8', '37eae083-7381-5106-bda0-d1a1fa005a6e', 'A', 'Obstruction', false, 0),
  ('7243fa6c-4e35-5825-8160-5b5ae55c4496', '37eae083-7381-5106-bda0-d1a1fa005a6e', 'B', 'Rhabdomyolysis', false, 1),
  ('db76c7d0-d89c-56a5-b9aa-6ce5887000ee', '37eae083-7381-5106-bda0-d1a1fa005a6e', 'C', 'Glomerulonephritis', false, 2),
  ('ac867f76-577e-5e66-b909-6c71beee63de', '37eae083-7381-5106-bda0-d1a1fa005a6e', 'D', 'Renal artery stenosis', false, 3),
  ('bcb10883-11e7-56bc-8055-17266819910b', '37eae083-7381-5106-bda0-d1a1fa005a6e', 'E', 'Contrast-associated acute kidney injury', true, 4);

-- Q42
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('7db49f31-a4d6-5f47-8bc2-b26ac9b078f4', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000020', 'sba', 'A 30 year old man has had painful lymph nodes and a painful, soft, ragged genital ulcer after travelling to East Africa. What is the SINGLE most likely diagnosis?', 'Chancroid causes painful, soft, ragged ulcers with tender suppurative inguinal lymphadenopathy, mainly in tropical areas. Treatment: azithromycin or ceftriaxone. Syphilis chancres are painless and indurated. Test for HIV and syphilis.', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v6')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = '7db49f31-a4d6-5f47-8bc2-b26ac9b078f4';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('75fe3a39-e49a-5169-81b4-3867385ee6a5', '7db49f31-a4d6-5f47-8bc2-b26ac9b078f4', 'A', 'Donovanosis', false, 0),
  ('33a32680-270a-57b2-a3ab-39dcffc9cf4d', '7db49f31-a4d6-5f47-8bc2-b26ac9b078f4', 'B', 'Chancroid (Haemophilus ducreyi)', true, 1),
  ('1fa8ced9-48bd-5d0e-9d23-d1e40b0ff996', '7db49f31-a4d6-5f47-8bc2-b26ac9b078f4', 'C', 'Genital herpes', false, 2),
  ('a531a2b5-c6c1-58a2-871b-e13571830614', '7db49f31-a4d6-5f47-8bc2-b26ac9b078f4', 'D', 'Primary syphilis', false, 3),
  ('b14e73c5-c210-5023-b7a0-5a90f88c3705', '7db49f31-a4d6-5f47-8bc2-b26ac9b078f4', 'E', 'Lymphogranuloma venereum', false, 4);

-- Q43
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('1e5c753c-e8b7-52f7-a3de-07356315860d', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000020', 'sba', 'A 40 year old man who has sex with men has a new rash, fever and painful anogenital lesions with lymphadenopathy. The lesions are firm, deep vesicles and pustules. What is the SINGLE most likely diagnosis?', 'Mpox causes fever, lymphadenopathy and lesions that progress from macules to vesicles and pustules, often anogenital in sexual transmission. Isolate and test by PCR of lesion swabs. It is notifiable. Vaccination is offered to people at higher risk.', null, true, true, jsonb_build_object('source', 'plab1-xlsx-v6')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = '1e5c753c-e8b7-52f7-a3de-07356315860d';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('3198ade5-7407-50b3-ba6f-106c130c4680', '1e5c753c-e8b7-52f7-a3de-07356315860d', 'A', 'Molluscum contagiosum', false, 0),
  ('81a4397a-e06a-5911-9170-fbe7586b6261', '1e5c753c-e8b7-52f7-a3de-07356315860d', 'B', 'Chickenpox', false, 1),
  ('4ee0f098-0e5d-5fcd-bfd3-ecbbff7b7471', '1e5c753c-e8b7-52f7-a3de-07356315860d', 'C', 'Herpes simplex', false, 2),
  ('fb6c1256-ac77-5150-8b8d-d15138c77f20', '1e5c753c-e8b7-52f7-a3de-07356315860d', 'D', 'Secondary syphilis', false, 3),
  ('63865b8c-aa7f-57c1-b5c7-ad4c4981dc02', '1e5c753c-e8b7-52f7-a3de-07356315860d', 'E', 'Mpox (monkeypox)', true, 4);

-- Q44
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('6053dd81-930d-5ab2-8882-d6b4a7a87948', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000020', 'sba', 'A 35 year old woman has had pain, swelling and redness on one side of her vulva. There is a tender fluctuant swelling at the posterior part of the labium. What is the SINGLE most likely diagnosis?', 'Bartholin''s glands lie at the posterior vaginal opening. Blocked ducts form cysts; infection forms abscesses. Treatment: incision with a Word catheter or marsupialisation, with antibiotics if cellulitis. In women over 40, consider biopsy to exclude carcinoma.', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v6')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = '6053dd81-930d-5ab2-8882-d6b4a7a87948';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('1f13decc-9a45-5d7f-8f32-ca19682e84bb', '6053dd81-930d-5ab2-8882-d6b4a7a87948', 'A', 'Lipoma', false, 0),
  ('050d913e-61e0-552f-982d-05b10d7033bf', '6053dd81-930d-5ab2-8882-d6b4a7a87948', 'B', 'Bartholin''s abscess', true, 1),
  ('775de523-fc7c-52d2-a757-f724857bff84', '6053dd81-930d-5ab2-8882-d6b4a7a87948', 'C', 'Inguinal hernia', false, 2),
  ('c46ba5d7-4bb1-5070-8e04-64bdd721d5f4', '6053dd81-930d-5ab2-8882-d6b4a7a87948', 'D', 'Vulval cancer', false, 3),
  ('b6f1bcdb-94e9-58da-9635-a51eb5a9feab', '6053dd81-930d-5ab2-8882-d6b4a7a87948', 'E', 'Genital herpes', false, 4);

-- Q45
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('192295fa-cfeb-5440-9bd9-4f9e56a3e61d', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000020', 'sba', 'A 22 year old woman has a new sexual partner and wants STI testing. She has no symptoms. Which test is recommended for chlamydia and gonorrhoea?', 'Women: self-taken or clinician-taken vulvovaginal swab for NAAT (most sensitive). Men: first-void urine NAAT. Extragenital (throat and rectal) swabs are taken based on sexual history. The National Chlamydia Screening Programme focuses on women under 25.', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v6')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = '192295fa-cfeb-5440-9bd9-4f9e56a3e61d';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('78cabcea-fd86-5b07-9b00-f620b2b244ef', '192295fa-cfeb-5440-9bd9-4f9e56a3e61d', 'A', 'High vaginal swab culture only', false, 0),
  ('09c666b7-56be-5b27-9099-1ec23e707d83', '192295fa-cfeb-5440-9bd9-4f9e56a3e61d', 'B', 'Urine culture', false, 1),
  ('78972e40-0602-5363-a972-692636dc8140', '192295fa-cfeb-5440-9bd9-4f9e56a3e61d', 'C', 'Self-taken vulvovaginal swab for NAAT', true, 2),
  ('2ae5574a-a695-5319-a952-3c557d7fdd65', '192295fa-cfeb-5440-9bd9-4f9e56a3e61d', 'D', 'Cervical cytology', false, 3),
  ('3535ba74-e777-5991-91b9-3ac8a4bae8f2', '192295fa-cfeb-5440-9bd9-4f9e56a3e61d', 'E', 'Blood test', false, 4);

-- Q46
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('8cd819ef-2995-52be-ae09-82f54d7a2326', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000020', 'sba', 'A 50 year old woman is HIV positive and taking ART. She has bone pain, low phosphate and glycosuria with normal blood glucose. Which drug is the MOST likely cause?', 'Tenofovir disoproxil fumarate can cause proximal renal tubular dysfunction (Fanconi syndrome: glycosuria, phosphaturia, aminoaciduria), CKD and reduced bone density. Tenofovir alafenamide has fewer renal and bone effects. Abacavir: hypersensitivity (HLA-B*5701 testing).', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v6')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = '8cd819ef-2995-52be-ae09-82f54d7a2326';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('ee67460b-36b9-5a88-a8f0-c52cad05c055', '8cd819ef-2995-52be-ae09-82f54d7a2326', 'A', 'Lamivudine', false, 0),
  ('da23fe48-af43-5c33-9053-c2a3f93a8338', '8cd819ef-2995-52be-ae09-82f54d7a2326', 'B', 'Tenofovir disoproxil (proximal tubulopathy / Fanconi syndrome)', true, 1),
  ('c50f090a-e430-5e7a-8a85-3b52ffc6703c', '8cd819ef-2995-52be-ae09-82f54d7a2326', 'C', 'Dolutegravir', false, 2),
  ('36614a59-b526-5611-b8a9-3a2cdd252126', '8cd819ef-2995-52be-ae09-82f54d7a2326', 'D', 'Abacavir', false, 3),
  ('a617cc23-419e-5de7-b923-389e902779ec', '8cd819ef-2995-52be-ae09-82f54d7a2326', 'E', 'Efavirenz', false, 4);

-- Q47
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('b9be823e-eedd-5f2f-a834-74a88d421a79', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000035', 'sba', 'A 40 year old man in ICU has a raised intracranial pressure after head injury. His sodium is 128 mmol/L. Which IV fluid should be AVOIDED?', 'In brain injury, hypotonic fluids lower serum osmolality and worsen cerebral oedema. Use isotonic fluids and hypertonic saline or mannitol for raised ICP. Keep sodium in the normal to high range.', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v6')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = 'b9be823e-eedd-5f2f-a834-74a88d421a79';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('e7029a22-e7f0-54cc-bd9a-5ddd654c49ea', 'b9be823e-eedd-5f2f-a834-74a88d421a79', 'A', 'Hypertonic saline', false, 0),
  ('4d3251e7-7868-5cae-90b0-5d95455777af', 'b9be823e-eedd-5f2f-a834-74a88d421a79', 'B', 'Albumin', false, 1),
  ('9f821e0a-d26e-5c00-acf7-396bcb99d21c', 'b9be823e-eedd-5f2f-a834-74a88d421a79', 'C', '0.9% saline', false, 2),
  ('b5cf7b0a-bc72-5727-8e9f-645528cfda97', 'b9be823e-eedd-5f2f-a834-74a88d421a79', 'D', 'Hypotonic fluids such as 5% dextrose (worsen cerebral oedema)', true, 3),
  ('57d92ae0-9fdb-5ee7-ace8-eb8fc988c80a', 'b9be823e-eedd-5f2f-a834-74a88d421a79', 'E', 'Hartmann''s solution in normal volumes', false, 4);

-- Q48
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('3c4bd9f0-2c52-5535-ab4c-1eeddb94125a', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000035', 'sba', 'A 75 year old woman in ICU with sepsis has a urine output of 0.2 mL/kg/hour for 12 hours. Creatinine has doubled. Which stage of AKI is this (KDIGO)?', 'KDIGO AKI staging: stage 1 (creatinine 1.5-1.9 times baseline or rise of 26.5 µmol/L in 48 hours, or urine under 0.5 mL/kg/hour for 6-12 hours), stage 2 (2.0-2.9 times, or under 0.5 for 12 hours or more), stage 3 (3 times or more, creatinine 354 or more, RRT, or under 0.3 for 24 hours or anuria for 12 hours).', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v6')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = '3c4bd9f0-2c52-5535-ab4c-1eeddb94125a';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('8293e992-38b6-55c9-af9c-01ebf1e08bd0', '3c4bd9f0-2c52-5535-ab4c-1eeddb94125a', 'A', 'Stage 2', true, 0),
  ('38e8c8d5-cae4-5a28-a050-b83f7fe016a9', '3c4bd9f0-2c52-5535-ab4c-1eeddb94125a', 'B', 'Stage 1', false, 1),
  ('d041214d-2d1b-5d7e-a0f8-613d81562428', '3c4bd9f0-2c52-5535-ab4c-1eeddb94125a', 'C', 'Stage 3', false, 2),
  ('16b757d5-0134-5a24-9f78-2a65b4728071', '3c4bd9f0-2c52-5535-ab4c-1eeddb94125a', 'D', 'No AKI', false, 3),
  ('2bcfe910-6410-5c99-84dd-ef09f9a28b01', '3c4bd9f0-2c52-5535-ab4c-1eeddb94125a', 'E', 'Stage 4', false, 4);

-- Q49
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('445ff2ae-a209-5414-ba70-4c4e8a281257', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000035', 'sba', 'A 30 year old woman is in ICU with severe COVID-19 pneumonia. She is hypoxic on high-flow oxygen. Which treatment has been shown to reduce mortality in patients needing oxygen?', 'In COVID-19 needing oxygen, dexamethasone reduces mortality (RECOVERY trial). IL-6 inhibitors (tocilizumab) and JAK inhibitors (baricitinib) are added in some patients. Prophylactic anticoagulation and awake proning are also used. Hydroxychloroquine and ivermectin are not effective.', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v6')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = '445ff2ae-a209-5414-ba70-4c4e8a281257';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('c147dd61-7763-507a-b4f0-b4cf57f82b20', '445ff2ae-a209-5414-ba70-4c4e8a281257', 'A', 'Azithromycin', false, 0),
  ('6cdd5eb0-93f9-50c7-beac-c784ecd91d34', '445ff2ae-a209-5414-ba70-4c4e8a281257', 'B', 'Dexamethasone 6 mg daily for up to 10 days', true, 1),
  ('a2bd71b4-0f99-5d5f-a2b9-9a8b09c02d80', '445ff2ae-a209-5414-ba70-4c4e8a281257', 'C', 'Ivermectin', false, 2),
  ('8aa05c6a-bd73-57c6-8ed6-399f60676d68', '445ff2ae-a209-5414-ba70-4c4e8a281257', 'D', 'Convalescent plasma routinely', false, 3),
  ('2650efd4-d340-5041-9268-1038156d43db', '445ff2ae-a209-5414-ba70-4c4e8a281257', 'E', 'Hydroxychloroquine', false, 4);

-- Q50
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('426dd5f0-0f1c-5e7f-9b8d-0ffe93625190', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000035', 'sba', 'A 60 year old man in ICU has stopped responding to the ventilator. The end-tidal CO2 trace has disappeared and his SpO2 is falling. What is the SINGLE most likely cause?', 'Loss of capnography trace is a warning of tube displacement, blockage or cardiac arrest. Use the DOPES approach and check the tube position urgently. Waveform capnography is mandatory for all intubated patients.', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v6')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = '426dd5f0-0f1c-5e7f-9b8d-0ffe93625190';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('7b38cd81-118c-52a0-bc35-a77b76b5f01f', '426dd5f0-0f1c-5e7f-9b8d-0ffe93625190', 'A', 'Pneumonia', false, 0),
  ('70a53b51-b24f-5c38-9ef2-51ee621e1585', '426dd5f0-0f1c-5e7f-9b8d-0ffe93625190', 'B', 'Fluid overload', false, 1),
  ('d9a5a70c-dff8-586f-930d-e1ccc76b5dc2', '426dd5f0-0f1c-5e7f-9b8d-0ffe93625190', 'C', 'Pleural effusion', false, 2),
  ('4bed0f17-34e0-5286-a2a9-f9789b43845c', '426dd5f0-0f1c-5e7f-9b8d-0ffe93625190', 'D', 'Displacement or blockage of the endotracheal tube', true, 3),
  ('19adf4c9-2ad2-52d5-b0a2-9bbe72b6ba42', '426dd5f0-0f1c-5e7f-9b8d-0ffe93625190', 'E', 'Hypoglycaemia', false, 4);

-- Q51
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('c0d75f38-b864-573f-a660-e7bfcc31d825', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000035', 'sba', 'A 50 year old woman in ICU has a new fever, rising inflammatory markers and a new infiltrate on chest X-ray 4 days after intubation. What is the SINGLE most likely diagnosis?', 'VAP occurs over 48 hours after intubation. Organisms: Pseudomonas, Enterobacteriaceae, S. aureus (including MRSA) and Acinetobacter. Send lower respiratory samples and treat with antibiotics according to local resistance patterns.', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v6')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = 'c0d75f38-b864-573f-a660-e7bfcc31d825';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('57f69d06-1546-561e-a067-997b93da1279', 'c0d75f38-b864-573f-a660-e7bfcc31d825', 'A', 'Community-acquired pneumonia', false, 0),
  ('643cf390-69fa-5b43-bbb9-f2839b570a81', 'c0d75f38-b864-573f-a660-e7bfcc31d825', 'B', 'Pulmonary embolism', false, 1),
  ('a55d687b-2e0d-5d7b-a782-d1126c425e0c', 'c0d75f38-b864-573f-a660-e7bfcc31d825', 'C', 'ARDS from sepsis only', false, 2),
  ('99d40b8c-4ba4-557f-9c2a-bf6bc25d7b49', 'c0d75f38-b864-573f-a660-e7bfcc31d825', 'D', 'Atelectasis only', false, 3),
  ('2b2fb209-14a8-594b-8808-345abda9beba', 'c0d75f38-b864-573f-a660-e7bfcc31d825', 'E', 'Ventilator-associated pneumonia', true, 4);

-- Q52
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('768fa767-b5db-582d-8ecc-d1891c38d365', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000035', 'sba', 'A 35 year old man is in ICU after a cardiac arrest. He is comatose. What intervention helps neurological outcome after return of spontaneous circulation?', 'Post-cardiac arrest care: avoid hypoxia and hyperoxia, keep normal CO2, maintain MAP, control glucose and prevent fever (current guidelines prefer preventing fever over targeting 32-36°C). Coronary angiography for STEMI. Prognostication is delayed for at least 72 hours.', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v6')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = '768fa767-b5db-582d-8ecc-d1891c38d365';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('2c18fe05-1b5d-57c0-b3d6-dc5285a80889', '768fa767-b5db-582d-8ecc-d1891c38d365', 'A', 'Allow fever', false, 0),
  ('fd2c53ee-8181-5767-b5a4-063f39ebbd44', '768fa767-b5db-582d-8ecc-d1891c38d365', 'B', 'Temperature control: prevent fever (keep at or below 37.5°C) for at least 72 hours', true, 1),
  ('72037963-3c10-53a4-bb77-dfe9e6e68320', '768fa767-b5db-582d-8ecc-d1891c38d365', 'C', 'No temperature management', false, 2),
  ('677425f5-480b-547c-a255-a5f583390791', '768fa767-b5db-582d-8ecc-d1891c38d365', 'D', 'High-dose steroids', false, 3),
  ('f46c4762-2cf8-5639-8e57-eb99d92fa8fa', '768fa767-b5db-582d-8ecc-d1891c38d365', 'E', 'Induce hypothermia to 28°C', false, 4);

-- Q53
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('3e9a761d-beec-52a5-9933-c7f0c8b7733b', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000007', 'sba', 'A 28 year old woman has repeated episodes of intense fear that she has a serious illness despite normal tests. She checks her body many times a day and seeks reassurance. What is the SINGLE most likely diagnosis?', 'Health anxiety: persistent preoccupation with having a serious illness despite reassurance. Somatic symptom disorder focuses on distressing physical symptoms. Factitious disorder involves intentionally producing symptoms. Treatment: CBT and sometimes SSRIs. Avoid unnecessary tests.', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v6')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = '3e9a761d-beec-52a5-9933-c7f0c8b7733b';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('d9c32140-da81-5f00-8f9c-d87d8b3b2c22', '3e9a761d-beec-52a5-9933-c7f0c8b7733b', 'A', 'Somatisation disorder', false, 0),
  ('82701bc3-1481-5b72-b334-203403b325d2', '3e9a761d-beec-52a5-9933-c7f0c8b7733b', 'B', 'Generalised anxiety disorder', false, 1),
  ('be0253eb-07c6-5547-ba9f-884d88eac964', '3e9a761d-beec-52a5-9933-c7f0c8b7733b', 'C', 'Health anxiety (hypochondriasis)', true, 2),
  ('fe87117a-0e8b-589a-a07b-2f3e1b7ef424', '3e9a761d-beec-52a5-9933-c7f0c8b7733b', 'D', 'Delusional disorder', false, 3),
  ('a50112cd-c1d3-54c0-a9d6-8902a965afb5', '3e9a761d-beec-52a5-9933-c7f0c8b7733b', 'E', 'Factitious disorder', false, 4);

-- Q54
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('779c1e6e-df80-5179-b8e7-8c3173329795', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000007', 'sba', 'A 30 year old woman repeatedly injects herself with insulin to cause hypoglycaemia. She has no diabetes and gains no financial reward; she seeks the sick role. What is the SINGLE most likely diagnosis?', 'Factitious disorder is intentional production or feigning of symptoms to assume the sick role, without external incentives. Malingering is feigning for external gain (money, avoiding work or prosecution). Low C-peptide with high insulin suggests exogenous insulin.', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v6')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = '779c1e6e-df80-5179-b8e7-8c3173329795';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('d80d3511-2aa1-5429-b184-e682d511d9bd', '779c1e6e-df80-5179-b8e7-8c3173329795', 'A', 'Factitious disorder', true, 0),
  ('dbf9d0cc-a4f3-5eb4-aba3-d95b50991dad', '779c1e6e-df80-5179-b8e7-8c3173329795', 'B', 'Conversion disorder', false, 1),
  ('31998e85-3111-5026-a22d-65f8ee9d94a6', '779c1e6e-df80-5179-b8e7-8c3173329795', 'C', 'Malingering', false, 2),
  ('f2e14fc4-443a-5cf8-ba9f-fc6c1e74ea3d', '779c1e6e-df80-5179-b8e7-8c3173329795', 'D', 'Anorexia nervosa', false, 3),
  ('c4f084a8-0a8d-5860-a568-330ceb9ca747', '779c1e6e-df80-5179-b8e7-8c3173329795', 'E', 'Somatic symptom disorder', false, 4);

-- Q55
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('dd74f2cd-b43e-5b36-b766-3ae42f18cec5', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000007', 'sba', 'A 40 year old man drinks heavily. He has severe memory loss for recent events and makes up stories to fill the gaps. He had Wernicke''s encephalopathy a year ago. What is the SINGLE most likely diagnosis?', 'Korsakoff''s syndrome is a chronic amnestic syndrome from thiamine deficiency, with anterograde and retrograde amnesia and confabulation. Other cognitive functions are relatively preserved. Thiamine and abstinence may help, but recovery is often incomplete.', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v6')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = 'dd74f2cd-b43e-5b36-b766-3ae42f18cec5';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('7fae9e5f-6f7d-58f3-acfb-0374de9adafe', 'dd74f2cd-b43e-5b36-b766-3ae42f18cec5', 'A', 'Schizophrenia', false, 0),
  ('83b9d91f-a40e-5df6-b082-7e913b3f1732', 'dd74f2cd-b43e-5b36-b766-3ae42f18cec5', 'B', 'Korsakoff''s syndrome', true, 1),
  ('20a80f35-aefd-5d79-ad17-e32ab2a100f9', 'dd74f2cd-b43e-5b36-b766-3ae42f18cec5', 'C', 'Alzheimer''s disease', false, 2),
  ('3da359cf-586c-5387-bb54-88a280524a07', 'dd74f2cd-b43e-5b36-b766-3ae42f18cec5', 'D', 'Frontotemporal dementia', false, 3),
  ('e23230b0-d38d-5702-91e9-43c5da2daad6', 'dd74f2cd-b43e-5b36-b766-3ae42f18cec5', 'E', 'Delirium', false, 4);

-- Q56
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('e19905ef-fb64-54a4-a919-35a9e44e745b', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000007', 'sba', 'A 35 year old man has drunk heavily for 15 years. He wants to stay abstinent after a detox. Which drug reduces craving and helps prevent relapse?', 'NICE CG115: after withdrawal, offer acamprosate or oral naltrexone with psychosocial support to prevent relapse. Disulfiram is an option for those motivated for abstinence (causes unpleasant reactions with alcohol). Nalmefene may help reduce consumption.', null, true, true, jsonb_build_object('source', 'plab1-xlsx-v6', 'guidelines_text', 'NICE CG115')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = 'e19905ef-fb64-54a4-a919-35a9e44e745b';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('0586337c-8d81-5040-bdf5-ff2bafbe7c37', 'e19905ef-fb64-54a4-a919-35a9e44e745b', 'A', 'Chlordiazepoxide long-term', false, 0),
  ('a6898fae-d17b-530f-b046-29029963d464', 'e19905ef-fb64-54a4-a919-35a9e44e745b', 'B', 'Diazepam long-term', false, 1),
  ('462a5b44-8afb-544f-bd46-cac157f80246', 'e19905ef-fb64-54a4-a919-35a9e44e745b', 'C', 'Acamprosate (or naltrexone)', true, 2),
  ('69166572-6f15-5bc3-a02d-2f559378cd9e', 'e19905ef-fb64-54a4-a919-35a9e44e745b', 'D', 'Haloperidol', false, 3),
  ('ef086517-5fa8-5a2b-9da9-8fb6a45ee0f5', 'e19905ef-fb64-54a4-a919-35a9e44e745b', 'E', 'Fluoxetine', false, 4);

-- Q57
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('323b4164-9c2a-5acf-9929-9965e7693d61', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000007', 'sba', 'A 22 year old man has had low mood and has started cutting his arms. He has no plan to end his life. He is seen in the ED. What is the SINGLE most appropriate next step?', 'NICE NG225: everyone who has self-harmed should have a psychosocial assessment. Do not use risk assessment tools to predict suicide or decide treatment. Develop a safety plan, involve family if appropriate and arrange follow-up.', null, true, true, jsonb_build_object('source', 'plab1-xlsx-v6', 'guidelines_text', 'NICE NG225')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = '323b4164-9c2a-5acf-9929-9965e7693d61';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('456919a5-ddfe-50dc-beea-af78cce3ce68', '323b4164-9c2a-5acf-9929-9965e7693d61', 'A', 'Discharge without assessment', false, 0),
  ('936a2624-2e0f-5904-83e0-07a9c81d35f4', '323b4164-9c2a-5acf-9929-9965e7693d61', 'B', 'Psychosocial assessment by a trained professional, with safety planning and follow-up', true, 1),
  ('2d3e922f-badc-5159-bc5d-96499b25a07a', '323b4164-9c2a-5acf-9929-9965e7693d61', 'C', 'Use a risk scale to decide treatment', false, 2),
  ('79600ccb-937a-528e-b474-08410ae32f44', '323b4164-9c2a-5acf-9929-9965e7693d61', 'D', 'Prescribe antidepressants immediately', false, 3),
  ('09fafcbe-0bc8-5bd5-bc2f-ea9f83beebe6', '323b4164-9c2a-5acf-9929-9965e7693d61', 'E', 'Admit to a psychiatric ward in all cases', false, 4);

-- Q58
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('27de657d-a775-5406-9252-e08a7f038b6c', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000007', 'sba', 'A 70 year old man has become withdrawn, with poor appetite and insomnia since his wife died 18 months ago. He feels worthless and cannot stop thinking about her. He cannot function. What is the SINGLE most likely diagnosis?', 'Grief beyond 6-12 months with intense yearning, preoccupation, emotional pain and significant impairment suggests prolonged grief disorder. Depression should also be assessed. Treatment: grief-focused psychological therapy and treatment of depression.', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v6')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = '27de657d-a775-5406-9252-e08a7f038b6c';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('e322574c-f93c-50b5-b9c6-b610896cb2fc', '27de657d-a775-5406-9252-e08a7f038b6c', 'A', 'Prolonged grief disorder (or depression)', true, 0),
  ('489a0a96-39bc-50bb-a157-342ebe01d854', '27de657d-a775-5406-9252-e08a7f038b6c', 'B', 'Schizophrenia', false, 1),
  ('27cbe6d4-f60b-5941-8e9a-8121e00e1a65', '27de657d-a775-5406-9252-e08a7f038b6c', 'C', 'Delirium', false, 2),
  ('8fd7283e-ba2b-523d-b63b-47544149990b', '27de657d-a775-5406-9252-e08a7f038b6c', 'D', 'Normal grief', false, 3),
  ('6239da08-7141-536d-990a-073257173f6e', '27de657d-a775-5406-9252-e08a7f038b6c', 'E', 'Alzheimer''s disease', false, 4);

-- Q59
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('80edb55e-517a-5223-9abc-85a6571e25e1', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000007', 'sba', 'A 25 year old woman has had obsessive concerns about a minor flaw in her nose. She checks mirrors for hours and has had cosmetic surgery twice. What is the SINGLE most likely diagnosis?', 'Body dysmorphic disorder: preoccupation with a perceived or slight defect in appearance, with repetitive behaviours (mirror checking, grooming, reassurance seeking). Cosmetic procedures rarely help. Treatment: CBT with exposure and response prevention, and SSRIs.', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v6')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = '80edb55e-517a-5223-9abc-85a6571e25e1';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('6ae2af7d-7ae0-5a0b-8481-0db1a38ed008', '80edb55e-517a-5223-9abc-85a6571e25e1', 'A', 'Anorexia nervosa', false, 0),
  ('dc1fcba5-4b43-561e-8db4-802e1216a5e9', '80edb55e-517a-5223-9abc-85a6571e25e1', 'B', 'Social anxiety disorder', false, 1),
  ('c1c8670e-fe8c-502f-9056-1670e6a3bb65', '80edb55e-517a-5223-9abc-85a6571e25e1', 'C', 'Body dysmorphic disorder', true, 2),
  ('e12bc496-92fa-58a6-8625-70bb2df85169', '80edb55e-517a-5223-9abc-85a6571e25e1', 'D', 'Delusional disorder', false, 3),
  ('4221f981-e7d6-5a12-a812-c58c46d94463', '80edb55e-517a-5223-9abc-85a6571e25e1', 'E', 'Obsessive-compulsive disorder', false, 4);

-- Q60
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('a0dc1e26-456b-55b6-8935-fa294c5ba006', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000007', 'sba', 'A 45 year old man believes his wife is having an affair. He has no evidence but follows her and checks her phone. He has no other psychotic symptoms. He functions well at work. What is the SINGLE most likely diagnosis?', 'Delusional disorder involves fixed false beliefs for over 3 months without other psychotic symptoms, with relatively preserved functioning. Jealous delusions (morbid jealousy) carry a risk of violence to the partner. Treatment: antipsychotics and psychological approaches. Assess risk.', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v6')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = 'a0dc1e26-456b-55b6-8935-fa294c5ba006';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('5073495c-5092-5a98-9b88-90d205659ad5', 'a0dc1e26-456b-55b6-8935-fa294c5ba006', 'A', 'Paranoid personality disorder', false, 0),
  ('651c0f3a-34a5-533b-b16c-b3d582887e85', 'a0dc1e26-456b-55b6-8935-fa294c5ba006', 'B', 'OCD', false, 1),
  ('63499d89-d8b1-560f-81fa-232dd81416f1', 'a0dc1e26-456b-55b6-8935-fa294c5ba006', 'C', 'Schizophrenia', false, 2),
  ('2f39b1ca-fd76-5d28-9294-9b481c8ed4a5', 'a0dc1e26-456b-55b6-8935-fa294c5ba006', 'D', 'Bipolar disorder', false, 3),
  ('9855d879-b4b5-5cb6-a0a5-f615c068be79', 'a0dc1e26-456b-55b6-8935-fa294c5ba006', 'E', 'Delusional disorder (jealous type, Othello syndrome)', true, 4);

-- Q61
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('ea138df4-f1b6-5afe-8ae1-9059685ddebf', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000007', 'sba', 'A 30 year old woman has been feeling detached from herself, as though watching herself from outside, after a traumatic event. She knows it is not real. What is the SINGLE most likely diagnosis?', 'Depersonalisation is feeling detached from oneself; derealisation is feeling the world is unreal. Insight is preserved. It can follow stress, trauma, drugs or occur with anxiety and depression. Treatment: psychological therapy.', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v6')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = 'ea138df4-f1b6-5afe-8ae1-9059685ddebf';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('887987f6-77cd-58d8-a3eb-088bde4c5cc4', 'ea138df4-f1b6-5afe-8ae1-9059685ddebf', 'A', 'Psychotic depression', false, 0),
  ('d1502f03-0bc5-5229-80f8-1bf641f26252', 'ea138df4-f1b6-5afe-8ae1-9059685ddebf', 'B', 'Depersonalisation-derealisation disorder', true, 1),
  ('ad2fdc09-d2b9-5fa6-8a76-83373b07ff5d', 'ea138df4-f1b6-5afe-8ae1-9059685ddebf', 'C', 'Dementia', false, 2),
  ('96d50755-4ab6-5974-ba86-52462bf36497', 'ea138df4-f1b6-5afe-8ae1-9059685ddebf', 'D', 'Delirium', false, 3),
  ('cd640905-5a3e-52e9-af1e-3e8a2871333c', 'ea138df4-f1b6-5afe-8ae1-9059685ddebf', 'E', 'Schizophrenia', false, 4);

-- Q62
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('1c39cefd-d3fd-5b68-a88a-dbbd74f6d2d1', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000007', 'sba', 'A 35 year old woman with depression has not responded to 2 antidepressants. She asks about other options. Which treatment can be offered in specialist settings for treatment-resistant depression?', 'Treatment-resistant depression options include combining or augmenting medication (lithium, aripiprazole, quetiapine, mirtazapine), rTMS, ECT and esketamine in specialist settings. Psychological therapy should be combined with medication.', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v6')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = '1c39cefd-d3fd-5b68-a88a-dbbd74f6d2d1';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('d365c9e3-45af-5b04-a991-7ebe0f1d7ab4', '1c39cefd-d3fd-5b68-a88a-dbbd74f6d2d1', 'A', 'Homeopathy', false, 0),
  ('3ae63321-17ca-5884-a40e-88e00fa3b08c', '1c39cefd-d3fd-5b68-a88a-dbbd74f6d2d1', 'B', 'Antibiotics', false, 1),
  ('131cbe18-d329-5b3f-8ae1-51ec6e9ccad3', '1c39cefd-d3fd-5b68-a88a-dbbd74f6d2d1', 'C', 'Stopping all treatment', false, 2),
  ('1f1af1f6-b33a-5a4c-acc7-fd7b2b1a8b9f', '1c39cefd-d3fd-5b68-a88a-dbbd74f6d2d1', 'D', 'Repetitive transcranial magnetic stimulation (rTMS), ECT, or augmentation with lithium or an antipsychotic', true, 3),
  ('4aaca05f-32d5-55bb-a1bb-f2d0511a22c4', '1c39cefd-d3fd-5b68-a88a-dbbd74f6d2d1', 'E', 'Benzodiazepines long-term', false, 4);

-- Q63
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('d81980be-5942-57aa-81e9-59952065bd2b', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000026', 'sba', 'A 25 year old man has had a sudden onset of ear pain and blood-stained discharge after a slap to his ear. He has reduced hearing. Otoscopy shows a perforated eardrum. What is the SINGLE most appropriate management?', 'Traumatic tympanic membrane perforations usually heal spontaneously within weeks. Keep the ear dry. Antibiotics for infection. Refer if it does not heal, or with vertigo, facial palsy or significant hearing loss (ossicular injury). Myringoplasty for persistent perforations.', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v6')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = 'd81980be-5942-57aa-81e9-59952065bd2b';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('7e656cd2-ead6-570d-a991-d930d4feb225', 'd81980be-5942-57aa-81e9-59952065bd2b', 'A', 'Syringe the ear', false, 0),
  ('237eb344-9e35-5dff-9911-376388fe6b43', 'd81980be-5942-57aa-81e9-59952065bd2b', 'B', 'Keep the ear dry, avoid ear drops unless infected, and review in ENT in 6 weeks (most heal spontaneously)', true, 1),
  ('191c7e89-1c41-55a9-8d8e-ccaea5d73202', 'd81980be-5942-57aa-81e9-59952065bd2b', 'C', 'Antibiotic drops in all', false, 2),
  ('46d54dcd-9285-5632-85ca-d91da4630687', 'd81980be-5942-57aa-81e9-59952065bd2b', 'D', 'Immediate surgical repair', false, 3),
  ('4b8bfd6a-4238-56bf-a707-8ad7a2748b19', 'd81980be-5942-57aa-81e9-59952065bd2b', 'E', 'Insert grommets', false, 4);

-- Q64
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('c3f9276a-82b8-5928-9cf5-e5210ab4e630', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000026', 'sba', 'A 45 year old man has had episodes of vertigo, tinnitus and a feeling of fullness after an ear infection. He has persistent discharge and conductive hearing loss. He has a fistula sign. What is the SINGLE most likely diagnosis?', 'A positive fistula sign (vertigo with pressure on the ear) suggests erosion of the lateral semicircular canal, often from cholesteatoma. Needs urgent ENT review and CT temporal bones, with surgery.', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v6')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = 'c3f9276a-82b8-5928-9cf5-e5210ab4e630';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('43f5e1e3-1a3e-5b00-89d4-d4fbbde0c25f', 'c3f9276a-82b8-5928-9cf5-e5210ab4e630', 'A', 'Ménière''s disease', false, 0),
  ('49c142dd-58c5-5b73-837c-090375ac160f', 'c3f9276a-82b8-5928-9cf5-e5210ab4e630', 'B', 'Acoustic neuroma', false, 1),
  ('4a09732f-8f1e-5667-83c5-7c0f042cf3e7', 'c3f9276a-82b8-5928-9cf5-e5210ab4e630', 'C', 'Vestibular neuronitis', false, 2),
  ('0e55820f-ef8e-5f83-9e79-8f0d4adef4fc', 'c3f9276a-82b8-5928-9cf5-e5210ab4e630', 'D', 'Cholesteatoma with labyrinthine fistula', true, 3),
  ('2c469ed8-caa1-5898-b1cf-ca2ae4ea300a', 'c3f9276a-82b8-5928-9cf5-e5210ab4e630', 'E', 'BPPV', false, 4);

-- Q65
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('79ac7539-9615-5c06-a5cf-8ae4601e5a08', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000026', 'sba', 'A 30 year old woman has had a feeling of a lump in her throat for months. It is not painful, she can eat and drink normally, and it is better when eating. ENT examination is normal. What is the SINGLE most likely diagnosis?', 'Globus is a persistent sensation of a lump in the throat, often better when eating, without dysphagia or other red flags. Associated with reflux and anxiety. Reassure after exclusion of red flags (dysphagia, pain, weight loss, hoarseness, neck lump).', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v6')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = '79ac7539-9615-5c06-a5cf-8ae4601e5a08';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('de2262d0-babd-5ef9-8418-91358bf0aeb6', '79ac7539-9615-5c06-a5cf-8ae4601e5a08', 'A', 'Pharyngeal pouch', false, 0),
  ('ccf3ab93-d1a0-5ee3-8064-26913313c0f5', '79ac7539-9615-5c06-a5cf-8ae4601e5a08', 'B', 'Oesophageal cancer', false, 1),
  ('e849ac39-dd13-5ddb-acb6-eeabdbc3f8e0', '79ac7539-9615-5c06-a5cf-8ae4601e5a08', 'C', 'Achalasia', false, 2),
  ('9d4d69da-18df-59a3-a4a1-83216374aabf', '79ac7539-9615-5c06-a5cf-8ae4601e5a08', 'D', 'Globus pharyngeus', true, 3),
  ('f6321643-cf25-5cdf-86bf-84f04a3cff8d', '79ac7539-9615-5c06-a5cf-8ae4601e5a08', 'E', 'Thyroid cancer', false, 4);

-- Q66
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('5a6176ae-2eb1-58b7-8301-24fd5d664843', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000026', 'sba', 'A 55 year old smoker has had a persistent unilateral nasal obstruction, bloody discharge and facial numbness. What is the SINGLE most appropriate action?', 'Red flags in sinonasal disease: unilateral symptoms, bloody discharge, facial numbness or swelling, orbital symptoms and cranial nerve palsies. Occupational exposure to wood dust (hardwood) is a risk factor for sinonasal adenocarcinoma.', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v6')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = '5a6176ae-2eb1-58b7-8301-24fd5d664843';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('7c804724-61cf-546a-b43a-ae332a7ce7a8', '5a6176ae-2eb1-58b7-8301-24fd5d664843', 'A', 'Nasal steroid spray for 3 months', false, 0),
  ('e05bc319-7134-5bcd-9bfc-0a481ef5d495', '5a6176ae-2eb1-58b7-8301-24fd5d664843', 'B', 'Antibiotics', false, 1),
  ('f01da6a1-0450-57ae-87f6-b2acc3547692', '5a6176ae-2eb1-58b7-8301-24fd5d664843', 'C', 'Decongestants', false, 2),
  ('04493524-61b3-51df-a5dd-6ecadf180bfa', '5a6176ae-2eb1-58b7-8301-24fd5d664843', 'D', 'Urgent referral on the suspected cancer pathway (possible sinonasal malignancy)', true, 3),
  ('6129b46f-73fe-57e2-bc97-a22456955bfa', '5a6176ae-2eb1-58b7-8301-24fd5d664843', 'E', 'Reassure', false, 4);

-- Q67
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('f8355798-4a57-548d-8b0c-ceb23ee5a1dc', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000014', 'sba', 'A 30 year old woman is 34 weeks pregnant. Her platelet count is 120 x10^9/L. She is well, BP normal, LFTs normal. It was normal earlier in pregnancy. What is the SINGLE most likely cause?', 'Gestational thrombocytopenia is the commonest cause of low platelets in pregnancy (usually above 70 x10^9/L), occurring in the third trimester, with no risk to mother or baby. Exclude pre-eclampsia and HELLP. ITP may be present before pregnancy.', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v6')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = 'f8355798-4a57-548d-8b0c-ceb23ee5a1dc';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('5e34e762-ee71-5fc2-8ce0-25eeff2785db', 'f8355798-4a57-548d-8b0c-ceb23ee5a1dc', 'A', 'TTP', false, 0),
  ('039e0785-2139-5c64-8fa5-7d9237a7001d', 'f8355798-4a57-548d-8b0c-ceb23ee5a1dc', 'B', 'Gestational thrombocytopenia', true, 1),
  ('a5c55b1e-7976-55a5-940c-f9f4e1fc6b8b', 'f8355798-4a57-548d-8b0c-ceb23ee5a1dc', 'C', 'HELLP syndrome', false, 2),
  ('16fca598-2efd-534a-947b-27a7e0485ea6', 'f8355798-4a57-548d-8b0c-ceb23ee5a1dc', 'D', 'DIC', false, 3),
  ('7deb0b3b-3df7-592d-97e8-db2d9f3e1181', 'f8355798-4a57-548d-8b0c-ceb23ee5a1dc', 'E', 'ITP', false, 4);

-- Q68
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('7745972d-4aae-5ae4-a7bc-9d4e18c5f5a3', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000014', 'sba', 'A 25 year old man has severe haemophilia A. He has a painful swollen knee after minor trauma. What is the SINGLE most appropriate immediate treatment?', 'Haemarthrosis in haemophilia needs immediate factor replacement (or bypassing agents with inhibitors), rest, ice and analgesia (avoid NSAIDs and IM injections). Recurrent bleeds cause haemophilic arthropathy. Prophylaxis (regular factor or emicizumab) prevents bleeds.', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v6')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = '7745972d-4aae-5ae4-a7bc-9d4e18c5f5a3';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('a1945244-62b1-59ad-8dc4-68b377f53196', '7745972d-4aae-5ae4-a7bc-9d4e18c5f5a3', 'A', 'Factor VIII replacement as soon as possible (do not aspirate the joint before replacement)', true, 0),
  ('263a1c50-fe58-5153-ad7d-d330b22040f2', '7745972d-4aae-5ae4-a7bc-9d4e18c5f5a3', 'B', 'NSAIDs', false, 1),
  ('bef832cb-f36a-5d37-94aa-038745390f07', '7745972d-4aae-5ae4-a7bc-9d4e18c5f5a3', 'C', 'Surgery', false, 2),
  ('43ca2cdc-e005-55a1-a6d7-2e4fc23f5d23', '7745972d-4aae-5ae4-a7bc-9d4e18c5f5a3', 'D', 'Aspirate the joint first', false, 3),
  ('a1b84a85-9e0a-561f-9032-1b4353fa3abb', '7745972d-4aae-5ae4-a7bc-9d4e18c5f5a3', 'E', 'Cold compress only', false, 4);

-- Q69
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('894450b4-2830-5494-af3d-d16b3f1c0f82', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000014', 'sba', 'A 70 year old woman has had a DVT. She is starting a DOAC. She has a mechanical heart valve. Which anticoagulant is CORRECT for her?', 'DOACs are contraindicated in mechanical heart valves (increased thrombosis and bleeding) and moderate-severe mitral stenosis. Warfarin is used. DOACs are also used with caution in antiphospholipid syndrome (warfarin preferred), extreme body weight and severe renal impairment.', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v6')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = '894450b4-2830-5494-af3d-d16b3f1c0f82';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('ae151f2e-602e-5b5c-af88-f6c12609d2b6', '894450b4-2830-5494-af3d-d16b3f1c0f82', 'A', 'Edoxaban', false, 0),
  ('d56db31e-19e9-5ba4-a260-201d28ce94a2', '894450b4-2830-5494-af3d-d16b3f1c0f82', 'B', 'Apixaban', false, 1),
  ('b840415e-8e19-5125-87e9-758230e5d3bc', '894450b4-2830-5494-af3d-d16b3f1c0f82', 'C', 'Dabigatran', false, 2),
  ('913cf117-9688-544d-b04e-f837a63e19b6', '894450b4-2830-5494-af3d-d16b3f1c0f82', 'D', 'Warfarin (DOACs are contraindicated with mechanical valves)', true, 3),
  ('c84f920d-5eba-55a7-8ca0-a27d1b01f808', '894450b4-2830-5494-af3d-d16b3f1c0f82', 'E', 'Rivaroxaban', false, 4);

-- Q70
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('8896dd91-0bcd-5d1b-8934-32de632ecac6', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000014', 'sba', 'A 50 year old man has had splenomegaly, pancytopenia and ''dry tap'' on bone marrow aspiration. Blood film shows teardrop cells. What is the SINGLE most likely diagnosis?', 'Myelofibrosis is a myeloproliferative neoplasm with marrow fibrosis, causing massive splenomegaly, extramedullary haematopoiesis, teardrop cells and leucoerythroblastic film. Dry tap on aspiration. JAK2, CALR or MPL mutations. Treatment: JAK inhibitors (ruxolitinib), transfusion and stem cell transplant.', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v6')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = '8896dd91-0bcd-5d1b-8934-32de632ecac6';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('79a7287b-7954-5961-bc1f-acd300aaaf7d', '8896dd91-0bcd-5d1b-8934-32de632ecac6', 'A', 'CML', false, 0),
  ('4fc23482-9e7f-5ac3-b166-77498983f3ee', '8896dd91-0bcd-5d1b-8934-32de632ecac6', 'B', 'Hairy cell leukaemia', false, 1),
  ('fae3b92d-b979-561a-b956-e0b1e6774d05', '8896dd91-0bcd-5d1b-8934-32de632ecac6', 'C', 'CLL', false, 2),
  ('f45e9cad-40c5-5dd0-bd1e-a89dcf226169', '8896dd91-0bcd-5d1b-8934-32de632ecac6', 'D', 'Primary myelofibrosis', true, 3),
  ('c020b148-b078-566e-bccd-2cc0bc4551b0', '8896dd91-0bcd-5d1b-8934-32de632ecac6', 'E', 'Aplastic anaemia', false, 4);

-- Q71
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('034c4947-f60c-55e1-a63d-c9cd9d170ab5', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000014', 'sba', 'A 45 year old man has had fatigue, splenomegaly and pancytopenia. Blood film shows lymphocytes with hair-like projections. What is the SINGLE most likely diagnosis?', 'Hairy cell leukaemia is a rare B-cell leukaemia in middle-aged men, with pancytopenia, splenomegaly, monocytopenia and BRAF V600E mutation. Treatment: cladribine with excellent responses.', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v6')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = '034c4947-f60c-55e1-a63d-c9cd9d170ab5';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('e1ba3038-9483-53b2-b9a0-666492e0a16a', '034c4947-f60c-55e1-a63d-c9cd9d170ab5', 'A', 'AML', false, 0),
  ('eb64dfa6-4891-5c4d-abac-5059f013fd9d', '034c4947-f60c-55e1-a63d-c9cd9d170ab5', 'B', 'Lymphoma', false, 1),
  ('b4faab40-e4eb-57c4-81b2-3cf83c9c5de1', '034c4947-f60c-55e1-a63d-c9cd9d170ab5', 'C', 'Myelofibrosis', false, 2),
  ('cce34f47-f2b9-5457-9b6d-b46ddac1f6fd', '034c4947-f60c-55e1-a63d-c9cd9d170ab5', 'D', 'Hairy cell leukaemia', true, 3),
  ('cb379ca8-0762-57c1-be31-717d397908e4', '034c4947-f60c-55e1-a63d-c9cd9d170ab5', 'E', 'CLL', false, 4);

-- Q72
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('6549889e-6fbe-5389-93e4-12dfdb80987d', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000014', 'sba', 'A 65 year old man has had headaches, visual disturbance and bleeding gums. Serum viscosity is very high, with an IgM paraprotein. What is the SINGLE most likely diagnosis?', 'Waldenström macroglobulinaemia is a lymphoplasmacytic lymphoma producing IgM paraprotein, causing hyperviscosity (headaches, visual disturbance, bleeding), lymphadenopathy, splenomegaly and neuropathy. Plasma exchange for hyperviscosity. MYD88 mutation is common.', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v6')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = '6549889e-6fbe-5389-93e4-12dfdb80987d';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('c78678fd-c6f5-58b9-97df-dc63ef7853b6', '6549889e-6fbe-5389-93e4-12dfdb80987d', 'A', 'MGUS', false, 0),
  ('1149dd5e-36c0-5b3a-a49e-b4bdc68027a8', '6549889e-6fbe-5389-93e4-12dfdb80987d', 'B', 'CLL', false, 1),
  ('1ba7d592-4a54-57cd-82ed-422e9465779d', '6549889e-6fbe-5389-93e4-12dfdb80987d', 'C', 'Waldenström macroglobulinaemia', true, 2),
  ('0140934b-5096-5f18-b2a4-26868061511f', '6549889e-6fbe-5389-93e4-12dfdb80987d', 'D', 'Multiple myeloma', false, 3),
  ('28852eac-362a-5fe8-afcd-706bb17dc2b7', '6549889e-6fbe-5389-93e4-12dfdb80987d', 'E', 'Amyloidosis', false, 4);

-- Q73
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('83360292-330e-5d68-b421-c9d0dea9b5b5', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000024', 'sba', 'A 60 year old woman has had post-menopausal bleeding. Biopsy confirms endometrial adenocarcinoma, stage I. What is the SINGLE most appropriate treatment?', 'Early-stage endometrial cancer is treated with hysterectomy and bilateral salpingo-oophorectomy (often laparoscopic), with adjuvant radiotherapy based on risk. Progestogens are used in women who wish to preserve fertility or are unfit for surgery. Prognosis is good in early stage.', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v6')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = '83360292-330e-5d68-b421-c9d0dea9b5b5';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('4d346070-0fd7-5866-8726-a8e53e083158', '83360292-330e-5d68-b421-c9d0dea9b5b5', 'A', 'Total laparoscopic hysterectomy with bilateral salpingo-oophorectomy', true, 0),
  ('0a1272d5-d7ac-51d9-9e76-8c4578f2fd41', '83360292-330e-5d68-b421-c9d0dea9b5b5', 'B', 'Watchful waiting', false, 1),
  ('51206a5f-b46a-53e4-b7fa-4963ef8626e8', '83360292-330e-5d68-b421-c9d0dea9b5b5', 'C', 'Progesterone alone', false, 2),
  ('2e8de107-5ae3-5ffd-af14-cb35b55a76f7', '83360292-330e-5d68-b421-c9d0dea9b5b5', 'D', 'Radiotherapy alone', false, 3),
  ('b0c1063b-161d-518f-a300-62230074ec71', '83360292-330e-5d68-b421-c9d0dea9b5b5', 'E', 'Chemotherapy alone', false, 4);

-- Q74
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('b5d05508-954c-5af0-a57a-6614fd4afc17', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000024', 'sba', 'A 35 year old woman with cervical cancer stage IB1 wants to preserve fertility. What is a possible surgical option?', 'Early-stage cervical cancer can be treated with radical hysterectomy, or radical trachelectomy (removal of the cervix) in selected women wanting fertility. More advanced disease: chemoradiotherapy. HPV vaccination and screening prevent cervical cancer.', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v6')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = 'b5d05508-954c-5af0-a57a-6614fd4afc17';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('8e185aeb-937d-5c10-86db-c334d99106ed', 'b5d05508-954c-5af0-a57a-6614fd4afc17', 'A', 'Radiotherapy alone', false, 0),
  ('f1abcc6a-2a88-5099-be0f-bb0562a09faa', 'b5d05508-954c-5af0-a57a-6614fd4afc17', 'B', 'Total hysterectomy', false, 1),
  ('354e00da-a55e-5fd2-a356-9fe5cbc4225a', 'b5d05508-954c-5af0-a57a-6614fd4afc17', 'C', 'No treatment', false, 2),
  ('f93143a8-f646-5f7f-b68d-a287d868196a', 'b5d05508-954c-5af0-a57a-6614fd4afc17', 'D', 'Pelvic exenteration', false, 3),
  ('1cf37380-3010-56b5-bf2d-f7d6bd7b179b', 'b5d05508-954c-5af0-a57a-6614fd4afc17', 'E', 'Radical trachelectomy', true, 4);

-- Q75
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('67169f40-f840-58ec-8db0-d7ce8bca3b5c', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000024', 'sba', 'A 55 year old man has had progressive jaundice, itching and weight loss. Ampullary cancer is found on endoscopy. What is the CORRECT statement about its prognosis compared with pancreatic head cancer?', 'Periampullary tumours (ampulla, distal bile duct, duodenum, pancreatic head) present with obstructive jaundice. Ampullary tumours often present early and are more often resectable (Whipple''s), with better survival than pancreatic adenocarcinoma.', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v6')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = '67169f40-f840-58ec-8db0-d7ce8bca3b5c';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('05a339bc-3c22-5e4d-bd58-db5d4f159fff', '67169f40-f840-58ec-8db0-d7ce8bca3b5c', 'A', 'It has a much worse prognosis', false, 0),
  ('e1ad568e-3cd1-5682-816a-2b3460bb2910', '67169f40-f840-58ec-8db0-d7ce8bca3b5c', 'B', 'It is always unresectable', false, 1),
  ('418ce47c-9b95-5328-8623-aa5b35c03918', '67169f40-f840-58ec-8db0-d7ce8bca3b5c', 'C', 'It never causes jaundice', false, 2),
  ('2f7f5dd8-02b2-5a5f-a0a9-54ca2cf5045c', '67169f40-f840-58ec-8db0-d7ce8bca3b5c', 'D', 'Ampullary cancer usually presents earlier (obstructive jaundice) and has a better prognosis', true, 3),
  ('c45a8fc2-0bdb-595d-b823-83586fe34e43', '67169f40-f840-58ec-8db0-d7ce8bca3b5c', 'E', 'It responds only to radiotherapy', false, 4);

-- Q76
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('ede0ee40-b468-5a68-a439-624c728ac84a', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000024', 'sba', 'A 50 year old man has had a painless lump in his neck. Biopsy shows metastatic squamous cell carcinoma with an unknown primary. What is the SINGLE most appropriate next investigation?', 'Squamous cell carcinoma in a neck node usually comes from the head and neck (oropharynx, nasopharynx, larynx). Investigations: PET-CT, panendoscopy with biopsies and tonsillectomy, and HPV/EBV testing.', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v6')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = 'ede0ee40-b468-5a68-a439-624c728ac84a';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('d1efc2bf-a80b-5e5c-b04e-58c08f0b1b9b', 'ede0ee40-b468-5a68-a439-624c728ac84a', 'A', 'Mammogram', false, 0),
  ('223b362c-9e95-5266-9920-d9557f67ba68', 'ede0ee40-b468-5a68-a439-624c728ac84a', 'B', 'Ultrasound abdomen only', false, 1),
  ('9f079889-f23f-576b-b758-29dcdb91cf9b', 'ede0ee40-b468-5a68-a439-624c728ac84a', 'C', 'Colonoscopy', false, 2),
  ('599621ea-c006-55c2-8227-d21268c85fc1', 'ede0ee40-b468-5a68-a439-624c728ac84a', 'D', 'PET-CT and examination under anaesthesia of the upper aerodigestive tract with targeted biopsies', true, 3),
  ('de3ba9f5-6139-57d4-ace2-601c43da612e', 'ede0ee40-b468-5a68-a439-624c728ac84a', 'E', 'Bone marrow biopsy', false, 4);

-- Q77
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('ba82ac32-8490-563e-92d6-0a34ce6c2fec', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000024', 'sba', 'A 70 year old man has had progressive breathlessness and a large pleural effusion. Pleural fluid cytology shows adenocarcinoma. What does this mean for his lung cancer stage?', 'A malignant pleural effusion means stage IV (M1a) disease. Treatment: systemic therapy based on biomarkers, and effusion management (pleurodesis or indwelling pleural catheter).', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v6')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = 'ba82ac32-8490-563e-92d6-0a34ce6c2fec';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('fc0d556c-dba6-5aaf-a229-bd8fcd61e133', 'ba82ac32-8490-563e-92d6-0a34ce6c2fec', 'A', 'Early-stage disease', false, 0),
  ('3ea3c972-9481-5612-946d-dd315fa2dd01', 'ba82ac32-8490-563e-92d6-0a34ce6c2fec', 'B', 'Stage I', false, 1),
  ('a14efd25-418f-5efb-a50d-b317ad992733', 'ba82ac32-8490-563e-92d6-0a34ce6c2fec', 'C', 'No change to staging', false, 2),
  ('d2c76a82-c826-52bb-a2a2-1826d0d973e6', 'ba82ac32-8490-563e-92d6-0a34ce6c2fec', 'D', 'Stage II', false, 3),
  ('b1df5fa6-e610-5ee4-8d33-e9f2bad14a3a', 'ba82ac32-8490-563e-92d6-0a34ce6c2fec', 'E', 'Metastatic disease (M1a), not suitable for curative surgery', true, 4);

-- Q78
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('321ab7c6-14de-508c-8a18-379a0dcc0826', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000012', 'sba', 'A 30 year old woman has been on oral antibiotics for acne. She develops a bluish-grey pigmentation of her skin and gums. Which antibiotic is MOST likely responsible?', 'Minocycline can cause blue-grey skin pigmentation, drug-induced lupus and hepatitis, so it is not recommended for acne. Tetracyclines are avoided in pregnancy and under 12. Doxycycline causes photosensitivity.', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v6')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = '321ab7c6-14de-508c-8a18-379a0dcc0826';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('c2c84ae2-bceb-59f6-a36a-e01d759a2f56', '321ab7c6-14de-508c-8a18-379a0dcc0826', 'A', 'Minocycline', true, 0),
  ('6ec4bc5b-50bf-5772-a0fd-49712cd2a350', '321ab7c6-14de-508c-8a18-379a0dcc0826', 'B', 'Erythromycin', false, 1),
  ('1e0722f6-b8ae-5b22-86e8-841bb590f510', '321ab7c6-14de-508c-8a18-379a0dcc0826', 'C', 'Lymecycline', false, 2),
  ('e73b3aaf-3125-5bcb-acc9-05881d970d23', '321ab7c6-14de-508c-8a18-379a0dcc0826', 'D', 'Doxycycline', false, 3),
  ('3b6adac5-6d70-5a1f-9c72-7e0e10290c96', '321ab7c6-14de-508c-8a18-379a0dcc0826', 'E', 'Trimethoprim', false, 4);

-- Q79
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('62543434-ec27-5600-a56d-63f8841f390f', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000012', 'sba', 'A 45 year old man has had widespread erythroderma (over 90% of skin red and scaly), with shivering and feeling unwell. He has psoriasis and recently stopped his methotrexate. What is the SINGLE most appropriate management?', 'Erythroderma is a dermatological emergency with risks of hypothermia, fluid loss, high-output cardiac failure and infection. Causes: psoriasis, eczema, drug reactions and cutaneous T-cell lymphoma. Admit for supportive care and treat the cause.', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v6')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = '62543434-ec27-5600-a56d-63f8841f390f';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('3d0f756e-4634-5426-8afe-43734d6bd232', '62543434-ec27-5600-a56d-63f8841f390f', 'A', 'Topical steroid to the whole body', false, 0),
  ('6c4d0ff3-22e9-5b14-881a-3f1e71f1128a', '62543434-ec27-5600-a56d-63f8841f390f', 'B', 'Oral steroids alone', false, 1),
  ('d43c277d-3523-5dda-a8c3-4744020014a8', '62543434-ec27-5600-a56d-63f8841f390f', 'C', 'Admit to hospital for supportive care (fluids, temperature control, emollients) and specialist dermatology review', true, 2),
  ('c2271148-9cdb-561d-a646-e21f197bc32a', '62543434-ec27-5600-a56d-63f8841f390f', 'D', 'Discharge with emollients', false, 3),
  ('51bf7d45-39b2-5e99-9c58-45ec4b2a0394', '62543434-ec27-5600-a56d-63f8841f390f', 'E', 'Antifungal cream', false, 4);

-- Q80
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('7a48005c-e68c-580f-9c37-4018ca06be49', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000012', 'sba', 'A 35 year old woman has had small, itchy, red papules in groups on her legs after visiting a farm. They are in lines of three. What is the SINGLE most likely diagnosis?', 'Flea and bed bug bites often appear in groups or lines (''breakfast, lunch and dinner''). Treatment: antihistamines and topical steroids. Treat pets and the home. Scabies burrows are found in finger webs and wrists.', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v6')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = '7a48005c-e68c-580f-9c37-4018ca06be49';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('657e6646-6c1d-541e-9573-0d889a4323e5', '7a48005c-e68c-580f-9c37-4018ca06be49', 'A', 'Urticaria', false, 0),
  ('1eab8b4e-2e93-5b7e-82d7-9b571f318cb1', '7a48005c-e68c-580f-9c37-4018ca06be49', 'B', 'Scabies', false, 1),
  ('0e61eacd-e1a7-507d-995d-cbbb6b1f9bdc', '7a48005c-e68c-580f-9c37-4018ca06be49', 'C', 'Insect bites (e.g. flea or bed bug bites)', true, 2),
  ('6b575a24-694b-5560-9274-7145c71be044', '7a48005c-e68c-580f-9c37-4018ca06be49', 'D', 'Dermatitis herpetiformis', false, 3),
  ('643e694f-fed6-5430-b870-7e5530ae4fa6', '7a48005c-e68c-580f-9c37-4018ca06be49', 'E', 'Chickenpox', false, 4);

-- Q81
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('0b3dfee1-ada7-52ae-ad11-8b0301fd2684', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000012', 'sba', 'A 25 year old man has had sudden onset of widespread, small, pustules on red skin with fever after starting an antibiotic 2 days ago. What is the SINGLE most likely diagnosis?', 'AGEP is a severe drug reaction (often antibiotics such as beta-lactams and macrolides) with rapid onset of many small sterile pustules on red skin, fever and neutrophilia. Stop the drug; it resolves within 2 weeks.', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v6')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = '0b3dfee1-ada7-52ae-ad11-8b0301fd2684';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('4db8c203-7f63-50f0-808f-425a22d1a649', '0b3dfee1-ada7-52ae-ad11-8b0301fd2684', 'A', 'Acute generalised exanthematous pustulosis (AGEP)', true, 0),
  ('3a13f752-67e9-585e-903e-6654f7dac2ca', '0b3dfee1-ada7-52ae-ad11-8b0301fd2684', 'B', 'Chickenpox', false, 1),
  ('55daf053-7a0c-5b00-9a5a-b754adf5be3e', '0b3dfee1-ada7-52ae-ad11-8b0301fd2684', 'C', 'Pustular psoriasis', false, 2),
  ('a388c486-e38b-537a-82f2-8a53b2ceb21b', '0b3dfee1-ada7-52ae-ad11-8b0301fd2684', 'D', 'Impetigo', false, 3),
  ('b93fa165-3385-5422-8a9c-fde52fe5cbae', '0b3dfee1-ada7-52ae-ad11-8b0301fd2684', 'E', 'Folliculitis', false, 4);

-- Q82
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('cdc85103-2c43-5b4d-8a3a-410576d961fa', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000025', 'sba', 'A 4 year old child has had an inhaled foreign body suspected. Which chest X-ray finding supports this?', 'Inhaled foreign bodies (often peanuts) may show unilateral air trapping, collapse or consolidation. Most are radiolucent. A normal CXR does not exclude it. Bronchoscopy is diagnostic and therapeutic.', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v6')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = 'cdc85103-2c43-5b4d-8a3a-410576d961fa';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('77d831ca-6262-5e0d-b185-ec63b4f71ad3', 'cdc85103-2c43-5b4d-8a3a-410576d961fa', 'A', 'Unilateral hyperinflation (air trapping) on the affected side on expiratory film', true, 0),
  ('ba4ed7a0-32a8-5205-9d44-7def2f866bdf', 'cdc85103-2c43-5b4d-8a3a-410576d961fa', 'B', 'Normal X-ray excludes it', false, 1),
  ('91774612-fd7b-518a-aaa0-51d076a229a0', 'cdc85103-2c43-5b4d-8a3a-410576d961fa', 'C', 'Cardiomegaly', false, 2),
  ('24c02182-74e8-5ded-ae4f-fb44e7594517', 'cdc85103-2c43-5b4d-8a3a-410576d961fa', 'D', 'Bilateral consolidation', false, 3),
  ('cb6e2e0a-5639-5750-8c15-5603d821f5c8', 'cdc85103-2c43-5b4d-8a3a-410576d961fa', 'E', 'Pleural effusion', false, 4);

-- Q83
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('156926c3-785d-56e9-8b5a-7eaafc8bb739', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000025', 'sba', 'A 30 year old man has had abdominal trauma. CT shows free fluid and a splenic laceration with active contrast extravasation. He is stable. What is the SINGLE most appropriate management?', 'Stable patients with splenic injury may be managed non-operatively, with embolisation for active bleeding (contrast blush). Unstable patients need laparotomy. Monitor closely for delayed rupture.', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v6')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = '156926c3-785d-56e9-8b5a-7eaafc8bb739';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('c8a77a62-69a5-5899-ab57-617676c5aaf9', '156926c3-785d-56e9-8b5a-7eaafc8bb739', 'A', 'Immediate splenectomy for all', false, 0),
  ('10e4b1ae-b715-52cc-b066-3685df5b4f3a', '156926c3-785d-56e9-8b5a-7eaafc8bb739', 'B', 'Splenic artery embolisation by interventional radiology', true, 1),
  ('f4055e9f-fcab-500a-8890-c2282d1ae902', '156926c3-785d-56e9-8b5a-7eaafc8bb739', 'C', 'Discharge home', false, 2),
  ('cf9084ec-4bad-5522-9656-c03fbffa03d6', '156926c3-785d-56e9-8b5a-7eaafc8bb739', 'D', 'Ultrasound in 1 week', false, 3),
  ('53340b0d-2c4d-5767-9ddf-7749aac56fa2', '156926c3-785d-56e9-8b5a-7eaafc8bb739', 'E', 'Observation without intervention', false, 4);

-- Q84
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('883ae8f8-9577-50c1-aa56-f1a6f72c4460', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000025', 'sba', 'A 60 year old man has had back pain. Spine X-ray shows an ''ivory vertebra'' (uniform sclerosis of a vertebral body). Which conditions should be considered?', 'An ivory vertebra is caused by sclerotic metastases (prostate, breast), Paget''s disease (enlarged vertebra) or lymphoma. PSA and further imaging are needed.', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v6')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = '883ae8f8-9577-50c1-aa56-f1a6f72c4460';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('d49ca900-a49c-5127-a047-bced111073d5', '883ae8f8-9577-50c1-aa56-f1a6f72c4460', 'A', 'Normal finding', false, 0),
  ('a3e889cb-eb4d-5d62-9462-19eb4b9f9a48', '883ae8f8-9577-50c1-aa56-f1a6f72c4460', 'B', 'Disc prolapse', false, 1),
  ('c726098a-b01a-561d-a60f-89e75b73bfc9', '883ae8f8-9577-50c1-aa56-f1a6f72c4460', 'C', 'Osteoporosis only', false, 2),
  ('ba64fda3-86a1-500a-8834-e6ce65ce574b', '883ae8f8-9577-50c1-aa56-f1a6f72c4460', 'D', 'Ankylosing spondylitis only', false, 3),
  ('6ddf5ce2-694d-5804-abbd-934d0f4e075d', '883ae8f8-9577-50c1-aa56-f1a6f72c4460', 'E', 'Sclerotic metastases (e.g. prostate), Paget''s disease or lymphoma', true, 4);

-- Q85
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('e1d8944a-b3e6-514a-97d9-f044350dcf4f', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000025', 'sba', 'A 50 year old woman has had a chest X-ray showing bilateral hilar lymphadenopathy with clear lungs. She is well. What is the SINGLE most likely diagnosis?', 'Bilateral hilar lymphadenopathy in a well young or middle-aged adult is most often sarcoidosis. Other causes: lymphoma, TB and metastases. Sarcoid CXR staging: 0 normal, 1 BHL, 2 BHL with infiltrates, 3 infiltrates only, 4 fibrosis.', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v6')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = 'e1d8944a-b3e6-514a-97d9-f044350dcf4f';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('2b5b48f5-69f0-51cf-990f-d64637a1f6b1', 'e1d8944a-b3e6-514a-97d9-f044350dcf4f', 'A', 'TB', false, 0),
  ('7562e219-8206-5d82-88d6-4563fcbf00e6', 'e1d8944a-b3e6-514a-97d9-f044350dcf4f', 'B', 'Lymphoma', false, 1),
  ('31c7acfc-5917-5329-8cd4-32cd32a7a56d', 'e1d8944a-b3e6-514a-97d9-f044350dcf4f', 'C', 'Pneumonia', false, 2),
  ('6185166a-b059-53a9-bce5-07933694fb05', 'e1d8944a-b3e6-514a-97d9-f044350dcf4f', 'D', 'Sarcoidosis (stage 1)', true, 3),
  ('b06bb156-23a9-5298-a682-8b1ce4e48572', 'e1d8944a-b3e6-514a-97d9-f044350dcf4f', 'E', 'Lung cancer', false, 4);

-- Q86
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('15247d1d-e438-5948-8a34-c2be61b7afe0', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000008', 'sba', 'A 23 year old woman is 11 weeks pregnant. She has had severe vomiting, ketonuria and weight loss over 5%, despite oral antiemetics. What is the SINGLE most appropriate management?', 'Hyperemesis gravidarum needs rehydration (avoid dextrose until thiamine given), antiemetics (first-line cyclizine, prochlorperazine, promethazine; second-line ondansetron, metoclopramide), thiamine, and VTE prophylaxis. Steroids for refractory cases.', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v6')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = '15247d1d-e438-5948-8a34-c2be61b7afe0';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('9a5fbdbd-0ccd-5d25-bf8a-e5f34fd806b3', '15247d1d-e438-5948-8a34-c2be61b7afe0', 'A', 'Advise ginger only', false, 0),
  ('2cfedc2b-12ef-5bf7-8bc4-fb050453b9fe', '15247d1d-e438-5948-8a34-c2be61b7afe0', 'B', 'Oral steroids first-line', false, 1),
  ('dd1c3b36-6542-54ac-9846-6254c6927b4e', '15247d1d-e438-5948-8a34-c2be61b7afe0', 'C', 'Admit for IV fluids (0.9% saline with potassium), IV or IM antiemetics, thiamine and VTE prophylaxis', true, 2),
  ('15f48179-54b2-5c25-be35-47880e695bd0', '15247d1d-e438-5948-8a34-c2be61b7afe0', 'D', 'Termination of pregnancy', false, 3),
  ('f8f62dd1-4469-5aea-83d6-2eb02af141cb', '15247d1d-e438-5948-8a34-c2be61b7afe0', 'E', 'Stop all fluids', false, 4);

-- Q87
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('11b55e95-8718-511f-9256-33833cc0bae2', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000008', 'sba', 'A 26 year old woman is 8 weeks pregnant. She has had a previous child with a neural tube defect. What dose of folic acid should she take?', 'High-dose folic acid (5 mg) is recommended for women at higher risk of neural tube defects: previous affected pregnancy, family history, diabetes, antiepileptic drugs, BMI 30 or more, coeliac disease, sickle cell disease and thalassaemia. Others take 400 micrograms from preconception until 12 weeks.', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v6')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = '11b55e95-8718-511f-9256-33833cc0bae2';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('41d827af-cc7d-5132-8198-087bd917c539', '11b55e95-8718-511f-9256-33833cc0bae2', 'A', '5 mg daily until 12 weeks', true, 0),
  ('39bab018-5994-5768-81a3-f1dd31c6fa7c', '11b55e95-8718-511f-9256-33833cc0bae2', 'B', '1 mg daily throughout pregnancy', false, 1),
  ('2af79a85-ab3d-5fa0-ab01-8cd437f8ca00', '11b55e95-8718-511f-9256-33833cc0bae2', 'C', '10 mg daily', false, 2),
  ('9d0a5f77-2baa-53e6-9961-efc56f8292dd', '11b55e95-8718-511f-9256-33833cc0bae2', 'D', 'No folic acid needed', false, 3),
  ('f8e23183-11e0-5d82-928b-a047fbdc91ff', '11b55e95-8718-511f-9256-33833cc0bae2', 'E', '400 micrograms daily', false, 4);

-- Q88
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('910d0a2d-c121-51c8-8306-4424b0d8f04a', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000008', 'sba', 'A 32 year old woman is 28 weeks pregnant. Her Hb is 98 g/L and ferritin is low. What is the SINGLE most appropriate treatment?', 'Anaemia in pregnancy: Hb below 110 g/L in the first trimester and below 105 g/L in the second and third trimesters. Treat iron deficiency with oral iron. IV iron if intolerant, non-responsive or late in pregnancy. Check haemoglobinopathy status.', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v6')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = '910d0a2d-c121-51c8-8306-4424b0d8f04a';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('3d932e67-b1a9-5a8d-bd6d-44c93e0c40e5', '910d0a2d-c121-51c8-8306-4424b0d8f04a', 'A', 'Blood transfusion', false, 0),
  ('415bfb82-ed0e-51e6-886c-5d63ff741833', '910d0a2d-c121-51c8-8306-4424b0d8f04a', 'B', 'IV iron first-line', false, 1),
  ('51c58536-8abd-5bcd-b77a-e9484cc1fc2b', '910d0a2d-c121-51c8-8306-4424b0d8f04a', 'C', 'Oral iron (e.g. ferrous sulfate) and recheck Hb in 2-4 weeks', true, 2),
  ('1ff151ce-4bbc-51f0-878e-7abd0813c4a3', '910d0a2d-c121-51c8-8306-4424b0d8f04a', 'D', 'Folic acid only', false, 3),
  ('c07eb562-539a-5400-81dd-a01c1a9ae011', '910d0a2d-c121-51c8-8306-4424b0d8f04a', 'E', 'No treatment as it is physiological', false, 4);

-- Q89
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('d17619e0-e5e3-5eca-a7e8-d0b990b0bd69', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000008', 'sba', 'A 29 year old woman has been given magnesium sulfate for severe pre-eclampsia. She has absent patellar reflexes and a respiratory rate of 9. What is the SINGLE most appropriate immediate action?', 'Magnesium toxicity causes loss of tendon reflexes, respiratory depression, cardiac arrest and muscle weakness. Monitor reflexes, respiratory rate and urine output (accumulates in renal impairment). Treatment: stop the infusion, give calcium gluconate and support breathing.', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v6')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = 'd17619e0-e5e3-5eca-a7e8-d0b990b0bd69';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('f354a80d-6dd7-5954-a0c7-6ceb1fd8ce99', 'd17619e0-e5e3-5eca-a7e8-d0b990b0bd69', 'A', 'Stop the magnesium infusion and give IV calcium gluconate', true, 0),
  ('c0c0ab9a-65da-500e-a5d5-a5e543d480d8', 'd17619e0-e5e3-5eca-a7e8-d0b990b0bd69', 'B', 'Give naloxone', false, 1),
  ('0e8c8d96-b519-5a49-985c-92e8a3282211', 'd17619e0-e5e3-5eca-a7e8-d0b990b0bd69', 'C', 'Continue and observe', false, 2),
  ('c8364840-9bfe-5eba-b14e-cf2d15498b97', 'd17619e0-e5e3-5eca-a7e8-d0b990b0bd69', 'D', 'Increase the infusion rate', false, 3),
  ('e0893635-d262-5e17-b6bb-447ac3eefca1', 'd17619e0-e5e3-5eca-a7e8-d0b990b0bd69', 'E', 'Give IV diazepam', false, 4);

-- Q90
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('a5f90dbf-e57c-524b-acd0-f953d7fd05e4', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000008', 'sba', 'A 30 year old woman with a known group B streptococcus carriage in this pregnancy is in labour at term. What is the SINGLE most appropriate management?', 'Intrapartum antibiotic prophylaxis is offered to women with GBS colonisation, bacteriuria or infection in the current pregnancy, a previous baby with GBS disease, preterm labour or fever in labour. Give IV benzylpenicillin (clindamycin if allergic) as soon as possible in labour.', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v6')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = 'a5f90dbf-e57c-524b-acd0-f953d7fd05e4';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('2f3b84e7-edf3-5822-b1d5-65928fb2d08e', 'a5f90dbf-e57c-524b-acd0-f953d7fd05e4', 'A', 'Caesarean section', false, 0),
  ('60f1c2b8-4bc0-5571-8204-f16833ee20fa', 'a5f90dbf-e57c-524b-acd0-f953d7fd05e4', 'B', 'Oral antibiotics at 36 weeks', false, 1),
  ('d9e49945-9ffc-53c4-b55f-253e718404b6', 'a5f90dbf-e57c-524b-acd0-f953d7fd05e4', 'C', 'No treatment', false, 2),
  ('910ea745-57b8-5ff1-973e-0e947c990674', 'a5f90dbf-e57c-524b-acd0-f953d7fd05e4', 'D', 'Antibiotics for the baby only', false, 3),
  ('e9adb000-6126-5f36-ab29-d212c025aabe', 'a5f90dbf-e57c-524b-acd0-f953d7fd05e4', 'E', 'IV benzylpenicillin during labour (intrapartum antibiotic prophylaxis)', true, 4);

-- Q91
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('ba84d985-f42f-51e4-a6cd-fcf238d911c5', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000008', 'sba', 'A 34 year old woman has gestational diabetes, controlled with metformin. Her baby is born at term. What is the SINGLE most important neonatal check?', 'Babies of mothers with diabetes are at risk of hypoglycaemia (fetal hyperinsulinism), macrosomia, shoulder dystocia, respiratory distress, jaundice and polycythaemia. Feed early (within 30 minutes) and check glucose regularly.', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v6')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = 'ba84d985-f42f-51e4-a6cd-fcf238d911c5';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('084f148f-0ff7-5e25-acf2-0749615ddce8', 'ba84d985-f42f-51e4-a6cd-fcf238d911c5', 'A', 'Monitor the baby''s blood glucose (risk of neonatal hypoglycaemia) and feed early', true, 0),
  ('b7b9f7a6-3ca4-5758-9d23-e38c5b2ac909', 'ba84d985-f42f-51e4-a6cd-fcf238d911c5', 'B', 'Give insulin to the baby', false, 1),
  ('df8f9659-13a0-5799-962f-ba33798335cf', 'ba84d985-f42f-51e4-a6cd-fcf238d911c5', 'C', 'Admit the baby to NICU routinely', false, 2),
  ('5cc9d3fc-2e2e-5939-bb4e-81fa507b31b4', 'ba84d985-f42f-51e4-a6cd-fcf238d911c5', 'D', 'No checks needed', false, 3),
  ('a5595b46-6625-5b98-a670-3f597dc6f8e7', 'ba84d985-f42f-51e4-a6cd-fcf238d911c5', 'E', 'Check thyroid function', false, 4);

-- Q92
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('4f7c3e4f-c2dc-52cf-9003-ae704c0c0029', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000008', 'sba', 'A 28 year old woman is 10 days postpartum. She has a swollen, painful left calf. What is the SINGLE most appropriate investigation and treatment?', 'The postpartum period has a high VTE risk. D-dimer is unreliable in pregnancy and postpartum. Confirm with Doppler. LMWH is used in pregnancy; postpartum, LMWH or warfarin can be used (both safe in breastfeeding). Continue for at least 6 weeks postpartum and 3 months in total.', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v6')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = '4f7c3e4f-c2dc-52cf-9003-ae704c0c0029';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('f6364783-35b1-57c0-9eeb-5a69133fa807', '4f7c3e4f-c2dc-52cf-9003-ae704c0c0029', 'A', 'Aspirin', false, 0),
  ('b34b39e5-ee5a-52bf-afe5-6b96c8e760a2', '4f7c3e4f-c2dc-52cf-9003-ae704c0c0029', 'B', 'No treatment needed', false, 1),
  ('1e959a0f-5863-533c-a68e-344b1adc7ed0', '4f7c3e4f-c2dc-52cf-9003-ae704c0c0029', 'C', 'D-dimer alone', false, 2),
  ('3fe562b0-842e-5365-a144-70570245c29e', '4f7c3e4f-c2dc-52cf-9003-ae704c0c0029', 'D', 'Warfarin without imaging', false, 3),
  ('f47e5ab4-37e5-5996-b312-894b531b5852', '4f7c3e4f-c2dc-52cf-9003-ae704c0c0029', 'E', 'Doppler ultrasound and treatment with LMWH if DVT is confirmed', true, 4);

-- Q93
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('ee341d1c-c08f-5f7b-898e-9e6a796810a9', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000008', 'sba', 'A 30 year old woman has had her baby 2 weeks ago. She reports low mood, poor sleep even when the baby sleeps, guilt and anxiety for 3 weeks. She has no psychotic features. What is the SINGLE most appropriate management?', 'Postnatal depression affects about 10% of mothers. Screen with the Whooley questions or EPDS. Treatment: psychological therapy (guided self-help, CBT) and antidepressants for moderate-severe depression (sertraline and paroxetine are compatible with breastfeeding). Assess risk to mother and baby.', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v6')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = 'ee341d1c-c08f-5f7b-898e-9e6a796810a9';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('53944374-bb8e-5c70-a543-e85103ade368', 'ee341d1c-c08f-5f7b-898e-9e6a796810a9', 'A', 'Admit to a mother and baby unit', false, 0),
  ('5ce9e087-2151-59bc-adee-27869d633d08', 'ee341d1c-c08f-5f7b-898e-9e6a796810a9', 'B', 'Start lithium', false, 1),
  ('3ebb550e-270b-5366-891c-d8525bcfe586', 'ee341d1c-c08f-5f7b-898e-9e6a796810a9', 'C', 'Assess risk, offer psychological therapy (CBT), and consider an SSRI (sertraline safe in breastfeeding)', true, 2),
  ('d0d6abff-1228-58e4-8ccb-0238bb59c5b6', 'ee341d1c-c08f-5f7b-898e-9e6a796810a9', 'D', 'No follow-up', false, 3),
  ('e55fb2db-b890-5df1-8876-7fec7036828a', 'ee341d1c-c08f-5f7b-898e-9e6a796810a9', 'E', 'Reassure as baby blues', false, 4);

-- Q94
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('a8f4089a-64c8-5bbe-b43b-abac94fa40b4', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000008', 'sba', 'A 28 year old woman gave birth 5 days ago. She has become confused, agitated, believes the baby is not hers and is hearing voices. She has bipolar disorder. What is the SINGLE most appropriate management?', 'Postpartum psychosis is a psychiatric emergency (risk of suicide and infanticide), usually within 2 weeks of delivery. Risk is highest with bipolar disorder or previous postpartum psychosis. Admit to a specialist mother and baby unit; treat with antipsychotics and mood stabilisers.', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v6')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = 'a8f4089a-64c8-5bbe-b43b-abac94fa40b4';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('36400698-1c60-50b4-9789-e03e3b29a0d5', 'a8f4089a-64c8-5bbe-b43b-abac94fa40b4', 'A', 'GP review in 2 weeks', false, 0),
  ('b39eeac0-4157-5cbf-aa4b-dd60fbe68e36', 'a8f4089a-64c8-5bbe-b43b-abac94fa40b4', 'B', 'Reassure as baby blues', false, 1),
  ('a0e6f6fe-7998-5cd6-a350-b3f2eff399c2', 'a8f4089a-64c8-5bbe-b43b-abac94fa40b4', 'C', 'Start an SSRI only', false, 2),
  ('4a8de548-753f-51f1-bbc2-f0f9a2ac7386', 'a8f4089a-64c8-5bbe-b43b-abac94fa40b4', 'D', 'Discharge home with support', false, 3),
  ('3a082aab-5b1e-5562-8f96-d7c7e21827ed', 'a8f4089a-64c8-5bbe-b43b-abac94fa40b4', 'E', 'Urgent psychiatric assessment and admission to a mother and baby unit (postpartum psychosis)', true, 4);

-- Q95
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('1fae0758-44f5-56b6-bd5b-d7e6b7999a6c', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000008', 'sba', 'A 39 year old woman has had heavy menstrual bleeding and intermenstrual bleeding. She is 39 and has a BMI of 38. Ultrasound shows a thickened endometrium. What is the SINGLE most appropriate next step?', 'Abnormal uterine bleeding in women with risk factors (obesity, PCOS, diabetes, tamoxifen, age over 45, intermenstrual bleeding) needs endometrial sampling. Endometrial hyperplasia without atypia is treated with progestogens (LNG-IUS); atypical hyperplasia usually needs hysterectomy.', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v6')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = '1fae0758-44f5-56b6-bd5b-d7e6b7999a6c';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('a52666e8-1b4c-5b9f-9b46-5c80f7cd7433', '1fae0758-44f5-56b6-bd5b-d7e6b7999a6c', 'A', 'Endometrial biopsy (pipelle) or hysteroscopy to exclude endometrial hyperplasia or cancer', true, 0),
  ('3ca58923-1f46-53a4-8469-ff6713b45dd3', '1fae0758-44f5-56b6-bd5b-d7e6b7999a6c', 'B', 'Reassure', false, 1),
  ('5299b3d4-7171-5038-ad55-322f3ac24f0b', '1fae0758-44f5-56b6-bd5b-d7e6b7999a6c', 'C', 'CA125', false, 2),
  ('97aed57c-386d-55d4-8961-4fdb73169bc7', '1fae0758-44f5-56b6-bd5b-d7e6b7999a6c', 'D', 'Start the combined pill without investigation', false, 3),
  ('5724d160-4d65-512b-87d7-113809b6f363', '1fae0758-44f5-56b6-bd5b-d7e6b7999a6c', 'E', 'Hysterectomy without biopsy', false, 4);

-- Q96
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('c490c3ba-ff07-54b0-8473-5d066dc23e4c', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000008', 'sba', 'A 25 year old woman has had dysmenorrhoea since menarche, with pain only during her period. Examination is normal. What is the SINGLE most appropriate first-line treatment?', 'Primary dysmenorrhoea is caused by prostaglandin release and starts soon after menarche. First-line: NSAIDs, then hormonal contraception. Secondary dysmenorrhoea (starting later, with other symptoms) suggests endometriosis, adenomyosis, fibroids or PID.', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v6')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = 'c490c3ba-ff07-54b0-8473-5d066dc23e4c';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('9c7efcd6-51d0-58e9-899f-d9a10e4e0e63', 'c490c3ba-ff07-54b0-8473-5d066dc23e4c', 'A', 'Strong opioids', false, 0),
  ('0c7afbd5-4387-5cdb-ad12-54f2e1a443c7', 'c490c3ba-ff07-54b0-8473-5d066dc23e4c', 'B', 'Laparoscopy', false, 1),
  ('30df6398-44d2-52db-949c-53f05b710e96', 'c490c3ba-ff07-54b0-8473-5d066dc23e4c', 'C', 'NSAIDs (e.g. mefenamic acid or ibuprofen), with the combined pill if contraception is wanted', true, 2),
  ('c0617809-8e81-5e2f-96fa-416fa0ce8eb1', 'c490c3ba-ff07-54b0-8473-5d066dc23e4c', 'D', 'Antibiotics', false, 3),
  ('7e175770-c450-5710-921e-8ee63a34b578', 'c490c3ba-ff07-54b0-8473-5d066dc23e4c', 'E', 'Hysterectomy', false, 4);

-- Q97
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('1e392ff2-0aad-51f2-b6ee-a2ee7f8b9a07', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000008', 'sba', 'A 50 year old woman has had pelvic pain and a pelvic mass. Ultrasound shows a multilocular cyst with solid areas and ascites. She is postmenopausal. CA125 is 450. What is the SINGLE most appropriate management?', 'The Risk of Malignancy Index (RMI = ultrasound score x menopausal status x CA125) above 200-250 suggests malignancy; refer to a gynaecological oncology centre. Ovarian cancer staging and treatment: surgery (cytoreduction) and platinum chemotherapy, with PARP inhibitors for BRCA mutations.', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v6')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = '1e392ff2-0aad-51f2-b6ee-a2ee7f8b9a07';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('d9d2790d-74c9-539d-9bab-830be76d8824', '1e392ff2-0aad-51f2-b6ee-a2ee7f8b9a07', 'A', 'Oral contraceptive pill', false, 0),
  ('52f3a158-7c7a-5143-ac48-ba2ab863e131', '1e392ff2-0aad-51f2-b6ee-a2ee7f8b9a07', 'B', 'Repeat ultrasound in 6 months', false, 1),
  ('84c9bff9-0196-57e5-a27f-a9d08913501e', '1e392ff2-0aad-51f2-b6ee-a2ee7f8b9a07', 'C', 'Urgent referral to a gynaecological oncology MDT (high risk of malignancy index)', true, 2),
  ('7e882d63-6cfe-52df-9aa7-d949ceeeed03', '1e392ff2-0aad-51f2-b6ee-a2ee7f8b9a07', 'D', 'Laparoscopic cystectomy in a district hospital', false, 3),
  ('945c6df7-ad25-5396-89e3-cf472752e633', '1e392ff2-0aad-51f2-b6ee-a2ee7f8b9a07', 'E', 'Aspirate the cyst', false, 4);

-- Q98
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('bad24155-95b5-5f50-9016-ad63e6adbd93', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000008', 'sba', 'A 22 year old woman has had a simple 4 cm ovarian cyst found on ultrasound. She has no symptoms. CA125 is not needed. What is the SINGLE most appropriate management?', 'Simple ovarian cysts under 5 cm in premenopausal women are usually functional and resolve. 5-7 cm: yearly ultrasound. Over 7 cm: consider MRI or surgery. Complex cysts need further assessment. Dermoid cysts (teratomas) can cause torsion.', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v6')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = 'bad24155-95b5-5f50-9016-ad63e6adbd93';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('75c4edcc-a3a3-50fa-b775-2e44623f889c', 'bad24155-95b5-5f50-9016-ad63e6adbd93', 'A', 'Start tamoxifen', false, 0),
  ('424ff946-1284-562a-81da-1afd49eccf1e', 'bad24155-95b5-5f50-9016-ad63e6adbd93', 'B', 'Laparoscopic cystectomy', false, 1),
  ('12311771-6e14-57d3-ab5c-fdeaa4b963ea', 'bad24155-95b5-5f50-9016-ad63e6adbd93', 'C', 'Oophorectomy', false, 2),
  ('9bec6812-4692-568c-9e85-8360596a9183', 'bad24155-95b5-5f50-9016-ad63e6adbd93', 'D', 'Reassure; most simple cysts under 5 cm in premenopausal women resolve without follow-up', true, 3),
  ('e5a1d511-6488-5b34-bbc2-eef48a1dc6e4', 'bad24155-95b5-5f50-9016-ad63e6adbd93', 'E', 'CA125 monthly', false, 4);

-- Q99
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('f9c2cc94-0847-5e1f-80f5-4654e89723b3', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000008', 'sba', 'A 30 year old woman has had pelvic pain and fever 3 days after IUD insertion. She has cervical motion tenderness. What is the SINGLE most likely diagnosis?', 'The risk of PID is increased in the first 20 days after IUD insertion (introduction of infection). Treat with antibiotics; the IUD can usually stay if the woman improves. Screen for STIs before insertion in women at risk.', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v6')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = 'f9c2cc94-0847-5e1f-80f5-4654e89723b3';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('234f8bd2-58f1-5af5-8248-264f7fba6b1e', 'f9c2cc94-0847-5e1f-80f5-4654e89723b3', 'A', 'Normal post-insertion cramping', false, 0),
  ('803c8ecc-4997-533e-875d-77e3839b5efa', 'f9c2cc94-0847-5e1f-80f5-4654e89723b3', 'B', 'Ectopic pregnancy', false, 1),
  ('0b039b8b-0e61-53d8-ae5c-8e54d215bcb1', 'f9c2cc94-0847-5e1f-80f5-4654e89723b3', 'C', 'Appendicitis', false, 2),
  ('be4c0944-7858-55e8-b943-8ceec5a814af', 'f9c2cc94-0847-5e1f-80f5-4654e89723b3', 'D', 'Ovarian torsion', false, 3),
  ('54feac65-1d19-58aa-9fdb-4afeaac9f292', 'f9c2cc94-0847-5e1f-80f5-4654e89723b3', 'E', 'Pelvic inflammatory disease (post-insertion)', true, 4);

-- Q100
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('e9e32536-7458-5492-b0bc-92aeecd20fbd', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000008', 'sba', 'A 35 year old woman has had 2 years of trying to conceive. She has irregular periods and a BMI of 34. Ovulation is not confirmed. She has PCOS. What is the SINGLE most appropriate first-line treatment to induce ovulation?', 'PCOS-related anovulatory infertility: weight loss improves ovulation. Letrozole is now first-line for ovulation induction (more live births than clomifene). Alternatives: clomifene, metformin, gonadotropins, ovarian drilling and IVF.', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v6')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = 'e9e32536-7458-5492-b0bc-92aeecd20fbd';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('a09a5ce2-2497-5774-af19-a90e670f0109', 'e9e32536-7458-5492-b0bc-92aeecd20fbd', 'A', 'Laparoscopic ovarian drilling first-line', false, 0),
  ('ea6582ff-bc25-5032-9d8a-62fdf29c4efe', 'e9e32536-7458-5492-b0bc-92aeecd20fbd', 'B', 'Clomifene first-line in all', false, 1),
  ('b39ca3dd-382f-5e0b-b3f5-abe7b1941276', 'e9e32536-7458-5492-b0bc-92aeecd20fbd', 'C', 'IVF immediately', false, 2),
  ('76183794-45c8-51a2-94ac-36c208e9e4b1', 'e9e32536-7458-5492-b0bc-92aeecd20fbd', 'D', 'Letrozole (with weight loss advice)', true, 3),
  ('c10e5a4e-06d2-5fdc-9434-e78b67d1f240', 'e9e32536-7458-5492-b0bc-92aeecd20fbd', 'E', 'Metformin alone', false, 4);

-- Q101
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('25b945e0-f95c-5fb0-9673-efced4d386d6', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000008', 'sba', 'A 42 year old woman has had worsening heavy periods and anaemia. She has completed her family. Medical treatments have failed. She does not want a hysterectomy. Her uterus is normal size. What is the SINGLE most appropriate option?', 'Endometrial ablation is an option for heavy menstrual bleeding with a normal or small uterus, in women who have completed their family. Contraception is still needed afterwards (pregnancy after ablation is dangerous). Endometrial biopsy is needed beforehand.', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v6')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = '25b945e0-f95c-5fb0-9673-efced4d386d6';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('b48bb2ff-11ea-5f27-a328-1e369c51d0e9', '25b945e0-f95c-5fb0-9673-efced4d386d6', 'A', 'Oophorectomy', false, 0),
  ('1fc65f82-8335-596b-bfc8-8feffba967a8', '25b945e0-f95c-5fb0-9673-efced4d386d6', 'B', 'Uterine artery embolisation', false, 1),
  ('4b0a060e-869b-5924-bc3f-d6fba1e5591a', '25b945e0-f95c-5fb0-9673-efced4d386d6', 'C', 'Cervical cone biopsy', false, 2),
  ('48a647b5-777f-5c03-b8d8-45ec22a87410', '25b945e0-f95c-5fb0-9673-efced4d386d6', 'D', 'Endometrial ablation (after excluding malignancy)', true, 3),
  ('7fbacc0b-0ba2-5404-8bc4-f30f214f0cf6', '25b945e0-f95c-5fb0-9673-efced4d386d6', 'E', 'Myomectomy', false, 4);

-- Q102
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('bb10125c-3e5b-5098-ad90-08b228544ce2', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000009', 'sba', 'A 4 week old baby has had a weak cry, poor feeding, constipation and a large tongue. He was jaundiced for a long time after birth. The newborn screen was missed. What is the SINGLE most likely diagnosis?', 'Congenital hypothyroidism (thyroid dysgenesis or dyshormonogenesis) is detected on newborn blood spot screening. Features: prolonged jaundice, poor feeding, constipation, macroglossia, umbilical hernia and hypotonia. Early levothyroxine prevents intellectual disability.', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v6')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = 'bb10125c-3e5b-5098-ad90-08b228544ce2';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('613600a7-ff8c-53c2-bd5b-35ba701f68d7', 'bb10125c-3e5b-5098-ad90-08b228544ce2', 'A', 'Congenital hypothyroidism', true, 0),
  ('0f811d53-7b4f-573a-8507-4fc1f9978988', 'bb10125c-3e5b-5098-ad90-08b228544ce2', 'B', 'Hirschsprung''s disease', false, 1),
  ('dbdc816a-7ad6-5e85-a43e-d27b4712d8a5', 'bb10125c-3e5b-5098-ad90-08b228544ce2', 'C', 'Cystic fibrosis', false, 2),
  ('7841de67-8d3c-5df4-a99f-e3738e96b96a', 'bb10125c-3e5b-5098-ad90-08b228544ce2', 'D', 'Biliary atresia', false, 3),
  ('1bcdb596-0cf0-51d2-89a4-ac4c1f511385', 'bb10125c-3e5b-5098-ad90-08b228544ce2', 'E', 'Down syndrome', false, 4);

-- Q103
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('79cc3c7f-7945-5391-9a40-e2b624275193', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000009', 'sba', 'A 7 year old girl has had breast development and pubic hair. Her height is above the 98th centile. What is the SINGLE most appropriate action?', 'Precocious puberty: signs before 8 in girls or 9 in boys. In girls it is usually central (idiopathic). In boys it is more often pathological (CNS tumours, CAH, testicular tumours). Investigation: bone age, LH/FSH, oestradiol or testosterone, and MRI brain. Treatment: GnRH analogues.', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v6')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = '79cc3c7f-7945-5391-9a40-e2b624275193';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('c23a6776-5b48-59a1-9162-629eb052ca8f', '79cc3c7f-7945-5391-9a40-e2b624275193', 'A', 'Start oral contraceptive', false, 0),
  ('b1c76a7f-3d4d-515b-a86e-dc9012945bc7', '79cc3c7f-7945-5391-9a40-e2b624275193', 'B', 'Refer to paediatric endocrinology for assessment of precocious puberty', true, 1),
  ('a6734953-5899-5dde-80a2-d9ab6ce2daf6', '79cc3c7f-7945-5391-9a40-e2b624275193', 'C', 'Check vitamin D only', false, 2),
  ('7fa93340-9ecb-5c48-8512-603f22c5b34e', '79cc3c7f-7945-5391-9a40-e2b624275193', 'D', 'Observe until age 10', false, 3),
  ('17be86eb-6ceb-575d-8c43-bca98cce0c10', '79cc3c7f-7945-5391-9a40-e2b624275193', 'E', 'Reassure that it is normal', false, 4);

-- Q104
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('5290ca13-d610-5b74-b36d-e54dc9dc8be8', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000009', 'sba', 'A 15 year old boy has no signs of puberty. He is short but growing steadily, and his father was a ''late bloomer''. What is the SINGLE most likely diagnosis?', 'Constitutional delay is the commonest cause of delayed puberty in boys (no signs by 14), often with a family history. Bone age is delayed. Check for chronic illness and hypogonadism. Short courses of testosterone can help if distressing. Kallmann syndrome includes anosmia.', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v6')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = '5290ca13-d610-5b74-b36d-e54dc9dc8be8';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('2c8e7d03-0d34-52e9-96d3-e4f7aa63802c', '5290ca13-d610-5b74-b36d-e54dc9dc8be8', 'A', 'Hypothyroidism', false, 0),
  ('15383f67-51ac-5050-942b-258a34a4ff60', '5290ca13-d610-5b74-b36d-e54dc9dc8be8', 'B', 'Klinefelter syndrome', false, 1),
  ('0d364489-f694-59a5-a718-8dd3745da2f8', '5290ca13-d610-5b74-b36d-e54dc9dc8be8', 'C', 'Growth hormone deficiency', false, 2),
  ('2b90e023-c634-516c-9429-5f20e9ed199f', '5290ca13-d610-5b74-b36d-e54dc9dc8be8', 'D', 'Constitutional delay of growth and puberty', true, 3),
  ('9fa858ce-a098-5ebc-817d-2c81a8106cc8', '5290ca13-d610-5b74-b36d-e54dc9dc8be8', 'E', 'Kallmann syndrome', false, 4);

-- Q105
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('9fda8bad-f87e-515e-989b-6633f1d0345c', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000009', 'sba', 'A 2 year old child has had a fever, then a febrile illness with conjunctivitis and a ''slapped cheek'' appearance. What is the SINGLE most likely cause of the slapped cheek rash?', 'Parvovirus B19 (fifth disease) causes slapped cheek rash then a lacy rash on the body. Infectious before the rash. Complications: aplastic crisis in haemolytic anaemias, chronic anaemia in immunosuppression, and fetal hydrops in pregnancy. No school exclusion once the rash appears.', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v6')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = '9fda8bad-f87e-515e-989b-6633f1d0345c';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('a9eb5176-4939-570d-999f-a323d3b8e673', '9fda8bad-f87e-515e-989b-6633f1d0345c', 'A', 'Measles', false, 0),
  ('c1067fe9-d85a-5c25-9039-5ce9f4234f7f', '9fda8bad-f87e-515e-989b-6633f1d0345c', 'B', 'Scarlet fever', false, 1),
  ('13472ade-efb2-5a3b-aaa8-6792bfa3ee20', '9fda8bad-f87e-515e-989b-6633f1d0345c', 'C', 'Kawasaki disease', false, 2),
  ('a144e19e-f246-5029-8ebd-8409b2175829', '9fda8bad-f87e-515e-989b-6633f1d0345c', 'D', 'Parvovirus B19 (erythema infectiosum)', true, 3),
  ('c4ea91f1-992a-535e-a9a0-d029f2f7cd06', '9fda8bad-f87e-515e-989b-6633f1d0345c', 'E', 'Rubella', false, 4);

-- Q106
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('7d7e09a6-e2cd-51f0-bec8-d98076a7e017', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000009', 'sba', 'A 3 year old girl has had a red, sore eye and a high fever for 5 days with a strawberry tongue, peeling skin on her fingers and swollen hands. Echo shows coronary artery dilatation. What is the SINGLE most appropriate treatment?', 'Kawasaki disease is a medium-vessel vasculitis in young children. Treatment within 10 days of onset with IVIG and aspirin reduces coronary aneurysms. Follow-up echocardiography. Steroids for high-risk or resistant disease.', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v6')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = '7d7e09a6-e2cd-51f0-bec8-d98076a7e017';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('a2bef7fa-6157-5f09-94f4-60130d135155', '7d7e09a6-e2cd-51f0-bec8-d98076a7e017', 'A', 'Oral steroids alone', false, 0),
  ('d0a4359f-55f7-5849-b449-f9f972313ed0', '7d7e09a6-e2cd-51f0-bec8-d98076a7e017', 'B', 'Paracetamol only', false, 1),
  ('0a177de3-a4b8-5c08-9410-012382f07826', '7d7e09a6-e2cd-51f0-bec8-d98076a7e017', 'C', 'Antibiotics', false, 2),
  ('ce7f23ef-20bf-5aad-96c8-0a1ada21ec5c', '7d7e09a6-e2cd-51f0-bec8-d98076a7e017', 'D', 'Antiviral therapy', false, 3),
  ('d22c2b24-d176-56c6-8c8b-e6edbd26d427', '7d7e09a6-e2cd-51f0-bec8-d98076a7e017', 'E', 'IV immunoglobulin and high-dose aspirin', true, 4);

-- Q107
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('a93d8c68-6110-5110-a3c9-82334d708eb4', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000009', 'sba', 'A 14 month old boy has had a temperature of 39°C for 2 days, with no obvious source. He is well and feeding. Urine dip shows nitrites and leucocytes. What is the SINGLE most appropriate antibiotic?', 'Children under 3 months with UTI need IV antibiotics and hospital assessment. Older children with upper UTI (fever over 38 or loin pain) need oral antibiotics for 7-10 days; lower UTI for 3 days. NICE NG224 imaging: ultrasound for atypical or recurrent UTI, and DMSA for atypical or recurrent UTI in young children.', null, true, true, jsonb_build_object('source', 'plab1-xlsx-v6', 'guidelines_text', 'NICE NG224')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = 'a93d8c68-6110-5110-a3c9-82334d708eb4';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('dca4ebcc-5883-5a7e-be27-5674ddde945f', 'a93d8c68-6110-5110-a3c9-82334d708eb4', 'A', 'Nitrofurantoin for 3 days', false, 0),
  ('dc093b95-8b51-5b38-8a34-f345b16d34ce', 'a93d8c68-6110-5110-a3c9-82334d708eb4', 'B', 'No antibiotics', false, 1),
  ('377c6ee8-daf2-5da5-9adc-1f3214f08eb3', 'a93d8c68-6110-5110-a3c9-82334d708eb4', 'C', 'Oral antibiotic (e.g. cefalexin or co-amoxiclav) for 7-10 days for upper UTI (pyelonephritis), after sending urine culture', true, 2),
  ('ea13b7d5-afa3-54b1-b89c-4ee61a41f891', 'a93d8c68-6110-5110-a3c9-82334d708eb4', 'D', 'Antibiotics only if positive culture', false, 3),
  ('12efede4-f5c3-53e4-86d8-35a3bb36a707', 'a93d8c68-6110-5110-a3c9-82334d708eb4', 'E', 'IV gentamicin in all', false, 4);

-- Q108
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('7562a5cf-3148-5000-a21e-f185b89869df', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000009', 'sba', 'A 5 year old boy has had recurrent UTIs. Micturating cystourethrogram shows grade 4 vesicoureteric reflux. What is the MAIN long-term concern?', 'VUR predisposes to pyelonephritis and renal scarring (seen on DMSA), which can cause hypertension and CKD. Management: treat UTIs promptly, prophylactic antibiotics in selected children, and surgery for severe reflux. Many cases resolve with growth.', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v6')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = '7562a5cf-3148-5000-a21e-f185b89869df';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('26c5bfac-e927-56a8-8790-e01dd3208a4c', '7562a5cf-3148-5000-a21e-f185b89869df', 'A', 'Kidney stones only', false, 0),
  ('eb831bf0-046a-5c42-8f98-33f329fdc507', '7562a5cf-3148-5000-a21e-f185b89869df', 'B', 'No concern', false, 1),
  ('abd8ff9e-cbde-5f4e-8a0c-bb8027d5d39a', '7562a5cf-3148-5000-a21e-f185b89869df', 'C', 'Bladder cancer', false, 2),
  ('4ab6eaa9-ef24-5e2f-a190-17f9a278c9ec', '7562a5cf-3148-5000-a21e-f185b89869df', 'D', 'Renal scarring with risk of hypertension and CKD', true, 3),
  ('4ab1c5ac-49fc-5654-a8d2-7dc1d1edafdd', '7562a5cf-3148-5000-a21e-f185b89869df', 'E', 'Testicular torsion', false, 4);

-- Q109
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('2379794d-2ef2-5d84-a409-37ef63a41ea1', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000009', 'sba', 'A newborn boy has a weak urinary stream and a palpable bladder. Antenatal ultrasound showed bilateral hydronephrosis. What is the SINGLE most likely diagnosis?', 'Posterior urethral valves are the commonest cause of bladder outflow obstruction in boys. They cause bilateral hydronephrosis, a thick bladder, poor stream and renal impairment. Diagnose with MCUG. Treatment: catheter then endoscopic ablation of valves. Long-term renal follow-up.', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v6')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = '2379794d-2ef2-5d84-a409-37ef63a41ea1';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('abebc68c-3e2b-530d-a665-3a77e6a13046', '2379794d-2ef2-5d84-a409-37ef63a41ea1', 'A', 'Posterior urethral valves', true, 0),
  ('803596db-b594-5889-bd21-b62a51024d00', '2379794d-2ef2-5d84-a409-37ef63a41ea1', 'B', 'Pelviureteric junction obstruction', false, 1),
  ('cbcabe08-d0f7-5566-95b5-f8a9d32bd6f9', '2379794d-2ef2-5d84-a409-37ef63a41ea1', 'C', 'Vesicoureteric reflux', false, 2),
  ('fa919b7a-3d89-5bd4-bff6-12e75741719e', '2379794d-2ef2-5d84-a409-37ef63a41ea1', 'D', 'Wilms tumour', false, 3),
  ('f199db89-f771-557c-9efe-67e22ac23238', '2379794d-2ef2-5d84-a409-37ef63a41ea1', 'E', 'Hypospadias', false, 4);

-- Q110
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('824e204d-160a-5de5-b39f-e661a79233b7', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000009', 'sba', 'A newborn boy has the urethral opening on the underside of the penis with a hooded foreskin. What is the SINGLE most important advice?', 'Hypospadias: ventral urethral opening, hooded foreskin and chordee. Surgical repair is usually done between 6 and 18 months. Circumcision is avoided as the foreskin is used in repair. Severe cases with undescended testes need investigation for disorders of sex development.', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v6')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = '824e204d-160a-5de5-b39f-e661a79233b7';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('d9b51ff5-60fa-5cf3-9c93-9ac85f556cce', '824e204d-160a-5de5-b39f-e661a79233b7', 'A', 'No follow-up needed', false, 0),
  ('c90e439d-3d4a-5b7f-8590-8b09228d7dfd', '824e204d-160a-5de5-b39f-e661a79233b7', 'B', 'Do not circumcise; refer to paediatric urology (the foreskin is used for surgical repair)', true, 1),
  ('239f2915-1704-51fe-b5a2-a4a03babe871', '824e204d-160a-5de5-b39f-e661a79233b7', 'C', 'Repair at age 10', false, 2),
  ('e65d4c0e-fa28-5e69-90f8-c3a9a5dbf283', '824e204d-160a-5de5-b39f-e661a79233b7', 'D', 'Circumcise early', false, 3),
  ('d551bf79-308c-5004-a4ec-93b93d24da9f', '824e204d-160a-5de5-b39f-e661a79233b7', 'E', 'Start hormone therapy', false, 4);

-- Q111
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('bc1c65a8-8964-50f7-bb73-59f81139717d', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000009', 'sba', 'A 3 year old girl has a cough, fever and is unwell. She has had multiple chest infections and pale, bulky, foul-smelling stools. She is below the 2nd centile for weight. What is the SINGLE most likely diagnosis?', 'CF causes recurrent chest infections, bronchiectasis, pancreatic insufficiency (steatorrhoea, failure to thrive), meconium ileus and male infertility. Detected on newborn screening (immunoreactive trypsinogen). Confirm with sweat test (chloride over 60 mmol/L) and genetic testing.', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v6')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = 'bc1c65a8-8964-50f7-bb73-59f81139717d';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('8781e8eb-0203-5db9-88fc-84c25d81aa56', 'bc1c65a8-8964-50f7-bb73-59f81139717d', 'A', 'Coeliac disease', false, 0),
  ('780b4a19-a5a5-5337-9b8a-cc642c68584f', 'bc1c65a8-8964-50f7-bb73-59f81139717d', 'B', 'Immunodeficiency', false, 1),
  ('56805ffa-671c-527c-a8e1-4dc59317c3af', 'bc1c65a8-8964-50f7-bb73-59f81139717d', 'C', 'Primary ciliary dyskinesia', false, 2),
  ('92e98828-3e80-5cfb-85f2-24d5273030c3', 'bc1c65a8-8964-50f7-bb73-59f81139717d', 'D', 'Asthma', false, 3),
  ('5cd78af9-422b-5818-90d0-8e1edd139654', 'bc1c65a8-8964-50f7-bb73-59f81139717d', 'E', 'Cystic fibrosis', true, 4);

-- Q112
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('2ada611d-195c-50ea-b8a2-3482a344bcb0', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000009', 'sba', 'A 6 year old boy has asthma. He uses salbutamol several times a week and has night symptoms. What is the SINGLE most appropriate next step in management (BTS/NICE/SIGN 2024)?', 'Children aged 5-11 with asthma: offer a paediatric low-dose ICS as maintenance plus SABA reliever, then add montelukast or step to MART (ICS/formoterol) if uncontrolled. Check inhaler technique (spacer) and adherence. Monitor growth.', null, true, true, jsonb_build_object('source', 'plab1-xlsx-v6')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = '2ada611d-195c-50ea-b8a2-3482a344bcb0';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('eb28d915-1a1c-57ec-9ff9-8f59af9aa50a', '2ada611d-195c-50ea-b8a2-3482a344bcb0', 'A', 'Oral prednisolone for 2 weeks', false, 0),
  ('05f017e7-cd7a-529e-b3bf-2b4e874061f1', '2ada611d-195c-50ea-b8a2-3482a344bcb0', 'B', 'Start a paediatric low-dose inhaled corticosteroid (regular maintenance)', true, 1),
  ('520d74e7-91e1-539e-b2b2-436ad6955b77', '2ada611d-195c-50ea-b8a2-3482a344bcb0', 'C', 'Montelukast alone', false, 2),
  ('cf7f811e-5be5-580f-b309-7c1830eaf520', '2ada611d-195c-50ea-b8a2-3482a344bcb0', 'D', 'Long-acting beta agonist alone', false, 3),
  ('b2f9c851-ecae-5753-89fb-1c1c5bb1837d', '2ada611d-195c-50ea-b8a2-3482a344bcb0', 'E', 'Increase salbutamol use', false, 4);

-- Q113
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('23da89b0-434b-5749-9322-493b1e3f7388', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000009', 'sba', 'A 4 year old has had acute severe asthma. He is too breathless to talk, with SpO2 of 91% and a respiratory rate of 50. What is the SINGLE most appropriate immediate treatment?', 'Acute asthma in children: life-threatening if SpO2 below 92%, silent chest, exhaustion, confusion or poor respiratory effort. Treatment: oxygen, nebulised salbutamol and ipratropium, oral prednisolone (or IV hydrocortisone), and IV magnesium or salbutamol if not improving. Early senior and ICU input.', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v6')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = '23da89b0-434b-5749-9322-493b1e3f7388';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('d87ab39a-5fc4-534f-a985-3afab800a80a', '23da89b0-434b-5749-9322-493b1e3f7388', 'A', 'Antibiotics', false, 0),
  ('18348fee-c3d5-55e9-8c99-0746956e84cf', '23da89b0-434b-5749-9322-493b1e3f7388', 'B', 'Inhaled steroid only', false, 1),
  ('d883eeb8-7061-5b54-82e7-c39008e6186d', '23da89b0-434b-5749-9322-493b1e3f7388', 'C', 'Chest physiotherapy', false, 2),
  ('9dae44d4-0ae4-59a8-8396-446e250b69ef', '23da89b0-434b-5749-9322-493b1e3f7388', 'D', 'High-flow oxygen and nebulised salbutamol (with ipratropium), plus oral prednisolone', true, 3),
  ('3bb5038e-55dc-55b9-9888-776a8d4f332f', '23da89b0-434b-5749-9322-493b1e3f7388', 'E', 'Oral salbutamol syrup', false, 4);

-- Q114
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('ccda6b83-4dcf-5e96-8f0a-f469cdd7f8e4', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000009', 'sba', 'A 9 month old baby has had a cough, then sudden paroxysms of crying with vomiting. He has a ''redcurrant jelly'' stool. Ultrasound shows a target sign. He has signs of peritonitis. What is the SINGLE most appropriate management?', 'Intussusception with signs of peritonitis or perforation needs surgery after resuscitation. Without these, air enema reduction is first-line under radiological guidance.', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v6')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = 'ccda6b83-4dcf-5e96-8f0a-f469cdd7f8e4';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('6d5b4d65-7b8b-59bd-b1b0-b343563b560a', 'ccda6b83-4dcf-5e96-8f0a-f469cdd7f8e4', 'A', 'Resuscitate and proceed to surgery (air enema is contraindicated with peritonitis)', true, 0),
  ('c0c7a6f2-802a-5d6d-a757-e6dcf215652e', 'ccda6b83-4dcf-5e96-8f0a-f469cdd7f8e4', 'B', 'Air enema reduction', false, 1),
  ('9768b013-0098-5a7e-8314-692d06de4b70', 'ccda6b83-4dcf-5e96-8f0a-f469cdd7f8e4', 'C', 'Laxatives', false, 2),
  ('88014bef-2505-5778-b9d0-c423252e82a4', 'ccda6b83-4dcf-5e96-8f0a-f469cdd7f8e4', 'D', 'Observe', false, 3),
  ('a24ed1fe-d6f9-53bf-804b-f5488947df2b', 'ccda6b83-4dcf-5e96-8f0a-f469cdd7f8e4', 'E', 'Oral antibiotics', false, 4);

-- Q115
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('dfa46de6-f3ac-5d7e-ba46-d10b6522f1ee', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000009', 'sba', 'A 2 year old girl has swallowed bleach. She has drooling, refuses to eat and has mouth ulcers. What is the SINGLE most appropriate management?', 'Corrosive ingestion (acids, alkalis) can cause oesophageal burns and perforation. Do not induce vomiting or give charcoal. Assess airway, give nothing by mouth and arrange endoscopy if symptomatic. Strictures can develop later.', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v6')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = 'dfa46de6-f3ac-5d7e-ba46-d10b6522f1ee';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('1fdde085-f6d9-51a2-aab9-c5b39f534c50', 'dfa46de6-f3ac-5d7e-ba46-d10b6522f1ee', 'A', 'Induce vomiting', false, 0),
  ('c858e558-99fd-5f08-9fdc-3cab30e8ebee', 'dfa46de6-f3ac-5d7e-ba46-d10b6522f1ee', 'B', 'Neutralise with an acid', false, 1),
  ('79462418-0e3a-56fc-987b-a9a75ff16330', 'dfa46de6-f3ac-5d7e-ba46-d10b6522f1ee', 'C', 'Give activated charcoal', false, 2),
  ('0acc6077-ad9b-59a9-9bca-1b1d73cc4764', 'dfa46de6-f3ac-5d7e-ba46-d10b6522f1ee', 'D', 'Discharge home', false, 3),
  ('e3367a30-3ee9-549f-bf9a-86a6b7873101', 'dfa46de6-f3ac-5d7e-ba46-d10b6522f1ee', 'E', 'Do not induce vomiting; assess the airway, give nothing by mouth, and arrange endoscopy within 24 hours if symptomatic', true, 4);

-- Q116
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('d823320b-0609-5664-8473-5c1ceda913c7', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000009', 'sba', 'A 3 month old baby has had bilious vomiting, abdominal distension and passed blood per rectum. He looks unwell. What is the SINGLE most important diagnosis to exclude?', 'Bilious vomiting is a surgical emergency. Malrotation with volvulus can occur at any age (most in the first month). Blood per rectum suggests bowel ischaemia. Urgent upper GI contrast and surgery.', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v6')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = 'd823320b-0609-5664-8473-5c1ceda913c7';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('b72839e0-ac1f-51d5-9145-134ebfa46e2e', 'd823320b-0609-5664-8473-5c1ceda913c7', 'A', 'Pyloric stenosis', false, 0),
  ('dae6ecfd-1d89-596b-9b4d-b35cc9985d24', 'd823320b-0609-5664-8473-5c1ceda913c7', 'B', 'Constipation', false, 1),
  ('b69fab86-94b8-515b-9477-0aa425067fff', 'd823320b-0609-5664-8473-5c1ceda913c7', 'C', 'Gastro-oesophageal reflux', false, 2),
  ('7b3e803b-450a-5ad0-b108-630529393b38', 'd823320b-0609-5664-8473-5c1ceda913c7', 'D', 'Cow''s milk protein allergy', false, 3),
  ('5a702c5b-1536-5d1d-a8d8-74073237d929', 'd823320b-0609-5664-8473-5c1ceda913c7', 'E', 'Malrotation with volvulus', true, 4);

-- Q117
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('33d35b4f-c3f7-5bf8-aef7-cc87f1951020', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000009', 'sba', 'A 4 year old child has a fever of 39.5°C and is irritable. On examination, the right ear drum is bulging and red, with a swelling behind the ear pushing the pinna forward. What is the SINGLE most likely diagnosis?', 'Mastoiditis complicates acute otitis media, with post-auricular swelling, tenderness, redness and protrusion of the pinna. Admit for IV antibiotics and CT. Complications: subperiosteal abscess, meningitis, intracranial abscess and venous sinus thrombosis.', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v6')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = '33d35b4f-c3f7-5bf8-aef7-cc87f1951020';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('999546a5-7621-5bdc-9b0a-5d83a938f8ad', '33d35b4f-c3f7-5bf8-aef7-cc87f1951020', 'A', 'Glue ear', false, 0),
  ('162c230d-27b1-5ab6-b4e4-7119169b96b8', '33d35b4f-c3f7-5bf8-aef7-cc87f1951020', 'B', 'Cholesteatoma', false, 1),
  ('3607059c-bed1-5333-879c-ab15dc1a398d', '33d35b4f-c3f7-5bf8-aef7-cc87f1951020', 'C', 'Parotitis', false, 2),
  ('4866b8ec-5467-54c7-8e19-a30f7d1ac477', '33d35b4f-c3f7-5bf8-aef7-cc87f1951020', 'D', 'Otitis externa', false, 3),
  ('7899055e-56c3-5b40-acd2-604f412b7037', '33d35b4f-c3f7-5bf8-aef7-cc87f1951020', 'E', 'Acute mastoiditis', true, 4);

-- Q118
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('a69fdcbf-f99b-5671-aaef-68073cb0f836', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000009', 'sba', 'A 7 year old girl has had a squint since age 4 that she was never treated for. Her vision in that eye is 6/36 even with glasses. What is the MOST likely cause of her reduced vision?', 'Amblyopia is reduced vision from abnormal visual development (squint, refractive error, cataract). Treatment works best before age 7-8 (glasses, patching, atropine). Vision screening at age 4-5 detects it.', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v6')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = 'a69fdcbf-f99b-5671-aaef-68073cb0f836';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('8cf32e34-20bd-58ac-b9a4-f51eafd994b5', 'a69fdcbf-f99b-5671-aaef-68073cb0f836', 'A', 'Amblyopia (lazy eye)', true, 0),
  ('62211c74-af38-5928-b037-0528da11bb12', 'a69fdcbf-f99b-5671-aaef-68073cb0f836', 'B', 'Glaucoma', false, 1),
  ('f7f4d5e9-cdbd-5a72-9575-9758c0ffa9ea', 'a69fdcbf-f99b-5671-aaef-68073cb0f836', 'C', 'Retinal detachment', false, 2),
  ('7ce0dcd2-2afb-5c50-83e5-c6b0835f343a', 'a69fdcbf-f99b-5671-aaef-68073cb0f836', 'D', 'Optic neuritis', false, 3),
  ('b59c5387-1d8c-5f8e-88e8-4134d61277e3', 'a69fdcbf-f99b-5671-aaef-68073cb0f836', 'E', 'Cataract', false, 4);

-- Q119
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('ec9ebbe3-1cbe-577f-89d9-b1c55a7417d7', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000003', 'sba', 'A 50 year old man has had alcohol-related cirrhosis. He has gross ascites. What is the SINGLE most appropriate first-line diuretic?', 'Ascites in cirrhosis: salt restriction, spironolactone (aldosterone antagonist), adding furosemide if needed. Large-volume paracentesis for tense ascites, with IV albumin when over 5 litres removed. Refractory ascites: TIPSS or liver transplant. Avoid NSAIDs.', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v6')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = 'ec9ebbe3-1cbe-577f-89d9-b1c55a7417d7';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('095f7b8e-cec8-571a-bac1-9d5b77c87e58', 'ec9ebbe3-1cbe-577f-89d9-b1c55a7417d7', 'A', 'Spironolactone (with a low-salt diet), adding furosemide if needed', true, 0),
  ('97cd49f1-0421-5f47-97f5-02e5dd348dc0', 'ec9ebbe3-1cbe-577f-89d9-b1c55a7417d7', 'B', 'Furosemide alone', false, 1),
  ('17d6b4bf-cfc7-5eac-a7e5-48d53c76c70f', 'ec9ebbe3-1cbe-577f-89d9-b1c55a7417d7', 'C', 'Mannitol', false, 2),
  ('641ec60e-8414-59e1-8f89-a534c906e012', 'ec9ebbe3-1cbe-577f-89d9-b1c55a7417d7', 'D', 'Bendroflumethiazide', false, 3),
  ('a40b37df-8bf3-5d64-9c48-e84b00912251', 'ec9ebbe3-1cbe-577f-89d9-b1c55a7417d7', 'E', 'Acetazolamide', false, 4);

-- Q120
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('1f901325-2ee0-51b1-81c2-bf3d2c61f515', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000003', 'sba', 'A 55 year old man has had a sudden onset of vomiting blood after a bout of retching from heavy drinking. He is stable. Endoscopy shows a small linear tear at the gastro-oesophageal junction that has stopped bleeding. What is the SINGLE most likely diagnosis?', 'Mallory-Weiss tears are mucosal tears at the GOJ from retching or vomiting. Bleeding usually stops spontaneously. Management: supportive and PPI. Boerhaave is a full-thickness rupture with chest pain and surgical emphysema.', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v6')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = '1f901325-2ee0-51b1-81c2-bf3d2c61f515';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('54f45841-ecde-519c-b904-5dd894659c31', '1f901325-2ee0-51b1-81c2-bf3d2c61f515', 'A', 'Peptic ulcer', false, 0),
  ('a208c913-9601-5f88-b322-b52931e07304', '1f901325-2ee0-51b1-81c2-bf3d2c61f515', 'B', 'Boerhaave syndrome', false, 1),
  ('399a602b-871e-58fe-bb6e-c1f5e399c705', '1f901325-2ee0-51b1-81c2-bf3d2c61f515', 'C', 'Mallory-Weiss tear', true, 2),
  ('ebaa26b8-ee3b-50e0-ba0f-b11bba9e8d5c', '1f901325-2ee0-51b1-81c2-bf3d2c61f515', 'D', 'Oesophageal cancer', false, 3),
  ('e0e8d04e-2d8e-503f-ac6c-276eb4800f44', '1f901325-2ee0-51b1-81c2-bf3d2c61f515', 'E', 'Oesophageal varices', false, 4);

-- Q121
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('9a364c77-2a93-51e9-ae76-f376e63b495b', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000003', 'sba', 'A 65 year old man has had an upper GI bleed. His Glasgow-Blatchford score is 0. He is stable. What is the SINGLE most appropriate management?', 'NICE CG141: patients with a pre-endoscopy Glasgow-Blatchford score of 0 can be considered for early discharge. Unstable patients need endoscopy immediately after resuscitation; others within 24 hours. Rockall score after endoscopy predicts rebleeding and mortality.', null, true, true, jsonb_build_object('source', 'plab1-xlsx-v6', 'guidelines_text', 'NICE CG141')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = '9a364c77-2a93-51e9-ae76-f376e63b495b';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('f3e31dbc-24ac-5a85-95d1-c053fda236e2', '9a364c77-2a93-51e9-ae76-f376e63b495b', 'A', 'IV PPI for 72 hours', false, 0),
  ('9ab5d468-3065-5177-bd4a-b0cf581c875e', '9a364c77-2a93-51e9-ae76-f376e63b495b', 'B', 'Admit to ICU', false, 1),
  ('08100db3-c9a6-5d0e-8f92-9d120e20e7fb', '9a364c77-2a93-51e9-ae76-f376e63b495b', 'C', 'Consider early discharge with outpatient endoscopy', true, 2),
  ('deefe3e1-2081-5614-89bf-773fcd594089', '9a364c77-2a93-51e9-ae76-f376e63b495b', 'D', 'Blood transfusion', false, 3),
  ('56bcb848-c872-511d-b67d-cc9cc52551f1', '9a364c77-2a93-51e9-ae76-f376e63b495b', 'E', 'Urgent endoscopy within 1 hour', false, 4);

-- Q122
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('a8eccf74-75e1-5335-995f-3592162114c1', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000003', 'sba', 'A 40 year old woman has had nausea, right upper quadrant pain and jaundice. She took a course of co-amoxiclav 4 weeks ago. LFTs show a cholestatic pattern. What is the SINGLE most likely diagnosis?', 'Co-amoxiclav is a common cause of drug-induced cholestatic liver injury, which can appear up to 6 weeks after stopping. It is more common in older people and men. Other causes of cholestasis: flucloxacillin, chlorpromazine, anabolic steroids and the combined pill. Exclude obstruction with ultrasound.', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v6')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = 'a8eccf74-75e1-5335-995f-3592162114c1';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('39ee2de1-b5e0-58eb-a550-4beb46f54dd2', 'a8eccf74-75e1-5335-995f-3592162114c1', 'A', 'Drug-induced cholestatic hepatitis (co-amoxiclav)', true, 0),
  ('26cabbe1-f26c-5d64-a1f6-feeeaf42bec3', 'a8eccf74-75e1-5335-995f-3592162114c1', 'B', 'Hepatitis A', false, 1),
  ('ad61fa00-e50b-58de-a89c-97f923825046', 'a8eccf74-75e1-5335-995f-3592162114c1', 'C', 'Gallstones', false, 2),
  ('a891ae3e-fa73-5788-bfa4-13300b2f0f1f', 'a8eccf74-75e1-5335-995f-3592162114c1', 'D', 'Pancreatic cancer', false, 3),
  ('64016ea6-bad3-559a-ae18-2647d3f3018d', 'a8eccf74-75e1-5335-995f-3592162114c1', 'E', 'Primary biliary cholangitis', false, 4);

-- Q123
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('27da6efd-ece5-5042-b7d2-fc8ce47eb600', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000003', 'sba', 'A 25 year old man has had painless jaundice and dark urine. He is otherwise well. LFTs show conjugated hyperbilirubinaemia with normal enzymes. Liver biopsy shows dark pigment. What is the SINGLE most likely diagnosis?', 'Dubin-Johnson syndrome is a benign autosomal recessive disorder of bilirubin excretion, causing conjugated hyperbilirubinaemia with black liver pigment. Rotor syndrome is similar without pigment. Gilbert''s and Crigler-Najjar cause unconjugated hyperbilirubinaemia.', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v6')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = '27da6efd-ece5-5042-b7d2-fc8ce47eb600';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('079e43a5-bc98-5b82-b8a6-f695be822aab', '27da6efd-ece5-5042-b7d2-fc8ce47eb600', 'A', 'Hepatitis B', false, 0),
  ('d699dbba-e9d0-5f91-8dae-15462acfb376', '27da6efd-ece5-5042-b7d2-fc8ce47eb600', 'B', 'Dubin-Johnson syndrome', true, 1),
  ('16f8cfd7-9601-53d5-a5e7-615b5128bd72', '27da6efd-ece5-5042-b7d2-fc8ce47eb600', 'C', 'Primary sclerosing cholangitis', false, 2),
  ('b97b5453-27d7-5ba3-99f0-93ca4366c26a', '27da6efd-ece5-5042-b7d2-fc8ce47eb600', 'D', 'Crigler-Najjar syndrome', false, 3),
  ('ac623b16-bc68-5abe-b27e-ea9dedce06e3', '27da6efd-ece5-5042-b7d2-fc8ce47eb600', 'E', 'Gilbert''s syndrome', false, 4);

-- Q124
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('a2e30895-c84b-5a57-a731-ec12ca5abdde', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000003', 'sba', 'A 35 year old woman has had a sudden onset of abdominal pain, hepatomegaly and ascites. She takes the combined pill and has polycythaemia vera. What is the SINGLE most likely diagnosis?', 'Budd-Chiari syndrome is hepatic venous outflow obstruction, causing abdominal pain, hepatomegaly and ascites. Causes: myeloproliferative neoplasms, combined pill, pregnancy, thrombophilias and PNH. Doppler ultrasound confirms. Treatment: anticoagulation, angioplasty, TIPSS or transplant.', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v6')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = 'a2e30895-c84b-5a57-a731-ec12ca5abdde';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('c0273c7a-2ef7-57a2-a6ba-4f881104be31', 'a2e30895-c84b-5a57-a731-ec12ca5abdde', 'A', 'Cholecystitis', false, 0),
  ('26161860-a242-5747-9007-66b13ccdd25d', 'a2e30895-c84b-5a57-a731-ec12ca5abdde', 'B', 'Acute hepatitis', false, 1),
  ('11cd825d-4877-5c05-809e-50e9db89fb78', 'a2e30895-c84b-5a57-a731-ec12ca5abdde', 'C', 'Budd-Chiari syndrome (hepatic vein thrombosis)', true, 2),
  ('3eb55ff1-c1dc-513d-aeda-9bf7599912da', 'a2e30895-c84b-5a57-a731-ec12ca5abdde', 'D', 'Pancreatitis', false, 3),
  ('e64c187a-7ef1-521b-9232-287cfa2b2a86', 'a2e30895-c84b-5a57-a731-ec12ca5abdde', 'E', 'Portal vein thrombosis', false, 4);

-- Q125
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('c61aa22e-6e3b-51e6-aecf-d32baaa19769', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000003', 'sba', 'A 60 year old woman has had diarrhoea, weight loss and arthralgia for months. Duodenal biopsy shows PAS-positive macrophages. What is the SINGLE most likely diagnosis?', 'Whipple''s disease (Tropheryma whipplei) causes malabsorption, weight loss, arthralgia, fever, lymphadenopathy and neurological signs. Small bowel biopsy shows PAS-positive macrophages. Treatment: prolonged antibiotics (ceftriaxone then co-trimoxazole for a year).', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v6')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = 'c61aa22e-6e3b-51e6-aecf-d32baaa19769';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('6b9dbc1a-3c26-56ca-a148-8180fc071998', 'c61aa22e-6e3b-51e6-aecf-d32baaa19769', 'A', 'Whipple''s disease', true, 0),
  ('381de601-eaf6-5d9a-bd38-a219df27208b', 'c61aa22e-6e3b-51e6-aecf-d32baaa19769', 'B', 'Crohn''s disease', false, 1),
  ('4f9cea1a-e41a-5b66-83b5-b2f76450e306', 'c61aa22e-6e3b-51e6-aecf-d32baaa19769', 'C', 'Coeliac disease', false, 2),
  ('7d0ace33-6cd9-5eda-89af-7b185d2fd38f', 'c61aa22e-6e3b-51e6-aecf-d32baaa19769', 'D', 'Lymphoma', false, 3),
  ('b602cfdc-288c-5cdc-82ba-18060ad130d3', 'c61aa22e-6e3b-51e6-aecf-d32baaa19769', 'E', 'Giardiasis', false, 4);

-- Q126
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('5bea92ae-da24-51a4-ad0b-aa8a9519287f', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000003', 'sba', 'A 50 year old man has a large liver mass with a single lesion. CT shows a ''central scar''. He is well. LFTs are normal. What is the SINGLE most likely diagnosis?', 'FNH is a benign liver lesion, commonest in young women, with a central scar on imaging. No treatment needed. Hepatocellular adenomas are linked to the combined pill and anabolic steroids and may bleed or become malignant.', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v6')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = '5bea92ae-da24-51a4-ad0b-aa8a9519287f';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('1b65112c-a9b9-5413-a15d-c5b11c421273', '5bea92ae-da24-51a4-ad0b-aa8a9519287f', 'A', 'Haemangioma', false, 0),
  ('7b882e00-9523-5136-b77f-e25b11f36807', '5bea92ae-da24-51a4-ad0b-aa8a9519287f', 'B', 'Focal nodular hyperplasia', true, 1),
  ('f7478b1c-5c26-5561-ac3f-8dd2f61a154f', '5bea92ae-da24-51a4-ad0b-aa8a9519287f', 'C', 'Metastases', false, 2),
  ('997fde4b-3758-51f5-9d26-8541fb7779a0', '5bea92ae-da24-51a4-ad0b-aa8a9519287f', 'D', 'Liver abscess', false, 3),
  ('3e9df795-a3de-5bca-9eb2-2b168806d462', '5bea92ae-da24-51a4-ad0b-aa8a9519287f', 'E', 'Hepatocellular carcinoma', false, 4);

-- Q127
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('0bac8692-d026-5a6f-9ad5-a021dd6c3d27', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000004', 'sba', 'A 40 year old woman has a TSH of 8.5 mU/L and a normal free T4 on two occasions. She has no symptoms. TPO antibodies are positive. What is the SINGLE most appropriate management?', 'Subclinical hypothyroidism: raised TSH with normal free T4. Consider treatment if TSH is 10 or more on 2 occasions, or symptomatic under 65 with TSH 4-10 (trial of levothyroxine). Positive TPO antibodies increase the risk of progression. In pregnancy, treat earlier.', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v6')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = '0bac8692-d026-5a6f-9ad5-a021dd6c3d27';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('eed11c80-cb4f-55e8-b2b4-26249597c043', '0bac8692-d026-5a6f-9ad5-a021dd6c3d27', 'A', 'Carbimazole', false, 0),
  ('dba1d536-ab10-500c-bff1-d5fcbb9834d2', '0bac8692-d026-5a6f-9ad5-a021dd6c3d27', 'B', 'Start levothyroxine at full dose', false, 1),
  ('81f522d6-7dba-5600-a361-1a4b48493325', '0bac8692-d026-5a6f-9ad5-a021dd6c3d27', 'C', 'Radioiodine', false, 2),
  ('72af5e32-c4bc-58dc-b913-8a0ce1c09ad6', '0bac8692-d026-5a6f-9ad5-a021dd6c3d27', 'D', 'No follow-up', false, 3),
  ('56cc05b6-4e48-5825-9ffc-3ddb49c037bd', '0bac8692-d026-5a6f-9ad5-a021dd6c3d27', 'E', 'Monitor TFTs annually; consider levothyroxine if TSH rises above 10 or symptoms develop', true, 4);

-- Q128
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('aef8f218-021c-5092-8b1b-2041278adb29', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000004', 'sba', 'A 28 year old woman has had palpitations and weight loss. She takes thyroxine that she got from a friend to lose weight. TSH is suppressed, T4 is raised, and thyroglobulin is low. What is the SINGLE most likely diagnosis?', 'Factitious thyrotoxicosis: low radioiodine uptake and low thyroglobulin (thyroglobulin is raised in thyroiditis and Graves''). Manage by stopping the thyroxine and addressing the underlying reason.', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v6')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = 'aef8f218-021c-5092-8b1b-2041278adb29';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('bd18053c-d02f-5a5d-8a5d-32113c0424ec', 'aef8f218-021c-5092-8b1b-2041278adb29', 'A', 'Graves'' disease', false, 0),
  ('a4bb19d5-9000-566a-afb7-67fd458b60eb', 'aef8f218-021c-5092-8b1b-2041278adb29', 'B', 'Factitious thyrotoxicosis (exogenous thyroxine)', true, 1),
  ('5a03e58c-7128-5cd9-a0e5-bd5c66a4b02f', 'aef8f218-021c-5092-8b1b-2041278adb29', 'C', 'Toxic adenoma', false, 2),
  ('19a943f4-9527-5d93-9f20-6da280b8910c', 'aef8f218-021c-5092-8b1b-2041278adb29', 'D', 'Struma ovarii', false, 3),
  ('04d1dee4-4b88-59ff-8c39-e67c30f1b20e', 'aef8f218-021c-5092-8b1b-2041278adb29', 'E', 'Subacute thyroiditis', false, 4);

-- Q129
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('ea8d1a10-a3f5-5d22-9155-751201621566', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000004', 'sba', 'A 50 year old man has had diabetes for 10 years. He has had painful foot ulcers and erectile dysfunction. He has postural hypotension and early satiety. What is the SINGLE most likely cause of these symptoms?', 'Autonomic neuropathy in diabetes causes postural hypotension, gastroparesis, erectile dysfunction, bladder dysfunction, sweating abnormalities, resting tachycardia and hypoglycaemia unawareness. Good glucose control may slow progression.', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v6')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = 'ea8d1a10-a3f5-5d22-9155-751201621566';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('130c0b51-240c-5fb5-8f51-10e9a59c7bf6', 'ea8d1a10-a3f5-5d22-9155-751201621566', 'A', 'Hypothyroidism', false, 0),
  ('8038befd-e3c5-550c-b7ef-0d7f89f6daab', 'ea8d1a10-a3f5-5d22-9155-751201621566', 'B', 'Addison''s disease', false, 1),
  ('2689b1b3-6288-56a1-b8e5-4b337e1974bc', 'ea8d1a10-a3f5-5d22-9155-751201621566', 'C', 'Heart failure', false, 2),
  ('710b716a-eb8a-5b94-8406-9c1317974fd2', 'ea8d1a10-a3f5-5d22-9155-751201621566', 'D', 'Diabetic autonomic neuropathy', true, 3),
  ('0c3ce44e-8c4d-5f64-ae00-3cbc09a9b2cb', 'ea8d1a10-a3f5-5d22-9155-751201621566', 'E', 'Peripheral arterial disease alone', false, 4);

-- Q130
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('d00ef804-1b2c-558f-968b-f6a21e41e4c6', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000004', 'sba', 'A 65 year old man with type 2 diabetes on insulin is admitted with confusion. His capillary glucose is ''HI'', and ketones are 0.4. Osmolality is 345. What is the SINGLE most likely diagnosis?', 'HHS: severe hyperglycaemia, high osmolality, dehydration and minimal ketosis. Calculated osmolality = 2Na + glucose + urea. Treat with cautious IV 0.9% saline, aiming for a gradual fall in osmolality and glucose. Insulin only if ketones are raised or glucose stops falling. Prevent VTE.', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v6')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = 'd00ef804-1b2c-558f-968b-f6a21e41e4c6';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('02290daf-3963-5700-90c2-4dc783582a3a', 'd00ef804-1b2c-558f-968b-f6a21e41e4c6', 'A', 'Alcohol intoxication', false, 0),
  ('067e5b0d-e33f-5b6c-a6ff-2e8474708956', 'd00ef804-1b2c-558f-968b-f6a21e41e4c6', 'B', 'DKA', false, 1),
  ('22391f20-7f7b-5871-bf94-f310f650ec6d', 'd00ef804-1b2c-558f-968b-f6a21e41e4c6', 'C', 'Hyperosmolar hyperglycaemic state', true, 2),
  ('c20f12f6-596f-5306-8926-15d9742cb161', 'd00ef804-1b2c-558f-968b-f6a21e41e4c6', 'D', 'Lactic acidosis', false, 3),
  ('1b95f74a-576f-5baf-aebd-018a992b3b3c', 'd00ef804-1b2c-558f-968b-f6a21e41e4c6', 'E', 'Hypoglycaemia', false, 4);

-- Q131
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('fff69514-0adb-5f0d-acf2-26ddb87e0a24', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000004', 'sba', 'A 35 year old man with type 1 diabetes is admitted for elective surgery. He uses an insulin pump. What is the CORRECT perioperative principle?', 'People with type 1 diabetes must never be without insulin (DKA risk). Short procedures: continue the pump or basal insulin. Longer surgery: VRIII with substrate. Involve the diabetes team. Monitor capillary glucose and ketones.', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v6')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = 'fff69514-0adb-5f0d-acf2-26ddb87e0a24';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('13a64279-f8a7-58eb-b50b-d3cfdb57ddd6', 'fff69514-0adb-5f0d-acf2-26ddb87e0a24', 'A', 'Give double insulin before surgery', false, 0),
  ('8a530ebb-beef-5c0b-84f5-250a4d308ce4', 'fff69514-0adb-5f0d-acf2-26ddb87e0a24', 'B', 'Avoid glucose monitoring', false, 1),
  ('c8f6f347-4e38-51d6-8ee4-54bea80efa14', 'fff69514-0adb-5f0d-acf2-26ddb87e0a24', 'C', 'Switch to oral metformin', false, 2),
  ('b48f1816-5e77-59e7-81c7-36c4eaa1d796', 'fff69514-0adb-5f0d-acf2-26ddb87e0a24', 'D', 'Continue basal insulin (or pump) with a plan from the diabetes team; avoid stopping insulin', true, 3),
  ('ace16ce7-965e-5024-9942-48168febb8fd', 'fff69514-0adb-5f0d-acf2-26ddb87e0a24', 'E', 'Stop all insulin the night before', false, 4);

-- Q132
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('16e9461e-cc2e-5575-94ff-bbe46c929b92', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000004', 'sba', 'A 30 year old woman has fatigue, weight gain and amenorrhoea. Prolactin is mildly raised at 900 mU/L. She takes risperidone. What is the SINGLE most likely cause?', 'Dopamine antagonists (risperidone, haloperidol, metoclopramide, domperidone) raise prolactin, causing galactorrhoea, amenorrhoea and reduced libido. Exclude pregnancy and hypothyroidism. Options: switch to a prolactin-sparing antipsychotic (aripiprazole) under psychiatric advice.', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v6')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = '16e9461e-cc2e-5575-94ff-bbe46c929b92';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('4229047d-c6ee-59f9-a171-6540b7f61ff2', '16e9461e-cc2e-5575-94ff-bbe46c929b92', 'A', 'Antipsychotic-induced hyperprolactinaemia', true, 0),
  ('fc721b0a-fafb-5e0a-bb08-592d4f0c2768', '16e9461e-cc2e-5575-94ff-bbe46c929b92', 'B', 'Hypothyroidism', false, 1),
  ('a170061d-4e65-50fa-8270-d7bdb1881686', '16e9461e-cc2e-5575-94ff-bbe46c929b92', 'C', 'PCOS', false, 2),
  ('974779bb-f531-5251-a611-eb36b2b19d66', '16e9461e-cc2e-5575-94ff-bbe46c929b92', 'D', 'Pregnancy', false, 3),
  ('ccdc6e3e-4508-5280-9176-7bdc4abdd497', '16e9461e-cc2e-5575-94ff-bbe46c929b92', 'E', 'Prolactinoma', false, 4);

-- Q133
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('64d1d0e7-5a6a-51f9-9166-92e570e9afc9', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000004', 'sba', 'A 55 year old man has had type 2 diabetes for 5 years. His HbA1c is 64 mmol/mol on metformin and an SGLT2 inhibitor. His BMI is 37. What is the SINGLE most appropriate additional treatment?', 'NICE NG28: consider a GLP-1 receptor agonist in triple therapy for people with BMI 35 or more (adjusted for ethnicity) or where weight loss would benefit other comorbidities. Continue only if HbA1c falls by 11 mmol/mol and weight by 3% at 6 months. Tirzepatide is also an option.', null, true, true, jsonb_build_object('source', 'plab1-xlsx-v6', 'guidelines_text', 'NICE NG28')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = '64d1d0e7-5a6a-51f9-9166-92e570e9afc9';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('df344abb-0b25-562b-9a3f-9e3d0438df1f', '64d1d0e7-5a6a-51f9-9166-92e570e9afc9', 'A', 'A GLP-1 receptor agonist (e.g. semaglutide), given his BMI', true, 0),
  ('88ec943a-7167-5bd5-814d-1c83d2c976dc', '64d1d0e7-5a6a-51f9-9166-92e570e9afc9', 'B', 'Pioglitazone', false, 1),
  ('279590e6-239a-5ca9-ad67-8e86f24d0815', '64d1d0e7-5a6a-51f9-9166-92e570e9afc9', 'C', 'Acarbose', false, 2),
  ('26f1afb2-1ab6-58a3-9245-a00fa8b98912', '64d1d0e7-5a6a-51f9-9166-92e570e9afc9', 'D', 'Insulin first', false, 3),
  ('f7a22a10-ff42-5510-ad7e-e761a030bb9d', '64d1d0e7-5a6a-51f9-9166-92e570e9afc9', 'E', 'Sulfonylurea first', false, 4);

-- Q134
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('3ac5a2de-8bb2-558f-af3f-c143c9169c64', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000004', 'sba', 'A 30 year old woman has had type 1 diabetes for 15 years. Her annual review shows an ACR of 5 mg/mmol on two occasions, normal BP and normal eGFR. What is the SINGLE most appropriate management?', 'Diabetic kidney disease: an ACR over 3 mg/mmol indicates albuminuria. In type 1 diabetes, offer an ACE inhibitor or ARB even with normal BP, titrated to the maximum dose. Optimise glucose, BP and lipids. Annual ACR screening.', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v6')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = '3ac5a2de-8bb2-558f-af3f-c143c9169c64';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('828b51bc-ff8c-5e9a-a0e9-066e16cf494a', '3ac5a2de-8bb2-558f-af3f-c143c9169c64', 'A', 'No action needed', false, 0),
  ('d5cd9fb8-ce61-503b-9518-4f4c5e7b302a', '3ac5a2de-8bb2-558f-af3f-c143c9169c64', 'B', 'Repeat test in 5 years', false, 1),
  ('720b5143-25f1-5e42-99a4-78e0e5fd73a3', '3ac5a2de-8bb2-558f-af3f-c143c9169c64', 'C', 'Start an ACE inhibitor (or ARB) and optimise glucose control', true, 2),
  ('8a3248fa-d005-529c-8e86-5fc4de2ec3a8', '3ac5a2de-8bb2-558f-af3f-c143c9169c64', 'D', 'Start a calcium channel blocker', false, 3),
  ('390b495b-f3d1-53aa-a97a-9682d3342f83', '3ac5a2de-8bb2-558f-af3f-c143c9169c64', 'E', 'Start spironolactone', false, 4);

-- Q135
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('5bf6f564-259c-55e9-bbc5-433eb933c726', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000002', 'sba', 'A 50 year old man has had progressive breathlessness. He worked in a shipyard 30 years ago. CXR shows lower-zone reticular shadowing. Spirometry shows a restrictive pattern. What is the SINGLE most likely diagnosis?', 'Asbestosis is lower-zone pulmonary fibrosis after heavy asbestos exposure, with latency of 20 years or more. It increases lung cancer risk (with smoking strongly multiplying the risk). Management is supportive. Industrial compensation may be available.', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v6')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = '5bf6f564-259c-55e9-bbc5-433eb933c726';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('f979c7d9-3cd0-560d-941b-f13280c34b7a', '5bf6f564-259c-55e9-bbc5-433eb933c726', 'A', 'Sarcoidosis', false, 0),
  ('7ec9918b-b553-52b1-9d4b-a16be9db4e65', '5bf6f564-259c-55e9-bbc5-433eb933c726', 'B', 'Coal workers'' pneumoconiosis', false, 1),
  ('51ab8fe4-0d52-5cec-acf2-c3e06000dc01', '5bf6f564-259c-55e9-bbc5-433eb933c726', 'C', 'Asbestosis', true, 2),
  ('6ca48d74-f3f5-50df-aa07-d9e2adbfb973', '5bf6f564-259c-55e9-bbc5-433eb933c726', 'D', 'Mesothelioma', false, 3),
  ('3e016559-8225-5861-91d7-0018d2d0d17b', '5bf6f564-259c-55e9-bbc5-433eb933c726', 'E', 'Silicosis', false, 4);

-- Q136
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('e31db513-3e46-589f-8240-bcf4268887fa', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000002', 'sba', 'A 20 year old man has had recurrent chest infections, sinusitis and infertility. Chest X-ray shows dextrocardia. What is the SINGLE most likely diagnosis?', 'Primary ciliary dyskinesia (autosomal recessive) causes defective ciliary movement: bronchiectasis, chronic sinusitis, otitis media, subfertility and situs inversus in about half (Kartagener''s syndrome). Diagnose with nasal nitric oxide and ciliary studies.', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v6')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = 'e31db513-3e46-589f-8240-bcf4268887fa';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('71b6fc55-6a2a-55e1-9e00-bded855cba9d', 'e31db513-3e46-589f-8240-bcf4268887fa', 'A', 'Asthma', false, 0),
  ('f6cc3dd0-dfee-5ba4-9a50-1fd16960b73e', 'e31db513-3e46-589f-8240-bcf4268887fa', 'B', 'Primary ciliary dyskinesia (Kartagener''s syndrome)', true, 1),
  ('3cf937eb-a806-502c-ad2a-02e71016eb22', 'e31db513-3e46-589f-8240-bcf4268887fa', 'C', 'Common variable immunodeficiency', false, 2),
  ('70887004-2bd0-5233-b5ec-c85c9e8adb3c', 'e31db513-3e46-589f-8240-bcf4268887fa', 'D', 'Cystic fibrosis', false, 3),
  ('2a5b7b09-19cd-5931-b9ff-3ad5bfb2b1be', 'e31db513-3e46-589f-8240-bcf4268887fa', 'E', 'Alpha-1 antitrypsin deficiency', false, 4);

-- Q137
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('088c2d71-b28e-50e5-b525-0bd301a5a548', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000002', 'sba', 'A 30 year old man has had massive haemoptysis of over 500 mL in 24 hours. He has bronchiectasis. What is the SINGLE most appropriate management?', 'Massive haemoptysis: position with the bleeding lung down to protect the other lung, secure the airway (selective intubation), resuscitate, and correct coagulopathy. Bronchial artery embolisation is first-line; surgery if it fails.', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v6')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = '088c2d71-b28e-50e5-b525-0bd301a5a548';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('4e469585-73ec-516d-955f-2d6af26983f2', '088c2d71-b28e-50e5-b525-0bd301a5a548', 'A', 'Chest physiotherapy', false, 0),
  ('5a0ad2ed-1d96-5e3b-85ab-e417a5f8d0a7', '088c2d71-b28e-50e5-b525-0bd301a5a548', 'B', 'Lie on the unaffected side', false, 1),
  ('57c4bc19-55d4-5c95-bc78-d9de70fa0016', '088c2d71-b28e-50e5-b525-0bd301a5a548', 'C', 'Give anticoagulation', false, 2),
  ('6278f4a7-2fe3-554b-aea7-7800e14ae8c7', '088c2d71-b28e-50e5-b525-0bd301a5a548', 'D', 'Discharge home', false, 3),
  ('78645207-0df4-5d21-aa0b-e39115edc24d', '088c2d71-b28e-50e5-b525-0bd301a5a548', 'E', 'Lie on the side of the bleeding lung, secure airway, resuscitate, give tranexamic acid and arrange bronchial artery embolisation', true, 4);

-- Q138
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('65633292-0036-51bc-a12c-7b05046b1a85', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000002', 'sba', 'A 55 year old woman has had breathlessness and a dry cough. She has had rheumatoid arthritis for 15 years. CT shows interstitial lung disease with a UIP pattern. What is the SINGLE most likely diagnosis?', 'RA can cause interstitial lung disease (UIP or NSIP pattern), pleural effusions, rheumatoid nodules, bronchiectasis and Caplan''s syndrome. Drugs (methotrexate, leflunomide) can also cause lung disease. Progressive fibrosis may be treated with antifibrotics.', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v6')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = '65633292-0036-51bc-a12c-7b05046b1a85';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('b9c9b01e-d636-5093-800f-58cca177f0b4', '65633292-0036-51bc-a12c-7b05046b1a85', 'A', 'Rheumatoid arthritis-associated interstitial lung disease', true, 0),
  ('c97c561d-feb6-567a-b3a7-c2e37cce8295', '65633292-0036-51bc-a12c-7b05046b1a85', 'B', 'Idiopathic pulmonary fibrosis', false, 1),
  ('ff74861b-2fa9-5ae4-8e98-6144bf926018', '65633292-0036-51bc-a12c-7b05046b1a85', 'C', 'Sarcoidosis', false, 2),
  ('2da1f7ce-0488-5c93-a215-5b5c373c8f4b', '65633292-0036-51bc-a12c-7b05046b1a85', 'D', 'Methotrexate pneumonitis only', false, 3),
  ('a943c8f9-7370-57c7-a8ca-d98dbe76d358', '65633292-0036-51bc-a12c-7b05046b1a85', 'E', 'Asbestosis', false, 4);

-- Q139
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('319f0478-3e13-5b00-af48-b448392d6f5e', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000010', 'sba', 'A 50 year old man has had a fever and a painful red eye with a rash after a skiing trip. He had a tick bite in Austria. He has headache and confusion. What is the SINGLE most likely diagnosis?', 'Tick-borne encephalitis (a flavivirus) occurs in central and eastern Europe and Scandinavia. Biphasic illness: flu-like then meningoencephalitis. Supportive treatment. Vaccine available for travellers at risk.', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v6')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = '319f0478-3e13-5b00-af48-b448392d6f5e';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('3ba0ea9b-1ab1-5397-8e12-8fb6727a649b', '319f0478-3e13-5b00-af48-b448392d6f5e', 'A', 'Bacterial meningitis', false, 0),
  ('c5f21083-e4af-57aa-b805-50e3fec069ab', '319f0478-3e13-5b00-af48-b448392d6f5e', 'B', 'Herpes encephalitis', false, 1),
  ('0babc716-d438-553b-a20d-1c0d44da0242', '319f0478-3e13-5b00-af48-b448392d6f5e', 'C', 'Tick-borne encephalitis', true, 2),
  ('b06900f9-2bc4-5c2e-907e-d92e506c92ce', '319f0478-3e13-5b00-af48-b448392d6f5e', 'D', 'Lyme disease only', false, 3),
  ('49c44e33-9318-5202-a7d9-fdf4245404a1', '319f0478-3e13-5b00-af48-b448392d6f5e', 'E', 'Malaria', false, 4);

-- Q140
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('48ec0b9e-c1f9-5803-a1e8-9b5c59223280', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000010', 'sba', 'A 30 year old woman is 20 weeks pregnant. She has had contact with her nephew who has measles. She does not know if she is immune. What is the SINGLE most appropriate management?', 'Measles in pregnancy increases the risk of miscarriage, preterm birth and severe maternal illness. Non-immune pregnant contacts can be given HNIG within 6 days of exposure. MMR is a live vaccine and contraindicated in pregnancy.', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v6')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = '48ec0b9e-c1f9-5803-a1e8-9b5c59223280';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('e05318e7-0e8c-5413-aa45-51687a1d0941', '48ec0b9e-c1f9-5803-a1e8-9b5c59223280', 'A', 'Terminate the pregnancy', false, 0),
  ('030ad8e9-8e4d-5598-a3f4-644c39c3827b', '48ec0b9e-c1f9-5803-a1e8-9b5c59223280', 'B', 'Give aciclovir', false, 1),
  ('d899cfe0-11f4-52fc-8a7c-07e0da9ce15f', '48ec0b9e-c1f9-5803-a1e8-9b5c59223280', 'C', 'Check measles IgG; if not immune, give human normal immunoglobulin (HNIG) within 6 days', true, 2),
  ('3cb0b663-9ed1-556d-bf14-5191d092d149', '48ec0b9e-c1f9-5803-a1e8-9b5c59223280', 'D', 'No action', false, 3),
  ('9c6860bc-893b-5af0-8a24-dce27ce53896', '48ec0b9e-c1f9-5803-a1e8-9b5c59223280', 'E', 'Give MMR vaccine', false, 4);

-- Q141
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('0bbe4f7d-d23d-5464-b225-d4bb8aed24ea', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000010', 'sba', 'A 45 year old man has had a cough and fever. He has HIV with a CD4 count of 30. He has blurred vision. Fundoscopy shows haemorrhages and white exudates (''pizza pie'' retina). What is the SINGLE most likely diagnosis?', 'CMV retinitis occurs with CD4 below 50, causing floaters and visual loss, with haemorrhagic necrotising retinitis. Treatment: ganciclovir or valganciclovir, and starting ART. Untreated, it leads to blindness.', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v6')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = '0bbe4f7d-d23d-5464-b225-d4bb8aed24ea';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('00eb3dc6-50aa-5a82-b3db-e9fa5fe59221', '0bbe4f7d-d23d-5464-b225-d4bb8aed24ea', 'A', 'HIV retinopathy only', false, 0),
  ('da31b6cc-67d5-5d51-bf62-1958d0ff2ba0', '0bbe4f7d-d23d-5464-b225-d4bb8aed24ea', 'B', 'Toxoplasmosis', false, 1),
  ('b3fa2e53-8908-5415-ad84-4dee77cd1191', '0bbe4f7d-d23d-5464-b225-d4bb8aed24ea', 'C', 'CMV retinitis', true, 2),
  ('59dad226-6a42-5bba-aee0-a606a9560a17', '0bbe4f7d-d23d-5464-b225-d4bb8aed24ea', 'D', 'Candida endophthalmitis', false, 3),
  ('d9d7f631-f07a-5cc0-bec2-4a616468e0a0', '0bbe4f7d-d23d-5464-b225-d4bb8aed24ea', 'E', 'Diabetic retinopathy', false, 4);

-- Q142
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('38c89f4a-20c2-5d9c-9fc7-5eacea9057ea', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000010', 'sba', 'A 28 year old man has had a painless ulcer on his arm after a holiday in Central America. It has a raised edge and has been there for months. What is the SINGLE most likely diagnosis?', 'Cutaneous leishmaniasis (sandfly bite) causes a painless ulcer with a raised edge, weeks to months after travel to Latin America, the Middle East or North Africa. Diagnosis: biopsy or PCR. Treatment depends on species and site.', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v6')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = '38c89f4a-20c2-5d9c-9fc7-5eacea9057ea';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('530ce9ea-ed45-56a3-ad03-59c1e2b3e48d', '38c89f4a-20c2-5d9c-9fc7-5eacea9057ea', 'A', 'Cutaneous leishmaniasis', true, 0),
  ('166e70f2-5e86-5d1d-b321-dccadb16abec', '38c89f4a-20c2-5d9c-9fc7-5eacea9057ea', 'B', 'Mycobacterium marinum', false, 1),
  ('69f51d43-7cd6-585f-a412-47780506b723', '38c89f4a-20c2-5d9c-9fc7-5eacea9057ea', 'C', 'Basal cell carcinoma', false, 2),
  ('bfc3810d-bd0e-5648-a93f-5794c58189da', '38c89f4a-20c2-5d9c-9fc7-5eacea9057ea', 'D', 'Syphilis', false, 3),
  ('7b8942db-bade-5084-bee2-e4a2da4664f3', '38c89f4a-20c2-5d9c-9fc7-5eacea9057ea', 'E', 'Pyoderma gangrenosum', false, 4);

-- Q143
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('363c3b8e-1bc5-56af-873e-2c51636ed66a', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000010', 'sba', 'A 30 year old aquarium worker has had a slowly enlarging nodule on his finger that has ulcerated. More nodules have appeared along the arm. What is the SINGLE most likely diagnosis?', 'Mycobacterium marinum is acquired from fish tanks or swimming pools, causing nodules that may spread along lymphatics (sporotrichoid spread). Treatment: prolonged antibiotics (clarithromycin, ethambutol). Sporotrichosis (rose gardeners) has a similar pattern.', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v6')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = '363c3b8e-1bc5-56af-873e-2c51636ed66a';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('9486fd7a-d3c3-5d6a-a887-c3ad6e8474b8', '363c3b8e-1bc5-56af-873e-2c51636ed66a', 'A', 'Cellulitis', false, 0),
  ('4fdd2c74-9cf1-5b4f-a312-444fffd6fae8', '363c3b8e-1bc5-56af-873e-2c51636ed66a', 'B', 'TB', false, 1),
  ('60514e00-f8d0-539e-b298-52a00333ac7b', '363c3b8e-1bc5-56af-873e-2c51636ed66a', 'C', 'Mycobacterium marinum infection (fish tank granuloma)', true, 2),
  ('2a6ae6a6-1312-58d2-8be3-4320534a436a', '363c3b8e-1bc5-56af-873e-2c51636ed66a', 'D', 'Sporotrichosis', false, 3),
  ('6e4803e6-c9c7-580e-a833-5bbe0195e96f', '363c3b8e-1bc5-56af-873e-2c51636ed66a', 'E', 'Leishmaniasis', false, 4);

-- Q144
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('49c4896c-0ba7-536a-b9cd-49fb6a0bfb49', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000010', 'sba', 'A 40 year old man has had abdominal pain and diarrhoea with blood after travel to India. Stool microscopy shows trophozoites containing red cells. He develops a liver abscess. What is the SINGLE most appropriate treatment?', 'Amoebiasis (Entamoeba histolytica) causes dysentery and amoebic liver abscess (single, right lobe, ''anchovy sauce'' pus). Treatment: metronidazole then a luminal agent to clear cysts. Drainage only for large or complicated abscesses.', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v6')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = '49c4896c-0ba7-536a-b9cd-49fb6a0bfb49';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('6f9c0902-69e2-5ece-9925-90d93fdbf3c6', '49c4896c-0ba7-536a-b9cd-49fb6a0bfb49', 'A', 'Albendazole', false, 0),
  ('cb74c0ff-b471-5644-b6e4-43e7d925b132', '49c4896c-0ba7-536a-b9cd-49fb6a0bfb49', 'B', 'No treatment', false, 1),
  ('68d3744e-4441-5905-8d95-4a7842312366', '49c4896c-0ba7-536a-b9cd-49fb6a0bfb49', 'C', 'Surgical drainage only', false, 2),
  ('316fc9d8-bbac-5164-bfd4-0f45997d7041', '49c4896c-0ba7-536a-b9cd-49fb6a0bfb49', 'D', 'Ciprofloxacin', false, 3),
  ('9260b921-a1b3-55bc-895c-ff1096e66a1e', '49c4896c-0ba7-536a-b9cd-49fb6a0bfb49', 'E', 'Metronidazole, followed by a luminal agent (e.g. diloxanide furoate or paromomycin)', true, 4);

-- Q145
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('7c9c42af-786c-5fb1-ab8e-2d97d81c36cc', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000010', 'sba', 'A 6 year old child has had perianal itching, worse at night. Her sister has similar symptoms. What is the SINGLE most appropriate treatment?', 'Threadworm (Enterobius vermicularis) causes perianal itching at night. Treat all household members with mebendazole (single dose, repeated after 2 weeks if needed), with hygiene measures for 6 weeks. In pregnancy and under 6 months, hygiene measures only.', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v6')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = '7c9c42af-786c-5fb1-ab8e-2d97d81c36cc';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('d4bb7619-9486-5b1a-8628-51362a819f18', '7c9c42af-786c-5fb1-ab8e-2d97d81c36cc', 'A', 'No treatment', false, 0),
  ('990ff963-6cfa-5a71-901d-4b3dace99d39', '7c9c42af-786c-5fb1-ab8e-2d97d81c36cc', 'B', 'Antifungal cream', false, 1),
  ('f767e144-00ea-5999-ac00-1a782e859251', '7c9c42af-786c-5fb1-ab8e-2d97d81c36cc', 'C', 'Mebendazole for all household members (over 6 months), with hygiene measures', true, 2),
  ('0b2e7439-6d52-5736-bd6e-52162aac99b1', '7c9c42af-786c-5fb1-ab8e-2d97d81c36cc', 'D', 'Steroid cream', false, 3),
  ('978aa7e1-10e2-5f0f-8d26-1fec3c9d6be4', '7c9c42af-786c-5fb1-ab8e-2d97d81c36cc', 'E', 'Antibiotics', false, 4);

-- Q146
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('e19a817a-3eed-5a7b-a0d2-9bb379de0bd5', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000010', 'sba', 'A 30 year old man has had diarrhoea, weight loss and abdominal pain after eating undercooked pork. He has fever, eyelid swelling and muscle pain with eosinophilia. What is the SINGLE most likely diagnosis?', 'Trichinellosis (Trichinella spiralis from undercooked pork or game) causes GI symptoms, then periorbital oedema, myalgia, fever and eosinophilia. Treatment: albendazole and steroids for severe symptoms.', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v6')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = 'e19a817a-3eed-5a7b-a0d2-9bb379de0bd5';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('02494cf9-7b72-540b-8ba2-1a3047bc2b7b', 'e19a817a-3eed-5a7b-a0d2-9bb379de0bd5', 'A', 'Trichinosis', true, 0),
  ('fcf6a700-41aa-5e95-abe5-1c3d931c98e9', 'e19a817a-3eed-5a7b-a0d2-9bb379de0bd5', 'B', 'Brucellosis', false, 1),
  ('b4609d58-1c36-56a5-a6f9-47a3b965985d', 'e19a817a-3eed-5a7b-a0d2-9bb379de0bd5', 'C', 'Salmonella', false, 2),
  ('e7db8ceb-e60c-5e9d-86b7-cf801419d878', 'e19a817a-3eed-5a7b-a0d2-9bb379de0bd5', 'D', 'Taeniasis', false, 3),
  ('45ec8f1b-c81f-54e7-a5a7-724b14f22521', 'e19a817a-3eed-5a7b-a0d2-9bb379de0bd5', 'E', 'Toxoplasmosis', false, 4);

-- Q147
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('7003ef80-127d-55a7-94de-d2c811842f18', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000010', 'sba', 'A 25 year old man has had headache, fever and neck stiffness. He is alert. CSF shows lymphocytes, normal glucose and mildly raised protein. Enterovirus PCR is positive. What is the SINGLE most appropriate management?', 'Viral meningitis (enteroviruses commonest, also HSV-2 and VZV) is usually self-limiting. CSF: lymphocytes, normal glucose and mildly raised protein. Empirical antibiotics are started until bacterial meningitis is excluded. HSV-2 can cause recurrent meningitis (Mollaret''s).', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v6')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = '7003ef80-127d-55a7-94de-d2c811842f18';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('e6fb3e83-d459-5544-aa88-7f10e3ae02fb', '7003ef80-127d-55a7-94de-d2c811842f18', 'A', 'Neurosurgery', false, 0),
  ('2931f837-5d6c-517f-b25f-7f1fc382b0c2', '7003ef80-127d-55a7-94de-d2c811842f18', 'B', 'IV aciclovir for 3 weeks', false, 1),
  ('c015a191-9671-597c-a225-8b8290a93a02', '7003ef80-127d-55a7-94de-d2c811842f18', 'C', 'Steroids', false, 2),
  ('135a82df-e60d-5aec-9407-da3354b7a6fe', '7003ef80-127d-55a7-94de-d2c811842f18', 'D', 'IV ceftriaxone for 14 days', false, 3),
  ('5fd132a5-5d5d-55f0-88e9-74560f50ad6a', '7003ef80-127d-55a7-94de-d2c811842f18', 'E', 'Supportive care (viral meningitis is usually self-limiting)', true, 4);

-- Q148
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('740e1dc9-1807-54ca-8840-29e3e0604147', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000006', 'sba', 'A 30 year old woman has had progressive weakness of both legs and spasticity. She has had optic neuritis and transverse myelitis. Aquaporin-4 antibodies are positive. What is the SINGLE most likely diagnosis?', 'NMOSD causes severe optic neuritis and longitudinally extensive transverse myelitis, with aquaporin-4 antibodies. It is distinct from MS (some MS drugs worsen it). Treatment: high-dose steroids, plasma exchange and long-term immunosuppression (rituximab, eculizumab, inebilizumab).', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v6')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = '740e1dc9-1807-54ca-8840-29e3e0604147';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('5b4c473b-ecde-5db8-8093-e99e5b0b1f65', '740e1dc9-1807-54ca-8840-29e3e0604147', 'A', 'Multiple sclerosis', false, 0),
  ('e37896ea-c3db-5690-9bfd-36019bac2c8d', '740e1dc9-1807-54ca-8840-29e3e0604147', 'B', 'Guillain-Barré syndrome', false, 1),
  ('bf5b1f36-b3e1-524d-a2a2-1bfd783d39f9', '740e1dc9-1807-54ca-8840-29e3e0604147', 'C', 'Neuromyelitis optica spectrum disorder', true, 2),
  ('195b066c-6018-52cb-afe2-3b9c5b9cfaca', '740e1dc9-1807-54ca-8840-29e3e0604147', 'D', 'Vitamin B12 deficiency', false, 3),
  ('a895ad0d-7412-5e38-a3c9-72ba21f845b1', '740e1dc9-1807-54ca-8840-29e3e0604147', 'E', 'Sarcoidosis', false, 4);

-- Q149
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('f670fac4-cd8a-5285-9a31-6f3bbb835ee1', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000006', 'sba', 'A 75 year old man has had progressive gait unsteadiness and urinary urgency. He has postural hypotension and Parkinsonism with poor response to levodopa. What is the SINGLE most likely diagnosis?', 'MSA is a Parkinson-plus syndrome with autonomic failure (postural hypotension, urinary symptoms, erectile dysfunction), parkinsonism and cerebellar signs. Poor response to levodopa. MRI may show the ''hot cross bun'' sign.', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v6')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = 'f670fac4-cd8a-5285-9a31-6f3bbb835ee1';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('6b04a42d-1a40-53a1-9e0e-88932b7dca3b', 'f670fac4-cd8a-5285-9a31-6f3bbb835ee1', 'A', 'Multiple system atrophy', true, 0),
  ('1d62c96d-0a8b-59a3-9be8-e000ee1c480f', 'f670fac4-cd8a-5285-9a31-6f3bbb835ee1', 'B', 'Lewy body dementia', false, 1),
  ('a72115e1-b9ad-5b95-ae2b-cd9c3e5d46b9', 'f670fac4-cd8a-5285-9a31-6f3bbb835ee1', 'C', 'Normal pressure hydrocephalus', false, 2),
  ('8484a8ab-36e2-5687-a45c-3a203d36e2b1', 'f670fac4-cd8a-5285-9a31-6f3bbb835ee1', 'D', 'Parkinson''s disease', false, 3),
  ('385acf59-3f1d-5036-98cc-4e7f0629f1a8', 'f670fac4-cd8a-5285-9a31-6f3bbb835ee1', 'E', 'Progressive supranuclear palsy', false, 4);

-- Q150
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('7f68f472-c459-5f0f-bfb9-44a5c72eec49', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000006', 'sba', 'A 60 year old woman has had worsening tremor of her chin and jaw, slowness and stiffness. She is started on a drug for nausea and her symptoms worsen. Which drug is MOST likely responsible?', 'Dopamine antagonists that cross the blood-brain barrier (metoclopramide, prochlorperazine, haloperidol) worsen Parkinson''s and can cause drug-induced parkinsonism. Domperidone does not cross the blood-brain barrier and is preferred for nausea in Parkinson''s.', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v6')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = '7f68f472-c459-5f0f-bfb9-44a5c72eec49';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('6bfe9e95-9edc-5226-b247-d4660f4b1a7e', '7f68f472-c459-5f0f-bfb9-44a5c72eec49', 'A', 'Ondansetron', false, 0),
  ('7a2bca5b-8c56-59c2-ae6a-2b7d6476979a', '7f68f472-c459-5f0f-bfb9-44a5c72eec49', 'B', 'Domperidone', false, 1),
  ('73aa95fe-4ee7-5d41-b46b-4f25300d605a', '7f68f472-c459-5f0f-bfb9-44a5c72eec49', 'C', 'Paracetamol', false, 2),
  ('ddb1ab54-e3bb-52ae-ab26-9763039a062f', '7f68f472-c459-5f0f-bfb9-44a5c72eec49', 'D', 'Metoclopramide (dopamine antagonist)', true, 3),
  ('da5cba57-0a97-523c-a347-9c99f0d48a66', '7f68f472-c459-5f0f-bfb9-44a5c72eec49', 'E', 'Cyclizine', false, 4);

-- Q151
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('584b21a8-88a1-5752-b818-84d04edfff48', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000006', 'sba', 'A 35 year old man has had episodes of sudden sleep attacks during the day, and falls without losing consciousness when he laughs. What is the SINGLE most likely diagnosis?', 'Narcolepsy causes excessive daytime sleepiness, cataplexy (sudden muscle weakness triggered by emotion), sleep paralysis and hypnagogic hallucinations. Low CSF orexin (hypocretin). Diagnosis: polysomnography and multiple sleep latency test. Treatment: modafinil, sodium oxybate and pitolisant. Inform DVLA.', null, true, true, jsonb_build_object('source', 'plab1-xlsx-v6', 'guidelines_text', 'DVLA')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = '584b21a8-88a1-5752-b818-84d04edfff48';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('cb24b3ed-b2c0-5c2f-87d4-638341e323ef', '584b21a8-88a1-5752-b818-84d04edfff48', 'A', 'Syncope', false, 0),
  ('34c40ef3-acd3-5051-8cd5-3c520d259110', '584b21a8-88a1-5752-b818-84d04edfff48', 'B', 'Obstructive sleep apnoea', false, 1),
  ('2108d757-8358-5650-9f43-ea32d8d22378', '584b21a8-88a1-5752-b818-84d04edfff48', 'C', 'Epilepsy', false, 2),
  ('f6acc7dd-f4fb-5401-a941-80bf5aa188b2', '584b21a8-88a1-5752-b818-84d04edfff48', 'D', 'Depression', false, 3),
  ('8f096378-0450-5581-9f0a-1925a78bf6d8', '584b21a8-88a1-5752-b818-84d04edfff48', 'E', 'Narcolepsy with cataplexy', true, 4);

-- Q152
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('2b24b541-c387-56cb-a5da-ec8036679c2b', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000006', 'sba', 'A 45 year old woman has had an urge to move her legs at night, relieved by movement and worse in the evening. She has iron deficiency. What is the SINGLE most likely diagnosis and first step?', 'Restless legs syndrome: an urge to move the legs, worse at rest and in the evening, relieved by movement. Associations: iron deficiency, pregnancy, CKD and drugs (antidepressants, antihistamines). Treatment: correct iron, sleep hygiene, then alpha-2-delta ligands or dopamine agonists (risk of augmentation).', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v6')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = '2b24b541-c387-56cb-a5da-ec8036679c2b';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('2db0d535-5e7b-5728-84bc-554ffe7374bb', '2b24b541-c387-56cb-a5da-ec8036679c2b', 'A', 'Cramps; quinine', false, 0),
  ('85f61950-3871-5ed4-a0b7-7cd7ada74a80', '2b24b541-c387-56cb-a5da-ec8036679c2b', 'B', 'Parkinson''s disease; levodopa', false, 1),
  ('151c0e5f-6456-52f2-b75c-8ee9c4288c87', '2b24b541-c387-56cb-a5da-ec8036679c2b', 'C', 'Restless legs syndrome; correct iron deficiency (ferritin target over 75)', true, 2),
  ('803fd0ba-0ae6-5b78-b80c-bdd31f0b5648', '2b24b541-c387-56cb-a5da-ec8036679c2b', 'D', 'Akathisia; propranolol', false, 3),
  ('c86607c0-b4ff-5e0b-b536-3b2b15d3ef6d', '2b24b541-c387-56cb-a5da-ec8036679c2b', 'E', 'Peripheral neuropathy; gabapentin', false, 4);

-- Q153
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('10110030-261a-5727-97e1-d1095e71cd24', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000006', 'sba', 'A 25 year old woman has had a sudden onset of weakness of both legs after a stressful event. Examination shows inconsistent weakness, a positive Hoover''s sign and normal reflexes. MRI is normal. What is the SINGLE most likely diagnosis?', 'Functional neurological disorder causes genuine symptoms (weakness, sensory loss, seizures) with positive clinical signs of inconsistency (Hoover''s sign) rather than diagnosis by exclusion. It is not feigned. Treatment: explanation, physiotherapy and psychological therapy.', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v6')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = '10110030-261a-5727-97e1-d1095e71cd24';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('a0868e82-6693-58b0-8889-81b4f773c232', '10110030-261a-5727-97e1-d1095e71cd24', 'A', 'Spinal cord compression', false, 0),
  ('22b38c4f-3ebe-5e1b-8bfb-05c69597faf6', '10110030-261a-5727-97e1-d1095e71cd24', 'B', 'Malingering', false, 1),
  ('9ce850f1-3d95-51e5-93c6-46a82299016c', '10110030-261a-5727-97e1-d1095e71cd24', 'C', 'Guillain-Barré syndrome', false, 2),
  ('e554b583-b8ea-578c-8ebd-614275c9f505', '10110030-261a-5727-97e1-d1095e71cd24', 'D', 'Multiple sclerosis', false, 3),
  ('591ce0a4-6c89-5a63-b710-ebf63003b86d', '10110030-261a-5727-97e1-d1095e71cd24', 'E', 'Functional neurological disorder', true, 4);

-- Q154
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('7e43f5eb-b005-58c6-b9c5-6a9001a80186', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000005', 'sba', 'A 58 year old man with CKD stage 4 attends with generalised weakness and palpitations. He recently started spironolactone and takes ramipril. His ECG is shown. What is the SINGLE most appropriate immediate treatment?', 'The ECG shows tall, narrow, peaked T waves consistent with hyperkalaemia (here with a long QT from coexisting hypocalcaemia). Give IV calcium immediately when ECG changes are present, then insulin-glucose and nebulised salbutamol, and stop ACE inhibitors and spironolactone. Treat the cause and remove potassium (binders or dialysis).', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v6', 'image_url', 'https://commons.wikimedia.org/wiki/Special:FilePath/Combined_hyperkalemia_and_hypocalcemia.png')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = '7e43f5eb-b005-58c6-b9c5-6a9001a80186';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('b4cbf4bc-7740-5b81-8bde-ed510eb4ae38', '7e43f5eb-b005-58c6-b9c5-6a9001a80186', 'A', 'Observe and repeat bloods in 6 hours', false, 0),
  ('535759f1-fdfb-5105-84fd-860061bfe520', '7e43f5eb-b005-58c6-b9c5-6a9001a80186', 'B', 'IV amiodarone', false, 1),
  ('b0bdec50-5a6f-5398-9483-79e50b1b82b5', '7e43f5eb-b005-58c6-b9c5-6a9001a80186', 'C', 'IV calcium gluconate 10% (30 mL over 5-10 minutes) to stabilise the myocardium', true, 2),
  ('9106e6bb-9639-54cd-b1c7-feb8e8db9d93', '7e43f5eb-b005-58c6-b9c5-6a9001a80186', 'D', 'Oral calcium resonium only', false, 3),
  ('036fcbb1-68ac-5304-af7f-73ecc4247e99', '7e43f5eb-b005-58c6-b9c5-6a9001a80186', 'E', 'IV furosemide', false, 4);

-- Q155
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('842387a1-057e-56fc-ab73-1dfa39518793', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000005', 'sba', 'A 62 year old man on haemodialysis missed two sessions. He feels weak. Bloods show potassium 7.2 mmol/L and adjusted calcium 1.7 mmol/L. His ECG is shown. Which ECG feature in this tracing reflects the LOW calcium?', 'Hypocalcaemia lengthens the ST segment and so prolongs the QT interval. Hyperkalaemia causes tall peaked T waves, then flattened P waves, wide QRS and sine-wave pattern. Both are common in advanced CKD. Missed dialysis is a common cause of severe hyperkalaemia; urgent dialysis is needed.', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v6', 'image_url', 'https://commons.wikimedia.org/wiki/Special:FilePath/Combined_hyperkalemia_and_hypocalcemia.png')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = '842387a1-057e-56fc-ab73-1dfa39518793';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('191a8173-8057-521b-9031-0174db05bb5d', '842387a1-057e-56fc-ab73-1dfa39518793', 'A', 'U waves', false, 0),
  ('df3f209a-da95-5527-aa71-8c179a0e7d6c', '842387a1-057e-56fc-ab73-1dfa39518793', 'B', 'Delta waves', false, 1),
  ('99d39611-47cf-5448-ad2b-810ef676acd4', '842387a1-057e-56fc-ab73-1dfa39518793', 'C', 'Prolonged QT interval due to a long ST segment', true, 2),
  ('c984bda7-9ffe-5391-aaa9-e9d941fc7b75', '842387a1-057e-56fc-ab73-1dfa39518793', 'D', 'Peaked T waves', false, 3),
  ('90ced8e4-c3f3-5484-89e0-f011d8d9b0d9', '842387a1-057e-56fc-ab73-1dfa39518793', 'E', 'ST elevation in V1-V2 with coving', false, 4);

-- Q156
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('f024a9b1-fb71-587a-a4a2-e8966d8bd373', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000006', 'sba', 'An 80 year old man on warfarin is brought in by his daughter. He fell 3 days ago and has become increasingly drowsy. GCS is 11 and his left pupil is larger than his right. His CT head is shown. What is the SINGLE most appropriate management?', 'The CT shows a crescent-shaped subdural haematoma (single arrow) with midline shift (double arrow), indicating mass effect. In an anticoagulated patient with a falling GCS and pupil asymmetry, reverse warfarin immediately and refer for surgical evacuation.', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v6', 'image_url', 'https://commons.wikimedia.org/wiki/Special:FilePath/Trauma_subdural_arrows.jpg')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = 'f024a9b1-fb71-587a-a4a2-e8966d8bd373';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('c1215ece-66b9-5402-9ae5-70ffcd193e0b', 'f024a9b1-fb71-587a-a4a2-e8966d8bd373', 'A', 'Start aspirin', false, 0),
  ('01d7c340-2cfb-56ba-8a03-3c137142c404', 'f024a9b1-fb71-587a-a4a2-e8966d8bd373', 'B', 'Lumbar puncture', false, 1),
  ('40232f35-d7c5-503a-8a8b-df52a11bf286', 'f024a9b1-fb71-587a-a4a2-e8966d8bd373', 'C', 'Reverse anticoagulation (prothrombin complex concentrate and IV vitamin K) and urgent neurosurgical referral for evacuation', true, 2),
  ('22ddfe8a-ee23-5d2f-a01e-11afb49e18a0', 'f024a9b1-fb71-587a-a4a2-e8966d8bd373', 'D', 'Repeat CT in 1 week', false, 3),
  ('39a5d5e8-5425-5d20-bda2-b67a503b9862', 'f024a9b1-fb71-587a-a4a2-e8966d8bd373', 'E', 'Increase warfarin', false, 4);

-- Q157
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('31e9248e-4b97-5516-9e96-5954998ee80f', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000006', 'sba', 'A 72 year old woman who drinks heavily fell down stairs. She has a headache and is confused. Her CT is shown. Which feature on this scan indicates raised intracranial pressure from mass effect?', 'Midline shift indicates mass effect from the haematoma. Subdural haematomas are crescent-shaped and can cross suture lines. Risk factors: older age, alcohol excess, anticoagulation and falls (stretched bridging veins). Midline shift over 5 mm or thickness over 10 mm usually needs surgery.', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v6', 'image_url', 'https://commons.wikimedia.org/wiki/Special:FilePath/Trauma_subdural_arrows.jpg')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = '31e9248e-4b97-5516-9e96-5954998ee80f';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('51c372a4-e40e-5b6f-a2a0-9332e33cfde8', '31e9248e-4b97-5516-9e96-5954998ee80f', 'A', 'Hyperdensity of blood', false, 0),
  ('4e54303d-e8de-5b07-8e41-8af7bff5029d', '31e9248e-4b97-5516-9e96-5954998ee80f', 'B', 'Skull fracture', false, 1),
  ('52813f9d-7b81-58f1-b024-59eb1e91bd20', '31e9248e-4b97-5516-9e96-5954998ee80f', 'C', 'Crescent shape of the collection', false, 2),
  ('ea36edfe-7445-5b3d-ba0d-0220c2870a3c', '31e9248e-4b97-5516-9e96-5954998ee80f', 'D', 'Normal ventricles', false, 3),
  ('1275f935-83bb-5aa1-9a33-48fe82409d48', '31e9248e-4b97-5516-9e96-5954998ee80f', 'E', 'Midline shift of the brain away from the collection', true, 4);

-- Q158
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('3b82339c-7208-5ab5-8e99-f11137ab954f', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000006', 'sba', 'A 22 year old man was hit on the side of the head by a cricket ball. He was briefly knocked out, then felt fine for an hour, then became drowsy with vomiting. His CT is shown. What is the SINGLE most likely source of bleeding?', 'The CT shows a biconvex (lens-shaped) hyperdense collection typical of an extradural haematoma. It is usually caused by a temporal bone fracture tearing the middle meningeal artery, with a lucid interval. It needs urgent neurosurgical evacuation.', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v6', 'image_url', 'https://commons.wikimedia.org/wiki/Special:FilePath/Epidural_hematoma.png')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = '3b82339c-7208-5ab5-8e99-f11137ab954f';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('4e2355c1-6aa1-597b-8468-447653c2b1ec', '3b82339c-7208-5ab5-8e99-f11137ab954f', 'A', 'Bridging veins', false, 0),
  ('59924fd8-c62a-525c-9df1-2762a115728a', '3b82339c-7208-5ab5-8e99-f11137ab954f', 'B', 'Berry aneurysm', false, 1),
  ('7fd31115-0c1a-58cc-856e-70884c70b637', '3b82339c-7208-5ab5-8e99-f11137ab954f', 'C', 'Cerebral cortex capillaries', false, 2),
  ('66d296a7-04bc-5212-8e0f-8b0e04bb1100', '3b82339c-7208-5ab5-8e99-f11137ab954f', 'D', 'Middle meningeal artery', true, 3),
  ('f68222a4-f5dd-5050-a100-f8e0eb06b8ef', '3b82339c-7208-5ab5-8e99-f11137ab954f', 'E', 'Vertebral artery', false, 4);

-- Q159
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('c7ad4a84-26a9-5b6c-8da4-fcc066e587c4', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000006', 'sba', 'A 30 year old man had a fall while drunk. He is now GCS 9 with a fixed dilated right pupil. His CT is shown. Why does this collection have a lens shape rather than a crescent shape?', 'Extradural haematomas lie between the skull and dura, so they are limited by suture lines (dura is tightly attached there), giving a biconvex shape. Subdural haematomas lie between the dura and arachnoid, cross sutures and are crescent-shaped. A fixed dilated pupil suggests uncal herniation: urgent craniotomy.', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v6', 'image_url', 'https://commons.wikimedia.org/wiki/Special:FilePath/Epidural_hematoma.png')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = 'c7ad4a84-26a9-5b6c-8da4-fcc066e587c4';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('578360da-7f85-58f4-9f6e-c9ce3ffe7da3', 'c7ad4a84-26a9-5b6c-8da4-fcc066e587c4', 'A', 'It is venous in origin', false, 0),
  ('9f40b45e-fe97-5089-a4a1-1cdd9b3a3cc8', 'c7ad4a84-26a9-5b6c-8da4-fcc066e587c4', 'B', 'It is within the brain tissue', false, 1),
  ('9d195d75-3e73-5f6e-85b5-445beddf4725', 'c7ad4a84-26a9-5b6c-8da4-fcc066e587c4', 'C', 'It lies below the arachnoid', false, 2),
  ('a2bb857d-08c3-51cd-8a8f-1ffcac9d6381', 'c7ad4a84-26a9-5b6c-8da4-fcc066e587c4', 'D', 'It crosses the midline', false, 3),
  ('a5a20bf2-bb63-59c1-8e0d-2d5052301e79', 'c7ad4a84-26a9-5b6c-8da4-fcc066e587c4', 'E', 'It is limited by suture lines, where the dura is firmly attached to the skull', true, 4);

-- Q160
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('b5f3895b-be5f-50ca-a29a-65a634782ddc', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000001', 'sba', 'A 74 year old woman with hypertension has had palpitations and breathlessness for 2 days. HR is 90 and BP 140/85. She has no other illness. Her ECG is shown. Her CHA2DS2-VASc score is 3. What is the SINGLE most appropriate long-term stroke prevention?', 'The ECG shows an irregularly irregular rhythm without P waves (atrial fibrillation). CHA2DS2-VASc 3 (female, age 65-74, hypertension): offer a DOAC. Assess bleeding risk with ORBIT. Antiplatelets are not recommended for stroke prevention in AF.', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v6', 'guidelines_text', 'CHA2DS2-VASc', 'image_url', 'https://commons.wikimedia.org/wiki/Special:FilePath/ECG_Atrial_Fibrillation_90_bpm.jpg')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = 'b5f3895b-be5f-50ca-a29a-65a634782ddc';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('0a486a3c-f0ca-50bb-b8f8-3b0134a1b4e7', 'b5f3895b-be5f-50ca-a29a-65a634782ddc', 'A', 'No anticoagulation', false, 0),
  ('18634b73-ac65-5b40-b9a6-67327375b588', 'b5f3895b-be5f-50ca-a29a-65a634782ddc', 'B', 'Aspirin plus clopidogrel', false, 1),
  ('b0a0e69f-7aed-5738-aba5-d95eaab20361', 'b5f3895b-be5f-50ca-a29a-65a634782ddc', 'C', 'A direct oral anticoagulant (e.g. apixaban)', true, 2),
  ('36dec3e7-921b-5fa4-9faf-d7d0c708c947', 'b5f3895b-be5f-50ca-a29a-65a634782ddc', 'D', 'Aspirin 75 mg', false, 3),
  ('b2032e4c-1a19-51eb-b3a7-eed91d156bf8', 'b5f3895b-be5f-50ca-a29a-65a634782ddc', 'E', 'Clopidogrel', false, 4);

-- Q161
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('8b39f162-e4d5-5b7d-94b9-df45de2bb4f9', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000001', 'sba', 'A 60 year old man with known AF has a controlled ventricular rate on bisoprolol. He asks why his pulse feels irregular. His ECG is shown. Which ECG finding confirms the rhythm?', 'Atrial fibrillation: absent P waves (fibrillatory baseline) and irregularly irregular RR intervals. Atrial flutter shows regular sawtooth waves. Controlled rate (below 110 at rest) is the aim of rate control.', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v6', 'image_url', 'https://commons.wikimedia.org/wiki/Special:FilePath/ECG_Atrial_Fibrillation_90_bpm.jpg')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = '8b39f162-e4d5-5b7d-94b9-df45de2bb4f9';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('2d228014-9f60-5c30-acb5-c851ee04df20', '8b39f162-e4d5-5b7d-94b9-df45de2bb4f9', 'A', 'Regular sawtooth flutter waves', false, 0),
  ('cbdc1def-dce5-584a-be63-2afcb1d6480b', '8b39f162-e4d5-5b7d-94b9-df45de2bb4f9', 'B', 'Progressive PR prolongation', false, 1),
  ('70d65ab0-981a-5ed5-adf5-50f069345106', '8b39f162-e4d5-5b7d-94b9-df45de2bb4f9', 'C', 'Short PR interval with delta waves', false, 2),
  ('b674c434-7072-5d59-8ddb-2094fa0abcc7', '8b39f162-e4d5-5b7d-94b9-df45de2bb4f9', 'D', 'ST elevation', false, 3),
  ('61564b43-cede-5551-964c-1e19cb8d341f', '8b39f162-e4d5-5b7d-94b9-df45de2bb4f9', 'E', 'Absent P waves with irregularly irregular QRS complexes', true, 4);

-- Q162
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('d715e8f5-2eb3-5125-888e-dd43ed37dcce', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000001', 'sba', 'A 55 year old man has crushing central chest pain for 1 hour. He is pale and sweaty. His ECG is shown, with ST elevation in the anterior leads. What is the SINGLE most appropriate immediate action?', 'Anterior ST elevation indicates occlusion of the left anterior descending artery. STEMI within 12 hours: primary PCI if deliverable within 120 minutes, otherwise fibrinolysis. Give aspirin 300 mg and a second antiplatelet. Monitor for VF.', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v6', 'image_url', 'https://commons.wikimedia.org/wiki/Special:FilePath/ST_elevation_myocardial_infarction_ECG.jpg')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = 'd715e8f5-2eb3-5125-888e-dd43ed37dcce';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('b6630669-9a04-5457-9411-985e676ebe92', 'd715e8f5-2eb3-5125-888e-dd43ed37dcce', 'A', 'Start warfarin', false, 0),
  ('d1db6c5c-6fa9-5e1a-a15b-6b807bf68f50', 'd715e8f5-2eb3-5125-888e-dd43ed37dcce', 'B', 'Exercise ECG', false, 1),
  ('52f1a5f5-d276-5916-80f0-6ae05971c95c', 'd715e8f5-2eb3-5125-888e-dd43ed37dcce', 'C', 'Aspirin 300 mg, and activate the primary PCI pathway (cath lab)', true, 2),
  ('8d004942-bb86-53b8-8ccd-18928d16b89a', 'd715e8f5-2eb3-5125-888e-dd43ed37dcce', 'D', 'Wait for troponin', false, 3),
  ('5c767c5a-f3b4-5d9b-842e-7db5b0a2ca8c', 'd715e8f5-2eb3-5125-888e-dd43ed37dcce', 'E', 'Discharge with GTN', false, 4);

-- Q163
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('9cc1605e-4c44-5e8c-ba9d-0101c6bc98ef', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000001', 'sba', 'A 66 year old woman had chest pain 2 hours ago. Her ECG is shown, with ST elevation in II, III and aVF. Her BP is 85/50 with a raised JVP and clear lungs. What is the SINGLE most likely complication?', 'Inferior STEMI is usually from the right coronary artery, which also supplies the right ventricle and the AV node (heart block). RV infarction: hypotension, raised JVP and clear lungs. Avoid nitrates and diuretics; give fluids; reperfuse urgently.', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v6', 'image_url', 'https://commons.wikimedia.org/wiki/Special:FilePath/ECG_001.jpg')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = '9cc1605e-4c44-5e8c-ba9d-0101c6bc98ef';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('42c244d0-161e-51f9-a36c-354c5c5db488', '9cc1605e-4c44-5e8c-ba9d-0101c6bc98ef', 'A', 'Left ventricular failure', false, 0),
  ('ab11e3f8-bde5-563a-a03d-a37eab65ac85', '9cc1605e-4c44-5e8c-ba9d-0101c6bc98ef', 'B', 'Aortic dissection', false, 1),
  ('609879fb-a26c-5ce0-a534-2a6cbe18ae0c', '9cc1605e-4c44-5e8c-ba9d-0101c6bc98ef', 'C', 'Right ventricular infarction', true, 2),
  ('b553cc49-255b-516f-85a0-1342153dedbf', '9cc1605e-4c44-5e8c-ba9d-0101c6bc98ef', 'D', 'Cardiac tamponade', false, 3),
  ('acfa08fc-5039-521e-bc6c-149a4bde7c89', '9cc1605e-4c44-5e8c-ba9d-0101c6bc98ef', 'E', 'Pulmonary embolism', false, 4);

-- Q164
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('9340f00b-cc5f-5f1f-81b6-cc8f7a58dc62', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000001', 'sba', 'An 80 year old man has had dizzy spells and two blackouts. His HR is 38. His ECG is shown, with P waves and QRS complexes that are unrelated. He is now haemodynamically stable. What is the SINGLE most appropriate definitive treatment?', 'The ECG shows complete heart block (AV dissociation). Symptomatic or broad-complex escape rhythms need a pacemaker. Acutely: atropine, isoprenaline or transcutaneous pacing if unstable. Review drugs (beta-blockers, digoxin, rate-limiting CCBs).', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v6', 'image_url', 'https://commons.wikimedia.org/wiki/Special:FilePath/CompleteHeartBlock.jpg')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = '9340f00b-cc5f-5f1f-81b6-cc8f7a58dc62';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('b0702272-57e5-550d-b754-433b5903ffe2', '9340f00b-cc5f-5f1f-81b6-cc8f7a58dc62', 'A', 'Long-term atropine', false, 0),
  ('33006826-4068-5d26-be43-b28f701fe77f', '9340f00b-cc5f-5f1f-81b6-cc8f7a58dc62', 'B', 'Beta-blocker', false, 1),
  ('fdb8ef96-87be-5f35-a5bd-c9b258db0e5b', '9340f00b-cc5f-5f1f-81b6-cc8f7a58dc62', 'C', 'Digoxin', false, 2),
  ('217f5af5-b36d-570e-8e6f-6138c59ff0e5', '9340f00b-cc5f-5f1f-81b6-cc8f7a58dc62', 'D', 'Permanent pacemaker insertion', true, 3),
  ('9758811e-4598-5b83-811f-3d699a87deaf', '9340f00b-cc5f-5f1f-81b6-cc8f7a58dc62', 'E', 'Watch and wait', false, 4);

-- Q165
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('2343e277-e544-5d48-aeb1-47e7bece8871', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000002', 'sba', 'A 19 year old tall, thin man has sudden left-sided chest pain and mild breathlessness while sitting at his desk. SpO2 is 97%. His chest X-ray is shown. He has no lung disease. What is the SINGLE most appropriate management if he is minimally symptomatic?', 'The CXR shows a primary spontaneous pneumothorax (visible lung edge with no lung markings beyond). Minimal symptoms with no high-risk features can be managed conservatively. Advise stopping smoking, avoid flying until resolved, and avoid diving permanently unless definitive surgery.', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v6', 'image_url', 'https://commons.wikimedia.org/wiki/Special:FilePath/09-01-Pneumothorax.png')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = '2343e277-e544-5d48-aeb1-47e7bece8871';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('ce9c23d5-b35d-5f44-91b4-a3c0de0d4b09', '2343e277-e544-5d48-aeb1-47e7bece8871', 'A', 'Conservative management with outpatient review (BTS 2023)', true, 0),
  ('1494e539-738b-520b-9a96-3731a5cd6303', '2343e277-e544-5d48-aeb1-47e7bece8871', 'B', 'Immediate chest drain', false, 1),
  ('17755b1c-07eb-5142-9f82-e8089bbf3198', '2343e277-e544-5d48-aeb1-47e7bece8871', 'C', 'Emergency thoracotomy', false, 2),
  ('18e9e96c-3285-5e8c-8303-42ecbb92df85', '2343e277-e544-5d48-aeb1-47e7bece8871', 'D', 'Needle decompression', false, 3),
  ('ab1d9b46-4539-536f-baff-5921edf8088e', '2343e277-e544-5d48-aeb1-47e7bece8871', 'E', 'Admit for 1 week', false, 4);

-- Q166
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('2d40a668-8998-5323-9a1a-9e77e35c273c', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000002', 'sba', 'A 25 year old man was stabbed in the chest. He is very breathless, hypotensive and his trachea is deviated. His X-ray (taken before the diagnosis was made) is shown. What is the SINGLE most appropriate immediate action?', 'Tension pneumothorax is a clinical diagnosis; treatment should not wait for imaging. Signs: respiratory distress, hypotension, tracheal deviation away from the affected side, hyperresonance and absent breath sounds. Decompress with a needle (4th-5th intercostal space mid-axillary line) or finger thoracostomy, then chest drain.', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v6', 'image_url', 'https://commons.wikimedia.org/wiki/Special:FilePath/Pneumothorax_CXR.jpg')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = '2d40a668-8998-5323-9a1a-9e77e35c273c';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('1a0e27e0-2dfe-5071-9116-65031f37cc41', '2d40a668-8998-5323-9a1a-9e77e35c273c', 'A', 'Immediate needle or finger thoracostomy decompression, then chest drain', true, 0),
  ('62c4e105-062c-5f53-9745-171a6225abbf', '2d40a668-8998-5323-9a1a-9e77e35c273c', 'B', 'Wait for a CT scan', false, 1),
  ('fae6fd6c-2b29-5063-b969-51c708cd5d47', '2d40a668-8998-5323-9a1a-9e77e35c273c', 'C', 'Intubate first', false, 2),
  ('3f82ca04-f7c9-5591-9a7d-d0f6793b697b', '2d40a668-8998-5323-9a1a-9e77e35c273c', 'D', 'Antibiotics', false, 3),
  ('ae2f9458-15c3-5c75-8871-50a69ff8516a', '2d40a668-8998-5323-9a1a-9e77e35c273c', 'E', 'Give a fluid bolus only', false, 4);

-- Q167
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('a5f979c4-b9c5-54c6-b138-55020c6d8c88', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000002', 'sba', 'A 68 year old man with weight loss and breathlessness has a chest X-ray as shown, with a large unilateral effusion. What is the SINGLE most appropriate next step?', 'A unilateral effusion needs diagnostic aspiration under ultrasound guidance. Use Light''s criteria to separate exudate from transudate. In a man with weight loss, malignancy (lung cancer, mesothelioma) is a concern: send cytology and arrange CT chest with contrast.', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v6', 'image_url', 'https://commons.wikimedia.org/wiki/Special:FilePath/Effusionhalf.PNG')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = 'a5f979c4-b9c5-54c6-b138-55020c6d8c88';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('eefa4230-b35f-5c4c-8be4-d118bf9075c9', 'a5f979c4-b9c5-54c6-b138-55020c6d8c88', 'A', 'Furosemide', false, 0),
  ('48558543-618b-5f2e-b6fd-66db99dfc944', 'a5f979c4-b9c5-54c6-b138-55020c6d8c88', 'B', 'Start antibiotics only', false, 1),
  ('a1dba306-ca7c-5ed4-bc7a-3babe5182d90', 'a5f979c4-b9c5-54c6-b138-55020c6d8c88', 'C', 'Repeat X-ray in 6 weeks', false, 2),
  ('7a337074-6304-5804-b40f-0a2ae31a5430', 'a5f979c4-b9c5-54c6-b138-55020c6d8c88', 'D', 'Ultrasound-guided diagnostic pleural aspiration (protein, LDH, pH, glucose, cytology, microbiology)', true, 3),
  ('6ff626d3-6fa8-5cb7-a7a6-b49933a23177', 'a5f979c4-b9c5-54c6-b138-55020c6d8c88', 'E', 'Chest drain without sampling', false, 4);

-- Q168
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('6cc80e1f-dd26-5b6f-8f86-1f809f01793f', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000002', 'sba', 'A 68 year old man has progressive breathlessness over 2 years with a dry cough. His hands are shown. Auscultation reveals fine end-inspiratory crackles at both bases. What is the SINGLE most likely diagnosis?', 'The image shows finger clubbing. Clubbing with bibasal fine crackles suggests IPF. Other respiratory causes of clubbing: lung cancer, bronchiectasis, CF, empyema and asbestosis. COPD alone does not cause clubbing. HRCT confirms a UIP pattern.', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v6', 'image_url', 'https://commons.wikimedia.org/wiki/Special:FilePath/Clubbing_of_fingers_in_IPF.jpg')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = '6cc80e1f-dd26-5b6f-8f86-1f809f01793f';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('6bd4af6c-46a4-50b1-8cc1-f9923a15c904', '6cc80e1f-dd26-5b6f-8f86-1f809f01793f', 'A', 'Asthma', false, 0),
  ('8d69a4d7-73a6-5b82-988f-71b1934e7f77', '6cc80e1f-dd26-5b6f-8f86-1f809f01793f', 'B', 'Idiopathic pulmonary fibrosis', true, 1),
  ('9e4637d6-f1dd-5aac-b997-2fe07b9399de', '6cc80e1f-dd26-5b6f-8f86-1f809f01793f', 'C', 'COPD', false, 2),
  ('509b0cb2-fbb3-5222-b1cb-067ad97ba32d', '6cc80e1f-dd26-5b6f-8f86-1f809f01793f', 'D', 'Sarcoidosis', false, 3),
  ('20cbb587-3ec3-5146-8a68-b7e553e610ac', '6cc80e1f-dd26-5b6f-8f86-1f809f01793f', 'E', 'Heart failure', false, 4);

-- Q169
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('fc6a20fb-c1aa-5576-b2a1-355983b9bdeb', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000002', 'sba', 'A 55 year old smoker has had clubbing for 3 months. His hands are shown. He has a cough and weight loss. What is the SINGLE most important investigation?', 'New finger clubbing in a smoker is a red flag for lung cancer. NICE NG12: urgent CXR for people over 40 with clubbing. Other causes: IPF, bronchiectasis, cyanotic heart disease, IBD, cirrhosis and thyroid acropachy.', null, true, true, jsonb_build_object('source', 'plab1-xlsx-v6', 'guidelines_text', 'NICE NG12', 'image_url', 'https://commons.wikimedia.org/wiki/Special:FilePath/Clubbing_of_fingers_in_IPF.jpg')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = 'fc6a20fb-c1aa-5576-b2a1-355983b9bdeb';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('742a4452-f4c6-5d31-94cb-ca3181178207', 'fc6a20fb-c1aa-5576-b2a1-355983b9bdeb', 'A', 'Thyroid function only', false, 0),
  ('68751e5c-ce65-56b9-8d85-308d73febe0f', 'fc6a20fb-c1aa-5576-b2a1-355983b9bdeb', 'B', 'Chest X-ray, with urgent CT and referral if abnormal (suspected lung cancer)', true, 1),
  ('3e9daf4f-934e-5420-8013-54e4a65f7ae8', 'fc6a20fb-c1aa-5576-b2a1-355983b9bdeb', 'C', 'No investigation', false, 2),
  ('7a7d580e-3b3d-5862-8070-2de6c7546e6b', 'fc6a20fb-c1aa-5576-b2a1-355983b9bdeb', 'D', 'Liver function tests only', false, 3),
  ('4d0add40-2313-554a-a6d4-59b07c536f5a', 'fc6a20fb-c1aa-5576-b2a1-355983b9bdeb', 'E', 'Echocardiogram only', false, 4);

-- Q170
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('b2242081-e72d-5654-b9f1-476b88cbf52b', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000002', 'sba', 'A 70 year old man has fever, cough with rusty sputum and pleuritic chest pain. He is confused, RR 32, BP 85/50 and urea 9. His chest X-ray is shown. What is the SINGLE most appropriate antibiotic regimen?', 'The CXR shows lobar consolidation. CURB-65 is 4 (confusion, RR, BP and urea; age adds 1 to give 5). High-severity community-acquired pneumonia: IV co-amoxiclav plus a macrolide. Streptococcus pneumoniae is the commonest cause; rusty sputum is classic.', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v6', 'guidelines_text', 'CURB-65', 'image_url', 'https://commons.wikimedia.org/wiki/Special:FilePath/Pneumonia_x_ray.jpg')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = 'b2242081-e72d-5654-b9f1-476b88cbf52b';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('8bc62c88-dcdd-5ffc-b884-980cb21130dc', 'b2242081-e72d-5654-b9f1-476b88cbf52b', 'A', 'IV vancomycin alone', false, 0),
  ('ae5630f9-977b-58fe-8964-ab0ba612781c', 'b2242081-e72d-5654-b9f1-476b88cbf52b', 'B', 'No antibiotics', false, 1),
  ('b2658168-a648-552c-b426-a3ce5ce937ed', 'b2242081-e72d-5654-b9f1-476b88cbf52b', 'C', 'IV co-amoxiclav plus clarithromycin (high-severity CAP)', true, 2),
  ('3ad0c843-8f48-5ee3-bf24-e26f1b2d0860', 'b2242081-e72d-5654-b9f1-476b88cbf52b', 'D', 'Oral amoxicillin alone', false, 3),
  ('81c2aafa-fe30-589d-af0c-b8e18983cef4', 'b2242081-e72d-5654-b9f1-476b88cbf52b', 'E', 'Oral doxycycline', false, 4);

-- Q171
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('50d18796-7fa4-53c2-9837-7095723b72c8', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000030', 'sba', 'An 82 year old woman from a nursing home has abdominal distension, absolute constipation and pain. Her abdominal X-ray is shown. She is not peritonitic. What is the SINGLE most appropriate initial management?', 'The X-ray shows a large ''coffee bean'' loop arising from the pelvis, typical of sigmoid volvulus. First-line: endoscopic decompression with a flatus tube. Peritonitis, ischaemia or perforation needs surgery (Hartmann''s procedure). Recurrence is common.', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v6', 'image_url', 'https://commons.wikimedia.org/wiki/Special:FilePath/Sigmoidvolvulus.jpg')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = '50d18796-7fa4-53c2-9837-7095723b72c8';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('c35b7c74-9135-5c0d-b496-691e0569cbcb', '50d18796-7fa4-53c2-9837-7095723b72c8', 'A', 'Oral laxatives', false, 0),
  ('42772d61-4148-5729-9351-f7dae9363e5d', '50d18796-7fa4-53c2-9837-7095723b72c8', 'B', 'Colonoscopy in 6 weeks', false, 1),
  ('468d415b-db0f-53c1-8889-c95caee2dd6d', '50d18796-7fa4-53c2-9837-7095723b72c8', 'C', 'Flexible sigmoidoscopy decompression with insertion of a flatus tube', true, 2),
  ('5a6cdb52-4aa0-5a85-8a86-207b67bd3c61', '50d18796-7fa4-53c2-9837-7095723b72c8', 'D', 'Emergency laparotomy for all', false, 3),
  ('29b31ac3-717c-5b46-99c3-392ce3474cd7', '50d18796-7fa4-53c2-9837-7095723b72c8', 'E', 'Barium enema', false, 4);

-- Q172
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('326588cc-9598-54e6-aa79-5041c5e10616', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000030', 'sba', 'A 62 year old woman had a hysterectomy 5 years ago. She has colicky central abdominal pain, vomiting and no flatus for 24 hours. Her abdominal X-ray is shown. She has no hernias. What is the SINGLE most appropriate initial management?', 'The X-ray shows dilated small bowel loops (valvulae conniventes crossing the full width), suggesting small bowel obstruction. After previous surgery, adhesions are the commonest cause. Conservative management first; surgery for strangulation, peritonism or failure to resolve.', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v6', 'image_url', 'https://commons.wikimedia.org/wiki/Special:FilePath/Intestinal_Obstruction.JPG')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = '326588cc-9598-54e6-aa79-5041c5e10616';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('47eb8c4f-db32-5082-9f60-7ef739701395', '326588cc-9598-54e6-aa79-5041c5e10616', 'A', 'Immediate laparotomy', false, 0),
  ('d6519be1-eda9-55b6-b5e4-f199f94c47f9', '326588cc-9598-54e6-aa79-5041c5e10616', 'B', 'Oral laxatives', false, 1),
  ('acfb1b9e-3034-556e-bfe1-5c99bd712677', '326588cc-9598-54e6-aa79-5041c5e10616', 'C', 'IV fluids, NG tube decompression (''drip and suck''), analgesia, and water-soluble contrast follow-through', true, 2),
  ('f4abe819-32c8-517f-b63f-ba073d9c7ba3', '326588cc-9598-54e6-aa79-5041c5e10616', 'D', 'Discharge with analgesia', false, 3),
  ('1ed6ff3a-5f32-53e3-b406-963e25ee1f57', '326588cc-9598-54e6-aa79-5041c5e10616', 'E', 'Colonoscopy', false, 4);

-- Q173
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('afb6688b-664f-56bf-a526-25447d3b8c9b', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000016', 'sba', 'A 74 year old woman fell on her outstretched hand. Her wrist X-ray is shown. The fracture is displaced and the hand is neurovascularly intact. What is the SINGLE most appropriate initial management?', 'The X-ray shows a distal radius fracture with dorsal angulation (Colles'' fracture). Displaced fractures need closed reduction and immobilisation; unstable fractures need fixation. Check median nerve function. Arrange a fracture risk assessment (DXA) as this is a fragility fracture.', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v6', 'image_url', 'https://commons.wikimedia.org/wiki/Special:FilePath/Colles_fracture.JPG')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = 'afb6688b-664f-56bf-a526-25447d3b8c9b';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('24531be0-093c-5b43-89b2-57eb2b6fda5a', 'afb6688b-664f-56bf-a526-25447d3b8c9b', 'A', 'Above-elbow cast without reduction', false, 0),
  ('63cd8cf4-8bb8-5cfa-ad02-a47f15f2800f', 'afb6688b-664f-56bf-a526-25447d3b8c9b', 'B', 'Closed reduction under regional anaesthesia (e.g. haematoma block or Bier''s block), then backslab and fracture clinic', true, 1),
  ('74297b01-c203-522b-99e2-3257f6657e1a', 'afb6688b-664f-56bf-a526-25447d3b8c9b', 'C', 'Discharge with a crepe bandage', false, 2),
  ('750511e1-e271-5caa-8627-3bbb6fbfcb98', 'afb6688b-664f-56bf-a526-25447d3b8c9b', 'D', 'Immediate open surgery in all', false, 3),
  ('ed8a0057-f525-5b84-b96d-90252ad797ef', 'afb6688b-664f-56bf-a526-25447d3b8c9b', 'E', 'Physiotherapy only', false, 4);

-- Q174
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('9a43c2e0-a0f7-5d3e-b3c5-122e8c282d65', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000016', 'sba', 'A 70 year old woman fell on her outstretched hand and now has numbness of her thumb, index and middle fingers. Her X-ray is shown. Which nerve is MOST likely affected?', 'Distal radius (Colles'') fractures can compress or stretch the median nerve in the carpal tunnel, causing acute carpal tunnel syndrome. Urgent reduction is needed; worsening symptoms may need carpal tunnel decompression. Document neurovascular status before and after reduction.', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v6', 'image_url', 'https://commons.wikimedia.org/wiki/Special:FilePath/Colles_fracture.JPG')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = '9a43c2e0-a0f7-5d3e-b3c5-122e8c282d65';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('bdca981d-8418-5c97-aca5-93e8ca3b02c1', '9a43c2e0-a0f7-5d3e-b3c5-122e8c282d65', 'A', 'Ulnar nerve', false, 0),
  ('b5c3b9b2-2b74-5b20-8b51-ffaff8f785eb', '9a43c2e0-a0f7-5d3e-b3c5-122e8c282d65', 'B', 'Musculocutaneous nerve', false, 1),
  ('6d06afb3-746d-598c-8923-3fa479cb7c64', '9a43c2e0-a0f7-5d3e-b3c5-122e8c282d65', 'C', 'Axillary nerve', false, 2),
  ('cff914dd-7139-5985-a067-d402f577cd0b', '9a43c2e0-a0f7-5d3e-b3c5-122e8c282d65', 'D', 'Radial nerve', false, 3),
  ('faf27fe7-e715-5bed-95dd-d64bef5c71ce', '9a43c2e0-a0f7-5d3e-b3c5-122e8c282d65', 'E', 'Median nerve', true, 4);

-- Q175
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('df600647-f968-529d-a79a-6de74df96ccb', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000016', 'sba', 'An 86 year old woman fell at her care home. Her leg is shortened and externally rotated. Her X-ray is shown, with a comminuted extracapsular fracture through the trochanteric region. What is the SINGLE most appropriate surgical treatment?', 'Extracapsular (intertrochanteric) fractures preserve the femoral head blood supply and are fixed. Comminuted, unstable or reverse oblique patterns are often treated with an intramedullary nail. Surgery on the day of or after admission, with orthogeriatric review.', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v6', 'image_url', 'https://commons.wikimedia.org/wiki/Special:FilePath/X-ray_of_a_comminuted_hip_fracture.jpg')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = 'df600647-f968-529d-a79a-6de74df96ccb';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('18956d8e-a3fd-586f-b5bc-2f9b5d20c4d2', 'df600647-f968-529d-a79a-6de74df96ccb', 'A', 'Fixation with a sliding hip screw (or intramedullary nail if unstable)', true, 0),
  ('de6723c3-7de0-55c7-9fe3-b84f45865604', 'df600647-f968-529d-a79a-6de74df96ccb', 'B', 'Conservative bed rest', false, 1),
  ('106e57d7-f722-5051-91e9-c5e6352c25f3', 'df600647-f968-529d-a79a-6de74df96ccb', 'C', 'Total hip replacement', false, 2),
  ('7ff9d888-28eb-5d5b-b3c4-45ae1f89d14e', 'df600647-f968-529d-a79a-6de74df96ccb', 'D', 'Hemiarthroplasty', false, 3),
  ('83539335-7c5f-5a3d-aa6c-1b6663ceddee', 'df600647-f968-529d-a79a-6de74df96ccb', 'E', 'Cannulated screws', false, 4);

-- Q176
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('7c8228c9-0815-5775-b147-328642a0a648', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000016', 'sba', 'A 35 year old roofer fell 4 metres and landed on his feet. He has severe heel pain and swelling. His X-ray is shown. What is the SINGLE most important associated injury to look for?', 'The X-ray shows a calcaneal fracture. Falls from height onto the feet cause axial loading, so look for spine (thoracolumbar burst fractures), pelvic, hip, knee and contralateral calcaneal fractures. Check the spine clinically and with imaging.', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v6', 'image_url', 'https://commons.wikimedia.org/wiki/Special:FilePath/Calcaneus_Fracture.jpg')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = '7c8228c9-0815-5775-b147-328642a0a648';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('94468503-39dc-5517-95fa-5e5205e65a8e', '7c8228c9-0815-5775-b147-328642a0a648', 'A', 'Clavicle fracture', false, 0),
  ('2e0a5a97-0e9b-534d-8a40-745876cfe44e', '7c8228c9-0815-5775-b147-328642a0a648', 'B', 'Wrist fracture only', false, 1),
  ('744d4056-6704-5a68-be35-95d496a658d2', '7c8228c9-0815-5775-b147-328642a0a648', 'C', 'Shoulder dislocation', false, 2),
  ('6c745268-a081-518e-ad43-e1a8931be30f', '7c8228c9-0815-5775-b147-328642a0a648', 'D', 'Thoracolumbar spine fracture', true, 3),
  ('d3491a41-908d-59b4-8612-77690fbd37d2', '7c8228c9-0815-5775-b147-328642a0a648', 'E', 'Skull fracture', false, 4);

-- Q177
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('1da1952b-05f7-514c-ad24-72142f8d75c5', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000011', 'sba', 'A 64 year old man has difficulty putting his hand flat on a table. His hand is shown. He has diabetes and drinks heavily. What is the SINGLE most appropriate management if function is affected?', 'The image shows Dupuytren''s contracture (thickened cords in the palmar fascia, flexion of the ring and little fingers). Refer when the hand cannot be laid flat (table-top test positive) or function is affected. Associations: diabetes, alcohol, smoking, epilepsy drugs and family history.', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v6', 'image_url', 'https://commons.wikimedia.org/wiki/Special:FilePath/Dupuytren''s2010.JPG')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = '1da1952b-05f7-514c-ad24-72142f8d75c5';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('3fe3eeda-93bc-5f52-b5db-840bef5791e0', '1da1952b-05f7-514c-ad24-72142f8d75c5', 'A', 'Splint for 6 months', false, 0),
  ('ee16c500-c20b-5ecc-b4f2-4b0a04ad639f', '1da1952b-05f7-514c-ad24-72142f8d75c5', 'B', 'Refer to hand surgery for needle fasciotomy or fasciectomy', true, 1),
  ('b88730dd-88ba-5c9b-8589-4f1938584932', '1da1952b-05f7-514c-ad24-72142f8d75c5', 'C', 'Antibiotics', false, 2),
  ('5ad92e0c-9830-597a-875d-06e45f0aece4', '1da1952b-05f7-514c-ad24-72142f8d75c5', 'D', 'Steroid injection into the tendon', false, 3),
  ('a4e67029-8d04-56d7-a11b-a94ff84c5124', '1da1952b-05f7-514c-ad24-72142f8d75c5', 'E', 'No treatment possible', false, 4);

-- Q178
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('6f9d3e56-f3ba-55f8-bb25-e43dbfc560b1', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000019', 'sba', 'A 70 year old man has painful lumps on his hands and ears that discharge chalky material. His hands are shown. He has had recurrent joint attacks for 10 years and takes furosemide. What is the SINGLE most appropriate long-term treatment?', 'The image shows tophi (chronic tophaceous gout). Treat with urate-lowering therapy (allopurinol or febuxostat), titrated to a target below 300 µmol/L because of tophi, with colchicine prophylaxis for 3-6 months. Review diuretics.', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v6', 'image_url', 'https://commons.wikimedia.org/wiki/Special:FilePath/Tophigout.JPG')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = '6f9d3e56-f3ba-55f8-bb25-e43dbfc560b1';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('709b096f-55c9-531e-9a52-36d3fb87e8a8', '6f9d3e56-f3ba-55f8-bb25-e43dbfc560b1', 'A', 'Colchicine only', false, 0),
  ('4e0ad0d2-b65b-5490-b389-fada9c1b843e', '6f9d3e56-f3ba-55f8-bb25-e43dbfc560b1', 'B', 'Allopurinol, titrated to a serum urate below 300 µmol/L (tophaceous gout), with flare prophylaxis', true, 1),
  ('67ba00fd-1110-5f03-8540-1dd1e9b051f3', '6f9d3e56-f3ba-55f8-bb25-e43dbfc560b1', 'C', 'NSAIDs only', false, 2),
  ('28e76e82-f418-5ef8-b171-624f6ab1baf7', '6f9d3e56-f3ba-55f8-bb25-e43dbfc560b1', 'D', 'Surgery only', false, 3),
  ('742eaa0a-e700-5b98-bf59-78dea0cfd4f4', '6f9d3e56-f3ba-55f8-bb25-e43dbfc560b1', 'E', 'Long-term prednisolone', false, 4);

-- Q179
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('0422d8d5-9520-5fa2-afa0-0c2650e79231', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000012', 'sba', 'A 78 year old man has a lesion on his face that has slowly grown over 2 years. It is shown. It occasionally bleeds. What is the SINGLE most appropriate management?', 'The image shows a nodular basal cell carcinoma (pearly, rolled edges, telangiectasia). BCC rarely metastasises; refer routinely (urgently only if size or site means delay could have a significant impact). Treatment: surgical excision or Mohs micrographic surgery for facial and high-risk lesions.', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v6', 'image_url', 'https://commons.wikimedia.org/wiki/Special:FilePath/BCC_Nodular_type.jpg')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = '0422d8d5-9520-5fa2-afa0-0c2650e79231';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('8ceab375-8522-55c4-a0bd-255e4453e69d', '0422d8d5-9520-5fa2-afa0-0c2650e79231', 'A', 'Refer for surgical excision (routine referral; Mohs surgery for high-risk facial sites)', true, 0),
  ('c864f14d-a5bd-503d-be3b-2ead28e74732', '0422d8d5-9520-5fa2-afa0-0c2650e79231', 'B', 'Topical steroid', false, 1),
  ('532a5457-1d5c-5042-8d02-7062745b721a', '0422d8d5-9520-5fa2-afa0-0c2650e79231', 'C', 'Cryotherapy in primary care for all facial lesions', false, 2),
  ('0a51513f-df5e-52f3-b21f-c27fa32fabbc', '0422d8d5-9520-5fa2-afa0-0c2650e79231', 'D', 'Reassure', false, 3),
  ('58fe0c43-b3c9-5616-823d-63daaaeec0ac', '0422d8d5-9520-5fa2-afa0-0c2650e79231', 'E', 'Urgent 2-week wait referral in all cases', false, 4);

-- Q180
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('bbe5dbf3-1677-500c-a1e3-7b627eec74d3', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000012', 'sba', 'A 45 year old woman has a mole on her back that has grown and become darker. It is shown. What is the SINGLE most appropriate management?', 'The image shows an asymmetric pigmented lesion with irregular borders and variable colour, suspicious of melanoma (ABCDE: asymmetry, border, colour, diameter, evolution). Refer urgently for excision biopsy with narrow margins. Breslow thickness guides prognosis and further treatment.', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v6', 'image_url', 'https://commons.wikimedia.org/wiki/Special:FilePath/Melanoma5.jpg')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = 'bbe5dbf3-1677-500c-a1e3-7b627eec74d3';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('d1bc759f-40fb-5c09-8c65-19e5a2b4b8db', 'bbe5dbf3-1677-500c-a1e3-7b627eec74d3', 'A', 'Reassure and review in 1 year', false, 0),
  ('6c72c9f8-bf45-5dbb-8324-c970f346371d', 'bbe5dbf3-1677-500c-a1e3-7b627eec74d3', 'B', 'Topical imiquimod', false, 1),
  ('59bf1c82-d25b-59b8-9a74-4df28e938a3b', 'bbe5dbf3-1677-500c-a1e3-7b627eec74d3', 'C', 'Urgent referral on the suspected cancer pathway (suspected melanoma)', true, 2),
  ('4e1f52d7-99b5-5c55-9604-38c5e6d470cc', 'bbe5dbf3-1677-500c-a1e3-7b627eec74d3', 'D', 'Cryotherapy', false, 3),
  ('6b2057d2-55c8-5320-8bb4-ed8c42659eae', 'bbe5dbf3-1677-500c-a1e3-7b627eec74d3', 'E', 'Shave biopsy in primary care', false, 4);

-- Q181
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('6bbe5e26-e1cf-53ba-b735-17ee5c337b8a', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000012', 'sba', 'A 6 year old boy has the lesion shown around his nose, with golden crusts. He has a few similar spots on his arm and is otherwise well. What is the SINGLE most appropriate advice on school attendance?', 'The image shows impetigo (honey-coloured crusts). It is contagious. Treatment: hydrogen peroxide 1% cream for localised lesions, topical fusidic acid, or oral flucloxacillin for widespread disease. Exclude from school until lesions have crusted or 48 hours after starting antibiotics.', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v6', 'image_url', 'https://commons.wikimedia.org/wiki/Special:FilePath/Impetigo_Nase.jpg')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = '6bbe5e26-e1cf-53ba-b735-17ee5c337b8a';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('568bc694-1079-5617-9cf9-6b86d897765b', '6bbe5e26-e1cf-53ba-b735-17ee5c337b8a', 'A', 'No exclusion needed', false, 0),
  ('8e695871-2018-5c1a-8986-c5020197bd9c', '6bbe5e26-e1cf-53ba-b735-17ee5c337b8a', 'B', 'Exclude until all crusts fall off', false, 1),
  ('f94f0268-93fa-580b-a3af-5a7a4c9e6913', '6bbe5e26-e1cf-53ba-b735-17ee5c337b8a', 'C', 'Exclude until lesions are crusted and healed, or 48 hours after starting antibiotics', true, 2),
  ('7042a896-df17-58d3-bc85-98346df027a7', '6bbe5e26-e1cf-53ba-b735-17ee5c337b8a', 'D', 'Exclude for 2 weeks', false, 3),
  ('492557fe-0dc7-5a1c-b17e-3da9df2d5fe0', '6bbe5e26-e1cf-53ba-b735-17ee5c337b8a', 'E', 'Exclude only if fever', false, 4);

-- Q182
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('43193423-2c7b-585b-a8ff-4b955c0c0358', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000012', 'sba', 'A 35 year old man has well-demarcated plaques on his elbows. They are shown. He also has nail pitting and pain and swelling of his distal finger joints. What is the SINGLE most likely additional diagnosis?', 'The image shows chronic plaque psoriasis on the extensor surface. Nail disease and DIP joint involvement suggest psoriatic arthritis (affects up to 30% of people with psoriasis). Screen annually with the PEST questionnaire and refer to rheumatology.', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v6', 'image_url', 'https://commons.wikimedia.org/wiki/Special:FilePath/Psoriasis_in_elbow.jpg')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = '43193423-2c7b-585b-a8ff-4b955c0c0358';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('aaca8b9e-2c8a-555d-8df7-3d922403526e', '43193423-2c7b-585b-a8ff-4b955c0c0358', 'A', 'Osteoarthritis', false, 0),
  ('0c0e8d5e-970e-5625-854d-8c5d5d6dd911', '43193423-2c7b-585b-a8ff-4b955c0c0358', 'B', 'Gout', false, 1),
  ('2c470b75-acd2-5a3d-b4c4-eb54c0c3ef7c', '43193423-2c7b-585b-a8ff-4b955c0c0358', 'C', 'Rheumatoid arthritis', false, 2),
  ('ec1ab1b0-acb6-57d7-b693-2dade36e09da', '43193423-2c7b-585b-a8ff-4b955c0c0358', 'D', 'Reactive arthritis', false, 3),
  ('07204e74-cf48-5a5f-8910-34527acfc09d', '43193423-2c7b-585b-a8ff-4b955c0c0358', 'E', 'Psoriatic arthritis', true, 4);

-- Q183
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('073b9df4-17e7-5f2c-9894-559bcdd4e173', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000012', 'sba', 'A 30 year old nurse in a care home has intense itching, worse at night. Her hand is shown. Several residents have similar symptoms. What is the MOST appropriate public health action?', 'The image shows scabies (burrows in the finger webs). Outbreaks in care homes need coordinated simultaneous treatment of residents, staff and contacts, with health protection team support. Crusted (Norwegian) scabies in immunocompromised or frail residents is highly contagious and may need oral ivermectin.', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v6', 'image_url', 'https://commons.wikimedia.org/wiki/Special:FilePath/ScabiesD06.jpg')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = '073b9df4-17e7-5f2c-9894-559bcdd4e173';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('1efcfd86-021c-51cf-80e7-6ed0fbbfa9da', '073b9df4-17e7-5f2c-9894-559bcdd4e173', 'A', 'Treat the nurse only', false, 0),
  ('16f2f35b-697c-5470-9356-35a797c3f67e', '073b9df4-17e7-5f2c-9894-559bcdd4e173', 'B', 'Prescribe oral antibiotics', false, 1),
  ('6f2fd304-a969-5ff6-be1e-0f65c1ae6c2e', '073b9df4-17e7-5f2c-9894-559bcdd4e173', 'C', 'Wait to see if it resolves', false, 2),
  ('9f0a9641-3395-50ab-86cb-273e9fc6149b', '073b9df4-17e7-5f2c-9894-559bcdd4e173', 'D', 'Treat the patient, all close contacts and affected residents simultaneously, and inform the local health protection team about the care home outbreak', true, 3),
  ('2381b653-6ff8-5860-b061-2938324c4d89', '073b9df4-17e7-5f2c-9894-559bcdd4e173', 'E', 'Antihistamines only', false, 4);

-- Q184
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('71b82034-2cbb-5c02-a20c-e93df6015f10', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000010', 'sba', 'A 40 year old woman noticed the rash shown on her leg 2 weeks after camping in the New Forest. She now has a left facial nerve palsy. What is the SINGLE most appropriate treatment?', 'The image shows erythema migrans (expanding target-like rash), diagnostic of Lyme disease. Facial nerve palsy is a common neurological manifestation (neuroborreliosis) and can be bilateral. Treat with doxycycline; IV ceftriaxone for CNS involvement such as meningitis. Check for heart block.', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v6', 'image_url', 'https://commons.wikimedia.org/wiki/Special:FilePath/Erythema_migrans_-_erythematous_rash_in_Lyme_disease_-_PHIL_9875.jpg')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = '71b82034-2cbb-5c02-a20c-e93df6015f10';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('1ea13dc4-8ab5-5135-aeb8-a57b4bb91a5d', '71b82034-2cbb-5c02-a20c-e93df6015f10', 'A', 'Oral aciclovir', false, 0),
  ('114012ab-346d-54cf-b996-8879313633bb', '71b82034-2cbb-5c02-a20c-e93df6015f10', 'B', 'Oral doxycycline (Lyme disease with facial palsy) for 21 days', true, 1),
  ('43ab0a29-767c-54ef-86d2-c0aae4d397de', '71b82034-2cbb-5c02-a20c-e93df6015f10', 'C', 'Oral prednisolone only', false, 2),
  ('93a71df3-f4f9-54db-bd98-a1d6cf116557', '71b82034-2cbb-5c02-a20c-e93df6015f10', 'D', 'No treatment', false, 3),
  ('00d1240c-b9cd-558a-be3c-4a2af21bd5bb', '71b82034-2cbb-5c02-a20c-e93df6015f10', 'E', 'Topical steroids', false, 4);

-- Q185
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('c5363054-0d51-5cc3-9742-db22d2e0ba23', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000010', 'sba', 'A 74 year old man has the painful rash shown on his chest. It started 2 days ago after burning pain in the same area. He is otherwise well. Which vaccination would have reduced his risk?', 'The image shows a dermatomal vesicular rash typical of herpes zoster. Treat with oral antivirals within 72 hours. Shingrix (non-live recombinant vaccine) is offered in the UK from age 65 (moving down to 60) and to immunosuppressed adults; it reduces shingles and post-herpetic neuralgia.', null, true, true, jsonb_build_object('source', 'plab1-xlsx-v6', 'image_url', 'https://commons.wikimedia.org/wiki/Special:FilePath/Shingles_on_the_chest.jpg')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = 'c5363054-0d51-5cc3-9742-db22d2e0ba23';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('2545e40d-28bc-51f6-900e-d11e433f84ca', 'c5363054-0d51-5cc3-9742-db22d2e0ba23', 'A', 'MMR', false, 0),
  ('ded51ff9-b11f-5feb-936d-f3d1dd8d190f', 'c5363054-0d51-5cc3-9742-db22d2e0ba23', 'B', 'Influenza vaccine', false, 1),
  ('849acdbb-9488-55d0-abe0-c41363070d5d', 'c5363054-0d51-5cc3-9742-db22d2e0ba23', 'C', 'Pneumococcal vaccine', false, 2),
  ('cc67f247-3467-58fe-bf45-ba58451f8eda', 'c5363054-0d51-5cc3-9742-db22d2e0ba23', 'D', 'The shingles vaccine (Shingrix)', true, 3),
  ('009a51ab-0806-5966-8add-e8fd15858fed', 'c5363054-0d51-5cc3-9742-db22d2e0ba23', 'E', 'BCG', false, 4);

-- Q186
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('c0a25700-63c4-5496-b41d-3c57d470df56', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000010', 'sba', 'A 7 year old girl has the rash shown on her face. A week ago she had a mild cold. She is well. Her mother is 14 weeks pregnant and has had contact with her. What is the SINGLE most appropriate step for the mother?', 'The image shows a slapped cheek rash (erythema infectiosum, parvovirus B19). Pregnant contacts need serology. Infection before 20 weeks can cause fetal anaemia and hydrops; refer to fetal medicine for monitoring with ultrasound if infected.', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v6', 'image_url', 'https://commons.wikimedia.org/wiki/Special:FilePath/Fifth_disease_cropped.jpg')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = 'c0a25700-63c4-5496-b41d-3c57d470df56';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('2c7f97b4-ba20-5cef-a7d2-b433c9b801f1', 'c0a25700-63c4-5496-b41d-3c57d470df56', 'A', 'Reassure as it is rubella', false, 0),
  ('6554e526-3477-5700-b41a-da32f8f73055', 'c0a25700-63c4-5496-b41d-3c57d470df56', 'B', 'Give MMR vaccine', false, 1),
  ('19522b84-8003-523c-9a30-4a588e8edc39', 'c0a25700-63c4-5496-b41d-3c57d470df56', 'C', 'Give aciclovir', false, 2),
  ('2bc0e11a-ca46-53c9-94bd-2d39db858993', 'c0a25700-63c4-5496-b41d-3c57d470df56', 'D', 'Check parvovirus B19 serology (IgG and IgM)', true, 3),
  ('693ac2a2-769f-58ee-bea6-57b02496c6e5', 'c0a25700-63c4-5496-b41d-3c57d470df56', 'E', 'No action', false, 4);

-- Q187
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('d5159d1f-6d21-55bf-808c-93b2a0f7e3d5', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000012', 'sba', 'A 4 year old girl has several pearly, umbilicated papules on her trunk, as shown. Her mother asks whether she needs to stay off nursery. What is the CORRECT advice?', 'The image shows molluscum contagiosum. It resolves within 18 months, often after an inflammatory phase. No school exclusion. Avoid sharing towels. Treat only if troublesome. Widespread lesions in adults should prompt consideration of immunosuppression.', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v6', 'image_url', 'https://commons.wikimedia.org/wiki/Special:FilePath/Molluscaklein.jpg')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = 'd5159d1f-6d21-55bf-808c-93b2a0f7e3d5';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('0b8ed097-e5f3-54c2-a83a-e66818ae9caa', 'd5159d1f-6d21-55bf-808c-93b2a0f7e3d5', 'A', 'Start oral antibiotics', false, 0),
  ('3e3c9162-0c7a-5ed3-b4ae-1f39bdc0699f', 'd5159d1f-6d21-55bf-808c-93b2a0f7e3d5', 'B', 'Exclude for 2 weeks', false, 1),
  ('3fd3fb7f-835c-5935-b155-be85198c044f', 'd5159d1f-6d21-55bf-808c-93b2a0f7e3d5', 'C', 'Exclude until all lesions disappear', false, 2),
  ('553b80c8-4c03-5187-97e3-1b4d030f89fb', 'd5159d1f-6d21-55bf-808c-93b2a0f7e3d5', 'D', 'Cryotherapy for all', false, 3),
  ('a5b1807f-0c1f-50d7-8986-4d8794e76ec2', 'd5159d1f-6d21-55bf-808c-93b2a0f7e3d5', 'E', 'No exclusion is needed; the lesions are self-limiting and treatment is not usually required', true, 4);

-- Q188
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('6a7209d6-abb0-58c3-ac08-ef217e476b5a', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000015', 'sba', 'A 26 year old woman with a BMI of 39 has daily headaches and transient blurring of vision when she bends down. Her fundus is shown. MRI and MR venography are normal. What is the SINGLE most appropriate treatment?', 'The image shows papilloedema (swollen optic disc with blurred margins). With normal imaging, idiopathic intracranial hypertension is likely; LP confirms raised opening pressure. Treatment: weight loss, acetazolamide and topiramate; urgent surgery if vision is threatened.', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v6', 'image_url', 'https://commons.wikimedia.org/wiki/Special:FilePath/Papilledema.jpg')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = '6a7209d6-abb0-58c3-ac08-ef217e476b5a';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('ed62dfba-1b9a-53ce-897e-edf0b99d4efe', '6a7209d6-abb0-58c3-ac08-ef217e476b5a', 'A', 'Antibiotics', false, 0),
  ('4a28ffb1-1e04-5c6a-bcc1-f2abfb51ecd1', '6a7209d6-abb0-58c3-ac08-ef217e476b5a', 'B', 'No treatment', false, 1),
  ('05587e61-a040-586a-9011-9dbcd53b4134', '6a7209d6-abb0-58c3-ac08-ef217e476b5a', 'C', 'Weight loss and acetazolamide, with ophthalmology monitoring of visual fields', true, 2),
  ('3851aca8-cb29-54fd-8eff-0c30c449ac63', '6a7209d6-abb0-58c3-ac08-ef217e476b5a', 'D', 'Oral steroids long-term', false, 3),
  ('7af74d03-6dbb-59b0-8ab6-8d5191f24b4b', '6a7209d6-abb0-58c3-ac08-ef217e476b5a', 'E', 'Sumatriptan', false, 4);

-- Q189
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('2baf43ce-38e9-5851-813f-16fe0a601f11', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000015', 'sba', 'A 70 year old man has a sudden painless loss of vision in his right eye this morning. His fundus is shown. He has AF and is not anticoagulated. What is the SINGLE most important next step after ophthalmology review?', 'The image shows a pale retina with a cherry-red spot at the macula, typical of central retinal artery occlusion. It is a form of stroke: assess urgently for embolic sources (AF, carotid disease) and check ESR or CRP to exclude giant cell arteritis.', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v6', 'image_url', 'https://commons.wikimedia.org/wiki/Special:FilePath/Cherry_red_spot_in_patient_with_central_retinal_artery_occlusion_(CRAO).jpg')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = '2baf43ce-38e9-5851-813f-16fe0a601f11';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('cf4cb32b-eca4-5855-9af4-4aa2e8177195', '2baf43ce-38e9-5851-813f-16fe0a601f11', 'A', 'Laser treatment', false, 0),
  ('5ac76658-712e-509c-90c3-cd6672beb756', '2baf43ce-38e9-5851-813f-16fe0a601f11', 'B', 'Arrange glasses', false, 1),
  ('bb7b1cff-905d-56b0-8236-8c42352a1d2d', '2baf43ce-38e9-5851-813f-16fe0a601f11', 'C', 'Urgent stroke assessment and investigation for an embolic source (it is a stroke equivalent)', true, 2),
  ('a6ff409c-336f-55e6-bb9d-7325673ebb66', '2baf43ce-38e9-5851-813f-16fe0a601f11', 'D', 'Discharge with no follow-up', false, 3),
  ('cdabb3d1-c991-5270-be04-099239450663', '2baf43ce-38e9-5851-813f-16fe0a601f11', 'E', 'Start topical steroids', false, 4);

-- Q190
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('30ad7e4e-6fc9-550b-8901-e9cba61c54ef', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000023', 'sba', 'A 58 year old man is brought in by ambulance at 02:00 after collapsing at home. His wife says he complained of a sudden crushing chest pain radiating to his left arm while watching television, then became sweaty, nauseated and short of breath. He has type 2 diabetes, hypertension and smokes 20 a day. On arrival he is pale and clammy; HR 108, BP 92/60, RR 24, SpO2 93% on air, temperature 36.7°C. He has bibasal crackles and a raised JVP. ECG shows 4 mm ST elevation in V1-V5 with reciprocal ST depression in II, III and aVF. Troponin is pending. The nearest PCI centre is 25 minutes away. What is the SINGLE most appropriate immediate management?', 'This is an anterior STEMI with heart failure and borderline hypotension (high risk of cardiogenic shock). Do not wait for troponin. Primary PCI is preferred if achievable within 120 minutes. Give antiplatelet therapy and analgesia; oxygen only if hypoxic. Avoid nitrates if hypotensive.', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v6')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = '30ad7e4e-6fc9-550b-8901-e9cba61c54ef';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('9c7a6888-1c09-52bf-8c08-9b9d9ca4243b', '30ad7e4e-6fc9-550b-8901-e9cba61c54ef', 'A', 'Wait for troponin result before deciding', false, 0),
  ('bdc51df3-199d-518b-95b4-d674c39fed54', '30ad7e4e-6fc9-550b-8901-e9cba61c54ef', 'B', 'IV furosemide and admit to a medical ward', false, 1),
  ('11c1c92d-f57a-548a-8689-5182ae1fea2e', '30ad7e4e-6fc9-550b-8901-e9cba61c54ef', 'C', 'Aspirin 300 mg, oxygen to target 94-98%, IV opioid with antiemetic, and immediate transfer for primary PCI (cardiogenic shock risk)', true, 2),
  ('ba6dc5df-bb1f-5106-ad40-e22720256dad', '30ad7e4e-6fc9-550b-8901-e9cba61c54ef', 'D', 'Thrombolysis after a 3-hour wait', false, 3),
  ('63e3a26c-3edf-55cc-96d5-0c8bb82659f3', '30ad7e4e-6fc9-550b-8901-e9cba61c54ef', 'E', 'Exercise ECG in the morning', false, 4);

-- Q191
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('3b2f96f1-dfe1-58e2-9322-9b275fecdf77', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000023', 'sba', 'A 34 year old woman is brought to the ED by her partner at 23:00. She took an unknown number of her mother''s tablets ''about 5 hours ago'' after an argument. She now has ringing in her ears, nausea, vomiting and is breathing deeply and fast. She is alert. HR 112, BP 125/80, RR 30, temperature 38.0°C. Blood gas: pH 7.36, PaCO2 2.9 kPa, bicarbonate 12, lactate 2.0, glucose 4.1. Paracetamol level is undetectable. Her mother takes aspirin and ramipril. What is the SINGLE most likely toxin, and what blood test is needed now?', 'Tinnitus, vomiting, hyperventilation, fever and a mixed respiratory alkalosis with metabolic acidosis suggest salicylate poisoning. Check salicylate levels (repeat as absorption can be delayed). Give activated charcoal if early, IV fluids, sodium bicarbonate for urinary alkalinisation, and haemodialysis for severe toxicity.', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v6')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = '3b2f96f1-dfe1-58e2-9322-9b275fecdf77';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('475df8d9-9f39-54a9-b5c0-b9b29ad939aa', '3b2f96f1-dfe1-58e2-9322-9b275fecdf77', 'A', 'Iron; check serum iron', false, 0),
  ('ff9c08a8-a8c8-5cc0-b3e4-a30d0eb2ebc2', '3b2f96f1-dfe1-58e2-9322-9b275fecdf77', 'B', 'Salicylate (aspirin) poisoning; urgent salicylate level, with repeat levels to guide urinary alkalinisation', true, 1),
  ('3bfd7a67-5722-5f31-a99d-692d3b3006a7', '3b2f96f1-dfe1-58e2-9322-9b275fecdf77', 'C', 'ACE inhibitor; check potassium only', false, 2),
  ('3a134573-68c2-5af2-ba5b-d9d217a4915d', '3b2f96f1-dfe1-58e2-9322-9b275fecdf77', 'D', 'Paracetamol; repeat paracetamol at 8 hours', false, 3),
  ('62455db7-b8f1-5ac4-bdac-3b38e860cfa8', '3b2f96f1-dfe1-58e2-9322-9b275fecdf77', 'E', 'Opioid; give naloxone', false, 4);

-- Q192
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('716cd55d-31fa-53e9-ab65-6fb27acff812', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000023', 'sba', 'A 45 year old man is found at home by a neighbour after a gas heater was left on in a closed room. He has a headache, nausea, dizziness and confusion. His partner, also at home, has similar symptoms, and their dog was lethargic. Observations: HR 105, BP 130/80, RR 20, SpO2 99% on pulse oximetry, GCS 14. ECG shows sinus tachycardia with ST depression in V4-V6. Carboxyhaemoglobin on co-oximetry is 28%. What is the SINGLE most appropriate management?', 'Carbon monoxide poisoning: pulse oximetry falsely reads normal. Multiple people (and pets) affected in one building is a clue. Give 100% oxygen. Hyperbaric oxygen is considered for loss of consciousness, neurological signs, myocardial ischaemia, pregnancy or very high COHb. Check troponin. Inform the gas safety services.', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v6')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = '716cd55d-31fa-53e9-ab65-6fb27acff812';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('a6215aed-3699-5b2b-8179-d6da252d2bdf', '716cd55d-31fa-53e9-ab65-6fb27acff812', 'A', '100% oxygen via a non-rebreather mask, cardiac monitoring, and discussion with a hyperbaric unit given confusion and ECG changes', true, 0),
  ('41e5d47a-c81c-545b-8da5-33ee8f3cf2ae', '716cd55d-31fa-53e9-ab65-6fb27acff812', 'B', 'Antibiotics', false, 1),
  ('443badd9-b827-54e5-b7d2-a48e5d2f075d', '716cd55d-31fa-53e9-ab65-6fb27acff812', 'C', 'IV hydroxocobalamin only', false, 2),
  ('69253db8-419b-5739-935b-172cb5a2697e', '716cd55d-31fa-53e9-ab65-6fb27acff812', 'D', 'Room air because SpO2 is normal', false, 3),
  ('74580106-256d-5a14-a30d-375565a2ed35', '716cd55d-31fa-53e9-ab65-6fb27acff812', 'E', 'Discharge once headache settles', false, 4);

-- Q193
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('acd9d117-1390-5776-8b0e-b0904ec0921e', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000023', 'sba', 'A 25 year old woman with type 1 diabetes for 10 years is brought in drowsy. She had a stomach bug for 3 days and stopped taking her insulin because she was not eating. She has abdominal pain and deep sighing breathing. HR 125, BP 95/55, RR 32, temperature 37.4°C. Bloods: glucose 31 mmol/L, pH 7.05, bicarbonate 6, blood ketones 6.1, potassium 5.9, sodium 131, creatinine 140. What is the SINGLE most appropriate initial management in the first hour?', 'This is severe DKA (pH below 7.1, bicarbonate below 5-10, ketones over 6). JBDS: IV fluids, fixed-rate insulin, continue long-acting insulin, add potassium to fluids when it falls below 5.5. Look for precipitants. Consider HDU/ICU for severe DKA. Insulin should never be stopped during illness (sick day rules).', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v6', 'guidelines_text', 'JBDS')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = 'acd9d117-1390-5776-8b0e-b0904ec0921e';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('553de742-5d8d-5198-91ac-3a587dab04b0', 'acd9d117-1390-5776-8b0e-b0904ec0921e', 'A', 'Withhold fluids until glucose falls', false, 0),
  ('93b15187-eb08-5726-9886-b1546850d7a1', 'acd9d117-1390-5776-8b0e-b0904ec0921e', 'B', 'IV 0.9% saline (1 L over 1 hour, faster if systolic below 90), fixed-rate IV insulin infusion at 0.1 units/kg/hour, continue basal insulin, and monitor potassium hourly', true, 1),
  ('cd0581ae-6f16-514c-b4dd-48da2e315eed', 'acd9d117-1390-5776-8b0e-b0904ec0921e', 'C', 'Variable-rate insulin only', false, 2),
  ('e5fabb5f-3e0b-5216-95e4-1a014926fdd5', 'acd9d117-1390-5776-8b0e-b0904ec0921e', 'D', 'IV bicarbonate first', false, 3),
  ('b523361d-3b4b-52b4-b851-8756c5d9ec0f', 'acd9d117-1390-5776-8b0e-b0904ec0921e', 'E', 'Subcutaneous rapid-acting insulin and discharge', false, 4);

-- Q194
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('4e8dd7b0-ce5b-5c77-a981-d3ed7645b758', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000023', 'sba', 'A 72 year old woman is brought in by her son. She was found on the floor at 08:00 after an unwitnessed fall the previous evening. She is confused (baseline: independent, lives alone). She takes amlodipine, ramipril, furosemide and alendronic acid. Examination: temperature 35.0°C, HR 98, BP 105/60, dry mucous membranes, a pressure area over the right hip and a tender right hip with a shortened externally rotated leg. Bloods: CK 8,500 U/L, creatinine 210 (baseline 85), potassium 5.6. What is the MOST important immediate management priority?', 'A ''long lie'' causes rhabdomyolysis, AKI, hyperkalaemia, hypothermia, dehydration and pressure damage. Priorities: IV fluids, treat hyperkalaemia, warm, analgesia (fascia iliaca block), and confirm hip fracture. Stop nephrotoxic drugs (ramipril, furosemide). Look for the cause of the fall.', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v6')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = '4e8dd7b0-ce5b-5c77-a981-d3ed7645b758';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('4786d2d6-1f47-563d-ac04-00e3ca17e24f', '4e8dd7b0-ce5b-5c77-a981-d3ed7645b758', 'A', 'Immediate surgery before fluids', false, 0),
  ('b76364b9-a8b2-5a81-a3e3-ab7a0b2e6a73', '4e8dd7b0-ce5b-5c77-a981-d3ed7645b758', 'B', 'Oral fluids only', false, 1),
  ('8b50996d-5668-5434-8dd2-d77e8671accf', '4e8dd7b0-ce5b-5c77-a981-d3ed7645b758', 'C', 'Start furosemide', false, 2),
  ('b0ce1f03-ffb3-5095-9063-02fe741856f3', '4e8dd7b0-ce5b-5c77-a981-d3ed7645b758', 'D', 'CT head first in all', false, 3),
  ('2f4c5030-4519-5f99-857f-9a9987e5d671', '4e8dd7b0-ce5b-5c77-a981-d3ed7645b758', 'E', 'IV fluid resuscitation with monitoring of urine output and potassium, warming, analgesia and hip X-ray', true, 4);

-- Q195
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('91af796e-d891-54a5-b866-ab3391331a45', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000023', 'sba', 'A 19 year old student is brought to the ED by friends at 03:00. He has been at a party and they found him unresponsive. He is breathing slowly (RR 6) with pinpoint pupils. SpO2 is 84% on air. HR 58, BP 100/60. He has no injuries. His friends say he may have taken ''some pills and something to help him sleep''. After airway opening and bag-valve-mask ventilation with oxygen, what is the SINGLE most appropriate drug?', 'Opioid toxicity (pinpoint pupils, respiratory depression, reduced consciousness). Give naloxone (IV, IM or intranasal), titrated to breathing. Naloxone has a short half-life; observe for re-sedation (especially with long-acting opioids). Avoid flumazenil in mixed overdoses (seizure risk).', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v6')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = '91af796e-d891-54a5-b866-ab3391331a45';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('19a0ef3c-f3f6-554f-8a60-727adf649719', '91af796e-d891-54a5-b866-ab3391331a45', 'A', 'IV glucose', false, 0),
  ('f7550901-9f0f-5e18-b4f3-18cf31541b38', '91af796e-d891-54a5-b866-ab3391331a45', 'B', 'Activated charcoal immediately', false, 1),
  ('828b0827-7c29-532f-a037-53b7db648cfa', '91af796e-d891-54a5-b866-ab3391331a45', 'C', 'IV naloxone 400 micrograms, repeated and titrated to adequate breathing', true, 2),
  ('736331b9-0210-5ed4-b858-9d3472b6d5f8', '91af796e-d891-54a5-b866-ab3391331a45', 'D', 'IV flumazenil', false, 3),
  ('3e544fe3-052d-5330-ad26-82cae0e4efc0', '91af796e-d891-54a5-b866-ab3391331a45', 'E', 'IV adrenaline', false, 4);

-- Q196
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('5010985a-b620-5d0b-ac26-214fd596baf7', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000008', 'sba', 'A 31 year old woman, G2P1, is 36 weeks pregnant. She attends the maternity triage with a 2-day history of headache and seeing flashing lights. She also has pain under her right ribs. Her booking BP was 118/72. Today her BP is 162/108 on two readings 15 minutes apart. Urine dipstick shows 3+ protein. Bloods: Hb 108, platelets 85 x10^9/L, ALT 180 U/L, creatinine 95, LDH raised. CTG is reassuring. What is the SINGLE most appropriate management plan?', 'Severe pre-eclampsia with HELLP features (low platelets, raised liver enzymes, haemolysis). Treat BP, give magnesium sulfate to prevent eclampsia, and plan delivery once the mother is stable (at 36 weeks, steroids are not usually needed). Monitor fluid balance carefully (pulmonary oedema risk).', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v6')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = '5010985a-b620-5d0b-ac26-214fd596baf7';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('63525469-6dc2-596c-8a5b-f1db5cc4373c', '5010985a-b620-5d0b-ac26-214fd596baf7', 'A', 'Give furosemide', false, 0),
  ('c29d20d7-df25-5761-bced-b004bd6a8046', '5010985a-b620-5d0b-ac26-214fd596baf7', 'B', 'Treat BP (oral labetalol or nifedipine, IV labetalol if needed), give IV magnesium sulfate, and plan delivery after stabilisation', true, 1),
  ('1d12dbd9-62a6-5df3-9195-12d712dfec82', '5010985a-b620-5d0b-ac26-214fd596baf7', 'C', 'Wait until 40 weeks', false, 2),
  ('022194e1-752b-585b-a4a8-1054fc53b44b', '5010985a-b620-5d0b-ac26-214fd596baf7', 'D', 'Aspirin only', false, 3),
  ('4608535c-1dc5-53dc-947e-3acfece13d80', '5010985a-b620-5d0b-ac26-214fd596baf7', 'E', 'Discharge with home BP monitoring', false, 4);

-- Q197
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('ae578720-8e76-55c2-888c-a48c2035484c', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000008', 'sba', 'A 27 year old woman attends the ED with sudden-onset lower abdominal pain for 3 hours and shoulder tip pain. Her last period was 7 weeks ago. She had chlamydia treated 2 years ago. She is pale and sweaty. HR 124, BP 82/50, RR 22. Her abdomen is distended and tender with guarding. Urine pregnancy test is positive. What is the SINGLE most appropriate next step?', 'Ruptured ectopic pregnancy with haemodynamic instability needs immediate surgery (usually salpingectomy) while resuscitating. Risk factors: PID, previous ectopic, tubal surgery, IVF, IUD and smoking. Give anti-D if RhD negative. Do not delay surgery for imaging.', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v6')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = 'ae578720-8e76-55c2-888c-a48c2035484c';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('51b5b761-33c3-5db8-b7a9-d62d8e2e8436', 'ae578720-8e76-55c2-888c-a48c2035484c', 'A', 'Resuscitate (two large-bore cannulas, crossmatch, major haemorrhage protocol) and arrange immediate laparoscopy/laparotomy', true, 0),
  ('a521ca16-8eb6-5f6b-a460-7230b7e0ae2d', 'ae578720-8e76-55c2-888c-a48c2035484c', 'B', 'Transvaginal ultrasound and repeat hCG in 48 hours', false, 1),
  ('28bec00e-76a0-5a4c-8b08-7a3ab2b24335', 'ae578720-8e76-55c2-888c-a48c2035484c', 'C', 'Methotrexate', false, 2),
  ('ce46c301-ee41-5569-80fa-5ae795e2cf13', 'ae578720-8e76-55c2-888c-a48c2035484c', 'D', 'Discharge with analgesia', false, 3),
  ('2c21dcb7-c1b8-5aee-9ce8-df15bfd463f6', 'ae578720-8e76-55c2-888c-a48c2035484c', 'E', 'Expectant management', false, 4);

-- Q198
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('521861f5-47cf-5eaf-be4c-868d7231c236', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000008', 'sba', 'A 35 year old woman, para 3, had a vaginal delivery of a 4.3 kg baby 20 minutes ago after a long labour augmented with oxytocin. The placenta was delivered complete. She is now bleeding heavily (estimated loss 1,500 mL). HR 120, BP 88/50. Her uterus is soft and boggy at the umbilicus. What is the SINGLE most likely cause and first step?', 'Major postpartum haemorrhage: risk factors here are macrosomia, multiparity, prolonged and augmented labour. Atony (tone) is the commonest cause. Escalate through drugs, then balloon tamponade, then surgical methods. Major haemorrhage protocol and tranexamic acid.', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v6')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = '521861f5-47cf-5eaf-be4c-868d7231c236';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('f8fd3835-38f9-57a7-a55a-ad8d414b2cb9', '521861f5-47cf-5eaf-be4c-868d7231c236', 'A', 'Uterine inversion; replace the uterus', false, 0),
  ('2bafa398-9853-58b3-a20e-361f01ec4718', '521861f5-47cf-5eaf-be4c-868d7231c236', 'B', 'Perineal tear; suturing first', false, 1),
  ('1dd8be44-065e-5f99-a461-8bec55f8061e', '521861f5-47cf-5eaf-be4c-868d7231c236', 'C', 'Uterine atony; call for help, bimanual uterine compression and uterotonics (oxytocin, ergometrine, carboprost), with resuscitation and tranexamic acid', true, 2),
  ('5931c510-5978-522e-9a28-c2fdc9955743', '521861f5-47cf-5eaf-be4c-868d7231c236', 'D', 'Coagulopathy; give FFP only', false, 3),
  ('a48bde27-92a9-54b9-8fbc-3df9171ad969', '521861f5-47cf-5eaf-be4c-868d7231c236', 'E', 'Retained placenta; manual removal first', false, 4);

-- Q199
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('4196c4c7-c895-5484-a9c5-941dc3d7a513', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000008', 'sba', 'A 29 year old woman is 32 weeks pregnant with her first baby. She attends with reduced fetal movements for 24 hours. She is a smoker and her fundal height has been measuring small for dates. Her BP is normal. Ultrasound shows estimated fetal weight below the 3rd centile, reduced liquor and absent end-diastolic flow in the umbilical artery. CTG is normal. What is the SINGLE most appropriate management?', 'Severe fetal growth restriction with absent end-diastolic flow indicates placental insufficiency and fetal risk. Admit, give steroids, and plan delivery (often by caesarean) based on further Doppler (ductus venosus) and CTG. Reduced fetal movements always need same-day assessment.', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v6')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = '4196c4c7-c895-5484-a9c5-941dc3d7a513';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('1ef14003-15cb-5656-b92b-76cdd17431ed', '4196c4c7-c895-5484-a9c5-941dc3d7a513', 'A', 'Admit, give antenatal corticosteroids (and magnesium sulfate if delivery planned), and plan delivery with close fetal monitoring by a senior obstetrician', true, 0),
  ('2afa85e0-360c-54ea-ab79-4c0400b3f589', '4196c4c7-c895-5484-a9c5-941dc3d7a513', 'B', 'Induce labour immediately without steroids', false, 1),
  ('3c71bd35-2c31-591c-8832-b159c98da574', '4196c4c7-c895-5484-a9c5-941dc3d7a513', 'C', 'Discharge and repeat scan in 2 weeks', false, 2),
  ('de1b39f9-92f7-51a7-88a2-d46c6d06df50', '4196c4c7-c895-5484-a9c5-941dc3d7a513', 'D', 'Reassure as movements vary', false, 3),
  ('294d94e6-9fee-5a1b-9fc8-d7edbfd8179d', '4196c4c7-c895-5484-a9c5-941dc3d7a513', 'E', 'Wait until 40 weeks', false, 4);

-- Q200
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('5b8818bc-7346-5d33-b90b-0d7d7b53ec2a', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000009', 'sba', 'A 3 week old boy is brought in by his parents. He was born at term and was well until 3 days ago. Since then he has been feeding poorly and is more sleepy. Today he had a temperature of 38.3°C at home. On examination he is irritable when handled, with a capillary refill time of 3 seconds, HR 185 and RR 60. The anterior fontanelle is full. There is no rash. What is the SINGLE most appropriate management?', 'A febrile baby under 1 month is high risk. A full fontanelle and irritability suggest meningitis. Under 3 months: cefotaxime plus amoxicillin (Listeria and group B strep). Do not delay antibiotics for LP if unwell. Check glucose. Group B strep and E. coli are common causes.', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v6')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = '5b8818bc-7346-5d33-b90b-0d7d7b53ec2a';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('dd41760f-27ae-5185-b750-4223bc1bf3d0', '5b8818bc-7346-5d33-b90b-0d7d7b53ec2a', 'A', 'Paracetamol and observation', false, 0),
  ('9593a5df-25fb-5623-b376-e760174f7555', '5b8818bc-7346-5d33-b90b-0d7d7b53ec2a', 'B', 'Oral antibiotics and review tomorrow', false, 1),
  ('0133524a-8473-52f0-a700-a6320ccfebc7', '5b8818bc-7346-5d33-b90b-0d7d7b53ec2a', 'C', 'Full septic screen including lumbar puncture (if no contraindication) and IV cefotaxime plus amoxicillin, without delay', true, 2),
  ('8cd5c5e1-820e-5087-a83d-6a0dbf7accde', '5b8818bc-7346-5d33-b90b-0d7d7b53ec2a', 'D', 'Discharge with safety-netting', false, 3),
  ('e81bea5b-969e-5e62-8224-c0fdf0c80529', '5b8818bc-7346-5d33-b90b-0d7d7b53ec2a', 'E', 'Urine test only', false, 4);

