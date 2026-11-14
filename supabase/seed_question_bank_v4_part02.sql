-- =============================================================================
-- PLAB 1 bank v4 part 02: Q201–342 (source plab1-xlsx-v4)
-- Source: PLAB_1_Question_Bank_4.xlsx — additive; does not clear v1/v2/v3
-- Safe to re-run (stable UUIDs).
-- =============================================================================

-- Q201
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('61d21300-03f1-5000-a64b-22be05f2fed7', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000004', 'sba', 'A 45 year old woman had a total thyroidectomy yesterday. She now has perioral tingling, muscle cramps and a positive Chvostek''s sign. What is the SINGLE most likely cause and treatment?', 'Post-thyroidectomy hypocalcaemia is caused by parathyroid damage or devascularisation. Features: perioral tingling, cramps, Chvostek''s and Trousseau''s signs, and QT prolongation. Severe or symptomatic cases need IV calcium gluconate with cardiac monitoring. Also check and correct magnesium.', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v4')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = '61d21300-03f1-5000-a64b-22be05f2fed7';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('160c35a0-e98d-5215-8f7a-425484111d6f', '61d21300-03f1-5000-a64b-22be05f2fed7', 'A', 'Hypocalcaemia from hypoparathyroidism; IV calcium gluconate if severe, then oral calcium and vitamin D (alfacalcidol)', true, 0),
  ('b74637a1-728c-5f83-b9d4-c5b7c5e32d5e', '61d21300-03f1-5000-a64b-22be05f2fed7', 'B', 'Hypokalaemia; potassium', false, 1),
  ('67dae12d-4e9d-52a0-8759-2fe23579a819', '61d21300-03f1-5000-a64b-22be05f2fed7', 'C', 'Thyroid storm; propranolol', false, 2),
  ('1daf82b7-8d06-5b87-966d-2dcc694a1728', '61d21300-03f1-5000-a64b-22be05f2fed7', 'D', 'Hyperventilation; reassurance', false, 3),
  ('277ca1c3-9db8-5fe4-ba45-0f2ff5912456', '61d21300-03f1-5000-a64b-22be05f2fed7', 'E', 'Hypomagnesaemia only; magnesium', false, 4);

-- Q202
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('af75a099-e067-5941-abb8-a76ee377c01c', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000004', 'sba', 'A 60 year old woman has a thyroid nodule. Ultrasound is classified as U4 and FNA shows Thy4 (suspicious of malignancy). What is the SINGLE most appropriate management?', 'Thy4 and Thy5 cytology needs surgical management through a thyroid MDT. Papillary carcinoma is the commonest thyroid cancer and has an excellent prognosis. Follicular carcinoma spreads by blood. Medullary carcinoma (C cells, calcitonin) is associated with MEN2. Anaplastic carcinoma occurs in older people and is aggressive.', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v4')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = 'af75a099-e067-5941-abb8-a76ee377c01c';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('f2ee51f7-60a5-5a82-a94e-b28c16f96ae1', 'af75a099-e067-5941-abb8-a76ee377c01c', 'A', 'Reassure', false, 0),
  ('755d9efe-932b-5e29-a88b-f96ae3f80d30', 'af75a099-e067-5941-abb8-a76ee377c01c', 'B', 'Levothyroxine suppression', false, 1),
  ('26c48a86-d1ed-5d41-af23-57a7e1623630', 'af75a099-e067-5941-abb8-a76ee377c01c', 'C', 'Repeat ultrasound in 2 years', false, 2),
  ('c78d61f6-d818-54c8-bf6f-02e29d84f6a9', 'af75a099-e067-5941-abb8-a76ee377c01c', 'D', 'Radioiodine', false, 3),
  ('8ce78967-a9f2-5132-84eb-d68494d53266', 'af75a099-e067-5941-abb8-a76ee377c01c', 'E', 'Refer for surgery (diagnostic hemithyroidectomy) via the thyroid cancer MDT', true, 4);

-- Q203
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('f6b077d8-24f5-5b09-9b6c-a77c2007246f', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000004', 'sba', 'A 42 year old woman has had recurrent fasting hypoglycaemia episodes with confusion, relieved by eating. During a supervised fast, glucose is 2.0 with high insulin and C-peptide. Sulfonylurea screen is negative. What is the SINGLE most likely diagnosis?', 'Whipple''s triad: symptoms of hypoglycaemia, low glucose, and relief with glucose. Insulinoma causes high insulin and C-peptide during hypoglycaemia. Exogenous insulin causes high insulin with low C-peptide. Sulfonylureas cause high insulin and C-peptide (check a drug screen). Insulinomas are usually benign pancreatic tumours, treated surgically.', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v4')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = 'f6b077d8-24f5-5b09-9b6c-a77c2007246f';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('0e6ce79f-773c-59a2-93b0-37714f84eec4', 'f6b077d8-24f5-5b09-9b6c-a77c2007246f', 'A', 'Liver failure', false, 0),
  ('dfdc869d-d15c-5453-94b4-07d1d43ec13a', 'f6b077d8-24f5-5b09-9b6c-a77c2007246f', 'B', 'Dumping syndrome', false, 1),
  ('4ffc304d-d3f0-5569-922d-4f80d9d51c79', 'f6b077d8-24f5-5b09-9b6c-a77c2007246f', 'C', 'Exogenous insulin administration', false, 2),
  ('8a1e9647-d337-5715-98cb-41a408e50282', 'f6b077d8-24f5-5b09-9b6c-a77c2007246f', 'D', 'Insulinoma', true, 3),
  ('d192b5b3-d9e8-535b-a11c-328a9b05fe49', 'f6b077d8-24f5-5b09-9b6c-a77c2007246f', 'E', 'Addison''s disease', false, 4);

-- Q204
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('a50af8f4-206e-5ff2-b2a2-01181a159aa3', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000004', 'sba', 'A 28 year old woman has been feeling tired, cold and has gained weight. TSH is 1.2 (low-normal) and free T4 is low. She had a postpartum haemorrhage 6 months ago and has not been able to breastfeed. What is the SINGLE most likely diagnosis?', 'Sheehan''s syndrome is pituitary infarction after severe postpartum haemorrhage, causing hypopituitarism: failure of lactation, amenorrhoea, secondary hypothyroidism (low T4 with low or inappropriately normal TSH) and secondary adrenal insufficiency. Replace cortisol before thyroxine to avoid precipitating adrenal crisis.', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v4')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = 'a50af8f4-206e-5ff2-b2a2-01181a159aa3';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('7559a440-89f3-5440-90e7-5cdd28092dbf', 'a50af8f4-206e-5ff2-b2a2-01181a159aa3', 'A', 'Postpartum thyroiditis', false, 0),
  ('5c3cf03c-374f-59ea-b9d7-bab88ac42444', 'a50af8f4-206e-5ff2-b2a2-01181a159aa3', 'B', 'Primary hypothyroidism', false, 1),
  ('03ee1134-dbd6-5597-98d5-c0c7daad403f', 'a50af8f4-206e-5ff2-b2a2-01181a159aa3', 'C', 'Sheehan''s syndrome (postpartum pituitary necrosis with hypopituitarism)', true, 2),
  ('99d6ede7-005a-5e29-8722-dcd483dcb7ee', 'a50af8f4-206e-5ff2-b2a2-01181a159aa3', 'D', 'Postnatal depression', false, 3),
  ('35137ef0-b7d8-5d2f-b808-5c664ebe9e5d', 'a50af8f4-206e-5ff2-b2a2-01181a159aa3', 'E', 'Anaemia only', false, 4);

-- Q205
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('0c07e0b8-3f7c-5b14-9677-0287d281bb1b', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000006', 'sba', 'A 82 year old woman on warfarin fell and hit her head 3 hours ago. She has a GCS of 15 and no symptoms. What is the SINGLE most appropriate management according to NICE?', 'NICE NG232: people on anticoagulants (other than aspirin monotherapy) with a head injury should have a CT head within 8 hours, even if there are no other indications. Immediate CT (within 1 hour) for GCS below 13 on arrival, below 15 at 2 hours, suspected skull fracture, basal skull fracture signs, seizure, focal deficit or more than 1 episode of vomiting.', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v4')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = '0c07e0b8-3f7c-5b14-9677-0287d281bb1b';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('b95691cd-c0ce-5c7f-bce7-40143a1339bf', '0c07e0b8-3f7c-5b14-9677-0287d281bb1b', 'A', 'Skull X-ray', false, 0),
  ('06dfb2ff-244c-50e8-a578-d6913b011fbb', '0c07e0b8-3f7c-5b14-9677-0287d281bb1b', 'B', 'MRI in 2 weeks', false, 1),
  ('25fd21ee-1c5b-540d-adf4-1cd481b3b105', '0c07e0b8-3f7c-5b14-9677-0287d281bb1b', 'C', 'Discharge with head injury advice', false, 2),
  ('8399998d-649b-5088-afc6-967a2db92b0b', '0c07e0b8-3f7c-5b14-9677-0287d281bb1b', 'D', 'Admit for observation without imaging', false, 3),
  ('17ad7248-bf38-5cc8-9b88-30c5f82bf01f', '0c07e0b8-3f7c-5b14-9677-0287d281bb1b', 'E', 'CT head within 8 hours of the injury (anticoagulated patients need CT even without other risk factors)', true, 4);

-- Q206
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('baf26952-c128-58ab-b6cb-19346af2ce5e', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000006', 'sba', 'A 17 year old girl has had a seizure at a party after drinking alcohol and staying up all night. She had jerks of her arms on several mornings recently. She recovers fully. What is the SINGLE most appropriate advice about driving?', 'DVLA (group 1): after a first unprovoked seizure, stop driving for 6 months (if no abnormality on investigation); with an epilepsy diagnosis, 12 months seizure-free. Morning myoclonus suggests juvenile myoclonic epilepsy. Advise avoiding sleep deprivation and excess alcohol.', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v4')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = 'baf26952-c128-58ab-b6cb-19346af2ce5e';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('e6c26347-a5e4-5c3c-9013-ab21ee3e762b', 'baf26952-c128-58ab-b6cb-19346af2ce5e', 'A', 'Only stop driving at night', false, 0),
  ('d5328828-fd27-56ca-8fb7-7e409737026a', 'baf26952-c128-58ab-b6cb-19346af2ce5e', 'B', 'She must stop driving permanently', false, 1),
  ('d496f3f0-2ccc-583c-93bc-8ca8614439b3', 'baf26952-c128-58ab-b6cb-19346af2ce5e', 'C', 'She must not drive and must inform the DVLA; a first unprovoked seizure usually means 6 months off driving (12 months if epilepsy is diagnosed)', true, 2),
  ('cdd3778e-cc87-54f4-9f40-d5a92aca3f55', 'baf26952-c128-58ab-b6cb-19346af2ce5e', 'D', 'She can drive immediately', false, 3),
  ('870fef69-5a42-5fee-82c9-da72a54d978c', 'baf26952-c128-58ab-b6cb-19346af2ce5e', 'E', 'No restriction if alcohol-related', false, 4);

-- Q207
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('322d5486-c677-5780-b768-a9766a89d3ff', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000006', 'sba', 'A 35 year old woman with epilepsy is planning a pregnancy. She takes lamotrigine and her seizures are controlled. What is the SINGLE most appropriate advice?', 'Women with epilepsy taking antiepileptic drugs should take high-dose folic acid (5 mg) before conception and in the first trimester. Lamotrigine and levetiracetam are the safest options. Lamotrigine levels fall in pregnancy, so monitor and adjust. Valproate is highly teratogenic and must not be used in women of childbearing potential unless the pregnancy prevention programme is in place.', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v4')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = '322d5486-c677-5780-b768-a9766a89d3ff';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('3e4a58fb-0f58-5590-b015-addd5a620d94', '322d5486-c677-5780-b768-a9766a89d3ff', 'A', 'Stop all antiepileptics before pregnancy', false, 0),
  ('dde19d12-cf5e-5e25-b585-6d32ac8d8a3d', '322d5486-c677-5780-b768-a9766a89d3ff', 'B', 'Folic acid 400 micrograms only', false, 1),
  ('4b1fcd36-0d34-5bae-9f0b-31717f730ee9', '322d5486-c677-5780-b768-a9766a89d3ff', 'C', 'Continue lamotrigine (monitor levels as they fall in pregnancy) and take folic acid 5 mg daily before conception', true, 2),
  ('df1373cd-8661-521c-ade6-079c2c38f113', '322d5486-c677-5780-b768-a9766a89d3ff', 'D', 'Switch to sodium valproate', false, 3),
  ('c083f852-21e1-5326-b9fa-0e12a5381d31', '322d5486-c677-5780-b768-a9766a89d3ff', 'E', 'Halve the dose', false, 4);

-- Q208
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('0d17a6d9-2169-5874-b5a6-76dac32f7c31', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000006', 'sba', 'A 28 year old man has had a tonic-clonic seizure lasting 7 minutes in the emergency department. IV access is in place. What is the SINGLE most appropriate first drug?', 'Convulsive status epilepticus (seizure lasting 5 minutes or more, or repeated seizures without recovery): first-line IV lorazepam (or buccal midazolam or rectal diazepam if no IV access), repeated once. Second-line: IV levetiracetam, phenytoin or sodium valproate. Third-line: general anaesthesia (thiopental or propofol) in ICU. Check glucose and give thiamine if alcohol is suspected.', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v4')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = '0d17a6d9-2169-5874-b5a6-76dac32f7c31';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('685ba6f4-b5b9-5e07-8df3-16bc0a5ac24c', '0d17a6d9-2169-5874-b5a6-76dac32f7c31', 'A', 'Oral diazepam', false, 0),
  ('a8625a16-e9a3-563c-8fac-b4d28a5379a3', '0d17a6d9-2169-5874-b5a6-76dac32f7c31', 'B', 'IM haloperidol', false, 1),
  ('4e66a613-2130-57e0-95df-20a03a8997fb', '0d17a6d9-2169-5874-b5a6-76dac32f7c31', 'C', 'IV phenytoin first', false, 2),
  ('014da3e7-15d7-567f-be8b-6052ae4ad8a1', '0d17a6d9-2169-5874-b5a6-76dac32f7c31', 'D', 'IV lorazepam 4 mg (repeat once after 5-10 minutes if needed)', true, 3),
  ('17ea2cae-83a8-5380-bff7-93ecc49fae82', '0d17a6d9-2169-5874-b5a6-76dac32f7c31', 'E', 'IV levetiracetam first', false, 4);

-- Q209
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('93d6a512-be8c-5a5a-8138-b09e7b77faeb', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000006', 'sba', 'A 50 year old woman has had numbness and tingling in both feet, unsteady gait worse in the dark, and absent ankle jerks with extensor plantars. She has a past history of gastrectomy. What is the SINGLE most likely diagnosis?', 'Subacute combined degeneration affects the dorsal columns (loss of vibration and proprioception, positive Romberg''s) and corticospinal tracts (upgoing plantars), with peripheral neuropathy (absent ankle jerks). Causes: B12 deficiency (pernicious anaemia, gastrectomy, metformin, nitrous oxide abuse). Treat with IM hydroxocobalamin.', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v4')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = '93d6a512-be8c-5a5a-8138-b09e7b77faeb';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('e4c52810-82cb-5af9-b966-2c2e8f2f02da', '93d6a512-be8c-5a5a-8138-b09e7b77faeb', 'A', 'Multiple sclerosis', false, 0),
  ('6ad1cd76-953d-56ab-b74b-3667058f6bea', '93d6a512-be8c-5a5a-8138-b09e7b77faeb', 'B', 'Subacute combined degeneration of the cord (vitamin B12 deficiency)', true, 1),
  ('37072ddf-e955-50c1-9354-846400579f84', '93d6a512-be8c-5a5a-8138-b09e7b77faeb', 'C', 'Guillain-Barré syndrome', false, 2),
  ('ba452c14-f0ae-521d-a41a-c5fe305fdb66', '93d6a512-be8c-5a5a-8138-b09e7b77faeb', 'D', 'Motor neurone disease', false, 3),
  ('c3d6fce5-9215-5c38-b241-cfa7ae09c4cd', '93d6a512-be8c-5a5a-8138-b09e7b77faeb', 'E', 'Diabetic neuropathy', false, 4);

-- Q210
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('b8a85326-a0cd-5ddf-811c-b47ac2705654', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000006', 'sba', 'A 23 year old man who uses recreational nitrous oxide heavily has had numbness and weakness in his legs and unsteadiness for 2 weeks. What is the SINGLE most likely cause?', 'Nitrous oxide inactivates vitamin B12, causing myeloneuropathy even with normal serum B12 (check homocysteine and methylmalonic acid). It is increasingly common in young people. Treatment: stop nitrous oxide and give IM hydroxocobalamin. Recovery depends on early treatment.', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v4')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = 'b8a85326-a0cd-5ddf-811c-b47ac2705654';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('dcc76c56-0455-5da0-af8f-fef4ae6379e5', 'b8a85326-a0cd-5ddf-811c-b47ac2705654', 'A', 'Functional vitamin B12 deficiency causing myelopathy (subacute combined degeneration)', true, 0),
  ('f1e7ca1c-80d9-5ed6-b7eb-3a7bca396238', 'b8a85326-a0cd-5ddf-811c-b47ac2705654', 'B', 'Spinal cord compression from a tumour', false, 1),
  ('818f538d-e2f6-51e9-8a6d-9375b7189306', 'b8a85326-a0cd-5ddf-811c-b47ac2705654', 'C', 'Alcohol neuropathy', false, 2),
  ('ef355033-6f8b-53b4-900c-4c0f73fe414f', 'b8a85326-a0cd-5ddf-811c-b47ac2705654', 'D', 'Guillain-Barré syndrome', false, 3),
  ('5dee4c97-a474-5df8-ae47-0b82d1a0e3aa', 'b8a85326-a0cd-5ddf-811c-b47ac2705654', 'E', 'Conversion disorder', false, 4);

-- Q211
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('b9ba71e0-45fc-5e70-9948-d9826c062706', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000006', 'sba', 'A 60 year old woman has had progressive difficulty walking, with shuffling steps, reduced arm swing, and a resting tremor of her left hand that started a year ago. What is the SINGLE most appropriate management?', 'NICE NG71: refer people with suspected Parkinson''s disease quickly and untreated to a specialist. Diagnosis is clinical (bradykinesia with tremor, rigidity or postural instability). First-line treatment: levodopa if motor symptoms affect quality of life. Dopamine agonists and MAO-B inhibitors are alternatives when symptoms are milder. Watch for impulse control disorders with dopamine agonists.', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v4')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = 'b9ba71e0-45fc-5e70-9948-d9826c062706';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('bfa0288c-e557-5607-a5bd-fac661ed4548', 'b9ba71e0-45fc-5e70-9948-d9826c062706', 'A', 'Refer to a specialist (neurologist or geriatrician) before starting any Parkinson''s treatment', true, 0),
  ('6ffee4fb-33ac-59d0-b0dc-4bfcb9c3e34c', 'b9ba71e0-45fc-5e70-9948-d9826c062706', 'B', 'Start levodopa in primary care immediately', false, 1),
  ('48161386-0892-53a4-8b82-1c04b39109b6', 'b9ba71e0-45fc-5e70-9948-d9826c062706', 'C', 'Start haloperidol', false, 2),
  ('d61b50df-9756-5a44-b40d-ac59149917c1', 'b9ba71e0-45fc-5e70-9948-d9826c062706', 'D', 'MRI brain and discharge', false, 3),
  ('3ac5fd50-05fa-542d-84ef-58580123b319', 'b9ba71e0-45fc-5e70-9948-d9826c062706', 'E', 'Start propranolol', false, 4);

-- Q212
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('c84c46eb-2b97-5dc2-a181-746b25b0ca2d', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000006', 'sba', 'A 70 year old man with Parkinson''s disease on levodopa for 6 years has involuntary writhing movements at peak dose. What is the SINGLE most likely cause?', 'Long-term levodopa causes motor complications: wearing-off, on-off fluctuations and peak-dose dyskinesias. Options: adjust dose timing and size, amantadine for dyskinesias, adding a dopamine agonist, MAO-B or COMT inhibitor, and advanced therapies (deep brain stimulation, apomorphine, levodopa-carbidopa intestinal gel).', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v4')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = 'c84c46eb-2b97-5dc2-a181-746b25b0ca2d';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('01aadb40-8d5c-5224-a000-f07b4fa7f609', 'c84c46eb-2b97-5dc2-a181-746b25b0ca2d', 'A', 'Huntington''s disease', false, 0),
  ('6c848daa-b4a3-5bce-9a8f-a614a6b9fc31', 'c84c46eb-2b97-5dc2-a181-746b25b0ca2d', 'B', 'Tardive dyskinesia', false, 1),
  ('24b333c0-67c4-51b3-8a33-b6e04fc1169c', 'c84c46eb-2b97-5dc2-a181-746b25b0ca2d', 'C', 'Drug-induced parkinsonism', false, 2),
  ('b6533e33-4849-5365-833b-3ac65d21e888', 'c84c46eb-2b97-5dc2-a181-746b25b0ca2d', 'D', 'Essential tremor', false, 3),
  ('1a7d4b28-28e5-5a03-8e3d-a3a459ad51e7', 'c84c46eb-2b97-5dc2-a181-746b25b0ca2d', 'E', 'Levodopa-induced dyskinesia', true, 4);

-- Q213
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('4f375920-7709-57d7-8b49-8b2cfad5b849', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000006', 'sba', 'A 55 year old woman has had slurred speech and difficulty swallowing, with tongue fasciculations and wasting. Jaw jerk is brisk. Sensation is normal. What is the SINGLE most likely diagnosis?', 'Bulbar-onset MND causes dysarthria and dysphagia with mixed upper motor neurone (brisk jaw jerk, spastic tongue, emotional lability) and lower motor neurone (tongue wasting and fasciculations) signs. It has a worse prognosis than limb onset. Early speech therapy, nutrition (gastrostomy) and respiratory support.', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v4')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = '4f375920-7709-57d7-8b49-8b2cfad5b849';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('cf5762c2-c796-51fb-bae3-d8ad2b7b6e5f', '4f375920-7709-57d7-8b49-8b2cfad5b849', 'A', 'Myasthenia gravis', false, 0),
  ('578f1006-1693-5508-ae76-4e61fce14683', '4f375920-7709-57d7-8b49-8b2cfad5b849', 'B', 'Stroke', false, 1),
  ('a31217ca-2e70-57f6-8dc9-a89f7ed68cfc', '4f375920-7709-57d7-8b49-8b2cfad5b849', 'C', 'Parkinson''s disease', false, 2),
  ('8f7bb4b1-d471-5c9e-bf35-547f7c23c649', '4f375920-7709-57d7-8b49-8b2cfad5b849', 'D', 'Multiple sclerosis', false, 3),
  ('81661739-a2fe-5b96-ba13-95eb1d5ae6c1', '4f375920-7709-57d7-8b49-8b2cfad5b849', 'E', 'Motor neurone disease with bulbar onset', true, 4);

-- Q214
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('309543b8-ad43-5c15-b2ec-3ba3836501eb', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000006', 'sba', 'A 32 year old woman has had double vision and drooping of her left eyelid. The left eye is ''down and out'', and the pupil is dilated and unreactive. She has a severe headache. What is the SINGLE most likely cause?', 'A painful third nerve palsy with a dilated pupil is a surgical third nerve palsy (compressive), most commonly a posterior communicating artery aneurysm. This is an emergency: CT angiography. A pupil-sparing third nerve palsy is usually microvascular (diabetes, hypertension), as the pupillomotor fibres lie on the outside of the nerve.', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v4')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = '309543b8-ad43-5c15-b2ec-3ba3836501eb';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('4158e52d-0b54-5747-bb77-f7f99169810c', '309543b8-ad43-5c15-b2ec-3ba3836501eb', 'A', 'Posterior communicating artery aneurysm compressing the oculomotor nerve', true, 0),
  ('694c419a-5df5-58e4-bb9e-cfab11218337', '309543b8-ad43-5c15-b2ec-3ba3836501eb', 'B', 'Myasthenia gravis', false, 1),
  ('71af22cf-e5f4-5cb7-85d2-d2fd5d41c971', '309543b8-ad43-5c15-b2ec-3ba3836501eb', 'C', 'Sixth nerve palsy', false, 2),
  ('828689f4-fbd1-5b33-ae82-ccbb64144a99', '309543b8-ad43-5c15-b2ec-3ba3836501eb', 'D', 'Diabetic third nerve palsy', false, 3),
  ('f56556bb-f328-55a8-ac57-bdf47bbac283', '309543b8-ad43-5c15-b2ec-3ba3836501eb', 'E', 'Horner''s syndrome', false, 4);

-- Q215
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('3eab8fa5-9cad-5c0d-95c6-fbcdc10afa8a', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000006', 'sba', 'A 65 year old man has a drooping left eyelid, a small left pupil and absent sweating on the left side of his face. He has had a cough and weight loss. What is the SINGLE most likely cause?', 'Horner''s syndrome: ptosis, miosis and anhidrosis (with central and pre-ganglionic lesions). Causes: Pancoast tumour (also shoulder pain and T1 weakness from brachial plexus involvement), carotid dissection, lateral medullary syndrome, syringomyelia and neck surgery. CT chest is needed in a smoker.', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v4')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = '3eab8fa5-9cad-5c0d-95c6-fbcdc10afa8a';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('b17d855d-368b-5455-bab1-70d3bd52c36e', '3eab8fa5-9cad-5c0d-95c6-fbcdc10afa8a', 'A', 'Third nerve palsy', false, 0),
  ('d45ae27b-1e77-5831-9dcb-7cda50c4b521', '3eab8fa5-9cad-5c0d-95c6-fbcdc10afa8a', 'B', 'Cluster headache', false, 1),
  ('2a0f0c27-bc90-5490-96a2-e4eb6f91e75c', '3eab8fa5-9cad-5c0d-95c6-fbcdc10afa8a', 'C', 'Pancoast tumour (apical lung cancer) causing Horner''s syndrome', true, 2),
  ('ea3a1e07-27e2-507b-93cd-396a80fad2a9', '3eab8fa5-9cad-5c0d-95c6-fbcdc10afa8a', 'D', 'Myasthenia gravis', false, 3),
  ('19b6788d-273b-5776-84f0-ce8ae3eac2f5', '3eab8fa5-9cad-5c0d-95c6-fbcdc10afa8a', 'E', 'Carotid dissection', false, 4);

-- Q216
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('630a257d-4bd1-52dc-9e93-3681d64741df', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000006', 'sba', 'A 45 year old man has had pain and weakness of his right shoulder and arm after a viral illness. He has winging of the scapula and weak shoulder abduction. Sensation is mildly reduced. Neck movements do not provoke the pain. What is the SINGLE most likely diagnosis?', 'Neuralgic amyotrophy causes acute severe shoulder pain, followed by patchy weakness and wasting of shoulder girdle muscles as pain settles, often after infection, vaccination or surgery. Most recover over months to years. Management: analgesia and physiotherapy.', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v4')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = '630a257d-4bd1-52dc-9e93-3681d64741df';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('4a917fde-c6f4-578d-b33e-447b5716d607', '630a257d-4bd1-52dc-9e93-3681d64741df', 'A', 'Cervical radiculopathy', false, 0),
  ('311cb7b8-7005-52c8-ad39-26c457852d8d', '630a257d-4bd1-52dc-9e93-3681d64741df', 'B', 'Neuralgic amyotrophy (Parsonage-Turner syndrome)', true, 1),
  ('b4383f23-50a1-5070-bd91-b35a9fb7da6d', '630a257d-4bd1-52dc-9e93-3681d64741df', 'C', 'Rotator cuff tear', false, 2),
  ('1abcb334-1105-5943-8145-97c4988523f6', '630a257d-4bd1-52dc-9e93-3681d64741df', 'D', 'Motor neurone disease', false, 3),
  ('ed19579f-beb2-5740-8add-c0b3269d487b', '630a257d-4bd1-52dc-9e93-3681d64741df', 'E', 'Frozen shoulder', false, 4);

-- Q217
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('0301b2a4-dc99-5239-8419-3568fd568b73', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000006', 'sba', 'A 30 year old woman has had pain and paraesthesia in the lateral thigh, worse with standing. She is 32 weeks pregnant. Power and reflexes are normal. What is the SINGLE most likely diagnosis?', 'Meralgia paraesthetica is entrapment of the lateral femoral cutaneous nerve under the inguinal ligament, causing numbness and burning in the anterolateral thigh with no motor loss. Risk factors: obesity, pregnancy, tight belts and diabetes. Usually self-limiting.', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v4')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = '0301b2a4-dc99-5239-8419-3568fd568b73';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('847afa9e-24c9-586f-b052-1d5bc7b8410d', '0301b2a4-dc99-5239-8419-3568fd568b73', 'A', 'L4 radiculopathy', false, 0),
  ('83877558-0223-5fcb-a1c9-8dc6ef875a06', '0301b2a4-dc99-5239-8419-3568fd568b73', 'B', 'Sciatica', false, 1),
  ('34b8ec7a-03b1-59c8-bfcd-d4c98998169f', '0301b2a4-dc99-5239-8419-3568fd568b73', 'C', 'Meralgia paraesthetica (lateral cutaneous nerve of thigh entrapment)', true, 2),
  ('846796f4-856a-5e82-978d-a5fb5bd11b88', '0301b2a4-dc99-5239-8419-3568fd568b73', 'D', 'DVT', false, 3),
  ('69ba5ede-66ff-5492-a0b1-72a1eac3d505', '0301b2a4-dc99-5239-8419-3568fd568b73', 'E', 'Femoral nerve palsy', false, 4);

-- Q218
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('ab9072d3-7550-5dec-b158-35f7375cfcf2', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000006', 'sba', 'A 28 year old woman has had a 2-day history of pain behind her left eye and blurred vision. Three years ago she had numbness in her legs that resolved. MRI shows multiple periventricular white matter lesions. What is the SINGLE most likely diagnosis?', 'MS diagnosis needs dissemination in time and space (McDonald criteria), with episodes affecting different parts of the CNS and characteristic MRI lesions (periventricular, juxtacortical, infratentorial, spinal cord). CSF oligoclonal bands can substitute for dissemination in time. Treatment: steroids for relapses and disease-modifying therapies.', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v4')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = 'ab9072d3-7550-5dec-b158-35f7375cfcf2';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('d356dd60-eedd-5c21-a5c0-9912b9d804d2', 'ab9072d3-7550-5dec-b158-35f7375cfcf2', 'A', 'Migraine', false, 0),
  ('abd9116a-7f7a-57a2-b7ef-71787e3a4b93', 'ab9072d3-7550-5dec-b158-35f7375cfcf2', 'B', 'Multiple sclerosis', true, 1),
  ('7de6128a-9018-5696-ad78-30809e550738', 'ab9072d3-7550-5dec-b158-35f7375cfcf2', 'C', 'Vitamin B12 deficiency', false, 2),
  ('4b58357d-7d19-5dfc-840b-f0ee860ca7bf', 'ab9072d3-7550-5dec-b158-35f7375cfcf2', 'D', 'Neuromyelitis optica only', false, 3),
  ('cc9caafd-93e0-5eea-8260-a2de2a834b5b', 'ab9072d3-7550-5dec-b158-35f7375cfcf2', 'E', 'Sarcoidosis', false, 4);

-- Q219
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('320af091-0274-5c56-8361-8bca3b827faf', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000008', 'sba', 'A 39 year old woman is 12 weeks pregnant. Her combined screening test shows a high chance of trisomy 21 (1 in 80). What is the SINGLE most appropriate next option to offer?', 'The NHS combined test (nuchal translucency, beta-hCG, PAPP-A and maternal age) is offered at 10-14 weeks. With a higher chance result (1 in 150 or higher), offer NIPT (cell-free fetal DNA) or diagnostic testing. Diagnostic testing carries a small miscarriage risk (about 0.5%). Quadruple test is used from 14 to 20 weeks.', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v4')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = '320af091-0274-5c56-8361-8bca3b827faf';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('2efcc319-1b48-5c90-ad54-c2dbf524cb90', '320af091-0274-5c56-8361-8bca3b827faf', 'A', 'Termination of pregnancy immediately', false, 0),
  ('d055a609-03c0-5445-a502-30f903cddb39', '320af091-0274-5c56-8361-8bca3b827faf', 'B', 'Non-invasive prenatal testing (NIPT) or diagnostic testing (CVS or amniocentesis)', true, 1),
  ('2d6a4971-624b-5d01-b13f-cc46a0ebf69e', '320af091-0274-5c56-8361-8bca3b827faf', 'C', 'Repeat combined test', false, 2),
  ('f6e8a5ee-116a-569b-8eca-9ad52371ba15', '320af091-0274-5c56-8361-8bca3b827faf', 'D', 'Reassure', false, 3),
  ('32f6a8bd-f4c3-53e8-8cd1-3ad508b07262', '320af091-0274-5c56-8361-8bca3b827faf', 'E', 'Detailed scan at 30 weeks only', false, 4);

-- Q220
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('660b4b74-f2a5-5dbd-b4e8-fb7d1e682e71', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000008', 'sba', 'A 27 year old woman is 28 weeks pregnant and Rhesus D negative. Her partner is Rhesus D positive. What is the SINGLE most appropriate routine management?', 'RhD-negative women receive routine antenatal anti-D (single dose at 28 weeks or two doses at 28 and 34 weeks), unless fetal genotyping shows an RhD-negative baby. Give anti-D within 72 hours of sensitising events (bleeding after 12 weeks, abdominal trauma, invasive procedures, ECV) and after delivery of an RhD-positive baby (Kleihauer test to calculate dose).', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v4')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = '660b4b74-f2a5-5dbd-b4e8-fb7d1e682e71';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('f726669c-e8f0-5346-b0c5-58ecc9ff1a86', '660b4b74-f2a5-5dbd-b4e8-fb7d1e682e71', 'A', 'Weekly anti-D injections', false, 0),
  ('3775eeda-4707-5d7e-9762-1f870fc5e7ab', '660b4b74-f2a5-5dbd-b4e8-fb7d1e682e71', 'B', 'No anti-D needed', false, 1),
  ('70792f30-6162-5b31-9050-3eea9a4518d4', '660b4b74-f2a5-5dbd-b4e8-fb7d1e682e71', 'C', 'Plasma exchange', false, 2),
  ('96986dee-7456-55ca-8d69-fb571f8c8afa', '660b4b74-f2a5-5dbd-b4e8-fb7d1e682e71', 'D', 'Anti-D only after delivery', false, 3),
  ('342d49c7-ea1b-525a-9a14-ce25b8ec745f', '660b4b74-f2a5-5dbd-b4e8-fb7d1e682e71', 'E', 'Routine antenatal anti-D prophylaxis (e.g. at 28 weeks), plus anti-D after any sensitising event and after delivery if the baby is RhD positive', true, 4);

-- Q221
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('d3e5a2ba-1e51-5bad-b52a-518094a8c42f', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000008', 'sba', 'A 24 year old woman is 36 weeks pregnant. Her baby is in a breech presentation on ultrasound. She is otherwise well. What is the SINGLE most appropriate next step?', 'Breech presentation at term: offer ECV (success about 50%). Contraindications: placenta praevia, recent antepartum haemorrhage, ruptured membranes, abnormal CTG and multiple pregnancy. If ECV fails, discuss planned caesarean section versus vaginal breech birth. Give anti-D after ECV if RhD negative.', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v4')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = 'd3e5a2ba-1e51-5bad-b52a-518094a8c42f';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('bc42c3e3-8b83-5d76-b03a-84a049f9b72e', 'd3e5a2ba-1e51-5bad-b52a-518094a8c42f', 'A', 'Offer external cephalic version (ECV) from 36 weeks (nulliparous) or 37 weeks (multiparous)', true, 0),
  ('57e85351-61b1-5d62-bbb3-8fb129e6fc72', 'd3e5a2ba-1e51-5bad-b52a-518094a8c42f', 'B', 'Induction of labour at 37 weeks', false, 1),
  ('99c0ea39-b064-5dd9-a647-e52db456c60f', 'd3e5a2ba-1e51-5bad-b52a-518094a8c42f', 'C', 'Elective caesarean section at 36 weeks', false, 2),
  ('dd81b4e4-3d80-5726-991b-ac2f5eec8c1d', 'd3e5a2ba-1e51-5bad-b52a-518094a8c42f', 'D', 'Advise vaginal breech delivery in all', false, 3),
  ('0f5995dd-6c4e-52c6-9ff3-a3f880b48a23', 'd3e5a2ba-1e51-5bad-b52a-518094a8c42f', 'E', 'Do nothing', false, 4);

-- Q222
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('82df3818-360d-51a8-9f15-ca0be28a2f79', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000008', 'sba', 'A 23 year old woman at 33 weeks has a gush of clear fluid from her vagina. Speculum confirms pooling of amniotic fluid. She is not in labour and has no signs of infection. What is the SINGLE most appropriate management?', 'Preterm prelabour rupture of membranes (PPROM): give oral erythromycin (avoid co-amoxiclav because of the risk of necrotising enterocolitis), steroids, and magnesium sulfate if delivery is likely before 30 weeks. Monitor for infection (fever, tachycardia, tenderness, offensive liquor). Plan delivery at 37 weeks if no complications.', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v4')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = '82df3818-360d-51a8-9f15-ca0be28a2f79';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('b426db75-22a9-5340-9217-2c21441d765c', '82df3818-360d-51a8-9f15-ca0be28a2f79', 'A', 'Amoxicillin-clavulanate', false, 0),
  ('fde570df-b851-50a4-b719-9addcff4111a', '82df3818-360d-51a8-9f15-ca0be28a2f79', 'B', 'Discharge without treatment', false, 1),
  ('328e36f6-e454-561d-aa23-c4beff27ced7', '82df3818-360d-51a8-9f15-ca0be28a2f79', 'C', 'Tocolysis for 2 weeks', false, 2),
  ('86d414a2-38ce-5436-a117-5308c026c540', '82df3818-360d-51a8-9f15-ca0be28a2f79', 'D', 'Oral erythromycin for 10 days, corticosteroids, and monitoring for chorioamnionitis', true, 3),
  ('e9f21a2a-37f0-5f61-b3a5-33c88d0e602b', '82df3818-360d-51a8-9f15-ca0be28a2f79', 'E', 'Immediate caesarean section', false, 4);

-- Q223
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('c1a9eca5-a0fc-5dbe-ac6e-06c73b3dbf19', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000008', 'sba', 'A 36 year old woman is 24 weeks pregnant. She smokes and her baby is measuring small for gestational age. Umbilical artery Doppler shows absent end-diastolic flow. What is the MAIN concern?', 'Fetal growth restriction is often caused by placental insufficiency (smoking, pre-eclampsia, hypertension). Umbilical artery Doppler with absent or reversed end-diastolic flow indicates severe placental dysfunction. Management: close fetal monitoring (Doppler, CTG), steroids and planned delivery timing. Aspirin from 12 weeks reduces pre-eclampsia risk in high-risk women.', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v4')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = 'c1a9eca5-a0fc-5dbe-ac6e-06c73b3dbf19';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('d8340870-38dc-5506-b423-b3fbf526bec5', 'c1a9eca5-a0fc-5dbe-ac6e-06c73b3dbf19', 'A', 'Polyhydramnios only', false, 0),
  ('77ee4c3b-5730-53d9-a77f-6a20e141ca75', 'c1a9eca5-a0fc-5dbe-ac6e-06c73b3dbf19', 'B', 'Placental insufficiency with fetal growth restriction at risk of hypoxia and stillbirth', true, 1),
  ('ef22dd27-8034-5480-aecd-cad1b840327b', 'c1a9eca5-a0fc-5dbe-ac6e-06c73b3dbf19', 'C', 'Macrosomia', false, 2),
  ('7323e799-4254-5f92-8039-8f7dd276cd4f', 'c1a9eca5-a0fc-5dbe-ac6e-06c73b3dbf19', 'D', 'Twin pregnancy', false, 3),
  ('93a40de2-9b4a-5d40-97fa-3d40966d0f3b', 'c1a9eca5-a0fc-5dbe-ac6e-06c73b3dbf19', 'E', 'Normal variation', false, 4);

-- Q224
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('b4c6acde-a08a-5a8a-a674-698c9556f788', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000008', 'sba', 'A 38 year old woman with obesity (BMI 36) is 12 weeks pregnant. She has chronic hypertension. What is the SINGLE most appropriate preventive medicine?', 'NICE: aspirin 75-150 mg from 12 weeks for women with 1 high-risk factor (chronic hypertension, previous hypertensive disease in pregnancy, CKD, autoimmune disease, diabetes) or 2 or more moderate risk factors (first pregnancy, age 40 or over, BMI 35 or more, family history, interval over 10 years, multiple pregnancy). Also offer high-dose folic acid if BMI is 30 or more.', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v4')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = 'b4c6acde-a08a-5a8a-a674-698c9556f788';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('b5c8841a-73ad-53f8-b788-3313d20c03bd', 'b4c6acde-a08a-5a8a-a674-698c9556f788', 'A', 'No medicine needed', false, 0),
  ('a833f8bd-75ae-502c-bdaf-5863cd883536', 'b4c6acde-a08a-5a8a-a674-698c9556f788', 'B', 'Aspirin 75-150 mg daily from 12 weeks until birth (high risk of pre-eclampsia)', true, 1),
  ('93249775-5825-5683-9651-d526fade36dd', 'b4c6acde-a08a-5a8a-a674-698c9556f788', 'C', 'Metformin', false, 2),
  ('37d7438b-6a84-5aae-a417-216c18a58f7e', 'b4c6acde-a08a-5a8a-a674-698c9556f788', 'D', 'Warfarin', false, 3),
  ('2a1977d4-7ff0-5533-8f9b-37b9ec13b712', 'b4c6acde-a08a-5a8a-a674-698c9556f788', 'E', 'Magnesium sulfate', false, 4);

-- Q225
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('1e661fe6-2fc2-5702-8b3a-e0cf44c14d96', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000008', 'sba', 'A 24 year old woman has had amenorrhoea for 6 months. She is a long-distance runner with a BMI of 17. Pregnancy test is negative. LH, FSH and oestradiol are low. What is the SINGLE most likely diagnosis?', 'Hypothalamic amenorrhoea follows low energy availability (excessive exercise, low weight, eating disorders, stress), causing low GnRH, LH, FSH and oestrogen. Risks: osteoporosis. Management: increase calorie intake and reduce exercise. Premature ovarian insufficiency has high FSH. PCOS usually has normal oestrogen.', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v4')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = '1e661fe6-2fc2-5702-8b3a-e0cf44c14d96';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('6e5ae1a4-819d-593e-a3a6-5fad7109d803', '1e661fe6-2fc2-5702-8b3a-e0cf44c14d96', 'A', 'Prolactinoma', false, 0),
  ('f16f1c9c-4490-5d35-8482-57b7d4c475f2', '1e661fe6-2fc2-5702-8b3a-e0cf44c14d96', 'B', 'Functional hypothalamic amenorrhoea', true, 1),
  ('77c5d33c-3ca8-5e8b-94bd-6617dc3664de', '1e661fe6-2fc2-5702-8b3a-e0cf44c14d96', 'C', 'Premature ovarian insufficiency', false, 2),
  ('d0b86ae5-a9fb-51fc-b16c-77eea7f3aff8', '1e661fe6-2fc2-5702-8b3a-e0cf44c14d96', 'D', 'Asherman''s syndrome', false, 3),
  ('a2419ec5-435c-5ebe-8b2f-0210b9dc7c1c', '1e661fe6-2fc2-5702-8b3a-e0cf44c14d96', 'E', 'Polycystic ovary syndrome', false, 4);

-- Q226
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('3ac55a54-c5b6-57dc-bc7c-c96903b02507', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000008', 'sba', 'A 32 year old woman has had secondary amenorrhoea after a dilatation and curettage for retained products. She has cyclical pelvic pain. Hormone tests are normal. What is the SINGLE most likely diagnosis?', 'Asherman''s syndrome is intrauterine adhesions after uterine instrumentation or infection, causing amenorrhoea or hypomenorrhoea and infertility. Hormone levels are normal. Diagnosis and treatment: hysteroscopy with adhesiolysis.', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v4')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = '3ac55a54-c5b6-57dc-bc7c-c96903b02507';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('8fee2e27-6232-5c94-a207-bae74f8e1a2c', '3ac55a54-c5b6-57dc-bc7c-c96903b02507', 'A', 'PCOS', false, 0),
  ('a5c6e194-d2f3-5323-b93d-adcee242db11', '3ac55a54-c5b6-57dc-bc7c-c96903b02507', 'B', 'Asherman''s syndrome (intrauterine adhesions)', true, 1),
  ('a929ad7b-c93d-5680-b538-e57abb7c2adc', '3ac55a54-c5b6-57dc-bc7c-c96903b02507', 'C', 'Premature ovarian insufficiency', false, 2),
  ('c64845b2-3d75-5001-b320-f09778e810e0', '3ac55a54-c5b6-57dc-bc7c-c96903b02507', 'D', 'Sheehan''s syndrome', false, 3),
  ('21a5160a-c16d-51dd-8486-4b7bf4e54b55', '3ac55a54-c5b6-57dc-bc7c-c96903b02507', 'E', 'Prolactinoma', false, 4);

-- Q227
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('bc8e5523-137a-53ec-9ae8-b8f8db54c1df', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000008', 'sba', 'A 45 year old woman has had heavy, prolonged periods and pressure symptoms with urinary frequency. Examination shows an enlarged irregular uterus. Ultrasound shows multiple fibroids, the largest 6 cm. She has completed her family. What is the SINGLE most appropriate definitive treatment if medical treatment fails?', 'Fibroids (leiomyomas) cause heavy bleeding, pressure symptoms and subfertility. Options: tranexamic acid or NSAIDs, GnRH analogues (short-term, before surgery), relugolix combination therapy, uterine artery embolisation, myomectomy (preserving fertility) or hysterectomy. The LNG-IUS and ablation are less suitable when fibroids distort the cavity or are over 3 cm.', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v4')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = 'bc8e5523-137a-53ec-9ae8-b8f8db54c1df';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('5a98199e-7dfa-5c6e-80d4-908b1467d427', 'bc8e5523-137a-53ec-9ae8-b8f8db54c1df', 'A', 'Hysterectomy (or uterine artery embolisation/myomectomy if uterus-preserving preferred)', true, 0),
  ('f56c9687-6e25-5fff-8089-f351034eb3b5', 'bc8e5523-137a-53ec-9ae8-b8f8db54c1df', 'B', 'LNG-IUS for large distorting fibroids', false, 1),
  ('ef5506ea-9300-5188-a618-9dc7f3334b4c', 'bc8e5523-137a-53ec-9ae8-b8f8db54c1df', 'C', 'Oral iron alone', false, 2),
  ('058b2713-b45f-5f11-ac72-7d79efcaef18', 'bc8e5523-137a-53ec-9ae8-b8f8db54c1df', 'D', 'Long-term tranexamic acid only', false, 3),
  ('17494c05-174a-5b68-b362-08daedb5fa91', 'bc8e5523-137a-53ec-9ae8-b8f8db54c1df', 'E', 'Endometrial ablation for large fibroids', false, 4);

-- Q228
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('a3112687-a713-5141-b72f-6cc31fbeb05f', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000008', 'sba', 'A 34 year old woman is 20 weeks pregnant. She has had a sudden severe pain in an existing fibroid with low-grade fever and localised tenderness. What is the SINGLE most likely diagnosis?', 'Red (carneous) degeneration happens when a fibroid outgrows its blood supply, typically in the second trimester of pregnancy. It causes pain, tenderness and low-grade fever. Management is conservative with analgesia (paracetamol, opioids) and rest.', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v4')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = 'a3112687-a713-5141-b72f-6cc31fbeb05f';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('e640d0a0-5c28-549b-9640-a257339ddc57', 'a3112687-a713-5141-b72f-6cc31fbeb05f', 'A', 'Preterm labour', false, 0),
  ('35d771b6-6bf7-5255-acbb-bacf474e650f', 'a3112687-a713-5141-b72f-6cc31fbeb05f', 'B', 'Placental abruption', false, 1),
  ('f992d46b-cd4b-5180-bc79-2e5f0472fefe', 'a3112687-a713-5141-b72f-6cc31fbeb05f', 'C', 'Red degeneration of the fibroid', true, 2),
  ('a08b9005-75fd-56c2-9704-8c9113d9c7a0', 'a3112687-a713-5141-b72f-6cc31fbeb05f', 'D', 'Ovarian torsion', false, 3),
  ('afa0b0fd-6c84-592c-935e-5d19683c65db', 'a3112687-a713-5141-b72f-6cc31fbeb05f', 'E', 'Appendicitis', false, 4);

-- Q229
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('6c649a2e-941e-5b3d-ac4a-22627b019457', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000008', 'sba', 'A 23 year old woman has had sudden severe left iliac fossa pain with nausea and vomiting while exercising. She has a known 6 cm ovarian cyst. Pregnancy test is negative. What is the SINGLE most likely diagnosis and management?', 'Ovarian torsion presents with sudden severe unilateral pain, nausea and vomiting, often with an ovarian mass (cyst over 5 cm or dermoid). Doppler ultrasound may show reduced flow but cannot exclude torsion. Diagnostic laparoscopy and detorsion should not be delayed, to save the ovary.', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v4')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = '6c649a2e-941e-5b3d-ac4a-22627b019457';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('0d86fc59-8f49-531f-a2c1-79971df42447', '6c649a2e-941e-5b3d-ac4a-22627b019457', 'A', 'Renal colic; analgesia', false, 0),
  ('98a77727-c7ef-5917-a101-7e1de10cb28f', '6c649a2e-941e-5b3d-ac4a-22627b019457', 'B', 'Ovarian torsion; urgent laparoscopy for detorsion', true, 1),
  ('b8b17783-72e0-5c36-85e8-2c6bd25e2d98', '6c649a2e-941e-5b3d-ac4a-22627b019457', 'C', 'Ruptured ectopic; methotrexate', false, 2),
  ('1445f32c-f487-5ebf-abc0-df192e9aab13', '6c649a2e-941e-5b3d-ac4a-22627b019457', 'D', 'Appendicitis; antibiotics', false, 3),
  ('94a8c598-70de-5f3f-b64b-ce91d3a526ff', '6c649a2e-941e-5b3d-ac4a-22627b019457', 'E', 'Mittelschmerz; reassurance', false, 4);

-- Q230
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('eb5d611b-3c89-51fd-9ea8-ac3f771b7f6a', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000009', 'sba', 'A 7 day old baby has a temperature of 38.4°C. She is feeding a little less. What is the SINGLE most appropriate management?', 'Any infant under 3 months with a temperature of 38°C or more is high risk (red). Infants under 1 month with fever need a full septic screen (blood culture, FBC, CRP, urine, LP) and IV antibiotics (cefotaxime or ceftriaxone plus amoxicillin to cover Listeria). Group B streptococcus and E. coli are common causes of neonatal sepsis.', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v4')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = 'eb5d611b-3c89-51fd-9ea8-ac3f771b7f6a';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('e0703e1e-1449-53cf-9cba-e13c2341a2ba', 'eb5d611b-3c89-51fd-9ea8-ac3f771b7f6a', 'A', 'Admit for a full septic screen (including LP) and start IV antibiotics (cefotaxime plus amoxicillin)', true, 0),
  ('52e42ae6-d88f-5db5-98c1-2b82b77b2115', 'eb5d611b-3c89-51fd-9ea8-ac3f771b7f6a', 'B', 'Oral antibiotics at home', false, 1),
  ('890df942-b76d-5410-8826-3fa79a17ccb0', 'eb5d611b-3c89-51fd-9ea8-ac3f771b7f6a', 'C', 'Viral swab and discharge', false, 2),
  ('de981ef5-daf1-510d-a9a6-6e9ae5dd2173', 'eb5d611b-3c89-51fd-9ea8-ac3f771b7f6a', 'D', 'Paracetamol and review tomorrow', false, 3),
  ('d7874217-dd14-515a-bf37-a81206734bc6', 'eb5d611b-3c89-51fd-9ea8-ac3f771b7f6a', 'E', 'Observe for 48 hours at home', false, 4);

-- Q231
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('6224b6b2-c1c9-5b66-baa5-a5fa8936f06f', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000009', 'sba', 'A 3 year old boy has a non-blanching rash on his trunk and legs, fever and lethargy. Capillary refill is 4 seconds. What is the SINGLE most important immediate action?', 'A non-blanching rash with fever in an unwell child is meningococcal disease until proven otherwise. Give IV/IO ceftriaxone without delay (in primary care: IM or IV benzylpenicillin before transfer). Resuscitate with fluid boluses. Avoid LP if signs of raised ICP or shock. Notify public health; close contacts get prophylaxis (ciprofloxacin).', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v4')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = '6224b6b2-c1c9-5b66-baa5-a5fa8936f06f';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('740e6dd8-cb4a-5dda-8cf7-58fe511713be', '6224b6b2-c1c9-5b66-baa5-a5fa8936f06f', 'A', 'Discharge with paracetamol', false, 0),
  ('230c85aa-d511-5982-a93b-d141aa3e4da7', '6224b6b2-c1c9-5b66-baa5-a5fa8936f06f', 'B', 'Oral penicillin', false, 1),
  ('60e52618-0733-5561-9395-a1cc73b28632', '6224b6b2-c1c9-5b66-baa5-a5fa8936f06f', 'C', 'Give IV (or IO) ceftriaxone immediately and resuscitate (suspected meningococcal septicaemia)', true, 2),
  ('e326920d-b3e9-5539-b325-b5d21bfc2e81', '6224b6b2-c1c9-5b66-baa5-a5fa8936f06f', 'D', 'Lumbar puncture first', false, 3),
  ('fe3745d3-c4b4-5429-90a1-894b47913bd0', '6224b6b2-c1c9-5b66-baa5-a5fa8936f06f', 'E', 'Wait for blood cultures before antibiotics', false, 4);

-- Q232
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('12e72962-a7bb-53b9-a5ab-ad3dee33d22b', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000009', 'sba', 'A 12 month old girl is not yet sitting without support, cannot pick up small objects and does not babble. She was born at term. What is the SINGLE most appropriate action?', 'Red flags: not sitting unsupported at 9 months (12 months is a definite red flag), not walking by 18 months, no babble by 12 months, no words by 18 months, loss of skills at any age. Refer to a child development team for assessment of global delay, including hearing, vision, genetics and metabolic tests as indicated.', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v4')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = '12e72962-a7bb-53b9-a5ab-ad3dee33d22b';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('097fc9c5-bd5d-5a5a-aa88-d1ab92ccda88', '12e72962-a7bb-53b9-a5ab-ad3dee33d22b', 'A', 'Start physiotherapy at home', false, 0),
  ('efcb0d91-41cb-59ad-9077-4a494cd37926', '12e72962-a7bb-53b9-a5ab-ad3dee33d22b', 'B', 'Check hearing only', false, 1),
  ('2f2da566-fe79-5211-a5f9-d321145c3232', '12e72962-a7bb-53b9-a5ab-ad3dee33d22b', 'C', 'No action', false, 2),
  ('e7f379df-77de-5c75-9b56-e4638697ac53', '12e72962-a7bb-53b9-a5ab-ad3dee33d22b', 'D', 'Reassure and review at 2 years', false, 3),
  ('91df80bf-4122-5d0a-a1b8-251ab4337d35', '12e72962-a7bb-53b9-a5ab-ad3dee33d22b', 'E', 'Refer for developmental assessment (global developmental delay)', true, 4);

-- Q233
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('c2219d5f-5f6e-5a65-8ba1-72b41fc89581', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000009', 'sba', 'A 2 year old boy has not started using any words. He makes eye contact and plays well with others. Hearing has not been tested. What is the SINGLE most important first investigation?', 'Speech delay needs a hearing test first, as hearing loss (such as glue ear) is a common treatable cause. Then consider speech and language therapy, autism assessment and developmental review. Social engagement and play make autism less likely.', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v4')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = 'c2219d5f-5f6e-5a65-8ba1-72b41fc89581';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('95ec3272-4f5d-51f9-b7f3-a69a1f16e633', 'c2219d5f-5f6e-5a65-8ba1-72b41fc89581', 'A', 'Genetic testing', false, 0),
  ('94c4ae52-c82c-5242-b4cd-8c82ecbb2f31', 'c2219d5f-5f6e-5a65-8ba1-72b41fc89581', 'B', 'Autism assessment first', false, 1),
  ('f71eafb5-f352-5ecb-bf48-5475ee3040fa', 'c2219d5f-5f6e-5a65-8ba1-72b41fc89581', 'C', 'EEG', false, 2),
  ('172a95d8-52a5-54a0-b529-b0fd5799fbe0', 'c2219d5f-5f6e-5a65-8ba1-72b41fc89581', 'D', 'MRI brain', false, 3),
  ('ceed5fc8-b745-5659-a1f8-48944c6f4669', 'c2219d5f-5f6e-5a65-8ba1-72b41fc89581', 'E', 'Formal hearing assessment (audiology)', true, 4);

-- Q234
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('f1ac2f05-e420-51cf-8c81-05511e8ffbaf', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000009', 'sba', 'A 3 year old girl has limited eye contact, does not respond to her name, lines up toys repetitively and has no pretend play. She becomes very distressed by changes in routine. What is the SINGLE most appropriate next step?', 'Autism spectrum disorder features: persistent difficulties in social communication and interaction, plus restricted, repetitive behaviours and interests (including sensory sensitivities), starting in early childhood. Refer to the local autism team for multidisciplinary assessment. Interventions are psychosocial and educational. Medications only for comorbid conditions.', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v4')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = 'f1ac2f05-e420-51cf-8c81-05511e8ffbaf';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('f695979e-19e6-51be-a05f-2739331d2517', 'f1ac2f05-e420-51cf-8c81-05511e8ffbaf', 'A', 'Refer for speech therapy only', false, 0),
  ('82e34a9e-a5de-5a25-a398-6da1648848a1', 'f1ac2f05-e420-51cf-8c81-05511e8ffbaf', 'B', 'Prescribe risperidone', false, 1),
  ('b5e50324-e4b7-5db4-8cd4-9535bb590633', 'f1ac2f05-e420-51cf-8c81-05511e8ffbaf', 'C', 'Start methylphenidate', false, 2),
  ('6f6e254c-6547-5da8-acc4-3f9e6bcadee3', 'f1ac2f05-e420-51cf-8c81-05511e8ffbaf', 'D', 'Reassure that she will grow out of it', false, 3),
  ('a1cda973-e1da-54e0-9b00-5fda8eaf7e52', 'f1ac2f05-e420-51cf-8c81-05511e8ffbaf', 'E', 'Refer to a specialist autism assessment team', true, 4);

-- Q235
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('56e8cac5-8c30-5859-b576-e70bd2e7c929', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000009', 'sba', 'A 8 year old boy is easily distracted, impulsive, fidgety and disruptive at home and at school for over a year. His school reports affect his learning. What is the SINGLE most appropriate next step?', 'ADHD needs symptoms of inattention and/or hyperactivity-impulsivity in more than one setting for at least 6 months, causing impairment. Diagnosis is by a specialist. First-line in children is environmental modification and parent training, with methylphenidate if symptoms persist and cause significant impairment. Monitor height, weight, BP and heart rate on stimulants.', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v4')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = '56e8cac5-8c30-5859-b576-e70bd2e7c929';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('aed16553-dade-5733-8f10-c0c0af0ea3be', '56e8cac5-8c30-5859-b576-e70bd2e7c929', 'A', 'Start methylphenidate in primary care', false, 0),
  ('6a5e54b5-2d1f-5f10-8c6f-7dd8b0ee6904', '56e8cac5-8c30-5859-b576-e70bd2e7c929', 'B', 'Antipsychotic medication', false, 1),
  ('04cbf431-1a41-57df-b43d-96dd3cdebe5d', '56e8cac5-8c30-5859-b576-e70bd2e7c929', 'C', 'Prescribe melatonin', false, 2),
  ('3165a00b-e12e-5319-8615-8d5d49cf3b1f', '56e8cac5-8c30-5859-b576-e70bd2e7c929', 'D', 'Reassure that boys grow out of it', false, 3),
  ('d336f285-facc-560c-b492-5c18d7edc771', '56e8cac5-8c30-5859-b576-e70bd2e7c929', 'E', 'Refer to a specialist (child psychiatrist or paediatrician) for ADHD assessment; consider parent training programmes', true, 4);

-- Q236
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('25aef352-baf1-5f93-9360-440ff9f17883', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000009', 'sba', 'A 4 year old boy has had a limp for 2 days and pain in his thigh. He has a fever of 39.2°C, refuses to bear weight and has a CRP of 120. What is the SINGLE most likely diagnosis?', 'Kocher criteria for septic arthritis in children: fever over 38.5°C, non-weight-bearing, ESR over 40 (or CRP over 20), WCC over 12. More criteria mean higher likelihood. Septic arthritis is an emergency: ultrasound, joint aspiration and washout, and IV antibiotics. Kingella kingae is common in under-4s.', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v4')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = '25aef352-baf1-5f93-9360-440ff9f17883';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('2991020d-2456-5783-b6e8-1f93d3d64bc5', '25aef352-baf1-5f93-9360-440ff9f17883', 'A', 'Growing pains', false, 0),
  ('44b5e458-e552-5471-9e0f-af7f22d2900b', '25aef352-baf1-5f93-9360-440ff9f17883', 'B', 'Septic arthritis of the hip', true, 1),
  ('31201b6a-d6b0-57f5-82a2-097af0b2badf', '25aef352-baf1-5f93-9360-440ff9f17883', 'C', 'Slipped upper femoral epiphysis', false, 2),
  ('26ec0b75-5c9f-5f26-a28a-e90e07f74ec1', '25aef352-baf1-5f93-9360-440ff9f17883', 'D', 'Perthes disease', false, 3),
  ('b8aa37d6-fb13-57db-aae8-645fe4e1c14a', '25aef352-baf1-5f93-9360-440ff9f17883', 'E', 'Transient synovitis', false, 4);

-- Q237
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('0b9bcf51-ee7d-5c2c-bf89-e9167f6cf4e5', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000009', 'sba', 'A 7 year old boy has had a painful swollen shin for 1 week with fever. He is limping. X-ray is normal. MRI shows marrow oedema in the tibial metaphysis. What is the SINGLE most likely diagnosis?', 'Acute haematogenous osteomyelitis in children often affects the metaphyses of long bones. S. aureus is the commonest cause. X-ray changes appear after 10-14 days, so MRI is more sensitive early. Treatment: IV antibiotics, then oral, and surgery for abscess. Exclude malignancy if atypical.', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v4')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = '0b9bcf51-ee7d-5c2c-bf89-e9167f6cf4e5';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('1711e6c4-4bf5-5c76-8f1c-bf3a14930574', '0b9bcf51-ee7d-5c2c-bf89-e9167f6cf4e5', 'A', 'Growing pains', false, 0),
  ('2b2bbdd8-5967-5bb3-8a21-8598c456057e', '0b9bcf51-ee7d-5c2c-bf89-e9167f6cf4e5', 'B', 'Acute osteomyelitis', true, 1),
  ('41f81ac4-e44a-5218-918d-8699efb2071b', '0b9bcf51-ee7d-5c2c-bf89-e9167f6cf4e5', 'C', 'Osgood-Schlatter disease', false, 2),
  ('2c394ac9-d530-55c9-937e-a9058a40ddb7', '0b9bcf51-ee7d-5c2c-bf89-e9167f6cf4e5', 'D', 'Stress fracture', false, 3),
  ('9c6e4626-3528-548c-8c4c-b44f14e0a071', '0b9bcf51-ee7d-5c2c-bf89-e9167f6cf4e5', 'E', 'Ewing''s sarcoma', false, 4);

-- Q238
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('d3aaf755-dd11-56bc-9f9f-b3587e53dc61', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000009', 'sba', 'A 13 year old boy has had pain and swelling below his knee over the tibial tuberosity, worse after football. He is otherwise well. What is the SINGLE most likely diagnosis?', 'Osgood-Schlatter disease is a traction apophysitis of the tibial tuberosity in active adolescents during growth spurts. It causes pain and a bony prominence. Management: rest, ice, analgesia and activity modification. It resolves when growth finishes.', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v4')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = 'd3aaf755-dd11-56bc-9f9f-b3587e53dc61';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('3119c6f5-94df-5a4f-ab70-2a0b9e3761bd', 'd3aaf755-dd11-56bc-9f9f-b3587e53dc61', 'A', 'Osgood-Schlatter disease', true, 0),
  ('8a347b07-f974-57c6-9632-b2c7d6224f24', 'd3aaf755-dd11-56bc-9f9f-b3587e53dc61', 'B', 'Patellar tendon rupture', false, 1),
  ('d782f97a-7699-502c-9c9c-43bf5460a686', 'd3aaf755-dd11-56bc-9f9f-b3587e53dc61', 'C', 'Osteosarcoma', false, 2),
  ('4b9028d7-a876-50cd-93ab-04d0d25f3964', 'd3aaf755-dd11-56bc-9f9f-b3587e53dc61', 'D', 'Septic arthritis', false, 3),
  ('41f59239-d27e-5ef2-9a54-dc93c452b8bb', 'd3aaf755-dd11-56bc-9f9f-b3587e53dc61', 'E', 'Perthes disease', false, 4);

-- Q239
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('9d2fe169-92cc-58dd-a01f-0c805e63fb0a', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000009', 'sba', 'A 14 year old boy has had a painful swelling of his distal femur for 6 weeks, worse at night. X-ray shows a ''sunburst'' pattern with periosteal elevation (Codman''s triangle). What is the SINGLE most likely diagnosis?', 'Osteosarcoma is the commonest primary bone cancer in adolescents, often around the knee (distal femur, proximal tibia). X-ray: sunburst pattern and Codman''s triangle. Unexplained bone pain or swelling in a child or young person needs a very urgent X-ray (within 48 hours). Treatment: chemotherapy and limb-sparing surgery.', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v4')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = '9d2fe169-92cc-58dd-a01f-0c805e63fb0a';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('84840a10-b95d-5b91-9540-8cc293889117', '9d2fe169-92cc-58dd-a01f-0c805e63fb0a', 'A', 'Osteoid osteoma', false, 0),
  ('f7060659-a2d0-5e10-96fc-636fb696621d', '9d2fe169-92cc-58dd-a01f-0c805e63fb0a', 'B', 'Ewing''s sarcoma', false, 1),
  ('215bb73d-3e2b-5420-840b-c8d8c4177dca', '9d2fe169-92cc-58dd-a01f-0c805e63fb0a', 'C', 'Osteosarcoma', true, 2),
  ('fbeadde5-6454-5a19-839a-df4b6bc6c862', '9d2fe169-92cc-58dd-a01f-0c805e63fb0a', 'D', 'Chondrosarcoma', false, 3),
  ('05eda916-2239-5d76-b4f1-e2e9d257da68', '9d2fe169-92cc-58dd-a01f-0c805e63fb0a', 'E', 'Osteomyelitis', false, 4);

-- Q240
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('8ca2cc23-093a-521a-a844-7c6aed6357c1', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000009', 'sba', 'A 3 year old boy has an abdominal mass on the right that does not cross the midline. He is otherwise well. Urine shows microscopic haematuria. What is the SINGLE most likely diagnosis?', 'Wilms tumour presents in children aged 1-5 with a painless abdominal mass that usually does not cross the midline, sometimes with haematuria or hypertension. Associations: WAGR, Beckwith-Wiedemann and Denys-Drash. Neuroblastoma often crosses the midline, with raised urinary catecholamines (VMA, HVA) and systemic symptoms. Refer very urgently.', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v4')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = '8ca2cc23-093a-521a-a844-7c6aed6357c1';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('ab3c1081-55ee-5d80-a195-61dcf8a58aaf', '8ca2cc23-093a-521a-a844-7c6aed6357c1', 'A', 'Neuroblastoma', false, 0),
  ('3d20b8e8-1488-5e6f-bcf4-d8662613cf3e', '8ca2cc23-093a-521a-a844-7c6aed6357c1', 'B', 'Hydronephrosis', false, 1),
  ('68a00ee7-edaa-51d3-a7c2-f45e8e35a789', '8ca2cc23-093a-521a-a844-7c6aed6357c1', 'C', 'Hepatoblastoma', false, 2),
  ('d19fb256-f761-5aa4-9496-295708b033ef', '8ca2cc23-093a-521a-a844-7c6aed6357c1', 'D', 'Polycystic kidney', false, 3),
  ('14aea0e7-423f-5385-9fe2-cc97f8947962', '8ca2cc23-093a-521a-a844-7c6aed6357c1', 'E', 'Wilms tumour (nephroblastoma)', true, 4);

-- Q241
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('38ce9715-4ee9-574e-868b-c3377aabd3d8', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000009', 'sba', 'A 4 year old girl has had a squint and a white pupil seen in a photograph of her left eye. What is the SINGLE most appropriate action?', 'Leukocoria (absent red reflex) in a child suggests retinoblastoma until proven otherwise, as well as cataract. Refer urgently (within 2 weeks). Heritable retinoblastoma (RB1 germline mutation) is often bilateral, with increased risk of osteosarcoma. Check the red reflex at newborn and 6-8 week checks.', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v4')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = '38ce9715-4ee9-574e-868b-c3377aabd3d8';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('0efcd731-36ee-540b-89f6-e6ec3a7489b4', '38ce9715-4ee9-574e-868b-c3377aabd3d8', 'A', 'Antibiotic drops', false, 0),
  ('254ecfb9-62c6-5f71-a1e7-65397800804f', '38ce9715-4ee9-574e-868b-c3377aabd3d8', 'B', 'Urgent ophthalmology referral (suspected retinoblastoma)', true, 1),
  ('76723f3f-d55b-57cd-9837-f0b196a3be01', '38ce9715-4ee9-574e-868b-c3377aabd3d8', 'C', 'Patch the right eye', false, 2),
  ('8b0c3cf6-b838-56a2-be6f-edd3327b4acf', '38ce9715-4ee9-574e-868b-c3377aabd3d8', 'D', 'Optician appointment', false, 3),
  ('45f490f3-10b3-56da-8b87-29feec7adc6e', '38ce9715-4ee9-574e-868b-c3377aabd3d8', 'E', 'Reassure and review in 6 months', false, 4);

-- Q242
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('8ca4f466-733b-5f72-afb5-14c47687db08', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000009', 'sba', 'A 6 year old boy wets the bed most nights. He is dry during the day. He is otherwise well, and urine dip is normal. What is the SINGLE most appropriate first-line treatment if simple measures fail?', 'Nocturnal enuresis is common under 5 and usually not treated before then. Advice: adequate daytime fluids, toileting before bed, reward systems for agreed behaviours (not dry nights). Alarms are first-line for children over 5 with motivation. Desmopressin for short-term control (sleepovers) or when alarms are unsuitable. Exclude constipation, UTI, diabetes and daytime symptoms.', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v4')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = '8ca4f466-733b-5f72-afb5-14c47687db08';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('5f81cf99-9ceb-56b2-8c93-3b7885822e7f', '8ca4f466-733b-5f72-afb5-14c47687db08', 'A', 'An enuresis alarm (desmopressin if an alarm is unsuitable or rapid short-term control needed)', true, 0),
  ('9eede47f-b1da-5b83-a280-33c3f980324a', '8ca4f466-733b-5f72-afb5-14c47687db08', 'B', 'Punishment for wet nights', false, 1),
  ('24e317e2-1d19-5fb8-97d9-2497bdb4cd95', '8ca4f466-733b-5f72-afb5-14c47687db08', 'C', 'Imipramine first-line', false, 2),
  ('efb73200-73e3-5938-9829-999a58063a72', '8ca4f466-733b-5f72-afb5-14c47687db08', 'D', 'Oxybutynin first-line', false, 3),
  ('b529df4f-6832-572f-9682-931fed573757', '8ca4f466-733b-5f72-afb5-14c47687db08', 'E', 'Fluid restriction to below 500 mL a day', false, 4);

-- Q243
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('77530835-1987-55a5-a4af-618c5a69b9fc', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000009', 'sba', 'A 3 year old boy has had constipation for 3 months, with hard painful stools and soiling. He is growing well, and there are no red flags. What is the SINGLE most appropriate first-line treatment?', 'NICE CG99: for childhood idiopathic constipation with impaction (overflow soiling), offer a macrogol disimpaction regimen, then maintenance. Add a stimulant laxative if needed. Continue for several weeks after regular bowel habit is established, then wean slowly. Red flags: onset from birth, delayed meconium, ribbon stools, abnormal neurology or failure to thrive.', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v4')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = '77530835-1987-55a5-a4af-618c5a69b9fc';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('d5045ce1-c780-5b3b-af4a-630977ae37c5', '77530835-1987-55a5-a4af-618c5a69b9fc', 'A', 'Fibre supplements alone', false, 0),
  ('4f347e0f-8c13-5fef-b2fa-630b1fa6aa6c', '77530835-1987-55a5-a4af-618c5a69b9fc', 'B', 'Fluid restriction', false, 1),
  ('9969b256-c55e-5104-b12f-07811fc8e579', '77530835-1987-55a5-a4af-618c5a69b9fc', 'C', 'Enemas first-line', false, 2),
  ('57adaf42-b9ef-5702-8d39-9da8613a6d70', '77530835-1987-55a5-a4af-618c5a69b9fc', 'D', 'Macrogol (polyethylene glycol) disimpaction regimen, then maintenance', true, 3),
  ('69f90368-ee89-5ed7-a6aa-7ff7eac4de67', '77530835-1987-55a5-a4af-618c5a69b9fc', 'E', 'Lactulose only', false, 4);

-- Q244
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('0ca34375-784e-50dc-b463-bfcdc6e43ab2', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000009', 'sba', 'A 6 week old baby has frequent vomiting after feeds and is irritable, arching her back. She is gaining weight well. What is the SINGLE most appropriate initial management?', 'Gastro-oesophageal reflux is common in infants, peaking at 4 months and usually resolving by 1 year. If the baby is thriving, reassure. For distress, review feeding, try smaller, more frequent feeds, and thickened formula or alginates. PPIs only for unexplained feeding difficulty or faltering growth. Red flags: bilious or projectile vomiting, blood, faltering growth.', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v4')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = '0ca34375-784e-50dc-b463-bfcdc6e43ab2';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('4a0aad7b-2331-5ef8-a0ef-4a8226fcb984', '0ca34375-784e-50dc-b463-bfcdc6e43ab2', 'A', 'PPI immediately', false, 0),
  ('268a6e17-10ad-50a1-9b37-59183c2e4f2b', '0ca34375-784e-50dc-b463-bfcdc6e43ab2', 'B', 'Upper GI contrast study', false, 1),
  ('81504a48-bacf-5fa0-ba5b-8bd918f00030', '0ca34375-784e-50dc-b463-bfcdc6e43ab2', 'C', 'Admit for investigation', false, 2),
  ('b62a103d-bfd7-53d4-8467-2e6989a2e849', '0ca34375-784e-50dc-b463-bfcdc6e43ab2', 'D', 'Stop feeding for 24 hours', false, 3),
  ('c776020c-7fb3-5668-a13b-a2580d9b4a1c', '0ca34375-784e-50dc-b463-bfcdc6e43ab2', 'E', 'Reassurance and feeding advice (smaller, more frequent feeds; thickeners for formula-fed babies)', true, 4);

-- Q245
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('e46fdbb7-9783-5888-b3c4-0e76de5d2c25', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000009', 'sba', 'A 4 month old formula-fed baby has had eczema, vomiting, diarrhoea and blood in his stools since starting formula. What is the SINGLE most likely diagnosis and management?', 'Cow''s milk protein allergy can be IgE-mediated (rapid urticaria, angioedema) or non-IgE-mediated (delayed eczema, reflux, diarrhoea, blood in stools). Treatment: extensively hydrolysed formula (amino acid formula if severe), or maternal elimination diet if breastfed. Most outgrow it by school age; reintroduce using the milk ladder.', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v4')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = 'e46fdbb7-9783-5888-b3c4-0e76de5d2c25';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('f73a58e8-7262-5f61-b7ed-a53cd12b9807', 'e46fdbb7-9783-5888-b3c4-0e76de5d2c25', 'A', 'Intussusception; air enema', false, 0),
  ('93e56112-0c23-5cef-a32d-08308700766f', 'e46fdbb7-9783-5888-b3c4-0e76de5d2c25', 'B', 'Infective colitis; antibiotics', false, 1),
  ('ac075d1f-6394-5ca7-b4d4-1fed3c29c781', 'e46fdbb7-9783-5888-b3c4-0e76de5d2c25', 'C', 'Lactose intolerance; lactose-free formula', false, 2),
  ('71dcd1cc-7533-5262-92b4-e26a7cabe9c8', 'e46fdbb7-9783-5888-b3c4-0e76de5d2c25', 'D', 'Non-IgE cow''s milk protein allergy; switch to an extensively hydrolysed formula', true, 3),
  ('2fa8ffde-9f4d-52c5-974b-922c0882424e', 'e46fdbb7-9783-5888-b3c4-0e76de5d2c25', 'E', 'Reflux; PPI', false, 4);

-- Q246
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('ec8a8c09-303c-535d-bb35-a1272f645370', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000007', 'sba', 'A 32 year old woman has low mood, anhedonia and poor sleep for 6 weeks. PHQ-9 shows moderate-severe depression. She would like medication. What is the SINGLE most appropriate first-line antidepressant?', 'NICE NG222: for more severe depression, offer a combination of CBT and an antidepressant (usually an SSRI first). Review within 2 weeks (1 week if under 25 or at risk of suicide). Warn about initial worsening of anxiety and the risk of withdrawal if stopped suddenly. Continue for at least 6 months after remission.', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v4')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = 'ec8a8c09-303c-535d-bb35-a1272f645370';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('307355c5-bc32-594d-8319-40e4ae6605d8', 'ec8a8c09-303c-535d-bb35-a1272f645370', 'A', 'An SSRI (e.g. sertraline)', true, 0),
  ('c04d768f-ea4c-53d5-aed7-95b0ad15d4f9', 'ec8a8c09-303c-535d-bb35-a1272f645370', 'B', 'Phenelzine', false, 1),
  ('ca03f9b2-0cef-5957-be0f-d83da7b9faa7', 'ec8a8c09-303c-535d-bb35-a1272f645370', 'C', 'Lithium', false, 2),
  ('0d768011-6ddb-5dbd-b396-2ccddadb5e5c', 'ec8a8c09-303c-535d-bb35-a1272f645370', 'D', 'Diazepam', false, 3),
  ('7c528912-678c-5ec5-8c1e-bfdde1f67812', 'ec8a8c09-303c-535d-bb35-a1272f645370', 'E', 'Amitriptyline', false, 4);

-- Q247
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('67fc2914-b023-58fc-b33e-3bb9fd1bec65', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000007', 'sba', 'A 23 year old man was started on fluoxetine for depression 10 days ago. He says he now feels more agitated and has had new thoughts of suicide. What is the MOST important action?', 'Antidepressants may increase suicidal thoughts and agitation early in treatment, especially in people under 25. NICE recommends review within 1 week for under-25s. Assess suicide risk (plan, intent, means, protective factors), involve crisis services if needed, and review treatment.', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v4')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = '67fc2914-b023-58fc-b33e-3bb9fd1bec65';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('32d314c1-60aa-5506-996e-67b76e37bc49', '67fc2914-b023-58fc-b33e-3bb9fd1bec65', 'A', 'Reassure that it always passes', false, 0),
  ('0dece299-dc57-5eb6-bda3-fa2753292cde', '67fc2914-b023-58fc-b33e-3bb9fd1bec65', 'B', 'Add a second SSRI', false, 1),
  ('9d328456-f602-5ae9-832c-c5e0e804367e', '67fc2914-b023-58fc-b33e-3bb9fd1bec65', 'C', 'Double the dose', false, 2),
  ('ce5fa04d-9b27-581d-a30d-328f5ba73ee9', '67fc2914-b023-58fc-b33e-3bb9fd1bec65', 'D', 'Urgently assess suicide risk and arrange appropriate support; young people starting antidepressants need close monitoring', true, 3),
  ('7872b0df-15c2-577d-9e50-29e14510ce56', '67fc2914-b023-58fc-b33e-3bb9fd1bec65', 'E', 'Stop and say nothing', false, 4);

-- Q248
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('b321ca64-962c-5721-8e24-e08a98c9d6c1', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000007', 'sba', 'A 50 year old man has had depression for 8 months. He has not responded to sertraline at maximum dose for 8 weeks, or to mirtazapine. What is the SINGLE most appropriate next step?', 'Treatment-resistant depression (no response to 2 adequate antidepressant trials): refer to specialist services. Options: switching class (SNRI such as venlafaxine), combinations (mirtazapine with an SSRI), augmentation (lithium, aripiprazole, quetiapine), ECT, and esketamine in specialist settings. Review diagnosis and adherence.', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v4')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = 'b321ca64-962c-5721-8e24-e08a98c9d6c1';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('12ef6b5d-9c90-5135-9d50-126ea9f7e5c5', 'b321ca64-962c-5721-8e24-e08a98c9d6c1', 'A', 'Reassure', false, 0),
  ('68da77f9-b20e-5009-80cc-4855bbe1d974', 'b321ca64-962c-5721-8e24-e08a98c9d6c1', 'B', 'Benzodiazepines long-term', false, 1),
  ('468448c9-292a-5c2c-8be8-b5cc266386fc', 'b321ca64-962c-5721-8e24-e08a98c9d6c1', 'C', 'Stop all medication', false, 2),
  ('88dde481-7bfe-59a3-a160-950b4efdb57f', 'b321ca64-962c-5721-8e24-e08a98c9d6c1', 'D', 'Refer to specialist mental health services; options include augmentation (e.g. lithium or an antipsychotic) or combined medication', true, 3),
  ('bf6efd58-f31f-5801-9b63-2f5bac815643', 'b321ca64-962c-5721-8e24-e08a98c9d6c1', 'E', 'Return to sertraline at a lower dose', false, 4);

-- Q249
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('9343d9b3-d207-5ea2-acfa-98c63d139457', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000007', 'sba', 'A 72 year old man stopped his venlafaxine abruptly a week ago. He now has dizziness, electric shock sensations, irritability and flu-like symptoms. What is the SINGLE most likely diagnosis?', 'Discontinuation symptoms are common with short half-life antidepressants (paroxetine, venlafaxine), with dizziness, ''brain zaps'', irritability, insomnia and flu-like symptoms. Antidepressants should be tapered over weeks (or longer). Reinstate the drug and taper more slowly if severe. Fluoxetine has a long half-life and lower risk.', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v4')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = '9343d9b3-d207-5ea2-acfa-98c63d139457';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('99825ee7-ed42-57ad-87dc-ad6afc4d09aa', '9343d9b3-d207-5ea2-acfa-98c63d139457', 'A', 'Viral infection', false, 0),
  ('35bd2bff-8d0b-55da-9bc0-9184c64a20af', '9343d9b3-d207-5ea2-acfa-98c63d139457', 'B', 'Antidepressant discontinuation syndrome', true, 1),
  ('ec72f251-8dab-543c-b02f-72b66a917681', '9343d9b3-d207-5ea2-acfa-98c63d139457', 'C', 'Serotonin syndrome', false, 2),
  ('fc54030c-8cb2-5a38-9a03-8316ffd64471', '9343d9b3-d207-5ea2-acfa-98c63d139457', 'D', 'Relapse of depression', false, 3),
  ('60d20cf0-b2f8-58c0-bf87-45dab67bbe6a', '9343d9b3-d207-5ea2-acfa-98c63d139457', 'E', 'Stroke', false, 4);

-- Q250
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('94798ef9-cb8c-5204-b9e2-d06eabcc2f2d', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000007', 'sba', 'A 25 year old man has had 2 weeks of reduced need for sleep, pressured speech, grandiose ideas that he will become a billionaire, and spending huge amounts of money. What is the SINGLE most likely diagnosis?', 'Mania: elevated or irritable mood with increased energy for at least 7 days (or any duration if hospitalised), with severe impairment, and sometimes psychotic features. Hypomania lasts at least 4 days without severe impairment or psychosis. Treatment: antipsychotic (haloperidol, olanzapine, quetiapine, risperidone), and stop antidepressants. Long-term: lithium.', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v4')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = '94798ef9-cb8c-5204-b9e2-d06eabcc2f2d';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('f9180c56-f327-582e-a375-a6d8d8f8e3b0', '94798ef9-cb8c-5204-b9e2-d06eabcc2f2d', 'A', 'Schizophrenia', false, 0),
  ('9fd47a67-12db-575e-9412-04a0fcbb141d', '94798ef9-cb8c-5204-b9e2-d06eabcc2f2d', 'B', 'ADHD', false, 1),
  ('ee788fa2-e155-5586-9a3c-fd45b85091f2', '94798ef9-cb8c-5204-b9e2-d06eabcc2f2d', 'C', 'Hypomania', false, 2),
  ('609f8857-b9ca-5ea8-a6a6-4ff6cf19f067', '94798ef9-cb8c-5204-b9e2-d06eabcc2f2d', 'D', 'Cyclothymia', false, 3),
  ('f6f6fba8-d55f-57dc-be72-c3a6cbea69a2', '94798ef9-cb8c-5204-b9e2-d06eabcc2f2d', 'E', 'Manic episode (bipolar affective disorder)', true, 4);

-- Q251
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('e5e37f3b-3f01-5261-af11-c0a2f5bbf59b', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000007', 'sba', 'A 30 year old woman with bipolar disorder takes lithium. She is planning pregnancy. What is the MOST important advice?', 'Lithium in pregnancy is linked to a small increased risk of cardiac malformations (Ebstein''s anomaly). Abrupt stopping risks relapse. Plan with a specialist: options include continuing with close monitoring (levels fall in pregnancy, rise after delivery), switching to an antipsychotic, or stopping gradually. Postpartum relapse risk is high.', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v4')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = 'e5e37f3b-3f01-5261-af11-c0a2f5bbf59b';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('29c2fc2c-112e-5ef1-9ca1-ac41c8d98f7d', 'e5e37f3b-3f01-5261-af11-c0a2f5bbf59b', 'A', 'Lithium is completely safe', false, 0),
  ('8ae18a2a-98b6-5e27-8d84-ef902466b3d4', 'e5e37f3b-3f01-5261-af11-c0a2f5bbf59b', 'B', 'Switch to valproate', false, 1),
  ('16582991-2cfc-57a2-b2e2-4f04a091037c', 'e5e37f3b-3f01-5261-af11-c0a2f5bbf59b', 'C', 'No change needed', false, 2),
  ('6d8da922-33cf-5e9a-8557-fba2caa228ef', 'e5e37f3b-3f01-5261-af11-c0a2f5bbf59b', 'D', 'Stop lithium abruptly when pregnant', false, 3),
  ('e674f442-ad7a-5a01-9ad6-962468d1192e', 'e5e37f3b-3f01-5261-af11-c0a2f5bbf59b', 'E', 'Discuss risks and benefits with a perinatal psychiatrist before conception; lithium has a small risk of cardiac defects (Ebstein''s anomaly) and needs close level monitoring', true, 4);

-- Q252
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('7148aacc-5916-5d60-a418-6d926b3ce121', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000007', 'sba', 'A 40 year old woman on lithium has polyuria and polydipsia. Lithium level is in range. Urine is dilute despite water deprivation and does not concentrate with desmopressin. What is the SINGLE most likely diagnosis?', 'Lithium causes nephrogenic DI (kidney unresponsive to ADH), hypothyroidism, hyperparathyroidism (hypercalcaemia), weight gain, tremor and CKD. Monitor lithium levels every 3 months, and renal, thyroid and calcium every 6 months. Lithium toxicity is worsened by dehydration and interacting drugs.', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v4')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = '7148aacc-5916-5d60-a418-6d926b3ce121';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('fee193a7-7e89-54bd-b0a0-851c58473836', '7148aacc-5916-5d60-a418-6d926b3ce121', 'A', 'Nephrogenic diabetes insipidus (lithium-induced)', true, 0),
  ('ce5429d4-5554-5f1d-ab74-74b2d2a096a4', '7148aacc-5916-5d60-a418-6d926b3ce121', 'B', 'Psychogenic polydipsia', false, 1),
  ('18a29ffa-07c8-55a2-a703-b517b0477f26', '7148aacc-5916-5d60-a418-6d926b3ce121', 'C', 'Diabetes mellitus', false, 2),
  ('65ac09ba-f4cc-519c-987a-3b58a86473fb', '7148aacc-5916-5d60-a418-6d926b3ce121', 'D', 'Cranial diabetes insipidus', false, 3),
  ('7bebd05d-62e8-519e-a1b9-7dee84adafc8', '7148aacc-5916-5d60-a418-6d926b3ce121', 'E', 'Hypercalcaemia only', false, 4);

-- Q253
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('05dd6b81-0a2b-5324-a6a8-da0f54bdc061', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000007', 'sba', 'A 20 year old man has heard voices commenting on his actions for 3 months. He believes the TV is sending him messages and that his thoughts are being taken out of his head. He has withdrawn socially. What is the SINGLE most likely diagnosis?', 'Schizophrenia: first-rank symptoms include third-person auditory hallucinations (running commentary), thought insertion, withdrawal and broadcasting, delusional perception and passivity experiences, with symptoms for at least 1 month (ICD-11). Refer urgently to early intervention in psychosis services. Treatment: antipsychotic plus CBTp and family intervention.', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v4')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = '05dd6b81-0a2b-5324-a6a8-da0f54bdc061';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('89173852-ddd0-5d4d-ad82-99a3ccc2a173', '05dd6b81-0a2b-5324-a6a8-da0f54bdc061', 'A', 'Bipolar disorder', false, 0),
  ('0ec70469-0b60-56fa-8460-c25b4a14b977', '05dd6b81-0a2b-5324-a6a8-da0f54bdc061', 'B', 'Brief psychotic disorder', false, 1),
  ('089c016f-471e-5108-a5ae-2732f3deca23', '05dd6b81-0a2b-5324-a6a8-da0f54bdc061', 'C', 'Delusional disorder', false, 2),
  ('0d8d9b31-a0ff-5087-81a5-762109647a11', '05dd6b81-0a2b-5324-a6a8-da0f54bdc061', 'D', 'Schizophrenia', true, 3),
  ('40fcbe2c-81cc-5e04-86fc-a78c61402eab', '05dd6b81-0a2b-5324-a6a8-da0f54bdc061', 'E', 'Schizotypal personality disorder', false, 4);

-- Q254
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('24e62cea-7db1-5e60-8786-67e71f74da73', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000007', 'sba', 'A 26 year old man has been started on olanzapine for schizophrenia. What physical health monitoring is MOST important?', 'Second-generation antipsychotics (especially olanzapine and clozapine) cause weight gain, diabetes and dyslipidaemia. Monitor weight weekly for 6 weeks, then at 12 weeks, 1 year and annually; glucose and lipids at baseline, 12 weeks and annually; and ECG if risk factors. Other side effects: extrapyramidal effects, hyperprolactinaemia and sedation.', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v4')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = '24e62cea-7db1-5e60-8786-67e71f74da73';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('f4a2ceca-ba8d-5ecf-b26e-ad7a94d01026', '24e62cea-7db1-5e60-8786-67e71f74da73', 'A', 'Weight, BMI, waist circumference, blood glucose (HbA1c) and lipids, plus BP', true, 0),
  ('6f2c528b-eb0b-5621-b87f-ac0a318ca2ca', '24e62cea-7db1-5e60-8786-67e71f74da73', 'B', 'Lung function tests', false, 1),
  ('6cf5aacb-2aef-553d-b2f2-45e7bd2d15bc', '24e62cea-7db1-5e60-8786-67e71f74da73', 'C', 'Hearing tests', false, 2),
  ('9a9271d0-039f-5c7b-8f7b-322c98dbbd36', '24e62cea-7db1-5e60-8786-67e71f74da73', 'D', 'Bone scans', false, 3),
  ('55cadc16-5f20-5672-8f61-7119447bb042', '24e62cea-7db1-5e60-8786-67e71f74da73', 'E', 'Eye tests only', false, 4);

-- Q255
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('0503a27e-38a3-5828-825e-419e1b860570', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000007', 'sba', 'A 30 year old man has been on haloperidol for 2 weeks. He now has an inner sense of restlessness, cannot keep his legs still and keeps pacing. What is the SINGLE most likely diagnosis?', 'Extrapyramidal side effects of antipsychotics: acute dystonia (hours to days, such as oculogyric crisis and torticollis, treated with procyclidine), akathisia (restlessness, treated by reducing dose or propranolol), parkinsonism (weeks) and tardive dyskinesia (months to years, involuntary orofacial movements, often irreversible).', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v4')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = '0503a27e-38a3-5828-825e-419e1b860570';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('ba0d81b4-f1ea-5ce8-9a11-0646fec620e1', '0503a27e-38a3-5828-825e-419e1b860570', 'A', 'Tardive dyskinesia', false, 0),
  ('8ee7e969-e4e8-576d-9b6a-acfb18c0fcdb', '0503a27e-38a3-5828-825e-419e1b860570', 'B', 'Akathisia', true, 1),
  ('289f5780-ee61-5f3a-ad42-ffc1eb14e445', '0503a27e-38a3-5828-825e-419e1b860570', 'C', 'Parkinsonism', false, 2),
  ('f0f33ce3-0c69-5cfb-a0e3-bba2f62c9437', '0503a27e-38a3-5828-825e-419e1b860570', 'D', 'Acute dystonia', false, 3),
  ('b565bfd8-7a3a-59bd-a412-79f98877e178', '0503a27e-38a3-5828-825e-419e1b860570', 'E', 'Neuroleptic malignant syndrome', false, 4);

-- Q256
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('d5bbc705-31c8-548d-b8b6-94f4d3d1c105', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000007', 'sba', 'A 19 year old man had haloperidol injected for agitation 6 hours ago. He now has his eyes fixed upwards and his neck twisted to one side. What is the SINGLE most appropriate treatment?', 'Acute dystonic reactions (oculogyric crisis, torticollis, trismus) occur within hours to days of starting antipsychotics or antiemetics (metoclopramide), more often in young men. Treat with an anticholinergic such as procyclidine. Laryngeal dystonia can be life-threatening.', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v4')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = 'd5bbc705-31c8-548d-b8b6-94f4d3d1c105';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('2a7f47e2-65f6-5285-aeb0-8e67fd4a48ea', 'd5bbc705-31c8-548d-b8b6-94f4d3d1c105', 'A', 'IM or IV procyclidine (anticholinergic)', true, 0),
  ('95a9e3f3-61ee-5164-9ac5-55d8b20297ed', 'd5bbc705-31c8-548d-b8b6-94f4d3d1c105', 'B', 'Propranolol', false, 1),
  ('2d75127e-ca6b-54f2-ae95-54687c7f15c5', 'd5bbc705-31c8-548d-b8b6-94f4d3d1c105', 'C', 'IM haloperidol again', false, 2),
  ('3f362c2f-532e-5d2e-83cd-8f9d111cc5db', 'd5bbc705-31c8-548d-b8b6-94f4d3d1c105', 'D', 'Diazepam alone', false, 3),
  ('cc7680e5-207c-5bae-a8ca-3d417157ac6d', 'd5bbc705-31c8-548d-b8b6-94f4d3d1c105', 'E', 'Dantrolene', false, 4);

-- Q257
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('e5a03fad-b440-5335-90b3-a049fd4376b3', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000030', 'sba', 'A 19 year old man has had central abdominal pain moving to the right iliac fossa over 18 hours, with anorexia and a low-grade fever. There is rebound tenderness at McBurney''s point. WCC is 14. What is the SINGLE most appropriate management?', 'Acute appendicitis is a clinical diagnosis supported by raised inflammatory markers. Scoring systems (Alvarado, AIR) help. Imaging (ultrasound in children and women, CT in older adults) is used when uncertain. Treatment: appendicectomy (usually laparoscopic). Antibiotics alone are an option in selected uncomplicated cases. Appendix mass: conservative then interval assessment.', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v4')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = 'e5a03fad-b440-5335-90b3-a049fd4376b3';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('6544ea54-e193-505e-8d34-3718ce71c2a6', 'e5a03fad-b440-5335-90b3-a049fd4376b3', 'A', 'Oral antibiotics only', false, 0),
  ('e4346845-4887-5b92-941e-3e8c40673527', 'e5a03fad-b440-5335-90b3-a049fd4376b3', 'B', 'Laparoscopic appendicectomy with IV antibiotics', true, 1),
  ('639888dd-1e7b-5384-ab5a-8d3c040ecb88', 'e5a03fad-b440-5335-90b3-a049fd4376b3', 'C', 'Colonoscopy', false, 2),
  ('bcac5714-7f38-560d-8730-cbb70510c33a', 'e5a03fad-b440-5335-90b3-a049fd4376b3', 'D', 'CT abdomen in all young men before surgery', false, 3),
  ('7500b911-eacc-54a9-b0a1-05527385ba2f', 'e5a03fad-b440-5335-90b3-a049fd4376b3', 'E', 'Discharge with analgesia', false, 4);

-- Q258
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('d32330e2-68bf-51c0-a2e9-32db8913a3c7', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000030', 'sba', 'A 78 year old woman has a tender, irreducible lump in her right groin above and medial to the pubic tubercle. She has vomiting and abdominal distension for 12 hours. The skin over it is red. What is the SINGLE most appropriate management?', 'A strangulated hernia (irreducible, tender, red, with obstruction) is a surgical emergency: resuscitate, NG tube and emergency repair, with bowel resection if non-viable. Inguinal hernias lie above and medial to the pubic tubercle; femoral hernias lie below and lateral. Do not attempt to reduce a likely strangulated hernia.', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v4')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = 'd32330e2-68bf-51c0-a2e9-32db8913a3c7';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('1525058d-bb66-5759-a61e-3659f7087b66', 'd32330e2-68bf-51c0-a2e9-32db8913a3c7', 'A', 'Manual reduction under sedation', false, 0),
  ('4ee1c878-989b-52d7-a016-3b6ab09c9363', 'd32330e2-68bf-51c0-a2e9-32db8913a3c7', 'B', 'Truss', false, 1),
  ('96737fc2-18fe-5706-8532-4538cfa0a0e7', 'd32330e2-68bf-51c0-a2e9-32db8913a3c7', 'C', 'Elective repair in 6 weeks', false, 2),
  ('36943bd2-2414-5cf5-85bd-caa4dd617fc2', 'd32330e2-68bf-51c0-a2e9-32db8913a3c7', 'D', 'Observation', false, 3),
  ('e0b53bd3-bf33-5bc1-a23a-471754aba357', 'd32330e2-68bf-51c0-a2e9-32db8913a3c7', 'E', 'Emergency surgery for a strangulated inguinal hernia, after resuscitation', true, 4);

-- Q259
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('8ffd08da-950b-5cb5-b160-68b5b3798baf', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000030', 'sba', 'A 55 year old man has a painless reducible swelling in his groin that appears when he coughs. It is controlled by pressure over the deep inguinal ring. What is the SINGLE most likely diagnosis?', 'Indirect inguinal hernias pass through the deep ring lateral to the inferior epigastric vessels and are controlled by pressure over the deep ring (midpoint of the inguinal ligament). Direct hernias push through Hesselbach''s triangle, medial to the inferior epigastric vessels, and are not controlled by deep ring pressure. Confirmation is at surgery.', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v4')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = '8ffd08da-950b-5cb5-b160-68b5b3798baf';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('03f8a82b-f6bb-5749-ab3f-d2e7cf0d604d', '8ffd08da-950b-5cb5-b160-68b5b3798baf', 'A', 'Direct inguinal hernia', false, 0),
  ('3596109f-9e6b-5470-b6ec-f6688c1bb690', '8ffd08da-950b-5cb5-b160-68b5b3798baf', 'B', 'Femoral hernia', false, 1),
  ('201d11b1-cba1-51c6-a855-517ec4d6f838', '8ffd08da-950b-5cb5-b160-68b5b3798baf', 'C', 'Spigelian hernia', false, 2),
  ('500ed99e-6a67-5320-af63-23a852e04277', '8ffd08da-950b-5cb5-b160-68b5b3798baf', 'D', 'Saphena varix', false, 3),
  ('76d339c0-e45b-587a-931e-41a13036707a', '8ffd08da-950b-5cb5-b160-68b5b3798baf', 'E', 'Indirect inguinal hernia', true, 4);

-- Q260
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('c3f4ed23-6406-5526-a78b-c51a0231a623', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000030', 'sba', 'A 6 week old boy has a swelling in his right groin that becomes larger when he cries. It is reducible. What is the SINGLE most appropriate management?', 'Infantile inguinal hernias are indirect (patent processus vaginalis), commoner in boys and preterm babies. Incarceration risk is high, so repair is done soon after diagnosis. Umbilical hernias in children usually close spontaneously by age 3-5 and are repaired later if persistent.', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v4')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = 'c3f4ed23-6406-5526-a78b-c51a0231a623';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('3e44eed0-e416-548e-a01b-4f07d8814ad3', 'c3f4ed23-6406-5526-a78b-c51a0231a623', 'A', 'Truss', false, 0),
  ('38a4f291-1b52-541b-b729-68d8c9f67808', 'c3f4ed23-6406-5526-a78b-c51a0231a623', 'B', 'Ultrasound only', false, 1),
  ('580c3a0e-412c-5a62-87a7-556782f4f364', 'c3f4ed23-6406-5526-a78b-c51a0231a623', 'C', 'Wait until age 5', false, 2),
  ('d031bdc1-283a-5aa9-83c4-9f75d837843c', 'c3f4ed23-6406-5526-a78b-c51a0231a623', 'D', 'Refer for early surgical repair (inguinal herniotomy) because of the high incarceration risk in infants', true, 3),
  ('bf7da6ae-7ae4-5d23-a7c9-a2b556f954d2', 'c3f4ed23-6406-5526-a78b-c51a0231a623', 'E', 'Reassure that it will resolve', false, 4);

-- Q261
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('6ad57220-9682-5f84-86ae-439f9a22c8c8', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000030', 'sba', 'A 45 year old woman has had a lump at the site of a previous midline laparotomy scar. It appears on coughing and standing. What is the SINGLE most likely diagnosis?', 'Incisional hernias occur through surgical scars, with risk factors such as wound infection, obesity, smoking, diabetes and steroids. Wide-necked hernias have a lower risk of strangulation. Repair is often with mesh. Weight loss and smoking cessation before elective repair improve outcomes.', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v4')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = '6ad57220-9682-5f84-86ae-439f9a22c8c8';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('79efc64b-3654-5fec-9552-2b4c44b92ac2', '6ad57220-9682-5f84-86ae-439f9a22c8c8', 'A', 'Desmoid tumour', false, 0),
  ('c9d55aab-ce36-5f06-ac39-60dc226feefe', '6ad57220-9682-5f84-86ae-439f9a22c8c8', 'B', 'Seroma', false, 1),
  ('553bbdd2-ca9e-5fe7-95c5-e649882a6db8', '6ad57220-9682-5f84-86ae-439f9a22c8c8', 'C', 'Incisional hernia', true, 2),
  ('fa98684e-9959-5a8a-8e0c-aa2c735f7f23', '6ad57220-9682-5f84-86ae-439f9a22c8c8', 'D', 'Lipoma', false, 3),
  ('54b1c85b-0c35-560b-85dc-5cc4195e26fd', '6ad57220-9682-5f84-86ae-439f9a22c8c8', 'E', 'Rectus sheath haematoma', false, 4);

-- Q262
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('b52b296c-d08f-514a-9163-f5c41a2dc993', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000030', 'sba', 'A 60 year old man has had sudden onset of severe abdominal pain spreading across the whole abdomen. He is lying still, with a rigid abdomen. He takes NSAIDs for arthritis. Erect CXR shows free air. What is the SINGLE most likely diagnosis?', 'Perforated peptic ulcer causes sudden severe pain and generalised peritonitis (board-like rigidity). Risk factors: NSAIDs, steroids, H. pylori and smoking. Free air on erect CXR or CT. Management: resuscitation, IV PPI, antibiotics and surgery (laparoscopic omental patch repair). Test for and treat H. pylori.', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v4')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = 'b52b296c-d08f-514a-9163-f5c41a2dc993';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('c2106a3d-3177-5aa2-a259-0a0e6d176a2d', 'b52b296c-d08f-514a-9163-f5c41a2dc993', 'A', 'Mesenteric ischaemia', false, 0),
  ('fc803e87-1ac2-5460-90b3-45b44311d593', 'b52b296c-d08f-514a-9163-f5c41a2dc993', 'B', 'Acute pancreatitis', false, 1),
  ('b6a9ef29-9eae-5dc7-85bf-f73b7e8ff629', 'b52b296c-d08f-514a-9163-f5c41a2dc993', 'C', 'Renal colic', false, 2),
  ('a7b33539-7807-51b3-b738-33b363976b5e', 'b52b296c-d08f-514a-9163-f5c41a2dc993', 'D', 'Perforated peptic ulcer', true, 3),
  ('283877e3-1801-554d-949d-42c3b1f93d11', 'b52b296c-d08f-514a-9163-f5c41a2dc993', 'E', 'Biliary colic', false, 4);

-- Q263
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('1a67a16f-c5e8-588a-8191-adc54dc6be3d', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000030', 'sba', 'A 70 year old man has had progressive constipation, abdominal distension and vomiting for 3 days. He has had weight loss and change in bowel habit for 3 months. Abdominal X-ray shows a dilated colon with a competent ileocaecal valve. What is the SINGLE most likely cause?', 'Colorectal cancer is the commonest cause of large bowel obstruction in adults. A competent ileocaecal valve creates a closed loop with a risk of caecal perforation (caecum over 12 cm). CT confirms. Management: resuscitation, then surgery (resection with or without stoma) or colonic stenting as a bridge or palliation.', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v4')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = '1a67a16f-c5e8-588a-8191-adc54dc6be3d';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('b7f18f1a-624d-50ea-be18-3c64e96ae832', '1a67a16f-c5e8-588a-8191-adc54dc6be3d', 'A', 'Adhesions', false, 0),
  ('583aff85-b4f2-54d8-8bff-b420a7c5463c', '1a67a16f-c5e8-588a-8191-adc54dc6be3d', 'B', 'Paralytic ileus', false, 1),
  ('be63bf72-e214-50a2-bda8-6f533b2ca05a', '1a67a16f-c5e8-588a-8191-adc54dc6be3d', 'C', 'Large bowel obstruction from colorectal cancer', true, 2),
  ('399623c1-6d57-5f84-871f-84487641286e', '1a67a16f-c5e8-588a-8191-adc54dc6be3d', 'D', 'Sigmoid volvulus', false, 3),
  ('351c46f8-92d4-50fa-bae3-6211719b4cbc', '1a67a16f-c5e8-588a-8191-adc54dc6be3d', 'E', 'Hernia', false, 4);

-- Q264
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('1b75f83a-9fe9-5ff8-8d41-ca55d4b62d4b', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000030', 'sba', 'A 64 year old man had a right hemicolectomy and wants to know about bowel cancer follow-up. Which test is used to monitor for recurrence alongside CT imaging?', 'After curative colorectal cancer surgery, follow-up includes CEA and CT chest, abdomen and pelvis (in the first 3 years), and colonoscopy at 1 year. CEA is not used for diagnosis because it lacks sensitivity and specificity, but rising levels suggest recurrence.', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v4')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = '1b75f83a-9fe9-5ff8-8d41-ca55d4b62d4b';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('27b12c2f-3778-5b87-aa67-827f249ca2d5', '1b75f83a-9fe9-5ff8-8d41-ca55d4b62d4b', 'A', 'PSA', false, 0),
  ('a0872ca9-d7d1-514a-a728-815b5bcc3632', '1b75f83a-9fe9-5ff8-8d41-ca55d4b62d4b', 'B', 'CA125', false, 1),
  ('29195841-9249-5422-8eea-b402f2487439', '1b75f83a-9fe9-5ff8-8d41-ca55d4b62d4b', 'C', 'AFP', false, 2),
  ('28b3e912-56ef-50e4-bbe7-19acace34e0e', '1b75f83a-9fe9-5ff8-8d41-ca55d4b62d4b', 'D', 'Serum CEA (carcinoembryonic antigen)', true, 3),
  ('0a79e7ba-0911-5c8b-8a03-e4d642d74132', '1b75f83a-9fe9-5ff8-8d41-ca55d4b62d4b', 'E', 'CA19-9', false, 4);

-- Q265
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('65104a80-1f1e-53ad-9383-bc053eed298b', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000030', 'sba', 'A 35 year old man has had a painful, swollen lump at the anal margin for 3 days, with fever. Examination shows a tender, fluctuant swelling beside the anus. What is the SINGLE most appropriate management?', 'Perianal abscesses need incision and drainage. Antibiotics alone are not enough (unless immunocompromised or with cellulitis). Look for an underlying fistula (present in a proportion) and consider Crohn''s disease, diabetes and HIV in recurrent cases.', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v4')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = '65104a80-1f1e-53ad-9383-bc053eed298b';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('f221c83b-8e0b-5df5-bb73-a9fe49caba8f', '65104a80-1f1e-53ad-9383-bc053eed298b', 'A', 'Topical steroid', false, 0),
  ('8149434f-80d6-56f9-8275-f71037cf0e2c', '65104a80-1f1e-53ad-9383-bc053eed298b', 'B', 'Rubber band ligation', false, 1),
  ('4e18ad80-56d1-5887-bd4a-32d658c3e56f', '65104a80-1f1e-53ad-9383-bc053eed298b', 'C', 'Incision and drainage under anaesthesia', true, 2),
  ('fac57f6f-7da4-5965-b1ab-e1a5a30c589e', '65104a80-1f1e-53ad-9383-bc053eed298b', 'D', 'Oral antibiotics alone', false, 3),
  ('97bf3f30-992b-5e5f-82a2-b7a3c1d17833', '65104a80-1f1e-53ad-9383-bc053eed298b', 'E', 'Wait to discharge spontaneously', false, 4);

-- Q266
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('93399d99-7e7d-572f-bcf4-007b9c1b6e6c', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000030', 'sba', 'A 45 year old woman has had a persistent discharging opening near the anus for months after a perianal abscess was drained. What is the SINGLE most likely diagnosis?', 'Anal fistulas follow perianal abscesses and connect the anal canal to the skin. Goodsall''s rule predicts the internal opening. Investigation: MRI for complex fistulas. Treatment: fistulotomy for low fistulas, and setons for high fistulas to preserve continence. Consider Crohn''s disease.', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v4')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = '93399d99-7e7d-572f-bcf4-007b9c1b6e6c';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('493c5caa-5d45-561f-b426-24355d5cdbf9', '93399d99-7e7d-572f-bcf4-007b9c1b6e6c', 'A', 'Haemorrhoids', false, 0),
  ('82ca0fbd-14ea-549d-acac-c5e9dacb5462', '93399d99-7e7d-572f-bcf4-007b9c1b6e6c', 'B', 'Anal fissure', false, 1),
  ('1554f2f9-b431-5081-ac30-1e5407cb6be9', '93399d99-7e7d-572f-bcf4-007b9c1b6e6c', 'C', 'Anal cancer', false, 2),
  ('f39bf77e-83a6-50f2-8d43-19bd5e60a323', '93399d99-7e7d-572f-bcf4-007b9c1b6e6c', 'D', 'Anal fistula (fistula-in-ano)', true, 3),
  ('e9e6a9bf-1e19-59ef-a98d-73fce835a509', '93399d99-7e7d-572f-bcf4-007b9c1b6e6c', 'E', 'Pilonidal sinus', false, 4);

-- Q267
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('516c6990-d687-56ba-94d0-63deb5822ad0', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000030', 'sba', 'A 32 year old man had a motorcycle crash. He is alert but has left upper quadrant pain, left shoulder tip pain, HR 120 and BP 90/60. FAST scan shows free fluid. What is the SINGLE most likely diagnosis?', 'Splenic injury is the commonest solid organ injury in blunt abdominal trauma. Left shoulder tip pain (Kehr''s sign) is from diaphragmatic irritation. Unstable patients with a positive FAST go to theatre (or embolisation). Stable patients may have CT and non-operative management. After splenectomy, vaccinate against encapsulated organisms.', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v4')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = '516c6990-d687-56ba-94d0-63deb5822ad0';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('20398747-4c01-5b9f-a30c-d1b6c8ee374d', '516c6990-d687-56ba-94d0-63deb5822ad0', 'A', 'Pancreatic injury', false, 0),
  ('a82a0996-669a-5704-b89f-bf2bcb49281a', '516c6990-d687-56ba-94d0-63deb5822ad0', 'B', 'Renal injury', false, 1),
  ('735e4bda-211d-5f60-8b1f-ed5b2a3c8e3e', '516c6990-d687-56ba-94d0-63deb5822ad0', 'C', 'Rib fracture alone', false, 2),
  ('321fac90-427c-569f-89f1-899cbcf38409', '516c6990-d687-56ba-94d0-63deb5822ad0', 'D', 'Liver laceration', false, 3),
  ('5c8c8a76-2667-5280-aca0-699d8143f7aa', '516c6990-d687-56ba-94d0-63deb5822ad0', 'E', 'Splenic injury with haemoperitoneum', true, 4);

-- Q268
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('2487e906-beba-5c65-9077-b90622d2a758', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000030', 'sba', 'A 60 year old woman has had a painful, red, hard cord along a varicose vein on her calf. There is no swelling of the leg. What is the SINGLE most likely diagnosis and important additional investigation?', 'Superficial thrombophlebitis causes a tender, red cord along a superficial vein. Ultrasound is recommended to exclude DVT, especially if near the saphenofemoral junction or 5 cm or longer. Treatment: NSAIDs, compression and warm compresses. Prophylactic-dose fondaparinux or LMWH for extensive cases.', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v4')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = '2487e906-beba-5c65-9077-b90622d2a758';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('11350c7d-d305-595b-b142-d51ece01304a', '2487e906-beba-5c65-9077-b90622d2a758', 'A', 'Lymphangitis; IV antibiotics', false, 0),
  ('7692d62d-9fb5-5f81-9b9e-1b6dbc53c44c', '2487e906-beba-5c65-9077-b90622d2a758', 'B', 'DVT; immediate anticoagulation in all', false, 1),
  ('5d94a76f-f46d-58c2-bd18-e3870d09c5fa', '2487e906-beba-5c65-9077-b90622d2a758', 'C', 'Ruptured Baker''s cyst; ultrasound', false, 2),
  ('33bb7cc5-5496-5b24-baa3-210f700f0292', '2487e906-beba-5c65-9077-b90622d2a758', 'D', 'Cellulitis; antibiotics only', false, 3),
  ('634fa33c-e26d-50a2-ad2e-53060e95a348', '2487e906-beba-5c65-9077-b90622d2a758', 'E', 'Superficial thrombophlebitis; Doppler ultrasound to exclude DVT if near the saphenofemoral junction or extensive', true, 4);

-- Q269
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('1d0ec825-9443-55e8-a719-d09380dcf2c1', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000030', 'sba', 'A 50 year old woman has had a painless, soft, mobile, rubbery lump on her back for years. It is not attached to the skin and is slowly growing. It is 3 cm. What is the SINGLE most likely diagnosis?', 'Lipomas are benign tumours of fat: soft, mobile, painless and slow-growing. Features suggesting sarcoma: size over 5 cm, deep to fascia, rapid growth, pain or recurrence after excision; these need urgent ultrasound. Excision for cosmetic reasons or symptoms.', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v4')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = '1d0ec825-9443-55e8-a719-d09380dcf2c1';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('10d456e6-bf16-5752-b33e-677907bd8566', '1d0ec825-9443-55e8-a719-d09380dcf2c1', 'A', 'Liposarcoma', false, 0),
  ('c5c467e8-02b9-5f59-bc6e-5556b990f2b2', '1d0ec825-9443-55e8-a719-d09380dcf2c1', 'B', 'Sebaceous cyst', false, 1),
  ('c3966803-3dc7-5bd6-abd7-1b211d8665cb', '1d0ec825-9443-55e8-a719-d09380dcf2c1', 'C', 'Lymph node', false, 2),
  ('108e6441-79b3-5f26-b81c-36d87a217ed5', '1d0ec825-9443-55e8-a719-d09380dcf2c1', 'D', 'Dermatofibroma', false, 3),
  ('9a0bd301-c9dd-5ac6-a99b-b8ecc7936aa3', '1d0ec825-9443-55e8-a719-d09380dcf2c1', 'E', 'Lipoma', true, 4);

-- Q270
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('2da650f1-4a21-540e-87ce-c9e328b33eac', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000030', 'sba', 'A 65 year old man has a pulsatile, tender, rapidly expanding swelling in his groin 2 days after femoral angiography. What is the SINGLE most likely diagnosis?', 'A pseudoaneurysm is a contained leak from the artery after puncture, giving a pulsatile, expansile mass, sometimes with a bruit. Duplex ultrasound confirms. Treatment: ultrasound-guided compression or thrombin injection, with surgery for large or infected pseudoaneurysms.', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v4')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = '2da650f1-4a21-540e-87ce-c9e328b33eac';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('7657fa1a-a44f-5b4a-93a5-3213e86e00fb', '2da650f1-4a21-540e-87ce-c9e328b33eac', 'A', 'Femoral artery pseudoaneurysm', true, 0),
  ('a4b64a2b-ba75-5614-a92e-eb33346837d6', '2da650f1-4a21-540e-87ce-c9e328b33eac', 'B', 'Haematoma only', false, 1),
  ('45eec4c7-5f1e-59cd-87de-a331449f0f3a', '2da650f1-4a21-540e-87ce-c9e328b33eac', 'C', 'Saphena varix', false, 2),
  ('5d9ed5dd-308c-57c0-aad4-2bdcbf38a514', '2da650f1-4a21-540e-87ce-c9e328b33eac', 'D', 'Lymphadenopathy', false, 3),
  ('3bb028b4-5f0f-5d90-b26c-cf145f534bef', '2da650f1-4a21-540e-87ce-c9e328b33eac', 'E', 'Femoral hernia', false, 4);

-- Q271
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('895e3d88-1fb6-5777-8a34-da76d92290b1', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000030', 'sba', 'A 72 year old woman has a painful, white, cold leg with no palpable pulses and a fixed mottled appearance. There is no sensation or movement of the foot. Symptoms started 18 hours ago. What is the SINGLE most likely management?', 'The Rutherford classification of acute limb ischaemia: viable, threatened (marginally or immediately) or irreversible. Fixed mottling, paralysis and complete sensory loss suggest irreversible ischaemia. Revascularisation at this stage risks fatal reperfusion injury. Management is amputation or palliative care.', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v4')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = '895e3d88-1fb6-5777-8a34-da76d92290b1';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('c7dcb782-4edf-5e44-875e-1d712bcdf3e5', '895e3d88-1fb6-5777-8a34-da76d92290b1', 'A', 'Analgesia alone and review', false, 0),
  ('d59d084a-fb00-552a-ae23-e804477ca9c5', '895e3d88-1fb6-5777-8a34-da76d92290b1', 'B', 'Compression bandage', false, 1),
  ('039fb95f-edde-5efb-84e7-32f1cdd5a81a', '895e3d88-1fb6-5777-8a34-da76d92290b1', 'C', 'Urgent embolectomy to save the limb', false, 2),
  ('241a91bf-b678-51b0-95fd-a9f50f5fc1c9', '895e3d88-1fb6-5777-8a34-da76d92290b1', 'D', 'Primary amputation or palliation (irreversible ischaemia)', true, 3),
  ('988014ac-87ad-5a17-99af-10f6011e745a', '895e3d88-1fb6-5777-8a34-da76d92290b1', 'E', 'Thrombolysis', false, 4);

-- Q272
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('2953cc41-cb51-5271-856b-b3fb9bc822a4', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000030', 'sba', 'A 68 year old man with diabetes has a deep, painless ulcer over the metatarsal head on the sole of his foot. He has reduced sensation to monofilament and palpable pulses. What is the SINGLE most likely type of ulcer?', 'Diabetic neuropathic ulcers occur at pressure points (metatarsal heads, heel) with surrounding callus and loss of sensation. Refer urgently to the multidisciplinary diabetic foot service. Management: offloading, debridement, treating infection and checking for osteomyelitis (probe to bone, X-ray or MRI). Annual foot checks.', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v4')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = '2953cc41-cb51-5271-856b-b3fb9bc822a4';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('bf1ee656-cc5e-5404-b26e-22512b673928', '2953cc41-cb51-5271-856b-b3fb9bc822a4', 'A', 'Venous ulcer', false, 0),
  ('2ecb94d5-d138-5349-963a-af7ad1839ed2', '2953cc41-cb51-5271-856b-b3fb9bc822a4', 'B', 'Pressure ulcer only', false, 1),
  ('0b6717c7-8114-5664-ad0b-0fa99cf36284', '2953cc41-cb51-5271-856b-b3fb9bc822a4', 'C', 'Arterial ulcer', false, 2),
  ('acc6f916-f5cf-5362-be1f-c6ae4f966fb6', '2953cc41-cb51-5271-856b-b3fb9bc822a4', 'D', 'Neuropathic (diabetic foot) ulcer', true, 3),
  ('8bed63a7-284d-56c9-8465-49a7d2b675f2', '2953cc41-cb51-5271-856b-b3fb9bc822a4', 'E', 'Pyoderma gangrenosum', false, 4);

-- Q273
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('71586d36-b5d1-53ce-8413-5de0a4b8d162', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000030', 'sba', 'A 60 year old man with diabetes has a red, hot, swollen foot with no ulcer. The foot has collapsed arch on X-ray. He has peripheral neuropathy. What is the SINGLE most likely diagnosis?', 'Acute Charcot foot causes a warm, swollen, red foot in people with neuropathy, often with little pain. Untreated, it leads to joint destruction and deformity (rocker-bottom foot). Urgent referral to the diabetic foot team for offloading (total contact cast). Temperature difference of more than 2°C between feet suggests it.', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v4')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = '71586d36-b5d1-53ce-8413-5de0a4b8d162';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('19261103-c86c-58f3-9b8c-0f11adad6405', '71586d36-b5d1-53ce-8413-5de0a4b8d162', 'A', 'Cellulitis', false, 0),
  ('e9a4a590-b7e2-5964-89b6-d124938ce67c', '71586d36-b5d1-53ce-8413-5de0a4b8d162', 'B', 'Osteomyelitis', false, 1),
  ('5cc24f6b-35f0-5103-a3a7-6cca0f60967f', '71586d36-b5d1-53ce-8413-5de0a4b8d162', 'C', 'DVT', false, 2),
  ('ef32f384-92a8-55cb-a1a6-d9b67e16c443', '71586d36-b5d1-53ce-8413-5de0a4b8d162', 'D', 'Gout', false, 3),
  ('064dd661-2279-5e31-a3d6-48748c6bd386', '71586d36-b5d1-53ce-8413-5de0a4b8d162', 'E', 'Charcot neuroarthropathy', true, 4);

-- Q274
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('2155c20d-7249-5a88-8919-e4b5b92725a5', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000030', 'sba', 'A 55 year old woman has had a varicose vein on her leg that bleeds. What is the SINGLE most appropriate management?', 'NICE CG168: refer people with varicose veins to vascular services if bleeding, symptomatic, with skin changes, superficial thrombophlebitis, or a venous ulcer. First-line treatment for truncal reflux: endothermal ablation (radiofrequency or laser), then foam sclerotherapy, then surgery. Bleeding varicose veins need immediate elevation and pressure.', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v4')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = '2155c20d-7249-5a88-8919-e4b5b92725a5';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('b1f16fac-4441-576c-ac6c-81c9132e0f47', '2155c20d-7249-5a88-8919-e4b5b92725a5', 'A', 'Refer to vascular services for treatment (endothermal ablation is first-line)', true, 0),
  ('7fad480f-0c03-5e6e-9697-ec5c1878c527', '2155c20d-7249-5a88-8919-e4b5b92725a5', 'B', 'Aspirin', false, 1),
  ('6f5451bb-c6cc-5acb-a02b-fee247e0e71e', '2155c20d-7249-5a88-8919-e4b5b92725a5', 'C', 'Compression stockings only', false, 2),
  ('209ab215-69c8-519c-9b1e-c5a07b7ae175', '2155c20d-7249-5a88-8919-e4b5b92725a5', 'D', 'Antibiotics', false, 3),
  ('1762252a-0c17-52f3-a08d-dd2d32c2cdbb', '2155c20d-7249-5a88-8919-e4b5b92725a5', 'E', 'No treatment', false, 4);

-- Q275
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('fc77dad5-5120-5dc6-bf5e-d705e29a986f', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000030', 'sba', 'A 45 year old woman has had a slowly growing lump in her neck that moves with swallowing. Thyroid function is normal. Ultrasound shows a single nodule. What is the SINGLE most appropriate next step?', 'A thyroid nodule with normal TSH should be assessed by ultrasound (BTA U-classification) and FNA for suspicious nodules. Urgent referral if rapidly growing, stridor, hoarseness, cervical lymphadenopathy or in a child. Most nodules are benign.', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v4')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = 'fc77dad5-5120-5dc6-bf5e-d705e29a986f';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('8799f08d-ed23-53ab-8948-31445442b50d', 'fc77dad5-5120-5dc6-bf5e-d705e29a986f', 'A', 'Ultrasound-guided fine needle aspiration if the nodule has suspicious features (U3-U5)', true, 0),
  ('e5216d4a-f395-5eef-9a90-82eebcea7126', 'fc77dad5-5120-5dc6-bf5e-d705e29a986f', 'B', 'Levothyroxine', false, 1),
  ('1de64047-63ae-5259-90de-79de75b1ce41', 'fc77dad5-5120-5dc6-bf5e-d705e29a986f', 'C', 'Thyroidectomy immediately', false, 2),
  ('ed6320ed-a4f3-5df7-bb77-296ef7754194', 'fc77dad5-5120-5dc6-bf5e-d705e29a986f', 'D', 'Reassure without testing', false, 3),
  ('16e27cd2-d83b-57c4-8e3d-3a820833dbb3', 'fc77dad5-5120-5dc6-bf5e-d705e29a986f', 'E', 'Radioiodine', false, 4);

-- Q276
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('9bc40c1b-1d23-5ac4-9129-c3b86f5a8738', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000011', 'sba', 'A 82 year old woman fell at home. She has a shortened, externally rotated left leg. X-ray shows a displaced intracapsular fracture of the femoral neck. What is the SINGLE most appropriate surgical treatment?', 'Displaced intracapsular hip fractures disrupt the blood supply to the femoral head (avascular necrosis), so are treated by replacement: total hip replacement for fit, active patients, or hemiarthroplasty. Extracapsular (intertrochanteric) fractures: dynamic hip screw. Subtrochanteric: intramedullary nail. Surgery on the day of or after admission, with orthogeriatric care.', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v4')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = '9bc40c1b-1d23-5ac4-9129-c3b86f5a8738';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('432942e3-6d40-5398-8eef-9ab0d01b9288', '9bc40c1b-1d23-5ac4-9129-c3b86f5a8738', 'A', 'Conservative bed rest', false, 0),
  ('5d4e8b41-2d43-521b-8bd9-b1c5cd43e002', '9bc40c1b-1d23-5ac4-9129-c3b86f5a8738', 'B', 'Dynamic hip screw', false, 1),
  ('65280748-7941-57e6-9ce7-c2085a212f34', '9bc40c1b-1d23-5ac4-9129-c3b86f5a8738', 'C', 'Hemiarthroplasty (or total hip replacement if she was independently mobile and fit)', true, 2),
  ('ccabef9c-2c45-5e82-a9ba-a0403288e3f2', '9bc40c1b-1d23-5ac4-9129-c3b86f5a8738', 'D', 'Intramedullary nail', false, 3),
  ('7f89c135-0d7f-579b-8f88-ba3550e9d5d9', '9bc40c1b-1d23-5ac4-9129-c3b86f5a8738', 'E', 'Cannulated screws', false, 4);

-- Q277
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('ac60b939-bc36-5387-8431-4ab557dbc782', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000011', 'sba', 'A 85 year old man has an extracapsular intertrochanteric fracture of the right femur after a fall. What is the SINGLE most appropriate surgical treatment?', 'Stable intertrochanteric fractures are treated with a sliding hip screw. Subtrochanteric and unstable fractures need an intramedullary nail. Early surgery reduces complications. All hip fracture patients need assessment for delirium, falls and bone health.', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v4')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = 'ac60b939-bc36-5387-8431-4ab557dbc782';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('7ca2514a-6147-58fa-9967-fec1ea132009', 'ac60b939-bc36-5387-8431-4ab557dbc782', 'A', 'Sliding hip screw (dynamic hip screw)', true, 0),
  ('522454bd-db7c-5553-ab0f-cd2e8d033e02', 'ac60b939-bc36-5387-8431-4ab557dbc782', 'B', 'External fixation', false, 1),
  ('a066c25f-6d7c-5ec9-a5c5-80fab9c13e42', 'ac60b939-bc36-5387-8431-4ab557dbc782', 'C', 'Hemiarthroplasty', false, 2),
  ('ad201363-fc93-55e4-8115-9424c2c92fff', 'ac60b939-bc36-5387-8431-4ab557dbc782', 'D', 'Total hip replacement', false, 3),
  ('ec9ba158-0cc3-55f0-86c3-1e52e2b3d499', 'ac60b939-bc36-5387-8431-4ab557dbc782', 'E', 'Conservative management', false, 4);

-- Q278
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('6ffff8ad-ddbd-51d2-9c43-f568209bb2a0', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000011', 'sba', 'A 26 year old man fell on his outstretched hand. He has pain and deformity of his elbow. X-ray shows a fracture of the proximal ulna with dislocation of the radial head. What is the SINGLE most likely name of this injury?', 'Monteggia: fracture of the proximal ulna with radial head dislocation. Galeazzi: fracture of the distal radius shaft with dislocation of the distal radioulnar joint. Both are unstable and usually need open reduction and internal fixation. Always X-ray the joint above and below a forearm fracture.', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v4')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = '6ffff8ad-ddbd-51d2-9c43-f568209bb2a0';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('e020e8e7-ebbe-5a20-af83-4e70bf7961ec', '6ffff8ad-ddbd-51d2-9c43-f568209bb2a0', 'A', 'Monteggia fracture-dislocation', true, 0),
  ('a84d1c09-73ef-5ca7-84be-03a88bb0f06b', '6ffff8ad-ddbd-51d2-9c43-f568209bb2a0', 'B', 'Colles'' fracture', false, 1),
  ('ff5c3e3b-bd34-5d39-be72-f699130c6296', '6ffff8ad-ddbd-51d2-9c43-f568209bb2a0', 'C', 'Barton''s fracture', false, 2),
  ('f2cf24e0-2854-5d08-8d9f-b983b3605e7c', '6ffff8ad-ddbd-51d2-9c43-f568209bb2a0', 'D', 'Smith''s fracture', false, 3),
  ('0ae19e6a-daf7-57ee-8735-1c154735fdaf', '6ffff8ad-ddbd-51d2-9c43-f568209bb2a0', 'E', 'Galeazzi fracture', false, 4);

-- Q279
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('8cfd3891-4456-5067-acf9-71ec83091763', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000011', 'sba', 'A 7 year old boy fell off a climbing frame onto his outstretched arm. His elbow is swollen and deformed. X-ray shows a displaced supracondylar fracture of the humerus. His hand is pale and the radial pulse is absent. What is the SINGLE most important structure at risk?', 'Supracondylar fractures are common in children. Complications: brachial artery injury (pale, pulseless hand), median nerve injury (anterior interosseous nerve), radial nerve injury, compartment syndrome (Volkmann''s ischaemic contracture) and malunion (cubitus varus). Urgent reduction and fixation, with vascular assessment.', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v4')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = '8cfd3891-4456-5067-acf9-71ec83091763';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('922d961c-39f7-5d71-9ad9-9b558112022b', '8cfd3891-4456-5067-acf9-71ec83091763', 'A', 'Radial artery at the wrist', false, 0),
  ('cb6f7d07-778f-5186-94f5-844232f51247', '8cfd3891-4456-5067-acf9-71ec83091763', 'B', 'Axillary nerve', false, 1),
  ('00c740d5-1ad4-51b7-a9e7-81c9c7cf5516', '8cfd3891-4456-5067-acf9-71ec83091763', 'C', 'Brachial artery', true, 2),
  ('345dd76d-c71d-5c74-b60f-ad7021a8e485', '8cfd3891-4456-5067-acf9-71ec83091763', 'D', 'Ulnar nerve only', false, 3),
  ('7e2b87c9-85ba-5e8e-9c29-84a0ea5ac796', '8cfd3891-4456-5067-acf9-71ec83091763', 'E', 'Median cubital vein', false, 4);

-- Q280
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('df35353c-077f-5ab3-a004-d9898a0a5ae1', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000011', 'sba', 'A 22 year old woman has had pain in the front of her knee for 3 months, worse going downstairs and after sitting for long periods. There is no swelling or injury. What is the SINGLE most likely diagnosis?', 'Patellofemoral pain is common in young active women, causing anterior knee pain on stairs, squatting and prolonged sitting (''theatre sign''). Examination is often normal. Management: physiotherapy (quadriceps and hip strengthening), activity modification and analgesia.', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v4')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = 'df35353c-077f-5ab3-a004-d9898a0a5ae1';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('b8d18283-ce2b-5b28-9d25-820873dfbc20', 'df35353c-077f-5ab3-a004-d9898a0a5ae1', 'A', 'Osgood-Schlatter disease', false, 0),
  ('8764d09a-296d-5edc-9f57-9e706f25c811', 'df35353c-077f-5ab3-a004-d9898a0a5ae1', 'B', 'Patellofemoral pain syndrome', true, 1),
  ('8198b0a9-d8a6-56e5-a241-708a2f19468e', 'df35353c-077f-5ab3-a004-d9898a0a5ae1', 'C', 'Meniscal tear', false, 2),
  ('a1f70044-50a5-5b64-a9bf-7dda743fb9cd', 'df35353c-077f-5ab3-a004-d9898a0a5ae1', 'D', 'Anterior cruciate ligament tear', false, 3),
  ('d33be543-b2b6-5939-88cc-29c552af1af3', 'df35353c-077f-5ab3-a004-d9898a0a5ae1', 'E', 'Septic arthritis', false, 4);

-- Q281
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('4a32ab2c-5c6a-57ca-a7c0-785c1d570661', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000011', 'sba', 'A 40 year old man injured his knee playing tennis when he twisted it. The knee swelled slowly over 24 hours. He has locking and joint line tenderness on the medial side. McMurray''s test is positive. What is the SINGLE most likely diagnosis?', 'Meniscal tears cause delayed swelling (over hours), joint line tenderness, locking or catching, and positive McMurray''s or Thessaly test. MRI confirms. A locked knee needs urgent arthroscopy. Other tears are treated with physiotherapy or arthroscopic repair or partial meniscectomy.', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v4')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = '4a32ab2c-5c6a-57ca-a7c0-785c1d570661';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('fec1e33a-5cd2-5efb-93e5-de839e42efdc', '4a32ab2c-5c6a-57ca-a7c0-785c1d570661', 'A', 'Medial meniscal tear', true, 0),
  ('b0b5660d-9ca0-56e3-ab13-9a07f20753c5', '4a32ab2c-5c6a-57ca-a7c0-785c1d570661', 'B', 'ACL rupture', false, 1),
  ('435b4eda-498f-5169-9fad-3439d01da7f6', '4a32ab2c-5c6a-57ca-a7c0-785c1d570661', 'C', 'Medial collateral ligament sprain', false, 2),
  ('0dd4639f-37aa-5d2b-97b8-9b394b5d7479', '4a32ab2c-5c6a-57ca-a7c0-785c1d570661', 'D', 'Osteoarthritis', false, 3),
  ('9f82da4b-22e6-5d67-92f9-f3f7901496f2', '4a32ab2c-5c6a-57ca-a7c0-785c1d570661', 'E', 'Patellar dislocation', false, 4);

-- Q282
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('a141b744-bdad-50d3-8483-d1b4732c9bd1', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000011', 'sba', 'A 16 year old girl has had her kneecap ''go out'' to the side while dancing. The knee is swollen, and it popped back. What is the SINGLE most likely diagnosis?', 'Patellar dislocations are usually lateral, in young people (especially girls) with ligamentous laxity or a shallow trochlear groove. Often reduce spontaneously or by extending the knee. X-ray for osteochondral fragments. Treatment: brace and physiotherapy. Recurrent dislocations may need surgery (MPFL reconstruction).', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v4')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = 'a141b744-bdad-50d3-8483-d1b4732c9bd1';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('6d69a4a0-f35c-51f8-97f4-ed58d4843853', 'a141b744-bdad-50d3-8483-d1b4732c9bd1', 'A', 'Lateral patellar dislocation', true, 0),
  ('abbd43a6-4bfc-5b0f-bee7-f6d1d06c40fc', 'a141b744-bdad-50d3-8483-d1b4732c9bd1', 'B', 'ACL rupture', false, 1),
  ('f4a13afa-5be9-5a8a-a242-b23d38b73c3b', 'a141b744-bdad-50d3-8483-d1b4732c9bd1', 'C', 'Patellar fracture', false, 2),
  ('8c2ccff7-0484-55ce-a738-54966bb2f0fe', 'a141b744-bdad-50d3-8483-d1b4732c9bd1', 'D', 'Osgood-Schlatter disease', false, 3),
  ('cbe0a7e5-c282-57c4-828d-6b812d744434', 'a141b744-bdad-50d3-8483-d1b4732c9bd1', 'E', 'Meniscal tear', false, 4);

-- Q283
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('4ed125de-ddea-56f4-8af9-311e2ebeb20f', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000011', 'sba', 'A 55 year old woman has had pain and stiffness in her shoulder for 4 months, with a global reduction in both active and passive movement, especially external rotation. X-ray is normal. She has diabetes. What is the SINGLE most likely diagnosis?', 'Frozen shoulder: painful then stiff, then thawing phases over 1-3 years, with loss of active and passive movement (especially external rotation). Associated with diabetes and thyroid disease. Management: analgesia, physiotherapy, steroid injection, hydrodilatation and manipulation or release in resistant cases.', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v4')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = '4ed125de-ddea-56f4-8af9-311e2ebeb20f';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('a17096c1-bc13-5b38-9435-a1a918f8c8ed', '4ed125de-ddea-56f4-8af9-311e2ebeb20f', 'A', 'Glenohumeral osteoarthritis', false, 0),
  ('232babb2-4191-5600-98a4-e73c6e58b133', '4ed125de-ddea-56f4-8af9-311e2ebeb20f', 'B', 'Rotator cuff tear', false, 1),
  ('558bdca8-e0a3-57bf-a62f-e97ea0d93141', '4ed125de-ddea-56f4-8af9-311e2ebeb20f', 'C', 'Adhesive capsulitis (frozen shoulder)', true, 2),
  ('f5f86934-e8ca-5a66-a5a9-eb6420c25b31', '4ed125de-ddea-56f4-8af9-311e2ebeb20f', 'D', 'Acromioclavicular arthritis', false, 3),
  ('704d757d-96c0-5cbf-9d9f-f4f4e17e445a', '4ed125de-ddea-56f4-8af9-311e2ebeb20f', 'E', 'Subacromial impingement', false, 4);

-- Q284
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('6722b74a-97b7-5dd2-b9c8-0f0dfa1aefe9', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000011', 'sba', 'A 38 year old man has lateral elbow pain after a weekend of painting a ceiling. Pain increases with resisted wrist extension. What is the SINGLE most likely diagnosis?', 'Lateral epicondylitis is tendinopathy of the common extensor origin, causing pain over the lateral epicondyle worsened by resisted wrist extension and gripping. Most resolve within a year. Management: rest, analgesia, physiotherapy and a brace. Medial epicondylitis (golfer''s elbow) affects the flexor origin.', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v4')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = '6722b74a-97b7-5dd2-b9c8-0f0dfa1aefe9';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('cf2e4f30-71f8-5917-8671-f22cdacdf72e', '6722b74a-97b7-5dd2-b9c8-0f0dfa1aefe9', 'A', 'Cubital tunnel syndrome', false, 0),
  ('17fae295-d8e3-5779-ab90-9d499600c378', '6722b74a-97b7-5dd2-b9c8-0f0dfa1aefe9', 'B', 'Radial head fracture', false, 1),
  ('5b06fe6a-69a9-5f0b-bcca-ecfdb5ae9770', '6722b74a-97b7-5dd2-b9c8-0f0dfa1aefe9', 'C', 'Lateral epicondylitis (tennis elbow)', true, 2),
  ('5abcf2d6-5d49-5575-9e3f-47f4a6285454', '6722b74a-97b7-5dd2-b9c8-0f0dfa1aefe9', 'D', 'Medial epicondylitis', false, 3),
  ('e29b7b4a-3ab5-54b2-927b-c87d753e4431', '6722b74a-97b7-5dd2-b9c8-0f0dfa1aefe9', 'E', 'Olecranon bursitis', false, 4);

-- Q285
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('02c3df98-a010-5383-bd66-71d809b6b39d', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000011', 'sba', 'A 30 year old woman has a smooth, round, fluctuant swelling on the back of her wrist that transilluminates. It is painless. What is the SINGLE most likely diagnosis?', 'Ganglion cysts arise from joint capsules or tendon sheaths and are filled with jelly-like fluid. They are commonest on the dorsum of the wrist. Many resolve spontaneously. Treatment for symptoms: aspiration (high recurrence) or excision.', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v4')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = '02c3df98-a010-5383-bd66-71d809b6b39d';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('e5bc85df-54e1-52cd-8c99-b927a214efdc', '02c3df98-a010-5383-bd66-71d809b6b39d', 'A', 'Osteosarcoma', false, 0),
  ('511898a2-d587-5d43-8433-ce0e4951cdba', '02c3df98-a010-5383-bd66-71d809b6b39d', 'B', 'Lipoma', false, 1),
  ('75f4ea1c-20e7-54a3-86fb-594208a767e0', '02c3df98-a010-5383-bd66-71d809b6b39d', 'C', 'Giant cell tumour of tendon sheath', false, 2),
  ('a3dda759-66df-5488-a716-702917ca2a30', '02c3df98-a010-5383-bd66-71d809b6b39d', 'D', 'Rheumatoid nodule', false, 3),
  ('ab603188-915c-5bb8-a1ae-bf37be5493c4', '02c3df98-a010-5383-bd66-71d809b6b39d', 'E', 'Ganglion cyst', true, 4);

-- Q286
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('4d83c883-d9d1-5744-90ef-f2f801957827', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000011', 'sba', 'A 60 year old man has had a ring finger that gets stuck in a bent position and clicks when he straightens it. There is a tender nodule at the base of the finger in the palm. What is the SINGLE most likely diagnosis and first-line treatment?', 'Trigger finger (stenosing tenosynovitis) is caused by thickening of the flexor tendon sheath at the A1 pulley. Associated with diabetes and RA. Treatment: steroid injection, splinting, and surgical release for persistent cases.', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v4')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = '4d83c883-d9d1-5744-90ef-f2f801957827';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('ee458722-1a77-56dc-9a89-c1309d6fe272', '4d83c883-d9d1-5744-90ef-f2f801957827', 'A', 'Mallet finger; splint', false, 0),
  ('cf32814e-f8a9-530b-86dd-be774077f1f6', '4d83c883-d9d1-5744-90ef-f2f801957827', 'B', 'Ganglion; aspiration', false, 1),
  ('acc35cac-c2fc-5e18-9838-844447058185', '4d83c883-d9d1-5744-90ef-f2f801957827', 'C', 'Dupuytren''s contracture; fasciectomy', false, 2),
  ('813fae9f-f543-5e97-99fc-e594de8eb82f', '4d83c883-d9d1-5744-90ef-f2f801957827', 'D', 'Osteoarthritis; NSAIDs', false, 3),
  ('900967f6-cf9b-51b3-ac7a-aca797baa7bc', '4d83c883-d9d1-5744-90ef-f2f801957827', 'E', 'Trigger finger; corticosteroid injection into the tendon sheath', true, 4);

-- Q287
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('d55f315d-c36e-54f1-aa63-c98dbed9d6a3', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000011', 'sba', 'A 70 year old woman has had pain in the base of her thumb, worse when gripping or opening jars. There is squaring of the thumb base. What is the SINGLE most likely diagnosis?', 'First CMC joint osteoarthritis is common in older women, causing pain at the thumb base and squaring. Management: splints, analgesia (topical NSAIDs), hand therapy, steroid injection and surgery (trapeziectomy) for severe cases.', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v4')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = 'd55f315d-c36e-54f1-aa63-c98dbed9d6a3';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('59da6664-25cf-513c-9ec2-dfda9a6ff879', 'd55f315d-c36e-54f1-aa63-c98dbed9d6a3', 'A', 'Rheumatoid arthritis', false, 0),
  ('488a90ba-4392-5149-b850-63aca4664550', 'd55f315d-c36e-54f1-aa63-c98dbed9d6a3', 'B', 'De Quervain''s tenosynovitis', false, 1),
  ('45d1b5a3-afec-5d36-847c-6f6fa23c0b14', 'd55f315d-c36e-54f1-aa63-c98dbed9d6a3', 'C', 'Osteoarthritis of the first carpometacarpal joint', true, 2),
  ('3259db33-ce94-5bae-87ec-1f5aee850ed9', 'd55f315d-c36e-54f1-aa63-c98dbed9d6a3', 'D', 'Scaphoid fracture', false, 3),
  ('c312cca5-dff6-5bd9-aa31-2be6d6530ac3', 'd55f315d-c36e-54f1-aa63-c98dbed9d6a3', 'E', 'Gout', false, 4);

-- Q288
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('0bfb5601-488e-5661-ba99-97996f6ac5c4', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000011', 'sba', 'A 65 year old man has had knee pain for years, worse at the end of the day, with morning stiffness of under 30 minutes. Examination shows crepitus and bony swelling. What is the SINGLE most appropriate first-line management?', 'NICE NG226: osteoarthritis can be diagnosed clinically in people aged 45 and over with activity-related joint pain and morning stiffness of 30 minutes or less. Core treatments: therapeutic exercise, weight management and education. Topical NSAIDs for knee OA, then oral NSAIDs with PPI. Avoid paracetamol alone, opioids, glucosamine and arthroscopic washout. Joint replacement for severe symptoms.', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v4')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = '0bfb5601-488e-5661-ba99-97996f6ac5c4';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('ae79e40e-b81c-5bb2-833b-1d56dc37df8e', '0bfb5601-488e-5661-ba99-97996f6ac5c4', 'A', 'Arthroscopic washout', false, 0),
  ('9f68522e-5ffa-5862-9580-29fe2e5750f0', '0bfb5601-488e-5661-ba99-97996f6ac5c4', 'B', 'Oral opioids', false, 1),
  ('c23632f6-3b95-50a7-889a-245b34f18aaf', '0bfb5601-488e-5661-ba99-97996f6ac5c4', 'C', 'Glucosamine', false, 2),
  ('b8773366-89a9-59b2-9be3-18e7558b549f', '0bfb5601-488e-5661-ba99-97996f6ac5c4', 'D', 'MRI before diagnosis', false, 3),
  ('806564c1-393e-5394-a1f0-a55cc07bc086', '0bfb5601-488e-5661-ba99-97996f6ac5c4', 'E', 'Exercise (strengthening), weight loss if overweight, and education, with topical NSAIDs for pain', true, 4);

-- Q289
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('eafba91d-4ad6-5075-ae0b-97dc33e5b797', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000011', 'sba', 'A 72 year old woman has had back pain since lifting a box. X-ray shows a wedge fracture of T12. She has no other risk factors. What is the SINGLE most appropriate investigation?', 'Vertebral fragility fractures indicate osteoporosis. NICE: women aged 75 and over with a fragility fracture may be treated without DXA, but DXA is often done. Exclude myeloma and secondary causes (bloods including calcium, PTH, vitamin D, myeloma screen, TFTs, coeliac serology). Treatment: alendronic acid first-line, with calcium and vitamin D.', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v4')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = 'eafba91d-4ad6-5075-ae0b-97dc33e5b797';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('6aeaaefa-4579-58f9-9d73-cc00f827cbfe', 'eafba91d-4ad6-5075-ae0b-97dc33e5b797', 'A', 'Bone scan', false, 0),
  ('b195e1c2-d422-58c0-89f5-5858148cbdd5', 'eafba91d-4ad6-5075-ae0b-97dc33e5b797', 'B', 'MRI to exclude infection in all', false, 1),
  ('a3701c10-0617-52a6-be72-35fdf35f46c5', 'eafba91d-4ad6-5075-ae0b-97dc33e5b797', 'C', 'DXA scan and assessment for osteoporosis (and bone protection treatment)', true, 2),
  ('05933b53-b0c1-5119-bafb-0d6b424405ff', 'eafba91d-4ad6-5075-ae0b-97dc33e5b797', 'D', 'PET-CT', false, 3),
  ('e22a3165-42ba-5764-b180-9290ff62ec6c', 'eafba91d-4ad6-5075-ae0b-97dc33e5b797', 'E', 'No investigation', false, 4);

-- Q290
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('3dabe29c-67f3-5f2b-97c9-b7cba2b0207f', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000011', 'sba', 'A 35 year old woman of South Asian origin who covers her skin has bone pain, proximal muscle weakness and a waddling gait. Calcium and phosphate are low, ALP is raised, and vitamin D is very low. What is the SINGLE most likely diagnosis?', 'Osteomalacia (rickets in children) is defective mineralisation of bone due to vitamin D deficiency. Features: bone pain, proximal myopathy, fractures and Looser''s zones on X-ray. Biochemistry: low or normal calcium, low phosphate, raised ALP and raised PTH (secondary). Treat with loading-dose vitamin D, then maintenance.', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v4')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = '3dabe29c-67f3-5f2b-97c9-b7cba2b0207f';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('36984123-2017-5a93-ad20-e601c8ba46fd', '3dabe29c-67f3-5f2b-97c9-b7cba2b0207f', 'A', 'Paget''s disease', false, 0),
  ('4b213c22-9efc-5f5d-85ee-fdd97e47618f', '3dabe29c-67f3-5f2b-97c9-b7cba2b0207f', 'B', 'Osteoporosis', false, 1),
  ('cad00ca0-9f86-51cb-ad26-bf66c9f219b7', '3dabe29c-67f3-5f2b-97c9-b7cba2b0207f', 'C', 'Osteomalacia (vitamin D deficiency)', true, 2),
  ('aed91dd3-c1ff-557c-9072-9ebe846c3706', '3dabe29c-67f3-5f2b-97c9-b7cba2b0207f', 'D', 'Polymyositis', false, 3),
  ('03e1355c-b724-51a1-b4b2-3bd2733c9efb', '3dabe29c-67f3-5f2b-97c9-b7cba2b0207f', 'E', 'Hyperparathyroidism', false, 4);

-- Q291
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('232706f2-c159-5938-9cf6-3e09d61d36d8', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000034', 'sba', 'A 70 year old woman takes amitriptyline, oxybutynin and chlorphenamine. She is admitted with confusion, dry mouth, constipation and urinary retention. What is the SINGLE most likely cause?', 'Anticholinergic effects: ''dry as a bone, red as a beet, blind as a bat, hot as a hare, mad as a hatter'' — dry mouth, flushing, blurred vision, hyperthermia, confusion, constipation, urinary retention and tachycardia. Older people are especially sensitive. Review and deprescribe anticholinergic drugs.', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v4')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = '232706f2-c159-5938-9cf6-3e09d61d36d8';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('5b684dde-facd-5acc-8805-a61900a3dbb6', '232706f2-c159-5938-9cf6-3e09d61d36d8', 'A', 'Stroke', false, 0),
  ('a2d80118-69c8-58a6-93b6-9effbfae90d8', '232706f2-c159-5938-9cf6-3e09d61d36d8', 'B', 'Hypoglycaemia', false, 1),
  ('005d61d3-3853-51ab-bc24-369aa62b3f81', '232706f2-c159-5938-9cf6-3e09d61d36d8', 'C', 'Serotonin syndrome', false, 2),
  ('4f39ae10-e166-52b3-9c8e-be3ffde5f593', '232706f2-c159-5938-9cf6-3e09d61d36d8', 'D', 'Hyponatraemia only', false, 3),
  ('41d5b976-2758-51de-a9f0-f949b3cd5f89', '232706f2-c159-5938-9cf6-3e09d61d36d8', 'E', 'Anticholinergic adverse effects', true, 4);

-- Q292
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('326a026e-2a93-50dc-ae6d-f0c7e052c2b7', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000034', 'sba', 'A 30 year old man has taken a large overdose of amitriptyline. He is drowsy, with a heart rate of 130, dilated pupils and a QRS of 140 ms. What is the SINGLE most appropriate treatment?', 'Tricyclic antidepressant overdose causes anticholinergic effects, seizures, coma, hypotension and cardiac toxicity (QRS widening, ventricular arrhythmias) from sodium channel blockade. Treat with IV sodium bicarbonate if QRS over 100 ms, arrhythmias or acidosis. Avoid flumazenil and class 1a/1c antiarrhythmics. Activated charcoal within 1 hour if airway is protected.', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v4')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = '326a026e-2a93-50dc-ae6d-f0c7e052c2b7';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('66d9de16-09a8-5412-86cd-9c87cf904d24', '326a026e-2a93-50dc-ae6d-f0c7e052c2b7', 'A', 'IV naloxone', false, 0),
  ('d05c7bcf-50d7-56da-9a60-51047e3e28b2', '326a026e-2a93-50dc-ae6d-f0c7e052c2b7', 'B', 'IV flumazenil', false, 1),
  ('49aa70d8-d1d4-503d-ab8a-fc37f2c3d75e', '326a026e-2a93-50dc-ae6d-f0c7e052c2b7', 'C', 'IV sodium bicarbonate', true, 2),
  ('c8e2b619-665e-5a83-93d6-ace31c5c4eb6', '326a026e-2a93-50dc-ae6d-f0c7e052c2b7', 'D', 'IV physostigmine', false, 3),
  ('f4d425e6-86af-5021-b505-49b21c54d5e0', '326a026e-2a93-50dc-ae6d-f0c7e052c2b7', 'E', 'IV amiodarone', false, 4);

-- Q293
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('acf7453a-c4a8-5122-924e-ef2ca25745ee', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000034', 'sba', 'A 22 year old woman has taken 40 tablets of aspirin 4 hours ago. She has tinnitus, sweating, vomiting and hyperventilation. Blood gas initially shows a respiratory alkalosis, then a metabolic acidosis. What is the SINGLE most appropriate treatment if the salicylate level is high?', 'Salicylate poisoning causes tinnitus, vomiting, sweating, hyperventilation (respiratory alkalosis) and metabolic acidosis, plus hypoglycaemia and hyperthermia. Treatment: activated charcoal, IV fluids, urinary alkalinisation with sodium bicarbonate, and haemodialysis for very high levels, severe acidosis, renal failure, seizures or reduced consciousness.', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v4')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = 'acf7453a-c4a8-5122-924e-ef2ca25745ee';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('b7568668-3a3c-5f2a-a2ff-4a9938dce6e2', 'acf7453a-c4a8-5122-924e-ef2ca25745ee', 'A', 'IV sodium bicarbonate (urinary alkalinisation), with haemodialysis for severe poisoning', true, 0),
  ('2fbaa8db-14f9-50fe-9a17-f5c28df11053', 'acf7453a-c4a8-5122-924e-ef2ca25745ee', 'B', 'Naloxone', false, 1),
  ('fec09d5c-5948-5de1-8c09-7560ed3cc3c5', 'acf7453a-c4a8-5122-924e-ef2ca25745ee', 'C', 'Acetylcysteine', false, 2),
  ('3735349e-19fb-558d-b0d8-ec235e2fd473', 'acf7453a-c4a8-5122-924e-ef2ca25745ee', 'D', 'Flumazenil', false, 3),
  ('f2ecd2df-f84d-5703-89fc-a5f23143c72b', 'acf7453a-c4a8-5122-924e-ef2ca25745ee', 'E', 'Desferrioxamine', false, 4);

-- Q294
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('707ef954-63e0-5933-86c2-cb99a85de7fd', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000034', 'sba', 'A 25 year old man is found drowsy with pinpoint pupils and a respiratory rate of 6. He has needle marks on his arms. What is the SINGLE most appropriate treatment?', 'Opioid toxicity: reduced consciousness, respiratory depression and pinpoint pupils. Give naloxone IV (or IM or intranasal), titrated to respiratory effort rather than full consciousness to avoid precipitating acute withdrawal. Naloxone has a shorter half-life than many opioids (methadone), so observe and repeat or infuse as needed.', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v4')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = '707ef954-63e0-5933-86c2-cb99a85de7fd';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('a4f2d21a-2436-5b7e-8fac-be64c32e8f39', '707ef954-63e0-5933-86c2-cb99a85de7fd', 'A', 'Activated charcoal', false, 0),
  ('80a84615-634f-5a47-86b6-4a445de77ddc', '707ef954-63e0-5933-86c2-cb99a85de7fd', 'B', 'IV flumazenil', false, 1),
  ('279575f8-eb71-5422-b5d1-7d514cba87b1', '707ef954-63e0-5933-86c2-cb99a85de7fd', 'C', 'IV naloxone (titrated), with airway support; consider repeat doses or infusion', true, 2),
  ('712dd733-7432-567e-a5fc-f8ddf7455ca7', '707ef954-63e0-5933-86c2-cb99a85de7fd', 'D', 'IV glucose only', false, 3),
  ('d5bfe4c5-5cea-5a2f-a474-e1233722bb0b', '707ef954-63e0-5933-86c2-cb99a85de7fd', 'E', 'IV adrenaline', false, 4);

-- Q295
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('8ea5993b-7718-562d-995c-deaf6e5d0bb1', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000034', 'sba', 'A 40 year old man has taken an overdose of his diazepam. He is drowsy but breathing adequately with stable observations. What is the SINGLE most appropriate management?', 'Benzodiazepine overdose alone rarely causes death, but is dangerous with alcohol or opioids. Management is supportive. Flumazenil can precipitate seizures (especially in people with epilepsy, mixed overdoses with tricyclics, or long-term benzodiazepine users) and is generally avoided.', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v4')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = '8ea5993b-7718-562d-995c-deaf6e5d0bb1';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('d270035c-aed2-535a-939c-a5c7bf2b1e60', '8ea5993b-7718-562d-995c-deaf6e5d0bb1', 'A', 'IV naloxone', false, 0),
  ('ff3ce238-b3a7-5dd8-9542-ca19aa1ecfb9', '8ea5993b-7718-562d-995c-deaf6e5d0bb1', 'B', 'Haemodialysis', false, 1),
  ('a00dfb78-da09-55a3-b3f3-45e8164f9cae', '8ea5993b-7718-562d-995c-deaf6e5d0bb1', 'C', 'Induced vomiting', false, 2),
  ('687116a6-4583-5026-a7ce-3b9793146154', '8ea5993b-7718-562d-995c-deaf6e5d0bb1', 'D', 'Supportive care and observation (flumazenil is not routinely recommended)', true, 3),
  ('f7c2c6e5-cac0-50ba-9a57-21956966987b', '8ea5993b-7718-562d-995c-deaf6e5d0bb1', 'E', 'IV flumazenil in all', false, 4);

-- Q296
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('14684223-ff95-53c0-9472-54bfdd1a29ee', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000034', 'sba', 'A 50 year old man is found confused, with ataxia and slurred speech. He drank antifreeze 6 hours ago. Blood gas shows a severe metabolic acidosis with a raised anion gap and a raised osmolar gap. What is the SINGLE most appropriate antidote?', 'Ethylene glycol (antifreeze) and methanol poisoning cause intoxication, then a high anion gap metabolic acidosis with a raised osmolar gap. Ethylene glycol causes AKI (calcium oxalate crystals); methanol causes visual loss. Fomepizole blocks alcohol dehydrogenase. Haemodialysis removes the toxins.', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v4')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = '14684223-ff95-53c0-9472-54bfdd1a29ee';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('4cf8b84c-8d05-556a-9e8a-a2e4f38dd04e', '14684223-ff95-53c0-9472-54bfdd1a29ee', 'A', 'Fomepizole (or ethanol if unavailable), with haemodialysis for severe toxicity', true, 0),
  ('905a6570-c59f-5828-a5ae-fc9e0e39f821', '14684223-ff95-53c0-9472-54bfdd1a29ee', 'B', 'Naloxone', false, 1),
  ('ea7def59-813a-56e5-84ad-f0bdb42d90d0', '14684223-ff95-53c0-9472-54bfdd1a29ee', 'C', 'Glucagon', false, 2),
  ('9c33876f-32d5-53a7-8ba8-1a9753a5e1f3', '14684223-ff95-53c0-9472-54bfdd1a29ee', 'D', 'Atropine', false, 3),
  ('c98c018f-c4fb-54af-bda7-eb015032b890', '14684223-ff95-53c0-9472-54bfdd1a29ee', 'E', 'Acetylcysteine', false, 4);

-- Q297
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('93690359-6bd4-5fa4-ae8b-59b668917a30', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000034', 'sba', 'A 4 year old boy swallowed some of his grandmother''s tablets. He is drowsy with a HR of 45 and BP 70/40. Her tablets include bisoprolol. What is the SINGLE most appropriate treatment if atropine fails?', 'Beta-blocker overdose causes bradycardia, hypotension, heart block, hypoglycaemia and, with propranolol, seizures. Treatment: atropine, then IV glucagon (bypasses beta-receptors), high-dose insulin with glucose, inotropes and pacing. Get advice from TOXBASE or NPIS.', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v4')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = '93690359-6bd4-5fa4-ae8b-59b668917a30';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('abb25e9f-2946-59a9-ba05-ae5e5b244e48', '93690359-6bd4-5fa4-ae8b-59b668917a30', 'A', 'Flumazenil', false, 0),
  ('86150464-b443-5d5c-ade9-f18c58c8f163', '93690359-6bd4-5fa4-ae8b-59b668917a30', 'B', 'Calcium gluconate only', false, 1),
  ('5fd1068f-ac7e-5855-8d5e-3f7942fdd6ff', '93690359-6bd4-5fa4-ae8b-59b668917a30', 'C', 'IV adrenaline only', false, 2),
  ('ead470bd-73aa-5a95-84bd-a434691a6c35', '93690359-6bd4-5fa4-ae8b-59b668917a30', 'D', 'IV glucagon (and high-dose insulin euglycaemic therapy)', true, 3),
  ('d3236c2d-e3e5-55da-89ef-ca2fe5eb4b92', '93690359-6bd4-5fa4-ae8b-59b668917a30', 'E', 'Naloxone', false, 4);

-- Q298
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('0cd44d59-858a-5f5f-9754-7d0afcfa4dfb', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000034', 'sba', 'A 72 year old man with CKD (eGFR 25) has an infection. Which antibiotic should be AVOIDED or used with dose adjustment and level monitoring?', 'Aminoglycosides (gentamicin) are nephrotoxic and ototoxic and renally excreted. Doses are adjusted to renal function, with monitoring of levels (once-daily dosing with trough levels, using local nomograms). Nitrofurantoin is avoided if eGFR is below 45. Many drugs need adjustment in CKD (check the BNF).', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v4')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = '0cd44d59-858a-5f5f-9754-7d0afcfa4dfb';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('9b02e858-d0c0-542e-8fc5-c34f8f896718', '0cd44d59-858a-5f5f-9754-7d0afcfa4dfb', 'A', 'Gentamicin', true, 0),
  ('9ef3b5b7-c585-5642-9b7a-99c04b7ae3cb', '0cd44d59-858a-5f5f-9754-7d0afcfa4dfb', 'B', 'Clarithromycin', false, 1),
  ('8441b6b5-e7db-546c-adbd-5b69c46dfbc2', '0cd44d59-858a-5f5f-9754-7d0afcfa4dfb', 'C', 'Phenoxymethylpenicillin', false, 2),
  ('92549358-a33c-5789-8207-0fc0a492f910', '0cd44d59-858a-5f5f-9754-7d0afcfa4dfb', 'D', 'Flucloxacillin at standard dose', false, 3),
  ('c9270248-7966-5f3c-84cb-bad249bc9c07', '0cd44d59-858a-5f5f-9754-7d0afcfa4dfb', 'E', 'Doxycycline', false, 4);

-- Q299
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('50b755f7-5e46-59dd-9cf7-16302a1b019a', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000034', 'sba', 'A 30 year old woman is started on a new antibiotic for a UTI. She takes the combined pill. What is the CORRECT advice about her contraception?', 'FSRH: antibiotics that are not enzyme inducers do not reduce the effectiveness of hormonal contraception. Rifampicin and rifabutin (enzyme inducers) do. Vomiting within 3 hours of taking a pill or severe diarrhoea may reduce absorption, so follow missed pill rules.', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v4')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = '50b755f7-5e46-59dd-9cf7-16302a1b019a';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('1e4b3279-bf3a-5041-a5f8-af8f0c74698b', '50b755f7-5e46-59dd-9cf7-16302a1b019a', 'A', 'She must use condoms for 1 month', false, 0),
  ('21706eae-1f32-5e6a-a71a-de75cf43da12', '50b755f7-5e46-59dd-9cf7-16302a1b019a', 'B', 'Use emergency contraception', false, 1),
  ('6ac21532-7586-5972-aace-0e77f7945887', '50b755f7-5e46-59dd-9cf7-16302a1b019a', 'C', 'Stop the pill during antibiotics', false, 2),
  ('b87c66ef-6204-5a95-8da4-1311056aa2b2', '50b755f7-5e46-59dd-9cf7-16302a1b019a', 'D', 'Double the pill dose', false, 3),
  ('5dcf71c6-85dd-59ae-8e81-8776c7ee5d80', '50b755f7-5e46-59dd-9cf7-16302a1b019a', 'E', 'Most non-enzyme-inducing antibiotics do not reduce combined pill effectiveness; extra precautions are not needed unless vomiting or diarrhoea occur', true, 4);

-- Q300
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('7257fe3c-180e-5dde-ac17-dde3e2b1e623', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000020', 'sba', 'A 34 year old woman has had post-coital bleeding for 2 months. She is up to date with cervical screening, and her last test 1 year ago was normal. Speculum shows a friable, irregular cervix. What is the SINGLE most appropriate action?', 'A cervix that looks abnormal on examination needs urgent referral (NICE NG12), even with a recent normal screening test, because screening is not diagnostic. Post-coital bleeding also warrants chlamydia testing and examination for ectropion or polyps.', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v4')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = '7257fe3c-180e-5dde-ac17-dde3e2b1e623';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('008c5d98-fb00-5d2c-9c17-acfd9206c7ab', '7257fe3c-180e-5dde-ac17-dde3e2b1e623', 'A', 'Repeat cervical screening in 3 years', false, 0),
  ('5b5b1aa0-0e8d-5902-b21b-111d838cd617', '7257fe3c-180e-5dde-ac17-dde3e2b1e623', 'B', 'Reassure because screening was normal', false, 1),
  ('570cf423-4c53-58f6-9e2a-dbea659b4ad5', '7257fe3c-180e-5dde-ac17-dde3e2b1e623', 'C', 'Treat empirically for chlamydia and review in 6 months', false, 2),
  ('73a2a108-83d4-5299-8dfb-81e173d1a5d3', '7257fe3c-180e-5dde-ac17-dde3e2b1e623', 'D', 'Urgent referral on the suspected cancer pathway (colposcopy), regardless of the previous normal screening result', true, 3),
  ('0082477b-d607-517a-9453-be235d3e9b7c', '7257fe3c-180e-5dde-ac17-dde3e2b1e623', 'E', 'Start the combined pill', false, 4);

-- Q301
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('bd7573ce-9054-50d9-960f-84793b0f03cd', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000020', 'sba', 'A 45 year old man who has sex with men attends for a routine sexual health check. He has never been vaccinated against hepatitis B or HPV. What is the SINGLE most appropriate vaccination advice?', 'In the UK, men who have sex with men are offered hepatitis A and B vaccination and the HPV vaccine (up to and including age 45 through sexual health clinics). Mpox vaccination is offered to those at higher risk. Test for HIV, syphilis, gonorrhoea and chlamydia (including pharyngeal and rectal sites).', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v4')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = 'bd7573ce-9054-50d9-960f-84793b0f03cd';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('72d13de9-ca0b-5bd2-b877-6439e285a1a1', 'bd7573ce-9054-50d9-960f-84793b0f03cd', 'A', 'Offer MMR only', false, 0),
  ('d7029bf9-2995-5f77-b4a3-0e83aa96c988', 'bd7573ce-9054-50d9-960f-84793b0f03cd', 'B', 'HPV vaccination is only for girls', false, 1),
  ('2e3ce4d0-212b-5943-afc7-2abd7051017e', 'bd7573ce-9054-50d9-960f-84793b0f03cd', 'C', 'Offer BCG only', false, 2),
  ('14cf459f-b02c-5ed5-82e3-7d424657b2ea', 'bd7573ce-9054-50d9-960f-84793b0f03cd', 'D', 'No vaccines are needed', false, 3),
  ('984b1736-77eb-5805-8a1e-d9d13783c70d', 'bd7573ce-9054-50d9-960f-84793b0f03cd', 'E', 'Offer hepatitis A and B vaccination, and HPV vaccination (eligible up to age 45 in UK sexual health clinics)', true, 4);

-- Q302
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('00070b94-aefd-5df5-ada4-67f9a53b0019', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000020', 'sba', 'A 26 year old woman has had a positive HIV test at her antenatal booking at 10 weeks. She is well. What is the SINGLE most important intervention to prevent transmission to the baby?', 'Antenatal HIV screening and ART reduce vertical transmission to well below 1%. Start ART as soon as possible. Mode of delivery depends on viral load at 36 weeks: vaginal birth if undetectable. The baby receives post-exposure prophylaxis and HIV testing. UK guidance recommends formula feeding, with support for informed breastfeeding choices in women with sustained undetectable viral load.', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v4')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = '00070b94-aefd-5df5-ada4-67f9a53b0019';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('3cce466a-838d-5669-9fa5-4c984e65e24d', '00070b94-aefd-5df5-ada4-67f9a53b0019', 'A', 'Start combined antiretroviral therapy as soon as possible and continue lifelong, aiming for an undetectable viral load', true, 0),
  ('db95d78c-0a96-5f65-b0ba-4596c1a0ad9a', '00070b94-aefd-5df5-ada4-67f9a53b0019', 'B', 'No treatment until after delivery', false, 1),
  ('2172f444-0971-5ad5-b086-7db70a60d420', '00070b94-aefd-5df5-ada4-67f9a53b0019', 'C', 'Termination of pregnancy', false, 2),
  ('b5a3ee33-0735-5c70-8574-2dd50942d51b', '00070b94-aefd-5df5-ada4-67f9a53b0019', 'D', 'Elective caesarean at 28 weeks', false, 3),
  ('ca612dcc-78d3-5ad9-b188-cf79eb0cfe2c', '00070b94-aefd-5df5-ada4-67f9a53b0019', 'E', 'Start ART only at 36 weeks', false, 4);

-- Q303
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('d627d0fc-4a1d-5894-924f-0372a4abee26', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000020', 'sba', 'A 52 year old woman has vulval itching, soreness and dyspareunia. She is postmenopausal. Examination shows pale, thin vaginal mucosa without white plaques. What is the SINGLE most appropriate treatment?', 'Genitourinary syndrome of menopause (atrophic vaginitis) causes dryness, soreness, dyspareunia and urinary symptoms. Treat with vaginal moisturisers and lubricants and low-dose vaginal oestrogen, which can be used long term and alongside systemic HRT. White atrophic plaques suggest lichen sclerosus; any postmenopausal bleeding needs investigation.', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v4')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = 'd627d0fc-4a1d-5894-924f-0372a4abee26';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('88e425df-68ca-5f03-a2b1-2665d97b073e', 'd627d0fc-4a1d-5894-924f-0372a4abee26', 'A', 'Clobetasol cream', false, 0),
  ('dba6a400-2589-510f-85c0-ad48211a5f1d', 'd627d0fc-4a1d-5894-924f-0372a4abee26', 'B', 'Surgical referral', false, 1),
  ('0e7b9b25-98db-5ecb-87e5-e98541236cea', 'd627d0fc-4a1d-5894-924f-0372a4abee26', 'C', 'Systemic antibiotics', false, 2),
  ('e500b32c-9061-5d00-a3c8-831dad3ed168', 'd627d0fc-4a1d-5894-924f-0372a4abee26', 'D', 'Oral fluconazole', false, 3),
  ('f2223ced-724b-5200-8d67-7e304f3ad5f7', 'd627d0fc-4a1d-5894-924f-0372a4abee26', 'E', 'Topical vaginal oestrogen (e.g. estriol cream or vaginal oestradiol tablets), with vaginal moisturisers', true, 4);

-- Q304
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('bb39c34a-0191-52e2-83e8-d3cb0c73e1e8', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000020', 'sba', 'A 28 year old woman wants emergency contraception. She had unprotected sex 30 hours ago. She weighs 92 kg and declines an IUD. What is the SINGLE most appropriate oral option?', 'FSRH: the copper IUD is most effective. For oral EC, ulipristal is more effective than levonorgestrel, especially closer to ovulation. If BMI over 26 or weight over 70 kg and levonorgestrel is used, give 3 mg. Ulipristal is reduced in effect by progestogens taken in the 5 days afterwards, so delay starting hormonal contraception for 5 days.', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v4')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = 'bb39c34a-0191-52e2-83e8-d3cb0c73e1e8';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('1ae0d55e-935f-580f-a96c-cd31307df06c', 'bb39c34a-0191-52e2-83e8-d3cb0c73e1e8', 'A', 'Levonorgestrel 1.5 mg standard dose', false, 0),
  ('fac4721b-633b-59bb-ad5e-96999da58a4c', 'bb39c34a-0191-52e2-83e8-d3cb0c73e1e8', 'B', 'No option because of her weight', false, 1),
  ('5ccb65de-ff27-5587-94e9-f13871e34e77', 'bb39c34a-0191-52e2-83e8-d3cb0c73e1e8', 'C', 'Combined pill for 1 week', false, 2),
  ('330a6c2a-72db-52e9-9417-39068eca554b', 'bb39c34a-0191-52e2-83e8-d3cb0c73e1e8', 'D', 'Progestogen-only pill only', false, 3),
  ('3fdf2031-5eae-5d98-a497-fdba9ca9ee74', 'bb39c34a-0191-52e2-83e8-d3cb0c73e1e8', 'E', 'Ulipristal acetate 30 mg (or levonorgestrel 3 mg, a double dose, if ulipristal is unsuitable)', true, 4);

-- Q305
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('27d0005d-13b5-5ea9-bc6d-e441f93edb17', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000029', 'sba', 'An 87 year old man with moderate dementia has stopped eating much and has lost 5 kg in 2 months. He lives in a care home. What is the SINGLE most appropriate first step?', 'Weight loss in older people is common and often multifactorial. Use the Malnutrition Universal Screening Tool, review medicines, mouth and dentition, mood, cognition, swallowing (speech and language therapy) and social factors. Food-first approaches and oral nutritional supplements are used. Tube feeding is not routinely recommended in advanced dementia.', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v4')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = '27d0005d-13b5-5ea9-bc6d-e441f93edb17';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('4cef4872-51f9-5ca3-a487-09913e848d2c', '27d0005d-13b5-5ea9-bc6d-e441f93edb17', 'A', 'Prescribe high-dose vitamins only', false, 0),
  ('a5a20bc0-b9c1-56ae-bb63-684a3e2e2d57', '27d0005d-13b5-5ea9-bc6d-e441f93edb17', 'B', 'Insert a PEG tube', false, 1),
  ('5b1129ca-9036-58ad-b4c2-a66ae3aad0cb', '27d0005d-13b5-5ea9-bc6d-e441f93edb17', 'C', 'Assess for reversible causes (oral pain, dentures, constipation, depression, drugs, swallowing problems, infection) and screen nutrition with MUST', true, 2),
  ('33ec8e64-f486-562f-a910-2a05470d72bc', '27d0005d-13b5-5ea9-bc6d-e441f93edb17', 'D', 'Start mirtazapine immediately', false, 3),
  ('bfe16aa0-ecc7-56f9-8a7c-8682b2cbd1b7', '27d0005d-13b5-5ea9-bc6d-e441f93edb17', 'E', 'Admit to hospital', false, 4);

-- Q306
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('10f02d82-cba9-504d-a25d-7f6759577c3b', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000029', 'sba', 'A 79 year old woman has had dizziness on standing for several weeks. Lying BP is 148/82 and standing BP after 3 minutes is 118/70. She takes tamsulosin, furosemide and lisinopril. What is the SINGLE most appropriate first management?', 'Orthostatic hypotension is a drop of 20 mmHg systolic or 10 mmHg diastolic within 3 minutes of standing. Common causes: drugs (alpha-blockers, diuretics, vasodilators, antidepressants), dehydration and autonomic failure (Parkinson''s, diabetes). First steps: medication review and lifestyle measures. Fludrocortisone or midodrine are used by specialists.', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v4')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = '10f02d82-cba9-504d-a25d-7f6759577c3b';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('83bd7472-9f57-5282-95d8-cf6550cc63e3', '10f02d82-cba9-504d-a25d-7f6759577c3b', 'A', 'Start fludrocortisone immediately', false, 0),
  ('0da1382c-805b-5194-9eda-16caabc902b0', '10f02d82-cba9-504d-a25d-7f6759577c3b', 'B', 'Add another antihypertensive', false, 1),
  ('230e38d7-6dc7-5022-8dbb-8a1abc1a811e', '10f02d82-cba9-504d-a25d-7f6759577c3b', 'C', 'Medication review (reduce or stop drugs causing postural hypotension) and non-drug measures (fluids, slow rising, compression stockings)', true, 2),
  ('0e7919ce-454b-5312-acfd-a2e1f38eaaa3', '10f02d82-cba9-504d-a25d-7f6759577c3b', 'D', 'Pacemaker', false, 3),
  ('912db5e2-9953-5634-a107-b101b43bbc99', '10f02d82-cba9-504d-a25d-7f6759577c3b', 'E', 'Bed rest', false, 4);

-- Q307
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('783487d8-c494-5ec4-a7fb-de49b9adbf28', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000029', 'sba', 'An 81 year old woman was admitted with pneumonia. She is now medically fit but cannot manage stairs at home. Which approach is MOST appropriate for discharge?', 'Older people deteriorate quickly in hospital. ''Discharge to assess'' moves people home (or to a step-down bed) with short-term reablement support, assessing longer-term needs in their usual setting. Multidisciplinary input (physiotherapy, occupational therapy, social work) helps prevent readmission.', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v4')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = '783487d8-c494-5ec4-a7fb-de49b9adbf28';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('f08c0b8c-7c11-52d8-864c-b2a324c546d3', '783487d8-c494-5ec4-a7fb-de49b9adbf28', 'A', 'Keep her in hospital until fully independent', false, 0),
  ('ea88472e-4a14-5241-8d84-63cdd89c559a', '783487d8-c494-5ec4-a7fb-de49b9adbf28', 'B', 'Transfer to a nursing home permanently', false, 1),
  ('58a02094-aa86-5de9-bb25-f5e196d63095', '783487d8-c494-5ec4-a7fb-de49b9adbf28', 'C', 'Refer to the GP only', false, 2),
  ('8edca827-3a46-5e1f-9824-63dd918a33b4', '783487d8-c494-5ec4-a7fb-de49b9adbf28', 'D', 'Discharge to assess with a reablement or intermediate care package, after multidisciplinary assessment', true, 3),
  ('812b550d-8e0b-58c5-a99f-e71acfc1a585', '783487d8-c494-5ec4-a7fb-de49b9adbf28', 'E', 'Discharge with no follow-up', false, 4);

-- Q308
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('d2932961-fc45-50d2-9740-38c564706e12', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000029', 'sba', 'An 84 year old man has had recurrent falls. He has a slow gait and needs to push up from his chair with his arms. His Timed Up and Go test takes 18 seconds. What does this suggest?', 'A Timed Up and Go over 12 seconds suggests increased falls risk. Multifactorial falls assessment covers gait, balance, strength, medication, vision, continence, cognition, footwear and home hazards. Strength and balance programmes (such as the Otago programme) reduce falls.', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v4')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = 'd2932961-fc45-50d2-9740-38c564706e12';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('3ba91ad0-7feb-516c-a067-565bd087790b', 'd2932961-fc45-50d2-9740-38c564706e12', 'A', 'No action is needed', false, 0),
  ('6400441c-ad41-5fd2-9f63-357fcdbed931', 'd2932961-fc45-50d2-9740-38c564706e12', 'B', 'Normal for his age', false, 1),
  ('5d2613f8-b7b2-53d7-b7c7-72df61bae1ff', 'd2932961-fc45-50d2-9740-38c564706e12', 'C', 'Increased falls risk and impaired mobility; refer for strength and balance training as part of a multifactorial falls intervention', true, 2),
  ('ec02f6e6-4775-5c87-b9a0-a001038a7b50', 'd2932961-fc45-50d2-9740-38c564706e12', 'D', 'Parkinson''s disease is confirmed', false, 3),
  ('120eeb16-aeaf-5a6a-b1ed-b9e996f5b1a3', 'd2932961-fc45-50d2-9740-38c564706e12', 'E', 'He must use a wheelchair', false, 4);

-- Q309
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('2b129f23-5ffe-56e3-82fa-75c9d3f09f58', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000029', 'sba', 'A 90 year old woman with advanced frailty has recurrent hospital admissions. She asks what will happen if her heart stops. She has capacity. What is the SINGLE most appropriate next step?', 'Patients with capacity should be involved in CPR and escalation decisions. Explain the likely outcome of CPR in frailty honestly. The decision should be documented and shared across services. Doctors are not obliged to offer treatment they judge clinically inappropriate, but must discuss the decision with the patient unless it would cause physical or psychological harm.', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v4')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = '2b129f23-5ffe-56e3-82fa-75c9d3f09f58';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('6e640eab-912c-5efb-877a-d7c34bd11ec5', '2b129f23-5ffe-56e3-82fa-75c9d3f09f58', 'A', 'Ask her family to decide', false, 0),
  ('ecd41724-613b-52bc-88ec-d3225b93a1a4', '2b129f23-5ffe-56e3-82fa-75c9d3f09f58', 'B', 'Have a sensitive advance care planning conversation, including CPR and treatment escalation, and record it on a ReSPECT form', true, 1),
  ('307a371d-524b-5689-8f79-248569dad36d', '2b129f23-5ffe-56e3-82fa-75c9d3f09f58', 'C', 'Make a DNACPR decision without discussing it', false, 2),
  ('1c212679-a229-5e99-86cd-d8b2dd36ba1a', '2b129f23-5ffe-56e3-82fa-75c9d3f09f58', 'D', 'Refer to psychiatry', false, 3),
  ('0df01144-c3c8-5421-ae0a-be64ee4ea139', '2b129f23-5ffe-56e3-82fa-75c9d3f09f58', 'E', 'Avoid the topic to prevent distress', false, 4);

-- Q310
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('d5953049-ef5c-5035-9252-b3bd72440c71', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000022', 'sba', 'A 38 year old woman has a breast lump that changes with her cycle. Ultrasound shows a 2 cm simple cyst that is causing discomfort. What is the SINGLE most appropriate management?', 'Breast cysts are common in women aged 35-50. Simple cysts may be aspirated for symptoms. Bloodstained aspirate, a residual mass after aspiration or rapid refilling needs further assessment (core biopsy) to exclude intracystic carcinoma.', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v4')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = 'd5953049-ef5c-5035-9252-b3bd72440c71';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('3d25333a-dd4d-5b4a-8c4e-9c79ad8bb197', 'd5953049-ef5c-5035-9252-b3bd72440c71', 'A', 'Tamoxifen', false, 0),
  ('1aa74155-7b93-56b6-a0eb-da62744efb2f', 'd5953049-ef5c-5035-9252-b3bd72440c71', 'B', 'Aspiration of the cyst (send fluid for cytology only if bloodstained, with imaging if a residual mass remains)', true, 1),
  ('bc7f0c6f-e89a-55a7-a8be-66defe2dac8f', 'd5953049-ef5c-5035-9252-b3bd72440c71', 'C', 'Excision biopsy', false, 2),
  ('2a863132-324c-5e3a-a8f1-04b26b54d6f3', 'd5953049-ef5c-5035-9252-b3bd72440c71', 'D', 'No follow-up after any treatment', false, 3),
  ('90928cc8-40c6-5b32-b54a-2c49c1816e38', 'd5953049-ef5c-5035-9252-b3bd72440c71', 'E', 'Mastectomy', false, 4);

-- Q311
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('20d9ddcd-2257-52ec-a2c8-dc6686884fd1', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000022', 'sba', 'A 50 year old woman is invited for her first breast screening mammogram. She asks about the NHS breast screening programme. What is the CORRECT information?', 'The NHS Breast Screening Programme invites women aged 50 to 71 every 3 years for mammography. Women over 71 can self-refer. Women at high familial risk (BRCA carriers, previous chest radiotherapy) have earlier and more frequent screening, including MRI. Benefits include earlier diagnosis; harms include overdiagnosis and false positives.', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v4')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = '20d9ddcd-2257-52ec-a2c8-dc6686884fd1';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('91e28deb-913a-59c8-86db-ee13bad3d5a2', '20d9ddcd-2257-52ec-a2c8-dc6686884fd1', 'A', 'Screening stops at 60', false, 0),
  ('bcfcba0f-922d-5130-885f-53b8554fd14f', '20d9ddcd-2257-52ec-a2c8-dc6686884fd1', 'B', 'Screening uses ultrasound', false, 1),
  ('34e23566-497f-5990-8bd3-22285efbc238', '20d9ddcd-2257-52ec-a2c8-dc6686884fd1', 'C', 'Women aged 40-50 are screened annually', false, 2),
  ('91c47164-2d28-5f49-814e-52420839a71c', '20d9ddcd-2257-52ec-a2c8-dc6686884fd1', 'D', 'Women aged 50 to their 71st birthday are invited every 3 years for mammography', true, 3),
  ('392095bd-2cf1-5907-9214-f6b11c295e5b', '20d9ddcd-2257-52ec-a2c8-dc6686884fd1', 'E', 'Screening is only for women with a family history', false, 4);

-- Q312
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('9ffb4609-42fd-5bec-8937-5e02b0862bcd', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000022', 'sba', 'A 42 year old woman''s mother and sister both had breast cancer before 50. She asks about her own risk. What is the SINGLE most appropriate next step?', 'NICE CG164: refer people with significant family history (such as two first-degree relatives with breast cancer under 50, ovarian cancer, male breast cancer or bilateral breast cancer) to specialist services. Options for those at increased risk include enhanced surveillance, chemoprevention (tamoxifen, raloxifene or anastrozole) and genetic testing.', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v4')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = '9ffb4609-42fd-5bec-8937-5e02b0862bcd';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('eaed2a53-92cc-50a4-82d3-0b442a4f8dcc', '9ffb4609-42fd-5bec-8937-5e02b0862bcd', 'A', 'Reassure; risk is the same as the general population', false, 0),
  ('aedc83eb-edfb-509d-ba12-7738f868b06a', '9ffb4609-42fd-5bec-8937-5e02b0862bcd', 'B', 'Arrange immediate bilateral mastectomy', false, 1),
  ('2ad7aea3-3020-5fc2-8312-c16692cda8d1', '9ffb4609-42fd-5bec-8937-5e02b0862bcd', 'C', 'Annual CT scan', false, 2),
  ('81e7da92-7c34-5f82-83bc-4062bdcaeee7', '9ffb4609-42fd-5bec-8937-5e02b0862bcd', 'D', 'Start tamoxifen in primary care', false, 3),
  ('9fecfd58-594c-5e9b-8a2a-1c9743636f90', '9ffb4609-42fd-5bec-8937-5e02b0862bcd', 'E', 'Refer to a familial breast cancer (genetics) service for risk assessment', true, 4);

-- Q313
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('4e614b1c-5e83-55b8-919d-ddbfa6c2cc21', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000022', 'sba', 'A 30 year old breastfeeding woman has a painful, red, fluctuant lump in her breast with fever, despite 3 days of flucloxacillin. What is the SINGLE most appropriate management?', 'Lactational breast abscesses are usually caused by Staphylococcus aureus. Ultrasound confirms the collection. Treatment: repeated needle aspiration or small incision drainage, with antibiotics. Breastfeeding can usually continue from the affected side unless the drainage site is close to the nipple.', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v4')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = '4e614b1c-5e83-55b8-919d-ddbfa6c2cc21';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('cc390c9e-17f5-545f-83ad-8b7ca1c6d48c', '4e614b1c-5e83-55b8-919d-ddbfa6c2cc21', 'A', 'Stop breastfeeding permanently', false, 0),
  ('d36362f9-df1d-5cd8-97e2-8605206a8fa1', '4e614b1c-5e83-55b8-919d-ddbfa6c2cc21', 'B', 'Mastectomy', false, 1),
  ('8b70ee3e-18be-534e-bf93-9b58e3f08d28', '4e614b1c-5e83-55b8-919d-ddbfa6c2cc21', 'C', 'Increase antibiotics only', false, 2),
  ('ec77e093-6261-5fef-8359-de14b692f94f', '4e614b1c-5e83-55b8-919d-ddbfa6c2cc21', 'D', 'Ultrasound and needle aspiration (or drainage) of the breast abscess, continue antibiotics, and encourage continued breastfeeding', true, 3),
  ('f5ac8692-1956-5e2b-8cdd-2d0121197554', '4e614b1c-5e83-55b8-919d-ddbfa6c2cc21', 'E', 'Discharge without follow-up', false, 4);

-- Q314
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('40571ae6-89e9-5ba3-9762-db4c929dc050', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000018', 'sba', 'A 68 year old man is listed for a hernia repair. He has a pacemaker. What is the MOST important perioperative consideration?', 'Monopolar diathermy can interfere with pacemakers and ICDs (oversensing, inhibition, inappropriate shocks). Before surgery: check device type, last check and dependency. ICD therapies may need to be suspended. Use bipolar diathermy where possible, and recheck the device after surgery if needed.', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v4')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = '40571ae6-89e9-5ba3-9762-db4c929dc050';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('1ce30111-ce8a-5a04-a491-a0a9fc1e5882', '40571ae6-89e9-5ba3-9762-db4c929dc050', 'A', 'Cancel the surgery', false, 0),
  ('40d7572c-9763-5c86-80cd-437fc8ed15c1', '40571ae6-89e9-5ba3-9762-db4c929dc050', 'B', 'Stop all cardiac drugs', false, 1),
  ('d01feaa7-28a8-5073-8cf2-7cb13f33598c', '40571ae6-89e9-5ba3-9762-db4c929dc050', 'C', 'No precautions needed', false, 2),
  ('8c96d14f-469d-540e-8af5-744304b94205', '40571ae6-89e9-5ba3-9762-db4c929dc050', 'D', 'Check the device type and settings with cardiac physiology; use bipolar diathermy where possible and keep the return electrode away from the device', true, 3),
  ('373ae79a-f040-58b2-9e21-1ea31440b719', '40571ae6-89e9-5ba3-9762-db4c929dc050', 'E', 'Remove the pacemaker before surgery', false, 4);

-- Q315
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('0f4c5de9-93fd-5937-a3fc-bb540056ede8', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000018', 'sba', 'A 75 year old woman is to have elective surgery. She takes apixaban for AF. Her renal function is normal. Surgery has a high bleeding risk. What is the SINGLE most appropriate plan?', 'DOACs have short half-lives. Typically stop apixaban 24 hours before low-bleeding-risk and 48 hours before high-bleeding-risk surgery (longer if renal impairment, especially for dabigatran). Bridging with heparin is not needed. Restart at 24-72 hours after surgery depending on bleeding risk.', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v4')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = '0f4c5de9-93fd-5937-a3fc-bb540056ede8';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('4ca1135a-62de-510d-b51c-6004dfc07fae', '0f4c5de9-93fd-5937-a3fc-bb540056ede8', 'A', 'Stop apixaban 48 hours before surgery and restart once haemostasis is secure (no bridging needed)', true, 0),
  ('02ac9555-ef47-57cc-95ec-735f34ddeb8e', '0f4c5de9-93fd-5937-a3fc-bb540056ede8', 'B', 'Continue apixaban through surgery', false, 1),
  ('6b3ca38a-2f23-5bec-8bb5-1e35dfb546f1', '0f4c5de9-93fd-5937-a3fc-bb540056ede8', 'C', 'Stop it 1 week before and bridge with LMWH', false, 2),
  ('d8853950-f082-5386-8ded-1b0fd99173b8', '0f4c5de9-93fd-5937-a3fc-bb540056ede8', 'D', 'Give vitamin K', false, 3),
  ('4287c31d-f4c8-599a-839e-b583f4e0d253', '0f4c5de9-93fd-5937-a3fc-bb540056ede8', 'E', 'Switch to warfarin', false, 4);

-- Q316
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('48fb8e93-b936-5ec5-9c3e-100c2c0635a1', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000018', 'sba', 'A 55 year old man with type 2 diabetes is having elective surgery. His HbA1c is 92 mmol/mol. What is the SINGLE most appropriate action?', 'Elective surgery should ideally be delayed if HbA1c is over 69 mmol/mol, as poor control increases the risk of infection, poor wound healing and other complications. Optimise control first if safe to delay. Perioperative glucose target is 6-10 mmol/L (up to 12 acceptable).', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v4')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = '48fb8e93-b936-5ec5-9c3e-100c2c0635a1';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('9d061692-2b99-5c3c-93b8-4960ffd7915d', '48fb8e93-b936-5ec5-9c3e-100c2c0635a1', 'A', 'Refer back to primary care or the diabetes team to optimise control before elective surgery', true, 0),
  ('a2d9e477-33f4-55a4-9ee9-19a368249eeb', '48fb8e93-b936-5ec5-9c3e-100c2c0635a1', 'B', 'Cancel surgery permanently', false, 1),
  ('1c9abe30-3e09-5129-8ad0-d17adb98996a', '48fb8e93-b936-5ec5-9c3e-100c2c0635a1', 'C', 'Increase metformin on the day of surgery', false, 2),
  ('6ea5253e-15c9-5003-ae4c-e2d33845ddf9', '48fb8e93-b936-5ec5-9c3e-100c2c0635a1', 'D', 'Give insulin only on the day', false, 3),
  ('505a4504-86a1-5dbb-81c7-7f7db05eb509', '48fb8e93-b936-5ec5-9c3e-100c2c0635a1', 'E', 'Proceed with surgery as planned', false, 4);

-- Q317
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('b5cb2910-f559-5414-b962-3372b6cbb5ea', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000018', 'sba', 'A 30 year old woman wakes after laparoscopic surgery and feels sick and vomits several times. She had a long anaesthetic with opioids. What risk factors are part of the Apfel score for postoperative nausea and vomiting?', 'Apfel score: female, non-smoker, history of PONV or motion sickness, and postoperative opioids. Prophylaxis increases with the number of risk factors (ondansetron, dexamethasone, cyclizine, and TIVA). Treat established PONV with an antiemetic from a different class from the one used for prophylaxis.', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v4')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = 'b5cb2910-f559-5414-b962-3372b6cbb5ea';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('220df5fc-ebd1-59c4-9125-0d7cf013d317', 'b5cb2910-f559-5414-b962-3372b6cbb5ea', 'A', 'Short operations only', false, 0),
  ('1d95af73-2d8a-56cd-bef6-abf5b210cf63', 'b5cb2910-f559-5414-b962-3372b6cbb5ea', 'B', 'Male sex and smoker', false, 1),
  ('f8a256ac-debe-5c63-a2d4-ba8dc7a8bdc6', 'b5cb2910-f559-5414-b962-3372b6cbb5ea', 'C', 'Female sex, non-smoker, history of PONV or motion sickness, and postoperative opioid use', true, 2),
  ('67e4a6f5-eb88-54c9-bca5-8182fcccd555', 'b5cb2910-f559-5414-b962-3372b6cbb5ea', 'D', 'Obesity only', false, 3),
  ('7c67a6ea-7317-5875-9225-eb2f492224ac', 'b5cb2910-f559-5414-b962-3372b6cbb5ea', 'E', 'Age over 80 only', false, 4);

-- Q318
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('74636f5a-7e06-50b0-b121-a240e02305fc', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000018', 'sba', 'A 60 year old man had a total knee replacement. On day 1 his urine output is 15 mL/hour for 3 hours. He is warm, with BP 105/65, HR 105. Creatinine has risen. What is the SINGLE most appropriate initial step?', 'Postoperative oliguria is most often pre-renal (hypovolaemia from blood or fluid loss). First check the catheter, assess volume status, give a fluid challenge if dry, and stop nephrotoxins (NSAIDs, ACE inhibitors, gentamicin). Look for bleeding, sepsis and urinary retention.', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v4')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = '74636f5a-7e06-50b0-b121-a240e02305fc';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('89f49d48-5964-5272-8f76-fedfb655d467', '74636f5a-7e06-50b0-b121-a240e02305fc', 'A', 'Start dialysis', false, 0),
  ('8c022f41-72fb-524b-b40f-3b1b11af9c65', '74636f5a-7e06-50b0-b121-a240e02305fc', 'B', 'Continue NSAIDs', false, 1),
  ('33163b2a-cee0-50cf-aef2-3c14f3457c88', '74636f5a-7e06-50b0-b121-a240e02305fc', 'C', 'Restrict fluids', false, 2),
  ('168adfea-c51e-5a63-b12f-343e5493a051', '74636f5a-7e06-50b0-b121-a240e02305fc', 'D', 'Assess fluid status, check the catheter is not blocked, give a fluid bolus if hypovolaemic, and review nephrotoxic drugs', true, 3),
  ('3f4c0461-ca69-5d08-b570-a076255c3f64', '74636f5a-7e06-50b0-b121-a240e02305fc', 'E', 'Give IV furosemide', false, 4);

-- Q319
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('b41333b6-bb1d-50dd-bb7b-6550601530fb', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000013', 'sba', 'A 15 year old girl asks for an abortion. She does not want her parents to know. She understands the procedure, its risks and alternatives. What is the CORRECT approach?', 'Under-16s who are Gillick competent can consent to medical treatment, including abortion, without parental involvement. Encourage family involvement but respect confidentiality unless there is a safeguarding concern (such as exploitation, abuse, or a much older partner).', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v4')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = 'b41333b6-bb1d-50dd-bb7b-6550601530fb';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('17563408-c5c1-5dc6-be10-073f1bb13c9d', 'b41333b6-bb1d-50dd-bb7b-6550601530fb', 'A', 'Refer to the police in all cases', false, 0),
  ('3fd26203-88ef-50ab-8cae-89548bdf70b2', 'b41333b6-bb1d-50dd-bb7b-6550601530fb', 'B', 'Inform the parents automatically', false, 1),
  ('648cbe47-e5b1-5d9c-af35-709e4500484a', 'b41333b6-bb1d-50dd-bb7b-6550601530fb', 'C', 'Wait until she is 16', false, 2),
  ('4bf25aef-1f84-5e6c-baa7-edfb03d1521b', 'b41333b6-bb1d-50dd-bb7b-6550601530fb', 'D', 'She cannot have an abortion without parental consent', false, 3),
  ('c7a88a3c-871e-5e81-90d2-84527c8dcb5c', 'b41333b6-bb1d-50dd-bb7b-6550601530fb', 'E', 'If she is Gillick competent she can consent herself; encourage involving a parent or trusted adult and consider safeguarding', true, 4);

-- Q320
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('585e07cd-7716-53af-a0d2-580181980950', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000013', 'sba', 'A 35 year old man with capacity refuses a blood test because he dislikes needles. The doctor believes it is important. What is the CORRECT action?', 'A competent adult has the right to refuse investigations or treatment, even if the decision seems unwise. Explain the risks, explore fears (topical anaesthetic, distraction), and document the discussion. Doing it without consent would be assault (battery).', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v4')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = '585e07cd-7716-53af-a0d2-580181980950';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('069d46b5-26cd-53f1-8b40-ef58cab8851f', '585e07cd-7716-53af-a0d2-580181980950', 'A', 'Ask his wife to consent', false, 0),
  ('07d97acc-bab4-5364-9d54-5a92ea6112e2', '585e07cd-7716-53af-a0d2-580181980950', 'B', 'Ask security to restrain him', false, 1),
  ('ba4d7454-2994-5c0d-9528-e905ef918f1e', '585e07cd-7716-53af-a0d2-580181980950', 'C', 'Respect his refusal after explaining the risks of not having the test, explore his concerns and document the discussion', true, 2),
  ('646fc0c7-45ac-5167-b05c-1368d54e6222', '585e07cd-7716-53af-a0d2-580181980950', 'D', 'Use the Mental Health Act', false, 3),
  ('948d4dc0-c009-5964-b28c-6cd44a7cd3e5', '585e07cd-7716-53af-a0d2-580181980950', 'E', 'Take the sample while he is distracted', false, 4);

-- Q321
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('06bd3a11-7211-5f30-af72-effffcb76749', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000013', 'sba', 'A 26 year old woman with a severe learning disability needs a dental extraction under general anaesthetic. She lacks capacity for this decision. Her parents are involved. What is the CORRECT way to decide?', 'Under the MCA, once a person over 16 lacks capacity, decisions are made in their best interests by the decision-maker (usually the clinician). Consult family and carers, consider the person''s wishes and values, and choose the least restrictive option. Parents do not have authority to consent for adults unless they hold an LPA or deputyship.', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v4')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = '06bd3a11-7211-5f30-af72-effffcb76749';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('a608fb6c-3cdd-5598-807b-575ea156adb2', '06bd3a11-7211-5f30-af72-effffcb76749', 'A', 'Make a best-interests decision under the Mental Capacity Act, consulting her parents, carers and the woman herself as far as possible', true, 0),
  ('31e439de-fab7-5f75-bad4-fece30b04cb3', '06bd3a11-7211-5f30-af72-effffcb76749', 'B', 'Apply to the Court of Protection in all cases', false, 1),
  ('f55087a4-0158-5138-839a-bb84e53370a8', '06bd3a11-7211-5f30-af72-effffcb76749', 'C', 'Wait until she regains capacity', false, 2),
  ('70d24607-3908-529e-8459-3f5056a724a6', '06bd3a11-7211-5f30-af72-effffcb76749', 'D', 'Her parents have legal authority to consent on her behalf', false, 3),
  ('5fd3f80f-dbf7-5bad-b53c-7f91af1aab60', '06bd3a11-7211-5f30-af72-effffcb76749', 'E', 'Proceed without discussing', false, 4);

-- Q322
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('3353c751-c463-521a-af49-09c00d92d31f', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000013', 'sba', 'A doctor sees a celebrity patient in the emergency department. A journalist calls asking for information about the patient''s condition. What is the CORRECT response?', 'Duty of confidentiality applies to all patients, including public figures. Even confirming someone is a patient is a breach without consent. Requests from the media should go through the hospital press office, which will only release information with consent.', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v4')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = '3353c751-c463-521a-af49-09c00d92d31f';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('8369ffa4-f46f-56e2-b7c9-c0b5b8ddc303', '3353c751-c463-521a-af49-09c00d92d31f', 'A', 'Disclose only the diagnosis', false, 0),
  ('f59675bc-8860-59d9-831a-c9b4b80dcfaa', '3353c751-c463-521a-af49-09c00d92d31f', 'B', 'Give a brief update since the patient is famous', false, 1),
  ('31709af8-6eba-5d30-bc76-7551be117656', '3353c751-c463-521a-af49-09c00d92d31f', 'C', 'Do not disclose any information without the patient''s consent', true, 2),
  ('4d09a771-d62b-5a8d-a3ef-0d3e40ab1f0b', '3353c751-c463-521a-af49-09c00d92d31f', 'D', 'Confirm the patient is in the department', false, 3),
  ('e77143cb-8239-5123-9def-a2c40c8ca914', '3353c751-c463-521a-af49-09c00d92d31f', 'E', 'Pass the call to the nurse to answer', false, 4);

-- Q323
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('dc73e1f9-f92a-53ec-b992-82d702e81553', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000013', 'sba', 'A GP receives a request from a patient''s insurance company for a full copy of the patient''s medical record. The patient signed a general consent form. What is the CORRECT approach?', 'GMC guidance and the Access to Medical Reports Act 1988: disclose only information relevant to the request, with valid consent. Patients have the right to see reports before they are sent, and to ask for factual errors to be corrected. Do not send the whole record unless specifically justified.', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v4')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = 'dc73e1f9-f92a-53ec-b992-82d702e81553';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('e94b6e3b-17ba-5d8d-84a9-e8c27ae6da23', 'dc73e1f9-f92a-53ec-b992-82d702e81553', 'A', 'Disclose only the relevant information the patient has consented to, offering the patient the chance to see the report before it is sent', true, 0),
  ('e868526b-81a1-5d5c-aec9-3019095ed97b', 'dc73e1f9-f92a-53ec-b992-82d702e81553', 'B', 'Ask the receptionist to send it', false, 1),
  ('317e2b6f-997e-52ea-8179-7c44a7f4dcaa', 'dc73e1f9-f92a-53ec-b992-82d702e81553', 'C', 'Send it without informing the patient', false, 2),
  ('b4794f74-b0f3-5f46-a841-e08ab476f754', 'dc73e1f9-f92a-53ec-b992-82d702e81553', 'D', 'Send the entire record', false, 3),
  ('fd47d605-65cd-508c-81cf-7b7676432d11', 'dc73e1f9-f92a-53ec-b992-82d702e81553', 'E', 'Refuse in all cases', false, 4);

-- Q324
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('2f099787-a7cc-5d57-bc8d-ff1a8fb5c282', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000005', 'sba', 'A 58 year old man has had urinary frequency and urgency, nocturia and a poor stream. Urine dipstick is normal and PSA is normal. He wants to try something before medication. What is the SINGLE most appropriate first advice?', 'NICE CG97: offer lifestyle advice for lower urinary tract symptoms (fluid and caffeine management, bladder training, pelvic floor exercises, urethral milking for post-micturition dribble). A frequency-volume chart helps assess symptoms. Drugs: alpha-blockers for voiding symptoms and antimuscarinics or mirabegron for storage symptoms.', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v4')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = '2f099787-a7cc-5d57-bc8d-ff1a8fb5c282';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('51d99852-f3a1-575b-b172-70ee72f2ac16', '2f099787-a7cc-5d57-bc8d-ff1a8fb5c282', 'A', 'Lifestyle measures: reduce caffeine and alcohol, adjust fluid timing, bladder training and urethral milking', true, 0),
  ('c043737a-d171-5b9c-9da7-b941f7a7ab50', '2f099787-a7cc-5d57-bc8d-ff1a8fb5c282', 'B', 'Long-term antibiotics', false, 1),
  ('80013f43-93a5-54ab-8564-c6c0b5670a16', '2f099787-a7cc-5d57-bc8d-ff1a8fb5c282', 'C', 'Catheterisation', false, 2),
  ('9ca3795a-44d6-5086-af17-7b486f3af3ed', '2f099787-a7cc-5d57-bc8d-ff1a8fb5c282', 'D', 'Immediate TURP', false, 3),
  ('83e48be8-9e18-5705-adda-76f5177ff79d', '2f099787-a7cc-5d57-bc8d-ff1a8fb5c282', 'E', 'Restrict fluids to below 500 mL a day', false, 4);

-- Q325
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('b1add907-bef7-51a7-8ede-64eb94776fdb', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000005', 'sba', 'A 55 year old woman with CKD stage 4 has a raised phosphate, low calcium and raised PTH. What is the SINGLE most appropriate first-line treatment for the high phosphate?', 'CKD-mineral bone disorder: reduced phosphate excretion and reduced activation of vitamin D cause high phosphate, low calcium and secondary hyperparathyroidism. Management: phosphate restriction, phosphate binders, active vitamin D (alfacalcidol) and cinacalcet. Tertiary hyperparathyroidism (high calcium) may need parathyroidectomy.', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v4')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = 'b1add907-bef7-51a7-8ede-64eb94776fdb';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('cfcc76e7-faa5-5dc0-a499-f3939ba8dc04', 'b1add907-bef7-51a7-8ede-64eb94776fdb', 'A', 'Dietary phosphate restriction and a phosphate binder (e.g. calcium acetate or sevelamer)', true, 0),
  ('e3c36413-3ac4-5bbe-8c46-bdeb00b1d60f', 'b1add907-bef7-51a7-8ede-64eb94776fdb', 'B', 'Calcium supplements alone', false, 1),
  ('b9fc72e2-2ec9-55b7-803d-a16cdcdc547f', 'b1add907-bef7-51a7-8ede-64eb94776fdb', 'C', 'Vitamin D only', false, 2),
  ('f4ba7519-3bd8-58ce-99a3-d8d0bb09a539', 'b1add907-bef7-51a7-8ede-64eb94776fdb', 'D', 'Thiazide diuretics', false, 3),
  ('daa305f9-d5b3-5ff4-b27b-ab6e7a49de90', 'b1add907-bef7-51a7-8ede-64eb94776fdb', 'E', 'Parathyroidectomy first-line', false, 4);

-- Q326
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('34bd3e67-0e48-510c-8e46-0db64b539ce0', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000005', 'sba', 'A 20 year old man has had painless visible haematuria 1 day after a sore throat. He had a similar episode a year ago. BP and renal function are normal. What is the SINGLE most likely diagnosis?', 'IgA nephropathy is the commonest glomerulonephritis worldwide. It causes visible haematuria 1-2 days after a respiratory infection (synpharyngitic), unlike post-streptococcal GN (1-3 weeks). Management: BP control and ACE inhibitors or ARBs for proteinuria; SGLT2 inhibitors and other treatments in progressive disease. Prognosis varies.', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v4')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = '34bd3e67-0e48-510c-8e46-0db64b539ce0';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('6459eeb1-a96a-556f-973e-eca13bcb91f1', '34bd3e67-0e48-510c-8e46-0db64b539ce0', 'A', 'Post-streptococcal glomerulonephritis', false, 0),
  ('ac3c8622-0733-5ca1-afd9-7e54758ac864', '34bd3e67-0e48-510c-8e46-0db64b539ce0', 'B', 'Minimal change disease', false, 1),
  ('97c3f98e-0c1d-5f0e-841e-5fcd1be5c770', '34bd3e67-0e48-510c-8e46-0db64b539ce0', 'C', 'Renal stone', false, 2),
  ('72d7c15f-55aa-5f8c-a081-49eb8b600379', '34bd3e67-0e48-510c-8e46-0db64b539ce0', 'D', 'IgA nephropathy', true, 3),
  ('8e8cb92d-16b8-5536-ac93-c2189d697a86', '34bd3e67-0e48-510c-8e46-0db64b539ce0', 'E', 'Bladder cancer', false, 4);

-- Q327
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('203fef30-b324-5fc3-a0e9-720e22b75ab5', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000005', 'sba', 'A 70 year old man has rapidly rising creatinine over 2 weeks, haemoptysis and a urine dipstick with blood and protein. Anti-GBM antibodies are positive. What is the SINGLE most likely diagnosis and treatment?', 'Anti-GBM disease causes rapidly progressive glomerulonephritis and pulmonary haemorrhage. Treatment: urgent plasma exchange, steroids and cyclophosphamide. Rapidly progressive GN (crescents on biopsy) is also caused by ANCA vasculitis and immune complex disease. Urgent nephrology referral is needed.', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v4')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = '203fef30-b324-5fc3-a0e9-720e22b75ab5';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('bdf25d23-b07a-5462-bbbf-d74b8ccad695', '203fef30-b324-5fc3-a0e9-720e22b75ab5', 'A', 'IgA nephropathy; ACE inhibitor', false, 0),
  ('b127ec31-dcd8-54b0-94ea-baa75107b49b', '203fef30-b324-5fc3-a0e9-720e22b75ab5', 'B', 'Anti-GBM disease (Goodpasture''s); plasma exchange, steroids and cyclophosphamide', true, 1),
  ('eddd375a-8f98-5a64-a475-47bd4af3e866', '203fef30-b324-5fc3-a0e9-720e22b75ab5', 'C', 'Minimal change disease; steroids only', false, 2),
  ('d9253731-0a4d-52b0-a38c-c05cb5712c94', '203fef30-b324-5fc3-a0e9-720e22b75ab5', 'D', 'Polycystic kidney disease; tolvaptan', false, 3),
  ('54ceb1f2-b028-5ce4-b7dd-5b807ce03939', '203fef30-b324-5fc3-a0e9-720e22b75ab5', 'E', 'Pre-renal AKI; fluids', false, 4);

-- Q328
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('5ab4f95c-284b-5c31-9796-2b7bbea367b6', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000024', 'sba', 'A 52 year old man has had painless swelling of the left side of his neck for 6 weeks. He has never smoked. Examination of the mouth shows an enlarged tonsil. Biopsy shows HPV-positive squamous cell carcinoma. What is the CORRECT statement about this cancer?', 'HPV-related (mainly HPV16) oropharyngeal squamous cell carcinoma is increasing, often presenting with a cystic neck node in younger people with little or no smoking history. It responds well to treatment (radiotherapy with chemotherapy, or transoral surgery). HPV vaccination of boys and girls should reduce incidence.', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v4')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = '5ab4f95c-284b-5c31-9796-2b7bbea367b6';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('d8fb09f0-7097-5239-bbee-79dd3cad0698', '5ab4f95c-284b-5c31-9796-2b7bbea367b6', 'A', 'HPV vaccination increases the risk', false, 0),
  ('435ab531-5373-5dee-b91f-ae69b11bee06', '5ab4f95c-284b-5c31-9796-2b7bbea367b6', 'B', 'It is not treatable', false, 1),
  ('b9d562d3-f888-5dd6-8d88-1e0142ddb076', '5ab4f95c-284b-5c31-9796-2b7bbea367b6', 'C', 'HPV-positive oropharyngeal cancer has a better prognosis than HPV-negative disease and often occurs in younger non-smokers', true, 2),
  ('8611eb17-a402-5c28-a604-bee87c15ff93', '5ab4f95c-284b-5c31-9796-2b7bbea367b6', 'D', 'It is linked mainly to heavy smoking', false, 3),
  ('8c84c448-6822-5607-a19d-6e7daccf10d5', '5ab4f95c-284b-5c31-9796-2b7bbea367b6', 'E', 'It has a worse prognosis than HPV-negative cancer', false, 4);

-- Q329
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('f1ed36e5-1b9c-528f-ba4d-457c7b13b93d', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000024', 'sba', 'A 60 year old woman on chemotherapy has a temperature of 38.3°C 10 days after her last cycle. She feels shivery but is otherwise well. What is the SINGLE most appropriate action?', 'NICE CG151: suspect neutropenic sepsis in people having anticancer treatment with a temperature over 38°C or signs of sepsis. Give empirical IV piperacillin-tazobactam within 1 hour without waiting for the neutrophil count. Use the MASCC score to identify low-risk patients who may be treated as outpatients.', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v4')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = 'f1ed36e5-1b9c-528f-ba4d-457c7b13b93d';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('38a82865-a54c-5f5c-8872-c7093473b3a7', 'f1ed36e5-1b9c-528f-ba4d-457c7b13b93d', 'A', 'Delay until the next chemotherapy cycle', false, 0),
  ('db81997c-dc2b-5120-b718-bb1bf9d05b66', 'f1ed36e5-1b9c-528f-ba4d-457c7b13b93d', 'B', 'Treat as neutropenic sepsis: urgent assessment and IV broad-spectrum antibiotics (piperacillin-tazobactam) within 1 hour', true, 1),
  ('1edc1e5b-9637-5f0c-a48d-31148aa63445', 'f1ed36e5-1b9c-528f-ba4d-457c7b13b93d', 'C', 'Wait for FBC before any treatment', false, 2),
  ('da7f467b-fad5-511a-a564-3855a67ced2a', 'f1ed36e5-1b9c-528f-ba4d-457c7b13b93d', 'D', 'Advise paracetamol and phone back in 24 hours', false, 3),
  ('bc3183df-75a5-5194-b5c6-bb84b50c3d9d', 'f1ed36e5-1b9c-528f-ba4d-457c7b13b93d', 'E', 'Oral antibiotics at home', false, 4);

-- Q330
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('9395c44a-5396-5c4e-a162-7c52b3ce0010', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000024', 'sba', 'A 66 year old man has dark urine, jaundice and itching. Imaging shows a hilar biliary stricture with dilated intrahepatic ducts. He has a history of primary sclerosing cholangitis. CA19-9 is raised. What is the SINGLE most likely diagnosis?', 'Cholangiocarcinoma causes painless obstructive jaundice and is associated with primary sclerosing cholangitis, liver fluke infection and choledochal cysts. Hilar tumours (Klatskin) are commonest. Imaging: MRCP and CT. Most are not resectable; biliary stenting relieves jaundice. CA19-9 supports diagnosis.', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v4')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = '9395c44a-5396-5c4e-a162-7c52b3ce0010';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('3680b45e-e4f5-5e33-ab2b-3a693cd2a879', '9395c44a-5396-5c4e-a162-7c52b3ce0010', 'A', 'Pancreatic pseudocyst', false, 0),
  ('c01f1ca3-47c5-5f31-b164-f72a82eb4e64', '9395c44a-5396-5c4e-a162-7c52b3ce0010', 'B', 'Liver abscess', false, 1),
  ('3f73ff2a-f75a-549f-9425-4648bd81a196', '9395c44a-5396-5c4e-a162-7c52b3ce0010', 'C', 'Cholangiocarcinoma', true, 2),
  ('63c4cf1f-1409-540b-88a7-375d6e1ec42c', '9395c44a-5396-5c4e-a162-7c52b3ce0010', 'D', 'Gallstones', false, 3),
  ('cbeeeb00-9af0-5e8b-a216-51101adfd04c', '9395c44a-5396-5c4e-a162-7c52b3ce0010', 'E', 'Hepatitis', false, 4);

-- Q331
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('437f1768-9071-5842-ba48-1d6c8992a482', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000024', 'sba', 'A 70 year old man has had a pigmented lesion on his back removed. Histology shows melanoma with a Breslow thickness of 2.5 mm. What does Breslow thickness indicate?', 'Breslow thickness (in mm) is the key prognostic factor in primary melanoma and guides the surgical excision margin and sentinel lymph node biopsy. Wider excision margins follow diagnostic excision. Advanced melanoma is treated with immunotherapy and BRAF/MEK inhibitors for BRAF-mutated tumours.', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v4')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = '437f1768-9071-5842-ba48-1d6c8992a482';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('7b3fe781-42e0-5c8a-85d8-e00f397b8697', '437f1768-9071-5842-ba48-1d6c8992a482', 'A', 'Whether the patient has a BRAF mutation', false, 0),
  ('268b420b-d3b3-573f-98d2-20c6e9822713', '437f1768-9071-5842-ba48-1d6c8992a482', 'B', 'The colour of the lesion', false, 1),
  ('c92dca50-4e1e-595c-921e-bab044a11f74', '437f1768-9071-5842-ba48-1d6c8992a482', 'C', 'The width of the lesion', false, 2),
  ('2e7b4a73-614a-5de2-a640-384ebaa9e60f', '437f1768-9071-5842-ba48-1d6c8992a482', 'D', 'The number of lymph nodes involved', false, 3),
  ('8785bf63-7b36-58c4-803f-caee761e49a2', '437f1768-9071-5842-ba48-1d6c8992a482', 'E', 'The depth of invasion of the melanoma, which is the most important prognostic factor in localised disease', true, 4);

-- Q332
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('c90dd347-08c6-5dd7-9aba-f5b65a8f1f61', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000012', 'sba', 'A 24 year old man has had painful red nodules on both shins for 2 weeks with arthralgia. He had a sore throat 3 weeks ago. What is the SINGLE most likely diagnosis?', 'Erythema nodosum is a panniculitis causing tender red nodules on the shins. Causes: streptococcal infection, sarcoidosis, IBD, TB, drugs (oral contraceptives, sulfonamides), pregnancy and idiopathic. It resolves over weeks without scarring. Investigate the cause (ASO titre, CXR) and treat with rest and NSAIDs.', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v4')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = 'c90dd347-08c6-5dd7-9aba-f5b65a8f1f61';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('74484814-c3ec-5029-beaf-d576ec52edf0', 'c90dd347-08c6-5dd7-9aba-f5b65a8f1f61', 'A', 'Vasculitis', false, 0),
  ('d9498301-34be-5c89-84f5-db394cc6bac3', 'c90dd347-08c6-5dd7-9aba-f5b65a8f1f61', 'B', 'Erythema nodosum', true, 1),
  ('35b31f8c-656d-53fa-8248-9a9d4f8598cd', 'c90dd347-08c6-5dd7-9aba-f5b65a8f1f61', 'C', 'Erythema multiforme', false, 2),
  ('e066729d-f941-5d6c-ba3d-8d6852ef130b', 'c90dd347-08c6-5dd7-9aba-f5b65a8f1f61', 'D', 'Cellulitis', false, 3),
  ('caf99ffc-e2fb-5fae-b0f8-b0382ba82030', 'c90dd347-08c6-5dd7-9aba-f5b65a8f1f61', 'E', 'Pretibial myxoedema', false, 4);

-- Q333
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('4fcc7aad-07ed-53c9-a9c1-e95ddd2f614d', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000012', 'sba', 'A 30 year old woman has developed target-shaped lesions on her palms and soles 1 week after a cold sore. She has no mucosal involvement and feels well. What is the SINGLE most likely diagnosis?', 'Erythema multiforme causes target lesions (central dusky area, pale ring, red outer ring), often acral. Most cases follow HSV infection, and some follow Mycoplasma. It is usually self-limiting. Recurrent HSV-associated cases may be prevented with suppressive aciclovir. Stevens-Johnson syndrome is usually drug-induced, with mucosal involvement and atypical targets.', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v4')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = '4fcc7aad-07ed-53c9-a9c1-e95ddd2f614d';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('711950c5-ee37-500c-bc4a-33c2e5534081', '4fcc7aad-07ed-53c9-a9c1-e95ddd2f614d', 'A', 'Stevens-Johnson syndrome', false, 0),
  ('b24c61d5-2ea3-5006-bc30-5f9692ff2f6e', '4fcc7aad-07ed-53c9-a9c1-e95ddd2f614d', 'B', 'Erythema multiforme (minor)', true, 1),
  ('58c622dd-3c1c-5cf0-aaaa-aea3bd7a5e7f', '4fcc7aad-07ed-53c9-a9c1-e95ddd2f614d', 'C', 'Bullous pemphigoid', false, 2),
  ('d4f1dfc5-22b7-5710-83ef-101499aaf231', '4fcc7aad-07ed-53c9-a9c1-e95ddd2f614d', 'D', 'Secondary syphilis', false, 3),
  ('195c6238-0ae6-598b-acfe-8711c88f6a80', '4fcc7aad-07ed-53c9-a9c1-e95ddd2f614d', 'E', 'Urticaria', false, 4);

-- Q334
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('4b87b975-ec15-5371-8eba-982be9ae0784', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000012', 'sba', 'A 55 year old man has a brown, waxy, ''stuck-on'' lesion on his back with a warty surface. He has several similar lesions. What is the SINGLE most likely diagnosis?', 'Seborrhoeic keratoses are common benign lesions in middle-aged and older people, with a stuck-on, waxy, warty appearance. No treatment is needed unless irritated (cryotherapy or curettage). If uncertain, assess with dermoscopy or refer to exclude melanoma.', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v4')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = '4b87b975-ec15-5371-8eba-982be9ae0784';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('b059026a-a3f7-5a0f-98b6-1462d0e850f0', '4b87b975-ec15-5371-8eba-982be9ae0784', 'A', 'Actinic keratosis', false, 0),
  ('c6602236-0742-5193-926e-72589faac6eb', '4b87b975-ec15-5371-8eba-982be9ae0784', 'B', 'Seborrhoeic keratosis', true, 1),
  ('010db1bc-b48d-5726-a955-b091a0e50a8b', '4b87b975-ec15-5371-8eba-982be9ae0784', 'C', 'Viral wart', false, 2),
  ('e44e42f9-55ec-5db0-a10f-1c1f1b10ae66', '4b87b975-ec15-5371-8eba-982be9ae0784', 'D', 'Melanoma', false, 3),
  ('4da6dd31-90a9-5edc-a175-d7f42e68db03', '4b87b975-ec15-5371-8eba-982be9ae0784', 'E', 'Basal cell carcinoma', false, 4);

-- Q335
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('c79d6b5d-49d2-51bd-bda6-8b9af1ac7729', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000012', 'sba', 'A 40 year old woman has had red, scaly plaques on her elbows, knees and scalp for years. Her psoriasis is now extensive despite topical treatment and affects her quality of life. What is the SINGLE most appropriate next step?', 'NICE CG153: refer for phototherapy or systemic therapy when psoriasis cannot be controlled with topical therapy, is extensive, or has a major impact on wellbeing. First-line systemic: methotrexate (or ciclosporin). Biologics are used when other systemic therapies fail or are unsuitable. Screen for psoriatic arthritis.', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v4')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = 'c79d6b5d-49d2-51bd-bda6-8b9af1ac7729';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('89085af9-9ce8-591e-9546-1fef637d8e2c', 'c79d6b5d-49d2-51bd-bda6-8b9af1ac7729', 'A', 'Oral steroids', false, 0),
  ('7b45edfb-3cd6-5690-960c-adfcef45aef3', 'c79d6b5d-49d2-51bd-bda6-8b9af1ac7729', 'B', 'Oral antibiotics', false, 1),
  ('3f2615b9-4889-575f-b58f-80e8b3cad3bc', 'c79d6b5d-49d2-51bd-bda6-8b9af1ac7729', 'C', 'More potent topical steroids for the whole body', false, 2),
  ('f22adbb7-0da3-5af6-84c2-e1ae3b7f07d4', 'c79d6b5d-49d2-51bd-bda6-8b9af1ac7729', 'D', 'Refer to dermatology for phototherapy (narrowband UVB) or systemic therapy (e.g. methotrexate)', true, 3),
  ('24ad3848-cd85-5dd1-9588-66dc7a7b7ced', 'c79d6b5d-49d2-51bd-bda6-8b9af1ac7729', 'E', 'Antifungal shampoo only', false, 4);

-- Q336
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('90494f6f-c7ae-57a7-ac39-bd61fd2bfb75', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000015', 'sba', 'A 72 year old man has had gradually reduced peripheral vision noticed at his optician. Intraocular pressure is 28 mmHg and optic discs show cupping. He has no eye pain. What is the SINGLE most likely diagnosis and first-line treatment?', 'Primary open-angle glaucoma is usually asymptomatic until late, with peripheral field loss, raised IOP and optic disc cupping. NICE: first-line 360-degree selective laser trabeculoplasty, or prostaglandin analogue drops. Risk factors: age, family history, Black African or Caribbean ethnicity and myopia. First-degree relatives over 40 get free eye tests in England.', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v4')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = '90494f6f-c7ae-57a7-ac39-bd61fd2bfb75';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('816b129c-5678-5149-9843-5c4e7cd0ae4a', '90494f6f-c7ae-57a7-ac39-bd61fd2bfb75', 'A', 'Acute angle-closure glaucoma; acetazolamide', false, 0),
  ('38e0b90c-e87d-5b19-97a6-f9cd854dcb06', '90494f6f-c7ae-57a7-ac39-bd61fd2bfb75', 'B', 'Cataract; surgery', false, 1),
  ('8242479d-6290-5290-978d-2d9efae6c073', '90494f6f-c7ae-57a7-ac39-bd61fd2bfb75', 'C', 'AMD; anti-VEGF', false, 2),
  ('942d0cd6-33ae-5df5-851d-4ec9eef6d08b', '90494f6f-c7ae-57a7-ac39-bd61fd2bfb75', 'D', 'Optic neuritis; steroids', false, 3),
  ('c81a9e3b-6710-5291-b0ac-9f8fbf41e7b6', '90494f6f-c7ae-57a7-ac39-bd61fd2bfb75', 'E', 'Primary open-angle glaucoma; prostaglandin analogue eye drops (e.g. latanoprost)', true, 4);

-- Q337
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('62ca49bf-e12c-5d0b-8058-301d6beaf83c', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000015', 'sba', 'A 75 year old woman has had sudden distorted central vision in her right eye over 1 week. Straight lines look bent. Fundoscopy shows a macular haemorrhage. What is the SINGLE most appropriate management?', 'Wet (neovascular) AMD causes rapid central visual distortion and loss due to choroidal neovascularisation with leakage or haemorrhage. Anti-VEGF injections (aflibercept, ranibizumab, faricimab) preserve vision if started early. Refer within 1 week.', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v4')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = '62ca49bf-e12c-5d0b-8058-301d6beaf83c';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('821a65dd-6920-5060-8764-9339ffbb7915', '62ca49bf-e12c-5d0b-8058-301d6beaf83c', 'A', 'Rapid referral (within 1 week) to a macular service for anti-VEGF injections (wet AMD)', true, 0),
  ('77cb5c53-b59a-5ebe-b64c-e5e8f218f616', '62ca49bf-e12c-5d0b-8058-301d6beaf83c', 'B', 'Laser photocoagulation of the whole retina', false, 1),
  ('ea3262b3-2828-578c-b4db-d6f8effe4669', '62ca49bf-e12c-5d0b-8058-301d6beaf83c', 'C', 'Oral vitamins only', false, 2),
  ('05768524-9f0e-58f1-941b-b32ca1187a4a', '62ca49bf-e12c-5d0b-8058-301d6beaf83c', 'D', 'Observation for 3 months', false, 3),
  ('f16dc754-1763-5d6e-a94f-7801f2e54b8b', '62ca49bf-e12c-5d0b-8058-301d6beaf83c', 'E', 'Routine optician review', false, 4);

-- Q338
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('25abf032-b9e7-50a0-a2eb-246ac95ffb57', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000036', 'sba', 'A 30 year old woman has a son with Duchenne muscular dystrophy. She wants to know her own carrier status before a future pregnancy. What is the SINGLE most appropriate step?', 'Duchenne muscular dystrophy is X-linked recessive (dystrophin gene). Mothers of affected boys may be carriers (about two-thirds) or the mutation may have arisen new. Genetic counselling and targeted testing clarify carrier status. Prenatal or preimplantation genetic testing is available for future pregnancies.', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v4')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = '25abf032-b9e7-50a0-a2eb-246ac95ffb57';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('304321d3-e822-5736-b739-99e17b356421', '25abf032-b9e7-50a0-a2eb-246ac95ffb57', 'A', 'Serum CK alone is diagnostic', false, 0),
  ('d0e363a1-ec4c-51e6-bdb2-fd6f0af686d9', '25abf032-b9e7-50a0-a2eb-246ac95ffb57', 'B', 'No testing is possible', false, 1),
  ('944ff061-e81f-5ecb-a26f-c7017bf863ef', '25abf032-b9e7-50a0-a2eb-246ac95ffb57', 'C', 'Karyotype only', false, 2),
  ('1972a0e3-3af1-5364-bd0f-a00388976b46', '25abf032-b9e7-50a0-a2eb-246ac95ffb57', 'D', 'Refer to clinical genetics for genetic counselling and carrier testing (DMD gene)', true, 3),
  ('f7ad6558-a993-580b-a064-78bc5993b1fb', '25abf032-b9e7-50a0-a2eb-246ac95ffb57', 'E', 'Muscle biopsy', false, 4);

-- Q339
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('d868266d-d211-5cbd-826c-1f00def452db', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000036', 'sba', 'A couple are both carriers of sickle cell trait. They are planning a pregnancy. What is the chance their child will have sickle cell disease?', 'Sickle cell disease is autosomal recessive. When both parents are carriers, each pregnancy has a 25% chance of an affected child, 50% chance of a carrier and 25% chance of an unaffected non-carrier. NHS antenatal screening offers testing early in pregnancy, with partner testing and prenatal diagnosis.', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v4')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = 'd868266d-d211-5cbd-826c-1f00def452db';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('6e800c30-eee2-5dd7-b54e-8487c73f9509', 'd868266d-d211-5cbd-826c-1f00def452db', 'A', '0%', false, 0),
  ('ea53081e-bc94-5e55-97e0-b15eb0330f09', 'd868266d-d211-5cbd-826c-1f00def452db', 'B', '25%', true, 1),
  ('4e2c7dee-7e23-58f2-9233-24dc088ed598', 'd868266d-d211-5cbd-826c-1f00def452db', 'C', '50%', false, 2),
  ('3be7a572-55bc-5739-bfee-d247590c826c', 'd868266d-d211-5cbd-826c-1f00def452db', 'D', '75%', false, 3),
  ('79323442-f842-5522-b177-6b7e53bf9fa2', 'd868266d-d211-5cbd-826c-1f00def452db', 'E', '100%', false, 4);

-- Q340
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('7800a381-006a-5bf4-a006-df1e1a044bce', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000027', 'sba', 'A 66 year old man asks about the shingles vaccine. He has no immunosuppression. What is the CORRECT advice?', 'In the UK, the recombinant (non-live) Shingrix vaccine is offered as 2 doses to people turning 65 (with the eligible age moving down to 60 over time) and to severely immunosuppressed people aged 18 and over. It protects against shingles and post-herpetic neuralgia.', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v4')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = '7800a381-006a-5bf4-a006-df1e1a044bce';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('cd9f41a4-2969-59ae-a666-4ee82ef35b70', '7800a381-006a-5bf4-a006-df1e1a044bce', 'A', 'He is too old for vaccination', false, 0),
  ('566f4c3b-ee83-5d15-8438-6f66409a39a8', '7800a381-006a-5bf4-a006-df1e1a044bce', 'B', 'He is eligible for the recombinant shingles vaccine (Shingrix), given as 2 doses', true, 1),
  ('4baac19d-66d0-5d19-ac06-b6b58a9c5e58', '7800a381-006a-5bf4-a006-df1e1a044bce', 'C', 'He needs a live vaccine only', false, 2),
  ('08058a03-ce27-5b39-9332-6a79b80873c8', '7800a381-006a-5bf4-a006-df1e1a044bce', 'D', 'He should have it every year', false, 3),
  ('06b90f2b-2b7a-5272-8988-c5e481497366', '7800a381-006a-5bf4-a006-df1e1a044bce', 'E', 'Vaccination is only for children', false, 4);

-- Q341
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('22258de9-46e1-59f2-85f7-c7071e476737', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000014', 'sba', 'A 35 year old woman of Pakistani origin has a microcytic anaemia with Hb 108 g/L, MCV 62 and a normal ferritin. Her red cell count is high. What is the SINGLE most likely diagnosis?', 'Thalassaemia trait causes a marked microcytosis with mild or no anaemia, a high red cell count and normal ferritin. Confirm with haemoglobin electrophoresis (raised HbA2 in beta-thalassaemia trait). It does not need treatment, but partner testing is important in pregnancy. Do not give iron unless iron deficient.', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v4')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = '22258de9-46e1-59f2-85f7-c7071e476737';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('a53d8188-2eaf-52bd-9d80-f9d9f9c36238', '22258de9-46e1-59f2-85f7-c7071e476737', 'A', 'Beta-thalassaemia trait', true, 0),
  ('202985c7-4164-5b33-849f-632143f0418b', '22258de9-46e1-59f2-85f7-c7071e476737', 'B', 'Anaemia of chronic disease', false, 1),
  ('c7ed8066-dd5d-5d97-9ce4-906b5a9eb5d0', '22258de9-46e1-59f2-85f7-c7071e476737', 'C', 'Lead poisoning', false, 2),
  ('c69d5807-08c3-5274-89ea-3246cedc5513', '22258de9-46e1-59f2-85f7-c7071e476737', 'D', 'Iron deficiency anaemia', false, 3),
  ('b79612d8-7574-5017-afa7-3c7a48bc929e', '22258de9-46e1-59f2-85f7-c7071e476737', 'E', 'Sideroblastic anaemia', false, 4);

-- Q342
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('d8b596c2-a391-5c5d-a8ff-34b254de5544', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000014', 'sba', 'A 72 year old man has had a DVT in his calf. He is about to start anticoagulation. Which test should be considered in men over 40 with unprovoked VTE?', 'NICE NG158: for people with unprovoked VTE, offer a review of history, physical examination and baseline bloods (FBC, U&E, LFT, calcium, urinalysis) to look for cancer. Further investigation only if suggested by symptoms or signs. Thrombophilia testing is not routinely offered.', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v4')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = 'd8b596c2-a391-5c5d-a8ff-34b254de5544';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('d45c93a2-a57e-5e88-9353-d5b2229e4dde', 'd8b596c2-a391-5c5d-a8ff-34b254de5544', 'A', 'Routine CT of chest, abdomen and pelvis in all', false, 0),
  ('26c70b7b-22f0-5bac-af5b-94e826c390b8', 'd8b596c2-a391-5c5d-a8ff-34b254de5544', 'B', 'History, examination and baseline bloods to look for cancer, with further tests only if symptoms or signs suggest it', true, 1),
  ('bdfcdcf3-03a3-59e3-a9a1-e36e3e52aeb2', 'd8b596c2-a391-5c5d-a8ff-34b254de5544', 'C', 'Thrombophilia testing in all', false, 2),
  ('5acd4acf-df72-5081-af2b-fc3b0e3d7077', 'd8b596c2-a391-5c5d-a8ff-34b254de5544', 'D', 'PET-CT', false, 3),
  ('08cfb80e-b445-5b39-bc08-8d07854ee7f5', 'd8b596c2-a391-5c5d-a8ff-34b254de5544', 'E', 'Bone marrow biopsy', false, 4);

