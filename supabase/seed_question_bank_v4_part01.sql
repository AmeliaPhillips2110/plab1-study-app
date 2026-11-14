-- =============================================================================
-- PLAB 1 bank v4 part 01: Q1–200 (source plab1-xlsx-v4)
-- Source: PLAB_1_Question_Bank_4.xlsx — additive; does not clear v1/v2/v3
-- Safe to re-run (stable UUIDs).
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

