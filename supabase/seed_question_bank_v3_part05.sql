-- =============================================================================
-- PLAB 1 bank v3 import PART 5 (Q801–830 of 830)
-- Paste AFTER seed_topics_expand.sql. Additive to banks v1/v2 — do NOT clear.
-- =============================================================================

-- Q801
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('22544f26-a852-59e8-b902-35a77255c6c4', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000018', 'sba', 'A 55 year old man is on the ward after a bowel resection. He is vomiting and cannot take oral nutrition for 7 days, with no prospect of feeding soon. His gut is not functioning. What is the SINGLE most appropriate nutritional support?', 'NICE CG32: consider nutrition support for people who have eaten little or nothing for 5 days or more, or are likely to. Enteral feeding is preferred if the gut works. Parenteral nutrition is used if the gut is not functional or accessible. Start cautiously in those at risk of refeeding syndrome, and monitor electrolytes.', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v3')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = '22544f26-a852-59e8-b902-35a77255c6c4';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('f8ebb75e-71ee-5f39-98d7-d043ed848253', '22544f26-a852-59e8-b902-35a77255c6c4', 'A', 'Wait another week', false, 0),
  ('1726df35-99b6-50d1-ba19-1b9f9b5b4ea1', '22544f26-a852-59e8-b902-35a77255c6c4', 'B', 'IV 5% dextrose alone', false, 1),
  ('8ee58e05-92cf-553b-b89e-32ba02deaf1d', '22544f26-a852-59e8-b902-35a77255c6c4', 'C', 'Oral supplements', false, 2),
  ('f522f295-a2eb-55cf-a7ff-434419e5bedb', '22544f26-a852-59e8-b902-35a77255c6c4', 'D', 'NG feeding', false, 3),
  ('27dfbd0c-f7d4-5331-b619-07f752050dba', '22544f26-a852-59e8-b902-35a77255c6c4', 'E', 'Parenteral nutrition via a central line (or PICC)', true, 4);

-- Q802
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('86920d97-c340-57f6-8c22-7556d561cc9f', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000018', 'sba', 'A 45 year old woman is to have an elective laparoscopic cholecystectomy. She takes the combined oral contraceptive pill. What is the SINGLE most appropriate advice?', 'Combined hormonal contraception increases VTE risk. UKMEC advises stopping it 4 weeks before major elective surgery or surgery with prolonged immobilisation, restarting 2 weeks after full mobilisation. Use alternative contraception. For minor surgery, it can usually continue. Progestogen-only methods can be continued.', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v3')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = '86920d97-c340-57f6-8c22-7556d561cc9f';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('5344fb99-6804-560d-9331-3198441212d0', '86920d97-c340-57f6-8c22-7556d561cc9f', 'A', 'Stop it the morning of surgery', false, 0),
  ('974c92f1-de99-554c-a647-e0ae91d60caa', '86920d97-c340-57f6-8c22-7556d561cc9f', 'B', 'Continue it with no changes', false, 1),
  ('7e8252fc-97b5-5467-a143-ec7181a0e146', '86920d97-c340-57f6-8c22-7556d561cc9f', 'C', 'Stop the COC 4 weeks before major elective surgery or surgery causing prolonged immobility, and use another contraceptive', true, 2),
  ('29c8ff01-e6d9-571d-868b-fb98c8549c40', '86920d97-c340-57f6-8c22-7556d561cc9f', 'D', 'Switch to HRT', false, 3),
  ('82de7c7f-b221-580a-9029-9ab71c688b20', '86920d97-c340-57f6-8c22-7556d561cc9f', 'E', 'Double the dose', false, 4);

-- Q803
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('3556f5c8-7f5f-5949-96af-57f30fc1fa39', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000018', 'sba', 'A 70 year old man with type 2 diabetes on metformin and gliclazide is for major surgery and will miss more than one meal. What is the SINGLE most appropriate perioperative glucose management?', 'Patients with diabetes who will miss more than one meal need a VRIII with substrate (such as glucose and potassium-containing fluids). Omit oral hypoglycaemics on the day (especially sulfonylureas, which cause hypoglycaemia). Target glucose 6-10 mmol/L (up to 12 acceptable). Restart usual treatment when eating normally.', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v3')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = '3556f5c8-7f5f-5949-96af-57f30fc1fa39';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('0ad9f93a-89e3-538d-b1fa-7cd69f9668af', '3556f5c8-7f5f-5949-96af-57f30fc1fa39', 'A', 'Stop all fluids', false, 0),
  ('215fb478-603b-5ce8-bbb4-1f29797ba5ad', '3556f5c8-7f5f-5949-96af-57f30fc1fa39', 'B', 'No monitoring needed', false, 1),
  ('352c6c5e-fd93-5d29-9c28-1bb52bb9b55f', '3556f5c8-7f5f-5949-96af-57f30fc1fa39', 'C', 'Give a large dose of long-acting insulin', false, 2),
  ('c086c8f1-cea2-560d-8359-95fd0882d919', '3556f5c8-7f5f-5949-96af-57f30fc1fa39', 'D', 'Give his usual oral drugs the morning of surgery', false, 3),
  ('9825aadf-a76e-5ab6-8556-7cdcd8de217c', '3556f5c8-7f5f-5949-96af-57f30fc1fa39', 'E', 'A variable-rate IV insulin infusion with glucose-containing fluids, with hourly capillary glucose', true, 4);

-- Q804
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('e65b3a31-8aa6-5f44-82c7-94e62241f357', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000018', 'sba', 'A 52 year old woman has been on long-term oral prednisolone 10 mg daily for asthma. She is having major abdominal surgery. What is the SINGLE most appropriate perioperative step?', 'Patients on long-term steroids (over 5 mg prednisolone daily for 4 weeks or more) have adrenal suppression and need perioperative steroid cover to prevent adrenal crisis: IV hydrocortisone 100 mg at induction, then 200 mg/24 hours until they can take oral steroids (with double the dose for 48 hours), per Society for Endocrinology guidance.', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v3')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = 'e65b3a31-8aa6-5f44-82c7-94e62241f357';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('bc18477f-6aad-5141-bfcd-da678b9bb22a', 'e65b3a31-8aa6-5f44-82c7-94e62241f357', 'A', 'Give IV hydrocortisone cover at induction and continue supplementation until she can take oral steroids', true, 0),
  ('30a5165b-7da9-535c-8ec1-03c5a5f6629e', 'e65b3a31-8aa6-5f44-82c7-94e62241f357', 'B', 'No change needed', false, 1),
  ('db3ea8d1-5b7f-5942-817c-2b79adb0621a', 'e65b3a31-8aa6-5f44-82c7-94e62241f357', 'C', 'Stop steroids 2 weeks before surgery', false, 2),
  ('0640af44-4284-5f8d-a985-d595f3ed3a00', 'e65b3a31-8aa6-5f44-82c7-94e62241f357', 'D', 'Double the oral prednisolone for 1 month', false, 3),
  ('c299d48f-0e75-5742-8583-a17d58f4631b', 'e65b3a31-8aa6-5f44-82c7-94e62241f357', 'E', 'Give dexamethasone 20 mg', false, 4);

-- Q805
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('499e1b07-09eb-5e8f-b9f1-99d4c58b4b18', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000018', 'sba', 'A 75 year old woman is 5 days after a total knee replacement. She develops fever, a red, swollen calf and pain. Her wound is clean. What is the SINGLE most appropriate investigation?', 'Orthopaedic lower limb surgery is a major risk factor for DVT. NICE recommends VTE prophylaxis (LMWH, aspirin or DOAC for hip and knee replacements). With suspected DVT, use the Wells score and proximal ultrasound (with D-dimer if unlikely). Treat with a DOAC or LMWH.', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v3')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = '499e1b07-09eb-5e8f-b9f1-99d4c58b4b18';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('4ea4488e-69c1-5fdd-8c89-a500770f719e', '499e1b07-09eb-5e8f-b9f1-99d4c58b4b18', 'A', 'Knee X-ray', false, 0),
  ('5b1d9a0c-f8db-5c46-a894-e202b340e77a', '499e1b07-09eb-5e8f-b9f1-99d4c58b4b18', 'B', 'CT pulmonary angiogram first', false, 1),
  ('12f69d88-9a9b-5b0b-9b91-d351e816b696', '499e1b07-09eb-5e8f-b9f1-99d4c58b4b18', 'C', 'Wound swab', false, 2),
  ('afcf43cf-f392-5a27-951e-d94a77fbabf1', '499e1b07-09eb-5e8f-b9f1-99d4c58b4b18', 'D', 'Blood cultures only', false, 3),
  ('60464ba5-d2b9-541b-9a88-2721e2d8b985', '499e1b07-09eb-5e8f-b9f1-99d4c58b4b18', 'E', 'Proximal leg vein ultrasound (to exclude DVT)', true, 4);

-- Q806
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('5c23c1da-9e1f-52ef-be75-4fe60802f874', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000025', 'sba', 'A 40 year old man has had a severe allergic reaction during general anaesthesia, with bronchospasm, hypotension and a rash. What is the CORRECT follow-up?', 'Perioperative anaphylaxis is most commonly caused by antibiotics (teicoplanin, co-amoxiclav), neuromuscular blockers, chlorhexidine and patent blue dye. Take tryptase at the time (and 1-2 hours and 24 hours later). Refer to a specialist allergy clinic. Report to the MHRA via the Yellow Card. Document in the notes.', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v3')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = '5c23c1da-9e1f-52ef-be75-4fe60802f874';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('1a3815c1-58fd-5d75-b4f3-09617268d5e3', '5c23c1da-9e1f-52ef-be75-4fe60802f874', 'A', 'No follow-up needed', false, 0),
  ('bd5a615e-c22c-59bd-bf1f-f7d8e5779cd1', '5c23c1da-9e1f-52ef-be75-4fe60802f874', 'B', 'Take mast cell tryptase at the time; refer to a specialist anaesthetic allergy clinic to identify the culprit drug', true, 1),
  ('768e6336-eec8-5631-a2d7-bf85f8b14c41', '5c23c1da-9e1f-52ef-be75-4fe60802f874', 'C', 'Avoid all anaesthetics forever', false, 2),
  ('8562c69f-b87f-54d4-8d5a-77a8456c8922', '5c23c1da-9e1f-52ef-be75-4fe60802f874', 'D', 'Assume it was the antibiotic', false, 3),
  ('5797009a-79f0-50ab-8bc3-e3926791ed56', '5c23c1da-9e1f-52ef-be75-4fe60802f874', 'E', 'Repeat the same anaesthetic to test', false, 4);

-- Q807
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('da26b598-7447-5f62-81e7-0fcac681c034', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000025', 'sba', 'A 35 year old nurse has had itching and hives on her hands when wearing gloves. She has also had swelling of her lips at the dentist. Which allergy is MOST likely, and what is a known cross-reaction?', 'Latex allergy can be IgE-mediated (urticaria to anaphylaxis) or a type IV contact dermatitis. It is commoner in healthcare workers, people with spina bifida and multiple surgeries. Cross-reacting foods include banana, avocado, kiwi and chestnut. Use latex-free environments for surgery.', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v3')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = 'da26b598-7447-5f62-81e7-0fcac681c034';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('12f428bb-ec22-585d-94b8-cbeaefc90cc3', 'da26b598-7447-5f62-81e7-0fcac681c034', 'A', 'Egg allergy', false, 0),
  ('a43efd13-703f-5ded-ba72-8f7d7a923697', 'da26b598-7447-5f62-81e7-0fcac681c034', 'B', 'Nickel allergy; cross-reacts with shellfish', false, 1),
  ('a0108d51-04de-5836-b004-33d1f8c886ba', 'da26b598-7447-5f62-81e7-0fcac681c034', 'C', 'Peanut allergy', false, 2),
  ('23fae0c8-1f12-5649-83ba-9018b9502ea2', 'da26b598-7447-5f62-81e7-0fcac681c034', 'D', 'Latex allergy; cross-reacts with banana, avocado, kiwi and chestnut (latex-fruit syndrome)', true, 3),
  ('eb6e7dbc-d780-5044-bf4f-d543da62209b', 'da26b598-7447-5f62-81e7-0fcac681c034', 'E', 'Penicillin allergy', false, 4);

-- Q808
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('594db13f-c905-5504-857a-9c80cc5ccbdc', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000025', 'sba', 'A 20 year old man with peanut allergy has had anaphylaxis after exercising soon after eating wheat. He tolerates wheat at rest. What is the SINGLE most likely diagnosis?', 'Food-dependent exercise-induced anaphylaxis occurs when a food (often wheat via omega-5 gliadin) is eaten within a few hours before exercise. Each factor alone is tolerated. Cofactors include NSAIDs, alcohol and infection. Advise avoiding the food within 4-6 hours before exercise and carrying adrenaline.', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v3')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = '594db13f-c905-5504-857a-9c80cc5ccbdc';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('182d3e94-2191-571d-956c-556785c31094', '594db13f-c905-5504-857a-9c80cc5ccbdc', 'A', 'Exercise-induced asthma', false, 0),
  ('9f7f2694-4f6e-52a7-bc1b-e48d544bf6f3', '594db13f-c905-5504-857a-9c80cc5ccbdc', 'B', 'Cold urticaria', false, 1),
  ('2bf969ff-9cee-50f3-83b4-c0093785c489', '594db13f-c905-5504-857a-9c80cc5ccbdc', 'C', 'Food-dependent exercise-induced anaphylaxis (e.g. omega-5 gliadin)', true, 2),
  ('b5d99a48-8726-5159-a0b4-5557fdb15d1d', '594db13f-c905-5504-857a-9c80cc5ccbdc', 'D', 'Panic attack', false, 3),
  ('c5845334-8f86-55cd-b837-c9a869334cc1', '594db13f-c905-5504-857a-9c80cc5ccbdc', 'E', 'Coeliac disease', false, 4);

-- Q809
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('6cf564e0-0f5b-59bf-aa59-525749cd6a2d', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000025', 'sba', 'A 30 year old woman had eaten fresh apples and developed an itchy mouth and throat, with no other symptoms. She has hay fever to birch pollen. What is the SINGLE most likely diagnosis?', 'Pollen-food syndrome occurs in people with pollen allergy (often birch), with cross-reaction to proteins in raw fruit, vegetables and nuts. It causes itching or tingling in the mouth and throat. The proteins are heat-labile, so cooked forms are tolerated. Severe reactions are uncommon. Avoid the trigger raw foods.', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v3')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = '6cf564e0-0f5b-59bf-aa59-525749cd6a2d';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('548f3a08-70c3-57a0-b019-54f28cfafee1', '6cf564e0-0f5b-59bf-aa59-525749cd6a2d', 'A', 'Pollen-food syndrome (oral allergy syndrome)', true, 0),
  ('21bfe320-84be-520b-9da2-afb489bb62b1', '6cf564e0-0f5b-59bf-aa59-525749cd6a2d', 'B', 'Reflux', false, 1),
  ('16d1e133-530e-5bfe-af80-812362510c93', '6cf564e0-0f5b-59bf-aa59-525749cd6a2d', 'C', 'Anaphylaxis', false, 2),
  ('01717d2d-b5fd-5a34-aa69-dd38da390a7c', '6cf564e0-0f5b-59bf-aa59-525749cd6a2d', 'D', 'Coeliac disease', false, 3),
  ('82527d24-70e3-57a8-ae61-45cd43602018', '6cf564e0-0f5b-59bf-aa59-525749cd6a2d', 'E', 'Food intolerance', false, 4);

-- Q810
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('89ffa4e5-b9d8-5931-a95b-bfcc5e082355', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000025', 'sba', 'A 2 year old boy has had recurrent abscesses, pneumonia and liver abscesses with Staphylococcus aureus and Aspergillus. Nitroblue tetrazolium test is abnormal. What is the SINGLE most likely diagnosis?', 'Chronic granulomatous disease is a defect in NADPH oxidase, so phagocytes cannot kill catalase-positive organisms (S. aureus, Aspergillus, Serratia, Nocardia). It causes recurrent bacterial and fungal infections and granulomas. Diagnosed with the dihydrorhodamine flow cytometry or NBT test. Treatment: prophylactic co-trimoxazole and itraconazole, and stem cell transplant.', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v3')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = '89ffa4e5-b9d8-5931-a95b-bfcc5e082355';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('49358417-b6d8-52b6-be12-cfe5059b9425', '89ffa4e5-b9d8-5931-a95b-bfcc5e082355', 'A', 'Complement deficiency', false, 0),
  ('d2be27b3-6098-556e-a9d7-6fee2fbb90bd', '89ffa4e5-b9d8-5931-a95b-bfcc5e082355', 'B', 'SCID', false, 1),
  ('342b5aaa-0760-562f-920d-668bbdc7cf4c', '89ffa4e5-b9d8-5931-a95b-bfcc5e082355', 'C', 'Chronic granulomatous disease', true, 2),
  ('b4dd8764-646c-5352-8767-47b1bbfbb4bf', '89ffa4e5-b9d8-5931-a95b-bfcc5e082355', 'D', 'DiGeorge syndrome', false, 3),
  ('1ef89c32-3600-520d-b3ec-00c549bbe6e4', '89ffa4e5-b9d8-5931-a95b-bfcc5e082355', 'E', 'Bruton''s agammaglobulinaemia', false, 4);

-- Q811
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('b005dfe9-e4ee-5149-9fdd-7daa80ad1fe0', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000017', 'sba', 'A 55 year old woman with breast cancer has breakthrough pain. Her total 24-hour background opioid is equivalent to 120 mg oral morphine. What is the SINGLE most appropriate breakthrough dose of oral morphine?', 'Breakthrough doses are usually one-sixth (1/10 to 1/6) of the total 24-hour background opioid dose, given as needed. If breakthrough doses are used often, increase the background dose. Review side effects (constipation, nausea, drowsiness).', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v3')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = 'b005dfe9-e4ee-5149-9fdd-7daa80ad1fe0';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('1185a179-2471-5ae8-bba1-06234ea5565c', 'b005dfe9-e4ee-5149-9fdd-7daa80ad1fe0', 'A', '2 mg', false, 0),
  ('87a92105-01ea-5666-bae8-601385e307c2', 'b005dfe9-e4ee-5149-9fdd-7daa80ad1fe0', 'B', '5 mg', false, 1),
  ('829abd28-122c-576e-85b1-bf19f8734586', 'b005dfe9-e4ee-5149-9fdd-7daa80ad1fe0', 'C', '20 mg immediate-release oral morphine (about one-sixth of the 24-hour dose)', true, 2),
  ('2775bb73-ef08-5e8b-8913-71df41967337', 'b005dfe9-e4ee-5149-9fdd-7daa80ad1fe0', 'D', '60 mg', false, 3),
  ('f757ef03-41f5-53fe-881a-429338219706', 'b005dfe9-e4ee-5149-9fdd-7daa80ad1fe0', 'E', '120 mg', false, 4);

-- Q812
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('06f6432e-e346-58bf-895f-4acfc01777ce', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000017', 'sba', 'A 60 year old woman with metastatic cancer has nausea and vomiting. She has hypercalcaemia that has been corrected, and is on opioids. Which antiemetic is MOST appropriate for opioid- or chemically-induced nausea?', 'Choose antiemetics by cause: chemical or metabolic (opioids, hypercalcaemia, renal failure) — haloperidol or levomepromazine; gastric stasis — metoclopramide or domperidone; raised intracranial pressure — cyclizine and dexamethasone; vestibular — cyclizine; chemotherapy — ondansetron, dexamethasone and aprepitant.', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v3')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = '06f6432e-e346-58bf-895f-4acfc01777ce';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('7758a6a2-990b-5cb3-b7ab-923249579e7c', '06f6432e-e346-58bf-895f-4acfc01777ce', 'A', 'Dexamethasone alone', false, 0),
  ('cd350073-6175-50ed-9e18-d55f1e5ee52a', '06f6432e-e346-58bf-895f-4acfc01777ce', 'B', 'Haloperidol (low dose) or metoclopramide', true, 1),
  ('24a2de02-1383-58fc-917d-29725ef86c98', '06f6432e-e346-58bf-895f-4acfc01777ce', 'C', 'Cyclizine as first-line for chemical causes', false, 2),
  ('711ac350-4a80-5946-bde5-f1162ae836e4', '06f6432e-e346-58bf-895f-4acfc01777ce', 'D', 'Ondansetron for all', false, 3),
  ('fd1d187a-2e1b-5ab8-b862-2191f2063cb9', '06f6432e-e346-58bf-895f-4acfc01777ce', 'E', 'Hyoscine butylbromide', false, 4);

-- Q813
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('ab259afb-5086-5a59-a7d5-af53795dc7bb', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000017', 'sba', 'A 58 year old man with lung cancer has a smooth, swollen face, headache worse on bending, dilated chest wall veins and breathlessness. What is the SINGLE most appropriate immediate management while awaiting specialist review?', 'Superior vena cava obstruction is commonly caused by lung cancer or lymphoma. Management: sit up, oxygen, dexamethasone, and urgent stenting (fastest relief) and/or radiotherapy or chemotherapy depending on tumour type. Obtain histology before steroids if lymphoma is suspected, if safe.', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v3')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = 'ab259afb-5086-5a59-a7d5-af53795dc7bb';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('3bdc138e-777f-51bd-a3c9-f863d03d273a', 'ab259afb-5086-5a59-a7d5-af53795dc7bb', 'A', 'IV fluids', false, 0),
  ('c87eda5d-e2ad-5703-ae14-0eadf2dd3e4d', 'ab259afb-5086-5a59-a7d5-af53795dc7bb', 'B', 'Sit upright, oxygen, dexamethasone, and urgent oncology review for endovascular stenting and/or radiotherapy', true, 1),
  ('b17f57fe-b9b7-592c-8700-97ecd870581c', 'ab259afb-5086-5a59-a7d5-af53795dc7bb', 'C', 'Lie flat', false, 2),
  ('acc56261-4f3e-582b-aa1a-713fb9e6186c', 'ab259afb-5086-5a59-a7d5-af53795dc7bb', 'D', 'Diuretics only', false, 3),
  ('74006fb1-ef01-5e6a-b19b-e01218f1efd0', 'ab259afb-5086-5a59-a7d5-af53795dc7bb', 'E', 'Discharge with oral steroids', false, 4);

-- Q814
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('ad0fd3f2-b55a-571e-ad40-5e894a2e22f4', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000017', 'sba', 'A 80 year old woman is dying from heart failure. She has an implantable cardioverter-defibrillator. What is the MOST appropriate action regarding the ICD?', 'ICD shocks at the end of life are painful and distressing and do not prevent death. Discussions about deactivating the defibrillator function should be part of advance care planning and DNACPR discussions. Pacing function can continue. A magnet placed over the device temporarily suspends shocks in an emergency.', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v3')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = 'ad0fd3f2-b55a-571e-ad40-5e894a2e22f4';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('7a4430e2-1ee6-5746-8929-1aef06d353eb', 'ad0fd3f2-b55a-571e-ad40-5e894a2e22f4', 'A', 'Discuss and arrange deactivation of the shock function to avoid distressing shocks at the end of life', true, 0),
  ('b1a90126-2d15-504a-bf1f-d4f6472e341f', 'ad0fd3f2-b55a-571e-ad40-5e894a2e22f4', 'B', 'Turn off pacing only', false, 1),
  ('7249aa4a-476f-592c-85e9-2d1caccdb95e', 'ad0fd3f2-b55a-571e-ad40-5e894a2e22f4', 'C', 'Nothing can be done', false, 2),
  ('f316b80a-ee53-5b41-bc46-d16d067ecc7b', 'ad0fd3f2-b55a-571e-ad40-5e894a2e22f4', 'D', 'Leave it active', false, 3),
  ('031a9835-ebc2-5142-8c63-a70a6ac14e92', 'ad0fd3f2-b55a-571e-ad40-5e894a2e22f4', 'E', 'Surgically remove it', false, 4);

-- Q815
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('6c07240f-b7c0-52a0-ac41-0ca288273596', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000029', 'sba', 'An 83 year old woman has had nocturia 4 times a night and urgency. She has postural hypotension and dementia. Which drug for overactive bladder is generally preferred in frail older people with cognitive impairment?', 'Oxybutynin (immediate-release) should be avoided in frail older women because of anticholinergic effects (confusion, falls). Mirabegron is an alternative but can raise BP. Non-drug measures: bladder training, reducing evening fluids and caffeine, toilet routines. Desmopressin is avoided in older people (hyponatraemia).', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v3')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = '6c07240f-b7c0-52a0-ac41-0ca288273596';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('aa9a0bca-2418-5f8a-910d-0e86434968a6', '6c07240f-b7c0-52a0-ac41-0ca288273596', 'A', 'Mirabegron (beta-3 agonist; avoid if uncontrolled hypertension) rather than oxybutynin', true, 0),
  ('0622720f-f41a-5798-943e-e081c9111549', '6c07240f-b7c0-52a0-ac41-0ca288273596', 'B', 'Oxybutynin immediate-release', false, 1),
  ('ba1f6f5d-45c3-53fe-8503-5f0ce8f020ab', '6c07240f-b7c0-52a0-ac41-0ca288273596', 'C', 'Desmopressin in all', false, 2),
  ('52ed528b-ac6b-5853-b4d6-4f85430dcdbd', '6c07240f-b7c0-52a0-ac41-0ca288273596', 'D', 'Amitriptyline', false, 3),
  ('31b479c5-54ac-5d89-bb2a-fe1c1eda66eb', '6c07240f-b7c0-52a0-ac41-0ca288273596', 'E', 'Furosemide at night', false, 4);

-- Q816
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('b26986d3-d874-549c-934a-00319fa8b735', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000029', 'sba', 'An 86 year old man lives alone and was admitted with a chest infection. He is now medically well but has reduced mobility. Which approach BEST reduces his length of stay and deconditioning?', 'Hospital-associated deconditioning occurs rapidly in older people. Comprehensive geriatric assessment, early mobilisation, discharge planning from admission, and intermediate care or reablement support improve outcomes. ''Discharge to assess'' models assess long-term needs at home rather than in hospital.', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v3')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = 'b26986d3-d874-549c-934a-00319fa8b735';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('89f38a9e-5871-554d-b659-4cd5358f5d21', 'b26986d3-d874-549c-934a-00319fa8b735', 'A', 'Transfer to a care home automatically', false, 0),
  ('5696e2e1-cb7d-530a-aa00-95770a89528c', 'b26986d3-d874-549c-934a-00319fa8b735', 'B', 'Catheterise for convenience', false, 1),
  ('e9d6d67b-96cb-59dc-9912-77dd69e6a2b5', 'b26986d3-d874-549c-934a-00319fa8b735', 'C', 'Early mobilisation and discharge planning from admission, with multidisciplinary input (physiotherapy, OT, social care)', true, 2),
  ('6ec287be-1c83-557f-b566-bf29a78226bb', 'b26986d3-d874-549c-934a-00319fa8b735', 'D', 'Bed rest until fully recovered', false, 3),
  ('dd1887fc-fd10-596e-bf9c-c2ff70db9b1f', 'b26986d3-d874-549c-934a-00319fa8b735', 'E', 'Delay discharge planning until fully mobile', false, 4);

-- Q817
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('fa2ae23e-7f87-51af-a676-cdf84cd889e3', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000029', 'sba', 'An 80 year old woman is found to have osteoporosis after a wrist fracture. eGFR is 25 mL/min. What is the SINGLE most appropriate treatment?', 'Oral bisphosphonates and IV zoledronate are not recommended with eGFR below 30-35 mL/min. Denosumab (6-monthly subcutaneous injection) can be used in renal impairment, with calcium and vitamin D correction to avoid hypocalcaemia. Denosumab should not be stopped without follow-on treatment (rebound vertebral fractures).', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v3')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = 'fa2ae23e-7f87-51af-a676-cdf84cd889e3';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('1e411c9e-5510-5ae7-b487-5b03b366940a', 'fa2ae23e-7f87-51af-a676-cdf84cd889e3', 'A', 'HRT', false, 0),
  ('cc0d2519-636c-52e3-932c-d02cb2db376e', 'fa2ae23e-7f87-51af-a676-cdf84cd889e3', 'B', 'No treatment', false, 1),
  ('ef87f80a-5fd5-5fb9-a2ba-2982871bc9c4', 'fa2ae23e-7f87-51af-a676-cdf84cd889e3', 'C', 'Alendronic acid', false, 2),
  ('be62f0e7-5ab2-5c23-b142-7f190249c01e', 'fa2ae23e-7f87-51af-a676-cdf84cd889e3', 'D', 'IV zoledronic acid', false, 3),
  ('d81f2bd9-d4ac-551a-ba03-e958df325b4b', 'fa2ae23e-7f87-51af-a676-cdf84cd889e3', 'E', 'Denosumab (with calcium and vitamin D; check calcium), as oral bisphosphonates are not recommended with eGFR below 30-35', true, 4);

-- Q818
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('3a4760fa-f08e-5db7-8692-9c737af0f079', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000029', 'sba', 'An 84 year old woman with dementia is found to have lost capacity to manage her money. She did not make a lasting power of attorney. Who can make financial decisions for her?', 'If someone loses capacity without a lasting power of attorney for property and financial affairs, a relative or professional can apply to the Court of Protection to be appointed as a deputy. An LPA must be made while the person still has capacity. Relatives do not automatically have legal authority.', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v3')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = '3a4760fa-f08e-5db7-8692-9c737af0f079';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('db28d411-d443-597b-adfb-6ae07d67f160', '3a4760fa-f08e-5db7-8692-9c737af0f079', 'A', 'Her GP', false, 0),
  ('5e09bc03-214b-55ef-b207-57ea12f862c7', '3a4760fa-f08e-5db7-8692-9c737af0f079', 'B', 'A deputy appointed by the Court of Protection', true, 1),
  ('998d0373-fdac-55da-b6a4-356ac458716c', '3a4760fa-f08e-5db7-8692-9c737af0f079', 'C', 'The care home manager', false, 2),
  ('32a6c23f-848c-5fa1-9192-044c751fc75a', '3a4760fa-f08e-5db7-8692-9c737af0f079', 'D', 'Her daughter automatically', false, 3),
  ('0b0628ef-de06-51fa-98db-b1f567ddaa01', '3a4760fa-f08e-5db7-8692-9c737af0f079', 'E', 'The local council in all cases', false, 4);

-- Q819
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('6a7f3b70-babc-52d6-8e79-bb120345a5ba', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000020', 'sba', 'A 30 year old man has a painless ulcer on his penis with a clean, indurated base and painless inguinal lymphadenopathy 3 weeks after unprotected sex with a man. What is the SINGLE most appropriate treatment if confirmed?', 'Primary syphilis: painless indurated chancre with regional lymphadenopathy 9-90 days after exposure. Test with treponemal PCR from the lesion and serology. Treat early syphilis with a single dose of IM benzathine penicillin (doxycycline for 14 days if allergic). Warn about Jarisch-Herxheimer reaction. Partner notification and HIV testing.', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v3')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = '6a7f3b70-babc-52d6-8e79-bb120345a5ba';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('1d3a6a09-3a50-5728-9040-6460577bebae', '6a7f3b70-babc-52d6-8e79-bb120345a5ba', 'A', 'Benzathine benzylpenicillin IM single dose (primary syphilis)', true, 0),
  ('532e6543-2cd1-5b6e-a2e9-306105ffda8b', '6a7f3b70-babc-52d6-8e79-bb120345a5ba', 'B', 'Fluconazole', false, 1),
  ('85d7d836-4480-5e35-936f-6b10c9616a99', '6a7f3b70-babc-52d6-8e79-bb120345a5ba', 'C', 'Ceftriaxone', false, 2),
  ('84a431b2-8315-5cad-8fc5-20a803a1aa02', '6a7f3b70-babc-52d6-8e79-bb120345a5ba', 'D', 'Oral aciclovir', false, 3),
  ('b0a4e981-2348-5bda-8af9-586eae713c4f', '6a7f3b70-babc-52d6-8e79-bb120345a5ba', 'E', 'Oral doxycycline for 7 days for chlamydia', false, 4);

-- Q820
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('091cfe8a-81cb-5d19-906f-c0c529cc5f6c', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000020', 'sba', 'A 22 year old woman has had warty growths around her vulva for 2 months. They are painless. What is the SINGLE most appropriate first-line treatment?', 'Anogenital warts are caused by HPV types 6 and 11. Soft, non-keratinised warts respond to podophyllotoxin. Keratinised warts respond better to cryotherapy. Imiquimod is an alternative. Podophyllotoxin is avoided in pregnancy. The HPV vaccine (Gardasil 9) protects against these types.', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v3')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = '091cfe8a-81cb-5d19-906f-c0c529cc5f6c';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('4a49692b-5957-5572-a260-f0f4a110a873', '091cfe8a-81cb-5d19-906f-c0c529cc5f6c', 'A', 'IM penicillin', false, 0),
  ('69bd3010-529e-5d3f-91a8-af2fb101b9cd', '091cfe8a-81cb-5d19-906f-c0c529cc5f6c', 'B', 'Oral aciclovir', false, 1),
  ('66856753-0c2b-5181-9c5e-3a4987a4d743', '091cfe8a-81cb-5d19-906f-c0c529cc5f6c', 'C', 'Topical podophyllotoxin (soft lesions) or cryotherapy (keratinised lesions); imiquimod as an alternative', true, 2),
  ('f1cfe414-175b-59b2-95a6-852b03ed9cf2', '091cfe8a-81cb-5d19-906f-c0c529cc5f6c', 'D', 'Surgical excision in all cases', false, 3),
  ('c292af18-a369-534b-99b5-aaee4242ded1', '091cfe8a-81cb-5d19-906f-c0c529cc5f6c', 'E', 'Oral antibiotics', false, 4);

-- Q821
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('ca44dcbd-d997-5d6f-bf0b-b70be5bf7275', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000021', 'sba', 'A 12 year old girl has had abdominal pain and diarrhoea with blood for 4 weeks, mouth ulcers, weight loss and growth slowing. What is the SINGLE most appropriate first investigation in primary care?', 'Inflammatory bowel disease in children commonly presents with abdominal pain, diarrhoea (with or without blood), weight loss and growth failure. Raised calprotectin and inflammatory markers suggest IBD. Refer for endoscopy. Crohn''s disease is commonly treated with exclusive enteral nutrition (first-line in children) to induce remission.', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v3')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = 'ca44dcbd-d997-5d6f-bf0b-b70be5bf7275';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('b27f953a-3fa6-54c7-9967-88faaf1c8e5e', 'ca44dcbd-d997-5d6f-bf0b-b70be5bf7275', 'A', 'Faecal calprotectin with blood tests (FBC, CRP, albumin), and urgent paediatric referral', true, 0),
  ('64da56c9-4c36-58cc-8f26-648bf56b3016', 'ca44dcbd-d997-5d6f-bf0b-b70be5bf7275', 'B', 'CT abdomen', false, 1),
  ('8fcd7c18-74ba-5f27-95a6-284761130795', 'ca44dcbd-d997-5d6f-bf0b-b70be5bf7275', 'C', 'Stool culture only', false, 2),
  ('017802c8-2960-59e4-ab42-d7b58ed12c35', 'ca44dcbd-d997-5d6f-bf0b-b70be5bf7275', 'D', 'Abdominal X-ray', false, 3),
  ('1e702d25-83d0-542f-8286-05599b0963be', 'ca44dcbd-d997-5d6f-bf0b-b70be5bf7275', 'E', 'Reassurance and probiotics', false, 4);

-- Q822
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('92f009c6-48ab-5118-bb10-cbc5456d8c4d', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000021', 'sba', 'A 1 year old child has been failing to gain weight since starting solid foods at 6 months. She has diarrhoea, abdominal distension, irritability and wasted buttocks. What is the SINGLE most likely diagnosis?', 'Coeliac disease can present after gluten is introduced, with faltering growth, diarrhoea, abdominal distension, irritability and buttock wasting. Test with tissue transglutaminase IgA plus total IgA while the child eats gluten. Diagnosis may be made without biopsy in children with very high tTG titres and positive endomysial antibodies.', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v3')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = '92f009c6-48ab-5118-bb10-cbc5456d8c4d';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('e11d9d0e-1ae6-5ceb-a11e-628477575725', '92f009c6-48ab-5118-bb10-cbc5456d8c4d', 'A', 'Hirschsprung''s disease', false, 0),
  ('9148274f-edd2-57db-a7e3-abadbd94a310', '92f009c6-48ab-5118-bb10-cbc5456d8c4d', 'B', 'Cow''s milk protein allergy', false, 1),
  ('c6ed5e39-28c7-5e43-94a4-d1cd0a8f97fb', '92f009c6-48ab-5118-bb10-cbc5456d8c4d', 'C', 'Pyloric stenosis', false, 2),
  ('8d64e42b-e136-5095-a4d1-cbc0db7b5310', '92f009c6-48ab-5118-bb10-cbc5456d8c4d', 'D', 'Coeliac disease', true, 3),
  ('db66810a-ae15-5931-ac0f-cfb25096faa4', '92f009c6-48ab-5118-bb10-cbc5456d8c4d', 'E', 'Cystic fibrosis', false, 4);

-- Q823
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('a9f028a3-4f0d-5c3c-9e6e-c3e1cfbd42a6', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000012', 'sba', 'A 40 year old woman has had an itchy rash on her neck and wrist where she wears a necklace and watch, with blistering eczema. What is the SINGLE most appropriate investigation?', 'Allergic contact dermatitis is a type IV (delayed) hypersensitivity. Common allergens include nickel, fragrances, preservatives, hair dye (PPD) and rubber chemicals. Patch testing identifies the allergen. Skin prick testing and IgE are used for type I (immediate) reactions. Treatment: avoidance, emollients and topical steroids.', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v3')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = 'a9f028a3-4f0d-5c3c-9e6e-c3e1cfbd42a6';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('d4f2eadf-ffd0-5197-97d5-ee3d628b82f9', 'a9f028a3-4f0d-5c3c-9e6e-c3e1cfbd42a6', 'A', 'Skin biopsy', false, 0),
  ('4082b6c0-5423-52aa-8f29-736fce09e924', 'a9f028a3-4f0d-5c3c-9e6e-c3e1cfbd42a6', 'B', 'Serum IgE', false, 1),
  ('39573a85-3fda-513d-8eaf-aec648c355fd', 'a9f028a3-4f0d-5c3c-9e6e-c3e1cfbd42a6', 'C', 'Patch testing (suspected allergic contact dermatitis, e.g. nickel)', true, 2),
  ('f861736b-678a-5663-b024-a4961cc44c75', 'a9f028a3-4f0d-5c3c-9e6e-c3e1cfbd42a6', 'D', 'Skin prick testing', false, 3),
  ('e1a3c6e2-8e61-5f2b-845a-6842d654cc52', 'a9f028a3-4f0d-5c3c-9e6e-c3e1cfbd42a6', 'E', 'Fungal scraping', false, 4);

-- Q824
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('03598111-77b7-550a-9b09-7699cfbc6280', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000012', 'sba', 'A 50 year old man has had thickened, yellow, crumbly toenails for 2 years. He wants treatment for cosmetic reasons. What is the SINGLE most appropriate first step?', 'Only about half of nail dystrophies are fungal (others include psoriasis and trauma). Confirm with nail clippings before treatment. Oral terbinafine is first-line for dermatophyte onychomycosis (6 weeks for fingernails, 12 weeks for toenails). Check LFTs. Topical amorolfine for early distal infection. Treatment is not essential if asymptomatic.', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v3')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = '03598111-77b7-550a-9b09-7699cfbc6280';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('4b14a58e-f0c8-5b73-9358-ee4dba222774', '03598111-77b7-550a-9b09-7699cfbc6280', 'A', 'Start oral terbinafine immediately', false, 0),
  ('e1e52ad1-09c4-580e-867a-ef0c948f071d', '03598111-77b7-550a-9b09-7699cfbc6280', 'B', 'Send nail clippings for microscopy and culture to confirm fungal infection before treatment', true, 1),
  ('2110f4c3-12e3-501a-a356-54c99dd53162', '03598111-77b7-550a-9b09-7699cfbc6280', 'C', 'Topical steroids', false, 2),
  ('b383c9f6-e4fa-5d99-ba26-b89fe4debd89', '03598111-77b7-550a-9b09-7699cfbc6280', 'D', 'Oral griseofulvin for children only', false, 3),
  ('ff293edb-5736-58e8-b9bf-bcbc44fded59', '03598111-77b7-550a-9b09-7699cfbc6280', 'E', 'Remove all toenails', false, 4);

-- Q825
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('8386fc77-4411-5254-a28f-864fa4f1d480', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000013', 'sba', 'A 36 year old man is admitted following an overdose. He has capacity and refuses treatment that would prevent liver failure. He says he wants to die. What is the CORRECT approach?', 'A capacitous adult can refuse treatment, even if it leads to death. After self-harm, capacity must be assessed carefully, as distress or mental illness can impair decision-making. If capacity is lacking, treat in best interests under the MCA. The Mental Health Act can authorise treatment of mental disorder, but not unrelated physical conditions. Involve senior clinicians and legal advice where needed.', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v3')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = '8386fc77-4411-5254-a28f-864fa4f1d480';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('05c37ee1-8962-51c1-85cb-746a7872dc16', '8386fc77-4411-5254-a28f-864fa4f1d480', 'A', 'Discharge him', false, 0),
  ('b1ad0a3f-3af9-54cb-a91c-48678f6c8518', '8386fc77-4411-5254-a28f-864fa4f1d480', 'B', 'Force treatment with physical restraint in all cases', false, 1),
  ('e2a8b7bf-2a86-5b55-80ea-f95ed556d95d', '8386fc77-4411-5254-a28f-864fa4f1d480', 'C', 'Treat under the Mental Health Act for the physical condition', false, 2),
  ('d3599dcf-11f3-5b00-95b2-e46ddd0af92c', '8386fc77-4411-5254-a28f-864fa4f1d480', 'D', 'He can never refuse treatment after an overdose', false, 3),
  ('10d8a32f-1e7a-5d03-a28a-2392597f2d30', '8386fc77-4411-5254-a28f-864fa4f1d480', 'E', 'Carefully assess capacity (mental illness may impair it), involve seniors and psychiatry; treat under the MCA in his best interests if capacity is lacking', true, 4);

-- Q826
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('af473815-496e-5c1f-9e7e-a94556aee94b', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000013', 'sba', 'A doctor receives a large gift worth several hundred pounds from a grateful patient after surgery. What is the CORRECT action?', 'GMC guidance: doctors must not ask for or accept gifts that may affect or be seen to affect the way patients are treated. Small gifts are usually fine. Larger gifts should be declared under local policies (registers of interests). Never encourage gifts or bequests.', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v3')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = 'af473815-496e-5c1f-9e7e-a94556aee94b';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('711c7cd7-f797-539f-b3e6-c1d12e24b7d3', 'af473815-496e-5c1f-9e7e-a94556aee94b', 'A', 'Ask for more gifts', false, 0),
  ('c350cdd1-d8d1-58de-9e4a-60b36530b9ff', 'af473815-496e-5c1f-9e7e-a94556aee94b', 'B', 'Sell the gift', false, 1),
  ('d3b94eed-64c2-571c-9e15-b8aacb28e24a', 'af473815-496e-5c1f-9e7e-a94556aee94b', 'C', 'Always accept any gift', false, 2),
  ('d01b53f1-ab79-5346-a412-36d7e06c80e6', 'af473815-496e-5c1f-9e7e-a94556aee94b', 'D', 'Gifts are illegal', false, 3),
  ('fc9cb400-d59b-5f39-92af-6e7c06f80cce', 'af473815-496e-5c1f-9e7e-a94556aee94b', 'E', 'Consider whether accepting could affect or appear to affect professional judgement; follow local policy and declare it', true, 4);

-- Q827
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('f004d600-0192-5f12-8b42-f2e53bd01b9f', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000013', 'sba', 'A 13 year old boy needs an appendicectomy but is terrified of surgery and refuses. His parents consent. He is judged not Gillick competent for this decision. What is the CORRECT approach?', 'A person with parental responsibility can consent to treatment in the best interests of a child who lacks competence. Even Gillick-competent under-18s who refuse can, in some cases, have the refusal overridden by a court or parents for life-saving treatment. Involve the child, explain and support them.', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v3')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = 'f004d600-0192-5f12-8b42-f2e53bd01b9f';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('64df044c-1e45-50c1-9664-414442346905', 'f004d600-0192-5f12-8b42-f2e53bd01b9f', 'A', 'His parents can consent on his behalf in his best interests; continue to involve him and address his fears', true, 0),
  ('d9f74fcb-4d95-588d-a1f9-d427d2a05b07', 'f004d600-0192-5f12-8b42-f2e53bd01b9f', 'B', 'Use the Mental Health Act', false, 1),
  ('9da3326d-24a2-584c-ac8c-f6dbe8bd8033', 'f004d600-0192-5f12-8b42-f2e53bd01b9f', 'C', 'Apply to the Court of Protection', false, 2),
  ('53da038c-98e3-5038-b5b7-8492c72c1641', 'f004d600-0192-5f12-8b42-f2e53bd01b9f', 'D', 'Wait until he is 16', false, 3),
  ('60a732d9-407f-56ff-8ea1-75159b09a1dd', 'f004d600-0192-5f12-8b42-f2e53bd01b9f', 'E', 'Surgery cannot proceed under any circumstances', false, 4);

-- Q828
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('e13e35a4-65c8-5454-9df2-cd1258ff12c8', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000027', 'sba', 'A 50 year old woman takes the progestogen-only pill (desogestrel). She asks about when to stop contraception. What is the CORRECT advice?', 'FSRH: contraception can be stopped at age 55. Before then, women under 50 need contraception for 2 years after the last period, and those over 50 for 1 year. FSH can be checked in women over 50 using progestogen-only methods to help decide. Combined hormonal contraception should be stopped at 50.', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v3')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = 'e13e35a4-65c8-5454-9df2-cd1258ff12c8';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('88e9abf3-6d8a-59a0-8907-af923a3ab872', 'e13e35a4-65c8-5454-9df2-cd1258ff12c8', 'A', 'Stop after 1 year of periods if under 50 only', false, 0),
  ('503ccee9-e69e-5c13-8798-1f589400218b', 'e13e35a4-65c8-5454-9df2-cd1258ff12c8', 'B', 'She can stop at 45', false, 1),
  ('2d7ff772-d913-5881-9d07-77623db429b3', 'e13e35a4-65c8-5454-9df2-cd1258ff12c8', 'C', 'Stop as soon as periods are irregular', false, 2),
  ('27ae9dd2-4a09-533b-8220-71a4d8ff9916', 'e13e35a4-65c8-5454-9df2-cd1258ff12c8', 'D', 'She must continue until 65', false, 3),
  ('7f56a0c9-0e63-5298-9d5c-e119869042d4', 'e13e35a4-65c8-5454-9df2-cd1258ff12c8', 'E', 'Contraception can be stopped at age 55 (natural loss of fertility for most women)', true, 4);

-- Q829
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('261a4839-08ae-5bd9-bfa2-7c093a45fd63', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000036', 'sba', 'A 42 year old woman has had iron deficiency anaemia. She has no GI symptoms. Coeliac serology is negative. What is the SINGLE most appropriate investigation?', 'BSG guidance: men and postmenopausal women with iron deficiency anaemia need bidirectional endoscopy (OGD and colonoscopy or CT colonography). Premenopausal women with significant symptoms, family history or no explanation also need investigation. NICE NG12 refers people aged 60 and over with iron deficiency anaemia urgently for suspected colorectal cancer.', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v3')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = '261a4839-08ae-5bd9-bfa2-7c093a45fd63';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('62a25b35-22d4-5db1-b87b-4132f091977d', '261a4839-08ae-5bd9-bfa2-7c093a45fd63', 'A', 'Abdominal X-ray', false, 0),
  ('c0c6bce7-0144-56a4-966d-56d58068beef', '261a4839-08ae-5bd9-bfa2-7c093a45fd63', 'B', 'Iron studies only', false, 1),
  ('2be072d9-5132-5f3c-b3b6-72bb3ffeedcd', '261a4839-08ae-5bd9-bfa2-7c093a45fd63', 'C', 'Repeat FBC in 6 months', false, 2),
  ('15df11c9-3533-5071-8ce1-c129106491dc', '261a4839-08ae-5bd9-bfa2-7c093a45fd63', 'D', 'Bone marrow biopsy', false, 3),
  ('9deea2ab-5a5a-5cb9-9064-d1cf4787593e', '261a4839-08ae-5bd9-bfa2-7c093a45fd63', 'E', 'Upper and lower GI endoscopy (or as per NICE/BSG guidance), unless menstrual loss clearly explains it in premenopausal women', true, 4);

-- Q830
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('b630d74e-abd8-50b2-be7c-51d31e259dc1', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000036', 'sba', 'A 35 year old man with Crohn''s disease has had perianal pain and discharge from an opening beside the anus. What is the SINGLE most appropriate investigation?', 'Perianal Crohn''s disease includes fistulas, abscesses, skin tags and fissures. MRI pelvis defines fistula anatomy and abscesses. Examination under anaesthesia drains abscesses and places setons. Medical treatment: antibiotics and anti-TNF therapy (infliximab).', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v3')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = 'b630d74e-abd8-50b2-be7c-51d31e259dc1';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('67f626a2-bb0a-52a0-9707-140fd6d6459c', 'b630d74e-abd8-50b2-be7c-51d31e259dc1', 'A', 'CT chest', false, 0),
  ('d83dceb9-3a64-599b-8b7c-ee61089a8fe9', 'b630d74e-abd8-50b2-be7c-51d31e259dc1', 'B', 'Abdominal X-ray', false, 1),
  ('7145d542-f8fa-50dd-90cc-b60c5495a871', 'b630d74e-abd8-50b2-be7c-51d31e259dc1', 'C', 'Colonoscopy only', false, 2),
  ('475421c7-d38a-5edd-b1a5-e839822ce46b', 'b630d74e-abd8-50b2-be7c-51d31e259dc1', 'D', 'Barium enema', false, 3),
  ('8d1e8e3e-3f25-529a-84ca-9a019f01f4ae', 'b630d74e-abd8-50b2-be7c-51d31e259dc1', 'E', 'Pelvic MRI (to define perianal fistula anatomy and abscess)', true, 4);

