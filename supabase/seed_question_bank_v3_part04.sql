-- =============================================================================
-- PLAB 1 bank v3 import PART 4 (Q601–800 of 830)
-- Paste AFTER seed_topics_expand.sql. Additive to banks v1/v2 — do NOT clear.
-- =============================================================================

-- Q601
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('4f3b0d85-5e7f-57df-9295-514b5f31ad6b', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000036', 'sba', 'A couple have had two pregnancies with neural tube defects. What is the SINGLE most important advice for the next pregnancy?', 'Neural tube defects are multifactorial. High-dose folic acid (5 mg) is advised for women at higher risk: a previous NTD pregnancy, a family history, taking anti-epileptics, diabetes, BMI 30 or more, sickle cell disease or thalassaemia. Start before conception and continue for the first 12 weeks. The UK is introducing mandatory folic acid fortification of non-wholemeal wheat flour (from late 2026).', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v3')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = '4f3b0d85-5e7f-57df-9295-514b5f31ad6b';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('0b4131a5-cc49-5cc6-8a89-dc122c21d01e', '4f3b0d85-5e7f-57df-9295-514b5f31ad6b', 'A', 'Avoid all dairy products', false, 0),
  ('8aeca671-5579-51ac-a5a8-5c910f13367a', '4f3b0d85-5e7f-57df-9295-514b5f31ad6b', 'B', 'No supplement is needed', false, 1),
  ('b9562d8f-51df-59b2-b8b8-f883d1d31a2c', '4f3b0d85-5e7f-57df-9295-514b5f31ad6b', 'C', 'Standard 400 microgram folic acid from 20 weeks', false, 2),
  ('528273cb-c706-5ffd-8594-463353018190', '4f3b0d85-5e7f-57df-9295-514b5f31ad6b', 'D', 'High-dose folic acid (5 mg daily) from before conception until 12 weeks', true, 3),
  ('5bf1e4b1-b442-57c2-82bb-0898c6d33b19', '4f3b0d85-5e7f-57df-9295-514b5f31ad6b', 'E', 'Vitamin A supplements', false, 4);

-- Q602
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('41b521c8-73d6-5659-af72-b6b468cec645', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000036', 'sba', 'A 16 year old boy is tall with long limbs, scoliosis, a high-arched palate, lens dislocation (upwards) and a dilated aortic root. Which gene is MOST likely mutated?', 'Marfan syndrome (FBN1, autosomal dominant) causes tall stature, arachnodactyly, joint hypermobility, pectus deformity, upward lens dislocation, aortic root dilatation and dissection, and mitral valve prolapse. Homocystinuria causes a marfanoid habitus but downward lens dislocation, learning disability and thrombosis. Regular echo, BP control (beta-blockers or ARBs) and prophylactic aortic root surgery are used.', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v3')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = '41b521c8-73d6-5659-af72-b6b468cec645';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('e60af661-31ab-5fee-b589-6f2eea9a696b', '41b521c8-73d6-5659-af72-b6b468cec645', 'A', 'CBS (homocystinuria)', false, 0),
  ('397b908b-0e29-53eb-b72a-d04105496279', '41b521c8-73d6-5659-af72-b6b468cec645', 'B', 'PMP22', false, 1),
  ('7f100314-2bef-5a5b-8133-62cb9a0ff7e7', '41b521c8-73d6-5659-af72-b6b468cec645', 'C', 'FBN1 (fibrillin-1), autosomal dominant', true, 2),
  ('5ff5778a-7b6b-504a-a187-1d43af51c7fb', '41b521c8-73d6-5659-af72-b6b468cec645', 'D', 'COL3A1', false, 3),
  ('84c90757-f008-5b92-a2c2-dbe9c21fa93e', '41b521c8-73d6-5659-af72-b6b468cec645', 'E', 'COL1A1', false, 4);

-- Q603
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('0114a685-070f-5fba-868d-f0184393eff8', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000036', 'sba', 'A child has two café-au-lait macules and no other features. His father has NF1. What is the chance that the child has inherited NF1?', 'NF1 is autosomal dominant with complete penetrance but variable expression. Each child of an affected parent has a 50% chance of inheriting it. Diagnostic criteria include 6 or more café-au-lait macules (over 5 mm before puberty, over 15 mm after), 2 or more neurofibromas or 1 plexiform neurofibroma, axillary or inguinal freckling, optic glioma, 2 or more Lisch nodules, a characteristic bony lesion and a first-degree relative with NF1. Genetic testing can confirm.', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v3')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = '0114a685-070f-5fba-868d-f0184393eff8';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('794f569d-2c3b-59d7-8451-214569111e54', '0114a685-070f-5fba-868d-f0184393eff8', 'A', '0%', false, 0),
  ('ad456998-2348-5d1f-8c10-72c4b2a4323f', '0114a685-070f-5fba-868d-f0184393eff8', 'B', '12.5%', false, 1),
  ('60c34aa1-0423-5924-afa9-578c55568e0f', '0114a685-070f-5fba-868d-f0184393eff8', 'C', '25%', false, 2),
  ('9fc98d76-4e06-555f-b02f-746b18ff79ff', '0114a685-070f-5fba-868d-f0184393eff8', 'D', '50%', true, 3),
  ('c4328e6b-4c58-5105-91a2-9dcf32255af3', '0114a685-070f-5fba-868d-f0184393eff8', 'E', '100%', false, 4);

-- Q604
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('41fe9a20-d78f-5b70-927c-308a712d355f', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000027', 'sba', 'A 35 year old man has had a cough with clear sputum for 10 days after a cold. He is otherwise well, with normal observations and a clear chest. What is the SINGLE most appropriate management?', 'NICE NG120: acute cough is usually viral and self-limiting (up to 3-4 weeks). Antibiotics are not offered to people who are not systemically unwell or at high risk of complications. Advise honey, fluids and over-the-counter remedies. Safety-net for breathlessness, haemoptysis, chest pain or persistence beyond 3 weeks (CXR if over 40 and a smoker, per NICE NG12 cancer criteria).', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v3')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = '41fe9a20-d78f-5b70-927c-308a712d355f';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('c4ccd268-51f2-561a-be66-f444bb15e396', '41fe9a20-d78f-5b70-927c-308a712d355f', 'A', 'Oral prednisolone', false, 0),
  ('4dd070e5-1767-53fc-93f9-e8bbf16a5470', '41fe9a20-d78f-5b70-927c-308a712d355f', 'B', 'Self-care advice (honey, fluids, simple analgesia), no antibiotics, and safety-netting (cough may last 3 weeks)', true, 1),
  ('16692dd6-2e48-52d5-8ad2-7cc6a41d7f1f', '41fe9a20-d78f-5b70-927c-308a712d355f', 'C', 'Oral amoxicillin for 5 days', false, 2),
  ('76279208-9e32-5d7e-840c-07da158da517', '41fe9a20-d78f-5b70-927c-308a712d355f', 'D', 'Salbutamol inhaler', false, 3),
  ('3b8e7325-e7e1-5386-9f3b-694d7009d9bc', '41fe9a20-d78f-5b70-927c-308a712d355f', 'E', 'Chest X-ray', false, 4);

-- Q605
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('34d80e56-3529-54f3-a0e5-f1ec05b78279', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000027', 'sba', 'An 82 year old care home resident is more confused. The staff send a urine dipstick, which is positive for leucocytes and nitrites. She has no urinary symptoms, fever or other signs of infection. What is the SINGLE most appropriate advice?', 'In people over 65, asymptomatic bacteriuria is very common and urine dipsticks are unreliable (UKHSA guidance). Diagnose UTI on clinical features (new dysuria, frequency, urgency, new incontinence, fever, rigors, suprapubic or loin pain), and send a culture if UTI is suspected. Look for other causes of delirium (dehydration, constipation, medication, other infections).', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v3')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = '34d80e56-3529-54f3-a0e5-f1ec05b78279';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('98a75006-1796-5b18-a9fe-a8dd0de919f3', '34d80e56-3529-54f3-a0e5-f1ec05b78279', 'A', 'Do not use urine dipsticks to diagnose UTI in people over 65; assess clinically for other causes of confusion', true, 0),
  ('cd0bcc0d-7b31-55ab-9645-1a3eaea5dbcb', '34d80e56-3529-54f3-a0e5-f1ec05b78279', 'B', 'Start antibiotics based on the dipstick', false, 1),
  ('324c4feb-11fd-56d3-81b7-0a9bce6da1d1', '34d80e56-3529-54f3-a0e5-f1ec05b78279', 'C', 'Insert a urinary catheter', false, 2),
  ('420455cd-f16c-549b-bbc5-5943787775ac', '34d80e56-3529-54f3-a0e5-f1ec05b78279', 'D', 'Repeat the dipstick daily', false, 3),
  ('b727db15-72e6-591e-a79e-0d72f27e3e04', '34d80e56-3529-54f3-a0e5-f1ec05b78279', 'E', 'Admit to hospital', false, 4);

-- Q606
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('24bbee62-1d10-5b55-9d87-8b541757c731', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000027', 'sba', 'A 4 year old boy has chickenpox. His mother asks when he can go back to nursery. What is the CORRECT advice in the UK?', 'UKHSA guidance: children with chickenpox should stay off school or nursery until all vesicles have crusted over (usually 5 days after the rash starts). Avoid contact with pregnant women, newborns and immunosuppressed people. Avoid NSAIDs (they are linked to severe skin infections). For conjunctivitis, no exclusion is needed. Hand, foot and mouth needs no exclusion if well.', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v3')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = '24bbee62-1d10-5b55-9d87-8b541757c731';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('d84c73d0-353d-53c0-995f-6c12f016d5e7', '24bbee62-1d10-5b55-9d87-8b541757c731', 'A', 'He can go back immediately', false, 0),
  ('1ed96e5a-1997-5816-b7ef-bf98540c8f03', '24bbee62-1d10-5b55-9d87-8b541757c731', 'B', 'After 21 days', false, 1),
  ('20d9cb3f-e246-59b9-b262-c3559ec00bf8', '24bbee62-1d10-5b55-9d87-8b541757c731', 'C', 'Only when all scabs have fallen off and the skin has healed completely', false, 2),
  ('8a936ada-6296-576a-9bdd-409d2c5d4ea4', '24bbee62-1d10-5b55-9d87-8b541757c731', 'D', 'When all the spots have crusted over (usually about 5 days after the rash appears)', true, 3),
  ('4bc18950-b4f2-5f14-b311-6bc8611ee9c9', '24bbee62-1d10-5b55-9d87-8b541757c731', 'E', 'After 48 hours of antibiotics', false, 4);

-- Q607
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('e101fa25-a44c-5964-8b3b-55f490eb40f6', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000027', 'sba', 'A 60 year old woman asks how much alcohol is safe. What are the UK Chief Medical Officers'' low-risk drinking guidelines?', 'UK CMO guidelines (2016): men and women should not regularly drink more than 14 units a week, spread over 3 or more days. There is no completely safe level. One unit is 10 mL (8 g) of pure alcohol (for example, a pint of 4% beer is about 2.3 units, and a 175 mL glass of 12% wine is about 2.1 units). AUDIT-C screens for harmful drinking.', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v3')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = 'e101fa25-a44c-5964-8b3b-55f490eb40f6';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('929ed89e-0893-5550-9081-4efe48420042', 'e101fa25-a44c-5964-8b3b-55f490eb40f6', 'A', 'No more than 14 units a week, spread over 3 or more days, with several drink-free days', true, 0),
  ('c637fe6b-f227-548b-bb39-df5aa343a45b', 'e101fa25-a44c-5964-8b3b-55f490eb40f6', 'B', 'There is no recommended limit', false, 1),
  ('32b3716a-c142-53fb-877f-a640a0cd56c1', 'e101fa25-a44c-5964-8b3b-55f490eb40f6', 'C', 'Up to 6 units a day is safe for everyone', false, 2),
  ('4b412fab-dfc2-5a06-9918-426fc4ae891a', 'e101fa25-a44c-5964-8b3b-55f490eb40f6', 'D', 'No more than 28 units a week', false, 3),
  ('9c8f11ca-4f8e-5b7e-bf51-dcd71712ae80', 'e101fa25-a44c-5964-8b3b-55f490eb40f6', 'E', 'No more than 21 units a week for women', false, 4);

-- Q608
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('034142ce-c98a-5770-a199-580d97ff3ff1', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000027', 'sba', 'A 55 year old man drinks 40 units a week and has an AUDIT score of 16. He is not dependent. What is the SINGLE most appropriate intervention in primary care?', 'AUDIT scores: 8-15 indicates hazardous drinking (simple brief advice); 16-19 harmful drinking (extended brief intervention); 20 or more possible dependence (refer to specialist services, and consider medically assisted withdrawal). Brief interventions in primary care reduce alcohol consumption. Check LFTs and look for complications.', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v3')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = '034142ce-c98a-5770-a199-580d97ff3ff1';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('1b08eeca-6070-5562-bc86-2da940e8d7cf', '034142ce-c98a-5770-a199-580d97ff3ff1', 'A', 'Brief intervention (structured advice) with an extended brief intervention or referral if needed', true, 0),
  ('bcedbb06-ee18-534c-ab13-6e23dd6f2a21', '034142ce-c98a-5770-a199-580d97ff3ff1', 'B', 'Prescribe chlordiazepoxide', false, 1),
  ('24f5d2ff-eef4-5d61-b2a2-b31537788440', '034142ce-c98a-5770-a199-580d97ff3ff1', 'C', 'Prescribe disulfiram', false, 2),
  ('8e5de97c-4d00-5b59-977c-f9c3e4d95fd2', '034142ce-c98a-5770-a199-580d97ff3ff1', 'D', 'Ignore it', false, 3),
  ('22fdb2e1-552a-51a1-9240-84de2a069a45', '034142ce-c98a-5770-a199-580d97ff3ff1', 'E', 'Immediate inpatient detoxification', false, 4);

-- Q609
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('d2dd802e-5029-57e4-9d8e-6a23816e972f', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000027', 'sba', 'A 45 year old woman has a BMI of 31 and type 2 diabetes. She wants to lose weight. According to NICE, at what BMI threshold can bariatric surgery be considered for her if lifestyle measures fail and she has a weight-related comorbidity?', 'NICE CG189/NG246: bariatric surgery is considered for BMI 40 or more, or 35-40 with significant comorbidities, when other measures fail. Expedited assessment is offered for BMI 35 or more with recent-onset type 2 diabetes, and considered for BMI 30-34.9 with recent-onset type 2 diabetes. Thresholds are 2.5 points lower for South Asian, Chinese, Black African and Caribbean groups.', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v3')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = 'd2dd802e-5029-57e4-9d8e-6a23816e972f';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('0671df92-7730-5c8f-ae47-acde81b9a3e2', 'd2dd802e-5029-57e4-9d8e-6a23816e972f', 'A', 'BMI 50 only', false, 0),
  ('ea97fca1-ad76-52c1-b437-eac4f1033398', 'd2dd802e-5029-57e4-9d8e-6a23816e972f', 'B', 'BMI 25', false, 1),
  ('643f9219-9635-5d06-8d61-029f85dc0dec', 'd2dd802e-5029-57e4-9d8e-6a23816e972f', 'C', 'Never in diabetes', false, 2),
  ('2ef41889-c29c-5d26-8a9a-e05b307f6854', 'd2dd802e-5029-57e4-9d8e-6a23816e972f', 'D', 'BMI 28', false, 3),
  ('217c5473-28bc-51ef-a710-4c35a95e2395', 'd2dd802e-5029-57e4-9d8e-6a23816e972f', 'E', 'BMI 35 or more (or 30-34.9 with recent-onset type 2 diabetes, considered for assessment; lower thresholds for some ethnic groups)', true, 4);

-- Q610
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('45e8b32b-e632-5f8d-98e2-66c0aef5169a', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000027', 'sba', 'A 42 year old man has had trouble falling asleep and staying asleep for 6 months, affecting his work. He drinks coffee late in the day. What is the SINGLE most appropriate first-line treatment?', 'Chronic insomnia (3 or more nights a week for 3 months or more) is best treated with CBT-I (including stimulus control and sleep restriction), which is available digitally (such as Sleepio, recommended by NICE). Hypnotics should only be used short-term (up to 2 weeks) for severe acute insomnia. Address caffeine, alcohol, screens and underlying causes (depression, pain, OSA).', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v3')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = '45e8b32b-e632-5f8d-98e2-66c0aef5169a';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('0ff34a85-7a2f-524a-8298-dc33d3a94ef4', '45e8b32b-e632-5f8d-98e2-66c0aef5169a', 'A', 'Long-term zopiclone', false, 0),
  ('815dacc0-5b8c-5b1a-b160-0208f8982076', '45e8b32b-e632-5f8d-98e2-66c0aef5169a', 'B', 'Long-term diazepam', false, 1),
  ('73cbe818-27fd-5f02-9829-2fdea4604065', '45e8b32b-e632-5f8d-98e2-66c0aef5169a', 'C', 'Melatonin for all adults', false, 2),
  ('87b2478f-7900-5c8f-ad3c-364aa0c11788', '45e8b32b-e632-5f8d-98e2-66c0aef5169a', 'D', 'Cognitive behavioural therapy for insomnia (CBT-I), with sleep hygiene advice', true, 3),
  ('646bff7f-145d-5f84-b28a-f95ec40b2f76', '45e8b32b-e632-5f8d-98e2-66c0aef5169a', 'E', 'Sedating antihistamines long-term', false, 4);

-- Q611
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('6ae470b6-a860-5660-9e61-8d294ad3c494', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000027', 'sba', 'A 30 year old woman has had extreme tiredness for 8 months. It is worse after minor activity, with post-exertional malaise lasting days, unrefreshing sleep and poor concentration. Blood tests are normal. What is the SINGLE most likely diagnosis and approach?', 'NICE NG206 (2021): suspect ME/CFS with debilitating fatigue, post-exertional malaise, unrefreshing sleep and cognitive difficulties for at least 6 weeks (adults) and diagnose at 3 months. Do not offer graded exercise therapy. Offer energy management, symptom management and support from a specialist team. Exclude other causes with tests.', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v3')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = '6ae470b6-a860-5660-9e61-8d294ad3c494';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('04626b06-0a8c-52e3-a160-5ff962ecbde6', '6ae470b6-a860-5660-9e61-8d294ad3c494', 'A', 'Fibromyalgia; graded exercise therapy', false, 0),
  ('9391ed8a-f777-5e39-871c-34053ad33360', '6ae470b6-a860-5660-9e61-8d294ad3c494', 'B', 'Depression; start an SSRI only', false, 1),
  ('e19bf739-4ff3-5ff4-9714-7bdbd4c5a35d', '6ae470b6-a860-5660-9e61-8d294ad3c494', 'C', 'Malingering; no treatment', false, 2),
  ('b1a51cf0-a64d-5931-b6ea-93b16199eca4', '6ae470b6-a860-5660-9e61-8d294ad3c494', 'D', 'ME/chronic fatigue syndrome; energy management and symptom management with specialist support (graded exercise therapy should NOT be used)', true, 3),
  ('5e405e8e-8274-5aa4-9b62-1e993d9fe808', '6ae470b6-a860-5660-9e61-8d294ad3c494', 'E', 'Hypothyroidism; levothyroxine', false, 4);

-- Q612
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('5c3b1c95-0d94-5fa3-813f-5a8a63824216', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000027', 'sba', 'A 48 year old woman has had dyspepsia for 2 months. She has no alarm features, takes no NSAIDs and is under 55. What is the SINGLE most appropriate initial management per NICE?', 'NICE CG184: for uninvestigated dyspepsia without alarm features, give lifestyle advice, review medications (NSAIDs, calcium channel blockers, bisphosphonates), and offer either 4 weeks of full-dose PPI or test and treat for H. pylori (if one fails, try the other). Alarm features (age 55 or more with weight loss, dysphagia, upper abdominal mass, GI bleeding, persistent vomiting) need urgent endoscopy.', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v3')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = '5c3b1c95-0d94-5fa3-813f-5a8a63824216';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('9392fce4-c6c9-5217-914e-53c28b88a1a4', '5c3b1c95-0d94-5fa3-813f-5a8a63824216', 'A', 'Either a 4-week course of full-dose PPI or ''test and treat'' for H. pylori (with lifestyle advice)', true, 0),
  ('320591d1-863f-58ec-ad08-602ade7b9a98', '5c3b1c95-0d94-5fa3-813f-5a8a63824216', 'B', 'Barium meal', false, 1),
  ('db6aa38b-1784-547a-bf7b-0e58aa144d6f', '5c3b1c95-0d94-5fa3-813f-5a8a63824216', 'C', 'Urgent endoscopy', false, 2),
  ('9c3408e6-b7a8-504d-8b6b-089c0ec810ea', '5c3b1c95-0d94-5fa3-813f-5a8a63824216', 'D', 'Long-term antacids only', false, 3),
  ('d492673f-d099-51da-a28c-399a2c693d94', '5c3b1c95-0d94-5fa3-813f-5a8a63824216', 'E', 'Abdominal CT', false, 4);

-- Q613
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('5d17f2a5-efce-5e8b-978d-73f12dee1dc7', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000027', 'sba', 'A 9 year old child has a painful verruca on his foot. He is otherwise well. What is the SINGLE most appropriate advice?', 'Viral warts and verrucas (HPV) usually resolve without treatment (about two-thirds within 2 years in children). Treatments include topical salicylic acid (with regular paring) and cryotherapy. They are not a reason to exclude children from school or swimming, but advise covering the verruca and not sharing towels. Refer atypical, facial or extensive warts, or warts in immunosuppressed people.', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v3')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = '5d17f2a5-efce-5e8b-978d-73f12dee1dc7';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('fe88f7fb-53f1-5534-8186-488dd78582ba', '5d17f2a5-efce-5e8b-978d-73f12dee1dc7', 'A', 'Systemic antivirals', false, 0),
  ('816bb94b-3a6d-5150-867d-55c828e3fc51', '5d17f2a5-efce-5e8b-978d-73f12dee1dc7', 'B', 'Exclude from swimming lessons', false, 1),
  ('fc9bfb49-b760-5947-8c7a-17a025f0d040', '5d17f2a5-efce-5e8b-978d-73f12dee1dc7', 'C', 'Oral antibiotics', false, 2),
  ('51d35fff-6503-52ef-a912-24f4509693c5', '5d17f2a5-efce-5e8b-978d-73f12dee1dc7', 'D', 'Surgical excision', false, 3),
  ('e02e3aa5-5491-5ead-8628-0e8d2079b830', '5d17f2a5-efce-5e8b-978d-73f12dee1dc7', 'E', 'Reassure that most resolve without treatment within 2 years; topical salicylic acid or cryotherapy can be used if painful or troublesome', true, 4);

-- Q614
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('bf85ea27-9a26-5684-af7c-624ca40154a7', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000027', 'sba', 'A 28 year old woman who is 28 weeks pregnant asks which vaccines are recommended during pregnancy in the UK. Which is CORRECT?', 'UK pregnancy vaccination: pertussis (ideally 16-32 weeks), seasonal influenza at any stage, RSV vaccine (Abrysvo, from 28 weeks since September 2024) to protect the baby, and COVID-19 as advised. Live vaccines (MMR, varicella, BCG, yellow fever) are generally contraindicated in pregnancy.', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v3')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = 'bf85ea27-9a26-5684-af7c-624ca40154a7';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('3814a775-52af-5c48-8ecd-1c049fe12301', 'bf85ea27-9a26-5684-af7c-624ca40154a7', 'A', 'BCG in pregnancy', false, 0),
  ('7f0b6750-a3fa-59a4-b1cc-8a561f86ea12', 'bf85ea27-9a26-5684-af7c-624ca40154a7', 'B', 'MMR in pregnancy', false, 1),
  ('5c70ee94-b0e2-54c1-9ca5-9721bb335ea5', 'bf85ea27-9a26-5684-af7c-624ca40154a7', 'C', 'Pertussis (whooping cough), influenza (in season), RSV (from 28 weeks), and COVID-19 as offered', true, 2),
  ('77e38e45-cbce-5434-aa69-ad44d7186b2d', 'bf85ea27-9a26-5684-af7c-624ca40154a7', 'D', 'Varicella vaccine in pregnancy', false, 3),
  ('78723f35-a24f-5c5d-a531-55391a8b06f7', 'bf85ea27-9a26-5684-af7c-624ca40154a7', 'E', 'No vaccines are recommended in pregnancy', false, 4);

-- Q615
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('1a8a5887-857b-538e-94d3-8b584446ed9f', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000027', 'sba', 'A 62 year old man has unexplained weight loss of 6 kg over 3 months. He has no other symptoms. Examination is normal. Which test does NICE NG12 suggest for unexplained weight loss in adults 55 and over, when considering upper GI or other cancers?', 'NICE NG12 lists unexplained weight loss as a feature for several cancers (lung, upper GI, colorectal, pancreatic, renal). Consider chest X-ray, FBC and other bloods, FIT, urgent CT for pancreatic cancer (if over 60), and referral via a rapid diagnostic centre (non-specific symptoms pathway). Also consider non-cancer causes (diabetes, thyroid, depression).', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v3')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = '1a8a5887-857b-538e-94d3-8b584446ed9f';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('9221e5e9-4957-50bf-95de-44cec53f445e', '1a8a5887-857b-538e-94d3-8b584446ed9f', 'A', 'No tests; review in 6 months', false, 0),
  ('f514be09-c1cd-5a66-9844-7bb6b339f7c2', '1a8a5887-857b-538e-94d3-8b584446ed9f', 'B', 'Colonoscopy only', false, 1),
  ('d466df0d-f5df-5ff4-8839-b1f7913bee36', '1a8a5887-857b-538e-94d3-8b584446ed9f', 'C', 'Tumour markers only', false, 2),
  ('ce57d7f3-eb08-53ad-bf4a-f07edb6ddaf3', '1a8a5887-857b-538e-94d3-8b584446ed9f', 'D', 'Urgent chest X-ray, bloods and FIT, plus direct-access upper GI endoscopy if indicated by associated features (with referral via a non-specific symptoms pathway)', true, 3),
  ('b979058d-ffe1-5650-8963-70e6f42d5522', '1a8a5887-857b-538e-94d3-8b584446ed9f', 'E', 'PET scan in primary care', false, 4);

-- Q616
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('405af5e0-664c-5441-b913-55003468b3e0', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000027', 'sba', 'A 45 year old woman with type 2 diabetes attends her annual diabetes review. Which group of checks should be done annually?', 'NICE NG28 annual review includes: HbA1c (every 3-6 months until stable), BP, lipids and CVD risk, renal function (eGFR, ACR), foot examination (10 g monofilament and pulses, with risk stratification), referral to retinal screening, weight, smoking, mental health and education. Erectile dysfunction should also be asked about.', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v3')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = '405af5e0-664c-5441-b913-55003468b3e0';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('e441af07-4bf1-57f5-a0f5-2f06622639f7', '405af5e0-664c-5441-b913-55003468b3e0', 'A', 'HbA1c, BP, lipids, urine ACR and eGFR, foot examination (pulses and sensation), retinal screening, BMI and smoking status', true, 0),
  ('f5a69035-3f21-5663-bd4e-64ef9ee7f171', '405af5e0-664c-5441-b913-55003468b3e0', 'B', 'Echocardiogram and spirometry', false, 1),
  ('baefcd88-735c-598c-a29f-662c30d3fc6f', '405af5e0-664c-5441-b913-55003468b3e0', 'C', 'Only blood glucose', false, 2),
  ('a2b48ae3-3673-5524-9380-ea9e2fa15d2f', '405af5e0-664c-5441-b913-55003468b3e0', 'D', 'Liver ultrasound', false, 3),
  ('4cc97baf-4b5b-540c-8d33-bba8b7156248', '405af5e0-664c-5441-b913-55003468b3e0', 'E', 'Only HbA1c', false, 4);

-- Q617
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('31d2a3f2-ed02-5232-a499-73352c69c73e', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000027', 'sba', 'A 72 year old man attends for a routine BP check. His pulse is irregularly irregular. He has no symptoms. What is the SINGLE most appropriate next step?', 'NICE NG196: perform a manual pulse check when AF is suspected (breathlessness, palpitations, syncope, stroke). An irregular pulse should prompt a 12-lead ECG. If AF is confirmed, assess CHA2DS2-VASc (or CHA2DS2-VA in newer guidance) and ORBIT bleeding risk, decide on anticoagulation, rate control and echo. Aspirin alone is not used for stroke prevention.', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v3')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = '31d2a3f2-ed02-5232-a499-73352c69c73e';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('6d34c32c-5258-5f1e-abf9-4e8c85d066b1', '31d2a3f2-ed02-5232-a499-73352c69c73e', 'A', 'Refer for urgent cardiology admission', false, 0),
  ('724b9690-992d-52f8-8e0c-029ce0d8f25b', '31d2a3f2-ed02-5232-a499-73352c69c73e', 'B', '12-lead ECG to confirm atrial fibrillation, then assess stroke and bleeding risk', true, 1),
  ('902b4659-786b-5f5c-966b-8f7a182e668b', '31d2a3f2-ed02-5232-a499-73352c69c73e', 'C', 'Start aspirin', false, 2),
  ('d4ec6c8f-980d-5318-97c2-86687f5672e5', '31d2a3f2-ed02-5232-a499-73352c69c73e', 'D', '24-hour tape only after 6 months', false, 3),
  ('1226545e-2652-5425-9bbf-f041e1487e75', '31d2a3f2-ed02-5232-a499-73352c69c73e', 'E', 'Reassure; it is normal for his age', false, 4);

-- Q618
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('7654c5f3-a023-5ddf-b49a-87c34289d3e4', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000027', 'sba', 'A 45 year old woman has had her BP checked at home. Her average home reading is 128/82 mmHg, but her clinic BP was 154/96. What does this suggest?', 'NICE uses ABPM or home BP monitoring to confirm hypertension (daytime average of 135/85 or more). A clinic reading 20/10 mmHg higher than ABPM or home readings suggests white coat effect. Masked hypertension is the opposite: normal clinic but raised ambulatory readings. Recheck periodically, as white coat hypertension can progress.', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v3')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = '7654c5f3-a023-5ddf-b49a-87c34289d3e4';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('ef4fa49f-ba87-52f1-bbcf-26d19c6cf5b7', '7654c5f3-a023-5ddf-b49a-87c34289d3e4', 'A', 'Stage 2 hypertension', false, 0),
  ('afdba15c-a49c-5ca4-937b-3e9db42ce8a3', '7654c5f3-a023-5ddf-b49a-87c34289d3e4', 'B', 'White coat hypertension (no diagnosis of hypertension at present; recheck periodically)', true, 1),
  ('be0f7b07-8b58-5014-907f-436c7d9b2f80', '7654c5f3-a023-5ddf-b49a-87c34289d3e4', 'C', 'Malignant hypertension', false, 2),
  ('22a3531c-a7b7-5fcb-830a-578a795f2f51', '7654c5f3-a023-5ddf-b49a-87c34289d3e4', 'D', 'Masked hypertension', false, 3),
  ('9acf7781-2533-5331-9f9d-ff8dc67a63ba', '7654c5f3-a023-5ddf-b49a-87c34289d3e4', 'E', 'Stage 1 hypertension requiring medication', false, 4);

-- Q619
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('98dc5f3c-2917-568a-921e-25e335c07d04', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000027', 'sba', 'A 30 year old woman wants to travel to Kenya. She asks about vaccines. Which vaccine is a legal entry requirement for some countries, and is a live vaccine given at designated centres?', 'Yellow fever vaccination is a live vaccine given only at designated centres, with an International Certificate of Vaccination (valid for life). It is required for entry to some countries and recommended for travel to endemic areas of Africa and South America. It is contraindicated in immunosuppression, egg anaphylaxis, thymus disorders and infants under 6 months, and needs caution in people over 60 and in pregnancy. Use NaTHNaC or TravelHealthPro for advice.', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v3')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = '98dc5f3c-2917-568a-921e-25e335c07d04';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('d02e3839-cbf3-5d19-81df-2425d59dcdbe', '98dc5f3c-2917-568a-921e-25e335c07d04', 'A', 'Tetanus', false, 0),
  ('31937180-8a7a-5d4c-a64e-f4ddbeed7d69', '98dc5f3c-2917-568a-921e-25e335c07d04', 'B', 'Yellow fever', true, 1),
  ('18751f89-e468-5188-889a-4802b143edf6', '98dc5f3c-2917-568a-921e-25e335c07d04', 'C', 'Typhoid (injectable)', false, 2),
  ('ee8b0e53-1ab4-5d53-ba43-fd4026e646c9', '98dc5f3c-2917-568a-921e-25e335c07d04', 'D', 'Rabies', false, 3),
  ('28376d13-1c96-54f9-a13b-dd584b4126ae', '98dc5f3c-2917-568a-921e-25e335c07d04', 'E', 'Hepatitis A', false, 4);

-- Q620
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('6bbf70a5-7f8f-530a-a14c-09dc91e0f56f', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000027', 'sba', 'A 25 year old woman asks her GP for a ''repeat'' of the morning-after pill and says she uses withdrawal as contraception. What is the MOST appropriate action?', 'Withdrawal has a high failure rate. Opportunities to provide emergency contraception should be used to discuss effective ongoing contraception (LARC methods such as IUD, IUS and implant are most effective), quick-starting where appropriate, and STI testing. The copper IUD is the most effective emergency contraceptive.', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v3')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = '6bbf70a5-7f8f-530a-a14c-09dc91e0f56f';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('cbf80051-865d-528d-837e-cdbbdfb59d94', '6bbf70a5-7f8f-530a-a14c-09dc91e0f56f', 'A', 'Prescribe the combined pill without assessment', false, 0),
  ('3dcee38f-36fc-523a-b007-2b18ffaae31a', '6bbf70a5-7f8f-530a-a14c-09dc91e0f56f', 'B', 'Refuse emergency contraception', false, 1),
  ('6b104538-d97e-5082-9e89-f590eb34497b', '6bbf70a5-7f8f-530a-a14c-09dc91e0f56f', 'C', 'Refer to a gynaecologist', false, 2),
  ('3aee74ed-cf81-59d5-a533-ab3b506c9bd2', '6bbf70a5-7f8f-530a-a14c-09dc91e0f56f', 'D', 'Provide emergency contraception if needed, and discuss effective ongoing contraception including LARC options and STI testing', true, 3),
  ('1a90077d-4acc-50ae-9e23-36a10074e54a', '6bbf70a5-7f8f-530a-a14c-09dc91e0f56f', 'E', 'Advise that withdrawal is very reliable', false, 4);

-- Q621
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('187ab711-c605-5821-9f62-555481fec87c', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000027', 'sba', 'A 70 year old man with COPD attends for his annual review. Which intervention is MOST important at this review?', 'The NICE NG115 annual COPD review covers smoking cessation (the most important intervention), inhaler technique and adherence, symptom and exacerbation review (mMRC), vaccinations (influenza, pneumococcal, COVID-19, RSV for eligible ages), pulmonary rehabilitation, oxygen assessment if SpO2 92% or less, a self-management plan, and comorbidities (anxiety, depression, cardiovascular).', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v3')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = '187ab711-c605-5821-9f62-555481fec87c';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('569c1c05-89e5-5715-9ff7-76461ad380bf', '187ab711-c605-5821-9f62-555481fec87c', 'A', 'Smoking cessation support, inhaler technique check, vaccinations, spirometry review and assessment of symptoms/exacerbations, with pulmonary rehabilitation referral if eligible', true, 0),
  ('d445040d-58f9-557a-97e9-4a14468f2504', '187ab711-c605-5821-9f62-555481fec87c', 'B', 'Annual sputum culture', false, 1),
  ('fea9af90-8a72-521b-9ce0-600058d449bc', '187ab711-c605-5821-9f62-555481fec87c', 'C', 'Long-term oral steroids', false, 2),
  ('be5defe2-bdb4-5cb9-bd31-cf9f31ed0310', '187ab711-c605-5821-9f62-555481fec87c', 'D', 'Routine long-term antibiotics', false, 3),
  ('bdeb865a-d202-510a-a37c-72c7e042e920', '187ab711-c605-5821-9f62-555481fec87c', 'E', 'Annual CT chest', false, 4);

-- Q622
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('be134424-ad14-539e-8abb-2c80c43b4074', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000027', 'sba', 'A 40 year old man has had a sore, swollen, itchy foreskin and glans with a white discharge. He has no new sexual partners. Urine dipstick shows glucose. What is the SINGLE most likely diagnosis and next step?', 'Candidal balanitis is common in men with diabetes (or after antibiotics). Treat with a topical imidazole, gentle hygiene and avoiding irritants, and test for diabetes. Recurrent balanitis may need circumcision. Persistent lesions or ulceration need assessment for lichen sclerosus or penile intraepithelial neoplasia.', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v3')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = 'be134424-ad14-539e-8abb-2c80c43b4074';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('e49ccce5-30f9-5825-9569-cab923a7b4fd', 'be134424-ad14-539e-8abb-2c80c43b4074', 'A', 'Genital herpes; oral aciclovir', false, 0),
  ('24305378-6f89-596d-a594-a26078eabe33', 'be134424-ad14-539e-8abb-2c80c43b4074', 'B', 'Gonorrhoea; IM ceftriaxone', false, 1),
  ('72b4e08c-ff83-5fa9-86e0-7cf733eca02a', 'be134424-ad14-539e-8abb-2c80c43b4074', 'C', 'Lichen sclerosus; refer', false, 2),
  ('d4cc7678-562f-5d26-8ad5-8c98effcbf98', 'be134424-ad14-539e-8abb-2c80c43b4074', 'D', 'Candidal balanitis; topical clotrimazole and check for diabetes (HbA1c)', true, 3),
  ('0e2dfada-c310-50d0-993c-2e3d54460ca1', 'be134424-ad14-539e-8abb-2c80c43b4074', 'E', 'Penile cancer; 2-week-wait referral', false, 4);

-- Q623
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('5540d3ca-0ddc-5676-a7d7-7d124b27521d', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000027', 'sba', 'A 33 year old woman has tingling around her lips, hand cramps and palpitations during a panic attack. She is breathing fast. Which acid-base disturbance explains her symptoms?', 'Hyperventilation lowers PaCO2 (respiratory alkalosis), which increases protein binding of calcium and lowers ionised calcium. This causes perioral and peripheral paraesthesia, carpopedal spasm and light-headedness. Management is reassurance and slowing breathing (do not rebreathe into a paper bag, as it can cause hypoxia). Exclude organic causes (PE, asthma, DKA).', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v3')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = '5540d3ca-0ddc-5676-a7d7-7d124b27521d';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('254a0b0b-7417-58fe-b6bd-598a3dc0a1dd', '5540d3ca-0ddc-5676-a7d7-7d124b27521d', 'A', 'Hyperkalaemia', false, 0),
  ('ee856a6c-294c-5197-be5b-c7146e201ad7', '5540d3ca-0ddc-5676-a7d7-7d124b27521d', 'B', 'Metabolic acidosis', false, 1),
  ('eaf02933-10c1-57bd-bdf1-0194de383dfc', '5540d3ca-0ddc-5676-a7d7-7d124b27521d', 'C', 'Hypoglycaemia', false, 2),
  ('aaec6359-4c4d-5b11-b6f0-454a8b18af81', '5540d3ca-0ddc-5676-a7d7-7d124b27521d', 'D', 'Acute respiratory alkalosis causing a fall in ionised calcium', true, 3),
  ('a65a7a7d-136e-53e6-9c04-7941f1d6cee6', '5540d3ca-0ddc-5676-a7d7-7d124b27521d', 'E', 'Respiratory acidosis', false, 4);

-- Q624
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('8e31a9ad-0735-574a-8da0-a237ba2dea1f', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000027', 'sba', 'A 50 year old man has had fatigue for 2 months. Bloods show a raised ferritin of 1,200 µg/L with transferrin saturation of 28%. His ALT is raised. He drinks 35 units a week, has a BMI of 34 and diabetes. What is the SINGLE most likely cause of the raised ferritin?', 'Hyperferritinaemia with a normal transferrin saturation (below 45%) is most often caused by inflammation, alcohol, fatty liver disease, metabolic syndrome or malignancy, not iron overload. Haemochromatosis usually has a raised transferrin saturation (above 45-50%). Address alcohol and weight, and assess liver fibrosis.', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v3')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = '8e31a9ad-0735-574a-8da0-a237ba2dea1f';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('ed332c42-6ca8-5ea0-b432-d83defa5a002', '8e31a9ad-0735-574a-8da0-a237ba2dea1f', 'A', 'Iron overdose', false, 0),
  ('7139d38d-71ae-53ed-bd99-e393bf6e78c8', '8e31a9ad-0735-574a-8da0-a237ba2dea1f', 'B', 'Thalassaemia', false, 1),
  ('9e1aca52-7539-55f4-9f1c-45c3568709a7', '8e31a9ad-0735-574a-8da0-a237ba2dea1f', 'C', 'Metabolic dysfunction-associated fatty liver disease and alcohol (ferritin raised as an acute-phase reactant/hepatocellular injury)', true, 2),
  ('7fe6893b-ad4c-5606-b87b-d0e47577a913', '8e31a9ad-0735-574a-8da0-a237ba2dea1f', 'D', 'Hereditary haemochromatosis', false, 3),
  ('5c0bcec9-5468-54ca-9fcc-6c976539f045', '8e31a9ad-0735-574a-8da0-a237ba2dea1f', 'E', 'Iron-deficiency anaemia', false, 4);

-- Q625
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('efbb0a2b-4815-582b-9379-0f8e9746aef8', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000033', 'sba', 'A 25 year old man has a direct inguinal hernia. Which statement about its anatomy is CORRECT?', 'Direct inguinal hernias push through a weak posterior wall (Hesselbach''s triangle: inferior epigastric vessels laterally, rectus abdominis medially, inguinal ligament inferiorly), medial to the inferior epigastric vessels. They are acquired and rarely strangulate. Indirect hernias pass through the deep ring lateral to the vessels (patent processus vaginalis) and can enter the scrotum. Femoral hernias pass below the inguinal ligament.', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v3')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = 'efbb0a2b-4815-582b-9379-0f8e9746aef8';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('9c782500-30cb-5c60-a842-bd52eef6cc85', 'efbb0a2b-4815-582b-9379-0f8e9746aef8', 'A', 'It is congenital in origin in all cases', false, 0),
  ('a360a871-5ed1-5f02-a2b2-15d0b6c160e0', 'efbb0a2b-4815-582b-9379-0f8e9746aef8', 'B', 'It passes through the deep inguinal ring lateral to the inferior epigastric vessels', false, 1),
  ('e9f2780a-007c-57d0-a0fb-39dd59c4bcfa', 'efbb0a2b-4815-582b-9379-0f8e9746aef8', 'C', 'It lies lateral to the femoral vein', false, 2),
  ('9fb05683-2eff-5af7-bb7e-72eade633b05', 'efbb0a2b-4815-582b-9379-0f8e9746aef8', 'D', 'It passes below the inguinal ligament', false, 3),
  ('39d6938e-dc8f-56f0-87f8-8cf529e9534f', 'efbb0a2b-4815-582b-9379-0f8e9746aef8', 'E', 'It passes through Hesselbach''s triangle, medial to the inferior epigastric vessels', true, 4);

-- Q626
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('2babb467-0567-5c8b-b924-c8f72265acd5', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000033', 'sba', 'What are the contents of the femoral triangle from lateral to medial?', 'NAVEL (lateral to medial): Nerve, Artery, Vein, Empty space (femoral canal), Lymphatics (Cloquet''s node). Only the artery, vein and canal are inside the femoral sheath. The femoral pulse is at the mid-inguinal point (halfway between ASIS and pubic symphysis). Femoral venous access is medial to the artery. Femoral hernias pass through the femoral canal.', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v3')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = '2babb467-0567-5c8b-b924-c8f72265acd5';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('49d750e3-aef0-5843-9305-aa6bb7251dc6', '2babb467-0567-5c8b-b924-c8f72265acd5', 'A', 'Obturator nerve, femoral artery, femoral vein', false, 0),
  ('feb2d364-cc9a-5ba3-be65-a965d164947a', '2babb467-0567-5c8b-b924-c8f72265acd5', 'B', 'Femoral vein, artery, nerve', false, 1),
  ('01922473-5376-522d-9e90-5052e86ac656', '2babb467-0567-5c8b-b924-c8f72265acd5', 'C', 'Saphenous nerve, femoral vein, femoral artery', false, 2),
  ('d693dad5-5589-55a9-82dd-c6ab061f6af9', '2babb467-0567-5c8b-b924-c8f72265acd5', 'D', 'Femoral artery, nerve, vein', false, 3),
  ('b98abd8a-cb39-5f56-b1dc-4cfc5e227bd3', '2babb467-0567-5c8b-b924-c8f72265acd5', 'E', 'Femoral nerve, femoral artery, femoral vein, empty space (femoral canal), lymphatics (NAVEL)', true, 4);

-- Q627
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('f0bd8964-ed0d-5678-a923-aafbeb735109', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000033', 'sba', 'A newborn had a difficult shoulder dystocia delivery. His right arm hangs by his side, internally rotated, with the elbow extended and the wrist flexed (''waiter''s tip''). Which nerve roots are injured?', 'Erb''s palsy (C5-C6) from lateral traction of the neck causes the ''waiter''s tip'' posture: the shoulder is adducted and internally rotated, the elbow extended and the forearm pronated. Klumpke''s palsy (C8-T1) from traction of an abducted arm causes claw hand and may cause Horner''s syndrome. Most neonatal brachial plexus injuries recover. Refer early to a specialist.', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v3')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = 'f0bd8964-ed0d-5678-a923-aafbeb735109';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('326e5f00-41f3-56f6-9ddf-c71d43d4e4e3', 'f0bd8964-ed0d-5678-a923-aafbeb735109', 'A', 'L4 and L5', false, 0),
  ('153aa378-5a28-57ff-89af-1e53e0a8491c', 'f0bd8964-ed0d-5678-a923-aafbeb735109', 'B', 'C8 and T1 (Klumpke''s palsy)', false, 1),
  ('dcacdb03-fb5c-5cd4-9b84-0a81c5e60a7d', 'f0bd8964-ed0d-5678-a923-aafbeb735109', 'C', 'C5 and C6 (upper brachial plexus: Erb''s palsy)', true, 2),
  ('c13fe660-48cd-54b3-9718-c96b30827cf6', 'f0bd8964-ed0d-5678-a923-aafbeb735109', 'D', 'C7 only', false, 3),
  ('4110ce86-1e93-5ca9-b753-b2254a7ade4b', 'f0bd8964-ed0d-5678-a923-aafbeb735109', 'E', 'T2 and T3', false, 4);

-- Q628
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('2337a645-1630-57e4-bb06-35824e11cd19', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000033', 'sba', 'A 40 year old man has a C6 nerve root lesion from a cervical disc prolapse. Which clinical findings are MOST consistent?', 'C5: deltoid and biceps, biceps reflex, lateral upper arm. C6: wrist extension and biceps, brachioradialis reflex, thumb and index finger. C7: triceps and finger extension, triceps reflex, middle finger. C8: finger flexors, little finger. T1: intrinsic hand muscles, medial forearm. The most common cervical radiculopathies are C6 and C7.', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v3')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = '2337a645-1630-57e4-bb06-35824e11cd19';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('22b75222-c89c-5fda-98d4-01756b1e24ff', '2337a645-1630-57e4-bb06-35824e11cd19', 'A', 'Reduced triceps reflex and numbness of the middle finger', false, 0),
  ('8f236a42-c544-5c97-ab42-13a22f3dcdf5', '2337a645-1630-57e4-bb06-35824e11cd19', 'B', 'Reduced knee reflex', false, 1),
  ('b70d9d7f-6236-556d-8e6f-4cba1dd73429', '2337a645-1630-57e4-bb06-35824e11cd19', 'C', 'Numbness of the little finger and weak finger abduction', false, 2),
  ('84809216-eb98-5122-bd2c-5406649175c9', '2337a645-1630-57e4-bb06-35824e11cd19', 'D', 'Reduced biceps/brachioradialis reflex, weak elbow flexion/wrist extension and numbness of the thumb and index finger', true, 3),
  ('2bb41db2-3800-52bf-b889-4c76bf46e787', '2337a645-1630-57e4-bb06-35824e11cd19', 'E', 'Reduced ankle reflex', false, 4);

-- Q629
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('256aa9d5-6fec-5e34-89c4-9361ac27bea8', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000033', 'sba', 'A 55 year old man has a band of numbness around his trunk at the level of the umbilicus from shingles. Which dermatome is affected?', 'Key dermatomes: C6 thumb; C7 middle finger; C8 little finger; T4 nipple; T6 xiphisternum; T10 umbilicus; L1 inguinal ligament; L3 medial knee; L4 medial leg and malleolus; L5 dorsum of foot and big toe; S1 lateral foot and sole; S2-S4 perianal area (saddle area).', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v3')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = '256aa9d5-6fec-5e34-89c4-9361ac27bea8';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('8c6e1a4e-426d-5aa5-9721-59f19bea3e65', '256aa9d5-6fec-5e34-89c4-9361ac27bea8', 'A', 'C8', false, 0),
  ('954edfa5-519b-548a-88c4-ae2d4857760a', '256aa9d5-6fec-5e34-89c4-9361ac27bea8', 'B', 'T6', false, 1),
  ('90632813-9646-527f-be38-079d0c000481', '256aa9d5-6fec-5e34-89c4-9361ac27bea8', 'C', 'T4', false, 2),
  ('02a5cc04-673d-5084-8a21-4c5a25c0a51e', '256aa9d5-6fec-5e34-89c4-9361ac27bea8', 'D', 'T10', true, 3),
  ('4ac11b90-9ace-5038-858b-44e96052c57f', '256aa9d5-6fec-5e34-89c4-9361ac27bea8', 'E', 'L1', false, 4);

-- Q630
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('c700de1b-132f-5fa6-a72b-3b9a68884a1b', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000033', 'sba', 'A 45 year old woman has a reduced knee jerk reflex, weakness of knee extension and numbness of the medial lower leg after a lumbar disc prolapse. Which nerve root is affected?', 'Reflexes: biceps C5-6; brachioradialis C6; triceps C7; knee (patellar) L3-4; ankle S1. L4: knee extension, knee reflex, medial leg. L5: ankle and big toe dorsiflexion (foot drop), dorsum of foot, no reflex. S1: plantarflexion, ankle reflex, lateral foot and sole. The commonest lumbar disc prolapses are L4/5 (affecting L5) and L5/S1 (affecting S1).', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v3')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = 'c700de1b-132f-5fa6-a72b-3b9a68884a1b';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('f05d7a2c-d1ac-5fc2-8924-21670c867994', 'c700de1b-132f-5fa6-a72b-3b9a68884a1b', 'A', 'L5', false, 0),
  ('bc2752f9-8077-50e2-b8f9-30a2692e17bf', 'c700de1b-132f-5fa6-a72b-3b9a68884a1b', 'B', 'L4', true, 1),
  ('93a2fcea-61e3-5f9f-a4a9-54fa214ff340', 'c700de1b-132f-5fa6-a72b-3b9a68884a1b', 'C', 'S1', false, 2),
  ('f0b95081-b39e-58e5-a8f5-bee6ed2b933e', 'c700de1b-132f-5fa6-a72b-3b9a68884a1b', 'D', 'S2', false, 3),
  ('6e446da1-5201-5aa0-916f-3d3ee32b1379', 'c700de1b-132f-5fa6-a72b-3b9a68884a1b', 'E', 'L1', false, 4);

-- Q631
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('49bb9e94-fbe9-555d-b99e-ea428d01fe1d', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000033', 'sba', 'A 60 year old man has a tongue that deviates to the right when protruded, with wasting and fasciculation of the right side of the tongue. Which cranial nerve is affected?', 'In a hypoglossal nerve lesion, the tongue deviates towards the side of the lesion (the intact genioglossus pushes it across). With LMN lesions there is ipsilateral wasting and fasciculation. With a vagus lesion, the uvula deviates away from the side of the lesion. Causes include skull base tumours, carotid dissection and MND (bulbar palsy).', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v3')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = '49bb9e94-fbe9-555d-b99e-ea428d01fe1d';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('78802f06-31b0-5e89-864e-148037d32a0d', '49bb9e94-fbe9-555d-b99e-ea428d01fe1d', 'A', 'Right hypoglossal nerve (XII), lower motor neurone lesion', true, 0),
  ('f41701ae-e2fd-562b-8771-2cefb09197ea', '49bb9e94-fbe9-555d-b99e-ea428d01fe1d', 'B', 'Right facial nerve', false, 1),
  ('2958aabf-f1fc-51bc-99c7-6007709e508d', '49bb9e94-fbe9-555d-b99e-ea428d01fe1d', 'C', 'Left vagus nerve', false, 2),
  ('69c37c3d-98c6-502a-82fa-53ab42f1cbf7', '49bb9e94-fbe9-555d-b99e-ea428d01fe1d', 'D', 'Left hypoglossal nerve', false, 3),
  ('669444ce-d0dc-526a-8b6f-675ff8e7e140', '49bb9e94-fbe9-555d-b99e-ea428d01fe1d', 'E', 'Right glossopharyngeal nerve', false, 4);

-- Q632
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('6dd2eb82-31eb-5c58-9ec9-ee7f2e107941', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000033', 'sba', 'The oxygen-haemoglobin dissociation curve shifts to the RIGHT (reduced affinity, easier oxygen release to tissues). Which condition causes this shift?', 'A right shift (Bohr effect) improves oxygen delivery to metabolically active tissues (''CADET face right'': CO2, Acid, 2,3-DPG, Exercise, Temperature). A left shift (increased affinity) is caused by alkalosis, hypothermia, low 2,3-DPG, carbon monoxide and fetal haemoglobin (helping oxygen transfer from mother to fetus).', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v3')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = '6dd2eb82-31eb-5c58-9ec9-ee7f2e107941';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('30a07089-3aa4-55fd-8613-7e42bbb02d31', '6dd2eb82-31eb-5c58-9ec9-ee7f2e107941', 'A', 'Hypothermia', false, 0),
  ('77306ab3-318e-57d3-9373-f41ac8c1e4cf', '6dd2eb82-31eb-5c58-9ec9-ee7f2e107941', 'B', 'Fetal haemoglobin', false, 1),
  ('a66ac617-8449-5546-812c-4fe0dd7b13f4', '6dd2eb82-31eb-5c58-9ec9-ee7f2e107941', 'C', 'Alkalosis', false, 2),
  ('6bb4077a-f199-5bb7-bb01-0678e84ab816', '6dd2eb82-31eb-5c58-9ec9-ee7f2e107941', 'D', 'Carbon monoxide poisoning', false, 3),
  ('a2ca7ce9-0dc5-5ba6-bea8-b045955edadb', '6dd2eb82-31eb-5c58-9ec9-ee7f2e107941', 'E', 'Raised temperature, raised CO2, acidosis (fall in pH) and raised 2,3-DPG', true, 4);

-- Q633
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('1f4dcb81-1dd9-5476-97ac-b2997f65d22e', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000033', 'sba', 'Which cells in the lung produce surfactant, and what is its function?', 'Surfactant (mainly dipalmitoylphosphatidylcholine) from type II pneumocytes reduces surface tension (Laplace''s law), preventing small alveoli from collapsing and improving lung compliance. Production rises from about 24 weeks and is adequate by 34-36 weeks. Antenatal steroids increase production. Preterm babies with deficiency develop respiratory distress syndrome (treated with exogenous surfactant).', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v3')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = '1f4dcb81-1dd9-5476-97ac-b2997f65d22e';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('d336d13c-3911-5c8e-8e40-aee5da2d27ac', '1f4dcb81-1dd9-5476-97ac-b2997f65d22e', 'A', 'Clara (club) cells; ciliary movement', false, 0),
  ('a4df439b-2150-55de-af9f-ca677dc05876', '1f4dcb81-1dd9-5476-97ac-b2997f65d22e', 'B', 'Alveolar macrophages; phagocytosis', false, 1),
  ('6ee64dc4-1602-52e0-ad61-d9d8d2369e72', '1f4dcb81-1dd9-5476-97ac-b2997f65d22e', 'C', 'Type I pneumocytes; gas exchange', false, 2),
  ('4036460c-71b3-54cc-89ea-91748b3657b5', '1f4dcb81-1dd9-5476-97ac-b2997f65d22e', 'D', 'Type II pneumocytes; it lowers alveolar surface tension, preventing alveolar collapse', true, 3),
  ('eedd3703-6e00-5e0f-a26c-599e93556db2', '1f4dcb81-1dd9-5476-97ac-b2997f65d22e', 'E', 'Goblet cells; mucus', false, 4);

-- Q634
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('faca148c-b13d-54ea-aca8-1558f1001166', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000033', 'sba', 'A patient becomes hypovolaemic after a haemorrhage. Which hormonal response increases sodium and water retention?', 'Low renal perfusion stimulates renin release from juxtaglomerular cells. Renin converts angiotensinogen to angiotensin I, and ACE (in the lungs) converts it to angiotensin II. Angiotensin II causes vasoconstriction, aldosterone release (sodium retention and potassium excretion in the collecting duct), ADH release and thirst. ANP and BNP (released in volume overload) promote sodium excretion.', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v3')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = 'faca148c-b13d-54ea-aca8-1558f1001166';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('3c4020db-23e0-530e-837f-9604998dfb2c', 'faca148c-b13d-54ea-aca8-1558f1001166', 'A', 'The renin-angiotensin-aldosterone system (renin from juxtaglomerular cells → angiotensin II → aldosterone from the adrenal zona glomerulosa), plus ADH', true, 0),
  ('8d6ac372-8bc2-5801-b1f6-7ebdd4be1601', 'faca148c-b13d-54ea-aca8-1558f1001166', 'B', 'Decreased ADH secretion', false, 1),
  ('1f00e2da-1667-53c1-b3fb-84c9cad0eba7', 'faca148c-b13d-54ea-aca8-1558f1001166', 'C', 'Increased ANP secretion', false, 2),
  ('60884f2a-3bbc-59f1-b3a6-c43ea77e095b', 'faca148c-b13d-54ea-aca8-1558f1001166', 'D', 'Increased insulin', false, 3),
  ('496ae33f-0d60-5e18-a7ce-4b9e7e68ba7d', 'faca148c-b13d-54ea-aca8-1558f1001166', 'E', 'Decreased cortisol', false, 4);

-- Q635
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('e72813b8-681d-5af4-90f5-c7e7abd57189', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000033', 'sba', 'Where in the gastrointestinal tract is iron mainly absorbed?', 'Iron is absorbed mainly in the duodenum and upper jejunum (helped by gastric acid and vitamin C), and is regulated by hepcidin. Folate is absorbed in the jejunum, and vitamin B12 and bile salts in the terminal ileum. So coeliac disease (duodenum) causes iron deficiency, and terminal ileal Crohn''s or resection causes B12 deficiency.', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v3')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = 'e72813b8-681d-5af4-90f5-c7e7abd57189';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('23496350-c777-5205-8563-11e7ce663858', 'e72813b8-681d-5af4-90f5-c7e7abd57189', 'A', 'Oesophagus', false, 0),
  ('f7709184-9793-50f0-9508-eadb63133264', 'e72813b8-681d-5af4-90f5-c7e7abd57189', 'B', 'Duodenum and upper jejunum', true, 1),
  ('18a41675-b2e2-52f3-9299-a82aeae052ce', 'e72813b8-681d-5af4-90f5-c7e7abd57189', 'C', 'Stomach', false, 2),
  ('285a4996-b08c-51ac-a7cf-a8c249b43158', 'e72813b8-681d-5af4-90f5-c7e7abd57189', 'D', 'Terminal ileum', false, 3),
  ('192fec5c-57fc-5b65-8b36-1b4e61349119', 'e72813b8-681d-5af4-90f5-c7e7abd57189', 'E', 'Colon', false, 4);

-- Q636
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('09a150fb-8563-5a6c-9eaf-7459414c523d', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000033', 'sba', 'A 30 year old man has Goodpasture''s syndrome with antibodies against the glomerular basement membrane. Which type of hypersensitivity reaction is this?', 'Gell and Coombs classification: Type I is IgE-mediated (anaphylaxis, asthma, hay fever). Type II involves antibodies against cell surface or matrix antigens (Goodpasture''s, autoimmune haemolytic anaemia, myasthenia gravis, Graves'', haemolytic transfusion reactions). Type III involves immune complex deposition (SLE, post-strep GN, serum sickness, extrinsic allergic alveolitis). Type IV is T-cell mediated (contact dermatitis, Mantoux, transplant rejection).', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v3')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = '09a150fb-8563-5a6c-9eaf-7459414c523d';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('f7050d2f-abe9-5b0d-8736-4438f925782d', '09a150fb-8563-5a6c-9eaf-7459414c523d', 'A', 'Type IV (delayed, T-cell mediated)', false, 0),
  ('2d3bb55a-543d-5870-92cc-10ab51cd5e21', '09a150fb-8563-5a6c-9eaf-7459414c523d', 'B', 'Type I (IgE-mediated immediate)', false, 1),
  ('4ed4399d-da6f-5c01-8096-98037054b407', '09a150fb-8563-5a6c-9eaf-7459414c523d', 'C', 'Type II (antibody-mediated cytotoxic)', true, 2),
  ('b77369aa-5852-5a6b-b3f0-1432bec55b93', '09a150fb-8563-5a6c-9eaf-7459414c523d', 'D', 'Type III (immune complex)', false, 3),
  ('af3b5c5d-330a-5138-bd65-57cdbf517b0d', '09a150fb-8563-5a6c-9eaf-7459414c523d', 'E', 'Type V only', false, 4);

-- Q637
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('f4f54584-71d4-5afe-b25e-2b7201b0e138', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000033', 'sba', 'A woman develops a red, itchy rash on her earlobes 48 hours after wearing new nickel earrings. Which type of hypersensitivity reaction is this?', 'Allergic contact dermatitis is a type IV delayed hypersensitivity reaction mediated by T cells, appearing 24-72 hours after re-exposure to the allergen (nickel, fragrances, rubber, hair dye). Patch testing identifies the cause. Other type IV reactions include the tuberculin (Mantoux) test, chronic transplant rejection and some drug eruptions.', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v3')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = 'f4f54584-71d4-5afe-b25e-2b7201b0e138';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('98e54682-cbca-55a0-873c-b66929f0fabe', 'f4f54584-71d4-5afe-b25e-2b7201b0e138', 'A', 'Type IV (delayed, T-cell mediated)', true, 0),
  ('8d40224f-f5ac-569f-b4b9-732f7545e727', 'f4f54584-71d4-5afe-b25e-2b7201b0e138', 'B', 'Anaphylaxis', false, 1),
  ('4911c886-1baf-50a0-ab9a-3af71ce58617', 'f4f54584-71d4-5afe-b25e-2b7201b0e138', 'C', 'Type III', false, 2),
  ('94805de0-9221-591d-aa16-766104fcb2f2', 'f4f54584-71d4-5afe-b25e-2b7201b0e138', 'D', 'Type II', false, 3),
  ('1cf597ce-0eb3-5957-b23e-c6e79e9be184', 'f4f54584-71d4-5afe-b25e-2b7201b0e138', 'E', 'Type I', false, 4);

-- Q638
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('f2246ecd-8df2-5dd7-b5c6-b97795966f16', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000033', 'sba', 'A 25 year old man needs vaccines before starting immunosuppressive treatment. Which of these is a LIVE attenuated vaccine that should be avoided once he is significantly immunosuppressed?', 'Live attenuated vaccines include MMR, varicella, the live shingles vaccine (Zostavax, now replaced by non-live Shingrix in the UK), yellow fever, BCG, oral typhoid, rotavirus and live intranasal influenza. They should be given at least 4 weeks before immunosuppression and avoided during it. Inactivated, subunit, toxoid and mRNA vaccines are safe but may be less effective.', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v3')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = 'f2246ecd-8df2-5dd7-b5c6-b97795966f16';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('c864a6cf-0f5d-559c-bdbc-83da832ef88d', 'f2246ecd-8df2-5dd7-b5c6-b97795966f16', 'A', 'Inactivated influenza injection', false, 0),
  ('f5a11378-1d5e-52df-af6b-4cd6b3e1966f', 'f2246ecd-8df2-5dd7-b5c6-b97795966f16', 'B', 'MMR', true, 1),
  ('3f713286-532c-5213-bb3b-0cb6e3358a08', 'f2246ecd-8df2-5dd7-b5c6-b97795966f16', 'C', 'Tetanus toxoid', false, 2),
  ('f92c136b-ea25-502f-ab4c-c4a60b85fadf', 'f2246ecd-8df2-5dd7-b5c6-b97795966f16', 'D', 'Pneumococcal polysaccharide vaccine', false, 3),
  ('3b53202b-dc73-5fc9-8515-bae15cfabbcc', 'f2246ecd-8df2-5dd7-b5c6-b97795966f16', 'E', 'Hepatitis B vaccine', false, 4);

-- Q639
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('27f7fbdb-68d4-55ee-a78b-9abba3ffb562', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000033', 'sba', 'A Gram stain of CSF in a 2 week old baby with meningitis shows Gram-positive rods. Which organism is MOST likely?', 'Gram-positive rods in neonatal meningitis suggest Listeria (treated with amoxicillin plus gentamicin). Group B streptococcus (Gram-positive cocci in chains) and E. coli (Gram-negative rods) are the commonest neonatal causes. Neisseria meningitidis is a Gram-negative diplococcus, and Strep pneumoniae is a Gram-positive diplococcus.', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v3')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = '27f7fbdb-68d4-55ee-a78b-9abba3ffb562';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('3d6a51d3-ad85-50e0-8af1-dacb75fd9a0a', '27f7fbdb-68d4-55ee-a78b-9abba3ffb562', 'A', 'Listeria monocytogenes', true, 0),
  ('18adea45-d17f-50b2-acd2-25dba3227e28', '27f7fbdb-68d4-55ee-a78b-9abba3ffb562', 'B', 'Neisseria meningitidis', false, 1),
  ('e76e40dd-851a-50fd-8fac-6f7f917209d7', '27f7fbdb-68d4-55ee-a78b-9abba3ffb562', 'C', 'Haemophilus influenzae', false, 2),
  ('92cc63dc-60e7-523e-9373-64fbd3b487ef', '27f7fbdb-68d4-55ee-a78b-9abba3ffb562', 'D', 'Streptococcus agalactiae (Group B Strep)', false, 3),
  ('31f392da-48c8-5e86-96ce-5b1424ed8d10', '27f7fbdb-68d4-55ee-a78b-9abba3ffb562', 'E', 'Escherichia coli', false, 4);

-- Q640
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('a3861a7b-4ec0-5519-8e3b-56f5d979fef7', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000033', 'sba', 'A 65 year old man has a seminoma of the left testis. To which lymph nodes does the testis primarily drain?', 'The testis develops near the kidney and descends, taking its lymphatic drainage with it, so it drains to the para-aortic (retroperitoneal) nodes at L1-L2. The scrotal skin drains to the superficial inguinal nodes. This is why scrotal (trans-scrotal) biopsy of the testis is avoided: it can contaminate the inguinal lymphatics. Testicular cancer is staged with CT of the chest, abdomen and pelvis.', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v3')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = 'a3861a7b-4ec0-5519-8e3b-56f5d979fef7';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('12b9088e-c74a-54fa-9d5c-21e7ab30a919', 'a3861a7b-4ec0-5519-8e3b-56f5d979fef7', 'A', 'Internal iliac nodes', false, 0),
  ('9c8f3ebb-af70-5115-baf8-3171009e3066', 'a3861a7b-4ec0-5519-8e3b-56f5d979fef7', 'B', 'Para-aortic lymph nodes (at the level of L1-L2)', true, 1),
  ('77b235cd-769a-5c25-bac8-0992f1872dfb', 'a3861a7b-4ec0-5519-8e3b-56f5d979fef7', 'C', 'External iliac nodes', false, 2),
  ('ab291b7f-0cd5-5dea-a465-24dc62cedd01', 'a3861a7b-4ec0-5519-8e3b-56f5d979fef7', 'D', 'Superficial inguinal nodes', false, 3),
  ('8b310d0d-ed1e-5308-ba4e-03a7e867031d', 'a3861a7b-4ec0-5519-8e3b-56f5d979fef7', 'E', 'Axillary nodes', false, 4);

-- Q641
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('1df5c07c-5b93-5437-84ec-c23920cd411a', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000033', 'sba', 'Which sites are portosystemic anastomoses that dilate in portal hypertension?', 'In portal hypertension, blood flows through connections between the portal and systemic venous systems. The left gastric vein and oesophageal veins form oesophageal varices (risk of life-threatening bleeding). The superior and middle/inferior rectal veins form rectal varices. Paraumbilical and epigastric veins form caput medusae. Retroperitoneal veins also connect.', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v3')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = '1df5c07c-5b93-5437-84ec-c23920cd411a';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('16ac3b11-159f-5182-896f-f0b42049ce50', '1df5c07c-5b93-5437-84ec-c23920cd411a', 'A', 'Lower oesophagus, rectum (anorectal varices), umbilicus (caput medusae) and retroperitoneum', true, 0),
  ('c8aad771-4150-54e2-9e13-cc2575631d14', '1df5c07c-5b93-5437-84ec-c23920cd411a', 'B', 'Coronary arteries', false, 1),
  ('719d6b0f-cacc-5288-a30f-19bc0dfd4656', '1df5c07c-5b93-5437-84ec-c23920cd411a', 'C', 'Renal arteries', false, 2),
  ('e2cb83f7-c190-507a-90f4-907372309398', '1df5c07c-5b93-5437-84ec-c23920cd411a', 'D', 'Cerebral veins', false, 3),
  ('49faa5cc-be01-520e-b510-3c12f909fa09', '1df5c07c-5b93-5437-84ec-c23920cd411a', 'E', 'Pulmonary veins only', false, 4);

-- Q642
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('4c86b728-994e-512c-9202-10b0929c660c', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000033', 'sba', 'Which artery supplies the splenic flexure and descending colon?', 'The midgut (to two-thirds of the way along the transverse colon) is supplied by the superior mesenteric artery. The hindgut (distal transverse colon, splenic flexure, descending and sigmoid colon, upper rectum) is supplied by the inferior mesenteric artery. The splenic flexure (Griffith''s point) is a watershed area at risk of ischaemic colitis. The foregut is supplied by the coeliac trunk.', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v3')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = '4c86b728-994e-512c-9202-10b0929c660c';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('30e5d604-bb6e-5836-a9eb-0769f06a0b0a', '4c86b728-994e-512c-9202-10b0929c660c', 'A', 'Coeliac trunk', false, 0),
  ('b0ff56a3-d531-5a49-96ca-84be96e2e44a', '4c86b728-994e-512c-9202-10b0929c660c', 'B', 'Inferior mesenteric artery (left colic branch), with the marginal artery', true, 1),
  ('d7e6d5c1-ec35-5823-a6ad-fba0d991eb51', '4c86b728-994e-512c-9202-10b0929c660c', 'C', 'Internal iliac artery', false, 2),
  ('e33473cf-95bb-5451-84c9-2ac6ac677e97', '4c86b728-994e-512c-9202-10b0929c660c', 'D', 'Superior mesenteric artery only', false, 3),
  ('14959fa1-c7ff-5c59-be04-8a20a87cf6d3', '4c86b728-994e-512c-9202-10b0929c660c', 'E', 'Renal artery', false, 4);

-- Q643
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('814d1479-3ae6-5120-a8f4-16c595be3201', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000033', 'sba', 'A patient has a deep laceration in the anatomical snuffbox. Which structure lies in the floor of the snuffbox and is commonly injured in falls on the outstretched hand?', 'The anatomical snuffbox is bounded by extensor pollicis longus (medially) and abductor pollicis longus and extensor pollicis brevis (laterally). Its floor contains the scaphoid and trapezium, and the radial artery crosses it. Tenderness there suggests scaphoid fracture. The superficial radial nerve and cephalic vein run over the roof.', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v3')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = '814d1479-3ae6-5120-a8f4-16c595be3201';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('cae93442-1862-548d-b83e-999606bff5fa', '814d1479-3ae6-5120-a8f4-16c595be3201', 'A', 'Scaphoid bone (with the radial artery crossing the floor)', true, 0),
  ('ead0c226-82a9-5b25-9f70-42694d011a66', '814d1479-3ae6-5120-a8f4-16c595be3201', 'B', 'Pisiform', false, 1),
  ('431b1dd7-b227-5c6e-8de6-d6caba9f7243', '814d1479-3ae6-5120-a8f4-16c595be3201', 'C', 'Lunate', false, 2),
  ('af949ab4-638c-539b-8c27-b41c90f93dcd', '814d1479-3ae6-5120-a8f4-16c595be3201', 'D', 'Ulnar artery', false, 3),
  ('87a16f18-0d14-5659-bad9-c734942a55b5', '814d1479-3ae6-5120-a8f4-16c595be3201', 'E', 'Median nerve', false, 4);

-- Q644
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('7c6cf433-6eb5-5ba8-8382-6c8acb5d037c', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000033', 'sba', 'A patient has a ''claw hand'' with hyperextension of the MCP joints and flexion of the IP joints of the ring and little fingers. The lesion is at the wrist. Why is the clawing worse with a lesion at the wrist than at the elbow?', 'Ulnar nerve lesions cause loss of the ulnar lumbricals and interossei, giving clawing of the ring and little fingers. A proximal (elbow) lesion also paralyses the ulnar half of FDP, so there is less flexion of the IP joints and less clawing (the ulnar paradox). A distal (wrist) lesion leaves FDP working, so clawing is more marked.', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v3')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = '7c6cf433-6eb5-5ba8-8382-6c8acb5d037c';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('483478ac-c94c-5eef-9e22-99ac05fff3c2', '7c6cf433-6eb5-5ba8-8382-6c8acb5d037c', 'A', 'Ulnar paradox: a wrist lesion spares flexor digitorum profundus (ulnar half), so the unopposed long flexors cause more IP flexion', true, 0),
  ('a0b17f30-47e5-5f44-8b4f-33fdf9b31677', '7c6cf433-6eb5-5ba8-8382-6c8acb5d037c', 'B', 'The radial nerve is involved', false, 1),
  ('063e30ae-2a83-57c6-8e23-8200f6436b6a', '7c6cf433-6eb5-5ba8-8382-6c8acb5d037c', 'C', 'Lesions at the wrist cause no clawing', false, 2),
  ('edb73b5a-2d5d-58aa-95bb-a81b0836dae3', '7c6cf433-6eb5-5ba8-8382-6c8acb5d037c', 'D', 'Clawing is the same at both sites', false, 3),
  ('2e6badb0-b1bd-5e31-b828-1cb11b1cc66d', '7c6cf433-6eb5-5ba8-8382-6c8acb5d037c', 'E', 'The median nerve is also injured', false, 4);

-- Q645
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('798245d3-ad88-58db-a395-17dc50ebc7bb', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000033', 'sba', 'A 40 year old man has lost sensation over the anterior two-thirds of his tongue for taste, with a lower motor neurone facial weakness and hyperacusis on the same side. Where is the facial nerve lesion?', 'The facial nerve gives off the greater petrosal nerve (lacrimation), the nerve to stapedius (lesion causes hyperacusis) and the chorda tympani (taste to the anterior two-thirds of the tongue) within the temporal bone, before leaving through the stylomastoid foramen. Lesions at or beyond the stylomastoid foramen cause facial weakness only. Bell''s palsy often involves the whole nerve.', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v3')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = '798245d3-ad88-58db-a395-17dc50ebc7bb';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('2b350156-8ac9-5764-86f5-427f9c5157e2', '798245d3-ad88-58db-a395-17dc50ebc7bb', 'A', 'Proximal to the origin of the nerve to stapedius and chorda tympani (within the facial canal or above)', true, 0),
  ('0bb65a61-d2e8-59ce-bdef-7b0e07d22684', '798245d3-ad88-58db-a395-17dc50ebc7bb', 'B', 'In the cavernous sinus', false, 1),
  ('788aa906-0d6a-5f84-8b20-93e20d3a7c7c', '798245d3-ad88-58db-a395-17dc50ebc7bb', 'C', 'Distal to the stylomastoid foramen', false, 2),
  ('acf62f07-3967-5e6b-8d50-244dea2d5f1e', '798245d3-ad88-58db-a395-17dc50ebc7bb', 'D', 'At the level of the motor cortex', false, 3),
  ('c1e46298-683a-5fdd-8005-8361eed5dedf', '798245d3-ad88-58db-a395-17dc50ebc7bb', 'E', 'In the parotid gland', false, 4);

-- Q646
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('0568e5be-8fe7-5009-b8d3-2734216acfd9', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000033', 'sba', 'A 50 year old man has been diagnosed with a phaeochromocytoma. From which embryological tissue does the adrenal medulla originate?', 'The adrenal medulla comes from neural crest cells (chromaffin cells that secrete catecholamines). The adrenal cortex comes from mesoderm. Neural crest also forms melanocytes, sympathetic and dorsal root ganglia, Schwann cells, the facial skeleton and parafollicular (C) cells of the thyroid. Neuroblastoma and phaeochromocytoma are neural crest tumours.', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v3')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = '0568e5be-8fe7-5009-b8d3-2734216acfd9';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('30d7ee75-5c91-576e-a0a6-aa60901f04ed', '0568e5be-8fe7-5009-b8d3-2734216acfd9', 'A', 'Endoderm', false, 0),
  ('3ae4693d-08b2-5de3-af65-67819ca137f1', '0568e5be-8fe7-5009-b8d3-2734216acfd9', 'B', 'Ectoderm of the skin surface', false, 1),
  ('ad9bb0e2-3089-5728-902e-96e5b655164a', '0568e5be-8fe7-5009-b8d3-2734216acfd9', 'C', 'Neural crest cells', true, 2),
  ('4cc4cdb4-14ec-5c4b-9ee4-c2302b6bf094', '0568e5be-8fe7-5009-b8d3-2734216acfd9', 'D', 'Trophoblast', false, 3),
  ('042e16fa-3469-588d-a5a8-235d9f36ae50', '0568e5be-8fe7-5009-b8d3-2734216acfd9', 'E', 'Mesoderm', false, 4);

-- Q647
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('dfea9c77-d4ff-546d-90de-0796ea068b3c', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000020', 'sba', 'A 22 year old woman had unprotected sex with a man who has HIV and an unknown viral load 36 hours ago. What is the SINGLE most appropriate management?', 'BHIVA recommends PEPSE (such as tenofovir disoproxil/emtricitabine plus raltegravir or dolutegravir) when the source has HIV with a detectable or unknown viral load, ideally within 24 hours and no later than 72 hours. It is not recommended if the source has an undetectable viral load on treatment (U=U). Test for HIV at baseline and 6 weeks after PEP, and screen for other STIs.', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v3')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = 'dfea9c77-d4ff-546d-90de-0796ea068b3c';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('746c8707-c054-5e79-a06d-0414051cce03', 'dfea9c77-d4ff-546d-90de-0796ea068b3c', 'A', 'PrEP for 1 week', false, 0),
  ('ca5f1fb8-f321-5441-9310-01154125501b', 'dfea9c77-d4ff-546d-90de-0796ea068b3c', 'B', 'Give hepatitis B vaccine only', false, 1),
  ('98266bf0-8f2b-5285-b482-baa1d2682a64', 'dfea9c77-d4ff-546d-90de-0796ea068b3c', 'C', 'Start HIV post-exposure prophylaxis after sexual exposure (PEPSE) as soon as possible (within 72 hours) for 28 days, with baseline HIV test', true, 2),
  ('4fc519f7-a5bb-5999-af23-d3a4e558c28e', 'dfea9c77-d4ff-546d-90de-0796ea068b3c', 'D', 'PEPSE is only effective within 6 hours', false, 3),
  ('098fc5aa-1326-5b83-818c-7db6f022ea4d', 'dfea9c77-d4ff-546d-90de-0796ea068b3c', 'E', 'Test for HIV in 3 months only', false, 4);

-- Q648
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('840fa95a-46f9-57dc-acb6-540df5e8cc48', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000020', 'sba', 'A 25 year old man has a widespread non-itchy maculopapular rash including his palms and soles, with fever, lymphadenopathy and mouth ulcers. He had a painless genital sore 6 weeks ago. What is the SINGLE most likely diagnosis?', 'Secondary syphilis (weeks to months after the chancre) causes a widespread rash including the palms and soles, generalised lymphadenopathy, mucous patches (''snail track'' ulcers), condylomata lata and patchy alopecia. Serology is strongly positive. Treat with IM benzathine benzylpenicillin. HIV seroconversion can look similar, so test for both.', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v3')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = '840fa95a-46f9-57dc-acb6-540df5e8cc48';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('ca59070e-47a1-5bd4-b589-47476493641c', '840fa95a-46f9-57dc-acb6-540df5e8cc48', 'A', 'Primary HIV infection', false, 0),
  ('0d235a3b-64c0-5dba-8238-931a49b5111c', '840fa95a-46f9-57dc-acb6-540df5e8cc48', 'B', 'Secondary syphilis', true, 1),
  ('044a0282-3481-5127-95ee-b552555794d2', '840fa95a-46f9-57dc-acb6-540df5e8cc48', 'C', 'Pityriasis rosea', false, 2),
  ('d0316216-a69f-5169-8c19-a1e1ced7b00f', '840fa95a-46f9-57dc-acb6-540df5e8cc48', 'D', 'Measles', false, 3),
  ('beddd602-e411-5bc0-9a3d-8ce5e4be6566', '840fa95a-46f9-57dc-acb6-540df5e8cc48', 'E', 'Guttate psoriasis', false, 4);

-- Q649
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('86b8803c-aa00-5e8b-8a71-c67da435d326', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000020', 'sba', 'A 30 year old man is given IM benzathine penicillin for secondary syphilis. Four hours later he has fever, chills, myalgia and a worse rash. What is the SINGLE most likely explanation?', 'The Jarisch-Herxheimer reaction is an acute febrile reaction within 24 hours of starting treatment for syphilis (and other spirochaetal infections such as leptospirosis and Lyme), caused by cytokine release. It resolves within 24 hours. Treat with antipyretics. Warn patients beforehand. In pregnancy, it can cause preterm labour or fetal distress.', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v3')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = '86b8803c-aa00-5e8b-8a71-c67da435d326';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('b486b20b-a08a-5b24-84e1-aea3577281f2', '86b8803c-aa00-5e8b-8a71-c67da435d326', 'A', 'Penicillin anaphylaxis', false, 0),
  ('ac38ff36-5882-5a01-9c19-e561fe43e45e', '86b8803c-aa00-5e8b-8a71-c67da435d326', 'B', 'Serum sickness', false, 1),
  ('cfcd9fef-f0e7-5d9f-a982-029fcb21be55', '86b8803c-aa00-5e8b-8a71-c67da435d326', 'C', 'Treatment failure', false, 2),
  ('889f1a37-d54d-54a2-beeb-aba56b971073', '86b8803c-aa00-5e8b-8a71-c67da435d326', 'D', 'Jarisch-Herxheimer reaction (a self-limiting reaction to treponemal killing)', true, 3),
  ('ca7fc0ae-9708-5be0-9ab4-3b1d01d18a02', '86b8803c-aa00-5e8b-8a71-c67da435d326', 'E', 'Neurosyphilis', false, 4);

-- Q650
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('174d15f9-dfea-5024-be03-d1d91c3feec0', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000020', 'sba', 'A 19 year old woman wants to be tested for chlamydia after unprotected sex 3 days ago with a new partner. She has no symptoms. What is the MOST appropriate advice about timing?', '''Window periods'': chlamydia and gonorrhoea NAATs are reliable from 2 weeks after exposure; syphilis serology from 4-6 weeks (repeat at 12 weeks); HIV fourth-generation tests from 45 days (repeat if earlier). Test at presentation and repeat after the window period if needed. Also consider emergency contraception, pregnancy testing and PEP if indicated.', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v3')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = '174d15f9-dfea-5024-be03-d1d91c3feec0';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('dfe288d6-c437-5615-a8db-1e982e305570', '174d15f9-dfea-5024-be03-d1d91c3feec0', 'A', 'A test at 3 days is completely reliable', false, 0),
  ('ee3a9c42-5f66-5199-9931-0e146c13b75b', '174d15f9-dfea-5024-be03-d1d91c3feec0', 'B', 'No testing is needed without symptoms', false, 1),
  ('f47a8814-2ca2-5381-b924-769284252957', '174d15f9-dfea-5024-be03-d1d91c3feec0', 'C', 'Test at 6 months only', false, 2),
  ('5cb4ea09-0131-524c-84f5-87ace8710e9f', '174d15f9-dfea-5024-be03-d1d91c3feec0', 'D', 'NAAT testing is most reliable from 2 weeks after exposure; test now if wanted and repeat at 2 weeks, and offer emergency contraception if needed', true, 3),
  ('41944802-4217-5540-a012-21c3bc53fa6e', '174d15f9-dfea-5024-be03-d1d91c3feec0', 'E', 'Wait 12 weeks before any test', false, 4);

-- Q651
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('18555899-1eab-5c76-997e-378aae6df27b', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000020', 'sba', 'A 30 year old woman says she was sexually assaulted 3 days ago. She has not washed her clothes. What is the SINGLE most appropriate initial step?', 'SARCs provide specialist forensic medical examination (evidence can be collected up to 7 days or more after some types of assault), emergency contraception, HIV PEP (within 72 hours), hepatitis B vaccination, STI testing and prophylaxis, and psychological support (ISVA). The patient decides whether to involve the police. For under-18s, follow safeguarding procedures.', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v3')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = '18555899-1eab-5c76-997e-378aae6df27b';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('b7e1f6dd-6dbb-5a76-bf56-f988717c9a15', '18555899-1eab-5c76-997e-378aae6df27b', 'A', 'With her consent, refer to a Sexual Assault Referral Centre (SARC) for forensic examination, emergency contraception, PEP/STI prophylaxis and support', true, 0),
  ('a0b6185d-7ffa-5a9f-acee-dde5d276da5e', '18555899-1eab-5c76-997e-378aae6df27b', 'B', 'Prescribe antibiotics only', false, 1),
  ('6b68fb21-47da-58a2-b7bf-1825b177348d', '18555899-1eab-5c76-997e-378aae6df27b', 'C', 'Report to the police without her consent', false, 2),
  ('3154eef7-8116-5232-a152-e0b9f0d996c4', '18555899-1eab-5c76-997e-378aae6df27b', 'D', 'Examine her fully in the GP surgery and take swabs yourself', false, 3),
  ('e28b4166-9165-5b09-85b5-5699c80dd18c', '18555899-1eab-5c76-997e-378aae6df27b', 'E', 'Advise her to shower and come back in a week', false, 4);

-- Q652
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('e43c3e81-9f05-5d31-9ee4-73be84aa7cfa', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000020', 'sba', 'A 25 year old woman has had 5 episodes of vulvovaginal candidiasis in the past year, each confirmed by culture. She is not diabetic and is otherwise well. What is the SINGLE most appropriate management?', 'Recurrent vulvovaginal candidiasis (4 or more episodes a year) is managed with an induction course of oral fluconazole then maintenance (such as 150 mg weekly for 6 months, BASHH). Confirm with culture and species (non-albicans species may be resistant). Check for diabetes, and review triggers (antibiotics, immunosuppression). Treating male partners is not needed unless they have symptoms.', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v3')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = 'e43c3e81-9f05-5d31-9ee4-73be84aa7cfa';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('7baf85c1-b0b7-5098-820c-6ed774ff985d', 'e43c3e81-9f05-5d31-9ee4-73be84aa7cfa', 'A', 'Induction then maintenance therapy with oral fluconazole (e.g. weekly for 6 months)', true, 0),
  ('4e46a866-8345-5bde-a30c-1f4ee138d6f5', 'e43c3e81-9f05-5d31-9ee4-73be84aa7cfa', 'B', 'Long-term oral antibiotics', false, 1),
  ('96cc6dd5-7aa0-5207-a998-8ecf9cb40f2b', 'e43c3e81-9f05-5d31-9ee4-73be84aa7cfa', 'C', 'Treat her partner with antibiotics', false, 2),
  ('93df33ab-151c-597f-a504-20ed1c7b237c', 'e43c3e81-9f05-5d31-9ee4-73be84aa7cfa', 'D', 'Douching daily', false, 3),
  ('dd919ced-8fa6-5da8-b345-80ca5f9d2957', 'e43c3e81-9f05-5d31-9ee4-73be84aa7cfa', 'E', 'Avoid all contraception', false, 4);

-- Q653
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('7769c467-92d6-5937-96aa-c5a45b9aea20', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000020', 'sba', 'A 24 year old man has dysuria and urethral discharge. Gram stain shows polymorphs but no Gram-negative diplococci. NAAT for gonorrhoea and chlamydia are negative. Which organism should also be tested for?', 'Non-gonococcal urethritis is commonly caused by Chlamydia trachomatis and Mycoplasma genitalium (also Trichomonas and others). M. genitalium has increasing macrolide resistance. BASHH recommends doxycycline followed by azithromycin (if macrolide-sensitive) or moxifloxacin. Test of cure is recommended, and partners need notifying.', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v3')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = '7769c467-92d6-5937-96aa-c5a45b9aea20';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('7756536b-d21d-52b9-a081-62dde65816b4', '7769c467-92d6-5937-96aa-c5a45b9aea20', 'A', 'Treponema pallidum', false, 0),
  ('9377782e-4e96-56bb-88f0-9f12137c763b', '7769c467-92d6-5937-96aa-c5a45b9aea20', 'B', 'Trichomonas vaginalis only in women', false, 1),
  ('cadd4174-461e-5a9d-b37f-066e75b19664', '7769c467-92d6-5937-96aa-c5a45b9aea20', 'C', 'Mycoplasma genitalium', true, 2),
  ('ab84844e-d7a5-53f8-925e-5878252b195b', '7769c467-92d6-5937-96aa-c5a45b9aea20', 'D', 'Candida albicans', false, 3),
  ('1e352efc-104b-5632-b1d1-344d4d7ba5a9', '7769c467-92d6-5937-96aa-c5a45b9aea20', 'E', 'Haemophilus ducreyi', false, 4);

-- Q654
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('a82194c9-e2ae-5d67-9275-fde17fc3763d', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000020', 'sba', 'A 35 year old man who has sex with men is not vaccinated against hepatitis A or B. He attends a sexual health clinic. What should be offered?', 'GBMSM are offered hepatitis A and B vaccination, HPV vaccination (up to age 45 through sexual health services), and mpox vaccination (MVA-BN) for those at higher risk. Regular HIV and STI testing, and PrEP, are offered as part of combination prevention.', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v3')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = 'a82194c9-e2ae-5d67-9275-fde17fc3763d';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('32a833c6-c6ea-515d-89d5-cf81437f6173', 'a82194c9-e2ae-5d67-9275-fde17fc3763d', 'A', 'MMR only', false, 0),
  ('6b689215-c4f6-56d8-957d-07d1688dba95', 'a82194c9-e2ae-5d67-9275-fde17fc3763d', 'B', 'Hepatitis A and B vaccination, HPV vaccination (up to age 45), and consider mpox vaccination if eligible', true, 1),
  ('5bbf1bce-f60d-501f-a122-5bf463f6bb26', 'a82194c9-e2ae-5d67-9275-fde17fc3763d', 'C', 'No vaccines are indicated', false, 2),
  ('ed937916-8af1-57ce-aa47-9f1033f86f6c', 'a82194c9-e2ae-5d67-9275-fde17fc3763d', 'D', 'Typhoid vaccine', false, 3),
  ('fd2a1028-2b02-56ea-9136-f2f701c63900', 'a82194c9-e2ae-5d67-9275-fde17fc3763d', 'E', 'BCG only', false, 4);

-- Q655
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('7d99d182-f34d-5660-8ddd-08d533a6c924', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000020', 'sba', 'A 28 year old woman with HIV has an undetectable viral load on ART for over a year. Her HIV-negative partner asks about the risk of sexual transmission without condoms. What is the CORRECT advice?', 'Large studies (PARTNER, PARTNER2, HPTN 052) showed no sexual transmission of HIV when the partner with HIV has a sustained undetectable viral load (below 200 copies/mL) on ART. Condoms still protect against other STIs and pregnancy. Adherence and regular viral load monitoring are essential.', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v3')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = '7d99d182-f34d-5660-8ddd-08d533a6c924';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('fbbe8527-6ce3-5961-94d1-c88ad5140870', '7d99d182-f34d-5660-8ddd-08d533a6c924', 'A', 'Her partner should take PEP after every sexual act', false, 0),
  ('f0c9a6bb-8ed6-56bc-9738-0d69c3502c6b', '7d99d182-f34d-5660-8ddd-08d533a6c924', 'B', 'Viral load has no effect on transmission', false, 1),
  ('37bc2420-8141-58f1-9081-022df4df16b6', '7d99d182-f34d-5660-8ddd-08d533a6c924', 'C', 'Condoms are always needed regardless', false, 2),
  ('1af8d067-57e5-52cd-878e-0ab4b59ab5dd', '7d99d182-f34d-5660-8ddd-08d533a6c924', 'D', 'Undetectable = Untransmittable (U=U): sustained undetectable viral load means HIV is not transmitted sexually', true, 3),
  ('ed18d0be-0f4a-5ee0-999f-4bb45fbd71d5', '7d99d182-f34d-5660-8ddd-08d533a6c924', 'E', 'The risk is still about 1 in 10', false, 4);

-- Q656
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('70460961-4d34-5679-993c-5975488711c0', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000020', 'sba', 'A 34 year old woman with HIV who has an undetectable viral load asks about breastfeeding her baby. What is the current BHIVA advice in the UK?', 'BHIVA guidance still recommends formula feeding as the way to eliminate the risk of postnatal HIV transmission. Women on effective ART with a suppressed viral load who choose to breastfeed should be supported, with monthly maternal viral load monitoring and infant testing. The baby also receives postnatal prophylaxis.', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v3')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = '70460961-4d34-5679-993c-5975488711c0';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('ada39c2d-40af-5190-b9c7-d27b656cefb9', '70460961-4d34-5679-993c-5975488711c0', 'A', 'Breastfeeding is always safe with no monitoring', false, 0),
  ('083b73fe-36a7-5b58-bc4d-f8bf13b9a48f', '70460961-4d34-5679-993c-5975488711c0', 'B', 'The baby must be given formula from a different country', false, 1),
  ('649c21ba-6cb8-5bac-96ab-a29dee40cb93', '70460961-4d34-5679-993c-5975488711c0', 'C', 'She must stop ART to breastfeed', false, 2),
  ('5cf62ff0-300d-5c17-af53-018438dcd034', '70460961-4d34-5679-993c-5975488711c0', 'D', 'Breastfeeding is illegal', false, 3),
  ('74a6666a-8fed-56f0-9628-aa44b63d8a1b', '70460961-4d34-5679-993c-5975488711c0', 'E', 'Formula feeding is still recommended as the safest option, but women with an undetectable viral load who choose to breastfeed should be supported with monitoring', true, 4);

-- Q657
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('b844b4fc-baac-5235-ae00-686935b1d796', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000020', 'sba', 'A 30 year old woman with known genital herpes has 8 recurrences a year that are affecting her quality of life. What is the SINGLE most appropriate management?', 'BASHH: for frequent recurrences (6 or more a year) or significant psychological impact, offer daily suppressive aciclovir or valaciclovir, with review (and a trial off) after about a year. Episodic treatment (short course started at first symptoms) suits infrequent recurrences. Discuss transmission (asymptomatic shedding, condoms, avoiding sex during outbreaks).', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v3')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = 'b844b4fc-baac-5235-ae00-686935b1d796';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('e7a3527d-8afc-52d5-ac20-f4d47ffeae7e', 'b844b4fc-baac-5235-ae00-686935b1d796', 'A', 'Oral doxycycline', false, 0),
  ('57a6609c-5d26-5a6e-b69f-c634bd4b6a3a', 'b844b4fc-baac-5235-ae00-686935b1d796', 'B', 'Episodic treatment only', false, 1),
  ('ccf4a5b6-8c16-53b8-8d14-8560525f4af8', 'b844b4fc-baac-5235-ae00-686935b1d796', 'C', 'Surgical excision of lesions', false, 2),
  ('26f37ddf-ec37-5b6e-bee3-a31375cd040b', 'b844b4fc-baac-5235-ae00-686935b1d796', 'D', 'Suppressive antiviral therapy (e.g. aciclovir 400 mg twice daily), reviewed after 6-12 months', true, 3),
  ('8b76b7f9-d439-5b75-8628-c7cb49033a12', 'b844b4fc-baac-5235-ae00-686935b1d796', 'E', 'Topical steroids', false, 4);

-- Q658
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('109b2059-b739-5138-b3da-50f26d806fa9', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000020', 'sba', 'A 26 year old woman has had pain at the entrance of her vagina during sex for a year. Touching the vestibule with a cotton swab reproduces the pain. There are no visible lesions and STI tests are negative. What is the SINGLE most likely diagnosis?', 'Vulvodynia is chronic vulval pain without a visible cause. In provoked vestibulodynia, pain is triggered by touch (intercourse, tampons). Management is multidisciplinary: avoiding irritants, topical lidocaine, low-dose amitriptyline or gabapentin, pelvic floor physiotherapy and psychosexual therapy.', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v3')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = '109b2059-b739-5138-b3da-50f26d806fa9';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('8827dcb8-fe86-5a66-bd49-f6f4196b0092', '109b2059-b739-5138-b3da-50f26d806fa9', 'A', 'Genital herpes', false, 0),
  ('7c85ff78-0267-5aad-b15c-e7c7d974f167', '109b2059-b739-5138-b3da-50f26d806fa9', 'B', 'Vulval cancer', false, 1),
  ('2a3ff0a7-320b-5d99-9fb8-57f78e551218', '109b2059-b739-5138-b3da-50f26d806fa9', 'C', 'Bacterial vaginosis', false, 2),
  ('52d8b558-b5c2-53b3-87cb-60d2e12d2f4c', '109b2059-b739-5138-b3da-50f26d806fa9', 'D', 'Lichen sclerosus', false, 3),
  ('1722290b-4947-5721-93db-5ea9316aaae8', '109b2059-b739-5138-b3da-50f26d806fa9', 'E', 'Provoked vestibulodynia (vulvodynia)', true, 4);

-- Q659
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('8d308ab2-34e5-5dcb-824d-6c4f71b9ccea', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000020', 'sba', 'A 30 year old man has a painful, ragged, purulent genital ulcer and painful suppurative inguinal lymphadenopathy after travelling to East Africa. Syphilis and HSV tests are negative. What is the SINGLE most likely diagnosis?', 'Chancroid causes painful, soft, ragged ulcers with painful, suppurating inguinal buboes. It is rare in the UK and acquired in tropical regions. Treat with a single dose of ceftriaxone or azithromycin. Donovanosis (Klebsiella granulomatis) causes painless, beefy red ulcers that bleed easily. LGV causes a transient painless ulcer, then painful lymphadenopathy or proctitis.', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v3')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = '8d308ab2-34e5-5dcb-824d-6c4f71b9ccea';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('098640ba-18e5-54e3-ace5-1869902a999d', '8d308ab2-34e5-5dcb-824d-6c4f71b9ccea', 'A', 'Chancroid (Haemophilus ducreyi)', true, 0),
  ('55d8adb0-bc33-54a7-b58b-3a5e611170e8', '8d308ab2-34e5-5dcb-824d-6c4f71b9ccea', 'B', 'Donovanosis (granuloma inguinale)', false, 1),
  ('f6b87993-5237-53f0-a075-d91b69ec596a', '8d308ab2-34e5-5dcb-824d-6c4f71b9ccea', 'C', 'Primary syphilis', false, 2),
  ('09eceb4c-5c89-5509-93b8-0b1b9ce4c081', '8d308ab2-34e5-5dcb-824d-6c4f71b9ccea', 'D', 'Lymphogranuloma venereum', false, 3),
  ('a51d827b-fb66-557a-89e5-714d988f94e8', '8d308ab2-34e5-5dcb-824d-6c4f71b9ccea', 'E', 'Genital herpes', false, 4);

-- Q660
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('fdd3b623-4caa-50ac-b02c-572d596ad221', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000020', 'sba', 'A 14 year old girl attends a sexual health clinic. She is in a sexual relationship with a 24 year old man. What is the SINGLE most appropriate action?', 'Sexual activity in under-16s is not automatically a safeguarding concern if between peers of similar age, but significant age differences, power imbalance, coercion, gifts, drugs or alcohol suggest child sexual exploitation and need a safeguarding referral. Under-13s cannot legally consent, and all such cases need referral. Explain confidentiality and its limits.', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v3')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = 'fdd3b623-4caa-50ac-b02c-572d596ad221';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('ad7be2a1-3bde-5fd5-aaee-07aaf3f4f69b', 'fdd3b623-4caa-50ac-b02c-572d596ad221', 'A', 'Keep it confidential as she is competent', false, 0),
  ('192e0152-fe49-50bd-905e-ddd1a9310fb1', 'fdd3b623-4caa-50ac-b02c-572d596ad221', 'B', 'Provide care and contraception as needed, but make a safeguarding referral because of the age difference and risk of exploitation', true, 1),
  ('92a27e7a-f239-5fb8-966e-60880975662d', 'fdd3b623-4caa-50ac-b02c-572d596ad221', 'C', 'Report her to the police for underage sex', false, 2),
  ('fb9e1baf-1593-54a8-aec7-6eaefc865c42', 'fdd3b623-4caa-50ac-b02c-572d596ad221', 'D', 'Advise her to wait until she is 16', false, 3),
  ('836c48db-af86-5948-9bdb-5852cb758c36', 'fdd3b623-4caa-50ac-b02c-572d596ad221', 'E', 'Refuse to see her without a parent', false, 4);

-- Q661
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('5ad5a8e8-5836-522c-9a1a-832d4b7eef86', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000020', 'sba', 'A 22 year old pregnant woman has anogenital warts at 20 weeks. Which treatment is MOST appropriate in pregnancy?', 'Podophyllotoxin is contraindicated in pregnancy. Imiquimod is not licensed (limited data). Cryotherapy or physical ablation is preferred. Warts may grow during pregnancy and often regress afterwards. Caesarean section is not needed for warts unless they obstruct the birth canal. Rarely, HPV 6/11 causes recurrent respiratory papillomatosis in the baby.', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v3')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = '5ad5a8e8-5836-522c-9a1a-832d4b7eef86';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('30e1300c-ff96-55da-866d-142932b06a87', '5ad5a8e8-5836-522c-9a1a-832d4b7eef86', 'A', 'Imiquimod (licensed in pregnancy)', false, 0),
  ('66d9beca-e245-5ea9-886e-fef18bb5f3c3', '5ad5a8e8-5836-522c-9a1a-832d4b7eef86', 'B', 'Cryotherapy (or ablation); avoid podophyllotoxin', true, 1),
  ('40ad9292-c8f7-595b-b27a-7de1d59839a1', '5ad5a8e8-5836-522c-9a1a-832d4b7eef86', 'C', 'Oral aciclovir', false, 2),
  ('e331320d-24be-53f6-afa0-4d4fc7fd0a34', '5ad5a8e8-5836-522c-9a1a-832d4b7eef86', 'D', 'No treatment is ever allowed', false, 3),
  ('965efaf7-5029-529a-b026-5a6c0c610120', '5ad5a8e8-5836-522c-9a1a-832d4b7eef86', 'E', 'Podophyllotoxin', false, 4);

-- Q662
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('24dcca38-e352-55e8-acc0-a89c465e4087', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000020', 'sba', 'A 70 year old man has a curved, painful erection and a palpable hard plaque on the shaft of his penis for 6 months. He has Dupuytren''s contracture. What is the SINGLE most likely diagnosis?', 'Peyronie''s disease is fibrosis of the tunica albuginea, causing a palpable plaque, penile curvature, painful erections and erectile dysfunction. It is associated with Dupuytren''s contracture. The acute phase often stabilises within 12-18 months. Treatment options include surgery for significant curvature affecting intercourse once stable, and traction devices. Collagenase injections were withdrawn in Europe.', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v3')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = '24dcca38-e352-55e8-acc0-a89c465e4087';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('fecdc8c4-7a13-5b8c-a34b-b949da19169a', '24dcca38-e352-55e8-acc0-a89c465e4087', 'A', 'Balanitis xerotica obliterans', false, 0),
  ('e07ec026-1121-52d3-ab7a-79a54d5f0df4', '24dcca38-e352-55e8-acc0-a89c465e4087', 'B', 'Priapism', false, 1),
  ('8f15e418-e26c-58e0-b3fc-e7ba607f0fd6', '24dcca38-e352-55e8-acc0-a89c465e4087', 'C', 'Paraphimosis', false, 2),
  ('e201b016-7e24-5885-9d3e-91207ffcf148', '24dcca38-e352-55e8-acc0-a89c465e4087', 'D', 'Peyronie''s disease', true, 3),
  ('9da9cc59-7f98-581d-9c4f-dd3002d9fe6a', '24dcca38-e352-55e8-acc0-a89c465e4087', 'E', 'Penile cancer', false, 4);

-- Q663
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('dd75ed34-2d90-5915-aaa9-f7803b3eddd8', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000021', 'sba', 'A randomised controlled trial reports a relative risk of 0.80 for death with a new drug compared with placebo, with a 95% confidence interval of 0.65 to 1.05. What is the CORRECT interpretation?', 'For a ratio (RR, OR, HR), a 95% confidence interval that includes 1 means the result is not statistically significant at p below 0.05. For a difference (such as mean difference), the null value is 0. A non-significant result does not prove no effect, especially if the study was underpowered. The width of the CI reflects precision (sample size).', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v3')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = 'dd75ed34-2d90-5915-aaa9-f7803b3eddd8';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('3ff4ab5b-e682-56e3-a8f9-34320bec8989', 'dd75ed34-2d90-5915-aaa9-f7803b3eddd8', 'A', 'The p-value must be less than 0.01', false, 0),
  ('b6846fe2-4f8c-5e00-bb45-52558a751ab4', 'dd75ed34-2d90-5915-aaa9-f7803b3eddd8', 'B', 'The drug significantly reduces death', false, 1),
  ('0f555654-9ccf-5250-91a2-6137e1241885', 'dd75ed34-2d90-5915-aaa9-f7803b3eddd8', 'C', 'The reduction is not statistically significant at the 5% level, as the confidence interval includes 1', true, 2),
  ('27242da6-3e1c-54f7-92f8-a724c351c176', 'dd75ed34-2d90-5915-aaa9-f7803b3eddd8', 'D', 'The result proves the drug has no effect', false, 3),
  ('3050dc10-9a10-5415-85f5-189679bde573', 'dd75ed34-2d90-5915-aaa9-f7803b3eddd8', 'E', 'The drug significantly increases death', false, 4);

-- Q664
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('2de05a53-49ff-594e-abff-42e42262c218', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000021', 'sba', 'A large trial finds a statistically significant difference when in fact there is no true difference between treatments. What type of error is this?', 'A type I error is wrongly rejecting a true null hypothesis (false positive), and its probability is set by alpha (significance level, often 0.05). Multiple testing increases the risk. A type II error is failing to detect a real difference (false negative), with probability beta. Power (1 - beta, usually 80-90%) depends on sample size, effect size and variability.', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v3')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = '2de05a53-49ff-594e-abff-42e42262c218';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('8411a8b5-702d-5fb3-962f-f3b332beebb4', '2de05a53-49ff-594e-abff-42e42262c218', 'A', 'Confounding', false, 0),
  ('405467b1-543f-51ba-b4c4-90ec46a8d30a', '2de05a53-49ff-594e-abff-42e42262c218', 'B', 'Type I error (false positive), with probability alpha (usually 5%)', true, 1),
  ('ffde102e-5df6-5865-8bfa-db797da849a2', '2de05a53-49ff-594e-abff-42e42262c218', 'C', 'Type II error (false negative)', false, 2),
  ('7d695fd3-22e3-5bdb-9093-0e4aa6586c7e', '2de05a53-49ff-594e-abff-42e42262c218', 'D', 'Selection bias', false, 3),
  ('c6aed772-ef05-5e26-a96b-0eb951fb6bb9', '2de05a53-49ff-594e-abff-42e42262c218', 'E', 'Recall bias', false, 4);

-- Q665
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('70a502a6-d83c-5bd6-b4ee-a0f514605437', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000021', 'sba', 'In a study, people with lung cancer recall their past exposure to chemicals at work more thoroughly than controls without cancer. What type of bias is this?', 'Recall bias is a systematic difference in how cases and controls remember past exposures. It is particularly a problem in case-control studies. It can be reduced by using objective records. The healthy worker effect is a selection bias, because working populations are healthier than the general population.', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v3')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = '70a502a6-d83c-5bd6-b4ee-a0f514605437';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('48eeb767-0f0a-5a7a-87f9-cfe61457fef0', '70a502a6-d83c-5bd6-b4ee-a0f514605437', 'A', 'Attrition bias', false, 0),
  ('5d6ff4e5-f1fa-5d05-801d-87455c84b2ad', '70a502a6-d83c-5bd6-b4ee-a0f514605437', 'B', 'Publication bias', false, 1),
  ('7f6efc77-150d-5638-96c7-7812f5692262', '70a502a6-d83c-5bd6-b4ee-a0f514605437', 'C', 'Recall bias', true, 2),
  ('53421465-5af2-5aec-bc88-339e1e033058', '70a502a6-d83c-5bd6-b4ee-a0f514605437', 'D', 'Lead-time bias', false, 3),
  ('fe790746-c49a-549f-bd16-f19fae037bed', '70a502a6-d83c-5bd6-b4ee-a0f514605437', 'E', 'Healthy worker effect', false, 4);

-- Q666
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('55358797-4611-5420-8fbf-5a04c4477817', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000021', 'sba', 'In a trial, many participants drop out of the treatment arm because of side effects, and the analysis includes only those who completed the study. What problem does this cause?', 'Attrition bias happens when dropouts differ systematically between groups. Per-protocol analysis (only those who completed) can exaggerate treatment benefit. Intention-to-treat analysis (analysing participants in the group they were randomised to) preserves the benefits of randomisation and reflects real-world effectiveness.', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v3')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = '55358797-4611-5420-8fbf-5a04c4477817';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('2b8d985e-404d-5678-b9c4-848dc34d3c2b', '55358797-4611-5420-8fbf-5a04c4477817', 'A', 'No bias', false, 0),
  ('29518627-d56b-5765-bb83-915443ce1158', '55358797-4611-5420-8fbf-5a04c4477817', 'B', 'Attrition bias, overestimating benefit (intention-to-treat analysis helps avoid this)', true, 1),
  ('af911d63-7c77-57db-a00d-69b034ad7eb7', '55358797-4611-5420-8fbf-5a04c4477817', 'C', 'Measurement bias only', false, 2),
  ('c6bf35be-c3a6-5382-8a3f-738afd9627b8', '55358797-4611-5420-8fbf-5a04c4477817', 'D', 'Lead-time bias', false, 3),
  ('8767b84b-565f-5f95-9ad4-98139d8d66a2', '55358797-4611-5420-8fbf-5a04c4477817', 'E', 'Recall bias', false, 4);

-- Q667
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('ac35c4e4-8682-5595-a09d-6324d1ea96d2', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000021', 'sba', 'Why are participants randomly allocated to treatment groups in a randomised controlled trial?', 'Randomisation reduces selection bias and distributes both known and unknown confounders evenly between groups. Allocation concealment prevents investigators influencing which group someone enters. Blinding (single, double or triple) reduces performance and detection (observer) bias.', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v3')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = 'ac35c4e4-8682-5595-a09d-6324d1ea96d2';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('71f74228-a165-5ed0-83fd-2f87604eac09', 'ac35c4e4-8682-5595-a09d-6324d1ea96d2', 'A', 'To avoid the need for consent', false, 0),
  ('e4430c11-182c-540f-ad27-374003e7f9f9', 'ac35c4e4-8682-5595-a09d-6324d1ea96d2', 'B', 'To make sure participants know which treatment they get', false, 1),
  ('a2348f51-e203-5665-9d4e-348bc495491e', 'ac35c4e4-8682-5595-a09d-6324d1ea96d2', 'C', 'To reduce the sample size needed', false, 2),
  ('0013a069-69aa-550c-a2e4-a6c7eab1b257', 'ac35c4e4-8682-5595-a09d-6324d1ea96d2', 'D', 'To balance known and unknown confounding factors between groups, so differences in outcome can be attributed to the intervention', true, 3),
  ('67927c5d-7817-5604-9970-e4938399daad', 'ac35c4e4-8682-5595-a09d-6324d1ea96d2', 'E', 'To make the study cheaper', false, 4);

-- Q668
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('56ccee13-b415-538f-96ed-d369e5c75249', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000021', 'sba', 'A new drug causes a serious side effect in 2% of patients compared with 1% on placebo. What is the number needed to harm (NNH)?', 'Absolute risk increase = 2% - 1% = 1% (0.01). NNH = 1/ARI = 100. On average, treating 100 people causes one additional serious side effect. Weigh NNH against NNT when discussing treatment with patients.', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v3')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = '56ccee13-b415-538f-96ed-d369e5c75249';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('82799527-bf37-5922-93a2-b6451d30f716', '56ccee13-b415-538f-96ed-d369e5c75249', 'A', '2', false, 0),
  ('bedd408c-b5ef-51df-8297-e6088290bc53', '56ccee13-b415-538f-96ed-d369e5c75249', 'B', '10', false, 1),
  ('c8a9c3ab-d508-5e91-99e5-ba85e754a513', '56ccee13-b415-538f-96ed-d369e5c75249', 'C', '50', false, 2),
  ('059d3eee-418d-548e-8449-ee93ca622ebe', '56ccee13-b415-538f-96ed-d369e5c75249', 'D', '100', true, 3),
  ('691e0bcd-8664-5d37-bd6f-d06dd849e5d5', '56ccee13-b415-538f-96ed-d369e5c75249', 'E', '200', false, 4);

-- Q669
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('0717710a-d4ef-5bd4-a79a-fb88b984f96f', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000021', 'sba', 'A town''s death rate is compared with the national rate. After adjusting for age, the standardised mortality ratio (SMR) is 125. What does this mean?', 'SMR = (observed deaths / expected deaths) x 100. Expected deaths are calculated by applying the standard population''s age-specific death rates to the study population (indirect standardisation). SMR above 100 means more deaths than expected, and below 100 means fewer. Standardisation removes confounding by age structure.', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v3')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = '0717710a-d4ef-5bd4-a79a-fb88b984f96f';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('6e5c43d4-063e-53ef-91f4-f326031fb3e3', '0717710a-d4ef-5bd4-a79a-fb88b984f96f', 'A', 'Life expectancy is 125 years', false, 0),
  ('586c68f5-8b39-5cb8-82d8-2b35c70c3b00', '0717710a-d4ef-5bd4-a79a-fb88b984f96f', 'B', '25% more deaths occurred than expected based on national age-specific death rates', true, 1),
  ('cf10222b-32b0-55f9-844a-157547f2ad22', '0717710a-d4ef-5bd4-a79a-fb88b984f96f', 'C', '25% fewer deaths than expected', false, 2),
  ('b424211c-4ec4-5ba3-afd0-135bf5949650', '0717710a-d4ef-5bd4-a79a-fb88b984f96f', 'D', 'The town''s population is 25% older', false, 3),
  ('51a2be19-b29f-598a-8333-a68e69719841', '0717710a-d4ef-5bd4-a79a-fb88b984f96f', 'E', 'The town has 125 deaths per year', false, 4);

-- Q670
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('a59f25bc-8f26-525b-a3b5-e6914b1417ea', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000021', 'sba', 'A cost-effectiveness analysis expresses the benefit of a treatment in terms of both length and quality of life. Which measure is used, and what is NICE''s usual threshold?', 'A QALY combines quantity and quality of life (1 QALY = 1 year in perfect health). NICE generally regards interventions costing under about £20,000-£30,000 per QALY as cost-effective, with higher thresholds for end-of-life and very rare conditions. The incremental cost-effectiveness ratio (ICER) compares the extra cost and extra QALYs of the new treatment with current care.', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v3')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = 'a59f25bc-8f26-525b-a3b5-e6914b1417ea';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('56fda245-e2df-5ff9-b6c9-c80d9526c565', 'a59f25bc-8f26-525b-a3b5-e6914b1417ea', 'A', 'Life expectancy; £100,000 per year', false, 0),
  ('799acd0b-014b-5f1b-877e-08fdc20a64ef', 'a59f25bc-8f26-525b-a3b5-e6914b1417ea', 'B', 'Quality-adjusted life year (QALY); about £20,000-£30,000 per QALY gained (updated thresholds under review)', true, 1),
  ('6cf048dd-8dc8-5f4c-b750-507eb44d5d85', 'a59f25bc-8f26-525b-a3b5-e6914b1417ea', 'C', 'Relative risk; £5,000', false, 2),
  ('e8a9c42e-4b6e-57eb-87c3-fc53acb30144', 'a59f25bc-8f26-525b-a3b5-e6914b1417ea', 'D', 'Number needed to treat; any cost', false, 3),
  ('359b35f3-3d17-5028-a2df-fe792718d84e', 'a59f25bc-8f26-525b-a3b5-e6914b1417ea', 'E', 'Disability-adjusted life year; £1,000 per DALY', false, 4);

-- Q671
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('a9057546-8e65-5d13-a794-9cb2ef536277', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000021', 'sba', 'A deprived area with high health needs has fewer GPs per head than an affluent area. What concept does this illustrate?', 'Tudor Hart''s inverse care law describes how people with the greatest need often have the poorest access to care. Health inequalities are driven by social determinants (income, education, housing, employment), as described in the Marmot reviews. Proportionate universalism means actions should be universal but scaled to the level of disadvantage.', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v3')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = 'a9057546-8e65-5d13-a794-9cb2ef536277';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('33e5d8d4-1909-5113-ae6b-ae0b56a37e18', 'a9057546-8e65-5d13-a794-9cb2ef536277', 'A', 'Lead-time bias', false, 0),
  ('da7607a7-64d8-5dc1-afa3-ab164bfa1bb4', 'a9057546-8e65-5d13-a794-9cb2ef536277', 'B', 'The inverse care law (the availability of good medical care tends to vary inversely with the need for it)', true, 1),
  ('241c8b4a-d068-5d4b-813a-ea5d73995047', 'a9057546-8e65-5d13-a794-9cb2ef536277', 'C', 'The prevention paradox', false, 2),
  ('6580a681-f1d0-5d22-8cfc-d0fd576b7ffd', 'a9057546-8e65-5d13-a794-9cb2ef536277', 'D', 'Regression to the mean', false, 3),
  ('c73c3058-5b09-559f-a169-a5c05e01c710', 'a9057546-8e65-5d13-a794-9cb2ef536277', 'E', 'The healthy worker effect', false, 4);

-- Q672
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('44e80ee8-aa87-5cd9-9997-c5792b721868', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000021', 'sba', 'A disease has a basic reproduction number (R0) of 4. What proportion of the population needs to be immune to achieve herd immunity (roughly)?', 'The herd immunity threshold is approximately 1 - 1/R0. With R0 = 4, the threshold is 1 - 0.25 = 75%. Measles has an R0 of 12-18, so about 95% coverage is needed, which is why 2-dose MMR coverage is crucial. Vaccine effectiveness and population mixing also affect the real threshold.', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v3')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = '44e80ee8-aa87-5cd9-9997-c5792b721868';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('f65a24b2-3cb1-5cbf-8692-45639bb15dae', '44e80ee8-aa87-5cd9-9997-c5792b721868', 'A', '25%', false, 0),
  ('e2b99239-da1a-5547-a83f-35810f0c08da', '44e80ee8-aa87-5cd9-9997-c5792b721868', 'B', '40%', false, 1),
  ('d5e85fee-0f05-54b3-ba4a-1c4e6ba0339c', '44e80ee8-aa87-5cd9-9997-c5792b721868', 'C', '75% (1 - 1/R0)', true, 2),
  ('551a5093-9d9d-5ab2-b384-9c58cd8bb0fd', '44e80ee8-aa87-5cd9-9997-c5792b721868', 'D', '95%', false, 3),
  ('4e9ca650-3575-5fb3-9657-f0034768aa61', '44e80ee8-aa87-5cd9-9997-c5792b721868', 'E', '100%', false, 4);

-- Q673
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('a40de13f-14bf-5eea-a8b1-b4d15a64b760', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000021', 'sba', 'A study finds that countries with higher chocolate consumption have more Nobel prize winners. A journalist concludes that eating chocolate makes individuals smarter. What error has been made?', 'Ecological studies compare groups or populations rather than individuals. They are useful for generating hypotheses but prone to confounding (such as wealth) and the ecological fallacy. Individual-level studies (cohort, case-control, RCT) are needed to test causation.', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v3')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = 'a40de13f-14bf-5eea-a8b1-b4d15a64b760';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('330dc11f-1be5-51b3-b0f5-ae58cf642872', 'a40de13f-14bf-5eea-a8b1-b4d15a64b760', 'A', 'Type II error', false, 0),
  ('77ec704b-5956-5f47-b381-645928bdbce5', 'a40de13f-14bf-5eea-a8b1-b4d15a64b760', 'B', 'Recall bias', false, 1),
  ('26835ed5-69dd-5d0c-8194-b2bff4001978', 'a40de13f-14bf-5eea-a8b1-b4d15a64b760', 'C', 'Attrition bias', false, 2),
  ('84c018ec-47e9-5397-a505-4a788c86c24f', 'a40de13f-14bf-5eea-a8b1-b4d15a64b760', 'D', 'Ecological fallacy (inferring individual-level relationships from population-level data)', true, 3),
  ('eb001648-6c95-5a36-9c96-0ae6d9a6ae27', 'a40de13f-14bf-5eea-a8b1-b4d15a64b760', 'E', 'Lead-time bias', false, 4);

-- Q674
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('2b357e1c-48af-5e69-84e8-dbd8a06f0f2d', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000021', 'sba', 'A test''s results are reported as a likelihood ratio. A positive test has a positive likelihood ratio (LR+) of 10. What does this mean?', 'LR+ = sensitivity / (1 - specificity). LR- = (1 - sensitivity) / specificity. An LR+ above 10 or LR- below 0.1 substantially changes the probability of disease. Likelihood ratios are independent of prevalence and can be combined with pre-test odds (Bayes'' theorem, or a Fagan nomogram) to estimate post-test probability.', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v3')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = '2b357e1c-48af-5e69-84e8-dbd8a06f0f2d';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('6ec01ffa-c978-5ec8-b0e2-e6fe3a26de6e', '2b357e1c-48af-5e69-84e8-dbd8a06f0f2d', 'A', '10 people need to be tested to find one case', false, 0),
  ('38654284-6667-5428-b4cd-9b32e91f72d7', '2b357e1c-48af-5e69-84e8-dbd8a06f0f2d', 'B', 'A positive result is 10 times more likely in someone with the disease than in someone without it, greatly increasing post-test probability', true, 1),
  ('a4e3226e-37cf-5a36-8b4f-9fa6007cecca', '2b357e1c-48af-5e69-84e8-dbd8a06f0f2d', 'C', 'The test is useless', false, 2),
  ('5cfcb21f-0fda-5c6b-a633-6e1699f4b7fb', '2b357e1c-48af-5e69-84e8-dbd8a06f0f2d', 'D', 'The disease prevalence is 10%', false, 3),
  ('a7dcfd28-28df-5d94-a51e-cdfb98dee416', '2b357e1c-48af-5e69-84e8-dbd8a06f0f2d', 'E', 'The test is 10% sensitive', false, 4);

-- Q675
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('a37eda32-8f63-51dc-a468-db2ef6292c05', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000021', 'sba', 'The distribution of income in a population is positively skewed, with a few very high earners. Which measure of central tendency is MOST appropriate to summarise it?', 'In skewed distributions, the mean is pulled towards the tail (in positive skew, mean > median > mode), so the median is a better summary, with the interquartile range for spread. For normally distributed data, the mean and standard deviation are used (about 68% within 1 SD, 95% within 1.96 SD).', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v3')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = 'a37eda32-8f63-51dc-a468-db2ef6292c05';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('2c850646-077a-5466-bb97-7c6f908201d9', 'a37eda32-8f63-51dc-a468-db2ef6292c05', 'A', 'Median', true, 0),
  ('d0128a45-d52c-5301-8a7d-8036bedefc85', 'a37eda32-8f63-51dc-a468-db2ef6292c05', 'B', 'Mean', false, 1),
  ('6f6d96a3-ad15-5ba8-8c33-dba2fa1f63cf', 'a37eda32-8f63-51dc-a468-db2ef6292c05', 'C', 'Mode', false, 2),
  ('8452192f-732c-525e-8f17-e5621558947e', 'a37eda32-8f63-51dc-a468-db2ef6292c05', 'D', 'Standard deviation', false, 3),
  ('ac36df0d-e357-5fbb-ba89-869bf85e2432', 'a37eda32-8f63-51dc-a468-db2ef6292c05', 'E', 'Range', false, 4);

-- Q676
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('c71ba07d-2d97-5632-88ec-71327441795e', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000021', 'sba', 'A study compares mean blood pressure between two independent groups of patients with normally distributed data. Which statistical test is MOST appropriate?', 'Choosing tests: comparing 2 means of normally distributed data (independent groups) uses an unpaired t-test (paired t-test for before-and-after in the same individuals). Non-parametric equivalents are Mann-Whitney U (independent) and Wilcoxon signed-rank (paired). Categorical data (proportions) use chi-squared (or Fisher''s exact for small numbers). More than 2 groups use ANOVA (or Kruskal-Wallis).', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v3')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = 'c71ba07d-2d97-5632-88ec-71327441795e';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('42a85f2a-8d54-559b-8c85-5b9f4d10d25c', 'c71ba07d-2d97-5632-88ec-71327441795e', 'A', 'Mann-Whitney U test', false, 0),
  ('d541d140-9bda-50e6-b7b1-f4eb35291d89', 'c71ba07d-2d97-5632-88ec-71327441795e', 'B', 'Unpaired (independent) t-test', true, 1),
  ('d91aacab-b3ae-5e1e-a2af-00829f1b7a58', 'c71ba07d-2d97-5632-88ec-71327441795e', 'C', 'Pearson''s correlation only', false, 2),
  ('baf1bc8c-f53b-5674-bdf0-bb5058f56168', 'c71ba07d-2d97-5632-88ec-71327441795e', 'D', 'Paired t-test', false, 3),
  ('91e65e18-9cd3-5f2f-854c-de5c1e5bf4cf', 'c71ba07d-2d97-5632-88ec-71327441795e', 'E', 'Chi-squared test', false, 4);

-- Q677
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('3b0780f0-db77-5249-b9b0-2fa8be34d65c', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000021', 'sba', 'A cancer trial presents survival over time using a stepped curve, and reports a hazard ratio of 0.7 for the new treatment. What does the hazard ratio indicate?', 'Kaplan-Meier curves show the proportion surviving over time and account for censoring (patients lost to follow-up or still alive at the study end). The hazard ratio (from Cox regression) compares the event rate between groups over time. A HR of 0.7 means a 30% relative reduction in hazard. A HR above 1 means increased hazard.', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v3')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = '3b0780f0-db77-5249-b9b0-2fa8be34d65c';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('1b3c1ed9-813d-5ce5-8648-fe2d2efa873e', '3b0780f0-db77-5249-b9b0-2fa8be34d65c', 'A', 'The new treatment increases risk by 70%', false, 0),
  ('cb49c96b-d406-56a8-bf38-f94cf425468c', '3b0780f0-db77-5249-b9b0-2fa8be34d65c', 'B', '7 patients need to be treated', false, 1),
  ('34d3e9ad-a44c-58e5-9751-57efce596a2d', '3b0780f0-db77-5249-b9b0-2fa8be34d65c', 'C', 'Median survival is 0.7 years', false, 2),
  ('df1413c2-b85e-5bf9-866b-ef9a4bf54fc7', '3b0780f0-db77-5249-b9b0-2fa8be34d65c', 'D', 'Survival is 70% at 5 years', false, 3),
  ('395d4d0d-c207-5467-af39-6b049c43c4c3', '3b0780f0-db77-5249-b9b0-2fa8be34d65c', 'E', 'At any given time, patients on the new treatment have a 30% lower instantaneous risk of the event than controls', true, 4);

-- Q678
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('0dcf4313-e45d-507b-be3a-0c4dc810c389', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000021', 'sba', 'A new drug is being tested for the first time in humans in a small group of healthy volunteers to assess safety and pharmacokinetics. Which phase of clinical trial is this?', 'Phase I: first in humans, a small number of (often healthy) volunteers, safety, dosing and pharmacokinetics. Phase II: patients with the condition, efficacy and side effects. Phase III: large randomised comparisons with standard treatment, which support licensing. Phase IV: post-marketing surveillance of long-term and rare adverse effects (such as the MHRA Yellow Card scheme).', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v3')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = '0dcf4313-e45d-507b-be3a-0c4dc810c389';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('0e682b90-efa7-582e-b9d7-1580adf41e26', '0dcf4313-e45d-507b-be3a-0c4dc810c389', 'A', 'Phase II', false, 0),
  ('4ba59293-9776-5674-be6f-472279df062c', '0dcf4313-e45d-507b-be3a-0c4dc810c389', 'B', 'Pre-clinical', false, 1),
  ('61d7a77e-c715-55ec-8c78-a3271d8d918a', '0dcf4313-e45d-507b-be3a-0c4dc810c389', 'C', 'Phase I', true, 2),
  ('5dd4787b-c7c2-5978-a617-cfe2ee35a147', '0dcf4313-e45d-507b-be3a-0c4dc810c389', 'D', 'Phase III', false, 3),
  ('4355a0bc-2d15-5860-a1d3-13e71257af7a', '0dcf4313-e45d-507b-be3a-0c4dc810c389', 'E', 'Phase IV', false, 4);

-- Q679
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('08c06196-3f00-5d94-bbff-4e86f0895ed7', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000021', 'sba', 'A hospital team measures how often VTE risk assessments are completed against the national standard, makes changes and then remeasures. What is this activity?', 'Clinical audit measures current practice against an agreed standard, implements changes, and re-audits to close the loop (the audit cycle). Research aims to generate new knowledge and usually needs ethics approval. Service evaluation describes current care without a standard. Quality improvement often uses PDSA (Plan-Do-Study-Act) cycles.', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v3')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = '08c06196-3f00-5d94-bbff-4e86f0895ed7';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('dae1c207-562a-5255-8c8e-467f5c079bfe', '08c06196-3f00-5d94-bbff-4e86f0895ed7', 'A', 'Clinical audit', true, 0),
  ('39728ac9-f263-5658-a3c6-36b7fbe89380', '08c06196-3f00-5d94-bbff-4e86f0895ed7', 'B', 'Service evaluation only', false, 1),
  ('dcd5cecb-5cd0-53c2-80f3-36bb34fbccc6', '08c06196-3f00-5d94-bbff-4e86f0895ed7', 'C', 'Case-control study', false, 2),
  ('5efbc82a-def4-5280-bbde-13155d1559c2', '08c06196-3f00-5d94-bbff-4e86f0895ed7', 'D', 'Research', false, 3),
  ('ef42c145-8e57-5a86-b6db-7fac083e40cb', '08c06196-3f00-5d94-bbff-4e86f0895ed7', 'E', 'Randomised controlled trial', false, 4);

-- Q680
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('e83af812-339d-5be7-a34d-122d29035a50', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000021', 'sba', 'A doctor wants to share identifiable patient information for a purpose other than direct care. Which framework of principles governs the use of confidential patient information in NHS organisations?', 'The 8 Caldicott principles cover justifying the purpose, using identifiable data only when necessary, using the minimum necessary, access on a strict need-to-know basis, everyone understanding their responsibilities, complying with the law (UK GDPR, Data Protection Act 2018), recognising that the duty to share can be as important as the duty to protect, and informing patients about how their information is used.', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v3')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = 'e83af812-339d-5be7-a34d-122d29035a50';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('41a426dc-96a7-5025-8e28-5b449a55bf5b', 'e83af812-339d-5be7-a34d-122d29035a50', 'A', 'The Gillick principles', false, 0),
  ('790bc42d-f9ed-50d5-ac7d-f1ff51d80be7', 'e83af812-339d-5be7-a34d-122d29035a50', 'B', 'The Caldicott principles (overseen by a Caldicott Guardian)', true, 1),
  ('a2da0df5-b699-5b2d-b5e3-c011281c5780', 'e83af812-339d-5be7-a34d-122d29035a50', 'C', 'The Bradford Hill criteria', false, 2),
  ('34def678-2420-53cb-bbd5-a5215377bf0a', 'e83af812-339d-5be7-a34d-122d29035a50', 'D', 'The Bolam test', false, 3),
  ('dd276db4-7b73-5067-8eb9-89917b193601', 'e83af812-339d-5be7-a34d-122d29035a50', 'E', 'The Wilson-Jungner criteria', false, 4);

-- Q681
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('4b2c6529-b66b-53ee-a1e5-b77028dce567', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000021', 'sba', 'Researchers measure two continuous variables (BMI and systolic BP) in 500 adults and want to assess the strength of a linear relationship. Which statistic is MOST appropriate?', 'Pearson''s r measures the strength and direction of a linear relationship between two normally distributed continuous variables (-1 to +1). Spearman''s rank correlation is used for non-normal or ordinal data. Correlation does not mean causation. Linear regression describes how one variable changes with another, and allows adjustment for confounders.', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v3')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = '4b2c6529-b66b-53ee-a1e5-b77028dce567';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('ac34efe3-ff87-5d2a-8bf4-32880634a1c3', '4b2c6529-b66b-53ee-a1e5-b77028dce567', 'A', 'Pearson''s correlation coefficient (r)', true, 0),
  ('1a02ec44-484d-5308-9626-52c39b051f07', '4b2c6529-b66b-53ee-a1e5-b77028dce567', 'B', 'Odds ratio', false, 1),
  ('6499b665-d368-53f9-b687-76fb3209dd2c', '4b2c6529-b66b-53ee-a1e5-b77028dce567', 'C', 'Chi-squared statistic', false, 2),
  ('c5e45875-5d91-54d4-a2e2-7db6b7c9299a', '4b2c6529-b66b-53ee-a1e5-b77028dce567', 'D', 'Relative risk', false, 3),
  ('c4ef88f7-af9e-5c6a-9900-478e60fce5c0', '4b2c6529-b66b-53ee-a1e5-b77028dce567', 'E', 'Number needed to treat', false, 4);

-- Q682
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('34f88384-f5d0-5683-b960-749f7a547970', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000021', 'sba', 'A screening test has a sensitivity of 80% and a specificity of 95%. Which statement is CORRECT?', 'Sensitivity = TP/(TP + FN). Specificity = TN/(TN + FP). A highly sensitive test, when negative, helps rule a disease out (SnNout). A highly specific test, when positive, helps rule it in (SpPin). PPV and NPV depend on prevalence: PPV falls and NPV rises as prevalence falls.', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v3')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = '34f88384-f5d0-5683-b960-749f7a547970';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('65f832bd-3292-5d7d-9637-b4ad3391b16f', '34f88384-f5d0-5683-b960-749f7a547970', 'A', 'A highly sensitive test is best for ruling a disease in', false, 0),
  ('ad660c06-31b9-50ec-90f1-f19b07eff25c', '34f88384-f5d0-5683-b960-749f7a547970', 'B', 'Sensitivity is the proportion of positive tests that are true positives', false, 1),
  ('4b7d01f3-079d-50ec-8919-e853db868e6b', '34f88384-f5d0-5683-b960-749f7a547970', 'C', 'Sensitivity is the proportion of people with the disease who test positive; specificity is the proportion without the disease who test negative', true, 2),
  ('7efc0d67-830b-5c6f-a7fa-f063be452c6a', '34f88384-f5d0-5683-b960-749f7a547970', 'D', 'PPV is independent of prevalence', false, 3),
  ('21f27c13-f55a-5bf8-8ab1-3e0783dc7409', '34f88384-f5d0-5683-b960-749f7a547970', 'E', 'Specificity depends on disease prevalence', false, 4);

-- Q683
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('8d260c01-3932-53d1-b226-e9fa9d71aed0', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000002', 'sba', 'A 50 year old man treated for TB 10 years ago has haemoptysis. Chest X-ray shows a round mass inside an old upper lobe cavity with a crescent of air around it. What is the SINGLE most likely diagnosis?', 'An aspergilloma is a ball of Aspergillus fungus growing in a pre-existing cavity (old TB, sarcoidosis). It shows a mobile mass with an air crescent. It may be asymptomatic or cause haemoptysis, which can be massive. Aspergillus IgG is positive. Treatment is observation, antifungals, bronchial artery embolisation for bleeding, or surgical resection.', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v3')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = '8d260c01-3932-53d1-b226-e9fa9d71aed0';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('636c4516-bdbd-5143-8b8b-31c55187e311', '8d260c01-3932-53d1-b226-e9fa9d71aed0', 'A', 'Lung abscess', false, 0),
  ('e0cb8fff-5799-563b-bf25-94c2ded6a2ce', '8d260c01-3932-53d1-b226-e9fa9d71aed0', 'B', 'Reactivated TB', false, 1),
  ('eedb29da-99f5-5b04-9981-e90f1b3debaf', '8d260c01-3932-53d1-b226-e9fa9d71aed0', 'C', 'Squamous cell carcinoma', false, 2),
  ('3766c664-d306-577b-af51-15ce2f896a6b', '8d260c01-3932-53d1-b226-e9fa9d71aed0', 'D', 'Aspergilloma (fungal ball)', true, 3),
  ('c53f85c0-bdfc-58a5-97fb-e58ca6c0f21e', '8d260c01-3932-53d1-b226-e9fa9d71aed0', 'E', 'Hydatid cyst', false, 4);

-- Q684
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('d4aacf33-ac28-554d-b2e4-dcc93fa408a6', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000002', 'sba', 'A 65 year old woman has chronic dry cough for 3 months. She does not smoke, her chest X-ray and spirometry are normal, and she takes no ACE inhibitor. She has heartburn and frequent throat clearing with nasal drip. What are the commonest causes of chronic cough with a normal chest X-ray?', 'Chronic cough (over 8 weeks) with a normal CXR and no ACE inhibitor is commonly caused by asthma or eosinophilic bronchitis, GORD, and rhinosinusitis (upper airway cough). Treat each systematically (such as a trial of inhaled steroid, PPI, or nasal steroid). Refer if red flags or persistent cough. Smokers need further investigation.', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v3')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = 'd4aacf33-ac28-554d-b2e4-dcc93fa408a6';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('966a5575-660c-51be-8aca-94ed7b5ab0e6', 'd4aacf33-ac28-554d-b2e4-dcc93fa408a6', 'A', 'Pulmonary fibrosis', false, 0),
  ('31d7a368-367b-5245-bdb5-326d40221eb1', 'd4aacf33-ac28-554d-b2e4-dcc93fa408a6', 'B', 'Tuberculosis', false, 1),
  ('c582a306-56c3-5bde-b388-6141a85c012f', 'd4aacf33-ac28-554d-b2e4-dcc93fa408a6', 'C', 'Asthma (cough-variant), gastro-oesophageal reflux and upper airway cough syndrome (post-nasal drip)', true, 2),
  ('c7adde9e-337c-5bc3-9874-0d4b1d16e62c', 'd4aacf33-ac28-554d-b2e4-dcc93fa408a6', 'D', 'Lung cancer in all cases', false, 3),
  ('73b20e27-669f-531e-bb6b-901d236a8d58', 'd4aacf33-ac28-554d-b2e4-dcc93fa408a6', 'E', 'Heart failure', false, 4);

-- Q685
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('aee25e07-4e84-50a8-9e9e-01a6754be04a', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000002', 'sba', 'A 28 year old woman has asthma well controlled on an ICS/LABA inhaler. She is now 10 weeks pregnant and asks whether to stop her inhalers. What is the SINGLE most appropriate advice?', 'Inhaled corticosteroids, SABA and LABA are safe in pregnancy and breastfeeding. Uncontrolled asthma increases the risk of pre-eclampsia, preterm birth and low birthweight. Treat acute attacks normally (including oral steroids). Leukotriene antagonists can be continued if needed for control.', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v3')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = 'aee25e07-4e84-50a8-9e9e-01a6754be04a';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('997cd1e5-47c8-55ef-8cfa-bafcce53bf5b', 'aee25e07-4e84-50a8-9e9e-01a6754be04a', 'A', 'Stop the steroid and use salbutamol only', false, 0),
  ('a9819fed-0975-56e5-8a22-6005538b402e', 'aee25e07-4e84-50a8-9e9e-01a6754be04a', 'B', 'Stop all inhalers until after delivery', false, 1),
  ('72c970e0-ebec-545e-8d87-0d924957cdbe', 'aee25e07-4e84-50a8-9e9e-01a6754be04a', 'C', 'Switch to oral prednisolone', false, 2),
  ('4105a3a1-ac1f-5a10-ae29-ba47c312c16e', 'aee25e07-4e84-50a8-9e9e-01a6754be04a', 'D', 'Reduce to half dose', false, 3),
  ('f89be7c2-6afd-5d7b-9397-e23f880d1ac1', 'aee25e07-4e84-50a8-9e9e-01a6754be04a', 'E', 'Continue her inhalers as usual; poorly controlled asthma is a greater risk to the baby than the medication', true, 4);

-- Q686
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('9e1529f7-b8d0-5204-97d6-107adbfa9e5e', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000002', 'sba', 'A 30 year old woman with breathlessness has spirometry before and after salbutamol. Which result would MOST support asthma in adults?', 'Bronchodilator reversibility (FEV1 increase of 12% or more and 200 mL or more) supports asthma. Peak flow variability over 20% across 2 weeks, raised FeNO (50 ppb or more) and raised blood eosinophils also support it. Normal tests between episodes do not exclude asthma, so bronchial challenge testing may be needed.', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v3')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = '9e1529f7-b8d0-5204-97d6-107adbfa9e5e';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('226a97d1-9649-537d-81a6-86b770825e2f', '9e1529f7-b8d0-5204-97d6-107adbfa9e5e', 'A', 'An FEV1/FVC ratio of 0.85 with no change', false, 0),
  ('4fc2b5f9-712f-542c-b373-60005ea29eaf', '9e1529f7-b8d0-5204-97d6-107adbfa9e5e', 'B', 'An increase in FEV1 of 12% or more AND 200 mL or more after bronchodilator', true, 1),
  ('7b68965e-1e5e-5acd-b9fd-24a1aa112ac1', '9e1529f7-b8d0-5204-97d6-107adbfa9e5e', 'C', 'A fall in FEV1 after salbutamol', false, 2),
  ('4c5d8599-0239-5258-b3f1-62c5d9bd9658', '9e1529f7-b8d0-5204-97d6-107adbfa9e5e', 'D', 'A reduced transfer factor', false, 3),
  ('1a08390a-daa6-5073-a79f-54e38100501e', '9e1529f7-b8d0-5204-97d6-107adbfa9e5e', 'E', 'A normal peak flow on a single reading', false, 4);

-- Q687
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('4e6b1dea-b6e8-542e-b5fd-9e7891e4f066', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000002', 'sba', 'A 75 year old man on long-term oxygen therapy for COPD continues to smoke 10 cigarettes a day. What is the MOST important safety concern?', 'Smoking near oxygen causes serious burns and house fires. NICE advises not offering LTOT to people who continue to smoke, after a risk assessment. The home oxygen risk assessment includes smoking, e-cigarettes and other fire hazards. Smoking cessation support is essential.', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v3')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = '4e6b1dea-b6e8-542e-b5fd-9e7891e4f066';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('cd628032-e720-5905-afb2-9839c323f3a5', '4e6b1dea-b6e8-542e-b5fd-9e7891e4f066', 'A', 'Hypoglycaemia', false, 0),
  ('dd2df7da-297c-54a8-917a-3d3b0a459039', '4e6b1dea-b6e8-542e-b5fd-9e7891e4f066', 'B', 'Pneumothorax', false, 1),
  ('838b4a12-a2c1-5276-8445-d8eabfa86bdc', '4e6b1dea-b6e8-542e-b5fd-9e7891e4f066', 'C', 'Fire and burns risk; he must not smoke while using oxygen (and LTOT is usually not offered to current smokers)', true, 2),
  ('a20be5a4-f25e-5906-b191-8904249f2f94', '4e6b1dea-b6e8-542e-b5fd-9e7891e4f066', 'D', 'Hypocapnia', false, 3),
  ('08254efa-0598-5a40-903c-a7b7c8363c56', '4e6b1dea-b6e8-542e-b5fd-9e7891e4f066', 'E', 'Oxygen toxicity', false, 4);

-- Q688
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('2e373d73-a168-5fce-bd50-f654b7deb520', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000002', 'sba', 'A 40 year old man arrived from Eastern Europe with pulmonary TB that has not responded to standard treatment. Testing shows resistance to both rifampicin and isoniazid. What is this called?', 'MDR-TB is resistance to at least rifampicin and isoniazid. XDR-TB adds resistance to fluoroquinolones and at least one other group A drug. Risk factors are previous TB treatment, poor adherence and coming from high-prevalence areas. Rapid molecular tests (GeneXpert) detect rifampicin resistance. Treatment is with specialist regimens (such as BPaLM) and directly observed therapy.', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v3')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = '2e373d73-a168-5fce-bd50-f654b7deb520';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('b3540b30-578b-53a9-abc0-8bc639be3d9a', '2e373d73-a168-5fce-bd50-f654b7deb520', 'A', 'Drug-sensitive TB', false, 0),
  ('b80100e1-eab6-5aeb-a569-7bc9f8398c45', '2e373d73-a168-5fce-bd50-f654b7deb520', 'B', 'Extensively drug-resistant TB only', false, 1),
  ('7ada831d-b522-57dc-adfc-8fb7674308ef', '2e373d73-a168-5fce-bd50-f654b7deb520', 'C', 'Latent TB', false, 2),
  ('70f40943-87b0-5f2e-bdb5-686eb7d32858', '2e373d73-a168-5fce-bd50-f654b7deb520', 'D', 'Non-tuberculous mycobacterial infection', false, 3),
  ('1b4725be-f96a-55b3-8ab4-5085388d56dd', '2e373d73-a168-5fce-bd50-f654b7deb520', 'E', 'Multidrug-resistant TB (MDR-TB)', true, 4);

-- Q689
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('e2c202f5-f0e9-5b7c-bf9b-753474e8f765', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000002', 'sba', 'A 70 year old woman with bronchiectasis has a positive sputum culture for Mycobacterium avium complex on 3 separate samples, with worsening cavitating lung disease. What is the SINGLE most likely diagnosis?', 'Non-tuberculous mycobacteria (MAC, M. abscessus, M. kansasii) are environmental organisms causing lung disease in people with structural lung disease (bronchiectasis, COPD, CF), or the ''Lady Windermere'' pattern in older women. Diagnosis needs symptoms, imaging and repeated positive cultures. Treatment is prolonged multi-drug therapy (such as rifampicin, ethambutol and a macrolide). It is not transmitted between people.', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v3')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = 'e2c202f5-f0e9-5b7c-bf9b-753474e8f765';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('a879de3c-8d3d-5722-a1ea-d267c5606ec0', 'e2c202f5-f0e9-5b7c-bf9b-753474e8f765', 'A', 'Sarcoidosis', false, 0),
  ('41bc8faa-bfcc-5fb0-b5b8-17bcbe3bc818', 'e2c202f5-f0e9-5b7c-bf9b-753474e8f765', 'B', 'Non-tuberculous mycobacterial pulmonary disease', true, 1),
  ('74fee24f-4970-5d2a-be89-c3c8d93ddece', 'e2c202f5-f0e9-5b7c-bf9b-753474e8f765', 'C', 'Lung cancer', false, 2),
  ('23f8ffe4-7b7c-56aa-87f8-21e3e49defce', 'e2c202f5-f0e9-5b7c-bf9b-753474e8f765', 'D', 'Aspergilloma', false, 3),
  ('82a5d083-2690-57df-9d0d-74395e075420', 'e2c202f5-f0e9-5b7c-bf9b-753474e8f765', 'E', 'Pulmonary tuberculosis', false, 4);

-- Q690
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('2855abb6-6b60-561a-aacf-13b1abca62b8', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000002', 'sba', 'A 35 year old man climbs to 4,500 m and develops headache, nausea, insomnia and fatigue on the first day. He then becomes confused and ataxic. What is the SINGLE most appropriate management?', 'Acute mountain sickness (headache, nausea, fatigue) can progress to high altitude cerebral oedema (confusion, ataxia) or high altitude pulmonary oedema (breathlessness, cough). Treatment of HACE and HAPE is urgent descent, oxygen, and dexamethasone (HACE) or nifedipine (HAPE). Prevention is gradual ascent, with acetazolamide prophylaxis.', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v3')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = '2855abb6-6b60-561a-aacf-13b1abca62b8';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('c949c9b0-2335-53d2-9b58-e772890754b8', '2855abb6-6b60-561a-aacf-13b1abca62b8', 'A', 'Paracetamol and sleep', false, 0),
  ('05ba0706-777a-5664-834b-82936bf5744b', '2855abb6-6b60-561a-aacf-13b1abca62b8', 'B', 'Acetazolamide only and keep climbing', false, 1),
  ('e96bc7c5-16a3-5f25-9cc2-ecf3f5e710c8', '2855abb6-6b60-561a-aacf-13b1abca62b8', 'C', 'Continue ascending slowly', false, 2),
  ('0d91313c-e785-54e6-9f3b-84f471b8fcf1', '2855abb6-6b60-561a-aacf-13b1abca62b8', 'D', 'Immediate descent and oxygen, with dexamethasone (high altitude cerebral oedema)', true, 3),
  ('28f4d000-b386-5736-a70b-c12ca0a85010', '2855abb6-6b60-561a-aacf-13b1abca62b8', 'E', 'Rapid ascent to acclimatise', false, 4);

-- Q691
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('3ca7370c-aa69-59e0-b047-1c6020350eda', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000002', 'sba', 'A 64 year old man is diagnosed with non-small cell lung cancer (adenocarcinoma) with metastases. His tumour has no actionable mutation, but PD-L1 expression is 80%. What is the SINGLE most likely first-line treatment?', 'Advanced NSCLC is tested for actionable mutations (EGFR, ALK, ROS1, BRAF, KRAS G12C) and PD-L1. Targeted drugs are used for driver mutations (such as osimertinib for EGFR). Without a driver mutation, high PD-L1 (50% or more) supports first-line pembrolizumab monotherapy, otherwise chemo-immunotherapy.', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v3')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = '3ca7370c-aa69-59e0-b047-1c6020350eda';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('0cccb913-652e-5910-9c78-5657ac6e3ca0', '3ca7370c-aa69-59e0-b047-1c6020350eda', 'A', 'Observation', false, 0),
  ('6ea95039-683c-5df6-9fe6-ca4bdea0b1a9', '3ca7370c-aa69-59e0-b047-1c6020350eda', 'B', 'Immune checkpoint inhibitor (e.g. pembrolizumab)', true, 1),
  ('7b347c18-a205-53fc-81c7-c93406e986b1', '3ca7370c-aa69-59e0-b047-1c6020350eda', 'C', 'EGFR tyrosine kinase inhibitor', false, 2),
  ('cedb142e-fac5-5f4a-9328-017f83edb1ee', '3ca7370c-aa69-59e0-b047-1c6020350eda', 'D', 'Surgery', false, 3),
  ('c55c1900-17e8-5510-a1ae-488721d1016b', '3ca7370c-aa69-59e0-b047-1c6020350eda', 'E', 'Radiotherapy only', false, 4);

-- Q692
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('286a5f92-9c8b-514b-a051-f5779ef78529', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000002', 'sba', 'A 58 year old man has a 3 cm peripheral lung cancer on CT with no lymph node enlargement. What test is MOST important before deciding on surgery?', 'NICE NG122: offer PET-CT to people with potentially curable lung cancer to stage the mediastinum and detect distant metastases. Sample suspicious nodes (EBUS-TBNA). Assess fitness with lung function (FEV1, TLCO) and cardiovascular risk. Early-stage NSCLC is treated with lobectomy or SABR (stereotactic radiotherapy) if unfit for surgery.', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v3')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = '286a5f92-9c8b-514b-a051-f5779ef78529';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('5595eae4-cec3-5534-8733-f51957d6f4a2', '286a5f92-9c8b-514b-a051-f5779ef78529', 'A', 'Bronchoscopy only', false, 0),
  ('72fa58f7-9b9e-5a15-93fb-e6e13775e250', '286a5f92-9c8b-514b-a051-f5779ef78529', 'B', 'Repeat CT in 6 months', false, 1),
  ('6e023cd9-2006-56d5-a031-5dd046f1b8c6', '286a5f92-9c8b-514b-a051-f5779ef78529', 'C', 'PET-CT (and EBUS sampling of nodes if indicated), plus lung function tests', true, 2),
  ('dfe15219-7997-5685-aadd-3d8724122ea8', '286a5f92-9c8b-514b-a051-f5779ef78529', 'D', 'Sputum cytology only', false, 3),
  ('d9303326-cbca-5d3a-9879-23fcd827f38b', '286a5f92-9c8b-514b-a051-f5779ef78529', 'E', 'Bone scan in all', false, 4);

-- Q693
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('c586fa8b-3055-5a23-9c66-56786bd637a6', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000023', 'sba', 'A 24 year old woman had anaphylaxis to a wasp sting. She responded to one dose of IM adrenaline and now feels well. What is the SINGLE most appropriate management?', 'Resuscitation Council UK: after anaphylaxis responding to one dose of adrenaline, observe for at least 2 hours (6 hours or more, or admission, if more than one dose, severe reaction or other risk factors) because of biphasic reactions. Provide two adrenaline auto-injectors with training, an allergy action plan, and refer to a specialist allergy service (venom immunotherapy may be offered). Take mast cell tryptase.', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v3')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = 'c586fa8b-3055-5a23-9c66-56786bd637a6';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('518771eb-a8ad-574f-bcbe-834346f4d283', 'c586fa8b-3055-5a23-9c66-56786bd637a6', 'A', 'Observe for at least 2-6 hours depending on risk (longer if severe), give two adrenaline auto-injectors with training, and refer to an allergy clinic', true, 0),
  ('1c0b80f8-b05c-5b42-bf45-641ed6339d18', 'c586fa8b-3055-5a23-9c66-56786bd637a6', 'B', 'Discharge immediately with no follow-up', false, 1),
  ('21a49331-cfb3-59bf-b1ee-204cf595b399', 'c586fa8b-3055-5a23-9c66-56786bd637a6', 'C', 'Give oral steroids for 2 weeks only', false, 2),
  ('f5952cd4-50c1-52ff-a55b-59784703cee0', 'c586fa8b-3055-5a23-9c66-56786bd637a6', 'D', 'Admit for 72 hours in all cases', false, 3),
  ('663903df-49f9-56c8-8291-0dd97766235e', 'c586fa8b-3055-5a23-9c66-56786bd637a6', 'E', 'No further action needed', false, 4);

-- Q694
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('3505e217-a0d5-5b39-a5b7-635d012576c5', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000023', 'sba', 'A 30 year old chemical worker has a splash of hydrofluoric acid on his hand. He has severe pain but little visible burn. What is the SINGLE most important specific treatment?', 'Hydrofluoric acid penetrates deeply and binds calcium and magnesium, causing severe pain out of proportion to the visible burn, tissue destruction and potentially fatal hypocalcaemia and arrhythmias. After irrigation, apply calcium gluconate gel. Local or intra-arterial injection may be needed. Monitor calcium, magnesium and ECG.', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v3')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = '3505e217-a0d5-5b39-a5b7-635d012576c5';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('836a9720-1c71-58ea-9983-616172cb769c', '3505e217-a0d5-5b39-a5b7-635d012576c5', 'A', 'Ice only', false, 0),
  ('7ad6ba39-f387-50e0-a36a-88452934877a', '3505e217-a0d5-5b39-a5b7-635d012576c5', 'B', 'Neutralise with an alkali', false, 1),
  ('e266e5fb-be4a-54e3-a2c9-49907172e19d', '3505e217-a0d5-5b39-a5b7-635d012576c5', 'C', 'Oil-based cream', false, 2),
  ('8a7fac8f-c3fb-5b4d-9314-3e27c8bcb412', '3505e217-a0d5-5b39-a5b7-635d012576c5', 'D', 'Wait and observe', false, 3),
  ('a98e3e1b-c2f6-5f3a-82db-5fd1ac72f9a4', '3505e217-a0d5-5b39-a5b7-635d012576c5', 'E', 'Copious irrigation then topical calcium gluconate gel (with cardiac monitoring and calcium checks)', true, 4);

-- Q695
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('d75e89ff-30f7-58c0-954e-6fa55a997494', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000023', 'sba', 'A 45 year old woman with type 1 diabetes is found unconscious at home by her partner. Her capillary glucose is 1.4 mmol/L. There is no IV access. What is the SINGLE most appropriate immediate treatment?', 'Severe hypoglycaemia with reduced consciousness: give IV glucose (10% 150-200 mL, or 20%) if IV access is available, or IM glucagon 1 mg. Glucagon is less effective in prolonged starvation, alcohol excess and liver disease. Once awake, give long-acting carbohydrate. Do not put anything in the mouth of an unconscious patient. Investigate the cause.', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v3')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = 'd75e89ff-30f7-58c0-954e-6fa55a997494';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('20e2c4aa-506d-5815-8891-c6bd0512f4ff', 'd75e89ff-30f7-58c0-954e-6fa55a997494', 'A', 'Oral glucose gel in her mouth while unconscious', false, 0),
  ('1ad3a4f3-3efa-5efc-86f4-63e696de6b8e', 'd75e89ff-30f7-58c0-954e-6fa55a997494', 'B', 'IM adrenaline', false, 1),
  ('55bad0b9-83b8-57b2-a100-4c75eb0074fe', 'd75e89ff-30f7-58c0-954e-6fa55a997494', 'C', 'Subcutaneous insulin', false, 2),
  ('264ce3de-128b-5b37-a86c-3607ba30a32b', 'd75e89ff-30f7-58c0-954e-6fa55a997494', 'D', 'Wait for paramedics', false, 3),
  ('4c803f1e-5d2a-52ea-904a-8e984aae1c7c', 'd75e89ff-30f7-58c0-954e-6fa55a997494', 'E', 'IM glucagon 1 mg (then oral carbohydrate once awake)', true, 4);

-- Q696
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('c2767d7d-a3b8-5494-b7d4-cfc259cb1085', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000023', 'sba', 'A 26 year old man was found in water after a near-drowning. He is now breathing, but drowsy with SpO2 90% on high-flow oxygen and crackles in both lungs. What is the SINGLE most appropriate management?', 'After drowning, hypoxia from aspiration and surfactant washout is the main problem, and lung injury (ARDS) may develop over hours. Symptomatic patients need admission and oxygen, with CPAP or intubation as required. Check temperature (hypothermia) and look for head or C-spine injury if diving. Antibiotics are not routinely given.', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v3')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = 'c2767d7d-a3b8-5494-b7d4-cfc259cb1085';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('207796b5-8761-5c28-974e-ede69bad5fc5', 'c2767d7d-a3b8-5494-b7d4-cfc259cb1085', 'A', 'Admit with oxygen, consider CPAP or ventilation, and monitor closely for deterioration (risk of ARDS)', true, 0),
  ('67a50b19-4c8a-538f-81d9-4bc9d5f01eec', 'c2767d7d-a3b8-5494-b7d4-cfc259cb1085', 'B', 'Give prophylactic antibiotics routinely', false, 1),
  ('ea945d47-92de-53ba-9b54-e3e7f1f69acd', 'c2767d7d-a3b8-5494-b7d4-cfc259cb1085', 'C', 'Heimlich manoeuvre to remove water', false, 2),
  ('21309665-c43b-51d2-a27f-e5034abb00f1', 'c2767d7d-a3b8-5494-b7d4-cfc259cb1085', 'D', 'Give furosemide to clear lung water', false, 3),
  ('c3ba2420-f5a6-5783-9a06-069332bc0b52', 'c2767d7d-a3b8-5494-b7d4-cfc259cb1085', 'E', 'Discharge if SpO2 improves within 1 hour', false, 4);

-- Q697
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('3aa1caac-e891-5daf-9773-ce09b6631155', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000023', 'sba', 'A 25 year old man cut his finger on glass. He has a 2 cm clean, straight laceration on the dorsum of his finger, with intact tendon function and sensation. What is the BEST way to close it?', 'Simple, clean, low-tension lacerations can be closed with adhesive strips, tissue glue or sutures after irrigation and exploration. Always check tendon function, neurovascular status and for foreign bodies (X-ray for glass). Check tetanus immunisation. Refer tendon, nerve or complex hand injuries to hand surgery.', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v3')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = '3aa1caac-e891-5daf-9773-ce09b6631155';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('3ee3ef84-f4aa-58cd-a91c-5c40912b0e5d', '3aa1caac-e891-5daf-9773-ce09b6631155', 'A', 'Leave open to heal by secondary intention in all cases', false, 0),
  ('90c10b55-7a8e-5807-9068-67bb2cb118c9', '3aa1caac-e891-5daf-9773-ce09b6631155', 'B', 'Clean, irrigate and close with adhesive strips or tissue glue (or simple sutures)', true, 1),
  ('9aa0dbf8-e83c-5970-9974-03485906ceda', '3aa1caac-e891-5daf-9773-ce09b6631155', 'C', 'Antibiotics only', false, 2),
  ('a0b951ee-38f1-5f93-be9b-14e167fa195a', '3aa1caac-e891-5daf-9773-ce09b6631155', 'D', 'Refer to plastic surgery', false, 3),
  ('6e2e606a-b084-5227-85d3-a832baa7f52c', '3aa1caac-e891-5daf-9773-ce09b6631155', 'E', 'Primary closure with staples', false, 4);

-- Q698
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('bcc350d6-3a10-552b-8c5c-e183e9fd2133', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000023', 'sba', 'A 6 year old child swallowed 10 of her mother''s iron tablets 1 hour ago. She has vomiting and abdominal pain. What is the SINGLE most important consideration?', 'Iron poisoning causes GI symptoms (vomiting, diarrhoea, haematemesis), then a latent phase, then shock, metabolic acidosis and liver failure. Over 20 mg/kg of elemental iron is potentially toxic, and over 60 mg/kg is serious. Check serum iron at 4 hours. Activated charcoal does not bind iron. Desferrioxamine is the antidote for severe toxicity. Abdominal X-ray may show tablets.', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v3')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = 'bcc350d6-3a10-552b-8c5c-e183e9fd2133';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('5b7ace53-b034-5776-a561-dc17b0dd18b3', 'bcc350d6-3a10-552b-8c5c-e183e9fd2133', 'A', 'Reassure as iron is harmless', false, 0),
  ('52b1b3d3-ef09-5724-9433-e5462410c63d', 'bcc350d6-3a10-552b-8c5c-e183e9fd2133', 'B', 'Activated charcoal binds iron well', false, 1),
  ('7f852636-6683-585e-a702-3ac0dc434992', 'bcc350d6-3a10-552b-8c5c-e183e9fd2133', 'C', 'Induce vomiting', false, 2),
  ('caf25e4a-1030-558b-9b33-f351f1c5a2ae', 'bcc350d6-3a10-552b-8c5c-e183e9fd2133', 'D', 'Calculate elemental iron dose per kg; check serum iron at 4 hours and give IV desferrioxamine if severe toxicity', true, 3),
  ('5a55fe8a-8d0e-5e1b-be5e-570ec61cc976', 'bcc350d6-3a10-552b-8c5c-e183e9fd2133', 'E', 'Give oral calcium', false, 4);

-- Q699
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('667f45bc-93d9-5c14-a4dd-c7f75ad83b3f', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000023', 'sba', 'A 30 year old woman who is 28 weeks pregnant was rescued from a house with a faulty boiler. She has headache and nausea. Her carboxyhaemoglobin is 18%. What is the SINGLE most appropriate treatment?', 'Carbon monoxide binds haemoglobin with much higher affinity than oxygen, shifting the dissociation curve left. Fetal haemoglobin binds CO even more strongly, so the fetus is at higher risk. SpO2 readings are falsely normal. Give high-flow 100% oxygen. Hyperbaric oxygen is considered in severe cases (loss of consciousness, neurological signs, cardiac ischaemia, pregnancy with high COHb).', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v3')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = '667f45bc-93d9-5c14-a4dd-c7f75ad83b3f';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('be0c112d-dfb2-5e9e-a5a3-5cab8a937b6a', '667f45bc-93d9-5c14-a4dd-c7f75ad83b3f', 'A', '100% oxygen via non-rebreather mask, with discussion with a hyperbaric unit (lower threshold in pregnancy)', true, 0),
  ('97fae05b-eee6-5092-b3ed-99bb26f2a918', '667f45bc-93d9-5c14-a4dd-c7f75ad83b3f', 'B', 'Blood transfusion', false, 1),
  ('44137f97-d069-52aa-b11e-672a4ede0a10', '667f45bc-93d9-5c14-a4dd-c7f75ad83b3f', 'C', 'Hydroxocobalamin', false, 2),
  ('f5888d67-c632-5b1b-9946-bda30d03e61f', '667f45bc-93d9-5c14-a4dd-c7f75ad83b3f', 'D', 'Room air and discharge', false, 3),
  ('7a4d67ac-b333-55f9-97a4-2e135779d646', '667f45bc-93d9-5c14-a4dd-c7f75ad83b3f', 'E', 'IV naloxone', false, 4);

-- Q700
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('32f122d9-1f3c-5882-9d7b-256285a3e8d0', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000023', 'sba', 'A 35 year old woman took 30 paracetamol tablets 6 hours ago with a large amount of alcohol. Her 4-hour level was on the treatment line. She drinks regularly. What is the SINGLE most appropriate management?', 'Since 2012, the MHRA uses a single treatment line (100 mg/L at 4 hours) for all patients, regardless of risk factors such as alcohol or enzyme-inducing drugs. Treat if the level is on or above the line. Acetylcysteine is most effective within 8 hours. Anaphylactoid reactions are managed by stopping briefly and giving antihistamines, then restarting.', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v3')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = '32f122d9-1f3c-5882-9d7b-256285a3e8d0';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('e7dba773-71d2-548c-89b6-1e3da03ce578', '32f122d9-1f3c-5882-9d7b-256285a3e8d0', 'A', 'Wait for LFTs before starting', false, 0),
  ('a7aacbad-6eb5-5336-ac1b-212f2053d3d6', '32f122d9-1f3c-5882-9d7b-256285a3e8d0', 'B', 'Start IV acetylcysteine (a single treatment line is used for all patients)', true, 1),
  ('52064541-05bf-5fa9-b318-872cb27ad5d4', '32f122d9-1f3c-5882-9d7b-256285a3e8d0', 'C', 'Give oral methionine only', false, 2),
  ('7e117d90-e074-5b83-b056-46dbaaeac14b', '32f122d9-1f3c-5882-9d7b-256285a3e8d0', 'D', 'Treat only if she has symptoms', false, 3),
  ('11343f3c-0118-5c9b-a1fa-ee26634ac660', '32f122d9-1f3c-5882-9d7b-256285a3e8d0', 'E', 'No treatment as the level is not above the line', false, 4);

-- Q701
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('47361165-4594-5725-9d48-f7f6d762cdbf', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000023', 'sba', 'A 22 year old man was punched and has a painful crushed fingertip with blood under the nail (subungual haematoma) covering 60% of the nail. The nail is intact. What is the SINGLE most appropriate management?', 'Painful subungual haematomas are drained by trephination (heated paperclip or needle). If the nail and nail fold are intact, removing the nail to repair the nail bed is no longer routinely needed, even with large haematomas. X-ray to look for tuft fracture (an open fracture if there is a nail bed laceration).', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v3')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = '47361165-4594-5725-9d48-f7f6d762cdbf';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('a141f025-3c33-56be-bd51-d637d3b19dfb', '47361165-4594-5725-9d48-f7f6d762cdbf', 'A', 'Trephination (draining the haematoma through the nail) to relieve pain; X-ray if a fracture is suspected', true, 0),
  ('80e4913c-522e-5c74-a4a3-ab0d6bc36052', '47361165-4594-5725-9d48-f7f6d762cdbf', 'B', 'Antibiotics only', false, 1),
  ('d3ad2db2-2360-5ded-b2b8-e23123f38f13', '47361165-4594-5725-9d48-f7f6d762cdbf', 'C', 'Surgical repair under general anaesthetic', false, 2),
  ('1226ed79-57d7-5f6e-a8ce-ff1fa7ea0e9e', '47361165-4594-5725-9d48-f7f6d762cdbf', 'D', 'Remove the whole nail in all cases', false, 3),
  ('b394c620-a86d-5141-9c56-ca987141e654', '47361165-4594-5725-9d48-f7f6d762cdbf', 'E', 'Leave it to resolve', false, 4);

-- Q702
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('512cff3e-8c34-5b85-a7d8-9e00a50c7f6a', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000005', 'sba', 'A 70 year old man has AKI with a creatinine of 280 µmol/L. Urine sodium is 8 mmol/L and fractional excretion of sodium is below 1%. Urine is concentrated. What does this suggest?', 'In pre-renal AKI, the kidney conserves sodium and water (urine sodium below 20 mmol/L, FENa below 1%, high urine osmolality). In acute tubular necrosis, the tubules cannot reabsorb sodium (urine sodium above 40, FENa above 2%) and urine is dilute, with muddy brown casts. Diuretics invalidate FENa. Treat pre-renal AKI with fluids and by stopping nephrotoxins.', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v3')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = '512cff3e-8c34-5b85-a7d8-9e00a50c7f6a';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('f97429a0-68d9-5f25-82ae-190025d1438f', '512cff3e-8c34-5b85-a7d8-9e00a50c7f6a', 'A', 'Acute interstitial nephritis', false, 0),
  ('1da07968-953a-5ea4-8141-20f841148de2', '512cff3e-8c34-5b85-a7d8-9e00a50c7f6a', 'B', 'Pre-renal AKI (reduced kidney perfusion with intact tubular function)', true, 1),
  ('2e159287-42cf-5948-8086-3cf9bcc3f946', '512cff3e-8c34-5b85-a7d8-9e00a50c7f6a', 'C', 'Post-renal obstruction', false, 2),
  ('e1a091d4-e17d-5174-8a57-df0ab12c1cc4', '512cff3e-8c34-5b85-a7d8-9e00a50c7f6a', 'D', 'Glomerulonephritis', false, 3),
  ('510107c0-957f-586f-babf-9418f79fe9b4', '512cff3e-8c34-5b85-a7d8-9e00a50c7f6a', 'E', 'Acute tubular necrosis', false, 4);

-- Q703
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('75b22200-42bc-54b9-8ded-96abd6b4ba20', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000005', 'sba', 'A 75 year old man had a TURP. Two hours later he is confused, nauseous and has bradycardia and hypertension. His sodium is 118 mmol/L. What is the SINGLE most likely cause?', 'TURP syndrome happens when large volumes of hypotonic irrigation fluid (glycine) are absorbed during monopolar TURP. It causes dilutional hyponatraemia, fluid overload, visual disturbance (glycine) and confusion or seizures. Bipolar TURP with saline irrigation reduces the risk. Management is fluid restriction and diuretics, with hypertonic saline if severe.', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v3')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = '75b22200-42bc-54b9-8ded-96abd6b4ba20';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('7bbf89c2-b10e-5d9f-b23e-eba87c388942', '75b22200-42bc-54b9-8ded-96abd6b4ba20', 'A', 'Myocardial infarction', false, 0),
  ('f89c90f9-e80a-5a4d-820e-e8309befd18e', '75b22200-42bc-54b9-8ded-96abd6b4ba20', 'B', 'Septicaemia', false, 1),
  ('9b1f5101-79cd-5438-8911-e12f45644585', '75b22200-42bc-54b9-8ded-96abd6b4ba20', 'C', 'Haemorrhage', false, 2),
  ('e307780f-d68f-5662-a7fc-d15b466362fa', '75b22200-42bc-54b9-8ded-96abd6b4ba20', 'D', 'TURP syndrome (absorption of hypotonic irrigation fluid such as glycine)', true, 3),
  ('6a356d52-d8c6-52f8-bedf-e2d33e9300e7', '75b22200-42bc-54b9-8ded-96abd6b4ba20', 'E', 'Post-operative delirium only', false, 4);

-- Q704
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('86460a33-bf4c-56f9-9633-af52fb2aedc8', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000005', 'sba', 'A 68 year old man had a TURP 2 months ago. He now has a normal urine flow but notices no ejaculate at orgasm, with cloudy urine afterwards. What is the SINGLE most likely explanation?', 'Retrograde ejaculation (semen enters the bladder because the bladder neck is damaged) occurs in most men after TURP and also with alpha-blockers (especially tamsulosin). It is harmless but affects fertility. Patients should be counselled before surgery. Other TURP complications include bleeding, infection, incontinence, strictures and TURP syndrome.', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v3')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = '86460a33-bf4c-56f9-9633-af52fb2aedc8';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('143b2f97-0173-5f29-8952-e8c119580730', '86460a33-bf4c-56f9-9633-af52fb2aedc8', 'A', 'Recurrent prostate obstruction', false, 0),
  ('dc2595e6-8114-5d8f-904f-178070b411f4', '86460a33-bf4c-56f9-9633-af52fb2aedc8', 'B', 'Retrograde ejaculation (a common, expected effect of TURP)', true, 1),
  ('07327968-7498-587e-967b-60cbbe3ea118', '86460a33-bf4c-56f9-9633-af52fb2aedc8', 'C', 'Urethral stricture', false, 2),
  ('71c64647-95d2-5e2d-8d5c-1bf0f15edecb', '86460a33-bf4c-56f9-9633-af52fb2aedc8', 'D', 'Erectile dysfunction', false, 3),
  ('5ce61047-9557-56d9-b4bb-82af27388637', '86460a33-bf4c-56f9-9633-af52fb2aedc8', 'E', 'Infection', false, 4);

-- Q705
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('f9511ee0-1d13-5357-924b-c43579aff655', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000005', 'sba', 'A 32 year old woman who is 30 weeks pregnant has right loin pain. Ultrasound shows mild right hydronephrosis with no stones. Her urine is clear and she is afebrile. What is the SINGLE most likely explanation?', 'Physiological dilatation of the collecting system is common in pregnancy, mostly on the right, due to progesterone and compression of the ureter by the uterus. It increases the risk of pyelonephritis. Symptomatic stones in pregnancy are investigated with ultrasound (MRI if needed) rather than CT, and managed conservatively, with stenting or nephrostomy if obstructed and infected.', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v3')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = 'f9511ee0-1d13-5357-924b-c43579aff655';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('f05d5a93-b139-501d-bce8-dd39fdb39b90', 'f9511ee0-1d13-5357-924b-c43579aff655', 'A', 'Pyelonephritis', false, 0),
  ('29699c0f-07fa-54f1-80f0-518e787b93a8', 'f9511ee0-1d13-5357-924b-c43579aff655', 'B', 'Ureteric stone', false, 1),
  ('fe1dd636-db77-5bc6-a6e8-9e6bdc347e14', 'f9511ee0-1d13-5357-924b-c43579aff655', 'C', 'Renal cancer', false, 2),
  ('695f0345-1ba9-5d02-a02b-bedb00458db6', 'f9511ee0-1d13-5357-924b-c43579aff655', 'D', 'Physiological hydronephrosis of pregnancy (more common on the right)', true, 3),
  ('cf0afbba-29f4-5f48-ae15-5fdbe8a5b3de', 'f9511ee0-1d13-5357-924b-c43579aff655', 'E', 'Pelviureteric junction obstruction', false, 4);

-- Q706
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('6b0e9338-6fdf-56b5-ba01-357591b2e6bb', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000005', 'sba', 'A 55 year old woman has stress urinary incontinence that persists despite 3 months of supervised pelvic floor muscle training. She wants surgery. What is the SINGLE most appropriate option to discuss?', 'NICE NG123: for stress incontinence not responding to conservative management, surgical options include colposuspension, autologous rectus fascial sling and urethral bulking agents. Synthetic midurethral mesh tapes are restricted in England following safety concerns (high vigilance restrictions). Duloxetine is an option for women who decline surgery. Antimuscarinics are for urge incontinence.', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v3')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = '6b0e9338-6fdf-56b5-ba01-357591b2e6bb';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('a633731a-e3f9-5791-96db-b98f19f173bc', '6b0e9338-6fdf-56b5-ba01-357591b2e6bb', 'A', 'Surgical options such as colposuspension, autologous fascial sling or bulking agents (with the mesh pause in mind)', true, 0),
  ('1cda7b24-b37b-5809-8ea3-619957db81fc', '6b0e9338-6fdf-56b5-ba01-357591b2e6bb', 'B', 'Botulinum toxin to the bladder', false, 1),
  ('eeeb2c90-1e4a-5bf9-848f-b04c2cfe9462', '6b0e9338-6fdf-56b5-ba01-357591b2e6bb', 'C', 'Mirabegron', false, 2),
  ('8a8e3166-c938-5138-b02d-1141c0c2f9cd', '6b0e9338-6fdf-56b5-ba01-357591b2e6bb', 'D', 'Oxybutynin', false, 3),
  ('f02dfc2f-ac02-519d-b9de-bc007414e0cc', '6b0e9338-6fdf-56b5-ba01-357591b2e6bb', 'E', 'Indwelling catheter', false, 4);

-- Q707
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('7afbd086-e567-54a7-b391-d50a6d67a966', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000005', 'sba', 'A 60 year old woman has urge incontinence that has not responded to bladder training, an antimuscarinic and mirabegron. Urodynamics confirm detrusor overactivity. What is the SINGLE most appropriate next treatment?', 'NICE: for overactive bladder unresponsive to drug treatment, offer bladder botulinum toxin A injections (after urodynamics), as long as the patient is able and willing to do clean intermittent self-catheterisation, which may be needed. Other options are percutaneous sacral nerve stimulation and posterior tibial nerve stimulation. Augmentation cystoplasty is a last resort.', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v3')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = '7afbd086-e567-54a7-b391-d50a6d67a966';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('e8047be4-7994-5654-bc24-1150ddf36d48', '7afbd086-e567-54a7-b391-d50a6d67a966', 'A', 'Long-term antibiotics', false, 0),
  ('8d8238b7-3319-55f4-a0a0-5327674f7cd2', '7afbd086-e567-54a7-b391-d50a6d67a966', 'B', 'Midurethral sling', false, 1),
  ('137debf3-442b-5171-a2bf-e4745aa9d925', '7afbd086-e567-54a7-b391-d50a6d67a966', 'C', 'Intravesical botulinum toxin A injection (with willingness to self-catheterise)', true, 2),
  ('03407e45-ca9e-5ebf-a7a1-0b3046722ed9', '7afbd086-e567-54a7-b391-d50a6d67a966', 'D', 'Colposuspension', false, 3),
  ('0f019920-551c-5d63-8617-b4fb31385a20', '7afbd086-e567-54a7-b391-d50a6d67a966', 'E', 'Cystectomy as first-line', false, 4);

-- Q708
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('99f1a357-7f87-59b8-bb60-8b5c8009b2c1', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000005', 'sba', 'A 66 year old man has non-muscle-invasive high-grade bladder cancer after TURBT. What adjuvant treatment is MOST commonly used to reduce recurrence and progression?', 'Non-muscle-invasive bladder cancer (Ta, T1, CIS) is treated by transurethral resection of bladder tumour (TURBT). High-risk disease is treated with intravesical BCG (induction and maintenance) to reduce recurrence and progression. Low-risk disease gets a single post-op dose of intravesical chemotherapy (mitomycin). Muscle-invasive disease needs radical cystectomy or radiotherapy with neoadjuvant chemotherapy.', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v3')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = '99f1a357-7f87-59b8-bb60-8b5c8009b2c1';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('e60d7ddc-2e09-5ed0-87c3-89a2d4c7ac68', '99f1a357-7f87-59b8-bb60-8b5c8009b2c1', 'A', 'Intravesical BCG immunotherapy', true, 0),
  ('88c815cf-618b-58e6-93e1-6477bde2af57', '99f1a357-7f87-59b8-bb60-8b5c8009b2c1', 'B', 'Oral BCG vaccine', false, 1),
  ('690a1f8f-121d-5a92-9c62-9bba2c13c864', '99f1a357-7f87-59b8-bb60-8b5c8009b2c1', 'C', 'External beam radiotherapy', false, 2),
  ('c3492111-b976-55bc-818f-065dd835852f', '99f1a357-7f87-59b8-bb60-8b5c8009b2c1', 'D', 'Radical cystectomy in all', false, 3),
  ('fd8f0288-af40-519c-a04a-5f97e2f47c36', '99f1a357-7f87-59b8-bb60-8b5c8009b2c1', 'E', 'Systemic cisplatin chemotherapy', false, 4);

-- Q709
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('1fb09e22-ab1a-59d1-bc60-0f3d25f24965', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000005', 'sba', 'A 25 year old woman with SLE has new proteinuria of 1.5 g/day, microscopic haematuria with red cell casts, and rising creatinine. What is the SINGLE most appropriate investigation to guide treatment?', 'Lupus nephritis affects up to half of people with SLE. Renal biopsy classifies it (ISN/RPS class I-VI) and guides treatment. Class III and IV (proliferative) need induction immunosuppression (mycophenolate or cyclophosphamide with steroids, plus newer agents such as belimumab or voclosporin), then maintenance. ACE inhibitors are used for proteinuria and hydroxychloroquine for all.', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v3')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = '1fb09e22-ab1a-59d1-bc60-0f3d25f24965';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('8a8d2ab2-25a1-530e-b8ac-c90de58b7711', '1fb09e22-ab1a-59d1-bc60-0f3d25f24965', 'A', 'CT KUB', false, 0),
  ('bd33b183-dc41-553e-a646-21064ebb7168', '1fb09e22-ab1a-59d1-bc60-0f3d25f24965', 'B', 'Repeat urine dip in 3 months', false, 1),
  ('edeca377-9b92-5c70-b3ff-684402bb16ee', '1fb09e22-ab1a-59d1-bc60-0f3d25f24965', 'C', 'Urine culture', false, 2),
  ('221e8bdd-784b-500a-b169-d5a00ada49c2', '1fb09e22-ab1a-59d1-bc60-0f3d25f24965', 'D', 'Renal biopsy', true, 3),
  ('07339f6e-d2fa-5683-87b9-91f6ec03301c', '1fb09e22-ab1a-59d1-bc60-0f3d25f24965', 'E', 'Renal ultrasound only', false, 4);

-- Q710
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('0c2e5901-7857-5faa-a110-d10244399a18', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000005', 'sba', 'A 65 year old man has AKI. His calcium is 3.1 mmol/L, he has anaemia, back pain and a raised total protein. Urine shows Bence Jones protein. What is the SINGLE most likely cause of his AKI?', 'Myeloma causes kidney injury mainly through cast nephropathy (free light chains forming obstructive casts in the tubules), plus hypercalcaemia, dehydration, amyloidosis and nephrotoxic drugs (NSAIDs, contrast). Measure serum free light chains and serum and urine electrophoresis. Treat with fluids, correct calcium, and start anti-myeloma treatment urgently.', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v3')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = '0c2e5901-7857-5faa-a110-d10244399a18';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('d7c3c08e-968d-58f6-a5bb-067aab48f309', '0c2e5901-7857-5faa-a110-d10244399a18', 'A', 'Myeloma cast nephropathy (light-chain cast nephropathy)', true, 0),
  ('79c0e018-bc3f-5fb8-b25b-366d8a25f43e', '0c2e5901-7857-5faa-a110-d10244399a18', 'B', 'IgA nephropathy', false, 1),
  ('a893209c-52d4-5e69-a487-56f2a564900c', '0c2e5901-7857-5faa-a110-d10244399a18', 'C', 'Renal artery stenosis', false, 2),
  ('1d7fa73d-b936-5f73-b915-1fc1459efc39', '0c2e5901-7857-5faa-a110-d10244399a18', 'D', 'Diabetic nephropathy', false, 3),
  ('3d20584d-f146-5ebd-8faa-c5d35d41419d', '0c2e5901-7857-5faa-a110-d10244399a18', 'E', 'Polycystic kidney disease', false, 4);

-- Q711
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('cce659cc-5c6d-5a09-8711-aad9618dda91', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000005', 'sba', 'A 45 year old woman has had a kidney transplant for 3 weeks. She has fever, graft tenderness and a rise in creatinine. Tacrolimus levels are therapeutic. What is the SINGLE most likely cause, and how is it confirmed?', 'Acute rejection is commonest in the first 6 months. It causes a rise in creatinine, with or without fever, graft tenderness and reduced urine output. Exclude obstruction (ultrasound), infection (including BK virus and CMV), drug toxicity and vascular problems. A biopsy confirms cellular or antibody-mediated rejection, treated with steroids or anti-thymocyte globulin and plasma exchange respectively.', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v3')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = 'cce659cc-5c6d-5a09-8711-aad9618dda91';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('56740b65-e873-5f23-b361-2991aec004bb', 'cce659cc-5c6d-5a09-8711-aad9618dda91', 'A', 'Tacrolimus toxicity', false, 0),
  ('cb23b2a3-1e40-5267-a94d-ee8082c58b28', 'cce659cc-5c6d-5a09-8711-aad9618dda91', 'B', 'Renal artery stenosis', false, 1),
  ('ef0a3a6b-86e0-5a96-b850-dfb084bee654', 'cce659cc-5c6d-5a09-8711-aad9618dda91', 'C', 'Urinary tract infection only', false, 2),
  ('d55b0c37-964b-5795-8e25-d59499f433d4', 'cce659cc-5c6d-5a09-8711-aad9618dda91', 'D', 'Acute rejection; confirmed by transplant biopsy', true, 3),
  ('bbafb860-44e4-5d8a-acd7-09d98822773a', 'cce659cc-5c6d-5a09-8711-aad9618dda91', 'E', 'Chronic allograft nephropathy', false, 4);

-- Q712
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('97edd919-90b0-5107-aaf7-ba37cc0ab295', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000005', 'sba', 'A 7 year old boy has had intermittent loin pain, nausea and vomiting after drinking large amounts of fluid. Ultrasound shows a dilated renal pelvis with normal ureter calibre. What is the SINGLE most likely diagnosis?', 'PUJ obstruction is the commonest cause of congenital hydronephrosis, and may be found antenatally or present later with intermittent loin pain triggered by large fluid intake (Dietl''s crisis), infection or stones. A MAG3 renogram assesses drainage and function. Treatment is pyeloplasty if function is impaired or symptoms are significant.', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v3')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = '97edd919-90b0-5107-aaf7-ba37cc0ab295';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('bc7c0ca5-8cc9-5537-be95-076b803a74ce', '97edd919-90b0-5107-aaf7-ba37cc0ab295', 'A', 'Pelviureteric junction (PUJ) obstruction', true, 0),
  ('e3f61b50-128c-539e-8d74-177ff3383495', '97edd919-90b0-5107-aaf7-ba37cc0ab295', 'B', 'Ureteric stone', false, 1),
  ('5b6b6460-51bb-5d86-985f-9066f6efb147', '97edd919-90b0-5107-aaf7-ba37cc0ab295', 'C', 'Posterior urethral valves', false, 2),
  ('c8dc6f94-aaac-539a-8724-ccb2dfe04b63', '97edd919-90b0-5107-aaf7-ba37cc0ab295', 'D', 'Wilms tumour', false, 3),
  ('4342d2c3-fc78-5c45-8d6c-9bebc32a9bb1', '97edd919-90b0-5107-aaf7-ba37cc0ab295', 'E', 'Vesicoureteric reflux', false, 4);

-- Q713
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('32fb1e76-6f10-5afd-bff7-f30632be3222', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000019', 'sba', 'A 24 year old woman has a fever, painful red lumps on her shins, ankle arthritis and bilateral hilar lymphadenopathy on chest X-ray. What is the SINGLE most likely diagnosis and prognosis?', 'Löfgren''s syndrome is an acute presentation of sarcoidosis with erythema nodosum, bilateral hilar lymphadenopathy, arthritis (often ankles) and fever. It has an excellent prognosis, with most resolving within 1-2 years. Treat with NSAIDs for symptoms. Steroids are rarely needed.', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v3')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = '32fb1e76-6f10-5afd-bff7-f30632be3222';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('5ba964db-4d67-5cfb-922a-17b0d8d4235f', '32fb1e76-6f10-5afd-bff7-f30632be3222', 'A', 'Rheumatoid arthritis', false, 0),
  ('14099e12-109c-50b1-b6a6-2e85677fa8f8', '32fb1e76-6f10-5afd-bff7-f30632be3222', 'B', 'Lymphoma', false, 1),
  ('d013c7c5-ccbd-53ce-ba98-7b99a1c6e0c3', '32fb1e76-6f10-5afd-bff7-f30632be3222', 'C', 'Reactive arthritis', false, 2),
  ('2738254c-01e5-57e9-b89b-d50c90fbdc76', '32fb1e76-6f10-5afd-bff7-f30632be3222', 'D', 'Löfgren''s syndrome (acute sarcoidosis), which usually resolves spontaneously', true, 3),
  ('648ce879-c472-58d9-9f1c-a78ba591f0f4', '32fb1e76-6f10-5afd-bff7-f30632be3222', 'E', 'Tuberculosis needing quadruple therapy', false, 4);

-- Q714
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('2397189c-4b91-5999-9271-52c81c1c43f3', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000019', 'sba', 'A 40 year old woman with rheumatoid arthritis on methotrexate develops a dry cough, breathlessness and fever. Chest X-ray shows bilateral interstitial infiltrates. What is the SINGLE most likely diagnosis?', 'Methotrexate pneumonitis is an uncommon, potentially serious hypersensitivity reaction, often in the first year of treatment. Stop methotrexate, exclude infection (including PCP), and give steroids. Baseline chest X-ray and lung function are taken before starting methotrexate. RA itself can cause interstitial lung disease.', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v3')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = '2397189c-4b91-5999-9271-52c81c1c43f3';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('08b3dea6-abde-5f3a-bacb-1959cfb1ef8b', '2397189c-4b91-5999-9271-52c81c1c43f3', 'A', 'Rheumatoid nodules', false, 0),
  ('087f9b21-5182-5cea-851d-35d9ae85dc9c', '2397189c-4b91-5999-9271-52c81c1c43f3', 'B', 'Pulmonary embolism', false, 1),
  ('0ededb06-680a-5d76-a5fd-a5dfcf9286f1', '2397189c-4b91-5999-9271-52c81c1c43f3', 'C', 'Pneumocystis pneumonia only', false, 2),
  ('90bb67ee-a4c7-5092-aee5-355c83285c8d', '2397189c-4b91-5999-9271-52c81c1c43f3', 'D', 'Bronchiectasis', false, 3),
  ('1c64b5a5-14ca-5345-9414-f54e3417e58f', '2397189c-4b91-5999-9271-52c81c1c43f3', 'E', 'Methotrexate pneumonitis', true, 4);

-- Q715
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('60bee19e-9524-524f-a487-e186d6e58acc', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000019', 'sba', 'A 50 year old man with RA is to start sulfasalazine. Which side effect should he be warned about?', 'Sulfasalazine side effects include GI upset, rash, headache, orange body fluids (stains contact lenses), reversible oligospermia, and bone marrow suppression and hepatotoxicity. Monitor FBC and LFTs. It is safe in pregnancy (with folic acid supplementation). Avoid in sulfonamide or salicylate allergy.', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v3')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = '60bee19e-9524-524f-a487-e186d6e58acc';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('973fb02e-8348-567d-98b0-71defa63e1a6', '60bee19e-9524-524f-a487-e186d6e58acc', 'A', 'Reversible oligospermia, orange discolouration of urine/tears, rash and blood dyscrasias (needs FBC and LFT monitoring)', true, 0),
  ('021e0c1f-b78c-5143-8558-f949453af9ef', '60bee19e-9524-524f-a487-e186d6e58acc', 'B', 'Pulmonary fibrosis is the main risk', false, 1),
  ('5e842266-9acf-55ed-b104-f71f2933c394', '60bee19e-9524-524f-a487-e186d6e58acc', 'C', 'Weight gain', false, 2),
  ('29ac04ad-28d0-5c22-a4e6-097d0e66664a', '60bee19e-9524-524f-a487-e186d6e58acc', 'D', 'Hearing loss', false, 3),
  ('cc2e8843-776f-5089-b878-0f22ccf8a168', '60bee19e-9524-524f-a487-e186d6e58acc', 'E', 'Retinopathy', false, 4);

-- Q716
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('e5dab6ac-1dc2-5047-91ee-d5edf3289131', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000019', 'sba', 'A 35 year old woman takes leflunomide for RA and wants to become pregnant. What is the CORRECT advice?', 'Leflunomide is teratogenic and has a very long half-life (its active metabolite can persist for up to 2 years). Women planning pregnancy should stop it and complete an accelerated washout with colestyramine or activated charcoal, with plasma levels checked. Contraception is needed during treatment. Men are also advised to use contraception.', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v3')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = 'e5dab6ac-1dc2-5047-91ee-d5edf3289131';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('a5fb5f37-2138-541d-93a9-af7a56245dbc', 'e5dab6ac-1dc2-5047-91ee-d5edf3289131', 'A', 'Stop it the day she conceives', false, 0),
  ('99cf70f6-8488-50af-beb1-8a69a0470b6d', 'e5dab6ac-1dc2-5047-91ee-d5edf3289131', 'B', 'Stop leflunomide and complete a washout procedure (e.g. colestyramine), confirming low drug levels before conception', true, 1),
  ('5642c06f-2009-5cc8-a219-c68e7e8a55cd', 'e5dab6ac-1dc2-5047-91ee-d5edf3289131', 'C', 'Leflunomide has no effect on pregnancy', false, 2),
  ('aca6a279-f033-5cae-983e-790e4a905da6', 'e5dab6ac-1dc2-5047-91ee-d5edf3289131', 'D', 'Switch to methotrexate', false, 3),
  ('7d1c3503-9d18-5619-a21f-2483331dfe1a', 'e5dab6ac-1dc2-5047-91ee-d5edf3289131', 'E', 'Continue leflunomide during pregnancy', false, 4);

-- Q717
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('c3ac9370-4a01-5355-bc7b-1e200d354966', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000019', 'sba', 'A 60 year old man on adalimumab for RA develops fever, weight loss and a cough for 4 weeks. What is the SINGLE most important infection to consider?', 'Anti-TNF drugs significantly increase the risk of TB reactivation (often extrapulmonary or disseminated), along with other serious infections (bacterial, fungal, viral). Screen for latent TB (IGRA, CXR) before starting. Stop the drug if serious infection develops. Avoid live vaccines during treatment.', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v3')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = 'c3ac9370-4a01-5355-bc7b-1e200d354966';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('25205db7-d472-57a7-b2ca-ba027588a02f', 'c3ac9370-4a01-5355-bc7b-1e200d354966', 'A', 'Measles', false, 0),
  ('8938d6dc-dba5-5f95-9fa3-1fd2af609d47', 'c3ac9370-4a01-5355-bc7b-1e200d354966', 'B', 'Helicobacter pylori', false, 1),
  ('d7e5a9cc-974a-5305-b1c1-7851540bf79f', 'c3ac9370-4a01-5355-bc7b-1e200d354966', 'C', 'Malaria', false, 2),
  ('9dd9ab61-79c6-558c-8ced-4810144650e6', 'c3ac9370-4a01-5355-bc7b-1e200d354966', 'D', 'Tuberculosis (reactivation of latent TB)', true, 3),
  ('5d5035aa-2f94-5b33-8403-fac81ac72e92', 'c3ac9370-4a01-5355-bc7b-1e200d354966', 'E', 'Lyme disease', false, 4);

-- Q718
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('36651389-14d2-5fab-b720-77c9c1f76911', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000019', 'sba', 'A 55 year old man has painful swelling and tenderness of the costochondral junctions on his left upper chest, reproduced by pressing on them. ECG and troponin are normal. What is the SINGLE most likely diagnosis?', 'Costochondritis is a benign inflammation of the costochondral junctions, causing chest wall pain reproduced by palpation. Tietze''s syndrome includes visible swelling. Exclude cardiac and other serious causes first. Treatment is reassurance, NSAIDs and rest.', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v3')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = '36651389-14d2-5fab-b720-77c9c1f76911';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('536ad070-6893-5f1c-af55-978af0c1f3cc', '36651389-14d2-5fab-b720-77c9c1f76911', 'A', 'Myocardial infarction', false, 0),
  ('184a0645-5317-58da-8834-5e2497fc16e9', '36651389-14d2-5fab-b720-77c9c1f76911', 'B', 'Pulmonary embolism', false, 1),
  ('a879163a-4033-5de0-ad37-a10981f65276', '36651389-14d2-5fab-b720-77c9c1f76911', 'C', 'Rib fracture', false, 2),
  ('3d24626d-54dd-52ff-9284-597d7d24e756', '36651389-14d2-5fab-b720-77c9c1f76911', 'D', 'Costochondritis (Tietze''s syndrome if there is swelling)', true, 3),
  ('f50fc0b9-6dda-5483-91a1-92e7ef0cabcc', '36651389-14d2-5fab-b720-77c9c1f76911', 'E', 'Pericarditis', false, 4);

-- Q719
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('95f0f519-4196-544c-9c5f-823871400eaa', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000019', 'sba', 'A 70 year old man has had progressive deformity and inflammation of both ears (sparing the earlobes), nasal bridge collapse and hoarseness. What is the SINGLE most likely diagnosis?', 'Relapsing polychondritis is an autoimmune inflammation of cartilage (ears sparing the lobule, nose giving saddle nose, larynx and trachea, joints and eyes). Airway involvement can be life-threatening. It is linked to myelodysplasia (VEXAS syndrome in older men). Treatment is steroids and immunosuppressants.', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v3')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = '95f0f519-4196-544c-9c5f-823871400eaa';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('f48bb7a2-7d1f-5f36-95d4-0075bc2d70a8', '95f0f519-4196-544c-9c5f-823871400eaa', 'A', 'Cellulitis', false, 0),
  ('2abe56e5-28bf-5d21-9533-1a676b9fde00', '95f0f519-4196-544c-9c5f-823871400eaa', 'B', 'Relapsing polychondritis', true, 1),
  ('9a9066da-6275-5997-a8b2-1889644b6864', '95f0f519-4196-544c-9c5f-823871400eaa', 'C', 'Sarcoidosis', false, 2),
  ('c9a0c274-d884-5bb7-9c53-da16295e2e85', '95f0f519-4196-544c-9c5f-823871400eaa', 'D', 'Granulomatosis with polyangiitis', false, 3),
  ('c8cff87a-b7a3-5b4b-9373-489fee6a009a', '95f0f519-4196-544c-9c5f-823871400eaa', 'E', 'Gout', false, 4);

-- Q720
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('6ffd1da2-07f8-51a3-b557-105f72e269e4', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000019', 'sba', 'A 68 year old man has a new hot, swollen knee. He is febrile with a WCC of 15. He has diabetes. What is the SINGLE most important first step?', 'Any acute hot swollen joint is septic arthritis until proven otherwise. Aspirate before antibiotics (unless delay would be harmful), send for Gram stain, culture and crystal microscopy, and take blood cultures. Start empirical IV antibiotics (such as flucloxacillin, or vancomycin if MRSA risk). Refer to orthopaedics for washout. Never inject steroid into a possibly infected joint.', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v3')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = '6ffd1da2-07f8-51a3-b557-105f72e269e4';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('d0f264ea-cd74-5ec7-ad55-7ad07dcbb77a', '6ffd1da2-07f8-51a3-b557-105f72e269e4', 'A', 'Intra-articular steroid injection', false, 0),
  ('1ce4d5b3-6ddd-5867-a2f2-1fd3a4855f5c', '6ffd1da2-07f8-51a3-b557-105f72e269e4', 'B', 'X-ray only', false, 1),
  ('10ff64fd-3e4c-50a2-aeaa-48aae4bfce00', '6ffd1da2-07f8-51a3-b557-105f72e269e4', 'C', 'Joint aspiration (synovial fluid Gram stain, culture and crystals) before antibiotics, then IV antibiotics', true, 2),
  ('746144e7-c224-508f-aaaf-e3daba30dca7', '6ffd1da2-07f8-51a3-b557-105f72e269e4', 'D', 'Start allopurinol', false, 3),
  ('2d6f38e4-e519-59ee-b3a8-1ca5380fd328', '6ffd1da2-07f8-51a3-b557-105f72e269e4', 'E', 'Oral NSAIDs and review in 1 week', false, 4);

-- Q721
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('90f35e81-f2e0-5b5c-baa7-de9a81adaca8', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000019', 'sba', 'A 55 year old man has finger clubbing, painful swollen wrists and ankles, and periosteal new bone formation on X-ray of the long bones. He is a heavy smoker. What is the SINGLE most likely diagnosis?', 'Hypertrophic (pulmonary) osteoarthropathy causes clubbing, painful symmetrical arthropathy and periostitis of long bones. It is strongly associated with non-small cell lung cancer, and also with pleural tumours, cystic fibrosis and cyanotic heart disease. Investigate for lung cancer. Symptoms improve with treatment of the cause.', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v3')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = '90f35e81-f2e0-5b5c-baa7-de9a81adaca8';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('997bcd84-6725-5ba9-8575-1e91155fcacf', '90f35e81-f2e0-5b5c-baa7-de9a81adaca8', 'A', 'Osteomyelitis', false, 0),
  ('817b166b-bb0a-5304-91e7-88f8e78b0015', '90f35e81-f2e0-5b5c-baa7-de9a81adaca8', 'B', 'Paget''s disease', false, 1),
  ('b449c0e9-e415-5f17-a821-9b8648d0bf68', '90f35e81-f2e0-5b5c-baa7-de9a81adaca8', 'C', 'Rheumatoid arthritis', false, 2),
  ('2f11c1b4-eba3-5b23-ba94-8872ba5704ea', '90f35e81-f2e0-5b5c-baa7-de9a81adaca8', 'D', 'Hypertrophic pulmonary osteoarthropathy (associated with lung cancer)', true, 3),
  ('545ca02a-72e0-5f8d-af06-b1d6bc8decd8', '90f35e81-f2e0-5b5c-baa7-de9a81adaca8', 'E', 'Gout', false, 4);

-- Q722
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('b0cb4660-4a79-5769-b6b2-7053f27e10b8', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000035', 'sba', 'A 50 year old man with a subarachnoid haemorrhage has hyponatraemia (sodium 126 mmol/L), high urine sodium and output, and is clinically hypovolaemic. What is the SINGLE most likely cause and treatment?', 'Hyponatraemia after SAH may be caused by cerebral salt wasting (renal sodium loss with hypovolaemia) or SIADH (euvolaemia). Fluid restriction in SAH is dangerous because hypovolaemia worsens vasospasm and delayed ischaemia. Treat cerebral salt wasting with isotonic or hypertonic saline, and fludrocortisone.', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v3')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = 'b0cb4660-4a79-5769-b6b2-7053f27e10b8';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('e1f89aa8-d888-5a31-9f11-44e4cd6a2237', 'b0cb4660-4a79-5769-b6b2-7053f27e10b8', 'A', 'Addison''s; hydrocortisone', false, 0),
  ('53438a89-e11b-5a03-b596-05bc1196c690', 'b0cb4660-4a79-5769-b6b2-7053f27e10b8', 'B', 'SIADH; fluid restriction', false, 1),
  ('4186553c-b99c-5fcd-9e3e-b1f3beccba8f', 'b0cb4660-4a79-5769-b6b2-7053f27e10b8', 'C', 'Hypothyroidism; levothyroxine', false, 2),
  ('87e1e3c5-3c7b-5ff0-8f5e-3706a3107883', 'b0cb4660-4a79-5769-b6b2-7053f27e10b8', 'D', 'Diabetes insipidus; desmopressin', false, 3),
  ('60e5ac77-46e2-5eb7-a495-4c7d6241eefc', 'b0cb4660-4a79-5769-b6b2-7053f27e10b8', 'E', 'Cerebral salt wasting; replace fluid and sodium (0.9% saline, sometimes fludrocortisone)', true, 4);

-- Q723
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('df4a2b83-ce8b-5bf3-bff1-cebe7be401dd', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000035', 'sba', 'A 70 year old man is ventilated in ICU. The ventilator alarms with high airway pressures, his SpO2 falls and BP drops. On the right, breath sounds are absent with hyperresonance. What is the SINGLE most likely diagnosis?', 'Positive pressure ventilation increases the risk of pneumothorax, which can rapidly become tension. Use the DOPES mnemonic for the deteriorating ventilated patient: Displacement of the tube, Obstruction (secretions, kinking), Pneumothorax, Equipment failure, Stacking of breaths (auto-PEEP). Needle or finger decompression and chest drain are needed.', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v3')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = 'df4a2b83-ce8b-5bf3-bff1-cebe7be401dd';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('2e109072-1148-5d9a-afa3-963b566139e4', 'df4a2b83-ce8b-5bf3-bff1-cebe7be401dd', 'A', 'Tension pneumothorax (barotrauma)', true, 0),
  ('f4a70981-e384-506c-9ea4-c4ead518286c', 'df4a2b83-ce8b-5bf3-bff1-cebe7be401dd', 'B', 'Right main bronchus intubation only', false, 1),
  ('ca52c467-5630-54b8-ad4d-14f05cc86424', 'df4a2b83-ce8b-5bf3-bff1-cebe7be401dd', 'C', 'Endotracheal tube blockage', false, 2),
  ('8a8ad267-82e1-5df3-b53c-61cb236167e6', 'df4a2b83-ce8b-5bf3-bff1-cebe7be401dd', 'D', 'Bronchospasm', false, 3),
  ('0f1d5a95-6160-53bf-951d-ea9dc192f170', 'df4a2b83-ce8b-5bf3-bff1-cebe7be401dd', 'E', 'Pulmonary embolism', false, 4);

-- Q724
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('8203f068-365d-5aa6-8446-c696866b64a1', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000035', 'sba', 'A 60 year old man needs a tracheostomy after 10 days on the ventilator in ICU. What is a key benefit of tracheostomy in prolonged ventilation?', 'Tracheostomy in prolonged ventilation reduces sedation needs, improves comfort and oral hygiene, reduces dead space and work of breathing, and helps weaning. Complications include bleeding, displacement, infection, tracheal stenosis and tracheo-innominate fistula. Displaced or blocked tracheostomies are emergencies (follow the National Tracheostomy Safety Project algorithm).', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v3')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = '8203f068-365d-5aa6-8446-c696866b64a1';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('3473ab90-7179-5e97-84a2-3da5a9d86dbe', '8203f068-365d-5aa6-8446-c696866b64a1', 'A', 'It is fully reversible with no complications', false, 0),
  ('aeb86867-bf26-5038-9c20-67d53aacfe02', '8203f068-365d-5aa6-8446-c696866b64a1', 'B', 'Improved comfort, reduced sedation needs and easier weaning from ventilation', true, 1),
  ('45e533d5-a2ca-592c-a2ed-535067755461', '8203f068-365d-5aa6-8446-c696866b64a1', 'C', 'It allows normal swallowing in all cases', false, 2),
  ('0f5cda5f-9f24-5418-b61e-0537597959d6', '8203f068-365d-5aa6-8446-c696866b64a1', 'D', 'It prevents the need for any suctioning', false, 3),
  ('6d990834-0387-55bb-85a7-fd33bc90c982', '8203f068-365d-5aa6-8446-c696866b64a1', 'E', 'It eliminates all infection risk', false, 4);

-- Q725
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('e69949cf-3045-5031-b682-174e71fcd32d', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000035', 'sba', 'A 45 year old woman with severe sepsis remains hypotensive despite high-dose noradrenaline and vasopressin. What is the SINGLE most appropriate adjunctive drug?', 'Surviving Sepsis guidelines suggest IV hydrocortisone for adults with septic shock needing ongoing vasopressors. It speeds the resolution of shock but has a modest effect on mortality. Measuring cortisol is not needed to start. Wean steroids when vasopressors are stopped.', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v3')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = 'e69949cf-3045-5031-b682-174e71fcd32d';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('e012eb7b-5c4f-5b7a-ac9e-c3c5b265e0f2', 'e69949cf-3045-5031-b682-174e71fcd32d', 'A', 'Fludrocortisone alone', false, 0),
  ('8c81c9e6-e2ca-59e5-8c58-22c00a4aa34d', 'e69949cf-3045-5031-b682-174e71fcd32d', 'B', 'Oral prednisolone', false, 1),
  ('8d73733d-7b99-5fa8-b239-0938c7c44f19', 'e69949cf-3045-5031-b682-174e71fcd32d', 'C', 'IV dexamethasone 20 mg', false, 2),
  ('593b9495-8ee5-5117-aa0c-a8ec51fdc2b0', 'e69949cf-3045-5031-b682-174e71fcd32d', 'D', 'IV hydrocortisone (e.g. 200 mg/day)', true, 3),
  ('b361ccc8-0ff8-52c0-b473-9b72dc4feac1', 'e69949cf-3045-5031-b682-174e71fcd32d', 'E', 'IV methylprednisolone 1 g', false, 4);

-- Q726
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('ce5fd6c9-e650-5bf1-9018-cd1076cb4acc', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000035', 'sba', 'A 30 year old man with severe acute asthma is ventilated in ICU. His BP falls with each breath and airway pressure rises. Exhalation is incomplete before the next breath. What is the SINGLE most likely explanation and action?', 'In severe obstructive disease, air trapping causes intrinsic PEEP, raising intrathoracic pressure, reducing venous return and causing hypotension and barotrauma. Management: briefly disconnect the circuit to allow full exhalation, then use low respiratory rates, low tidal volumes, longer expiratory times and permissive hypercapnia, and treat the bronchospasm.', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v3')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = 'ce5fd6c9-e650-5bf1-9018-cd1076cb4acc';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('c3fe0c83-7603-5fa4-9edb-1cfcf9a3e59f', 'ce5fd6c9-e650-5bf1-9018-cd1076cb4acc', 'A', 'Equipment failure; replace the ventilator', false, 0),
  ('149fdf38-718a-5cb8-b153-83400848d725', 'ce5fd6c9-e650-5bf1-9018-cd1076cb4acc', 'B', 'Dynamic hyperinflation (breath stacking/auto-PEEP); disconnect from the ventilator briefly and reduce the respiratory rate/increase expiratory time', true, 1),
  ('ba228d1e-bc3c-5843-874d-b96a248447a0', 'ce5fd6c9-e650-5bf1-9018-cd1076cb4acc', 'C', 'Pneumonia; antibiotics', false, 2),
  ('bf0c62f0-ac3c-5a41-aa8c-aab8b7358a22', 'ce5fd6c9-e650-5bf1-9018-cd1076cb4acc', 'D', 'Hypoglycaemia; glucose', false, 3),
  ('1ab885d4-a81e-578d-8c25-922660fc4182', 'ce5fd6c9-e650-5bf1-9018-cd1076cb4acc', 'E', 'Fluid overload; furosemide', false, 4);

-- Q727
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('78523ac9-201e-5457-b1d9-112cd036b18b', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000035', 'sba', 'A 64 year old man with a history of a tracheostomy on the ward suddenly cannot breathe. The tracheostomy tube appears blocked and he is desaturating. Removal of the inner tube does not help. What is the SINGLE most appropriate next step?', 'Blocked or displaced tracheostomy algorithm: call for help, oxygen to face and stoma, remove the speaking valve and inner tube, pass a suction catheter. If unsuccessful, deflate the cuff. If still not improving, remove the tube, then oxygenate via the face or stoma (oral intubation for patent airways, or stoma intubation). Start CPR if there is no pulse.', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v3')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = '78523ac9-201e-5457-b1d9-112cd036b18b';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('12cc464d-0ef8-5b78-a822-6ff8a361ef0a', '78523ac9-201e-5457-b1d9-112cd036b18b', 'A', 'Inflate the cuff more', false, 0),
  ('27f35b9e-46a0-53aa-92e5-70e351656d46', '78523ac9-201e-5457-b1d9-112cd036b18b', 'B', 'Push a suction catheter harder', false, 1),
  ('ce53c97d-7cf8-563e-96c4-b7f8372e7542', '78523ac9-201e-5457-b1d9-112cd036b18b', 'C', 'Start chest compressions immediately in a breathing patient', false, 2),
  ('7fda639c-7659-53b8-9136-8c54c5feb050', '78523ac9-201e-5457-b1d9-112cd036b18b', 'D', 'Call for help, apply high-flow oxygen to the face and stoma, and if the tube is still blocked deflate the cuff then remove the tracheostomy tube (following the National Tracheostomy Safety algorithm)', true, 3),
  ('84210dc4-bf1e-5d61-891c-f8e86af7d880', '78523ac9-201e-5457-b1d9-112cd036b18b', 'E', 'Give nebulised salbutamol and wait', false, 4);

-- Q728
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('21dc1680-6e37-5301-8e35-0eb6a6f0ffbf', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000024', 'sba', 'A 70 year old man with metastatic prostate cancer has rising PSA despite androgen deprivation therapy. What is this state called?', 'When prostate cancer progresses despite castrate testosterone levels, it is castration-resistant. Treatment options include novel androgen receptor-targeted agents (abiraterone, enzalutamide), docetaxel chemotherapy, radium-223 for bone metastases, and PARP inhibitors for BRCA mutations. Bone protection and palliative care are important.', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v3')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = '21dc1680-6e37-5301-8e35-0eb6a6f0ffbf';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('e24b3722-3908-5ae9-a164-293164f82684', '21dc1680-6e37-5301-8e35-0eb6a6f0ffbf', 'A', 'Castration-resistant (hormone-relapsed) prostate cancer', true, 0),
  ('69981e8d-471a-5f2f-9caf-5e7872a93634', '21dc1680-6e37-5301-8e35-0eb6a6f0ffbf', 'B', 'Prostatitis', false, 1),
  ('f11e26c0-1889-5409-8dcd-9977616d2164', '21dc1680-6e37-5301-8e35-0eb6a6f0ffbf', 'C', 'Benign prostatic hyperplasia', false, 2),
  ('68775a9e-428c-5e2a-8d6f-7acf4c86e083', '21dc1680-6e37-5301-8e35-0eb6a6f0ffbf', 'D', 'Localised prostate cancer', false, 3),
  ('de9a4dff-9e56-5833-86da-b8d92575337e', '21dc1680-6e37-5301-8e35-0eb6a6f0ffbf', 'E', 'Hormone-sensitive prostate cancer', false, 4);

-- Q729
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('07554932-d0b2-5c42-82ec-de7fc1ca7ebf', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000024', 'sba', 'A 66 year old man with lung cancer develops a cough, fever and breathlessness 6 weeks after completing radiotherapy to the chest. CT shows ground-glass changes in the irradiated area. What is the SINGLE most likely diagnosis?', 'Radiation pneumonitis occurs 1-6 months after thoracic radiotherapy, with cough, breathlessness and fever, and changes confined to the radiation field. Treat with oral corticosteroids. It can lead to radiation fibrosis. Exclude infection and tumour progression.', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v3')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = '07554932-d0b2-5c42-82ec-de7fc1ca7ebf';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('61f173ad-a027-5161-8e25-82aa061188d3', '07554932-d0b2-5c42-82ec-de7fc1ca7ebf', 'A', 'Lung abscess', false, 0),
  ('f3bd5003-11a8-5937-989d-2613beddaaac', '07554932-d0b2-5c42-82ec-de7fc1ca7ebf', 'B', 'Tumour recurrence', false, 1),
  ('adc4d095-1d9c-5934-b1ee-712b828371c1', '07554932-d0b2-5c42-82ec-de7fc1ca7ebf', 'C', 'Pulmonary embolism', false, 2),
  ('6632eda0-62dd-562a-8487-760fe27b0ea5', '07554932-d0b2-5c42-82ec-de7fc1ca7ebf', 'D', 'Radiation pneumonitis', true, 3),
  ('e2a9ad7e-de38-5684-984b-cf1a21ad914f', '07554932-d0b2-5c42-82ec-de7fc1ca7ebf', 'E', 'Heart failure', false, 4);

-- Q730
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('4a9d9e5e-123f-5e50-b9db-7be2afec4fbe', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000024', 'sba', 'A 72 year old woman has bone metastases from breast cancer. Which drug is given to reduce skeletal-related events (fractures, spinal cord compression, need for radiotherapy)?', 'In bone metastases (breast, prostate, myeloma), bisphosphonates or denosumab reduce skeletal-related events and hypercalcaemia. Ensure good dental health before starting (osteonecrosis of the jaw). Monitor calcium (denosumab can cause hypocalcaemia), and give calcium and vitamin D supplements.', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v3')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = '4a9d9e5e-123f-5e50-b9db-7be2afec4fbe';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('49a78919-b37a-51e4-ba99-f85c6bef3e39', '4a9d9e5e-123f-5e50-b9db-7be2afec4fbe', 'A', 'A bone-targeted agent: IV zoledronic acid or subcutaneous denosumab', true, 0),
  ('cf34c74f-63ba-5322-8125-0b6ccd738866', '4a9d9e5e-123f-5e50-b9db-7be2afec4fbe', 'B', 'Iron supplements', false, 1),
  ('2f349299-42f4-59f1-9846-40146b3cf3f9', '4a9d9e5e-123f-5e50-b9db-7be2afec4fbe', 'C', 'Oral calcium only', false, 2),
  ('7cf4c507-bb84-5a43-acab-032487373eb1', '4a9d9e5e-123f-5e50-b9db-7be2afec4fbe', 'D', 'Allopurinol', false, 3),
  ('be052144-6238-5106-9c3d-c94b6ec6cec9', '4a9d9e5e-123f-5e50-b9db-7be2afec4fbe', 'E', 'Oral prednisolone', false, 4);

-- Q731
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('93f8d3df-1112-51dc-a453-601dba71ddab', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000024', 'sba', 'A 55 year old woman is about to start immunotherapy with a checkpoint inhibitor. Which baseline blood tests are MOST important because of possible immune-related endocrine adverse effects?', 'Checkpoint inhibitors commonly cause thyroiditis (hyper- then hypothyroidism), hypophysitis (especially ipilimumab, causing low cortisol and other pituitary hormones), adrenalitis and, rarely, type 1 diabetes with DKA. Check TFTs, cortisol and glucose at baseline and regularly. Adrenal crisis needs urgent hydrocortisone.', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v3')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = '93f8d3df-1112-51dc-a453-601dba71ddab';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('e3a66ee2-48ac-5877-bebd-3945cbe07a4a', '93f8d3df-1112-51dc-a453-601dba71ddab', 'A', 'PSA', false, 0),
  ('5ffa36fc-75a2-5e19-bb36-3c846b4643ff', '93f8d3df-1112-51dc-a453-601dba71ddab', 'B', 'Iron studies only', false, 1),
  ('49a645c1-4f06-505e-b09d-721b4119c437', '93f8d3df-1112-51dc-a453-601dba71ddab', 'C', 'Thyroid function, cortisol and glucose (with LFTs and renal function)', true, 2),
  ('bbb648e3-35b6-5379-9147-7ea58062f1f4', '93f8d3df-1112-51dc-a453-601dba71ddab', 'D', 'Amylase only', false, 3),
  ('53b04782-2c08-51bf-b8fd-b88d0e017ebb', '93f8d3df-1112-51dc-a453-601dba71ddab', 'E', 'Vitamin B12 only', false, 4);

-- Q732
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('bd9a4107-928f-548d-8e1f-78e98500c83e', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000024', 'sba', 'A 22 year old woman has Hodgkin lymphoma and is due to start chemotherapy and radiotherapy to the mediastinum. Which LONG-TERM risk is she at, which needs screening later?', 'Survivors of Hodgkin lymphoma treated with chest radiotherapy (especially women treated before 36) have a high risk of breast cancer and need early enhanced breast screening (annual MRI or mammography from 8 years after treatment or from age 25-30). Other late effects include heart disease, lung damage, hypothyroidism, infertility and second cancers.', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v3')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = 'bd9a4107-928f-548d-8e1f-78e98500c83e';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('3f9a9d29-69b9-51d0-8c9d-573ab7527bb4', 'bd9a4107-928f-548d-8e1f-78e98500c83e', 'A', 'Breast cancer (and cardiovascular disease, thyroid dysfunction and infertility)', true, 0),
  ('1057eb31-0c87-5911-a3b3-7f4420f941b5', 'bd9a4107-928f-548d-8e1f-78e98500c83e', 'B', 'Pancreatitis', false, 1),
  ('20d6a745-1da7-5c9a-9a37-90074cfc8cad', 'bd9a4107-928f-548d-8e1f-78e98500c83e', 'C', 'Kidney stones', false, 2),
  ('4ef40bdf-c6ec-5f00-9210-ff58fee19ebb', 'bd9a4107-928f-548d-8e1f-78e98500c83e', 'D', 'Prostate cancer', false, 3),
  ('3b8722ae-954a-5cab-a264-65a2d5a0a4e4', 'bd9a4107-928f-548d-8e1f-78e98500c83e', 'E', 'Cataracts only', false, 4);

-- Q733
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('da50897b-fcca-5457-9366-8d9d2816e1cc', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000024', 'sba', 'A 52 year old woman has pain, bloating and weight loss. CT shows bilateral ovarian masses and an ulcerated gastric tumour. Ovarian biopsy shows signet ring cells. What is the SINGLE most likely diagnosis?', 'Krukenberg tumours are ovarian metastases, typically bilateral, with mucin-secreting signet ring cells. They usually come from gastric cancer (also from colon, breast and appendix). Look for the primary with endoscopy. Prognosis is poor.', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v3')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = 'da50897b-fcca-5457-9366-8d9d2816e1cc';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('0ba0a80f-450c-5acd-a836-5b147f77e5eb', 'da50897b-fcca-5457-9366-8d9d2816e1cc', 'A', 'Granulosa cell tumour', false, 0),
  ('3327e0f1-11ec-5d63-8143-9810dbfc6686', 'da50897b-fcca-5457-9366-8d9d2816e1cc', 'B', 'Meigs'' syndrome', false, 1),
  ('86684ce1-cda6-5361-a6fb-c93f7590f9aa', 'da50897b-fcca-5457-9366-8d9d2816e1cc', 'C', 'Primary epithelial ovarian cancer', false, 2),
  ('1d7d71b9-9e3e-5ff1-9035-ed2245b5791c', 'da50897b-fcca-5457-9366-8d9d2816e1cc', 'D', 'Dermoid cysts', false, 3),
  ('6721da67-3647-5227-94ab-6f92f461ad7f', 'da50897b-fcca-5457-9366-8d9d2816e1cc', 'E', 'Krukenberg tumours (gastric adenocarcinoma metastatic to the ovaries)', true, 4);

-- Q734
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('7d83cdcb-62f6-5f0f-b9f6-e97ffe2c2f01', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000024', 'sba', 'A 48 year old man has had worsening headache for 3 months. MRI shows a ring-enhancing frontal lesion with central necrosis and surrounding oedema crossing the corpus callosum (''butterfly''). What is the SINGLE most likely diagnosis?', 'Glioblastoma is the commonest and most aggressive primary brain tumour in adults. It shows irregular ring enhancement, necrosis and oedema, and can cross the corpus callosum. Treatment is maximal safe resection, then radiotherapy with temozolomide (MGMT methylation predicts response). Dexamethasone reduces oedema. Median survival is about 15 months.', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v3')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = '7d83cdcb-62f6-5f0f-b9f6-e97ffe2c2f01';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('f2e84e85-6ac0-522b-8342-b7d790d8b531', '7d83cdcb-62f6-5f0f-b9f6-e97ffe2c2f01', 'A', 'Low-grade astrocytoma', false, 0),
  ('a7ee5999-8cb1-5a79-9c11-dc9a5b66b3ed', '7d83cdcb-62f6-5f0f-b9f6-e97ffe2c2f01', 'B', 'Glioblastoma', true, 1),
  ('c566de52-a01a-5f9d-9e22-72d11172daa3', '7d83cdcb-62f6-5f0f-b9f6-e97ffe2c2f01', 'C', 'Cerebral abscess', false, 2),
  ('227af2d0-7470-59a1-b4ff-fbb0b173371a', '7d83cdcb-62f6-5f0f-b9f6-e97ffe2c2f01', 'D', 'Meningioma', false, 3),
  ('6492b411-7510-54df-8860-2250c0054c03', '7d83cdcb-62f6-5f0f-b9f6-e97ffe2c2f01', 'E', 'Metastasis from lung cancer only', false, 4);

-- Q735
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('a0aba4de-ced0-5b27-acfd-9887109184a2', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000022', 'sba', 'A 55 year old woman has newly diagnosed breast cancer. Which test result determines whether she is likely to benefit from endocrine (hormone) therapy?', 'Breast cancers are tested for ER, PR and HER2. ER-positive tumours (about 80%) benefit from endocrine therapy (tamoxifen, aromatase inhibitors). HER2-positive tumours benefit from anti-HER2 therapy. Triple-negative cancers (ER, PR and HER2 negative) are treated with chemotherapy (and sometimes immunotherapy), and are associated with BRCA1.', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v3')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = 'a0aba4de-ced0-5b27-acfd-9887109184a2';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('438bc711-5af4-57a1-85fd-f189f6a93038', 'a0aba4de-ced0-5b27-acfd-9887109184a2', 'A', 'BRCA status', false, 0),
  ('52006446-7490-5e16-a04b-abeaa526fbca', 'a0aba4de-ced0-5b27-acfd-9887109184a2', 'B', 'HER2 status only', false, 1),
  ('9eaff26c-6ee4-5768-ae71-e0ceee8b4114', 'a0aba4de-ced0-5b27-acfd-9887109184a2', 'C', 'Oestrogen receptor (and progesterone receptor) status of the tumour', true, 2),
  ('7c941693-df8d-5d1e-bbf5-f995fe8dfb23', 'a0aba4de-ced0-5b27-acfd-9887109184a2', 'D', 'Serum oestradiol level', false, 3),
  ('c0620d1a-25e7-523d-919c-1ec1c5c524b0', 'a0aba4de-ced0-5b27-acfd-9887109184a2', 'E', 'CA 15-3', false, 4);

-- Q736
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('11afd827-a9e3-5ba4-8e3b-01df18dacec9', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000022', 'sba', 'A 60 year old woman has a breast lump. Mammography shows a spiculated mass. Core biopsy shows invasive ductal carcinoma of no special type, grade 3. What does ''grade 3'' indicate?', 'Grade (Nottingham, 1-3) is based on tubule formation, nuclear pleomorphism and mitotic count: higher grade means more aggressive. Stage (TNM) reflects tumour size, node involvement and metastasis. Prognostic tools such as the Nottingham Prognostic Index and PREDICT combine size, grade, nodes and receptor status.', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v3')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = '11afd827-a9e3-5ba4-8e3b-01df18dacec9';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('39044bb0-05f9-502f-9239-990b7464c074', '11afd827-a9e3-5ba4-8e3b-01df18dacec9', 'A', 'Low-grade tumour with an excellent prognosis', false, 0),
  ('9585d62c-64f2-537c-91e3-a5a03e3d1be2', '11afd827-a9e3-5ba4-8e3b-01df18dacec9', 'B', 'It is in situ only', false, 1),
  ('ca0120b0-22d8-5992-bc05-cb5db7f2859d', '11afd827-a9e3-5ba4-8e3b-01df18dacec9', 'C', 'Poorly differentiated, high-grade tumour with a worse prognosis', true, 2),
  ('7f811d11-fc17-560f-aeb4-a800c746f991', '11afd827-a9e3-5ba4-8e3b-01df18dacec9', 'D', 'The tumour has spread to 3 lymph nodes', false, 3),
  ('50c1b39d-0ffc-5881-b3ed-88ab89cb0cfc', '11afd827-a9e3-5ba4-8e3b-01df18dacec9', 'E', 'It is stage 3', false, 4);

-- Q737
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('5147e716-bc9c-570a-9f6f-7ed8e5b4ab73', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000022', 'sba', 'A 40 year old woman has a breast lump. Ultrasound shows an irregular hypoechoic mass. What is the BEST tissue sampling method for diagnosis?', 'Core needle biopsy is preferred for solid breast lesions, as it gives histology (invasive vs in situ, grade) and receptor status (ER, PR, HER2). FNA gives cytology only, and is mainly used for cysts and axillary nodes. Stereotactic or vacuum-assisted biopsy is used for microcalcifications. Triple assessment combines clinical, imaging and pathology findings.', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v3')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = '5147e716-bc9c-570a-9f6f-7ed8e5b4ab73';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('312928c1-a972-51f7-8532-9e72a20b1d19', '5147e716-bc9c-570a-9f6f-7ed8e5b4ab73', 'A', 'Mammography alone', false, 0),
  ('0de80067-d8f6-5792-84f1-404a3739a0c1', '5147e716-bc9c-570a-9f6f-7ed8e5b4ab73', 'B', 'Excision biopsy in all cases', false, 1),
  ('60bb0c6e-66de-51b2-94ee-59823a5273f2', '5147e716-bc9c-570a-9f6f-7ed8e5b4ab73', 'C', 'Ultrasound-guided core needle biopsy', true, 2),
  ('d9be80fd-a12f-50d7-88be-51ec192768fa', '5147e716-bc9c-570a-9f6f-7ed8e5b4ab73', 'D', 'Fine needle aspiration cytology only', false, 3),
  ('f9811e7b-7c2e-5ce6-b282-94b62e181fcb', '5147e716-bc9c-570a-9f6f-7ed8e5b4ab73', 'E', 'Nipple discharge cytology', false, 4);

-- Q738
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('340138c7-4582-5622-9257-679e64f908e5', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000022', 'sba', 'A 48 year old woman has cyclical bilateral breast pain. Examination and imaging are normal. She has tried a well-fitting bra and simple analgesia. Which treatment may help?', 'Cyclical mastalgia is common and benign. Management is reassurance, a well-fitting bra, simple analgesia and topical NSAIDs. Hormonal drugs (danazol, tamoxifen off-label) are specialist options for severe pain because of side effects. Evening primrose oil is no longer recommended. Non-cyclical or focal pain needs examination to exclude other causes.', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v3')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = '340138c7-4582-5622-9257-679e64f908e5';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('8539efba-dd60-57cc-acae-1dbe11ce417e', '340138c7-4582-5622-9257-679e64f908e5', 'A', 'Oral antibiotics', false, 0),
  ('7c915234-1083-5bb4-bc92-dc1336fc51a2', '340138c7-4582-5622-9257-679e64f908e5', 'B', 'Danazol as first-line', false, 1),
  ('aedab456-3b75-5e1e-8662-14f584117f2e', '340138c7-4582-5622-9257-679e64f908e5', 'C', 'Topical NSAIDs; reassurance (most mastalgia is not linked to cancer)', true, 2),
  ('d7a3b1bc-1987-53b5-b76e-7610327b8fc6', '340138c7-4582-5622-9257-679e64f908e5', 'D', 'Mastectomy', false, 3),
  ('340fa6ef-06d3-5c04-a7c4-ad78d6c18c0c', '340138c7-4582-5622-9257-679e64f908e5', 'E', 'Evening primrose oil is proven very effective', false, 4);

-- Q739
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('40d852cd-65f1-560a-8194-b8440f53adc0', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000022', 'sba', 'A 35 year old woman had a breast cancer with a BRCA1 mutation found on testing. She has had bilateral mastectomy. Which other cancer is she at markedly increased risk of?', 'BRCA1 carriers have a lifetime breast cancer risk of about 60-90% and ovarian cancer risk of about 40%. Risk-reducing salpingo-oophorectomy is recommended after childbearing (around 35-40). BRCA2 carriers have a lower ovarian risk, and increased prostate, pancreatic, male breast cancer and melanoma risks.', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v3')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = '40d852cd-65f1-560a-8194-b8440f53adc0';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('00cb6245-d588-5b2c-aca4-c3ecca142745', '40d852cd-65f1-560a-8194-b8440f53adc0', 'A', 'Ovarian (and fallopian tube) cancer', true, 0),
  ('64fb6b3b-d084-5f0e-9e7a-4d241936fbc5', '40d852cd-65f1-560a-8194-b8440f53adc0', 'B', 'Lung cancer', false, 1),
  ('e7ca357c-eb77-54ca-9721-026ccf30194b', '40d852cd-65f1-560a-8194-b8440f53adc0', 'C', 'Colon cancer', false, 2),
  ('8bc018d5-a11f-5ce8-ae80-d4a49d632cb4', '40d852cd-65f1-560a-8194-b8440f53adc0', 'D', 'Bladder cancer', false, 3),
  ('01c2787d-a738-5baf-a394-bc77c380778b', '40d852cd-65f1-560a-8194-b8440f53adc0', 'E', 'Kidney cancer', false, 4);

-- Q740
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('b7019558-89b0-5d4a-b3c4-7152ece9d19e', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000022', 'sba', 'A 30 year old woman has a hard, irregular breast lump after a blunt injury from a seatbelt in a car crash. Ultrasound and biopsy show fat necrosis. What is the CORRECT statement about fat necrosis?', 'Fat necrosis follows trauma, surgery or radiotherapy. It can cause a firm, irregular mass, skin tethering and calcification that mimic carcinoma. Diagnosis needs triple assessment (biopsy). Once confirmed, no treatment is needed.', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v3')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = 'b7019558-89b0-5d4a-b3c4-7152ece9d19e';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('293c9aa8-32e7-555f-bdcf-ad22e21cd049', 'b7019558-89b0-5d4a-b3c4-7152ece9d19e', 'A', 'It is premalignant', false, 0),
  ('8edcf85f-f324-51e0-baf9-7b5c89564175', 'b7019558-89b0-5d4a-b3c4-7152ece9d19e', 'B', 'It never follows trauma', false, 1),
  ('22c4adae-08a2-5c53-b249-8341613668ce', 'b7019558-89b0-5d4a-b3c4-7152ece9d19e', 'C', 'It only occurs in men', false, 2),
  ('cedf6e9d-b78b-5161-b35b-e9b4daf2e29b', 'b7019558-89b0-5d4a-b3c4-7152ece9d19e', 'D', 'It is benign but can mimic cancer clinically and on imaging, so triple assessment is needed', true, 3),
  ('c1deb24b-fe1b-5acc-bd0e-6df0f922da46', 'b7019558-89b0-5d4a-b3c4-7152ece9d19e', 'E', 'It always needs mastectomy', false, 4);

-- Q741
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('66d63208-49e1-5f10-b48e-199e9a5aac32', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000022', 'sba', 'A 56 year old woman is taking anastrozole after breast cancer. She has troublesome joint pains and stiffness. What is the SINGLE most likely explanation?', 'Aromatase inhibitors commonly cause arthralgia and myalgia (in up to half of women), as well as bone loss and vaginal dryness. Management includes exercise, analgesia, switching to another aromatase inhibitor or to tamoxifen. Persistent localised bone pain should be investigated for metastases.', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v3')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = '66d63208-49e1-5f10-b48e-199e9a5aac32';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('5d348e9a-a626-5eb2-a727-fae8fc40ded8', '66d63208-49e1-5f10-b48e-199e9a5aac32', 'A', 'Rheumatoid arthritis', false, 0),
  ('6c873b6d-5df7-5976-9f02-4f03cb127d34', '66d63208-49e1-5f10-b48e-199e9a5aac32', 'B', 'Hypothyroidism', false, 1),
  ('a304afd1-9178-5213-a2fd-ef2f0bb9e192', '66d63208-49e1-5f10-b48e-199e9a5aac32', 'C', 'Bone metastases in all cases', false, 2),
  ('d57d4f76-e216-511f-a115-6d637321d361', '66d63208-49e1-5f10-b48e-199e9a5aac32', 'D', 'Gout', false, 3),
  ('f0aa09cb-4620-5534-b830-0755d2e537a8', '66d63208-49e1-5f10-b48e-199e9a5aac32', 'E', 'Aromatase inhibitor-associated arthralgia (a common side effect)', true, 4);

-- Q742
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('d4aa1267-f9c2-5ffe-b34d-8dbf5f13dc3c', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000034', 'sba', 'A 28 year old woman is planning pregnancy. She takes several medications. Which drug is MOST important to stop before conception because of teratogenicity?', 'Warfarin crosses the placenta and causes embryopathy (nasal hypoplasia, stippled epiphyses) especially at 6-12 weeks, plus fetal bleeding. Women needing anticoagulation switch to LMWH (except some with mechanical valves under specialist care). Other teratogens: valproate, isotretinoin, ACE inhibitors and ARBs, methotrexate, lithium, tetracyclines and some antiepileptics.', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v3')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = 'd4aa1267-f9c2-5ffe-b34d-8dbf5f13dc3c';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('9cad5359-4824-5c8f-a7e2-c61839aab71f', 'd4aa1267-f9c2-5ffe-b34d-8dbf5f13dc3c', 'A', 'Levothyroxine', false, 0),
  ('47a5fcb9-88a1-5090-83c7-472e6d8a6fb5', 'd4aa1267-f9c2-5ffe-b34d-8dbf5f13dc3c', 'B', 'Warfarin (switch to LMWH under specialist advice)', true, 1),
  ('76fddd52-1310-5234-a23d-c05795e7392a', 'd4aa1267-f9c2-5ffe-b34d-8dbf5f13dc3c', 'C', 'Paracetamol', false, 2),
  ('4be589dc-63ed-5769-a8ac-d68cca6b6617', 'd4aa1267-f9c2-5ffe-b34d-8dbf5f13dc3c', 'D', 'Folic acid', false, 3),
  ('9e32a623-9f9e-5d03-b5d6-395eb9a52eb1', 'd4aa1267-f9c2-5ffe-b34d-8dbf5f13dc3c', 'E', 'Labetalol', false, 4);

-- Q743
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('d28257b8-09f5-5511-96ab-062cb7bfdf4c', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000034', 'sba', 'A 45 year old woman has severe liver cirrhosis (Child-Pugh C). Which effect does severe liver disease have on prescribing?', 'In liver disease, avoid or reduce hepatically metabolised drugs, sedatives and opioids (can precipitate encephalopathy), NSAIDs (renal failure, bleeding, fluid retention), constipating drugs, and drugs causing hyponatraemia. Monitor highly protein-bound drugs. Check the BNF hepatic impairment sections.', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v3')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = 'd28257b8-09f5-5511-96ab-062cb7bfdf4c';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('53ab7063-0a3f-5b8d-a542-a9f5381b23c3', 'd28257b8-09f5-5511-96ab-062cb7bfdf4c', 'A', 'It only affects renally excreted drugs', false, 0),
  ('bbf97361-b7af-5c75-af0f-cda55b77911d', 'd28257b8-09f5-5511-96ab-062cb7bfdf4c', 'B', 'It increases drug clearance', false, 1),
  ('b8f6aeaa-cde3-5c52-869a-a6d50e12338b', 'd28257b8-09f5-5511-96ab-062cb7bfdf4c', 'C', 'It makes opioids safer', false, 2),
  ('c1ca041c-8e9b-5433-91e7-fa665250b266', 'd28257b8-09f5-5511-96ab-062cb7bfdf4c', 'D', 'No effect on prescribing', false, 3),
  ('31db9ad8-c54e-5ae9-b9de-a499e3aa5f82', 'd28257b8-09f5-5511-96ab-062cb7bfdf4c', 'E', 'Reduced metabolism of many drugs, low albumin (more free drug), risk of encephalopathy with sedatives, and bleeding risk with anticoagulants', true, 4);

-- Q744
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('edd59222-2b33-59b4-8bf1-cca12206a789', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000034', 'sba', 'A 72 year old man takes amlodipine, simvastatin 40 mg, omeprazole and aspirin. He is started on clarithromycin for pneumonia. What is the MOST appropriate action?', 'Clarithromycin and erythromycin are strong CYP3A4 inhibitors that raise simvastatin and atorvastatin levels and the risk of rhabdomyolysis. Simvastatin should be withheld during the course (or a non-interacting antibiotic chosen). Clarithromycin also prolongs QT and interacts with many drugs.', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v3')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = 'edd59222-2b33-59b4-8bf1-cca12206a789';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('0af5bf24-c87c-54d8-abf3-20439a9c61cb', 'edd59222-2b33-59b4-8bf1-cca12206a789', 'A', 'Stop aspirin', false, 0),
  ('3d76915c-335e-5e15-8d86-f4e0bd2fdea1', 'edd59222-2b33-59b4-8bf1-cca12206a789', 'B', 'Withhold simvastatin during the clarithromycin course (risk of myopathy/rhabdomyolysis)', true, 1),
  ('9caef2d5-c396-5560-a303-72accf5579cf', 'edd59222-2b33-59b4-8bf1-cca12206a789', 'C', 'Double the simvastatin dose', false, 2),
  ('6e621a16-a4a8-55a2-942f-573141092e31', 'edd59222-2b33-59b4-8bf1-cca12206a789', 'D', 'No action needed', false, 3),
  ('198e88e0-858e-580b-9ebd-80a06040d80c', 'edd59222-2b33-59b4-8bf1-cca12206a789', 'E', 'Stop amlodipine permanently', false, 4);

-- Q745
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('5809db94-af4a-562f-87af-8b3a9b223652', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000034', 'sba', 'A 30 year old man with a recent sore throat was given phenoxymethylpenicillin. Twenty minutes after the first dose, he has urticaria, wheeze and hypotension. What should be recorded and done?', 'Immediate (IgE-mediated) reactions such as urticaria, angioedema, bronchospasm or anaphylaxis indicate true allergy. Penicillins must be avoided, and cephalosporins used only with caution and specialist advice. Document the drug, reaction and date in the records. Report serious reactions via the Yellow Card scheme.', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v3')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = '5809db94-af4a-562f-87af-8b3a9b223652';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('13c16128-76d1-5520-a2cc-1c660a2c1059', '5809db94-af4a-562f-87af-8b3a9b223652', 'A', 'Treat as anaphylaxis, record a true penicillin allergy with the reaction type, and avoid all penicillins (refer to allergy services)', true, 0),
  ('7b9cbeda-3688-5648-ba51-374c2e428b4b', '5809db94-af4a-562f-87af-8b3a9b223652', 'B', 'Avoid only amoxicillin', false, 1),
  ('73df6475-eeb7-5b3d-b471-6a7223c763df', '5809db94-af4a-562f-87af-8b3a9b223652', 'C', 'No need to document', false, 2),
  ('ea2bab45-b090-5fff-972f-88b75fcc491f', '5809db94-af4a-562f-87af-8b3a9b223652', 'D', 'Record ''intolerance'' only', false, 3),
  ('86905fa0-2ce6-56f1-b24e-7a92fe6a6576', '5809db94-af4a-562f-87af-8b3a9b223652', 'E', 'Restart penicillin tomorrow', false, 4);

-- Q746
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('33e22071-7cfc-5776-92e9-3b2e9b9d9d24', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000034', 'sba', 'A 65 year old woman takes long-term NSAIDs for osteoarthritis. She has a history of peptic ulcer. Which approach is MOST appropriate?', 'NSAIDs cause peptic ulcers and GI bleeding, worsen renal function and heart failure, and raise BP and cardiovascular risk. Avoid in patients with previous ulcers, or give gastroprotection (PPI) when needed. Topical NSAIDs are preferred in OA. COX-2 inhibitors have less GI risk but more cardiovascular risk.', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v3')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = '33e22071-7cfc-5776-92e9-3b2e9b9d9d24';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('5032ca14-ff5c-5891-8092-c5bd2acead50', '33e22071-7cfc-5776-92e9-3b2e9b9d9d24', 'A', 'Add aspirin', false, 0),
  ('6c329dfe-f97a-51d0-aace-0a672af07130', '33e22071-7cfc-5776-92e9-3b2e9b9d9d24', 'B', 'Continue NSAIDs without a PPI', false, 1),
  ('f2e53da2-3c80-5905-b74b-fc33579d7630', '33e22071-7cfc-5776-92e9-3b2e9b9d9d24', 'C', 'Switch to a COX-2 inhibitor with no gastroprotection in all', false, 2),
  ('f7f88437-706c-5131-a4e3-26ed53c0ecda', '33e22071-7cfc-5776-92e9-3b2e9b9d9d24', 'D', 'Avoid NSAIDs if possible; if essential, use the lowest dose for the shortest time with a PPI', true, 3),
  ('ca5ea967-5623-5c56-af09-573f5d012b36', '33e22071-7cfc-5776-92e9-3b2e9b9d9d24', 'E', 'Double the NSAID dose', false, 4);

-- Q747
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('28e6fdf0-d4a7-5b06-835d-7d35961b382c', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000034', 'sba', 'A 60 year old man has type 2 diabetes and takes metformin and gliclazide. He is started on a beta-blocker after an MI. What should he be warned about?', 'Beta-blockers can blunt adrenergic warning signs of hypoglycaemia (tremor, palpitations, anxiety), although sweating usually remains. This matters most with insulin or sulfonylureas. Cardioselective beta-blockers (bisoprolol) are preferred. They are still recommended after MI in diabetes.', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v3')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = '28e6fdf0-d4a7-5b06-835d-7d35961b382c';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('ffc1a8cc-0cc1-52e4-ad34-c6bbcfd7681f', '28e6fdf0-d4a7-5b06-835d-7d35961b382c', 'A', 'Beta-blockers can mask the warning symptoms of hypoglycaemia (tremor, palpitations)', true, 0),
  ('92433ea1-132a-5297-8c7c-761d743f8e3f', '28e6fdf0-d4a7-5b06-835d-7d35961b382c', 'B', 'He must stop gliclazide', false, 1),
  ('5a45d92e-b9a1-59ac-b6c9-95a0621ddb55', '28e6fdf0-d4a7-5b06-835d-7d35961b382c', 'C', 'Beta-blockers cause hyperglycaemia only', false, 2),
  ('e11712fc-558c-5af6-93bf-1344ebbd4613', '28e6fdf0-d4a7-5b06-835d-7d35961b382c', 'D', 'Beta-blockers cure diabetes', false, 3),
  ('dbc6f475-bebb-5fd8-ab83-1203578659e5', '28e6fdf0-d4a7-5b06-835d-7d35961b382c', 'E', 'No interaction at all', false, 4);

-- Q748
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('941cb4fb-d9d3-5488-89f4-71c8981837aa', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000034', 'sba', 'A patient on a ward is prescribed ''10 units of insulin'' but the prescription is written as ''10U''. What is the main risk with this abbreviation?', 'Writing ''U'' or ''IU'' for units can be misread (10U as 100). Insulin errors are a major cause of harm, and an insulin overdose due to abbreviations is an NHS ''never event''. Always write ''units'' in full and use an insulin syringe or pen. Avoid trailing zeros (1.0 mg can be read as 10 mg) and use a leading zero (0.5 mg).', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v3')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = '941cb4fb-d9d3-5488-89f4-71c8981837aa';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('31c03ca0-c16c-5a63-bec5-a7ef558368cf', '941cb4fb-d9d3-5488-89f4-71c8981837aa', 'A', 'The patient will refuse it', false, 0),
  ('fdbfdbea-c900-589e-b83c-0b3aac059792', '941cb4fb-d9d3-5488-89f4-71c8981837aa', 'B', 'Underdosing only', false, 1),
  ('bad8d5e5-0b5f-5d06-a637-51a652b76034', '941cb4fb-d9d3-5488-89f4-71c8981837aa', 'C', 'No risk', false, 2),
  ('4bc41a03-46d4-5191-a365-9e6705af620f', '941cb4fb-d9d3-5488-89f4-71c8981837aa', 'D', '''U'' can be misread as a zero, causing a 10-fold overdose; write ''units'' in full', true, 3),
  ('950838d8-3ce4-51d7-a501-85559d696078', '941cb4fb-d9d3-5488-89f4-71c8981837aa', 'E', 'It increases cost', false, 4);

-- Q749
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('b21015d5-b0b6-5a19-bb2d-59e5f47b17eb', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000026', 'sba', 'A 40 year old woman has had dizziness for 2 years, with episodes of vertigo lasting hours, fluctuating hearing loss, tinnitus and aural fullness in her left ear. Which management is MOST appropriate for acute attacks?', 'Ménière''s disease (episodic vertigo lasting 20 minutes to hours, fluctuating sensorineural hearing loss, tinnitus and aural fullness) is managed with vestibular sedatives for acute attacks, plus betahistine for prevention (limited evidence) and lifestyle measures. Refer to ENT. Intratympanic steroids or gentamicin, and surgery, are specialist options. Inform the DVLA if vertigo is sudden and disabling.', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v3')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = 'b21015d5-b0b6-5a19-bb2d-59e5f47b17eb';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('789d74f0-74c2-526e-8e64-9e8a440ea4b6', 'b21015d5-b0b6-5a19-bb2d-59e5f47b17eb', 'A', 'Epley manoeuvre', false, 0),
  ('49581135-c366-57ad-80d5-63af26bf72f7', 'b21015d5-b0b6-5a19-bb2d-59e5f47b17eb', 'B', 'Oral antibiotics', false, 1),
  ('6d2b08c4-a53a-503c-8bd2-bf7c4510504e', 'b21015d5-b0b6-5a19-bb2d-59e5f47b17eb', 'C', 'Prochlorperazine (or an antihistamine such as cyclizine) for acute vertigo, with ENT referral', true, 2),
  ('b89834cc-60a7-567a-bd4b-8d57b43b2325', 'b21015d5-b0b6-5a19-bb2d-59e5f47b17eb', 'D', 'Long-term high-dose prednisolone', false, 3),
  ('35d004ba-cdbe-5727-b580-0f0b87c1ad06', 'b21015d5-b0b6-5a19-bb2d-59e5f47b17eb', 'E', 'Gentamicin injection as first-line', false, 4);

-- Q750
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('716d1e53-f726-5c99-9b0f-b64421ec058a', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000026', 'sba', 'A 3 year old boy has had a red, bulging tympanic membrane with fever. He was treated with antibiotics. Three months later, he still has a dull, retracted drum with an air-fluid level and reduced hearing on testing. What is the SINGLE most appropriate management?', 'Otitis media with effusion (glue ear) often follows acute otitis media and usually resolves within 3 months. NICE suggests 3 months of active observation, with audiology. Refer for grommets (or hearing aids) if hearing loss persists in both ears. Children with Down syndrome or cleft palate are referred earlier. Antibiotics, steroids and antihistamines are not recommended.', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v3')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = '716d1e53-f726-5c99-9b0f-b64421ec058a';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('e1846d24-6c45-5589-afb5-a80fe3498d49', '716d1e53-f726-5c99-9b0f-b64421ec058a', 'A', 'Oral steroids', false, 0),
  ('833ad21a-2d0a-5dcc-a3d8-39af830e221b', '716d1e53-f726-5c99-9b0f-b64421ec058a', 'B', 'Long-term antibiotics', false, 1),
  ('7cfaee4f-7067-5b51-ac96-30604a9efd88', '716d1e53-f726-5c99-9b0f-b64421ec058a', 'C', 'Active observation for 3 months (otitis media with effusion often resolves), with hearing test; refer if persistent', true, 2),
  ('4973f9df-3cf8-550b-8cb8-74acc109079a', '716d1e53-f726-5c99-9b0f-b64421ec058a', 'D', 'Antihistamines', false, 3),
  ('e013f8a1-21d3-5a98-b9f0-15c4f7f99378', '716d1e53-f726-5c99-9b0f-b64421ec058a', 'E', 'Immediate grommet insertion', false, 4);

-- Q751
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('a8f2b5ed-e3f1-5585-a9b4-8b9907f11daa', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000026', 'sba', 'A 25 year old woman has had a blocked, runny nose, sneezing and itchy eyes every summer for years. Antihistamines help only partly. What is the SINGLE most appropriate additional treatment?', 'Seasonal allergic rhinitis (hay fever) is treated with allergen avoidance, oral non-sedating antihistamines and regular intranasal corticosteroids (the most effective). Start them 2 weeks before the pollen season. Avoid prolonged nasal decongestants (rhinitis medicamentosa). Immunotherapy is considered for severe disease not controlled with drugs.', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v3')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = 'a8f2b5ed-e3f1-5585-a9b4-8b9907f11daa';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('fa49cedb-0ca2-5214-943d-bef29f3a4d38', 'a8f2b5ed-e3f1-5585-a9b4-8b9907f11daa', 'A', 'Surgery', false, 0),
  ('320dff4c-ae09-50f5-acb5-f5739d0c269b', 'a8f2b5ed-e3f1-5585-a9b4-8b9907f11daa', 'B', 'Antibiotics', false, 1),
  ('b8ff2359-da16-5996-8979-3c597d04a1fa', 'a8f2b5ed-e3f1-5585-a9b4-8b9907f11daa', 'C', 'Nasal decongestants for months', false, 2),
  ('ce07a055-2b96-5d89-87fa-3ba61720ecd0', 'a8f2b5ed-e3f1-5585-a9b4-8b9907f11daa', 'D', 'Long-term oral prednisolone', false, 3),
  ('870e76e6-89d1-5b62-a1eb-03d76100ef8e', 'a8f2b5ed-e3f1-5585-a9b4-8b9907f11daa', 'E', 'Intranasal corticosteroid spray (used regularly, started before the season)', true, 4);

-- Q752
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('4e1d1038-dc85-556b-aa0b-f3e236eb4074', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000026', 'sba', 'A 35 year old man has had a painful, swollen ear pinna after a rugby injury. The upper part of the pinna is swollen and fluctuant, obscuring its contours. What is the SINGLE most appropriate management?', 'An auricular haematoma separates the perichondrium from the cartilage, cutting off its blood supply. Without drainage, it causes cartilage necrosis and fibrosis (''cauliflower ear''). Drain promptly (needle aspiration or incision) and apply a pressure dressing to prevent reaccumulation. Review for re-collection and infection.', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v3')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = '4e1d1038-dc85-556b-aa0b-f3e236eb4074';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('bcaf870f-1f9e-5752-bb18-cfdfc74afa2a', '4e1d1038-dc85-556b-aa0b-f3e236eb4074', 'A', 'Prompt drainage of the auricular haematoma with a compressive dressing (to prevent cauliflower ear)', true, 0),
  ('a999eba7-d49a-548a-a0b4-d440ffc71d16', '4e1d1038-dc85-556b-aa0b-f3e236eb4074', 'B', 'Leave it to resolve', false, 1),
  ('c0c6dae7-0297-5922-91c7-7545bb7d9edd', '4e1d1038-dc85-556b-aa0b-f3e236eb4074', 'C', 'Ice and analgesia only', false, 2),
  ('8b464909-4c00-522a-ae42-290d846e6a3e', '4e1d1038-dc85-556b-aa0b-f3e236eb4074', 'D', 'Steroid injection', false, 3),
  ('58705eed-5414-5a78-bc5d-3595cd303505', '4e1d1038-dc85-556b-aa0b-f3e236eb4074', 'E', 'Oral antibiotics only', false, 4);

-- Q753
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('9c35cef0-b9ad-5ce7-b6c8-a03aaf2b79c0', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000026', 'sba', 'A 55 year old man has had a sore throat and difficulty swallowing for 6 weeks with pain going to his right ear. Examination of the ear is normal. He smokes and drinks heavily. What is the SINGLE most likely concern?', 'Referred ear pain (otalgia) with a normal ear examination, together with throat symptoms in a smoker who drinks heavily, suggests a cancer of the oropharynx, larynx or hypopharynx (referred via the glossopharyngeal or vagus nerve). Refer on the suspected cancer pathway. HPV-related oropharyngeal cancer is increasingly common in younger non-smokers.', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v3')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = '9c35cef0-b9ad-5ce7-b6c8-a03aaf2b79c0';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('f0191076-aa29-5bab-98fd-1216e26b9e18', '9c35cef0-b9ad-5ce7-b6c8-a03aaf2b79c0', 'A', 'Otitis externa', false, 0),
  ('a0b49d7e-eefb-5837-8ec0-1e7627946249', '9c35cef0-b9ad-5ce7-b6c8-a03aaf2b79c0', 'B', 'Temporomandibular joint dysfunction', false, 1),
  ('5a3fec6c-9072-5ebd-b29d-b1e07738c29d', '9c35cef0-b9ad-5ce7-b6c8-a03aaf2b79c0', 'C', 'Acute tonsillitis', false, 2),
  ('886c522a-767e-5ebf-af5b-dcd84180b437', '9c35cef0-b9ad-5ce7-b6c8-a03aaf2b79c0', 'D', 'Wax impaction', false, 3),
  ('6c82bc9d-67bf-5350-bd48-4252823c3083', '9c35cef0-b9ad-5ce7-b6c8-a03aaf2b79c0', 'E', 'Head and neck (e.g. oropharyngeal/hypopharyngeal) cancer with referred otalgia', true, 4);

-- Q754
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('d296e741-7021-5a33-8fb2-7874b52b4650', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000015', 'sba', 'A 70 year old woman has gradually blurred near and distance vision and glare from car headlights at night. Fundal reflex is reduced. What is the SINGLE most likely diagnosis?', 'Cataract causes painless gradual blurring, glare and halos, reduced contrast and sometimes a myopic shift (second sight). The red reflex is reduced. Surgery (phacoemulsification with lens implant) is offered when vision affects daily life. Risk factors include age, diabetes, smoking, steroids and UV exposure.', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v3')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = 'd296e741-7021-5a33-8fb2-7874b52b4650';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('0aec9fd3-344d-51f6-a7aa-b7e75aeebf16', 'd296e741-7021-5a33-8fb2-7874b52b4650', 'A', 'Retinal vein occlusion', false, 0),
  ('d6422d3a-3706-5350-a2fb-43331c286026', 'd296e741-7021-5a33-8fb2-7874b52b4650', 'B', 'Wet macular degeneration', false, 1),
  ('4651db65-f35f-5f04-98f3-e33cc740f032', 'd296e741-7021-5a33-8fb2-7874b52b4650', 'C', 'Diabetic retinopathy', false, 2),
  ('279585a1-7aee-505a-8cef-cea926caee0e', 'd296e741-7021-5a33-8fb2-7874b52b4650', 'D', 'Cataract', true, 3),
  ('bd52ce2c-3485-5c5e-a56c-7cf195faaf08', 'd296e741-7021-5a33-8fb2-7874b52b4650', 'E', 'Open-angle glaucoma', false, 4);

-- Q755
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('4b40b7ee-e362-5514-af55-ca722fcf0688', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000015', 'sba', 'A 35 year old woman with Graves'' disease has bulging eyes, gritty discomfort and double vision. She smokes. What is the MOST important modifiable risk factor for worsening of her eye disease?', 'Thyroid eye disease causes proptosis, lid retraction and lag, chemosis, diplopia and, in severe cases, optic neuropathy (reduced colour vision is a red flag). Smoking is the strongest modifiable risk factor. Radioiodine can worsen it. Treatment: lubricants, selenium for mild disease, IV steroids for active moderate-to-severe disease, and urgent decompression for optic neuropathy.', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v3')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = '4b40b7ee-e362-5514-af55-ca722fcf0688';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('4a753be3-7a68-5f96-8f06-46ea4d1031b7', '4b40b7ee-e362-5514-af55-ca722fcf0688', 'A', 'Caffeine', false, 0),
  ('06b5f91f-a7cc-59ae-a6e3-4a5b7ad9b74f', '4b40b7ee-e362-5514-af55-ca722fcf0688', 'B', 'Alcohol', false, 1),
  ('b3f29b86-d89c-5d17-8fee-33bf3bba4a50', '4b40b7ee-e362-5514-af55-ca722fcf0688', 'C', 'Screen time', false, 2),
  ('0914fe41-9884-5dd8-8e34-dd8593e2dd42', '4b40b7ee-e362-5514-af55-ca722fcf0688', 'D', 'Contact lens use', false, 3),
  ('e2837883-cbe0-5f8c-8b08-0a1a900642a9', '4b40b7ee-e362-5514-af55-ca722fcf0688', 'E', 'Smoking (stop smoking; also avoid radioiodine without steroid cover in active disease)', true, 4);

-- Q756
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('b44f5668-94f3-53b7-9e3c-ca6552aab5b2', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000015', 'sba', 'A 4 year old boy has an inward-turning left eye noticed by his parents for 3 months. Vision testing shows reduced acuity in that eye. What is the MAIN risk if this is not treated?', 'Squint (strabismus) in children can lead to amblyopia, as the brain suppresses the image from the deviated eye. Treatment is most effective in early childhood: correct refractive error with glasses, then occlusion (patching) or atropine penalisation of the good eye, and sometimes surgery. Any new squint needs referral, and retinoblastoma must be excluded (check red reflex).', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v3')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = 'b44f5668-94f3-53b7-9e3c-ca6552aab5b2';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('9fe2a588-4c54-5471-8df6-5889f740277b', 'b44f5668-94f3-53b7-9e3c-ca6552aab5b2', 'A', 'Cataract', false, 0),
  ('336a31a9-670a-51e5-beb6-afb4f1a4b3ed', 'b44f5668-94f3-53b7-9e3c-ca6552aab5b2', 'B', 'Corneal ulcer', false, 1),
  ('3d9f116c-17bb-5c47-b320-f93483c022c0', 'b44f5668-94f3-53b7-9e3c-ca6552aab5b2', 'C', 'Retinal detachment', false, 2),
  ('ac2109b6-670b-58f4-8663-2792b47aa735', 'b44f5668-94f3-53b7-9e3c-ca6552aab5b2', 'D', 'Amblyopia (permanent reduced vision in the squinting eye)', true, 3),
  ('cf8b3184-1e47-5247-aae7-42b5af201851', 'b44f5668-94f3-53b7-9e3c-ca6552aab5b2', 'E', 'Glaucoma', false, 4);

-- Q757
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('fc82e7b0-0e90-529c-b4fc-d19e287af63c', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000015', 'sba', 'A 25 year old man has had an itchy, red eye with a stringy discharge every spring. He has asthma and eczema. Examination shows giant papillae under the upper lid. What is the SINGLE most likely diagnosis?', 'Vernal keratoconjunctivitis is a severe allergic conjunctivitis in young atopic males, worse in spring, with giant cobblestone papillae on the upper tarsus and possible corneal shield ulcers. Treatment: mast cell stabilisers, antihistamines and specialist topical steroids or ciclosporin. Simple seasonal allergic conjunctivitis is managed with topical antihistamines.', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v3')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = 'fc82e7b0-0e90-529c-b4fc-d19e287af63c';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('24e35368-f2e4-5216-a704-af875915754c', 'fc82e7b0-0e90-529c-b4fc-d19e287af63c', 'A', 'Bacterial conjunctivitis', false, 0),
  ('baefb7a6-b267-5004-94cc-50b60df6e156', 'fc82e7b0-0e90-529c-b4fc-d19e287af63c', 'B', 'Viral conjunctivitis', false, 1),
  ('49b544e2-00fc-51b0-94db-3456a05b06ee', 'fc82e7b0-0e90-529c-b4fc-d19e287af63c', 'C', 'Vernal keratoconjunctivitis (allergic)', true, 2),
  ('fdab9b07-d73a-5047-aac5-c9eb4e5f0c0e', 'fc82e7b0-0e90-529c-b4fc-d19e287af63c', 'D', 'Anterior uveitis', false, 3),
  ('97d32a86-3707-5465-8ef7-c31831da8b92', 'fc82e7b0-0e90-529c-b4fc-d19e287af63c', 'E', 'Episcleritis', false, 4);

-- Q758
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('5cbca255-c3b8-5d7e-b0f6-545f29549535', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000018', 'sba', 'A 65 year old man has a surgical wound that is red, swollen and discharging pus 5 days after a laparotomy. He is febrile. What is the SINGLE most appropriate management?', 'Surgical site infection usually appears 5-7 days post-op. Management is opening and draining the collection, wound care, and antibiotics for cellulitis or systemic infection. Deep infection or collections need imaging. Risk reduction includes appropriate prophylactic antibiotics, avoiding shaving, normothermia and glucose control.', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v3')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = '5cbca255-c3b8-5d7e-b0f6-545f29549535';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('7f3e1fb5-9531-5bdc-9587-2449a0cd13ae', '5cbca255-c3b8-5d7e-b0f6-545f29549535', 'A', 'Reassure', false, 0),
  ('e9989471-c217-5e98-acdc-f7282a28ec77', '5cbca255-c3b8-5d7e-b0f6-545f29549535', 'B', 'Close the wound tighter', false, 1),
  ('838ebf57-42de-55c4-9f07-fb754d8c0760', '5cbca255-c3b8-5d7e-b0f6-545f29549535', 'C', 'Apply a dry dressing only and wait', false, 2),
  ('7d91dd6c-13bf-5c6d-9b19-b1d3522d8191', '5cbca255-c3b8-5d7e-b0f6-545f29549535', 'D', 'Open the wound to drain the pus, send swabs, and give antibiotics if there is spreading cellulitis or systemic features', true, 3),
  ('aa039a79-4abe-57f1-bc9f-79269d0753aa', '5cbca255-c3b8-5d7e-b0f6-545f29549535', 'E', 'Oral steroids', false, 4);

-- Q759
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('1d10dfad-19c9-54dc-91a5-fcbd3d6bb7e1', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000018', 'sba', 'A 72 year old man is 2 days after a hip replacement. He is confused, pulling at lines and believes nurses are poisoning him. Yesterday he was oriented. What is the SINGLE most appropriate first step?', 'Postoperative delirium is common in older people. Identify causes: hypoxia, infection, pain, retention, constipation, dehydration, electrolyte imbalance, alcohol withdrawal and drugs (opioids, anticholinergics). Non-drug measures: orientation, glasses and hearing aids, sleep and family. Use short-term low-dose haloperidol only if distressed or a risk to self or others.', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v3')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = '1d10dfad-19c9-54dc-91a5-fcbd3d6bb7e1';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('77c6a483-22bd-57a5-bcdb-a084b182ffb9', '1d10dfad-19c9-54dc-91a5-fcbd3d6bb7e1', 'A', 'Physically restrain him', false, 0),
  ('5aa56bac-52bc-5529-92be-ad5979bec7e4', '1d10dfad-19c9-54dc-91a5-fcbd3d6bb7e1', 'B', 'Prescribe haloperidol regularly', false, 1),
  ('29695b63-6bc8-5f36-a872-c08cdd4f9335', '1d10dfad-19c9-54dc-91a5-fcbd3d6bb7e1', 'C', 'Look for and treat underlying causes of delirium (pain, infection, hypoxia, urinary retention, constipation, drugs, electrolytes)', true, 2),
  ('40197d98-5954-5c45-9384-53dfff5ce141', '1d10dfad-19c9-54dc-91a5-fcbd3d6bb7e1', 'D', 'Refer to psychiatry immediately', false, 3),
  ('aeed1c72-892c-55ec-86a8-e42994641be8', '1d10dfad-19c9-54dc-91a5-fcbd3d6bb7e1', 'E', 'Start donepezil', false, 4);

-- Q760
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('f2133b0b-9990-5dfd-b642-8939d925b0f3', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000018', 'sba', 'A 55 year old woman is 4 hours after a thyroidectomy. She develops neck swelling, stridor and respiratory distress. What is the SINGLE most appropriate immediate action?', 'A neck haematoma after thyroidectomy can compress the airway. Remove skin clips or sutures and open the deeper layers at the bedside (SCOOP: skin exposure, cut sutures, open skin, open muscles, pack) to evacuate the clot, then take to theatre. Other complications: hypocalcaemia (hypoparathyroidism) and recurrent laryngeal nerve palsy.', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v3')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = 'f2133b0b-9990-5dfd-b642-8939d925b0f3';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('b846ccc8-9456-55ce-b5ff-1d04e6a34164', 'f2133b0b-9990-5dfd-b642-8939d925b0f3', 'A', 'Give nebulised salbutamol', false, 0),
  ('36631806-3b06-5958-a768-087e77bc84e6', 'f2133b0b-9990-5dfd-b642-8939d925b0f3', 'B', 'CT neck', false, 1),
  ('9bd8bbe8-45f7-59af-af1a-e05516140812', 'f2133b0b-9990-5dfd-b642-8939d925b0f3', 'C', 'IV calcium', false, 2),
  ('511d0851-a913-5f4e-8d0c-7efbd51664eb', 'f2133b0b-9990-5dfd-b642-8939d925b0f3', 'D', 'Wait for an anaesthetist', false, 3),
  ('6fcefb0e-1f78-56cf-8543-f9a37055f040', 'f2133b0b-9990-5dfd-b642-8939d925b0f3', 'E', 'Open the wound and sutures at the bedside to release the haematoma, then return to theatre', true, 4);

-- Q761
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('c98c58a3-8c96-54f0-bc95-da0c86f6912f', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000018', 'sba', 'A 62 year old woman has a fever of 38.2°C on day 1 after a laparoscopic cholecystectomy. Chest auscultation shows reduced air entry at both bases. What is the SINGLE most likely cause?', 'Early postoperative fever (day 0-2) is often due to atelectasis or the inflammatory response to surgery. Later causes: pneumonia (day 3-5), UTI, wound infection (day 5-7), leak or collection (day 5-10) and DVT/PE (day 7-14). Prevent atelectasis with good analgesia, physiotherapy and early mobilisation.', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v3')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = 'c98c58a3-8c96-54f0-bc95-da0c86f6912f';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('07148c8c-1b4b-52e6-b5e7-8255dc4eb335', 'c98c58a3-8c96-54f0-bc95-da0c86f6912f', 'A', 'Atelectasis (encourage chest physiotherapy, deep breathing and mobilisation)', true, 0),
  ('c35f304c-19e0-544f-88e9-3a84de109f59', 'c98c58a3-8c96-54f0-bc95-da0c86f6912f', 'B', 'Pulmonary embolism', false, 1),
  ('15558c3a-95ce-55d4-8147-028c75764253', 'c98c58a3-8c96-54f0-bc95-da0c86f6912f', 'C', 'Anastomotic leak', false, 2),
  ('65ea6e22-900d-5e8b-b3d5-d7fcf442c527', 'c98c58a3-8c96-54f0-bc95-da0c86f6912f', 'D', 'Urinary tract infection', false, 3),
  ('4ebf3ce9-23d0-5475-9e8a-eb867495a625', 'c98c58a3-8c96-54f0-bc95-da0c86f6912f', 'E', 'Wound infection', false, 4);

-- Q762
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('e0edbcac-0f04-56e3-9eff-f6ff30279d28', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000018', 'sba', 'A 45 year old woman had a laparoscopic gynaecological procedure. She has shoulder tip pain the next day, but her observations are normal and her abdomen is soft. What is the SINGLE most likely explanation?', 'After laparoscopy, residual CO2 under the diaphragm irritates the phrenic nerve, causing referred shoulder tip pain. It settles in 1-3 days with simple analgesia and mobilisation. Worsening pain, peritonism, fever or tachycardia should prompt review for visceral injury.', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v3')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = 'e0edbcac-0f04-56e3-9eff-f6ff30279d28';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('c878da82-6e43-5eb1-8b1c-e9adef0a7282', 'e0edbcac-0f04-56e3-9eff-f6ff30279d28', 'A', 'Bowel perforation', false, 0),
  ('dc06bb51-cdaa-5b84-a383-999943b18d85', 'e0edbcac-0f04-56e3-9eff-f6ff30279d28', 'B', 'Rotator cuff tear', false, 1),
  ('a0bb4b59-26a4-5062-bd4e-b0be300786cc', 'e0edbcac-0f04-56e3-9eff-f6ff30279d28', 'C', 'Referred pain from residual CO2 irritating the diaphragm', true, 2),
  ('ea51d163-1592-5c5a-bdec-6deb2f7c4341', 'e0edbcac-0f04-56e3-9eff-f6ff30279d28', 'D', 'Pulmonary embolism', false, 3),
  ('f4db41d9-c35a-5722-9c38-d671518ec650', 'e0edbcac-0f04-56e3-9eff-f6ff30279d28', 'E', 'Myocardial infarction', false, 4);

-- Q763
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('45300652-4cd7-5b88-b22a-7bd7b0dc63d2', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000025', 'sba', 'A 4 month old baby has failure to thrive, chronic diarrhoea, persistent oral candidiasis and severe Pneumocystis pneumonia. Lymphocyte count is very low. What is the SINGLE most likely diagnosis?', 'SCID presents in early infancy with severe recurrent infections (viral, fungal, opportunistic), failure to thrive and diarrhoea, and very low lymphocytes. Live vaccines (BCG, rotavirus) must be avoided and blood products irradiated. Treatment is haematopoietic stem cell transplant. SCID is now part of newborn screening in parts of the UK.', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v3')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = '45300652-4cd7-5b88-b22a-7bd7b0dc63d2';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('d7c6138a-2a30-55db-99bf-f08f3eff528b', '45300652-4cd7-5b88-b22a-7bd7b0dc63d2', 'A', 'Severe combined immunodeficiency (SCID)', true, 0),
  ('b8d01b15-3723-5d37-a788-ffabaef9d88c', '45300652-4cd7-5b88-b22a-7bd7b0dc63d2', 'B', 'Cystic fibrosis', false, 1),
  ('c5b4e75e-773f-56fa-be5a-1d82b38857c6', '45300652-4cd7-5b88-b22a-7bd7b0dc63d2', 'C', 'Coeliac disease', false, 2),
  ('0ff95de5-b36e-5afa-bfc5-c06a4300dbb7', '45300652-4cd7-5b88-b22a-7bd7b0dc63d2', 'D', 'DiGeorge syndrome (partial)', false, 3),
  ('538312ef-4d40-557c-9577-eaad58031555', '45300652-4cd7-5b88-b22a-7bd7b0dc63d2', 'E', 'Transient hypogammaglobulinaemia of infancy', false, 4);

-- Q764
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('7767821f-4aec-5ab7-abb3-63cd6a0db570', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000025', 'sba', 'A 25 year old man has had recurrent episodes of swelling of his lips, face and hands with abdominal pain. There is no urticaria and antihistamines and adrenaline do not help. His father has similar episodes. What is the SINGLE most likely diagnosis?', 'Hereditary angioedema (autosomal dominant) causes bradykinin-mediated swelling without urticaria, including abdominal attacks and potentially fatal laryngeal swelling. C4 is low, with low C1 inhibitor level or function. Acute attacks are treated with C1 inhibitor concentrate or icatibant. Antihistamines, steroids and adrenaline are ineffective.', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v3')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = '7767821f-4aec-5ab7-abb3-63cd6a0db570';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('28e5d3fb-b9eb-503e-ba21-0903d29da23e', '7767821f-4aec-5ab7-abb3-63cd6a0db570', 'A', 'ACE inhibitor angioedema', false, 0),
  ('5a002eca-f05e-54ac-ac7b-fdcc867e90d8', '7767821f-4aec-5ab7-abb3-63cd6a0db570', 'B', 'Anaphylaxis', false, 1),
  ('640c1d9a-51b0-57fb-8fc5-2b6e947870e1', '7767821f-4aec-5ab7-abb3-63cd6a0db570', 'C', 'Allergic angioedema', false, 2),
  ('6aa5601f-6e87-5967-8d32-7eba5e5d8e70', '7767821f-4aec-5ab7-abb3-63cd6a0db570', 'D', 'Chronic urticaria', false, 3),
  ('3f7deaf3-82fb-5bc2-ab4b-f4b7f1fa07ad', '7767821f-4aec-5ab7-abb3-63cd6a0db570', 'E', 'Hereditary angioedema (C1 esterase inhibitor deficiency)', true, 4);

-- Q765
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('f29822d9-1e51-58a0-824e-44888ea9dd6a', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000025', 'sba', 'A 35 year old man has recurrent sinusitis, pneumonia and bronchiectasis. Serum IgG, IgA and IgM are all low, and he does not respond to vaccines. What is the SINGLE most likely diagnosis?', 'CVID is the commonest symptomatic primary antibody deficiency in adults, with low IgG and IgA (and often IgM) and poor vaccine responses. It causes recurrent bacterial respiratory infections, bronchiectasis, autoimmunity and increased lymphoma risk. Treatment is lifelong immunoglobulin replacement.', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v3')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = 'f29822d9-1e51-58a0-824e-44888ea9dd6a';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('4d52f9cc-206b-5e9a-bcd0-880277eab88c', 'f29822d9-1e51-58a0-824e-44888ea9dd6a', 'A', 'Chronic granulomatous disease', false, 0),
  ('ea3311c0-643d-517a-9555-d5ab47feccee', 'f29822d9-1e51-58a0-824e-44888ea9dd6a', 'B', 'Selective IgA deficiency', false, 1),
  ('3684ccd5-c39e-544f-a1a3-6e616d21d839', 'f29822d9-1e51-58a0-824e-44888ea9dd6a', 'C', 'HIV', false, 2),
  ('0bef0e7b-e6dc-579d-8a3e-bff59771840f', 'f29822d9-1e51-58a0-824e-44888ea9dd6a', 'D', 'Common variable immunodeficiency', true, 3),
  ('632df6d4-8383-590b-aaba-f8ac5bc668a0', 'f29822d9-1e51-58a0-824e-44888ea9dd6a', 'E', 'Complement deficiency', false, 4);

-- Q766
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('3de53643-4f58-5a7b-9559-eaf5fb2eaea7', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000025', 'sba', 'A 20 year old woman has had urticaria on most days for 3 months, with no identifiable trigger. Examination is otherwise normal. What is the SINGLE most appropriate first-line treatment?', 'Chronic spontaneous urticaria (over 6 weeks) is usually not caused by allergy, and tests are rarely needed. First-line: a second-generation antihistamine, increased up to 4-fold if needed. Refer if not controlled (omalizumab or ciclosporin). Avoid NSAIDs and codeine, which can aggravate it.', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v3')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = '3de53643-4f58-5a7b-9559-eaf5fb2eaea7';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('b25a0c8b-b166-5b43-b22d-851f599f2e79', '3de53643-4f58-5a7b-9559-eaf5fb2eaea7', 'A', 'Oral steroids long-term', false, 0),
  ('5efafe53-e867-556c-b817-902140a12547', '3de53643-4f58-5a7b-9559-eaf5fb2eaea7', 'B', 'Allergy testing to all foods', false, 1),
  ('feba1db4-932b-57de-a10b-4d6cbc7a4a6e', '3de53643-4f58-5a7b-9559-eaf5fb2eaea7', 'C', 'A non-sedating antihistamine, increased up to 4 times the standard dose if needed', true, 2),
  ('1da75857-fcce-5c41-a884-1a5580c99277', '3de53643-4f58-5a7b-9559-eaf5fb2eaea7', 'D', 'Adrenaline auto-injector', false, 3),
  ('885610d6-6969-5a8f-8489-6342e08fc172', '3de53643-4f58-5a7b-9559-eaf5fb2eaea7', 'E', 'Exclusion diet', false, 4);

-- Q767
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('7747e7bc-87b7-540b-8933-64dcc16b3e2b', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000025', 'sba', 'A 40 year old woman develops sudden swelling of her tongue and lips. She started lisinopril 6 weeks ago. There is no urticaria. What is the SINGLE most appropriate management?', 'ACE inhibitor angioedema is bradykinin-mediated. It can occur at any time, even after years. It responds poorly to adrenaline and antihistamines. Stop ACE inhibitors permanently. ARBs carry a small risk of recurrence, so use with caution. Airway compromise needs urgent anaesthetic input.', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v3')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = '7747e7bc-87b7-540b-8933-64dcc16b3e2b';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('226d00a5-8737-5918-855a-8db2093235d6', '7747e7bc-87b7-540b-8933-64dcc16b3e2b', 'A', 'Restart it once the swelling settles', false, 0),
  ('4f247538-f13c-5014-a897-a274adf60240', '7747e7bc-87b7-540b-8933-64dcc16b3e2b', 'B', 'Switch to a different ACE inhibitor', false, 1),
  ('a5599b02-4b15-5c31-ad64-5dd73dd9a9a6', '7747e7bc-87b7-540b-8933-64dcc16b3e2b', 'C', 'Continue lisinopril and add an antihistamine', false, 2),
  ('9c911ac3-b284-5e5f-af05-837b09ab8089', '7747e7bc-87b7-540b-8933-64dcc16b3e2b', 'D', 'Reduce the dose', false, 3),
  ('2189ad43-19c5-506c-88fd-9f666ac7ae91', '7747e7bc-87b7-540b-8933-64dcc16b3e2b', 'E', 'Stop the ACE inhibitor permanently; secure the airway if needed (ARB only with caution)', true, 4);

-- Q768
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('8d0a7a83-512e-5c48-983e-969868045b62', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000025', 'sba', 'A 30 year old woman has had positive allergy tests with a sneezing reaction to cats. She has symptoms when visiting her sister''s house with a cat. What is the BEST explanation of ''sensitisation'' versus allergy?', 'Skin prick tests and specific IgE show sensitisation, which is common and does not always mean clinical allergy. Allergy needs a history of symptoms on exposure with matching sensitisation. Testing without a suggestive history causes false positives, unnecessary avoidance and anxiety. Food challenges are the gold standard.', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v3')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = '8d0a7a83-512e-5c48-983e-969868045b62';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('9088fd4b-928b-52f4-95cb-89465e1a3017', '8d0a7a83-512e-5c48-983e-969868045b62', 'A', 'A positive IgE test shows sensitisation, but allergy is only diagnosed when there are matching clinical symptoms on exposure', true, 0),
  ('abe70330-ba83-50bc-8d3f-6d705cfd4622', '8d0a7a83-512e-5c48-983e-969868045b62', 'B', 'A negative test always excludes allergy', false, 1),
  ('c26830cf-0d35-5444-93d3-fe059f14842b', '8d0a7a83-512e-5c48-983e-969868045b62', 'C', 'Sensitisation means anaphylaxis risk', false, 2),
  ('a2d854f2-db3b-543f-a75d-7282af48cb22', '8d0a7a83-512e-5c48-983e-969868045b62', 'D', 'Tests are not useful at all', false, 3),
  ('9655a2f8-963d-5f90-b1e0-bb395c7761e9', '8d0a7a83-512e-5c48-983e-969868045b62', 'E', 'A positive test always means allergy', false, 4);

-- Q769
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('9932face-a9f2-5f47-8400-f58ea14b3164', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000017', 'sba', 'A 65 year old woman with advanced pancreatic cancer is on 60 mg oral morphine sulfate MR twice daily. Her renal function is now poor (eGFR 20). She is drowsy with myoclonic jerks and confusion. What is the SINGLE most appropriate action?', 'Morphine metabolites (M3G, M6G) accumulate in renal impairment, causing drowsiness, myoclonus, hallucinations and respiratory depression. Reduce the dose or frequency and consider alternatives with less renal excretion (alfentanil, fentanyl, buprenorphine). Use naloxone only for life-threatening respiratory depression, titrated cautiously to avoid reversing analgesia.', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v3')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = '9932face-a9f2-5f47-8400-f58ea14b3164';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('26e96db6-4afa-53ea-82d2-298050c47531', '9932face-a9f2-5f47-8400-f58ea14b3164', 'A', 'Naloxone full dose', false, 0),
  ('1a5bcac8-0560-5a58-9248-ae1e5e0ff875', '9932face-a9f2-5f47-8400-f58ea14b3164', 'B', 'Opioid toxicity due to accumulation of morphine metabolites; reduce the dose and switch to an opioid safer in renal impairment (e.g. oxycodone at reduced dose, alfentanil, fentanyl)', true, 1),
  ('0d795c73-156c-522b-8192-fd58b9eab991', '9932face-a9f2-5f47-8400-f58ea14b3164', 'C', 'Add diazepam', false, 2),
  ('38e43d01-96f4-50b0-a0ca-04e40cdd8af9', '9932face-a9f2-5f47-8400-f58ea14b3164', 'D', 'Increase morphine for pain', false, 3),
  ('f0467e81-e140-559c-845f-fabc9540c925', '9932face-a9f2-5f47-8400-f58ea14b3164', 'E', 'Stop all analgesia', false, 4);

-- Q770
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('240caf9e-4487-592d-9da1-4b83138bc2ba', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000017', 'sba', 'A 60 year old man with lung cancer has severe constipation from opioids despite a stimulant laxative and a softener. What is the SINGLE most appropriate next treatment?', 'Opioid-induced constipation is anticipated: prescribe a stimulant laxative and softener with opioids. Avoid bulk-forming laxatives (can worsen obstruction). If refractory, peripherally acting opioid antagonists (naloxegol, methylnaltrexone, naldemedine) do not reduce central analgesia. Exclude bowel obstruction and hypercalcaemia.', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v3')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = '240caf9e-4487-592d-9da1-4b83138bc2ba';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('7746b82e-2e62-5c15-96ed-9e6330a7f330', '240caf9e-4487-592d-9da1-4b83138bc2ba', 'A', 'IV fluids only', false, 0),
  ('0bbbb764-e160-57c6-83c9-d507740dba27', '240caf9e-4487-592d-9da1-4b83138bc2ba', 'B', 'Stop opioids completely', false, 1),
  ('807b10bb-e3ce-54e6-b8b8-fd4d1431d407', '240caf9e-4487-592d-9da1-4b83138bc2ba', 'C', 'Bulk-forming laxative', false, 2),
  ('e88deeeb-c18a-54f0-b173-497d7c20ba57', '240caf9e-4487-592d-9da1-4b83138bc2ba', 'D', 'A peripherally acting mu-opioid receptor antagonist (e.g. naloxegol or methylnaltrexone)', true, 3),
  ('302bb5df-03e7-5252-8da0-fea7cb933489', '240caf9e-4487-592d-9da1-4b83138bc2ba', 'E', 'Loperamide', false, 4);

-- Q771
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('5f3bb39f-e765-58f2-bdd9-4858f3c91969', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000029', 'sba', 'A 85 year old man has incontinence of urine and faeces with hard stools on rectal examination. He is constipated and has overflow. What is the SINGLE most appropriate management?', 'In older people, faecal impaction commonly causes overflow diarrhoea, urinary retention or incontinence, and delirium. Treat by disimpaction (high-dose macrogol, enemas), then maintain with regular laxatives, fluids, mobility and a toilet routine. Review constipating drugs.', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v3')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = '5f3bb39f-e765-58f2-bdd9-4858f3c91969';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('38ed3318-09d7-5a22-ad3f-3a082a32a0c3', '5f3bb39f-e765-58f2-bdd9-4858f3c91969', 'A', 'Antimuscarinic for the bladder', false, 0),
  ('43bfea0b-2b37-5d81-b297-a61116530bf7', '5f3bb39f-e765-58f2-bdd9-4858f3c91969', 'B', 'Admit to a care home', false, 1),
  ('c4f71ff2-2066-5eea-b7ee-126969c37193', '5f3bb39f-e765-58f2-bdd9-4858f3c91969', 'C', 'Treat the faecal impaction (enemas or macrogol disimpaction), then regular laxatives', true, 2),
  ('b99db46a-78bc-5312-8fac-9b62bf139db3', '5f3bb39f-e765-58f2-bdd9-4858f3c91969', 'D', 'Long-term catheter', false, 3),
  ('414c811c-17eb-5516-bfb3-d023a9c35e75', '5f3bb39f-e765-58f2-bdd9-4858f3c91969', 'E', 'Loperamide', false, 4);

-- Q772
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('43df5baf-f4a6-56ea-bb0e-99f58b6dbfb3', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000029', 'sba', 'An 80 year old woman''s family say she has lost weight, eats very little and has become weak. Her muscles are wasted and she has slowed walking speed and low grip strength. What is the BEST term for her loss of muscle mass and strength?', 'Sarcopenia is progressive loss of skeletal muscle mass and strength with age, linked to falls, fractures, frailty and disability. Diagnosed with grip strength, gait speed and muscle mass. Management: resistance exercise and adequate protein and vitamin D intake. Frailty is a broader syndrome of reduced reserve.', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v3')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = '43df5baf-f4a6-56ea-bb0e-99f58b6dbfb3';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('411b65ea-c6e4-5efb-84fe-3d8188f32299', '43df5baf-f4a6-56ea-bb0e-99f58b6dbfb3', 'A', 'Cachexia only', false, 0),
  ('67814122-93f0-5332-be53-bab55dca0d28', '43df5baf-f4a6-56ea-bb0e-99f58b6dbfb3', 'B', 'Osteoporosis', false, 1),
  ('064a7c45-07a8-5778-806a-f356264bb45e', '43df5baf-f4a6-56ea-bb0e-99f58b6dbfb3', 'C', 'Myopathy', false, 2),
  ('58ba1c7d-7aee-557a-8651-145780df4e6e', '43df5baf-f4a6-56ea-bb0e-99f58b6dbfb3', 'D', 'Frailty', false, 3),
  ('43529211-84bb-54cc-aaa5-c9d5339399fe', '43df5baf-f4a6-56ea-bb0e-99f58b6dbfb3', 'E', 'Sarcopenia', true, 4);

-- Q773
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('8319aaca-bbc1-5fa2-a511-0a9de81d0d9e', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000029', 'sba', 'An 88 year old woman has dementia and lives in a care home. She has had poor oral intake and recurrent aspiration pneumonia. Her family ask about a feeding tube (PEG). What is the evidence regarding PEG in advanced dementia?', 'In advanced dementia, tube feeding has not been shown to prolong life, prevent aspiration pneumonia or improve comfort, and it carries risks. NICE recommends not routinely using tube feeding. Encourage oral intake, with careful hand feeding, texture modification, and best-interests decisions involving family.', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v3')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = '8319aaca-bbc1-5fa2-a511-0a9de81d0d9e';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('553d9a95-40f1-5113-8551-bfe7cca6826f', '8319aaca-bbc1-5fa2-a511-0a9de81d0d9e', 'A', 'PEG feeding does not improve survival, aspiration or quality of life in advanced dementia; careful hand feeding is preferred', true, 0),
  ('4e4f96e8-0ddc-5356-b4a6-4718d5ca3477', '8319aaca-bbc1-5fa2-a511-0a9de81d0d9e', 'B', 'PEG improves cognition', false, 1),
  ('3dc387f8-35c0-5be4-89c4-d24137b67954', '8319aaca-bbc1-5fa2-a511-0a9de81d0d9e', 'C', 'PEG prevents aspiration completely', false, 2),
  ('d9c25969-6b15-5707-8c49-85f58bb85148', '8319aaca-bbc1-5fa2-a511-0a9de81d0d9e', 'D', 'PEG always extends life', false, 3),
  ('2af47c5c-fb74-5e87-8b76-6358d6561042', '8319aaca-bbc1-5fa2-a511-0a9de81d0d9e', 'E', 'PEG is mandatory', false, 4);

-- Q774
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('1a9ea121-0984-539e-80b3-23f82d5f9a1a', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000029', 'sba', 'A 79 year old man has been prescribed 12 medicines. He takes oxybutynin, amitriptyline and chlorphenamine. He has new memory problems. What is the MOST important concern?', 'Drugs with anticholinergic effects (antimuscarinics for bladder, tricyclics, sedating antihistamines, some antipsychotics) add up to a cumulative ''anticholinergic burden'' associated with confusion, falls, constipation, urinary retention and dementia risk. Use tools such as the ACB scale during structured medication review and deprescribe.', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v3')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = '1a9ea121-0984-539e-80b3-23f82d5f9a1a';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('bb398d98-52bc-5f9f-9264-373ae7a9b995', '1a9ea121-0984-539e-80b3-23f82d5f9a1a', 'A', 'Only kidney damage', false, 0),
  ('c226029d-12ac-5491-a8a5-b2fa100ef143', '1a9ea121-0984-539e-80b3-23f82d5f9a1a', 'B', 'There is no risk', false, 1),
  ('029d91b0-4db6-558d-b20e-d3db651393e3', '1a9ea121-0984-539e-80b3-23f82d5f9a1a', 'C', 'Weight gain', false, 2),
  ('8c8c24b5-b5af-5fc2-9d13-a4b4939bf11a', '1a9ea121-0984-539e-80b3-23f82d5f9a1a', 'D', 'These drugs improve memory', false, 3),
  ('9a8b2d68-77f5-5257-b9f6-2c580778bab0', '1a9ea121-0984-539e-80b3-23f82d5f9a1a', 'E', 'High anticholinergic burden contributing to cognitive impairment, falls and delirium', true, 4);

-- Q775
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('e93c98f4-f398-5cfa-b430-56568a4d5dbe', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000020', 'sba', 'A 22 year old man has painful penile ulcers and tender inguinal lymph nodes. He had unprotected sex 5 days ago. Which test is MOST appropriate?', 'Painful genital ulcers are most commonly due to genital herpes (HSV-1 or 2). Swab the ulcer for HSV PCR. Also test for syphilis (serology and treponemal PCR), HIV and other STIs. Treat the first episode with oral aciclovir or valaciclovir. Syphilis chancre is classically painless.', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v3')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = 'e93c98f4-f398-5cfa-b430-56568a4d5dbe';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('4efb37b7-c762-5683-9d4e-7b4d4732771d', 'e93c98f4-f398-5cfa-b430-56568a4d5dbe', 'A', 'Blood culture', false, 0),
  ('4c0fbef9-986b-52c5-87ce-79e117fedbe3', 'e93c98f4-f398-5cfa-b430-56568a4d5dbe', 'B', 'Gram stain of urine', false, 1),
  ('f6c44124-d6b6-5202-93fb-3728d98a355d', 'e93c98f4-f398-5cfa-b430-56568a4d5dbe', 'C', 'PCR swab of the ulcer for herpes simplex virus (and syphilis testing)', true, 2),
  ('c66cbe73-f706-5d67-8a62-b4514fdd642c', 'e93c98f4-f398-5cfa-b430-56568a4d5dbe', 'D', 'Chest X-ray', false, 3),
  ('5586feff-bfea-52ff-ab7c-db1d8c99b7b8', 'e93c98f4-f398-5cfa-b430-56568a4d5dbe', 'E', 'Urine culture', false, 4);

-- Q776
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('2397d9f5-9fce-5756-b053-6f306c2c0adf', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000020', 'sba', 'A 25 year old man was diagnosed with chlamydia. What is the SINGLE most important part of management beyond treating him?', 'Partner notification is essential to prevent reinfection and onward spread. Contacts in the previous 6 months (or since the last partner if longer) should be tested and treated. Treat with doxycycline 100 mg twice daily for 7 days. Avoid sex until treatment of both is complete. Offer a full STI screen.', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v3')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = '2397d9f5-9fce-5756-b053-6f306c2c0adf';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('98c3d90c-8bc0-5fe7-838c-c9713d2d51eb', '2397d9f5-9fce-5756-b053-6f306c2c0adf', 'A', 'No further action', false, 0),
  ('fc82b853-00c1-564f-8f98-1c849f04e26e', '2397d9f5-9fce-5756-b053-6f306c2c0adf', 'B', 'Ultrasound of the testes', false, 1),
  ('57fc6ed7-9968-59ee-9b9c-90397fda31dd', '2397d9f5-9fce-5756-b053-6f306c2c0adf', 'C', 'Prescribe lifelong antibiotics', false, 2),
  ('775c9806-f95c-5dbb-b2e1-f5731836d98a', '2397d9f5-9fce-5756-b053-6f306c2c0adf', 'D', 'Partner notification and testing/treatment of his sexual contacts', true, 3),
  ('2f7a43b9-47ec-5715-a4fe-2ee3c2854e54', '2397d9f5-9fce-5756-b053-6f306c2c0adf', 'E', 'Repeat test the next day', false, 4);

-- Q777
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('80a564ae-f77a-5d6c-9f94-20af10eb79e6', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000020', 'sba', 'A 19 year old woman has had a positive gonorrhoea test. What is the SINGLE most appropriate treatment in the UK?', 'BASHH guidance: treat uncomplicated gonorrhoea with ceftriaxone 1 g IM (or ciprofloxacin if known sensitive). Culture before treatment for antimicrobial sensitivity. Test of cure is recommended. Partner notification is needed. Rising antibiotic resistance is a concern.', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v3')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = '80a564ae-f77a-5d6c-9f94-20af10eb79e6';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('eebccc9d-25c0-59f4-bb56-0bb76b45b507', '80a564ae-f77a-5d6c-9f94-20af10eb79e6', 'A', 'Oral fluconazole', false, 0),
  ('48e4d751-418e-53bd-9135-d45d86db4afb', '80a564ae-f77a-5d6c-9f94-20af10eb79e6', 'B', 'Oral amoxicillin', false, 1),
  ('b847d795-a0a7-587f-b5b1-af42e63ea504', '80a564ae-f77a-5d6c-9f94-20af10eb79e6', 'C', 'Ceftriaxone 1 g IM single dose (if sensitivity unknown)', true, 2),
  ('271b40ce-1332-5224-92c8-14cb38c7c562', '80a564ae-f77a-5d6c-9f94-20af10eb79e6', 'D', 'Oral doxycycline only', false, 3),
  ('36354f51-f89f-53aa-baaf-1c30c0517447', '80a564ae-f77a-5d6c-9f94-20af10eb79e6', 'E', 'Oral metronidazole', false, 4);

-- Q778
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('e5a58fdf-e4a3-50bb-8f0e-011c9f99c0d9', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000020', 'sba', 'A 24 year old man has asked for PrEP (pre-exposure prophylaxis) for HIV. What is needed before starting?', 'PrEP (tenofovir disoproxil with emtricitabine) is free in sexual health clinics in England. Before starting: a negative HIV test (4th-generation), renal function (tenofovir can affect kidneys), hepatitis B status (stopping can cause a flare) and STI screen. Review every 3 months with HIV and STI tests.', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v3')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = 'e5a58fdf-e4a3-50bb-8f0e-011c9f99c0d9';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('c9ded8a2-c15d-572a-9081-60be724d5559', 'e5a58fdf-e4a3-50bb-8f0e-011c9f99c0d9', 'A', 'HIV test (to confirm negative), renal function, hepatitis B status and STI screen', true, 0),
  ('cc2f42c7-3b4f-56c5-ace5-f90da768f480', 'e5a58fdf-e4a3-50bb-8f0e-011c9f99c0d9', 'B', 'Chest X-ray', false, 1),
  ('65b0154a-fa7e-5323-bc35-0b31a73e46af', 'e5a58fdf-e4a3-50bb-8f0e-011c9f99c0d9', 'C', 'No tests needed', false, 2),
  ('fc6fbfff-14e9-5f66-87b4-742acd7bf722', 'e5a58fdf-e4a3-50bb-8f0e-011c9f99c0d9', 'D', 'Liver biopsy', false, 3),
  ('79561b96-ba0f-51d1-bbfe-138d54850500', 'e5a58fdf-e4a3-50bb-8f0e-011c9f99c0d9', 'E', 'Only a pregnancy test', false, 4);

-- Q779
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('9d8473fc-545b-59f3-aa94-d318ed1fb9d0', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000021', 'sba', 'A 6 month old baby has unusual episodes of sudden flexion of the trunk and arms in clusters on waking, with developmental regression. EEG shows hypsarrhythmia. What is the SINGLE most likely diagnosis?', 'Infantile spasms usually start at 3-8 months with clusters of flexor (salaam) spasms, developmental regression and hypsarrhythmia on EEG. Causes include tuberous sclerosis. It is an emergency needing urgent referral. Treatment is prednisolone or ACTH, or vigabatrin (first-line in tuberous sclerosis).', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v3')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = '9d8473fc-545b-59f3-aa94-d318ed1fb9d0';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('572122ea-1318-5be8-8be7-370981a431e1', '9d8473fc-545b-59f3-aa94-d318ed1fb9d0', 'A', 'Febrile seizures', false, 0),
  ('53289d3f-f0b2-54dd-864b-488599a7ba52', '9d8473fc-545b-59f3-aa94-d318ed1fb9d0', 'B', 'Reflux', false, 1),
  ('4a7a6570-23b1-502d-b756-586a9a7ddfc5', '9d8473fc-545b-59f3-aa94-d318ed1fb9d0', 'C', 'Colic', false, 2),
  ('c885c434-6724-59c3-97cb-f7e77de06b56', '9d8473fc-545b-59f3-aa94-d318ed1fb9d0', 'D', 'Infantile spasms (West syndrome)', true, 3),
  ('0bcecde4-d811-54a7-aa30-ffba438acac8', '9d8473fc-545b-59f3-aa94-d318ed1fb9d0', 'E', 'Benign sleep myoclonus', false, 4);

-- Q780
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('38f3442e-c649-5433-845f-b34037bacc49', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000021', 'sba', 'A 9 year old boy has had brief seizures at night with twitching of one side of the face and drooling, sometimes becoming generalised. EEG shows centrotemporal spikes. Development is normal. What is the SINGLE most likely diagnosis?', 'This is the commonest childhood epilepsy syndrome. Focal seizures in sleep involving the face, with drooling and speech arrest, and centrotemporal spikes on EEG. The prognosis is excellent, with remission by puberty. Treatment is often not needed if seizures are infrequent.', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v3')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = '38f3442e-c649-5433-845f-b34037bacc49';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('abdcf997-372c-5c69-a11e-02921b99d1e8', '38f3442e-c649-5433-845f-b34037bacc49', 'A', 'Brain tumour', false, 0),
  ('8d69a068-6b03-58c1-b654-28ed1a690476', '38f3442e-c649-5433-845f-b34037bacc49', 'B', 'Self-limited epilepsy with centrotemporal spikes (benign rolandic epilepsy)', true, 1),
  ('6a07397c-6f99-5404-a451-dc3dfdca4ead', '38f3442e-c649-5433-845f-b34037bacc49', 'C', 'Absence epilepsy', false, 2),
  ('77ae3cd5-b592-5518-8a20-965ecf67155f', '38f3442e-c649-5433-845f-b34037bacc49', 'D', 'Night terrors', false, 3),
  ('73b775ae-2faa-518b-bb5d-c40311410d9e', '38f3442e-c649-5433-845f-b34037bacc49', 'E', 'Juvenile myoclonic epilepsy', false, 4);

-- Q781
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('c5d9225c-8383-5f0a-bdda-9dc1cacc02bf', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000021', 'sba', 'A 4 year old boy has bilateral swollen eyelids, generalised oedema and frothy urine. Urine dip shows protein 4+. Albumin is 15 g/L. What is the SINGLE most likely diagnosis and first-line treatment?', 'Nephrotic syndrome (proteinuria, hypoalbuminaemia, oedema) in children is usually due to minimal change disease, which responds to steroids. Complications include infection (pneumococcal peritonitis), thrombosis, hypovolaemia and hyperlipidaemia. Relapses are common. Steroid-resistant cases need biopsy.', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v3')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = 'c5d9225c-8383-5f0a-bdda-9dc1cacc02bf';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('b219117b-3ce8-5508-8824-9cacd07c1696', 'c5d9225c-8383-5f0a-bdda-9dc1cacc02bf', 'A', 'Haemolytic uraemic syndrome; dialysis', false, 0),
  ('70c2a8f7-472d-5a88-b9aa-87da6b298ba0', 'c5d9225c-8383-5f0a-bdda-9dc1cacc02bf', 'B', 'Minimal change nephrotic syndrome; oral prednisolone', true, 1),
  ('542b5ea4-469f-5010-b02f-9df5cadf8745', 'c5d9225c-8383-5f0a-bdda-9dc1cacc02bf', 'C', 'IgA nephropathy; ACE inhibitor', false, 2),
  ('205236ac-9404-5eef-a7e4-e2410618406e', 'c5d9225c-8383-5f0a-bdda-9dc1cacc02bf', 'D', 'Allergy; antihistamines', false, 3),
  ('fbf04e17-0110-56f0-a4ea-5e8dd27b2df0', 'c5d9225c-8383-5f0a-bdda-9dc1cacc02bf', 'E', 'Post-streptococcal glomerulonephritis; antibiotics', false, 4);

-- Q782
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('b259127a-828b-5a53-b95a-f37a518e2c32', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000021', 'sba', 'A 2 year old child has a fever for 6 days, conjunctival injection without discharge, cracked red lips, strawberry tongue, a rash, swollen hands and feet and cervical lymphadenopathy. What is the MOST important complication to look for?', 'Kawasaki disease: fever for 5 days or more plus 4 of 5 of conjunctivitis, oral changes, rash, extremity changes and cervical lymphadenopathy. Treat with IVIG and high-dose aspirin (an exception to avoiding aspirin in children). Echocardiography is needed to detect coronary aneurysms.', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v3')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = 'b259127a-828b-5a53-b95a-f37a518e2c32';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('66246f18-c021-592b-b55c-e72fa86d0caa', 'b259127a-828b-5a53-b95a-f37a518e2c32', 'A', 'Renal failure', false, 0),
  ('ae2b304b-783e-5c44-bf92-d084a92f5034', 'b259127a-828b-5a53-b95a-f37a518e2c32', 'B', 'Rheumatic heart disease', false, 1),
  ('75957fab-9114-5daf-9f13-dcc0f5294a43', 'b259127a-828b-5a53-b95a-f37a518e2c32', 'C', 'Hearing loss', false, 2),
  ('f3adc99f-3a4a-53f5-8ee2-26ec7ed04834', 'b259127a-828b-5a53-b95a-f37a518e2c32', 'D', 'Encephalitis', false, 3),
  ('49cc4612-00f6-5861-acd7-850fbd749ebb', 'b259127a-828b-5a53-b95a-f37a518e2c32', 'E', 'Coronary artery aneurysms (Kawasaki disease); echocardiogram, IV immunoglobulin and aspirin', true, 4);

-- Q783
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('3b783ad7-fdb5-5847-aa38-b290c3739eac', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000012', 'sba', 'A 65 year old man has rough, scaly, gritty patches on his bald scalp and forearms. He worked outdoors for decades. What is the SINGLE most likely diagnosis and first-line management?', 'Actinic (solar) keratoses are premalignant lesions on sun-damaged skin, which can progress to SCC. Treatment options include sun protection, topical 5-FU, imiquimod, diclofenac gel, cryotherapy and photodynamic therapy. Tender, thick, bleeding or rapidly growing lesions should be reviewed for SCC.', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v3')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = '3b783ad7-fdb5-5847-aa38-b290c3739eac';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('ba996fbd-e59a-5ba9-b838-a5d8bf1419ab', '3b783ad7-fdb5-5847-aa38-b290c3739eac', 'A', 'Eczema; emollient', false, 0),
  ('97ea6a92-c86d-5d66-b3e9-45c36945e6bf', '3b783ad7-fdb5-5847-aa38-b290c3739eac', 'B', 'Actinic keratoses; sun protection plus topical 5-fluorouracil, imiquimod or cryotherapy', true, 1),
  ('927f8ff5-14b3-5cbd-a406-55db18ea1e95', '3b783ad7-fdb5-5847-aa38-b290c3739eac', 'C', 'Melanoma; urgent excision', false, 2),
  ('e2cb1295-5636-5316-afe1-70fe161df095', '3b783ad7-fdb5-5847-aa38-b290c3739eac', 'D', 'Psoriasis; topical steroid', false, 3),
  ('b81ba11e-6b54-5b35-8b13-ec305e9cac2b', '3b783ad7-fdb5-5847-aa38-b290c3739eac', 'E', 'Fungal infection; antifungal', false, 4);

-- Q784
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('01ff47b3-3060-570c-9cf4-f1ec87289d21', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000013', 'sba', 'A doctor notices that a colleague often smells of alcohol on morning ward rounds and recently made a prescribing error. What is the SINGLE most appropriate action?', 'GMC Good Medical Practice: doctors must act promptly if they believe a colleague''s health or conduct is putting patients at risk. Escalate through local clinical governance (senior colleague or clinical director). If concerns are not addressed, or patients are at immediate risk, the GMC can be informed. Support the colleague through occupational health.', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v3')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = '01ff47b3-3060-570c-9cf4-f1ec87289d21';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('381fd0e8-8f3e-517a-9e64-900088d0226c', '01ff47b3-3060-570c-9cf4-f1ec87289d21', 'A', 'Raise the concern with a senior (e.g. the clinical supervisor or clinical director) to protect patients and support the colleague', true, 0),
  ('09c5380b-8e87-5cbf-afc0-dfb2c581cc23', '01ff47b3-3060-570c-9cf4-f1ec87289d21', 'B', 'Confront them publicly on the ward', false, 1),
  ('a4538315-be10-537c-afd6-b3c59b167ff0', '01ff47b3-3060-570c-9cf4-f1ec87289d21', 'C', 'Ignore it as it is not your business', false, 2),
  ('b0eeabf7-f4dd-575d-9d73-d215cb132365', '01ff47b3-3060-570c-9cf4-f1ec87289d21', 'D', 'Report them to the police', false, 3),
  ('11b0bd34-dfff-5a3d-8f1e-5d35c741911a', '01ff47b3-3060-570c-9cf4-f1ec87289d21', 'E', 'Post about it on social media', false, 4);

-- Q785
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('6addcbdb-bb9b-5b83-af0e-366b9acb2acf', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000013', 'sba', 'A 16 year old girl attends alone and asks for contraception. She has a 17 year old boyfriend. She does not want her parents told. She understands the advice and is likely to have sex anyway. What is the SINGLE most appropriate action?', 'Under the Fraser guidelines, contraception can be provided to under-16s without parental consent if they understand the advice, cannot be persuaded to tell their parents, are likely to have sex anyway, would suffer without contraception, and it is in their best interests. At 16, she can consent as an adult under the Family Law Reform Act. Consider safeguarding risks (age gaps, exploitation).', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v3')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = '6addcbdb-bb9b-5b83-af0e-366b9acb2acf';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('9372daa3-9f46-5dbd-8981-d8468c27b353', '6addcbdb-bb9b-5b83-af0e-366b9acb2acf', 'A', 'Refuse without parental consent', false, 0),
  ('1c641dbe-0124-5f4c-8852-c375d79d401f', '6addcbdb-bb9b-5b83-af0e-366b9acb2acf', 'B', 'Delay until she is 18', false, 1),
  ('488fdbbd-9038-5de1-aef1-3d0554447f65', '6addcbdb-bb9b-5b83-af0e-366b9acb2acf', 'C', 'Inform her parents', false, 2),
  ('33d6c59f-bdf8-5c48-b708-ed6518b89e47', '6addcbdb-bb9b-5b83-af0e-366b9acb2acf', 'D', 'Refer to social services automatically', false, 3),
  ('5176cea2-b2ee-5739-acdf-aa65ae228e59', '6addcbdb-bb9b-5b83-af0e-366b9acb2acf', 'E', 'Provide contraception after assessing her competence using the Fraser guidelines, and encourage her to involve her parents', true, 4);

-- Q786
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('4a56ca61-2558-5de8-9ec3-69e612cbe0c9', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000013', 'sba', 'A patient asks to see their medical records. What is the CORRECT advice about their legal right of access?', 'Under UK GDPR and the Data Protection Act 2018, patients can request their records through a subject access request, usually without charge and within one month. Information can be withheld only if it would cause serious harm to the patient or others, or reveals third-party information without consent.', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v3')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = '4a56ca61-2558-5de8-9ec3-69e612cbe0c9';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('32716c83-53b2-5f80-9139-38b446b87805', '4a56ca61-2558-5de8-9ec3-69e612cbe0c9', 'A', 'Patients have the right to access their records under UK GDPR / Data Protection Act 2018 (a subject access request), usually free and within one month', true, 0),
  ('c5b10c31-586b-5535-a763-a88e22e556f7', '4a56ca61-2558-5de8-9ec3-69e612cbe0c9', 'B', 'Patients have no right to see their records', false, 1),
  ('b5957e1c-aa8c-56a8-a508-a4f9266d05f1', '4a56ca61-2558-5de8-9ec3-69e612cbe0c9', 'C', 'Only solicitors can request records', false, 2),
  ('43975bce-6734-50eb-a832-2195bd60738f', '4a56ca61-2558-5de8-9ec3-69e612cbe0c9', 'D', 'They must pay a large fee', false, 3),
  ('d26badc9-2b6e-5ee0-9db1-05432e765e25', '4a56ca61-2558-5de8-9ec3-69e612cbe0c9', 'E', 'Access requires a court order', false, 4);

-- Q787
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('07d6d067-3833-572f-9089-56bbd21f9fef', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000013', 'sba', 'A 40 year old man with epilepsy has had a seizure 2 months ago and continues to drive. He refuses to inform the DVLA. What is the CORRECT action?', 'GMC guidance: the patient is responsible for telling the DVLA. If they refuse and continue driving, try to persuade them. If they still drive, disclose the minimum necessary information to the DVLA medical adviser, telling the patient before doing so and confirming in writing afterwards.', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v3')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = '07d6d067-3833-572f-9089-56bbd21f9fef';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('b6072c36-9aed-549e-a3a1-528594452639', '07d6d067-3833-572f-9089-56bbd21f9fef', 'A', 'Inform his employer', false, 0),
  ('2b2fbbaf-cc2c-5be1-a3e3-ae35394eec5d', '07d6d067-3833-572f-9089-56bbd21f9fef', 'B', 'Do nothing as it is his choice', false, 1),
  ('5d6779bd-69d0-5b97-8506-5147f2296ba2', '07d6d067-3833-572f-9089-56bbd21f9fef', 'C', 'Explain he must stop driving and inform the DVLA; if he continues, tell him you will inform the DVLA, then do so and inform him in writing', true, 2),
  ('60a5a955-0676-5850-b6ee-53a06eb08012', '07d6d067-3833-572f-9089-56bbd21f9fef', 'D', 'Inform the police immediately', false, 3),
  ('29f2ce75-3a9c-5bce-8f23-4dea3c9dd791', '07d6d067-3833-572f-9089-56bbd21f9fef', 'E', 'Keep it confidential in all circumstances', false, 4);

-- Q788
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('d354cd78-b0ac-5acb-a46c-38dd37df7435', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000013', 'sba', 'A 45 year old man was injured in a road traffic collision. The police ask the ED doctor for his blood alcohol level and personal details. He has not consented. What is the CORRECT approach?', 'Confidentiality can be breached only with consent, if required by law (such as a court order or the Road Traffic Act for specific information), or in the public interest (serious crime, risk of serious harm). Disclose the minimum necessary. A police request alone without a legal basis does not require disclosure. Blood sampling for police purposes has specific rules.', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v3')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = 'd354cd78-b0ac-5acb-a46c-38dd37df7435';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('38fb1d04-aaf6-5575-9bf1-9daa8318a6da', 'd354cd78-b0ac-5acb-a46c-38dd37df7435', 'A', 'Disclose to the media', false, 0),
  ('b44c7897-9466-5d48-883a-31408595a151', 'd354cd78-b0ac-5acb-a46c-38dd37df7435', 'B', 'Give the police all the information they ask for', false, 1),
  ('13247e52-2bd5-5c8b-84be-660f71ef357b', 'd354cd78-b0ac-5acb-a46c-38dd37df7435', 'C', 'Ask a nurse to tell them', false, 2),
  ('3c7e8676-f333-5f28-9b79-b39720144e37', 'd354cd78-b0ac-5acb-a46c-38dd37df7435', 'D', 'Never speak to the police', false, 3),
  ('79f93636-e046-5cb1-b1cb-fb66453e5de7', 'd354cd78-b0ac-5acb-a46c-38dd37df7435', 'E', 'Disclose only with consent, a court order, a legal requirement, or if justified in the public interest (e.g. serious crime); otherwise maintain confidentiality', true, 4);

-- Q789
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('b79d9712-a8cc-52e6-9fab-7a408122360c', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000013', 'sba', 'A patient is told about a rare but serious risk of a procedure (1 in 10,000 chance of stroke). The doctor wonders whether it needs to be discussed. Which legal case established that doctors must disclose material risks that a reasonable patient would want to know?', 'Montgomery set the standard for consent: doctors must take reasonable care to ensure patients know of any material risks and reasonable alternatives. A material risk is one a reasonable person in the patient''s position would consider significant, or that this particular patient would. Bolam (and Bolitho) covers the standard of care for treatment.', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v3')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = 'b79d9712-a8cc-52e6-9fab-7a408122360c';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('bb5f6bec-4e72-5daa-8dab-8d539e5fd660', 'b79d9712-a8cc-52e6-9fab-7a408122360c', 'A', 'Bland (1993)', false, 0),
  ('7fa4ec47-f8b9-52af-aa13-7e5e1e4a3eb7', 'b79d9712-a8cc-52e6-9fab-7a408122360c', 'B', 'Gillick v West Norfolk (1985)', false, 1),
  ('e4c6c688-6def-54bd-90e0-ae9a886b60e8', 'b79d9712-a8cc-52e6-9fab-7a408122360c', 'C', 'Montgomery v Lanarkshire Health Board (2015)', true, 2),
  ('0fd00d65-5999-5468-93ac-1a4f5f5686c6', 'b79d9712-a8cc-52e6-9fab-7a408122360c', 'D', 'Re T (1992)', false, 3),
  ('1f243870-1f6c-55de-89a0-b8752a9b53a5', 'b79d9712-a8cc-52e6-9fab-7a408122360c', 'E', 'Bolam v Friern Hospital (1957)', false, 4);

-- Q790
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('e9e0c436-eb89-531c-8f86-286e75fddd8c', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000014', 'sba', 'A 30 year old woman has fatigue, pallor and jaundice. Blood tests show anaemia, raised reticulocytes, spherocytes on the film, and a positive direct antiglobulin (Coombs) test. What is the SINGLE most likely diagnosis?', 'Warm AIHA (IgG antibodies) causes extravascular haemolysis with spherocytes and a positive DAT. Causes include idiopathic, SLE, CLL, lymphoma and drugs (methyldopa). First-line treatment is steroids, with rituximab second-line. Hereditary spherocytosis is DAT negative with a family history.', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v3')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = 'e9e0c436-eb89-531c-8f86-286e75fddd8c';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('abe14e67-b985-5c2d-a5f1-66e15ef69b02', 'e9e0c436-eb89-531c-8f86-286e75fddd8c', 'A', 'Autoimmune haemolytic anaemia (warm)', true, 0),
  ('0c0bb878-df81-5a8f-9227-1803da4eb193', 'e9e0c436-eb89-531c-8f86-286e75fddd8c', 'B', 'Hereditary spherocytosis', false, 1),
  ('2a58afd9-a1d8-56c6-86e8-16a9728c982e', 'e9e0c436-eb89-531c-8f86-286e75fddd8c', 'C', 'Iron deficiency', false, 2),
  ('71513bdb-a99c-5fb7-9009-62c3c4797149', 'e9e0c436-eb89-531c-8f86-286e75fddd8c', 'D', 'G6PD deficiency', false, 3),
  ('d5f9097b-2e51-54e8-8c77-5b872b92d81b', 'e9e0c436-eb89-531c-8f86-286e75fddd8c', 'E', 'Thalassaemia', false, 4);

-- Q791
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('cbcddcf9-03f5-5c74-a827-72c8030f24d8', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000014', 'sba', 'A 25 year old man of Mediterranean origin develops dark urine and jaundice 2 days after eating fava beans. His blood film shows bite cells and Heinz bodies. What is the SINGLE most likely diagnosis?', 'G6PD deficiency (X-linked) causes episodic intravascular haemolysis after oxidant stress: fava beans, infection, and drugs (primaquine, dapsone, nitrofurantoin, sulfonamides, rasburicase). Blood film: bite and blister cells, and Heinz bodies. Check G6PD level after recovery, as it may be falsely normal during haemolysis.', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v3')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = 'cbcddcf9-03f5-5c74-a827-72c8030f24d8';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('90978d05-03d8-57dd-b82b-873a60fece40', 'cbcddcf9-03f5-5c74-a827-72c8030f24d8', 'A', 'Hereditary spherocytosis', false, 0),
  ('160e5045-4986-5c4d-82dd-3e8f4f63e7fa', 'cbcddcf9-03f5-5c74-a827-72c8030f24d8', 'B', 'PNH', false, 1),
  ('93af6bde-68a1-5fa0-9743-bee25a7e4eef', 'cbcddcf9-03f5-5c74-a827-72c8030f24d8', 'C', 'Sickle cell disease', false, 2),
  ('adcbf6de-63f9-59df-b092-3a36609841d7', 'cbcddcf9-03f5-5c74-a827-72c8030f24d8', 'D', 'G6PD deficiency', true, 3),
  ('6dfd2f00-53ac-53e9-9044-d068efbb0d07', 'cbcddcf9-03f5-5c74-a827-72c8030f24d8', 'E', 'Autoimmune haemolytic anaemia', false, 4);

-- Q792
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('be04ed49-e4cc-5296-9d8c-18cdffc2ca5f', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000014', 'sba', 'A 70 year old man has a raised haemoglobin of 190 g/L, itching after warm baths, headaches and splenomegaly. JAK2 mutation is positive. What is the SINGLE most likely diagnosis and first-line management?', 'PV is a myeloproliferative neoplasm with JAK2 V617F in about 95%. Features: aquagenic pruritus, plethora, splenomegaly, and arterial and venous thrombosis. Manage with venesection (target haematocrit below 0.45), low-dose aspirin and cytoreduction for high-risk patients (age over 60 or previous thrombosis). Exclude secondary causes (hypoxia, EPO-secreting tumours).', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v3')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = 'be04ed49-e4cc-5296-9d8c-18cdffc2ca5f';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('7bb6f438-d7e4-58b8-9f4d-5d976447a7a7', 'be04ed49-e4cc-5296-9d8c-18cdffc2ca5f', 'A', 'CML; imatinib', false, 0),
  ('14f8688e-d449-5ce6-ba2d-1bf5dc7b5a91', 'be04ed49-e4cc-5296-9d8c-18cdffc2ca5f', 'B', 'Dehydration; IV fluids', false, 1),
  ('fd43f5e0-6244-57cc-880e-a34951941dfd', 'be04ed49-e4cc-5296-9d8c-18cdffc2ca5f', 'C', 'Polycythaemia vera; venesection to haematocrit below 0.45, aspirin, and cytoreduction (e.g. hydroxycarbamide) if high risk', true, 2),
  ('c27a3a73-9d71-5b19-be9d-771b16c8c9d0', 'be04ed49-e4cc-5296-9d8c-18cdffc2ca5f', 'D', 'Secondary polycythaemia; oxygen', false, 3),
  ('ea45f081-a371-53b3-b027-b04cf700427e', 'be04ed49-e4cc-5296-9d8c-18cdffc2ca5f', 'E', 'Iron deficiency; iron', false, 4);

-- Q793
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('6d16bb87-61db-5fb8-ad5c-d5dab790b985', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000014', 'sba', 'A 60 year old woman has a platelet count of 900 x10^9/L on repeated tests, with a burning pain and redness in her fingers. Iron studies and CRP are normal. JAK2 is positive. What is the SINGLE most likely diagnosis?', 'Essential thrombocythaemia is a myeloproliferative neoplasm with a sustained high platelet count (JAK2, CALR or MPL mutations). It causes thrombosis, bleeding and erythromelalgia (burning red extremities). Exclude reactive causes (iron deficiency, infection, inflammation, malignancy, splenectomy). Treatment: aspirin and hydroxycarbamide for high risk.', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v3')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = '6d16bb87-61db-5fb8-ad5c-d5dab790b985';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('bb8d5157-528d-5735-8178-86e2342e2b14', '6d16bb87-61db-5fb8-ad5c-d5dab790b985', 'A', 'Polycythaemia vera', false, 0),
  ('03fbfe10-3d9b-5a29-a784-dac27778326d', '6d16bb87-61db-5fb8-ad5c-d5dab790b985', 'B', 'ITP', false, 1),
  ('889b34ac-a756-5f07-9b17-fdfa63eaba31', '6d16bb87-61db-5fb8-ad5c-d5dab790b985', 'C', 'CML', false, 2),
  ('a23a3c0d-ee88-5d20-b710-1b0a98953621', '6d16bb87-61db-5fb8-ad5c-d5dab790b985', 'D', 'Essential thrombocythaemia', true, 3),
  ('0f681ee9-7c9b-53f2-b84a-38e37b087792', '6d16bb87-61db-5fb8-ad5c-d5dab790b985', 'E', 'Reactive thrombocytosis', false, 4);

-- Q794
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('61702cf1-1e1c-5be1-b320-8d62f212b77f', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000027', 'sba', 'A 45 year old man has a BMI of 34 and asks about losing weight. What is the SINGLE most appropriate first-line approach?', 'NICE: obesity management starts with a multicomponent lifestyle intervention. A realistic target is 5-10% weight loss, which improves health outcomes. Drug treatment (orlistat, GLP-1 agonists within criteria) and bariatric surgery (BMI 40, or 35 with comorbidities, or lower thresholds for recent type 2 diabetes and certain ethnic groups) are considered when lifestyle measures alone are insufficient.', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v3')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = '61702cf1-1e1c-5be1-b320-8d62f212b77f';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('8828995b-e084-5f28-b634-3ca6389542b5', '61702cf1-1e1c-5be1-b320-8d62f212b77f', 'A', 'Very-low-calorie diet in all', false, 0),
  ('07c8c07c-1f33-56aa-a8e3-1d1f382099d1', '61702cf1-1e1c-5be1-b320-8d62f212b77f', 'B', 'Do nothing until BMI 40', false, 1),
  ('b7425bec-271c-5afb-a35e-578819362a0e', '61702cf1-1e1c-5be1-b320-8d62f212b77f', 'C', 'A multicomponent lifestyle intervention (diet, physical activity and behaviour change), with a realistic weight-loss target', true, 2),
  ('cd3305ff-a599-5ccf-8956-5fe9d468fd1d', '61702cf1-1e1c-5be1-b320-8d62f212b77f', 'D', 'Bariatric surgery immediately', false, 3),
  ('d722c671-b192-56e6-891c-1d9316cadc5b', '61702cf1-1e1c-5be1-b320-8d62f212b77f', 'E', 'Orlistat as the only treatment', false, 4);

-- Q795
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('e018d4b4-cf32-52c4-800f-28b5a4508ae6', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000027', 'sba', 'A 72 year old woman has had a cough for 3 weeks. She is a former smoker. She has no other symptoms. What is the SINGLE most appropriate action?', 'NICE NG12: offer an urgent CXR (within 2 weeks) to people aged 40 and over with 2 or more unexplained symptoms (or 1 if they have ever smoked), such as cough, fatigue, breathlessness, chest pain, weight loss or appetite loss. Refer on the suspected cancer pathway if the CXR suggests lung cancer or if haemoptysis in those aged 40 and over.', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v3')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = 'e018d4b4-cf32-52c4-800f-28b5a4508ae6';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('ce28e513-65fc-5204-bb08-ee3eaec00dfb', 'e018d4b4-cf32-52c4-800f-28b5a4508ae6', 'A', 'Antibiotics and review in 2 months', false, 0),
  ('bec50287-5224-5c52-beb7-3089459142ac', 'e018d4b4-cf32-52c4-800f-28b5a4508ae6', 'B', 'Reassure', false, 1),
  ('0baf0a1a-2316-5419-813d-67359f3ab21b', 'e018d4b4-cf32-52c4-800f-28b5a4508ae6', 'C', 'Spirometry only', false, 2),
  ('fd2636a2-d739-5bd9-87fe-68555cff28b5', 'e018d4b4-cf32-52c4-800f-28b5a4508ae6', 'D', 'Urgent chest X-ray (within 2 weeks) for possible lung cancer', true, 3),
  ('8ef23e0c-9ad4-57e6-98ec-bb3e15885288', 'e018d4b4-cf32-52c4-800f-28b5a4508ae6', 'E', 'Refer to dietitian', false, 4);

-- Q796
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('b45ef279-5305-51ba-a19f-e8fcdde1edc2', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000036', 'sba', 'A 50 year old man has frank haematemesis. He is a heavy drinker with jaundice and ascites. What is the SINGLE most appropriate initial drug therapy before endoscopy?', 'Suspected variceal bleeding in cirrhosis: resuscitate, give terlipressin (vasoconstriction of the splanchnic circulation), and prophylactic antibiotics (reduce infection and mortality). Urgent endoscopy for band ligation. Avoid over-transfusion (target Hb 70-80 g/L). TIPSS if bleeding persists. Secondary prevention is non-selective beta-blockers and banding.', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v3')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = 'b45ef279-5305-51ba-a19f-e8fcdde1edc2';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('ee54d351-045e-51db-9451-bc9ce4c05006', 'b45ef279-5305-51ba-a19f-e8fcdde1edc2', 'A', 'Oral propranolol', false, 0),
  ('30bd339a-4fce-5232-b989-e9766410e325', 'b45ef279-5305-51ba-a19f-e8fcdde1edc2', 'B', 'IV vitamin K only', false, 1),
  ('30c9bd91-6e9a-51f4-a43c-fce4b8094af4', 'b45ef279-5305-51ba-a19f-e8fcdde1edc2', 'C', 'PPI only', false, 2),
  ('572862f0-8424-55a8-b4d8-42cd7201c905', 'b45ef279-5305-51ba-a19f-e8fcdde1edc2', 'D', 'IV terlipressin and IV antibiotics (suspected variceal bleeding)', true, 3),
  ('0de6b1ce-6900-5346-b409-fad7fd6c3ba8', 'b45ef279-5305-51ba-a19f-e8fcdde1edc2', 'E', 'IV tranexamic acid', false, 4);

-- Q797
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('2471335e-4ef5-5e33-99ef-db4a7b2777e1', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000030', 'sba', 'A 75 year old woman has central abdominal pain, vomiting and distension. She has no bowel movement for 4 days. She had previous abdominal surgery. X-ray shows dilated small bowel loops centrally. What is the SINGLE most likely cause?', 'Adhesions (from previous surgery) are the commonest cause of small bowel obstruction in the UK, followed by hernias. Initial management is conservative (''drip and suck'') with water-soluble contrast follow-through, which predicts resolution. Surgery is needed if there are signs of strangulation or failure to resolve. Always examine hernial orifices.', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v3')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = '2471335e-4ef5-5e33-99ef-db4a7b2777e1';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('7fa929d5-6022-5b8b-8f09-626555a80555', '2471335e-4ef5-5e33-99ef-db4a7b2777e1', 'A', 'Adhesional small bowel obstruction', true, 0),
  ('4215a737-effc-58cc-aba8-fb9013ef04ed', '2471335e-4ef5-5e33-99ef-db4a7b2777e1', 'B', 'Hernia', false, 1),
  ('a6d0dd42-71e9-595f-9fe5-54ecbae6811d', '2471335e-4ef5-5e33-99ef-db4a7b2777e1', 'C', 'Colon cancer', false, 2),
  ('49974951-8f8a-5395-bed0-222b1bf48df5', '2471335e-4ef5-5e33-99ef-db4a7b2777e1', 'D', 'Paralytic ileus', false, 3),
  ('cf07061a-22af-5c59-86d8-2d53b0e8e241', '2471335e-4ef5-5e33-99ef-db4a7b2777e1', 'E', 'Volvulus', false, 4);

-- Q798
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('5718f73b-1b11-5c1a-af0e-d998a826adc7', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000030', 'sba', 'A 45 year old woman has a painful lump in her groin below and lateral to the pubic tubercle. It is tender and irreducible, and she is vomiting. What is the SINGLE most likely diagnosis?', 'Femoral hernias lie below and lateral to the pubic tubercle, are commoner in women and have a high risk of strangulation because of the narrow femoral canal. Irreducible, tender hernias with obstruction need emergency surgery. Even asymptomatic femoral hernias should be repaired.', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v3')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = '5718f73b-1b11-5c1a-af0e-d998a826adc7';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('ba2d1c98-1a03-5691-8acd-1272d5705b81', '5718f73b-1b11-5c1a-af0e-d998a826adc7', 'A', 'Psoas abscess', false, 0),
  ('878c1095-5e47-5d44-b8da-0cc1a2f818e1', '5718f73b-1b11-5c1a-af0e-d998a826adc7', 'B', 'Lymphadenopathy', false, 1),
  ('b7862008-6dd4-5987-9cbb-d14eae4d0bc2', '5718f73b-1b11-5c1a-af0e-d998a826adc7', 'C', 'Saphena varix', false, 2),
  ('90d9c681-3978-5707-ac42-7ec3bddd2c7d', '5718f73b-1b11-5c1a-af0e-d998a826adc7', 'D', 'Inguinal hernia', false, 3),
  ('682ec4b4-0b6b-5578-a763-abb96f170707', '5718f73b-1b11-5c1a-af0e-d998a826adc7', 'E', 'Incarcerated femoral hernia (high strangulation risk; needs emergency surgery)', true, 4);

-- Q799
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('da62f630-f457-5be1-81b2-34d987293f75', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000015', 'sba', 'A 60 year old woman has a painful red eye with a deep boring pain that wakes her at night. The eye is tender and the redness does not blanch with phenylephrine. She has rheumatoid arthritis. What is the SINGLE most likely diagnosis?', 'Scleritis causes severe, boring pain, tenderness and a deep violet redness, and can threaten sight (scleral thinning, perforation). It is associated with RA, GPA and other vasculitides. Refer urgently. Treatment is systemic NSAIDs, steroids or immunosuppressants. Episcleritis is mild, not very painful and blanches with phenylephrine.', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v3')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = 'da62f630-f457-5be1-81b2-34d987293f75';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('d01306e7-2157-5919-a837-724aa9118f7b', 'da62f630-f457-5be1-81b2-34d987293f75', 'A', 'Subconjunctival haemorrhage', false, 0),
  ('0be51a1f-c1c3-5b77-9acf-58c3bbc28975', 'da62f630-f457-5be1-81b2-34d987293f75', 'B', 'Episcleritis', false, 1),
  ('9f8f09ef-2b95-5d38-936c-204237f08a79', 'da62f630-f457-5be1-81b2-34d987293f75', 'C', 'Blepharitis', false, 2),
  ('43532720-d692-55e6-aa1e-7049549f9bbd', 'da62f630-f457-5be1-81b2-34d987293f75', 'D', 'Conjunctivitis', false, 3),
  ('12ce9bbe-fcbe-576e-8f49-1b51d34203ea', 'da62f630-f457-5be1-81b2-34d987293f75', 'E', 'Scleritis (urgent ophthalmology referral)', true, 4);

-- Q800
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('585942bd-809a-5bbf-bfeb-076b7c5a5b71', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000015', 'sba', 'A 30 year old man has a red, painful bump on the margin of his upper eyelid with a small yellow head at an eyelash base. What is the SINGLE most likely diagnosis and management?', 'An external hordeolum is an acute staphylococcal infection of an eyelash follicle. Warm compresses, and it usually resolves. Antibiotics are only for spreading cellulitis. A chalazion is a painless, firm lump from a blocked meibomian gland, which may need incision and curettage if persistent.', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v3')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = '585942bd-809a-5bbf-bfeb-076b7c5a5b71';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('ea5fe17b-4f73-53aa-aeb9-46ac6a9bc1c0', '585942bd-809a-5bbf-bfeb-076b7c5a5b71', 'A', 'Basal cell carcinoma; urgent referral', false, 0),
  ('2663e30a-7945-58e1-a3c7-b436e41a27c3', '585942bd-809a-5bbf-bfeb-076b7c5a5b71', 'B', 'Chalazion; incision and curettage immediately', false, 1),
  ('b7fa2888-2185-5836-8a08-c4f68ec5833d', '585942bd-809a-5bbf-bfeb-076b7c5a5b71', 'C', 'Dacryocystitis; IV antibiotics', false, 2),
  ('abbcc604-031b-5441-908a-5a6a99de9b60', '585942bd-809a-5bbf-bfeb-076b7c5a5b71', 'D', 'Stye (external hordeolum); warm compresses, usually resolves without antibiotics', true, 3),
  ('645100ca-f491-5286-9297-9b16b840bb04', '585942bd-809a-5bbf-bfeb-076b7c5a5b71', 'E', 'Orbital cellulitis; IV antibiotics', false, 4);

