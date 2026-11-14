-- =============================================================================
-- PLAB 1 bank v6 part 04: Q601–792 (source plab1-xlsx-v6)
-- Source: PLAB1_Question_Bank_6.xlsx — additive; does not clear v1/v2/v3/v4
-- Safe to re-run (stable UUIDs).
-- =============================================================================

-- Ensure exam exists
insert into public.exams (id, slug, name, description, is_active) values ('a1000000-0000-4000-8000-000000000001', 'plab1', 'PLAB 1', 'PLAB 1 single best answer study bank (PLABoratory).', true) on conflict (slug) do update set name = excluded.name, is_active = true;


-- Q601
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('6e53c657-85b1-5d1b-84b7-0c4cfc199cfa', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000032', 'sba', 'A 50 year old woman has had a carotid Doppler showing a 60% stenosis on the left. She has had no symptoms. What is the SINGLE most appropriate management?', 'Asymptomatic carotid stenosis is generally managed medically. Symptomatic stenosis of 50-99% (NASCET) should be considered for endarterectomy within 2 weeks of the event.', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v6')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = '6e53c657-85b1-5d1b-84b7-0c4cfc199cfa';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('92aa0093-e21c-542f-94eb-ea32b4b463c5', '6e53c657-85b1-5d1b-84b7-0c4cfc199cfa', 'A', 'No treatment', false, 0),
  ('f70a3b1f-a31d-59de-a05a-b015fc0d4466', '6e53c657-85b1-5d1b-84b7-0c4cfc199cfa', 'B', 'Warfarin', false, 1),
  ('eda67ed5-1094-57d4-aaab-49456c79faf4', '6e53c657-85b1-5d1b-84b7-0c4cfc199cfa', 'C', 'Best medical therapy (antiplatelet, statin, BP control, smoking cessation)', true, 2),
  ('7483c3a1-bb97-5171-b8dd-d139eb6a7ec3', '6e53c657-85b1-5d1b-84b7-0c4cfc199cfa', 'D', 'Urgent carotid endarterectomy', false, 3),
  ('7c56b12f-ff6c-5ed6-8a95-9b37ffb6c6f3', '6e53c657-85b1-5d1b-84b7-0c4cfc199cfa', 'E', 'Carotid stenting in all', false, 4);

-- Q602
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('a2552105-4d90-52a6-b066-8c400def71c8', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000032', 'sba', 'A 72 year old man had a left carotid endarterectomy yesterday. He now has a rapidly expanding neck swelling and noisy breathing. What is the SINGLE most appropriate immediate action?', 'Neck haematoma after carotid or thyroid surgery can compress the airway. Remove sutures and evacuate the clot immediately, then return to theatre.', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v6')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = 'a2552105-4d90-52a6-b066-8c400def71c8';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('12a54653-a442-582c-833f-2a226ff061eb', 'a2552105-4d90-52a6-b066-8c400def71c8', 'A', 'Give IV antibiotics', false, 0),
  ('e9f04ce1-5eec-5414-8f09-65aa6d0f8165', 'a2552105-4d90-52a6-b066-8c400def71c8', 'B', 'Observe for 2 hours', false, 1),
  ('12fab838-b2fd-53b8-aec4-93b0c66e7c34', 'a2552105-4d90-52a6-b066-8c400def71c8', 'C', 'Give furosemide', false, 2),
  ('c4d7f2ae-e479-5036-a977-5b1d39cd6133', 'a2552105-4d90-52a6-b066-8c400def71c8', 'D', 'CT neck first', false, 3),
  ('84a89f94-11ea-5796-9f41-d0813a1f8afe', 'a2552105-4d90-52a6-b066-8c400def71c8', 'E', 'Open the wound at the bedside to release the haematoma, call for senior help and secure the airway', true, 4);

-- Q603
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('079987fe-568d-59df-8b7a-5ea74504d9e6', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000032', 'sba', 'A 40 year old woman with a history of DVT has chronic leg swelling, aching and heaviness, and brown pigmentation above the ankle. What is the SINGLE most likely diagnosis?', 'Post-thrombotic syndrome follows DVT and causes chronic venous insufficiency. Compression stockings relieve symptoms. Early anticoagulation reduces risk.', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v6')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = '079987fe-568d-59df-8b7a-5ea74504d9e6';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('efad9ac4-c741-53cc-9ddb-1f87175a7b77', '079987fe-568d-59df-8b7a-5ea74504d9e6', 'A', 'Cellulitis', false, 0),
  ('9a0c916d-48ca-5ea5-a005-621e9d591d87', '079987fe-568d-59df-8b7a-5ea74504d9e6', 'B', 'Heart failure', false, 1),
  ('14ccb887-21c2-5574-8f92-29cadc5005f5', '079987fe-568d-59df-8b7a-5ea74504d9e6', 'C', 'Lymphoedema only', false, 2),
  ('fa3dc252-1ecd-58d5-97e4-615bff301966', '079987fe-568d-59df-8b7a-5ea74504d9e6', 'D', 'Post-thrombotic syndrome', true, 3),
  ('bda9b1cb-5916-508d-b4ff-06ede7a70cc5', '079987fe-568d-59df-8b7a-5ea74504d9e6', 'E', 'Lipoedema', false, 4);

-- Q604
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('478c38de-0a41-5444-bd46-d95e2253cec9', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000032', 'sba', 'A 60 year old man has had leg swelling for years after radiotherapy for groin lymph node cancer. The swelling is non-pitting and he cannot pinch the skin at the base of the second toe. What is the SINGLE most likely diagnosis?', 'Lymphoedema is non-pitting in chronic stages. Stemmer''s sign is positive. Management: specialist lymphoedema service, compression, skin care, exercise and lymphatic drainage. Treat cellulitis promptly.', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v6')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = '478c38de-0a41-5444-bd46-d95e2253cec9';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('0add86da-212a-5f4b-b256-178e0d98b960', '478c38de-0a41-5444-bd46-d95e2253cec9', 'A', 'Secondary lymphoedema (positive Stemmer''s sign)', true, 0),
  ('30a4c937-4feb-517b-8c5a-7d1cf10117fb', '478c38de-0a41-5444-bd46-d95e2253cec9', 'B', 'DVT', false, 1),
  ('0babb38f-db0a-50dd-8383-92a52aad2fe7', '478c38de-0a41-5444-bd46-d95e2253cec9', 'C', 'Heart failure', false, 2),
  ('3f1af73a-a59d-51b8-9219-a1703f526305', '478c38de-0a41-5444-bd46-d95e2253cec9', 'D', 'Lipoedema', false, 3),
  ('3820abb2-7e55-50f7-8ff4-04d7c81ed7cb', '478c38de-0a41-5444-bd46-d95e2253cec9', 'E', 'Venous insufficiency', false, 4);

-- Q605
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('1dbbe28c-13a8-5a89-b452-f0eb019b4123', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000032', 'sba', 'A 35 year old woman has had symmetrical, painful swelling of both legs from hip to ankle with sparing of the feet. She bruises easily. What is the SINGLE most likely diagnosis?', 'Lipoedema is abnormal fat deposition in women, bilateral and symmetrical, sparing the feet (cuff sign), painful and with easy bruising. Stemmer''s sign is negative.', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v6')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = '1dbbe28c-13a8-5a89-b452-f0eb019b4123';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('bd6e84e0-f70a-5974-9cdd-ab348692aa9a', '1dbbe28c-13a8-5a89-b452-f0eb019b4123', 'A', 'Lymphoedema', false, 0),
  ('e996826a-9a5e-56b9-8f53-7ab8de60da4d', '1dbbe28c-13a8-5a89-b452-f0eb019b4123', 'B', 'Lipoedema', true, 1),
  ('f0cc3183-4f12-52ce-a1d2-11d54274ee47', '1dbbe28c-13a8-5a89-b452-f0eb019b4123', 'C', 'Hypothyroidism', false, 2),
  ('570d89f6-1be7-5a8d-bb65-397c64fa000d', '1dbbe28c-13a8-5a89-b452-f0eb019b4123', 'D', 'Heart failure', false, 3),
  ('6242121d-e78d-5f01-b371-284ce52b978d', '1dbbe28c-13a8-5a89-b452-f0eb019b4123', 'E', 'DVT', false, 4);

-- Q606
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('af6cf3a8-02da-5827-8ab7-a20f9149fe5c', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000032', 'sba', 'A 58 year old man with diabetes has had severe pain and black discolouration of his big toe for a week. Foot pulses are absent. The area is dry with a clear demarcation line. What is the SINGLE most appropriate management?', 'Dry gangrene from ischaemia needs revascularisation before amputation. Wet gangrene with infection is an emergency requiring debridement and antibiotics.', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v6')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = 'af6cf3a8-02da-5827-8ab7-a20f9149fe5c';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('d9713ceb-ee76-54a1-a636-317286e160a2', 'af6cf3a8-02da-5827-8ab7-a20f9149fe5c', 'A', 'Antibiotics only and discharge', false, 0),
  ('1d598b31-942c-5401-ba46-1b4cfbbc5152', 'af6cf3a8-02da-5827-8ab7-a20f9149fe5c', 'B', 'Wet dressings', false, 1),
  ('f646a61e-4033-5a84-a299-9d50ce1f7634', 'af6cf3a8-02da-5827-8ab7-a20f9149fe5c', 'C', 'Elevation only', false, 2),
  ('fce20e26-10c5-5a08-bbe6-f6f3fe36b5c0', 'af6cf3a8-02da-5827-8ab7-a20f9149fe5c', 'D', 'Debridement of the toe immediately on the ward', false, 3),
  ('f24422c4-21b9-5756-be63-0f8b381c4124', 'af6cf3a8-02da-5827-8ab7-a20f9149fe5c', 'E', 'Urgent vascular referral for imaging and revascularisation; keep the toe dry and protected', true, 4);

-- Q607
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('6fa87443-b6e0-55aa-8864-e9dd024cbe1b', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000037', 'sba', 'A 20 year old man has a smooth, painless swelling at the front of the sternocleidomastoid muscle in the upper neck. It became larger after a cold. What is the SINGLE most likely diagnosis?', 'Branchial cysts arise from the second branchial cleft and present in young adults. In older adults, a cystic neck lump may be a metastatic node (HPV-related oropharyngeal cancer), so imaging and FNA are needed.', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v6')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = '6fa87443-b6e0-55aa-8864-e9dd024cbe1b';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('c20a2fef-6f11-55cf-8b6b-c73fe22ab3e0', '6fa87443-b6e0-55aa-8864-e9dd024cbe1b', 'A', 'Carotid body tumour', false, 0),
  ('129c43f9-04c2-5c27-90c4-83db483a4cec', '6fa87443-b6e0-55aa-8864-e9dd024cbe1b', 'B', 'Lymphoma', false, 1),
  ('b05c7bf5-cf54-5689-871a-43c2e5a34427', '6fa87443-b6e0-55aa-8864-e9dd024cbe1b', 'C', 'Branchial cyst', true, 2),
  ('85f4c135-2e0a-5845-be57-5b7ec7d879cb', '6fa87443-b6e0-55aa-8864-e9dd024cbe1b', 'D', 'Thyroglossal cyst', false, 3),
  ('bbf17e2c-b43b-5625-b4c4-8456f6297603', '6fa87443-b6e0-55aa-8864-e9dd024cbe1b', 'E', 'Laryngocele', false, 4);

-- Q608
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('3a450586-d000-5324-b88d-d4a3c04fd601', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000037', 'sba', 'A 2 month old baby has a soft, fluctuant, transilluminating swelling in the posterior triangle of the neck. What is the SINGLE most likely diagnosis?', 'Cystic hygromas are congenital lymphatic malformations, often in the posterior triangle. They can compress the airway. Treatment: sclerotherapy or surgery.', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v6')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = '3a450586-d000-5324-b88d-d4a3c04fd601';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('04fe638a-ee54-54ae-ab54-ce36359ce3b7', '3a450586-d000-5324-b88d-d4a3c04fd601', 'A', 'Lymphadenitis', false, 0),
  ('e0e5bcf8-46c9-507e-b59f-9956b8606a19', '3a450586-d000-5324-b88d-d4a3c04fd601', 'B', 'Haemangioma', false, 1),
  ('30c1eb6e-0f20-5edb-857b-1b30d9f52f97', '3a450586-d000-5324-b88d-d4a3c04fd601', 'C', 'Branchial cyst', false, 2),
  ('bdf11852-b04d-5972-b53f-8e58e5fd4176', '3a450586-d000-5324-b88d-d4a3c04fd601', 'D', 'Cystic hygroma (lymphatic malformation)', true, 3),
  ('aa12edfc-7c1d-5f1c-982f-c55cffd92397', '3a450586-d000-5324-b88d-d4a3c04fd601', 'E', 'Thyroglossal cyst', false, 4);

-- Q609
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('056f7084-55a7-5b9c-ac56-4aecd5f2cb9d', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000037', 'sba', 'A 55 year old man has a pulsatile mass at the angle of his jaw that moves side to side but not up and down. CT angiogram shows splaying of the carotid bifurcation (lyre sign). What is the SINGLE most likely diagnosis?', 'Carotid body tumours are rare paragangliomas. Do not biopsy. Treatment: surgical excision. Some are hereditary (SDH mutations).', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v6')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = '056f7084-55a7-5b9c-ac56-4aecd5f2cb9d';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('97f7e5bb-685a-5817-87dc-cf24315b2fce', '056f7084-55a7-5b9c-ac56-4aecd5f2cb9d', 'A', 'Branchial cyst', false, 0),
  ('06b49571-732f-5dcc-a34e-0b6684688669', '056f7084-55a7-5b9c-ac56-4aecd5f2cb9d', 'B', 'Lymph node', false, 1),
  ('df582e58-f5d0-58ae-b315-b7686921bf62', '056f7084-55a7-5b9c-ac56-4aecd5f2cb9d', 'C', 'Carotid body tumour (paraganglioma)', true, 2),
  ('e8fbb96c-eeb8-5b41-b8ca-12fa98dd5214', '056f7084-55a7-5b9c-ac56-4aecd5f2cb9d', 'D', 'Carotid aneurysm', false, 3),
  ('c7c6c690-7bc5-5195-9223-bf7a7abad1d0', '056f7084-55a7-5b9c-ac56-4aecd5f2cb9d', 'E', 'Pleomorphic adenoma', false, 4);

-- Q610
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('588a4112-cb58-5b78-bf2d-a694ec75d602', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000037', 'sba', 'A 60 year old man has had a painful swelling of his jaw after a dental extraction. He takes IV zoledronic acid for myeloma. Exposed bone has been visible for 10 weeks. What is the SINGLE most likely diagnosis?', 'MRONJ is exposed bone for over 8 weeks in people on antiresorptive or antiangiogenic drugs without previous jaw radiotherapy. Prevention: dental check before starting therapy. Refer to oral surgery.', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v6')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = '588a4112-cb58-5b78-bf2d-a694ec75d602';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('49376bca-f062-5fcb-9adb-3f0267a09313', '588a4112-cb58-5b78-bf2d-a694ec75d602', 'A', 'Oral cancer', false, 0),
  ('79188f17-9f9a-57fc-8492-216b4f39303e', '588a4112-cb58-5b78-bf2d-a694ec75d602', 'B', 'Osteoradionecrosis', false, 1),
  ('501ca1e4-c88b-5e10-a670-445953499dd3', '588a4112-cb58-5b78-bf2d-a694ec75d602', 'C', 'Actinomycosis', false, 2),
  ('216bb3c6-2c1a-5ee6-8a19-2008547042bc', '588a4112-cb58-5b78-bf2d-a694ec75d602', 'D', 'Dry socket', false, 3),
  ('17213fb0-9bc1-5f96-b20e-c4f33b05af9a', '588a4112-cb58-5b78-bf2d-a694ec75d602', 'E', 'Medication-related osteonecrosis of the jaw (MRONJ)', true, 4);

-- Q611
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('66642fd1-7ecb-5d3d-9228-da8e3346b5ff', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000037', 'sba', 'A 7 year old boy has had bilateral painful swelling of the parotid glands and fever. He has not had the MMR vaccine. What is a recognised complication in post-pubertal males?', 'Mumps complications: orchitis (after puberty), meningitis, encephalitis, pancreatitis and sensorineural deafness. Mumps is notifiable in England.', null, true, true, jsonb_build_object('source', 'plab1-xlsx-v6')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = '66642fd1-7ecb-5d3d-9228-da8e3346b5ff';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('af909220-f13a-5760-8ae5-d0bf4155138a', '66642fd1-7ecb-5d3d-9228-da8e3346b5ff', 'A', 'Thyroiditis only', false, 0),
  ('2feaac3a-2c0e-5ab9-8ee3-4410fcc69ba4', '66642fd1-7ecb-5d3d-9228-da8e3346b5ff', 'B', 'Kawasaki disease', false, 1),
  ('e8c319fc-427e-5aaa-8d0b-eaa492b4201b', '66642fd1-7ecb-5d3d-9228-da8e3346b5ff', 'C', 'Meningioma', false, 2),
  ('446c0243-d71f-5783-b564-dca37ce8081d', '66642fd1-7ecb-5d3d-9228-da8e3346b5ff', 'D', 'Pancreatic cancer', false, 3),
  ('59bc5b03-ece3-5525-851c-655096ff001e', '66642fd1-7ecb-5d3d-9228-da8e3346b5ff', 'E', 'Orchitis', true, 4);

-- Q612
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('75143b14-07ee-594d-8464-0a6e07e1a5ee', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000037', 'sba', 'A 3 year old child has a red, raised, soft lesion on the lip that appeared at 2 weeks of age and grew quickly. It is now beginning to fade. What is the SINGLE most likely diagnosis?', 'Infantile haemangiomas appear soon after birth, grow rapidly and involute over years. Propranolol is used for problematic lesions (near eyes, airway, lips, or ulceration).', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v6')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = '75143b14-07ee-594d-8464-0a6e07e1a5ee';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('56f61ee5-668e-57dd-9364-8bcce9d9540f', '75143b14-07ee-594d-8464-0a6e07e1a5ee', 'A', 'Pyogenic granuloma', false, 0),
  ('374ba3fc-be9b-5352-9f0d-1aebc72005bd', '75143b14-07ee-594d-8464-0a6e07e1a5ee', 'B', 'Infantile haemangioma', true, 1),
  ('86f55e5d-b7c8-5a98-b716-22eb5c10d9ff', '75143b14-07ee-594d-8464-0a6e07e1a5ee', 'C', 'Port-wine stain', false, 2),
  ('0f96d099-b998-546f-a3d4-51afbc54e8cf', '75143b14-07ee-594d-8464-0a6e07e1a5ee', 'D', 'Venous malformation', false, 3),
  ('222c4b78-161b-5dae-9758-1b743f62f50c', '75143b14-07ee-594d-8464-0a6e07e1a5ee', 'E', 'Melanoma', false, 4);

-- Q613
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('97a6e382-6e56-5702-a75f-7227c30d906f', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000037', 'sba', 'A 35 year old man has had numbness of his lower lip and chin after a lower wisdom tooth extraction. What nerve is MOST likely injured?', 'Inferior alveolar nerve injury causes numbness of the lower lip and chin (mental nerve area). Lingual nerve injury causes numbness and taste loss of the anterior tongue. Most recover.', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v6')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = '97a6e382-6e56-5702-a75f-7227c30d906f';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('1f178aad-5d65-58fa-afc2-390942e1e96c', '97a6e382-6e56-5702-a75f-7227c30d906f', 'A', 'Facial nerve', false, 0),
  ('7562b318-4652-534c-aeff-13950461aae6', '97a6e382-6e56-5702-a75f-7227c30d906f', 'B', 'Infraorbital nerve', false, 1),
  ('82aec49e-8ee0-5b6a-b64d-bfd4e192768c', '97a6e382-6e56-5702-a75f-7227c30d906f', 'C', 'Hypoglossal nerve', false, 2),
  ('06b946d4-504d-5de1-95dc-d50a13a56cbd', '97a6e382-6e56-5702-a75f-7227c30d906f', 'D', 'Inferior alveolar nerve', true, 3),
  ('6500c49a-0037-5a6f-97ee-9caa490a83c2', '97a6e382-6e56-5702-a75f-7227c30d906f', 'E', 'Lingual nerve', false, 4);

-- Q614
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('be4383bf-46b3-519b-bd76-cc78c143c705', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000028', 'sba', 'A doctor makes a prescribing error that harms a patient. What does the professional duty of candour require?', 'GMC and NMC duty of candour: be open and honest when things go wrong. An apology is not an admission of legal liability. The statutory duty of candour applies to organisations for notifiable incidents.', null, true, true, jsonb_build_object('source', 'plab1-xlsx-v6', 'guidelines_text', 'GMC')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = 'be4383bf-46b3-519b-bd76-cc78c143c705';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('65404ea9-db73-5575-a87c-e9501e1c53e1', 'be4383bf-46b3-519b-bd76-cc78c143c705', 'A', 'Inform only if the harm is serious', false, 0),
  ('b7bcda2e-e35c-5745-b6bd-0b2483d816c5', 'be4383bf-46b3-519b-bd76-cc78c143c705', 'B', 'Wait until a complaint is made', false, 1),
  ('8a3021e7-b652-523d-9993-24ce537f06e6', 'be4383bf-46b3-519b-bd76-cc78c143c705', 'C', 'Document but not inform the patient', false, 2),
  ('a20093e2-3d9b-51f9-b307-ce1f5fd8f27e', 'be4383bf-46b3-519b-bd76-cc78c143c705', 'D', 'Tell the patient (or family) when something goes wrong, apologise, offer a remedy and explain the consequences', true, 3),
  ('8913003d-8280-5a05-a774-ed4204c4ff3e', 'be4383bf-46b3-519b-bd76-cc78c143c705', 'E', 'Only tell your supervisor', false, 4);

-- Q615
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('49bb5021-7c56-547c-bda9-fc937516e91c', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000028', 'sba', 'A trainee doctor is asked to perform a procedure she has never done, with no supervision. What is the MOST appropriate action?', 'GMC Good Medical Practice: recognise and work within the limits of your competence. Patient safety comes first.', null, true, true, jsonb_build_object('source', 'plab1-xlsx-v6', 'guidelines_text', 'GMC')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = '49bb5021-7c56-547c-bda9-fc937516e91c';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('1783b421-d452-52c8-b1c6-eca73135e61f', '49bb5021-7c56-547c-bda9-fc937516e91c', 'A', 'Do it anyway', false, 0),
  ('828984d6-c0f3-5fcf-9eb2-ef2f71b4ae7b', '49bb5021-7c56-547c-bda9-fc937516e91c', 'B', 'Watch a video and do it', false, 1),
  ('9c11ea11-7df6-57ee-b92a-1840688aeac4', '49bb5021-7c56-547c-bda9-fc937516e91c', 'C', 'Leave the hospital', false, 2),
  ('8f09953b-bb56-5bb6-87b9-dbe93ea9883b', '49bb5021-7c56-547c-bda9-fc937516e91c', 'D', 'Ask a nurse to do it', false, 3),
  ('57b00aae-4188-5983-8f6e-3132a2d15c31', '49bb5021-7c56-547c-bda9-fc937516e91c', 'E', 'Explain that she is not competent and seek supervision or senior help', true, 4);

-- Q616
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('5cdb39b3-2256-5d97-a61a-a9f4d221d311', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000028', 'sba', 'A doctor notices a colleague often smells of alcohol on shift. What is the MOST appropriate first action?', 'Concerns about a colleague''s health or conduct that may put patients at risk must be raised. Escalate locally first; the GMC if local action is inadequate or the risk is serious.', null, true, true, jsonb_build_object('source', 'plab1-xlsx-v6', 'guidelines_text', 'GMC')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = '5cdb39b3-2256-5d97-a61a-a9f4d221d311';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('e53ec8c9-d679-563d-a53d-218518115c0e', '5cdb39b3-2256-5d97-a61a-a9f4d221d311', 'A', 'Raise the concern with a senior (e.g. clinical director) to protect patients and support the colleague', true, 0),
  ('ca5508b1-6581-57c0-906f-00b30a10c42e', '5cdb39b3-2256-5d97-a61a-a9f4d221d311', 'B', 'Ignore it', false, 1),
  ('5c4cfa47-83c2-5de7-b39c-7b310d3c9b61', '5cdb39b3-2256-5d97-a61a-a9f4d221d311', 'C', 'Report directly to the police', false, 2),
  ('16926578-1e8b-5d26-ac7a-373fd070fcdd', '5cdb39b3-2256-5d97-a61a-a9f4d221d311', 'D', 'Confront the colleague in front of patients', false, 3),
  ('12be9338-9d51-5c89-98da-711149f21c2d', '5cdb39b3-2256-5d97-a61a-a9f4d221d311', 'E', 'Post on social media', false, 4);

-- Q617
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('933480dd-a9cb-5b8d-9b1e-d71776885c59', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000028', 'sba', 'A team is designing a new process for giving insulin. Which approach BEST identifies potential failures before they happen?', 'FMEA is a prospective technique that looks at each step for possible failures, their effects and likelihood. Root cause analysis is retrospective after an incident.', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v6')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = '933480dd-a9cb-5b8d-9b1e-d71776885c59';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('7111de8f-d273-5913-bbda-f072da923cad', '933480dd-a9cb-5b8d-9b1e-d71776885c59', 'A', 'Patient survey', false, 0),
  ('1ba54083-1a8b-5686-8aa7-f6f8fb34ce4f', '933480dd-a9cb-5b8d-9b1e-d71776885c59', 'B', 'Complaint review', false, 1),
  ('7be7d79a-2b0d-576e-bdc4-034eaff6d1bd', '933480dd-a9cb-5b8d-9b1e-d71776885c59', 'C', 'Root cause analysis', false, 2),
  ('cfae7678-5fc7-5675-8856-e03993b089bc', '933480dd-a9cb-5b8d-9b1e-d71776885c59', 'D', 'Failure mode and effects analysis (FMEA)', true, 3),
  ('adf9cce5-1faa-507a-999b-971371bda09d', '933480dd-a9cb-5b8d-9b1e-d71776885c59', 'E', 'Incident report', false, 4);

-- Q618
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('9435cce1-7852-5959-8b44-f5f3f683fe79', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000028', 'sba', 'A hospital uses SBAR for telephone referrals. What does the ''A'' stand for?', 'SBAR: Situation, Background, Assessment, Recommendation. It structures communication, particularly when escalating to seniors.', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v6')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = '9435cce1-7852-5959-8b44-f5f3f683fe79';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('a2c57f35-96f1-5ae4-a8ee-0c335f376fef', '9435cce1-7852-5959-8b44-f5f3f683fe79', 'A', 'Assessment', true, 0),
  ('c98c2143-8969-59d3-a04c-13aadb70d43e', '9435cce1-7852-5959-8b44-f5f3f683fe79', 'B', 'Allergy', false, 1),
  ('b4e1dbdb-79c0-58c4-818c-cae8a71cfb0b', '9435cce1-7852-5959-8b44-f5f3f683fe79', 'C', 'Action', false, 2),
  ('e61e8034-e10f-56d5-968e-96001afe806e', '9435cce1-7852-5959-8b44-f5f3f683fe79', 'D', 'Airway', false, 3),
  ('9b7433fe-2f85-5d24-9e64-01c084396d4a', '9435cce1-7852-5959-8b44-f5f3f683fe79', 'E', 'Admission', false, 4);

-- Q619
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('6eb51625-3f51-5e66-8c0e-54f18e85f9fc', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000028', 'sba', 'A new doctor is told that the ward has ''always done it this way''. She finds the practice is against guidelines. What is the BEST approach?', 'Normalisation of deviance occurs when unsafe practice becomes accepted. Raise concerns, use audit and work with the team to improve.', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v6')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = '6eb51625-3f51-5e66-8c0e-54f18e85f9fc';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('a2841c33-20a9-5fe2-bdd7-e018c772fcd4', '6eb51625-3f51-5e66-8c0e-54f18e85f9fc', 'A', 'Raise the concern constructively with senior colleagues and suggest a review or audit', true, 0),
  ('34cca7d0-2a93-51a9-8e83-53ca835ed06c', '6eb51625-3f51-5e66-8c0e-54f18e85f9fc', 'B', 'Report the ward to the press', false, 1),
  ('141203e5-f629-585e-a37d-e12028e8050a', '6eb51625-3f51-5e66-8c0e-54f18e85f9fc', 'C', 'Change it alone without discussion', false, 2),
  ('4b30e685-2295-533c-87a1-56c293b2230a', '6eb51625-3f51-5e66-8c0e-54f18e85f9fc', 'D', 'Follow the ward practice', false, 3),
  ('68e60ff9-6724-5e60-8785-372bbaadc8af', '6eb51625-3f51-5e66-8c0e-54f18e85f9fc', 'E', 'Ignore it', false, 4);

-- Q620
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('d0b059f6-985f-5f61-aa89-6ae60456e9f4', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000028', 'sba', 'A patient group wants to help design a new outpatient clinic. What is this involvement called?', 'Co-production involves patients as partners in designing services. It improves acceptability and outcomes.', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v6')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = 'd0b059f6-985f-5f61-aa89-6ae60456e9f4';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('1a585a0c-fb21-501b-ab8c-73927b9bdd76', 'd0b059f6-985f-5f61-aa89-6ae60456e9f4', 'A', 'Consent', false, 0),
  ('0d654810-dc54-5e58-ae1c-f6a892b57776', 'd0b059f6-985f-5f61-aa89-6ae60456e9f4', 'B', 'Paternalism', false, 1),
  ('c27a234a-67e6-59d3-9aee-695e4322def4', 'd0b059f6-985f-5f61-aa89-6ae60456e9f4', 'C', 'Research', false, 2),
  ('06091485-abad-5f2f-a0db-44eadf57733c', 'd0b059f6-985f-5f61-aa89-6ae60456e9f4', 'D', 'Audit', false, 3),
  ('5a2a12fc-539a-5332-9948-b4e1b5dc9a77', 'd0b059f6-985f-5f61-aa89-6ae60456e9f4', 'E', 'Co-production (patient and public involvement)', true, 4);

-- Q621
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('3d6db916-319a-5a79-995c-5933a1fdd737', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000028', 'sba', 'A busy emergency department has rising waiting times. The team wants to see which steps in the patient journey cause most delay. Which tool is MOST useful?', 'Process mapping lays out each step to identify waste, bottlenecks and duplication. It is often used with Lean methodology.', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v6')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = '3d6db916-319a-5a79-995c-5933a1fdd737';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('1e2ddf64-e0d1-5e78-95b2-1aad27d7fdc1', '3d6db916-319a-5a79-995c-5933a1fdd737', 'A', 'Funnel plot', false, 0),
  ('1b98db14-c360-5519-8ec1-635c3c4dd989', '3d6db916-319a-5a79-995c-5933a1fdd737', 'B', 'Pareto chart', false, 1),
  ('3a344cc7-220d-5235-8159-5961a3423b34', '3d6db916-319a-5a79-995c-5933a1fdd737', 'C', 'Process mapping', true, 2),
  ('aa2db4af-59c6-5d66-9e4c-f7930722482f', '3d6db916-319a-5a79-995c-5933a1fdd737', 'D', 'Fishbone diagram', false, 3),
  ('13af7225-0d97-52b9-a43d-69d3c99cb2d1', '3d6db916-319a-5a79-995c-5933a1fdd737', 'E', 'Forest plot', false, 4);

-- Q622
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('4a99de97-0662-5bd1-86c0-bd23d6714e6d', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000028', 'sba', 'Hospital mortality rates are compared using a chart that shows which hospitals fall outside control limits based on their size. What is this chart called?', 'Funnel plots compare institutions against control limits that narrow with larger numbers. Outliers prompt investigation. Statistical process control (SPC) charts track variation over time.', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v6')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = '4a99de97-0662-5bd1-86c0-bd23d6714e6d';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('fb0917d5-a546-5125-bcd3-e455da735a75', '4a99de97-0662-5bd1-86c0-bd23d6714e6d', 'A', 'Box plot', false, 0),
  ('6c560d46-159c-5085-a6c4-8fb1716f4a73', '4a99de97-0662-5bd1-86c0-bd23d6714e6d', 'B', 'Pie chart', false, 1),
  ('61073159-410e-538d-a9c4-4fed1a4ab45f', '4a99de97-0662-5bd1-86c0-bd23d6714e6d', 'C', 'Kaplan-Meier curve', false, 2),
  ('c2bff1e0-2f8f-50f1-9a85-dd37b958428f', '4a99de97-0662-5bd1-86c0-bd23d6714e6d', 'D', 'Funnel plot', true, 3),
  ('ee407e91-05e5-5658-9f00-04f78296cfa8', '4a99de97-0662-5bd1-86c0-bd23d6714e6d', 'E', 'Run chart', false, 4);

-- Q623
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('ecd04a4c-5005-547a-bc6e-f7c352cedc8d', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000028', 'sba', 'A nurse double-checks a controlled drug dose with a colleague. The second checker just signs without checking. What human factor is this?', 'Independent double checks only work if both people check independently. Confirmation bias and complacency reduce their effectiveness.', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v6')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = 'ecd04a4c-5005-547a-bc6e-f7c352cedc8d';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('9d2b607a-10ee-548c-8dfb-b1ab0a28b72e', 'ecd04a4c-5005-547a-bc6e-f7c352cedc8d', 'A', 'Fatigue only', false, 0),
  ('2b1bede3-f1b6-5c8f-84d3-604d3d635553', 'ecd04a4c-5005-547a-bc6e-f7c352cedc8d', 'B', 'Leadership', false, 1),
  ('3c5deed7-344b-515d-bacd-c5bc0c8ec7f9', 'ecd04a4c-5005-547a-bc6e-f7c352cedc8d', 'C', 'Situational awareness', false, 2),
  ('08b588b2-6b55-5242-96ce-7321851be37b', 'ecd04a4c-5005-547a-bc6e-f7c352cedc8d', 'D', 'Complacency (automation or check bias); both checkers must independently verify', true, 3),
  ('0a2f24c4-1bb0-5e64-8ea5-3c924b00cfad', 'ecd04a4c-5005-547a-bc6e-f7c352cedc8d', 'E', 'Good teamwork', false, 4);

-- Q624
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('62f4fbb7-5d35-514f-8f15-9a9c6adea3f2', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000016', 'sba', 'A 75 year old woman has had an intertrochanteric (extracapsular) fracture of her femur. What is the SINGLE most appropriate operation?', 'NICE CG124: extracapsular trochanteric fractures are treated with a sliding hip screw (intramedullary nail for subtrochanteric fractures). Displaced intracapsular fractures: arthroplasty. Surgery on the day of or day after admission.', null, true, true, jsonb_build_object('source', 'plab1-xlsx-v6', 'guidelines_text', 'NICE CG124')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = '62f4fbb7-5d35-514f-8f15-9a9c6adea3f2';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('b1aaea60-3a08-5420-839a-2ec543b4d107', '62f4fbb7-5d35-514f-8f15-9a9c6adea3f2', 'A', 'Sliding hip screw (dynamic hip screw)', true, 0),
  ('8e6ddf66-6578-5f14-a428-e31108126353', '62f4fbb7-5d35-514f-8f15-9a9c6adea3f2', 'B', 'Hemiarthroplasty', false, 1),
  ('ac25193b-ab50-5895-ade2-625d1b4f06eb', '62f4fbb7-5d35-514f-8f15-9a9c6adea3f2', 'C', 'Cannulated screws', false, 2),
  ('f730f57d-04cb-5c4a-8255-4b72b5f574f5', '62f4fbb7-5d35-514f-8f15-9a9c6adea3f2', 'D', 'Total hip replacement', false, 3),
  ('ee7a5dba-0c9c-51ad-8f0c-bb188d383f3d', '62f4fbb7-5d35-514f-8f15-9a9c6adea3f2', 'E', 'Non-operative traction', false, 4);

-- Q625
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('6ea76a74-b1dd-5e59-bd6f-1716165a2cd0', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000016', 'sba', 'A 82 year old woman has a displaced intracapsular fracture of the femoral neck. She walks independently outdoors with a stick and has no cognitive impairment. What is the SINGLE most appropriate operation?', 'NICE CG124: offer total hip replacement to people with displaced intracapsular fractures who were able to walk independently outdoors with no more than a stick, are not cognitively impaired, and are medically fit. Otherwise hemiarthroplasty.', null, true, true, jsonb_build_object('source', 'plab1-xlsx-v6', 'guidelines_text', 'NICE CG124')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = '6ea76a74-b1dd-5e59-bd6f-1716165a2cd0';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('5bdedc7f-a161-5f1e-a79c-58a82399a557', '6ea76a74-b1dd-5e59-bd6f-1716165a2cd0', 'A', 'Dynamic hip screw', false, 0),
  ('60d36fa5-94b1-56b6-bc92-75a271c16563', '6ea76a74-b1dd-5e59-bd6f-1716165a2cd0', 'B', 'Hemiarthroplasty', false, 1),
  ('9c0b1031-fbde-59f6-8895-5f578ebf948d', '6ea76a74-b1dd-5e59-bd6f-1716165a2cd0', 'C', 'Cannulated screws', false, 2),
  ('74e37246-3459-5d21-a4c3-d1f20501c43a', '6ea76a74-b1dd-5e59-bd6f-1716165a2cd0', 'D', 'Total hip replacement', true, 3),
  ('c80fa5f1-c3e7-58c3-9ff3-c7cea308138d', '6ea76a74-b1dd-5e59-bd6f-1716165a2cd0', 'E', 'Conservative management', false, 4);

-- Q626
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('b1c4f668-6e28-56a5-8b95-5557ee2af2be', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000016', 'sba', 'A 68 year old man has had back pain and leg pain on walking, relieved by bending forwards or sitting. Pedal pulses are normal. He can cycle without pain. What is the SINGLE most likely diagnosis?', 'Neurogenic claudication is relieved by flexion (cycling, leaning on a trolley). Vascular claudication is relieved by standing still. MRI confirms. Surgical decompression if severe.', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v6')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = 'b1c4f668-6e28-56a5-8b95-5557ee2af2be';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('098dd8be-0a50-5280-9b2e-8c99aac2ff7f', 'b1c4f668-6e28-56a5-8b95-5557ee2af2be', 'A', 'Peripheral arterial disease', false, 0),
  ('4fff134f-777d-5108-b7ff-fa43f0a05106', 'b1c4f668-6e28-56a5-8b95-5557ee2af2be', 'B', 'Ankylosing spondylitis', false, 1),
  ('f8498398-390d-5918-b36d-0cc1970d6ac6', 'b1c4f668-6e28-56a5-8b95-5557ee2af2be', 'C', 'Hip OA', false, 2),
  ('65867b34-33da-5a70-8f06-96b58426beb3', 'b1c4f668-6e28-56a5-8b95-5557ee2af2be', 'D', 'Disc prolapse', false, 3),
  ('c87d1291-7d00-547e-94e4-ad750ad337e9', 'b1c4f668-6e28-56a5-8b95-5557ee2af2be', 'E', 'Lumbar spinal stenosis (neurogenic claudication)', true, 4);

-- Q627
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('63e5cc90-c7c9-5636-87ef-967bace747d7', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000016', 'sba', 'A 40 year old man has had sudden back pain after lifting. He now has pain radiating to the outer foot, reduced ankle reflex and weak plantar flexion. What nerve root is MOST likely affected?', 'S1 radiculopathy: pain to the sole and lateral foot, reduced ankle jerk, weak plantar flexion. L5: dorsum of foot, weak great toe extension and foot dorsiflexion. L4: medial leg, reduced knee jerk.', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v6')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = '63e5cc90-c7c9-5636-87ef-967bace747d7';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('3f971f1b-0d50-5610-8a99-f0b5b3601dc5', '63e5cc90-c7c9-5636-87ef-967bace747d7', 'A', 'L4', false, 0),
  ('60e4225e-29bc-5280-8115-8717e2410ff8', '63e5cc90-c7c9-5636-87ef-967bace747d7', 'B', 'S1', true, 1),
  ('e335c899-56cd-5eb7-a0e9-c97f1f3b9957', '63e5cc90-c7c9-5636-87ef-967bace747d7', 'C', 'L2', false, 2),
  ('9c6f65fb-ae24-5b03-944b-50f7fe83f588', '63e5cc90-c7c9-5636-87ef-967bace747d7', 'D', 'L3', false, 3),
  ('d1758755-6c13-5794-ba2c-776ffa0c7f4e', '63e5cc90-c7c9-5636-87ef-967bace747d7', 'E', 'L5', false, 4);

-- Q628
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('e850e39a-ed76-5b20-a519-fdaf47f82704', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000016', 'sba', 'A 40 year old woman has had back pain with numbness around her anus, difficulty passing urine and weak legs. What is the SINGLE most appropriate management?', 'Cauda equina syndrome is usually caused by a central disc prolapse. Red flags: saddle anaesthesia, bladder or bowel dysfunction, bilateral sciatica, sexual dysfunction. Emergency MRI and decompression.', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v6')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = 'e850e39a-ed76-5b20-a519-fdaf47f82704';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('3722edfd-472e-5105-96eb-8bc8bd2c2128', 'e850e39a-ed76-5b20-a519-fdaf47f82704', 'A', 'Emergency MRI of the lumbar spine and urgent neurosurgical referral (cauda equina syndrome)', true, 0),
  ('82ddf3f2-f48a-5802-a648-c44811c98413', 'e850e39a-ed76-5b20-a519-fdaf47f82704', 'B', 'Bed rest', false, 1),
  ('a553f5e7-33c9-562d-b9ca-2ba9bac5448a', 'e850e39a-ed76-5b20-a519-fdaf47f82704', 'C', 'Review in 1 week', false, 2),
  ('7a81621e-3521-5678-8d92-282f49ba0db8', 'e850e39a-ed76-5b20-a519-fdaf47f82704', 'D', 'Routine MRI in 6 weeks', false, 3),
  ('fbe3c86a-ea9e-5282-b918-14d0327e25f8', 'e850e39a-ed76-5b20-a519-fdaf47f82704', 'E', 'Analgesia and physiotherapy', false, 4);

-- Q629
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('db37311b-c2af-5e6c-9c50-2b5a77ee94ce', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000016', 'sba', 'A 14 year old girl has had an uneven shoulder line. Forward bending shows a rib hump on the right. She has no pain. What is the SINGLE most likely diagnosis?', 'Idiopathic scoliosis is common in adolescent girls and is painless. Adam''s forward bend test shows a rib hump. Painful scoliosis needs investigation. Bracing or surgery depending on the curve.', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v6')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = 'db37311b-c2af-5e6c-9c50-2b5a77ee94ce';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('ea73c069-399b-5633-a2c6-a87e0ae6692b', 'db37311b-c2af-5e6c-9c50-2b5a77ee94ce', 'A', 'Scheuermann''s kyphosis', false, 0),
  ('45b15539-9d21-5e5f-9d20-e0220091f4b5', 'db37311b-c2af-5e6c-9c50-2b5a77ee94ce', 'B', 'Neurofibromatosis', false, 1),
  ('9e823977-2c69-5795-9856-f2ca7d5724b5', 'db37311b-c2af-5e6c-9c50-2b5a77ee94ce', 'C', 'Adolescent idiopathic scoliosis', true, 2),
  ('bac19fef-5525-51e4-9006-b9c373676471', 'db37311b-c2af-5e6c-9c50-2b5a77ee94ce', 'D', 'Spondylolisthesis', false, 3),
  ('01a28660-182e-502b-8ae1-f44b55485839', 'db37311b-c2af-5e6c-9c50-2b5a77ee94ce', 'E', 'Leg length discrepancy', false, 4);

-- Q630
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('3030d234-85b1-59e1-a647-152593eedcad', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000016', 'sba', 'A 16 year old boy has had a rounded, rigid upper back and back ache. X-ray shows wedging of three adjacent thoracic vertebrae. What is the SINGLE most likely diagnosis?', 'Scheuermann''s kyphosis is structural (does not correct on extension) with wedging of 3 or more vertebrae of 5 degrees or more. Treatment: physiotherapy, bracing, rarely surgery.', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v6')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = '3030d234-85b1-59e1-a647-152593eedcad';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('33d60b60-a2cf-5ca3-a816-f149eedf921f', '3030d234-85b1-59e1-a647-152593eedcad', 'A', 'Scheuermann''s disease', true, 0),
  ('bf561513-702a-5e5d-ae19-1ec14c7ee7a8', '3030d234-85b1-59e1-a647-152593eedcad', 'B', 'Osteoporotic fractures', false, 1),
  ('edafea11-3c30-5df9-a56b-dd5bea5e0e8d', '3030d234-85b1-59e1-a647-152593eedcad', 'C', 'Spinal TB', false, 2),
  ('094fe4c7-c81b-58b4-9302-66a4047e25d0', '3030d234-85b1-59e1-a647-152593eedcad', 'D', 'Ankylosing spondylitis', false, 3),
  ('0e3e7bbc-2929-5bfd-822f-fcb112114e04', '3030d234-85b1-59e1-a647-152593eedcad', 'E', 'Postural kyphosis', false, 4);

-- Q631
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('d71adcb5-8ee0-5447-9fae-809c8c5fd135', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000016', 'sba', 'A 30 year old man has had back pain and fever. He injects drugs. MRI shows destruction of a disc space and adjacent vertebral bodies. What is the SINGLE most likely diagnosis?', 'Spinal infection affects the disc and adjacent vertebrae (tumours usually spare the disc). Blood cultures and biopsy before antibiotics if stable. Look for endocarditis. Watch for epidural abscess.', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v6')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = 'd71adcb5-8ee0-5447-9fae-809c8c5fd135';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('b2e98b8c-f5db-55df-8500-dd1541fc01f8', 'd71adcb5-8ee0-5447-9fae-809c8c5fd135', 'A', 'Ankylosing spondylitis', false, 0),
  ('5c9c2bc1-b593-5dde-b324-009266370380', 'd71adcb5-8ee0-5447-9fae-809c8c5fd135', 'B', 'Discitis and vertebral osteomyelitis (often S. aureus)', true, 1),
  ('dc7126e9-a85c-5ca8-badd-1ad67efe4ad1', 'd71adcb5-8ee0-5447-9fae-809c8c5fd135', 'C', 'Osteoporotic fracture', false, 2),
  ('485ab4bd-fd04-595e-b39b-1b969667ced8', 'd71adcb5-8ee0-5447-9fae-809c8c5fd135', 'D', 'Spinal metastases', false, 3),
  ('8379aa2b-91d8-5c2c-b618-02044b6b6bf2', 'd71adcb5-8ee0-5447-9fae-809c8c5fd135', 'E', 'Disc prolapse', false, 4);

-- Q632
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('1a47b900-3df6-5d33-b860-4bf7aac9ab19', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000016', 'sba', 'A 75 year old woman has had sudden back pain after lifting a shopping bag. X-ray shows a wedge fracture of L1. She has no neurological signs. What is the SINGLE most likely cause and next step?', 'Vertebral fragility fractures are often a first sign of osteoporosis. Exclude myeloma and metastases if features suggest (raised ESR, weight loss, abnormal calcium).', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v6')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = '1a47b900-3df6-5d33-b860-4bf7aac9ab19';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('4df8a82b-dc05-522d-a4df-1173c1616e17', '1a47b900-3df6-5d33-b860-4bf7aac9ab19', 'A', 'Infection; IV antibiotics', false, 0),
  ('00df00e3-affb-5cc8-9126-f4f8c11f916c', '1a47b900-3df6-5d33-b860-4bf7aac9ab19', 'B', 'Trauma; surgery', false, 1),
  ('03282b22-e7b6-5c50-a70b-f21f93185a44', '1a47b900-3df6-5d33-b860-4bf7aac9ab19', 'C', 'Osteoporotic vertebral fracture; analgesia, mobilisation and assess for osteoporosis (DEXA, bisphosphonate)', true, 2),
  ('85d1c358-2ab7-5c8f-9ef4-d6c59964e043', '1a47b900-3df6-5d33-b860-4bf7aac9ab19', 'D', 'Metastasis; urgent radiotherapy', false, 3),
  ('d143c1bc-964c-5581-ba71-766d90b9fb90', '1a47b900-3df6-5d33-b860-4bf7aac9ab19', 'E', 'Ankylosing spondylitis; anti-TNF', false, 4);

-- Q633
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('78e2c86a-3c3a-51d3-81ee-8ef7c7a0ca6c', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000036', 'sba', 'A couple has a child with cystic fibrosis. Both parents are healthy. What is the chance that their next child will be a carrier but unaffected?', 'Autosomal recessive with two carrier parents: 1 in 4 affected, 1 in 2 carriers, 1 in 4 unaffected non-carriers. An unaffected sibling has a 2 in 3 chance of being a carrier.', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v6')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = '78e2c86a-3c3a-51d3-81ee-8ef7c7a0ca6c';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('a6aadb6f-e11e-5391-a344-5f6281f63f37', '78e2c86a-3c3a-51d3-81ee-8ef7c7a0ca6c', 'A', '1 in 3', false, 0),
  ('64322f34-7abe-5969-8e68-ae08fdb4bcc6', '78e2c86a-3c3a-51d3-81ee-8ef7c7a0ca6c', 'B', '1 in 2', true, 1),
  ('b04da2ca-edd3-5ac0-9ad1-85a24bc3fff1', '78e2c86a-3c3a-51d3-81ee-8ef7c7a0ca6c', 'C', '1 in 4', false, 2),
  ('2868ad09-caee-5b6b-b703-5f3bcc2b1b59', '78e2c86a-3c3a-51d3-81ee-8ef7c7a0ca6c', 'D', '2 in 3', false, 3),
  ('5c26058f-aad8-5c72-9b1f-54488f44d265', '78e2c86a-3c3a-51d3-81ee-8ef7c7a0ca6c', 'E', '3 in 4', false, 4);

-- Q634
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('1ff11082-7e7d-5c85-ab71-37474b07df2b', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000036', 'sba', 'A woman''s father had Huntington''s disease. She is 25 and asymptomatic. What is her risk of having inherited the gene?', 'Huntington''s disease is autosomal dominant with a CAG repeat expansion. Anticipation occurs (earlier onset in later generations, especially through the father). Predictive testing requires genetic counselling.', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v6')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = '1ff11082-7e7d-5c85-ab71-37474b07df2b';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('59ef1c5e-1ea5-5ecd-b0e7-74c7a825dce5', '1ff11082-7e7d-5c85-ab71-37474b07df2b', 'A', '0%', false, 0),
  ('89bbef98-0c21-5aca-af28-94b136f29321', '1ff11082-7e7d-5c85-ab71-37474b07df2b', 'B', '25%', false, 1),
  ('dc685978-4492-56f2-818f-4c88309054cc', '1ff11082-7e7d-5c85-ab71-37474b07df2b', 'C', '50%', true, 2),
  ('6a7caf76-e15e-56d8-8359-303c97a57ec7', '1ff11082-7e7d-5c85-ab71-37474b07df2b', 'D', '75%', false, 3),
  ('1b8ffbe7-cda7-5c1f-b91a-f7f5124d715f', '1ff11082-7e7d-5c85-ab71-37474b07df2b', 'E', '100%', false, 4);

-- Q635
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('1004f97b-ce88-519d-abd3-eb26b98291b1', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000036', 'sba', 'A family has a condition passed from mothers to all their children, but never from fathers. Muscle biopsy shows ragged red fibres. What is the inheritance pattern?', 'Mitochondrial DNA is inherited from the mother. Heteroplasmy causes variable severity. Examples: MELAS, MERRF, Leber''s hereditary optic neuropathy.', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v6')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = '1004f97b-ce88-519d-abd3-eb26b98291b1';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('d1af9ef3-85f7-521c-9309-2b47af19ed1e', '1004f97b-ce88-519d-abd3-eb26b98291b1', 'A', 'Mitochondrial inheritance', true, 0),
  ('0bc178bb-dda9-5e22-b25a-189129fd0443', '1004f97b-ce88-519d-abd3-eb26b98291b1', 'B', 'Autosomal recessive', false, 1),
  ('440d7932-baf8-555b-9b8a-66d207257964', '1004f97b-ce88-519d-abd3-eb26b98291b1', 'C', 'Autosomal dominant', false, 2),
  ('4d9974db-f062-5170-90b5-486b0508768d', '1004f97b-ce88-519d-abd3-eb26b98291b1', 'D', 'X-linked dominant', false, 3),
  ('3fe0d43d-09d9-5277-97e6-b567bf002fef', '1004f97b-ce88-519d-abd3-eb26b98291b1', 'E', 'Y-linked', false, 4);

-- Q636
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('d1c96287-1c15-5d89-bad9-04a2d3102cb1', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000036', 'sba', 'A 10 year old boy has learning difficulties, a long face, large ears and large testes after puberty. What is the SINGLE most likely diagnosis?', 'Fragile X is caused by CGG repeat expansion in FMR1 (X-linked). It is the commonest inherited cause of learning disability. Associated with autism and mitral valve prolapse.', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v6')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = 'd1c96287-1c15-5d89-bad9-04a2d3102cb1';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('194fb4d8-b3ff-5399-a674-89d6be546960', 'd1c96287-1c15-5d89-bad9-04a2d3102cb1', 'A', 'Down syndrome', false, 0),
  ('0ade1d82-9ffd-5def-8b9f-f69eedbf5c09', 'd1c96287-1c15-5d89-bad9-04a2d3102cb1', 'B', 'Fragile X syndrome', true, 1),
  ('90693557-2f74-5283-9858-d4861b39c02a', 'd1c96287-1c15-5d89-bad9-04a2d3102cb1', 'C', 'Klinefelter syndrome', false, 2),
  ('cf596178-7378-5248-a42f-2745f3fbae6d', 'd1c96287-1c15-5d89-bad9-04a2d3102cb1', 'D', 'Prader-Willi syndrome', false, 3),
  ('05b4d342-6f99-5f38-be71-c0b37d60adb6', 'd1c96287-1c15-5d89-bad9-04a2d3102cb1', 'E', 'Marfan syndrome', false, 4);

-- Q637
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('c093b248-9225-5b61-90b1-c4fb22038f45', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000036', 'sba', 'A newborn is floppy with poor feeding. Later in childhood she develops an insatiable appetite, obesity and learning difficulties. Genetic testing shows loss of paternal chromosome 15q11-13. What is the SINGLE most likely diagnosis?', 'Prader-Willi: loss of paternal 15q11-13 (deletion or maternal uniparental disomy). Angelman: loss of maternal 15q11-13 (UBE3A), with happy demeanour, seizures and ataxia. Examples of genomic imprinting.', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v6')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = 'c093b248-9225-5b61-90b1-c4fb22038f45';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('d0dfaaa0-5ee5-52a1-8b5d-41a87c2cf6be', 'c093b248-9225-5b61-90b1-c4fb22038f45', 'A', 'Prader-Willi syndrome', true, 0),
  ('105b7036-df9a-5995-a2e3-b5b09b8e1dcf', 'c093b248-9225-5b61-90b1-c4fb22038f45', 'B', 'Down syndrome', false, 1),
  ('92947e5f-0bd2-5a5d-b009-2a3c90426719', 'c093b248-9225-5b61-90b1-c4fb22038f45', 'C', 'Fragile X', false, 2),
  ('11bd8a21-060c-5a55-a095-5ad3bc2200d9', 'c093b248-9225-5b61-90b1-c4fb22038f45', 'D', 'Angelman syndrome', false, 3),
  ('42d2343b-864d-5712-9356-9b1ca2f0cf31', 'c093b248-9225-5b61-90b1-c4fb22038f45', 'E', 'Turner syndrome', false, 4);

-- Q638
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('87f181d0-2db2-5a74-b70a-660367878255', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000036', 'sba', 'A 25 year old man is tall with long arms, a high-arched palate, and lens dislocation (upwards). His father died suddenly of aortic dissection. What is the SINGLE most likely diagnosis?', 'Marfan syndrome (FBN1, autosomal dominant): tall stature, upward lens dislocation, aortic root dilatation. Homocystinuria causes downward lens dislocation and thrombosis. Regular echo and beta-blockers or ARBs.', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v6')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = '87f181d0-2db2-5a74-b70a-660367878255';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('d4b9eb11-dbcf-5fc7-95a3-0122e4e3b879', '87f181d0-2db2-5a74-b70a-660367878255', 'A', 'Loeys-Dietz syndrome', false, 0),
  ('1fc59eea-cd2a-57e9-ae2f-5b8be74aac85', '87f181d0-2db2-5a74-b70a-660367878255', 'B', 'Ehlers-Danlos syndrome', false, 1),
  ('bf3c7f9f-d471-5866-a5fa-b46da2dc5d50', '87f181d0-2db2-5a74-b70a-660367878255', 'C', 'Marfan syndrome', true, 2),
  ('7b545506-fb7c-5a42-933f-387564c48f2f', '87f181d0-2db2-5a74-b70a-660367878255', 'D', 'Klinefelter syndrome', false, 3),
  ('6c454dd6-94fe-5239-9e10-dd48550bf1ac', '87f181d0-2db2-5a74-b70a-660367878255', 'E', 'Homocystinuria', false, 4);

-- Q639
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('1281d4f0-fc8b-57f0-842d-c471e1f49625', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000036', 'sba', 'A pregnant woman aged 38 asks about screening for Down syndrome. Her combined test gives a higher chance result. What is the next option offered?', 'The combined test (nuchal translucency, PAPP-A, beta-hCG) is done at 11-14 weeks. Higher chance results (1 in 150 or higher) are offered NIPT or diagnostic testing. NIPT is not diagnostic.', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v6')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = '1281d4f0-fc8b-57f0-842d-c471e1f49625';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('eb4ee3e2-d111-5958-afba-04f5009d8b01', '1281d4f0-fc8b-57f0-842d-c471e1f49625', 'A', 'Repeat combined test', false, 0),
  ('77a64b31-1364-5967-9ced-35adde33b0be', '1281d4f0-fc8b-57f0-842d-c471e1f49625', 'B', 'Termination immediately', false, 1),
  ('1c136aaf-455f-5f61-b805-2d13ac56a3b4', '1281d4f0-fc8b-57f0-842d-c471e1f49625', 'C', 'No further testing possible', false, 2),
  ('3221f6bc-318e-5171-ab15-ff9617862a44', '1281d4f0-fc8b-57f0-842d-c471e1f49625', 'D', 'NIPT (cell-free fetal DNA) or diagnostic testing (CVS or amniocentesis)', true, 3),
  ('ce20a69e-70da-578b-9b36-3f6109b8f1bb', '1281d4f0-fc8b-57f0-842d-c471e1f49625', 'E', 'Ultrasound at 36 weeks only', false, 4);

-- Q640
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('8a0e93d3-8b00-5d99-844c-6dbf300ec14a', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000036', 'sba', 'A 40 year old woman has a BRCA1 mutation. Which risk-reducing surgery is MOST commonly recommended after childbearing is complete?', 'BRCA carriers have high risk of breast and ovarian cancer. Risk-reducing salpingo-oophorectomy reduces ovarian cancer risk and mortality. Risk-reducing mastectomy and MRI surveillance are options for breast cancer.', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v6')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = '8a0e93d3-8b00-5d99-844c-6dbf300ec14a';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('14254f67-51e8-574e-9053-e179740ae5d9', '8a0e93d3-8b00-5d99-844c-6dbf300ec14a', 'A', 'Colectomy', false, 0),
  ('1a08a241-59f6-5039-a7df-945e4cb7ed2e', '8a0e93d3-8b00-5d99-844c-6dbf300ec14a', 'B', 'Gastrectomy', false, 1),
  ('b376dbe9-128f-5c20-8137-f52e79d245d0', '8a0e93d3-8b00-5d99-844c-6dbf300ec14a', 'C', 'Thyroidectomy', false, 2),
  ('5f32166f-0ec5-572d-8d99-b434df7f08d4', '8a0e93d3-8b00-5d99-844c-6dbf300ec14a', 'D', 'Bilateral salpingo-oophorectomy (around age 35-40)', true, 3),
  ('bf93e84a-e7ca-5d11-b84f-f0dce91ee274', '8a0e93d3-8b00-5d99-844c-6dbf300ec14a', 'E', 'Hysterectomy only', false, 4);

-- Q641
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('57f13950-81cf-5ed2-a736-f751876e6bf2', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000015', 'sba', 'A 65 year old man has had gradual painless loss of central vision over a year. Fundoscopy shows drusen and pigmentary changes at the macula. What is the SINGLE most likely diagnosis?', 'Dry AMD progresses slowly. No treatment reverses it; smoking cessation and AREDS supplements may slow progression. Sudden distortion suggests conversion to wet AMD, needing urgent referral.', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v6')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = '57f13950-81cf-5ed2-a736-f751876e6bf2';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('e00bee44-2151-5677-8293-801048929079', '57f13950-81cf-5ed2-a736-f751876e6bf2', 'A', 'Wet AMD', false, 0),
  ('e4a93c3a-e50b-5d95-b32b-668b072d6e62', '57f13950-81cf-5ed2-a736-f751876e6bf2', 'B', 'Diabetic retinopathy', false, 1),
  ('883c1426-69dd-5a8f-b782-4e509a293a20', '57f13950-81cf-5ed2-a736-f751876e6bf2', 'C', 'Dry (non-neovascular) age-related macular degeneration', true, 2),
  ('56d4e6b0-4e1d-506c-969e-bbb48fb61339', '57f13950-81cf-5ed2-a736-f751876e6bf2', 'D', 'Cataract', false, 3),
  ('822bf61a-5878-5c66-8391-114b974d308b', '57f13950-81cf-5ed2-a736-f751876e6bf2', 'E', 'Glaucoma', false, 4);

-- Q642
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('ed89143a-5fd1-5cad-8563-0764837bfcf8', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000015', 'sba', 'A 70 year old woman has had sudden distortion of straight lines (door frames look wavy) and reduced central vision in one eye over a week. What is the SINGLE most appropriate management?', 'Wet AMD has choroidal neovascularisation causing rapid central vision loss. Intravitreal anti-VEGF therapy preserves vision. Amsler grid detects distortion.', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v6')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = 'ed89143a-5fd1-5cad-8563-0764837bfcf8';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('2b725e6b-2030-5280-926d-f13d3f719b47', 'ed89143a-5fd1-5cad-8563-0764837bfcf8', 'A', 'Reassure', false, 0),
  ('a6afc701-5ebc-5997-8dbb-570d7a3e50d2', 'ed89143a-5fd1-5cad-8563-0764837bfcf8', 'B', 'Urgent referral to ophthalmology (within 1 week) for suspected wet AMD (anti-VEGF injections)', true, 1),
  ('312435f1-d88f-5843-bd96-d35aed28c467', 'ed89143a-5fd1-5cad-8563-0764837bfcf8', 'C', 'Routine referral in 3 months', false, 2),
  ('a4e20744-5c51-5750-bb86-a858f33fe159', 'ed89143a-5fd1-5cad-8563-0764837bfcf8', 'D', 'Antibiotic drops', false, 3),
  ('6a9711dd-f12f-513d-8780-dd35ecf240f6', 'ed89143a-5fd1-5cad-8563-0764837bfcf8', 'E', 'New glasses', false, 4);

-- Q643
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('64439201-4816-52dc-a26b-c5a66582710a', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000015', 'sba', 'A 55 year old man has had raised intraocular pressure of 26 mmHg on a routine eye test. Optic discs and visual fields are normal. What is the SINGLE most likely diagnosis?', 'Ocular hypertension is raised IOP without optic nerve damage. NICE NG81: offer treatment (prostaglandin analogue) if IOP is 24 mmHg or more and risk of conversion. Glaucoma requires optic disc damage or field loss.', null, true, true, jsonb_build_object('source', 'plab1-xlsx-v6', 'guidelines_text', 'NICE NG81')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = '64439201-4816-52dc-a26b-c5a66582710a';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('c268c464-5fd6-5e3c-84ac-49801b2c6216', '64439201-4816-52dc-a26b-c5a66582710a', 'A', 'Normal tension glaucoma', false, 0),
  ('e9017367-f8c3-5c8f-bbdc-597223666021', '64439201-4816-52dc-a26b-c5a66582710a', 'B', 'Ocular hypertension', true, 1),
  ('b7b375a5-3765-5e60-bf91-563c2510b2e2', '64439201-4816-52dc-a26b-c5a66582710a', 'C', 'Cataract', false, 2),
  ('30e2d2f3-bae2-5638-93c6-4349e51fd529', '64439201-4816-52dc-a26b-c5a66582710a', 'D', 'Angle-closure glaucoma', false, 3),
  ('83d208b0-57c5-5938-ac46-7d442db32f1f', '64439201-4816-52dc-a26b-c5a66582710a', 'E', 'Primary open-angle glaucoma', false, 4);

-- Q644
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('7f391d82-f033-594b-b26c-f357821ae380', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000015', 'sba', 'A 60 year old man with primary open-angle glaucoma starts latanoprost eye drops. What side effect should he be warned about?', 'Prostaglandin analogues increase uveoscleral outflow. Beta-blocker drops (timolol) can cause bronchospasm and bradycardia. Selective laser trabeculoplasty is an alternative first-line option (NICE NG81).', null, true, true, jsonb_build_object('source', 'plab1-xlsx-v6', 'guidelines_text', 'NICE NG81')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = '7f391d82-f033-594b-b26c-f357821ae380';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('9974bf49-1abd-5ca3-9521-98cd8ea37b57', '7f391d82-f033-594b-b26c-f357821ae380', 'A', 'Asthma', false, 0),
  ('b0ce9b54-b519-573d-995a-67f42e037d62', '7f391d82-f033-594b-b26c-f357821ae380', 'B', 'Weight gain', false, 1),
  ('694d3e42-ca92-5461-a838-920fa394a074', '7f391d82-f033-594b-b26c-f357821ae380', 'C', 'Hair loss', false, 2),
  ('9ecd0e0c-435a-5a53-8333-6723ca68b4b4', '7f391d82-f033-594b-b26c-f357821ae380', 'D', 'Darkening of the iris and lengthening of eyelashes', true, 3),
  ('7b7c6680-0700-53d1-813f-7487b00e179e', '7f391d82-f033-594b-b26c-f357821ae380', 'E', 'Bradycardia', false, 4);

-- Q645
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('6866f044-1389-5be2-91f3-6e7aa5a032aa', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000015', 'sba', 'A 25 year old man has had a painful red eye with photophobia and reduced vision. He has back pain and stiffness in the morning. The pupil is small and irregular. What is the SINGLE most likely diagnosis?', 'Anterior uveitis is linked to HLA-B27 conditions. Features: ciliary flush, small pupil, hypopyon, photophobia. Refer urgently. Treatment: steroid and mydriatic drops.', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v6')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = '6866f044-1389-5be2-91f3-6e7aa5a032aa';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('1dfb32a8-403d-5fb3-8491-ec76ff27f45f', '6866f044-1389-5be2-91f3-6e7aa5a032aa', 'A', 'Acute angle-closure glaucoma', false, 0),
  ('aa083632-5e1c-5bde-9ae4-ea4826231e8a', '6866f044-1389-5be2-91f3-6e7aa5a032aa', 'B', 'Scleritis', false, 1),
  ('692776f4-bcd1-5869-ab16-78980f136d79', '6866f044-1389-5be2-91f3-6e7aa5a032aa', 'C', 'Anterior uveitis (associated with ankylosing spondylitis)', true, 2),
  ('442ba8fa-cbb3-5f12-be16-715408d70b94', '6866f044-1389-5be2-91f3-6e7aa5a032aa', 'D', 'Keratitis', false, 3),
  ('ed306722-1505-5716-af59-4fceac08efbe', '6866f044-1389-5be2-91f3-6e7aa5a032aa', 'E', 'Conjunctivitis', false, 4);

-- Q646
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('16fcf767-a7a0-5e90-b1eb-41338810b7bd', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000015', 'sba', 'A 65 year old woman has had a red, painful eye with severe boring pain that wakes her at night. The eye is tender. She has rheumatoid arthritis. What is the SINGLE most likely diagnosis?', 'Scleritis is painful and can threaten sight; it is associated with RA and vasculitis (GPA). Episcleritis is mild and painless or mildly uncomfortable. Scleritis needs urgent ophthalmology and systemic treatment.', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v6')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = '16fcf767-a7a0-5e90-b1eb-41338810b7bd';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('38a9f682-7d11-5ac8-baa7-f27cfa8ca33e', '16fcf767-a7a0-5e90-b1eb-41338810b7bd', 'A', 'Episcleritis', false, 0),
  ('a13d2514-124f-5df2-a849-cbd19913d114', '16fcf767-a7a0-5e90-b1eb-41338810b7bd', 'B', 'Uveitis', false, 1),
  ('2613a1a0-757c-5732-b9d1-063fe98a0fd4', '16fcf767-a7a0-5e90-b1eb-41338810b7bd', 'C', 'Scleritis', true, 2),
  ('b532ee3a-588f-5455-b721-80daa3f854be', '16fcf767-a7a0-5e90-b1eb-41338810b7bd', 'D', 'Dry eye', false, 3),
  ('1a136ac9-50a0-5e18-8862-0ba37d4d20a9', '16fcf767-a7a0-5e90-b1eb-41338810b7bd', 'E', 'Conjunctivitis', false, 4);

-- Q647
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('44eec09c-c7d7-5a01-86b3-a4cb8a9bdcd1', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000029', 'sba', 'An 85 year old woman has had three falls in the last 6 months. She takes amlodipine, doxazosin, furosemide, zopiclone and amitriptyline. What is the SINGLE most important intervention?', 'NICE guidance on falls: multifactorial risk assessment (gait, vision, continence, home hazards, postural hypotension, medication). Sedatives, antihypertensives and anticholinergics increase falls risk. Strength and balance training reduces falls.', null, true, true, jsonb_build_object('source', 'plab1-xlsx-v6', 'guidelines_text', 'NICE')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = '44eec09c-c7d7-5a01-86b3-a4cb8a9bdcd1';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('186dfdd9-3b75-5292-abf1-e0aecb3147f0', '44eec09c-c7d7-5a01-86b3-a4cb8a9bdcd1', 'A', 'Multifactorial falls assessment including medication review (reduce falls-risk drugs)', true, 0),
  ('f991932f-121c-5ac9-a7f5-a2982d21462a', '44eec09c-c7d7-5a01-86b3-a4cb8a9bdcd1', 'B', 'Restraints', false, 1),
  ('47d876fe-b5bf-5c92-b7d6-8f3b34116456', '44eec09c-c7d7-5a01-86b3-a4cb8a9bdcd1', 'C', 'Hip protectors only', false, 2),
  ('8d3ccbef-a88a-5bdc-9bb6-6ca07178835b', '44eec09c-c7d7-5a01-86b3-a4cb8a9bdcd1', 'D', 'Calcium only', false, 3),
  ('bacd5e84-37b2-5083-9401-466f7881c827', '44eec09c-c7d7-5a01-86b3-a4cb8a9bdcd1', 'E', 'Bed rest', false, 4);

-- Q648
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('3d8e18c4-e398-5a77-9b51-556542fa66ca', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000029', 'sba', 'An 88 year old man with dementia is admitted. His family says he has become withdrawn, eating less and losing weight. He has a urinary catheter, is on 10 medicines, and has pressure sores. Which assessment is MOST appropriate?', 'CGA is a multidimensional, multidisciplinary assessment of medical, functional, psychological and social needs. It improves outcomes for frail older people.', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v6')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = '3d8e18c4-e398-5a77-9b51-556542fa66ca';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('2219dee0-cf4f-554b-9162-14085e371aec', '3d8e18c4-e398-5a77-9b51-556542fa66ca', 'A', 'Discharge to a care home', false, 0),
  ('7c921204-1b06-568f-a9c8-83d90215d90e', '3d8e18c4-e398-5a77-9b51-556542fa66ca', 'B', 'Comprehensive geriatric assessment', true, 1),
  ('2cee9f3c-4b6d-52e5-ae48-ea98093fe76b', '3d8e18c4-e398-5a77-9b51-556542fa66ca', 'C', 'CT head only', false, 2),
  ('4a5fbbc9-2475-5417-8497-d045d8779772', '3d8e18c4-e398-5a77-9b51-556542fa66ca', 'D', 'Nutritional supplements only', false, 3),
  ('792bbcaf-0b98-52f2-9a79-061490593b74', '3d8e18c4-e398-5a77-9b51-556542fa66ca', 'E', 'Psychiatric referral only', false, 4);

-- Q649
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('e6771186-9999-5966-8d03-7e5ed07d90a1', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000029', 'sba', 'A 79 year old woman is on oxybutynin for urge incontinence. She has become confused. What is the SINGLE most appropriate change?', 'NICE NG123: avoid oxybutynin in frail older women. Anticholinergics increase confusion, falls and dementia risk. Mirabegron is an alternative (check BP).', null, true, true, jsonb_build_object('source', 'plab1-xlsx-v6', 'guidelines_text', 'NICE NG123')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = 'e6771186-9999-5966-8d03-7e5ed07d90a1';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('12568459-bab0-58e9-81d7-350ce0c21ce3', 'e6771186-9999-5966-8d03-7e5ed07d90a1', 'A', 'Stop oxybutynin and consider mirabegron (anticholinergic burden in older adults)', true, 0),
  ('27894d5b-da59-55ce-8dc7-b8110c544916', 'e6771186-9999-5966-8d03-7e5ed07d90a1', 'B', 'Add a benzodiazepine', false, 1),
  ('6667ac71-5a25-5dd1-84b5-c0c08420cd9a', 'e6771186-9999-5966-8d03-7e5ed07d90a1', 'C', 'Increase the dose', false, 2),
  ('a071ccd4-73c2-5643-82e5-6b71d4d00091', 'e6771186-9999-5966-8d03-7e5ed07d90a1', 'D', 'Add a second anticholinergic', false, 3),
  ('68f18973-471c-524c-902b-15f1919f7fd3', 'e6771186-9999-5966-8d03-7e5ed07d90a1', 'E', 'Start haloperidol', false, 4);

-- Q650
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('da191fcc-838b-537d-9e7e-9ddc25da3e99', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000029', 'sba', 'An 84 year old man is admitted with pneumonia. He has lost weight and his BMI is 18. He needs help to eat. Which screening tool identifies malnutrition risk?', 'MUST uses BMI, unintentional weight loss and acute disease effect. High-risk patients need dietitian referral, food fortification and supplements. Watch for refeeding syndrome.', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v6')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = 'da191fcc-838b-537d-9e7e-9ddc25da3e99';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('c052251c-0f13-5584-827f-91393008d071', 'da191fcc-838b-537d-9e7e-9ddc25da3e99', 'A', 'MUST (Malnutrition Universal Screening Tool)', true, 0),
  ('3bba11ff-ef5f-5732-b929-ebd03a3795b1', 'da191fcc-838b-537d-9e7e-9ddc25da3e99', 'B', 'Barthel index', false, 1),
  ('cc65fce7-8e9f-5c23-b0d4-7fb226390bce', 'da191fcc-838b-537d-9e7e-9ddc25da3e99', 'C', 'Clinical Frailty Scale', false, 2),
  ('1f9c415e-53a3-52af-a67d-c768984f5a7a', 'da191fcc-838b-537d-9e7e-9ddc25da3e99', 'D', 'Waterlow', false, 3),
  ('79cd18d7-3ac4-5967-bb6c-3995d2fa172a', 'da191fcc-838b-537d-9e7e-9ddc25da3e99', 'E', 'NEWS2', false, 4);

-- Q651
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('8bee72c4-ab7d-5f7d-9bbc-87f55c3146ea', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000029', 'sba', 'A 90 year old woman needs help with bathing, dressing and walking outdoors. She manages her own meals. Which scale measures her function in daily living?', 'The Barthel index measures independence in activities of daily living (feeding, bathing, grooming, dressing, continence, toileting, transfers, mobility, stairs).', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v6')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = '8bee72c4-ab7d-5f7d-9bbc-87f55c3146ea';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('280eae92-ebda-5fc8-9b02-b0e8acb6cfdb', '8bee72c4-ab7d-5f7d-9bbc-87f55c3146ea', 'A', 'Barthel index', true, 0),
  ('da696fe5-86dd-5ed7-bb6a-d7e82e62e93a', '8bee72c4-ab7d-5f7d-9bbc-87f55c3146ea', 'B', 'MMSE', false, 1),
  ('b64f24f9-fbf7-5352-ac67-27ce8deffb32', '8bee72c4-ab7d-5f7d-9bbc-87f55c3146ea', 'C', 'CURB-65', false, 2),
  ('326a7b57-8f41-53ba-b0a2-2bc81c13dbdb', '8bee72c4-ab7d-5f7d-9bbc-87f55c3146ea', 'D', 'MUST', false, 3),
  ('d2b73015-1d80-5e96-9f92-15b7d8dac82e', '8bee72c4-ab7d-5f7d-9bbc-87f55c3146ea', 'E', 'Waterlow', false, 4);

-- Q652
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('6e5ed4ef-ff55-561a-b7ad-ef1d932229ff', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000029', 'sba', 'An 82 year old man is admitted with delirium. Which non-drug measure is MOST helpful?', 'NICE CG103: non-drug measures prevent and treat delirium. Treat the underlying cause. Use haloperidol at low dose only if distressed or a risk to self or others.', null, true, true, jsonb_build_object('source', 'plab1-xlsx-v6', 'guidelines_text', 'NICE CG103')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = '6e5ed4ef-ff55-561a-b7ad-ef1d932229ff';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('65e1c610-8b25-525e-874a-925148e64b6e', '6e5ed4ef-ff55-561a-b7ad-ef1d932229ff', 'A', 'Physical restraint', false, 0),
  ('e289b236-da03-526d-ab09-8803c704113a', '6e5ed4ef-ff55-561a-b7ad-ef1d932229ff', 'B', 'Reorientation, glasses and hearing aids, adequate lighting, mobilisation, good sleep and family involvement', true, 1),
  ('33bd5c57-fc8c-520d-9938-4a5f3e700264', '6e5ed4ef-ff55-561a-b7ad-ef1d932229ff', 'C', 'Keeping lights on all night', false, 2),
  ('e971060a-de6f-5fc4-ad44-a7bc869cba89', '6e5ed4ef-ff55-561a-b7ad-ef1d932229ff', 'D', 'Moving him between wards often', false, 3),
  ('418213dc-7454-5456-a701-8bd727418c5e', '6e5ed4ef-ff55-561a-b7ad-ef1d932229ff', 'E', 'Routine sedation', false, 4);

-- Q653
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('5111649a-38da-5c76-8017-3f9f9cd69bb4', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000027', 'sba', 'A 25 year old woman has had a sore throat for 3 days. FeverPAIN score is 1. What is the SINGLE most appropriate management?', 'FeverPAIN 0-1: no antibiotic; 2-3: consider no or back-up antibiotic; 4-5: immediate or back-up antibiotic (phenoxymethylpenicillin for 5-10 days).', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v6')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = '5111649a-38da-5c76-8017-3f9f9cd69bb4';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('fd64c0d6-f730-5c7a-b947-e5f9e7cd2701', '5111649a-38da-5c76-8017-3f9f9cd69bb4', 'A', 'Immediate penicillin V', false, 0),
  ('46363e62-4487-536d-ba6d-bb9314fa212f', '5111649a-38da-5c76-8017-3f9f9cd69bb4', 'B', 'No antibiotics; self-care advice with analgesia', true, 1),
  ('ad3dda53-13bb-5b8d-9663-b7cb392e547d', '5111649a-38da-5c76-8017-3f9f9cd69bb4', 'C', 'Back-up prescription', false, 2),
  ('ae34a70f-a472-56a0-9340-f55cf3fc3424', '5111649a-38da-5c76-8017-3f9f9cd69bb4', 'D', 'Throat swab and wait', false, 3),
  ('5af144f3-477d-5e2b-b90f-c8576093a6ac', '5111649a-38da-5c76-8017-3f9f9cd69bb4', 'E', 'Clarithromycin', false, 4);

-- Q654
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('63c5e44c-216f-5a29-ae59-b15f99df194a', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000027', 'sba', 'A 70 year old man has a BP of 150/95 in clinic. He has no symptoms. What is the SINGLE most appropriate next step?', 'NICE NG136: clinic BP 140/90 or more is confirmed with ABPM (daytime average 135/85 or more). Assess cardiovascular risk and target organ damage.', null, true, true, jsonb_build_object('source', 'plab1-xlsx-v6', 'guidelines_text', 'NICE NG136')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = '63c5e44c-216f-5a29-ae59-b15f99df194a';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('44531ca1-429f-5836-bdab-40d62f2ccd43', '63c5e44c-216f-5a29-ae59-b15f99df194a', 'A', 'Start ramipril immediately', false, 0),
  ('5b42f9f1-c24e-5bbc-983b-22ce3f37f829', '63c5e44c-216f-5a29-ae59-b15f99df194a', 'B', 'Repeat in 5 years', false, 1),
  ('729fad3d-047d-51e8-ac62-085d60f2d460', '63c5e44c-216f-5a29-ae59-b15f99df194a', 'C', 'Refer to cardiology', false, 2),
  ('f900e1fa-2cde-5664-876f-072d482f2ba2', '63c5e44c-216f-5a29-ae59-b15f99df194a', 'D', 'Ambulatory (or home) BP monitoring to confirm hypertension', true, 3),
  ('e79cb7a7-77e0-59ee-a474-a7a277937635', '63c5e44c-216f-5a29-ae59-b15f99df194a', 'E', 'Start amlodipine and bisoprolol', false, 4);

-- Q655
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('389caca3-0584-5b97-8cda-4d29edf7c25f', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000027', 'sba', 'A 55 year old woman has had type 2 diabetes for 2 years and is on metformin. She has established cardiovascular disease. What should be added?', 'NICE NG28: offer an SGLT2 inhibitor with metformin to people with type 2 diabetes and cardiovascular disease, heart failure, or high risk (QRISK over 10%), or CKD.', null, true, true, jsonb_build_object('source', 'plab1-xlsx-v6', 'guidelines_text', 'NICE NG28')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = '389caca3-0584-5b97-8cda-4d29edf7c25f';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('2e745fb3-8361-526c-be7e-1bc98d7c704d', '389caca3-0584-5b97-8cda-4d29edf7c25f', 'A', 'Sulfonylurea', false, 0),
  ('c505ea3d-6e64-5991-850f-a35f63838647', '389caca3-0584-5b97-8cda-4d29edf7c25f', 'B', 'Insulin', false, 1),
  ('20a85f1f-9f64-5ca3-9c39-dd1ba84bc71d', '389caca3-0584-5b97-8cda-4d29edf7c25f', 'C', 'An SGLT2 inhibitor with proven cardiovascular benefit (e.g. empagliflozin)', true, 2),
  ('88a17974-63eb-5e7c-aa42-e63ca44cb689', '389caca3-0584-5b97-8cda-4d29edf7c25f', 'D', 'Pioglitazone', false, 3),
  ('b1319772-55f8-5390-8b7e-cc4201ae6558', '389caca3-0584-5b97-8cda-4d29edf7c25f', 'E', 'DPP-4 inhibitor only', false, 4);

-- Q656
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('569c4780-8864-51f8-a159-0f03dd09d0fa', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000027', 'sba', 'A 40 year old man asks for a ''health check''. He is 40-74 with no known disease. What does the NHS Health Check include?', 'NHS Health Checks are offered every 5 years to adults aged 40-74 without existing cardiovascular disease. They assess risk and give lifestyle advice; dementia awareness is given to those over 65.', null, true, true, jsonb_build_object('source', 'plab1-xlsx-v6')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = '569c4780-8864-51f8-a159-0f03dd09d0fa';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('e0f5bb6d-58f1-5786-8687-07fbf8a21e52', '569c4780-8864-51f8-a159-0f03dd09d0fa', 'A', 'Genetic test', false, 0),
  ('967af8b4-9c2d-508d-9a9f-ff3694fca98e', '569c4780-8864-51f8-a159-0f03dd09d0fa', 'B', 'PSA test', false, 1),
  ('64db32b9-546b-5544-9807-5f1f7dfcc723', '569c4780-8864-51f8-a159-0f03dd09d0fa', 'C', 'Full body MRI', false, 2),
  ('48365cd9-1202-5ea8-a885-d3b61d584228', '569c4780-8864-51f8-a159-0f03dd09d0fa', 'D', 'Cardiovascular risk assessment (BP, cholesterol, BMI, lifestyle), with diabetes and kidney risk', true, 3),
  ('09fbd0fd-e74e-5ea4-a163-5cc743d3fe3a', '569c4780-8864-51f8-a159-0f03dd09d0fa', 'E', 'Colonoscopy', false, 4);

-- Q657
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('757affd4-b2df-5619-95db-c6706e0e1219', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000027', 'sba', 'A 60 year old man asks when he will be offered bowel screening. What is the current NHS England bowel screening programme?', 'NHS England bowel screening offers FIT kits every 2 years to people aged 50-74 (age lowered from 60). Positive results lead to colonoscopy.', null, true, true, jsonb_build_object('source', 'plab1-xlsx-v6')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = '757affd4-b2df-5619-95db-c6706e0e1219';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('820be021-71ff-5eff-8419-c6f26bcb081f', '757affd4-b2df-5619-95db-c6706e0e1219', 'A', 'Colonoscopy at 50 for all', false, 0),
  ('8e02bc2f-8b5a-5201-ac60-ce5a75b564b1', '757affd4-b2df-5619-95db-c6706e0e1219', 'B', 'Flexible sigmoidoscopy at 55 only', false, 1),
  ('fe48dd15-05fa-58be-a393-390147a8526b', '757affd4-b2df-5619-95db-c6706e0e1219', 'C', 'No bowel screening', false, 2),
  ('66e254c5-6964-5267-a140-c77885f34e70', '757affd4-b2df-5619-95db-c6706e0e1219', 'D', 'FIT test every 2 years from age 50 to 74', true, 3),
  ('2a070f9d-7b0d-567d-99d0-3d486d145c74', '757affd4-b2df-5619-95db-c6706e0e1219', 'E', 'FOB annually from 40', false, 4);

-- Q658
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('286664a7-c31b-53fa-9b89-fae45c4cc606', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000019', 'sba', 'A 70 year old woman has had shoulder and hip girdle pain and stiffness for 6 weeks, worse in the morning. ESR is 55. CK is normal. What is the SINGLE most appropriate treatment?', 'Polymyalgia rheumatica responds dramatically to low-dose steroids, tapered over 1-2 years. Ask about GCA symptoms. Bone protection is needed.', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v6')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = '286664a7-c31b-53fa-9b89-fae45c4cc606';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('fb9e64cd-92e0-565d-92d4-3ec62791ad82', '286664a7-c31b-53fa-9b89-fae45c4cc606', 'A', 'Hydroxychloroquine', false, 0),
  ('c2bd69ff-3a1b-5c9e-ab11-57a9ef0ee2de', '286664a7-c31b-53fa-9b89-fae45c4cc606', 'B', 'High-dose prednisolone 60 mg', false, 1),
  ('dc8d3ecf-f57c-55ba-b990-0f753973f9b0', '286664a7-c31b-53fa-9b89-fae45c4cc606', 'C', 'Methotrexate first', false, 2),
  ('573f8bcc-7c47-5703-bd8d-bcb42d3ac952', '286664a7-c31b-53fa-9b89-fae45c4cc606', 'D', 'Prednisolone 15 mg daily with expected rapid response', true, 3),
  ('054ccad7-ff63-567f-afdf-9b6dcce0e273', '286664a7-c31b-53fa-9b89-fae45c4cc606', 'E', 'NSAIDs only', false, 4);

-- Q659
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('f6cc6f13-8604-551c-80b7-44a7af80e237', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000019', 'sba', 'A 35 year old woman has had dry eyes, dry mouth, joint pain and a positive anti-Ro antibody. She is pregnant. What is the MOST important risk to her baby?', 'Maternal anti-Ro/La antibodies cross the placenta, causing neonatal lupus and congenital heart block. Monitor fetal heart rate. Hydroxychloroquine may reduce risk.', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v6')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = 'f6cc6f13-8604-551c-80b7-44a7af80e237';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('4f9faa01-b1a6-5417-a81d-f651ebb7b62a', 'f6cc6f13-8604-551c-80b7-44a7af80e237', 'A', 'Spina bifida', false, 0),
  ('bd84b657-4297-5e36-a2ee-3745c55d8ddb', 'f6cc6f13-8604-551c-80b7-44a7af80e237', 'B', 'Hypothyroidism', false, 1),
  ('1a34e892-2c11-5ce3-b2bf-f1965c7dd18f', 'f6cc6f13-8604-551c-80b7-44a7af80e237', 'C', 'Congenital heart block (neonatal lupus)', true, 2),
  ('7da6dca4-5ffc-5527-bed5-d1aec00f8d6d', 'f6cc6f13-8604-551c-80b7-44a7af80e237', 'D', 'Cleft palate', false, 3),
  ('ccd2b24e-77d5-555b-8806-f8cc4317b090', 'f6cc6f13-8604-551c-80b7-44a7af80e237', 'E', 'Down syndrome', false, 4);

-- Q660
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('50ad7790-a7b5-504b-8694-dd2ee9076ae5', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000019', 'sba', 'A 50 year old woman has had Raynaud''s phenomenon, tight skin on her fingers, heartburn and telangiectasia. What antibody is MOST associated?', 'Limited cutaneous systemic sclerosis (formerly CREST) is linked with anti-centromere antibodies and pulmonary hypertension. Diffuse disease is linked with anti-Scl-70 and pulmonary fibrosis, and anti-RNA polymerase III with renal crisis.', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v6')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = '50ad7790-a7b5-504b-8694-dd2ee9076ae5';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('b704940c-80a5-52c2-a9df-fc9d50ba3e21', '50ad7790-a7b5-504b-8694-dd2ee9076ae5', 'A', 'Anti-centromere antibody (limited cutaneous systemic sclerosis)', true, 0),
  ('75be07ea-deab-5b13-b924-af4017df341e', '50ad7790-a7b5-504b-8694-dd2ee9076ae5', 'B', 'Anti-dsDNA', false, 1),
  ('b03018cc-8971-5c32-a523-a5754f636bd5', '50ad7790-a7b5-504b-8694-dd2ee9076ae5', 'C', 'Anti-Jo-1', false, 2),
  ('3390f4d0-75cd-5ce3-be47-d79a2f039e76', '50ad7790-a7b5-504b-8694-dd2ee9076ae5', 'D', 'Anti-Scl-70', false, 3),
  ('97a285aa-cc54-534e-a0e0-0b8ebdf9e309', '50ad7790-a7b5-504b-8694-dd2ee9076ae5', 'E', 'Anti-CCP', false, 4);

-- Q661
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('b54b985d-8690-5efd-a90a-29617872721d', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000019', 'sba', 'A 45 year old man has had muscle weakness of his proximal limbs and a purple rash on his eyelids and knuckles. CK is high. What must be screened for?', 'Dermatomyositis features: heliotrope rash, Gottron''s papules and proximal weakness. It is associated with cancer (ovary, lung, GI). Anti-Jo-1 is linked with interstitial lung disease.', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v6')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = 'b54b985d-8690-5efd-a90a-29617872721d';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('727a0e60-2403-5cc7-88f2-0871659a6dfd', 'b54b985d-8690-5efd-a90a-29617872721d', 'A', 'Thyroid disease only', false, 0),
  ('69a85042-67a4-5a7b-8565-9eafe6bae683', 'b54b985d-8690-5efd-a90a-29617872721d', 'B', 'Sarcoidosis', false, 1),
  ('5987581f-d0e3-568d-ba56-87e3a144b95d', 'b54b985d-8690-5efd-a90a-29617872721d', 'C', 'Underlying malignancy', true, 2),
  ('2b54f313-bace-5218-bfb1-ee9131df4935', 'b54b985d-8690-5efd-a90a-29617872721d', 'D', 'Diabetes', false, 3),
  ('1c530b88-4cd3-581e-8aa7-c3c7d10cd80d', 'b54b985d-8690-5efd-a90a-29617872721d', 'E', 'Hepatitis', false, 4);

-- Q662
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('b476c893-951e-5fd1-a657-c606b1658d73', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000019', 'sba', 'A 30 year old woman has had recurrent miscarriages and a DVT. She has a prolonged APTT that does not correct with mixing. What is the SINGLE most likely diagnosis?', 'APS: thrombosis (arterial or venous) or pregnancy morbidity with persistent antiphospholipid antibodies (lupus anticoagulant, anticardiolipin, anti-beta2 glycoprotein I), checked 12 weeks apart. Pregnancy: aspirin and LMWH. DOACs are avoided in high-risk APS.', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v6')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = 'b476c893-951e-5fd1-a657-c606b1658d73';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('31c7bfe5-3822-5270-9b1c-f5ac30e316d0', 'b476c893-951e-5fd1-a657-c606b1658d73', 'A', 'Von Willebrand disease', false, 0),
  ('3a1b3530-9eb2-53f8-8b01-4233a87e2733', 'b476c893-951e-5fd1-a657-c606b1658d73', 'B', 'Haemophilia', false, 1),
  ('a04d5122-692a-504c-b897-71ab58cd7072', 'b476c893-951e-5fd1-a657-c606b1658d73', 'C', 'Factor V Leiden', false, 2),
  ('05157f1d-d242-5d96-8475-3fa4604e6414', 'b476c893-951e-5fd1-a657-c606b1658d73', 'D', 'Antiphospholipid syndrome', true, 3),
  ('226bafb3-e143-5c9e-b30b-354ce4a8796d', 'b476c893-951e-5fd1-a657-c606b1658d73', 'E', 'Protein C deficiency', false, 4);

-- Q663
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('b525574b-6329-59bb-b9ef-82de9e975824', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000021', 'sba', 'A local authority wants to reduce childhood obesity. Which intervention operates at the population level?', 'Population approaches shift the whole distribution of risk (Rose''s prevention paradox). Examples: sugar levy, advertising restrictions, healthy school meals.', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v6')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = 'b525574b-6329-59bb-b9ef-82de9e975824';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('fb888eec-0ae4-552f-8673-320d037b0652', 'b525574b-6329-59bb-b9ef-82de9e975824', 'A', 'Individual dietitian referral', false, 0),
  ('ae5ef3f4-8a79-5d8b-8218-f1b7050d0960', 'b525574b-6329-59bb-b9ef-82de9e975824', 'B', 'A sugar-sweetened drinks levy', true, 1),
  ('da919f99-ff58-5ab1-b083-019ab17c8964', 'b525574b-6329-59bb-b9ef-82de9e975824', 'C', 'Orlistat', false, 2),
  ('efa31870-e2fa-5488-9447-3270d9fab7ee', 'b525574b-6329-59bb-b9ef-82de9e975824', 'D', 'Bariatric surgery', false, 3),
  ('f2dcfae0-224b-565c-be80-c0dd6be619ce', 'b525574b-6329-59bb-b9ef-82de9e975824', 'E', 'Weighing children at GP visits', false, 4);

-- Q664
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('0388f7fb-7d80-56c2-9f42-e36ee0081e70', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000021', 'sba', 'A screening test is evaluated. Of 100 people with disease, 90 test positive. Of 900 without disease, 810 test negative. What is the specificity?', 'Specificity = true negatives / all without disease = 810/900 = 90%. Sensitivity = 90/100 = 90%. PPV = 90/(90+90) = 50%.', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v6')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = '0388f7fb-7d80-56c2-9f42-e36ee0081e70';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('dd8b8145-4437-532a-9e65-e4486ee776e2', '0388f7fb-7d80-56c2-9f42-e36ee0081e70', 'A', '10%', false, 0),
  ('4e2c4475-7132-5390-83c6-f09773dbc93d', '0388f7fb-7d80-56c2-9f42-e36ee0081e70', 'B', '50%', false, 1),
  ('dc733b3b-30b0-5250-9611-917d9c4fa57c', '0388f7fb-7d80-56c2-9f42-e36ee0081e70', 'C', '81%', false, 2),
  ('abf6c895-10f6-5986-9aad-2027bcfe891e', '0388f7fb-7d80-56c2-9f42-e36ee0081e70', 'D', '90%', true, 3),
  ('6f0cc88c-c337-55c2-a51e-a4726983838b', '0388f7fb-7d80-56c2-9f42-e36ee0081e70', 'E', '99%', false, 4);

-- Q665
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('5d2cc274-9078-5e21-bfa1-1e0026a24c72', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000021', 'sba', 'A study follows smokers and non-smokers for 20 years to compare rates of lung cancer. What type of study is this?', 'Cohort studies follow exposed and unexposed groups over time and calculate relative risk. Case-control studies start with disease and look back at exposure (odds ratio), good for rare diseases.', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v6')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = '5d2cc274-9078-5e21-bfa1-1e0026a24c72';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('57420c98-8fff-5942-83ce-39b981b7e706', '5d2cc274-9078-5e21-bfa1-1e0026a24c72', 'A', 'Case-control study', false, 0),
  ('425e830a-57fe-50d4-9d69-8af6686c1464', '5d2cc274-9078-5e21-bfa1-1e0026a24c72', 'B', 'RCT', false, 1),
  ('45f63863-8cf6-5789-9024-f03866c17e7c', '5d2cc274-9078-5e21-bfa1-1e0026a24c72', 'C', 'Ecological study', false, 2),
  ('7e34667d-14d4-5976-a6b3-fc4d153caa11', '5d2cc274-9078-5e21-bfa1-1e0026a24c72', 'D', 'Cross-sectional study', false, 3),
  ('7848d2f6-aa76-5791-ac44-53ea5bd47353', '5d2cc274-9078-5e21-bfa1-1e0026a24c72', 'E', 'Prospective cohort study', true, 4);

-- Q666
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('1d7572e9-ed3c-5032-8f31-f692d103dcf4', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000021', 'sba', 'A new drug reduces stroke risk from 10% to 6%. What is the number needed to treat?', 'ARR = 10% - 6% = 4%. NNT = 1/ARR = 1/0.04 = 25. Relative risk reduction = 4/10 = 40%.', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v6')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = '1d7572e9-ed3c-5032-8f31-f692d103dcf4';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('4292d1db-cd3a-5bf8-b029-93c2cc7b7e31', '1d7572e9-ed3c-5032-8f31-f692d103dcf4', 'A', '4', false, 0),
  ('cd30a1fe-5074-5d83-98dd-b7e14000661f', '1d7572e9-ed3c-5032-8f31-f692d103dcf4', 'B', '6', false, 1),
  ('94b447ac-e8ac-5d75-a0bc-21eb0999d4ca', '1d7572e9-ed3c-5032-8f31-f692d103dcf4', 'C', '10', false, 2),
  ('d6a9127c-fe39-5c9c-8c99-8a43dcf5ed25', '1d7572e9-ed3c-5032-8f31-f692d103dcf4', 'D', '25', true, 3),
  ('2455995c-026d-52d7-a104-54f6fa737f9b', '1d7572e9-ed3c-5032-8f31-f692d103dcf4', 'E', '40', false, 4);

-- Q667
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('eeee5034-3886-5c48-850e-d400236bde16', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000033', 'sba', 'A 25 year old man has a stab wound to his arm and cannot flex his wrist and fingers well. He also has numbness over the thumb, index and middle fingers. Which nerve is MOST likely damaged?', 'High median nerve injury: loss of forearm flexors (except FCU and ulnar half of FDP), thenar wasting and sensory loss over the lateral 3.5 fingers. ''Benediction sign'' when trying to make a fist.', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v6')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = 'eeee5034-3886-5c48-850e-d400236bde16';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('03a8ff4b-46fe-5fea-9458-9413353c3695', 'eeee5034-3886-5c48-850e-d400236bde16', 'A', 'Musculocutaneous nerve', false, 0),
  ('7cea835a-ca27-5934-8855-db350cdfeae8', 'eeee5034-3886-5c48-850e-d400236bde16', 'B', 'Ulnar nerve', false, 1),
  ('d61f6931-1aaf-5889-8073-e2406fdfc9aa', 'eeee5034-3886-5c48-850e-d400236bde16', 'C', 'Axillary nerve', false, 2),
  ('8d4279e7-0c19-5a5a-b26e-f207817bab0a', 'eeee5034-3886-5c48-850e-d400236bde16', 'D', 'Median nerve (above the elbow)', true, 3),
  ('78474e5c-ea6c-5882-9dea-b28f68773770', 'eeee5034-3886-5c48-850e-d400236bde16', 'E', 'Radial nerve', false, 4);

-- Q668
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('f177577c-687b-5a3c-b16e-ac29d5b36a3f', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000033', 'sba', 'A woman has a fracture of the mid-shaft of her humerus. She cannot extend her wrist. Which nerve runs in the spiral groove?', 'Radial nerve injury in humeral shaft fractures causes wrist drop and sensory loss over the dorsal first web space. Most recover (neuropraxia).', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v6')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = 'f177577c-687b-5a3c-b16e-ac29d5b36a3f';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('6d1fd3e8-835b-5afa-84ad-9611b78c9ad4', 'f177577c-687b-5a3c-b16e-ac29d5b36a3f', 'A', 'Axillary nerve', false, 0),
  ('a6599807-e742-58bd-923c-08e799abbf88', 'f177577c-687b-5a3c-b16e-ac29d5b36a3f', 'B', 'Radial nerve', true, 1),
  ('debdec7d-db83-5e4b-ae04-79172295897a', 'f177577c-687b-5a3c-b16e-ac29d5b36a3f', 'C', 'Median nerve', false, 2),
  ('f8b66f1c-f3a3-5020-9c11-b4cc20f7b7df', 'f177577c-687b-5a3c-b16e-ac29d5b36a3f', 'D', 'Ulnar nerve', false, 3),
  ('d71ba6dc-d8cd-5635-820c-bd2ae98ce1b3', 'f177577c-687b-5a3c-b16e-ac29d5b36a3f', 'E', 'Musculocutaneous nerve', false, 4);

-- Q669
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('b2e73441-791f-5163-b2f2-305ae0ddd74f', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000033', 'sba', 'A patient has an injury to the common peroneal nerve at the fibular neck. What deficit is MOST likely?', 'The common peroneal nerve wraps around the fibular neck. Injury (fracture, plaster casts, leg crossing) causes foot drop (weak dorsiflexion and eversion) and dorsal foot numbness.', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v6')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = 'b2e73441-791f-5163-b2f2-305ae0ddd74f';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('3fb362eb-5b91-5a8d-a6a0-b5af21d43d14', 'b2e73441-791f-5163-b2f2-305ae0ddd74f', 'A', 'Numbness of the sole', false, 0),
  ('9a51f2d9-478a-5dcf-9b5b-a6beab18bf63', 'b2e73441-791f-5163-b2f2-305ae0ddd74f', 'B', 'Loss of ankle jerk', false, 1),
  ('c18534f1-a3ef-56fa-96a2-e91a5085ad84', 'b2e73441-791f-5163-b2f2-305ae0ddd74f', 'C', 'Loss of knee extension', false, 2),
  ('db0de45c-3398-51d5-9c94-041ad865506d', 'b2e73441-791f-5163-b2f2-305ae0ddd74f', 'D', 'Foot drop with sensory loss over the dorsum of the foot', true, 3),
  ('9e78c9a2-4182-51d0-98a6-9ff5c6edbcaf', 'b2e73441-791f-5163-b2f2-305ae0ddd74f', 'E', 'Inability to plantar flex', false, 4);

-- Q670
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('89bb8215-0459-566c-a2a8-f59b3d782824', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000033', 'sba', 'Which structure passes through the carpal tunnel?', 'The carpal tunnel contains the median nerve and flexor tendons (FDS, FDP and FPL). The ulnar nerve and artery pass through Guyon''s canal; palmaris longus lies superficial to the flexor retinaculum.', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v6')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = '89bb8215-0459-566c-a2a8-f59b3d782824';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('df400d39-5da2-5701-938b-7c850634364a', '89bb8215-0459-566c-a2a8-f59b3d782824', 'A', 'Radial artery', false, 0),
  ('b3e5a286-6432-5ae6-bbb3-613b24b86b76', '89bb8215-0459-566c-a2a8-f59b3d782824', 'B', 'Ulnar nerve', false, 1),
  ('8167609b-b56f-5309-8c3c-3189109a09f7', '89bb8215-0459-566c-a2a8-f59b3d782824', 'C', 'Median nerve', true, 2),
  ('1858bee7-d2de-59ce-82ab-b81a807491c9', '89bb8215-0459-566c-a2a8-f59b3d782824', 'D', 'Ulnar artery', false, 3),
  ('a9985846-a9b2-57a1-8756-b9246ab5ed25', '89bb8215-0459-566c-a2a8-f59b3d782824', 'E', 'Palmaris longus tendon', false, 4);

-- Q671
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('38c1145d-2317-5262-97f0-cfc14e327eaa', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000023', 'sba', 'A 40 year old man drank a large amount of homemade spirit. Twelve hours later he has blurred vision, abdominal pain and deep rapid breathing. pH is 7.05 with a high anion gap and high osmolar gap. What is the SINGLE most appropriate antidote?', 'Methanol is metabolised by alcohol dehydrogenase to formic acid, causing optic nerve damage and metabolic acidosis. Fomepizole blocks alcohol dehydrogenase. Haemodialysis for severe toxicity; folinic acid helps clear formate.', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v6')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = '38c1145d-2317-5262-97f0-cfc14e327eaa';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('6106d59e-6a07-598f-ab9e-a460299df089', '38c1145d-2317-5262-97f0-cfc14e327eaa', 'A', 'Fomepizole (or IV ethanol if unavailable)', true, 0),
  ('8a8a7fc8-d2af-5dbc-93d5-d1f238e29978', '38c1145d-2317-5262-97f0-cfc14e327eaa', 'B', 'N-acetylcysteine', false, 1),
  ('6a526bc1-c262-5010-9b85-336bd9f1851d', '38c1145d-2317-5262-97f0-cfc14e327eaa', 'C', 'Desferrioxamine', false, 2),
  ('f9322845-2432-550d-9d39-a165750db2c3', '38c1145d-2317-5262-97f0-cfc14e327eaa', 'D', 'Flumazenil', false, 3),
  ('3a186693-a19c-5dfa-88b4-504700c8f7fa', '38c1145d-2317-5262-97f0-cfc14e327eaa', 'E', 'Naloxone', false, 4);

-- Q672
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('c4e5df4f-b774-5a56-8356-6fdb064f7d46', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000023', 'sba', 'A 25 year old man collapsed while running a marathon on a hot day. He is confused and his core temperature is 41.5 °C. His skin is hot. What is the SINGLE most appropriate management?', 'Exertional heat stroke (core over 40 °C with CNS dysfunction) is an emergency. Cool rapidly to below 39 °C. Complications: rhabdomyolysis, AKI, DIC, liver failure. Antipyretics are ineffective.', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v6')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = 'c4e5df4f-b774-5a56-8356-6fdb064f7d46';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('aefd3c01-4101-5bb7-8ceb-f3b4f69e801f', 'c4e5df4f-b774-5a56-8356-6fdb064f7d46', 'A', 'Paracetamol', false, 0),
  ('9de4e642-4b70-5b0f-8e8c-b5fe896b914d', 'c4e5df4f-b774-5a56-8356-6fdb064f7d46', 'B', 'Rapid cooling (cold water immersion or evaporative cooling) and ABCDE resuscitation', true, 1),
  ('0d785088-c6af-5a92-b3e3-f6b2e3e8f853', 'c4e5df4f-b774-5a56-8356-6fdb064f7d46', 'C', 'Allow gradual cooling over 24 hours', false, 2),
  ('3530e034-0577-5ac3-b1b5-fc8b958ea2c4', 'c4e5df4f-b774-5a56-8356-6fdb064f7d46', 'D', 'Dantrolene first-line', false, 3),
  ('5bfc7746-114e-50bd-9617-999df2629700', 'c4e5df4f-b774-5a56-8356-6fdb064f7d46', 'E', 'Warm IV fluids', false, 4);

-- Q673
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('dd4888b2-caba-5b1d-951a-bbfa34a5d2e6', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000023', 'sba', 'A 60 year old man was found in a cold house. His core temperature is 29 °C. He has a slow AF. What is the SINGLE most appropriate management?', 'Moderate-severe hypothermia (below 32 °C) causes bradycardia, J waves and arrhythmias. Handle gently. ''Not dead until warm and dead''. ECMO or bypass for cardiac arrest.', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v6')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = 'dd4888b2-caba-5b1d-951a-bbfa34a5d2e6';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('8b074785-77ba-5f3e-b081-ef6ee6de28d2', 'dd4888b2-caba-5b1d-951a-bbfa34a5d2e6', 'A', 'Leave untreated', false, 0),
  ('617e723f-50ee-5ce1-9919-159ddefb702f', 'dd4888b2-caba-5b1d-951a-bbfa34a5d2e6', 'B', 'Give atropine', false, 1),
  ('190766d0-435c-5a26-8ae2-454044d5304d', 'dd4888b2-caba-5b1d-951a-bbfa34a5d2e6', 'C', 'Rapid IV rewarming with hot water bottles to the limbs only', false, 2),
  ('2d6d05fb-7832-538e-8aab-6f4630e3c371', 'dd4888b2-caba-5b1d-951a-bbfa34a5d2e6', 'D', 'Defibrillate the AF', false, 3),
  ('ca13c4f9-068d-5aa1-ad43-191e44208d13', 'dd4888b2-caba-5b1d-951a-bbfa34a5d2e6', 'E', 'Active rewarming with careful handling; avoid rough movement as it can trigger VF', true, 4);

-- Q674
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('79e653da-d325-51a7-aadf-3674434d7860', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000023', 'sba', 'A 45 year old woman has taken 40 tablets of amitriptyline. She has a broad QRS (140 ms) and BP of 85/50. What is the SINGLE most appropriate treatment?', 'Tricyclic overdose causes anticholinergic effects, seizures, QRS widening and arrhythmias. Sodium bicarbonate is used for QRS over 120 ms, arrhythmias or acidosis. Avoid class Ia/Ic antiarrhythmics.', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v6')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = '79e653da-d325-51a7-aadf-3674434d7860';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('e4cce886-3141-5310-8562-8c227ab63ef7', '79e653da-d325-51a7-aadf-3674434d7860', 'A', 'Naloxone', false, 0),
  ('6acd0451-58fc-565a-85d9-3e170899bc91', '79e653da-d325-51a7-aadf-3674434d7860', 'B', 'Amiodarone', false, 1),
  ('10bcfe88-ad0b-5a74-b4bc-ba1d64cb8c3d', '79e653da-d325-51a7-aadf-3674434d7860', 'C', 'Flumazenil', false, 2),
  ('b9e44cc2-1486-57a8-8088-94885292bbe9', '79e653da-d325-51a7-aadf-3674434d7860', 'D', 'Physostigmine', false, 3),
  ('e3f2eeff-b0ba-5d01-9636-ce00a3ec2e85', '79e653da-d325-51a7-aadf-3674434d7860', 'E', 'IV sodium bicarbonate', true, 4);

-- Q675
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('5271046b-33a2-5339-b791-d51824fcdbc2', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000033', 'sba', 'A 35 year old woman had a mastectomy with axillary clearance. Her scapula sticks out when she pushes against a wall. Which nerve has been damaged?', 'Long thoracic nerve (C5-C7) injury causes winging of the scapula. The thoracodorsal nerve supplies latissimus dorsi. Accessory nerve injury (neck surgery) weakens trapezius.', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v6')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = '5271046b-33a2-5339-b791-d51824fcdbc2';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('197a08d1-cc2b-5518-888f-62d1c8bd1fd8', '5271046b-33a2-5339-b791-d51824fcdbc2', 'A', 'Accessory nerve', false, 0),
  ('3708f9eb-7c6e-5b73-8354-cf308aefa3a5', '5271046b-33a2-5339-b791-d51824fcdbc2', 'B', 'Long thoracic nerve (serratus anterior)', true, 1),
  ('2e64bae1-5aa1-54a7-a888-1984af0ec0ae', '5271046b-33a2-5339-b791-d51824fcdbc2', 'C', 'Thoracodorsal nerve', false, 2),
  ('a1e116fc-b38f-5755-a9a7-08f11dbd7f52', '5271046b-33a2-5339-b791-d51824fcdbc2', 'D', 'Suprascapular nerve', false, 3),
  ('aa595047-4b5f-5e07-8db2-e33c37bad0e4', '5271046b-33a2-5339-b791-d51824fcdbc2', 'E', 'Axillary nerve', false, 4);

-- Q676
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('aa37ffbe-5b55-571b-9be1-4725979ca628', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000033', 'sba', 'Which change shifts the oxygen-haemoglobin dissociation curve to the RIGHT?', 'A right shift reduces haemoglobin affinity for oxygen, so oxygen is released to tissues (Bohr effect). Left shift: alkalosis, low temperature, low 2,3-DPG, HbF, CO.', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v6')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = 'aa37ffbe-5b55-571b-9be1-4725979ca628';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('d5a7e870-4f00-5210-8f78-e007c851e06e', 'aa37ffbe-5b55-571b-9be1-4725979ca628', 'A', 'Hypothermia', false, 0),
  ('4bdf841a-9a1b-5cd8-acf4-c7ff25ce7e2f', 'aa37ffbe-5b55-571b-9be1-4725979ca628', 'B', 'Raised 2,3-DPG, temperature, CO2 or acidity', true, 1),
  ('04142ced-0ac7-5731-b8e1-346645c778ec', 'aa37ffbe-5b55-571b-9be1-4725979ca628', 'C', 'Alkalosis', false, 2),
  ('0ffa5008-5dc0-5d4d-bf8c-015c1a3f18ab', 'aa37ffbe-5b55-571b-9be1-4725979ca628', 'D', 'Carbon monoxide', false, 3),
  ('6e7855cf-88cd-5859-b36f-ecde02203054', 'aa37ffbe-5b55-571b-9be1-4725979ca628', 'E', 'Fetal haemoglobin', false, 4);

-- Q677
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('607835d9-73de-56c7-ae25-fad071fbd628', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000022', 'sba', 'A 65 year old man has a painless, hard lump under his nipple. It is fixed and the nipple is retracted. What is the SINGLE most appropriate action?', 'Male breast cancer is rare, often eccentric, hard and fixed. Risk factors: BRCA2, Klinefelter''s, oestrogen exposure. NICE NG12: refer men aged 50 or over with a unilateral subareolar mass.', null, true, true, jsonb_build_object('source', 'plab1-xlsx-v6', 'guidelines_text', 'NICE NG12')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = '607835d9-73de-56c7-ae25-fad071fbd628';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('b12c0ade-c69e-5e60-82f5-40dbfa2c5c91', '607835d9-73de-56c7-ae25-fad071fbd628', 'A', 'Review in 6 months', false, 0),
  ('1416f402-b575-5e28-8291-44420af3a610', '607835d9-73de-56c7-ae25-fad071fbd628', 'B', 'Two-week-wait referral for suspected breast cancer', true, 1),
  ('673ade77-4381-5c28-9751-c3b8c1c162cd', '607835d9-73de-56c7-ae25-fad071fbd628', 'C', 'Antibiotics', false, 2),
  ('7ca672dc-c6a1-5548-92c8-b14896809c7b', '607835d9-73de-56c7-ae25-fad071fbd628', 'D', 'Reassure it is gynaecomastia', false, 3),
  ('e53459c7-691e-5951-a301-a87ed5e80c8b', '607835d9-73de-56c7-ae25-fad071fbd628', 'E', 'Stop spironolactone', false, 4);

-- Q678
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('31d6419b-ae26-5d47-95b0-d42d9f4b8aaa', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000022', 'sba', 'A 16 year old boy has tender, rubbery discs of tissue under both nipples. He is otherwise well with normal testes. What is the SINGLE most appropriate management?', 'Pubertal gynaecomastia is common. Examine testes. Causes in adults: drugs (spironolactone, digoxin, cannabis, finasteride), liver disease, hypogonadism, hyperthyroidism, tumours.', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v6')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = '31d6419b-ae26-5d47-95b0-d42d9f4b8aaa';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('aeaa44b6-a3dd-54da-b04c-5941a14215a2', '31d6419b-ae26-5d47-95b0-d42d9f4b8aaa', 'A', 'Testicular ultrasound for all', false, 0),
  ('47a31593-475f-5598-a60b-aaba0d6d9cdb', '31d6419b-ae26-5d47-95b0-d42d9f4b8aaa', 'B', 'Reassure; pubertal gynaecomastia usually resolves within 2 years', true, 1),
  ('dc39e826-1183-5724-8dbd-de5ed60dcd6e', '31d6419b-ae26-5d47-95b0-d42d9f4b8aaa', 'C', 'Tamoxifen for all', false, 2),
  ('e317dc55-4aa3-586d-8916-33e40e57eaa8', '31d6419b-ae26-5d47-95b0-d42d9f4b8aaa', 'D', 'Mastectomy', false, 3),
  ('3f80e27b-51b6-5d80-8698-19e40441b8d3', '31d6419b-ae26-5d47-95b0-d42d9f4b8aaa', 'E', 'Mammography', false, 4);

-- Q679
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('72b9c96d-035c-5440-b998-86d4a75e8e5a', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000022', 'sba', 'A 50 year old woman had a seatbelt injury to her breast 2 months ago. She now has a firm, irregular lump in the same place. What is the SINGLE most likely diagnosis?', 'Fat necrosis follows trauma, surgery or radiotherapy and can mimic cancer (hard, irregular, skin tethering, calcification). Triple assessment confirms.', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v6')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = '72b9c96d-035c-5440-b998-86d4a75e8e5a';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('8fc85bcb-ab4f-52c4-99b1-817fa7bf3718', '72b9c96d-035c-5440-b998-86d4a75e8e5a', 'A', 'Breast cyst', false, 0),
  ('684a39c3-d8c7-557d-8736-f28a9f520710', '72b9c96d-035c-5440-b998-86d4a75e8e5a', 'B', 'Breast abscess', false, 1),
  ('b77ef4fa-cffc-55a8-b285-6e90e4ca560b', '72b9c96d-035c-5440-b998-86d4a75e8e5a', 'C', 'Fat necrosis (still needs triple assessment)', true, 2),
  ('aa027e7c-f0af-5489-ac80-ae22f24b7a2e', '72b9c96d-035c-5440-b998-86d4a75e8e5a', 'D', 'Fibroadenoma', false, 3),
  ('771b58a7-86a9-570e-be8f-b5b6cddd6e9c', '72b9c96d-035c-5440-b998-86d4a75e8e5a', 'E', 'Lipoma', false, 4);

-- Q680
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('48eba6a7-763b-5bc6-89a1-43262aa0884e', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000022', 'sba', 'A 40 year old woman has a tender, cord-like band on the side of her chest wall that runs across her breast. What is the SINGLE most likely diagnosis?', 'Mondor''s disease is thrombophlebitis of superficial chest wall veins. It is self-limiting with NSAIDs. Occasionally associated with breast cancer, so imaging is advised.', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v6')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = '48eba6a7-763b-5bc6-89a1-43262aa0884e';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('1dbaabf7-c23d-55fa-9d23-cdb9ea820709', '48eba6a7-763b-5bc6-89a1-43262aa0884e', 'A', 'Lymphangitis', false, 0),
  ('122c9f4d-7d92-519e-b4ce-de1925aa1b5a', '48eba6a7-763b-5bc6-89a1-43262aa0884e', 'B', 'Breast cancer', false, 1),
  ('0eb1ef71-f36b-5538-9dae-7969a283c342', '48eba6a7-763b-5bc6-89a1-43262aa0884e', 'C', 'Costochondritis', false, 2),
  ('60178de2-a7b5-5d90-ae6a-c720b1bbe83d', '48eba6a7-763b-5bc6-89a1-43262aa0884e', 'D', 'Shingles', false, 3),
  ('fe0c66da-538d-5f57-a92d-454bf44052eb', '48eba6a7-763b-5bc6-89a1-43262aa0884e', 'E', 'Mondor''s disease (superficial thrombophlebitis)', true, 4);

-- Q681
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('eb3829b9-5acf-5784-98cb-ab3a2fc753f3', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000024', 'sba', 'A 70 year old retired shipyard worker has had breathlessness and chest pain. CXR shows a unilateral pleural effusion and pleural thickening. What is the SINGLE most likely diagnosis?', 'Mesothelioma is linked to asbestos exposure, with a long latency (20-50 years). Diagnosis by pleural biopsy (thoracoscopy). It may qualify for industrial injuries compensation. The death must be referred to the coroner.', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v6')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = 'eb3829b9-5acf-5784-98cb-ab3a2fc753f3';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('56582f68-76c0-5174-b3b1-cb3b5690f601', 'eb3829b9-5acf-5784-98cb-ab3a2fc753f3', 'A', 'Lung adenocarcinoma', false, 0),
  ('da2ebf0f-8177-5f5a-92ab-886933f68a3a', 'eb3829b9-5acf-5784-98cb-ab3a2fc753f3', 'B', 'Mesothelioma', true, 1),
  ('71a38977-903f-5d6b-aa4b-59af593679fe', 'eb3829b9-5acf-5784-98cb-ab3a2fc753f3', 'C', 'Pneumonia', false, 2),
  ('f47e54e1-16e4-581f-93a1-38f357fd1289', 'eb3829b9-5acf-5784-98cb-ab3a2fc753f3', 'D', 'TB', false, 3),
  ('9cbd885c-d346-5970-836f-d7fea7cf8766', 'eb3829b9-5acf-5784-98cb-ab3a2fc753f3', 'E', 'Heart failure', false, 4);

-- Q682
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('6f221706-adcb-5349-b1fd-1158bae2b0c2', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000024', 'sba', 'A 45 year old man of Chinese origin has had nasal obstruction, blood-stained nasal discharge, unilateral hearing loss and a neck lump. What is the SINGLE most likely diagnosis?', 'Nasopharyngeal carcinoma is common in southern China and linked to EBV. Unilateral otitis media with effusion in an adult needs nasopharynx examination. Treatment: chemoradiotherapy.', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v6')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = '6f221706-adcb-5349-b1fd-1158bae2b0c2';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('3cc3839c-ae68-54e4-9740-1d4ede2250c8', '6f221706-adcb-5349-b1fd-1158bae2b0c2', 'A', 'Lymphoma', false, 0),
  ('2746f3a1-4433-54df-920d-f9001701c72f', '6f221706-adcb-5349-b1fd-1158bae2b0c2', 'B', 'Glue ear', false, 1),
  ('c7919dda-731e-5788-9fc4-835de51973c2', '6f221706-adcb-5349-b1fd-1158bae2b0c2', 'C', 'Nasal polyps', false, 2),
  ('9ae8c36f-93fd-53c2-a407-3c541049c53b', '6f221706-adcb-5349-b1fd-1158bae2b0c2', 'D', 'Thyroid cancer', false, 3),
  ('e9e3a3a7-2b72-52b0-a2d9-91cf52848f34', '6f221706-adcb-5349-b1fd-1158bae2b0c2', 'E', 'Nasopharyngeal carcinoma (EBV-associated)', true, 4);

-- Q683
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('c4f4563c-46ec-5bb2-af8c-6543df89651f', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000024', 'sba', 'A 60 year old woman is on chemotherapy. She has a temperature of 38.3 °C and feels unwell. Neutrophils are 0.3. What is the SINGLE most appropriate action?', 'NICE CG151: neutropenic sepsis (neutrophils 0.5 or lower with fever over 38 °C or signs of sepsis) needs empirical IV piperacillin-tazobactam immediately. Do not wait for the FBC if suspected.', null, true, true, jsonb_build_object('source', 'plab1-xlsx-v6', 'guidelines_text', 'NICE CG151')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = 'c4f4563c-46ec-5bb2-af8c-6543df89651f';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('8b5d1905-e58e-567e-97fc-8c52b5cfffaf', 'c4f4563c-46ec-5bb2-af8c-6543df89651f', 'A', 'Wait for culture results', false, 0),
  ('b2be0b77-7eff-546a-98c6-1f4bac5597a7', 'c4f4563c-46ec-5bb2-af8c-6543df89651f', 'B', 'Paracetamol and review tomorrow', false, 1),
  ('e06fabbd-2c13-5217-bf13-3bc4ccca8bf9', 'c4f4563c-46ec-5bb2-af8c-6543df89651f', 'C', 'Oral antibiotics at home', false, 2),
  ('b119f152-bd1f-5ded-9375-ad7185692472', 'c4f4563c-46ec-5bb2-af8c-6543df89651f', 'D', 'IV piperacillin-tazobactam within 1 hour of arrival (neutropenic sepsis)', true, 3),
  ('d47cfab6-a99e-5d94-bf26-f5e29a8add00', 'c4f4563c-46ec-5bb2-af8c-6543df89651f', 'E', 'G-CSF only', false, 4);

-- Q684
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('46eb1090-8eb4-5219-9f2b-74e08b85fa93', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000001', 'sba', 'A 17 year old boy collapsed while playing football. His father died suddenly aged 35. Echo shows asymmetric septal hypertrophy and systolic anterior motion of the mitral valve. What is the SINGLE most likely diagnosis?', 'HCM is autosomal dominant (sarcomere genes). Ejection systolic murmur increases with Valsalva and decreases with squatting. Avoid competitive sport, beta-blockers, ICD if high risk, screen family.', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v6')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = '46eb1090-8eb4-5219-9f2b-74e08b85fa93';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('9b9af87d-d542-5827-bbb0-66b5b4c33c79', '46eb1090-8eb4-5219-9f2b-74e08b85fa93', 'A', 'Myocarditis', false, 0),
  ('9262c279-da7e-541c-8c98-d656e71f5cca', '46eb1090-8eb4-5219-9f2b-74e08b85fa93', 'B', 'Dilated cardiomyopathy', false, 1),
  ('bc89d64a-0c3e-5589-8e8e-691e3526bd54', '46eb1090-8eb4-5219-9f2b-74e08b85fa93', 'C', 'Marfan syndrome', false, 2),
  ('256702d7-2eb3-5c2a-86ea-df88ad5de5c6', '46eb1090-8eb4-5219-9f2b-74e08b85fa93', 'D', 'Aortic stenosis', false, 3),
  ('d651ffcf-d893-55df-9606-2723f46f771c', '46eb1090-8eb4-5219-9f2b-74e08b85fa93', 'E', 'Hypertrophic cardiomyopathy', true, 4);

-- Q685
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('6a93a716-28e7-56d6-b3f3-eda17c5ff454', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000001', 'sba', 'A 70 year old woman has had syncope on exertion and angina. She has a slow-rising pulse and an ejection systolic murmur radiating to the carotids. What is the SINGLE most appropriate definitive treatment if severe?', 'Symptomatic severe aortic stenosis (angina, syncope, heart failure) has a poor prognosis without valve replacement. TAVI is used in older or higher-risk patients.', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v6')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = '6a93a716-28e7-56d6-b3f3-eda17c5ff454';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('850d9aeb-ccad-552d-bc2c-4ef4ed0dd4be', '6a93a716-28e7-56d6-b3f3-eda17c5ff454', 'A', 'Beta-blocker only', false, 0),
  ('158f843c-4e88-5e84-b769-fd4c6d404a3a', '6a93a716-28e7-56d6-b3f3-eda17c5ff454', 'B', 'Balloon valvuloplasty for all', false, 1),
  ('d2337922-1fa0-56a7-a452-31584a567aed', '6a93a716-28e7-56d6-b3f3-eda17c5ff454', 'C', 'Warfarin', false, 2),
  ('bdad8575-71a0-5caa-bbf3-f74c26dd491d', '6a93a716-28e7-56d6-b3f3-eda17c5ff454', 'D', 'Aortic valve replacement (surgical or TAVI)', true, 3),
  ('d2189cf4-370d-5112-8464-f1381e6784e7', '6a93a716-28e7-56d6-b3f3-eda17c5ff454', 'E', 'Nitrates', false, 4);

-- Q686
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('aa59017f-a38e-5b3d-9cfc-25ea3ab691d7', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000001', 'sba', 'A 65 year old man has a heart rate of 38 and dizziness. ECG shows P waves with no relation to QRS complexes. BP is 85/50. What is the SINGLE most appropriate immediate treatment?', 'Complete heart block with adverse features: atropine (repeat up to 3 mg), then isoprenaline or adrenaline infusion, or transcutaneous pacing. Permanent pacemaker for third degree block.', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v6')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = 'aa59017f-a38e-5b3d-9cfc-25ea3ab691d7';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('7327e3ce-921d-5e96-be34-d85234fc9873', 'aa59017f-a38e-5b3d-9cfc-25ea3ab691d7', 'A', 'Beta-blocker', false, 0),
  ('d2cacaa9-3ae5-5f55-a975-4b93cc3fd6b3', 'aa59017f-a38e-5b3d-9cfc-25ea3ab691d7', 'B', 'Amiodarone', false, 1),
  ('393fa70a-a0e0-52a6-99b3-9af0bb546ab5', 'aa59017f-a38e-5b3d-9cfc-25ea3ab691d7', 'C', 'DC cardioversion', false, 2),
  ('6c7be974-3fee-5285-94c3-3aa921c1e14d', 'aa59017f-a38e-5b3d-9cfc-25ea3ab691d7', 'D', 'IV atropine 500 micrograms, then transcutaneous pacing if no response', true, 3),
  ('018e6407-7b7f-593b-9f98-36ebd0332bb4', 'aa59017f-a38e-5b3d-9cfc-25ea3ab691d7', 'E', 'Adenosine', false, 4);

-- Q687
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('92ffec68-9779-575e-871e-e77eea0f4318', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000009', 'sba', 'A 4 year old boy has had a limp and hip pain for 2 weeks. He is afebrile and well. X-ray shows a flattened, fragmented femoral head. What is the SINGLE most likely diagnosis?', 'Perthes disease is avascular necrosis of the femoral head in children aged 4-8 (boys). Management: observation, physiotherapy, sometimes surgery. Prognosis is better under age 6.', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v6')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = '92ffec68-9779-575e-871e-e77eea0f4318';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('5b169f6a-7501-5377-abe5-968eb5df47f6', '92ffec68-9779-575e-871e-e77eea0f4318', 'A', 'Transient synovitis', false, 0),
  ('a190010e-74a4-5e93-b645-eedd2684b883', '92ffec68-9779-575e-871e-e77eea0f4318', 'B', 'SUFE', false, 1),
  ('2468a923-18ab-5931-8da4-220c0cf9a1d6', '92ffec68-9779-575e-871e-e77eea0f4318', 'C', 'DDH', false, 2),
  ('0eaf9d9b-262e-5a36-ad95-a6349551d662', '92ffec68-9779-575e-871e-e77eea0f4318', 'D', 'Perthes disease', true, 3),
  ('2b697ba1-f9b1-5db3-b21c-2ce4a023a4d3', '92ffec68-9779-575e-871e-e77eea0f4318', 'E', 'Septic arthritis', false, 4);

-- Q688
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('7426268a-7bb2-512a-954e-1cc3803e4313', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000009', 'sba', 'A newborn baby has a foot turned inwards and downwards that cannot be corrected passively. What is the SINGLE most likely diagnosis and treatment?', 'Structural clubfoot cannot be corrected passively. The Ponseti method is highly effective. Positional talipes corrects passively and resolves.', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v6')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = '7426268a-7bb2-512a-954e-1cc3803e4313';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('ac9cc347-7bbf-557d-9128-e6bcf4ae13d5', '7426268a-7bb2-512a-954e-1cc3803e4313', 'A', 'Positional talipes; no treatment', false, 0),
  ('920e19f0-3987-5851-a42d-cff4e8ae1967', '7426268a-7bb2-512a-954e-1cc3803e4313', 'B', 'Vertical talus; surgery at once', false, 1),
  ('288daf29-dfab-51f4-abe1-eb96cbc68327', '7426268a-7bb2-512a-954e-1cc3803e4313', 'C', 'Metatarsus adductus; reassure', false, 2),
  ('28a72de2-f9a9-506f-acbe-f73645c0376a', '7426268a-7bb2-512a-954e-1cc3803e4313', 'D', 'Cerebral palsy; physiotherapy', false, 3),
  ('1f2e50a6-00b8-5f70-ad55-5c683cb3ec95', '7426268a-7bb2-512a-954e-1cc3803e4313', 'E', 'Congenital talipes equinovarus; Ponseti method (serial casting, Achilles tenotomy, boots)', true, 4);

-- Q689
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('218b1b72-7186-57bf-b5bb-1f7bde415efd', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000009', 'sba', 'A 7 year old girl has had a red, swollen face and red, ''slapped cheeks'', followed by a lacy rash on her arms. She is well. Her mother is 12 weeks pregnant. What infection is this, and what is the risk?', 'Parvovirus (fifth disease) is infectious before the rash. In pregnancy, especially before 20 weeks, it can cause fetal hydrops. Check maternal IgG and IgM; refer to fetal medicine if infected.', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v6')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = '218b1b72-7186-57bf-b5bb-1f7bde415efd';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('9ec36799-76e3-5c52-8b4a-b290e3123b8c', '218b1b72-7186-57bf-b5bb-1f7bde415efd', 'A', 'Roseola; febrile seizures', false, 0),
  ('761cd8f0-15be-5bd2-99ea-869db3cbf4a0', '218b1b72-7186-57bf-b5bb-1f7bde415efd', 'B', 'Rubella; cataracts', false, 1),
  ('403f501a-42a2-56a2-99a4-669c79e18450', '218b1b72-7186-57bf-b5bb-1f7bde415efd', 'C', 'Scarlet fever; rheumatic fever', false, 2),
  ('d24f78f5-17e2-524a-aea6-6fa708740e1b', '218b1b72-7186-57bf-b5bb-1f7bde415efd', 'D', 'Parvovirus B19; risk of fetal anaemia and hydrops (check mother''s immunity)', true, 3),
  ('3afba48a-2e48-58f2-9659-406651b610cf', '218b1b72-7186-57bf-b5bb-1f7bde415efd', 'E', 'Measles; deafness', false, 4);

-- Q690
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('727fa5bf-2c97-5867-bfaf-e5dd88321b90', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000025', 'sba', 'A 70 year old man with an eGFR of 25 needs a contrast CT. What is the MOST important measure to reduce the risk of contrast-induced AKI?', 'Contrast-associated AKI risk is higher with eGFR under 30, diabetes and dehydration. Pre-hydrate, minimise contrast and consider withholding nephrotoxic drugs (NSAIDs, metformin per local policy).', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v6')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = '727fa5bf-2c97-5867-bfaf-e5dd88321b90';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('6879cd5d-519e-5e88-a01a-6b7f72282c1c', '727fa5bf-2c97-5867-bfaf-e5dd88321b90', 'A', 'Withhold all fluids', false, 0),
  ('01620cfa-1a9e-5884-aa8c-5e122b2751f9', '727fa5bf-2c97-5867-bfaf-e5dd88321b90', 'B', 'Use double contrast dose', false, 1),
  ('4d880bb2-cf12-5655-83ee-1f6128ee6c98', '727fa5bf-2c97-5867-bfaf-e5dd88321b90', 'C', 'No precautions', false, 2),
  ('50894efc-d862-51a6-9f78-5ac1e64aed5f', '727fa5bf-2c97-5867-bfaf-e5dd88321b90', 'D', 'IV hydration (e.g. 0.9% saline) before and after, and check renal function after', true, 3),
  ('7860c23f-cd61-55d2-8095-a39a4f4a4a8e', '727fa5bf-2c97-5867-bfaf-e5dd88321b90', 'E', 'Give furosemide', false, 4);

-- Q691
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('5836f156-7d5f-5f27-bda6-a82577d55fd6', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000025', 'sba', 'A 75 year old man with a permanent pacemaker needs an MRI brain. What is the MOST appropriate action?', 'Many modern devices are MRI-conditional if specific conditions are met. Older non-conditional devices may still be scanned in specialist settings. Cochlear implants and some aneurysm clips are also a concern.', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v6')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = '5836f156-7d5f-5f27-bda6-a82577d55fd6';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('e10c9935-e485-5dc7-ab2c-8e495b690769', '5836f156-7d5f-5f27-bda6-a82577d55fd6', 'A', 'Check whether the device is MRI-conditional and arrange cardiology input before scanning', true, 0),
  ('49ccbbd9-8135-5f2b-890d-3cacae27471f', '5836f156-7d5f-5f27-bda6-a82577d55fd6', 'B', 'Use CT only in all', false, 1),
  ('da65ac93-293a-59f0-9831-3233f85ea22c', '5836f156-7d5f-5f27-bda6-a82577d55fd6', 'C', 'Proceed with MRI as normal', false, 2),
  ('022ed530-3966-57b1-9dbb-dda7e8ad449d', '5836f156-7d5f-5f27-bda6-a82577d55fd6', 'D', 'Remove the pacemaker', false, 3),
  ('89b42604-309b-56ba-a926-7d99a73c620c', '5836f156-7d5f-5f27-bda6-a82577d55fd6', 'E', 'Turn off the pacemaker at home', false, 4);

-- Q692
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('cc82b434-287e-51f4-9a7f-02b22e0209e2', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000025', 'sba', 'A 45 year old woman has had right upper quadrant pain after fatty meals. What is the SINGLE most appropriate first-line imaging?', 'Ultrasound is first-line for suspected gallstones and cholecystitis. MRCP if common bile duct stones are suspected with a normal ultrasound. ERCP is therapeutic.', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v6')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = 'cc82b434-287e-51f4-9a7f-02b22e0209e2';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('b74400ea-f956-5d67-a152-5f91d8fe8496', 'cc82b434-287e-51f4-9a7f-02b22e0209e2', 'A', 'Abdominal ultrasound', true, 0),
  ('29743825-df68-58f5-b17e-c276029016fc', 'cc82b434-287e-51f4-9a7f-02b22e0209e2', 'B', 'ERCP', false, 1),
  ('9933a0f6-4bc4-50c4-be51-2e002f51380b', 'cc82b434-287e-51f4-9a7f-02b22e0209e2', 'C', 'MRCP', false, 2),
  ('5772bcb2-90d0-5465-8ff6-a96c64c190f2', 'cc82b434-287e-51f4-9a7f-02b22e0209e2', 'D', 'CT abdomen', false, 3),
  ('f71bd0a5-7e70-5e36-9e96-2098d3ecffdb', 'cc82b434-287e-51f4-9a7f-02b22e0209e2', 'E', 'HIDA scan', false, 4);

-- Q693
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('5ee6b149-e945-52ec-ac23-718b60612596', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000025', 'sba', 'A 65 year old woman has a DEXA scan. Her T-score at the hip is -2.7. What does this mean?', 'T-scores compare to young adult mean: above -1 normal, -1 to -2.5 osteopenia, -2.5 or lower osteoporosis. Z-scores compare to age-matched controls.', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v6')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = '5ee6b149-e945-52ec-ac23-718b60612596';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('fa4fea77-0b16-5346-b822-3f8de75ef7b1', '5ee6b149-e945-52ec-ac23-718b60612596', 'A', 'Paget''s disease', false, 0),
  ('62f5809f-bae9-5586-b037-3173537ee185', '5ee6b149-e945-52ec-ac23-718b60612596', 'B', 'Osteoporosis (T-score -2.5 or lower)', true, 1),
  ('22bd53f3-a8a2-5664-8ee5-5211ded2b70d', '5ee6b149-e945-52ec-ac23-718b60612596', 'C', 'Normal bone density', false, 2),
  ('b7c9259b-c4ac-5cd7-83f6-44136d36db81', '5ee6b149-e945-52ec-ac23-718b60612596', 'D', 'Osteomalacia', false, 3),
  ('cd6896dd-9427-586e-a2b7-36d7121c0ff1', '5ee6b149-e945-52ec-ac23-718b60612596', 'E', 'Osteopenia', false, 4);

-- Q694
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('79c2a063-a25e-5e99-902b-652a8a36d9b6', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000034', 'sba', 'A 70 year old woman takes warfarin and has been given clarithromycin for a chest infection. What is the MOST likely effect?', 'Macrolides, fluconazole, metronidazole and ciprofloxacin inhibit warfarin metabolism (raise INR). Enzyme inducers (rifampicin, carbamazepine, St John''s wort) reduce INR. Check INR when starting antibiotics.', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v6')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = '79c2a063-a25e-5e99-902b-652a8a36d9b6';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('1adc1d10-bf4e-538a-86c9-8f44337f9530', '79c2a063-a25e-5e99-902b-652a8a36d9b6', 'A', 'Hyperkalaemia', false, 0),
  ('a8f1e345-b520-5573-ac08-e8264097a45b', '79c2a063-a25e-5e99-902b-652a8a36d9b6', 'B', 'Raised INR and bleeding risk (enzyme inhibition)', true, 1),
  ('5c10e8f9-6a8d-5a37-8263-4c2f3d60876d', '79c2a063-a25e-5e99-902b-652a8a36d9b6', 'C', 'No interaction', false, 2),
  ('73680c6c-a0fc-5be6-9e6f-1125c453ed55', '79c2a063-a25e-5e99-902b-652a8a36d9b6', 'D', 'Hypoglycaemia', false, 3),
  ('40bec711-9396-5c08-a6f3-cd5cbe229b20', '79c2a063-a25e-5e99-902b-652a8a36d9b6', 'E', 'Reduced INR', false, 4);

-- Q695
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('5394b496-4024-5958-8779-9b1a18ada216', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000034', 'sba', 'A 25 year old woman on the combined pill starts St John''s wort for low mood. What is the MOST important advice?', 'St John''s wort induces CYP3A4, reducing levels of the pill, warfarin, ciclosporin and others. It can also cause serotonin syndrome with SSRIs.', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v6')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = '5394b496-4024-5958-8779-9b1a18ada216';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('9dada2c0-25b3-57fb-ac56-035ed266801b', '5394b496-4024-5958-8779-9b1a18ada216', 'A', 'It increases contraceptive effect', false, 0),
  ('c02a1ba5-4607-5b04-998d-08066f58e693', '5394b496-4024-5958-8779-9b1a18ada216', 'B', 'It induces liver enzymes and may reduce contraceptive effectiveness; use another method', true, 1),
  ('eefaf6aa-ab59-5a64-839a-17c4bb27e519', '5394b496-4024-5958-8779-9b1a18ada216', 'C', 'No interaction', false, 2),
  ('cdf150fe-16d8-52ca-b3a8-7897dc962f4d', '5394b496-4024-5958-8779-9b1a18ada216', 'D', 'It causes hyperkalaemia', false, 3),
  ('1ae047d1-a34f-570b-8c6d-630830655413', '5394b496-4024-5958-8779-9b1a18ada216', 'E', 'It is safe with all drugs', false, 4);

-- Q696
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('1a25dabb-5133-575f-84ea-93f1741a5b07', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000034', 'sba', 'A 60 year old man is on IV gentamicin for sepsis. Which monitoring is MOST important?', 'Aminoglycosides are nephrotoxic and ototoxic. Dose by weight and renal function; monitor trough levels. Avoid with loop diuretics and in myasthenia gravis.', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v6')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = '1a25dabb-5133-575f-84ea-93f1741a5b07';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('2c7cf16a-4dce-5546-9ee2-5de4cd06d101', '1a25dabb-5133-575f-84ea-93f1741a5b07', 'A', 'Thyroid function', false, 0),
  ('84429a72-3aba-5001-b532-c347fd2599c0', '1a25dabb-5133-575f-84ea-93f1741a5b07', 'B', 'ECG for QT only', false, 1),
  ('be8f7b98-b52f-51cc-861d-1475baf2ac26', '1a25dabb-5133-575f-84ea-93f1741a5b07', 'C', 'Blood glucose', false, 2),
  ('c12f09cd-5e7a-5857-8a52-4cce9375b89a', '1a25dabb-5133-575f-84ea-93f1741a5b07', 'D', 'Serum gentamicin levels and renal function (nephrotoxicity and ototoxicity)', true, 3),
  ('57d50b9a-23a5-5246-879f-526f983b1ea5', '1a25dabb-5133-575f-84ea-93f1741a5b07', 'E', 'Liver function only', false, 4);

-- Q697
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('7aef0f44-5970-5476-8385-c007db15a548', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000034', 'sba', 'A 70 year old man with COPD takes theophylline. He starts ciprofloxacin and develops nausea, palpitations and a seizure. What is the SINGLE most likely cause?', 'Theophylline has a narrow therapeutic index. Toxicity causes vomiting, tachyarrhythmias, hypokalaemia and seizures. Ciprofloxacin and macrolides raise levels; smoking lowers them.', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v6')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = '7aef0f44-5970-5476-8385-c007db15a548';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('bd946ff3-e9e7-5a9e-8a29-74893e8e2cb3', '7aef0f44-5970-5476-8385-c007db15a548', 'A', 'Stroke', false, 0),
  ('b01a8e3d-6351-5159-bdc7-8ceec20452c1', '7aef0f44-5970-5476-8385-c007db15a548', 'B', 'Theophylline toxicity (ciprofloxacin inhibits its metabolism)', true, 1),
  ('d4d43466-feca-5db6-a138-42fc748272e1', '7aef0f44-5970-5476-8385-c007db15a548', 'C', 'Hypoglycaemia', false, 2),
  ('e8394beb-ae61-5578-8670-6ebb2865040e', '7aef0f44-5970-5476-8385-c007db15a548', 'D', 'Alcohol withdrawal', false, 3),
  ('fb27b02e-ca7c-5e0d-accb-1e9a95d97de5', '7aef0f44-5970-5476-8385-c007db15a548', 'E', 'Ciprofloxacin allergy', false, 4);

-- Q698
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('6eaf41a7-8d02-50ff-a760-3edbc0c49cad', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000034', 'sba', 'A 55 year old man is prescribed allopurinol for gout. He also takes azathioprine. What is the MOST important concern?', 'Allopurinol inhibits azathioprine metabolism. Avoid the combination, or reduce the azathioprine dose substantially with close FBC monitoring. Check TPMT before starting azathioprine.', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v6')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = '6eaf41a7-8d02-50ff-a760-3edbc0c49cad';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('30ef5fd9-0cf6-5a10-b9fc-8dcd90ce275f', '6eaf41a7-8d02-50ff-a760-3edbc0c49cad', 'A', 'Severe bone marrow toxicity (allopurinol inhibits xanthine oxidase, raising azathioprine levels)', true, 0),
  ('529587c5-1320-5130-a862-932625a1e6fe', '6eaf41a7-8d02-50ff-a760-3edbc0c49cad', 'B', 'Hypoglycaemia', false, 1),
  ('963607d1-6001-5947-ac76-fd27d53c80d2', '6eaf41a7-8d02-50ff-a760-3edbc0c49cad', 'C', 'Hypertension', false, 2),
  ('dccb6063-8478-5a33-946d-7659ec8eaaaa', '6eaf41a7-8d02-50ff-a760-3edbc0c49cad', 'D', 'Weight gain', false, 3),
  ('cba77d9e-31e9-593f-aad3-5813c28c0abc', '6eaf41a7-8d02-50ff-a760-3edbc0c49cad', 'E', 'Liver failure', false, 4);

-- Q699
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('72e335ef-a32c-581d-875b-d9f46715032b', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000034', 'sba', 'A 40 year old woman has started lamotrigine for epilepsy. Two weeks later she develops a widespread blistering rash with mouth ulcers and fever. What is the SINGLE most likely diagnosis?', 'SJS/TEN is linked to lamotrigine, carbamazepine (HLA-B*1502), allopurinol, sulfonamides and NSAIDs. Stop the drug and manage in a burns or dermatology unit. Slow titration of lamotrigine reduces risk.', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v6')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = '72e335ef-a32c-581d-875b-d9f46715032b';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('afebfeec-2a7a-565d-a943-f1e43ddc8ed8', '72e335ef-a32c-581d-875b-d9f46715032b', 'A', 'Allergic urticaria', false, 0),
  ('ececb5ba-74e4-500a-868b-205cf8ad7bd5', '72e335ef-a32c-581d-875b-d9f46715032b', 'B', 'Stevens-Johnson syndrome / toxic epidermal necrolysis', true, 1),
  ('cb1ba7d0-e67e-5698-b430-04e4dad82c8a', '72e335ef-a32c-581d-875b-d9f46715032b', 'C', 'Measles', false, 2),
  ('a60b8dca-42c4-5716-ac25-fc3918400d56', '72e335ef-a32c-581d-875b-d9f46715032b', 'D', 'Chickenpox', false, 3),
  ('418e723a-c41c-5463-864b-b6e329f15e94', '72e335ef-a32c-581d-875b-d9f46715032b', 'E', 'Erythema nodosum', false, 4);

-- Q700
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('0d2dabb9-438b-5db6-92aa-605b004e76a1', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000035', 'sba', 'A 40 year old woman has severe ARDS from pneumonia. Her PaO2/FiO2 ratio is 90 mmHg despite optimised ventilation. Which intervention reduces mortality?', 'In severe ARDS, lung-protective ventilation (tidal volume 6 mL/kg ideal body weight, plateau pressure under 30) and proning improve survival. ECMO for refractory cases.', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v6')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = '0d2dabb9-438b-5db6-92aa-605b004e76a1';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('6209c247-11fc-5736-8205-b87d3a17ca33', '0d2dabb9-438b-5db6-92aa-605b004e76a1', 'A', 'Fluid loading', false, 0),
  ('099b51d0-8f5a-5472-aa92-3718fbde59a0', '0d2dabb9-438b-5db6-92aa-605b004e76a1', 'B', 'Routine steroids for all', false, 1),
  ('27062fbf-f8bc-58e0-ba5c-5971ecef6557', '0d2dabb9-438b-5db6-92aa-605b004e76a1', 'C', 'High tidal volume ventilation', false, 2),
  ('374666db-53d5-5bc4-a258-a524ce264545', '0d2dabb9-438b-5db6-92aa-605b004e76a1', 'D', 'Supine positioning only', false, 3),
  ('c819867a-8caa-5232-a2e3-0caa0c755aa1', '0d2dabb9-438b-5db6-92aa-605b004e76a1', 'E', 'Prone positioning (for 16 hours or more a day)', true, 4);

-- Q701
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('4cba63ae-f6b4-563d-916e-c1fb9c8c594b', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000035', 'sba', 'A 60 year old woman has a tracheostomy in ICU. It becomes displaced and she is desaturating. What is the FIRST step?', 'The National Tracheostomy Safety Project algorithm: call for help, oxygen to face and stoma, assess patency (suction catheter), remove the tube if blocked, and ventilate via face or stoma.', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v6')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = '4cba63ae-f6b4-563d-916e-c1fb9c8c594b';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('3873889e-609a-5f37-817f-49b2a929de12', '4cba63ae-f6b4-563d-916e-c1fb9c8c594b', 'A', 'Call for help and apply high-flow oxygen to both the face and the tracheostomy', true, 0),
  ('28f1bf5b-9a4f-503e-8648-824cdc161348', '4cba63ae-f6b4-563d-916e-c1fb9c8c594b', 'B', 'Give a bronchodilator', false, 1),
  ('9dc1dd3a-1916-5562-8c71-d3705d69ab01', '4cba63ae-f6b4-563d-916e-c1fb9c8c594b', 'C', 'Wait for the surgeon', false, 2),
  ('ab76463f-4e70-52a6-ac79-843e9085b4ba', '4cba63ae-f6b4-563d-916e-c1fb9c8c594b', 'D', 'Remove the oxygen', false, 3),
  ('4b6a4464-8902-50cd-8e1d-fa77e999a9f3', '4cba63ae-f6b4-563d-916e-c1fb9c8c594b', 'E', 'Reinsert a new tube blindly', false, 4);

-- Q702
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('8a36a992-53ba-560a-9b43-2c0f71dc0b1c', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000035', 'sba', 'A 50 year old man is starved for 10 days in ICU before starting nasogastric feeding. Two days later his phosphate is 0.3 mmol/L. What is the SINGLE most likely diagnosis?', 'Refeeding causes shifts of phosphate, potassium and magnesium into cells. It can cause heart failure, arrhythmias and respiratory failure. Start feeding slowly, give thiamine and replace electrolytes (NICE CG32).', null, true, true, jsonb_build_object('source', 'plab1-xlsx-v6', 'guidelines_text', 'NICE CG32')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = '8a36a992-53ba-560a-9b43-2c0f71dc0b1c';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('b1b57be5-a5a5-5331-a865-c7c9e6d85257', '8a36a992-53ba-560a-9b43-2c0f71dc0b1c', 'A', 'Refeeding syndrome', true, 0),
  ('3909996d-27a4-55b8-9b67-ba74890242ed', '8a36a992-53ba-560a-9b43-2c0f71dc0b1c', 'B', 'Tumour lysis syndrome', false, 1),
  ('5bfca43b-e518-5da4-8652-8c547c4aa3be', '8a36a992-53ba-560a-9b43-2c0f71dc0b1c', 'C', 'Rhabdomyolysis', false, 2),
  ('224b1ae6-110f-5275-b408-5ecccac0b337', '8a36a992-53ba-560a-9b43-2c0f71dc0b1c', 'D', 'Hyperparathyroidism', false, 3),
  ('0b84be1a-c979-55b1-a790-5eaccbc2dbf8', '8a36a992-53ba-560a-9b43-2c0f71dc0b1c', 'E', 'Vitamin D deficiency', false, 4);

-- Q703
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('3c3b01b4-583b-545c-9840-b4bea354a571', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000012', 'sba', 'A 30 year old woman has painful red lumps on her shins. She has had a cough and fever. CXR shows bilateral hilar lymphadenopathy. What is the SINGLE most likely diagnosis?', 'Erythema nodosum causes include streptococcal infection, sarcoidosis, TB, IBD, pregnancy and drugs. Löfgren syndrome has a good prognosis.', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v6')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = '3c3b01b4-583b-545c-9840-b4bea354a571';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('380942e9-59a9-5a98-a944-4b686c6812cd', '3c3b01b4-583b-545c-9840-b4bea354a571', 'A', 'Erythema nodosum due to sarcoidosis (Löfgren syndrome)', true, 0),
  ('e855fe08-8456-5555-9b3e-fdf9078ca2c6', '3c3b01b4-583b-545c-9840-b4bea354a571', 'B', 'Vasculitis', false, 1),
  ('ecbb6fda-b5b5-597f-a5e0-2a0e381e68d4', '3c3b01b4-583b-545c-9840-b4bea354a571', 'C', 'TB only', false, 2),
  ('284ebfb3-1b6e-5817-b10e-e755a2ba67b7', '3c3b01b4-583b-545c-9840-b4bea354a571', 'D', 'Cellulitis', false, 3),
  ('1b8874aa-b902-59dc-91a6-6cf704de3c35', '3c3b01b4-583b-545c-9840-b4bea354a571', 'E', 'Erythema multiforme', false, 4);

-- Q704
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('428b5371-56be-5a52-8f78-aa10af54c7f2', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000012', 'sba', 'A 50 year old man has had a pearly papule with rolled edges and telangiectasia on his nose that has slowly grown over a year. What is the SINGLE most likely diagnosis?', 'BCCs are slow-growing and rarely metastasise. Refer routinely (not urgently) unless there are concerns about site or size. Treatment: surgical excision or Mohs surgery.', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v6')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = '428b5371-56be-5a52-8f78-aa10af54c7f2';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('fcb0d540-5fa6-5109-a93a-430773e8fe65', '428b5371-56be-5a52-8f78-aa10af54c7f2', 'A', 'Squamous cell carcinoma', false, 0),
  ('a74516b3-fb66-550b-b679-fd9ca5770ca8', '428b5371-56be-5a52-8f78-aa10af54c7f2', 'B', 'Melanoma', false, 1),
  ('c0640aa1-8e12-5c37-8d44-ff75a0687c07', '428b5371-56be-5a52-8f78-aa10af54c7f2', 'C', 'Actinic keratosis', false, 2),
  ('a8b58d3f-4f11-5153-9898-9a06aa3e1129', '428b5371-56be-5a52-8f78-aa10af54c7f2', 'D', 'Basal cell carcinoma', true, 3),
  ('eb319bd6-8217-594a-a9bb-b2d91f912707', '428b5371-56be-5a52-8f78-aa10af54c7f2', 'E', 'Seborrhoeic keratosis', false, 4);

-- Q705
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('4c8d0ef1-a167-5626-85e0-fb4e7f024c22', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000012', 'sba', 'A 70 year old man has had a scaly, rough patch on his scalp. He is bald. It is not ulcerated or raised. What is the SINGLE most likely diagnosis?', 'Actinic keratoses are premalignant lesions from sun damage. Treatment: 5-fluorouracil, imiquimod, cryotherapy or photodynamic therapy. Tenderness or induration suggests SCC.', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v6')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = '4c8d0ef1-a167-5626-85e0-fb4e7f024c22';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('cc4ab676-5e53-5f2a-948f-a9a7e1ecebb0', '4c8d0ef1-a167-5626-85e0-fb4e7f024c22', 'A', 'Basal cell carcinoma', false, 0),
  ('a9002f0d-1690-58c6-9615-44f75b42478e', '4c8d0ef1-a167-5626-85e0-fb4e7f024c22', 'B', 'Psoriasis', false, 1),
  ('5cba0a33-6e57-5e84-b57b-be46186c4a79', '4c8d0ef1-a167-5626-85e0-fb4e7f024c22', 'C', 'Squamous cell carcinoma', false, 2),
  ('f2bf4b7a-135c-5c9d-ab45-cd432ae56473', '4c8d0ef1-a167-5626-85e0-fb4e7f024c22', 'D', 'Actinic keratosis', true, 3),
  ('f305621e-f8ae-5a50-a1d4-465d70d91e5a', '4c8d0ef1-a167-5626-85e0-fb4e7f024c22', 'E', 'Seborrhoeic dermatitis', false, 4);

-- Q706
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('344d6f72-75d9-5eed-a6e1-2c151a834ed2', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000026', 'sba', 'A 20 year old rugby player has had a tender, fluctuant swelling of the upper ear after a tackle. What is the SINGLE most appropriate management?', 'Auricular haematoma separates cartilage from perichondrium, causing necrosis and ''cauliflower ear'' if not drained. Follow up to check reaccumulation.', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v6')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = '344d6f72-75d9-5eed-a6e1-2c151a834ed2';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('ee7bf0f1-ed6c-5f7e-b0c3-680fe89a405c', '344d6f72-75d9-5eed-a6e1-2c151a834ed2', 'A', 'Ice for 2 weeks', false, 0),
  ('291dcb30-48fb-5f6b-bbf9-c72db14d8eaf', '344d6f72-75d9-5eed-a6e1-2c151a834ed2', 'B', 'Steroids', false, 1),
  ('c01a0f55-a159-5a0b-bb73-9d77508fa862', '344d6f72-75d9-5eed-a6e1-2c151a834ed2', 'C', 'Leave alone', false, 2),
  ('15be0ac1-41a1-54ce-a0d5-edca755e0e53', '344d6f72-75d9-5eed-a6e1-2c151a834ed2', 'D', 'Drain the haematoma and apply a pressure dressing', true, 3),
  ('5f32b996-7015-5402-a8ea-72f2f67e3b15', '344d6f72-75d9-5eed-a6e1-2c151a834ed2', 'E', 'Antibiotics only', false, 4);

-- Q707
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('c9b7aedd-5b98-561b-bfb7-5d9e14918ea2', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000026', 'sba', 'A 3 year old has pushed a button battery into his ear. What is the SINGLE most appropriate management?', 'Button batteries in the ear or nose cause rapid tissue necrosis. Do not irrigate. Organic foreign bodies (insects can be drowned with oil first) also need careful removal.', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v6')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = 'c9b7aedd-5b98-561b-bfb7-5d9e14918ea2';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('ea7d2767-7ebb-527c-bd60-22e54603bddb', 'c9b7aedd-5b98-561b-bfb7-5d9e14918ea2', 'A', 'Urgent removal by ENT (same day)', true, 0),
  ('bf7ade34-35cb-5fdb-8894-d3a51f088889', 'c9b7aedd-5b98-561b-bfb7-5d9e14918ea2', 'B', 'Ear drops to flush it out', false, 1),
  ('ad23e983-56cc-5d22-86aa-59c2a7ffd778', 'c9b7aedd-5b98-561b-bfb7-5d9e14918ea2', 'C', 'Antibiotics', false, 2),
  ('291bfdcc-83c1-5be4-84d2-ca7b5e2a1b8e', 'c9b7aedd-5b98-561b-bfb7-5d9e14918ea2', 'D', 'Wait for it to fall out', false, 3),
  ('5c97e799-ed6c-5ae2-8fb4-8c4cd077ee17', 'c9b7aedd-5b98-561b-bfb7-5d9e14918ea2', 'E', 'Review in a week', false, 4);

-- Q708
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('1140db7f-5cd8-5e3b-8587-e6e8af54220a', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000026', 'sba', 'A 75 year old man has had gradually worsening hearing in both ears. He struggles in noisy places. Audiogram shows bilateral high-frequency sensorineural loss. What is the SINGLE most likely diagnosis?', 'Presbycusis is age-related, symmetrical, high-frequency hearing loss. Hearing aids help. Hearing loss is a modifiable risk factor for dementia.', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v6')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = '1140db7f-5cd8-5e3b-8587-e6e8af54220a';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('b5b9723b-296e-53dd-a519-e5b21117bc5c', '1140db7f-5cd8-5e3b-8587-e6e8af54220a', 'A', 'Acoustic neuroma', false, 0),
  ('203eaaeb-0efc-59c6-8068-6442de680e4d', '1140db7f-5cd8-5e3b-8587-e6e8af54220a', 'B', 'Ménière''s disease', false, 1),
  ('e457c5c1-c97c-531d-960f-50075ef8e64b', '1140db7f-5cd8-5e3b-8587-e6e8af54220a', 'C', 'Otosclerosis', false, 2),
  ('42a02a4b-7299-590c-9260-4501c8ad7fce', '1140db7f-5cd8-5e3b-8587-e6e8af54220a', 'D', 'Noise-induced hearing loss', false, 3),
  ('7412fed0-dbc8-5a22-bd36-933b21843820', '1140db7f-5cd8-5e3b-8587-e6e8af54220a', 'E', 'Presbycusis', true, 4);

-- Q709
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('fd3697de-9019-5273-9833-0c5adfdc2fd7', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000026', 'sba', 'A 30 year old woman has had sudden hearing loss in one ear over 2 days. Weber lateralises to the other ear. Otoscopy is normal. What is the SINGLE most appropriate management?', 'Sudden sensorineural hearing loss (over 30 dB in 3 frequencies within 72 hours) needs urgent assessment, steroids and MRI to exclude vestibular schwannoma.', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v6')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = 'fd3697de-9019-5273-9833-0c5adfdc2fd7';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('7567e969-d701-5c63-b0ba-15c9fd0e2b59', 'fd3697de-9019-5273-9833-0c5adfdc2fd7', 'A', 'Ear syringing', false, 0),
  ('c732c188-0f4f-57f4-9170-8d7380701115', 'fd3697de-9019-5273-9833-0c5adfdc2fd7', 'B', 'Antibiotics', false, 1),
  ('3c2d2830-e908-51c5-9fef-49ead60b19c8', 'fd3697de-9019-5273-9833-0c5adfdc2fd7', 'C', 'Routine referral', false, 2),
  ('62729dcc-8dec-59be-bcf9-f64a13f46272', 'fd3697de-9019-5273-9833-0c5adfdc2fd7', 'D', 'Reassure', false, 3),
  ('159d54bc-9d95-5ecc-86b6-e2a04f38e6e4', 'fd3697de-9019-5273-9833-0c5adfdc2fd7', 'E', 'Urgent ENT referral (within 24 hours) for oral steroids and audiology (sudden sensorineural hearing loss)', true, 4);

-- Q710
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('143006bd-e8d3-564a-883e-9b66251a1de1', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000004', 'sba', 'A 25 year old woman has had diabetes since age 18. She is slim, has no ketones, and her mother and grandfather have diabetes diagnosed young. Antibodies are negative. What is the SINGLE most likely diagnosis?', 'MODY is autosomal dominant. HNF1A MODY is sensitive to sulfonylureas; GCK MODY causes mild stable hyperglycaemia and needs no treatment. Genetic testing confirms.', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v6')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = '143006bd-e8d3-564a-883e-9b66251a1de1';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('2a512a45-ed33-53f3-b2e1-1895904cbb2d', '143006bd-e8d3-564a-883e-9b66251a1de1', 'A', 'LADA', false, 0),
  ('29a67d2a-d6af-51e1-bfbe-c30ee5892071', '143006bd-e8d3-564a-883e-9b66251a1de1', 'B', 'Type 2 diabetes', false, 1),
  ('8022b5ae-8155-59c2-8a4d-2f27976e7863', '143006bd-e8d3-564a-883e-9b66251a1de1', 'C', 'Gestational diabetes', false, 2),
  ('7e77233b-7005-57cd-8e66-cd2a918d5a59', '143006bd-e8d3-564a-883e-9b66251a1de1', 'D', 'Maturity-onset diabetes of the young (MODY)', true, 3),
  ('4b97fbe1-8fc0-5e0a-86da-25d062f50fb3', '143006bd-e8d3-564a-883e-9b66251a1de1', 'E', 'Type 1 diabetes', false, 4);

-- Q711
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('2c321374-bd02-50d5-8a95-8b20e137a8a9', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000004', 'sba', 'A 40 year old man has had episodes of headache, sweating and palpitations with BP of 210/120 during attacks. Plasma metanephrines are raised. What is the SINGLE most appropriate first treatment?', 'Phaeochromocytoma: alpha-blockade before beta-blockade to prevent unopposed alpha stimulation (hypertensive crisis). Then adrenalectomy. Associated with MEN2, VHL, NF1.', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v6')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = '2c321374-bd02-50d5-8a95-8b20e137a8a9';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('4ff2f2b3-f13a-545e-bb54-c3290f29c56c', '2c321374-bd02-50d5-8a95-8b20e137a8a9', 'A', 'Beta-blocker first', false, 0),
  ('6acaa786-5e28-5655-b97c-bbe1898a82e1', '2c321374-bd02-50d5-8a95-8b20e137a8a9', 'B', 'Diuretic', false, 1),
  ('fb58023d-8152-504a-aa25-70ef1c203e06', '2c321374-bd02-50d5-8a95-8b20e137a8a9', 'C', 'ACE inhibitor alone', false, 2),
  ('5fe13e80-0450-5b63-b5fa-a1be7b7ab1ed', '2c321374-bd02-50d5-8a95-8b20e137a8a9', 'D', 'Immediate surgery', false, 3),
  ('b45a83dd-6bd2-54da-97c8-a6caf4e73031', '2c321374-bd02-50d5-8a95-8b20e137a8a9', 'E', 'Alpha-blocker (phenoxybenzamine) first, then beta-blocker, before surgery', true, 4);

-- Q712
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('03a5e5b2-c2be-5f89-bf7c-eb22c439e811', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000004', 'sba', 'A 45 year old woman has hypertension resistant to three drugs and a potassium of 3.1 mmol/L. What is the MOST appropriate screening test?', 'Primary hyperaldosteronism (Conn''s) is common in resistant hypertension. High aldosterone with low renin. CT and adrenal vein sampling distinguish adenoma (surgery) from bilateral hyperplasia (spironolactone).', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v6')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = '03a5e5b2-c2be-5f89-bf7c-eb22c439e811';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('f504e054-fa90-52ae-8115-62fe06242140', '03a5e5b2-c2be-5f89-bf7c-eb22c439e811', 'A', 'TSH', false, 0),
  ('65b548d8-bfca-5ee7-85d1-4d4bfdd858b4', '03a5e5b2-c2be-5f89-bf7c-eb22c439e811', 'B', 'Renal ultrasound only', false, 1),
  ('05b9f8f5-49c3-5c94-b426-f4ff39a4f204', '03a5e5b2-c2be-5f89-bf7c-eb22c439e811', 'C', 'Plasma metanephrines', false, 2),
  ('8a3cb471-9dae-5538-916a-752c20f9ba05', '03a5e5b2-c2be-5f89-bf7c-eb22c439e811', 'D', 'Cortisol', false, 3),
  ('c5c88068-cab2-56c1-8f7b-8cecf661d083', '03a5e5b2-c2be-5f89-bf7c-eb22c439e811', 'E', 'Aldosterone-to-renin ratio', true, 4);

-- Q713
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('68348bfb-87fb-552b-a96c-934a73987ee7', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000004', 'sba', 'A 55 year old man has had a goitre and is hyperthyroid. Thyroid scan shows patchy uptake with multiple hot nodules. What is the SINGLE most likely diagnosis?', 'Toxic multinodular goitre is common in older people. Treatment: radioiodine is usually first-line. Graves'' shows diffuse uptake; thyroiditis shows low uptake.', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v6')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = '68348bfb-87fb-552b-a96c-934a73987ee7';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('a4216063-8286-53ab-b282-c1a93d5f1ba0', '68348bfb-87fb-552b-a96c-934a73987ee7', 'A', 'Thyroid cancer', false, 0),
  ('44ed4f80-7eb2-5c2b-9771-588f0106307a', '68348bfb-87fb-552b-a96c-934a73987ee7', 'B', 'Hashimoto''s', false, 1),
  ('b9d0c79f-c5ed-5685-9c79-2f87b5cf601c', '68348bfb-87fb-552b-a96c-934a73987ee7', 'C', 'Subacute thyroiditis', false, 2),
  ('fc45e78b-1b18-5223-abc0-fde8885a92b6', '68348bfb-87fb-552b-a96c-934a73987ee7', 'D', 'Toxic multinodular goitre', true, 3),
  ('359d786d-4b4b-59da-a20f-6f17dd2cb4e4', '68348bfb-87fb-552b-a96c-934a73987ee7', 'E', 'Graves'' disease', false, 4);

-- Q714
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('0eceb261-ab6d-5322-bb1d-90ae6b2ecd08', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000013', 'sba', 'A 35 year old man has epilepsy and has had a seizure. He continues to drive and refuses to tell the DVLA. What is the MOST appropriate action?', 'GMC confidentiality guidance: patients are responsible for informing the DVLA. If they continue to drive and refuse, doctors should disclose to the DVLA in the public interest, telling the patient first and afterwards.', null, true, true, jsonb_build_object('source', 'plab1-xlsx-v6', 'guidelines_text', 'GMC; DVLA')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = '0eceb261-ab6d-5322-bb1d-90ae6b2ecd08';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('3db5cfaa-b40d-59a0-989b-8996a9a3ba14', '0eceb261-ab6d-5322-bb1d-90ae6b2ecd08', 'A', 'Take his car keys', false, 0),
  ('8d4217d5-391c-5e72-adde-eaedbaedfd59', '0eceb261-ab6d-5322-bb1d-90ae6b2ecd08', 'B', 'Call the police', false, 1),
  ('f270b161-6151-59ca-8af9-18337b6f9ec7', '0eceb261-ab6d-5322-bb1d-90ae6b2ecd08', 'C', 'Explain the duty; if he continues to drive, inform the DVLA medical adviser, telling him first', true, 2),
  ('07a7e28d-2095-5d77-84b6-50bc7168ab53', '0eceb261-ab6d-5322-bb1d-90ae6b2ecd08', 'D', 'Keep it confidential', false, 3),
  ('2e78ccd5-b859-5310-b58a-c3d60ebaafc1', '0eceb261-ab6d-5322-bb1d-90ae6b2ecd08', 'E', 'Inform his employer', false, 4);

-- Q715
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('a1a68b84-ae02-570f-a2f7-29a23d2b7135', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000013', 'sba', 'A grateful patient offers a doctor an expensive watch. What is the MOST appropriate action?', 'GMC: do not encourage gifts, and do not accept gifts that could affect, or be seen to affect, the way you treat patients. Small gifts may be accepted. Declare according to local policy.', null, true, true, jsonb_build_object('source', 'plab1-xlsx-v6', 'guidelines_text', 'GMC')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = 'a1a68b84-ae02-570f-a2f7-29a23d2b7135';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('75dcc3d4-72ac-5058-992e-da7279e1681c', 'a1a68b84-ae02-570f-a2f7-29a23d2b7135', 'A', 'Accept and keep it secret', false, 0),
  ('56d39196-0721-58d5-983d-b93d56461dd8', 'a1a68b84-ae02-570f-a2f7-29a23d2b7135', 'B', 'Ask for money instead', false, 1),
  ('aa89db63-43ab-5694-8e8a-584ffc5b4ed9', 'a1a68b84-ae02-570f-a2f7-29a23d2b7135', 'C', 'Decline or follow local policy, as gifts must not affect or appear to affect clinical judgement', true, 2),
  ('94ffdc8f-2d01-56d0-85c1-8f5c092b9001', 'a1a68b84-ae02-570f-a2f7-29a23d2b7135', 'D', 'Accept it if the patient insists', false, 3),
  ('33a4d5b0-2efe-5fa1-918b-cc2ea9dfc236', 'a1a68b84-ae02-570f-a2f7-29a23d2b7135', 'E', 'Sell it', false, 4);

-- Q716
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('ea174792-94d7-59bb-9ae2-8427b4caeae6', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000013', 'sba', 'A male doctor needs to perform an intimate examination on a female patient. What is the MOST appropriate action?', 'GMC intimate examinations guidance: always offer a chaperone regardless of gender. Explain, obtain consent and record it. A relative is not usually an appropriate chaperone.', null, true, true, jsonb_build_object('source', 'plab1-xlsx-v6', 'guidelines_text', 'GMC')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = 'ea174792-94d7-59bb-9ae2-8427b4caeae6';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('650619d0-942f-5104-bd93-e24b9ac48e8a', 'ea174792-94d7-59bb-9ae2-8427b4caeae6', 'A', 'Use a family member as chaperone', false, 0),
  ('03b9a96c-46fe-53ac-af17-ac28fc5b0177', 'ea174792-94d7-59bb-9ae2-8427b4caeae6', 'B', 'Do not record it', false, 1),
  ('d54cfb16-4a43-52eb-b04c-5a49e5aba8c9', 'ea174792-94d7-59bb-9ae2-8427b4caeae6', 'C', 'Offer a chaperone, explain, get consent and record the discussion and who was present', true, 2),
  ('4ce44124-99b4-5f5b-8fa7-43d7bae5e83b', 'ea174792-94d7-59bb-9ae2-8427b4caeae6', 'D', 'Proceed without explanation', false, 3),
  ('64c2360f-52df-5c3d-965d-2506d6d0643b', 'ea174792-94d7-59bb-9ae2-8427b4caeae6', 'E', 'Only examine if she brings someone', false, 4);

-- Q717
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('9b2f3f4a-2c20-5c33-a685-8306b305c128', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000003', 'sba', 'A 65 year old woman has had chronic watery, non-bloody diarrhoea. She takes lansoprazole and sertraline. Colonoscopy is normal. What is the SINGLE most likely diagnosis?', 'Microscopic colitis (collagenous or lymphocytic) is linked to PPIs, NSAIDs and SSRIs. Colonoscopy looks normal; biopsy confirms. Treatment: stop drugs, budesonide.', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v6')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = '9b2f3f4a-2c20-5c33-a685-8306b305c128';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('6767754c-884e-5d87-9edf-d96790afce01', '9b2f3f4a-2c20-5c33-a685-8306b305c128', 'A', 'Microscopic colitis (requires biopsies)', true, 0),
  ('703a52d6-e2f6-532e-834c-6631698db873', '9b2f3f4a-2c20-5c33-a685-8306b305c128', 'B', 'Coeliac disease', false, 1),
  ('5511020b-aa9e-5db1-9476-ea40a48ed97f', '9b2f3f4a-2c20-5c33-a685-8306b305c128', 'C', 'IBS', false, 2),
  ('e04d683a-4b10-5ba2-8235-9292000b6191', '9b2f3f4a-2c20-5c33-a685-8306b305c128', 'D', 'Colon cancer', false, 3),
  ('f5a4e01d-548c-582e-a821-f58d769c1352', '9b2f3f4a-2c20-5c33-a685-8306b305c128', 'E', 'Ulcerative colitis', false, 4);

-- Q718
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('3e4ed029-ec58-5525-a5f2-380efaba634b', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000003', 'sba', 'A 20 year old woman has had raised ALT, high IgG and positive anti-smooth muscle antibodies. Viral hepatitis is excluded. What is the SINGLE most likely diagnosis?', 'Autoimmune hepatitis is commonest in young women. Antibodies: ANA, ASMA (type 1), anti-LKM1 (type 2). Treatment: prednisolone and azathioprine.', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v6')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = '3e4ed029-ec58-5525-a5f2-380efaba634b';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('92565762-7dbc-5bd0-b7c7-5bf82a4bcfeb', '3e4ed029-ec58-5525-a5f2-380efaba634b', 'A', 'Wilson''s disease', false, 0),
  ('05df926c-a19e-5ff7-b03f-347665c076af', '3e4ed029-ec58-5525-a5f2-380efaba634b', 'B', 'Autoimmune hepatitis', true, 1),
  ('bdf73ee0-12ed-5dd3-8e7b-2290e1ebc8bf', '3e4ed029-ec58-5525-a5f2-380efaba634b', 'C', 'Primary biliary cholangitis', false, 2),
  ('6cc74225-2c64-56e5-9f28-4235f47b25d4', '3e4ed029-ec58-5525-a5f2-380efaba634b', 'D', 'NAFLD', false, 3),
  ('8a4ccd90-05f6-5428-b374-0b9b00824012', '3e4ed029-ec58-5525-a5f2-380efaba634b', 'E', 'Haemochromatosis', false, 4);

-- Q719
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('e6d8b6da-36de-50d2-bc19-3956f2dc42a8', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000003', 'sba', 'A 17 year old has had liver dysfunction, tremor and personality change. There are brown rings at the edge of the cornea. What is the SINGLE most appropriate test?', 'Wilson''s disease (ATP7B, autosomal recessive) causes copper accumulation: liver disease, neuropsychiatric features and Kayser-Fleischer rings. Low caeruloplasmin. Treatment: penicillamine or trientine.', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v6')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = 'e6d8b6da-36de-50d2-bc19-3956f2dc42a8';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('6e26764e-abbd-5186-85fd-a3ccbdb00a8f', 'e6d8b6da-36de-50d2-bc19-3956f2dc42a8', 'A', 'Serum caeruloplasmin and 24-hour urinary copper', true, 0),
  ('238dbf53-bbff-5ba0-b958-b1838c65734f', 'e6d8b6da-36de-50d2-bc19-3956f2dc42a8', 'B', 'Hepatitis serology', false, 1),
  ('803d729a-55c2-545f-889e-c03abc61025c', 'e6d8b6da-36de-50d2-bc19-3956f2dc42a8', 'C', 'Ferritin', false, 2),
  ('1b830fe7-37ff-56ef-936d-252701d0b89f', 'e6d8b6da-36de-50d2-bc19-3956f2dc42a8', 'D', 'Alpha-1 antitrypsin', false, 3),
  ('d1fcade6-0a7e-5812-b8fe-670d9d862c84', 'e6d8b6da-36de-50d2-bc19-3956f2dc42a8', 'E', 'AMA', false, 4);

-- Q720
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('648df6b1-a02d-5715-b4f2-ea084a209d58', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000003', 'sba', 'A 55 year old man has had a gastrointestinal bleed. He drinks heavily and has cirrhosis. Endoscopy shows bleeding oesophageal varices. Which drugs should be started before endoscopy?', 'Variceal bleeding: terlipressin and antibiotics (reduce mortality) before endoscopy. Band ligation. TIPS if uncontrolled. Secondary prevention: propranolol and banding.', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v6')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = '648df6b1-a02d-5715-b4f2-ea084a209d58';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('3f9622cc-e5b9-5c13-8c37-9f0c7747b80c', '648df6b1-a02d-5715-b4f2-ea084a209d58', 'A', 'Terlipressin and prophylactic antibiotics', true, 0),
  ('9ef90318-d04b-54af-8e5e-053a36287c75', '648df6b1-a02d-5715-b4f2-ea084a209d58', 'B', 'Octreotide only as sole treatment', false, 1),
  ('37b84a38-1df6-5ad5-8e72-2a1232099e4d', '648df6b1-a02d-5715-b4f2-ea084a209d58', 'C', 'Propranolol IV', false, 2),
  ('123fe0af-036c-51e1-bd0a-848a2805f911', '648df6b1-a02d-5715-b4f2-ea084a209d58', 'D', 'Omeprazole only', false, 3),
  ('5de1deee-7f5b-5505-8ed5-d377cb7d4ef3', '648df6b1-a02d-5715-b4f2-ea084a209d58', 'E', 'Tranexamic acid', false, 4);

-- Q721
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('1ce8067c-b702-5eea-b086-9f0ebb940648', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000027', 'sba', 'A 40 year old man needs time off work after a hernia operation. He has been off for 10 days. What is the MOST appropriate action?', 'Self-certification covers the first 7 days. After that, a fit note can be issued by doctors, nurses, pharmacists, occupational therapists and physiotherapists. It can say ''may be fit for work'' with adjustments.', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v6')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = '1ce8067c-b702-5eea-b086-9f0ebb940648';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('86f7d0ad-3deb-5516-a8ef-a74adc271f23', '1ce8067c-b702-5eea-b086-9f0ebb940648', 'A', 'Refuse', false, 0),
  ('2bb59c95-050b-57b6-ad48-d2743dc1b142', '1ce8067c-b702-5eea-b086-9f0ebb940648', 'B', 'No document needed', false, 1),
  ('0cd61fba-844f-5734-889b-33575bcd7843', '1ce8067c-b702-5eea-b086-9f0ebb940648', 'C', 'Ask him to self-certify for all', false, 2),
  ('e778ed6a-1b8d-5dbd-aec3-184febc48f19', '1ce8067c-b702-5eea-b086-9f0ebb940648', 'D', 'Issue a fit note (statement of fitness for work) as he has been off for more than 7 days', true, 3),
  ('b1377c79-3c2d-56cb-bdbb-161a7092101a', '1ce8067c-b702-5eea-b086-9f0ebb940648', 'E', 'Write a private letter only', false, 4);

-- Q722
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('e68fffae-e2b1-5435-b20e-7df4f9ff45b5', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000027', 'sba', 'A 70 year old woman asks about the shingles vaccine. She is immunocompetent. What is the current offer in England?', 'The shingles programme has moved to Shingrix (2 doses), offered at 65 (phased) and 70-79, and from 50 for severely immunosuppressed people. It is not live, so safe in immunosuppression.', null, true, true, jsonb_build_object('source', 'plab1-xlsx-v6')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = 'e68fffae-e2b1-5435-b20e-7df4f9ff45b5';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('85b31dc9-272f-5225-ba8e-3c17e39ec352', 'e68fffae-e2b1-5435-b20e-7df4f9ff45b5', 'A', 'One dose of live vaccine at 50', false, 0),
  ('fc3aa8d6-a005-5e5e-ac79-89dbdff0dffc', 'e68fffae-e2b1-5435-b20e-7df4f9ff45b5', 'B', 'No vaccine after 65', false, 1),
  ('0dbbaee3-3039-5509-b443-70b2f37a15cb', 'e68fffae-e2b1-5435-b20e-7df4f9ff45b5', 'C', 'Annual vaccine', false, 2),
  ('3c374a1b-0b09-56d7-b595-62510604f797', 'e68fffae-e2b1-5435-b20e-7df4f9ff45b5', 'D', 'Two doses of the recombinant vaccine (Shingrix), as she is in the eligible age group', true, 3),
  ('f4d0a0a4-82e8-574d-b8bc-2b7dcd7c4fd5', 'e68fffae-e2b1-5435-b20e-7df4f9ff45b5', 'E', 'Only if she has had shingles twice', false, 4);

-- Q723
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('9e2bcc08-1caa-5375-abd5-453c6f27c3b4', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000027', 'sba', 'A 50 year old man has a QRISK3 score of 14%. He has no cardiovascular disease. Lifestyle changes have been discussed. What should be offered?', 'NICE NG238: offer atorvastatin 20 mg for primary prevention if QRISK3 is 10% or more. Secondary prevention: atorvastatin 80 mg. Check lipids and liver function at baseline and 3 months.', null, true, true, jsonb_build_object('source', 'plab1-xlsx-v6', 'guidelines_text', 'NICE NG238')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = '9e2bcc08-1caa-5375-abd5-453c6f27c3b4';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('30964936-381f-5fe2-9d27-16d39dc8dab9', '9e2bcc08-1caa-5375-abd5-453c6f27c3b4', 'A', 'Simvastatin 10 mg', false, 0),
  ('b6491b14-3559-52f7-a8a1-8a6392ae5ad2', '9e2bcc08-1caa-5375-abd5-453c6f27c3b4', 'B', 'Atorvastatin 20 mg for primary prevention', true, 1),
  ('34a6ce0a-94d9-543c-9b8f-1de63f760894', '9e2bcc08-1caa-5375-abd5-453c6f27c3b4', 'C', 'No treatment', false, 2),
  ('ee4c2484-8c6d-5c12-b7b7-1596412c04cb', '9e2bcc08-1caa-5375-abd5-453c6f27c3b4', 'D', 'Aspirin', false, 3),
  ('aa37b278-8abc-598f-bab7-93ddda6d5cdc', '9e2bcc08-1caa-5375-abd5-453c6f27c3b4', 'E', 'Atorvastatin 80 mg', false, 4);

-- Q724
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('6de06595-3b47-56c2-a845-3679ab668376', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000027', 'sba', 'A mother asks what vaccines her baby gets at 8 weeks in the UK. Which is correct?', 'UK schedule: 8 weeks: 6-in-1, MenB, rotavirus; 12 weeks: 6-in-1, pneumococcal, rotavirus; 16 weeks: 6-in-1, MenB. 1 year: MMR, MenB, pneumococcal, Hib/MenC. Schedule changes are periodically introduced, so check current guidance.', null, true, true, jsonb_build_object('source', 'plab1-xlsx-v6')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = '6de06595-3b47-56c2-a845-3679ab668376';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('0fb3e9c1-66e3-528e-8678-422fa192bf0a', '6de06595-3b47-56c2-a845-3679ab668376', 'A', 'Pneumococcal and MMR', false, 0),
  ('2c3a1562-b449-58eb-8deb-33f8c12dfb73', '6de06595-3b47-56c2-a845-3679ab668376', 'B', 'Chickenpox', false, 1),
  ('48841796-1e5e-5ef4-a644-86eca751b1a3', '6de06595-3b47-56c2-a845-3679ab668376', 'C', 'MMR and BCG', false, 2),
  ('e723d8bf-383d-51a7-aded-c18d6870a192', '6de06595-3b47-56c2-a845-3679ab668376', 'D', '6-in-1 (hexavalent), MenB and rotavirus', true, 3),
  ('0c3b0ea7-2dde-5612-b35e-be1f3e33ea33', '6de06595-3b47-56c2-a845-3679ab668376', 'E', 'Hib/MenC only', false, 4);

-- Q725
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('2ede76d5-c0a4-557b-9922-f6f3950253e5', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000036', 'sba', 'A couple''s child has Down syndrome due to a Robertsonian translocation. The mother is a balanced carrier of t(14;21). What is MOST appropriate?', 'Most Down syndrome is due to non-disjunction (recurrence about 1%). Translocation Down syndrome needs parental karyotyping; maternal carriers have about 10-15% recurrence risk.', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v6')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = '2ede76d5-c0a4-557b-9922-f6f3950253e5';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('25a32530-2654-531b-9221-63a2ea7a7b4f', '2ede76d5-c0a4-557b-9922-f6f3950253e5', 'A', 'No further testing needed', false, 0),
  ('1ca6f63a-b65a-53ec-b521-973a45ed307e', '2ede76d5-c0a4-557b-9922-f6f3950253e5', 'B', 'Test only the child', false, 1),
  ('a0cb3fb1-f5de-51b6-bb90-d764d3b4a8f8', '2ede76d5-c0a4-557b-9922-f6f3950253e5', 'C', 'Offer genetic counselling, as the recurrence risk is much higher than for trisomy 21', true, 2),
  ('bc5ded89-93c6-5bab-b60d-43017eecbb20', '2ede76d5-c0a4-557b-9922-f6f3950253e5', 'D', 'Reassure that recurrence risk is the same as age-related risk', false, 3),
  ('d17da8f2-3ae3-583e-88d3-bc5f76c01547', '2ede76d5-c0a4-557b-9922-f6f3950253e5', 'E', 'Advise against all pregnancy', false, 4);

-- Q726
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('8c9c0f03-6948-5f3a-8b78-e60b9532941c', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000036', 'sba', 'A 25 year old man is tall with small testes, gynaecomastia and infertility. What is the SINGLE most likely karyotype?', 'Klinefelter syndrome: tall stature, hypogonadism (high FSH and LH, low testosterone), learning difficulties and azoospermia. Treatment: testosterone replacement.', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v6')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = '8c9c0f03-6948-5f3a-8b78-e60b9532941c';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('b41047eb-c044-5051-ab83-c818b51ec932', '8c9c0f03-6948-5f3a-8b78-e60b9532941c', 'A', '45,XO', false, 0),
  ('4d79d401-78bd-51fd-a71d-3f47b3bc8107', '8c9c0f03-6948-5f3a-8b78-e60b9532941c', 'B', '46,XY', false, 1),
  ('b8a26632-a3ea-5e9d-8e8b-0732bba4d5af', '8c9c0f03-6948-5f3a-8b78-e60b9532941c', 'C', '46,XX', false, 2),
  ('ca8d65bf-6313-50cd-8301-241083ba3a57', '8c9c0f03-6948-5f3a-8b78-e60b9532941c', 'D', '47,XXY', true, 3),
  ('7dbe913c-8da2-5576-9a87-7338e77a7b73', '8c9c0f03-6948-5f3a-8b78-e60b9532941c', 'E', '47,XYY', false, 4);

-- Q727
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('86a380bc-119e-5032-b51a-e117aba4234e', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000036', 'sba', 'A newborn baby has a positive heel prick screening for cystic fibrosis (raised immunoreactive trypsinogen). What is the confirmatory test?', 'Newborn screening includes IRT for CF, with DNA testing. A sweat chloride over 60 mmol/L confirms CF. Other heel-prick conditions include PKU, congenital hypothyroidism, sickle cell disease and MCADD.', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v6')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = '86a380bc-119e-5032-b51a-e117aba4234e';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('ba83b5cf-7dcd-5882-96bd-d87f289183c9', '86a380bc-119e-5032-b51a-e117aba4234e', 'A', 'Sweat chloride test', true, 0),
  ('26db68a6-b1b6-58e5-b756-99b3f4217e22', '86a380bc-119e-5032-b51a-e117aba4234e', 'B', 'Faecal elastase only', false, 1),
  ('6100539f-f9b0-5e9d-bf1e-47d95a1f3874', '86a380bc-119e-5032-b51a-e117aba4234e', 'C', 'Genetic testing only', false, 2),
  ('11770762-5014-501f-a2bf-07fb4df41586', '86a380bc-119e-5032-b51a-e117aba4234e', 'D', 'Spirometry', false, 3),
  ('93ca2249-1007-5f11-91a4-35007cf210a4', '86a380bc-119e-5032-b51a-e117aba4234e', 'E', 'CXR', false, 4);

-- Q728
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('51af2b58-6890-597d-a63f-23c9bdef5b15', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000036', 'sba', 'A 40 year old woman has colorectal cancer. Her mother had endometrial cancer and her uncle had colon cancer, both before 50. Tumour shows mismatch repair deficiency. What is the SINGLE most likely syndrome?', 'Lynch syndrome (MLH1, MSH2, MSH6, PMS2) increases risk of colorectal, endometrial, ovarian and urinary tract cancers. NICE recommends testing all colorectal and endometrial cancers for MMR deficiency. Carriers have colonoscopy every 2 years and aspirin.', null, true, true, jsonb_build_object('source', 'plab1-xlsx-v6', 'guidelines_text', 'NICE')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = '51af2b58-6890-597d-a63f-23c9bdef5b15';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('9cd6cbe6-5f4e-575b-a339-df637e0af6af', '51af2b58-6890-597d-a63f-23c9bdef5b15', 'A', 'Peutz-Jeghers syndrome', false, 0),
  ('c547064d-c7ae-55b5-9d03-6ba4c1e6f007', '51af2b58-6890-597d-a63f-23c9bdef5b15', 'B', 'Li-Fraumeni syndrome', false, 1),
  ('a31d3849-cc57-599a-be5f-944b702696a7', '51af2b58-6890-597d-a63f-23c9bdef5b15', 'C', 'Familial adenomatous polyposis', false, 2),
  ('d59db436-aa88-591f-b776-9b0b65ff729b', '51af2b58-6890-597d-a63f-23c9bdef5b15', 'D', 'BRCA2', false, 3),
  ('fa3096ca-30c5-5f5f-adc3-cb703efbe7cd', '51af2b58-6890-597d-a63f-23c9bdef5b15', 'E', 'Lynch syndrome (HNPCC)', true, 4);

-- Q729
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('d6a35773-5f07-52d1-8a2a-9d74a55b4861', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000014', 'sba', 'A 35 year old woman has had confusion, fever, low platelets and AKI. Blood film shows schistocytes. LDH is high. What is the SINGLE most appropriate treatment?', 'TTP is caused by low ADAMTS13 activity. Plasma exchange is life-saving. Caplacizumab and steroids are also used. Avoid platelet transfusion unless life-threatening bleeding.', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v6')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = 'd6a35773-5f07-52d1-8a2a-9d74a55b4861';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('b76c503e-a4ee-5a90-8f48-0d104053d22f', 'd6a35773-5f07-52d1-8a2a-9d74a55b4861', 'A', 'IV antibiotics only', false, 0),
  ('3b90def0-6678-527d-adf2-4559079aa632', 'd6a35773-5f07-52d1-8a2a-9d74a55b4861', 'B', 'Platelet transfusion', false, 1),
  ('93911c7e-5ae7-5618-9b6d-2f93eff74d4c', 'd6a35773-5f07-52d1-8a2a-9d74a55b4861', 'C', 'Splenectomy', false, 2),
  ('43874c9b-a126-59a1-aa43-48accb3445c3', 'd6a35773-5f07-52d1-8a2a-9d74a55b4861', 'D', 'Heparin', false, 3),
  ('7380880c-0691-5c5a-ab02-3271d1aa2461', 'd6a35773-5f07-52d1-8a2a-9d74a55b4861', 'E', 'Urgent plasma exchange (TTP)', true, 4);

-- Q730
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('9183eaf8-db2f-573e-9a45-6ba87abe654b', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000014', 'sba', 'A 10 year old boy has had anaemia, jaundice and an enlarged spleen. His father had his spleen removed. Blood film shows spherocytes. Direct antiglobulin test is negative. What is the SINGLE most likely diagnosis?', 'Hereditary spherocytosis is usually autosomal dominant. EMA binding test confirms. Complications: gallstones and aplastic crises (parvovirus). Splenectomy for severe cases.', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v6')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = '9183eaf8-db2f-573e-9a45-6ba87abe654b';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('4e016bc6-55bc-5c2e-b9ed-5136f7f9ff78', '9183eaf8-db2f-573e-9a45-6ba87abe654b', 'A', 'Hereditary spherocytosis', true, 0),
  ('dfff3bbf-44c9-5627-bf24-10087bdec7fe', '9183eaf8-db2f-573e-9a45-6ba87abe654b', 'B', 'G6PD deficiency', false, 1),
  ('49267540-1465-559d-844a-7a08f043b9e9', '9183eaf8-db2f-573e-9a45-6ba87abe654b', 'C', 'Sickle cell disease', false, 2),
  ('5d0f6ba0-325b-57c7-87db-7c97dc767d05', '9183eaf8-db2f-573e-9a45-6ba87abe654b', 'D', 'Autoimmune haemolytic anaemia', false, 3),
  ('123c3a72-5dfd-5ee2-859e-05e0157b0272', '9183eaf8-db2f-573e-9a45-6ba87abe654b', 'E', 'Thalassaemia', false, 4);

-- Q731
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('4bf03c81-c039-504d-a4b5-4e3c236a2195', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000014', 'sba', 'A 45 year old woman has had bruising and a platelet count of 15. She is otherwise well with normal Hb and white cells. Blood film shows large platelets. What is the SINGLE most likely diagnosis?', 'ITP is a diagnosis of exclusion. Treat if bleeding or very low counts: prednisolone or IVIG. TPO receptor agonists or rituximab for chronic ITP.', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v6')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = '4bf03c81-c039-504d-a4b5-4e3c236a2195';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('0f5216ff-21c5-5c7e-9573-aeda0137defe', '4bf03c81-c039-504d-a4b5-4e3c236a2195', 'A', 'DIC', false, 0),
  ('64d93a81-579b-5b5a-ab74-358784ad8fb0', '4bf03c81-c039-504d-a4b5-4e3c236a2195', 'B', 'Leukaemia', false, 1),
  ('bda1f696-0e38-5bc2-859c-3724c07b3425', '4bf03c81-c039-504d-a4b5-4e3c236a2195', 'C', 'Immune thrombocytopenia (ITP)', true, 2),
  ('827b0535-2f63-5fbd-a45e-f6abf7769019', '4bf03c81-c039-504d-a4b5-4e3c236a2195', 'D', 'TTP', false, 3),
  ('534c87ad-d328-5b24-a1c8-4283c2d5c419', '4bf03c81-c039-504d-a4b5-4e3c236a2195', 'E', 'Aplastic anaemia', false, 4);

-- Q732
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('31f06bab-32b4-5fa6-8517-ef2c96bb1b4e', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000028', 'sba', 'Before surgery, the theatre team pauses to confirm the patient, procedure and site. Which tool is this part of?', 'The WHO checklist has three stages: sign in (before anaesthesia), time out (before incision) and sign out (before leaving theatre). It reduces complications and mortality.', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v6')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = '31f06bab-32b4-5fa6-8517-ef2c96bb1b4e';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('d6f81a27-6874-58b0-95a3-3678a65a44b3', '31f06bab-32b4-5fa6-8517-ef2c96bb1b4e', 'A', 'PDSA', false, 0),
  ('9acb074d-91ed-5e24-afc9-b5fc6d6ee123', '31f06bab-32b4-5fa6-8517-ef2c96bb1b4e', 'B', 'SBAR', false, 1),
  ('0dc93677-ecdf-561d-800c-732aecda7c21', '31f06bab-32b4-5fa6-8517-ef2c96bb1b4e', 'C', 'WHO Surgical Safety Checklist', true, 2),
  ('b769a989-b4b3-5869-978c-21b40a774dfe', '31f06bab-32b4-5fa6-8517-ef2c96bb1b4e', 'D', 'NEWS2', false, 3),
  ('cad08a21-7759-5f27-9930-51c68959e1df', '31f06bab-32b4-5fa6-8517-ef2c96bb1b4e', 'E', 'Root cause analysis', false, 4);

-- Q733
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('4a057316-e444-594d-905d-fe04d29b6781', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000028', 'sba', 'An incident occurred because several minor failures lined up: an unclear policy, a tired doctor, and an alarm switched off. Which model describes this?', 'Reason''s Swiss cheese model describes errors passing through holes in multiple defensive layers. Latent conditions (system problems) combine with active failures.', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v6')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = '4a057316-e444-594d-905d-fe04d29b6781';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('1ec11e7f-13ea-56de-8805-4a3dead86ede', '4a057316-e444-594d-905d-fe04d29b6781', 'A', 'Pareto principle', false, 0),
  ('2017e6bf-967a-5deb-bd4d-95370b2cfedd', '4a057316-e444-594d-905d-fe04d29b6781', 'B', 'Bolam test', false, 1),
  ('b02eaee3-21c3-5e9e-9d01-68128a507c83', '4a057316-e444-594d-905d-fe04d29b6781', 'C', 'Maslow''s hierarchy', false, 2),
  ('f9a99f08-9b7f-593d-923e-14882e5a0990', '4a057316-e444-594d-905d-fe04d29b6781', 'D', 'Swiss cheese model (Reason)', true, 3),
  ('fa2dda7e-e57d-55a8-b174-00a178378a35', '4a057316-e444-594d-905d-fe04d29b6781', 'E', 'PDSA cycle', false, 4);

-- Q734
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('e260b210-593f-5eb6-953e-d74085bba035', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000028', 'sba', 'In a cardiac arrest, the team leader asks for adrenaline. The nurse repeats ''Adrenaline 1 mg IV, given''. What technique is this?', 'Closed-loop communication: the sender gives the message, the receiver repeats it back, and the sender confirms. It reduces errors in high-pressure settings.', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v6')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = 'e260b210-593f-5eb6-953e-d74085bba035';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('146cf259-4ad2-5039-bd2b-59402085811c', 'e260b210-593f-5eb6-953e-d74085bba035', 'A', 'Cross-monitoring', false, 0),
  ('57770c81-3977-5315-aab8-3a10ade871af', 'e260b210-593f-5eb6-953e-d74085bba035', 'B', 'Debrief', false, 1),
  ('7415686c-6244-5434-a064-ad8dbe687187', 'e260b210-593f-5eb6-953e-d74085bba035', 'C', 'Huddle', false, 2),
  ('1ef2bd95-3b3c-5d4c-9e7e-32a1cb32f042', 'e260b210-593f-5eb6-953e-d74085bba035', 'D', 'SBAR', false, 3),
  ('ddad0e54-91b8-5296-a32d-5fecec52e4fd', 'e260b210-593f-5eb6-953e-d74085bba035', 'E', 'Closed-loop communication', true, 4);

-- Q735
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('56ff8c17-2006-5783-a2ae-5b67adf56fdc', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000028', 'sba', 'A trust introduces a daily morning meeting of ward staff to discuss risks, staffing and deteriorating patients. What is this called?', 'Safety huddles are brief, regular meetings to share safety information and plan. They improve situational awareness and teamwork.', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v6')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = '56ff8c17-2006-5783-a2ae-5b67adf56fdc';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('49ce1458-5037-5ae6-8a1c-45e3871cc9cd', '56ff8c17-2006-5783-a2ae-5b67adf56fdc', 'A', 'Grand round', false, 0),
  ('a9129051-ac53-587d-92da-a94a0e6354ed', '56ff8c17-2006-5783-a2ae-5b67adf56fdc', 'B', 'Morbidity and mortality meeting', false, 1),
  ('3f0f4b78-a241-5b53-8b31-712c2a483a61', '56ff8c17-2006-5783-a2ae-5b67adf56fdc', 'C', 'Audit', false, 2),
  ('3a20ac9f-d83e-5243-b454-fb492ec91ec1', '56ff8c17-2006-5783-a2ae-5b67adf56fdc', 'D', 'Debrief', false, 3),
  ('ee42bb29-aa1b-5f39-ad40-769173dc42e3', '56ff8c17-2006-5783-a2ae-5b67adf56fdc', 'E', 'Safety huddle', true, 4);

-- Q736
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('66bf8732-030e-5c2d-83ef-2a9be00bb06f', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000010', 'sba', 'A 35 year old man went kayaking on a river 10 days ago. He has had fever, headache, myalgia (especially calves), red eyes, jaundice and AKI. What is the SINGLE most likely diagnosis?', 'Leptospirosis is spread by rat urine in water. Severe disease (Weil''s) causes jaundice, AKI and pulmonary haemorrhage. Treatment: doxycycline or penicillin.', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v6')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = '66bf8732-030e-5c2d-83ef-2a9be00bb06f';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('6d283c3c-6ee9-50d6-838c-ce590078051b', '66bf8732-030e-5c2d-83ef-2a9be00bb06f', 'A', 'Hepatitis A', false, 0),
  ('3cd19fbc-1ad0-59c6-ad52-b5766f0ad96d', '66bf8732-030e-5c2d-83ef-2a9be00bb06f', 'B', 'Dengue', false, 1),
  ('d5b69b6b-a6cd-59bd-9274-b179a58f1cb3', '66bf8732-030e-5c2d-83ef-2a9be00bb06f', 'C', 'Malaria', false, 2),
  ('aa25046d-6954-55bf-92c1-1a8bbdeb6b0d', '66bf8732-030e-5c2d-83ef-2a9be00bb06f', 'D', 'Leptospirosis (Weil''s disease)', true, 3),
  ('0e8cc8d3-a0f0-524c-a8ab-374c8ebee140', '66bf8732-030e-5c2d-83ef-2a9be00bb06f', 'E', 'Typhoid', false, 4);

-- Q737
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('deb4b984-2803-5a2b-9d87-bde1c88abfdb', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000010', 'sba', 'A 25 year old woman returned from India 2 weeks ago. She has had fever rising stepwise, abdominal pain, constipation and relative bradycardia. There are rose spots on her abdomen. What is the SINGLE most likely diagnosis?', 'Salmonella Typhi causes enteric fever. Blood cultures are the key test. Treatment: ceftriaxone or azithromycin (resistance is common). Complications: GI perforation and bleeding.', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v6')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = 'deb4b984-2803-5a2b-9d87-bde1c88abfdb';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('64c4acb2-af1a-560f-a23b-b5a1d4b588a9', 'deb4b984-2803-5a2b-9d87-bde1c88abfdb', 'A', 'Amoebic dysentery', false, 0),
  ('0c7b2a5f-dc74-562e-a0eb-32ecd67cc32a', 'deb4b984-2803-5a2b-9d87-bde1c88abfdb', 'B', 'Malaria', false, 1),
  ('7166d7e2-16eb-5e6b-8bf0-8eefb53d1d8c', 'deb4b984-2803-5a2b-9d87-bde1c88abfdb', 'C', 'Typhoid (enteric fever)', true, 2),
  ('6258bcb7-049b-5e00-a59a-832e5c648256', 'deb4b984-2803-5a2b-9d87-bde1c88abfdb', 'D', 'Hepatitis E', false, 3),
  ('54cf26b3-0db5-5aff-863d-4df31b66500d', 'deb4b984-2803-5a2b-9d87-bde1c88abfdb', 'E', 'Dengue', false, 4);

-- Q738
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('c456ace6-6b84-5854-a98c-41eedfdf3731', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000010', 'sba', 'A 40 year old man went walking in the New Forest. A week later, he has an expanding red rash with central clearing on his leg. What is the SINGLE most appropriate treatment?', 'NICE NG95: erythema migrans is diagnosed clinically and treated without testing. Doxycycline is first line. Later features: facial palsy, heart block, arthritis.', null, true, true, jsonb_build_object('source', 'plab1-xlsx-v6', 'guidelines_text', 'NICE NG95')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = 'c456ace6-6b84-5854-a98c-41eedfdf3731';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('deb492d7-0c87-594f-af0c-c32db859c071', 'c456ace6-6b84-5854-a98c-41eedfdf3731', 'A', 'No treatment', false, 0),
  ('5947928c-0b38-5027-80c9-fd875341272b', 'c456ace6-6b84-5854-a98c-41eedfdf3731', 'B', 'Doxycycline for 21 days (erythema migrans of Lyme disease)', true, 1),
  ('51c32ff3-db98-5a8c-8bca-3a64de0161de', 'c456ace6-6b84-5854-a98c-41eedfdf3731', 'C', 'Amoxicillin for 3 days', false, 2),
  ('7f1ba46c-a0c3-5dae-9b55-876377696d6d', 'c456ace6-6b84-5854-a98c-41eedfdf3731', 'D', 'IV ceftriaxone for all', false, 3),
  ('e9bd69f3-d20e-537e-a464-82e5bd7c8ac7', 'c456ace6-6b84-5854-a98c-41eedfdf3731', 'E', 'Wait for serology', false, 4);

-- Q739
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('99c80598-40fb-5e23-a9d1-e5b6e22cb661', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000010', 'sba', 'A 30 year old woman has had fever and a dry cough. She works on a sheep farm and lambing season has just finished. LFTs are raised. What is the SINGLE most likely diagnosis?', 'Q fever is spread from farm animals, especially at birth (placenta). It causes atypical pneumonia, hepatitis and later endocarditis. Treatment: doxycycline.', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v6')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = '99c80598-40fb-5e23-a9d1-e5b6e22cb661';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('c27b03b8-14b0-536d-b046-7fdd8ea3f576', '99c80598-40fb-5e23-a9d1-e5b6e22cb661', 'A', 'Q fever (Coxiella burnetii)', true, 0),
  ('e10a4d2f-b622-5b08-92ba-fdbc00a5e94a', '99c80598-40fb-5e23-a9d1-e5b6e22cb661', 'B', 'Legionnaires'' disease', false, 1),
  ('b21246dc-be2f-59cc-ab2b-71c41e540b37', '99c80598-40fb-5e23-a9d1-e5b6e22cb661', 'C', 'Mycoplasma pneumonia', false, 2),
  ('63655160-3e79-5e7e-9661-6326b9f16a4a', '99c80598-40fb-5e23-a9d1-e5b6e22cb661', 'D', 'Leptospirosis', false, 3),
  ('4c6b74fb-00f0-5b17-81fd-09b86389e375', '99c80598-40fb-5e23-a9d1-e5b6e22cb661', 'E', 'Psittacosis', false, 4);

-- Q740
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('970b62fc-ad5f-5e03-bf2c-f3e2f34609d1', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000037', 'sba', 'A 45 year old woman has had white lacy streaks on the inside of her cheeks. They are painless. She also has itchy purple papules on her wrists. What is the SINGLE most likely diagnosis?', 'Oral lichen planus shows Wickham''s striae. Erosive forms are painful and carry a small malignant risk, so follow up. Topical steroids help.', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v6')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = '970b62fc-ad5f-5e03-bf2c-f3e2f34609d1';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('c251d1f5-86e2-5f40-b0a4-1503c7c3c895', '970b62fc-ad5f-5e03-bf2c-f3e2f34609d1', 'A', 'Oral candidiasis', false, 0),
  ('f50dc2f9-c976-5347-95c8-fa02a04c1208', '970b62fc-ad5f-5e03-bf2c-f3e2f34609d1', 'B', 'Leukoplakia', false, 1),
  ('263c489b-1bc4-540f-8c7d-98e2579556d4', '970b62fc-ad5f-5e03-bf2c-f3e2f34609d1', 'C', 'Lichen sclerosus', false, 2),
  ('33db9aab-f0a9-5353-9a29-73468f017fef', '970b62fc-ad5f-5e03-bf2c-f3e2f34609d1', 'D', 'Lupus', false, 3),
  ('6a1169b3-51b1-5794-a9a0-77f122ae076a', '970b62fc-ad5f-5e03-bf2c-f3e2f34609d1', 'E', 'Lichen planus', true, 4);

-- Q741
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('15f85720-3645-5446-ad40-3b8abf292fdf', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000037', 'sba', 'A 30 year old man has had a tongue with red, smooth patches surrounded by white borders that change shape and position over days. It is mildly sore with spicy food. What is the SINGLE most likely diagnosis?', 'Geographic tongue is benign. Reassure. Avoid irritant foods if sore.', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v6')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = '15f85720-3645-5446-ad40-3b8abf292fdf';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('cd5fe176-98ca-557b-b9ad-e12a47c30887', '15f85720-3645-5446-ad40-3b8abf292fdf', 'A', 'Oral candidiasis', false, 0),
  ('de03de32-fdcc-57ac-ac43-888df970259f', '15f85720-3645-5446-ad40-3b8abf292fdf', 'B', 'Leukoplakia', false, 1),
  ('eecedf43-cddd-5a09-8063-27acfa062143', '15f85720-3645-5446-ad40-3b8abf292fdf', 'C', 'Iron deficiency glossitis', false, 2),
  ('1994ac7c-9b47-5215-b026-18ee3e45ee09', '15f85720-3645-5446-ad40-3b8abf292fdf', 'D', 'Lichen planus', false, 3),
  ('91a217ae-f57a-5c29-99f0-5c61f613ce29', '15f85720-3645-5446-ad40-3b8abf292fdf', 'E', 'Geographic tongue (benign migratory glossitis)', true, 4);

-- Q742
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('e6497667-ef76-552c-9bf9-f8d7d7feb6a5', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000037', 'sba', 'A 40 year old man has had pain and swelling under his jaw on one side when eating, which goes down after meals. What is the SINGLE most likely diagnosis?', 'Most salivary stones occur in the submandibular gland (thicker, alkaline saliva, upward duct). Treatment: hydration, sialogogues, massage; stone removal for persistent cases.', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v6')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = 'e6497667-ef76-552c-9bf9-f8d7d7feb6a5';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('c6056099-55ab-51df-8c1e-3ae2db741bb3', 'e6497667-ef76-552c-9bf9-f8d7d7feb6a5', 'A', 'Mumps', false, 0),
  ('2fc9d8cc-0dd2-5aea-a388-64f71432ec23', 'e6497667-ef76-552c-9bf9-f8d7d7feb6a5', 'B', 'Dental abscess', false, 1),
  ('5ad7718b-36b8-5491-8a33-8d7a67f45587', 'e6497667-ef76-552c-9bf9-f8d7d7feb6a5', 'C', 'Lymphadenopathy', false, 2),
  ('41946671-2b4d-5d9d-8a4e-960b9559f045', 'e6497667-ef76-552c-9bf9-f8d7d7feb6a5', 'D', 'Submandibular gland stone (sialolithiasis)', true, 3),
  ('2da03c07-50a4-5d91-a17a-51c3902de7dd', 'e6497667-ef76-552c-9bf9-f8d7d7feb6a5', 'E', 'Parotid tumour', false, 4);

-- Q743
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('0e29d2ba-d609-584d-9804-c6652a6e3913', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000029', 'sba', 'An 85 year old woman''s daughter controls all her money, and the woman appears frightened and unkempt. She has bruises of different ages. What is the MOST appropriate action?', 'Elder abuse can be physical, financial, psychological, sexual or neglect. The Care Act 2014 places duties on local authorities. Speak to the patient alone if possible.', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v6')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = '0e29d2ba-d609-584d-9804-c6652a6e3913';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('5fc7664d-a4bc-5453-90dc-a8d442a19bb9', '0e29d2ba-d609-584d-9804-c6652a6e3913', 'A', 'Confront the daughter', false, 0),
  ('0b7bc845-d217-5072-ab63-085d54801396', '0e29d2ba-d609-584d-9804-c6652a6e3913', 'B', 'Inform the police only', false, 1),
  ('f2e433f7-7fc6-5d7d-9e51-f4155fa89af2', '0e29d2ba-d609-584d-9804-c6652a6e3913', 'C', 'Discharge home', false, 2),
  ('fe2e9f4d-c896-5c97-8666-e21082225ec7', '0e29d2ba-d609-584d-9804-c6652a6e3913', 'D', 'Raise a safeguarding concern with the local authority adult safeguarding team', true, 3),
  ('f8bb5fde-8e7a-574d-938a-a75ea3642815', '0e29d2ba-d609-584d-9804-c6652a6e3913', 'E', 'Ignore it', false, 4);

-- Q744
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('b2a701fa-3ffa-56c9-b57d-e275626d6c8f', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000029', 'sba', 'An 83 year old man takes oxybutynin, amitriptyline, chlorphenamine and prochlorperazine. He has become confused and constipated and has fallen. What is the MOST likely cause?', 'Anticholinergic burden scales sum drug effects. High scores increase confusion, falls, constipation, urinary retention and mortality. Review and deprescribe.', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v6')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = 'b2a701fa-3ffa-56c9-b57d-e275626d6c8f';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('12e4e394-e2ab-58ea-82d0-5685eb0e50e5', 'b2a701fa-3ffa-56c9-b57d-e275626d6c8f', 'A', 'High anticholinergic burden', true, 0),
  ('cd7a51a8-bd4a-5f4e-a685-c76062f722c2', 'b2a701fa-3ffa-56c9-b57d-e275626d6c8f', 'B', 'Hypothyroidism', false, 1),
  ('84ac6a1e-026a-5fe2-838a-9c7e5c13839d', 'b2a701fa-3ffa-56c9-b57d-e275626d6c8f', 'C', 'Alzheimer''s progression', false, 2),
  ('a600958b-3a85-5bd2-a06f-f4b9c970957d', 'b2a701fa-3ffa-56c9-b57d-e275626d6c8f', 'D', 'Normal ageing', false, 3),
  ('d2f64fd1-e406-50f0-b5b9-76feab5e5272', 'b2a701fa-3ffa-56c9-b57d-e275626d6c8f', 'E', 'Stroke', false, 4);

-- Q745
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('314860bb-900d-5d64-a6c7-81f9e246f78e', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000029', 'sba', 'A 90 year old woman has moderate frailty. She takes 12 medications. What tool helps identify inappropriate medicines in older people?', 'STOPP/START criteria identify potentially inappropriate prescriptions and omissions. Structured medication reviews reduce polypharmacy harm.', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v6')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = '314860bb-900d-5d64-a6c7-81f9e246f78e';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('a8fc44ec-64b3-5196-bae8-b68ccc08b80c', '314860bb-900d-5d64-a6c7-81f9e246f78e', 'A', 'STOPP/START criteria', true, 0),
  ('af3546ed-7b86-55d2-8fa5-7abbd93d96f2', '314860bb-900d-5d64-a6c7-81f9e246f78e', 'B', 'ABCD2', false, 1),
  ('40f8c47e-1933-57e1-ace5-671e2af4b8e8', '314860bb-900d-5d64-a6c7-81f9e246f78e', 'C', 'Wells score', false, 2),
  ('c1b4abab-1965-5795-99ee-c13f45d59050', '314860bb-900d-5d64-a6c7-81f9e246f78e', 'D', 'CURB-65', false, 3),
  ('0da0820a-bcb9-5edd-b28e-dba1a68b8131', '314860bb-900d-5d64-a6c7-81f9e246f78e', 'E', 'MUST', false, 4);

-- Q746
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('2eb12613-1d4e-5693-971f-58418cd65148', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000007', 'sba', 'A 20 year old man is preoccupied that his nose is deformed. He checks mirrors for hours and has asked for surgery. Others see no abnormality. What is the SINGLE most likely diagnosis?', 'BDD is a preoccupation with a perceived defect. Treatment: CBT with exposure and response prevention and SSRIs. Cosmetic surgery rarely helps.', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v6')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = '2eb12613-1d4e-5693-971f-58418cd65148';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('4004345f-dc4a-54ec-80a2-0c844a8553b4', '2eb12613-1d4e-5693-971f-58418cd65148', 'A', 'Social anxiety', false, 0),
  ('48e8cebc-7632-5081-8058-ebae3639c6f9', '2eb12613-1d4e-5693-971f-58418cd65148', 'B', 'OCD', false, 1),
  ('6974ca22-0493-542e-acc9-107bf5687703', '2eb12613-1d4e-5693-971f-58418cd65148', 'C', 'Delusional disorder', false, 2),
  ('3541fd23-1bf1-5a9f-916a-456af9a7802d', '2eb12613-1d4e-5693-971f-58418cd65148', 'D', 'Body dysmorphic disorder', true, 3),
  ('bdc6663f-fb88-5607-a428-f00b46eaa674', '2eb12613-1d4e-5693-971f-58418cd65148', 'E', 'Anorexia nervosa', false, 4);

-- Q747
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('5f528aea-26e4-59bd-9dcd-6f3c1a1fc171', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000007', 'sba', 'A 30 year old woman washes her hands for hours because of fears of contamination. She knows it is excessive. What is the SINGLE most appropriate first-line treatment?', 'NICE CG31: OCD with mild functional impairment: low-intensity CBT with ERP. Moderate: SSRI or more intensive CBT. Severe: both. Clomipramine is an alternative.', null, true, true, jsonb_build_object('source', 'plab1-xlsx-v6', 'guidelines_text', 'NICE CG31')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = '5f528aea-26e4-59bd-9dcd-6f3c1a1fc171';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('0bdc9ca1-f625-5d89-9441-aba5a0e64b2a', '5f528aea-26e4-59bd-9dcd-6f3c1a1fc171', 'A', 'Benzodiazepine', false, 0),
  ('53337a3d-242f-5dea-869c-6f7c684463fc', '5f528aea-26e4-59bd-9dcd-6f3c1a1fc171', 'B', 'Lithium', false, 1),
  ('227b5060-7adc-50ec-ab2e-e3ae88eb0f1b', '5f528aea-26e4-59bd-9dcd-6f3c1a1fc171', 'C', 'CBT including exposure and response prevention', true, 2),
  ('38c88ab5-7bd4-5195-a556-f5019ca722b8', '5f528aea-26e4-59bd-9dcd-6f3c1a1fc171', 'D', 'Antipsychotic', false, 3),
  ('3d748352-d8ab-5634-a234-93a2a4db2d67', '5f528aea-26e4-59bd-9dcd-6f3c1a1fc171', 'E', 'Psychodynamic therapy only', false, 4);

-- Q748
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('f7a56797-352e-5538-b94a-b2a735a22822', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000007', 'sba', 'A 35 year old man has had flashbacks and nightmares since a violent assault 3 months ago. He avoids the area and is always on edge. What is the SINGLE most appropriate first-line treatment?', 'NICE NG116: PTSD treatment is trauma-focused psychological therapy. Drugs (venlafaxine or SSRI) if preferred or therapy not effective. Single-session debriefing is not recommended.', null, true, true, jsonb_build_object('source', 'plab1-xlsx-v6', 'guidelines_text', 'NICE NG116')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = 'f7a56797-352e-5538-b94a-b2a735a22822';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('463d5ef8-d4de-5cd5-af35-677e64efd3dd', 'f7a56797-352e-5538-b94a-b2a735a22822', 'A', 'Trauma-focused CBT or EMDR', true, 0),
  ('1f64b1be-34d4-5925-a31c-952e50fff115', 'f7a56797-352e-5538-b94a-b2a735a22822', 'B', 'Debriefing immediately', false, 1),
  ('a0e21cda-f39b-51f0-ab66-29b4f103e790', 'f7a56797-352e-5538-b94a-b2a735a22822', 'C', 'Watchful waiting for a year', false, 2),
  ('73101324-852c-5103-94a2-6ee539f9d7fd', 'f7a56797-352e-5538-b94a-b2a735a22822', 'D', 'Benzodiazepines', false, 3),
  ('1ad507f4-9e8c-5d5d-b57b-1dbeb2c88567', 'f7a56797-352e-5538-b94a-b2a735a22822', 'E', 'Antipsychotic', false, 4);

-- Q749
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('25e38b96-ac94-542c-9923-864a9d15902a', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000007', 'sba', 'A 40 year old woman has had multiple medical presentations over years with various symptoms. All tests are normal. She worries that she has a serious illness, despite reassurance. What is the SINGLE most likely diagnosis?', 'In somatic symptom disorder, symptoms cause excessive thoughts and anxiety. Management: one named doctor, regular appointments, limiting unnecessary tests, CBT.', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v6')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = '25e38b96-ac94-542c-9923-864a9d15902a';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('b9c04c20-7e9e-5927-899b-0b4b69b99530', '25e38b96-ac94-542c-9923-864a9d15902a', 'A', 'Conversion disorder', false, 0),
  ('e191969f-f2a9-5e8f-9885-dac75e686d99', '25e38b96-ac94-542c-9923-864a9d15902a', 'B', 'Somatic symptom disorder (or health anxiety)', true, 1),
  ('0f9ede71-6787-5bfc-be7b-f4f1cedb4f43', '25e38b96-ac94-542c-9923-864a9d15902a', 'C', 'Factitious disorder', false, 2),
  ('5be6b75a-c435-5dba-b570-592f13fbbbe0', '25e38b96-ac94-542c-9923-864a9d15902a', 'D', 'Schizophrenia', false, 3),
  ('0c8042f2-9873-5724-920c-e9fece8e5381', '25e38b96-ac94-542c-9923-864a9d15902a', 'E', 'Malingering', false, 4);

-- Q750
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('29c4968b-5587-5f8f-a3ac-4bf3739c1da9', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000011', 'sba', 'A 20 year old woman has had joint pains, recurrent subluxations of her shoulders, and stretchy skin. Beighton score is 7/9. What is the SINGLE most likely diagnosis?', 'Beighton score assesses hypermobility. hEDS has joint hypermobility, skin features and family history. Management: physiotherapy for strengthening. Vascular EDS (COL3A1) causes arterial rupture.', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v6')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = '29c4968b-5587-5f8f-a3ac-4bf3739c1da9';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('9328d6fa-9508-514f-90f4-7b3240dcd448', '29c4968b-5587-5f8f-a3ac-4bf3739c1da9', 'A', 'Fibromyalgia', false, 0),
  ('23fd6333-47f7-5713-83d2-94740623f3c1', '29c4968b-5587-5f8f-a3ac-4bf3739c1da9', 'B', 'Osteogenesis imperfecta', false, 1),
  ('a161d332-cfd2-5e82-adb3-20fcba24870d', '29c4968b-5587-5f8f-a3ac-4bf3739c1da9', 'C', 'Rheumatoid arthritis', false, 2),
  ('af5afd96-afa5-5bf0-ac0b-3ff3f3cebed4', '29c4968b-5587-5f8f-a3ac-4bf3739c1da9', 'D', 'Hypermobility spectrum disorder or hypermobile Ehlers-Danlos syndrome', true, 3),
  ('8bad8dc1-644c-5e18-b0db-e620f489d296', '29c4968b-5587-5f8f-a3ac-4bf3739c1da9', 'E', 'Marfan syndrome', false, 4);

-- Q751
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('3efa17ae-bef0-5c6b-b146-8f6bd63facd0', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000011', 'sba', 'A 70 year old woman has had bone pain and proximal muscle weakness. She is housebound. Calcium is low, phosphate is low and ALP is raised. What is the SINGLE most likely diagnosis?', 'Osteomalacia is defective bone mineralisation. Looser''s zones on X-ray. Treatment: vitamin D loading then maintenance. Osteoporosis has normal blood tests.', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v6')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = '3efa17ae-bef0-5c6b-b146-8f6bd63facd0';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('0c1a7ee4-1534-5482-a998-d90f19bdc318', '3efa17ae-bef0-5c6b-b146-8f6bd63facd0', 'A', 'Osteomalacia (vitamin D deficiency)', true, 0),
  ('fada2c56-05b0-573e-b8f9-aeb2a02362fb', '3efa17ae-bef0-5c6b-b146-8f6bd63facd0', 'B', 'Paget''s disease', false, 1),
  ('2978e164-9a6b-54c8-91e3-b420f5a4d27b', '3efa17ae-bef0-5c6b-b146-8f6bd63facd0', 'C', 'Hyperparathyroidism', false, 2),
  ('f28b3787-cdb1-5234-8142-0d47083c3a86', '3efa17ae-bef0-5c6b-b146-8f6bd63facd0', 'D', 'Osteoporosis', false, 3),
  ('10cd2cec-1b01-5921-8107-20cf94cd62ed', '3efa17ae-bef0-5c6b-b146-8f6bd63facd0', 'E', 'Myeloma', false, 4);

-- Q752
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('18b02100-5591-59d1-869d-7bcfce26022b', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000011', 'sba', 'A 75 year old man has had bone pain in his pelvis and an enlarged skull (hat no longer fits). ALP is very high. Calcium is normal. What is the SINGLE most likely diagnosis?', 'Paget''s disease involves increased bone turnover. Complications: deafness, fractures, osteosarcoma and high-output heart failure. Treatment: bisphosphonates for pain.', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v6')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = '18b02100-5591-59d1-869d-7bcfce26022b';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('aa1c9221-0814-579c-82ed-00e2bc501d15', '18b02100-5591-59d1-869d-7bcfce26022b', 'A', 'Prostate cancer metastases', false, 0),
  ('0a3da9ff-5080-5dcd-a6a3-0c7e1d66c88f', '18b02100-5591-59d1-869d-7bcfce26022b', 'B', 'Osteomalacia', false, 1),
  ('d6220550-e8bc-5bb3-ba1b-a3d12e20240a', '18b02100-5591-59d1-869d-7bcfce26022b', 'C', 'Osteoporosis', false, 2),
  ('38aa5351-4d6a-5c4f-bbeb-ed2845bd03c1', '18b02100-5591-59d1-869d-7bcfce26022b', 'D', 'Myeloma', false, 3),
  ('aaa87efc-5aca-591c-a9b6-24cf2f86c20b', '18b02100-5591-59d1-869d-7bcfce26022b', 'E', 'Paget''s disease of bone', true, 4);

-- Q753
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('65532277-7902-58a0-841a-6969cd1b82e4', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000006', 'sba', 'A 25 year old obese woman has had headaches worse in the morning and transient visual obscurations. She has bilateral papilloedema. MRI and MR venography are normal. Lumbar puncture opening pressure is 35 cmH2O. What is the SINGLE most likely diagnosis?', 'IIH occurs in obese women and with drugs (tetracyclines, retinoids). Treatment: weight loss, acetazolamide, and optic nerve sheath fenestration or shunt if vision threatened.', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v6')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = '65532277-7902-58a0-841a-6969cd1b82e4';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('21097d8f-38cb-5803-80ab-c4536de3be91', '65532277-7902-58a0-841a-6969cd1b82e4', 'A', 'Migraine', false, 0),
  ('0ceae692-b489-5d93-9f1f-9eec5bc3f142', '65532277-7902-58a0-841a-6969cd1b82e4', 'B', 'Venous sinus thrombosis', false, 1),
  ('11e26429-07ea-58c4-a76f-da687b3e86af', '65532277-7902-58a0-841a-6969cd1b82e4', 'C', 'Meningitis', false, 2),
  ('f4acc311-3689-5786-86f0-5b0eecae9d4e', '65532277-7902-58a0-841a-6969cd1b82e4', 'D', 'Brain tumour', false, 3),
  ('1fadbd62-2580-519b-905d-c3ab894f88cf', '65532277-7902-58a0-841a-6969cd1b82e4', 'E', 'Idiopathic intracranial hypertension', true, 4);

-- Q754
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('141361fd-481a-57ed-a407-284255b7859e', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000006', 'sba', 'A 60 year old man has had weakness in his hands, muscle wasting, fasciculations and brisk reflexes. Sensation is normal. What is the SINGLE most likely diagnosis?', 'MND causes mixed upper and lower motor neuron signs without sensory loss. Riluzole modestly prolongs survival. NIV improves survival in respiratory failure. MDT care.', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v6')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = '141361fd-481a-57ed-a407-284255b7859e';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('049dffae-f528-5660-8575-1fca07c4cc2c', '141361fd-481a-57ed-a407-284255b7859e', 'A', 'Multiple sclerosis', false, 0),
  ('76cf6835-aeee-5719-b95d-952e725ce829', '141361fd-481a-57ed-a407-284255b7859e', 'B', 'Motor neurone disease', true, 1),
  ('e17bc91e-23d1-5bb4-a282-151b687eecfa', '141361fd-481a-57ed-a407-284255b7859e', 'C', 'Cervical myelopathy', false, 2),
  ('4daeaf7e-1148-5c59-9ea8-faa71cd5a76e', '141361fd-481a-57ed-a407-284255b7859e', 'D', 'Peripheral neuropathy', false, 3),
  ('984e2083-a3c1-54ff-b932-c17b6c0f26c7', '141361fd-481a-57ed-a407-284255b7859e', 'E', 'Myasthenia gravis', false, 4);

-- Q755
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('3515424d-b885-585f-b8df-aabd804dcd7e', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000006', 'sba', 'A 35 year old woman with myasthenia gravis has had increasing weakness and difficulty breathing. Her FVC is 1.0 L. What is the SINGLE most appropriate management?', 'Myasthenic crisis is triggered by infection, surgery or drugs (aminoglycosides, beta-blockers, magnesium). Monitor FVC (not SpO2). IVIG or plasma exchange.', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v6')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = '3515424d-b885-585f-b8df-aabd804dcd7e';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('f2f031f6-1268-516d-a9d0-58ca74391293', '3515424d-b885-585f-b8df-aabd804dcd7e', 'A', 'Discharge', false, 0),
  ('c91b3b93-caf9-5e07-b065-bc55c3868528', '3515424d-b885-585f-b8df-aabd804dcd7e', 'B', 'Increase pyridostigmine only', false, 1),
  ('297aa30f-f564-5737-8474-3a2db907593f', '3515424d-b885-585f-b8df-aabd804dcd7e', 'C', 'Admit to ICU/HDU, consider ventilation, and give IVIG or plasma exchange (myasthenic crisis)', true, 2),
  ('4e887dbe-5764-522c-8e5d-728de97411cd', '3515424d-b885-585f-b8df-aabd804dcd7e', 'D', 'Oral steroids alone at high dose', false, 3),
  ('a33150a3-0fe7-547d-a786-85650e89154a', '3515424d-b885-585f-b8df-aabd804dcd7e', 'E', 'Give gentamicin', false, 4);

-- Q756
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('7e8cc075-8d7f-5402-84f8-ba38a992aa24', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000006', 'sba', 'A 50 year old man who drinks heavily has had confusion, unsteady walking and nystagmus. What is the SINGLE most appropriate treatment?', 'Wernicke''s encephalopathy: confusion, ataxia, ophthalmoplegia (not all present). Give IV thiamine urgently. Untreated, it progresses to Korsakoff''s syndrome.', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v6')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = '7e8cc075-8d7f-5402-84f8-ba38a992aa24';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('ab472d80-2d8b-5fbc-8b65-9dc201450459', '7e8cc075-8d7f-5402-84f8-ba38a992aa24', 'A', 'Haloperidol', false, 0),
  ('11c7b872-2a6d-54bc-9c1d-6caa6130bd7a', '7e8cc075-8d7f-5402-84f8-ba38a992aa24', 'B', 'Glucose first', false, 1),
  ('337940bb-9d38-568c-a0d5-64b60ce281e8', '7e8cc075-8d7f-5402-84f8-ba38a992aa24', 'C', 'IV thiamine (Pabrinex) before glucose', true, 2),
  ('983dd2f5-3da2-5fd1-ac64-e0fda9f6ad47', '7e8cc075-8d7f-5402-84f8-ba38a992aa24', 'D', 'Oral thiamine only', false, 3),
  ('4336eb11-4c05-57fa-b107-4ee376dd8719', '7e8cc075-8d7f-5402-84f8-ba38a992aa24', 'E', 'Chlordiazepoxide only', false, 4);

-- Q757
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('ded2b7dc-c1cd-5a28-80c0-0eecf4e32791', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000006', 'sba', 'A 70 year old man has had episodes of forgetfulness, urinary incontinence and a broad-based, shuffling gait. CT shows enlarged ventricles out of proportion to atrophy. What is the SINGLE most likely diagnosis?', 'NPH triad: gait disturbance, urinary incontinence and cognitive impairment. A trial of lumbar puncture improving gait predicts benefit from a ventriculoperitoneal shunt.', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v6')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = 'ded2b7dc-c1cd-5a28-80c0-0eecf4e32791';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('9a2e5af5-b101-59f1-bb5a-1e0284f313d8', 'ded2b7dc-c1cd-5a28-80c0-0eecf4e32791', 'A', 'Normal pressure hydrocephalus', true, 0),
  ('2bb10eff-9b55-5ae0-ae31-9f6947495aba', 'ded2b7dc-c1cd-5a28-80c0-0eecf4e32791', 'B', 'Alzheimer''s disease', false, 1),
  ('11b60b8b-b621-5b7f-b61e-3d558f9f4aee', 'ded2b7dc-c1cd-5a28-80c0-0eecf4e32791', 'C', 'Parkinson''s disease', false, 2),
  ('5811fdab-614c-5ef2-b9f4-dc5d39668e60', 'ded2b7dc-c1cd-5a28-80c0-0eecf4e32791', 'D', 'Vascular dementia', false, 3),
  ('dc51fde7-df8b-53eb-bf50-c3734d97d0e1', 'ded2b7dc-c1cd-5a28-80c0-0eecf4e32791', 'E', 'Lewy body dementia', false, 4);

-- Q758
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('7abfd2aa-594d-5137-9dd7-69c2df34d8e1', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000008', 'sba', 'A 22 year old woman on the combined pill has had post-coital bleeding. Smear is up to date and normal. Examination shows a red area around the cervical os. STI screen is negative. What is the SINGLE most likely diagnosis?', 'Ectropion is columnar epithelium on the ectocervix, common with the pill, pregnancy and adolescence. Treatment is not needed unless symptoms are troublesome (cryotherapy). Refer if the cervix looks suspicious.', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v6')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = '7abfd2aa-594d-5137-9dd7-69c2df34d8e1';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('57ee3726-cca8-502e-8564-06b8875d10c9', '7abfd2aa-594d-5137-9dd7-69c2df34d8e1', 'A', 'Cervicitis', false, 0),
  ('1c6faeca-baab-5926-9d2a-5bc8b190d57d', '7abfd2aa-594d-5137-9dd7-69c2df34d8e1', 'B', 'Endometriosis', false, 1),
  ('accefb8d-892c-5f86-aa6a-de48e856b550', '7abfd2aa-594d-5137-9dd7-69c2df34d8e1', 'C', 'Cervical polyp', false, 2),
  ('edfd76db-6343-5973-8ade-76aa75357b04', '7abfd2aa-594d-5137-9dd7-69c2df34d8e1', 'D', 'Cervical cancer', false, 3),
  ('0e854310-c46a-589e-b0f7-2d9dce0ca255', '7abfd2aa-594d-5137-9dd7-69c2df34d8e1', 'E', 'Cervical ectropion', true, 4);

-- Q759
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('820a6ab3-a399-5f8e-b180-6ef95db65823', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000015', 'sba', 'A 55 year old short-sighted man has had flashing lights, floaters and a dark curtain coming across his vision. What is the SINGLE most likely diagnosis?', 'Retinal detachment needs same-day ophthalmology review. Risk factors: myopia, trauma, cataract surgery. Macula-on detachments are most urgent to save central vision.', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v6')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = '820a6ab3-a399-5f8e-b180-6ef95db65823';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('b450c8f2-0a92-5146-8c05-e1a90e491eb0', '820a6ab3-a399-5f8e-b180-6ef95db65823', 'A', 'Posterior vitreous detachment only', false, 0),
  ('dd502e0c-9a57-5840-8c51-91f1469d771f', '820a6ab3-a399-5f8e-b180-6ef95db65823', 'B', 'CRAO', false, 1),
  ('78e66ad5-ff4b-57fe-8d64-cb47ca553ed4', '820a6ab3-a399-5f8e-b180-6ef95db65823', 'C', 'Migraine', false, 2),
  ('5b03eb44-b9a1-5e47-b78d-ea48a3672ecb', '820a6ab3-a399-5f8e-b180-6ef95db65823', 'D', 'Vitreous haemorrhage', false, 3),
  ('14aa0f44-174b-5ae9-8f9b-285b2fbae405', '820a6ab3-a399-5f8e-b180-6ef95db65823', 'E', 'Retinal detachment', true, 4);

-- Q760
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('0276c20f-83b7-59e0-a812-8fd116af4723', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000015', 'sba', 'A 6 year old child has had a swollen, red eyelid with fever. He has pain on eye movement and reduced vision. What is the SINGLE most likely diagnosis?', 'Orbital cellulitis (post-septal) causes proptosis, painful eye movement, reduced vision and RAPD. It often follows sinusitis. Admit for IV antibiotics and CT; ENT and ophthalmology review.', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v6')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = '0276c20f-83b7-59e0-a812-8fd116af4723';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('1a1f2389-de29-5970-bce9-65a2cc2ea270', '0276c20f-83b7-59e0-a812-8fd116af4723', 'A', 'Conjunctivitis', false, 0),
  ('154b7a5a-fd7d-5ddf-bb72-76c5e5de9a17', '0276c20f-83b7-59e0-a812-8fd116af4723', 'B', 'Chalazion', false, 1),
  ('775cd021-a744-53f8-a205-7d31cb9bca86', '0276c20f-83b7-59e0-a812-8fd116af4723', 'C', 'Preseptal cellulitis', false, 2),
  ('8b8720d1-ca0c-54a1-8e30-ca78be8a0ba5', '0276c20f-83b7-59e0-a812-8fd116af4723', 'D', 'Orbital cellulitis', true, 3),
  ('1402a514-cba9-5e31-a629-e7af4267f273', '0276c20f-83b7-59e0-a812-8fd116af4723', 'E', 'Stye', false, 4);

-- Q761
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('1cf4b75a-1ec8-5256-b976-7a193cca2c9e', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000016', 'sba', 'A 30 year old man has had pain in his wrist after a fall onto an outstretched hand. X-ray shows the lunate has rotated and looks triangular (''piece of pie'') on the PA view. What is the SINGLE most likely injury?', 'Perilunate and lunate dislocations are often missed. They can compress the median nerve. Urgent reduction and surgical repair are needed.', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v6')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = '1cf4b75a-1ec8-5256-b976-7a193cca2c9e';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('570a6d36-0568-5ac0-bbb6-e3333d218f81', '1cf4b75a-1ec8-5256-b976-7a193cca2c9e', 'A', 'Colles'' fracture', false, 0),
  ('2f55cf74-68bd-520e-bc54-b6166767a1b7', '1cf4b75a-1ec8-5256-b976-7a193cca2c9e', 'B', 'Distal radioulnar subluxation', false, 1),
  ('111dbd92-5318-5857-b615-e7feda9c04e4', '1cf4b75a-1ec8-5256-b976-7a193cca2c9e', 'C', 'Scaphoid fracture', false, 2),
  ('05163118-7c98-5e50-867f-17462a76738a', '1cf4b75a-1ec8-5256-b976-7a193cca2c9e', 'D', 'Hamate fracture', false, 3),
  ('cf58b111-f261-58ad-bea3-e3c13f475b74', '1cf4b75a-1ec8-5256-b976-7a193cca2c9e', 'E', 'Lunate or perilunate dislocation', true, 4);

-- Q762
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('82172d64-5c6b-561a-96a2-cb6f70cde517', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000016', 'sba', 'A 60 year old man felt a pop in his upper arm while lifting. There is a bulge in the lower arm (''Popeye sign''). He has mild weakness in supination. What is the SINGLE most likely diagnosis?', 'Proximal long head of biceps rupture usually needs no surgery in older people. Distal biceps rupture causes significant supination weakness and needs early repair in active patients.', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v6')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = '82172d64-5c6b-561a-96a2-cb6f70cde517';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('3606b697-fe0f-5272-b5ba-a125cad1da0f', '82172d64-5c6b-561a-96a2-cb6f70cde517', 'A', 'Triceps rupture', false, 0),
  ('55b302f4-e7a2-5005-a7db-bd4026bc8988', '82172d64-5c6b-561a-96a2-cb6f70cde517', 'B', 'Rotator cuff tear', false, 1),
  ('427d6e32-2347-5d40-95d0-cf954296965c', '82172d64-5c6b-561a-96a2-cb6f70cde517', 'C', 'Distal biceps rupture', false, 2),
  ('18c65888-aaee-5d84-b448-07513c5ac3ff', '82172d64-5c6b-561a-96a2-cb6f70cde517', 'D', 'Humeral fracture', false, 3),
  ('20b721f7-bb04-57f9-b0ca-71a4ec2d27a2', '82172d64-5c6b-561a-96a2-cb6f70cde517', 'E', 'Rupture of the long head of biceps', true, 4);

-- Q763
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('5cffaa25-005c-526f-8df7-1426102f018c', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000017', 'sba', 'A 65 year old man with cancer takes oral morphine sulphate MR 60 mg twice daily. He can no longer swallow. What is the equivalent 24-hour subcutaneous morphine dose for a syringe driver?', 'Oral to subcutaneous morphine: divide by 2 (120 mg oral = 60 mg SC). Oral morphine to oral oxycodone: divide by 1.5-2. Prescribe breakthrough doses of one-sixth of the 24-hour dose.', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v6')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = '5cffaa25-005c-526f-8df7-1426102f018c';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('b5d0ab88-acae-504f-921f-8d91b1a8ec91', '5cffaa25-005c-526f-8df7-1426102f018c', 'A', '10 mg', false, 0),
  ('3d9ad7a9-6f3a-5ac5-bc8f-1d8be52fa5ba', '5cffaa25-005c-526f-8df7-1426102f018c', 'B', '30 mg', false, 1),
  ('5eaa3d98-cca7-5ae5-9f88-cdd569d230f9', '5cffaa25-005c-526f-8df7-1426102f018c', 'C', '60 mg over 24 hours (half the oral dose)', true, 2),
  ('8abbd16e-37f2-58aa-a15c-310ddb7f1793', '5cffaa25-005c-526f-8df7-1426102f018c', 'D', '120 mg', false, 3),
  ('b88e6bcb-8f2c-59bc-aed9-d747934f66b6', '5cffaa25-005c-526f-8df7-1426102f018c', 'E', '240 mg', false, 4);

-- Q764
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('713cf012-57df-51cf-b6d0-bc380f8faeac', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000017', 'sba', 'A 70 year old woman is expected to die in the coming days at home. What should the GP prescribe in advance?', 'Anticipatory (''just in case'') medicines ensure rapid symptom control. Stop non-essential medicines. Discuss preferred place of death.', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v6')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = '713cf012-57df-51cf-b6d0-bc380f8faeac';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('3aa45163-037d-521a-b5c5-bbe520b6cf4d', '713cf012-57df-51cf-b6d0-bc380f8faeac', 'A', 'Anticipatory medicines for pain, agitation, nausea and secretions (e.g. morphine, midazolam, levomepromazine, hyoscine butylbromide)', true, 0),
  ('59ff1bbf-f030-5c3a-aa15-82dc94e456d9', '713cf012-57df-51cf-b6d0-bc380f8faeac', 'B', 'Statins', false, 1),
  ('b3941f87-3cbf-53be-8578-602cf8d93863', '713cf012-57df-51cf-b6d0-bc380f8faeac', 'C', 'IV fluids', false, 2),
  ('0d4b3866-f514-5a01-8d75-a2d32e2b98aa', '713cf012-57df-51cf-b6d0-bc380f8faeac', 'D', 'Antibiotics', false, 3),
  ('2de2c04a-c17d-5451-9f47-6fb6079cee3f', '713cf012-57df-51cf-b6d0-bc380f8faeac', 'E', 'Steroids for all', false, 4);

-- Q765
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('617a5b12-e9b6-5d7e-ae78-8b9d73135772', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000017', 'sba', 'A 75 year old man has died at home of known lung cancer. His GP saw him 5 days ago. The family asks what happens next. Which statement is correct?', 'Expected natural deaths can be certified by a doctor who attended, with medical examiner scrutiny in England. Referral to the coroner is needed for unnatural, unknown, violent or industrial-related deaths (e.g. mesothelioma).', null, true, true, jsonb_build_object('source', 'plab1-xlsx-v6')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = '617a5b12-e9b6-5d7e-ae78-8b9d73135772';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('8d887585-8e0c-5e70-9472-a582c541e70a', '617a5b12-e9b6-5d7e-ae78-8b9d73135772', 'A', 'The death can be certified by the doctor (medical examiner review) if the cause is known and natural', true, 0),
  ('05df5e61-8a1b-5679-a858-612a9044cd1e', '617a5b12-e9b6-5d7e-ae78-8b9d73135772', 'B', 'A post-mortem is always needed', false, 1),
  ('b322ab7b-58b8-5f5d-9374-51e2bb3e78de', '617a5b12-e9b6-5d7e-ae78-8b9d73135772', 'C', 'It must always be referred to the coroner', false, 2),
  ('e99e7897-2bd9-5732-b3e9-fb6acf51eb36', '617a5b12-e9b6-5d7e-ae78-8b9d73135772', 'D', 'Nothing is required', false, 3),
  ('ad14a0d6-618a-5d2e-8596-c5d06444c50d', '617a5b12-e9b6-5d7e-ae78-8b9d73135772', 'E', 'Death cannot be verified by a nurse', false, 4);

-- Q766
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('9218ff58-97fd-55b1-aadf-9eb89689da2b', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000017', 'sba', 'A 60 year old man with liver metastases has had persistent hiccups for 3 days, causing exhaustion. What is a recognised treatment?', 'Hiccups in palliative care: treat causes (gastric distension, uraemia, hepatomegaly irritating the diaphragm). Drugs: metoclopramide, baclofen, haloperidol, chlorpromazine, and dexamethasone for tumour-related causes.', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v6')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = '9218ff58-97fd-55b1-aadf-9eb89689da2b';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('b3d248c5-d45d-5437-b7b5-d97ea71e6555', '9218ff58-97fd-55b1-aadf-9eb89689da2b', 'A', 'Morphine', false, 0),
  ('1505a242-5b6a-5706-a80e-73a9adf2b399', '9218ff58-97fd-55b1-aadf-9eb89689da2b', 'B', 'Oxybutynin', false, 1),
  ('56001c67-93cd-5014-aa82-c9f858a34939', '9218ff58-97fd-55b1-aadf-9eb89689da2b', 'C', 'Furosemide', false, 2),
  ('a9ed001c-8c92-5826-bb67-239a2fef993b', '9218ff58-97fd-55b1-aadf-9eb89689da2b', 'D', 'Antibiotics', false, 3),
  ('f61bc4f2-edfd-59b1-807f-ab336861bac8', '9218ff58-97fd-55b1-aadf-9eb89689da2b', 'E', 'Baclofen, haloperidol or metoclopramide (depending on cause)', true, 4);

-- Q767
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('026dfc68-4cab-5e18-ac8a-493fb27651be', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000018', 'sba', 'During a nerve block with bupivacaine, a patient develops perioral tingling, tinnitus, then seizures and a broad complex arrhythmia. What is the SINGLE most appropriate treatment?', 'Local anaesthetic systemic toxicity: stop injection, manage airway, treat seizures with benzodiazepines, give lipid emulsion. CPR may be prolonged. Maximum bupivacaine dose is 2 mg/kg.', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v6')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = '026dfc68-4cab-5e18-ac8a-493fb27651be';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('d949e146-e477-5299-a021-5b3d83955ff3', '026dfc68-4cab-5e18-ac8a-493fb27651be', 'A', 'Adrenaline 1 mg immediately at high doses', false, 0),
  ('982f2248-a664-50a3-876b-773df775d27f', '026dfc68-4cab-5e18-ac8a-493fb27651be', 'B', 'Dantrolene', false, 1),
  ('a7a0e170-8ecb-5166-a0cd-e707bb316c3d', '026dfc68-4cab-5e18-ac8a-493fb27651be', 'C', 'Naloxone', false, 2),
  ('bafeacb9-0f99-5081-9320-51a5c5daf780', '026dfc68-4cab-5e18-ac8a-493fb27651be', 'D', 'Flumazenil', false, 3),
  ('79b76596-7b60-58b6-9ddd-64739c517ef8', '026dfc68-4cab-5e18-ac8a-493fb27651be', 'E', 'IV lipid emulsion (Intralipid 20%) with ALS', true, 4);

-- Q768
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('4f73e89a-a0c8-532a-bac5-9e33e3245523', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000018', 'sba', 'A 30 year old man remains paralysed for hours after a short procedure using suxamethonium. What is the SINGLE most likely cause?', 'Suxamethonium apnoea: keep sedated and ventilated until the drug wears off. Test the patient and family; give an alert card.', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v6')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = '4f73e89a-a0c8-532a-bac5-9e33e3245523';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('8efaeed4-b297-5215-8aa2-b6f56dd5a15b', '4f73e89a-a0c8-532a-bac5-9e33e3245523', 'A', 'Plasma cholinesterase (pseudocholinesterase) deficiency', true, 0),
  ('57eb2edc-ba64-5c79-b418-c77f9df4eb33', '4f73e89a-a0c8-532a-bac5-9e33e3245523', 'B', 'Stroke', false, 1),
  ('8dba579a-7636-5f8f-b367-93c19d66024f', '4f73e89a-a0c8-532a-bac5-9e33e3245523', 'C', 'Myasthenia gravis', false, 2),
  ('e7961f57-1bf9-546d-8a8a-7b9553dd276a', '4f73e89a-a0c8-532a-bac5-9e33e3245523', 'D', 'Opioid overdose', false, 3),
  ('ebd18988-96ba-5b9a-9ad5-70e4c091b229', '4f73e89a-a0c8-532a-bac5-9e33e3245523', 'E', 'Malignant hyperthermia', false, 4);

-- Q769
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('85df72e4-3614-5a65-bbf1-128effd6c7df', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000018', 'sba', 'A 50 year old woman is having elective surgery under general anaesthetic tomorrow morning. What fasting advice is correct?', 'Standard adult fasting: 6 hours for food (and milk), 2 hours for clear fluids (some units allow sips up to 1 hour). Over-fasting causes dehydration and discomfort.', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v6')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = '85df72e4-3614-5a65-bbf1-128effd6c7df';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('2cd1d197-2c69-596f-8a5d-993528305a23', '85df72e4-3614-5a65-bbf1-128effd6c7df', 'A', 'No fluids for 12 hours', false, 0),
  ('9dbfe852-403c-5a00-af5e-05f9fc913c1e', '85df72e4-3614-5a65-bbf1-128effd6c7df', 'B', 'Food until 2 hours before', false, 1),
  ('826e492e-f147-5327-bc33-86daf3cfa85f', '85df72e4-3614-5a65-bbf1-128effd6c7df', 'C', 'No food for 6 hours; clear fluids up to 2 hours before', true, 2),
  ('a43d6b6e-3378-5853-971e-e898321b4694', '85df72e4-3614-5a65-bbf1-128effd6c7df', 'D', 'No food or drink from midnight for all', false, 3),
  ('90d3cb6b-deb3-5f31-afaa-a5f781a69289', '85df72e4-3614-5a65-bbf1-128effd6c7df', 'E', 'No restrictions', false, 4);

-- Q770
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('1680bdbd-b234-56ac-8b8a-c1c5a799df3e', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000018', 'sba', 'A 70 year old man takes clopidogrel for a coronary stent placed 2 months ago. He needs a non-urgent hernia repair. What is the MOST appropriate action?', 'Stopping DAPT early after stenting risks stent thrombosis. Defer elective surgery until DAPT is complete (usually 6-12 months). Discuss with cardiology if surgery cannot wait.', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v6')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = '1680bdbd-b234-56ac-8b8a-c1c5a799df3e';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('7c778747-dbee-594b-823a-7fdb3aa130b5', '1680bdbd-b234-56ac-8b8a-c1c5a799df3e', 'A', 'Stop aspirin and clopidogrel for 2 weeks', false, 0),
  ('c81a4c54-6b42-54f3-8385-6540a742f33b', '1680bdbd-b234-56ac-8b8a-c1c5a799df3e', 'B', 'Stop clopidogrel and proceed tomorrow', false, 1),
  ('dedaa446-7faa-58f2-aff1-d16ca9a7b1bd', '1680bdbd-b234-56ac-8b8a-c1c5a799df3e', 'C', 'Bridge with warfarin', false, 2),
  ('04d89f83-1d06-5a2e-9300-5753f41b7d4b', '1680bdbd-b234-56ac-8b8a-c1c5a799df3e', 'D', 'Delay elective surgery until dual antiplatelet therapy is complete; discuss with cardiology', true, 3),
  ('1f29614c-786b-506c-ad97-fa61c7239af9', '1680bdbd-b234-56ac-8b8a-c1c5a799df3e', 'E', 'Proceed on clopidogrel without discussion', false, 4);

-- Q771
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('676ea4ed-7374-5bbb-a427-d9781b354a59', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000005', 'sba', 'A 25 year old man has had visible haematuria 1-2 days after a sore throat. BP is normal. What is the SINGLE most likely diagnosis?', 'IgA nephropathy causes haematuria within days of an upper respiratory infection (synpharyngitic). Post-streptococcal GN occurs 1-3 weeks later. Monitor BP and proteinuria; ACE inhibitor if proteinuria.', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v6')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = '676ea4ed-7374-5bbb-a427-d9781b354a59';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('bfbc49b9-6e3b-5cb6-a847-e074b29dda19', '676ea4ed-7374-5bbb-a427-d9781b354a59', 'A', 'IgA nephropathy', true, 0),
  ('682036f6-b382-511c-a9fe-6b95d7df27ab', '676ea4ed-7374-5bbb-a427-d9781b354a59', 'B', 'Minimal change disease', false, 1),
  ('1d1e97a4-7963-544e-97b0-9eb360527db2', '676ea4ed-7374-5bbb-a427-d9781b354a59', 'C', 'Alport syndrome', false, 2),
  ('895487fe-9ebf-5093-bb31-731ce0832b84', '676ea4ed-7374-5bbb-a427-d9781b354a59', 'D', 'Post-streptococcal glomerulonephritis', false, 3),
  ('9882394c-43ed-5487-8aad-52af4957c1e0', '676ea4ed-7374-5bbb-a427-d9781b354a59', 'E', 'Membranous nephropathy', false, 4);

-- Q772
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('0f4c2e45-79d7-509d-a3f0-347f6b148bde', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000005', 'sba', 'A 60 year old man has had nephrotic syndrome. He has lost weight and smokes. Renal biopsy shows membranous nephropathy. Anti-PLA2R antibodies are negative. What should be considered?', 'Membranous nephropathy is the commonest cause of nephrotic syndrome in adults. Primary is anti-PLA2R positive. Secondary causes: cancer, hepatitis B, SLE, drugs (NSAIDs, gold, penicillamine).', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v6')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = '0f4c2e45-79d7-509d-a3f0-347f6b148bde';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('c9894a4c-7ba0-5285-b526-d500b7960d95', '0f4c2e45-79d7-509d-a3f0-347f6b148bde', 'A', 'Underlying malignancy (secondary membranous nephropathy)', true, 0),
  ('48286ed7-eb4c-52e2-8c84-6f95160630d5', '0f4c2e45-79d7-509d-a3f0-347f6b148bde', 'B', 'IgA nephropathy', false, 1),
  ('c88ac33d-146e-5ff3-8eaa-93ca83393480', '0f4c2e45-79d7-509d-a3f0-347f6b148bde', 'C', 'Lupus only', false, 2),
  ('13ed04c8-518f-5ffd-84eb-b17866e9ca70', '0f4c2e45-79d7-509d-a3f0-347f6b148bde', 'D', 'Minimal change', false, 3),
  ('c2df0671-b911-5b9b-b061-89f6667d2033', '0f4c2e45-79d7-509d-a3f0-347f6b148bde', 'E', 'Post-strep GN', false, 4);

-- Q773
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('9274375f-2dbd-5224-8e6d-91385d3c5a47', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000005', 'sba', 'A 20 year old man has haematuria, sensorineural deafness and anterior lenticonus. His uncle needed dialysis. What is the SINGLE most likely diagnosis?', 'Alport syndrome is usually X-linked (type IV collagen). It causes progressive renal failure, deafness and eye abnormalities. Post-transplant anti-GBM disease can occur.', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v6')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = '9274375f-2dbd-5224-8e6d-91385d3c5a47';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('af64f93c-f0ba-5568-b1f9-1506c3afcfa4', '9274375f-2dbd-5224-8e6d-91385d3c5a47', 'A', 'Alport syndrome', true, 0),
  ('36970366-34f0-55f1-909d-688f86c9a675', '9274375f-2dbd-5224-8e6d-91385d3c5a47', 'B', 'Fabry disease', false, 1),
  ('3a334f73-3642-5536-b042-e137c8de502d', '9274375f-2dbd-5224-8e6d-91385d3c5a47', 'C', 'Goodpasture''s syndrome', false, 2),
  ('cbc6bd48-c776-5890-91c5-47d86aec4776', '9274375f-2dbd-5224-8e6d-91385d3c5a47', 'D', 'Polycystic kidney disease', false, 3),
  ('b21de833-d680-5fac-8429-428d319db2b4', '9274375f-2dbd-5224-8e6d-91385d3c5a47', 'E', 'IgA nephropathy', false, 4);

-- Q774
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('2228aa33-b075-53ea-8812-7f32496729eb', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000031', 'sba', 'A 50 year old man has had a urethral stricture after a catheter injury. He has a slow stream and spraying. What is the SINGLE most appropriate first investigation?', 'Urethral strictures follow trauma, catheterisation, instrumentation or infection (gonorrhoea, lichen sclerosus). Treatment: dilatation, urethrotomy or urethroplasty.', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v6')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = '2228aa33-b075-53ea-8812-7f32496729eb';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('eed91515-93f5-5d22-844b-ddbd4a9fbfd0', '2228aa33-b075-53ea-8812-7f32496729eb', 'A', 'PSA', false, 0),
  ('92020fed-341d-5374-9c82-f62e8dfbedec', '2228aa33-b075-53ea-8812-7f32496729eb', 'B', 'Urinary flow rate and retrograde urethrogram', true, 1),
  ('de513b18-4dc0-5d59-8885-0cc94086efc6', '2228aa33-b075-53ea-8812-7f32496729eb', 'C', 'Renal biopsy', false, 2),
  ('02066a26-c45a-5380-ab6b-5c063f111cb0', '2228aa33-b075-53ea-8812-7f32496729eb', 'D', 'CT abdomen', false, 3),
  ('0ea24f4d-94d9-55d4-88b9-d9b4115e4909', '2228aa33-b075-53ea-8812-7f32496729eb', 'E', 'Testicular ultrasound', false, 4);

-- Q775
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('78b0a2d9-44d2-50ed-8e52-fc23935a81fb', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000031', 'sba', 'A 25 year old man was in a motorbike crash with a pelvic fracture. He has blood at the urethral meatus and cannot pass urine. What should be AVOIDED?', 'Posterior urethral injury: blood at the meatus, high-riding prostate, perineal bruising. Perform a retrograde urethrogram; insert a suprapubic catheter if needed.', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v6')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = '78b0a2d9-44d2-50ed-8e52-fc23935a81fb';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('8c6dc845-c572-57f6-979d-6b04c39e6eda', '78b0a2d9-44d2-50ed-8e52-fc23935a81fb', 'A', 'Suprapubic catheter', false, 0),
  ('97ebc7e9-29b7-5dac-8911-3b9e5fa5ba39', '78b0a2d9-44d2-50ed-8e52-fc23935a81fb', 'B', 'CT scan', false, 1),
  ('261e2698-dd2a-5b39-87c4-414ba7a24c95', '78b0a2d9-44d2-50ed-8e52-fc23935a81fb', 'C', 'Retrograde urethrogram', false, 2),
  ('e38211c7-13b8-5146-9a71-dd9e8c9db99b', '78b0a2d9-44d2-50ed-8e52-fc23935a81fb', 'D', 'Analgesia', false, 3),
  ('6f5dfb9d-8b2e-5fda-8456-949311cced9d', '78b0a2d9-44d2-50ed-8e52-fc23935a81fb', 'E', 'Blind urethral catheterisation (risk of converting partial to complete urethral rupture)', true, 4);

-- Q776
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('c744429d-bbe0-5db0-8093-e23f1b7037e7', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000002', 'sba', 'A 45 year old woman has had a dry cough and breathlessness for months. She keeps pigeons. CT shows ground-glass changes in the upper lobes and centrilobular nodules. What is the SINGLE most likely diagnosis?', 'Hypersensitivity pneumonitis is an immune reaction to inhaled organic antigens. Remove the exposure. Steroids for severe disease. Farmer''s lung (mouldy hay) is another example.', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v6')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = 'c744429d-bbe0-5db0-8093-e23f1b7037e7';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('bb2dd17f-e0e6-5cc4-a55b-aa8a5c739847', 'c744429d-bbe0-5db0-8093-e23f1b7037e7', 'A', 'Idiopathic pulmonary fibrosis', false, 0),
  ('2c3582f1-8dff-5bb3-9ca6-ba7bb6472cb9', 'c744429d-bbe0-5db0-8093-e23f1b7037e7', 'B', 'Sarcoidosis', false, 1),
  ('5f509dcb-5703-58ce-b816-725d15c638c9', 'c744429d-bbe0-5db0-8093-e23f1b7037e7', 'C', 'Psittacosis', false, 2),
  ('b6656107-08e8-5628-ae67-d08ba5678f1f', 'c744429d-bbe0-5db0-8093-e23f1b7037e7', 'D', 'Hypersensitivity pneumonitis (bird fancier''s lung)', true, 3),
  ('75cade10-3cb0-5726-9f29-7bb094a55dfc', 'c744429d-bbe0-5db0-8093-e23f1b7037e7', 'E', 'Asthma', false, 4);

-- Q777
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('476726c4-ab08-54ee-bc9d-a6623cb779c3', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000002', 'sba', 'A 30 year old woman with asthma has had worsening wheeze, brown sputum plugs and fleeting CXR shadows. Eosinophils and IgE are raised. Aspergillus skin test is positive. What is the SINGLE most likely diagnosis?', 'ABPA occurs in asthma and CF. It can cause proximal bronchiectasis. Treatment: oral steroids and itraconazole.', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v6')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = '476726c4-ab08-54ee-bc9d-a6623cb779c3';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('7fbddc76-9e60-5340-8407-d4195402cf00', '476726c4-ab08-54ee-bc9d-a6623cb779c3', 'A', 'Invasive aspergillosis', false, 0),
  ('c9916948-a67b-52a8-929b-0941d0dba389', '476726c4-ab08-54ee-bc9d-a6623cb779c3', 'B', 'Allergic bronchopulmonary aspergillosis', true, 1),
  ('1abab984-2055-514d-9c1e-938316023364', '476726c4-ab08-54ee-bc9d-a6623cb779c3', 'C', 'Aspergilloma', false, 2),
  ('6780c363-c165-56eb-ae51-4f611e528c59', '476726c4-ab08-54ee-bc9d-a6623cb779c3', 'D', 'Churg-Strauss syndrome', false, 3),
  ('ebc63f9f-28ed-50bd-b85c-14280f130335', '476726c4-ab08-54ee-bc9d-a6623cb779c3', 'E', 'Pneumonia', false, 4);

-- Q778
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('47eabe9a-5375-598c-85e5-ef7e4fd381d2', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000002', 'sba', 'A 65 year old man has had a fall in his FEV1 and progressive breathlessness. He has COPD with an SpO2 of 86% on air when stable. ABG shows PaO2 of 7.0 kPa on two occasions. He has stopped smoking. What is the MOST appropriate management?', 'LTOT is offered if PaO2 is under 7.3 kPa (or under 8 with polycythaemia, pulmonary hypertension or peripheral oedema), in non-smokers. It improves survival.', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v6')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = '47eabe9a-5375-598c-85e5-ef7e4fd381d2';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('68ba3729-3ff7-5908-a113-561284762906', '47eabe9a-5375-598c-85e5-ef7e4fd381d2', 'A', 'Ambulatory oxygen only', false, 0),
  ('fb261d28-9270-5faa-af7f-7e7d17e818c1', '47eabe9a-5375-598c-85e5-ef7e4fd381d2', 'B', 'Long-term oxygen therapy (at least 15 hours a day)', true, 1),
  ('3fd1728a-9e6b-5b90-aa6c-8c26103ece7f', '47eabe9a-5375-598c-85e5-ef7e4fd381d2', 'C', 'Home nebulisers', false, 2),
  ('ccaa8b22-9e2b-5339-ae78-f46411ebf630', '47eabe9a-5375-598c-85e5-ef7e4fd381d2', 'D', 'Oral steroids long term', false, 3),
  ('e1864a86-1d4c-5b82-9296-440256dc891a', '47eabe9a-5375-598c-85e5-ef7e4fd381d2', 'E', 'No oxygen', false, 4);

-- Q779
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('b056744c-abed-5700-98c7-340354f3c9d8', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000019', 'sba', 'A 30 year old woman has had a malar rash, joint pain, mouth ulcers and proteinuria. Anti-dsDNA is positive and complement is low. What is the most important drug for all SLE patients unless contraindicated?', 'Hydroxychloroquine reduces flares, organ damage and mortality in SLE. Annual eye screening after 5 years. Lupus nephritis needs mycophenolate or cyclophosphamide.', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v6')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = 'b056744c-abed-5700-98c7-340354f3c9d8';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('3763eb3b-3da2-5eea-a19f-3585c38342bf', 'b056744c-abed-5700-98c7-340354f3c9d8', 'A', 'Hydroxychloroquine', true, 0),
  ('a5782e88-f706-5145-ae61-91f761dfe51d', 'b056744c-abed-5700-98c7-340354f3c9d8', 'B', 'Rituximab', false, 1),
  ('805759d2-474e-5609-91b4-c9635a847807', 'b056744c-abed-5700-98c7-340354f3c9d8', 'C', 'Methotrexate', false, 2),
  ('acd107e4-8e7b-5689-8fb6-f52082b5204f', 'b056744c-abed-5700-98c7-340354f3c9d8', 'D', 'Cyclophosphamide', false, 3),
  ('e1bdea08-2ac8-5d6a-9c02-f268c74ae3cc', 'b056744c-abed-5700-98c7-340354f3c9d8', 'E', 'Infliximab', false, 4);

-- Q780
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('24bb9e1b-9e19-54db-b032-4d63a243512e', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000020', 'sba', 'A 22 year old woman has unprotected sex 4 days ago (96 hours). She wants emergency contraception. She is not on any interacting drugs. What is the MOST effective option?', 'The copper IUD is the most effective EC, up to 5 days after UPSI or 5 days after the earliest expected ovulation. Levonorgestrel up to 72 hours; ulipristal up to 120 hours (less effective with recent progestogen).', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v6')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = '24bb9e1b-9e19-54db-b032-4d63a243512e';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('f9a63c42-47bf-564f-8264-a2369f179414', '24bb9e1b-9e19-54db-b032-4d63a243512e', 'A', 'Combined pill (Yuzpe)', false, 0),
  ('fcf704c7-daae-5bc1-a2af-9733a5e97f1a', '24bb9e1b-9e19-54db-b032-4d63a243512e', 'B', 'Ulipristal acetate', false, 1),
  ('c71b3522-5f43-5a81-9134-48950093002c', '24bb9e1b-9e19-54db-b032-4d63a243512e', 'C', 'Levonorgestrel 1.5 mg', false, 2),
  ('fe997668-9831-5b98-ae48-382e8075c8c7', '24bb9e1b-9e19-54db-b032-4d63a243512e', 'D', 'No options available', false, 3),
  ('61613f3c-696c-59b8-b4f3-82b41cdd81f7', '24bb9e1b-9e19-54db-b032-4d63a243512e', 'E', 'Copper IUD', true, 4);

-- Q781
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('71f676fc-3fde-50fb-9edc-ec29ac7f9ab5', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000020', 'sba', 'A 17 year old girl has been prescribed an antibiotic and is on the combined pill. What advice is correct?', 'FSRH: non-enzyme-inducing antibiotics do not affect hormonal contraception. Vomiting within 3 hours or severe diarrhoea can reduce absorption.', null, true, true, jsonb_build_object('source', 'plab1-xlsx-v6', 'guidelines_text', 'FSRH')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = '71f676fc-3fde-50fb-9edc-ec29ac7f9ab5';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('adcd0ac3-f47d-5896-bedb-6a0e2fdc85ca', '71f676fc-3fde-50fb-9edc-ec29ac7f9ab5', 'A', 'Use EC', false, 0),
  ('3512e825-4a72-53a6-9cc0-fb827d428036', '71f676fc-3fde-50fb-9edc-ec29ac7f9ab5', 'B', 'Stop the pill', false, 1),
  ('3c2f5a8e-4348-52fe-b228-2a9e0a47fb03', '71f676fc-3fde-50fb-9edc-ec29ac7f9ab5', 'C', 'Use condoms for 7 days with all antibiotics', false, 2),
  ('4ab38f54-5e06-5ccc-a379-57ec2457d3c7', '71f676fc-3fde-50fb-9edc-ec29ac7f9ab5', 'D', 'Most antibiotics (other than enzyme inducers like rifampicin) do not reduce effectiveness; no extra precautions needed', true, 3),
  ('37d9ac53-200b-505b-b114-b0d64796e66e', '71f676fc-3fde-50fb-9edc-ec29ac7f9ab5', 'E', 'Double the pill dose', false, 4);

-- Q782
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('d2af27eb-ab23-55a6-902e-18308336b598', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000020', 'sba', 'A 30 year old woman wants long-acting contraception. She has heavy periods. Which method also reduces menstrual bleeding?', 'The LNG-IUS (52 mg) reduces heavy menstrual bleeding and lasts up to 8 years for contraception. The copper IUD can make periods heavier.', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v6')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = 'd2af27eb-ab23-55a6-902e-18308336b598';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('07590409-01de-5b43-9aa9-444c3f191a63', 'd2af27eb-ab23-55a6-902e-18308336b598', 'A', 'Fertility awareness', false, 0),
  ('5232e2fb-0748-5756-86e5-a372541b1eab', 'd2af27eb-ab23-55a6-902e-18308336b598', 'B', 'Copper IUD', false, 1),
  ('95968b21-f69f-5252-8f1f-1041fa522543', 'd2af27eb-ab23-55a6-902e-18308336b598', 'C', 'Levonorgestrel intrauterine system (Mirena)', true, 2),
  ('3a6a8444-bfe4-5a1b-8cda-35762545ff86', 'd2af27eb-ab23-55a6-902e-18308336b598', 'D', 'Diaphragm', false, 3),
  ('271cc7d1-acf8-57e4-9e4f-5b3f82e28a0d', 'd2af27eb-ab23-55a6-902e-18308336b598', 'E', 'Condoms', false, 4);

-- Q783
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('cd2a779d-b4cb-5fdf-a0ed-be6fbb468f7f', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000020', 'sba', 'A 35 year old woman has had pelvic pain, fever and abnormal discharge. She has cervical excitation. She is not pregnant. What is the SINGLE most appropriate outpatient treatment?', 'BASHH PID regimen: ceftriaxone 1 g IM, then doxycycline and metronidazole for 14 days. Remove IUD if no improvement in 72 hours. Treat partners. Complications: infertility, ectopic, chronic pain.', null, true, true, jsonb_build_object('source', 'plab1-xlsx-v6', 'guidelines_text', 'BASHH')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = 'cd2a779d-b4cb-5fdf-a0ed-be6fbb468f7f';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('5a15a29a-6acf-5692-8a91-a6db8abebd32', 'cd2a779d-b4cb-5fdf-a0ed-be6fbb468f7f', 'A', 'Amoxicillin alone', false, 0),
  ('39544ece-fe76-59d3-b560-dcfff9dfa069', 'cd2a779d-b4cb-5fdf-a0ed-be6fbb468f7f', 'B', 'Clotrimazole', false, 1),
  ('f11a1117-3376-5d66-96fb-470354d575e1', 'cd2a779d-b4cb-5fdf-a0ed-be6fbb468f7f', 'C', 'Azithromycin single dose', false, 2),
  ('1430ca42-d377-5230-a3d3-b66d30a0e7a9', 'cd2a779d-b4cb-5fdf-a0ed-be6fbb468f7f', 'D', 'Aciclovir', false, 3),
  ('650d158c-a3b4-5955-ac84-85af7bf7a751', 'cd2a779d-b4cb-5fdf-a0ed-be6fbb468f7f', 'E', 'IM ceftriaxone plus oral doxycycline and metronidazole for 14 days (PID)', true, 4);

-- Q784
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('9321f21e-3080-5d6c-b6ad-6a4c810d2e6b', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000021', 'sba', 'A study has 30% smokers in group A with lung cancer and 10% in group B without. Which measure is calculated in a case-control study?', 'Case-control studies cannot calculate incidence or relative risk; they calculate odds ratios. Cohort studies calculate relative risk.', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v6')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = '9321f21e-3080-5d6c-b6ad-6a4c810d2e6b';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('9c16d08d-f105-577d-9ce7-9bebae80a38c', '9321f21e-3080-5d6c-b6ad-6a4c810d2e6b', 'A', 'Odds ratio', true, 0),
  ('3ecad0cc-cc66-52f1-870b-13e61b2bac52', '9321f21e-3080-5d6c-b6ad-6a4c810d2e6b', 'B', 'Incidence', false, 1),
  ('1f0d0931-9407-5c8f-abd2-de7dd7ff3a4a', '9321f21e-3080-5d6c-b6ad-6a4c810d2e6b', 'C', 'Relative risk', false, 2),
  ('af31a549-f69e-54ae-a416-5cf48ae091b6', '9321f21e-3080-5d6c-b6ad-6a4c810d2e6b', 'D', 'Number needed to treat', false, 3),
  ('e2304555-1627-51b2-822b-5062809de5d0', '9321f21e-3080-5d6c-b6ad-6a4c810d2e6b', 'E', 'Attributable risk only', false, 4);

-- Q785
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('fdd5e087-4726-5871-8a6e-3a919099e4d6', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000021', 'sba', 'A new test is tested in a population with a low prevalence of disease. What happens to the positive predictive value?', 'PPV and NPV depend on prevalence. Sensitivity and specificity are properties of the test. Low prevalence means more false positives relative to true positives.', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v6')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = 'fdd5e087-4726-5871-8a6e-3a919099e4d6';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('b245c785-352e-5d21-b2e6-0823e625ac84', 'fdd5e087-4726-5871-8a6e-3a919099e4d6', 'A', 'It stays the same', false, 0),
  ('30f297c8-f1c0-5ccc-94d6-6134d1ea6b8f', 'fdd5e087-4726-5871-8a6e-3a919099e4d6', 'B', 'It rises', false, 1),
  ('9fb94bfe-a0c3-5751-9c9a-e60a2fa03a93', 'fdd5e087-4726-5871-8a6e-3a919099e4d6', 'C', 'It falls', true, 2),
  ('0bed95ff-e56a-5c88-a4ec-a32852b128ad', 'fdd5e087-4726-5871-8a6e-3a919099e4d6', 'D', 'Specificity falls', false, 3),
  ('d57a80e9-0785-5576-be59-84fab42051f6', 'fdd5e087-4726-5871-8a6e-3a919099e4d6', 'E', 'Sensitivity falls', false, 4);

-- Q786
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('f0ec915a-1872-5594-a2ca-a67ccc3b0933', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000021', 'sba', 'Which factor is the SINGLE greatest contributor to health inequalities in the UK?', 'Marmot reviews: the social gradient in health reflects income, education, housing, employment and environment. Life expectancy gaps between most and least deprived areas are large.', null, true, true, jsonb_build_object('source', 'plab1-xlsx-v6')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = 'f0ec915a-1872-5594-a2ca-a67ccc3b0933';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('51ce9cc0-ba9f-543d-a785-f22ebbcc409c', 'f0ec915a-1872-5594-a2ca-a67ccc3b0933', 'A', 'Weather', false, 0),
  ('943cb29e-479a-578a-b67e-300cb202e4a7', 'f0ec915a-1872-5594-a2ca-a67ccc3b0933', 'B', 'Genetics', false, 1),
  ('7fc778e5-4ba2-57f0-9da2-8900531fdef3', 'f0ec915a-1872-5594-a2ca-a67ccc3b0933', 'C', 'Socioeconomic deprivation (wider determinants of health)', true, 2),
  ('b9c09841-d453-559c-a6e8-e1b4e2e4e19d', 'f0ec915a-1872-5594-a2ca-a67ccc3b0933', 'D', 'Hospital location only', false, 3),
  ('1f5e1c7a-a883-5b9b-936b-ec31e0dd6cdf', 'f0ec915a-1872-5594-a2ca-a67ccc3b0933', 'E', 'Access to private healthcare', false, 4);

-- Q787
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('bc5faa17-b0e0-5a4e-a5ff-c693222d25d2', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000021', 'sba', 'A study cannot rule out that results are due to an unknown factor associated with both exposure and outcome. What is this called?', 'Confounders are associated with both exposure and outcome and are not on the causal pathway. Randomisation controls for known and unknown confounders.', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v6')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = 'bc5faa17-b0e0-5a4e-a5ff-c693222d25d2';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('45d8348c-24c3-502d-86e8-f00b98b1fb42', 'bc5faa17-b0e0-5a4e-a5ff-c693222d25d2', 'A', 'Recall bias', false, 0),
  ('1c112441-9290-5f87-a32c-db78ee2c8f4a', 'bc5faa17-b0e0-5a4e-a5ff-c693222d25d2', 'B', 'Publication bias', false, 1),
  ('f022e8d1-5a6a-5beb-9226-4335952148a9', 'bc5faa17-b0e0-5a4e-a5ff-c693222d25d2', 'C', 'Confounding', true, 2),
  ('32678cb9-42e5-534c-985a-ae7f9eecebab', 'bc5faa17-b0e0-5a4e-a5ff-c693222d25d2', 'D', 'Observer bias', false, 3),
  ('be3c9bca-ad78-538d-94db-7210f8b02c9d', 'bc5faa17-b0e0-5a4e-a5ff-c693222d25d2', 'E', 'Selection bias', false, 4);

-- Q788
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('aa7f1fd9-27da-5156-a4e6-f70b504390ea', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000030', 'sba', 'A 40 year old woman has had an incisional hernia after a midline laparotomy. It is reducible and painless. What is the MOST important risk factor for incisional hernia?', 'Risk factors for incisional hernia: wound infection, obesity, smoking, diabetes, steroids, malnutrition, and midline incisions. Repair (usually with mesh) if symptomatic.', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v6')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = 'aa7f1fd9-27da-5156-a4e6-f70b504390ea';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('b50014cf-ec4f-518d-9e56-85fd51c260f4', 'aa7f1fd9-27da-5156-a4e6-f70b504390ea', 'A', 'Wound infection', true, 0),
  ('69c4ff9c-90cb-5e55-ad4f-d74dff805d77', 'aa7f1fd9-27da-5156-a4e6-f70b504390ea', 'B', 'Female sex', false, 1),
  ('f718de8a-6a38-51d8-8fa9-12516bd8846f', 'aa7f1fd9-27da-5156-a4e6-f70b504390ea', 'C', 'Transverse incision', false, 2),
  ('342d2723-d2f6-5be4-8d8b-b268960a2f4e', 'aa7f1fd9-27da-5156-a4e6-f70b504390ea', 'D', 'Young age', false, 3),
  ('64fefe0c-23e2-5919-9514-e8dd00cf2f9b', 'aa7f1fd9-27da-5156-a4e6-f70b504390ea', 'E', 'Low BMI', false, 4);

-- Q789
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('7736b96e-f765-54df-8554-2b8fd72cf61c', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000030', 'sba', 'A 50 year old man has had perianal pain and swelling with fever. There is a tender, fluctuant swelling next to the anus. What is the SINGLE most appropriate management?', 'Perianal abscesses need drainage. Up to a third develop fistula-in-ano. Consider Crohn''s disease and diabetes. Antibiotics are only an adjunct.', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v6')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = '7736b96e-f765-54df-8554-2b8fd72cf61c';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('913da6ea-f7ab-5683-940a-6e73da2ebb88', '7736b96e-f765-54df-8554-2b8fd72cf61c', 'A', 'Rubber band ligation', false, 0),
  ('2830ddc9-9d4f-5c39-ae21-bfc9b9945b6d', '7736b96e-f765-54df-8554-2b8fd72cf61c', 'B', 'Topical steroids', false, 1),
  ('fa734608-2aa5-5cac-8e27-09b2c98365d2', '7736b96e-f765-54df-8554-2b8fd72cf61c', 'C', 'Watch and wait', false, 2),
  ('9f2b8eb5-a7dd-5c61-831b-c977532f17ca', '7736b96e-f765-54df-8554-2b8fd72cf61c', 'D', 'Incision and drainage under anaesthetic', true, 3),
  ('f7c0a9ea-e9e2-5a8c-a783-a88fcaf16908', '7736b96e-f765-54df-8554-2b8fd72cf61c', 'E', 'Oral antibiotics alone', false, 4);

-- Q790
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('ee69e41e-87e9-540c-9cee-d1a2d6076b17', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000030', 'sba', 'A 35 year old man has had painful bleeding after passing stool. Examination shows a split in the skin at the posterior midline of the anus. What is the SINGLE most appropriate first-line treatment?', 'Anal fissure: most are posterior midline. Lateral or multiple fissures suggest Crohn''s, TB, HIV or cancer. Botox or lateral internal sphincterotomy for chronic fissures.', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v6')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = 'ee69e41e-87e9-540c-9cee-d1a2d6076b17';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('ae9810c2-d007-53d1-832b-f35d46e3866e', 'ee69e41e-87e9-540c-9cee-d1a2d6076b17', 'A', 'Antibiotics', false, 0),
  ('07d66f35-52ed-58ea-843d-e0f0f763305c', 'ee69e41e-87e9-540c-9cee-d1a2d6076b17', 'B', 'Stool softeners, high-fibre diet and topical GTN or diltiazem', true, 1),
  ('9137b4bd-2a37-528f-bca2-6ebf09fb1d2d', 'ee69e41e-87e9-540c-9cee-d1a2d6076b17', 'C', 'Sphincterotomy first', false, 2),
  ('b3d0c6cf-3ec2-5b5d-8cde-70cf9b0fb1a6', 'ee69e41e-87e9-540c-9cee-d1a2d6076b17', 'D', 'Rubber band ligation', false, 3),
  ('a29ab0ab-c0d6-5465-830b-6c1b58b1ba82', 'ee69e41e-87e9-540c-9cee-d1a2d6076b17', 'E', 'Haemorrhoidectomy', false, 4);

-- Q791
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('74286417-66a6-5e7f-9d0f-49aaab3d98d3', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000030', 'sba', 'A 60 year old man has had a painful, purple, tender lump at the anal margin for 2 days. What is the SINGLE most likely diagnosis?', 'Thrombosed external haemorrhoids are very painful. If seen within 72 hours, excision gives quick relief; after that, conservative management.', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v6')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = '74286417-66a6-5e7f-9d0f-49aaab3d98d3';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('7bcffde4-14ee-5de9-95e4-21bc27199318', '74286417-66a6-5e7f-9d0f-49aaab3d98d3', 'A', 'Rectal prolapse', false, 0),
  ('a69411ac-d7c0-59e0-9474-826bed6a755f', '74286417-66a6-5e7f-9d0f-49aaab3d98d3', 'B', 'Thrombosed external haemorrhoid (perianal haematoma)', true, 1),
  ('173325d2-6a49-5768-ae41-c8dbb0d34d58', '74286417-66a6-5e7f-9d0f-49aaab3d98d3', 'C', 'Anal cancer', false, 2),
  ('7bce3dc0-e873-5ac4-b6e6-acadae5f8639', '74286417-66a6-5e7f-9d0f-49aaab3d98d3', 'D', 'Anal fissure', false, 3),
  ('ea7ee982-0c33-5dac-a546-08824d092018', '74286417-66a6-5e7f-9d0f-49aaab3d98d3', 'E', 'Perianal abscess', false, 4);

-- Q792
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('e1ac15d8-d943-548f-8d2b-28462beac52a', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000032', 'sba', 'A 40 year old woman has had fingers that go white, then blue, then red in the cold. She is otherwise well and has no skin changes. ANA is negative. What is the SINGLE most likely diagnosis?', 'Primary Raynaud''s is common in young women. Keep warm, stop smoking. Nifedipine if severe. Secondary Raynaud''s (older, asymmetric, ulcers) needs investigation for connective tissue disease.', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v6')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = 'e1ac15d8-d943-548f-8d2b-28462beac52a';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('de343e34-8237-5405-8ff7-4090bcb7eec9', 'e1ac15d8-d943-548f-8d2b-28462beac52a', 'A', 'Primary Raynaud''s phenomenon', true, 0),
  ('3f554dc1-95a4-5fd6-b2c8-28fb74082cc4', 'e1ac15d8-d943-548f-8d2b-28462beac52a', 'B', 'SLE', false, 1),
  ('2ad674cf-ed2b-56da-86a5-0e528c9aa456', 'e1ac15d8-d943-548f-8d2b-28462beac52a', 'C', 'Systemic sclerosis', false, 2),
  ('f4b5d0d7-413c-5967-9518-81b58df23b99', 'e1ac15d8-d943-548f-8d2b-28462beac52a', 'D', 'Buerger''s disease', false, 3),
  ('15a20018-2620-58d6-a184-47b56c435f32', 'e1ac15d8-d943-548f-8d2b-28462beac52a', 'E', 'Thoracic outlet syndrome', false, 4);
