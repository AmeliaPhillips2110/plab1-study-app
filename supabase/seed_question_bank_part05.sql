-- =============================================================================
-- PLAB 1 SBA bank import PART 5 (questions 1001–1008 of 1008)
-- Paste AFTER seed_topics_expand.sql + clear_sample_questions.sql
-- Run parts in order: part01 → part02 → …
-- =============================================================================

-- Q1001
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('c2b8ac3e-868a-5917-9f2f-991098cd09e1', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000030', 'sba', 'A 30 year old man has a sudden onset of severe epigastric pain radiating to his back, with vomiting. His serum lipase is raised. His Glasgow-Imrie score is 4 on admission. What does this score indicate?', 'The modified Glasgow-Imrie criteria (PANCREAS: PaO2 under 8 kPa, Age over 55, Neutrophils over 15, Calcium under 2, Renal urea over 16, Enzymes LDH over 600 or AST over 200, Albumin under 32, Sugar over 10) assess severity within 48 hours. A score of 3 or more suggests severe pancreatitis needing HDU or ICU. CT is reserved for diagnostic uncertainty or suspected complications, often at 72 hours.', null, true, false, jsonb_build_object('source', 'plab1-xlsx')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = 'c2b8ac3e-868a-5917-9f2f-991098cd09e1';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('bbadb423-516d-5cd7-bbbe-fb83da917ac7', 'c2b8ac3e-868a-5917-9f2f-991098cd09e1', 'A', 'Severe acute pancreatitis; consider HDU/ICU', true, 0),
  ('7164971d-728d-57ab-b883-ce882a112e67', 'c2b8ac3e-868a-5917-9f2f-991098cd09e1', 'B', 'Chronic pancreatitis', false, 1),
  ('63f82b06-d2a4-5b3c-ac57-1a5ddf7b1671', 'c2b8ac3e-868a-5917-9f2f-991098cd09e1', 'C', 'No prognostic value', false, 2),
  ('2df70c25-95c1-5195-bc3d-6d9ddd6a5d58', 'c2b8ac3e-868a-5917-9f2f-991098cd09e1', 'D', 'Mild pancreatitis; discharge', false, 3),
  ('4b221065-07d9-55cc-b776-bd54725fd644', 'c2b8ac3e-868a-5917-9f2f-991098cd09e1', 'E', 'The patient has cholecystitis', false, 4);

-- Q1002
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('c50fb25e-1587-5e64-9ddf-f28dd5300eb5', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000030', 'sba', 'A 75 year old woman has had worsening central abdominal pain, vomiting and distension for 2 days. An abdominal X-ray shows small bowel obstruction with gas in the biliary tree (pneumobilia) and a calcified mass in the right iliac fossa. Which diagnosis BEST explains the X-ray findings?', 'Gallstone ileus happens when a large gallstone erodes through a cholecystoduodenal fistula and impacts in the terminal ileum. Rigler''s triad is small bowel obstruction, pneumobilia and an ectopic gallstone. It mainly affects older women. Treatment is a laparotomy with enterolithotomy.', null, true, false, jsonb_build_object('source', 'plab1-xlsx')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = 'c50fb25e-1587-5e64-9ddf-f28dd5300eb5';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('67122571-7750-5188-b627-30ce940abd09', 'c50fb25e-1587-5e64-9ddf-f28dd5300eb5', 'A', 'Sigmoid volvulus', false, 0),
  ('17cc1571-b218-5904-98c1-02d35f1acf75', 'c50fb25e-1587-5e64-9ddf-f28dd5300eb5', 'B', 'Strangulated femoral hernia', false, 1),
  ('d88c1063-8ef5-5136-be32-e9a85604dfd2', 'c50fb25e-1587-5e64-9ddf-f28dd5300eb5', 'C', 'Gallstone ileus', true, 2),
  ('b2772a7c-cc2f-5a35-b68e-d63db4b65cf1', 'c50fb25e-1587-5e64-9ddf-f28dd5300eb5', 'D', 'Adhesional obstruction', false, 3),
  ('44918ecb-61da-538c-96cb-a64c5d32c6da', 'c50fb25e-1587-5e64-9ddf-f28dd5300eb5', 'E', 'Colon cancer', false, 4);

-- Q1003
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('1b2427c2-b1d6-5ba1-9e48-8ae13a0cafff', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000030', 'sba', 'A 45 year old woman has a painful, red, swollen area with a punctum on her upper back, with fluctuance. She has a temperature of 37.6°C. What is the SINGLE most appropriate management?', 'An infected epidermoid (sebaceous) cyst that is fluctuant (an abscess) is treated by incision and drainage. Antibiotics are added only for surrounding cellulitis or systemic features. Once settled, complete elective excision (including the cyst wall) prevents recurrence.', null, true, false, jsonb_build_object('source', 'plab1-xlsx')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = '1b2427c2-b1d6-5ba1-9e48-8ae13a0cafff';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('4370bf97-b1b7-5090-9725-4ae54aaebbe0', '1b2427c2-b1d6-5ba1-9e48-8ae13a0cafff', 'A', 'Excision under general anaesthesia immediately', false, 0),
  ('7b622f3d-7d63-520d-b83b-da2f883b10fe', '1b2427c2-b1d6-5ba1-9e48-8ae13a0cafff', 'B', 'Oral antibiotics alone for 6 weeks', false, 1),
  ('bbb6ab1a-e047-5b81-8bec-bea23d37c41c', '1b2427c2-b1d6-5ba1-9e48-8ae13a0cafff', 'C', 'Reassure', false, 2),
  ('33daf00a-30fd-505c-99bb-9f2dac6d68d0', '1b2427c2-b1d6-5ba1-9e48-8ae13a0cafff', 'D', 'Topical steroids', false, 3),
  ('f4c6c371-f610-587e-a611-51ccd0eb9bc4', '1b2427c2-b1d6-5ba1-9e48-8ae13a0cafff', 'E', 'Incision and drainage', true, 4);

-- Q1004
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('e1bd5180-28e8-5155-9012-a504acc1ea24', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000030', 'sba', 'A 28 year old man has had recurrent painful nodules, abscesses and sinus tracts in his armpits and groin for 3 years, with scarring. He smokes and has a BMI of 33 kg/m2. What is the SINGLE most likely diagnosis?', 'Hidradenitis suppurativa is a chronic inflammatory disease of hair follicles in flexural areas (axillae, groin, inframammary). It causes painful nodules, abscesses, sinus tracts and scarring. Risk factors include smoking and obesity. Management includes weight loss, stopping smoking, long-term tetracyclines, biologics (adalimumab) and surgery.', null, true, false, jsonb_build_object('source', 'plab1-xlsx')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = 'e1bd5180-28e8-5155-9012-a504acc1ea24';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('22ba935b-57f7-5b8e-8c12-823653727f7b', 'e1bd5180-28e8-5155-9012-a504acc1ea24', 'A', 'Hidradenitis suppurativa', true, 0),
  ('6517270c-5a39-5370-9ff5-cc8dde9eb34e', 'e1bd5180-28e8-5155-9012-a504acc1ea24', 'B', 'Folliculitis', false, 1),
  ('31642bec-56aa-5771-b19c-e4f1e9c4fec3', 'e1bd5180-28e8-5155-9012-a504acc1ea24', 'C', 'Pilonidal disease', false, 2),
  ('2bf2e3db-8a0d-5ccc-bd0f-1785856ebf09', 'e1bd5180-28e8-5155-9012-a504acc1ea24', 'D', 'Recurrent furunculosis only', false, 3),
  ('ec956120-bb0c-58cc-bc70-209b41e9d8a1', 'e1bd5180-28e8-5155-9012-a504acc1ea24', 'E', 'Crohn''s disease of the skin', false, 4);

-- Q1005
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('8991f448-bde1-5a4c-9a2f-8ea626b42293', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000030', 'sba', 'A 40 year old man has had a burning pain in his upper abdomen 2-3 hours after meals and at night, relieved by eating. Endoscopy shows a duodenal ulcer. CLO test is positive. He has no allergies. What is the SINGLE most appropriate treatment?', 'H. pylori eradication is first-line triple therapy for 7 days: a PPI plus amoxicillin plus clarithromycin or metronidazole (in penicillin allergy, PPI plus clarithromycin plus metronidazole). After treatment, PPI is continued for ulcer healing and eradication is retested with a urea breath test. Duodenal ulcers are strongly associated with H. pylori.', null, true, false, jsonb_build_object('source', 'plab1-xlsx')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = '8991f448-bde1-5a4c-9a2f-8ea626b42293';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('4328c706-83c8-5efb-8baf-faa01e3b0b41', '8991f448-bde1-5a4c-9a2f-8ea626b42293', 'A', 'Antacids only', false, 0),
  ('3362b61c-6079-56b7-8e8d-3d91370db267', '8991f448-bde1-5a4c-9a2f-8ea626b42293', 'B', 'PPI plus amoxicillin plus clarithromycin (or metronidazole) for 7 days', true, 1),
  ('47eb1887-eb57-53ab-aaf8-c429f4d9504b', '8991f448-bde1-5a4c-9a2f-8ea626b42293', 'C', 'PPI alone for 2 weeks', false, 2),
  ('8f3d8da9-58a1-5246-95ce-a325d4397be3', '8991f448-bde1-5a4c-9a2f-8ea626b42293', 'D', 'Surgical vagotomy', false, 3),
  ('28d74798-2496-546c-a0d2-b812e755e3a6', '8991f448-bde1-5a4c-9a2f-8ea626b42293', 'E', 'Ranitidine for 6 months', false, 4);

-- Q1006
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('5ab846b8-74a2-56fd-a22e-ab56b914ddb0', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000030', 'sba', 'A 64 year old man with a 3-month history of dyspepsia has lost 6 kg and has iron deficiency anaemia. An urgent endoscopy shows an ulcerated mass in the gastric antrum. Biopsy confirms adenocarcinoma. What is the SINGLE most important risk factor for this cancer?', 'Gastric adenocarcinoma risk factors include H. pylori, smoking, a high-salt diet, pernicious anaemia (atrophic gastritis), blood group A and a family history (CDH1 mutation). It often presents late. Staging is with CT, with EUS and staging laparoscopy. Treatment is perioperative chemotherapy with gastrectomy if resectable.', null, true, false, jsonb_build_object('source', 'plab1-xlsx')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = '5ab846b8-74a2-56fd-a22e-ab56b914ddb0';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('ecc7f8a6-1931-54bd-aa58-9b260a377e19', '5ab846b8-74a2-56fd-a22e-ab56b914ddb0', 'A', 'Blood group O', false, 0),
  ('a900de5c-16f8-5c3f-bca5-b88d8a59d24d', '5ab846b8-74a2-56fd-a22e-ab56b914ddb0', 'B', 'Vitamin B6 deficiency', false, 1),
  ('02b0351b-fff2-5f0e-b370-e43b08b74770', '5ab846b8-74a2-56fd-a22e-ab56b914ddb0', 'C', 'Gilbert''s syndrome', false, 2),
  ('9485e81c-5e76-52b4-967d-1b94ded77ffb', '5ab846b8-74a2-56fd-a22e-ab56b914ddb0', 'D', 'Helicobacter pylori infection', true, 3),
  ('682fb91a-0d9d-50c7-a806-8ffd36f3d058', '5ab846b8-74a2-56fd-a22e-ab56b914ddb0', 'E', 'Low-salt diet', false, 4);

-- Q1007
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('7988c6f5-64c3-59f1-9700-99bc7479bcab', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000030', 'sba', 'A 70 year old woman has lower abdominal pain for 5 days and is seen in her GP surgery. She feels unwell and has had episodes of shivering. Her temperature is 38.3°C, pulse rate 105 bpm, BP 115/65 mmHg, respiratory rate 24 breaths per minute and oxygen saturation 97% breathing air. There is a tender mass in the left iliac fossa. Which is the most likely diagnosis?', 'Fever, tachycardia, LIF pain and a tender LIF mass in an older woman suggest a complication of diverticulitis, here a diverticular (pericolic) abscess. CT of the abdomen and pelvis confirms it. Management is IV antibiotics and, for larger abscesses, percutaneous drainage.', null, true, false, jsonb_build_object('source', 'plab1-xlsx')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = '7988c6f5-64c3-59f1-9700-99bc7479bcab';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('a1cf7aa8-0299-5054-a06d-5fedccff4f73', '7988c6f5-64c3-59f1-9700-99bc7479bcab', 'A', 'Diverticular abscess', true, 0),
  ('122c7419-dd9d-50a8-b677-b7c687fc7c36', '7988c6f5-64c3-59f1-9700-99bc7479bcab', 'B', 'Incarcerated inguinal hernia', false, 1),
  ('8389a58d-89e3-5677-9afa-7266534b45cf', '7988c6f5-64c3-59f1-9700-99bc7479bcab', 'C', 'Sigmoid carcinoma', false, 2),
  ('0ea382e3-80cd-5b87-8a50-d28f202e4197', '7988c6f5-64c3-59f1-9700-99bc7479bcab', 'D', 'Tubo-ovarian abscess', false, 3),
  ('d26226e7-ce49-525b-ba40-4b633c949dbd', '7988c6f5-64c3-59f1-9700-99bc7479bcab', 'E', 'Uterine fibroid', false, 4);

-- Q1008
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('e2131638-b2d2-5b94-9e8f-3e20fcd2e6d9', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000030', 'sba', 'A 30 year old woman has three episodes of bright red painless rectal bleeding. The blood is on the surface of the stool and she has intermittent mucus on wiping. She has a longstanding constipation with the passage of hard faeces. Which is the most likely diagnosis?', 'Bright red painless bleeding on the surface of the stool, with mucus and a history of constipation, is typical of haemorrhoids. An anal fissure causes severe pain on defecation. Management is fibre, fluids and topical treatments, with rubber band ligation for persistent internal haemorrhoids.', null, true, false, jsonb_build_object('source', 'plab1-xlsx')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = 'e2131638-b2d2-5b94-9e8f-3e20fcd2e6d9';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('54830167-6227-5783-bfc4-6c4753ea7d54', 'e2131638-b2d2-5b94-9e8f-3e20fcd2e6d9', 'A', 'Anal fissure', false, 0),
  ('6d1f461c-65b4-5a96-a558-59ac1d22a22d', 'e2131638-b2d2-5b94-9e8f-3e20fcd2e6d9', 'B', 'Haemorrhoids', true, 1),
  ('c64d413f-ae56-52e2-ab6c-5698c65fae24', 'e2131638-b2d2-5b94-9e8f-3e20fcd2e6d9', 'C', 'Meckel diverticulum', false, 2),
  ('43563eed-3e47-5235-bb00-7d8fe48dedbd', 'e2131638-b2d2-5b94-9e8f-3e20fcd2e6d9', 'D', 'Systemic bleeding disorder', false, 3),
  ('d10cdae5-c0f4-5109-9c24-620059791632', 'e2131638-b2d2-5b94-9e8f-3e20fcd2e6d9', 'E', 'Trauma', false, 4);

