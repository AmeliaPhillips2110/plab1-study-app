-- =============================================================================
-- PLAB 1 full SBA bank import (generated from PLAB_1_Question_Bank.xlsx)
-- Source: PLAB_1_Question_Bank_4.xlsx
-- Paste into Supabase SQL after: seed_topics_expand.sql + clear_sample_questions.sql
-- Safe to re-run (stable UUIDs from uuid5 of stem+options).
-- =============================================================================

-- Ensure exam exists
insert into public.exams (id, slug, name, description, is_active) values ('a1000000-0000-4000-8000-000000000001', 'plab1', 'PLAB 1', 'PLAB 1 single best answer study bank (PLABoratory).', true) on conflict (slug) do update set name = excluded.name, is_active = true;

-- Q1
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('cc3af290-ee58-50b3-b14a-2263d4a33f4a', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000033', 'sba', 'Which nerve is at risk during surgical removal of the submandibular gland, causing weakness of the corner of the mouth?', 'The marginal mandibular branch of the facial nerve runs below the mandible near the submandibular gland, and injury causes lower lip asymmetry. The lingual nerve (taste and sensation to the anterior two-thirds of the tongue) and hypoglossal nerve (tongue movement) are also at risk during submandibular surgery.', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v4')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = 'cc3af290-ee58-50b3-b14a-2263d4a33f4a';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('ca3687fa-f140-5574-83e5-b626ae9b1ee6', 'cc3af290-ee58-50b3-b14a-2263d4a33f4a', 'A', 'Hypoglossal nerve', false, 0),
  ('20a0fe51-3545-5b2c-b534-41acf40775e8', 'cc3af290-ee58-50b3-b14a-2263d4a33f4a', 'B', 'Lingual nerve', false, 1),
  ('5528e531-075e-59df-94c6-dc45234a3f3a', 'cc3af290-ee58-50b3-b14a-2263d4a33f4a', 'C', 'Marginal mandibular branch of the facial nerve', true, 2),
  ('fe7bebb0-d2b8-5022-b98c-ed840cc16f64', 'cc3af290-ee58-50b3-b14a-2263d4a33f4a', 'D', 'Accessory nerve', false, 3),
  ('bd2598cf-06f3-5a22-8dd4-aad21d0856ea', 'cc3af290-ee58-50b3-b14a-2263d4a33f4a', 'E', 'Glossopharyngeal nerve', false, 4);

-- Q2
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('d0fa93ef-1937-5b63-9f54-1f01ea69c1ee', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000033', 'sba', 'A 25 year old man fractured the shaft of his humerus. He now has wrist drop and loss of sensation over the dorsum of the first web space. Which nerve is injured?', 'The radial nerve runs in the spiral groove of the humerus and is injured in midshaft fractures, causing wrist drop and sensory loss over the dorsal first web space. Triceps is usually spared (branches arise above the groove). Most recover with conservative management.', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v4')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = 'd0fa93ef-1937-5b63-9f54-1f01ea69c1ee';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('df95c2b5-092b-5d2a-a52e-f215c67b6b93', 'd0fa93ef-1937-5b63-9f54-1f01ea69c1ee', 'A', 'Musculocutaneous nerve', false, 0),
  ('fb5ef86f-e608-5680-982e-9e84012af5ed', 'd0fa93ef-1937-5b63-9f54-1f01ea69c1ee', 'B', 'Radial nerve', true, 1),
  ('b53589bb-8377-5266-89a6-b9029120e96a', 'd0fa93ef-1937-5b63-9f54-1f01ea69c1ee', 'C', 'Axillary nerve', false, 2),
  ('2adee071-d64e-5b99-a2c0-e35ad56b90ad', 'd0fa93ef-1937-5b63-9f54-1f01ea69c1ee', 'D', 'Median nerve', false, 3),
  ('9a62fd27-6f29-5308-a9cb-25d992681265', 'd0fa93ef-1937-5b63-9f54-1f01ea69c1ee', 'E', 'Ulnar nerve', false, 4);

-- Q3
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('ef1dd9ba-cc69-5847-9c12-69f11179ef42', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000033', 'sba', 'A 40 year old woman has an anterior dislocation of her shoulder. After reduction, she has numbness over the ''regimental badge'' area and weak shoulder abduction. Which nerve is injured?', 'The axillary nerve passes around the surgical neck of the humerus and is at risk with anterior shoulder dislocation and fractures of the surgical neck. It supplies deltoid and teres minor, and sensation over the lateral upper arm. Always document axillary nerve function before and after reduction.', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v4')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = 'ef1dd9ba-cc69-5847-9c12-69f11179ef42';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('5b3c18dd-af24-53d6-ba15-6f47918a1eea', 'ef1dd9ba-cc69-5847-9c12-69f11179ef42', 'A', 'Suprascapular nerve', false, 0),
  ('7f5ca6d3-ef59-5ee7-9d4e-e1eed751ca71', 'ef1dd9ba-cc69-5847-9c12-69f11179ef42', 'B', 'Radial nerve', false, 1),
  ('ed2fdd71-23ed-5adb-bff3-6c586d54b1b6', 'ef1dd9ba-cc69-5847-9c12-69f11179ef42', 'C', 'Axillary nerve', true, 2),
  ('7332c9c5-47c2-5f6f-90a1-cd03bda136a6', 'ef1dd9ba-cc69-5847-9c12-69f11179ef42', 'D', 'Long thoracic nerve', false, 3),
  ('ad48e8f1-de79-5473-9a20-afa1c1c9e651', 'ef1dd9ba-cc69-5847-9c12-69f11179ef42', 'E', 'Musculocutaneous nerve', false, 4);

-- Q4
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('35d884a9-ad59-5c6e-a619-e03681439b56', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000033', 'sba', 'Which structure passes through the foramen ovale of the skull?', 'Foramen ovale transmits V3, the accessory meningeal artery and the lesser petrosal nerve. Foramen rotundum transmits V2, the superior orbital fissure transmits V1, III, IV and VI, the jugular foramen transmits IX, X and XI, and the hypoglossal canal transmits XII. The internal acoustic meatus transmits VII and VIII.', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v4')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = '35d884a9-ad59-5c6e-a619-e03681439b56';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('ea22f598-209a-5660-a800-eef97ac009ea', '35d884a9-ad59-5c6e-a619-e03681439b56', 'A', 'Internal carotid artery', false, 0),
  ('2669ae0c-715c-5182-97b3-a4c2102a8602', '35d884a9-ad59-5c6e-a619-e03681439b56', 'B', 'Maxillary division (V2)', false, 1),
  ('0d537f21-f6af-5458-9d92-0089980234ef', '35d884a9-ad59-5c6e-a619-e03681439b56', 'C', 'Hypoglossal nerve', false, 2),
  ('a149badf-2342-5d72-b405-620274dd8cbc', '35d884a9-ad59-5c6e-a619-e03681439b56', 'D', 'Mandibular division of the trigeminal nerve (V3)', true, 3),
  ('ba8cac7f-c61b-55fa-adb2-2cf3477e3c8e', '35d884a9-ad59-5c6e-a619-e03681439b56', 'E', 'Facial nerve', false, 4);

-- Q5
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('6eb5e49b-f707-52bc-adbb-a855ec48a7b7', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000033', 'sba', 'Which hormone is released by the duodenum in response to fat and protein, causing gallbladder contraction and pancreatic enzyme secretion?', 'CCK is released from I cells in the duodenum and jejunum in response to fats and amino acids. It stimulates gallbladder contraction, relaxes the sphincter of Oddi, stimulates pancreatic enzyme secretion and slows gastric emptying. Secretin (S cells) stimulates pancreatic bicarbonate secretion in response to acid.', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v4')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = '6eb5e49b-f707-52bc-adbb-a855ec48a7b7';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('b85bf388-c730-54de-b116-a3c37597a8f7', '6eb5e49b-f707-52bc-adbb-a855ec48a7b7', 'A', 'Gastrin', false, 0),
  ('4c68acd0-58a7-5154-a3a0-0ea55dbcecca', '6eb5e49b-f707-52bc-adbb-a855ec48a7b7', 'B', 'Secretin', false, 1),
  ('e9b359ac-8231-56b4-a2db-805d58a6c8ca', '6eb5e49b-f707-52bc-adbb-a855ec48a7b7', 'C', 'Cholecystokinin (CCK)', true, 2),
  ('3f27562d-c7f9-594b-bee7-9d61b0757da4', '6eb5e49b-f707-52bc-adbb-a855ec48a7b7', 'D', 'Motilin', false, 3),
  ('929e643c-d858-5f66-8eeb-761d21f35428', '6eb5e49b-f707-52bc-adbb-a855ec48a7b7', 'E', 'Somatostatin', false, 4);

-- Q6
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('ea2e572a-0574-542d-b7fb-d41e8ca410c9', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000033', 'sba', 'A drug has a half-life of 6 hours. It is given as a regular dose. Approximately how long will it take to reach steady state?', 'Steady state is reached after about 4-5 half-lives, regardless of dose. Loading doses are used to reach therapeutic levels faster for drugs with long half-lives (such as amiodarone and digoxin). Similarly, a drug is mostly eliminated 4-5 half-lives after stopping.', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v4')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = 'ea2e572a-0574-542d-b7fb-d41e8ca410c9';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('2f550133-20be-53fd-97a3-86603483c12a', 'ea2e572a-0574-542d-b7fb-d41e8ca410c9', 'A', '6 hours', false, 0),
  ('e11c2511-f23f-5fba-9fa1-526f56f9518d', 'ea2e572a-0574-542d-b7fb-d41e8ca410c9', 'B', 'About 24-30 hours (4-5 half-lives)', true, 1),
  ('335e2afe-8c20-58d4-b8fc-b076dfb4c8fc', 'ea2e572a-0574-542d-b7fb-d41e8ca410c9', 'C', '1 week', false, 2),
  ('ce7683b6-78c2-517f-87a1-f7c16fefe297', 'ea2e572a-0574-542d-b7fb-d41e8ca410c9', 'D', 'It never reaches steady state', false, 3),
  ('90385f11-be60-5b7c-a4c3-1f7e153a1615', 'ea2e572a-0574-542d-b7fb-d41e8ca410c9', 'E', '12 hours', false, 4);

-- Q7
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('a99bd264-18c4-596a-8b41-58bfb8d3b3b8', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000033', 'sba', 'What is the main physiological mechanism by which the kidneys respond to a fall in blood pressure?', 'Low renal perfusion pressure, low sodium delivery to the macula densa and sympathetic stimulation cause renin release from juxtaglomerular cells. Renin converts angiotensinogen to angiotensin I, ACE converts it to angiotensin II (vasoconstriction, aldosterone and ADH release, thirst). Aldosterone increases sodium and water reabsorption.', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v4')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = 'a99bd264-18c4-596a-8b41-58bfb8d3b3b8';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('921852c9-261b-5d51-a4ec-3a9b2b7401bc', 'a99bd264-18c4-596a-8b41-58bfb8d3b3b8', 'A', 'Reduced ADH secretion', false, 0),
  ('a92f8c3e-efb8-585f-a0e6-1d25354b489b', 'a99bd264-18c4-596a-8b41-58bfb8d3b3b8', 'B', 'Decreased sodium reabsorption', false, 1),
  ('d22d4ca8-765b-5396-aab1-738eef7b41f8', 'a99bd264-18c4-596a-8b41-58bfb8d3b3b8', 'C', 'Increased secretion of ANP', false, 2),
  ('6b816d90-4729-58fd-af8a-6e6ef199114e', 'a99bd264-18c4-596a-8b41-58bfb8d3b3b8', 'D', 'Increased prostaglandin destruction', false, 3),
  ('a7003310-a5e0-54a6-b107-08cd495e42c3', 'a99bd264-18c4-596a-8b41-58bfb8d3b3b8', 'E', 'Juxtaglomerular cells release renin, activating angiotensin II and aldosterone', true, 4);

-- Q8
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('41f2ee89-bb44-5f85-b80c-e491ba53d788', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000033', 'sba', 'A patient has a tumour causing compression of the optic chiasm. Which visual field defect is MOST likely?', 'Compression of the optic chiasm (pituitary adenoma, craniopharyngioma, meningioma) affects crossing nasal retinal fibres, causing bitemporal hemianopia. Pituitary tumours compress from below (upper quadrants affected first), while craniopharyngiomas compress from above (lower quadrants first). Lesions behind the chiasm cause homonymous defects.', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v4')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = '41f2ee89-bb44-5f85-b80c-e491ba53d788';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('e789ccea-792f-5569-a3ba-79674654703f', '41f2ee89-bb44-5f85-b80c-e491ba53d788', 'A', 'Central scotoma', false, 0),
  ('221fc26c-d84d-5be4-916f-a7f22d506c3d', '41f2ee89-bb44-5f85-b80c-e491ba53d788', 'B', 'Monocular blindness', false, 1),
  ('fc341fb7-bca2-5f1e-95b1-2ae8b9613894', '41f2ee89-bb44-5f85-b80c-e491ba53d788', 'C', 'Homonymous hemianopia', false, 2),
  ('58bd5b7b-380d-53b9-b753-8454ea85ad31', '41f2ee89-bb44-5f85-b80c-e491ba53d788', 'D', 'Bitemporal hemianopia', true, 3),
  ('3f24fd18-4514-5f53-84d5-ae2b10513902', '41f2ee89-bb44-5f85-b80c-e491ba53d788', 'E', 'Superior quadrantanopia', false, 4);

-- Q9
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('3965d1d5-3172-5317-9811-8d9160c47d96', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000036', 'sba', 'A couple have a child with cystic fibrosis. Both parents are healthy. What is the chance that their next child will be a carrier but unaffected?', 'In autosomal recessive inheritance with two carrier parents, each child has a 25% chance of being affected, 50% chance of being a carrier, and 25% chance of being unaffected and not a carrier. An unaffected sibling of an affected child has a 2 in 3 chance of being a carrier.', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v4')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = '3965d1d5-3172-5317-9811-8d9160c47d96';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('5fa3e072-fc14-5848-bc36-b88f37a21a9d', '3965d1d5-3172-5317-9811-8d9160c47d96', 'A', '0%', false, 0),
  ('ca0ff8c9-1408-54c6-93a9-4b199dcdd9a8', '3965d1d5-3172-5317-9811-8d9160c47d96', 'B', '1 in 2 (50%)', true, 1),
  ('ae97e7ab-0ae5-543c-b94c-4a2ba676d595', '3965d1d5-3172-5317-9811-8d9160c47d96', 'C', '1 in 4 (25%)', false, 2),
  ('766f3de9-a8ef-5476-87b0-8c0c68166d1c', '3965d1d5-3172-5317-9811-8d9160c47d96', 'D', '2 in 3', false, 3),
  ('d0a9e940-9dec-5ba3-b6bd-3a772686b68c', '3965d1d5-3172-5317-9811-8d9160c47d96', 'E', '3 in 4 (75%)', false, 4);

-- Q10
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('060ecb33-b117-58df-9a4e-970ec4868d6b', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000036', 'sba', 'A boy has Duchenne muscular dystrophy. His mother is a carrier. What is the chance that her next son will be affected?', 'In X-linked recessive inheritance, a carrier mother passes the affected X to half of her children. Each son has a 50% chance of being affected, and each daughter has a 50% chance of being a carrier. Affected fathers pass the gene to all daughters (carriers) but no sons.', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v4')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = '060ecb33-b117-58df-9a4e-970ec4868d6b';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('be41be61-fad4-5de3-90e9-242d7ab1a7d8', '060ecb33-b117-58df-9a4e-970ec4868d6b', 'A', '0%', false, 0),
  ('52ae7513-4dd6-5654-a0a2-649aad1769bb', '060ecb33-b117-58df-9a4e-970ec4868d6b', 'B', '1 in 4 (25%)', false, 1),
  ('b7f06827-19ad-595e-a34d-46cb02d4426b', '060ecb33-b117-58df-9a4e-970ec4868d6b', 'C', '1 in 3', false, 2),
  ('c55b51c8-c469-5169-944d-cd3bf96e43b7', '060ecb33-b117-58df-9a4e-970ec4868d6b', 'D', '1 in 2 (50%)', true, 3),
  ('d492ea0b-1382-5b3d-b877-fbad98858da2', '060ecb33-b117-58df-9a4e-970ec4868d6b', 'E', '100%', false, 4);

-- Q11
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('93259ac6-8ddd-5a4d-bfb2-14ce4198afba', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000036', 'sba', 'A 16 year old boy has hundreds of colonic polyps on colonoscopy. His father died of bowel cancer at 40. What is the SINGLE most likely diagnosis and management?', 'FAP is autosomal dominant (APC gene), causing hundreds to thousands of colonic adenomas from adolescence, with almost 100% lifetime risk of colorectal cancer. Screening from age 12-14 and prophylactic colectomy (usually in late teens or early twenties) are recommended. Extracolonic features: duodenal adenomas, desmoid tumours and CHRPE.', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v4')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = '93259ac6-8ddd-5a4d-bfb2-14ce4198afba';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('1f1c2e80-fa4c-5c43-b1b0-f027147b7cae', '93259ac6-8ddd-5a4d-bfb2-14ce4198afba', 'A', 'Juvenile polyposis; no treatment', false, 0),
  ('b72df62d-6c46-5f42-9a07-78ad1628fb55', '93259ac6-8ddd-5a4d-bfb2-14ce4198afba', 'B', 'Lynch syndrome; colonoscopy every 2 years', false, 1),
  ('34809361-6a4e-5abd-a12d-20cac3f9e8ff', '93259ac6-8ddd-5a4d-bfb2-14ce4198afba', 'C', 'Familial adenomatous polyposis; prophylactic colectomy', true, 2),
  ('df291d8e-1adf-5867-b4d9-b1498de02bbf', '93259ac6-8ddd-5a4d-bfb2-14ce4198afba', 'D', 'Peutz-Jeghers syndrome; surveillance only', false, 3),
  ('c53f40e2-afbf-51f8-b1f3-19344cb2c179', '93259ac6-8ddd-5a4d-bfb2-14ce4198afba', 'E', 'Inflammatory bowel disease; steroids', false, 4);

-- Q12
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('378db890-3a71-5553-9593-09c937b9d248', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000036', 'sba', 'A 35 year old man has a family history of early-onset movement problems. He has involuntary jerky movements, irritability and cognitive decline. His father developed similar symptoms at 50. What is the SINGLE most likely diagnosis and inheritance pattern?', 'Huntington''s disease is caused by a CAG trinucleotide repeat expansion in the HTT gene on chromosome 4. It shows anticipation (earlier onset in successive generations, especially through paternal transmission). Features: chorea, psychiatric symptoms and dementia. Predictive testing requires genetic counselling. There is no cure.', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v4')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = '378db890-3a71-5553-9593-09c937b9d248';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('54d35b4d-8e2a-5a84-91ab-6070642bc028', '378db890-3a71-5553-9593-09c937b9d248', 'A', 'Wilson''s disease; autosomal recessive', false, 0),
  ('cbae4f2c-aaf9-547f-a378-858c56a87f5f', '378db890-3a71-5553-9593-09c937b9d248', 'B', 'Fragile X; X-linked', false, 1),
  ('4affc2b0-42d2-55fd-80ac-dbaf3b4e0aee', '378db890-3a71-5553-9593-09c937b9d248', 'C', 'Huntington''s disease; autosomal dominant with anticipation (CAG repeats)', true, 2),
  ('973a4fef-094a-5561-8632-5bfd4b5a9e16', '378db890-3a71-5553-9593-09c937b9d248', 'D', 'Parkinson''s disease; sporadic', false, 3),
  ('c572b767-9123-5417-91da-a6b863182f92', '378db890-3a71-5553-9593-09c937b9d248', 'E', 'Friedreich''s ataxia; autosomal recessive', false, 4);

-- Q13
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('d65093ad-afa1-5ee5-8b33-755facd3cea1', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000036', 'sba', 'A tall 16 year old boy has gynaecomastia, small firm testes and learning difficulties. Karyotype is 47,XXY. What is the SINGLE most likely diagnosis and key long-term issue?', 'Klinefelter syndrome (47,XXY) causes primary hypogonadism (small testes, high LH and FSH, low testosterone), infertility, tall stature, gynaecomastia and learning or behavioural difficulties. Testosterone replacement helps virilisation, bone density and mood. Sperm retrieval with ICSI may allow fertility. Increased risk of breast cancer and osteoporosis.', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v4')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = 'd65093ad-afa1-5ee5-8b33-755facd3cea1';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('922e2189-e066-55fe-ac28-1fec842ab745', 'd65093ad-afa1-5ee5-8b33-755facd3cea1', 'A', 'Turner syndrome; short stature', false, 0),
  ('47137e38-00cb-5a2f-aeed-ac7b0dd0a049', 'd65093ad-afa1-5ee5-8b33-755facd3cea1', 'B', 'Fragile X; learning disability only', false, 1),
  ('c46d18c9-0d38-5ddd-acf3-43078395ee3c', 'd65093ad-afa1-5ee5-8b33-755facd3cea1', 'C', 'Marfan syndrome; aortic dissection', false, 2),
  ('c443ff92-9d28-5be9-8a2b-3d746f8308ba', 'd65093ad-afa1-5ee5-8b33-755facd3cea1', 'D', 'Androgen insensitivity; gonadectomy', false, 3),
  ('db0f0714-1108-582e-9eac-f45c7532c882', 'd65093ad-afa1-5ee5-8b33-755facd3cea1', 'E', 'Klinefelter syndrome; infertility and hypogonadism (testosterone replacement)', true, 4);

-- Q14
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('5e3888c9-0526-5a81-990c-6e1a45f339aa', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000036', 'sba', 'A 15 year old girl has short stature, primary amenorrhoea, a webbed neck and widely spaced nipples. What is the SINGLE most likely karyotype and associated cardiac abnormality?', 'Turner syndrome causes short stature, ovarian failure (primary amenorrhoea, infertility), webbed neck, lymphoedema at birth, and cardiac and renal abnormalities. Cardiac lesions include bicuspid aortic valve and coarctation, with a risk of aortic dissection. Treatment: growth hormone and oestrogen replacement.', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v4')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = '5e3888c9-0526-5a81-990c-6e1a45f339aa';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('cf80a765-c605-5905-967f-b7a66fa556bd', '5e3888c9-0526-5a81-990c-6e1a45f339aa', 'A', '45,X0 (Turner syndrome); coarctation of the aorta and bicuspid aortic valve', true, 0),
  ('b0523623-2aec-5eb1-8f55-84a541632caf', '5e3888c9-0526-5a81-990c-6e1a45f339aa', 'B', '46,XY; no cardiac issue', false, 1),
  ('6a35eb1f-8dfd-5d62-8a36-f029d77ead35', '5e3888c9-0526-5a81-990c-6e1a45f339aa', 'C', '47,XXY; mitral valve prolapse', false, 2),
  ('312b61f0-f03f-515b-b06e-7fa79922755a', '5e3888c9-0526-5a81-990c-6e1a45f339aa', 'D', '47,XXX; VSD', false, 3),
  ('3b3aa82a-f633-5510-8ad2-b913cfbf3720', '5e3888c9-0526-5a81-990c-6e1a45f339aa', 'E', 'Trisomy 21; AVSD', false, 4);

-- Q15
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('59ac4c0c-c0a1-5a49-bcc2-ca898c5c5f32', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000003', 'sba', 'A 50 year old woman has had dysphagia to both solids and liquids from the start, regurgitation of undigested food and weight loss. Barium swallow shows a dilated oesophagus with a ''bird''s beak'' narrowing. What is the SINGLE most likely diagnosis?', 'Achalasia is failure of the lower oesophageal sphincter to relax with loss of peristalsis, causing dysphagia to solids and liquids from the outset, regurgitation and chest pain. Diagnosis: high-resolution manometry. Endoscopy excludes cancer (pseudoachalasia). Treatment: pneumatic dilatation, Heller''s myotomy, POEM, or botulinum toxin for frail patients.', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v4')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = '59ac4c0c-c0a1-5a49-bcc2-ca898c5c5f32';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('0963f361-fcc6-5bdf-a5ad-cfc44a486436', '59ac4c0c-c0a1-5a49-bcc2-ca898c5c5f32', 'A', 'Peptic stricture', false, 0),
  ('88ba4a92-7a1e-5972-bf12-ab374a018cee', '59ac4c0c-c0a1-5a49-bcc2-ca898c5c5f32', 'B', 'Oesophageal cancer', false, 1),
  ('54c44a3b-a79b-5ce3-9702-adecaee6624c', '59ac4c0c-c0a1-5a49-bcc2-ca898c5c5f32', 'C', 'Pharyngeal pouch', false, 2),
  ('bd6d1251-4525-5759-8385-69e737443d9f', '59ac4c0c-c0a1-5a49-bcc2-ca898c5c5f32', 'D', 'Achalasia', true, 3),
  ('1aabbdfa-cbce-53bc-9464-fdc397ef68d3', '59ac4c0c-c0a1-5a49-bcc2-ca898c5c5f32', 'E', 'Diffuse oesophageal spasm', false, 4);

-- Q16
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('1651182b-3e1f-5742-b822-6ccad8e779f0', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000003', 'sba', 'A 65 year old man with cirrhosis has rising creatinine, low urine output and low urine sodium. He has not responded to stopping diuretics and IV albumin for 2 days. There is no shock or nephrotoxic drugs. What is the SINGLE most likely diagnosis?', 'Hepatorenal syndrome is functional renal failure in advanced liver disease caused by splanchnic vasodilation and renal vasoconstriction. It is diagnosed after excluding other causes and failure to respond to volume expansion with albumin. Treatment: terlipressin with albumin. Liver transplant is the definitive treatment.', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v4')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = '1651182b-3e1f-5742-b822-6ccad8e779f0';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('9e7a4714-16de-5b1d-abe7-6b535cb1890c', '1651182b-3e1f-5742-b822-6ccad8e779f0', 'A', 'Glomerulonephritis', false, 0),
  ('1130c5b0-91b5-5e30-80df-bdfb88a86949', '1651182b-3e1f-5742-b822-6ccad8e779f0', 'B', 'Hepatorenal syndrome (HRS-AKI)', true, 1),
  ('93d259b3-b3af-509f-825c-d8319ca20274', '1651182b-3e1f-5742-b822-6ccad8e779f0', 'C', 'Acute tubular necrosis', false, 2),
  ('ae902c50-92a4-58b1-af26-a5e8c7c457d1', '1651182b-3e1f-5742-b822-6ccad8e779f0', 'D', 'Pre-renal AKI from vomiting', false, 3),
  ('a0dc6778-72b4-5b2e-bc60-b2dd6d828a58', '1651182b-3e1f-5742-b822-6ccad8e779f0', 'E', 'Obstructive uropathy', false, 4);

-- Q17
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('37d1076b-ec7c-52a8-9bed-f7e76376f784', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000003', 'sba', 'A 50 year old woman with cirrhosis is confused, drowsy and has a flapping tremor. She is constipated. What is the SINGLE most appropriate treatment?', 'Hepatic encephalopathy is triggered by infection, GI bleeding, constipation, electrolyte disturbance, dehydration and sedative drugs. Lactulose reduces ammonia absorption. Rifaximin is added to prevent recurrence. Avoid sedatives. Protein restriction is not recommended.', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v4')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = '37d1076b-ec7c-52a8-9bed-f7e76376f784';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('5b97374f-5c0f-5571-8087-67b01c25c58d', '37d1076b-ec7c-52a8-9bed-f7e76376f784', 'A', 'High-protein restriction to zero', false, 0),
  ('d69804bb-27e6-55b5-b208-56433d90f6ec', '37d1076b-ec7c-52a8-9bed-f7e76376f784', 'B', 'Benzodiazepines', false, 1),
  ('0c57ae22-d2ff-5e6b-b0e9-a63000e7203c', '37d1076b-ec7c-52a8-9bed-f7e76376f784', 'C', 'Opioid analgesia', false, 2),
  ('3b81ba65-cd67-5485-b88f-5d3fac418fd7', '37d1076b-ec7c-52a8-9bed-f7e76376f784', 'D', 'Lactulose (titrated to 2-3 soft stools/day) and rifaximin, and treat precipitating causes', true, 3),
  ('9aba93c2-b11e-5c39-95de-d3d73a565175', '37d1076b-ec7c-52a8-9bed-f7e76376f784', 'E', 'IV antibiotics only', false, 4);

-- Q18
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('8dd00690-4fe0-5898-bc66-b8fe04f4ab86', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000008', 'sba', 'A 28 year old woman has had irregular periods, acne, hirsutism and weight gain. Ultrasound shows multiple peripheral follicles in both ovaries. What is the SINGLE most appropriate first-line management if she does not want pregnancy?', 'PCOS (Rotterdam criteria: 2 of oligo- or anovulation, clinical or biochemical hyperandrogenism, polycystic ovaries on ultrasound). Management: lifestyle and weight loss, COC for cycle regulation and hirsutism, and screening for diabetes, dyslipidaemia, sleep apnoea and depression. Endometrial protection is needed if periods are very infrequent. Letrozole for ovulation induction when trying to conceive.', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v4')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = '8dd00690-4fe0-5898-bc66-b8fe04f4ab86';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('6720ed48-9e9d-5fc1-9d27-406e03c2653b', '8dd00690-4fe0-5898-bc66-b8fe04f4ab86', 'A', 'Ovarian drilling', false, 0),
  ('6e6e4bcc-d615-5e70-9cc2-da7d615b1677', '8dd00690-4fe0-5898-bc66-b8fe04f4ab86', 'B', 'Metformin alone for hirsutism', false, 1),
  ('fb646e25-9541-5ed5-9a34-fa95016880e8', '8dd00690-4fe0-5898-bc66-b8fe04f4ab86', 'C', 'Clomifene', false, 2),
  ('6e835498-720e-5541-ac62-2bc785397f62', '8dd00690-4fe0-5898-bc66-b8fe04f4ab86', 'D', 'Weight loss and lifestyle changes, with the combined oral contraceptive pill to regulate cycles and treat hirsutism', true, 3),
  ('5ef710b5-e649-5692-8915-d4beebe112a1', '8dd00690-4fe0-5898-bc66-b8fe04f4ab86', 'E', 'Hysterectomy', false, 4);

-- Q19
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('7e86da56-3142-56ae-9363-41e03d21b4c8', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000008', 'sba', 'A 34 year old woman is 8 weeks pregnant. She has had persistent vomiting, weight loss over 5%, dehydration and ketonuria. What is the SINGLE most likely diagnosis?', 'Hyperemesis gravidarum: severe nausea and vomiting with over 5% weight loss, dehydration and electrolyte imbalance. Ultrasound excludes molar and multiple pregnancy. Treatment: antiemetics (cyclizine, prochlorperazine, promethazine, then ondansetron or metoclopramide), IV fluids, thiamine and VTE prophylaxis. Corticosteroids for refractory cases.', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v4')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = '7e86da56-3142-56ae-9363-41e03d21b4c8';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('c4736837-80d5-5e8a-8a03-447e68c36c7d', '7e86da56-3142-56ae-9363-41e03d21b4c8', 'A', 'Hyperemesis gravidarum', true, 0),
  ('facca49b-44d5-5193-a400-87cdcdd5137b', '7e86da56-3142-56ae-9363-41e03d21b4c8', 'B', 'Normal morning sickness', false, 1),
  ('7f54679f-49f4-5649-abe7-48a17d55edeb', '7e86da56-3142-56ae-9363-41e03d21b4c8', 'C', 'Appendicitis', false, 2),
  ('09a24fc7-2b58-53ee-b017-81595b508437', '7e86da56-3142-56ae-9363-41e03d21b4c8', 'D', 'Gastroenteritis', false, 3),
  ('1fad0f5d-af78-5462-a3f6-7ba8afbc6e9f', '7e86da56-3142-56ae-9363-41e03d21b4c8', 'E', 'Molar pregnancy only', false, 4);

-- Q20
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('0cb69c52-baa9-5eec-bcee-8bcc7314e358', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000008', 'sba', 'A 26 year old woman is 6 weeks pregnant. She has left iliac fossa pain and light vaginal bleeding. Beta-hCG is 2,000 IU/L. Transvaginal ultrasound shows no intrauterine pregnancy and a 2 cm adnexal mass with no heartbeat. She is stable. What is a medical treatment option?', 'Ectopic pregnancy management: expectant (small, stable, hCG under 1,000-1,500 and falling), medical (methotrexate for stable women with hCG below 1,500, or up to 5,000 in some cases, small unruptured mass and no heartbeat), or surgical (salpingectomy, or salpingotomy if contralateral tube damage). Surgery for rupture or severe pain.', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v4')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = '0cb69c52-baa9-5eec-bcee-8bcc7314e358';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('d1979c86-cede-5a13-a397-cf84f92e8cfa', '0cb69c52-baa9-5eec-bcee-8bcc7314e358', 'A', 'Methotrexate (if criteria met: no significant pain, unruptured mass under 35 mm, hCG below 1,500-5,000 and able to attend follow-up)', true, 0),
  ('a028bf09-b613-5d61-8028-785ab9b062e9', '0cb69c52-baa9-5eec-bcee-8bcc7314e358', 'B', 'Mifepristone', false, 1),
  ('e8d92a9d-1a75-516b-add5-7213656bfeaa', '0cb69c52-baa9-5eec-bcee-8bcc7314e358', 'C', 'Expectant management in all', false, 2),
  ('961f1c04-b471-5c51-9adf-64a831e0c9a5', '0cb69c52-baa9-5eec-bcee-8bcc7314e358', 'D', 'Oxytocin', false, 3),
  ('aeb97c5b-c111-5e28-8ca5-ca961afe8478', '0cb69c52-baa9-5eec-bcee-8bcc7314e358', 'E', 'Misoprostol', false, 4);

-- Q21
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('eb9245a6-465d-554c-b23a-e43de0456821', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000008', 'sba', 'A 25 year old woman is 26 weeks pregnant. Her 75 g oral glucose tolerance test shows a 2-hour result is 8.9 mmol/L, fasting 5.4 mmol/L. What is the SINGLE most likely diagnosis and first-line management?', 'NICE: gestational diabetes is diagnosed with a fasting glucose of 5.6 or more or a 2-hour value of 7.8 or more. Fasting below 7.0: diet and exercise first, then metformin, then insulin. Fasting of 7.0 or more at diagnosis: start insulin. Offer a fasting glucose 6-13 weeks after birth. Increased lifelong risk of type 2 diabetes.', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v4')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = 'eb9245a6-465d-554c-b23a-e43de0456821';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('01c6e52a-67b4-5bdd-8ed1-248381a9d4b0', 'eb9245a6-465d-554c-b23a-e43de0456821', 'A', 'Pre-eclampsia; labetalol', false, 0),
  ('b15307ad-63ed-5996-97e8-fd4928b2d378', 'eb9245a6-465d-554c-b23a-e43de0456821', 'B', 'Normal result; no action', false, 1),
  ('f17d08b6-7789-5f82-aef6-8d6d3463371c', 'eb9245a6-465d-554c-b23a-e43de0456821', 'C', 'Type 1 diabetes; insulin', false, 2),
  ('e866599b-87eb-54ee-94b9-5feb17000e80', 'eb9245a6-465d-554c-b23a-e43de0456821', 'D', 'Gestational diabetes; diet and exercise advice with glucose monitoring, adding metformin if targets are not met in 1-2 weeks', true, 3),
  ('b9286b6c-7c02-53a2-ad67-49539c9767e6', 'eb9245a6-465d-554c-b23a-e43de0456821', 'E', 'Type 2 diabetes; gliclazide', false, 4);

-- Q22
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('05b7d8cb-4f00-587e-a5b0-6eb2c086f40b', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000025', 'sba', 'A 70 year old man has a chest X-ray showing blunting of the right costophrenic angle with a meniscus sign. What is the SINGLE most likely finding?', 'Pleural effusions show blunting of the costophrenic angle and a meniscus (concave upper border). About 200-300 mL is needed to be seen on an erect PA film. Ultrasound is more sensitive and guides aspiration. A large effusion may shift the mediastinum away from the effusion, while collapse pulls it towards the affected side.', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v4')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = '05b7d8cb-4f00-587e-a5b0-6eb2c086f40b';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('ba32c22f-c211-5f76-998e-9ec3b1deb0c5', '05b7d8cb-4f00-587e-a5b0-6eb2c086f40b', 'A', 'Pleural effusion', true, 0),
  ('a9bdb56e-ceb7-5a12-bad9-536e6ef973c3', '05b7d8cb-4f00-587e-a5b0-6eb2c086f40b', 'B', 'Lobar collapse', false, 1),
  ('af0b16c2-3e45-56a6-ac99-706dd9c698c8', '05b7d8cb-4f00-587e-a5b0-6eb2c086f40b', 'C', 'Consolidation', false, 2),
  ('f41dc4b9-6fb3-50c3-ab99-f8e782bf0bf9', '05b7d8cb-4f00-587e-a5b0-6eb2c086f40b', 'D', 'Pneumothorax', false, 3),
  ('50c41ebf-43d7-5e6d-8f1e-77e545e1d3ab', '05b7d8cb-4f00-587e-a5b0-6eb2c086f40b', 'E', 'Pulmonary oedema', false, 4);

-- Q23
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('315a2fbf-403e-5ca0-8641-fa79f7fcda4d', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000025', 'sba', 'A 55 year old man has had progressively worsening jaundice. Ultrasound shows a dilated common bile duct. What is the SINGLE most appropriate next non-invasive imaging test to define the biliary anatomy?', 'MRCP is non-invasive and the investigation of choice to image the biliary tree and identify stones, strictures or masses. ERCP is used mainly for therapy (stone removal, stenting) because of risks such as pancreatitis, bleeding and perforation. CT pancreas protocol is used to stage suspected pancreatic cancer.', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v4')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = '315a2fbf-403e-5ca0-8641-fa79f7fcda4d';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('661d9632-62cd-5db6-a2d9-f95e59f550df', '315a2fbf-403e-5ca0-8641-fa79f7fcda4d', 'A', 'MRCP (magnetic resonance cholangiopancreatography)', true, 0),
  ('9ce1e055-7bcc-5b96-8e48-9180e36677ee', '315a2fbf-403e-5ca0-8641-fa79f7fcda4d', 'B', 'HIDA scan', false, 1),
  ('225b6baf-e679-524d-95d5-53b6358c058b', '315a2fbf-403e-5ca0-8641-fa79f7fcda4d', 'C', 'Barium meal', false, 2),
  ('c9d4505e-4b66-55ff-a7a2-b503d93108e7', '315a2fbf-403e-5ca0-8641-fa79f7fcda4d', 'D', 'Plain abdominal X-ray', false, 3),
  ('1de9f621-f8c4-54ff-adc4-ef9498ed7167', '315a2fbf-403e-5ca0-8641-fa79f7fcda4d', 'E', 'ERCP as the first diagnostic test', false, 4);

-- Q24
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('3c0882e2-f4dd-5ae4-899d-f7252119b275', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000025', 'sba', 'A 25 year old man has a suspected scaphoid fracture. Initial X-ray is normal. Which imaging is MOST sensitive to detect an occult fracture early?', 'MRI is the most sensitive test for occult scaphoid fractures and also identifies other injuries. CT is an alternative if MRI is unavailable. Repeat X-rays at 10-14 days are less reliable. Immobilise until the fracture is excluded.', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v4')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = '3c0882e2-f4dd-5ae4-899d-f7252119b275';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('b9dc0812-9fc9-5d22-9294-f8346a8d5cdf', '3c0882e2-f4dd-5ae4-899d-f7252119b275', 'A', 'CT angiography', false, 0),
  ('6aae334f-ac76-5be3-8eef-d424443afe80', '3c0882e2-f4dd-5ae4-899d-f7252119b275', 'B', 'MRI of the wrist', true, 1),
  ('177e8d15-09de-5b16-b064-1b24b2121c14', '3c0882e2-f4dd-5ae4-899d-f7252119b275', 'C', 'Ultrasound', false, 2),
  ('a08a6b4b-f5e1-5d41-8471-9de03e6fc349', '3c0882e2-f4dd-5ae4-899d-f7252119b275', 'D', 'Repeat X-ray the same day', false, 3),
  ('0ba5d759-c847-5528-8031-bef609111855', '3c0882e2-f4dd-5ae4-899d-f7252119b275', 'E', 'Bone scan within 24 hours', false, 4);

-- Q25
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('26750cce-8221-57d7-85f2-004ca94b4833', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000025', 'sba', 'A 4 year old child has been brought in after swallowing a button battery 30 minutes ago. What is the SINGLE most appropriate imaging?', 'Button batteries lodged in the oesophagus can cause severe burns and perforation within 2 hours. An X-ray shows a ''halo'' or double-ring sign, which distinguishes it from a coin. Batteries in the oesophagus need emergency removal. Honey (in children over 1, before removal) may reduce injury. Magnets can also cause bowel perforation if more than one is swallowed.', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v4')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = '26750cce-8221-57d7-85f2-004ca94b4833';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('ff77a1ea-e941-5653-98f3-a09b7fc43694', '26750cce-8221-57d7-85f2-004ca94b4833', 'A', 'Ultrasound only', false, 0),
  ('f0f7a201-ae50-5416-87b2-1e70cefc0ff1', '26750cce-8221-57d7-85f2-004ca94b4833', 'B', 'Urgent X-ray (neck to abdomen) to locate the battery; if it is in the oesophagus, urgent endoscopic removal', true, 1),
  ('895d5698-e44e-50ee-a833-78365e763794', '26750cce-8221-57d7-85f2-004ca94b4833', 'C', 'MRI', false, 2),
  ('e1c344f4-c0cd-513f-a557-5f7a4dad17c4', '26750cce-8221-57d7-85f2-004ca94b4833', 'D', 'No imaging; let it pass', false, 3),
  ('1bf8858d-ed77-5b36-b1f9-3014e9833e0e', '26750cce-8221-57d7-85f2-004ca94b4833', 'E', 'CT in 1 week', false, 4);

-- Q26
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('6d5e5970-e21f-5950-8ba4-09820ef16326', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000025', 'sba', 'A 50 year old woman needs a CT with IV iodinated contrast. She has an eGFR of 25 and diabetes. What is the MOST important precaution?', 'People with eGFR below 30 (or below 40 with risk factors) are at increased risk of contrast-associated AKI. Measures include IV hydration, avoiding dehydration, temporarily stopping nephrotoxic drugs and checking creatinine 48-72 hours after. Metformin may be withheld for 48 hours in those with reduced eGFR. Gadolinium carries a risk of nephrogenic systemic fibrosis in severe renal impairment.', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v4')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = '6d5e5970-e21f-5950-8ba4-09820ef16326';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('58c200ec-8599-57f0-a349-f2b2265f8b76', '6d5e5970-e21f-5950-8ba4-09820ef16326', 'A', 'Use MRI with gadolinium in all cases', false, 0),
  ('79b02ffb-a928-51a5-a4e0-72d2d1ed527e', '6d5e5970-e21f-5950-8ba4-09820ef16326', 'B', 'Give furosemide before', false, 1),
  ('c1871b33-ea0f-5b02-bb77-3e8e105c1698', '6d5e5970-e21f-5950-8ba4-09820ef16326', 'C', 'Assess risk of contrast-induced AKI; ensure hydration, review nephrotoxic drugs (e.g. withhold metformin per local guidance) and recheck renal function', true, 2),
  ('dd694856-d3c3-5a29-b34e-6dbc5b33d92a', '6d5e5970-e21f-5950-8ba4-09820ef16326', 'D', 'Give contrast at double dose', false, 3),
  ('c2b89ad5-5d43-50a4-b257-c076eeb0df23', '6d5e5970-e21f-5950-8ba4-09820ef16326', 'E', 'No precautions needed', false, 4);

-- Q27
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('48333511-d4cf-5ed3-8fa6-ca031427ea51', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000025', 'sba', 'A 72 year old man has had back pain for 6 weeks and weight loss. He has prostate cancer. Which test is BEST to look for spinal metastases with possible cord compression?', 'MRI of the whole spine is the investigation of choice for suspected spinal metastases and cord compression (within 24 hours if neurological signs, within 1 week if pain only suggests metastases). Bone scans detect bone metastases but cannot assess the cord. Plain X-ray is insensitive.', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v4')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = '48333511-d4cf-5ed3-8fa6-ca031427ea51';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('55c7081d-0318-5a55-8eba-a9bf73afabb8', '48333511-d4cf-5ed3-8fa6-ca031427ea51', 'A', 'Whole-spine MRI', true, 0),
  ('b089478b-6c1e-5a89-aba3-9c4fcf8f0ffe', '48333511-d4cf-5ed3-8fa6-ca031427ea51', 'B', 'Plain X-ray of the spine', false, 1),
  ('573e9fab-275b-5021-a6e7-1dcd26f7f8d7', '48333511-d4cf-5ed3-8fa6-ca031427ea51', 'C', 'Ultrasound', false, 2),
  ('50c1b658-ad6e-5dbd-b518-07c9053b8319', '48333511-d4cf-5ed3-8fa6-ca031427ea51', 'D', 'Bone scan only', false, 3),
  ('def30a0d-0fb4-5334-bd88-4aa2dc9f61af', '48333511-d4cf-5ed3-8fa6-ca031427ea51', 'E', 'CT head', false, 4);

-- Q28
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('71c26a04-f9d2-5bc8-beb6-90235886dd3f', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000025', 'sba', 'A 28 year old woman has had a seizure for the first time. She is now well, with a normal neurological examination. Which imaging is preferred to look for a structural cause?', 'NICE: MRI is the preferred imaging in people with a first seizure or newly diagnosed epilepsy, to detect structural lesions (such as hippocampal sclerosis, cortical dysplasia or tumour). CT is used acutely when MRI is not available or contraindicated, or in emergencies (head injury, focal signs, persistent reduced consciousness).', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v4')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = '71c26a04-f9d2-5bc8-beb6-90235886dd3f';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('128fafd8-3021-579b-a7ab-9dee4fac79ca', '71c26a04-f9d2-5bc8-beb6-90235886dd3f', 'A', 'Skull X-ray', false, 0),
  ('2e660bac-f684-585b-981c-26e0d848c927', '71c26a04-f9d2-5bc8-beb6-90235886dd3f', 'B', 'Carotid Doppler', false, 1),
  ('49dbf742-2833-50aa-9e1c-1c3655d78c4e', '71c26a04-f9d2-5bc8-beb6-90235886dd3f', 'C', 'MRI brain (epilepsy protocol)', true, 2),
  ('96b1316c-8799-5e35-851c-7754a84bc1dc', '71c26a04-f9d2-5bc8-beb6-90235886dd3f', 'D', 'No imaging needed', false, 3),
  ('85c0bfa8-0c7a-56ce-ba15-923ac4a93af8', '71c26a04-f9d2-5bc8-beb6-90235886dd3f', 'E', 'CT head in all cases', false, 4);

-- Q29
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('5ea1c54c-a83f-52d9-8668-6c0bdc9f826e', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000021', 'sba', 'A study follows 10,000 people over 10 years, comparing smokers and non-smokers for the development of bladder cancer. What type of study is this?', 'Cohort studies follow groups defined by exposure over time to compare disease incidence, allowing calculation of relative risk. They are good for rare exposures and multiple outcomes but expensive for rare diseases. Case-control studies start from disease status and look back at exposures (odds ratio), and are good for rare diseases.', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v4')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = '5ea1c54c-a83f-52d9-8668-6c0bdc9f826e';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('b4ed78de-f6f0-5730-a16b-a3fbab331f47', '5ea1c54c-a83f-52d9-8668-6c0bdc9f826e', 'A', 'Prospective cohort study', true, 0),
  ('7e107929-125d-5281-92f0-42f560efbd43', '5ea1c54c-a83f-52d9-8668-6c0bdc9f826e', 'B', 'Ecological study', false, 1),
  ('51035f22-b941-5e3c-87af-edb6d4ccf21f', '5ea1c54c-a83f-52d9-8668-6c0bdc9f826e', 'C', 'Cross-sectional study', false, 2),
  ('4735db1c-52b8-597a-9ddd-6e2ee5d5a71c', '5ea1c54c-a83f-52d9-8668-6c0bdc9f826e', 'D', 'Case-control study', false, 3),
  ('c77c533c-fb1b-5f30-9d32-ed195a1d3d26', '5ea1c54c-a83f-52d9-8668-6c0bdc9f826e', 'E', 'Randomised controlled trial', false, 4);

-- Q30
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('d5f18170-41f8-52c9-b456-bf8d31d5da8a', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000021', 'sba', 'A disease has an incidence of 5 per 1,000 per year and an average duration of 4 years. Assuming a steady state, what is the approximate prevalence?', 'Prevalence is approximately incidence multiplied by average duration (in steady state): 5 per 1,000 per year x 4 years = 20 per 1,000. Prevalence is the proportion of a population with a disease at a point in time. Incidence is new cases over a period. Better treatment that prolongs survival without cure increases prevalence.', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v4')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = 'd5f18170-41f8-52c9-b456-bf8d31d5da8a';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('1d0b4663-f38e-5b64-a4e0-bf3f20ac1730', 'd5f18170-41f8-52c9-b456-bf8d31d5da8a', 'A', '1.25 per 1,000', false, 0),
  ('671537ce-d3c2-5733-acc9-a3f4f339efb3', 'd5f18170-41f8-52c9-b456-bf8d31d5da8a', 'B', '4 per 1,000', false, 1),
  ('ff44c77c-e706-54ff-bdb9-ab05967aa791', 'd5f18170-41f8-52c9-b456-bf8d31d5da8a', 'C', '5 per 1,000', false, 2),
  ('79a7a57b-ff7a-5a17-936a-d295a4ce8a14', 'd5f18170-41f8-52c9-b456-bf8d31d5da8a', 'D', '9 per 1,000', false, 3),
  ('79e1f9f5-9151-52b4-a337-ab3307924046', 'd5f18170-41f8-52c9-b456-bf8d31d5da8a', 'E', '20 per 1,000', true, 4);

-- Q31
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('2f31e22a-7f8b-57bf-9644-5a17b90775ab', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000021', 'sba', 'Which criteria are used to judge whether a screening programme is appropriate?', 'Wilson and Jungner criteria (1968) for screening include: the condition is an important health problem, has a detectable early stage and accepted treatment; there is a suitable, acceptable test; the natural history is understood; costs are balanced; and case-finding is a continuous process. The UK National Screening Committee uses an updated version.', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v4')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = '2f31e22a-7f8b-57bf-9644-5a17b90775ab';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('d4eca3c9-0471-52c0-bd01-041f40251c5a', '2f31e22a-7f8b-57bf-9644-5a17b90775ab', 'A', 'Wilson and Jungner criteria', true, 0),
  ('6c301302-169a-54b2-b0cf-537a0bfef21c', '2f31e22a-7f8b-57bf-9644-5a17b90775ab', 'B', 'Caldicott principles', false, 1),
  ('9de51605-381a-547a-9d21-27355b532c31', '2f31e22a-7f8b-57bf-9644-5a17b90775ab', 'C', 'Bradford Hill criteria', false, 2),
  ('efcbf3d0-5f90-5ba4-933d-7ae212dbddb4', '2f31e22a-7f8b-57bf-9644-5a17b90775ab', 'D', 'Fraser guidelines', false, 3),
  ('d49dd6f3-fa56-57d8-9c30-26f7f54bcc15', '2f31e22a-7f8b-57bf-9644-5a17b90775ab', 'E', 'Duke criteria', false, 4);

-- Q32
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('141a3764-d847-5d64-8205-3ea8b8ce995d', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000021', 'sba', 'A researcher wants to know whether an association between heavy alcohol use and oral cancer is likely to be causal. Which framework is used?', 'Bradford Hill criteria for causation include strength of association, consistency, specificity, temporality (exposure precedes outcome; the only essential criterion), biological gradient (dose-response), plausibility, coherence, experiment and analogy.', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v4')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = '141a3764-d847-5d64-8205-3ea8b8ce995d';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('f2156e0f-828e-5a1c-af36-abf6de171d11', '141a3764-d847-5d64-8205-3ea8b8ce995d', 'A', 'Wilson and Jungner criteria', false, 0),
  ('2144d5fd-7d0f-5acc-b33e-7182148f5582', '141a3764-d847-5d64-8205-3ea8b8ce995d', 'B', 'Bradford Hill criteria', true, 1),
  ('d4579b1f-469a-5901-862c-4c43ccb9b855', '141a3764-d847-5d64-8205-3ea8b8ce995d', 'C', 'Kaplan-Meier', false, 2),
  ('43993185-d95b-5f2f-8668-9b38c353f58a', '141a3764-d847-5d64-8205-3ea8b8ce995d', 'D', 'PICO', false, 3),
  ('224f076f-9f41-5819-89fa-06aff1d5cafd', '141a3764-d847-5d64-8205-3ea8b8ce995d', 'E', 'Gillick competence', false, 4);

-- Q33
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('48735daf-d0c4-5d38-ab97-93a3db98166c', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000021', 'sba', 'A study finds that people who take vitamin supplements have lower heart disease rates, but supplement users also exercise more and smoke less. What is this problem called?', 'A confounder is linked to both exposure and outcome, and is not on the causal pathway, distorting the apparent association. It is handled by randomisation (best), restriction, matching, stratification and multivariable adjustment. Observational studies are especially vulnerable.', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v4')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = '48735daf-d0c4-5d38-ab97-93a3db98166c';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('6634d8c7-2404-54e8-8f5f-5a03ed4c198d', '48735daf-d0c4-5d38-ab97-93a3db98166c', 'A', 'Confounding', true, 0),
  ('7da67836-fa4c-57e2-bacd-fd77f3c5078e', '48735daf-d0c4-5d38-ab97-93a3db98166c', 'B', 'Observer bias', false, 1),
  ('81728e16-c586-56f0-9537-28ddb1133863', '48735daf-d0c4-5d38-ab97-93a3db98166c', 'C', 'Publication bias', false, 2),
  ('d1674e84-4e67-5d30-a0f5-b9344054723e', '48735daf-d0c4-5d38-ab97-93a3db98166c', 'D', 'Recall bias', false, 3),
  ('e1045ba3-e640-5e7b-a95b-ed9d674a37b7', '48735daf-d0c4-5d38-ab97-93a3db98166c', 'E', 'Lead-time bias', false, 4);

-- Q34
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('75b34b9e-29c3-53e3-8d54-4e3b821251ca', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000021', 'sba', 'A screening test is introduced in a population where the disease is rare. Compared with a high-prevalence population, how does this affect the test''s positive predictive value?', 'Sensitivity and specificity are properties of the test and do not change with prevalence. Predictive values do depend on prevalence: in low-prevalence settings, PPV falls and NPV rises. This is why screening rare diseases produces many false positives.', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v4')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = '75b34b9e-29c3-53e3-8d54-4e3b821251ca';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('fb5d56d6-8d63-5304-98a6-32bafcb6d495', '75b34b9e-29c3-53e3-8d54-4e3b821251ca', 'A', 'There is no effect on PPV', false, 0),
  ('f4f9fbce-a232-5047-91f8-d6c84de6c22b', '75b34b9e-29c3-53e3-8d54-4e3b821251ca', 'B', 'Specificity falls', false, 1),
  ('4e0dc45d-d3f6-5518-8b69-2d94e23e41af', '75b34b9e-29c3-53e3-8d54-4e3b821251ca', 'C', 'Sensitivity falls', false, 2),
  ('3461b2db-d06c-595f-83a4-adebaaf8128f', '75b34b9e-29c3-53e3-8d54-4e3b821251ca', 'D', 'The positive predictive value falls (more false positives relative to true positives)', true, 3),
  ('33a62652-af10-586d-b2a5-eb0c9aa78321', '75b34b9e-29c3-53e3-8d54-4e3b821251ca', 'E', 'PPV increases', false, 4);

-- Q35
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('c4a4b284-9cb2-5c29-80ae-0b20e01f3cb1', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000021', 'sba', 'Which UK body is responsible for advising ministers on which screening programmes should be offered?', 'The UK National Screening Committee advises on screening policy in all four UK nations, based on evidence reviews. NICE produces clinical guidance and technology appraisals. The MHRA regulates medicines and devices, the GMC regulates doctors and the CQC regulates health and social care services in England.', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v4')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = 'c4a4b284-9cb2-5c29-80ae-0b20e01f3cb1';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('6e283101-1479-5b14-a49b-22f6d673c97c', 'c4a4b284-9cb2-5c29-80ae-0b20e01f3cb1', 'A', 'NICE', false, 0),
  ('ac6cbb63-6551-501d-b866-292efeb543f6', 'c4a4b284-9cb2-5c29-80ae-0b20e01f3cb1', 'B', 'UK National Screening Committee', true, 1),
  ('6e2a33c9-92d0-5dee-a16f-697ffb6a855e', 'c4a4b284-9cb2-5c29-80ae-0b20e01f3cb1', 'C', 'MHRA', false, 2),
  ('7695b12e-8ad3-522e-bcad-c28498781f8c', 'c4a4b284-9cb2-5c29-80ae-0b20e01f3cb1', 'D', 'CQC', false, 3),
  ('21c075b0-9d3c-5f73-badd-d563379b7fc0', 'c4a4b284-9cb2-5c29-80ae-0b20e01f3cb1', 'E', 'GMC', false, 4);

-- Q36
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('7defdd3b-9014-53c7-a8f4-6885cab10063', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000021', 'sba', 'Which measure describes the number of extra cases of disease in exposed people caused by the exposure?', 'Attributable risk (risk difference) is the incidence in the exposed minus incidence in the unexposed. It reflects the public health impact. Relative risk shows the strength of association. Population attributable risk takes account of how common the exposure is in the population.', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v4')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = '7defdd3b-9014-53c7-a8f4-6885cab10063';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('b222aa72-c807-51b3-8695-38a12ae9b8fe', '7defdd3b-9014-53c7-a8f4-6885cab10063', 'A', 'Relative risk', false, 0),
  ('a2a9e598-bc53-5049-b624-15695fad2cec', '7defdd3b-9014-53c7-a8f4-6885cab10063', 'B', 'Odds ratio', false, 1),
  ('744ec789-deee-556f-b0af-915910e93843', '7defdd3b-9014-53c7-a8f4-6885cab10063', 'C', 'Specificity', false, 2),
  ('6a368e80-35c6-5ab1-9252-803e5f875fe9', '7defdd3b-9014-53c7-a8f4-6885cab10063', 'D', 'Prevalence', false, 3),
  ('5ceea92b-df48-5737-a530-60b7f796b13d', '7defdd3b-9014-53c7-a8f4-6885cab10063', 'E', 'Attributable risk (absolute risk difference)', true, 4);

-- Q37
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('3ce31c80-918e-55b8-b1f5-94d83564f56f', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000034', 'sba', 'A 40 year old woman with epilepsy takes carbamazepine. She wants to use contraception. Which method is LEAST affected by enzyme-inducing drugs?', 'Enzyme inducers (carbamazepine, phenytoin, rifampicin, St John''s wort) reduce the effectiveness of oral contraceptives, implants and patches. The copper IUD, LNG-IUS and DMPA injection are not affected. Emergency contraception: copper IUD preferred, or a double dose of levonorgestrel.', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v4')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = '3ce31c80-918e-55b8-b1f5-94d83564f56f';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('cb9069ce-f6ae-5912-8151-ce9ae5722051', '3ce31c80-918e-55b8-b1f5-94d83564f56f', 'A', 'Contraceptive implant', false, 0),
  ('2bb94703-2f61-541c-a61c-1fda6a2144e5', '3ce31c80-918e-55b8-b1f5-94d83564f56f', 'B', 'Progestogen-only pill', false, 1),
  ('00922517-139a-5f41-9d34-a89919365e24', '3ce31c80-918e-55b8-b1f5-94d83564f56f', 'C', 'Copper IUD (or LNG-IUS or DMPA injection)', true, 2),
  ('670707e8-1452-503c-beb9-93ebda15c9a4', '3ce31c80-918e-55b8-b1f5-94d83564f56f', 'D', 'Combined oral contraceptive pill', false, 3),
  ('8fc64577-1b3c-5421-9b48-1076fcd0befe', '3ce31c80-918e-55b8-b1f5-94d83564f56f', 'E', 'Contraceptive patch', false, 4);

-- Q38
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('d7830a4b-0248-55e9-b77e-eaf5c6933a64', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000034', 'sba', 'A 25 year old woman is starting isotretinoin for severe acne. Which is the MOST important requirement?', 'Isotretinoin is highly teratogenic. Women of childbearing potential must follow the pregnancy prevention programme (contraception, pregnancy testing before, during and after treatment). Monitor LFTs and lipids. Side effects include dry skin and lips, nosebleeds, raised lipids, and mood changes (monitor for depression and suicidal thoughts).', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v4')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = 'd7830a4b-0248-55e9-b77e-eaf5c6933a64';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('d429f649-fa5d-5b42-9770-45409e4fa5e1', 'd7830a4b-0248-55e9-b77e-eaf5c6933a64', 'A', 'A pregnancy prevention programme with effective contraception and regular pregnancy tests', true, 0),
  ('07a66dfb-b2d7-5f45-b817-07eb83662d9b', 'd7830a4b-0248-55e9-b77e-eaf5c6933a64', 'B', 'Avoid all sunlight forever', false, 1),
  ('7ae79d9b-ab8f-525e-b762-e62606afa6a8', 'd7830a4b-0248-55e9-b77e-eaf5c6933a64', 'C', 'No monitoring', false, 2),
  ('653e80b4-0552-594e-bb8c-40d40a8ad043', 'd7830a4b-0248-55e9-b77e-eaf5c6933a64', 'D', 'Weekly ECGs', false, 3),
  ('833a2332-727b-5ca7-b55d-3be2cc1d4691', 'd7830a4b-0248-55e9-b77e-eaf5c6933a64', 'E', 'Monthly kidney ultrasounds', false, 4);

-- Q39
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('41d9288a-1b5b-5869-997d-9f7bbb868463', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000034', 'sba', 'A 75 year old man has been started on a new drug. He develops a severe adverse drug reaction. Which scheme should be used to report suspected adverse reactions in the UK?', 'The Yellow Card scheme collects reports of suspected adverse drug reactions from healthcare professionals and the public. Report all suspected reactions to new medicines (black triangle drugs), and serious reactions to established medicines. Local incident reporting systems record errors and safety incidents.', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v4')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = '41d9288a-1b5b-5869-997d-9f7bbb868463';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('9968ad7e-7cfc-58eb-8445-217c2aa2184f', '41d9288a-1b5b-5869-997d-9f7bbb868463', 'A', 'The BNF', false, 0),
  ('b1d6247c-5589-5149-8b30-e5decdf78224', '41d9288a-1b5b-5869-997d-9f7bbb868463', 'B', 'The NICE register', false, 1),
  ('a284e777-d289-5dc2-aced-f31186e382a5', '41d9288a-1b5b-5869-997d-9f7bbb868463', 'C', 'The Datix system only', false, 2),
  ('304569fa-9d58-53c7-950c-0c27515845fa', '41d9288a-1b5b-5869-997d-9f7bbb868463', 'D', 'The GMC', false, 3),
  ('2d529d30-d98f-5ac0-a7c1-42cfde9e2fef', '41d9288a-1b5b-5869-997d-9f7bbb868463', 'E', 'The MHRA Yellow Card scheme', true, 4);

-- Q40
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('3c32d71b-2962-5b69-8b52-b34cf500f5a6', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000034', 'sba', 'A 45 year old woman with hypertension takes ramipril. She has a creatinine rise of 20% 2 weeks after starting it. Potassium is 5.4 mmol/L. What is the SINGLE most appropriate action?', 'A small rise in creatinine after starting ACE inhibitors is expected due to reduced glomerular filtration pressure. NICE: if creatinine rises by over 30% (or eGFR falls by over 25%), investigate for other causes (renal artery stenosis, dehydration, nephrotoxic drugs) and reduce or stop the drug. Stop if potassium rises to 6.0 or more.', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v4')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = '3c32d71b-2962-5b69-8b52-b34cf500f5a6';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('22a3473b-9936-52b3-9224-92bd299ddd42', '3c32d71b-2962-5b69-8b52-b34cf500f5a6', 'A', 'Stop ramipril immediately', false, 0),
  ('7843e0b5-0fb7-50f1-b88e-e3f4375f13f1', '3c32d71b-2962-5b69-8b52-b34cf500f5a6', 'B', 'Add spironolactone', false, 1),
  ('7b1aa1b5-0818-5824-b824-d700ec7cd44f', '3c32d71b-2962-5b69-8b52-b34cf500f5a6', 'C', 'Continue ramipril and recheck renal function; stop if creatinine rises over 30% or eGFR falls over 25% or potassium above 6', true, 2),
  ('dcf80624-9a51-5260-8af3-a9b09169d915', '3c32d71b-2962-5b69-8b52-b34cf500f5a6', 'D', 'Double the dose', false, 3),
  ('247aef12-f5ca-52da-9b63-159f06acbdae', '3c32d71b-2962-5b69-8b52-b34cf500f5a6', 'E', 'Add a potassium supplement', false, 4);

-- Q41
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('806a389f-ed57-5b14-b351-8353460163fa', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000012', 'sba', 'A 35 year old man has had pink, scaly patches on his scalp, eyebrows and nasolabial folds that are worse in winter. What is the SINGLE most likely diagnosis?', 'Seborrhoeic dermatitis is related to Malassezia yeasts and causes greasy, scaly red patches in sebum-rich areas (scalp, eyebrows, nasolabial folds, ears, chest). It is more severe in HIV and Parkinson''s disease. Treatment: ketoconazole shampoo and cream, with short courses of mild topical steroids.', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v4')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = '806a389f-ed57-5b14-b351-8353460163fa';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('a0fa3da5-68ab-57e4-ae93-e3b8624be531', '806a389f-ed57-5b14-b351-8353460163fa', 'A', 'Rosacea', false, 0),
  ('8be43c8b-fc79-588a-9813-971108acdf4b', '806a389f-ed57-5b14-b351-8353460163fa', 'B', 'Seborrhoeic dermatitis', true, 1),
  ('71fc5d6f-4ff9-56dc-8363-a741e7a116d9', '806a389f-ed57-5b14-b351-8353460163fa', 'C', 'Tinea capitis', false, 2),
  ('e3456a8e-1e09-53f0-870d-2e24edb78fb5', '806a389f-ed57-5b14-b351-8353460163fa', 'D', 'Lupus', false, 3),
  ('dc564bd3-5111-5d3d-a180-2359a08e24c9', '806a389f-ed57-5b14-b351-8353460163fa', 'E', 'Psoriasis', false, 4);

-- Q42
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('0705ca7f-1a8f-561d-99f1-e36ea627f853', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000012', 'sba', 'A 16 year old boy has comedones, inflamed papules and pustules on his face and back. Topical treatment has not worked after 3 months. What is the SINGLE most appropriate next step?', 'NICE NG198: moderate-severe acne may be treated with a topical combination plus an oral tetracycline (lymecycline or doxycycline) for up to 6 months, reviewing at 12 weeks. Avoid topical antibiotic monotherapy and oral antibiotic monotherapy (resistance). Refer for isotretinoin (specialist only) for severe, scarring or treatment-resistant acne.', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v4')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = '0705ca7f-1a8f-561d-99f1-e36ea627f853';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('fb8d93f8-52d1-519e-bdd4-35a957fee913', '0705ca7f-1a8f-561d-99f1-e36ea627f853', 'A', 'Oral penicillin', false, 0),
  ('4bfd44a1-1b77-53ba-a8cb-8296a56582c2', '0705ca7f-1a8f-561d-99f1-e36ea627f853', 'B', 'Oral isotretinoin in primary care', false, 1),
  ('88d60794-9e81-5eb3-888b-e44239c1ab66', '0705ca7f-1a8f-561d-99f1-e36ea627f853', 'C', 'Oral steroids', false, 2),
  ('617d766b-31eb-5223-a363-1b877e205b8c', '0705ca7f-1a8f-561d-99f1-e36ea627f853', 'D', 'Topical antibiotic alone long-term', false, 3),
  ('dcd2184f-045b-5955-b581-756e743653d7', '0705ca7f-1a8f-561d-99f1-e36ea627f853', 'E', 'Oral lymecycline or doxycycline plus a topical retinoid or benzoyl peroxide (for up to 6 months)', true, 4);

-- Q43
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('80ef5a6c-6e63-5f7e-bb8f-c45498494b5e', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000012', 'sba', 'A 70 year old woman has a growing pigmented lesion on her cheek that is flat and irregular, getting larger over years. Biopsy shows atypical melanocytes in the epidermis without invasion. What is the SINGLE most likely diagnosis?', 'Lentigo maligna is a slow-growing melanoma in situ on sun-damaged skin of older people, often the face. It can progress to invasive lentigo maligna melanoma. Treatment: surgical excision with clear margins (Mohs surgery for facial sites), or imiquimod or radiotherapy if surgery is unsuitable.', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v4')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = '80ef5a6c-6e63-5f7e-bb8f-c45498494b5e';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('785039bc-fcf7-5a2d-b3ea-42db33f7aa6d', '80ef5a6c-6e63-5f7e-bb8f-c45498494b5e', 'A', 'Dermatofibroma', false, 0),
  ('fb114c34-0e89-5906-b160-3c74f5fdf918', '80ef5a6c-6e63-5f7e-bb8f-c45498494b5e', 'B', 'Lentigo maligna (melanoma in situ)', true, 1),
  ('0cd7d97e-ae4d-5f82-8689-e56172572f3d', '80ef5a6c-6e63-5f7e-bb8f-c45498494b5e', 'C', 'Seborrhoeic keratosis', false, 2),
  ('8eb1fa7e-4637-54ec-969c-0575ff888010', '80ef5a6c-6e63-5f7e-bb8f-c45498494b5e', 'D', 'Basal cell carcinoma', false, 3),
  ('0dc19407-4fdb-5dfb-b176-3874aab5fbbb', '80ef5a6c-6e63-5f7e-bb8f-c45498494b5e', 'E', 'Solar lentigo', false, 4);

-- Q44
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('da6ac7fc-95b1-5234-8c61-db13f6284e23', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000012', 'sba', 'A 60 year old man has a pigmented lesion on his back. Which feature on the weighted 7-point checklist carries 2 points?', 'NICE 7-point checklist: major features (2 points each) are change in size, irregular shape and irregular colour. Minor features (1 point each): largest diameter 7 mm or more, inflammation, oozing and change in sensation. Refer urgently on the suspected cancer pathway with a score of 3 or more, or if dermoscopy suggests melanoma.', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v4')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = 'da6ac7fc-95b1-5234-8c61-db13f6284e23';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('4beaefb1-576c-5139-b825-d30350c023d6', 'da6ac7fc-95b1-5234-8c61-db13f6284e23', 'A', 'Change in sensation', false, 0),
  ('c8d9f744-8b8c-573f-8262-4a9cfad368ec', 'da6ac7fc-95b1-5234-8c61-db13f6284e23', 'B', 'Oozing', false, 1),
  ('a8688e49-c5e6-5fdb-9b18-e599b920d512', 'da6ac7fc-95b1-5234-8c61-db13f6284e23', 'C', 'Change in size, irregular shape or irregular colour', true, 2),
  ('6c297ad2-673a-56bd-a9f4-d9b0b5f9a59a', 'da6ac7fc-95b1-5234-8c61-db13f6284e23', 'D', 'Inflammation', false, 3),
  ('1312f843-72fe-5ec4-a1e0-a3562bddeec8', 'da6ac7fc-95b1-5234-8c61-db13f6284e23', 'E', 'Diameter 7 mm or more', false, 4);

-- Q45
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('2aaed78b-42b8-55e8-8b43-e3aeda657d01', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000015', 'sba', 'A 60 year old man has had sudden onset of severe pain in his right eye, blurred vision with halos around lights, headache and vomiting. The eye is red, the cornea hazy and the pupil fixed and mid-dilated. What is the SINGLE most appropriate immediate management?', 'Acute angle-closure glaucoma: sudden rise in intraocular pressure due to blocked drainage. Risk factors: hypermetropia, older age, female, East Asian ancestry and pupil dilation. Treatment to lower pressure: acetazolamide, pilocarpine (constricts the pupil), beta-blocker and alpha-agonist drops. Definitive treatment: laser peripheral iridotomy in both eyes.', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v4')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = '2aaed78b-42b8-55e8-8b43-e3aeda657d01';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('0974577d-9688-56a9-b788-adc37ae89b70', '2aaed78b-42b8-55e8-8b43-e3aeda657d01', 'A', 'Reassure and review in 1 week', false, 0),
  ('d5a9bcc4-5d5c-53d4-8cfc-517cf9e27bcb', '2aaed78b-42b8-55e8-8b43-e3aeda657d01', 'B', 'Topical antibiotics', false, 1),
  ('7fc7fabb-91de-57fa-b6e7-8260a83d960d', '2aaed78b-42b8-55e8-8b43-e3aeda657d01', 'C', 'Dilate the pupil with tropicamide', false, 2),
  ('ca4129cb-8274-5494-be2f-16e77832e1c6', '2aaed78b-42b8-55e8-8b43-e3aeda657d01', 'D', 'Same-day ophthalmology; start IV or oral acetazolamide and topical pilocarpine, timolol and steroid while awaiting review', true, 3),
  ('4d7084a9-8c18-550a-ade5-e35aa015bf1a', '2aaed78b-42b8-55e8-8b43-e3aeda657d01', 'E', 'Oral antihistamines', false, 4);

-- Q46
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('6e9a354b-6f96-566e-be4a-7a7cdfd49bf6', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000015', 'sba', 'A 65 year old man has open-angle glaucoma. He is started on latanoprost eye drops. What side effect should he be warned about?', 'Prostaglandin analogues (latanoprost) are first-line for primary open-angle glaucoma. Side effects include iris pigmentation, eyelash lengthening, conjunctival redness and periorbital fat atrophy. Beta-blocker drops (timolol) can cause bradycardia and bronchospasm (avoid in asthma). Carbonic anhydrase inhibitors and alpha-agonists are alternatives.', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v4')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = '6e9a354b-6f96-566e-be4a-7a7cdfd49bf6';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('e4301594-d978-5cef-a9ca-c42f1229c37b', '6e9a354b-6f96-566e-be4a-7a7cdfd49bf6', 'A', 'Hearing loss', false, 0),
  ('8384c387-6d69-5bff-a792-63567f4ba3d4', '6e9a354b-6f96-566e-be4a-7a7cdfd49bf6', 'B', 'Increased brown pigmentation of the iris and eyelash growth', true, 1),
  ('b958c09a-91a4-5def-a2c5-dc4ea9d14dcd', '6e9a354b-6f96-566e-be4a-7a7cdfd49bf6', 'C', 'Dry mouth', false, 2),
  ('2da2e1b8-7b7f-512f-84cf-bc25cac572a3', '6e9a354b-6f96-566e-be4a-7a7cdfd49bf6', 'D', 'Kidney stones', false, 3),
  ('6729c674-f4f8-586e-b159-6ecace08cf50', '6e9a354b-6f96-566e-be4a-7a7cdfd49bf6', 'E', 'Bradycardia and bronchospasm', false, 4);

-- Q47
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('34fa3a96-a43c-5225-89b9-844cf80f269e', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000030', 'sba', 'A 30 year old man has a painless swelling in his left scrotum that feels like a ''bag of worms'' and gets smaller when he lies down. What is the SINGLE most likely diagnosis?', 'Varicoceles are dilated veins of the pampiniform plexus, usually on the left (the left testicular vein drains into the left renal vein at right angles). They may cause aching and subfertility. A new right-sided varicocele, or one that does not reduce on lying, needs imaging to exclude renal or retroperitoneal tumours.', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v4')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = '34fa3a96-a43c-5225-89b9-844cf80f269e';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('ba1b9ee9-a872-57f1-bbb4-26693578f71b', '34fa3a96-a43c-5225-89b9-844cf80f269e', 'A', 'Hydrocele', false, 0),
  ('2ed5ad6d-8c17-5957-8778-a83a69c647b4', '34fa3a96-a43c-5225-89b9-844cf80f269e', 'B', 'Epididymal cyst', false, 1),
  ('c3d4dc6a-060a-566f-a45e-664f4888d16d', '34fa3a96-a43c-5225-89b9-844cf80f269e', 'C', 'Inguinal hernia', false, 2),
  ('38b0e61f-8a00-5e50-aca6-99c76b812db9', '34fa3a96-a43c-5225-89b9-844cf80f269e', 'D', 'Varicocele', true, 3),
  ('0dc5548c-edbd-5194-8319-23252b91f82e', '34fa3a96-a43c-5225-89b9-844cf80f269e', 'E', 'Testicular tumour', false, 4);

-- Q48
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('393625ee-7008-580d-a4cd-c1e208b9a41d', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000030', 'sba', 'A 60 year old woman has had pain on the medial side of her lower leg and an ulcer just above the medial malleolus with surrounding brown pigmentation and eczema. ABPI is 1.0. What is the SINGLE most likely diagnosis and management?', 'Venous ulcers occur in the gaiter area (often medial), are shallow with irregular margins, and come with haemosiderin pigmentation, lipodermatosclerosis and varicose eczema. Treatment: multilayer compression bandaging if ABPI is 0.8 or more, and referral for venous assessment (endovenous treatment of reflux). Arterial ulcers are painful, punched-out and on the toes and feet.', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v4')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = '393625ee-7008-580d-a4cd-c1e208b9a41d';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('6947c0a3-d306-5177-bdb0-fc4e7792f326', '393625ee-7008-580d-a4cd-c1e208b9a41d', 'A', 'Neuropathic ulcer; offloading', false, 0),
  ('561dbeac-eb83-5159-b01d-0e9601836d7a', '393625ee-7008-580d-a4cd-c1e208b9a41d', 'B', 'Arterial ulcer; revascularisation', false, 1),
  ('8f9dfd65-c2c6-5de5-b910-8182caf7affb', '393625ee-7008-580d-a4cd-c1e208b9a41d', 'C', 'Venous leg ulcer; compression bandaging (after ABPI confirms adequate arterial supply)', true, 2),
  ('02348f80-febb-5aca-82e5-688f481c8872', '393625ee-7008-580d-a4cd-c1e208b9a41d', 'D', 'Marjolin''s ulcer; excision', false, 3),
  ('dbcaf07a-88e7-5f65-8736-3e736591e2d9', '393625ee-7008-580d-a4cd-c1e208b9a41d', 'E', 'Pyoderma gangrenosum; steroids', false, 4);

-- Q49
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('3736d1ac-d832-586e-994a-63b6869f6cad', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000030', 'sba', 'A 65 year old man has a cold, white, painful leg with no pulses that started suddenly 4 hours ago. He has AF. He has paraesthesia and mild weakness of his foot. What is the SINGLE most appropriate management?', 'Acute limb ischaemia: the 6 Ps (pain, pallor, pulselessness, paraesthesia, perishingly cold and paralysis). Emboli often come from AF. Sensory and motor loss suggest a threatened limb. Give IV unfractionated heparin and refer urgently for embolectomy, bypass or catheter-directed thrombolysis. Watch for reperfusion injury and compartment syndrome.', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v4')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = '3736d1ac-d832-586e-994a-63b6869f6cad';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('128f9fe3-62c6-5417-978b-63ce0bcfef42', '3736d1ac-d832-586e-994a-63b6869f6cad', 'A', 'Elevate the leg and observe', false, 0),
  ('0b460291-3713-59bd-8060-91254cd88bbc', '3736d1ac-d832-586e-994a-63b6869f6cad', 'B', 'IV heparin and urgent vascular surgery for embolectomy/revascularisation', true, 1),
  ('97ce66aa-9cda-5155-8a18-d385a3ca9d27', '3736d1ac-d832-586e-994a-63b6869f6cad', 'C', 'Thrombolysis at home', false, 2),
  ('02a25caa-7f31-5fad-8b14-c34427e85ebb', '3736d1ac-d832-586e-994a-63b6869f6cad', 'D', 'Oral aspirin and review in clinic', false, 3),
  ('324fac3d-c1d4-5abb-b62f-11ee77a36c41', '3736d1ac-d832-586e-994a-63b6869f6cad', 'E', 'Compression stockings', false, 4);

-- Q50
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('f9dff8ad-9f5c-5d02-8f01-af05160a2005', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000007', 'sba', 'A 28 year old woman has had sudden episodes of intense fear with palpitations, sweating, chest tightness and a feeling of impending doom, peaking within 10 minutes. She worries about future attacks and avoids supermarkets. What is the SINGLE most likely diagnosis?', 'Panic disorder: recurrent unexpected panic attacks with persistent fear of further attacks and behavioural change. Agoraphobia is fear of places where escape is difficult. Exclude physical causes (thyroid, arrhythmia, drugs). Treatment: CBT or an SSRI. Benzodiazepines are not recommended.', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v4')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = 'f9dff8ad-9f5c-5d02-8f01-af05160a2005';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('53102b84-31df-5b5b-9efb-87b37152b7b9', 'f9dff8ad-9f5c-5d02-8f01-af05160a2005', 'A', 'Phaeochromocytoma', false, 0),
  ('09c7b962-a940-5516-ac38-a3e9ff8dc0c7', 'f9dff8ad-9f5c-5d02-8f01-af05160a2005', 'B', 'Hyperthyroidism', false, 1),
  ('31c76c77-aba4-5268-ae47-7e2675d366fb', 'f9dff8ad-9f5c-5d02-8f01-af05160a2005', 'C', 'Generalised anxiety disorder', false, 2),
  ('2ad211b3-27cd-5ed8-993c-eee57270f177', 'f9dff8ad-9f5c-5d02-8f01-af05160a2005', 'D', 'Panic disorder (with agoraphobia)', true, 3),
  ('f98d37c6-9a00-5053-96a5-6c1d29136616', 'f9dff8ad-9f5c-5d02-8f01-af05160a2005', 'E', 'Social anxiety disorder', false, 4);

-- Q51
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('0377e862-7f3b-53fe-841c-0c6ea59994de', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000007', 'sba', 'A 50 year old man has been very low for 2 months. He has stopped eating and drinking, believes his bowels have rotted and that he is already dead. He has lost 10 kg and is dehydrated. What is the SINGLE most appropriate treatment?', 'Severe depression with psychotic features (nihilistic delusions: Cotard''s syndrome) and refusal of food and fluids is life-threatening. ECT acts quickly and is indicated for severe, life-threatening depression or catatonia when a rapid response is needed. Combined antidepressant and antipsychotic treatment is also used.', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v4')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = '0377e862-7f3b-53fe-841c-0c6ea59994de';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('a164455a-5dda-51a7-be29-4e13f9419120', '0377e862-7f3b-53fe-841c-0c6ea59994de', 'A', 'CBT only', false, 0),
  ('d557653b-b7e4-5dc5-8325-2d942b2e398b', '0377e862-7f3b-53fe-841c-0c6ea59994de', 'B', 'Electroconvulsive therapy (severe life-threatening depression with psychotic features)', true, 1),
  ('348a799d-fbc4-5b9d-b5ae-8ad55d2c69aa', '0377e862-7f3b-53fe-841c-0c6ea59994de', 'C', 'Guided self-help', false, 2),
  ('b065d5dd-3f95-52d4-8f52-52b20d39f4ae', '0377e862-7f3b-53fe-841c-0c6ea59994de', 'D', 'Increase fluoxetine slowly', false, 3),
  ('deebe8bc-2682-54b4-8420-c73e4e76bcd5', '0377e862-7f3b-53fe-841c-0c6ea59994de', 'E', 'Discharge with GP follow-up', false, 4);

-- Q52
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('8b789849-b1de-557c-896f-4d0feefa3ce1', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000007', 'sba', 'A 22 year old woman has a pattern of unstable relationships, fear of abandonment, impulsive behaviour, chronic emptiness, intense anger and recurrent self-harm. What is the SINGLE most appropriate treatment?', 'Emotionally unstable (borderline) personality disorder is treated with psychological therapies (DBT is particularly effective for self-harm, and mentalisation-based treatment). Drugs are not recommended for the core disorder, but may be used short-term in crisis or for comorbidities.', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v4')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = '8b789849-b1de-557c-896f-4d0feefa3ce1';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('f0930c98-aec0-5e61-be13-25856bf23a86', '8b789849-b1de-557c-896f-4d0feefa3ce1', 'A', 'ECT', false, 0),
  ('4ec97cab-5328-5145-889e-ab9464477ef4', '8b789849-b1de-557c-896f-4d0feefa3ce1', 'B', 'Structured psychological therapy such as dialectical behaviour therapy (DBT) or mentalisation-based therapy', true, 1),
  ('c7cfb03a-19e7-5368-b1d3-1aba134d75b7', '8b789849-b1de-557c-896f-4d0feefa3ce1', 'C', 'Long-term antipsychotics', false, 2),
  ('1daececa-01a5-5d08-82ac-5b410a06654b', '8b789849-b1de-557c-896f-4d0feefa3ce1', 'D', 'No treatment', false, 3),
  ('da627a5c-5df8-513c-bacd-780669dd3de6', '8b789849-b1de-557c-896f-4d0feefa3ce1', 'E', 'Long-term benzodiazepines', false, 4);

-- Q53
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('fde7a054-7671-5740-99e6-3d660e4a3445', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000007', 'sba', 'A 75 year old woman has stepwise decline in cognition with a history of strokes, hypertension and diabetes. She has focal neurological signs. What is the SINGLE most likely diagnosis?', 'Vascular dementia is the second commonest type, related to cerebrovascular disease. It may show a stepwise decline, focal neurological signs and executive dysfunction. Management: control vascular risk factors. Acetylcholinesterase inhibitors and memantine are not recommended for pure vascular dementia, but may be used in mixed dementia.', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v4')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = 'fde7a054-7671-5740-99e6-3d660e4a3445';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('ec1d7dfe-b62b-52a2-ba24-c0ea41f17a80', 'fde7a054-7671-5740-99e6-3d660e4a3445', 'A', 'Frontotemporal dementia', false, 0),
  ('1507be4b-7f14-5eba-a9ce-ed69ff3303de', 'fde7a054-7671-5740-99e6-3d660e4a3445', 'B', 'Normal pressure hydrocephalus', false, 1),
  ('b2e43bea-5255-5f09-b655-07f1c193ce0f', 'fde7a054-7671-5740-99e6-3d660e4a3445', 'C', 'Alzheimer''s disease', false, 2),
  ('68a25a0d-0287-5226-b944-f0b1227c9dd8', 'fde7a054-7671-5740-99e6-3d660e4a3445', 'D', 'Vascular dementia', true, 3),
  ('2f8685d9-cba0-5ae0-88fd-18bb8c0b44ab', 'fde7a054-7671-5740-99e6-3d660e4a3445', 'E', 'Lewy body dementia', false, 4);

-- Q54
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('4a811163-54c6-5a1e-a404-50534c44d631', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000007', 'sba', 'A 30 year old woman gave birth 3 days ago. She is tearful, anxious and irritable, but is sleeping and caring for her baby. What is the SINGLE most likely diagnosis?', 'Baby blues affects up to 80% of new mothers, peaking around day 3-5 and resolving within 2 weeks. Reassurance and support are needed. Postnatal depression lasts longer, with more severe symptoms. Postpartum psychosis (usually within 2 weeks) is a psychiatric emergency, more common with bipolar disorder.', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v4')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = '4a811163-54c6-5a1e-a404-50534c44d631';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('3ee69aa5-9c80-5d23-b722-0addf0649920', '4a811163-54c6-5a1e-a404-50534c44d631', 'A', 'Generalised anxiety disorder', false, 0),
  ('983c3980-1c79-5ae1-9af6-23b52d3d3b4f', '4a811163-54c6-5a1e-a404-50534c44d631', 'B', 'Bipolar disorder', false, 1),
  ('b845ce48-162b-5c93-b652-64a8a8187d66', '4a811163-54c6-5a1e-a404-50534c44d631', 'C', 'Postpartum psychosis', false, 2),
  ('44a91a38-5171-5f26-ae64-3b6bc61005d7', '4a811163-54c6-5a1e-a404-50534c44d631', 'D', 'Baby blues (postnatal blues)', true, 3),
  ('5baa61a0-acc7-52e8-a538-33d63da32154', '4a811163-54c6-5a1e-a404-50534c44d631', 'E', 'Postnatal depression', false, 4);

-- Q55
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('9d480393-71a9-5b93-9d8f-cd5412b10128', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000007', 'sba', 'A 35 year old man has been using heroin for 10 years. He wants to stop. Which is a first-line opioid substitution treatment?', 'NICE: opioid substitution therapy with methadone or buprenorphine (including long-acting injectable buprenorphine) reduces illicit drug use, overdose deaths and blood-borne virus transmission. Offer take-home naloxone to people at risk of overdose. Naltrexone is used after detoxification to prevent relapse in some people.', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v4')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = '9d480393-71a9-5b93-9d8f-cd5412b10128';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('fe8bc661-6f8b-5482-99c7-d840bbb266e3', '9d480393-71a9-5b93-9d8f-cd5412b10128', 'A', 'Naloxone', false, 0),
  ('bdf8d273-91d2-5503-9cdd-003e751a382e', '9d480393-71a9-5b93-9d8f-cd5412b10128', 'B', 'Acamprosate', false, 1),
  ('0ce618fa-57ad-5dd7-be87-e00ec7fa59ea', '9d480393-71a9-5b93-9d8f-cd5412b10128', 'C', 'Disulfiram', false, 2),
  ('5e8774af-99af-51b1-a98f-ddae60523e51', '9d480393-71a9-5b93-9d8f-cd5412b10128', 'D', 'Diazepam', false, 3),
  ('5d772b76-f52c-5f89-a651-f5a94b8d29ff', '9d480393-71a9-5b93-9d8f-cd5412b10128', 'E', 'Methadone or buprenorphine (with psychosocial support)', true, 4);

-- Q56
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('6fea2ce2-49fa-5d9b-8ee8-e449c1475756', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000006', 'sba', 'A 30 year old woman with relapsing-remitting MS has a relapse with significant disability affecting her daily activities. Infection has been excluded. What is the SINGLE most appropriate treatment for the relapse?', 'NICE: offer high-dose oral methylprednisolone (or IV if oral is unsuitable) for MS relapses affecting function. Steroids speed recovery but do not change long-term outcome. Exclude infection (UTI) as a trigger. Disease-modifying therapies (such as ocrelizumab, natalizumab and fingolimod) reduce relapse rates and are started by specialists.', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v4')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = '6fea2ce2-49fa-5d9b-8ee8-e449c1475756';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('1c5e768e-3c1c-53ce-89a1-c4e5517a7663', '6fea2ce2-49fa-5d9b-8ee8-e449c1475756', 'A', 'Long-term low-dose prednisolone', false, 0),
  ('acffac54-7ee5-543d-9663-d659af2c97a4', '6fea2ce2-49fa-5d9b-8ee8-e449c1475756', 'B', 'Plasma exchange first-line', false, 1),
  ('4b848458-e13d-5d29-b1cd-ca975ca5a5aa', '6fea2ce2-49fa-5d9b-8ee8-e449c1475756', 'C', 'IV immunoglobulin', false, 2),
  ('32163d15-d786-50d7-a237-a67ae8ab2a96', '6fea2ce2-49fa-5d9b-8ee8-e449c1475756', 'D', 'Interferon beta started immediately for the relapse', false, 3),
  ('3872f11b-d6af-57af-8b3d-4385466df8c9', '6fea2ce2-49fa-5d9b-8ee8-e449c1475756', 'E', 'High-dose oral methylprednisolone (500 mg daily for 5 days)', true, 4);

-- Q57
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('55cba0d8-0694-5d78-b92b-6b548322a5a3', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000006', 'sba', 'A 75 year old man has sudden-onset weakness of his right arm and leg and expressive aphasia. Symptoms started 2 hours ago. CT head shows no haemorrhage. BP is 170/95. He is not on anticoagulants. What is the SINGLE most appropriate treatment?', 'Acute ischaemic stroke within 4.5 hours: thrombolysis if no contraindications (BP must be below 185/110 before treatment). Thrombectomy for proximal anterior circulation large-vessel occlusion within 6 hours (up to 24 hours with favourable imaging). Aspirin 300 mg is started 24 hours after thrombolysis, once haemorrhage is excluded.', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v4')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = '55cba0d8-0694-5d78-b92b-6b548322a5a3';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('0ff7ad2a-86d9-5a17-adef-ce450422f159', '55cba0d8-0694-5d78-b92b-6b548322a5a3', 'A', 'IV thrombolysis (alteplase or tenecteplase), and consider thrombectomy if large-vessel occlusion on CT angiography', true, 0),
  ('c93c54e9-7123-5ca9-b738-49c72f40f7c1', '55cba0d8-0694-5d78-b92b-6b548322a5a3', 'B', 'Aspirin 300 mg and discharge', false, 1),
  ('184ff110-70d6-5264-9825-99efdd518abd', '55cba0d8-0694-5d78-b92b-6b548322a5a3', 'C', 'Lower BP rapidly to 120/80', false, 2),
  ('dcb9c39f-6290-50c7-a7a2-00b26c3ef2ff', '55cba0d8-0694-5d78-b92b-6b548322a5a3', 'D', 'Heparin infusion', false, 3),
  ('3992fc5f-4563-5e25-94dc-1211951888a4', '55cba0d8-0694-5d78-b92b-6b548322a5a3', 'E', 'Clopidogrel only', false, 4);

-- Q58
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('28aaebb5-7fcf-5a38-8e0a-af964f8ec49c', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000006', 'sba', 'A 65 year old man has had a posterior circulation stroke. He has vertigo, nystagmus, ipsilateral facial numbness and Horner''s syndrome, contralateral loss of pain and temperature in the body, and dysphagia. What is the SINGLE most likely affected artery?', 'Lateral medullary syndrome (PICA or vertebral artery occlusion): vertigo, nystagmus, ataxia, ipsilateral facial pain and temperature loss, ipsilateral Horner''s, contralateral body pain and temperature loss, dysphagia and dysarthria (nucleus ambiguus). AICA strokes also involve the facial nerve and hearing.', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v4')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = '28aaebb5-7fcf-5a38-8e0a-af964f8ec49c';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('f5f02624-0515-5934-8cca-c501eda44ec6', '28aaebb5-7fcf-5a38-8e0a-af964f8ec49c', 'A', 'Anterior cerebral artery', false, 0),
  ('e34d216f-5c10-5349-9d87-1d97f29cdf6b', '28aaebb5-7fcf-5a38-8e0a-af964f8ec49c', 'B', 'Basilar artery tip', false, 1),
  ('c8467599-2eb2-5e49-9165-1be48c2ddf6b', '28aaebb5-7fcf-5a38-8e0a-af964f8ec49c', 'C', 'Posterior inferior cerebellar artery (lateral medullary/Wallenberg syndrome)', true, 2),
  ('3c4da171-6202-5789-b5a4-b37f872bfdcc', '28aaebb5-7fcf-5a38-8e0a-af964f8ec49c', 'D', 'Middle cerebral artery', false, 3),
  ('e5ffa4a9-65f5-58b3-b179-b815694f54de', '28aaebb5-7fcf-5a38-8e0a-af964f8ec49c', 'E', 'Anterior inferior cerebellar artery', false, 4);

-- Q59
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('8e3133d1-b59d-5004-ba3a-47d037ca45dd', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000006', 'sba', 'A 30 year old woman who is 8 days postpartum has a worsening headache over 3 days, then a focal seizure. CT shows a hyperdense sagittal sinus. What is the SINGLE most likely diagnosis?', 'CVST presents with headache (often progressive), seizures, focal deficits and papilloedema. Risk factors: pregnancy and puerperium, OCP, thrombophilia, dehydration, infection and malignancy. CT or MR venography confirms. Treatment: anticoagulation with LMWH, even if there is haemorrhagic infarction.', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v4')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = '8e3133d1-b59d-5004-ba3a-47d037ca45dd';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('fa86d57d-b597-5919-809d-b6427d623483', '8e3133d1-b59d-5004-ba3a-47d037ca45dd', 'A', 'Migraine', false, 0),
  ('b2b20b2c-f5a6-52a3-8371-f2c7084bcdaf', '8e3133d1-b59d-5004-ba3a-47d037ca45dd', 'B', 'Subarachnoid haemorrhage', false, 1),
  ('47f47d18-fd43-5efb-8058-af552fda0eb0', '8e3133d1-b59d-5004-ba3a-47d037ca45dd', 'C', 'Eclampsia', false, 2),
  ('924cc89f-9c80-5494-90fb-437802863534', '8e3133d1-b59d-5004-ba3a-47d037ca45dd', 'D', 'Cerebral venous sinus thrombosis', true, 3),
  ('2923b343-bc2a-53f8-91e4-891c48f7088e', '8e3133d1-b59d-5004-ba3a-47d037ca45dd', 'E', 'Meningitis', false, 4);

-- Q60
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('3c3ab976-113d-58d9-88c1-4215c808d8b9', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000006', 'sba', 'A 20 year old woman has had a sudden painless weakness of the whole left side of her face, including her forehead, for 1 day. There is no rash in her ear. What is the SINGLE most appropriate management?', 'Bell''s palsy is an idiopathic lower motor neurone facial nerve palsy (involving the forehead). Treat with prednisolone within 72 hours, and eye care (lubricants and taping at night) to prevent corneal damage. Most recover within 3-6 months. Refer if no improvement in 3 weeks. Forehead sparing suggests an upper motor neurone lesion (stroke). Ramsay Hunt syndrome (VZV) has vesicles in the ear.', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v4')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = '3c3ab976-113d-58d9-88c1-4215c808d8b9';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('c53f3883-df5d-5fee-b793-8036cd36e2ce', '3c3ab976-113d-58d9-88c1-4215c808d8b9', 'A', 'Antibiotics', false, 0),
  ('e7758762-809d-5b37-94ea-ebb6b87bffcd', '3c3ab976-113d-58d9-88c1-4215c808d8b9', 'B', 'No treatment', false, 1),
  ('d260cc78-51fd-57ca-9d34-5bf4189c9037', '3c3ab976-113d-58d9-88c1-4215c808d8b9', 'C', 'Aciclovir alone', false, 2),
  ('a37c8b23-b4ed-5d48-91a2-de790625c414', '3c3ab976-113d-58d9-88c1-4215c808d8b9', 'D', 'Oral prednisolone within 72 hours and eye protection (Bell''s palsy)', true, 3),
  ('0e440277-cebd-58ed-8cc5-ababd815138e', '3c3ab976-113d-58d9-88c1-4215c808d8b9', 'E', 'Urgent CT head', false, 4);

-- Q61
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('e88b045f-38ea-5ecf-89c2-acf86842ce17', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000001', 'sba', 'A 25 year old woman has had palpitations and feeling dizzy. ECG shows a regular narrow complex tachycardia at 190 bpm. She is stable. Vagal manoeuvres have not worked. What is the SINGLE most appropriate next treatment?', 'SVT in a stable patient: vagal manoeuvres (modified Valsalva), then IV adenosine as a rapid bolus followed by a saline flush. Warn about transient chest discomfort and a sense of doom. Adenosine is avoided in severe asthma (use verapamil). Unstable patients (shock, syncope, ischaemia, heart failure) need synchronised DC cardioversion.', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v4')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = 'e88b045f-38ea-5ecf-89c2-acf86842ce17';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('ba1f14cf-988d-5811-9504-20d68279bf13', 'e88b045f-38ea-5ecf-89c2-acf86842ce17', 'A', 'IV adenosine 6 mg rapid bolus (then 12 mg, then 18 mg if needed)', true, 0),
  ('29081a22-7320-5499-8acf-a0ccd7314c51', 'e88b045f-38ea-5ecf-89c2-acf86842ce17', 'B', 'Oral bisoprolol', false, 1),
  ('39c65baa-57b9-54c2-a509-eebe69b37fe9', 'e88b045f-38ea-5ecf-89c2-acf86842ce17', 'C', 'IV amiodarone', false, 2),
  ('83a4c6ad-db18-5aae-aae7-130d260e1321', 'e88b045f-38ea-5ecf-89c2-acf86842ce17', 'D', 'IV digoxin', false, 3),
  ('202b027b-9f7e-5094-8ab7-66b2837bbd2a', 'e88b045f-38ea-5ecf-89c2-acf86842ce17', 'E', 'DC cardioversion', false, 4);

-- Q62
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('557f3002-68f8-5f24-8655-92fc413b31f1', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000001', 'sba', 'A 65 year old man has a broad-complex tachycardia at 180 bpm. He is conscious, with BP 80/50 and chest pain. What is the SINGLE most appropriate management?', 'Resuscitation Council tachycardia algorithm: adverse features (shock, syncope, myocardial ischaemia, severe heart failure) mean the patient needs synchronised DC shock (up to 3 attempts), then IV amiodarone 300 mg over 10-20 minutes. Stable broad-complex tachycardia is treated with amiodarone. Pulseless VT is treated with defibrillation (cardiac arrest algorithm).', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v4')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = '557f3002-68f8-5f24-8655-92fc413b31f1';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('1fbbb712-5a04-5b08-aeb6-6cb8e100e437', '557f3002-68f8-5f24-8655-92fc413b31f1', 'A', 'IV verapamil', false, 0),
  ('4617ac95-046e-55f5-87cb-1796248309f6', '557f3002-68f8-5f24-8655-92fc413b31f1', 'B', 'IV adenosine', false, 1),
  ('9b20b468-9221-5002-8cba-ec253aaee434', '557f3002-68f8-5f24-8655-92fc413b31f1', 'C', 'Observation', false, 2),
  ('f5e7d512-94f0-51e6-9834-89300c9d8de4', '557f3002-68f8-5f24-8655-92fc413b31f1', 'D', 'Oral amiodarone', false, 3),
  ('0936fe8f-f056-5e19-adc5-feb8c70929d9', '557f3002-68f8-5f24-8655-92fc413b31f1', 'E', 'Synchronised DC cardioversion (up to 3 attempts) under sedation/anaesthesia', true, 4);

-- Q63
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('cb11ecb6-a4e3-5d13-98e5-9032c13ba5cd', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000001', 'sba', 'A 60 year old woman has AF. She has hypertension and diabetes and is 68. She has no history of bleeding. What is her CHA2DS2-VASc score and the SINGLE most appropriate treatment?', 'CHA2DS2-VASc: Congestive heart failure 1, Hypertension 1, Age 75 or over 2, Diabetes 1, Stroke or TIA 2, Vascular disease 1, Age 65-74 1, Sex category female 1. NICE: offer anticoagulation (DOAC first-line) if score 2 or more, and consider in men with a score of 1. Assess bleeding risk with ORBIT. Aspirin alone is not recommended for stroke prevention in AF.', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v4')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = 'cb11ecb6-a4e3-5d13-98e5-9032c13ba5cd';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('b91ac222-c006-5f32-a7c4-ab3e12209b78', 'cb11ecb6-a4e3-5d13-98e5-9032c13ba5cd', 'A', 'Score 4 (female 1, age 65-74 1, hypertension 1, diabetes 1); offer a DOAC', true, 0),
  ('2e4774ef-70bb-5922-8c67-eeac399a029c', 'cb11ecb6-a4e3-5d13-98e5-9032c13ba5cd', 'B', 'Score 3; warfarin only', false, 1),
  ('0a167928-ba44-5fe1-893a-6fd7f672f457', 'cb11ecb6-a4e3-5d13-98e5-9032c13ba5cd', 'C', 'Score 0; no treatment', false, 2),
  ('bb3d7b27-b7a8-5ce0-a079-7dda59161a35', 'cb11ecb6-a4e3-5d13-98e5-9032c13ba5cd', 'D', 'Score 1; no treatment', false, 3),
  ('2d160962-26ee-5311-95b6-fa23265176bf', 'cb11ecb6-a4e3-5d13-98e5-9032c13ba5cd', 'E', 'Score 2; aspirin', false, 4);

-- Q64
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('ca0d2621-d0ea-54e0-8e0b-717bad8f9ee0', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000001', 'sba', 'A 35 year old woman has had fever, a new heart murmur, splinter haemorrhages and painful nodules on her finger pulps. She injects drugs. Echocardiogram shows a vegetation on the tricuspid valve. What is the SINGLE most likely organism?', 'In people who inject drugs, S. aureus is the commonest cause of infective endocarditis, often affecting the tricuspid valve (with septic pulmonary emboli). Use the modified Duke criteria. Take 3 sets of blood cultures before antibiotics. Viridans streptococci are common in native valve endocarditis after dental procedures. Staph epidermidis is common in early prosthetic valve endocarditis.', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v4')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = 'ca0d2621-d0ea-54e0-8e0b-717bad8f9ee0';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('56c6df28-5262-599b-99fd-39a66a286390', 'ca0d2621-d0ea-54e0-8e0b-717bad8f9ee0', 'A', 'Staphylococcus epidermidis', false, 0),
  ('9a85617d-bb71-50b4-b384-6527c8a34729', 'ca0d2621-d0ea-54e0-8e0b-717bad8f9ee0', 'B', 'Staphylococcus aureus', true, 1),
  ('6edebdea-58fd-5a5c-8591-57ce778bcf78', 'ca0d2621-d0ea-54e0-8e0b-717bad8f9ee0', 'C', 'Enterococcus faecalis', false, 2),
  ('deb6a16a-dcdf-51db-b852-f218717aac73', 'ca0d2621-d0ea-54e0-8e0b-717bad8f9ee0', 'D', 'Streptococcus viridans', false, 3),
  ('3660edb2-b111-583f-adb5-d79be39bed90', 'ca0d2621-d0ea-54e0-8e0b-717bad8f9ee0', 'E', 'Coxiella burnetii', false, 4);

-- Q65
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('1d566511-e877-5ae5-855a-dfee60deb00f', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000001', 'sba', 'A 45 year old man has central chest pain at rest for 2 hours. ECG shows ST depression in V4-V6. Troponin is raised. He is pain-free on medical treatment and stable. What is the SINGLE most likely diagnosis and management?', 'NSTEMI: aspirin 300 mg, fondaparinux (if no immediate angiography), and assess risk with GRACE. Angiography within 72 hours if predicted 6-month mortality is above 3%, or immediately if unstable. Then dual antiplatelet therapy for 12 months, beta-blocker, ACE inhibitor, statin and cardiac rehabilitation.', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v4')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = '1d566511-e877-5ae5-855a-dfee60deb00f';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('cc76c5da-292f-5f78-b73a-2e8d839ec66a', '1d566511-e877-5ae5-855a-dfee60deb00f', 'A', 'Pericarditis; NSAIDs', false, 0),
  ('6ee97fdf-4655-5883-b2cc-8b1b927f2988', '1d566511-e877-5ae5-855a-dfee60deb00f', 'B', 'NSTEMI; antiplatelet therapy, anticoagulation, risk stratification (GRACE) and angiography within 72 hours if intermediate or higher risk', true, 1),
  ('04b43dff-4d29-5f34-98e5-cd6a8edd431a', '1d566511-e877-5ae5-855a-dfee60deb00f', 'C', 'STEMI; immediate thrombolysis', false, 2),
  ('a1a72861-8ebf-54d5-9c0f-cc31a2e07a68', '1d566511-e877-5ae5-855a-dfee60deb00f', 'D', 'Unstable angina; discharge', false, 3),
  ('8d5c5489-6037-5d93-9e91-f4a4d7277279', '1d566511-e877-5ae5-855a-dfee60deb00f', 'E', 'Stable angina; GTN only', false, 4);

-- Q66
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('c2bc0e81-e159-53cd-8084-b10f326b923b', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000004', 'sba', 'A 28 year old woman has fatigue, weight gain, constipation and cold intolerance. TSH is 25 mU/L and free T4 is low. Anti-TPO antibodies are positive. What is the SINGLE most appropriate treatment?', 'Primary hypothyroidism (commonly Hashimoto''s thyroiditis) is treated with levothyroxine (1.6 µg/kg/day in younger healthy adults; lower starting dose in older people and those with heart disease). Check TSH 6-8 weeks after a dose change. In pregnancy, the dose usually needs to increase by about 25-50 micrograms as soon as pregnancy is confirmed.', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v4')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = 'c2bc0e81-e159-53cd-8084-b10f326b923b';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('5aebd0f3-ae7a-5d28-a828-af9303e30425', 'c2bc0e81-e159-53cd-8084-b10f326b923b', 'A', 'Levothyroxine, titrated to TSH in the reference range', true, 0),
  ('7e7419c6-d328-5e1a-9617-ac31fa0ef0be', 'c2bc0e81-e159-53cd-8084-b10f326b923b', 'B', 'Carbimazole', false, 1),
  ('18d8f20a-78d2-5056-a10c-a74b81c83417', 'c2bc0e81-e159-53cd-8084-b10f326b923b', 'C', 'Radioiodine', false, 2),
  ('852fb708-dadc-500f-a05e-841a24ac4495', 'c2bc0e81-e159-53cd-8084-b10f326b923b', 'D', 'Liothyronine alone', false, 3),
  ('ae05aa0f-14f3-59ad-9b59-32bdec8f3fda', 'c2bc0e81-e159-53cd-8084-b10f326b923b', 'E', 'Propranolol', false, 4);

-- Q67
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('6d80aaf0-56d6-52bf-a39c-bb2987b72cf7', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000004', 'sba', 'A 25 year old woman with type 1 diabetes has a urinary tract infection and is vomiting. Her glucose is 13 mmol/L. What is the CORRECT sick day advice?', 'Sick day rules for type 1 diabetes: continue insulin (illness raises glucose), monitor glucose and blood ketones frequently, take correction doses, keep hydrated with sugar-free fluids (or sugary fluids if not eating), and seek urgent help with persistent vomiting, ketones above 1.5-3.0 mmol/L or drowsiness (risk of DKA).', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v4')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = '6d80aaf0-56d6-52bf-a39c-bb2987b72cf7';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('fe56481b-eca4-50e6-ba99-6bc8f5c801b7', '6d80aaf0-56d6-52bf-a39c-bb2987b72cf7', 'A', 'Halve the basal insulin', false, 0),
  ('f2d90024-0e55-5cf6-8527-1e798b6c51cd', '6d80aaf0-56d6-52bf-a39c-bb2987b72cf7', 'B', 'Wait until she is better', false, 1),
  ('7cb95b43-0e0b-5424-ba4f-4719eb63e5f3', '6d80aaf0-56d6-52bf-a39c-bb2987b72cf7', 'C', 'Never stop basal insulin; check glucose and ketones every 2-4 hours, take extra fast-acting insulin as needed, and seek urgent help if vomiting persists or ketones are high', true, 2),
  ('59e26e75-9311-5a37-b11c-e0573909716e', '6d80aaf0-56d6-52bf-a39c-bb2987b72cf7', 'D', 'Only drink water', false, 3),
  ('1ae00654-1777-51a4-8dd5-2f641032d257', '6d80aaf0-56d6-52bf-a39c-bb2987b72cf7', 'E', 'Stop insulin because she is not eating', false, 4);

-- Q68
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('ab82a477-65b6-592d-8e18-0bd7f4b8efc3', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000004', 'sba', 'A 70 year old man with type 2 diabetes is drowsy and severely dehydrated. Glucose is 45 mmol/L, serum osmolality is 360 mOsmol/kg, and there is no significant ketonaemia or acidosis. What is the SINGLE most likely diagnosis and initial treatment?', 'HHS: marked hyperglycaemia (usually over 30), hyperosmolality (over 320) and hypovolaemia without significant ketosis or acidosis. It mainly affects older people with type 2 diabetes. Fluid replacement with 0.9% saline is first-line. Insulin is added only when glucose stops falling with fluids alone (unless ketonaemia). High risk of VTE (prophylactic LMWH). Correct sodium and osmolality slowly.', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v4')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = 'ab82a477-65b6-592d-8e18-0bd7f4b8efc3';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('1ed7b615-338a-566d-9749-aadbb4152de4', 'ab82a477-65b6-592d-8e18-0bd7f4b8efc3', 'A', 'Lactic acidosis; bicarbonate', false, 0),
  ('3a9ed462-36c1-517d-87db-cbf300fed693', 'ab82a477-65b6-592d-8e18-0bd7f4b8efc3', 'B', 'DKA; fixed-rate insulin infusion first', false, 1),
  ('280f3c70-c42b-552f-9fd3-649277381902', 'ab82a477-65b6-592d-8e18-0bd7f4b8efc3', 'C', 'Diabetes insipidus; desmopressin', false, 2),
  ('13bbaf88-2e1f-55b3-a1a8-acfe31ccb44c', 'ab82a477-65b6-592d-8e18-0bd7f4b8efc3', 'D', 'Hypoglycaemia; IV glucose', false, 3),
  ('927696e1-a88f-5d2e-aec9-cf7dbd155421', 'ab82a477-65b6-592d-8e18-0bd7f4b8efc3', 'E', 'Hyperosmolar hyperglycaemic state; IV 0.9% saline to restore volume, with careful monitoring of osmolality and sodium', true, 4);

-- Q69
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('0eb07db1-9d1a-5f7c-b32d-bc4a19bce9fb', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000005', 'sba', 'A 60 year old man has had a PSA of 8 ng/mL. Digital rectal examination is normal. What is the SINGLE most appropriate next investigation?', 'NICE: refer men with raised age-specific PSA or abnormal DRE urgently. Multiparametric MRI is the first-line investigation, with targeted biopsy (usually transperineal) if the MRI is suspicious (Likert or PI-RADS 3 or more). Low-risk prostate cancer may be managed with active surveillance.', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v4')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = '0eb07db1-9d1a-5f7c-b32d-bc4a19bce9fb';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('e892ebfb-2549-5861-896e-8316429ba817', '0eb07db1-9d1a-5f7c-b32d-bc4a19bce9fb', 'A', 'Multiparametric MRI of the prostate (before biopsy) after urgent referral', true, 0),
  ('f78a8c6b-65c8-502e-9b01-dd2020ae65b8', '0eb07db1-9d1a-5f7c-b32d-bc4a19bce9fb', 'B', 'Bone scan', false, 1),
  ('22af5c40-9cb4-53b2-ad15-9be77e7890a7', '0eb07db1-9d1a-5f7c-b32d-bc4a19bce9fb', 'C', 'Transrectal biopsy without imaging', false, 2),
  ('27524254-914e-5546-b8cb-a02b01b26e1c', '0eb07db1-9d1a-5f7c-b32d-bc4a19bce9fb', 'D', 'CT abdomen', false, 3),
  ('d0fde420-24b4-58bc-a00f-634bb40636de', '0eb07db1-9d1a-5f7c-b32d-bc4a19bce9fb', 'E', 'Repeat PSA in 1 year', false, 4);

-- Q70
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('6e067388-8d38-58d1-b38e-f1c9ce2a6cca', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000005', 'sba', 'A 65 year old woman has had painless visible haematuria. She smokes. Urine culture is negative. What is the SINGLE most appropriate management?', 'NICE NG12: refer people aged 45 and over with unexplained visible haematuria (without UTI, or persisting after treatment of UTI) on the suspected cancer pathway. Investigation: flexible cystoscopy and CT urogram. Smoking is the main risk factor for bladder cancer. Occupational exposures to aromatic amines (dyes, rubber) are also risk factors.', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v4')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = '6e067388-8d38-58d1-b38e-f1c9ce2a6cca';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('c7ee89cf-cdc2-5462-b523-4146339f3339', '6e067388-8d38-58d1-b38e-f1c9ce2a6cca', 'A', 'Urgent referral on the suspected cancer pathway for flexible cystoscopy and imaging of the upper tract', true, 0),
  ('c00e01b0-a684-5667-aa25-a8554eb3fcef', '6e067388-8d38-58d1-b38e-f1c9ce2a6cca', 'B', 'Repeat urine dip in 3 months', false, 1),
  ('21485545-0882-554a-91fe-8f2088ce56b1', '6e067388-8d38-58d1-b38e-f1c9ce2a6cca', 'C', 'Renal biopsy', false, 2),
  ('1ca169f6-7307-569a-b0a1-49947b0cd743', '6e067388-8d38-58d1-b38e-f1c9ce2a6cca', 'D', 'Antibiotics and review', false, 3),
  ('5e4626c0-6bf0-5677-b2fa-e28193900cfe', '6e067388-8d38-58d1-b38e-f1c9ce2a6cca', 'E', 'Reassure', false, 4);

-- Q71
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('b7a4cd6e-453c-506a-8c98-f493dd636d93', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000005', 'sba', 'A 30 year old man has had bilateral flank pain and hypertension. Ultrasound shows enlarged kidneys with multiple cysts. His father needed dialysis at 55. What is the SINGLE most likely diagnosis and associated risk?', 'ADPKD (PKD1 or PKD2) causes enlarged cystic kidneys, hypertension, haematuria, loin pain, infection and progressive CKD. Associations: liver cysts, berry aneurysms (screen if family history of SAH), mitral valve prolapse and hernias. Tolvaptan slows progression in rapidly progressive disease. Control BP with ACE inhibitors.', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v4')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = 'b7a4cd6e-453c-506a-8c98-f493dd636d93';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('63693b6c-7f75-55d2-9155-25c17f82a877', 'b7a4cd6e-453c-506a-8c98-f493dd636d93', 'A', 'Medullary sponge kidney; stones', false, 0),
  ('897e96e4-c721-586a-afac-ccaaa681b5ee', 'b7a4cd6e-453c-506a-8c98-f493dd636d93', 'B', 'Autosomal dominant polycystic kidney disease; intracranial (berry) aneurysms', true, 1),
  ('5a323940-883a-51f8-aa7e-1a00dc39c167', 'b7a4cd6e-453c-506a-8c98-f493dd636d93', 'C', 'Tuberous sclerosis; angiomyolipoma', false, 2),
  ('e0ed16b4-5120-5956-a759-7bfe9559c37d', 'b7a4cd6e-453c-506a-8c98-f493dd636d93', 'D', 'Alport syndrome; hearing loss', false, 3),
  ('e28ac6b7-1a66-5757-b3fa-7a9249a09181', 'b7a4cd6e-453c-506a-8c98-f493dd636d93', 'E', 'Simple renal cysts; no risk', false, 4);

-- Q72
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('d8b607e8-eab7-5df4-ac31-23c7e92a4164', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000008', 'sba', 'A 29 year old woman is 34 weeks pregnant. She has a BP of 165/110, headache, visual disturbance and 3+ proteinuria. What is the SINGLE most appropriate immediate management?', 'Severe pre-eclampsia: BP 160/110 or more with features such as headache, visual disturbance, epigastric pain, low platelets, raised liver enzymes or renal impairment. Treat BP (labetalol, nifedipine or hydralazine), give magnesium sulfate to prevent eclampsia, give steroids if under 34+6 weeks, and plan delivery once stable. Delivery is the definitive treatment.', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v4')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = 'd8b607e8-eab7-5df4-ac31-23c7e92a4164';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('4b90828f-7515-537f-9279-8b6a1ec3aca5', 'd8b607e8-eab7-5df4-ac31-23c7e92a4164', 'A', 'Admit, give oral labetalol (or IV if needed) to lower BP, IV magnesium sulfate for seizure prophylaxis, and plan delivery', true, 0),
  ('c1aefff0-23f1-5a77-8b98-e0b7a896db67', 'd8b607e8-eab7-5df4-ac31-23c7e92a4164', 'B', 'Immediate caesarean section without stabilising', false, 1),
  ('8e68fd59-dfe1-5fc4-9f72-bf5b967c0d15', 'd8b607e8-eab7-5df4-ac31-23c7e92a4164', 'C', 'Discharge with home BP monitoring', false, 2),
  ('4e3d55ad-5aa3-555f-8491-a6b4df3ba651', 'd8b607e8-eab7-5df4-ac31-23c7e92a4164', 'D', 'Give aspirin only', false, 3),
  ('14d739f8-daf1-5238-b3aa-abe4308225cb', 'd8b607e8-eab7-5df4-ac31-23c7e92a4164', 'E', 'Furosemide', false, 4);

-- Q73
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('119e703b-f232-512b-acbd-d71b34a433fa', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000008', 'sba', 'A 34 year old woman is 35 weeks pregnant. She has nausea, vomiting, abdominal pain, jaundice and confusion. Her glucose is 2.5 mmol/L, with raised ALT, prolonged PT and raised ammonia. What is the SINGLE most likely diagnosis?', 'Acute fatty liver of pregnancy is a rare, life-threatening condition in the third trimester, with liver failure, hypoglycaemia, coagulopathy and encephalopathy. It may overlap with HELLP. Management: stabilise (glucose, correct coagulopathy) and deliver promptly. It is associated with fetal LCHAD deficiency.', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v4')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = '119e703b-f232-512b-acbd-d71b34a433fa';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('c3b09602-e96a-59d4-981c-b3faa80ed917', '119e703b-f232-512b-acbd-d71b34a433fa', 'A', 'Hepatitis A', false, 0),
  ('528320ca-92b3-5284-bb90-5d0ab8a150fa', '119e703b-f232-512b-acbd-d71b34a433fa', 'B', 'Acute fatty liver of pregnancy', true, 1),
  ('5ac74f72-b9f7-5b14-9ef3-edfc01db5cb4', '119e703b-f232-512b-acbd-d71b34a433fa', 'C', 'Gallstones', false, 2),
  ('a3edb976-fde2-5aed-9e98-d207c0dae295', '119e703b-f232-512b-acbd-d71b34a433fa', 'D', 'Hyperemesis gravidarum', false, 3),
  ('cc469d31-4c39-5d73-9499-67530e1995cc', '119e703b-f232-512b-acbd-d71b34a433fa', 'E', 'Intrahepatic cholestasis of pregnancy', false, 4);

-- Q74
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('6ff74111-509c-5cc6-9336-00f8c4138a03', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000008', 'sba', 'A 26 year old woman has just delivered a baby. The placenta is delivered. She has heavy bleeding of 1,200 mL, and the uterus feels soft and boggy above the umbilicus. What is the SINGLE most appropriate initial management?', 'Postpartum haemorrhage (over 500 mL) is most often due to uterine atony (tone). The 4 Ts: tone, trauma, tissue (retained placenta) and thrombin (coagulopathy). Management: ABC, IV access, bloods, uterine massage, and drugs (oxytocin, ergometrine, carboprost, misoprostol, tranexamic acid). Then balloon tamponade, B-Lynch suture, or hysterectomy if needed.', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v4')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = '6ff74111-509c-5cc6-9336-00f8c4138a03';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('dd57e813-3ad7-5aaa-80c4-1e0105f44ae2', '6ff74111-509c-5cc6-9336-00f8c4138a03', 'A', 'Immediate hysterectomy', false, 0),
  ('4e145436-2e40-5566-af6b-067de98d2f82', '6ff74111-509c-5cc6-9336-00f8c4138a03', 'B', 'Antibiotics only', false, 1),
  ('5880db37-d9e8-5115-8a59-29abc3bd629a', '6ff74111-509c-5cc6-9336-00f8c4138a03', 'C', 'Wait and observe', false, 2),
  ('3dea6200-ff52-50b2-9619-f3af4131eebc', '6ff74111-509c-5cc6-9336-00f8c4138a03', 'D', 'Give oral iron', false, 3),
  ('fecf98a6-2237-515d-8875-904b6846749f', '6ff74111-509c-5cc6-9336-00f8c4138a03', 'E', 'Call for help, rub up the uterus (bimanual compression), give IV oxytocin/ergometrine and resuscitate', true, 4);

-- Q75
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('2b6adb5d-9d43-5f22-b819-ed34db5c2393', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000008', 'sba', 'A 30 year old woman''s membranes ruptured at 38 weeks. A loop of umbilical cord is visible at the introitus. CTG shows fetal bradycardia. What is the SINGLE most appropriate immediate action?', 'Cord prolapse is an obstetric emergency. Prevent compression of the cord by elevating the presenting part, minimal handling of the cord (avoid spasm), and maternal positioning. Tocolytics may be considered. Deliver by the quickest safe route (usually emergency caesarean section).', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v4')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = '2b6adb5d-9d43-5f22-b819-ed34db5c2393';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('da2c7a6f-8d50-5572-8dce-aecbb10d40d2', '2b6adb5d-9d43-5f22-b819-ed34db5c2393', 'A', 'Pull the cord gently', false, 0),
  ('5f6f062a-9d0a-56b6-8959-8f9da39a2902', '2b6adb5d-9d43-5f22-b819-ed34db5c2393', 'B', 'Wait for spontaneous delivery', false, 1),
  ('9970f9d5-3aa4-5d93-868b-2546516d06b2', '2b6adb5d-9d43-5f22-b819-ed34db5c2393', 'C', 'Give tocolytics only', false, 2),
  ('05f74475-2598-597d-9f4d-736aaf9b4683', '2b6adb5d-9d43-5f22-b819-ed34db5c2393', 'D', 'Call for help, elevate the presenting part (manually or by filling the bladder), position knee-chest or left lateral, and arrange category 1 caesarean section', true, 3),
  ('9440d182-ff16-5d88-bc21-fc78a9e210ea', '2b6adb5d-9d43-5f22-b819-ed34db5c2393', 'E', 'Push the cord back into the uterus', false, 4);

-- Q76
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('cc9a3311-9fbb-5c5a-a1ac-2367307e6260', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000008', 'sba', 'A 26 year old woman is 10 weeks pregnant. Her rubella IgG is negative. What is the CORRECT advice?', 'Routine antenatal rubella screening has stopped in the UK, but non-immune women should be offered MMR after giving birth. MMR is a live vaccine and contraindicated in pregnancy (pregnancy should be avoided for 1 month after). Congenital rubella syndrome causes deafness, cataracts and heart defects (PDA), especially if infection occurs before 16 weeks.', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v4')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = 'cc9a3311-9fbb-5c5a-a1ac-2367307e6260';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('773e9e9c-a1ee-5f34-8f43-ac8398313187', 'cc9a3311-9fbb-5c5a-a1ac-2367307e6260', 'A', 'Give MMR immediately', false, 0),
  ('5f684434-1428-5f5d-b6b1-4d4ebdb053bd', 'cc9a3311-9fbb-5c5a-a1ac-2367307e6260', 'B', 'Avoid contact with rubella; offer MMR vaccination after delivery (MMR is contraindicated in pregnancy)', true, 1),
  ('af4797d4-66e3-58b1-975a-799594fba0b4', 'cc9a3311-9fbb-5c5a-a1ac-2367307e6260', 'C', 'No action needed', false, 2),
  ('9d69d574-8000-5736-8014-7845152f57fb', 'cc9a3311-9fbb-5c5a-a1ac-2367307e6260', 'D', 'Give immunoglobulin routinely', false, 3),
  ('649ee128-9610-500c-98b1-4fb36953e8d8', 'cc9a3311-9fbb-5c5a-a1ac-2367307e6260', 'E', 'Terminate the pregnancy', false, 4);

-- Q77
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('b5bac535-1a30-5d3c-81de-cc7c573663b3', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000008', 'sba', 'A 28 year old woman who is 16 weeks pregnant has been in contact with a child with chickenpox. She does not remember having had chickenpox. What is the SINGLE most appropriate next step?', 'RCOG/UKHSA: pregnant women exposed to chickenpox who are not immune should be offered antiviral prophylaxis (aciclovir or valaciclovir from day 7 to day 14 after exposure), which has replaced VZIG for most. Chickenpox in pregnancy risks maternal pneumonia and fetal varicella syndrome (before 28 weeks). Varicella vaccine is live and contraindicated in pregnancy.', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v4')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = 'b5bac535-1a30-5d3c-81de-cc7c573663b3';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('d8b98829-25dd-5be1-b20f-96e9f7929b9f', 'b5bac535-1a30-5d3c-81de-cc7c573663b3', 'A', 'Start aciclovir only if she gets a rash in 3 weeks', false, 0),
  ('a63cbf03-9a0c-5b61-9477-789831379150', 'b5bac535-1a30-5d3c-81de-cc7c573663b3', 'B', 'Check her varicella zoster IgG urgently; if not immune, give post-exposure prophylaxis (oral aciclovir or valaciclovir from day 7-14 after exposure)', true, 1),
  ('6acd98eb-4894-5f10-a589-df638dc0da8d', 'b5bac535-1a30-5d3c-81de-cc7c573663b3', 'C', 'Give the varicella vaccine immediately', false, 2),
  ('44258725-5c59-509c-a088-cd0a3713ce33', 'b5bac535-1a30-5d3c-81de-cc7c573663b3', 'D', 'Terminate the pregnancy', false, 3),
  ('4f0d03e1-042c-5e7f-9ba2-68e6b71c5e72', 'b5bac535-1a30-5d3c-81de-cc7c573663b3', 'E', 'Reassure; no action', false, 4);

-- Q78
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('ac42fcbb-b461-590f-ac93-ff913ff4140d', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000008', 'sba', 'A 58 year old woman has had persistent bloating, early satiety and urinary frequency for 2 months. What is the SINGLE most appropriate first test in primary care?', 'NICE CG122: measure CA125 in women (especially over 50) with persistent bloating, early satiety, pelvic or abdominal pain, or increased urinary urgency or frequency. If CA125 is 35 IU/mL or more, arrange pelvic and abdominal ultrasound. Refer urgently if there is ascites or a pelvic mass. The RMI combines ultrasound findings, menopausal status and CA125.', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v4')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = 'ac42fcbb-b461-590f-ac93-ff913ff4140d';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('de00fcb7-93f2-5d44-985f-ca99f0b8416e', 'ac42fcbb-b461-590f-ac93-ff913ff4140d', 'A', 'Colonoscopy', false, 0),
  ('e2f0fa8d-1c65-5ffa-9b66-f14459a3877c', 'ac42fcbb-b461-590f-ac93-ff913ff4140d', 'B', 'Faecal calprotectin', false, 1),
  ('955ba351-04d1-5cca-bd45-6f5b101e9290', 'ac42fcbb-b461-590f-ac93-ff913ff4140d', 'C', 'Cervical smear', false, 2),
  ('c3b68f78-3c7c-5a41-8843-3dcab533afe5', 'ac42fcbb-b461-590f-ac93-ff913ff4140d', 'D', 'Serum CA125 (followed by pelvic ultrasound if 35 IU/mL or more)', true, 3),
  ('1ce578eb-1f81-582c-a597-12519d20adbc', 'ac42fcbb-b461-590f-ac93-ff913ff4140d', 'E', 'Abdominal X-ray', false, 4);

-- Q79
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('2b0b4ea2-d698-5bdc-9fe3-1d4ef424aaa6', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000008', 'sba', 'A 72 year old woman has had a feeling of something coming down in her vagina, worse on standing. Examination shows a cystocele. She is not sexually active and does not want surgery. What is the SINGLE most appropriate management?', 'Pelvic organ prolapse management: conservative (pelvic floor exercises, weight loss, treat constipation, vaginal oestrogen), pessaries for those who decline or are unfit for surgery, and surgery (anterior or posterior repair, vaginal hysterectomy, sacrocolpopexy). Pessaries need changing and checking every 6-12 months.', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v4')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = '2b0b4ea2-d698-5bdc-9fe3-1d4ef424aaa6';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('538292ee-d7a3-5613-b7a4-54311ae9a086', '2b0b4ea2-d698-5bdc-9fe3-1d4ef424aaa6', 'A', 'Hysterectomy', false, 0),
  ('cfb7b906-ab54-5ba2-9702-d888bfbf12b7', '2b0b4ea2-d698-5bdc-9fe3-1d4ef424aaa6', 'B', 'Antibiotics', false, 1),
  ('0555913a-cb9a-5a92-9cf3-c6f20ac98adf', '2b0b4ea2-d698-5bdc-9fe3-1d4ef424aaa6', 'C', 'Vaginal pessary (e.g. ring or shelf) and pelvic floor exercises', true, 2),
  ('093776c6-ebb0-5600-bb0d-7d031d1ac6de', '2b0b4ea2-d698-5bdc-9fe3-1d4ef424aaa6', 'D', 'Oestrogen tablets only', false, 3),
  ('803266df-d048-5436-a67a-a9909c6e9f88', '2b0b4ea2-d698-5bdc-9fe3-1d4ef424aaa6', 'E', 'Colposuspension', false, 4);

-- Q80
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('4ae44656-bac7-5882-a454-4acbfccf577a', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000008', 'sba', 'A 30 year old woman has had subfertility for 18 months. Her cycles are regular. Day 21 progesterone is 35 nmol/L. Her partner''s semen analysis is normal. What is the SINGLE most appropriate next investigation?', 'A mid-luteal progesterone over 30 nmol/L confirms ovulation. Next, assess tubal patency with hysterosalpingography (low risk) or laparoscopy and dye (with risk factors such as PID or endometriosis). Initial investigations: semen analysis, ovulation tests, rubella status and chlamydia screening. Refer after 1 year of trying (earlier if over 35 or known risk factors).', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v4')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = '4ae44656-bac7-5882-a454-4acbfccf577a';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('20aec2a4-85b2-5342-9107-f0b5185d1cf0', '4ae44656-bac7-5882-a454-4acbfccf577a', 'A', 'Repeat progesterone daily', false, 0),
  ('70ed5d35-30e6-5160-ab68-ddc3ff20b941', '4ae44656-bac7-5882-a454-4acbfccf577a', 'B', 'Endometrial biopsy', false, 1),
  ('63802512-c5f4-51f7-814d-3cb695ce0571', '4ae44656-bac7-5882-a454-4acbfccf577a', 'C', 'Pelvic MRI', false, 2),
  ('c39c9e30-2262-5e19-96b1-d719cd313269', '4ae44656-bac7-5882-a454-4acbfccf577a', 'D', 'Tubal patency testing (hysterosalpingography or HyCoSy)', true, 3),
  ('81e306e7-4e1a-5aab-84e5-f4e2bd50a94c', '4ae44656-bac7-5882-a454-4acbfccf577a', 'E', 'Karyotype', false, 4);

-- Q81
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('9a1e1f87-9fb8-5cd6-be5d-0652d940c69f', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000009', 'sba', 'A 4 week old boy has projectile non-bilious vomiting after feeds. He is hungry after vomiting. An olive-shaped mass is felt in the right upper abdomen during a test feed. Blood gas shows hypochloraemic hypokalaemic metabolic alkalosis. What is the SINGLE most appropriate management?', 'Pyloric stenosis typically affects firstborn boys at 2-8 weeks, with projectile vomiting and hypochloraemic, hypokalaemic metabolic alkalosis. Ultrasound confirms. Correct fluids and electrolytes before surgery (anaesthetic risk with alkalosis). Treatment is laparoscopic or open pyloromyotomy.', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v4')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = '9a1e1f87-9fb8-5cd6-be5d-0652d940c69f';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('219c7fcb-c804-54e5-a4d2-b299f6dea2e1', '9a1e1f87-9fb8-5cd6-be5d-0652d940c69f', 'A', 'Barium meal only', false, 0),
  ('054dc8a4-040e-5319-a26e-5a48ab37c9fa', '9a1e1f87-9fb8-5cd6-be5d-0652d940c69f', 'B', 'Immediate surgery before fluid correction', false, 1),
  ('2fc55c9d-8a44-5fbd-a037-9feffe9a76ca', '9a1e1f87-9fb8-5cd6-be5d-0652d940c69f', 'C', 'Correct fluids and electrolytes first, then pyloromyotomy (Ramstedt)', true, 2),
  ('4632af07-0a35-50b6-8e84-2278b4ea4a93', '9a1e1f87-9fb8-5cd6-be5d-0652d940c69f', 'D', 'PPI', false, 3),
  ('5a100a85-3c3c-511d-9337-230706f72d5c', '9a1e1f87-9fb8-5cd6-be5d-0652d940c69f', 'E', 'Thickened feeds', false, 4);

-- Q82
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('fab6b931-254f-5fdf-9ef6-dd33b6c8cbdb', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000009', 'sba', 'A 9 month old boy has had episodes of inconsolable crying with drawing up of his legs, pallor and vomiting every 15 minutes. He passed a ''redcurrant jelly'' stool. A sausage-shaped mass is felt. What is the SINGLE most appropriate management?', 'Intussusception occurs mainly at 6-18 months, with colicky pain, vomiting, redcurrant jelly stools and a sausage-shaped mass. Ultrasound shows a target sign. Treatment: resuscitation and air (pneumatic) enema reduction. Surgery for perforation, peritonitis or failed reduction.', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v4')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = 'fab6b931-254f-5fdf-9ef6-dd33b6c8cbdb';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('6910ebdd-d73c-5cb0-8c9d-5a0e22e20d3d', 'fab6b931-254f-5fdf-9ef6-dd33b6c8cbdb', 'A', 'Air enema reduction under radiological guidance (if no peritonitis), after fluid resuscitation', true, 0),
  ('3b091b58-8bae-524f-9032-eaf9e1755086', 'fab6b931-254f-5fdf-9ef6-dd33b6c8cbdb', 'B', 'Antibiotics only', false, 1),
  ('c5d4ae52-b70a-5a13-aeeb-20b871309167', 'fab6b931-254f-5fdf-9ef6-dd33b6c8cbdb', 'C', 'Immediate laparotomy in all cases', false, 2),
  ('cbc95247-693a-5181-b5a8-7594587155c0', 'fab6b931-254f-5fdf-9ef6-dd33b6c8cbdb', 'D', 'Observation at home', false, 3),
  ('34d31963-7f5c-589b-bf47-65263154d195', 'fab6b931-254f-5fdf-9ef6-dd33b6c8cbdb', 'E', 'Laxatives', false, 4);

-- Q83
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('fd0c32f4-4696-5954-979d-8619c8e26966', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000009', 'sba', 'A 2 week old baby has a cyanotic episode that worsens when feeding and crying. Chest X-ray shows a ''boot-shaped'' heart. What is the SINGLE most likely diagnosis?', 'Tetralogy of Fallot: VSD, pulmonary stenosis (right ventricular outflow obstruction), overriding aorta and right ventricular hypertrophy. ''Tet spells'' (hypercyanotic episodes) are relieved by knee-chest position, oxygen, morphine and fluids. Surgical repair is usually at 3-6 months. Boot-shaped heart on CXR.', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v4')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = 'fd0c32f4-4696-5954-979d-8619c8e26966';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('f50ab6de-e71d-5329-b204-9181c92c0772', 'fd0c32f4-4696-5954-979d-8619c8e26966', 'A', 'Transposition of the great arteries', false, 0),
  ('cf9d37f9-d96e-5d9c-a577-7d75dbce053b', 'fd0c32f4-4696-5954-979d-8619c8e26966', 'B', 'Tetralogy of Fallot', true, 1),
  ('71f793b8-b340-572e-948a-e3f1498c45a3', 'fd0c32f4-4696-5954-979d-8619c8e26966', 'C', 'Ventricular septal defect', false, 2),
  ('52184415-428c-541a-b562-c556bfed1695', 'fd0c32f4-4696-5954-979d-8619c8e26966', 'D', 'Patent ductus arteriosus', false, 3),
  ('9b5e39da-378b-533b-8afe-332a58f87790', 'fd0c32f4-4696-5954-979d-8619c8e26966', 'E', 'Coarctation of the aorta', false, 4);

-- Q84
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('8ed28019-a76b-5634-b3db-2d54fff31378', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000009', 'sba', 'A newborn baby becomes severely cyanosed within hours of birth. Oxygen does not improve saturation. Chest X-ray shows an ''egg on a string'' appearance. What is the SINGLE most appropriate immediate treatment?', 'Transposition of the great arteries presents with severe cyanosis soon after birth as the ductus closes. Prostaglandin keeps the ductus open for mixing of blood. Balloon atrial septostomy may be needed. Definitive treatment is the arterial switch operation. Indomethacin closes a PDA (used in preterm babies).', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v4')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = '8ed28019-a76b-5634-b3db-2d54fff31378';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('5a165ebb-8cba-51ae-bfb7-828618da7e15', '8ed28019-a76b-5634-b3db-2d54fff31378', 'A', 'Digoxin', false, 0),
  ('7460ed34-412c-5c80-b4a3-45cfc01fdbb1', '8ed28019-a76b-5634-b3db-2d54fff31378', 'B', 'Oxygen at high concentration only', false, 1),
  ('6d8e2543-aa58-55d1-9ced-8f5554547c60', '8ed28019-a76b-5634-b3db-2d54fff31378', 'C', 'IV prostaglandin E1 (alprostadil) to keep the ductus arteriosus open', true, 2),
  ('139a7786-6aa2-5914-8129-6712c6cdf328', '8ed28019-a76b-5634-b3db-2d54fff31378', 'D', 'Furosemide', false, 3),
  ('f6091a71-aa2c-5365-9244-fca2ee384078', '8ed28019-a76b-5634-b3db-2d54fff31378', 'E', 'IV indomethacin', false, 4);

-- Q85
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('32e003c9-cb7e-5972-b7a5-905dcd8d1dd6', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000009', 'sba', 'A 2 day old baby born at term is jaundiced at 18 hours of age. What is the SINGLE most important concern?', 'Jaundice within the first 24 hours is pathological: haemolysis (ABO or Rhesus incompatibility, G6PD deficiency, spherocytosis) or infection. Measure serum bilirubin within 2 hours and plot on a treatment threshold chart. Treatment: phototherapy or exchange transfusion. Kernicterus is the risk of very high unconjugated bilirubin.', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v4')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = '32e003c9-cb7e-5972-b7a5-905dcd8d1dd6';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('523a3c95-c3ce-5ce1-8804-dc98e9ba5637', '32e003c9-cb7e-5972-b7a5-905dcd8d1dd6', 'A', 'No action needed', false, 0),
  ('552834f3-5845-5b8a-8002-4235d36f55d6', '32e003c9-cb7e-5972-b7a5-905dcd8d1dd6', 'B', 'Jaundice within 24 hours is always pathological (e.g. haemolysis) and needs urgent bilirubin measurement', true, 1),
  ('fcf78a45-ae6f-5af6-9662-f29ca9e04345', '32e003c9-cb7e-5972-b7a5-905dcd8d1dd6', 'C', 'Breast milk jaundice', false, 2),
  ('bd3668a7-b43d-5202-82e4-09e1818fdb3c', '32e003c9-cb7e-5972-b7a5-905dcd8d1dd6', 'D', 'It is physiological', false, 3),
  ('b2d56ec1-2c21-5309-9d27-8520dfab4224', '32e003c9-cb7e-5972-b7a5-905dcd8d1dd6', 'E', 'Gilbert''s syndrome', false, 4);

-- Q86
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('077226a7-ac6b-53a8-972b-c5e59d2dfb60', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000009', 'sba', 'A 3 year old boy has had a high fever, drooling, inspiratory stridor and is sitting forward. He looks toxic. He has not been immunised. What is the SINGLE most appropriate management?', 'Epiglottitis (Haemophilus influenzae type b, rare since Hib vaccination) is a life-threatening airway emergency. Do not distress the child (no throat examination, cannulation or X-ray) as it can cause complete obstruction. Senior anaesthetist and ENT secure the airway, then IV antibiotics (ceftriaxone).', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v4')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = '077226a7-ac6b-53a8-972b-c5e59d2dfb60';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('7109106d-e80e-5de4-838e-195f831fda6f', '077226a7-ac6b-53a8-972b-c5e59d2dfb60', 'A', 'Examine the throat with a tongue depressor', false, 0),
  ('a325cd08-3cf3-58f4-b9bd-a80f5e41b47b', '077226a7-ac6b-53a8-972b-c5e59d2dfb60', 'B', 'Oral dexamethasone and discharge', false, 1),
  ('81097cfb-7a14-5f18-bb0b-097ef2d087ed', '077226a7-ac6b-53a8-972b-c5e59d2dfb60', 'C', 'Do not examine the throat; keep him calm, call senior anaesthetics and ENT to secure the airway in theatre', true, 2),
  ('76e0226c-f02a-5f10-bebb-caade7cb9655', '077226a7-ac6b-53a8-972b-c5e59d2dfb60', 'D', 'Lie him flat for a chest X-ray', false, 3),
  ('879c0822-34e4-5691-8886-7463796a558b', '077226a7-ac6b-53a8-972b-c5e59d2dfb60', 'E', 'Nebulised salbutamol', false, 4);

-- Q87
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('d493431b-ef21-5a32-8e25-dd05e2b67315', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000009', 'sba', 'A 2 year old child had a fever and a generalised tonic-clonic seizure lasting 3 minutes. She is now alert and back to normal, with a cold. What is the SINGLE most appropriate advice?', 'Simple febrile seizures occur at 6 months to 5 years, are generalised, last under 15 minutes and happen once in 24 hours. Exclude meningitis and other serious infection. Risk of epilepsy is only slightly higher. Complex febrile seizures (focal, over 15 minutes, recurrent within 24 hours) need further assessment.', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v4')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = 'd493431b-ef21-5a32-8e25-dd05e2b67315';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('eefc235e-4773-5ab5-9521-5437480125ea', 'd493431b-ef21-5a32-8e25-dd05e2b67315', 'A', 'Start sodium valproate', false, 0),
  ('48235103-b7bb-5526-9281-5e8265c6c60a', 'd493431b-ef21-5a32-8e25-dd05e2b67315', 'B', 'EEG and MRI urgently', false, 1),
  ('f2e407df-ad8c-51b4-b209-7d6d78e09d49', 'd493431b-ef21-5a32-8e25-dd05e2b67315', 'C', 'Lumbar puncture in all', false, 2),
  ('a99065e0-2d18-5c36-a7bd-effd8967c4ef', 'd493431b-ef21-5a32-8e25-dd05e2b67315', 'D', 'Admit for 1 week', false, 3),
  ('30040eb6-a589-53a3-8d26-b7e64ce87879', 'd493431b-ef21-5a32-8e25-dd05e2b67315', 'E', 'Simple febrile seizure: reassure, explain recurrence risk (about 1 in 3), and treat the cause of fever; antipyretics do not prevent seizures', true, 4);

-- Q88
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('382080bb-6621-5ce9-9d65-ef13e7b383cb', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000009', 'sba', 'A 3 year old boy has a fever of 39°C. He is pale, has cold peripheries, a capillary refill of 4 seconds, and is difficult to rouse. What is the SINGLE most appropriate action according to NICE traffic light guidance?', 'NICE NG143 traffic light system for feverish children under 5: red features (pale or mottled skin, no response to social cues, not rousable, grunting, RR over 60, reduced skin turgor, non-blanching rash, bulging fontanelle, seizures) need urgent hospital assessment. Infants under 3 months with a temperature of 38°C or more are red. Use the sepsis pathway.', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v4')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = '382080bb-6621-5ce9-9d65-ef13e7b383cb';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('06142dab-8549-5983-9f6f-530f8b4c8f8b', '382080bb-6621-5ce9-9d65-ef13e7b383cb', 'A', 'Amber; review in 24 hours', false, 0),
  ('66d2ee89-81e5-544f-b842-9a64e96f37e4', '382080bb-6621-5ce9-9d65-ef13e7b383cb', 'B', 'Red features; urgent assessment and treatment in hospital for possible serious illness (e.g. sepsis)', true, 1),
  ('d704d361-69f2-55db-ae7d-339de7c27cdb', '382080bb-6621-5ce9-9d65-ef13e7b383cb', 'C', 'Green; discharge with paracetamol', false, 2),
  ('8370edf3-e9c6-5830-b05a-02fdcc76d3eb', '382080bb-6621-5ce9-9d65-ef13e7b383cb', 'D', 'Wait 48 hours', false, 3),
  ('11e203b4-d5f2-5267-b551-fb05cf6d2048', '382080bb-6621-5ce9-9d65-ef13e7b383cb', 'E', 'Antibiotics at home', false, 4);

-- Q89
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('e69ed7cd-1a8d-5a6f-a138-ffe7c6e960a3', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000027', 'sba', 'A 40 year old woman asks about the risk factors for cardiovascular disease. Her 10-year QRISK3 score is 12%. She has no diabetes or CKD. What is the SINGLE most appropriate management?', 'NICE NG238: offer atorvastatin 20 mg for primary prevention when QRISK3 is 10% or more, after lifestyle modification. Aim for over 40% reduction in non-HDL cholesterol. Secondary prevention is atorvastatin 80 mg. Aspirin is not recommended for primary prevention.', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v4')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = 'e69ed7cd-1a8d-5a6f-a138-ffe7c6e960a3';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('f413fd77-536c-52bc-873e-1d86ca833377', 'e69ed7cd-1a8d-5a6f-a138-ffe7c6e960a3', 'A', 'Ezetimibe first-line', false, 0),
  ('0cfe08a9-ea95-5105-a933-bfe990f94a09', 'e69ed7cd-1a8d-5a6f-a138-ffe7c6e960a3', 'B', 'Offer lifestyle advice and atorvastatin 20 mg (primary prevention, QRISK3 10% or more)', true, 1),
  ('74ed17ee-ac97-5d31-aa55-636a769c89ff', 'e69ed7cd-1a8d-5a6f-a138-ffe7c6e960a3', 'C', 'Aspirin 75 mg', false, 2),
  ('c4599615-90d1-5de7-8200-b1d69c055d9f', 'e69ed7cd-1a8d-5a6f-a138-ffe7c6e960a3', 'D', 'Atorvastatin 80 mg', false, 3),
  ('4b174f87-b01e-5704-94b1-36e0d488af8c', 'e69ed7cd-1a8d-5a6f-a138-ffe7c6e960a3', 'E', 'No action until QRISK3 over 20%', false, 4);

-- Q90
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('36b7b111-4ff2-5e2a-a1cf-faf0e74dd95d', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000027', 'sba', 'A 65 year old man has a new diagnosis of type 2 diabetes. His HbA1c is 54 mmol/mol. eGFR is 70. What is the SINGLE most appropriate first-line drug?', 'NICE NG28: metformin is first-line for type 2 diabetes (modified-release if GI side effects). Add an SGLT2 inhibitor if there is heart failure, established atherosclerotic cardiovascular disease or high cardiovascular risk. HbA1c targets: 48 mmol/mol (lifestyle or single drug not causing hypoglycaemia), 53 if on hypoglycaemic drugs. Review metformin if eGFR below 30.', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v4')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = '36b7b111-4ff2-5e2a-a1cf-faf0e74dd95d';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('ec858c2d-8257-501c-aaf7-f5aee7b938c4', '36b7b111-4ff2-5e2a-a1cf-faf0e74dd95d', 'A', 'Gliclazide', false, 0),
  ('dce81138-10b2-5fa9-9866-bd91f8a91893', '36b7b111-4ff2-5e2a-a1cf-faf0e74dd95d', 'B', 'Metformin (standard release, titrated up), with lifestyle advice', true, 1),
  ('5f1cd58e-3cb4-544b-936c-74d099c56fb4', '36b7b111-4ff2-5e2a-a1cf-faf0e74dd95d', 'C', 'Pioglitazone', false, 2),
  ('5786e6bb-c3e8-577e-a91d-4c213a58471e', '36b7b111-4ff2-5e2a-a1cf-faf0e74dd95d', 'D', 'SGLT2 inhibitor alone', false, 3),
  ('4940d751-b56e-5dfe-a5ae-e8f3fcb5b09a', '36b7b111-4ff2-5e2a-a1cf-faf0e74dd95d', 'E', 'Insulin', false, 4);

-- Q91
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('4f4354e5-8ccb-576a-a6b6-f4cba6f206b1', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000027', 'sba', 'A 35 year old man has had a sore, red eye with sticky discharge and crusting on waking. Vision is normal and there is no photophobia. What is the SINGLE most appropriate management?', 'Infective conjunctivitis is usually self-limiting. Clean the eyelids, avoid sharing towels and wash hands. Topical antibiotics (chloramphenicol or fusidic acid) may be used if severe or persistent. Contact lens wearers need urgent assessment for keratitis. Red flags: pain, photophobia, reduced vision, or a ciliary flush.', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v4')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = '4f4354e5-8ccb-576a-a6b6-f4cba6f206b1';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('1c456160-41bc-5d92-a2e1-d35a7d176e46', '4f4354e5-8ccb-576a-a6b6-f4cba6f206b1', 'A', 'Reassure that most bacterial conjunctivitis resolves within 7 days; offer cleaning, and consider chloramphenicol drops if severe or not resolving', true, 0),
  ('78208084-d348-50c3-9db5-b7a7fbdca81b', '4f4354e5-8ccb-576a-a6b6-f4cba6f206b1', 'B', 'Topical steroids', false, 1),
  ('71a58cb7-cdde-5eff-bacc-544213e38244', '4f4354e5-8ccb-576a-a6b6-f4cba6f206b1', 'C', 'Oral antibiotics', false, 2),
  ('c3ad2ebd-fc94-5ad6-862f-5109679157e0', '4f4354e5-8ccb-576a-a6b6-f4cba6f206b1', 'D', 'Urgent ophthalmology referral', false, 3),
  ('371f4e80-57dd-55f9-9411-8a5d6f1aff0f', '4f4354e5-8ccb-576a-a6b6-f4cba6f206b1', 'E', 'Stop wearing glasses', false, 4);

-- Q92
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('40f44291-5524-53a6-9a23-f60545e2a761', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000027', 'sba', 'A 30 year old man has had a red, hot, swollen area on his lower leg for 2 days. He is febrile but well. There is no fluid collection. What is the SINGLE most appropriate antibiotic?', 'NICE NG141: cellulitis is usually caused by Streptococcus pyogenes or Staphylococcus aureus. Flucloxacillin is first-line for 5-7 days. Mark the margin and review. Admit if systemically unwell, rapidly spreading, or with severe comorbidity (Eron class III-IV). Consider co-amoxiclav for facial cellulitis near the eye.', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v4')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = '40f44291-5524-53a6-9a23-f60545e2a761';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('4a5ad34a-b1bd-5807-a76e-47429c1137fb', '40f44291-5524-53a6-9a23-f60545e2a761', 'A', 'Oral metronidazole', false, 0),
  ('e26640fd-0be2-583e-97a5-5a50c87413ec', '40f44291-5524-53a6-9a23-f60545e2a761', 'B', 'Oral amoxicillin', false, 1),
  ('f2e8b5bb-3a8d-5ad5-a97e-7366e223cc8a', '40f44291-5524-53a6-9a23-f60545e2a761', 'C', 'IV vancomycin', false, 2),
  ('99f4e846-4cf1-589b-9d71-1ec6dd42d42c', '40f44291-5524-53a6-9a23-f60545e2a761', 'D', 'Topical fusidic acid', false, 3),
  ('6b962cd1-920b-5098-9907-b3150978ff75', '40f44291-5524-53a6-9a23-f60545e2a761', 'E', 'Oral flucloxacillin (clarithromycin, erythromycin in pregnancy, or doxycycline if penicillin allergic)', true, 4);

-- Q93
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('93daa02b-5550-55e5-8ae8-5eb64a08a99a', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000027', 'sba', 'A 25 year old woman has dysuria and frequency for 2 days. She is not pregnant and has no fever or loin pain. What is the SINGLE most appropriate management?', 'NICE NG109: lower UTI in non-pregnant women: back-up or immediate antibiotic for 3 days. Nitrofurantoin first-line (avoid if eGFR below 45), or trimethoprim if low resistance risk. Men need 7 days of treatment. Pregnant women need 7 days (nitrofurantoin, avoiding it at term) and a urine culture.', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v4')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = '93daa02b-5550-55e5-8ae8-5eb64a08a99a';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('28dc7606-de24-566e-8647-52b21b84c8a1', '93daa02b-5550-55e5-8ae8-5eb64a08a99a', 'A', 'Ciprofloxacin for 7 days', false, 0),
  ('b04372aa-34ff-53a6-8b82-60662b180661', '93daa02b-5550-55e5-8ae8-5eb64a08a99a', 'B', 'No treatment in any case', false, 1),
  ('149fccc9-f9a1-5aa0-b470-957939bdae9a', '93daa02b-5550-55e5-8ae8-5eb64a08a99a', 'C', 'Nitrofurantoin 100 mg MR twice daily for 3 days (or pivmecillinam, or trimethoprim if low resistance risk)', true, 2),
  ('2a056c2a-35d4-5bb6-a199-7e7260aba405', '93daa02b-5550-55e5-8ae8-5eb64a08a99a', 'D', 'IV gentamicin', false, 3),
  ('d094afc0-31da-56b9-b7c1-d7abbb56f84e', '93daa02b-5550-55e5-8ae8-5eb64a08a99a', 'E', 'Amoxicillin for 7 days', false, 4);

-- Q94
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('1d9ca40d-03bf-5cff-9be8-878cbc36ad33', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000027', 'sba', 'A 6 year old child has had an earache and fever for 2 days. The tympanic membrane is red and bulging. She is otherwise well. What is the SINGLE most appropriate management?', 'NICE NG91: acute otitis media usually resolves within 3 days (can last up to 1 week). Give paracetamol or ibuprofen. Consider no antibiotic or a back-up prescription. Give an immediate antibiotic (amoxicillin 5-7 days) if systemically unwell, at high risk of complications, under 2 with bilateral infection, or with otorrhoea.', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v4')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = '1d9ca40d-03bf-5cff-9be8-878cbc36ad33';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('d6152b57-3461-56ee-bf7b-606855975ded', '1d9ca40d-03bf-5cff-9be8-878cbc36ad33', 'A', 'Grommets', false, 0),
  ('a381b162-8bb5-5a75-9bd6-87ba8869bf58', '1d9ca40d-03bf-5cff-9be8-878cbc36ad33', 'B', 'Immediate amoxicillin in all', false, 1),
  ('83207ef7-7723-5e3b-afc4-5205333e3cba', '1d9ca40d-03bf-5cff-9be8-878cbc36ad33', 'C', 'Ear drops with antibiotics', false, 2),
  ('ebc1246a-a5cb-50a0-9a3e-1b6847af70b0', '1d9ca40d-03bf-5cff-9be8-878cbc36ad33', 'D', 'ENT referral', false, 3),
  ('37d4327d-60a7-5313-88f1-94f77a3d28c5', '1d9ca40d-03bf-5cff-9be8-878cbc36ad33', 'E', 'Analgesia and no antibiotic or a back-up prescription (most resolve in 3 days)', true, 4);

-- Q95
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('dae47bbe-0aad-54fb-9692-dcb6a0e13953', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000010', 'sba', 'A 38 year old man with advanced HIV (CD4 40) has headache and fever for 2 weeks, with mild neck stiffness. India ink staining of CSF is positive, and opening pressure is high. What is the SINGLE most likely diagnosis?', 'Cryptococcal meningitis occurs in advanced HIV (CD4 below 100). Features: subacute headache, fever and raised intracranial pressure. CSF cryptococcal antigen and India ink stain are positive. Treatment: amphotericin B with flucytosine, then fluconazole, and repeated LPs to reduce pressure. Delay ART for 4-6 weeks to reduce IRIS risk.', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v4')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = 'dae47bbe-0aad-54fb-9692-dcb6a0e13953';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('6546aab5-551d-51b6-a376-7a723f85a178', 'dae47bbe-0aad-54fb-9692-dcb6a0e13953', 'A', 'CMV encephalitis', false, 0),
  ('d95cd78c-f003-5c52-a59e-c49591e64372', 'dae47bbe-0aad-54fb-9692-dcb6a0e13953', 'B', 'TB meningitis', false, 1),
  ('6c958318-c4cd-52bc-90b4-15a1b9d7a96c', 'dae47bbe-0aad-54fb-9692-dcb6a0e13953', 'C', 'Bacterial meningitis', false, 2),
  ('e0563cc7-339a-58b1-8f60-eb43ea67292b', 'dae47bbe-0aad-54fb-9692-dcb6a0e13953', 'D', 'Cryptococcal meningitis', true, 3),
  ('167db16f-5dca-530c-be92-6ce6919858c8', 'dae47bbe-0aad-54fb-9692-dcb6a0e13953', 'E', 'Toxoplasmosis', false, 4);

-- Q96
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('5c7a5674-7588-5c71-a845-56ab525fee4d', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000010', 'sba', 'A 35 year old woman with HIV (CD4 50) has headache, confusion and a right-sided weakness. MRI shows multiple ring-enhancing lesions at the grey-white matter junction and basal ganglia. Toxoplasma IgG is positive. What is the SINGLE most appropriate treatment?', 'Cerebral toxoplasmosis is the commonest cause of brain lesions in advanced HIV, with multiple ring-enhancing lesions. Treatment: pyrimethamine plus sulfadiazine plus folinic acid. Lack of response after 2 weeks suggests primary CNS lymphoma (usually a single lesion, EBV-positive CSF). Co-trimoxazole prophylaxis prevents it.', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v4')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = '5c7a5674-7588-5c71-a845-56ab525fee4d';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('7a1e222a-ecd5-54e3-8746-ee1b466c137c', '5c7a5674-7588-5c71-a845-56ab525fee4d', 'A', 'Steroids only', false, 0),
  ('9a3bddb7-b0bd-5c4d-95c5-47c72847e5b9', '5c7a5674-7588-5c71-a845-56ab525fee4d', 'B', 'Pyrimethamine and sulfadiazine (with folinic acid)', true, 1),
  ('308fa891-2429-5747-b484-edf47c658f7b', '5c7a5674-7588-5c71-a845-56ab525fee4d', 'C', 'Amphotericin B', false, 2),
  ('f6a2fe49-f884-51ac-bd86-365b45d491df', '5c7a5674-7588-5c71-a845-56ab525fee4d', 'D', 'Aciclovir', false, 3),
  ('2d01a52a-43ec-511b-a122-0654c91e676c', '5c7a5674-7588-5c71-a845-56ab525fee4d', 'E', 'Anti-TB therapy', false, 4);

-- Q97
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('d8be59a4-c7b7-5dff-ad5c-feeb56d57843', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000010', 'sba', 'A 40 year old man with HIV has started antiretroviral therapy 4 weeks ago. His CD4 count has risen, but he now has fever and enlarging lymph nodes. He was diagnosed with TB last month. What is the SINGLE most likely explanation?', 'IRIS is a paradoxical worsening of a known infection (or unmasking of an unknown one) after starting ART, as the immune system recovers. It is common with TB, cryptococcus and MAC. Management: continue ART and anti-infective treatment, with NSAIDs or steroids for significant symptoms.', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v4')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = 'd8be59a4-c7b7-5dff-ad5c-feeb56d57843';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('4ec3aabd-7638-59e9-8787-757a9c6abdca', 'd8be59a4-c7b7-5dff-ad5c-feeb56d57843', 'A', 'ART failure', false, 0),
  ('98046fed-341b-56ac-9832-7f36b925aabb', 'd8be59a4-c7b7-5dff-ad5c-feeb56d57843', 'B', 'Allergy to ART', false, 1),
  ('054aa967-38fe-5f63-b2ed-18c13e9e3f19', 'd8be59a4-c7b7-5dff-ad5c-feeb56d57843', 'C', 'New lymphoma', false, 2),
  ('5b0cfe70-b7d3-547c-9a85-811dea88bbac', 'd8be59a4-c7b7-5dff-ad5c-feeb56d57843', 'D', 'Drug resistance', false, 3),
  ('f5c45e39-17f9-55e3-bb83-e5c3c78a62c5', 'd8be59a4-c7b7-5dff-ad5c-feeb56d57843', 'E', 'Immune reconstitution inflammatory syndrome (IRIS)', true, 4);

-- Q98
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('f2e169ba-1e7c-54d9-b7a5-e2202b50ed86', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000010', 'sba', 'A 30 year old woman has fever, fatigue and jaundice. She returned from India 4 weeks ago. Hepatitis A IgM is positive. What is the CORRECT management?', 'Hepatitis A is faecal-oral spread, causing acute hepatitis that is self-limiting and never chronic. Fulminant liver failure is rare (more common in older adults or with existing liver disease). Hepatitis A is notifiable. Close contacts are offered vaccine within 14 days. Travellers to endemic areas should be vaccinated.', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v4')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = 'f2e169ba-1e7c-54d9-b7a5-e2202b50ed86';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('78e3e03f-a6f3-5155-b849-ab00845230de', 'f2e169ba-1e7c-54d9-b7a5-e2202b50ed86', 'A', 'Long-term monitoring for chronic hepatitis', false, 0),
  ('0db35fd9-8d38-5aee-8e46-cf86c2c91c02', 'f2e169ba-1e7c-54d9-b7a5-e2202b50ed86', 'B', 'Supportive care; notify the health protection team and offer hepatitis A vaccine to close contacts', true, 1),
  ('3f13cca1-cb7d-5581-93b5-ed668d4d8df5', 'f2e169ba-1e7c-54d9-b7a5-e2202b50ed86', 'C', 'Interferon', false, 2),
  ('1b601346-be2d-5370-918e-02f20b2120c3', 'f2e169ba-1e7c-54d9-b7a5-e2202b50ed86', 'D', 'Liver transplant listing', false, 3),
  ('74e77b21-52be-5d54-aff3-ef511fed22f9', 'f2e169ba-1e7c-54d9-b7a5-e2202b50ed86', 'E', 'Start antiviral therapy', false, 4);

-- Q99
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('926dbb90-7811-5c3b-bc71-7cc221f81a3a', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000010', 'sba', 'A 25 year old man has jaundice. Hepatitis B serology shows HBsAg positive, anti-HBc IgM positive and HBeAg positive. What does this indicate?', 'HBsAg indicates current infection. Anti-HBc IgM indicates acute infection (IgG with chronic or past). HBeAg indicates high replication and infectivity. Anti-HBs alone indicates vaccination. Anti-HBs with anti-HBc IgG indicates past infection with immunity. HBsAg persisting over 6 months indicates chronic infection.', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v4')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = '926dbb90-7811-5c3b-bc71-7cc221f81a3a';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('955c33bb-c624-5bdf-9f5d-d770675ac6e0', '926dbb90-7811-5c3b-bc71-7cc221f81a3a', 'A', 'Chronic infection with low infectivity', false, 0),
  ('55312e82-0237-52cc-b2e0-6a79cba9a6d5', '926dbb90-7811-5c3b-bc71-7cc221f81a3a', 'B', 'Hepatitis D infection', false, 1),
  ('a46bf58d-b90c-556e-95c0-f2d84fc46304', '926dbb90-7811-5c3b-bc71-7cc221f81a3a', 'C', 'Previous vaccination', false, 2),
  ('1f478a24-f5cc-5279-9c87-c14840816982', '926dbb90-7811-5c3b-bc71-7cc221f81a3a', 'D', 'Acute hepatitis B infection with high infectivity', true, 3),
  ('f1696290-60f7-5362-bf3d-f8593eaff0f9', '926dbb90-7811-5c3b-bc71-7cc221f81a3a', 'E', 'Resolved past infection', false, 4);

-- Q100
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('30408b2b-b91f-5b37-b8f1-57235bc8a0d8', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000010', 'sba', 'A 50 year old woman had a blood transfusion abroad in the 1980s. She has raised ALT. Hepatitis C antibody is positive. What is the SINGLE most appropriate next test?', 'A positive HCV antibody shows exposure; HCV RNA confirms active infection (about 25% clear spontaneously). Chronic HCV can cause cirrhosis and hepatocellular carcinoma. Direct-acting antivirals (such as sofosbuvir with velpatasvir) cure over 95% in 8-12 weeks. Assess for fibrosis. No vaccine is available.', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v4')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = '30408b2b-b91f-5b37-b8f1-57235bc8a0d8';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('804dda92-1850-51a2-903d-2b32903c5fe1', '30408b2b-b91f-5b37-b8f1-57235bc8a0d8', 'A', 'Hepatitis C RNA (PCR) to confirm current infection', true, 0),
  ('4367f728-1998-5e52-8649-24a953e78183', '30408b2b-b91f-5b37-b8f1-57235bc8a0d8', 'B', 'Repeat antibody test in 1 year', false, 1),
  ('9c638e47-8981-515e-9736-b53780e7c8d2', '30408b2b-b91f-5b37-b8f1-57235bc8a0d8', 'C', 'Liver biopsy', false, 2),
  ('dd8f6aa0-34e8-51e0-a158-155ac2e7c824', '30408b2b-b91f-5b37-b8f1-57235bc8a0d8', 'D', 'Hepatitis B vaccine', false, 3),
  ('81360b5b-9394-59ee-a9b7-9d0dd7b87b47', '30408b2b-b91f-5b37-b8f1-57235bc8a0d8', 'E', 'CT abdomen', false, 4);

-- Q101
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('453e298e-2d4e-5685-8eb4-e8f334b04db2', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000010', 'sba', 'A 72 year old man has shingles affecting his forehead and the tip of his nose (Hutchinson''s sign). What is the SINGLE most important action?', 'Herpes zoster ophthalmicus involves the ophthalmic division of the trigeminal nerve. A rash on the tip of the nose (nasociliary branch, Hutchinson''s sign) predicts eye involvement. Complications: keratitis, uveitis, scleritis and acute retinal necrosis. Give oral antivirals and refer the same day to ophthalmology.', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v4')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = '453e298e-2d4e-5685-8eb4-e8f334b04db2';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('686db1ae-d027-5102-89db-55160e033921', '453e298e-2d4e-5685-8eb4-e8f334b04db2', 'A', 'Oral antivirals and same-day ophthalmology referral (herpes zoster ophthalmicus)', true, 0),
  ('71a6ee3f-9bc1-5a51-a80a-c6e88917a76b', '453e298e-2d4e-5685-8eb4-e8f334b04db2', 'B', 'Routine optician review', false, 1),
  ('a8a61cce-4c92-563d-a4b3-12e5730aa83e', '453e298e-2d4e-5685-8eb4-e8f334b04db2', 'C', 'Reassure', false, 2),
  ('137a3054-30f4-5939-8060-2ae32653ff56', '453e298e-2d4e-5685-8eb4-e8f334b04db2', 'D', 'Antibiotics', false, 3),
  ('55102f96-36d5-59dc-8532-d23a86578579', '453e298e-2d4e-5685-8eb4-e8f334b04db2', 'E', 'Topical steroids', false, 4);

-- Q102
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('8c3bc923-ce9b-5e2f-a8a5-dd812199bfac', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000010', 'sba', 'A 35 year old man has fever, headache and confusion with odd behaviour and a seizure. MRI shows temporal lobe changes. CSF shows lymphocytes with raised protein and normal glucose. What is the SINGLE most appropriate immediate treatment?', 'HSV encephalitis causes fever, confusion, behavioural change, seizures and focal signs, with temporal lobe involvement on MRI and lymphocytic CSF. HSV PCR confirms. Start IV aciclovir immediately on suspicion (without waiting for results), as untreated mortality is high.', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v4')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = '8c3bc923-ce9b-5e2f-a8a5-dd812199bfac';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('c08f192b-5eab-59bf-aa9f-b7fe65f9c3dc', '8c3bc923-ce9b-5e2f-a8a5-dd812199bfac', 'A', 'IV aciclovir (suspected herpes simplex encephalitis)', true, 0),
  ('bc467dc6-d5de-5298-94e5-b134a0a2be94', '8c3bc923-ce9b-5e2f-a8a5-dd812199bfac', 'B', 'Anti-epileptic only', false, 1),
  ('9ec2a31b-9343-5845-9679-855bc9d4eb72', '8c3bc923-ce9b-5e2f-a8a5-dd812199bfac', 'C', 'Antipsychotics', false, 2),
  ('d38cc71d-695a-57e8-b7b1-caf98c9c1785', '8c3bc923-ce9b-5e2f-a8a5-dd812199bfac', 'D', 'Oral steroids', false, 3),
  ('cceee2ea-1533-58d5-8fc6-2c0e770184fd', '8c3bc923-ce9b-5e2f-a8a5-dd812199bfac', 'E', 'IV ceftriaxone alone', false, 4);

-- Q103
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('84bf1b3e-a662-5791-92de-4edf226c5150', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000010', 'sba', 'A 60 year old man has had fever and back pain for 2 weeks. He injects drugs. MRI shows destruction of two vertebrae and the intervertebral disc. Blood cultures grow Staphylococcus aureus. What is the SINGLE most likely diagnosis?', 'Vertebral osteomyelitis and discitis present with back pain, fever and raised inflammatory markers. Risk factors: IV drug use, diabetes, immunosuppression and endocarditis. MRI is the best imaging. S. aureus is the commonest cause; TB (Pott''s disease) is important worldwide. Treatment: prolonged antibiotics (6 weeks or more), with surgery for abscess, instability or neurological deficit. Look for endocarditis.', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v4')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = '84bf1b3e-a662-5791-92de-4edf226c5150';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('859d1cb3-2928-575c-94d7-0926ac4a5afc', '84bf1b3e-a662-5791-92de-4edf226c5150', 'A', 'Discitis/vertebral osteomyelitis', true, 0),
  ('d8590bf4-88be-5fb2-8fe5-4d9002d27d19', '84bf1b3e-a662-5791-92de-4edf226c5150', 'B', 'Mechanical back pain', false, 1),
  ('b189a750-7ca8-55b4-81ea-4d74c8cbda55', '84bf1b3e-a662-5791-92de-4edf226c5150', 'C', 'Osteoporotic fracture', false, 2),
  ('8960bbf4-7f30-5e18-acb5-7363d4ea3b23', '84bf1b3e-a662-5791-92de-4edf226c5150', 'D', 'Ankylosing spondylitis', false, 3),
  ('4b15e45d-90ab-5d0e-ad77-afdf3219b69a', '84bf1b3e-a662-5791-92de-4edf226c5150', 'E', 'Spinal metastases', false, 4);

-- Q104
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('534f1202-466b-5718-aa3b-0b21184c8d9c', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000010', 'sba', 'A 75 year old woman in a care home has had diarrhoea and vomiting along with several other residents over 2 days. It started suddenly with projectile vomiting. What is the SINGLE most likely organism?', 'Norovirus is the commonest cause of gastroenteritis outbreaks in hospitals, care homes and cruise ships. It is highly infectious with sudden vomiting and diarrhoea lasting 1-3 days. Management: supportive, isolation, and handwashing with soap and water (alcohol gel is less effective). Close affected areas and exclude staff for 48 hours after symptoms resolve.', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v4')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = '534f1202-466b-5718-aa3b-0b21184c8d9c';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('aab93d97-75bf-5dfe-9d2f-a5712a358342', '534f1202-466b-5718-aa3b-0b21184c8d9c', 'A', 'Rotavirus', false, 0),
  ('b6c38ae9-cfdb-5cb2-9582-54711aa0ef0e', '534f1202-466b-5718-aa3b-0b21184c8d9c', 'B', 'Salmonella', false, 1),
  ('bc6dcfd0-4517-51fc-8641-26d6e4565dd8', '534f1202-466b-5718-aa3b-0b21184c8d9c', 'C', 'Norovirus', true, 2),
  ('46fcc736-cdcc-5266-9d0f-21d15fd12f65', '534f1202-466b-5718-aa3b-0b21184c8d9c', 'D', 'Campylobacter', false, 3),
  ('f04ad498-edf4-5ecf-abfc-9957612cf4c2', '534f1202-466b-5718-aa3b-0b21184c8d9c', 'E', 'Clostridioides difficile', false, 4);

-- Q105
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('a0dc85ab-e631-5679-86f2-14d6ad594f63', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000010', 'sba', 'A 4 year old girl has had bloody diarrhoea for 5 days after visiting a petting farm. She now has pallor, reduced urine output and petechiae. Platelets are low, and there is a fragmented red cell picture with raised creatinine. What is the SINGLE most likely diagnosis?', 'HUS: microangiopathic haemolytic anaemia, thrombocytopenia and AKI, usually after Shiga toxin-producing E. coli O157 diarrhoea. Antibiotics and antimotility drugs are avoided (may increase toxin release). Treatment: supportive (fluids, dialysis, transfusion). STEC infection is notifiable, and children are excluded from nursery until cleared.', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v4')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = 'a0dc85ab-e631-5679-86f2-14d6ad594f63';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('b5073954-93e4-5750-ac3c-a66fd580087c', 'a0dc85ab-e631-5679-86f2-14d6ad594f63', 'A', 'Intussusception', false, 0),
  ('f83ecac0-1e7d-5a87-9a6f-2a9a757ad8f2', 'a0dc85ab-e631-5679-86f2-14d6ad594f63', 'B', 'ITP', false, 1),
  ('a335b47d-ec2c-521a-9dfa-f232fe8cf1c8', 'a0dc85ab-e631-5679-86f2-14d6ad594f63', 'C', 'Haemolytic uraemic syndrome (E. coli O157)', true, 2),
  ('a84907a7-033f-587b-8d17-8394057dff9f', 'a0dc85ab-e631-5679-86f2-14d6ad594f63', 'D', 'Henoch-Schönlein purpura', false, 3),
  ('eb15d0fd-24fe-5a9a-af5a-d302bffab244', 'a0dc85ab-e631-5679-86f2-14d6ad594f63', 'E', 'Meningococcal sepsis', false, 4);

-- Q106
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('e1c3c3f7-8afb-5d47-8a15-9710cd2f76f7', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000010', 'sba', 'A 30 year old man who has sex with men has diarrhoea, abdominal pain and tenesmus. He had sex in Spain 3 weeks ago. Stool PCR is positive for Shigella. What is the CORRECT management?', 'Shigella causes bloody diarrhoea, fever and abdominal pain, spread faecal-orally and sexually (MSM). Extensively drug-resistant strains are increasing. Shigella is notifiable. Advise hand hygiene, avoiding sex until recovered, and offer HIV and STI testing.', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v4')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = 'e1c3c3f7-8afb-5d47-8a15-9710cd2f76f7';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('390a7965-20f8-5821-9c1c-7f1405a4e0f5', 'e1c3c3f7-8afb-5d47-8a15-9710cd2f76f7', 'A', 'Loperamide only', false, 0),
  ('5fef1567-1752-5f3e-98d3-5a195d176764', 'e1c3c3f7-8afb-5d47-8a15-9710cd2f76f7', 'B', 'Antifungals', false, 1),
  ('8be4d27a-b531-574a-a8d3-7e618f2bde97', 'e1c3c3f7-8afb-5d47-8a15-9710cd2f76f7', 'C', 'No action', false, 2),
  ('ba172652-89b4-5cbb-8cee-525565db4d1b', 'e1c3c3f7-8afb-5d47-8a15-9710cd2f76f7', 'D', 'Antivirals', false, 3),
  ('535a6b5e-60e1-5843-be06-e0988b0e7a4b', 'e1c3c3f7-8afb-5d47-8a15-9710cd2f76f7', 'E', 'Antibiotics guided by sensitivity (multidrug resistance is common), hygiene advice, sexual health screening and contact tracing', true, 4);

-- Q107
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('055b06dc-bdcc-5e49-9c5a-4ecfe71391de', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000002', 'sba', 'A 70 year old man with COPD is assessed for long-term oxygen therapy. His PaO2 on air is 7.0 kPa on two occasions 3 weeks apart when stable. He does not smoke. What is the CORRECT advice?', 'LTOT criteria: PaO2 below 7.3 kPa when stable, or 7.3-8.0 kPa with polycythaemia, peripheral oedema or pulmonary hypertension. It should be used at least 15 hours daily and improves survival. Smokers are generally not offered LTOT (fire risk).', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v4')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = '055b06dc-bdcc-5e49-9c5a-4ecfe71391de';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('3595228f-42af-5d45-a050-f316571fdd5a', '055b06dc-bdcc-5e49-9c5a-4ecfe71391de', 'A', 'Ambulatory oxygen only', false, 0),
  ('b485dc50-0530-5e5a-99b7-51f269cf2141', '055b06dc-bdcc-5e49-9c5a-4ecfe71391de', 'B', 'Use oxygen only at night', false, 1),
  ('9de1a02d-5493-5f33-8a72-fd18e2c37612', '055b06dc-bdcc-5e49-9c5a-4ecfe71391de', 'C', 'He meets criteria for LTOT (PaO2 below 7.3 kPa), to be used at least 15 hours a day', true, 2),
  ('4b7ba5b5-3d6d-511c-9f07-44aba9e963bc', '055b06dc-bdcc-5e49-9c5a-4ecfe71391de', 'D', 'Oxygen only during exacerbations', false, 3),
  ('0276723a-ea2d-5ba0-94c9-8dc98bc4864c', '055b06dc-bdcc-5e49-9c5a-4ecfe71391de', 'E', 'No oxygen needed', false, 4);

-- Q108
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('dc4dc998-8cf8-55ad-8495-f22dbfe03d3f', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000002', 'sba', 'A 50 year old man is obese and snores loudly. His partner says he stops breathing in sleep. He falls asleep while driving. Epworth score is 16. What is the SINGLE most likely diagnosis and treatment?', 'OSA causes snoring, witnessed apnoeas and daytime sleepiness, linked to obesity, hypertension and cardiovascular disease. Diagnosis: home sleep study (oximetry or polygraphy). Treatment: weight loss, CPAP for moderate-severe OSA, and mandibular advancement devices. Drivers with excessive sleepiness from OSA must not drive and must inform the DVLA until it is controlled.', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v4')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = 'dc4dc998-8cf8-55ad-8495-f22dbfe03d3f';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('184b1791-9c76-5abc-a8d7-ad7bfe1dbf67', 'dc4dc998-8cf8-55ad-8495-f22dbfe03d3f', 'A', 'Obstructive sleep apnoea; CPAP and weight loss (and inform DVLA if excessive sleepiness affects driving)', true, 0),
  ('ce7edd03-dc71-5a86-aef7-3e078fdcdff8', 'dc4dc998-8cf8-55ad-8495-f22dbfe03d3f', 'B', 'Asthma; inhaler', false, 1),
  ('37b017a1-22c7-5d4f-b73a-d31569d17f3f', 'dc4dc998-8cf8-55ad-8495-f22dbfe03d3f', 'C', 'Depression; SSRI', false, 2),
  ('30c75956-7de3-5646-9532-c4105725ec53', 'dc4dc998-8cf8-55ad-8495-f22dbfe03d3f', 'D', 'Insomnia; zopiclone', false, 3),
  ('9a1498a5-18d5-50c8-b921-baa803eb4fa8', 'dc4dc998-8cf8-55ad-8495-f22dbfe03d3f', 'E', 'Narcolepsy; modafinil', false, 4);

-- Q109
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('7374c837-20b0-5631-b2c5-82b449d4dead', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000002', 'sba', 'A 65 year old woman has a pleural effusion. Pleural fluid protein is 40 g/L, serum protein 70 g/L, pleural LDH 300 U/L (serum upper limit 250). What does this suggest?', 'Light''s criteria: exudate if pleural/serum protein ratio over 0.5, pleural/serum LDH ratio over 0.6, or pleural LDH over two-thirds the upper limit of normal serum LDH. Exudates: infection, malignancy, PE, TB and RA. Transudates: heart failure, cirrhosis, nephrotic syndrome and hypothyroidism.', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v4')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = '7374c837-20b0-5631-b2c5-82b449d4dead';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('4958c1f0-f941-5a8f-8b44-208b3b002fbd', '7374c837-20b0-5631-b2c5-82b449d4dead', 'A', 'Exudate (by Light''s criteria)', true, 0),
  ('830824ec-0023-5b29-9fd5-5462d8c2b433', '7374c837-20b0-5631-b2c5-82b449d4dead', 'B', 'Normal finding', false, 1),
  ('959543cc-af2c-56e5-ad5d-271b02414939', '7374c837-20b0-5631-b2c5-82b449d4dead', 'C', 'Haemothorax', false, 2),
  ('e4ef9164-dfc3-51a5-b8d3-6b559038a778', '7374c837-20b0-5631-b2c5-82b449d4dead', 'D', 'Transudate', false, 3),
  ('0e4df821-389a-5697-a323-5382cff71f1e', '7374c837-20b0-5631-b2c5-82b449d4dead', 'E', 'Chylothorax', false, 4);

-- Q110
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('a316d262-b19d-5918-aad8-9bd70c3d3e38', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000017', 'sba', 'A 68 year old woman with metastatic breast cancer has a calcium of 3.4 mmol/L, confusion, thirst and constipation. What is the SINGLE most appropriate initial treatment?', 'Hypercalcaemia of malignancy (from PTHrP or bone metastases) causes confusion, polyuria, thirst, constipation, nausea and arrhythmias. Treatment: aggressive IV rehydration, then IV bisphosphonate (zoledronic acid or pamidronate), which takes 2-4 days to work. Denosumab for refractory cases. Steroids for lymphoma or myeloma. Recurrence is common.', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v4')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = 'a316d262-b19d-5918-aad8-9bd70c3d3e38';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('328ff94c-381a-52e2-ad25-dd3135b2d253', 'a316d262-b19d-5918-aad8-9bd70c3d3e38', 'A', 'IV fluids (0.9% saline) followed by IV bisphosphonate (e.g. zoledronic acid)', true, 0),
  ('a508d55d-5fbc-5a6b-a66c-119220f2ab8c', 'a316d262-b19d-5918-aad8-9bd70c3d3e38', 'B', 'Furosemide first', false, 1),
  ('02f1a949-6a5b-5624-8780-63813cec513c', 'a316d262-b19d-5918-aad8-9bd70c3d3e38', 'C', 'Oral calcium restriction only', false, 2),
  ('f88494d4-dd93-59cb-80cc-abfb2a79abbe', 'a316d262-b19d-5918-aad8-9bd70c3d3e38', 'D', 'Calcitonin alone long-term', false, 3),
  ('5fc69964-2970-518a-a33f-472962578401', 'a316d262-b19d-5918-aad8-9bd70c3d3e38', 'E', 'Oral steroids only', false, 4);

-- Q111
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('2cea7414-cb61-5b99-8e49-72ba830653e1', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000017', 'sba', 'A 72 year old man with advanced lung cancer is likely to die within days. His family asks whether he should continue IV fluids. He is unable to drink. What is the BEST approach?', 'NICE NG31 (care in the last days of life): support the dying person to drink if they wish and are able. Consider clinically assisted hydration if distress or symptoms may be due to dehydration, discussing risks and benefits, and review at least daily. Mouth care relieves thirst. Decisions are individual and communicated clearly.', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v4')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = '2cea7414-cb61-5b99-8e49-72ba830653e1';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('42b6c231-03c5-5238-b349-ca1f23510b1e', '2cea7414-cb61-5b99-8e49-72ba830653e1', 'A', 'Discuss with the patient (if possible) and family; consider clinically assisted hydration case by case, review it at least daily, and provide mouth care', true, 0),
  ('584ad083-d982-5202-8921-c59b817e3520', '2cea7414-cb61-5b99-8e49-72ba830653e1', 'B', 'Leave the decision to the most junior doctor', false, 1),
  ('01488841-f6cc-5e71-9ff0-acf560f706ca', '2cea7414-cb61-5b99-8e49-72ba830653e1', 'C', 'Always give 3 litres IV daily', false, 2),
  ('6693da11-434d-5074-92c7-369058b92e53', '2cea7414-cb61-5b99-8e49-72ba830653e1', 'D', 'Never give fluids in any dying patient', false, 3),
  ('469e24db-5131-5834-bacd-5f15a240817a', '2cea7414-cb61-5b99-8e49-72ba830653e1', 'E', 'Insert an NG tube', false, 4);

-- Q112
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('cfe94c97-4619-545f-a6d2-47922f8dc42f', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000017', 'sba', 'A 70 year old woman with advanced heart failure tells her GP she wants to die at home, not in hospital, and does not want CPR. What is the SINGLE most appropriate step?', 'Advance care planning records a person''s preferences for future care, including preferred place of death and treatment escalation. ReSPECT forms record personalised recommendations including CPR decisions. Share with ambulance, out-of-hours and community teams. Patients with capacity can also make an advance decision to refuse treatment.', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v4')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = 'cfe94c97-4619-545f-a6d2-47922f8dc42f';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('b72ec483-d4cf-506f-ada8-2b5678ce48e1', 'cfe94c97-4619-545f-a6d2-47922f8dc42f', 'A', 'Ask her family to decide', false, 0),
  ('2327a15f-e316-54f0-9e26-2389476d48b5', 'cfe94c97-4619-545f-a6d2-47922f8dc42f', 'B', 'Refer to psychiatry', false, 1),
  ('14bb8585-9b19-5f9b-bc3a-4ba129274aa2', 'cfe94c97-4619-545f-a6d2-47922f8dc42f', 'C', 'Ignore her wishes', false, 2),
  ('f53f8757-80ee-5885-9329-3023ebda9912', 'cfe94c97-4619-545f-a6d2-47922f8dc42f', 'D', 'Advance care planning: document her wishes, complete a DNACPR form (ReSPECT), and share with relevant services', true, 3),
  ('cafff863-c30b-5a13-aa56-7501a8c3932e', 'cfe94c97-4619-545f-a6d2-47922f8dc42f', 'E', 'Tell her she must go to hospital', false, 4);

-- Q113
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('da7c137f-ce63-58ad-9046-3b5e94f27c5e', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000017', 'sba', 'A 55 year old man with pancreatic cancer has severe epigastric pain radiating to his back, not controlled despite high-dose opioids. What is the SINGLE most appropriate intervention?', 'Pancreatic cancer pain can be severe and visceral, often radiating to the back. A coeliac plexus block (neurolysis) can significantly reduce pain and opioid requirements. Other options: optimise opioids, adjuvants, radiotherapy. Involve specialist palliative care.', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v4')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = 'da7c137f-ce63-58ad-9046-3b5e94f27c5e';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('90e94576-26c2-5bf3-beb0-7752e15b2dd5', 'da7c137f-ce63-58ad-9046-3b5e94f27c5e', 'A', 'Increase morphine further indefinitely', false, 0),
  ('f7ee601b-7721-536a-9337-0d157f2fe0c5', 'da7c137f-ce63-58ad-9046-3b5e94f27c5e', 'B', 'Surgery to remove the tumour', false, 1),
  ('0cef2f3f-70cb-5ba8-8ae4-2fb3bc20be13', 'da7c137f-ce63-58ad-9046-3b5e94f27c5e', 'C', 'Coeliac plexus block', true, 2),
  ('417576b4-1e46-58ac-b582-28bfbf1a1052', 'da7c137f-ce63-58ad-9046-3b5e94f27c5e', 'D', 'Paracetamol only', false, 3),
  ('09ad5916-8854-599c-af2b-df38134088df', 'da7c137f-ce63-58ad-9046-3b5e94f27c5e', 'E', 'Physiotherapy', false, 4);

-- Q114
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('ae14a17e-0ff8-5bce-934d-ed7a8d26f0c5', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000017', 'sba', 'A 65 year old woman has metastatic cancer and severe neuropathic pain in her leg from a tumour pressing on the lumbosacral plexus. She is on morphine. What is the SINGLE most appropriate additional drug?', 'Neuropathic cancer pain often responds poorly to opioids alone. Add adjuvant drugs (gabapentinoids, tricyclics, SNRIs). Dexamethasone reduces nerve compression from tumour oedema. Radiotherapy may help. Consider specialist interventions such as nerve blocks.', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v4')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = 'ae14a17e-0ff8-5bce-934d-ed7a8d26f0c5';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('e291a721-0223-57f9-9110-640de9fef713', 'ae14a17e-0ff8-5bce-934d-ed7a8d26f0c5', 'A', 'Paracetamol only', false, 0),
  ('24369a36-27c2-534d-bbc4-05890d032fc8', 'ae14a17e-0ff8-5bce-934d-ed7a8d26f0c5', 'B', 'NSAID only', false, 1),
  ('9da49dce-1745-52a1-b66a-8adad8b94bd5', 'ae14a17e-0ff8-5bce-934d-ed7a8d26f0c5', 'C', 'Oral antibiotics', false, 2),
  ('d4720167-bb92-55e1-a8dd-23f9d543471f', 'ae14a17e-0ff8-5bce-934d-ed7a8d26f0c5', 'D', 'Double the morphine', false, 3),
  ('5dfe8bb8-641b-525b-bf94-b5ddd6f35ff6', 'ae14a17e-0ff8-5bce-934d-ed7a8d26f0c5', 'E', 'Adjuvant analgesic such as gabapentin, pregabalin, amitriptyline or duloxetine (and dexamethasone if tumour compression)', true, 4);

-- Q115
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('6d0ba93b-5a16-53de-a5b2-8c3dcf2e274b', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000017', 'sba', 'A 60 year old man with advanced cancer has a sore mouth with white plaques on his tongue that scrape off, leaving a red base. What is the SINGLE most appropriate treatment?', 'Oral candidiasis is common in palliative care (steroids, antibiotics, dry mouth, poor oral hygiene). Treat with topical antifungals (nystatin or miconazole gel, avoiding miconazole with warfarin) or oral fluconazole for extensive or oesophageal disease. Good mouth care helps prevent it.', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v4')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = '6d0ba93b-5a16-53de-a5b2-8c3dcf2e274b';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('e6577ccd-b3e2-51a3-9a7f-17ba824f2937', '6d0ba93b-5a16-53de-a5b2-8c3dcf2e274b', 'A', 'Antibiotics', false, 0),
  ('150366ff-62fe-5250-8667-fa3d332ac4b6', '6d0ba93b-5a16-53de-a5b2-8c3dcf2e274b', 'B', 'Chlorhexidine only', false, 1),
  ('7560f769-17e6-508e-a3c5-2f81596c2bc7', '6d0ba93b-5a16-53de-a5b2-8c3dcf2e274b', 'C', 'Topical steroids', false, 2),
  ('52a85370-04b8-5246-ba0b-4c3d5c1bf76f', '6d0ba93b-5a16-53de-a5b2-8c3dcf2e274b', 'D', 'No treatment', false, 3),
  ('c25f4ac0-6b53-59f8-8c9e-2f61c2b9d4ee', '6d0ba93b-5a16-53de-a5b2-8c3dcf2e274b', 'E', 'Oral nystatin suspension or miconazole oral gel (fluconazole if extensive)', true, 4);

-- Q116
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('1992a4c4-90c0-5c69-88a6-b3583c89c997', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000017', 'sba', 'A 70 year old man has cancer. His symptoms are controlled, but he is very worried about his wife coping after his death. Which service can BEST support his family before and after his death?', 'Palliative care is holistic, addressing physical, psychological, social and spiritual needs of the patient and family, including bereavement support. Hospices provide inpatient, day and community care. Carers can get assessments, benefits advice (such as the special rules for terminal illness), and respite.', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v4')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = '1992a4c4-90c0-5c69-88a6-b3583c89c997';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('66d0fb6a-b4b0-5c2f-b397-1d94488f6ef3', '1992a4c4-90c0-5c69-88a6-b3583c89c997', 'A', 'No support exists', false, 0),
  ('f2d03e48-461d-5d41-80a9-6c598f59a28a', '1992a4c4-90c0-5c69-88a6-b3583c89c997', 'B', 'Social media groups only', false, 1),
  ('fe9340c8-eed3-58f3-9dbe-99f14e215df4', '1992a4c4-90c0-5c69-88a6-b3583c89c997', 'C', 'The specialist palliative care team and hospice services, including bereavement support', true, 2),
  ('3d796aab-b613-5fe6-ab0c-9b1c86e42fd8', '1992a4c4-90c0-5c69-88a6-b3583c89c997', 'D', 'The police', false, 3),
  ('055b14fa-b159-505f-9589-6ac2de5d851c', '1992a4c4-90c0-5c69-88a6-b3583c89c997', 'E', 'A cardiologist', false, 4);

-- Q117
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('c3557d76-c390-51e1-83ad-8fda5b15bd10', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000017', 'sba', 'A 75 year old woman with dementia and pneumonia is dying. She has been prescribed anticipatory medicines. Which route is MOST commonly used for these in the community?', 'Anticipatory (''just in case'') medicines are prescribed for common symptoms at the end of life: pain, breathlessness, agitation, nausea and secretions. The subcutaneous route is preferred because it is easy, comfortable and can be given by community nurses. A syringe driver provides continuous delivery.', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v4')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = 'c3557d76-c390-51e1-83ad-8fda5b15bd10';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('ae6c973a-071b-5064-b3aa-ac01e2411e8a', 'c3557d76-c390-51e1-83ad-8fda5b15bd10', 'A', 'Intramuscular injection', false, 0),
  ('727eeabe-7262-5ffb-a1ab-34aa65158d74', 'c3557d76-c390-51e1-83ad-8fda5b15bd10', 'B', 'Subcutaneous injection (or continuous subcutaneous infusion via syringe driver)', true, 1),
  ('39207d8c-2fc7-529d-8e1b-34f06b94608a', 'c3557d76-c390-51e1-83ad-8fda5b15bd10', 'C', 'Intravenous infusion', false, 2),
  ('648801ef-1f39-5496-a5d4-38d1ddee8d52', 'c3557d76-c390-51e1-83ad-8fda5b15bd10', 'D', 'Rectal only', false, 3),
  ('4f2849d4-f73a-57ae-9821-ca4263e90012', 'c3557d76-c390-51e1-83ad-8fda5b15bd10', 'E', 'Oral only', false, 4);

-- Q118
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('d2f23daf-52d7-5ebc-8bc8-96b32d6f2fff', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000029', 'sba', 'An 88 year old woman was found on the floor at home after a fall. She lay there for 12 hours. What is the MOST important complication to check for?', 'A ''long lie'' after a fall risks rhabdomyolysis and AKI, pressure ulcers, hypothermia, dehydration, pneumonia and fear of falling. Check CK, U&E, temperature and skin, and look for injuries (hip fracture, head injury). Assess why she fell (syncope, infection, drugs). Consider a pendant alarm.', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v4')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = 'd2f23daf-52d7-5ebc-8bc8-96b32d6f2fff';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('c6619033-0b62-5b3f-a207-7c2a7a8cc1d0', 'd2f23daf-52d7-5ebc-8bc8-96b32d6f2fff', 'A', 'Rhabdomyolysis (check CK and renal function), pressure damage, hypothermia and dehydration', true, 0),
  ('79b0008c-0a58-5671-bdfc-e02c11a1f368', 'd2f23daf-52d7-5ebc-8bc8-96b32d6f2fff', 'B', 'Migraine', false, 1),
  ('546e9c56-2226-59cc-b899-199e8031572f', 'd2f23daf-52d7-5ebc-8bc8-96b32d6f2fff', 'C', 'Diabetes insipidus', false, 2),
  ('53651bac-f37c-5b6f-8708-6f87d16d2d63', 'd2f23daf-52d7-5ebc-8bc8-96b32d6f2fff', 'D', 'Asthma', false, 3),
  ('df1f8a70-5a23-54a9-bf9e-4ae7c0e39e42', 'd2f23daf-52d7-5ebc-8bc8-96b32d6f2fff', 'E', 'Glaucoma', false, 4);

-- Q119
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('211ca003-a77e-5237-b72e-7fbdbf082788', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000029', 'sba', 'A 79 year old man has delirium. His family ask what can help prevent it getting worse. Which measure is MOST helpful?', 'NICE CG103: delirium prevention and management relies on multicomponent interventions: orientation, sensory aids, hydration, nutrition, mobilisation, sleep hygiene, pain control, avoiding unnecessary catheters and ward moves, and medication review. Antipsychotics only if distressed or a danger and other measures have failed.', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v4')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = '211ca003-a77e-5237-b72e-7fbdbf082788';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('08df5c69-84f0-5390-bca5-2461bdd355df', '211ca003-a77e-5237-b72e-7fbdbf082788', 'A', 'Routine sedation', false, 0),
  ('308a62b4-801d-5866-a64d-b15de6bf0323', '211ca003-a77e-5237-b72e-7fbdbf082788', 'B', 'Physical restraints', false, 1),
  ('d628b104-034f-5e63-8baa-5efe514ca1db', '211ca003-a77e-5237-b72e-7fbdbf082788', 'C', 'Moving him between wards', false, 2),
  ('9f666742-3f39-5de7-b21b-a80d0fcc1557', '211ca003-a77e-5237-b72e-7fbdbf082788', 'D', 'Non-drug measures: reorientation, glasses and hearing aids, good sleep, hydration, mobilisation and family involvement', true, 3),
  ('c4f952ca-7e48-5c40-9b13-0349ac34ac30', '211ca003-a77e-5237-b72e-7fbdbf082788', 'E', 'Keeping lights on all night', false, 4);

-- Q120
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('8b0b6039-66d9-53c0-8b34-07c2064ce1b1', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000014', 'sba', 'A 30 year old woman has heavy periods and fatigue. Hb is 95 g/L, MCV 70, ferritin 6. What is the SINGLE most appropriate treatment?', 'Iron deficiency anaemia: oral iron (one tablet once daily or on alternate days improves absorption and tolerability), continuing for 3 months after Hb normalises to replenish stores. Expect an Hb rise of about 20 g/L in 3-4 weeks. IV iron if intolerant, malabsorption or rapid correction needed. Treat the cause (menorrhagia).', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v4')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = '8b0b6039-66d9-53c0-8b34-07c2064ce1b1';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('27e6e013-c288-5b32-a4a4-83b08b209beb', '8b0b6039-66d9-53c0-8b34-07c2064ce1b1', 'A', 'Folic acid only', false, 0),
  ('1ebfba51-489b-5376-8077-4a8c9a4543b7', '8b0b6039-66d9-53c0-8b34-07c2064ce1b1', 'B', 'Blood transfusion', false, 1),
  ('e38a6350-ea74-5717-910a-16ca0ba2e1aa', '8b0b6039-66d9-53c0-8b34-07c2064ce1b1', 'C', 'IV iron as first-line in all', false, 2),
  ('44275858-8d77-5a09-aa39-5c213c087e08', '8b0b6039-66d9-53c0-8b34-07c2064ce1b1', 'D', 'Oral iron (e.g. ferrous sulfate once daily or on alternate days), and investigate/treat the cause', true, 3),
  ('95ab1c81-84d5-5c9b-8e66-af125c1aae4c', '8b0b6039-66d9-53c0-8b34-07c2064ce1b1', 'E', 'Vitamin B12 injections', false, 4);

-- Q121
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('053b7cc6-6df9-54a4-87a5-bc48b394bc14', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000014', 'sba', 'A 65 year old man has fatigue and tingling in his feet. Hb is 85, MCV 118. B12 is low. Intrinsic factor antibodies are positive. What is the SINGLE most appropriate treatment?', 'Pernicious anaemia is autoimmune B12 deficiency due to lack of intrinsic factor. Features: anaemia, glossitis, peripheral neuropathy and subacute combined degeneration of the cord. Treat with IM hydroxocobalamin (more frequent loading if neurological involvement), lifelong. Never give folic acid alone in B12 deficiency (can worsen neurological damage).', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v4')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = '053b7cc6-6df9-54a4-87a5-bc48b394bc14';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('29777e14-c7df-51f4-8923-9690fdb4f0ef', '053b7cc6-6df9-54a4-87a5-bc48b394bc14', 'A', 'Oral iron', false, 0),
  ('deb40b8e-dd84-5eb6-bc3e-e7ce01e8a2ae', '053b7cc6-6df9-54a4-87a5-bc48b394bc14', 'B', 'Oral folic acid alone', false, 1),
  ('547416f6-95b8-53eb-abc7-a3ebe336a433', '053b7cc6-6df9-54a4-87a5-bc48b394bc14', 'C', 'IM hydroxocobalamin (loading doses, then every 2-3 months for life)', true, 2),
  ('d84794a6-c788-5d20-a1fb-074c8a140df4', '053b7cc6-6df9-54a4-87a5-bc48b394bc14', 'D', 'No treatment', false, 3),
  ('fc71d1d0-860a-53f7-a37c-0a0761bca7c7', '053b7cc6-6df9-54a4-87a5-bc48b394bc14', 'E', 'Blood transfusion', false, 4);

-- Q122
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('704bde28-58d0-563e-a87b-ad959a12ec8a', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000014', 'sba', 'A 5 year old boy has had bruising and petechiae for 2 days, 2 weeks after a viral infection. He is otherwise well. FBC shows platelets of 15 x10^9/L, with normal Hb and WCC. What is the SINGLE most likely diagnosis?', 'Childhood ITP often follows a viral infection, causing isolated thrombocytopenia with petechiae and bruising. Most resolve within weeks to months without treatment. Blood film to exclude leukaemia. Treatment (steroids, IVIG) only for significant bleeding. Avoid contact sports and NSAIDs. Adult ITP is more often chronic.', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v4')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = '704bde28-58d0-563e-a87b-ad959a12ec8a';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('e743cf3a-9e9f-56f5-8770-f50bcb85f017', '704bde28-58d0-563e-a87b-ad959a12ec8a', 'A', 'Non-accidental injury', false, 0),
  ('d32be609-2e33-5b7a-a8ae-9e6fb752907d', '704bde28-58d0-563e-a87b-ad959a12ec8a', 'B', 'Henoch-Schönlein purpura', false, 1),
  ('cc1325e7-05bc-5224-bb23-30e7fbdc561b', '704bde28-58d0-563e-a87b-ad959a12ec8a', 'C', 'Acute lymphoblastic leukaemia', false, 2),
  ('0a44d827-d801-5d6f-bb97-305558ab6557', '704bde28-58d0-563e-a87b-ad959a12ec8a', 'D', 'Immune thrombocytopenia (ITP)', true, 3),
  ('86527bb8-3f1d-5298-949a-2d9d223acd8f', '704bde28-58d0-563e-a87b-ad959a12ec8a', 'E', 'Haemophilia', false, 4);

-- Q123
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('beff842b-6a06-569e-8921-c072dcf383fc', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000014', 'sba', 'A 35 year old woman has fever, confusion, petechiae, haemolytic anaemia with schistocytes, low platelets and mild AKI. Clotting is normal. What is the SINGLE most appropriate treatment?', 'TTP is caused by ADAMTS13 deficiency (usually autoimmune), leading to microangiopathic haemolytic anaemia and thrombocytopenia, with neurological symptoms, fever and renal impairment. It is a haematological emergency with high mortality untreated. Treatment: plasma exchange, steroids, rituximab and caplacizumab. Platelet transfusion is avoided unless life-threatening bleeding.', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v4')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = 'beff842b-6a06-569e-8921-c072dcf383fc';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('7a39e978-df4c-54fa-acba-7339ca715e69', 'beff842b-6a06-569e-8921-c072dcf383fc', 'A', 'Antibiotics only', false, 0),
  ('ef2db101-76d7-5060-823f-caebb009ebe8', 'beff842b-6a06-569e-8921-c072dcf383fc', 'B', 'Platelet transfusion', false, 1),
  ('7a1d4202-57ef-5b8b-ac19-afc1da8b0ab6', 'beff842b-6a06-569e-8921-c072dcf383fc', 'C', 'Heparin', false, 2),
  ('e1302fbf-8972-529f-9bb8-32758fb963d6', 'beff842b-6a06-569e-8921-c072dcf383fc', 'D', 'Splenectomy', false, 3),
  ('afec5a62-26dd-5231-88b4-8c70161196a1', 'beff842b-6a06-569e-8921-c072dcf383fc', 'E', 'Urgent plasma exchange (thrombotic thrombocytopenic purpura), with steroids and caplacizumab', true, 4);

-- Q124
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('c09c5326-0a72-58df-90ba-bb76bdcc13b4', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000014', 'sba', 'A 60 year old man has fatigue, splenomegaly and a WCC of 150 x10^9/L, with neutrophils and myelocytes. The Philadelphia chromosome is found. What is the SINGLE most appropriate treatment?', 'CML is a myeloproliferative neoplasm with the BCR-ABL1 fusion gene (Philadelphia chromosome, t(9;22)). It often presents with fatigue, weight loss, massive splenomegaly and a very high WCC. Tyrosine kinase inhibitors (imatinib, dasatinib, nilotinib) have transformed survival. Monitoring is by BCR-ABL PCR.', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v4')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = 'c09c5326-0a72-58df-90ba-bb76bdcc13b4';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('60aec2b3-890a-5398-a184-5ad50dbd91f3', 'c09c5326-0a72-58df-90ba-bb76bdcc13b4', 'A', 'Tyrosine kinase inhibitor (e.g. imatinib)', true, 0),
  ('b16cedae-acfc-56b8-97b5-d3b534998aa2', 'c09c5326-0a72-58df-90ba-bb76bdcc13b4', 'B', 'Rituximab', false, 1),
  ('7d95446e-d86d-51d2-881e-563fad72af1b', 'c09c5326-0a72-58df-90ba-bb76bdcc13b4', 'C', 'Splenectomy', false, 2),
  ('231a5b21-5741-5828-a886-5685eccd5e7b', 'c09c5326-0a72-58df-90ba-bb76bdcc13b4', 'D', 'Watch and wait', false, 3),
  ('7980eee2-b1fe-5347-9f90-4f6309671c1e', 'c09c5326-0a72-58df-90ba-bb76bdcc13b4', 'E', 'Hydroxycarbamide alone lifelong', false, 4);

-- Q125
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('e3cba92a-c1e5-519f-87d8-53d17b0b3cd9', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000014', 'sba', 'A 25 year old man is transfused with packed red cells. Within 10 minutes, he has fever, back pain, hypotension and dark urine. What is the SINGLE most likely cause?', 'ABO incompatibility (usually from patient identification errors) causes intravascular haemolysis, fever, rigors, loin pain, hypotension, haemoglobinuria, DIC and AKI. Stop the transfusion immediately, keep IV access, resuscitate, and return the unit and samples to the lab. Report to SHOT and MHRA (SABRE). ABO incompatible transfusion is a never event.', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v4')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = 'e3cba92a-c1e5-519f-87d8-53d17b0b3cd9';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('52c68388-9d54-5f6a-921e-57d5369cea8d', 'e3cba92a-c1e5-519f-87d8-53d17b0b3cd9', 'A', 'TACO', false, 0),
  ('d3298724-7b5c-5a4c-893f-8e0d7334b694', 'e3cba92a-c1e5-519f-87d8-53d17b0b3cd9', 'B', 'Acute haemolytic transfusion reaction (ABO incompatibility)', true, 1),
  ('36a583f2-e4a7-522f-8f57-718c8cb7bfee', 'e3cba92a-c1e5-519f-87d8-53d17b0b3cd9', 'C', 'TRALI', false, 2),
  ('cdb6bb79-67e5-5945-84f7-d1ea03866cc5', 'e3cba92a-c1e5-519f-87d8-53d17b0b3cd9', 'D', 'Febrile non-haemolytic reaction', false, 3),
  ('f5fd0d09-1f7d-5083-9762-8dc12527210d', 'e3cba92a-c1e5-519f-87d8-53d17b0b3cd9', 'E', 'Allergic reaction', false, 4);

-- Q126
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('ebb392f7-917a-5b80-9bcd-25b19a6923d1', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000022', 'sba', 'A 35 year old man has had a painful, tender enlargement under one nipple for 3 months. He uses anabolic steroids and cannabis. What is the SINGLE most likely diagnosis?', 'Gynaecomastia is benign enlargement of male breast glandular tissue. Causes: physiological (neonates, puberty, older age), drugs (spironolactone, anabolic steroids, cannabis, digoxin, antipsychotics), liver disease, hypogonadism, hyperthyroidism and tumours (testicular, adrenal). Male breast cancer is usually unilateral, hard, eccentric and in older men; refer urgently if suspected.', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v4')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = 'ebb392f7-917a-5b80-9bcd-25b19a6923d1';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('917071f5-cc0c-5ce0-816b-e8d1357ffb3c', 'ebb392f7-917a-5b80-9bcd-25b19a6923d1', 'A', 'Male breast cancer', false, 0),
  ('1fcfb73e-d1d5-5c43-b747-94f8bcaa49ef', 'ebb392f7-917a-5b80-9bcd-25b19a6923d1', 'B', 'Breast abscess', false, 1),
  ('edcc4183-4bde-59bb-aa96-8af42298385e', 'ebb392f7-917a-5b80-9bcd-25b19a6923d1', 'C', 'Gynaecomastia (drug-induced)', true, 2),
  ('d7acb8b1-e350-53c4-8b09-a1501614ea6f', 'ebb392f7-917a-5b80-9bcd-25b19a6923d1', 'D', 'Pseudogynaecomastia', false, 3),
  ('b9e3d9c7-0181-5907-9f79-466a3326c074', 'ebb392f7-917a-5b80-9bcd-25b19a6923d1', 'E', 'Lipoma', false, 4);

-- Q127
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('b5c6badb-3a82-5b0f-b86b-6961fc0197cd', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000022', 'sba', 'A 50 year old woman who has finished treatment for breast cancer asks how she will be followed up. What is the MAIN component of routine follow-up imaging?', 'After breast cancer treatment, follow-up includes annual mammography (usually for 5 years, or until the age for routine screening), with clinical review as needed. Routine CT, bone scans and tumour markers are not recommended in asymptomatic patients. Patients are taught to report new symptoms (open access follow-up).', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v4')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = 'b5c6badb-3a82-5b0f-b86b-6961fc0197cd';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('f4d6afa1-f100-53cf-895f-6bab38849a80', 'b5c6badb-3a82-5b0f-b86b-6961fc0197cd', 'A', 'Annual CT scans', false, 0),
  ('32a4b301-39f5-5a8c-b0ce-b8606032d226', 'b5c6badb-3a82-5b0f-b86b-6961fc0197cd', 'B', 'Annual PET scans', false, 1),
  ('06dc683e-3522-5fdb-ba66-f6478358cfab', 'b5c6badb-3a82-5b0f-b86b-6961fc0197cd', 'C', 'Monthly blood tumour markers', false, 2),
  ('c8890968-29de-516f-803c-6371588967af', 'b5c6badb-3a82-5b0f-b86b-6961fc0197cd', 'D', 'Annual bone scans', false, 3),
  ('ce46fb4a-e423-5e7b-aab2-9174459f4c7d', 'b5c6badb-3a82-5b0f-b86b-6961fc0197cd', 'E', 'Annual mammography (usually for 5 years, then return to screening)', true, 4);

-- Q128
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('f9c4739f-a08c-530c-b1de-feb9bdea1fe2', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000011', 'sba', 'A 35 year old man has had pain in the lower back that radiates down the back of his leg to his foot, with numbness of the little toe and a reduced ankle reflex. What is the SINGLE most likely nerve root affected?', 'S1 radiculopathy: pain down the back of the leg to the lateral foot, numbness of the lateral foot and little toe, weak plantarflexion and reduced ankle jerk. L5: dorsum of foot and big toe numbness, weak big toe extension and foot dorsiflexion, normal reflexes. L4: medial leg numbness and reduced knee jerk.', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v4')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = 'f9c4739f-a08c-530c-b1de-feb9bdea1fe2';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('924ad671-d3ea-5015-a9cf-557c4b47deef', 'f9c4739f-a08c-530c-b1de-feb9bdea1fe2', 'A', 'L3', false, 0),
  ('529dbd45-b3d8-560a-8583-c35422a7e8a2', 'f9c4739f-a08c-530c-b1de-feb9bdea1fe2', 'B', 'L4', false, 1),
  ('98a17866-ba16-539f-9a7a-2b1dce80746c', 'f9c4739f-a08c-530c-b1de-feb9bdea1fe2', 'C', 'S1', true, 2),
  ('188696d8-6248-53a8-ac3e-5140d7ea8628', 'f9c4739f-a08c-530c-b1de-feb9bdea1fe2', 'D', 'L5', false, 3),
  ('f008f9fb-a205-5b1a-8e69-fffd6e48937f', 'f9c4739f-a08c-530c-b1de-feb9bdea1fe2', 'E', 'S2', false, 4);

-- Q129
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('d4b9ea7c-ad3f-5c28-81b5-0c5bbb732de6', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000011', 'sba', 'A 40 year old woman has back pain radiating to both legs, with perianal numbness and new urinary retention. What is the SINGLE most appropriate management?', 'Cauda equina syndrome: back pain with bilateral sciatica, saddle anaesthesia, bladder or bowel dysfunction, and sexual dysfunction. It is usually due to a large central disc prolapse. Needs immediate MRI and surgical decompression to preserve function.', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v4')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = 'd4b9ea7c-ad3f-5c28-81b5-0c5bbb732de6';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('99256762-54df-5264-833a-a687e8ee3556', 'd4b9ea7c-ad3f-5c28-81b5-0c5bbb732de6', 'A', 'Oral steroids', false, 0),
  ('7b3c8dfe-101c-58b6-ab07-f811dd79c545', 'd4b9ea7c-ad3f-5c28-81b5-0c5bbb732de6', 'B', 'Emergency MRI of the lumbar spine and urgent spinal surgery referral (cauda equina syndrome)', true, 1),
  ('4b6f1380-780c-5836-8327-644a1493092e', 'd4b9ea7c-ad3f-5c28-81b5-0c5bbb732de6', 'C', 'Bed rest', false, 2),
  ('4d2357a8-a4dc-5412-89ba-8f1d14302c01', 'd4b9ea7c-ad3f-5c28-81b5-0c5bbb732de6', 'D', 'Routine MRI in 6 weeks', false, 3),
  ('7ec489c0-3584-58ca-8011-10a6a6ec6dbd', 'd4b9ea7c-ad3f-5c28-81b5-0c5bbb732de6', 'E', 'Analgesia and physiotherapy', false, 4);

-- Q130
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('00ddf714-abc1-5679-a3bf-9b2c0b91474a', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000011', 'sba', 'A 30 year old man punched a wall. He has swelling over the little finger knuckle with a depressed knuckle. X-ray shows a fracture of the neck of the 5th metacarpal. What is the SINGLE most likely name and management?', 'Boxer''s fracture: fracture of the 5th metacarpal neck from punching. Most are treated conservatively (buddy strapping or a splint and early mobilisation). Check for rotational deformity (scissoring of fingers), which needs reduction or fixation. Wounds over the knuckle may be human bite injuries (''fight bite'') needing exploration and antibiotics.', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v4')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = '00ddf714-abc1-5679-a3bf-9b2c0b91474a';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('28fe8a61-eb74-5b9e-929a-eba270a59c36', '00ddf714-abc1-5679-a3bf-9b2c0b91474a', 'A', 'Scaphoid fracture; cast', false, 0),
  ('b22acf5e-bdda-5766-b7d8-fc940c60108e', '00ddf714-abc1-5679-a3bf-9b2c0b91474a', 'B', 'Boxer''s fracture; usually treated conservatively with buddy strapping/splint unless rotational deformity', true, 1),
  ('d6fa3bca-419f-529a-abb5-db7ce40503bd', '00ddf714-abc1-5679-a3bf-9b2c0b91474a', 'C', 'Bennett''s fracture; surgery', false, 2),
  ('d95602d7-6a01-54c7-9aa5-27e777624b0c', '00ddf714-abc1-5679-a3bf-9b2c0b91474a', 'D', 'Mallet finger; splint', false, 3),
  ('037c13dc-545b-5d8f-af51-6904cc370939', '00ddf714-abc1-5679-a3bf-9b2c0b91474a', 'E', 'Colles'' fracture; cast', false, 4);

-- Q131
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('b704f1a7-9a3c-548f-857a-55a66ef0c9fd', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000020', 'sba', 'A 19 year old woman asks about long-acting reversible contraception. She wants the MOST effective method that does not need daily attention and lasts 3 years. What is the SINGLE most appropriate option?', 'The implant is the most effective reversible method (failure under 0.1%), lasting 3 years. Side effects: irregular bleeding (the commonest reason for removal). Fertility returns rapidly after removal. Enzyme-inducing drugs reduce its effectiveness. LARC methods (implant, IUS, IUD, injection) are more effective than user-dependent methods.', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v4')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = 'b704f1a7-9a3c-548f-857a-55a66ef0c9fd';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('2dc50020-e03b-5211-9861-fd445d004fe1', 'b704f1a7-9a3c-548f-857a-55a66ef0c9fd', 'A', 'Combined pill', false, 0),
  ('6d79a624-81ad-5463-a99a-5c0ba270c60f', 'b704f1a7-9a3c-548f-857a-55a66ef0c9fd', 'B', 'Progestogen-only injection', false, 1),
  ('4362fc44-dbae-5459-a08b-5ee987e32ccc', 'b704f1a7-9a3c-548f-857a-55a66ef0c9fd', 'C', 'Natural family planning', false, 2),
  ('a2742766-5ba7-5fb7-8e7e-aae68f758fc3', 'b704f1a7-9a3c-548f-857a-55a66ef0c9fd', 'D', 'Progestogen-only implant (Nexplanon)', true, 3),
  ('113bdda7-dcc5-5d9b-b09f-30e0f01a0fde', 'b704f1a7-9a3c-548f-857a-55a66ef0c9fd', 'E', 'Male condoms', false, 4);

-- Q132
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('906829d3-7a8c-55e9-92c8-5ef18d815695', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000012', 'sba', 'A 15 year old girl has had an itchy, scaly rash in the flexures of her elbows and knees since childhood. It is worse in winter. What is the SINGLE most appropriate maintenance treatment?', 'Atopic eczema management: liberal emollients (even when clear), soap substitutes, and topical steroids of appropriate potency for flares (fingertip units). Topical calcineurin inhibitors for facial or sensitive sites. Watch for infection (S. aureus, eczema herpeticum). Severe disease may need phototherapy, systemic immunosuppressants or biologics such as dupilumab.', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v4')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = '906829d3-7a8c-55e9-92c8-5ef18d815695';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('a630a322-34bc-5956-b430-8abf5a711770', '906829d3-7a8c-55e9-92c8-5ef18d815695', 'A', 'Oral antibiotics long-term', false, 0),
  ('b422cf20-ebc5-57df-9aaf-4f5ecb7f5dd8', '906829d3-7a8c-55e9-92c8-5ef18d815695', 'B', 'Oral steroids', false, 1),
  ('9012b1d1-043d-5bab-8268-9baa879ec400', '906829d3-7a8c-55e9-92c8-5ef18d815695', 'C', 'Antifungal cream', false, 2),
  ('80b81a3e-5c80-5dd8-9474-1218f20a2563', '906829d3-7a8c-55e9-92c8-5ef18d815695', 'D', 'Regular, generous emollients and soap substitutes, with topical steroids for flares', true, 3),
  ('3811afea-ae46-5d1f-81bb-c750e2412756', '906829d3-7a8c-55e9-92c8-5ef18d815695', 'E', 'Avoid all bathing', false, 4);

-- Q133
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('e9669564-ad6e-5e2e-aa55-cb824f7e44dc', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000015', 'sba', 'A 50 year old woman has dry, gritty eyes and a dry mouth. She has joint pains. Schirmer''s test is reduced. Anti-Ro and anti-La are positive. What is the SINGLE most likely diagnosis?', 'Sjögren''s syndrome is an autoimmune condition affecting exocrine glands, causing dry eyes and mouth. It can be primary or secondary (with RA or SLE). Anti-Ro and anti-La are positive. Complications include increased lymphoma risk. Treatment: artificial tears, saliva substitutes, pilocarpine and hydroxychloroquine for systemic features.', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v4')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = 'e9669564-ad6e-5e2e-aa55-cb824f7e44dc';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('14d379db-e803-5e37-95ac-2a263cf07688', 'e9669564-ad6e-5e2e-aa55-cb824f7e44dc', 'A', 'Conjunctivitis', false, 0),
  ('a6393024-9914-5ea1-8dd4-2fe8ca13ef43', 'e9669564-ad6e-5e2e-aa55-cb824f7e44dc', 'B', 'Rheumatoid arthritis', false, 1),
  ('1118786d-ac7b-5ed1-b54f-4503148bf25e', 'e9669564-ad6e-5e2e-aa55-cb824f7e44dc', 'C', 'Sjögren''s syndrome', true, 2),
  ('5e856276-b55c-522f-bc7a-f77d7575705a', 'e9669564-ad6e-5e2e-aa55-cb824f7e44dc', 'D', 'Sarcoidosis', false, 3),
  ('aa234bce-18b2-533b-89e5-6a64c99d28d5', 'e9669564-ad6e-5e2e-aa55-cb824f7e44dc', 'E', 'Blepharitis', false, 4);

-- Q134
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('82ff5966-b058-52ad-bad8-a4e3eca4ec67', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000015', 'sba', 'A 28 year old man was using an angle grinder without goggles and now has a painful, watery eye with a foreign body sensation. There is a small rust ring on the cornea. What is the SINGLE most appropriate management?', 'Corneal foreign bodies from grinding or hammering are common. High-velocity injuries risk penetrating injury and intraocular foreign body (X-ray or CT, not MRI if metallic). Remove superficial foreign bodies under slit lamp with topical anaesthetic, remove rust rings, and give topical antibiotic. Eye protection prevents injury.', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v4')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = '82ff5966-b058-52ad-bad8-a4e3eca4ec67';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('035d71b2-9dc6-5819-847c-e0f383483de6', '82ff5966-b058-52ad-bad8-a4e3eca4ec67', 'A', 'Topical steroids', false, 0),
  ('8e032908-0e09-5764-a684-be41fffa8162', '82ff5966-b058-52ad-bad8-a4e3eca4ec67', 'B', 'Eye patch for 1 week', false, 1),
  ('7acd573e-89ca-54fb-8841-e7d8b6496268', '82ff5966-b058-52ad-bad8-a4e3eca4ec67', 'C', 'Rub the eye', false, 2),
  ('e7a86c6c-54d3-5d58-a42a-29d5c4cc5fda', '82ff5966-b058-52ad-bad8-a4e3eca4ec67', 'D', 'Reassure and discharge', false, 3),
  ('821dcebf-8318-5301-90c1-a39a3f9779d1', '82ff5966-b058-52ad-bad8-a4e3eca4ec67', 'E', 'Same-day ophthalmology/eye casualty for removal of the foreign body and rust ring (consider X-ray if a penetrating injury is possible)', true, 4);

-- Q135
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('b47f43c6-a73a-5cb1-a1a3-cc4003bcf703', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000015', 'sba', 'A 70 year old woman with a recent cataract operation has a painful red eye, reduced vision and a hypopyon 3 days later. What is the SINGLE most likely diagnosis?', 'Post-operative endophthalmitis is a serious infection inside the eye, usually within days of surgery. It causes pain, decreasing vision, redness and hypopyon. Treatment: urgent vitreous tap and intravitreal antibiotics, with vitrectomy in severe cases. Delay risks permanent visual loss.', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v4')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = 'b47f43c6-a73a-5cb1-a1a3-cc4003bcf703';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('14055715-6024-5600-a73d-b70ab9050b31', 'b47f43c6-a73a-5cb1-a1a3-cc4003bcf703', 'A', 'Retinal detachment', false, 0),
  ('8ba95a44-d0c7-5af5-b96c-9b71cacddadc', 'b47f43c6-a73a-5cb1-a1a3-cc4003bcf703', 'B', 'Normal post-operative inflammation', false, 1),
  ('3bb51f40-52d5-596c-9226-fa20d3ee825c', 'b47f43c6-a73a-5cb1-a1a3-cc4003bcf703', 'C', 'Corneal abrasion', false, 2),
  ('f2864b99-daf5-54a8-8123-aa756dbc0134', 'b47f43c6-a73a-5cb1-a1a3-cc4003bcf703', 'D', 'Endophthalmitis (urgent same-day ophthalmology)', true, 3),
  ('5830ef04-45e7-5d42-8a3b-e9356c04b114', 'b47f43c6-a73a-5cb1-a1a3-cc4003bcf703', 'E', 'Conjunctivitis', false, 4);

-- Q136
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('45214be9-cf58-553a-afd1-d94b34ae8b28', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000018', 'sba', 'A 70 year old man is to have elective hip surgery. He takes clopidogrel after a coronary stent placed 2 years ago. What is the SINGLE most appropriate plan?', 'Perioperative antiplatelet management balances bleeding risk against stent thrombosis. Elective surgery is deferred for at least 6 months after a drug-eluting stent where possible. Clopidogrel is usually stopped 7 days before surgery, and aspirin is often continued. Recent stents (under 6-12 months) need cardiology input.', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v4')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = '45214be9-cf58-553a-afd1-d94b34ae8b28';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('ef26d38e-f722-592c-95f6-bdc01111390e', '45214be9-cf58-553a-afd1-d94b34ae8b28', 'A', 'Give LMWH bridging', false, 0),
  ('4cc7c59e-c366-558b-b85a-b0f1d7947c66', '45214be9-cf58-553a-afd1-d94b34ae8b28', 'B', 'Continue clopidogrel without discussion', false, 1),
  ('00f7cc09-6848-5e05-a84e-7abf8bd83d91', '45214be9-cf58-553a-afd1-d94b34ae8b28', 'C', 'Switch to warfarin', false, 2),
  ('a4789504-3062-5155-8480-b09037eacd98', '45214be9-cf58-553a-afd1-d94b34ae8b28', 'D', 'Discuss with cardiology and surgeon; typically stop clopidogrel 7 days before surgery and continue aspirin if prescribed', true, 3),
  ('483d00af-a903-569f-a41a-b5e03d8d0606', '45214be9-cf58-553a-afd1-d94b34ae8b28', 'E', 'Stop all antiplatelets 1 month before', false, 4);

-- Q137
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('265243dc-0c17-5dd7-8ab2-ce56f98fe28b', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000018', 'sba', 'A 60 year old woman had a total knee replacement. On day 2 she has swelling of her calf, but also nausea and itching from her patient-controlled analgesia. What is the SINGLE most likely cause of the itching?', 'Opioids commonly cause itching, nausea, constipation, drowsiness and respiratory depression. Pruritus is common with intrathecal and epidural opioids. Management: antihistamines, low-dose naloxone, or switching opioids. Always assess for true allergy (urticaria, angioedema, bronchospasm).', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v4')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = '265243dc-0c17-5dd7-8ab2-ce56f98fe28b';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('36aefc62-fd76-50c9-b3c4-42912dc2b50d', '265243dc-0c17-5dd7-8ab2-ce56f98fe28b', 'A', 'Scabies', false, 0),
  ('3e4bc318-7ad2-598e-8483-e97ef37f4d7c', '265243dc-0c17-5dd7-8ab2-ce56f98fe28b', 'B', 'Opioid-induced pruritus (histamine release and central mechanisms)', true, 1),
  ('190c7635-4c91-5d3b-8245-a71c4eabbf69', '265243dc-0c17-5dd7-8ab2-ce56f98fe28b', 'C', 'Liver failure', false, 2),
  ('96e541ab-56d4-5ba5-a2a7-955981411c17', '265243dc-0c17-5dd7-8ab2-ce56f98fe28b', 'D', 'Wound infection', false, 3),
  ('f2e44a8c-daf2-5f21-980c-c7cf09196db9', '265243dc-0c17-5dd7-8ab2-ce56f98fe28b', 'E', 'Allergy to the prosthesis', false, 4);

-- Q138
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('b150dfbd-a767-588f-a37e-da6812738029', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000024', 'sba', 'A 30 year old man with testicular seminoma is about to start chemotherapy. What should he be offered before treatment?', 'Chemotherapy and radiotherapy can cause infertility. Fertility preservation (sperm banking for men, egg or embryo freezing or ovarian tissue cryopreservation for women) should be discussed before treatment. Testicular cancer has an excellent prognosis (over 95% cure).', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v4')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = 'b150dfbd-a767-588f-a37e-da6812738029';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('7b7bb655-2138-5080-8e9f-48d5ac81f703', 'b150dfbd-a767-588f-a37e-da6812738029', 'A', 'Annual semen analysis only', false, 0),
  ('cd069ad5-2923-5e2b-8371-6f2ef4112d37', 'b150dfbd-a767-588f-a37e-da6812738029', 'B', 'Testosterone injections', false, 1),
  ('691c464f-5190-5e63-9265-b702ad05f582', 'b150dfbd-a767-588f-a37e-da6812738029', 'C', 'No fertility discussion needed', false, 2),
  ('cc5f5b91-a101-577c-ac3a-58d89ccfde29', 'b150dfbd-a767-588f-a37e-da6812738029', 'D', 'Sperm banking (cryopreservation)', true, 3),
  ('6a917cd5-4ec0-5653-8478-be879b7320fb', 'b150dfbd-a767-588f-a37e-da6812738029', 'E', 'Vasectomy', false, 4);

-- Q139
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('ce16d207-308b-513c-97aa-3126683feb20', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000024', 'sba', 'A 60 year old man has advanced lung cancer and a new seizure. CT shows multiple brain metastases with surrounding oedema. What is the SINGLE most appropriate initial management?', 'Brain metastases (lung, breast, melanoma, kidney, colon) present with headache, seizures, focal deficits and confusion. Dexamethasone reduces vasogenic oedema. Antiepileptics for seizures (prophylactic use is not recommended). Treatment: surgery or stereotactic radiosurgery for limited metastases, whole-brain radiotherapy, or best supportive care. Inform the DVLA.', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v4')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = 'ce16d207-308b-513c-97aa-3126683feb20';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('27ce73cc-a49f-556c-b073-fb0b828c2a1d', 'ce16d207-308b-513c-97aa-3126683feb20', 'A', 'Urgent neurosurgery in all cases', false, 0),
  ('5494f826-9da4-544f-b16d-82ebdfcaf17e', 'ce16d207-308b-513c-97aa-3126683feb20', 'B', 'Antibiotics', false, 1),
  ('647e672e-a9b8-5b20-9986-9302481b12ab', 'ce16d207-308b-513c-97aa-3126683feb20', 'C', 'Thrombolysis', false, 2),
  ('8db4ecc8-6bec-5be4-b002-e1ef5ece7a59', 'ce16d207-308b-513c-97aa-3126683feb20', 'D', 'No treatment', false, 3),
  ('474de900-bea3-5094-9b02-77026bdafd0b', 'ce16d207-308b-513c-97aa-3126683feb20', 'E', 'Dexamethasone (to reduce oedema) and an antiepileptic drug, with oncology discussion', true, 4);

-- Q140
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('e7b2c03e-b9e4-5ea4-a5d6-b3a318194517', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000024', 'sba', 'A 58 year old woman has had iron-deficiency anaemia and a change in bowel habit. Colonoscopy shows a right-sided colon cancer. CT shows no metastases. What is the SINGLE most appropriate treatment?', 'Colorectal cancer staging uses CT chest, abdomen and pelvis (plus MRI for rectal cancer). Colon cancer is treated with surgical resection (right or left hemicolectomy, sigmoid colectomy), and adjuvant chemotherapy for node-positive (stage III) or high-risk stage II disease. Rectal cancer may need neoadjuvant chemoradiotherapy.', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v4')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = 'e7b2c03e-b9e4-5ea4-a5d6-b3a318194517';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('5828cfa5-c420-522c-a0e2-c47a1da9bc29', 'e7b2c03e-b9e4-5ea4-a5d6-b3a318194517', 'A', 'Radiotherapy only', false, 0),
  ('a263c338-2c5f-530d-9c2b-7acd8cfaa2fc', 'e7b2c03e-b9e4-5ea4-a5d6-b3a318194517', 'B', 'Endoscopic stenting', false, 1),
  ('c6975833-62d6-5861-95bf-0a293abc2c9a', 'e7b2c03e-b9e4-5ea4-a5d6-b3a318194517', 'C', 'Chemotherapy alone', false, 2),
  ('78ec55dc-24df-5370-b8ce-052e226253ee', 'e7b2c03e-b9e4-5ea4-a5d6-b3a318194517', 'D', 'Right hemicolectomy (with adjuvant chemotherapy depending on stage)', true, 3),
  ('27e95f74-7c54-5677-8c07-50a3bdf17ce5', 'e7b2c03e-b9e4-5ea4-a5d6-b3a318194517', 'E', 'Watch and wait', false, 4);

-- Q141
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('56acf9ff-2a23-53b8-9421-99c8fa43dda0', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000024', 'sba', 'A 50 year old man has had an anal lump and bleeding. Biopsy shows squamous cell carcinoma of the anus. What is the SINGLE most appropriate first-line treatment?', 'Anal squamous cell carcinoma is linked to HPV (types 16 and 18), HIV, smoking and immunosuppression. First-line treatment is chemoradiotherapy (Nigro regimen), which preserves the sphincter. Surgery (abdominoperineal resection) is reserved for persistent or recurrent disease.', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v4')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = '56acf9ff-2a23-53b8-9421-99c8fa43dda0';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('3808351e-186d-5942-b88d-c19279efbfea', '56acf9ff-2a23-53b8-9421-99c8fa43dda0', 'A', 'Abdominoperineal resection first-line', false, 0),
  ('cc45061f-40bf-5831-a9df-6cd20f02f152', '56acf9ff-2a23-53b8-9421-99c8fa43dda0', 'B', 'Chemoradiotherapy (mitomycin and 5-FU/capecitabine with radiotherapy)', true, 1),
  ('b1720523-60fc-5b35-afff-f361436c6e88', '56acf9ff-2a23-53b8-9421-99c8fa43dda0', 'C', 'Immunotherapy alone', false, 2),
  ('0e843844-edea-58a6-9a24-2576b5ded79c', '56acf9ff-2a23-53b8-9421-99c8fa43dda0', 'D', 'Watch and wait', false, 3),
  ('56cd987b-6e87-59e6-8028-260a7ec026c8', '56acf9ff-2a23-53b8-9421-99c8fa43dda0', 'E', 'Topical steroids', false, 4);

-- Q142
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('7b5a947f-3dfa-561c-a3d0-5ed9c1b78249', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000013', 'sba', 'A 70 year old man with metastatic cancer asks the doctor not to tell his wife about his prognosis. His wife asks the doctor directly. What is the CORRECT approach?', 'Confidentiality continues within families. A competent patient can decide who is told about their condition. ''Next of kin'' has no legal right to information. The doctor can listen to the relative''s concerns without disclosing information, and gently explore the patient''s reasons and encourage sharing.', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v4')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = '7b5a947f-3dfa-561c-a3d0-5ed9c1b78249';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('abd07966-8e63-5df0-ac6c-d2869abe3f12', '7b5a947f-3dfa-561c-a3d0-5ed9c1b78249', 'A', 'Tell the wife everything', false, 0),
  ('2dbeaffb-33a5-5592-881b-86b91b251b64', '7b5a947f-3dfa-561c-a3d0-5ed9c1b78249', 'B', 'Ask the GP to tell her', false, 1),
  ('3a4a868d-8929-596a-a4b1-929d0523c54b', '7b5a947f-3dfa-561c-a3d0-5ed9c1b78249', 'C', 'Lie to the wife', false, 2),
  ('ba778fec-4b71-54dd-a398-52b4c250d04c', '7b5a947f-3dfa-561c-a3d0-5ed9c1b78249', 'D', 'Tell her because she is next of kin', false, 3),
  ('b4dedec4-70e2-5688-a9e2-883f1e2867a0', '7b5a947f-3dfa-561c-a3d0-5ed9c1b78249', 'E', 'Respect the patient''s wishes and do not disclose without his consent; encourage him to talk with his wife', true, 4);

-- Q143
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('b38fbef3-8523-544e-b874-11b30afe98fe', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000013', 'sba', 'A 50 year old man who is HIV positive refuses to tell his wife, despite counselling. He continues to have unprotected sex with her. What is the CORRECT action?', 'GMC guidance: disclosure without consent may be justified to protect someone at risk of death or serious harm (such as a sexual partner at risk of HIV), if the patient refuses to tell them or stop exposing them. Tell the patient before disclosing, if safe, and disclose only the minimum necessary. Seek advice from senior colleagues or a defence organisation.', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v4')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = 'b38fbef3-8523-544e-b874-11b30afe98fe';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('8c028170-e024-54d6-9646-3b33ce3a8e61', 'b38fbef3-8523-544e-b874-11b30afe98fe', 'A', 'Inform the media', false, 0),
  ('dd67d015-8792-561e-bb0b-f4f37795c7d7', 'b38fbef3-8523-544e-b874-11b30afe98fe', 'B', 'Report to the police', false, 1),
  ('e1413b97-98a3-5575-bb2e-5292f5fbac0c', 'b38fbef3-8523-544e-b874-11b30afe98fe', 'C', 'Never disclose under any circumstances', false, 2),
  ('63d0c3c9-214f-5f20-9062-e049a2fa3874', 'b38fbef3-8523-544e-b874-11b30afe98fe', 'D', 'Disclosure to the wife may be justified to protect her from serious harm, after telling the patient of the intention to disclose', true, 3),
  ('77e936dc-0a42-5c31-a127-5e0f1868b68e', 'b38fbef3-8523-544e-b874-11b30afe98fe', 'E', 'Inform his employer', false, 4);

-- Q144
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('c27c88ce-e50e-5bb6-b82c-a13820d9dce9', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000001', 'sba', 'A 48 year old taxi driver has had crushing central chest pain for 40 minutes, with sweating. ECG shows ST elevation of 3 mm in leads II, III and aVF with ST depression in I and aVL. The nearest PCI centre is 30 minutes away. What is the SINGLE most appropriate reperfusion strategy?', 'Inferior STEMI. NICE: offer primary PCI if it can be delivered within 120 minutes of the time fibrinolysis could have been given, and symptoms began within 12 hours. Give aspirin and a second antiplatelet (prasugrel if not on anticoagulant). Check right-sided leads (V4R) in inferior MI, as right ventricular infarction causes hypotension that is worsened by nitrates.', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v4')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = 'c27c88ce-e50e-5bb6-b82c-a13820d9dce9';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('bc88895d-2447-55e6-b99f-a535b5ae6750', 'c27c88ce-e50e-5bb6-b82c-a13820d9dce9', 'A', 'Wait for troponin result', false, 0),
  ('c8c2996a-25ae-5db2-a425-a8a700fc8c3a', 'c27c88ce-e50e-5bb6-b82c-a13820d9dce9', 'B', 'Thrombolysis with alteplase at the local hospital', false, 1),
  ('41d123b1-a1ce-5eae-8c6c-f92a517acc50', 'c27c88ce-e50e-5bb6-b82c-a13820d9dce9', 'C', 'Aspirin alone and observe', false, 2),
  ('491f9892-8959-549c-8f24-ad9a9919e292', 'c27c88ce-e50e-5bb6-b82c-a13820d9dce9', 'D', 'Primary PCI (achievable within 120 minutes of when fibrinolysis could have been given)', true, 3),
  ('7452128a-2ff0-58f0-8951-c36d51972605', 'c27c88ce-e50e-5bb6-b82c-a13820d9dce9', 'E', 'Elective angiography next week', false, 4);

-- Q145
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('856a8e85-a630-55a2-9e8a-d1b4f18ed91f', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000001', 'sba', 'A 72 year old woman with an inferior STEMI becomes hypotensive (BP 78/50) after a dose of sublingual GTN. Her JVP is raised and her lungs are clear. Right-sided ECG shows ST elevation in V4R. What is the SINGLE most appropriate immediate management?', 'Right ventricular infarction complicates inferior MI. The RV depends on preload, so nitrates, diuretics and opioids can cause severe hypotension. Signs: hypotension, raised JVP and clear lungs. Give IV fluids and arrange urgent reperfusion. Inotropes may be needed.', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v4')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = '856a8e85-a630-55a2-9e8a-d1b4f18ed91f';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('a1db42c8-b760-5bbe-8189-3cbeb7d7f574', '856a8e85-a630-55a2-9e8a-d1b4f18ed91f', 'A', 'Beta-blocker', false, 0),
  ('19b39bd9-54f4-5e8b-a9d4-ff2b1178d945', '856a8e85-a630-55a2-9e8a-d1b4f18ed91f', 'B', 'IV morphine and diuretics', false, 1),
  ('48c3e2e5-9666-5ca6-84b4-ecfdd4379872', '856a8e85-a630-55a2-9e8a-d1b4f18ed91f', 'C', 'Further GTN', false, 2),
  ('c2ed0e55-2b1b-5eda-95a5-e36840779214', '856a8e85-a630-55a2-9e8a-d1b4f18ed91f', 'D', 'IV furosemide', false, 3),
  ('26691946-434b-54c4-8380-cab4d9ff89e1', '856a8e85-a630-55a2-9e8a-d1b4f18ed91f', 'E', 'IV fluid boluses to maintain right ventricular preload, and avoid nitrates and diuretics', true, 4);

-- Q146
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('61083fb3-38ad-5e6d-85ac-ef38361747e0', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000001', 'sba', 'A 63 year old man had an anterior MI 5 days ago. He suddenly becomes breathless and hypotensive, with a new loud pansystolic murmur at the left sternal edge and a palpable thrill. What is the SINGLE most likely diagnosis?', 'Mechanical complications usually occur 3-7 days after MI. Ventricular septal rupture causes a new harsh pansystolic murmur with a thrill and acute heart failure (step-up in oxygen saturation in the right ventricle). Papillary muscle rupture causes acute mitral regurgitation with pulmonary oedema (often inferior MI). Free wall rupture causes tamponade. All need urgent echo and surgery.', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v4')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = '61083fb3-38ad-5e6d-85ac-ef38361747e0';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('a7625392-c900-5c6b-9baa-692b37e66b8c', '61083fb3-38ad-5e6d-85ac-ef38361747e0', 'A', 'Left ventricular aneurysm', false, 0),
  ('6ee12fc6-d877-5d50-933d-7700f75d0594', '61083fb3-38ad-5e6d-85ac-ef38361747e0', 'B', 'Ventricular septal rupture', true, 1),
  ('7f5af965-4462-502b-a189-2c971efe15f1', '61083fb3-38ad-5e6d-85ac-ef38361747e0', 'C', 'Dressler''s syndrome', false, 2),
  ('9842972b-be3e-5908-90de-17fd7aa3bc6c', '61083fb3-38ad-5e6d-85ac-ef38361747e0', 'D', 'Pulmonary embolism', false, 3),
  ('ce175e18-4a81-5f1b-9ce0-1ef644ca9df7', '61083fb3-38ad-5e6d-85ac-ef38361747e0', 'E', 'Pericarditis', false, 4);

-- Q147
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('f57b0501-2f54-5fe8-974b-f8426bc2f334', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000001', 'sba', 'A 66 year old man had an anterior MI 2 months ago. ECG still shows persistent ST elevation in V1-V4. He has mild breathlessness. What is the SINGLE most likely cause?', 'Persistent ST elevation weeks after an MI suggests a left ventricular aneurysm. Complications: heart failure, ventricular arrhythmias and LV thrombus (risk of embolic stroke). Echo confirms. Anticoagulation may be needed if thrombus is present.', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v4')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = 'f57b0501-2f54-5fe8-974b-f8426bc2f334';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('24b8478b-6aef-5a53-bdd1-506e7c9bab58', 'f57b0501-2f54-5fe8-974b-f8426bc2f334', 'A', 'Acute re-infarction', false, 0),
  ('3e4091ed-94a1-53e2-983b-8777470d44e0', 'f57b0501-2f54-5fe8-974b-f8426bc2f334', 'B', 'Pericarditis', false, 1),
  ('b7c645e2-8794-5fb6-b9f9-42016ce7989c', 'f57b0501-2f54-5fe8-974b-f8426bc2f334', 'C', 'Left ventricular aneurysm', true, 2),
  ('1927a8bd-7220-525e-aa28-fc132f89cc15', 'f57b0501-2f54-5fe8-974b-f8426bc2f334', 'D', 'Normal post-MI change', false, 3),
  ('d9a8918f-d24b-57ea-a38b-78be93901cd7', 'f57b0501-2f54-5fe8-974b-f8426bc2f334', 'E', 'Brugada pattern', false, 4);

-- Q148
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('157767d2-2cef-5f8e-b04d-4478d803d90a', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000001', 'sba', 'A 52 year old woman with type 2 diabetes is breathless on exertion and has ankle swelling. Echo shows an ejection fraction of 30%. She is on ramipril and bisoprolol at target doses but still symptomatic. What is the SINGLE most appropriate addition?', 'NICE NG106: for heart failure with reduced ejection fraction, first-line treatment is an ACE inhibitor (or ARB) plus a beta-blocker, with an MRA and an SGLT2 inhibitor (dapagliflozin or empagliflozin). Sacubitril-valsartan can replace the ACE inhibitor in specialist care. Monitor potassium and renal function. Avoid pioglitazone, verapamil and diltiazem.', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v4')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = '157767d2-2cef-5f8e-b04d-4478d803d90a';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('3c00a4e7-973f-55ec-9f0e-743b820f447c', '157767d2-2cef-5f8e-b04d-4478d803d90a', 'A', 'A mineralocorticoid receptor antagonist (spironolactone or eplerenone), plus an SGLT2 inhibitor', true, 0),
  ('09ffa677-ef37-5144-934f-28871869d419', '157767d2-2cef-5f8e-b04d-4478d803d90a', 'B', 'Verapamil', false, 1),
  ('12192dcb-ee53-54ca-9891-f43fdc24e7c5', '157767d2-2cef-5f8e-b04d-4478d803d90a', 'C', 'Pioglitazone', false, 2),
  ('d13c42ac-ef29-5b55-b559-972515d998e4', '157767d2-2cef-5f8e-b04d-4478d803d90a', 'D', 'Digoxin as the next step', false, 3),
  ('0ff48e94-6edf-5c8f-8f37-cfcfd5860781', '157767d2-2cef-5f8e-b04d-4478d803d90a', 'E', 'Amlodipine', false, 4);

-- Q149
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('06e5e58f-4502-5eb0-95db-7e7bd415df6b', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000001', 'sba', 'A 79 year old man with heart failure has a potassium of 6.1 mmol/L a week after spironolactone was added. He feels well. ECG is normal. What is the SINGLE most appropriate action?', 'MRAs, ACE inhibitors and ARBs cause hyperkalaemia, especially with CKD, older age and NSAIDs. Potassium of 6.0 or more: stop the MRA and recheck. Potassium 5.5-5.9: halve the dose. ECG changes or potassium of 6.5 or more need emergency treatment (calcium gluconate, insulin-dextrose, salbutamol).', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v4')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = '06e5e58f-4502-5eb0-95db-7e7bd415df6b';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('e0c54e6f-60ef-5576-a84d-ceac958f5d80', '06e5e58f-4502-5eb0-95db-7e7bd415df6b', 'A', 'Continue all drugs unchanged', false, 0),
  ('ab8b76ee-5d81-5064-b747-fc703a98a732', '06e5e58f-4502-5eb0-95db-7e7bd415df6b', 'B', 'Double the spironolactone', false, 1),
  ('23d446c9-52c6-5bbd-b3e6-c1ef06f993c7', '06e5e58f-4502-5eb0-95db-7e7bd415df6b', 'C', 'Stop spironolactone, review other drugs (e.g. NSAIDs, potassium supplements) and repeat potassium', true, 2),
  ('e80536b1-4341-57b7-a920-da47e2fe2f6e', '06e5e58f-4502-5eb0-95db-7e7bd415df6b', 'D', 'Start digoxin', false, 3),
  ('ce4df13d-3caa-5113-ae03-6c0268da0202', '06e5e58f-4502-5eb0-95db-7e7bd415df6b', 'E', 'Add a potassium supplement', false, 4);

-- Q150
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('b06ad050-aad8-5aae-a10b-3bcb3708df12', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000001', 'sba', 'A 34 year old woman is 4 weeks postpartum. She has new breathlessness, orthopnoea and leg swelling. Echo shows a dilated left ventricle with an ejection fraction of 30%. She had no heart disease before. What is the SINGLE most likely diagnosis?', 'Peripartum cardiomyopathy presents with heart failure in the last month of pregnancy or within 5 months after delivery. Risk factors: older age, multiple pregnancy, pre-eclampsia and African ancestry. Treat as heart failure (avoid ACE inhibitors in pregnancy). Bromocriptine may be used. Thromboembolism risk is high. Recurrence risk in future pregnancies is significant.', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v4')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = 'b06ad050-aad8-5aae-a10b-3bcb3708df12';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('bd529fa3-be18-5aaf-a431-073581e44a7d', 'b06ad050-aad8-5aae-a10b-3bcb3708df12', 'A', 'Postnatal depression', false, 0),
  ('61e0704d-ecba-565d-9e43-83ff8b029d98', 'b06ad050-aad8-5aae-a10b-3bcb3708df12', 'B', 'Peripartum cardiomyopathy', true, 1),
  ('f1d590e3-96cc-5253-afdc-1e3adc5d4cb6', 'b06ad050-aad8-5aae-a10b-3bcb3708df12', 'C', 'Pre-eclampsia', false, 2),
  ('5c423b32-d26e-5d66-b134-e99fc9fe8cf0', 'b06ad050-aad8-5aae-a10b-3bcb3708df12', 'D', 'Pulmonary embolism', false, 3),
  ('201542db-cf16-5d7c-a800-41fed3f56df0', 'b06ad050-aad8-5aae-a10b-3bcb3708df12', 'E', 'Anaemia', false, 4);

-- Q151
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('07319a0e-2c14-5f9b-9ed0-4679b85831cf', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000001', 'sba', 'A 45 year old man has been told his blood pressure is 160/100 on several readings. He has a low potassium of 3.0 and a raised sodium of 145. He takes no medications. Which condition MUST be screened for?', 'Hypertension with hypokalaemia suggests primary aldosteronism (most common secondary cause). Screen with the aldosterone-to-renin ratio (stop interfering drugs if possible). Other secondary causes worth considering in younger people: renal disease, renal artery stenosis (fibromuscular dysplasia in young women), Cushing''s, phaeochromocytoma and coarctation.', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v4')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = '07319a0e-2c14-5f9b-9ed0-4679b85831cf';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('3c5333f1-56af-52c4-a146-ad74d8b627df', '07319a0e-2c14-5f9b-9ed0-4679b85831cf', 'A', 'Coarctation', false, 0),
  ('0da16725-c674-5582-afb9-0ad1194aba3f', '07319a0e-2c14-5f9b-9ed0-4679b85831cf', 'B', 'Cushing''s disease only', false, 1),
  ('5a535230-2baa-548d-853b-b5ace9c22c4b', '07319a0e-2c14-5f9b-9ed0-4679b85831cf', 'C', 'Phaeochromocytoma only', false, 2),
  ('a08c094a-d833-56d1-b3f6-3b120c7d0a89', '07319a0e-2c14-5f9b-9ed0-4679b85831cf', 'D', 'Renal artery stenosis only', false, 3),
  ('e7465e56-0d32-5ef5-95ee-0c05b384d76a', '07319a0e-2c14-5f9b-9ed0-4679b85831cf', 'E', 'Primary hyperaldosteronism (aldosterone-to-renin ratio)', true, 4);

-- Q152
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('433cc417-4fae-5517-af33-769561dba9bb', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000001', 'sba', 'A 26 year old woman has hypertension that is difficult to control. Her BP is 170/105. There is an abdominal bruit. Renal function is normal. What is the SINGLE most likely cause?', 'Fibromuscular dysplasia mainly affects young women, causing renal artery stenosis (''string of beads'' on angiography) and hypertension. It responds well to angioplasty. Atherosclerotic renal artery stenosis affects older people with vascular disease. ACE inhibitors can cause AKI in bilateral stenosis.', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v4')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = '433cc417-4fae-5517-af33-769561dba9bb';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('50210c16-478c-52e9-97e3-40266418e750', '433cc417-4fae-5517-af33-769561dba9bb', 'A', 'Renal artery stenosis due to fibromuscular dysplasia', true, 0),
  ('159c4ff4-d086-50f0-b300-37e26cc0faf5', '433cc417-4fae-5517-af33-769561dba9bb', 'B', 'Conn''s syndrome', false, 1),
  ('7575af2e-5ad2-5006-a9a1-e5e274422067', '433cc417-4fae-5517-af33-769561dba9bb', 'C', 'Atherosclerotic renal artery stenosis', false, 2),
  ('a61ab836-1917-5fac-8d5e-7ff87491dd01', '433cc417-4fae-5517-af33-769561dba9bb', 'D', 'Polycystic kidneys', false, 3),
  ('0ebed18a-1032-510c-9b0e-81018057efa7', '433cc417-4fae-5517-af33-769561dba9bb', 'E', 'Essential hypertension', false, 4);

-- Q153
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('bc384368-a0a6-53e3-b19d-04b822fa3ed7', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000001', 'sba', 'A 22 year old tall man with long fingers, a high-arched palate and lens dislocation has chest pain. Echo shows a dilated aortic root. What is the SINGLE most likely diagnosis?', 'Marfan syndrome (FBN1, autosomal dominant) causes tall stature, arachnodactyly, joint hypermobility, upward lens dislocation, mitral valve prolapse and aortic root dilatation (risk of dissection and regurgitation). Management: beta-blockers or ARBs, regular echo, avoiding strenuous isometric exercise, and elective aortic root surgery. Homocystinuria causes downward lens dislocation and thrombosis.', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v4')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = 'bc384368-a0a6-53e3-b19d-04b822fa3ed7';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('7d9b31a5-8f14-5ca5-bbd6-570faa75c8bd', 'bc384368-a0a6-53e3-b19d-04b822fa3ed7', 'A', 'Ehlers-Danlos syndrome', false, 0),
  ('ef2dd475-d6f9-535e-9d62-b35fa4e8fc73', 'bc384368-a0a6-53e3-b19d-04b822fa3ed7', 'B', 'Turner syndrome', false, 1),
  ('fceea12f-a60c-5e05-b86f-380f5b48b11a', 'bc384368-a0a6-53e3-b19d-04b822fa3ed7', 'C', 'Homocystinuria', false, 2),
  ('ca6fdbbe-b40b-5ce9-91de-67dc7c331b89', 'bc384368-a0a6-53e3-b19d-04b822fa3ed7', 'D', 'Marfan syndrome', true, 3),
  ('7247575d-0a0e-5075-a133-8c6c3907a449', 'bc384368-a0a6-53e3-b19d-04b822fa3ed7', 'E', 'Klinefelter syndrome', false, 4);

-- Q154
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('30762b09-22ae-5a2a-8471-cbee4aebb859', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000001', 'sba', 'A 68 year old man has sudden tearing chest pain radiating to his back. BP is 180/100 in the right arm and 140/85 in the left. CT angiogram shows a dissection limited to the descending aorta distal to the left subclavian artery. What is the SINGLE most appropriate initial management?', 'Stanford type A dissection (ascending aorta) needs emergency surgery. Type B (descending only) is usually managed medically with BP and heart rate control (target systolic 100-120 mmHg, HR below 60), unless complicated by malperfusion, rupture or uncontrolled pain, which need endovascular repair (TEVAR).', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v4')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = '30762b09-22ae-5a2a-8471-cbee4aebb859';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('176a992b-0dbc-5bc2-8756-f2e074396b15', '30762b09-22ae-5a2a-8471-cbee4aebb859', 'A', 'Aspirin and heparin', false, 0),
  ('18dfdb73-c230-511d-83a4-2896aecae92d', '30762b09-22ae-5a2a-8471-cbee4aebb859', 'B', 'IV beta-blocker (e.g. labetalol) to reduce heart rate and BP, with surgical/vascular review; uncomplicated type B is managed medically', true, 1),
  ('55070463-2f5c-5d36-a88d-00c1d0ae0a33', '30762b09-22ae-5a2a-8471-cbee4aebb859', 'C', 'Discharge with oral antihypertensives', false, 2),
  ('b5a7abb3-1c84-5b7d-9510-5fceb814c606', '30762b09-22ae-5a2a-8471-cbee4aebb859', 'D', 'Emergency open surgery in all', false, 3),
  ('89277a83-59ad-5e96-854f-49e9197f7f39', '30762b09-22ae-5a2a-8471-cbee4aebb859', 'E', 'Thrombolysis', false, 4);

-- Q155
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('51d65c6d-5f1b-556e-8885-7024d1144481', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000001', 'sba', 'A 75 year old woman has had breathlessness on exertion and chest tightness. She had a faint episode while climbing stairs. There is an ejection systolic murmur radiating to the carotids and a slow-rising pulse. Echo shows severe aortic stenosis. What is the SINGLE most appropriate management?', 'Symptomatic severe aortic stenosis (angina, syncope, breathlessness) has a poor prognosis without valve replacement. TAVI is preferred in older or high surgical risk patients, and surgical AVR in younger or lower-risk patients. Avoid vasodilators in severe AS. Asymptomatic severe AS is monitored closely.', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v4')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = '51d65c6d-5f1b-556e-8885-7024d1144481';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('5a5f0ed1-5e81-5eca-a2d1-55d928cc847f', '51d65c6d-5f1b-556e-8885-7024d1144481', 'A', 'Vasodilators', false, 0),
  ('f1063ecf-1d6d-527d-972f-8de7eeeaa4b6', '51d65c6d-5f1b-556e-8885-7024d1144481', 'B', 'Refer for aortic valve replacement (surgical or TAVI)', true, 1),
  ('659f0ddf-a189-5181-8dcb-751a29b500a7', '51d65c6d-5f1b-556e-8885-7024d1144481', 'C', 'Watchful waiting', false, 2),
  ('787a3ee4-35cf-521d-bdf6-63e4c82e08d0', '51d65c6d-5f1b-556e-8885-7024d1144481', 'D', 'Long-term diuretics only', false, 3),
  ('5621896a-e42d-5364-a5e9-a97433abacc4', '51d65c6d-5f1b-556e-8885-7024d1144481', 'E', 'Balloon valvuloplasty as definitive therapy', false, 4);

-- Q156
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('c39d4502-0c3a-54d8-8a89-23f9f879f098', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000001', 'sba', 'A 30 year old woman had a heart murmur found at a routine check. She has a mid-systolic click and a late systolic murmur at the apex. She is otherwise well. What is the SINGLE most likely diagnosis?', 'Mitral valve prolapse is common, with a mid-systolic click and late systolic murmur. It is usually benign. It is associated with connective tissue disorders (Marfan, Ehlers-Danlos). Complications include mitral regurgitation, arrhythmias and endocarditis (rare). Echo confirms.', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v4')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = 'c39d4502-0c3a-54d8-8a89-23f9f879f098';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('daec1e44-8bd8-5fdf-94b0-27953a2e26bc', 'c39d4502-0c3a-54d8-8a89-23f9f879f098', 'A', 'Ventricular septal defect', false, 0),
  ('8cfed862-ae33-5a4e-822a-5e21de7ce204', 'c39d4502-0c3a-54d8-8a89-23f9f879f098', 'B', 'Pulmonary stenosis', false, 1),
  ('dfe06c3e-20d3-5fb6-9292-dc8fcc8fedc4', 'c39d4502-0c3a-54d8-8a89-23f9f879f098', 'C', 'Aortic stenosis', false, 2),
  ('9096137d-e7e3-5cac-ae6f-ebfac8f79df1', 'c39d4502-0c3a-54d8-8a89-23f9f879f098', 'D', 'Mitral valve prolapse', true, 3),
  ('b4b798de-4084-5d2c-8091-b4639ff7b6ef', 'c39d4502-0c3a-54d8-8a89-23f9f879f098', 'E', 'Hypertrophic cardiomyopathy', false, 4);

-- Q157
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('09c6f27b-32f4-5d86-86c9-05f56093d839', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000001', 'sba', 'A 50 year old man has had progressive breathlessness. Examination shows a pansystolic murmur at the apex radiating to the axilla. He had rheumatic fever as a child. What is the SINGLE most likely valve lesion?', 'Mitral regurgitation causes a pansystolic murmur at the apex radiating to the axilla, with a soft S1 and possibly S3. Causes: degenerative (prolapse), ischaemic, rheumatic, endocarditis and functional (LV dilatation). Surgery (repair preferred) for symptomatic severe MR or LV dysfunction. Transcatheter edge-to-edge repair in high-risk patients.', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v4')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = '09c6f27b-32f4-5d86-86c9-05f56093d839';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('4afe0f99-98e5-5b17-a926-b2da5e7e55a1', '09c6f27b-32f4-5d86-86c9-05f56093d839', 'A', 'Tricuspid regurgitation', false, 0),
  ('165b1af3-4e66-5cd5-9018-c04b6a06af6c', '09c6f27b-32f4-5d86-86c9-05f56093d839', 'B', 'Aortic regurgitation', false, 1),
  ('92112aac-f9e4-5689-9295-e2e5ab8a6df9', '09c6f27b-32f4-5d86-86c9-05f56093d839', 'C', 'Aortic stenosis', false, 2),
  ('6893ede6-49c5-5fab-b6dd-3375bc354f05', '09c6f27b-32f4-5d86-86c9-05f56093d839', 'D', 'Mitral regurgitation', true, 3),
  ('bf5ddd8e-d2a1-5cc0-8d64-624c6287e45c', '09c6f27b-32f4-5d86-86c9-05f56093d839', 'E', 'Mitral stenosis', false, 4);

-- Q158
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('311304fc-e532-59b9-9572-906e27cf2ec1', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000001', 'sba', 'A 40 year old woman who injects drugs has a pansystolic murmur at the left lower sternal edge that increases on inspiration, with a pulsatile liver and giant V waves in the JVP. What is the SINGLE most likely valve lesion?', 'Tricuspid regurgitation causes a pansystolic murmur at the left lower sternal edge that increases with inspiration (Carvallo''s sign), giant V waves, a pulsatile liver and peripheral oedema. Causes include endocarditis in people who inject drugs, right ventricular dilatation (pulmonary hypertension), carcinoid and rheumatic disease.', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v4')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = '311304fc-e532-59b9-9572-906e27cf2ec1';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('fce34784-d642-5138-b461-d3ecb3e0bcc9', '311304fc-e532-59b9-9572-906e27cf2ec1', 'A', 'Pulmonary regurgitation', false, 0),
  ('94b6247a-fe26-59ec-98ce-b71b5f21509c', '311304fc-e532-59b9-9572-906e27cf2ec1', 'B', 'Mitral regurgitation', false, 1),
  ('c2651750-e2a5-53d4-8e4b-390b0b97f920', '311304fc-e532-59b9-9572-906e27cf2ec1', 'C', 'Aortic stenosis', false, 2),
  ('87c81786-0081-5a50-85d5-96cd4fb50b0a', '311304fc-e532-59b9-9572-906e27cf2ec1', 'D', 'Tricuspid regurgitation', true, 3),
  ('eee9558d-7e07-52ae-98bf-76fb485b54ea', '311304fc-e532-59b9-9572-906e27cf2ec1', 'E', 'Ventricular septal defect', false, 4);

-- Q159
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('c4b0b607-9ea7-50a6-bb42-f6d4f95fee05', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000001', 'sba', 'A 24 year old pregnant woman at 30 weeks has palpitations. ECG shows sinus rhythm at 98 bpm. Echo is normal. Thyroid function is normal. What is the SINGLE most likely explanation?', 'In pregnancy, cardiac output increases by 30-50%, with a rise in heart rate (10-20 bpm) and stroke volume, and a fall in systemic vascular resistance and BP in the second trimester. Soft ejection systolic flow murmurs are common. Diastolic murmurs, symptomatic arrhythmias or breathlessness at rest need investigation.', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v4')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = 'c4b0b607-9ea7-50a6-bb42-f6d4f95fee05';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('c7a1237b-59b4-5e7b-b570-a9c9398bb911', 'c4b0b607-9ea7-50a6-bb42-f6d4f95fee05', 'A', 'Supraventricular tachycardia', false, 0),
  ('7541f4c0-2dc2-576d-8bdd-585c7c387383', 'c4b0b607-9ea7-50a6-bb42-f6d4f95fee05', 'B', 'Hyperthyroidism', false, 1),
  ('411c0dfd-f030-57c8-b64b-5739c17baf2d', 'c4b0b607-9ea7-50a6-bb42-f6d4f95fee05', 'C', 'Peripartum cardiomyopathy', false, 2),
  ('3c1dde36-cb10-5868-8901-bbec594aba79', 'c4b0b607-9ea7-50a6-bb42-f6d4f95fee05', 'D', 'Pulmonary embolism', false, 3),
  ('4104b687-c044-56a4-946b-231f1b91ce93', 'c4b0b607-9ea7-50a6-bb42-f6d4f95fee05', 'E', 'Physiological increase in heart rate in pregnancy', true, 4);

-- Q160
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('00dfc8bf-d896-5dd0-888d-8ef2ca4c47d7', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000001', 'sba', 'A 85 year old woman with AF on apixaban has a fall and an ankle fracture. Her family ask if she should stop anticoagulation because she might fall again. What is the CORRECT advice?', 'The risk of a subdural haemorrhage from falls is small compared with the stroke risk in AF, and studies suggest someone would need to fall very many times a year for the risk to outweigh the benefit. Address fall risk, review modifiable bleeding risks (BP control, NSAIDs, alcohol), and use the ORBIT score.', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v4')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = '00dfc8bf-d896-5dd0-888d-8ef2ca4c47d7';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('4d657fec-d4f2-500f-95dd-b95211b6fa40', '00dfc8bf-d896-5dd0-888d-8ef2ca4c47d7', 'A', 'Stop anticoagulation permanently', false, 0),
  ('7832110c-c05e-5c4a-9466-de798fd5b090', '00dfc8bf-d896-5dd0-888d-8ef2ca4c47d7', 'B', 'Replace with warfarin', false, 1),
  ('99281657-c088-538f-8806-6624c76e32f2', '00dfc8bf-d896-5dd0-888d-8ef2ca4c47d7', 'C', 'Halve the dose', false, 2),
  ('915fa0f7-7edd-56a8-bc29-7459c0fff786', '00dfc8bf-d896-5dd0-888d-8ef2ca4c47d7', 'D', 'Switch to aspirin', false, 3),
  ('412c08ba-3815-51d1-839f-e2120abbc6ad', '00dfc8bf-d896-5dd0-888d-8ef2ca4c47d7', 'E', 'Falls alone are not a reason to stop anticoagulation; the stroke benefit usually outweighs the bleeding risk, and fall risk should be reduced', true, 4);

-- Q161
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('5a281b77-a4c5-5885-8211-3dae156c255d', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000001', 'sba', 'A 70 year old man with AF has a heart rate of 140 bpm. He is stable. His AF started 2 weeks ago. He has no heart failure. What is the SINGLE most appropriate first-line rate control drug?', 'NICE NG196: offer rate control as first-line for most people with AF, using a beta-blocker (not sotalol) or diltiazem or verapamil. Digoxin is used for sedentary people or in combination. Rhythm control is considered for those with reversible cause, heart failure caused by AF, new-onset AF, or atrial flutter. Anticoagulate based on CHA2DS2-VASc.', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v4')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = '5a281b77-a4c5-5885-8211-3dae156c255d';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('c3739b86-9759-5841-92ce-585ba0ce12f3', '5a281b77-a4c5-5885-8211-3dae156c255d', 'A', 'Amiodarone', false, 0),
  ('39003426-d452-596e-af53-e407ad073925', '5a281b77-a4c5-5885-8211-3dae156c255d', 'B', 'Adenosine', false, 1),
  ('74130d09-1cfc-5902-81c7-f6c79f4ffd97', '5a281b77-a4c5-5885-8211-3dae156c255d', 'C', 'Digoxin as first choice in all', false, 2),
  ('ed14ea1d-fdbe-5e16-8bc4-58ad8474038a', '5a281b77-a4c5-5885-8211-3dae156c255d', 'D', 'Flecainide', false, 3),
  ('9ce97a87-64f3-50aa-8a6a-e43cf371af1b', '5a281b77-a4c5-5885-8211-3dae156c255d', 'E', 'A beta-blocker (e.g. bisoprolol) or a rate-limiting calcium channel blocker (diltiazem)', true, 4);

-- Q162
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('3983dba2-48b8-556d-852e-8857fa7ea9ee', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000001', 'sba', 'A 60 year old woman has AF that started 6 hours ago. She is stable and has no structural heart disease. She wants rhythm control. What is the SINGLE most appropriate option?', 'AF of less than 48 hours may be cardioverted without prior anticoagulation (giving heparin at presentation). Use flecainide (no structural heart disease) or amiodarone (structural heart disease), or electrical cardioversion. AF of over 48 hours needs 3 weeks of anticoagulation (or TOE to exclude thrombus) before cardioversion, and 4 weeks after.', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v4')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = '3983dba2-48b8-556d-852e-8857fa7ea9ee';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('6f16c864-573a-52f7-8bc2-ef9bd84f51c6', '3983dba2-48b8-556d-852e-8857fa7ea9ee', 'A', 'Pharmacological cardioversion with flecainide (or electrical cardioversion), with heparin cover', true, 0),
  ('7abccbdd-326a-531f-aeb2-38b6a8af2de1', '3983dba2-48b8-556d-852e-8857fa7ea9ee', 'B', 'Cardioversion after 3 weeks only', false, 1),
  ('78d49bd6-4b5f-5efd-9267-384287ea3f3f', '3983dba2-48b8-556d-852e-8857fa7ea9ee', 'C', 'Amiodarone long-term without cardioversion', false, 2),
  ('3453da06-af59-5e3e-ad12-238926b4f29d', '3983dba2-48b8-556d-852e-8857fa7ea9ee', 'D', 'No treatment', false, 3),
  ('1e01d805-fc63-594e-8155-e314b36eb401', '3983dba2-48b8-556d-852e-8857fa7ea9ee', 'E', 'Digoxin', false, 4);

-- Q163
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('b453ed85-9faa-5061-a802-7b3c99ec318e', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000001', 'sba', 'A 55 year old man has had a regular tachycardia at 150 bpm. ECG shows a sawtooth baseline in leads II, III and aVF. What is the SINGLE most likely diagnosis?', 'Atrial flutter: atrial rate about 300 bpm with sawtooth flutter waves, commonly with 2:1 block giving a ventricular rate of 150. Anticoagulate as for AF. Rate control, cardioversion and, definitively, catheter ablation of the cavotricuspid isthmus (high success rate).', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v4')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = 'b453ed85-9faa-5061-a802-7b3c99ec318e';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('a0e79c6e-189d-5813-ac06-4a7c416b834d', 'b453ed85-9faa-5061-a802-7b3c99ec318e', 'A', 'AVNRT', false, 0),
  ('10d72927-4189-54cd-ad17-270497be22b6', 'b453ed85-9faa-5061-a802-7b3c99ec318e', 'B', 'Ventricular tachycardia', false, 1),
  ('db695d81-a850-53e4-9f5d-6a9696ea775f', 'b453ed85-9faa-5061-a802-7b3c99ec318e', 'C', 'Atrial fibrillation', false, 2),
  ('2308e2cd-3fd4-54d4-bac1-f0fb3611b390', 'b453ed85-9faa-5061-a802-7b3c99ec318e', 'D', 'Atrial flutter with 2:1 block', true, 3),
  ('48d6a64a-f0b8-5f78-bfe4-eb65fa8d4b1b', 'b453ed85-9faa-5061-a802-7b3c99ec318e', 'E', 'Sinus tachycardia', false, 4);

-- Q164
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('8ac684bd-e266-57e4-bdbd-19d1226c6af7', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000001', 'sba', 'A 68 year old man had a syncopal episode while shaving. He turned his head and collapsed. ECG at rest is normal. What is the SINGLE most likely diagnosis?', 'Carotid sinus syndrome causes syncope from pressure on the carotid sinus (tight collars, shaving, turning the head), leading to bradycardia or vasodilation. It is common in older men. Diagnosis: carotid sinus massage with monitoring (avoid if carotid bruit or recent stroke). Pacemaker for cardioinhibitory type.', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v4')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = '8ac684bd-e266-57e4-bdbd-19d1226c6af7';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('4858c058-5c29-56fe-9dfe-6f5bfd46f4bd', '8ac684bd-e266-57e4-bdbd-19d1226c6af7', 'A', 'Orthostatic hypotension', false, 0),
  ('d5a4c4fb-1796-5ad7-af6e-35ba94d759f1', '8ac684bd-e266-57e4-bdbd-19d1226c6af7', 'B', 'Carotid sinus hypersensitivity', true, 1),
  ('dc9eb329-7d85-5b7c-85f2-dac142353432', '8ac684bd-e266-57e4-bdbd-19d1226c6af7', 'C', 'Epilepsy', false, 2),
  ('b4100055-27cb-5a1e-8cb1-e034a467ed37', '8ac684bd-e266-57e4-bdbd-19d1226c6af7', 'D', 'Aortic stenosis', false, 3),
  ('d26a321a-1cc0-5005-932f-34f5c5885dbf', '8ac684bd-e266-57e4-bdbd-19d1226c6af7', 'E', 'Vasovagal syncope', false, 4);

-- Q165
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('2f028267-7c12-540f-b4b3-e18ada11673f', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000001', 'sba', 'A 19 year old student fainted after standing for a long time in a hot lecture hall. She felt light-headed, sweaty and nauseated before. She recovered within a minute. ECG is normal. What is the SINGLE most likely diagnosis?', 'Vasovagal syncope is triggered by prolonged standing, heat, pain or emotion, with a prodrome (light-headedness, sweating, nausea, visual dimming) and rapid recovery. A few jerks can occur. Management: reassurance, avoid triggers, fluids, and counter-pressure manoeuvres. Red flags: exertional syncope, syncope lying down, family history of sudden death, and abnormal ECG.', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v4')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = '2f028267-7c12-540f-b4b3-e18ada11673f';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('0cff6313-ca4f-541f-9999-3ee2055c0169', '2f028267-7c12-540f-b4b3-e18ada11673f', 'A', 'Epilepsy', false, 0),
  ('7772b544-7a76-5d74-9ef0-0d2fd82b2bda', '2f028267-7c12-540f-b4b3-e18ada11673f', 'B', 'Long QT syndrome', false, 1),
  ('121a3dcf-6e76-5666-8c7f-e056956fe5ad', '2f028267-7c12-540f-b4b3-e18ada11673f', 'C', 'Hypoglycaemia', false, 2),
  ('30db2387-7e2e-5b71-905b-84eba96fe405', '2f028267-7c12-540f-b4b3-e18ada11673f', 'D', 'Hypertrophic cardiomyopathy', false, 3),
  ('b6b7199a-cefa-5b69-8dc4-e570061e3b74', '2f028267-7c12-540f-b4b3-e18ada11673f', 'E', 'Vasovagal (reflex) syncope', true, 4);

-- Q166
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('47c9d512-f15d-57b4-b5ed-1a90981efd4e', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000001', 'sba', 'A 65 year old man with chest pain on exertion relieved by rest has an ECG showing Q waves in the inferior leads. NICE recommends which first-line investigation for suspected stable angina?', 'NICE CG95: offer CT coronary angiography (CTCA) if typical or atypical angina, or if non-anginal chest pain with ECG changes. Functional imaging (stress echo, myocardial perfusion scan, stress MRI) if CTCA is non-diagnostic or there is known CAD. Exercise ECG is no longer recommended for diagnosis.', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v4')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = '47c9d512-f15d-57b4-b5ed-1a90981efd4e';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('6a3f2e0c-552f-578c-892b-9d7579df5db8', '47c9d512-f15d-57b4-b5ed-1a90981efd4e', 'A', 'Exercise ECG', false, 0),
  ('15d185af-59a6-56b5-b0de-51da0ffeb33a', '47c9d512-f15d-57b4-b5ed-1a90981efd4e', 'B', 'Troponin', false, 1),
  ('57585a4f-134b-533c-969b-c1f5637cc905', '47c9d512-f15d-57b4-b5ed-1a90981efd4e', 'C', 'CT coronary angiography', true, 2),
  ('af04976a-cf6f-5bc8-959b-cc9052398537', '47c9d512-f15d-57b4-b5ed-1a90981efd4e', 'D', 'Echocardiogram only', false, 3),
  ('bfbf3638-b80a-54dd-ad39-2b7f2396ef4a', '47c9d512-f15d-57b4-b5ed-1a90981efd4e', 'E', 'Coronary angiography first-line', false, 4);

-- Q167
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('ffbfa434-e212-54c4-b253-3222fd33df03', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000001', 'sba', 'A 62 year old man has stable angina. He takes aspirin, atorvastatin and GTN spray. Angina occurs twice a week. What is the SINGLE most appropriate first-line anti-anginal drug?', 'NICE CG126: first-line treatment for stable angina is a beta-blocker or a calcium channel blocker (rate-limiting if used alone). If not controlled, use both (dihydropyridine CCB with a beta-blocker). Second-line options: long-acting nitrates, ivabradine, nicorandil and ranolazine. Revascularisation (PCI or CABG) if symptoms persist.', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v4')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = 'ffbfa434-e212-54c4-b253-3222fd33df03';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('80392745-a1f1-5073-be61-b3cbf73d6e63', 'ffbfa434-e212-54c4-b253-3222fd33df03', 'A', 'Long-acting nitrate first-line', false, 0),
  ('71166cf3-f0ff-56cc-a981-97bd74d15b70', 'ffbfa434-e212-54c4-b253-3222fd33df03', 'B', 'Nicorandil', false, 1),
  ('ecd2df1c-130f-50e2-9562-326773db1d7a', 'ffbfa434-e212-54c4-b253-3222fd33df03', 'C', 'Ranolazine', false, 2),
  ('4a95b4e2-70a1-5af3-bcee-298bec049f93', 'ffbfa434-e212-54c4-b253-3222fd33df03', 'D', 'A beta-blocker or a calcium channel blocker', true, 3),
  ('52b5c97b-37ee-53e0-b270-9d07037b8846', 'ffbfa434-e212-54c4-b253-3222fd33df03', 'E', 'Ivabradine', false, 4);

-- Q168
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('6010b4d6-c4ef-5636-9719-5915614a567c', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000002', 'sba', 'A 19 year old woman has asthma and uses a salbutamol inhaler 4 times a week. She has night-time cough once a week. What is the SINGLE most appropriate next step according to current UK guidance?', 'BTS/NICE/SIGN 2024 asthma guideline: for newly diagnosed adults, offer an as-needed low-dose ICS/formoterol combination inhaler (AIR therapy). If uncontrolled, step up to low-dose maintenance and reliever therapy (MART), then moderate-dose MART. SABA-only treatment is no longer recommended for adults. Check adherence and inhaler technique at each review.', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v4')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = '6010b4d6-c4ef-5636-9719-5915614a567c';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('a9fca220-6dad-5ab4-8320-221878fbc5f8', '6010b4d6-c4ef-5636-9719-5915614a567c', 'A', 'Continue salbutamol only', false, 0),
  ('3640d270-8641-5435-9cb3-57fbdc7a6cff', '6010b4d6-c4ef-5636-9719-5915614a567c', 'B', 'Oral steroids for 6 weeks', false, 1),
  ('c0c7a676-a107-52e7-a4a9-6358c42c9e75', '6010b4d6-c4ef-5636-9719-5915614a567c', 'C', 'Start a low-dose ICS/formoterol inhaler as anti-inflammatory reliever (AIR) therapy', true, 2),
  ('a5a6cc9c-90c6-52db-83fd-138263f5b894', '6010b4d6-c4ef-5636-9719-5915614a567c', 'D', 'Long-acting beta agonist alone', false, 3),
  ('853e257b-a903-58bd-99c9-e8a02ece4e4d', '6010b4d6-c4ef-5636-9719-5915614a567c', 'E', 'Start oral montelukast alone', false, 4);

-- Q169
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('e5c9690e-d30e-5e1d-99da-ba9cfddf7c6e', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000002', 'sba', 'A 35 year old man has acute asthma. He cannot complete sentences. PEF is 40% of best, RR 28, HR 118 and SpO2 94%. What is the SINGLE best classification of severity?', 'Acute severe asthma: PEF 33-50%, RR 25 or more, HR 110 or more, or inability to complete sentences. Life-threatening: PEF below 33%, SpO2 below 92%, PaO2 below 8 kPa, normal PaCO2, silent chest, cyanosis, poor respiratory effort, arrhythmia, exhaustion, altered consciousness or hypotension. Near-fatal: raised PaCO2. Treat with oxygen, nebulised salbutamol and ipratropium, and steroids.', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v4')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = 'e5c9690e-d30e-5e1d-99da-ba9cfddf7c6e';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('4f56eace-efb3-53d6-9d24-9eed39a5a504', 'e5c9690e-d30e-5e1d-99da-ba9cfddf7c6e', 'A', 'Acute severe asthma', true, 0),
  ('1f39f13b-2f41-5948-8e59-b8212a6ef7b4', 'e5c9690e-d30e-5e1d-99da-ba9cfddf7c6e', 'B', 'Life-threatening asthma', false, 1),
  ('50dcc0f3-c126-5bd6-a923-f9649dc66346', 'e5c9690e-d30e-5e1d-99da-ba9cfddf7c6e', 'C', 'Moderate asthma', false, 2),
  ('6916d1e3-c22a-57f5-aa9f-7249e23756d2', 'e5c9690e-d30e-5e1d-99da-ba9cfddf7c6e', 'D', 'Mild asthma', false, 3),
  ('18331c78-5744-50c0-a763-4709ac6b5ac4', 'e5c9690e-d30e-5e1d-99da-ba9cfddf7c6e', 'E', 'Near-fatal asthma', false, 4);

-- Q170
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('6f9b2d36-7615-5f70-a751-ec5b4f1a68e3', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000002', 'sba', 'A 26 year old woman with acute severe asthma is receiving back-to-back nebulised salbutamol, ipratropium and oral prednisolone. After 1 hour, she is tiring, with PEF 25% and a PaCO2 of 6.2 kPa. What is the SINGLE most appropriate action?', 'A normal or raised PaCO2 in acute asthma indicates exhaustion and impending respiratory failure (near-fatal asthma). Involve ICU early, as intubation may be needed. Give IV magnesium sulfate. IV aminophylline only after senior advice. Sedation is contraindicated outside ICU.', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v4')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = '6f9b2d36-7615-5f70-a751-ec5b4f1a68e3';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('b2139acb-c1d1-5c10-9346-a7da82fa7f65', '6f9b2d36-7615-5f70-a751-ec5b4f1a68e3', 'A', 'Give IV furosemide', false, 0),
  ('fed08ff5-0d03-566a-a358-594ead4c55a1', '6f9b2d36-7615-5f70-a751-ec5b4f1a68e3', 'B', 'Discharge home', false, 1),
  ('b4915aaa-55d0-5aef-9be9-edc33edad0d5', '6f9b2d36-7615-5f70-a751-ec5b4f1a68e3', 'C', 'Add oral montelukast', false, 2),
  ('f5d77e73-fdbf-55f3-8e6c-9897a1f4e9d0', '6f9b2d36-7615-5f70-a751-ec5b4f1a68e3', 'D', 'Urgent ICU/anaesthetic referral (life-threatening/near-fatal asthma), with IV magnesium sulfate', true, 3),
  ('4c4cc9b0-7def-50ae-bdbe-d65d0e226ec5', '6f9b2d36-7615-5f70-a751-ec5b4f1a68e3', 'E', 'Nebulised saline', false, 4);

-- Q171
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('24a4f16d-245e-5518-a08e-dd8aff0a78c5', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000002', 'sba', 'A 50 year old non-smoking woman has had recurrent chest infections, with daily production of large amounts of purulent sputum for years. She had whooping cough as a child. CT shows dilated airways with ''signet ring'' signs. What is the SINGLE most likely diagnosis?', 'Bronchiectasis is permanent dilatation of the airways, causing chronic productive cough and recurrent infections. Causes: post-infective (whooping cough, measles, TB), cystic fibrosis, immunodeficiency, ABPA and primary ciliary dyskinesia. HRCT: airway wider than the accompanying vessel (signet ring). Management: airway clearance, physiotherapy, antibiotics for exacerbations (send sputum culture) and long-term macrolides in frequent exacerbators.', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v4')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = '24a4f16d-245e-5518-a08e-dd8aff0a78c5';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('2409b9ea-d23f-53c4-a1d1-83e8fdc2cdcb', '24a4f16d-245e-5518-a08e-dd8aff0a78c5', 'A', 'Lung cancer', false, 0),
  ('9bb7f167-a3a7-52a5-93bf-7e08e4d547cc', '24a4f16d-245e-5518-a08e-dd8aff0a78c5', 'B', 'Bronchiectasis', true, 1),
  ('24d47bab-e1ba-5f26-b4f6-ee9e2b17bd73', '24a4f16d-245e-5518-a08e-dd8aff0a78c5', 'C', 'Asthma', false, 2),
  ('8d058ec1-8129-536a-aaa1-5dd698e14bb8', '24a4f16d-245e-5518-a08e-dd8aff0a78c5', 'D', 'Pulmonary fibrosis', false, 3),
  ('f893d184-a94b-5335-ad1e-34a12c59a2c8', '24a4f16d-245e-5518-a08e-dd8aff0a78c5', 'E', 'COPD', false, 4);

-- Q172
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('cc154111-3d30-54c3-93ff-fb6c5981f28e', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000002', 'sba', 'A 32 year old man with asthma has worsening control, fleeting chest X-ray infiltrates, high blood eosinophils and very high total IgE. Aspergillus-specific IgE is positive. What is the SINGLE most likely diagnosis?', 'ABPA is a hypersensitivity reaction to Aspergillus in people with asthma or cystic fibrosis. Features: worsening asthma, brown sputum plugs, eosinophilia, raised IgE, transient infiltrates and central bronchiectasis. Treatment: oral prednisolone, with itraconazole as a steroid-sparing agent.', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v4')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = 'cc154111-3d30-54c3-93ff-fb6c5981f28e';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('214b031b-978b-5b7a-9d2b-4dcc4af86a7b', 'cc154111-3d30-54c3-93ff-fb6c5981f28e', 'A', 'Tuberculosis', false, 0),
  ('ff2cc271-83d7-5a8e-919b-6fc48f87b8dc', 'cc154111-3d30-54c3-93ff-fb6c5981f28e', 'B', 'Churg-Strauss (EGPA)', false, 1),
  ('63f5bfce-49c3-549b-b13f-32c6746c0892', 'cc154111-3d30-54c3-93ff-fb6c5981f28e', 'C', 'Allergic bronchopulmonary aspergillosis', true, 2),
  ('c1a4e5d6-a7ca-5920-a11e-088836566264', 'cc154111-3d30-54c3-93ff-fb6c5981f28e', 'D', 'Aspergilloma', false, 3),
  ('77ceea49-db69-5fa0-b18f-f9827ceb05ac', 'cc154111-3d30-54c3-93ff-fb6c5981f28e', 'E', 'Invasive aspergillosis', false, 4);

-- Q173
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('8883608c-5155-578f-af5a-951802a5d370', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000002', 'sba', 'A 45 year old man has asthma, nasal polyps, a high eosinophil count, a purpuric rash and a foot drop (mononeuritis multiplex). p-ANCA is positive. What is the SINGLE most likely diagnosis?', 'EGPA (formerly Churg-Strauss) is a small-vessel vasculitis with asthma, eosinophilia, sinus disease, neuropathy (mononeuritis multiplex), skin lesions and cardiac involvement. p-ANCA (MPO) positive in about 40%. Treatment: steroids, with cyclophosphamide or rituximab for severe disease, and mepolizumab.', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v4')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = '8883608c-5155-578f-af5a-951802a5d370';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('e28a6139-2524-5fd9-a88e-0ade3e3f73c7', '8883608c-5155-578f-af5a-951802a5d370', 'A', 'Polyarteritis nodosa', false, 0),
  ('1aed272d-a369-5fb0-a1aa-ae451522f3f9', '8883608c-5155-578f-af5a-951802a5d370', 'B', 'Granulomatosis with polyangiitis', false, 1),
  ('bf54b5e8-5dc1-5282-b100-635ce49a61a7', '8883608c-5155-578f-af5a-951802a5d370', 'C', 'Eosinophilic granulomatosis with polyangiitis (EGPA)', true, 2),
  ('6931b516-62ad-53ca-ac3e-cde2aee43fbf', '8883608c-5155-578f-af5a-951802a5d370', 'D', 'ABPA', false, 3),
  ('163b77ec-7446-5668-aac9-31580dca54f7', '8883608c-5155-578f-af5a-951802a5d370', 'E', 'Sarcoidosis', false, 4);

-- Q174
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('2c7215a7-37a2-5f04-9d08-2d9b0fe536a8', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000002', 'sba', 'A 70 year old former coal miner has progressive breathlessness. Chest X-ray shows multiple small upper zone nodules. What is the SINGLE most likely diagnosis?', 'Coal workers'' pneumoconiosis causes small upper-zone nodules (simple), which can progress to large masses (progressive massive fibrosis). Silicosis (quarrying, sandblasting) is similar with eggshell calcification of hilar nodes and increased TB risk. Asbestosis causes lower-zone fibrosis. Compensation may be available.', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v4')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = '2c7215a7-37a2-5f04-9d08-2d9b0fe536a8';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('44ea5a9d-3b12-5f9e-9125-174198d572b6', '2c7215a7-37a2-5f04-9d08-2d9b0fe536a8', 'A', 'Pulmonary metastases', false, 0),
  ('75a0240d-4164-5261-a1a4-21260314e5e2', '2c7215a7-37a2-5f04-9d08-2d9b0fe536a8', 'B', 'Coal workers'' pneumoconiosis', true, 1),
  ('af64baff-d0e1-58de-9ade-4277830decc9', '2c7215a7-37a2-5f04-9d08-2d9b0fe536a8', 'C', 'Sarcoidosis', false, 2),
  ('bfe694ec-6c80-594f-adb0-6cc82c905e91', '2c7215a7-37a2-5f04-9d08-2d9b0fe536a8', 'D', 'Asbestosis', false, 3),
  ('49792044-3252-5c9a-a37d-f9091b7405b8', '2c7215a7-37a2-5f04-9d08-2d9b0fe536a8', 'E', 'Tuberculosis', false, 4);

-- Q175
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('994b6070-a482-5029-86c9-14e696dc1d67', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000002', 'sba', 'A 60 year old man has had a CT showing a solitary 7 mm solid lung nodule. He is a former smoker. What is the SINGLE most appropriate next step according to BTS guidance?', 'BTS pulmonary nodule guidance: nodules under 5 mm (or under 80 mm3) need no follow-up. Nodules 5-8 mm are followed with CT surveillance. Nodules 8 mm or more (or 300 mm3 or more) are assessed with the Brock model, then PET-CT and the Herder model if the Brock risk is 10% or more. Volume doubling time guides decisions.', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v4')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = '994b6070-a482-5029-86c9-14e696dc1d67';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('66849875-571a-50af-a658-207963fa63ad', '994b6070-a482-5029-86c9-14e696dc1d67', 'A', 'Discharge', false, 0),
  ('a89e3136-8a15-5a91-9c0b-9e3d657282f3', '994b6070-a482-5029-86c9-14e696dc1d67', 'B', 'Bronchoscopy', false, 1),
  ('8debe6d4-1c15-5e8e-bf99-dcbd989a771a', '994b6070-a482-5029-86c9-14e696dc1d67', 'C', 'PET-CT in all nodules', false, 2),
  ('fb030064-47eb-590c-a2df-a0acaf84684a', '994b6070-a482-5029-86c9-14e696dc1d67', 'D', 'Calculate malignancy risk (Brock model) and arrange CT surveillance', true, 3),
  ('ea64ddf5-b996-5c32-b33e-66cb340ec373', '994b6070-a482-5029-86c9-14e696dc1d67', 'E', 'Immediate surgical resection', false, 4);

-- Q176
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('f0b1102b-c5c9-5da3-81fa-fe06ffd7fc2c', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000002', 'sba', 'A 66 year old woman has had breathlessness and syncope on exertion. Echo shows a raised pulmonary artery pressure with a dilated right ventricle. Lung function and CT chest are normal. V/Q scan shows multiple mismatched perfusion defects. She had a PE a year ago. What is the SINGLE most likely diagnosis?', 'CTEPH is caused by unresolved thromboembolism after PE. V/Q scan is the best screening test. It is potentially curable with pulmonary endarterectomy. Others: balloon pulmonary angioplasty and riociguat. Lifelong anticoagulation is needed. Consider it in people with persistent breathlessness 3 months after a PE.', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v4')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = 'f0b1102b-c5c9-5da3-81fa-fe06ffd7fc2c';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('26cd5244-0221-5a47-8e4d-8e2748c438f5', 'f0b1102b-c5c9-5da3-81fa-fe06ffd7fc2c', 'A', 'Idiopathic pulmonary arterial hypertension', false, 0),
  ('465a0b44-2569-56e8-abe1-a23a9baea7b1', 'f0b1102b-c5c9-5da3-81fa-fe06ffd7fc2c', 'B', 'Heart failure with reduced EF', false, 1),
  ('7d8d3493-cda2-5d00-a4ac-79360ac6db1f', 'f0b1102b-c5c9-5da3-81fa-fe06ffd7fc2c', 'C', 'COPD', false, 2),
  ('5bf7ef1d-5e31-5e02-83f3-73068f2e1998', 'f0b1102b-c5c9-5da3-81fa-fe06ffd7fc2c', 'D', 'Chronic thromboembolic pulmonary hypertension', true, 3),
  ('e1a999f5-2852-5f49-bbf1-c3a58a683cff', 'f0b1102b-c5c9-5da3-81fa-fe06ffd7fc2c', 'E', 'Recurrent acute PE only', false, 4);

-- Q177
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('bb2090a9-b292-5ab2-92ae-82a540fabc2d', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000002', 'sba', 'A 28 year old man has had a sudden onset of right-sided pleuritic chest pain and breathlessness. He has a 2-day history of calf swelling after a long-haul flight. HR 112, SpO2 93%. Wells score is 7. What is the SINGLE most appropriate next step?', 'NICE NG158: PE likely (Wells over 4): immediate CTPA, with interim anticoagulation if there is any delay. PE unlikely: D-dimer, then CTPA if positive. Thrombolysis is for massive PE with haemodynamic instability. DOACs (apixaban, rivaroxaban) are first-line treatment for at least 3 months.', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v4')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = 'bb2090a9-b292-5ab2-92ae-82a540fabc2d';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('f1559748-0d22-5606-a071-dfa97479d408', 'bb2090a9-b292-5ab2-92ae-82a540fabc2d', 'A', 'Discharge with aspirin', false, 0),
  ('adb0a033-d3e1-5017-815d-7f1af9956478', 'bb2090a9-b292-5ab2-92ae-82a540fabc2d', 'B', 'D-dimer first and only image if positive', false, 1),
  ('29068a28-cbcf-5b49-89be-24b02afcab70', 'bb2090a9-b292-5ab2-92ae-82a540fabc2d', 'C', 'Start anticoagulation (e.g. apixaban or LMWH) and arrange CTPA immediately', true, 2),
  ('a94a1607-b4ff-5451-9909-ade3202b06d1', 'bb2090a9-b292-5ab2-92ae-82a540fabc2d', 'D', 'Thrombolysis immediately', false, 3),
  ('beaff652-dfac-509e-85ba-51db61d84fe5', 'bb2090a9-b292-5ab2-92ae-82a540fabc2d', 'E', 'Leg ultrasound and wait 1 week', false, 4);

-- Q178
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('25f3d2f7-b737-5888-a517-cb487ff277f9', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000002', 'sba', 'A 55 year old woman has a confirmed PE. She is hypotensive (BP 75/40) despite fluids, with right ventricular dilatation on bedside echo. What is the SINGLE most appropriate treatment?', 'Massive (high-risk) PE with haemodynamic instability is treated with thrombolysis unless contraindicated. Alternatives: surgical embolectomy or catheter-directed therapy. Submassive (intermediate-risk) PE with RV strain but normal BP is anticoagulated and monitored closely.', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v4')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = '25f3d2f7-b737-5888-a517-cb487ff277f9';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('ec65a7fa-cdbe-5231-b991-d409f9e37098', '25f3d2f7-b737-5888-a517-cb487ff277f9', 'A', 'Observation', false, 0),
  ('4339191a-ae51-50bd-876a-5cde5b61597b', '25f3d2f7-b737-5888-a517-cb487ff277f9', 'B', 'Systemic thrombolysis (e.g. alteplase)', true, 1),
  ('89448498-3077-5a05-bbc0-ba0ea7f60361', '25f3d2f7-b737-5888-a517-cb487ff277f9', 'C', 'Subcutaneous LMWH only', false, 2),
  ('19ca0e74-49e7-5db3-a77a-ed496179e41a', '25f3d2f7-b737-5888-a517-cb487ff277f9', 'D', 'IVC filter only', false, 3),
  ('37e3ba1d-ed8d-52ff-a1c4-1ae0886bc8d2', '25f3d2f7-b737-5888-a517-cb487ff277f9', 'E', 'Oral apixaban', false, 4);

-- Q179
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('2232b862-5db7-5d0d-a095-5958107c153a', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000002', 'sba', 'A 45 year old woman has had her first unprovoked PE. She has completed 3 months of apixaban. What is the CORRECT approach to treatment duration?', 'NICE NG158: treat all for at least 3 months. For unprovoked VTE, consider continuing beyond 3 months (long-term) if bleeding risk is low, as recurrence risk is high. Provoked VTE (surgery, trauma) usually needs 3 months only. Consider testing for antiphospholipid syndrome in unprovoked VTE if it would change management.', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v4')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = '2232b862-5db7-5d0d-a095-5958107c153a';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('bccca265-f72b-53a0-97c7-45301b859c04', '2232b862-5db7-5d0d-a095-5958107c153a', 'A', 'Consider continuing anticoagulation long term, weighing recurrence risk against bleeding risk', true, 0),
  ('d2db6e61-92dc-5842-a2fd-523b029657f9', '2232b862-5db7-5d0d-a095-5958107c153a', 'B', 'Stop at 6 weeks', false, 1),
  ('a388d0ab-9641-5ac3-81e2-013c8c6d5ccb', '2232b862-5db7-5d0d-a095-5958107c153a', 'C', 'Lifelong warfarin in all', false, 2),
  ('47a159c2-c20e-5f6d-8131-9e70600d179e', '2232b862-5db7-5d0d-a095-5958107c153a', 'D', 'Switch to aspirin', false, 3),
  ('8b08e752-1dd5-54f9-92de-4abcc045c3ac', '2232b862-5db7-5d0d-a095-5958107c153a', 'E', 'Stop at 3 months in all cases', false, 4);

-- Q180
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('c3bd84df-3fc7-54c6-b4cc-51120e79916d', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000002', 'sba', 'A 75 year old man with chronic heart failure has a right pleural effusion on X-ray. He is afebrile and the effusion improved with diuretics. What is the MOST appropriate management?', 'Bilateral effusions in known heart failure are usually transudates and respond to diuretics. Aspirate if atypical features: unilateral (especially left), fever, pleuritic pain, or failure to respond to diuretics. Ultrasound guidance is recommended for any pleural procedure.', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v4')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = 'c3bd84df-3fc7-54c6-b4cc-51120e79916d';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('74dbc743-ecfd-5635-8915-46d49f507b36', 'c3bd84df-3fc7-54c6-b4cc-51120e79916d', 'A', 'Pleurodesis', false, 0),
  ('94757eeb-3d07-5077-9391-1f305de09997', 'c3bd84df-3fc7-54c6-b4cc-51120e79916d', 'B', 'Chest drain', false, 1),
  ('7b9db45d-a864-5a17-ad69-53e05954f726', 'c3bd84df-3fc7-54c6-b4cc-51120e79916d', 'C', 'Antibiotics', false, 2),
  ('95a7b82a-ebdd-59fa-b5be-0c7eed38fb25', 'c3bd84df-3fc7-54c6-b4cc-51120e79916d', 'D', 'Optimise heart failure treatment; aspiration is not needed unless atypical features', true, 3),
  ('46875eae-00ea-5498-baa2-5193bfbcc8b9', 'c3bd84df-3fc7-54c6-b4cc-51120e79916d', 'E', 'Thoracoscopic biopsy', false, 4);

-- Q181
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('7c4e6b52-3cf5-5367-ab7a-80f328e792a3', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000002', 'sba', 'A 25 year old woman has had a dry cough, fever and headache for a week, with a mild rash. Her chest X-ray shows patchy bilateral infiltrates, more extensive than her signs suggest. Cold agglutinins are positive with mild haemolysis. What is the SINGLE most likely organism?', 'Mycoplasma pneumonia affects young adults, often in epidemics, with a prolonged prodrome, dry cough, and extra-pulmonary features (cold agglutinin haemolysis, erythema multiforme, Stevens-Johnson syndrome, myocarditis, Guillain-Barré). Treatment: a macrolide or doxycycline (not penicillins, as it lacks a cell wall).', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v4')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = '7c4e6b52-3cf5-5367-ab7a-80f328e792a3';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('50abb2c2-8b49-5d02-898b-0e17f5f360e6', '7c4e6b52-3cf5-5367-ab7a-80f328e792a3', 'A', 'Mycoplasma pneumoniae', true, 0),
  ('e191199c-d4fc-5151-9667-dad8a98f33ff', '7c4e6b52-3cf5-5367-ab7a-80f328e792a3', 'B', 'Streptococcus pneumoniae', false, 1),
  ('a387159a-3fb6-5d5a-9478-c8383bc1e928', '7c4e6b52-3cf5-5367-ab7a-80f328e792a3', 'C', 'Legionella', false, 2),
  ('ac1ffc3b-09d3-5441-b074-53ad2116c849', '7c4e6b52-3cf5-5367-ab7a-80f328e792a3', 'D', 'Staphylococcus aureus', false, 3),
  ('858b5611-f39c-5f93-ab78-e0cc26640663', '7c4e6b52-3cf5-5367-ab7a-80f328e792a3', 'E', 'Klebsiella', false, 4);

-- Q182
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('293d29f7-4e6e-539f-a725-c53ef51dc6ef', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000002', 'sba', 'A 30 year old woman has pneumonia after influenza. She is very unwell, with cavitating lesions on chest X-ray and a high WCC. What is the SINGLE most likely organism?', 'Staphylococcus aureus pneumonia often follows influenza and can cause cavitation, abscesses and empyema. Panton-Valentine leukocidin (PVL) strains cause severe necrotising pneumonia in young people. Treatment: flucloxacillin (or vancomycin or linezolid for MRSA), with clindamycin or linezolid for PVL toxin.', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v4')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = '293d29f7-4e6e-539f-a725-c53ef51dc6ef';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('5a570d0e-f181-5c16-8480-2fd931c3aa1f', '293d29f7-4e6e-539f-a725-c53ef51dc6ef', 'A', 'Chlamydophila psittaci', false, 0),
  ('b6337446-2b89-5c78-b6cd-280e8bddcb89', '293d29f7-4e6e-539f-a725-c53ef51dc6ef', 'B', 'Staphylococcus aureus', true, 1),
  ('9b6a6648-9875-566c-9422-046a2a436320', '293d29f7-4e6e-539f-a725-c53ef51dc6ef', 'C', 'Haemophilus influenzae', false, 2),
  ('2bceaeef-f1da-5e61-b496-0aa8c8dc0da3', '293d29f7-4e6e-539f-a725-c53ef51dc6ef', 'D', 'Legionella', false, 3),
  ('500827fc-57cd-5b0b-8bac-f86b398f52bb', '293d29f7-4e6e-539f-a725-c53ef51dc6ef', 'E', 'Mycoplasma pneumoniae', false, 4);

-- Q183
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('2776549f-6dd0-5453-83e6-0c7f1ea2be8f', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000002', 'sba', 'A 58 year old man with alcohol dependence has a ''red currant jelly'' sputum and upper lobe consolidation with cavitation. What is the SINGLE most likely organism?', 'Klebsiella pneumoniae causes severe pneumonia in people with alcohol dependence and diabetes, often in the upper lobes, with cavitation and red currant jelly sputum. Aspiration pneumonia (alcohol, reduced consciousness) often affects the right lower lobe. High mortality.', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v4')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = '2776549f-6dd0-5453-83e6-0c7f1ea2be8f';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('07d5cfe6-7f9e-5951-836b-8a28ea6a931e', '2776549f-6dd0-5453-83e6-0c7f1ea2be8f', 'A', 'Pneumocystis', false, 0),
  ('ac63c81e-b06e-5d93-974d-f09fc7adefd5', '2776549f-6dd0-5453-83e6-0c7f1ea2be8f', 'B', 'Legionella', false, 1),
  ('3403f2b7-76ae-508a-b284-1d934925cd8f', '2776549f-6dd0-5453-83e6-0c7f1ea2be8f', 'C', 'Klebsiella pneumoniae', true, 2),
  ('5221b385-0b78-52bf-8f76-8cbfa9bb0add', '2776549f-6dd0-5453-83e6-0c7f1ea2be8f', 'D', 'Mycoplasma', false, 3),
  ('da94c6ef-8e8f-58b0-82ec-2724615cd64a', '2776549f-6dd0-5453-83e6-0c7f1ea2be8f', 'E', 'Streptococcus pneumoniae', false, 4);

-- Q184
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('405df377-a9bb-577f-8209-b4e84cab8a08', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000002', 'sba', 'A 68 year old woman has community-acquired pneumonia. She is confused (new), with urea 8.5 mmol/L, RR 32, BP 95/55 and is 68. What is her CURB-65 score and management?', 'CURB-65: Confusion, Urea over 7, RR 30 or more, BP systolic below 90 or diastolic 60 or less, age 65 or more. Here all 5 are present (diastolic 55). Scores 0-1: home treatment; 2: hospital; 3-5: severe pneumonia, consider ICU. Severe CAP is treated with IV co-amoxiclav plus clarithromycin.', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v4')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = '405df377-a9bb-577f-8209-b4e84cab8a08';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('9121e656-f4f6-55e9-a120-b8def8dc0d40', '405df377-a9bb-577f-8209-b4e84cab8a08', 'A', 'Score 1; no antibiotics', false, 0),
  ('dcd21a87-224d-54de-9458-bb8c3e712f28', '405df377-a9bb-577f-8209-b4e84cab8a08', 'B', 'Score 4; discharge with review', false, 1),
  ('60b862c7-2964-5c86-bf66-0769c08cf908', '405df377-a9bb-577f-8209-b4e84cab8a08', 'C', 'Score 3; oral antibiotics at home', false, 2),
  ('c4a050a4-546c-52c5-bacf-80ca32d4b4f3', '405df377-a9bb-577f-8209-b4e84cab8a08', 'D', 'CURB-65 of 5; hospital admission with consideration of ICU', true, 3),
  ('a6dec694-bfe3-54b6-9b1a-2812d2d615ee', '405df377-a9bb-577f-8209-b4e84cab8a08', 'E', 'Score 2; home treatment', false, 4);

-- Q185
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('2d8b3e9d-2e33-59c4-baa6-09a222c1787e', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000003', 'sba', 'A 38 year old woman has had a sudden onset of severe epigastric pain radiating to her back with vomiting. Amylase is 1,800 U/L. Ultrasound shows gallstones. What is the SINGLE most important initial management?', 'Acute pancreatitis: commonest causes are gallstones and alcohol. Diagnose with amylase or lipase over 3 times normal and typical pain. Management: IV fluids, analgesia, oxygen, monitoring and early enteral nutrition. Antibiotics only for infected necrosis. Cholecystectomy during the same admission (or within 2 weeks) for mild gallstone pancreatitis. ERCP for obstructive jaundice or cholangitis.', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v4')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = '2d8b3e9d-2e33-59c4-baa6-09a222c1787e';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('e3d7d230-c113-55b3-8a41-50a7e006c92d', '2d8b3e9d-2e33-59c4-baa6-09a222c1787e', 'A', 'Nil management until CT', false, 0),
  ('ebcee5af-7eb2-592f-ab7d-44dd71fe5a61', '2d8b3e9d-2e33-59c4-baa6-09a222c1787e', 'B', 'Aggressive IV fluid resuscitation, analgesia and monitoring of severity (e.g. Glasgow score)', true, 1),
  ('199a28a1-2380-5aa9-967a-920653987d98', '2d8b3e9d-2e33-59c4-baa6-09a222c1787e', 'C', 'Prophylactic antibiotics in all', false, 2),
  ('a7ff10ea-a469-53e0-b60c-e94c958bf069', '2d8b3e9d-2e33-59c4-baa6-09a222c1787e', 'D', 'NG feeding not allowed', false, 3),
  ('ccbc063d-80fa-56f5-b72e-e14c19b3cd28', '2d8b3e9d-2e33-59c4-baa6-09a222c1787e', 'E', 'Immediate cholecystectomy', false, 4);

-- Q186
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('bf6816c6-8c00-54ef-a669-ded8bf0d4bc2', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000003', 'sba', 'A 50 year old man had acute pancreatitis 5 weeks ago. He has persistent epigastric fullness and early satiety. CT shows a well-defined fluid collection with a wall next to the pancreas. What is the SINGLE most likely diagnosis?', 'A pseudocyst is a fluid collection with a fibrous wall that forms 4 or more weeks after acute pancreatitis. Many resolve. Drainage (endoscopic cystgastrostomy preferred) for symptomatic, enlarging or infected cysts. Complications: infection, haemorrhage (pseudoaneurysm), rupture and obstruction.', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v4')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = 'bf6816c6-8c00-54ef-a669-ded8bf0d4bc2';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('8a28e3f8-2f38-598c-9f68-02643ddab79a', 'bf6816c6-8c00-54ef-a669-ded8bf0d4bc2', 'A', 'Acute fluid collection', false, 0),
  ('bb57d05c-b41a-5b1c-a9a1-c0bd2d910082', 'bf6816c6-8c00-54ef-a669-ded8bf0d4bc2', 'B', 'Pancreatic pseudocyst', true, 1),
  ('404b531a-8484-551c-80da-26402aba1648', 'bf6816c6-8c00-54ef-a669-ded8bf0d4bc2', 'C', 'Pancreatic cancer', false, 2),
  ('a665bdbd-7a61-5511-b5ab-30bd86cf96ea', 'bf6816c6-8c00-54ef-a669-ded8bf0d4bc2', 'D', 'Pancreatic abscess', false, 3),
  ('ed37ee06-081e-507d-ab26-0ed9ed0664fb', 'bf6816c6-8c00-54ef-a669-ded8bf0d4bc2', 'E', 'Splenic infarct', false, 4);

-- Q187
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('c237bae5-ca6e-566c-90d9-625ef6ae7c22', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000003', 'sba', 'A 45 year old woman has had RUQ pain for 2 days, fever and tenderness with a positive Murphy''s sign. Ultrasound shows a thickened gallbladder wall with pericholecystic fluid and stones. Bilirubin is normal. What is the SINGLE most appropriate management?', 'NICE CG188: acute cholecystitis is treated with analgesia, antibiotics and early laparoscopic cholecystectomy (within 1 week). Percutaneous cholecystostomy for patients unfit for surgery. Complications: empyema, gangrene and perforation.', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v4')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = 'c237bae5-ca6e-566c-90d9-625ef6ae7c22';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('a7c19de4-f237-51fe-8c0d-3fc452136d78', 'c237bae5-ca6e-566c-90d9-625ef6ae7c22', 'A', 'Oral antibiotics at home', false, 0),
  ('cb7d67e7-40b2-5d88-a8ce-9d5903415d7b', 'c237bae5-ca6e-566c-90d9-625ef6ae7c22', 'B', 'Delay surgery for 3 months in all', false, 1),
  ('b875a10c-bda7-529b-85db-e26f3bea2ba6', 'c237bae5-ca6e-566c-90d9-625ef6ae7c22', 'C', 'Ursodeoxycholic acid', false, 2),
  ('e58afb35-b8ab-5dce-82ea-53c48a69e955', 'c237bae5-ca6e-566c-90d9-625ef6ae7c22', 'D', 'IV antibiotics and analgesia with laparoscopic cholecystectomy within 1 week of diagnosis', true, 3),
  ('fece49d6-01c5-5b5a-a02f-fe7cfc2dabbd', 'c237bae5-ca6e-566c-90d9-625ef6ae7c22', 'E', 'ERCP', false, 4);

-- Q188
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('331a4041-4df8-5f87-90ac-312a26bc6ce8', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000003', 'sba', 'A 60 year old woman has had a 2-month history of pain on swallowing, weight loss and iron deficiency anaemia. She has a smooth red tongue and koilonychia. Endoscopy shows a thin membrane in the upper oesophagus. What is the SINGLE most likely diagnosis?', 'Plummer-Vinson syndrome: iron deficiency anaemia, dysphagia due to post-cricoid oesophageal webs, and glossitis. It increases the risk of post-cricoid squamous cell carcinoma. Treatment: iron replacement and dilatation of webs.', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v4')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = '331a4041-4df8-5f87-90ac-312a26bc6ce8';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('193696a5-5020-55fb-8880-0d07a7d7a560', '331a4041-4df8-5f87-90ac-312a26bc6ce8', 'A', 'Plummer-Vinson syndrome (oesophageal web with iron deficiency)', true, 0),
  ('51170e22-7ed3-5c1e-ab37-20e607cc1a48', '331a4041-4df8-5f87-90ac-312a26bc6ce8', 'B', 'Pharyngeal pouch', false, 1),
  ('6c6cf094-863f-5006-976d-1000f424d5e6', '331a4041-4df8-5f87-90ac-312a26bc6ce8', 'C', 'Barrett''s oesophagus', false, 2),
  ('4f303207-1537-5cba-a09c-56b59f2febc0', '331a4041-4df8-5f87-90ac-312a26bc6ce8', 'D', 'Eosinophilic oesophagitis', false, 3),
  ('44368aad-e644-57f5-a39b-8120516f3bbf', '331a4041-4df8-5f87-90ac-312a26bc6ce8', 'E', 'Achalasia', false, 4);

-- Q189
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('5bee6d4e-f3b8-5654-a036-ef30b0179bb6', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000003', 'sba', 'A 70 year old man has had melaena and dizziness. Hb is 72. He takes aspirin and naproxen. Endoscopy shows a duodenal ulcer with a visible vessel. What is the SINGLE most appropriate endoscopic treatment?', 'NICE CG141: for non-variceal upper GI bleeding, endoscopic treatment of high-risk lesions (active bleeding, visible vessel, adherent clot) uses adrenaline plus a second method (clips, thermal coagulation or fibrin/thrombin). Give a PPI after endoscopy. Rebleeding: repeat endoscopy, then interventional radiology or surgery. Use the Glasgow-Blatchford score before and Rockall after endoscopy.', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v4')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = '5bee6d4e-f3b8-5654-a036-ef30b0179bb6';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('7e56c2db-abfd-5319-bb8e-df946b539038', '5bee6d4e-f3b8-5654-a036-ef30b0179bb6', 'A', 'Surgery first-line', false, 0),
  ('0bc856f5-3651-5ab0-b0d2-2ca70b52a6ba', '5bee6d4e-f3b8-5654-a036-ef30b0179bb6', 'B', 'Adrenaline injection alone', false, 1),
  ('8b57884a-3322-5143-a1d7-153c95fc3175', '5bee6d4e-f3b8-5654-a036-ef30b0179bb6', 'C', 'No endoscopic treatment', false, 2),
  ('d97e2fc7-e9b7-5509-b6d1-df9b7d0730e9', '5bee6d4e-f3b8-5654-a036-ef30b0179bb6', 'D', 'Biopsy only', false, 3),
  ('23c104be-965c-5d4c-9aa4-86af9bcb160a', '5bee6d4e-f3b8-5654-a036-ef30b0179bb6', 'E', 'Dual therapy: adrenaline injection plus a mechanical (clips) or thermal method', true, 4);

-- Q190
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('a1dac16e-ecb9-5f51-8020-3959582b02ca', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000003', 'sba', 'A 75 year old woman has had a painless large bright red rectal bleed. She is haemodynamically stable. Colonoscopy shows multiple sigmoid diverticula. What is the SINGLE most likely cause?', 'Diverticular bleeding is a common cause of lower GI bleeding in older people. It is painless and often stops spontaneously. Unstable patients need CT angiography and embolisation. Angiodysplasia is associated with aortic stenosis (Heyde''s syndrome) and is often right-sided.', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v4')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = 'a1dac16e-ecb9-5f51-8020-3959582b02ca';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('56c15ae2-a569-5dfc-8a4f-ab48e20313dd', 'a1dac16e-ecb9-5f51-8020-3959582b02ca', 'A', 'Diverticular bleeding', true, 0),
  ('32152771-2986-534e-b38c-92bc34f0ee50', 'a1dac16e-ecb9-5f51-8020-3959582b02ca', 'B', 'Ischaemic colitis', false, 1),
  ('1caf9b53-d032-5b05-a946-16dbacd01ee4', 'a1dac16e-ecb9-5f51-8020-3959582b02ca', 'C', 'Haemorrhoids', false, 2),
  ('ea5469e1-e66b-5ead-a78f-6dc92f8cc645', 'a1dac16e-ecb9-5f51-8020-3959582b02ca', 'D', 'Colorectal cancer', false, 3),
  ('6a094343-fa2f-5363-8c10-846951b0a7a3', 'a1dac16e-ecb9-5f51-8020-3959582b02ca', 'E', 'Angiodysplasia', false, 4);

-- Q191
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('caeb1517-7791-57ed-9417-a86849048c39', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000003', 'sba', 'A 72 year old man has had left lower abdominal pain, fever and tenderness. CT shows sigmoid diverticulitis with a 3 cm pericolic abscess. What is the SINGLE most appropriate management?', 'Complicated diverticulitis includes abscess, perforation, fistula and stricture (Hinchey classification). Small abscesses (under 3 cm) may respond to IV antibiotics; larger abscesses need percutaneous drainage. Purulent or faecal peritonitis needs emergency surgery. Colonoscopy is avoided acutely (perforation risk) but done 6 weeks later to exclude cancer.', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v4')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = 'caeb1517-7791-57ed-9417-a86849048c39';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('e507e480-7f40-56d8-b78c-2943e1579b82', 'caeb1517-7791-57ed-9417-a86849048c39', 'A', 'No treatment', false, 0),
  ('438dc021-04a1-59db-9da9-71c25561abe7', 'caeb1517-7791-57ed-9417-a86849048c39', 'B', 'Oral antibiotics at home', false, 1),
  ('0835d88a-2c44-5b9e-b0b6-4e21a7df6bb7', 'caeb1517-7791-57ed-9417-a86849048c39', 'C', 'Colonoscopy immediately', false, 2),
  ('bf80c035-0d48-5b0a-9751-4aefb4b0d32f', 'caeb1517-7791-57ed-9417-a86849048c39', 'D', 'IV antibiotics with CT-guided percutaneous drainage of the abscess', true, 3),
  ('ed889801-f617-5e79-a04a-b35546c433bd', 'caeb1517-7791-57ed-9417-a86849048c39', 'E', 'Emergency Hartmann''s procedure in all', false, 4);

-- Q192
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('e1e85fa5-423c-5d66-bf10-4208ee7c4bed', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000003', 'sba', 'A 65 year old man has had diarrhoea and abdominal pain after starting antibiotics. He has had 10 stools a day, a WCC of 18 and creatinine above baseline. Abdominal X-ray shows a dilated colon of 8 cm. What is the SINGLE most likely diagnosis?', 'Severe C. difficile infection can cause toxic megacolon, perforation and death. Severe markers: WCC over 15, raised creatinine, temperature over 38.5 and signs of severe colitis. Treatment: oral vancomycin, IV metronidazole, urgent surgical review and colectomy if deteriorating. Lactate over 5 suggests a poor prognosis.', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v4')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = 'e1e85fa5-423c-5d66-bf10-4208ee7c4bed';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('629aa9b2-e1e8-5cb3-bfdb-f0fbcbe5b256', 'e1e85fa5-423c-5d66-bf10-4208ee7c4bed', 'A', 'Ulcerative colitis flare only', false, 0),
  ('360854e1-d0f6-5ab0-af4f-47e87316df69', 'e1e85fa5-423c-5d66-bf10-4208ee7c4bed', 'B', 'Small bowel obstruction', false, 1),
  ('57d01e6c-39fa-51ba-a577-b83c96b4adfa', 'e1e85fa5-423c-5d66-bf10-4208ee7c4bed', 'C', 'Sigmoid volvulus', false, 2),
  ('a7deb99f-8d2b-5253-88ec-ba6c9d29b88c', 'e1e85fa5-423c-5d66-bf10-4208ee7c4bed', 'D', 'Toxic megacolon from severe C. difficile infection', true, 3),
  ('4b627332-f7e5-54da-bdbd-b0b802dcff3c', 'e1e85fa5-423c-5d66-bf10-4208ee7c4bed', 'E', 'Pseudo-obstruction', false, 4);

-- Q193
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('35e0e411-c7ab-54fb-977e-811c224b0a67', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000003', 'sba', 'A 82 year old woman in a care home has abdominal distension without pain. X-ray shows a massively dilated colon to the rectum without a mechanical cause on CT. She has had a recent hip fracture and is on opioids. What is the SINGLE most likely diagnosis?', 'Ogilvie''s syndrome is acute colonic dilatation without mechanical obstruction, associated with surgery, trauma, electrolyte disturbance and opioids. Management: correct electrolytes, stop contributing drugs, NG and rectal decompression, then neostigmine (with cardiac monitoring) or colonoscopic decompression. Caecal diameter over 12 cm risks perforation.', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v4')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = '35e0e411-c7ab-54fb-977e-811c224b0a67';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('1eaab6ce-e006-5d8f-88c2-6dea1a4dc731', '35e0e411-c7ab-54fb-977e-811c224b0a67', 'A', 'Sigmoid volvulus', false, 0),
  ('76ab198a-7acb-5bf5-ba3c-852458caaf38', '35e0e411-c7ab-54fb-977e-811c224b0a67', 'B', 'Acute colonic pseudo-obstruction (Ogilvie''s syndrome)', true, 1),
  ('06decf38-9598-57e2-b33e-90aabb0b9838', '35e0e411-c7ab-54fb-977e-811c224b0a67', 'C', 'Toxic megacolon', false, 2),
  ('d7354350-4d60-5d00-8a81-2ba308f4f9e1', '35e0e411-c7ab-54fb-977e-811c224b0a67', 'D', 'Colorectal cancer', false, 3),
  ('349eedef-011d-5f11-acb3-9717f6064441', '35e0e411-c7ab-54fb-977e-811c224b0a67', 'E', 'Small bowel obstruction', false, 4);

-- Q194
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('0f3d1b69-7a41-579e-8a82-c2d8381e53d9', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000003', 'sba', 'A 28 year old man has had painful bright red bleeding after passing hard stools for 3 weeks. He describes tearing pain. Examination shows a tear at the posterior midline of the anal canal. What is the SINGLE most appropriate first-line management?', 'Anal fissure: painful bleeding with defecation, usually in the posterior midline. Lateral or multiple fissures suggest Crohn''s, TB, HIV, syphilis or cancer. Treatment: soften stools, then topical GTN or diltiazem for chronic fissures (over 6 weeks), botulinum toxin, and lateral internal sphincterotomy if refractory.', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v4')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = '0f3d1b69-7a41-579e-8a82-c2d8381e53d9';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('95b064cd-d997-5b37-b56b-a3ebd423e7e5', '0f3d1b69-7a41-579e-8a82-c2d8381e53d9', 'A', 'Colonoscopy', false, 0),
  ('62f51a3b-50da-5956-b805-c1cf32435e75', '0f3d1b69-7a41-579e-8a82-c2d8381e53d9', 'B', 'Surgical sphincterotomy first-line', false, 1),
  ('2be27413-70c5-5fd5-94e3-9c48bf3ed1b6', '0f3d1b69-7a41-579e-8a82-c2d8381e53d9', 'C', 'Banding', false, 2),
  ('40478ebe-70bd-54ea-8ba0-9dca06ff1b3e', '0f3d1b69-7a41-579e-8a82-c2d8381e53d9', 'D', 'High-fibre diet, fluids, laxatives (stool softeners) and topical analgesia; topical GTN or diltiazem if persists over 1 week', true, 3),
  ('f2321554-b82f-5bb3-9cbf-863799ff8a74', '0f3d1b69-7a41-579e-8a82-c2d8381e53d9', 'E', 'Antibiotics', false, 4);

-- Q195
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('1b94c8a6-74a1-58b4-810f-6b332aabde86', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000003', 'sba', 'A 50 year old man has had painless bright red blood on the toilet paper and a lump that prolapses on defecation and returns spontaneously. What is the SINGLE most likely diagnosis?', 'Haemorrhoids: first degree do not prolapse, second degree prolapse and reduce spontaneously, third degree need manual reduction, fourth degree cannot be reduced. Treatment: fibre and fluids, topical treatments, rubber band ligation for second and third degree, and haemorrhoidectomy for fourth degree or failure. Exclude colorectal cancer in older people or with red flags.', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v4')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = '1b94c8a6-74a1-58b4-810f-6b332aabde86';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('abbec7d1-a4e9-5581-829a-6e7025436710', '1b94c8a6-74a1-58b4-810f-6b332aabde86', 'A', 'Perianal haematoma', false, 0),
  ('cbaec547-2750-599a-b5a0-e6191edbcf56', '1b94c8a6-74a1-58b4-810f-6b332aabde86', 'B', 'Anal fissure', false, 1),
  ('1f38c33a-a02e-57bc-aec7-08c5e5b7ade9', '1b94c8a6-74a1-58b4-810f-6b332aabde86', 'C', 'Second-degree haemorrhoids', true, 2),
  ('9e4f1026-186b-58cc-bced-96f886524a16', '1b94c8a6-74a1-58b4-810f-6b332aabde86', 'D', 'Anal cancer', false, 3),
  ('318d47e5-fe1a-538e-a960-adf78382b9fa', '1b94c8a6-74a1-58b4-810f-6b332aabde86', 'E', 'Rectal prolapse', false, 4);

-- Q196
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('1ee2122a-91cc-5dc6-8d86-ce1df9df1bdc', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000003', 'sba', 'A 55 year old woman has had diarrhoea and weight loss. She has flushing. Abdominal CT shows a liver lesion. Gastrin level is very high, and she has multiple ulcers in the jejunum. What is the SINGLE most likely diagnosis?', 'Gastrinomas (pancreas or duodenum) secrete gastrin, causing multiple, severe or atypically located peptic ulcers and diarrhoea. Associated with MEN1 (in about 25%). Diagnose with fasting gastrin (off PPIs where safe) and secretin stimulation test. Treatment: high-dose PPI and surgical resection.', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v4')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = '1ee2122a-91cc-5dc6-8d86-ce1df9df1bdc';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('f0bde50e-0291-5a00-88dc-e30b76ef4fd9', '1ee2122a-91cc-5dc6-8d86-ce1df9df1bdc', 'A', 'VIPoma', false, 0),
  ('0e47d956-df90-5f20-8de4-dc9cb2eae140', '1ee2122a-91cc-5dc6-8d86-ce1df9df1bdc', 'B', 'Coeliac disease', false, 1),
  ('2b24a24b-596b-5cfb-a3f2-46d237a95e30', '1ee2122a-91cc-5dc6-8d86-ce1df9df1bdc', 'C', 'Crohn''s disease', false, 2),
  ('45974388-1f3d-56d8-b92e-b3964570d75f', '1ee2122a-91cc-5dc6-8d86-ce1df9df1bdc', 'D', 'Carcinoid syndrome', false, 3),
  ('fb1f223f-cec3-519f-838b-f8a11857e509', '1ee2122a-91cc-5dc6-8d86-ce1df9df1bdc', 'E', 'Zollinger-Ellison syndrome (gastrinoma)', true, 4);

-- Q197
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('5fd77ba9-f766-5348-b4cf-6a8d65d79067', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000003', 'sba', 'A 34 year old woman has had bloating, flatulence and diarrhoea after dairy products since a recent gastroenteritis. Coeliac serology is negative. What is the SINGLE most likely diagnosis?', 'Secondary (acquired) lactose intolerance can follow gastroenteritis or small bowel disease, which damage brush border lactase. It is often temporary. Primary lactase deficiency is common in people of Asian and African descent. Diagnose with hydrogen breath test or exclusion trial. Treat with a reduced lactose diet.', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v4')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = '5fd77ba9-f766-5348-b4cf-6a8d65d79067';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('421dc332-92bd-502f-83d6-040179e135ea', '5fd77ba9-f766-5348-b4cf-6a8d65d79067', 'A', 'Coeliac disease', false, 0),
  ('8a295217-9ccc-5eb4-a655-bc3e840ebff1', '5fd77ba9-f766-5348-b4cf-6a8d65d79067', 'B', 'Secondary lactose intolerance', true, 1),
  ('571be9f0-9a13-506e-a13a-31e98dfdaeb7', '5fd77ba9-f766-5348-b4cf-6a8d65d79067', 'C', 'Bacterial overgrowth', false, 2),
  ('56942ef7-1ea9-592f-a1dd-068b04457d47', '5fd77ba9-f766-5348-b4cf-6a8d65d79067', 'D', 'Crohn''s disease', false, 3),
  ('ff5c0998-93cc-5956-bacb-fcca85b214b3', '5fd77ba9-f766-5348-b4cf-6a8d65d79067', 'E', 'IBS', false, 4);

-- Q198
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('feaf16f0-e7d2-55c5-bf2d-1b05cf5d08a8', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000004', 'sba', 'A 19 year old man with type 1 diabetes is brought in confused, with abdominal pain and Kussmaul breathing. Glucose 28, pH 7.08, bicarbonate 8, ketones 5.5 mmol/L, potassium 4.8. What is the SINGLE most appropriate first step after IV fluids are started?', 'DKA (JBDS): ketones 3 or more (or ketonuria 2+), glucose over 11 (or known diabetes) and bicarbonate below 15 or pH below 7.3. Treat with IV 0.9% saline, fixed-rate IV insulin (0.1 units/kg/hour), potassium replacement (over 5.5: none; 3.5-5.5: 40 mmol/L) and continue basal insulin. Add 10% glucose when glucose falls below 14. Bicarbonate is not routinely used.', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v4')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = 'feaf16f0-e7d2-55c5-bf2d-1b05cf5d08a8';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('35551e94-43cc-5a13-893d-5ef14b2e2685', 'feaf16f0-e7d2-55c5-bf2d-1b05cf5d08a8', 'A', 'Subcutaneous rapid-acting insulin only', false, 0),
  ('e7e52523-d400-593d-a3e3-83251680fdee', 'feaf16f0-e7d2-55c5-bf2d-1b05cf5d08a8', 'B', 'IV bicarbonate', false, 1),
  ('788f0a71-2f60-5639-ab4a-2f58d52cc1fa', 'feaf16f0-e7d2-55c5-bf2d-1b05cf5d08a8', 'C', 'Fixed-rate IV insulin infusion at 0.1 units/kg/hour, with potassium added to fluids once below 5.5 and continuing long-acting insulin', true, 2),
  ('a80f3114-ca00-506b-9111-1f152a198fe8', 'feaf16f0-e7d2-55c5-bf2d-1b05cf5d08a8', 'D', 'Stop his basal insulin', false, 3),
  ('ec181f21-504a-5708-8ca5-1c8e466b8044', 'feaf16f0-e7d2-55c5-bf2d-1b05cf5d08a8', 'E', 'Variable-rate insulin infusion', false, 4);

-- Q199
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('62235e03-b5be-593b-95aa-3dbb11ced306', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000004', 'sba', 'A 72 year old woman on gliclazide is found drowsy at home. Capillary glucose is 2.1 mmol/L. She recovers with IV glucose, but becomes hypoglycaemic again 3 hours later. What is the SINGLE most appropriate management?', 'Sulfonylurea-induced hypoglycaemia can be prolonged and recurrent (especially in older people and renal impairment), requiring admission and IV glucose for 24-48 hours. Octreotide may help in refractory cases. Review the diabetes regimen (consider stopping the sulfonylurea).', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v4')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = '62235e03-b5be-593b-95aa-3dbb11ced306';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('2fbce8f9-498c-5644-98a5-099ca13d7d98', '62235e03-b5be-593b-95aa-3dbb11ced306', 'A', 'Start insulin', false, 0),
  ('c8eed9e0-75d0-5dcb-8e12-f4c935a2a8da', '62235e03-b5be-593b-95aa-3dbb11ced306', 'B', 'Admit for prolonged glucose monitoring and IV glucose infusion; review the sulfonylurea', true, 1),
  ('9c6286d4-8792-5268-b9db-840a9c133eeb', '62235e03-b5be-593b-95aa-3dbb11ced306', 'C', 'Increase gliclazide', false, 2),
  ('9e4075d0-06b6-5975-9338-427d9abe17c7', '62235e03-b5be-593b-95aa-3dbb11ced306', 'D', 'Give glucagon and discharge', false, 3),
  ('ff744786-c3be-5820-b5de-2c484b2725ed', '62235e03-b5be-593b-95aa-3dbb11ced306', 'E', 'Discharge after one normal glucose', false, 4);

-- Q200
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('9746a6e1-e75a-58d4-ae99-4c0e68ca136d', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000004', 'sba', 'A 55 year old man on amiodarone for 2 years has weight loss, tremor and AF worsening. TSH is suppressed and T4 raised. What is the CORRECT statement?', 'Amiodarone contains iodine and can cause hypothyroidism (more common) or thyrotoxicosis (type 1: iodine-induced in existing thyroid disease; type 2: destructive thyroiditis). Monitor TFTs, LFTs and look for pulmonary fibrosis, photosensitivity, corneal deposits and neuropathy. Type 2 responds to steroids; type 1 to antithyroid drugs.', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v4')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = '9746a6e1-e75a-58d4-ae99-4c0e68ca136d';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('5cce4ca5-7be1-5313-a4ad-14ee039a04be', '9746a6e1-e75a-58d4-ae99-4c0e68ca136d', 'A', 'Radioiodine is first-line in all', false, 0),
  ('99ac58d5-4366-5a35-bcae-90025d4f1042', '9746a6e1-e75a-58d4-ae99-4c0e68ca136d', 'B', 'Amiodarone can cause both hyperthyroidism and hypothyroidism; check TFTs before and every 6 months during treatment', true, 1),
  ('61d8410d-42d4-57b9-8ff2-3fb30d00ee02', '9746a6e1-e75a-58d4-ae99-4c0e68ca136d', 'C', 'Amiodarone only causes hypothyroidism', false, 2),
  ('62a749ec-55bf-5d32-ab16-e9eb5bbb94a5', '9746a6e1-e75a-58d4-ae99-4c0e68ca136d', 'D', 'Amiodarone has no effect on the thyroid', false, 3),
  ('d4647861-0690-583a-b6e1-9516dfa427be', '9746a6e1-e75a-58d4-ae99-4c0e68ca136d', 'E', 'Stop thyroid monitoring', false, 4);

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

-- Summary
select count(*) as sba_count from public.questions where exam_id = 'a1000000-0000-4000-8000-000000000001' and question_type = 'sba' and is_active = true and coalesce(payload->>'source','') = 'plab1-xlsx-v4';
select t.name, count(*) as n from public.questions q left join public.topics t on t.id = q.topic_id where q.exam_id = 'a1000000-0000-4000-8000-000000000001' and coalesce(q.payload->>'source','') = 'plab1-xlsx-v4' group by t.name order by n desc;
select count(*) as with_image from public.questions where exam_id = 'a1000000-0000-4000-8000-000000000001' and coalesce(payload->>'source','') = 'plab1-xlsx-v4' and coalesce(payload->>'image_url','') <> '';
