-- =============================================================================
-- PLAB 1 bank v3 import PART 1 (Q1–200 of 830)
-- Paste AFTER seed_topics_expand.sql. Additive to banks v1/v2 — do NOT clear.
-- =============================================================================

-- =============================================================================
-- PLAB 1 full SBA bank import (generated from PLAB_1_Question_Bank.xlsx)
-- Source: PLAB_1_Question_Bank_3.xlsx
-- Paste into Supabase SQL after: seed_topics_expand.sql (additive — do NOT clear v1/v2)
-- Safe to re-run (stable UUIDs from uuid5 of stem+options).
-- =============================================================================

-- Ensure exam exists
insert into public.exams (id, slug, name, description, is_active) values ('a1000000-0000-4000-8000-000000000001', 'plab1', 'PLAB 1', 'PLAB 1 single best answer study bank (PLABoratory).', true) on conflict (slug) do update set name = excluded.name, is_active = true;

-- Q1
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('1c9cb198-745b-5ff6-9266-4bfc751ae45e', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000006', 'sba', 'A 65 year old woman had a stroke 4 days ago and is found to be in atrial fibrillation. CT showed a moderate-sized infarct with no haemorrhage. When should anticoagulation usually be started?', 'Current evidence (ELAN, OPTIMAS) and updated guidance support early DOAC start after ischaemic stroke in AF, usually within days depending on infarct size, rather than routinely waiting 2 weeks. Haemorrhage must be excluded on imaging. Antiplatelets are given until anticoagulation starts.', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v3')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = '1c9cb198-745b-5ff6-9266-4bfc751ae45e';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('62e6208b-ae7a-59d8-a36a-0ae48c1a72b2', '1c9cb198-745b-5ff6-9266-4bfc751ae45e', 'A', 'Consider starting a DOAC as soon as possible, guided by infarct size (often within days, per the ELAN/OPTIMAS evidence)', true, 0),
  ('e8e4c8fa-f491-5018-b0b2-7f3391ab2c26', '1c9cb198-745b-5ff6-9266-4bfc751ae45e', 'B', 'After 6 months', false, 1),
  ('88f180ef-c7f6-5931-9c74-f0a13ca62ed6', '1c9cb198-745b-5ff6-9266-4bfc751ae45e', 'C', 'Immediately within 1 hour of onset regardless of imaging', false, 2),
  ('076c87f5-3a79-51e2-a365-510df89898a8', '1c9cb198-745b-5ff6-9266-4bfc751ae45e', 'D', 'Never, because she has had a stroke', false, 3),
  ('aaf358e9-d6f0-58cd-b7c6-be2990941934', '1c9cb198-745b-5ff6-9266-4bfc751ae45e', 'E', 'Only if she has a second stroke', false, 4);

-- Q2
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('852ea9cc-cf25-562c-ad16-9f4b9a27f347', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000006', 'sba', 'A 25 year old man has had tonic-clonic seizures since his teens and has also had brief myoclonic jerks on waking, causing him to drop things. Which drug is MOST appropriate as first-line for him?', 'Juvenile myoclonic epilepsy (morning myoclonic jerks, generalised tonic-clonic seizures, and sometimes absences) responds best to sodium valproate in males. Carbamazepine, phenytoin and gabapentin may make myoclonic and absence seizures worse. In women of childbearing potential, levetiracetam or lamotrigine are used because valproate is teratogenic.', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v3')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = '852ea9cc-cf25-562c-ad16-9f4b9a27f347';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('4be0f4af-4ede-5974-8703-f5bc691ecb76', '852ea9cc-cf25-562c-ad16-9f4b9a27f347', 'A', 'Carbamazepine', false, 0),
  ('2b9cb6c8-4e0d-5873-aa5e-09b62bf08978', '852ea9cc-cf25-562c-ad16-9f4b9a27f347', 'B', 'Phenytoin', false, 1),
  ('95a32207-7997-5b21-aa9a-5bd3c8d8e1a2', '852ea9cc-cf25-562c-ad16-9f4b9a27f347', 'C', 'Ethosuximide', false, 2),
  ('dd33b360-245f-5592-b0c0-163c43da8f1f', '852ea9cc-cf25-562c-ad16-9f4b9a27f347', 'D', 'Gabapentin', false, 3),
  ('00a44f1c-eee6-5ca7-aee3-b0560ee44d13', '852ea9cc-cf25-562c-ad16-9f4b9a27f347', 'E', 'Sodium valproate', true, 4);

-- Q3
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('657ee144-af7b-5e41-ba74-9bbc2c5bb206', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000006', 'sba', 'A 9 year old girl has frequent episodes during class of staring blankly for 10 seconds with eyelid fluttering. She does not fall and resumes activity immediately with no confusion. Hyperventilation in clinic triggers an episode. What is the SINGLE most appropriate first-line drug?', 'Childhood absence epilepsy causes brief absences many times a day, provoked by hyperventilation, with 3 Hz spike-and-wave on EEG. NICE recommends ethosuximide first-line (sodium valproate if tonic-clonic seizures also occur; avoid in girls where possible). Carbamazepine can worsen absences. Most children grow out of it.', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v3')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = '657ee144-af7b-5e41-ba74-9bbc2c5bb206';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('0e03f8e8-c114-58f9-bcb3-6aaf605095e0', '657ee144-af7b-5e41-ba74-9bbc2c5bb206', 'A', 'Phenytoin', false, 0),
  ('7c9ad7f8-cdd3-5404-9349-7d04c0c00145', '657ee144-af7b-5e41-ba74-9bbc2c5bb206', 'B', 'Lamotrigine only after failure of carbamazepine', false, 1),
  ('c8b12f92-de35-5889-bd38-b0cf6103ecb7', '657ee144-af7b-5e41-ba74-9bbc2c5bb206', 'C', 'Carbamazepine', false, 2),
  ('18c5f9b8-9e02-58f5-9a3d-13ebdb0ebbc4', '657ee144-af7b-5e41-ba74-9bbc2c5bb206', 'D', 'Gabapentin', false, 3),
  ('9a8d4745-1026-534b-a0de-03c69b04bfa8', '657ee144-af7b-5e41-ba74-9bbc2c5bb206', 'E', 'Ethosuximide', true, 4);

-- Q4
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('7dae304c-d480-59f5-a0cb-b8774512461c', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000006', 'sba', 'A 60 year old man has had a slowly progressive rigid-akinetic syndrome for 2 years with early falls, and he cannot look down voluntarily. Levodopa had little effect. What is the SINGLE most likely diagnosis?', 'PSP causes symmetrical parkinsonism, early falls (often backwards), vertical gaze palsy (especially downgaze), axial rigidity and cognitive change, with a poor response to levodopa. Multiple system atrophy causes parkinsonism with autonomic failure and cerebellar signs. Parkinson''s disease is usually asymmetrical and responds well to levodopa.', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v3')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = '7dae304c-d480-59f5-a0cb-b8774512461c';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('31a59bcb-5429-5b91-bf0e-74836dcba82c', '7dae304c-d480-59f5-a0cb-b8774512461c', 'A', 'Multiple system atrophy', false, 0),
  ('7918073a-ee05-5877-85c2-ecf2b31e9a83', '7dae304c-d480-59f5-a0cb-b8774512461c', 'B', 'Progressive supranuclear palsy', true, 1),
  ('c1af2cc2-c249-5685-a860-89bf641021db', '7dae304c-d480-59f5-a0cb-b8774512461c', 'C', 'Normal pressure hydrocephalus', false, 2),
  ('9987e0e3-5f3f-5899-ba87-79844e55e19a', '7dae304c-d480-59f5-a0cb-b8774512461c', 'D', 'Essential tremor', false, 3),
  ('3d422f45-11cf-5bf3-8b38-412bd1c478ee', '7dae304c-d480-59f5-a0cb-b8774512461c', 'E', 'Parkinson''s disease', false, 4);

-- Q5
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('c315e4f1-9c3a-5346-b763-dfd1dfd61f56', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000006', 'sba', 'A 50 year old woman has numbness and tingling in her thumb, index and middle fingers that wakes her at night. Shaking her hand relieves it. Tinel''s and Phalen''s tests are positive. She has hypothyroidism. What is the SINGLE most appropriate first-line management?', 'Carpal tunnel syndrome is median nerve compression at the wrist. Associations include pregnancy, hypothyroidism, diabetes, rheumatoid arthritis, acromegaly and obesity. First-line treatment for mild-moderate symptoms is a night splint and/or corticosteroid injection. Surgical decompression is for severe or persistent symptoms, or thenar wasting. Nerve conduction studies confirm it.', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v3')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = 'c315e4f1-9c3a-5346-b763-dfd1dfd61f56';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('166c0563-3533-5733-a4b8-f65461d133f3', 'c315e4f1-9c3a-5346-b763-dfd1dfd61f56', 'A', 'Amitriptyline', false, 0),
  ('bbc952b7-6a73-5ceb-b8e9-1ae3ce7066c1', 'c315e4f1-9c3a-5346-b763-dfd1dfd61f56', 'B', 'Ulnar nerve transposition', false, 1),
  ('5aee04ae-84bc-5ac3-b997-d2d990acc678', 'c315e4f1-9c3a-5346-b763-dfd1dfd61f56', 'C', 'Immediate carpal tunnel decompression for all', false, 2),
  ('b155f91f-c1c5-5b79-b1a1-dd7700181087', 'c315e4f1-9c3a-5346-b763-dfd1dfd61f56', 'D', 'Oral prednisolone', false, 3),
  ('cc47f287-a9d1-596d-a9ee-69f19dfae99d', 'c315e4f1-9c3a-5346-b763-dfd1dfd61f56', 'E', 'Wrist splint worn at night and/or a steroid injection', true, 4);

-- Q6
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('fd11fcaf-7eb5-54a5-a0f4-1a09fd2a33c5', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000006', 'sba', 'A 75 year old man has had urinary incontinence, a broad-based shuffling ''magnetic'' gait and memory problems for 6 months. CT shows ventricular enlargement out of proportion to sulcal atrophy. What is the SINGLE most appropriate investigation that may also predict response to treatment?', 'Normal pressure hydrocephalus causes the triad of gait disturbance, urinary incontinence and dementia. Improvement in gait after high-volume CSF drainage predicts benefit from a ventriculoperitoneal shunt. It is one of the few reversible causes of dementia.', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v3')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = 'fd11fcaf-7eb5-54a5-a0f4-1a09fd2a33c5';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('a24b7de0-fd0c-5813-8c3d-1da8b895b1d5', 'fd11fcaf-7eb5-54a5-a0f4-1a09fd2a33c5', 'A', 'Nerve conduction studies', false, 0),
  ('0f14507e-567e-53ba-b534-cb75aa5308cb', 'fd11fcaf-7eb5-54a5-a0f4-1a09fd2a33c5', 'B', 'Serum B12', false, 1),
  ('191995f3-6b58-5d74-a00e-36b7bd46f1b1', 'fd11fcaf-7eb5-54a5-a0f4-1a09fd2a33c5', 'C', 'DaTscan', false, 2),
  ('06edee8c-a3a4-5e89-8196-2407d2efb41b', 'fd11fcaf-7eb5-54a5-a0f4-1a09fd2a33c5', 'D', 'Lumbar puncture with removal of CSF (tap test)', true, 3),
  ('5d5aaae4-bd02-562f-9fc5-597decfe4660', 'fd11fcaf-7eb5-54a5-a0f4-1a09fd2a33c5', 'E', 'EEG', false, 4);

-- Q7
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('fd6482b5-9bdd-51f6-aca8-8002a98dfec6', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000006', 'sba', 'A 42 year old man has had increasing involuntary jerky movements, irritability and forgetfulness. His father had similar problems and died at 55. What is the mode of inheritance of the MOST likely condition?', 'Huntington''s disease causes chorea, psychiatric change and dementia from mid-adulthood. It is autosomal dominant, caused by a CAG repeat expansion in HTT on chromosome 4, and shows anticipation (especially with paternal transmission). Tetrabenazine can reduce chorea. Genetic counselling is essential.', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v3')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = 'fd6482b5-9bdd-51f6-aca8-8002a98dfec6';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('856aad3e-79b5-5371-9165-a9f72c3e1aeb', 'fd6482b5-9bdd-51f6-aca8-8002a98dfec6', 'A', 'Mitochondrial', false, 0),
  ('7c684d51-0e06-552e-a2ca-7921c277d877', 'fd6482b5-9bdd-51f6-aca8-8002a98dfec6', 'B', 'X-linked recessive', false, 1),
  ('7be2aa17-36a2-5582-950d-13c27032e388', 'fd6482b5-9bdd-51f6-aca8-8002a98dfec6', 'C', 'Autosomal recessive', false, 2),
  ('71ac9588-9889-58b2-b75c-e0d76954eab8', 'fd6482b5-9bdd-51f6-aca8-8002a98dfec6', 'D', 'Autosomal dominant', true, 3),
  ('a7d73b99-b5c9-5896-b891-b36afb88a087', 'fd6482b5-9bdd-51f6-aca8-8002a98dfec6', 'E', 'Multifactorial', false, 4);

-- Q8
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('31c95c34-deb1-57f2-8375-2d8ab6c87ac7', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000006', 'sba', 'A 52 year old woman with type 2 diabetes has had burning pain, numbness and tingling in both feet in a ''stocking'' distribution for a year. Which drug is NICE first-line for her painful neuropathy?', 'NICE CG173 recommends a choice of amitriptyline, duloxetine, gabapentin or pregabalin as initial treatment for neuropathic pain, switching if not effective or tolerated. Tramadol is only for acute rescue. Capsaicin cream is for localised pain in people who cannot take oral drugs. Optimise glucose control and look after the feet.', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v3')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = '31c95c34-deb1-57f2-8375-2d8ab6c87ac7';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('787fe457-fbe6-5738-ac78-381a5647e5c9', '31c95c34-deb1-57f2-8375-2d8ab6c87ac7', 'A', 'Carbamazepine first-line', false, 0),
  ('9a35674f-3daf-58ce-8bba-693465da1f10', '31c95c34-deb1-57f2-8375-2d8ab6c87ac7', 'B', 'Amitriptyline, duloxetine, gabapentin or pregabalin', true, 1),
  ('a1cf8080-2db6-5cd7-a713-db758ac79e61', '31c95c34-deb1-57f2-8375-2d8ab6c87ac7', 'C', 'Tramadol long-term first-line', false, 2),
  ('00facb32-4537-517a-8e79-845c8111f328', '31c95c34-deb1-57f2-8375-2d8ab6c87ac7', 'D', 'Morphine first-line', false, 3),
  ('33797f8b-dee4-5822-8409-fb692c021276', '31c95c34-deb1-57f2-8375-2d8ab6c87ac7', 'E', 'Topical capsaicin first-line for widespread pain', false, 4);

-- Q9
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('87872b34-b138-5c6e-949b-24aeca1c1555', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000006', 'sba', 'A 28 year old man has had double vision and drooping eyelids since an infection, followed by limb weakness and areflexia. He also has ataxia. Anti-GQ1b antibodies are positive. What is the SINGLE most likely diagnosis?', 'Miller Fisher syndrome is a variant of Guillain-Barré syndrome with the triad of ophthalmoplegia, ataxia and areflexia, associated with anti-GQ1b antibodies. It usually follows an infection (such as Campylobacter) and generally has a good prognosis. Treatment is supportive, sometimes with IVIg.', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v3')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = '87872b34-b138-5c6e-949b-24aeca1c1555';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('ad13ad4b-bfe7-5f7a-8174-ad64f0dde34b', '87872b34-b138-5c6e-949b-24aeca1c1555', 'A', 'Botulism', false, 0),
  ('0738f0fd-a37d-5d16-b9a7-e94faeef3028', '87872b34-b138-5c6e-949b-24aeca1c1555', 'B', 'Wernicke''s encephalopathy', false, 1),
  ('f9fb1735-1e6e-5bd4-844b-01f2f799d81c', '87872b34-b138-5c6e-949b-24aeca1c1555', 'C', 'Brainstem stroke', false, 2),
  ('f377675a-c242-5ebc-bb1e-4646afb025c2', '87872b34-b138-5c6e-949b-24aeca1c1555', 'D', 'Myasthenia gravis', false, 3),
  ('1dd3c02f-b726-5893-a586-b34dfef8bb1c', '87872b34-b138-5c6e-949b-24aeca1c1555', 'E', 'Miller Fisher syndrome', true, 4);

-- Q10
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('adb6dd0b-4cba-5f50-8260-2bb10f98ca69', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000006', 'sba', 'A 58 year old man has had a change in personality over 1 year: disinhibition, inappropriate jokes, loss of empathy and overeating. His memory is relatively preserved. MRI shows frontal and anterior temporal lobe atrophy. What is the SINGLE most likely diagnosis?', 'Behavioural variant FTD presents earlier than Alzheimer''s (often under 65) with personality change, disinhibition, apathy, loss of empathy, compulsive behaviour and hyperorality. Memory is relatively spared early on. Acetylcholinesterase inhibitors are not effective. Some cases are familial (such as C9orf72 or MAPT mutations).', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v3')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = 'adb6dd0b-4cba-5f50-8260-2bb10f98ca69';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('32e1f5dd-b9e8-5523-860e-5f365e84c54d', 'adb6dd0b-4cba-5f50-8260-2bb10f98ca69', 'A', 'Vascular dementia', false, 0),
  ('e03d2393-e136-54ce-a7be-863d7fb52d12', 'adb6dd0b-4cba-5f50-8260-2bb10f98ca69', 'B', 'Alzheimer''s disease', false, 1),
  ('85148697-6872-52ec-a9c4-5c1251303e6d', 'adb6dd0b-4cba-5f50-8260-2bb10f98ca69', 'C', 'Frontotemporal dementia (behavioural variant)', true, 2),
  ('17e2b9f3-fb30-5017-abe4-7ae4af6c0913', 'adb6dd0b-4cba-5f50-8260-2bb10f98ca69', 'D', 'Dementia with Lewy bodies', false, 3),
  ('9bb76356-6cb0-5423-a513-7daa99376867', 'adb6dd0b-4cba-5f50-8260-2bb10f98ca69', 'E', 'Creutzfeldt-Jakob disease', false, 4);

-- Q11
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('bc874fae-1412-5587-b69d-f9b4471c0f46', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000006', 'sba', 'A 62 year old woman has had rapidly progressive dementia over 3 months, with myoclonic jerks and ataxia. EEG shows periodic sharp wave complexes. What is the SINGLE most likely diagnosis?', 'Sporadic CJD is a prion disease of older adults causing rapidly progressive dementia, myoclonus, ataxia and visual disturbance. Death usually follows within a year. MRI (DWI cortical ribboning, basal ganglia signal), CSF RT-QuIC and EEG support the diagnosis. Variant CJD (linked to BSE) affects younger people with early psychiatric features.', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v3')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = 'bc874fae-1412-5587-b69d-f9b4471c0f46';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('26a01e2d-8a09-5599-baec-6c6741505486', 'bc874fae-1412-5587-b69d-f9b4471c0f46', 'A', 'Sporadic Creutzfeldt-Jakob disease', true, 0),
  ('ff205f43-ccb6-5dfe-a3a0-ce8d5ed78713', 'bc874fae-1412-5587-b69d-f9b4471c0f46', 'B', 'Huntington''s disease', false, 1),
  ('68f67ebf-8835-5a01-bc16-0ea82deff8a5', 'bc874fae-1412-5587-b69d-f9b4471c0f46', 'C', 'Alzheimer''s disease', false, 2),
  ('09f4d2e9-c7f6-5c49-ba75-eafaaa43ccbd', 'bc874fae-1412-5587-b69d-f9b4471c0f46', 'D', 'Vascular dementia', false, 3),
  ('334d0d08-6e89-57fa-bf22-b28ea7e6fd5e', 'bc874fae-1412-5587-b69d-f9b4471c0f46', 'E', 'Normal pressure hydrocephalus', false, 4);

-- Q12
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('417751e0-7500-5c6f-a8b1-e9b83f9ff3ee', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000006', 'sba', 'A 40 year old woman has generalised fatigable weakness from myasthenia gravis. She now has worsening difficulty swallowing and breathing after a chest infection. Her FVC is 1.1 L and falling. What is the SINGLE most appropriate management?', 'A myasthenic crisis is respiratory failure from weakness of respiratory or bulbar muscles, often triggered by infection or drugs. Monitor FVC and give early ventilatory support. Treatment is IVIg or plasma exchange. Avoid aminoglycosides, magnesium, beta-blockers and some others that worsen myasthenia. High-dose steroids started suddenly can cause a temporary worsening.', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v3')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = '417751e0-7500-5c6f-a8b1-e9b83f9ff3ee';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('dd2e1388-e157-573e-a851-8da2f4c5f00d', '417751e0-7500-5c6f-a8b1-e9b83f9ff3ee', 'A', 'Start gentamicin for the infection', false, 0),
  ('a9bbc5dd-6016-5f2d-93ed-07df91c5bd0f', '417751e0-7500-5c6f-a8b1-e9b83f9ff3ee', 'B', 'Double her pyridostigmine dose and discharge', false, 1),
  ('d3401d6c-09ae-52b6-91b4-1c366536b85c', '417751e0-7500-5c6f-a8b1-e9b83f9ff3ee', 'C', 'Oral prednisolone only at a high dose straight away', false, 2),
  ('95db8e29-8b52-510e-93d5-18baa58db08c', '417751e0-7500-5c6f-a8b1-e9b83f9ff3ee', 'D', 'Thymectomy the same day', false, 3),
  ('090363a8-ccf9-545d-90a5-cd51375bae23', '417751e0-7500-5c6f-a8b1-e9b83f9ff3ee', 'E', 'Admit to intensive care for ventilatory support and give IVIg or plasma exchange', true, 4);

-- Q13
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('2f12686a-1a3f-519d-812d-25d1e44175dd', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000006', 'sba', 'A 24 year old man has a generalised tonic-clonic seizure for the first time. He is now fully recovered, with a normal neurological examination. What advice should he be given about driving a car?', 'DVLA guidance: after a first unprovoked seizure, Group 1 drivers must stop driving for 6 months (if no high-risk factors on assessment). With established epilepsy, 12 months seizure-free is required. Group 2 (lorry/bus) drivers have stricter rules. The patient is legally responsible for informing the DVLA.', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v3')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = '2f12686a-1a3f-519d-812d-25d1e44175dd';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('8534bab2-41fd-5692-94e0-ad38606bfa4e', '2f12686a-1a3f-519d-812d-25d1e44175dd', 'A', 'Stop driving and tell the DVLA; he can usually reapply after 6 months seizure-free if assessment is satisfactory', true, 0),
  ('c26a952b-cfcf-5828-b3c5-4c37442d08bd', '2f12686a-1a3f-519d-812d-25d1e44175dd', 'B', 'Stop driving for 2 weeks only', false, 1),
  ('1eca5932-2d6f-581a-8a38-62402d5476f3', '2f12686a-1a3f-519d-812d-25d1e44175dd', 'C', 'He must stop driving permanently', false, 2),
  ('d039a2ce-c0c2-5137-9aa9-32a2324838a2', '2f12686a-1a3f-519d-812d-25d1e44175dd', 'D', 'He only needs to tell his insurance company', false, 3),
  ('40578342-fdb4-54fa-9e80-3c84e4915e0d', '2f12686a-1a3f-519d-812d-25d1e44175dd', 'E', 'He can continue driving as normal', false, 4);

-- Q14
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('1de32ce4-9f65-5d3f-ada6-65fe677bf5d2', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000006', 'sba', 'A 45 year old woman has a headache that is worse on standing and eases on lying flat, starting 2 days after a lumbar puncture. What is the SINGLE most appropriate first-line management?', 'A post-dural puncture headache is caused by CSF leaking through the dural hole, giving a postural headache. It is reduced by using smaller atraumatic needles. Most resolve with conservative treatment. An epidural blood patch is very effective for persistent or severe headaches.', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v3')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = '1de32ce4-9f65-5d3f-ada6-65fe677bf5d2';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('21ac67e1-e0ef-5e6b-b1a4-0fa2fbed9f26', '1de32ce4-9f65-5d3f-ada6-65fe677bf5d2', 'A', 'Urgent CT angiogram', false, 0),
  ('82bff679-d8c7-5449-84eb-5817971089e5', '1de32ce4-9f65-5d3f-ada6-65fe677bf5d2', 'B', 'Simple analgesia, oral fluids and caffeine, with an epidural blood patch if it persists', true, 1),
  ('89717938-1432-5675-9e71-2c4a4ea4dfc8', '1de32ce4-9f65-5d3f-ada6-65fe677bf5d2', 'C', 'Repeat lumbar puncture', false, 2),
  ('5d4fe4bf-59a7-5281-80d7-f1788b67bdbb', '1de32ce4-9f65-5d3f-ada6-65fe677bf5d2', 'D', 'Start acetazolamide', false, 3),
  ('e0a0c479-5216-58ce-8fd6-6cceb7d7d793', '1de32ce4-9f65-5d3f-ada6-65fe677bf5d2', 'E', 'Start sumatriptan', false, 4);

-- Q15
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('36d45f78-5580-5109-8670-1cfaedbd3d37', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000006', 'sba', 'A 62 year old man with diabetes has sudden double vision. His left eye is ''down and out'' with complete ptosis, but the pupil is normal size and reactive. What is the SINGLE most likely cause?', 'The pupillomotor fibres run on the outside of the third nerve and are supplied by pial vessels. Compressive lesions (such as a PComm aneurysm) involve the pupil early. Microvascular infarction (diabetes, hypertension) affects the centre of the nerve and spares the pupil. It usually recovers within 3 months. Any pupil-involving palsy needs urgent CT angiography.', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v3')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = '36d45f78-5580-5109-8670-1cfaedbd3d37';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('1133148d-4192-5258-bc56-c4f685aac428', '36d45f78-5580-5109-8670-1cfaedbd3d37', 'A', 'Horner''s syndrome', false, 0),
  ('9a28d036-146a-5057-bf68-f7b44779eb77', '36d45f78-5580-5109-8670-1cfaedbd3d37', 'B', 'Sixth nerve palsy', false, 1),
  ('1b21391f-d592-504a-bb6a-001763404bd6', '36d45f78-5580-5109-8670-1cfaedbd3d37', 'C', 'Posterior communicating artery aneurysm', false, 2),
  ('6fa21381-1a34-58c7-a98b-0e8aaaaa8902', '36d45f78-5580-5109-8670-1cfaedbd3d37', 'D', 'Myasthenia gravis', false, 3),
  ('c67b3686-4ed7-5108-8a95-1f40452d47d6', '36d45f78-5580-5109-8670-1cfaedbd3d37', 'E', 'Microvascular (diabetic) third nerve palsy', true, 4);

-- Q16
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('b809941c-b40f-5cff-b4ad-d11dc1f52e04', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000006', 'sba', 'A 40 year old woman has headaches and double vision. Her right eye cannot abduct, and the double vision is horizontal and worse looking to the right. Which cranial nerve is affected?', 'The sixth nerve supplies the lateral rectus. A palsy gives horizontal diplopia, worse looking towards the affected side. Its long intracranial course makes it a ''false localising sign'' in raised intracranial pressure. Other causes include microvascular disease, tumours and trauma. A fourth nerve palsy causes vertical diplopia, worse going downstairs or reading.', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v3')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = 'b809941c-b40f-5cff-b4ad-d11dc1f52e04';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('eefa25a0-3cff-52ea-995b-362ecfc8f316', 'b809941c-b40f-5cff-b4ad-d11dc1f52e04', 'A', 'Right oculomotor nerve (III)', false, 0),
  ('f43f19af-1a9c-504f-a13f-5d92cc7b030c', 'b809941c-b40f-5cff-b4ad-d11dc1f52e04', 'B', 'Left abducens nerve (VI)', false, 1),
  ('55aa1ba8-4ca1-5d84-9407-a27368e9dfcb', 'b809941c-b40f-5cff-b4ad-d11dc1f52e04', 'C', 'Right abducens nerve (VI)', true, 2),
  ('4da4caa0-4ad7-5553-847e-18eef8cdd24c', 'b809941c-b40f-5cff-b4ad-d11dc1f52e04', 'D', 'Right facial nerve (VII)', false, 3),
  ('f4313a62-f4bc-5604-b714-1efc7c8dbe79', 'b809941c-b40f-5cff-b4ad-d11dc1f52e04', 'E', 'Right trochlear nerve (IV)', false, 4);

-- Q17
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('0341287e-b674-5d3f-8be5-52d4d47ed34e', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000006', 'sba', 'A 72 year old man has had episodes of vertigo, dysarthria, diplopia and dropping to the ground without loss of consciousness, especially when looking up. What is the SINGLE most likely cause?', 'Brainstem symptoms (vertigo with other features such as dysarthria, diplopia, ataxia, drop attacks, bilateral visual loss) suggest posterior circulation ischaemia. Isolated vertigo is rarely a TIA. Investigate as TIA with MRI and vascular imaging, and treat risk factors. BPPV causes brief vertigo with head movements but no other neurological signs.', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v3')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = '0341287e-b674-5d3f-8be5-52d4d47ed34e';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('5836e0b2-63c8-596b-b36b-2cf40910c983', '0341287e-b674-5d3f-8be5-52d4d47ed34e', 'A', 'Ménière''s disease', false, 0),
  ('fdf7fbb5-9f60-5aa5-9462-bd2124484221', '0341287e-b674-5d3f-8be5-52d4d47ed34e', 'B', 'Vertebrobasilar insufficiency (posterior circulation TIA)', true, 1),
  ('406308f5-a418-572f-85df-b457e6c249cb', '0341287e-b674-5d3f-8be5-52d4d47ed34e', 'C', 'Carotid sinus hypersensitivity', false, 2),
  ('3a7c94cb-c6f1-59d7-8ee7-c79c4c2ad28f', '0341287e-b674-5d3f-8be5-52d4d47ed34e', 'D', 'Vasovagal syncope', false, 3),
  ('360aa353-d020-501c-a116-57a5ec8d8605', '0341287e-b674-5d3f-8be5-52d4d47ed34e', 'E', 'Benign paroxysmal positional vertigo', false, 4);

-- Q18
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('721958c9-7961-51e5-9cf6-7479c1a8cebc', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000006', 'sba', 'A 47 year old woman has had bitemporal hemianopia, headaches and galactorrhoea for 6 months. What is the SINGLE most appropriate imaging?', 'Bitemporal hemianopia is caused by compression of the optic chiasm, most often by a pituitary adenoma. Galactorrhoea suggests a prolactinoma or stalk compression. MRI pituitary is the investigation of choice, along with pituitary hormone tests. Prolactinomas are usually treated with cabergoline. Others may need transsphenoidal surgery.', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v3')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = '721958c9-7961-51e5-9cf6-7479c1a8cebc';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('15be035c-5b42-5749-8342-60391baa4301', '721958c9-7961-51e5-9cf6-7479c1a8cebc', 'A', 'CT chest', false, 0),
  ('cd6913e3-99e5-5d10-b258-65128d39d6f9', '721958c9-7961-51e5-9cf6-7479c1a8cebc', 'B', 'Carotid Doppler', false, 1),
  ('07c8d3d4-ed41-5af0-b91d-d461fc073cd9', '721958c9-7961-51e5-9cf6-7479c1a8cebc', 'C', 'EEG', false, 2),
  ('54d89fa0-b885-5963-9162-74dddd652a37', '721958c9-7961-51e5-9cf6-7479c1a8cebc', 'D', 'MRI of the pituitary (with contrast)', true, 3),
  ('9a8c427a-aac5-575e-a85d-26d79e108cc7', '721958c9-7961-51e5-9cf6-7479c1a8cebc', 'E', 'Orbital ultrasound', false, 4);

-- Q19
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('04fd4788-e1d1-54a9-b5f5-1302cc3d7f0b', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000006', 'sba', 'A 32 year old woman has had progressive weakness of her legs over 2 months, with fasciculations and wasting of her calves, but no sensory symptoms. Her CK is mildly raised. Her brother had a similar illness. Which group of conditions does this pattern of pure lower motor neurone weakness suggest?', 'Pure lower motor neurone signs (wasting, fasciculation, weakness, reduced reflexes) without sensory loss point to anterior horn cell disease (spinal muscular atrophy, progressive muscular atrophy). SMA is autosomal recessive (SMN1 deletion). New disease-modifying treatments include nusinersen, risdiplam and gene therapy.', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v3')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = '04fd4788-e1d1-54a9-b5f5-1302cc3d7f0b';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('71ea613b-0c8a-5472-b8b4-05dbff7eb0d6', '04fd4788-e1d1-54a9-b5f5-1302cc3d7f0b', 'A', 'Cerebellar ataxia', false, 0),
  ('7fc70c06-6bff-5ed1-b49d-ee473020d0cb', '04fd4788-e1d1-54a9-b5f5-1302cc3d7f0b', 'B', 'Myasthenia gravis', false, 1),
  ('cbdbf16e-a5fd-54d0-9d29-faec1ea16093', '04fd4788-e1d1-54a9-b5f5-1302cc3d7f0b', 'C', 'Spinal muscular atrophy / lower motor neurone disease', true, 2),
  ('fd9ca08c-4bbc-5308-8305-8e669e5a8400', '04fd4788-e1d1-54a9-b5f5-1302cc3d7f0b', 'D', 'Upper motor neurone lesion of the spinal cord', false, 3),
  ('e7e2e399-2aff-59e3-9991-7ae2dcf1417a', '04fd4788-e1d1-54a9-b5f5-1302cc3d7f0b', 'E', 'Peripheral sensory neuropathy', false, 4);

-- Q20
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('e77ce0bb-af4a-563f-b0ee-88f83ef89e34', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000006', 'sba', 'A 23 year old man has had a progressive unsteady gait since childhood, with pes cavus, scoliosis, absent ankle reflexes, upgoing plantars and dysarthria. Echo shows hypertrophic cardiomyopathy. What is the SINGLE most likely diagnosis?', 'Friedreich''s ataxia is autosomal recessive (GAA repeat in FXN). It starts in childhood or adolescence with progressive ataxia, dysarthria, absent reflexes but upgoing plantars, loss of proprioception, pes cavus, scoliosis, hypertrophic cardiomyopathy (the main cause of death) and diabetes.', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v3')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = 'e77ce0bb-af4a-563f-b0ee-88f83ef89e34';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('d4ce7337-4fe7-578e-9449-686400e7144d', 'e77ce0bb-af4a-563f-b0ee-88f83ef89e34', 'A', 'Spinocerebellar ataxia type 1', false, 0),
  ('fed08ff6-a534-57fa-9b84-1fb87548040e', 'e77ce0bb-af4a-563f-b0ee-88f83ef89e34', 'B', 'Multiple sclerosis', false, 1),
  ('61640747-1d51-5950-9119-2a62b497f201', 'e77ce0bb-af4a-563f-b0ee-88f83ef89e34', 'C', 'Friedreich''s ataxia', true, 2),
  ('f9e11954-bafe-587d-a8ab-8d8ccce4306f', 'e77ce0bb-af4a-563f-b0ee-88f83ef89e34', 'D', 'Huntington''s disease', false, 3),
  ('ce322c56-2c94-5f46-b14b-bf51e91b47ba', 'e77ce0bb-af4a-563f-b0ee-88f83ef89e34', 'E', 'Charcot-Marie-Tooth disease', false, 4);

-- Q21
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('de0266bf-bd9c-5656-a379-3b5201c33222', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000006', 'sba', 'A 30 year old woman has had progressive distal weakness and wasting of her lower legs (''inverted champagne bottle''), high arches and reduced ankle reflexes since her teens. Her father has similar legs. What is the SINGLE most likely diagnosis?', 'Charcot-Marie-Tooth disease (most often type 1A, PMP22 duplication, autosomal dominant) causes slowly progressive distal muscle wasting and weakness, pes cavus, hammer toes, foot drop and distal sensory loss. Nerve conduction studies distinguish demyelinating (type 1) from axonal (type 2) forms. Management is supportive (physiotherapy, orthoses).', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v3')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = 'de0266bf-bd9c-5656-a379-3b5201c33222';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('480ab146-f1f2-5f32-be73-480cd7473b02', 'de0266bf-bd9c-5656-a379-3b5201c33222', 'A', 'Friedreich''s ataxia', false, 0),
  ('153cadea-026c-5aa2-ba95-3a92152a3965', 'de0266bf-bd9c-5656-a379-3b5201c33222', 'B', 'Guillain-Barré syndrome', false, 1),
  ('ec12df59-23b2-51e6-896e-a4116ad62e03', 'de0266bf-bd9c-5656-a379-3b5201c33222', 'C', 'Charcot-Marie-Tooth disease (hereditary motor and sensory neuropathy)', true, 2),
  ('288955b9-4556-51dd-b938-8e08bb686ecd', 'de0266bf-bd9c-5656-a379-3b5201c33222', 'D', 'Motor neurone disease', false, 3),
  ('6cf74f3c-1bca-5a93-88d9-3d7ae4b4bac3', 'de0266bf-bd9c-5656-a379-3b5201c33222', 'E', 'Duchenne muscular dystrophy', false, 4);

-- Q22
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('dd3883b3-3f73-5581-ad55-129e2f6a7d83', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000006', 'sba', 'A 30 year old man has been fitting continuously for 15 minutes. He has had two doses of IV lorazepam 4 mg, 5 minutes apart, without effect. His airway is supported. What is the SINGLE most appropriate next drug?', 'In convulsive status epilepticus, give up to 2 doses of benzodiazepine, then a second-line drug: IV levetiracetam, phenytoin or valproate (ESETT showed similar efficacy). If seizures continue, rapid sequence induction with anaesthetic agents in ICU is the third stage. Check glucose and treat reversible causes, such as giving thiamine where alcohol is involved.', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v3')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = 'dd3883b3-3f73-5581-ad55-129e2f6a7d83';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('dce44cdd-a598-5dd3-b3b8-0e9bb5f4ea17', 'dd3883b3-3f73-5581-ad55-129e2f6a7d83', 'A', 'IV propofol on the ward without anaesthetic support', false, 0),
  ('2756a709-7e37-545c-9422-2a32cce82e47', 'dd3883b3-3f73-5581-ad55-129e2f6a7d83', 'B', 'A third dose of IV lorazepam', false, 1),
  ('85551753-ec92-50c9-bd05-a7bc87ba8cd6', 'dd3883b3-3f73-5581-ad55-129e2f6a7d83', 'C', 'IM haloperidol', false, 2),
  ('98bb5b55-3f0f-587d-bb2c-f1c7a3b40599', 'dd3883b3-3f73-5581-ad55-129e2f6a7d83', 'D', 'Oral carbamazepine', false, 3),
  ('e11f2aef-4319-5431-aa26-43b97f4f5c1b', 'dd3883b3-3f73-5581-ad55-129e2f6a7d83', 'E', 'IV levetiracetam (or phenytoin or sodium valproate)', true, 4);

-- Q23
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('4e03753f-2d8f-5ef0-877e-4f8d02cf8f91', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000006', 'sba', 'A 64 year old man has sudden vertigo, vomiting, hoarseness and difficulty swallowing. He has loss of pain and temperature sensation on the left side of his face and the right side of his body, with left-sided ataxia and a left Horner''s syndrome. Which artery is MOST likely occluded?', 'Lateral medullary (Wallenberg) syndrome comes from PICA or vertebral artery occlusion. Features are crossed sensory loss (ipsilateral face, contralateral body pain and temperature), ipsilateral Horner''s, ipsilateral ataxia, dysphagia and hoarseness (nucleus ambiguus), vertigo and nystagmus. AICA occlusion also causes facial palsy and deafness.', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v3')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = '4e03753f-2d8f-5ef0-877e-4f8d02cf8f91';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('f58b4854-1ba1-5645-8571-727997dfdaaf', '4e03753f-2d8f-5ef0-877e-4f8d02cf8f91', 'A', 'Left anterior inferior cerebellar artery only with facial palsy and deafness', false, 0),
  ('b6a464c0-b424-5c69-bbec-a88eb1725fa4', '4e03753f-2d8f-5ef0-877e-4f8d02cf8f91', 'B', 'Left middle cerebral artery', false, 1),
  ('626135dc-1a55-5126-b68f-ef10b4465afa', '4e03753f-2d8f-5ef0-877e-4f8d02cf8f91', 'C', 'Left posterior inferior cerebellar artery (or vertebral artery)', true, 2),
  ('034c318f-0b86-57a5-84e1-4ac233bb4980', '4e03753f-2d8f-5ef0-877e-4f8d02cf8f91', 'D', 'Right anterior cerebral artery', false, 3),
  ('0e183dfe-f051-5a60-8b82-6a02627ff86c', '4e03753f-2d8f-5ef0-877e-4f8d02cf8f91', 'E', 'Basilar artery tip', false, 4);

-- Q24
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('6d94cced-989b-5cd1-8efc-7500c748b3ba', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000006', 'sba', 'A 70 year old woman has had a stroke. Her speech is slow and effortful with short phrases, but she understands what is said to her and is frustrated by her errors. Repetition is impaired. Which area is MOST likely damaged?', 'Broca''s (expressive) aphasia is non-fluent speech with preserved comprehension and the patient aware of their errors. Wernicke''s (receptive) aphasia is fluent but meaningless speech with poor comprehension. Conduction aphasia (arcuate fasciculus) has fluent speech and comprehension, but poor repetition. Global aphasia affects all of these.', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v3')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = '6d94cced-989b-5cd1-8efc-7500c748b3ba';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('28ed7933-d2c2-5da9-a943-f8f04ca90045', '6d94cced-989b-5cd1-8efc-7500c748b3ba', 'A', 'Broca''s area (inferior frontal gyrus of the dominant hemisphere)', true, 0),
  ('c9c3b8ad-3673-568a-a08b-b1b1eab2c77f', '6d94cced-989b-5cd1-8efc-7500c748b3ba', 'B', 'Wernicke''s area (superior temporal gyrus)', false, 1),
  ('be04b303-5a11-5647-843d-51a4b4aba487', '6d94cced-989b-5cd1-8efc-7500c748b3ba', 'C', 'Cerebellum', false, 2),
  ('687cf788-b04f-52eb-93b3-61e803e1f1aa', '6d94cced-989b-5cd1-8efc-7500c748b3ba', 'D', 'Occipital cortex', false, 3),
  ('a9763a54-75fa-5e73-978e-95a6978b6d64', '6d94cced-989b-5cd1-8efc-7500c748b3ba', 'E', 'Arcuate fasciculus only', false, 4);

-- Q25
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('45e21924-8707-5582-9f45-d0ec48055abb', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000006', 'sba', 'A 60 year old man has had sudden violent, flinging movements of his left arm and leg that started this morning. He has hypertension and diabetes. Where is the lesion MOST likely to be?', 'Hemiballismus is large-amplitude, flinging, involuntary movement of the limbs on one side, usually caused by a small stroke in the contralateral subthalamic nucleus. It often improves over weeks. Severe cases can be treated with dopamine-blocking drugs (such as tetrabenazine or haloperidol).', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v3')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = '45e21924-8707-5582-9f45-d0ec48055abb';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('a7298878-4b6e-5e04-8d1d-74819718b8b6', '45e21924-8707-5582-9f45-d0ec48055abb', 'A', 'Left subthalamic nucleus', false, 0),
  ('440f755b-83f6-5ba7-a89c-ce5c313806c0', '45e21924-8707-5582-9f45-d0ec48055abb', 'B', 'Right occipital lobe', false, 1),
  ('f04ebf9a-d683-5f53-bac3-1ef967190540', '45e21924-8707-5582-9f45-d0ec48055abb', 'C', 'Right cerebellar hemisphere', false, 2),
  ('9e764678-1c9d-53ed-bb25-8fb6645f6108', '45e21924-8707-5582-9f45-d0ec48055abb', 'D', 'Left caudate nucleus', false, 3),
  ('283d427e-084b-557a-a856-9d3368975cf5', '45e21924-8707-5582-9f45-d0ec48055abb', 'E', 'Right subthalamic nucleus', true, 4);

-- Q26
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('1262581d-16d5-5fcc-bb62-53c6196475d9', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000006', 'sba', 'A 55 year old man has an intention tremor of his right hand, past-pointing, dysdiadochokinesia on the right and a broad-based gait, falling to the right. Where is the lesion MOST likely to be?', 'Cerebellar hemisphere lesions cause ipsilateral signs (DANISH: dysdiadochokinesia, ataxia, nystagmus, intention tremor, slurred/staccato speech, hypotonia). Midline (vermis) lesions cause truncal and gait ataxia. Causes include stroke, MS, tumours, alcohol and drugs (phenytoin). Image with MRI.', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v3')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = '1262581d-16d5-5fcc-bb62-53c6196475d9';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('7561c91c-cdfc-5290-8ff5-fe2878cb9850', '1262581d-16d5-5fcc-bb62-53c6196475d9', 'A', 'Left cerebellar hemisphere', false, 0),
  ('89c9d03e-8907-5977-83e8-f19bc2c18442', '1262581d-16d5-5fcc-bb62-53c6196475d9', 'B', 'Left basal ganglia', false, 1),
  ('c6911e4a-5108-5166-b365-c40578197714', '1262581d-16d5-5fcc-bb62-53c6196475d9', 'C', 'Right frontal lobe', false, 2),
  ('7a5876be-4b3c-5d17-b964-51070d69420c', '1262581d-16d5-5fcc-bb62-53c6196475d9', 'D', 'Spinal cord dorsal columns', false, 3),
  ('6c1c1e96-2560-5f25-81a4-ff1b74bd2803', '1262581d-16d5-5fcc-bb62-53c6196475d9', 'E', 'Right cerebellar hemisphere', true, 4);

-- Q27
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('9ddc915d-33de-5316-9d8b-946d67b8f0a7', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000006', 'sba', 'A 62 year old smoker has proximal leg weakness that improves after repeated exercise, dry mouth and reduced reflexes that increase after brief exercise. What is the SINGLE most likely diagnosis?', 'LEMS is caused by antibodies against presynaptic voltage-gated calcium channels, and is often paraneoplastic (small cell lung cancer). It causes proximal weakness that improves with sustained effort, autonomic features (dry mouth, constipation, impotence) and reduced reflexes that improve after exercise. Look for an underlying tumour with CT chest. Treatment includes amifampridine.', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v3')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = '9ddc915d-33de-5316-9d8b-946d67b8f0a7';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('1f35dfca-5042-5a90-b7bb-511742b7085b', '9ddc915d-33de-5316-9d8b-946d67b8f0a7', 'A', 'Polymyositis', false, 0),
  ('a99a7deb-1359-598b-9381-84cf25b0090f', '9ddc915d-33de-5316-9d8b-946d67b8f0a7', 'B', 'Myasthenia gravis', false, 1),
  ('dd2fc63d-6f46-56f5-bff2-9f689a593e4a', '9ddc915d-33de-5316-9d8b-946d67b8f0a7', 'C', 'Motor neurone disease', false, 2),
  ('ff655ade-082e-50d5-9b13-67a47ad30364', '9ddc915d-33de-5316-9d8b-946d67b8f0a7', 'D', 'Guillain-Barré syndrome', false, 3),
  ('28711f61-efc9-5f63-9a2b-58343cee7d3c', '9ddc915d-33de-5316-9d8b-946d67b8f0a7', 'E', 'Lambert-Eaton myasthenic syndrome', true, 4);

-- Q28
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('530823fb-45e2-5256-a3ae-e003a512975d', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000006', 'sba', 'A 35 year old man has weakness and myotonia: he cannot release his grip after shaking hands. He has frontal balding, bilateral ptosis, cataracts and a long thin face. ECG shows first-degree heart block. What is the SINGLE most likely diagnosis?', 'Myotonic dystrophy type 1 is autosomal dominant (CTG repeat in DMPK) with anticipation. It causes distal weakness, myotonia, ptosis, a ''hatchet'' face, frontal balding, cataracts, cardiac conduction defects (risk of sudden death), diabetes and testicular atrophy. Annual ECG is needed, and some patients need a pacemaker.', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v3')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = '530823fb-45e2-5256-a3ae-e003a512975d';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('9f5c4f8a-3e21-58a2-98d4-19149d3a57f2', '530823fb-45e2-5256-a3ae-e003a512975d', 'A', 'Myotonic dystrophy type 1', true, 0),
  ('bdc44bc0-eccd-5afb-93da-28e9c9028fcd', '530823fb-45e2-5256-a3ae-e003a512975d', 'B', 'Myasthenia gravis', false, 1),
  ('cedf8f81-0f9c-564d-9725-f1c4ca7471c1', '530823fb-45e2-5256-a3ae-e003a512975d', 'C', 'Duchenne muscular dystrophy', false, 2),
  ('8b629f04-6dd6-581c-8b1e-278f50973cd6', '530823fb-45e2-5256-a3ae-e003a512975d', 'D', 'Facioscapulohumeral dystrophy', false, 3),
  ('1860858d-61dd-5266-899c-2b70e079c7b0', '530823fb-45e2-5256-a3ae-e003a512975d', 'E', 'Becker muscular dystrophy', false, 4);

-- Q29
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('3843e291-510a-596a-9331-ddc2c3c339ec', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000006', 'sba', 'A 45 year old woman is found to have a small, irregular pupil on each side that constricts when she focuses on a near object but not to light. Which test is MOST appropriate?', 'Argyll Robertson pupils (small, irregular, accommodate but do not react to light: ''prostitute''s pupil'') are classically caused by neurosyphilis, and sometimes diabetes. Test with syphilis serology, and if positive, examine CSF. Treat neurosyphilis with IV benzylpenicillin. A Holmes-Adie pupil is large and reacts slowly.', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v3')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = '3843e291-510a-596a-9331-ddc2c3c339ec';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('e91b1cbe-8b3a-5d21-95b9-bb1c3307ae0c', '3843e291-510a-596a-9331-ddc2c3c339ec', 'A', 'Syphilis serology (treponemal tests), including CSF testing if positive', true, 0),
  ('3a204aa1-974c-5e6c-b9c4-029994e51549', '3843e291-510a-596a-9331-ddc2c3c339ec', 'B', 'Thyroid function tests', false, 1),
  ('134189f3-537b-5409-acc9-7bffee50e1ae', '3843e291-510a-596a-9331-ddc2c3c339ec', 'C', 'MRI orbits', false, 2),
  ('9bc962e9-75c1-54c6-9c8d-2fbd8636c713', '3843e291-510a-596a-9331-ddc2c3c339ec', 'D', 'Acetylcholine receptor antibodies', false, 3),
  ('2a4953de-0191-540e-8e8b-26e347762273', '3843e291-510a-596a-9331-ddc2c3c339ec', 'E', 'HbA1c only', false, 4);

-- Q30
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('ed55fe45-bfa1-5ee8-b5cb-204e60b1e9c1', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000006', 'sba', 'A 28 year old woman notices that one of her pupils is larger than the other. It reacts very slowly to light and accommodation. Her ankle reflexes are absent. What is the SINGLE most likely diagnosis?', 'A Holmes-Adie (tonic) pupil is dilated and reacts slowly to light and near, from damage to the ciliary ganglion, often after a viral illness. It is common in young women, is benign and is usually unilateral at first. Holmes-Adie syndrome includes absent tendon reflexes. No treatment is needed.', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v3')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = 'ed55fe45-bfa1-5ee8-b5cb-204e60b1e9c1';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('e75fdd38-706f-5ba2-af37-08666bb0372e', 'ed55fe45-bfa1-5ee8-b5cb-204e60b1e9c1', 'A', 'Argyll Robertson pupil', false, 0),
  ('801775c9-930e-5c3c-82dc-080320219424', 'ed55fe45-bfa1-5ee8-b5cb-204e60b1e9c1', 'B', 'Third nerve palsy', false, 1),
  ('20dc16cf-04dc-50ed-9a97-fd57e37ad42b', 'ed55fe45-bfa1-5ee8-b5cb-204e60b1e9c1', 'C', 'Acute angle-closure glaucoma', false, 2),
  ('6d402977-4fe8-56a3-bb38-d889c4ef385b', 'ed55fe45-bfa1-5ee8-b5cb-204e60b1e9c1', 'D', 'Holmes-Adie pupil (syndrome)', true, 3),
  ('d57c868a-bbbb-5295-946e-2669db6c858b', 'ed55fe45-bfa1-5ee8-b5cb-204e60b1e9c1', 'E', 'Horner''s syndrome', false, 4);

-- Q31
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('728cc3ce-33f4-5a78-860f-2d729e17a937', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000006', 'sba', 'A 75 year old woman on warfarin for AF has a sudden headache and left-sided weakness. CT head shows an intracerebral haemorrhage. Her INR is 3.4. What is the SINGLE most appropriate immediate step?', 'In anticoagulant-associated intracerebral haemorrhage, rapidly reverse anticoagulation: for warfarin, give 4-factor PCC plus IV vitamin K 5-10 mg. Idarucizumab reverses dabigatran, and andexanet alfa or PCC reverses factor Xa inhibitors. Lower the systolic BP (target about 140 mmHg) and refer to neurosurgery if appropriate. FFP is slower and less effective.', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v3')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = '728cc3ce-33f4-5a78-860f-2d729e17a937';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('87ccc26c-1b9c-56d7-9416-fa51177baaa3', '728cc3ce-33f4-5a78-860f-2d729e17a937', 'A', 'Reverse anticoagulation with prothrombin complex concentrate and IV vitamin K', true, 0),
  ('cebb5c0d-e031-5d60-9a4c-6e6a94429376', '728cc3ce-33f4-5a78-860f-2d729e17a937', 'B', 'Continue warfarin and repeat INR tomorrow', false, 1),
  ('e37f676e-c061-51d1-8fa8-0090127c46ac', '728cc3ce-33f4-5a78-860f-2d729e17a937', 'C', 'Give IV alteplase', false, 2),
  ('79c8f0ba-d89f-5c4b-9a50-b2042ca377b7', '728cc3ce-33f4-5a78-860f-2d729e17a937', 'D', 'Give fresh frozen plasma as first choice', false, 3),
  ('8f54b089-85f6-5e9c-8179-18ee2440985d', '728cc3ce-33f4-5a78-860f-2d729e17a937', 'E', 'Give platelet transfusion', false, 4);

-- Q32
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('00b53e1c-ea0a-5428-8d0c-7b3530b0badb', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000006', 'sba', 'A 50 year old man is admitted with a subarachnoid haemorrhage from an aneurysm. Which drug is routinely given to reduce the risk of delayed cerebral ischaemia from vasospasm?', 'Nimodipine (a calcium channel blocker) reduces poor outcomes from delayed cerebral ischaemia after aneurysmal SAH. The aneurysm should be secured early, usually by endovascular coiling (or clipping). Other complications include re-bleeding, hydrocephalus, hyponatraemia and seizures. Avoid hypovolaemia.', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v3')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = '00b53e1c-ea0a-5428-8d0c-7b3530b0badb';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('44321d05-2313-5745-a035-a8fe5c775b6c', '00b53e1c-ea0a-5428-8d0c-7b3530b0badb', 'A', 'Dexamethasone', false, 0),
  ('d07bc213-0ab4-592e-8093-34f0987c1ef8', '00b53e1c-ea0a-5428-8d0c-7b3530b0badb', 'B', 'Aspirin', false, 1),
  ('464079c3-3239-50f2-8e1f-0189f71e6689', '00b53e1c-ea0a-5428-8d0c-7b3530b0badb', 'C', 'IV labetalol', false, 2),
  ('bfb5a47d-3bda-5dbe-9268-166c6c66aa4e', '00b53e1c-ea0a-5428-8d0c-7b3530b0badb', 'D', 'Oral nimodipine for 21 days', true, 3),
  ('a1fe4c6a-8574-5764-afb6-e5f95f8af6c9', '00b53e1c-ea0a-5428-8d0c-7b3530b0badb', 'E', 'Tranexamic acid long-term', false, 4);

-- Q33
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('000732c2-ef66-583d-9659-4419342671b8', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000006', 'sba', 'A 33 year old man had a road traffic collision. He opens his eyes to pain, makes incomprehensible sounds, and withdraws his arm from a painful stimulus. What is his Glasgow Coma Scale score?', 'Eye opening to pain = 2. Verbal: incomprehensible sounds = 2. Motor: withdraws from pain = 4. Total = 8. A GCS of 8 or less generally means the patient cannot protect their airway and needs intubation. NICE recommends CT head within 1 hour for a GCS below 13 on initial assessment.', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v3')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = '000732c2-ef66-583d-9659-4419342671b8';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('32c899c5-7b42-57ad-93bc-99494d22bf7b', '000732c2-ef66-583d-9659-4419342671b8', 'A', '6', false, 0),
  ('73e40696-b4a7-5853-b998-c99049037456', '000732c2-ef66-583d-9659-4419342671b8', 'B', '7', false, 1),
  ('d6cff83f-508f-541e-81e5-131650e445c1', '000732c2-ef66-583d-9659-4419342671b8', 'C', '8', true, 2),
  ('4e165a14-6d65-5b0b-ad5d-c9cbf993d18a', '000732c2-ef66-583d-9659-4419342671b8', 'D', '9', false, 3),
  ('f8745ee1-64eb-5ef3-a0b1-711938a24417', '000732c2-ef66-583d-9659-4419342671b8', 'E', '10', false, 4);

-- Q34
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('4ef72e8e-3436-53ee-9e98-0fafd3e3ba7b', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000006', 'sba', 'A 55 year old woman has a severe headache, vomiting and drowsiness. Her BP is 210/110 mmHg, HR 48 bpm, and breathing is irregular. CT shows a large tumour with mass effect. What is the name of this combination of signs, and what does it mean?', 'The Cushing reflex (hypertension with widened pulse pressure, bradycardia, irregular respiration) is a late sign of raised ICP and impending brainstem herniation. Measures include head-up positioning at 30 degrees, osmotherapy (mannitol or hypertonic saline), dexamethasone for tumour oedema, and urgent neurosurgery.', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v3')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = '4ef72e8e-3436-53ee-9e98-0fafd3e3ba7b';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('6f2958d2-4b6f-53df-b403-08d9316477eb', '4ef72e8e-3436-53ee-9e98-0fafd3e3ba7b', 'A', 'Horner''s syndrome, indicating sympathetic damage', false, 0),
  ('99a834b6-c6bf-55c1-8ab6-c77ec8fca708', '4ef72e8e-3436-53ee-9e98-0fafd3e3ba7b', 'B', 'Virchow''s triad, indicating thrombosis', false, 1),
  ('e42bc2d5-b373-5b75-8d1a-30389c8aed0d', '4ef72e8e-3436-53ee-9e98-0fafd3e3ba7b', 'C', 'Beck''s triad, indicating cardiac tamponade', false, 2),
  ('dbc614ad-a094-558d-8dfd-72a1a3dca7de', '4ef72e8e-3436-53ee-9e98-0fafd3e3ba7b', 'D', 'Charcot''s triad, indicating cholangitis', false, 3),
  ('1b05a3df-f69e-529c-9f69-926cd1258e23', '4ef72e8e-3436-53ee-9e98-0fafd3e3ba7b', 'E', 'Cushing''s reflex (triad), indicating critically raised intracranial pressure', true, 4);

-- Q35
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('ee2ca8c8-251b-5e41-b9fd-33c4b3be34b5', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000006', 'sba', 'A 25 year old woman has new psychiatric symptoms (anxiety, paranoia), then seizures, involuntary orofacial movements and autonomic instability. An ultrasound shows an ovarian teratoma. Which antibody is MOST likely to be positive?', 'Anti-NMDA receptor encephalitis mostly affects young women, often with an ovarian teratoma. It presents with psychiatric symptoms, then seizures, reduced consciousness, dyskinesias and autonomic instability. Treatment is removal of the tumour and immunotherapy (steroids, IVIg, plasma exchange, rituximab).', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v3')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = 'ee2ca8c8-251b-5e41-b9fd-33c4b3be34b5';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('1a840d8b-2293-5d45-b02c-42ae6a966b2b', 'ee2ca8c8-251b-5e41-b9fd-33c4b3be34b5', 'A', 'Anti-GQ1b antibodies', false, 0),
  ('7a29f6dd-693a-5c1e-8b2a-1f77af5201a3', 'ee2ca8c8-251b-5e41-b9fd-33c4b3be34b5', 'B', 'Anti-VGCC antibodies', false, 1),
  ('26f6246c-5ea8-5efb-a6b0-9a3958b193d0', 'ee2ca8c8-251b-5e41-b9fd-33c4b3be34b5', 'C', 'Anti-aquaporin 4 antibodies', false, 2),
  ('b0a823e2-1ed7-50a5-8309-dceddfe464c0', 'ee2ca8c8-251b-5e41-b9fd-33c4b3be34b5', 'D', 'Anti-AChR antibodies', false, 3),
  ('7c195a7b-a7bb-5532-992c-4321d8c34b2a', 'ee2ca8c8-251b-5e41-b9fd-33c4b3be34b5', 'E', 'Anti-NMDA receptor antibodies', true, 4);

-- Q36
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('cab795c4-485c-52b0-aa9a-0f1cb20fba0d', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000006', 'sba', 'A 58 year old man has sudden onset of amnesia for 6 hours. He keeps asking the same questions, but knows his own identity and has no other neurological deficit. He is back to normal the next day. What is the SINGLE most likely diagnosis?', 'TGA causes sudden anterograde amnesia (repetitive questioning) lasting up to 24 hours, with preserved personal identity and no other focal signs. It is often triggered by exertion, emotion or cold water, and usually resolves completely. It does not need TIA workup if typical. Recurrence is uncommon.', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v3')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = 'cab795c4-485c-52b0-aa9a-0f1cb20fba0d';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('c3842383-9095-51ef-9c7b-3f90bc34783b', 'cab795c4-485c-52b0-aa9a-0f1cb20fba0d', 'A', 'Korsakoff syndrome', false, 0),
  ('7a4bf411-8992-59c8-9f4a-de102eb27920', 'cab795c4-485c-52b0-aa9a-0f1cb20fba0d', 'B', 'Transient global amnesia', true, 1),
  ('02d0d4aa-ab44-55f2-93e5-8428426e5e71', 'cab795c4-485c-52b0-aa9a-0f1cb20fba0d', 'C', 'Transient ischaemic attack', false, 2),
  ('4382cff3-57e2-543e-9d9d-b88e1bd9b016', 'cab795c4-485c-52b0-aa9a-0f1cb20fba0d', 'D', 'Focal seizure', false, 3),
  ('db1c2e78-fdd3-59c2-8f54-1a1caf8b941c', 'cab795c4-485c-52b0-aa9a-0f1cb20fba0d', 'E', 'Dissociative amnesia', false, 4);

-- Q37
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('adf03db1-a62a-58cd-991e-6dc89c83bea7', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000006', 'sba', 'A 40 year old woman with multiple sclerosis has painful spasms and stiffness in her legs that disturb her sleep. Physiotherapy has helped only partly. What is the SINGLE most appropriate first-line drug?', 'NICE NG220 recommends baclofen or gabapentin as first-line for spasticity in MS, with tizanidine or dantrolene as second-line, after exercise and physiotherapy. Cannabis-based products (nabiximols) can be tried if these fail. Address triggers such as infection, constipation and pressure sores.', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v3')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = 'adf03db1-a62a-58cd-991e-6dc89c83bea7';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('d39d1e9b-ed35-5d83-bd0e-caa76d68a2e6', 'adf03db1-a62a-58cd-991e-6dc89c83bea7', 'A', 'Amitriptyline', false, 0),
  ('4a30dab4-23b5-58e1-af57-4ebbcb232f6f', 'adf03db1-a62a-58cd-991e-6dc89c83bea7', 'B', 'Carbamazepine', false, 1),
  ('ddd88019-e924-5f59-89c3-fc8f8e693e50', 'adf03db1-a62a-58cd-991e-6dc89c83bea7', 'C', 'Baclofen (or gabapentin)', true, 2),
  ('e5d102d0-3ec9-5105-a4e7-558e29530916', 'adf03db1-a62a-58cd-991e-6dc89c83bea7', 'D', 'Levodopa', false, 3),
  ('cca853da-fa9b-5322-a845-7f5fc691f031', 'adf03db1-a62a-58cd-991e-6dc89c83bea7', 'E', 'Diazepam as first-line long-term', false, 4);

-- Q38
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('fecf5c0e-450e-5183-a3a8-2532da5133a2', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000006', 'sba', 'A 42 year old woman takes a dopamine agonist (ropinirole) for Parkinson''s disease. Her husband reports that she has started gambling large amounts online and shopping compulsively. What is the SINGLE most appropriate action?', 'Impulse control disorders (gambling, hypersexuality, binge eating, compulsive shopping) are well-known side effects of dopamine agonists. Patients and carers must be warned before starting. Management is to reduce or withdraw the agonist (watch for dopamine agonist withdrawal syndrome) and adjust other treatment.', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v3')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = 'fecf5c0e-450e-5183-a3a8-2532da5133a2';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('74aef185-3cbc-573d-887d-9255c08c2450', 'fecf5c0e-450e-5183-a3a8-2532da5133a2', 'A', 'Discuss with the patient and reduce or stop the dopamine agonist under specialist guidance', true, 0),
  ('a80a9dab-b512-5fe6-916e-5036dfd99ca0', 'fecf5c0e-450e-5183-a3a8-2532da5133a2', 'B', 'Increase the dose of ropinirole', false, 1),
  ('29a1d193-b2a4-550b-ad35-812e78eb06e1', 'fecf5c0e-450e-5183-a3a8-2532da5133a2', 'C', 'Add levodopa and continue ropinirole at the same dose', false, 2),
  ('05c7a0ba-80e8-54d4-8ab1-f935eab4d25a', 'fecf5c0e-450e-5183-a3a8-2532da5133a2', 'D', 'Add an antipsychotic', false, 3),
  ('3522b48a-caa4-5b7a-b6d0-7d58b7be25b4', 'fecf5c0e-450e-5183-a3a8-2532da5133a2', 'E', 'Ignore it as unrelated', false, 4);

-- Q39
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('b67caa43-ec21-5ee2-95b1-bf50d8317d36', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000006', 'sba', 'A 70 year old man with Parkinson''s disease has been admitted with vomiting and his oral levodopa has been missed for 24 hours. He is now rigid and very stiff. Which is the MOST appropriate way to give dopaminergic therapy?', 'Missing Parkinson''s medication can cause severe rigidity, aspiration and a neuroleptic malignant-like syndrome. If the patient cannot take oral medicine, use a rotigotine patch (or dispersible levodopa via NG tube). Avoid dopamine antagonists such as metoclopramide and haloperidol. Domperidone is the antiemetic of choice (check QT).', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v3')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = 'b67caa43-ec21-5ee2-95b1-bf50d8317d36';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('41e97a03-523c-539e-a5a2-dd82c577ac20', 'b67caa43-ec21-5ee2-95b1-bf50d8317d36', 'A', 'IV levodopa', false, 0),
  ('e7f89a5d-b8fa-51b8-977e-3779f46ba4cf', 'b67caa43-ec21-5ee2-95b1-bf50d8317d36', 'B', 'Metoclopramide for the vomiting', false, 1),
  ('689c48b9-b631-585f-a5a7-e8e8ffebaad2', 'b67caa43-ec21-5ee2-95b1-bf50d8317d36', 'C', 'IM haloperidol', false, 2),
  ('982dc1b7-fd0d-55e6-be38-89d8c7e90de7', 'b67caa43-ec21-5ee2-95b1-bf50d8317d36', 'D', 'Wait until he can swallow again', false, 3),
  ('665e7ed7-d24d-540b-a674-9099a0994452', 'b67caa43-ec21-5ee2-95b1-bf50d8317d36', 'E', 'A transdermal rotigotine patch (dose calculated from his oral regime)', true, 4);

-- Q40
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('38431efb-dc8c-5c23-b09d-1f57311d4be7', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000006', 'sba', 'A 26 year old woman has had a tension-type headache: a bilateral tight band around her head on most days for 3 months, without nausea or photophobia. She is not overusing analgesia. What is the SINGLE most appropriate preventive treatment if needed?', 'Tension-type headache is bilateral, pressing or tightening, mild-moderate, and not worsened by routine activity. Acute treatment is aspirin, paracetamol or an NSAID (avoid opioids). For prevention of chronic tension-type headache, NICE suggests acupuncture (up to 10 sessions over 5-8 weeks). Low-dose amitriptyline is commonly used in practice.', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v3')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = '38431efb-dc8c-5c23-b09d-1f57311d4be7';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('a8ffb4f3-5ed1-55e1-a497-280e6c616971', '38431efb-dc8c-5c23-b09d-1f57311d4be7', 'A', 'Codeine daily', false, 0),
  ('689165b8-3d0d-555f-a9f3-503eebc39eb9', '38431efb-dc8c-5c23-b09d-1f57311d4be7', 'B', 'Propranolol', false, 1),
  ('cef066da-c575-590b-b5f8-1fa83d2ddf8f', '38431efb-dc8c-5c23-b09d-1f57311d4be7', 'C', 'Sumatriptan daily', false, 2),
  ('8c8c76e4-27b3-55c4-94ff-a1408539a76c', '38431efb-dc8c-5c23-b09d-1f57311d4be7', 'D', 'Topiramate', false, 3),
  ('75256695-9c16-5d4f-b41e-3c205e635ceb', '38431efb-dc8c-5c23-b09d-1f57311d4be7', 'E', 'A course of up to 10 sessions of acupuncture (NICE), with lifestyle advice', true, 4);

-- Q41
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('0e81c76e-c6b5-5dd6-a811-6c814c593d45', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000006', 'sba', 'A 30 year old woman has migraine attacks only around her period, which do not respond to acute treatment. Her periods are regular. Which preventive option is MOST appropriate?', 'For predictable menstrual-related migraine not controlled by acute treatment, NICE suggests frovatriptan or zolmitriptan taken from 2 days before until 3 days after bleeding starts. Continuous hormonal contraception (without a break) is another option if there is no migraine with aura.', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v3')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = '0e81c76e-c6b5-5dd6-a811-6c814c593d45';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('e8176687-b72f-5638-bc12-ae13f8183a31', '0e81c76e-c6b5-5dd6-a811-6c814c593d45', 'A', 'Daily high-dose aspirin', false, 0),
  ('ce5f806d-1341-56c1-a4ba-2a9519db1809', '0e81c76e-c6b5-5dd6-a811-6c814c593d45', 'B', 'Frovatriptan (or zolmitriptan) taken perimenstrually', true, 1),
  ('a1b7692c-2627-5817-939e-a5a099a69d0d', '0e81c76e-c6b5-5dd6-a811-6c814c593d45', 'C', 'Combined pill with oestrogen-free interval', false, 2),
  ('704b9e60-8602-5ff5-9a40-58a47563d971', '0e81c76e-c6b5-5dd6-a811-6c814c593d45', 'D', 'Codeine around her period', false, 3),
  ('c5373d70-1f13-54b5-bc59-15091bbb37b0', '0e81c76e-c6b5-5dd6-a811-6c814c593d45', 'E', 'Pizotifen long-term', false, 4);

-- Q42
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('51d49fc2-83c1-53a5-82cc-1fb8280e16b7', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000001', 'sba', 'A 66 year old man has palpitations. His ECG shows a regular broad-complex tachycardia at 170 bpm. He is alert, BP 124/78 mmHg, with no chest pain or heart failure. What is the SINGLE most appropriate treatment?', 'A broad-complex tachycardia should be treated as VT unless proven otherwise. In a stable patient with no adverse features (shock, syncope, myocardial ischaemia, heart failure), give IV amiodarone 300 mg over 10-60 minutes. If adverse features develop, use synchronised DC cardioversion. Verapamil can cause cardiovascular collapse in VT.', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v3')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = '51d49fc2-83c1-53a5-82cc-1fb8280e16b7';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('12f725fa-cbf8-511a-ba46-a66684739df4', '51d49fc2-83c1-53a5-82cc-1fb8280e16b7', 'A', 'Immediate unsynchronised defibrillation', false, 0),
  ('c3cb7f8a-c79c-528e-a57b-a8b34a6af4ec', '51d49fc2-83c1-53a5-82cc-1fb8280e16b7', 'B', 'IV adenosine as first-line in all broad-complex tachycardias', false, 1),
  ('84707f42-29c1-5965-abfc-214a6dc728fd', '51d49fc2-83c1-53a5-82cc-1fb8280e16b7', 'C', 'IV amiodarone 300 mg over 10-60 minutes', true, 2),
  ('ac92a998-227c-5c02-89ce-1b9c526c08ce', '51d49fc2-83c1-53a5-82cc-1fb8280e16b7', 'D', 'IV verapamil', false, 3),
  ('5cd6a022-0021-5d51-a7cb-0635cc2f9623', '51d49fc2-83c1-53a5-82cc-1fb8280e16b7', 'E', 'Oral bisoprolol and discharge', false, 4);

-- Q43
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('9eba639f-0f0e-5c8a-8390-b0a8dd920994', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000001', 'sba', 'A 70 year old woman has a broad-complex tachycardia with a QRS axis that twists around the baseline. Her QT interval before the episode was 560 ms. She takes clarithromycin and citalopram. What is the SINGLE most appropriate drug treatment?', 'This is torsades de pointes (polymorphic VT with a long QT). Give IV magnesium sulfate, correct hypokalaemia and hypomagnesaemia, and stop QT-prolonging drugs (macrolides, SSRIs, antipsychotics, antiarrhythmics). Overdrive pacing or isoprenaline can be used. Amiodarone prolongs QT and should be avoided.', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v3')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = '9eba639f-0f0e-5c8a-8390-b0a8dd920994';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('5513d48b-f0b7-562d-82e7-b1672775ed60', '9eba639f-0f0e-5c8a-8390-b0a8dd920994', 'A', 'IV adenosine', false, 0),
  ('70714605-2cdd-59de-9fc8-c095ca3afc93', '9eba639f-0f0e-5c8a-8390-b0a8dd920994', 'B', 'IV flecainide', false, 1),
  ('9034cde8-6955-50da-8a91-0dbca6c0b160', '9eba639f-0f0e-5c8a-8390-b0a8dd920994', 'C', 'Oral sotalol', false, 2),
  ('5871b67c-1e3b-5bc0-984e-659cba9945cb', '9eba639f-0f0e-5c8a-8390-b0a8dd920994', 'D', 'IV amiodarone', false, 3),
  ('d1704b81-eae4-5c54-a3af-21e22ff8d83e', '9eba639f-0f0e-5c8a-8390-b0a8dd920994', 'E', 'IV magnesium sulfate 2 g', true, 4);

-- Q44
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('c3717f45-d395-5ffd-b8a7-8786c7a812e8', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000001', 'sba', 'A 61 year old man has central chest pain. His ECG shows ST depression and tall R waves in V1-V3, with upright T waves. What is the SINGLE most likely diagnosis?', 'ST depression and tall R waves in V1-V3 are the mirror image of posterior ST elevation. Posterior leads (V7-V9) show ST elevation. Posterior MI is usually due to occlusion of the circumflex or right coronary artery, and is treated as a STEMI (primary PCI).', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v3')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = 'c3717f45-d395-5ffd-b8a7-8786c7a812e8';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('b233cc6c-1536-5677-a725-ac60e13242a9', 'c3717f45-d395-5ffd-b8a7-8786c7a812e8', 'A', 'Right bundle branch block only', false, 0),
  ('df932bc9-4672-53b2-8f5d-2681b990db91', 'c3717f45-d395-5ffd-b8a7-8786c7a812e8', 'B', 'Posterior myocardial infarction', true, 1),
  ('7615e669-9775-5708-ac3a-5f1d85d10716', 'c3717f45-d395-5ffd-b8a7-8786c7a812e8', 'C', 'Pulmonary embolism', false, 2),
  ('a7a5812b-f31a-588c-a954-5b99b73f32ba', 'c3717f45-d395-5ffd-b8a7-8786c7a812e8', 'D', 'Anterior NSTEMI', false, 3),
  ('c1e3347e-522e-52d6-b19e-452e813a8db8', 'c3717f45-d395-5ffd-b8a7-8786c7a812e8', 'E', 'Pericarditis', false, 4);

-- Q45
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('8e08be26-fee1-5c60-bef0-988c74dc68f7', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000001', 'sba', 'A 70 year old man had an anterior MI 2 months ago. His ECG still shows persistent ST elevation in V1-V4, and echo shows a dyskinetic area of the LV wall. What is the SINGLE most likely diagnosis?', 'Persistent ST elevation weeks after an MI suggests a left ventricular aneurysm. Complications include heart failure, ventricular arrhythmias and mural thrombus (embolism), so anticoagulation may be considered. Echocardiography confirms it.', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v3')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = '8e08be26-fee1-5c60-bef0-988c74dc68f7';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('3295b7ff-eb13-56b8-8731-3c4ff489f04b', '8e08be26-fee1-5c60-bef0-988c74dc68f7', 'A', 'Brugada syndrome', false, 0),
  ('65179223-2ca7-5f11-9c2e-217da552e3a8', '8e08be26-fee1-5c60-bef0-988c74dc68f7', 'B', 'Pericarditis', false, 1),
  ('c469db9d-8fbd-5b35-a307-603da682864c', '8e08be26-fee1-5c60-bef0-988c74dc68f7', 'C', 'Left ventricular aneurysm', true, 2),
  ('24b5e240-b865-5cf0-add3-111d56783a1c', '8e08be26-fee1-5c60-bef0-988c74dc68f7', 'D', 'Acute re-infarction', false, 3),
  ('a1abd9ef-69b7-5702-bcff-604404192d5a', '8e08be26-fee1-5c60-bef0-988c74dc68f7', 'E', 'Early repolarisation', false, 4);

-- Q46
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('55474cfc-6a79-5381-99b2-97a16ed23c14', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000001', 'sba', 'A 45 year old car driver (Group 1 licence) has had an uncomplicated NSTEMI treated with successful PCI. When can he drive again according to DVLA guidance?', 'DVLA Group 1: after ACS successfully treated by angioplasty, the patient can drive after 1 week if LVEF is at least 40% and there is no other disqualifying condition. Otherwise they must wait 4 weeks. The DVLA does not need to be told for Group 1 drivers after ACS. Group 2 drivers must stop for at least 6 weeks and notify the DVLA.', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v3')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = '55474cfc-6a79-5381-99b2-97a16ed23c14';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('0d9d1733-89da-5f78-889a-f47c58fcc64c', '55474cfc-6a79-5381-99b2-97a16ed23c14', 'A', 'Never', false, 0),
  ('b957fdfc-fd04-579f-a8db-0f2f71450081', '55474cfc-6a79-5381-99b2-97a16ed23c14', 'B', 'After 3 months in all cases', false, 1),
  ('f32d7ba6-bda7-5e41-b4a1-22ce850d3bd1', '55474cfc-6a79-5381-99b2-97a16ed23c14', 'C', 'Immediately on discharge', false, 2),
  ('6adfe211-dbe2-52e1-92c9-81378f9a3e32', '55474cfc-6a79-5381-99b2-97a16ed23c14', 'D', 'After 6 months', false, 3),
  ('8e116add-45e6-5c79-abe8-b786f45e03bc', '55474cfc-6a79-5381-99b2-97a16ed23c14', 'E', 'After 1 week if successfully treated by angioplasty with LVEF at least 40% and no other disqualifying condition', true, 4);

-- Q47
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('a9b1294c-837b-520b-8ab7-43e53c04017b', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000001', 'sba', 'A 38 year old man had a cardiac arrest from ventricular fibrillation that was not caused by an acute MI or other reversible cause. He has now recovered. What is the SINGLE most appropriate treatment to prevent sudden death?', 'Survivors of VF or haemodynamically unstable VT without a reversible cause should have an ICD for secondary prevention. ICDs are also used for primary prevention in some patients with LVEF of 35% or less, and in inherited conditions (HCM, long QT, Brugada) with high-risk features.', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v3')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = 'a9b1294c-837b-520b-8ab7-43e53c04017b';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('bb5e2369-0884-5f23-a281-b49506350038', 'a9b1294c-837b-520b-8ab7-43e53c04017b', 'A', 'A permanent pacemaker', false, 0),
  ('a31e7919-6f9f-5433-92f3-c7390e3b4d88', 'a9b1294c-837b-520b-8ab7-43e53c04017b', 'B', 'Implantable cardioverter-defibrillator (ICD)', true, 1),
  ('66ba1455-0fb4-5509-911f-91364b65ea8b', 'a9b1294c-837b-520b-8ab7-43e53c04017b', 'C', 'Lifelong amiodarone alone', false, 2),
  ('60d2272f-b1ee-5804-8a1d-aad5b78deb24', 'a9b1294c-837b-520b-8ab7-43e53c04017b', 'D', 'Catheter ablation of the AV node', false, 3),
  ('1a9bb374-1d68-5768-9e5e-b6a588864607', 'a9b1294c-837b-520b-8ab7-43e53c04017b', 'E', 'Aspirin and a statin only', false, 4);

-- Q48
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('fa17f95f-8040-52ea-8c42-cf6c0784a47b', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000001', 'sba', 'A 35 year old man had a syncope after a fever. His ECG shows a coved ST elevation in V1-V2 with right bundle branch block morphology. His brother died suddenly at 30. What is the SINGLE most likely diagnosis?', 'Brugada syndrome is an inherited sodium channelopathy (often SCN5A, autosomal dominant), more common in men and in South-East Asia. It causes coved ST elevation in V1-V3, which can be unmasked by fever or ajmaline/flecainide. It carries a risk of VF and sudden death. Treat fever promptly, avoid certain drugs, and give an ICD to high-risk patients.', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v3')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = 'fa17f95f-8040-52ea-8c42-cf6c0784a47b';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('33f194ce-c6d8-57eb-898f-bdeda0b00aab', 'fa17f95f-8040-52ea-8c42-cf6c0784a47b', 'A', 'Hypertrophic cardiomyopathy', false, 0),
  ('2f544d17-a2ca-51bc-a988-6046d0b35b5a', 'fa17f95f-8040-52ea-8c42-cf6c0784a47b', 'B', 'Wolff-Parkinson-White syndrome', false, 1),
  ('8bb9ace6-120e-5862-93d7-c96746e8e368', 'fa17f95f-8040-52ea-8c42-cf6c0784a47b', 'C', 'Arrhythmogenic right ventricular cardiomyopathy', false, 2),
  ('6ea53f41-2abf-5663-bf89-6a3708e91452', 'fa17f95f-8040-52ea-8c42-cf6c0784a47b', 'D', 'Brugada syndrome', true, 3),
  ('24b7cc51-a618-5621-bb49-ed4e5febb5d9', 'fa17f95f-8040-52ea-8c42-cf6c0784a47b', 'E', 'Long QT syndrome', false, 4);

-- Q49
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('59921154-1b7a-50ff-8dc7-83e508027e22', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000001', 'sba', 'A 55 year old man has clinic BP of 150/95 mmHg. Ambulatory BP monitoring shows a daytime average of 142/88 mmHg. He has no target organ damage, no CVD, no diabetes, and a QRISK3 of 6%. What is the SINGLE most appropriate step?', 'NICE NG136: stage 1 hypertension is clinic BP 140/90 or above with ABPM daytime average 135/85 or above. Offer drugs if under 80 with target organ damage, CVD, renal disease, diabetes or QRISK of 10% or more. Consider drugs for under 60s with QRISK under 10%. Stage 2 hypertension is ABPM 150/95 or above, and drugs are offered to all.', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v3')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = '59921154-1b7a-50ff-8dc7-83e508027e22';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('4015ad0e-66ed-544a-bd1c-07f1925c86b6', '59921154-1b7a-50ff-8dc7-83e508027e22', 'A', 'Diagnose stage 2 hypertension and start two drugs', false, 0),
  ('e44e7c8e-7865-530b-aa8a-f27ff04a8dab', '59921154-1b7a-50ff-8dc7-83e508027e22', 'B', 'Admit for IV antihypertensives', false, 1),
  ('b6c599c8-7cc0-5e6c-98c4-51f87af06f0d', '59921154-1b7a-50ff-8dc7-83e508027e22', 'C', 'No diagnosis of hypertension', false, 2),
  ('7bb18715-7040-599f-a469-0238450063f8', '59921154-1b7a-50ff-8dc7-83e508027e22', 'D', 'Diagnose stage 1 hypertension; give lifestyle advice; consider drug treatment after discussion since QRISK is under 10% (NICE)', true, 3),
  ('bae6aeed-4770-5e67-8357-2b8abb981976', '59921154-1b7a-50ff-8dc7-83e508027e22', 'E', 'Repeat ABPM in 6 weeks only', false, 4);

-- Q50
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('9618d9ab-0e5c-555f-b003-42a2d56c2f85', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000001', 'sba', 'A 58 year old woman started ramipril for hypertension 6 weeks ago. Her BP is controlled, but she has a persistent dry tickly cough. What is the SINGLE most appropriate change?', 'ACE inhibitors cause a dry cough in about 10% of people because bradykinin builds up. ARBs do not affect bradykinin and are the standard alternative. Switching to another ACE inhibitor does not help. ACE inhibitors can also cause angioedema, which is rare but serious.', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v3')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = '9618d9ab-0e5c-555f-b003-42a2d56c2f85';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('e62fd4c1-a1a8-58e1-970f-a5c7cf5c8cf0', '9618d9ab-0e5c-555f-b003-42a2d56c2f85', 'A', 'Stop all antihypertensives', false, 0),
  ('3e42472f-7573-5edb-afca-e1ff6760d8c6', '9618d9ab-0e5c-555f-b003-42a2d56c2f85', 'B', 'Add a beta-blocker', false, 1),
  ('b530285c-6c3c-5950-a895-d8eb0789f912', '9618d9ab-0e5c-555f-b003-42a2d56c2f85', 'C', 'Add codeine linctus', false, 2),
  ('565a145f-24e9-5e67-a082-7a26cc607db2', '9618d9ab-0e5c-555f-b003-42a2d56c2f85', 'D', 'Switch ramipril to an angiotensin receptor blocker (e.g. losartan)', true, 3),
  ('70c03811-e439-5f27-a122-68a26aff3a09', '9618d9ab-0e5c-555f-b003-42a2d56c2f85', 'E', 'Switch to a different ACE inhibitor', false, 4);

-- Q51
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('e1e744c8-399e-5176-a818-2f8502030112', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000001', 'sba', 'A 76 year old woman has heart failure with preserved ejection fraction (EF 58%). She has ankle oedema and is breathless on exertion. What is the SINGLE most appropriate drug to improve her symptoms?', 'In HFpEF, loop diuretics relieve congestion. SGLT2 inhibitors (empagliflozin, dapagliflozin) reduce hospitalisation and are now recommended. Manage comorbidities (hypertension, AF, obesity). The prognostic drugs for HFrEF have not shown the same benefit in HFpEF.', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v3')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = 'e1e744c8-399e-5176-a818-2f8502030112';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('2017e671-ab48-5c06-b88f-4e2a34827894', 'e1e744c8-399e-5176-a818-2f8502030112', 'A', 'A loop diuretic, with an SGLT2 inhibitor (e.g. empagliflozin) also recommended', true, 0),
  ('985a2a09-a6ef-5845-b8e5-01da89eda4f8', 'e1e744c8-399e-5176-a818-2f8502030112', 'B', 'Digoxin alone', false, 1),
  ('1b6d23f1-07c4-51b0-9be7-5835ecbcde56', 'e1e744c8-399e-5176-a818-2f8502030112', 'C', 'Bisoprolol alone', false, 2),
  ('4d4e453f-dc39-54fe-953b-81b419cefea2', 'e1e744c8-399e-5176-a818-2f8502030112', 'D', 'Sacubitril-valsartan as first-line in all', false, 3),
  ('3abc6ebd-7408-5045-9170-50715a44b9d3', 'e1e744c8-399e-5176-a818-2f8502030112', 'E', 'Ivabradine', false, 4);

-- Q52
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('4af43147-abfc-5191-b11d-db3339fbc3ea', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000001', 'sba', 'A 68 year old man with HFrEF (EF 30%) remains symptomatic on maximal ramipril and bisoprolol. His potassium is 4.4 mmol/L and eGFR 55. What is the SINGLE most appropriate addition?', 'NICE NG106: add an MRA if symptoms continue on an ACE inhibitor/ARB and beta-blocker, and also add an SGLT2 inhibitor. Monitor potassium and renal function (risk of hyperkalaemia). Further options under specialist guidance: replace the ACE inhibitor with sacubitril-valsartan, ivabradine, hydralazine with nitrate (especially in Black African/Caribbean people), digoxin, or cardiac resynchronisation therapy.', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v3')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = '4af43147-abfc-5191-b11d-db3339fbc3ea';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('3511dc9e-beb3-5ee3-9fe4-9607ac5cd72c', '4af43147-abfc-5191-b11d-db3339fbc3ea', 'A', 'Hydralazine as first add-on in all', false, 0),
  ('45ec6d66-235d-5762-8256-9a49d6311a34', '4af43147-abfc-5191-b11d-db3339fbc3ea', 'B', 'Amlodipine', false, 1),
  ('8c8b545b-e9cd-5b0c-af7f-1f8a35d41c8d', '4af43147-abfc-5191-b11d-db3339fbc3ea', 'C', 'NSAID for comfort', false, 2),
  ('f310e279-4857-5877-9263-26b54a2d3e5f', '4af43147-abfc-5191-b11d-db3339fbc3ea', 'D', 'Diltiazem', false, 3),
  ('5d104362-47db-58c2-b340-26234ea43a8d', '4af43147-abfc-5191-b11d-db3339fbc3ea', 'E', 'A mineralocorticoid receptor antagonist (e.g. spironolactone), with potassium and renal monitoring', true, 4);

-- Q53
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('8529021c-fa30-5c2f-89c4-fa8496d509a2', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000001', 'sba', 'A 62 year old man with HFrEF (EF 30%) has been on optimal medical therapy for 3 months. His ECG shows sinus rhythm with left bundle branch block and a QRS duration of 160 ms. He remains in NYHA class III. What is the SINGLE most appropriate intervention?', 'CRT is indicated for HFrEF (EF 35% or less) with a wide QRS (especially LBBB 150 ms or more) and persistent symptoms despite optimal medical therapy. It improves symptoms and survival. CRT-D adds defibrillator protection for those at risk of sudden death.', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v3')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = '8529021c-fa30-5c2f-89c4-fa8496d509a2';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('a6c763cd-3e2f-5e52-877d-9f1dc3871402', '8529021c-fa30-5c2f-89c4-fa8496d509a2', 'A', 'Heart transplant immediately', false, 0),
  ('077a1381-e03a-584d-af00-9ecdd97d6b9a', '8529021c-fa30-5c2f-89c4-fa8496d509a2', 'B', 'Cardiac resynchronisation therapy (biventricular pacing, often with a defibrillator, CRT-D)', true, 1),
  ('4d2d34ab-3f45-54a9-97a7-6c8009606b6a', '8529021c-fa30-5c2f-89c4-fa8496d509a2', 'C', 'Coronary angiography only', false, 2),
  ('55f16dab-06b7-5c7f-8d8d-b9c274721eb3', '8529021c-fa30-5c2f-89c4-fa8496d509a2', 'D', 'Single-chamber pacemaker only', false, 3),
  ('2a7e8ea8-ee85-5f60-9b9c-c50356f2830a', '8529021c-fa30-5c2f-89c4-fa8496d509a2', 'E', 'Stop his beta-blocker', false, 4);

-- Q54
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('e3a1ab5e-35a4-57f0-9d37-2dfbb1e2d022', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000001', 'sba', 'A 25 year old man has fever and sore throat, followed 2 weeks later by fever, migratory polyarthritis of large joints, and a new mitral regurgitation murmur. ASO titre is raised. Which treatment is MOST important to prevent recurrence?', 'Acute rheumatic fever follows group A streptococcal pharyngitis. It is diagnosed with the Jones criteria (evidence of strep infection plus 2 major or 1 major and 2 minor). Major criteria: carditis, polyarthritis, chorea, erythema marginatum, subcutaneous nodules. Treat with antibiotics to eradicate strep and anti-inflammatories. Long-term penicillin prophylaxis prevents recurrences and rheumatic heart disease.', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v3')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = 'e3a1ab5e-35a4-57f0-9d37-2dfbb1e2d022';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('8ba7c6e2-e47c-504d-859e-b45190354bd7', 'e3a1ab5e-35a4-57f0-9d37-2dfbb1e2d022', 'A', 'Colchicine long-term', false, 0),
  ('27d8f828-d0e9-5cd4-a6b1-d4fac8b86c4f', 'e3a1ab5e-35a4-57f0-9d37-2dfbb1e2d022', 'B', 'Annual influenza vaccine only', false, 1),
  ('056aefd8-1f30-574d-b9b4-17ed58dc882d', 'e3a1ab5e-35a4-57f0-9d37-2dfbb1e2d022', 'C', 'Long-term penicillin prophylaxis (secondary prevention)', true, 2),
  ('1b6a171f-a195-505d-8b02-265f9c9ac39d', 'e3a1ab5e-35a4-57f0-9d37-2dfbb1e2d022', 'D', 'Methotrexate', false, 3),
  ('7c151814-4f8b-55f7-b17a-c274c13e47b8', 'e3a1ab5e-35a4-57f0-9d37-2dfbb1e2d022', 'E', 'Long-term warfarin', false, 4);

-- Q55
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('74b1cdb9-e6a8-50cb-9396-ac543f486528', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000001', 'sba', 'A 72 year old man has had a prosthetic aortic valve for 2 months. He now has fever and a new regurgitant murmur. Which organism is MOST likely?', 'In early prosthetic valve endocarditis (within about 2 months of surgery), coagulase-negative staphylococci (S. epidermidis) and S. aureus are the commonest causes. Late prosthetic valve endocarditis resembles native valve disease. People who inject drugs typically get S. aureus on the tricuspid valve. Strep bovis (gallolyticus) needs colonoscopy to look for colorectal cancer.', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v3')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = '74b1cdb9-e6a8-50cb-9396-ac543f486528';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('dbf46c05-f78e-5209-838b-024d9b08e0fb', '74b1cdb9-e6a8-50cb-9396-ac543f486528', 'A', 'Staphylococcus epidermidis (coagulase-negative staphylococci)', true, 0),
  ('c0dae380-a397-5cb6-8be8-44b7f83771a7', '74b1cdb9-e6a8-50cb-9396-ac543f486528', 'B', 'Streptococcus bovis', false, 1),
  ('14ee8849-d324-5853-b914-c1eb8a82d8ca', '74b1cdb9-e6a8-50cb-9396-ac543f486528', 'C', 'Enterococcus faecalis', false, 2),
  ('039f2618-efca-55a7-9ec0-a32665567ed4', '74b1cdb9-e6a8-50cb-9396-ac543f486528', 'D', 'Streptococcus viridans', false, 3),
  ('0fb4aefa-2f80-5f26-9323-c96dd1a39cf3', '74b1cdb9-e6a8-50cb-9396-ac543f486528', 'E', 'Candida albicans', false, 4);

-- Q56
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('e58adf30-12e0-5e53-a174-fb90f6a9f5c8', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000001', 'sba', 'A 68 year old man has infective endocarditis. Blood cultures grow Streptococcus gallolyticus (bovis). What other investigation is MOST important?', 'Streptococcus gallolyticus (formerly S. bovis biotype I) bacteraemia or endocarditis is strongly associated with colorectal neoplasia, so colonoscopy is recommended. It is also linked to liver disease.', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v3')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = 'e58adf30-12e0-5e53-a174-fb90f6a9f5c8';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('68e88e68-39cf-5789-931e-a4d6b29097cd', 'e58adf30-12e0-5e53-a174-fb90f6a9f5c8', 'A', 'Bronchoscopy', false, 0),
  ('99e5a5f8-0414-5201-a545-836bacbd49be', 'e58adf30-12e0-5e53-a174-fb90f6a9f5c8', 'B', 'Bone marrow biopsy', false, 1),
  ('18278269-46b9-5146-a648-db9a907da9a9', 'e58adf30-12e0-5e53-a174-fb90f6a9f5c8', 'C', 'Upper GI endoscopy only', false, 2),
  ('f984e4a6-c541-54ff-931d-e1cd38cae8be', 'e58adf30-12e0-5e53-a174-fb90f6a9f5c8', 'D', 'Colonoscopy', true, 3),
  ('07a5b960-dcf6-5217-93c6-5e3caa58dcfc', 'e58adf30-12e0-5e53-a174-fb90f6a9f5c8', 'E', 'Renal ultrasound', false, 4);

-- Q57
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('c76d79d9-d346-543e-a048-4b0aa4567722', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000001', 'sba', 'A 22 year old woman with a bicuspid aortic valve is having a dental extraction. She has no history of endocarditis. What is the SINGLE most appropriate advice about antibiotic prophylaxis?', 'NICE CG64 does not recommend routine antibiotic prophylaxis against endocarditis for dental or other procedures in people at risk. Emphasise oral hygiene, and seek advice promptly for symptoms of infection. Practice differs internationally for the highest-risk groups (such as prosthetic valves or previous endocarditis).', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v3')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = 'c76d79d9-d346-543e-a048-4b0aa4567722';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('aa6c61f3-0896-544f-9d20-80ce73e218de', 'c76d79d9-d346-543e-a048-4b0aa4567722', 'A', 'IV vancomycin before the procedure', false, 0),
  ('64fe5247-30f5-5368-9858-07c8f08af401', 'c76d79d9-d346-543e-a048-4b0aa4567722', 'B', 'Antibiotic prophylaxis is not routinely recommended; maintain good oral hygiene', true, 1),
  ('ef1afb93-ae52-5295-9147-194fda78fd9d', 'c76d79d9-d346-543e-a048-4b0aa4567722', 'C', 'Amoxicillin 3 g before the procedure', false, 2),
  ('ae3c5810-0f81-5a62-92df-77da2d48a280', 'c76d79d9-d346-543e-a048-4b0aa4567722', 'D', 'Chlorhexidine mouthwash is mandatory', false, 3),
  ('e1431cbf-84fc-515c-8d76-5a43fdd076be', 'c76d79d9-d346-543e-a048-4b0aa4567722', 'E', 'Postpone dental work indefinitely', false, 4);

-- Q58
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('a2b1119d-2a65-56bc-a05f-6b333be402e3', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000001', 'sba', 'A 56 year old woman has breathlessness and ankle swelling. JVP rises on inspiration (Kussmaul''s sign), and there is a pericardial knock. She had TB pericarditis years ago. CT shows pericardial calcification. What is the SINGLE most likely diagnosis?', 'Constrictive pericarditis is caused by a thickened, fibrotic or calcified pericardium (from TB, previous surgery, radiotherapy, viral infection). It causes right heart failure, Kussmaul''s sign, a pericardial knock and a steep y descent. Pericardiectomy is the definitive treatment. Tamponade gives pulsus paradoxus and Beck''s triad (hypotension, raised JVP, muffled heart sounds).', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v3')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = 'a2b1119d-2a65-56bc-a05f-6b333be402e3';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('1f9ccd84-cc8b-5322-9d7f-dc1b9942088a', 'a2b1119d-2a65-56bc-a05f-6b333be402e3', 'A', 'Restrictive cardiomyopathy only', false, 0),
  ('fa72202a-bbce-57ab-995d-9657255b8d59', 'a2b1119d-2a65-56bc-a05f-6b333be402e3', 'B', 'Tricuspid stenosis', false, 1),
  ('9ac9ee83-3085-5699-a6fd-c95e42894f2c', 'a2b1119d-2a65-56bc-a05f-6b333be402e3', 'C', 'Right ventricular infarction', false, 2),
  ('b41fbd2f-30d2-56f1-82bd-29a39e41caf9', 'a2b1119d-2a65-56bc-a05f-6b333be402e3', 'D', 'Cardiac tamponade', false, 3),
  ('ef58fd7b-7a02-5dc1-a2d1-c36333fd4e83', 'a2b1119d-2a65-56bc-a05f-6b333be402e3', 'E', 'Constrictive pericarditis', true, 4);

-- Q59
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('5e7e5710-891d-5e3a-b1bc-6e7b345a6da3', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000001', 'sba', 'A 66 year old man has sudden tearing chest pain radiating to his back. CT angiography shows a dissection involving the ascending aorta. His BP is 170/100 mmHg in both arms. What is the SINGLE most appropriate management?', 'Stanford type A dissection (involving the ascending aorta) needs emergency surgery because of the risk of rupture, tamponade, aortic regurgitation and coronary occlusion. Control BP (systolic target 100-120 mmHg) and heart rate with IV beta-blockers first. Type B (descending only) is usually managed medically unless complicated.', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v3')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = '5e7e5710-891d-5e3a-b1bc-6e7b345a6da3';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('ddc7855b-06aa-5bc7-b694-f0e2da99e5e1', '5e7e5710-891d-5e3a-b1bc-6e7b345a6da3', 'A', 'Primary PCI', false, 0),
  ('98c0e61a-c94b-5bc5-a3d6-81a805446d89', '5e7e5710-891d-5e3a-b1bc-6e7b345a6da3', 'B', 'IV beta-blocker (e.g. labetalol) to control BP and heart rate, and emergency cardiothoracic surgery', true, 1),
  ('c5bd6627-13f5-5143-810c-4ba28c1bd41e', '5e7e5710-891d-5e3a-b1bc-6e7b345a6da3', 'C', 'Endovascular repair of the descending aorta only', false, 2),
  ('4212927b-bfa9-580a-bf09-0f591574dfea', '5e7e5710-891d-5e3a-b1bc-6e7b345a6da3', 'D', 'Medical management alone with oral antihypertensives', false, 3),
  ('e472e03b-e316-5e88-9ed6-fc91e92e7841', '5e7e5710-891d-5e3a-b1bc-6e7b345a6da3', 'E', 'Thrombolysis', false, 4);

-- Q60
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('acda2a77-0576-5309-bb78-05543b8e4ce8', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000001', 'sba', 'A 45 year old woman has a pansystolic murmur at the apex radiating to the axilla, with a soft first heart sound. Echo shows severe primary mitral regurgitation with reduced LVEF of 55% and an enlarging LV. She is breathless. What is the SINGLE most appropriate management?', 'Severe primary mitral regurgitation with symptoms, or with LV dysfunction (LVEF 60% or less or LV dilatation) without symptoms, is an indication for surgery. Repair is preferred to replacement when possible. Percutaneous edge-to-edge repair (MitraClip) is an option for high-risk patients. Diuretics help symptoms.', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v3')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = 'acda2a77-0576-5309-bb78-05543b8e4ce8';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('4144c908-da4b-5a0d-919e-511b79ad07cf', 'acda2a77-0576-5309-bb78-05543b8e4ce8', 'A', 'Refer for mitral valve repair (surgery)', true, 0),
  ('129993c1-a099-54f5-a389-2f1b50dd5ef7', 'acda2a77-0576-5309-bb78-05543b8e4ce8', 'B', 'Mitral valvotomy', false, 1),
  ('813fde30-ffd5-53e6-82d0-a7e5d7490661', 'acda2a77-0576-5309-bb78-05543b8e4ce8', 'C', 'Start digoxin only', false, 2),
  ('e46241c3-7fdc-542c-8450-4c402461c9b7', 'acda2a77-0576-5309-bb78-05543b8e4ce8', 'D', 'Watchful waiting for 5 years', false, 3),
  ('0845210f-2ebd-5ef1-abfd-84deb31a4d5c', 'acda2a77-0576-5309-bb78-05543b8e4ce8', 'E', 'Antibiotic prophylaxis only', false, 4);

-- Q61
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('d633148f-0278-5ebc-a7ba-005215c612d8', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000001', 'sba', 'A 25 year old thin woman has a mid-systolic click followed by a late systolic murmur at the apex. She has occasional palpitations. Echo confirms the diagnosis with mild regurgitation. What is the SINGLE most likely diagnosis?', 'Mitral valve prolapse causes a mid-systolic click and a late systolic murmur. It is common, usually benign, and associated with connective tissue disorders (Marfan, Ehlers-Danlos). Most patients need reassurance only. Complications include mitral regurgitation, arrhythmias and endocarditis (rare).', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v3')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = 'd633148f-0278-5ebc-a7ba-005215c612d8';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('24c6caef-5622-5359-b6b3-ee77770a1f0b', 'd633148f-0278-5ebc-a7ba-005215c612d8', 'A', 'Mitral valve prolapse', true, 0),
  ('cdd74160-c923-5c8a-9d60-f377bedaa8c7', 'd633148f-0278-5ebc-a7ba-005215c612d8', 'B', 'Aortic stenosis', false, 1),
  ('181761b2-0bb5-576d-82c7-19f51e91c30e', 'd633148f-0278-5ebc-a7ba-005215c612d8', 'C', 'Mitral stenosis', false, 2),
  ('2ee1c166-b700-5136-87d4-5c6fd2fb8d44', 'd633148f-0278-5ebc-a7ba-005215c612d8', 'D', 'Hypertrophic cardiomyopathy', false, 3),
  ('899a084a-8ecd-5d85-982e-d9859019908c', 'd633148f-0278-5ebc-a7ba-005215c612d8', 'E', 'Ventricular septal defect', false, 4);

-- Q62
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('f9ca2cf0-8098-59c4-be94-dbab0111aad0', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000001', 'sba', 'A 36 year old man who injects drugs has fever, a pansystolic murmur at the left lower sternal edge that increases on inspiration, and giant v waves in the JVP. Chest X-ray shows multiple septic emboli in the lungs. Which valve is MOST likely affected?', 'Right-sided endocarditis in people who inject drugs usually affects the tricuspid valve, commonly with Staphylococcus aureus. Septic pulmonary emboli are typical. Tricuspid regurgitation causes a pansystolic murmur louder on inspiration (Carvallo''s sign), giant v waves and a pulsatile liver.', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v3')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = 'f9ca2cf0-8098-59c4-be94-dbab0111aad0';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('61887056-9982-5834-a38f-2704a45eee51', 'f9ca2cf0-8098-59c4-be94-dbab0111aad0', 'A', 'Pulmonary valve', false, 0),
  ('37067dc3-c972-507d-a8af-708fe1a0c5ff', 'f9ca2cf0-8098-59c4-be94-dbab0111aad0', 'B', 'Prosthetic aortic valve', false, 1),
  ('89fb00a2-9833-5aa2-954d-86a3cc142e96', 'f9ca2cf0-8098-59c4-be94-dbab0111aad0', 'C', 'Mitral valve', false, 2),
  ('86dd8c5f-635b-5bd6-89dd-44d34976e9dd', 'f9ca2cf0-8098-59c4-be94-dbab0111aad0', 'D', 'Aortic valve', false, 3),
  ('4412959a-3781-5fda-802c-4f827045b2c5', 'f9ca2cf0-8098-59c4-be94-dbab0111aad0', 'E', 'Tricuspid valve', true, 4);

-- Q63
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('35b437e2-cfaa-5b5e-8bcc-63b17ca8c3c7', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000001', 'sba', 'A 52 year old man with a large untreated VSD from childhood has central cyanosis, finger clubbing and polycythaemia. Echo shows right-to-left shunting with severe pulmonary hypertension. What is the SINGLE most likely diagnosis?', 'Eisenmenger syndrome happens when a large left-to-right shunt (VSD, ASD, PDA) causes pulmonary hypertension that eventually reverses the shunt, causing cyanosis. The defect can no longer be closed. Pregnancy carries a very high risk of death. Management is pulmonary vasodilators and, in some cases, heart-lung transplant.', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v3')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = '35b437e2-cfaa-5b5e-8bcc-63b17ca8c3c7';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('2caabab6-f022-5ed7-ba18-8b3250ef0bf2', '35b437e2-cfaa-5b5e-8bcc-63b17ca8c3c7', 'A', 'Transposition of the great arteries', false, 0),
  ('4162c4d6-c6b7-5975-9a63-86b80910da3e', '35b437e2-cfaa-5b5e-8bcc-63b17ca8c3c7', 'B', 'Patent foramen ovale', false, 1),
  ('ab5fdc9f-8fa2-5f3a-8934-27db2cb928fa', '35b437e2-cfaa-5b5e-8bcc-63b17ca8c3c7', 'C', 'Eisenmenger syndrome', true, 2),
  ('2c128010-4a1c-5b21-a4a7-ca8335e59fd4', '35b437e2-cfaa-5b5e-8bcc-63b17ca8c3c7', 'D', 'Coarctation of the aorta', false, 3),
  ('7c7296e5-514a-5957-80a5-9a0f350373f0', '35b437e2-cfaa-5b5e-8bcc-63b17ca8c3c7', 'E', 'Tetralogy of Fallot', false, 4);

-- Q64
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('93d57735-7ad4-5a46-bbb4-6aa771e9b6b1', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000001', 'sba', 'A 64 year old man started atorvastatin 80 mg. Six weeks later he has aching muscles in both thighs. His CK is 3 times the upper limit of normal. What is the SINGLE most appropriate management?', 'NICE: if muscle symptoms occur, measure CK. If CK is more than 5 times the upper limit, stop the statin and recheck. If symptoms are troublesome with lower CK, stop and reassess, then consider a lower dose, a different statin or ezetimibe. Check thyroid function (hypothyroidism increases risk). Rhabdomyolysis is rare. Simvastatin interacts with CYP3A4 inhibitors.', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v3')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = '93d57735-7ad4-5a46-bbb4-6aa771e9b6b1';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('0a04ca4e-ca2f-5114-9a86-e08b6a711bce', '93d57735-7ad4-5a46-bbb4-6aa771e9b6b1', 'A', 'Continue at the same dose', false, 0),
  ('a8b23e52-5917-5ca9-aea1-2336b24a2641', '93d57735-7ad4-5a46-bbb4-6aa771e9b6b1', 'B', 'Double the dose', false, 1),
  ('7ebb8635-943c-5223-8b32-c800e459678d', '93d57735-7ad4-5a46-bbb4-6aa771e9b6b1', 'C', 'Stop or reduce the statin temporarily, reassess symptoms and CK, then consider rechallenge at a lower dose or a different statin', true, 2),
  ('9b5d9b5c-2a94-592f-936f-9a9f25a144c1', '93d57735-7ad4-5a46-bbb4-6aa771e9b6b1', 'D', 'Stop statins permanently in all cases', false, 3),
  ('c996300c-2c85-5065-a67a-f9866502d305', '93d57735-7ad4-5a46-bbb4-6aa771e9b6b1', 'E', 'Add fibrate', false, 4);

-- Q65
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('4d39f963-84d0-593a-96bd-20f2d54f2e8c', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000001', 'sba', 'A 70 year old man has taken amiodarone for 2 years. He now has progressive breathlessness and a dry cough. CT shows interstitial fibrosis. Which complication is this?', 'Amiodarone toxicity affects many organs: pulmonary fibrosis or pneumonitis, thyroid dysfunction (hypo- or hyperthyroidism), liver dysfunction, corneal microdeposits, photosensitivity with blue-grey skin, peripheral neuropathy and QT prolongation. Monitoring needs TFTs and LFTs every 6 months, plus a baseline chest X-ray. Stop the drug and consider steroids.', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v3')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = '4d39f963-84d0-593a-96bd-20f2d54f2e8c';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('018d2cc1-aa2d-5fe9-bc3b-6b6ac98b3f4d', '4d39f963-84d0-593a-96bd-20f2d54f2e8c', 'A', 'Amiodarone-induced pulmonary fibrosis', true, 0),
  ('268c7f67-d42b-51ae-8ea2-94dcecb2722b', '4d39f963-84d0-593a-96bd-20f2d54f2e8c', 'B', 'Heart failure only', false, 1),
  ('26672d88-b470-52d6-923f-b981254dfeb8', '4d39f963-84d0-593a-96bd-20f2d54f2e8c', 'C', 'Lung cancer', false, 2),
  ('70bfb2a9-f752-5b34-86ab-a08471162795', '4d39f963-84d0-593a-96bd-20f2d54f2e8c', 'D', 'Pulmonary embolism', false, 3),
  ('d29f40d5-fda2-5024-8bda-3dcc2979ff36', '4d39f963-84d0-593a-96bd-20f2d54f2e8c', 'E', 'Asthma', false, 4);

-- Q66
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('e4decc07-d597-5916-8aba-4dfc77ec60d2', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000001', 'sba', 'A 45 year old woman has paroxysmal AF with infrequent episodes lasting a few hours. She has no structural heart disease or coronary artery disease, and her BP is normal. What is the SINGLE most appropriate ''pill-in-the-pocket'' approach?', 'NICE: ''pill-in-the-pocket'' flecainide is suitable for infrequent paroxysmal AF in people without structural or coronary heart disease, who can recognise their symptoms and take the drug correctly. Flecainide is contraindicated in structural or ischaemic heart disease (it is pro-arrhythmic). Assess stroke risk separately.', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v3')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = 'e4decc07-d597-5916-8aba-4dfc77ec60d2';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('64a49ae1-5134-5a08-8892-41420549168e', 'e4decc07-d597-5916-8aba-4dfc77ec60d2', 'A', 'Flecainide taken when an episode starts', true, 0),
  ('b853ef88-e3b6-548b-b016-9218b4003ed5', 'e4decc07-d597-5916-8aba-4dfc77ec60d2', 'B', 'Atenolol daily long-term at high dose', false, 1),
  ('838b6b7f-4787-58aa-9762-286abdf1f5a0', 'e4decc07-d597-5916-8aba-4dfc77ec60d2', 'C', 'Warfarin when symptoms start', false, 2),
  ('35729e90-7efd-56bd-a026-29bb196eaa5b', 'e4decc07-d597-5916-8aba-4dfc77ec60d2', 'D', 'Amiodarone daily long-term', false, 3),
  ('8d7137db-59de-5445-a622-c8b7707cc4e7', 'e4decc07-d597-5916-8aba-4dfc77ec60d2', 'E', 'Digoxin when symptoms start', false, 4);

-- Q67
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('9aebad7d-bba2-5679-8d4b-73dc4998025f', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000001', 'sba', 'A 55 year old man has new-onset AF of 18 hours'' duration. He is haemodynamically stable. His echo is normal. What is the SINGLE most appropriate management option?', 'NICE: in AF of under 48 hours, rate or rhythm control can be used. Cardioversion (pharmacological or electrical) can be done after starting heparin. If onset is over 48 hours or uncertain, anticoagulate for at least 3 weeks before cardioversion (or do a TOE to exclude thrombus), and for at least 4 weeks after.', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v3')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = '9aebad7d-bba2-5679-8d4b-73dc4998025f';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('54c2435d-2f7b-578d-9544-5341c9b4da28', '9aebad7d-bba2-5679-8d4b-73dc4998025f', 'A', 'Never cardiovert AF', false, 0),
  ('bacaf4a3-c91f-5b7b-a52c-8f0c1e08578b', '9aebad7d-bba2-5679-8d4b-73dc4998025f', 'B', 'Cardioversion only after 3 weeks of anticoagulation', false, 1),
  ('e7868ce3-7a5c-5fff-b58e-7f5028a8c4d5', '9aebad7d-bba2-5679-8d4b-73dc4998025f', 'C', 'Immediate permanent pacemaker', false, 2),
  ('c22e9f97-0410-5d6e-88fe-e482ed5ce064', '9aebad7d-bba2-5679-8d4b-73dc4998025f', 'D', 'Rate or rhythm control; cardioversion (electrical or with flecainide/amiodarone) can be considered because onset is under 48 hours, with heparin cover', true, 3),
  ('23514c29-2c7e-5981-961d-b54527afeb39', '9aebad7d-bba2-5679-8d4b-73dc4998025f', 'E', 'Oral digoxin and discharge', false, 4);

-- Q68
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('85bebf5f-633a-5bbb-907e-4a47cc2ded74', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000001', 'sba', 'A 28 year old woman has a regular narrow-complex tachycardia at 190 bpm. She is haemodynamically stable. What is the SINGLE most appropriate FIRST treatment?', 'For stable SVT, first try vagal manoeuvres. The modified Valsalva (strain, then lie flat with legs raised) is the most effective (REVERT trial). If this fails, give IV adenosine 6 mg, then 12 mg, then 18 mg (with ECG monitoring; warn about a brief sense of impending doom). Avoid adenosine in asthma (use verapamil instead).', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v3')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = '85bebf5f-633a-5bbb-907e-4a47cc2ded74';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('cffb2401-60f6-5ceb-aac7-e60b3f7e160a', '85bebf5f-633a-5bbb-907e-4a47cc2ded74', 'A', 'IV adenosine first', false, 0),
  ('81bd159c-95a8-5cfa-b1e1-c7a000cf8287', '85bebf5f-633a-5bbb-907e-4a47cc2ded74', 'B', 'Oral bisoprolol', false, 1),
  ('b9a1e14f-3791-5b65-9bb9-1412d9bbf0e0', '85bebf5f-633a-5bbb-907e-4a47cc2ded74', 'C', 'Vagal manoeuvres (e.g. modified Valsalva)', true, 2),
  ('400d806f-c7dc-51d6-970d-464ca7e4cc71', '85bebf5f-633a-5bbb-907e-4a47cc2ded74', 'D', 'IV amiodarone', false, 3),
  ('c0f72096-bccd-5091-9624-82e179c53e66', '85bebf5f-633a-5bbb-907e-4a47cc2ded74', 'E', 'Synchronised DC cardioversion', false, 4);

-- Q69
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('724ccfc0-9eba-5147-97e3-8ea973541399', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000001', 'sba', 'A 66 year old woman has sudden chest pain and breathlessness after her husband''s funeral. ECG shows anterior ST elevation, and troponin is mildly raised. Coronary angiography shows normal coronary arteries, and the LV apex balloons on ventriculography. What is the SINGLE most likely diagnosis?', 'Takotsubo cardiomyopathy is a transient apical ballooning of the LV triggered by emotional or physical stress, most often in postmenopausal women. It mimics ACS but the coronary arteries are unobstructed. LV function usually recovers within weeks. Complications include heart failure, LV outflow obstruction, arrhythmias and thrombus.', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v3')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = '724ccfc0-9eba-5147-97e3-8ea973541399';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('13a08450-4aea-58cb-bfca-c914b720ee8c', '724ccfc0-9eba-5147-97e3-8ea973541399', 'A', 'Myocarditis', false, 0),
  ('9f4356d2-658e-5fb2-9373-b1ed58788f65', '724ccfc0-9eba-5147-97e3-8ea973541399', 'B', 'Aortic dissection', false, 1),
  ('c99cc1e9-f116-5ed2-9dd2-f203f7e5c48c', '724ccfc0-9eba-5147-97e3-8ea973541399', 'C', 'Acute anterior STEMI', false, 2),
  ('18c3ab68-9942-5dc3-8c27-4b2646856327', '724ccfc0-9eba-5147-97e3-8ea973541399', 'D', 'Pericarditis', false, 3),
  ('ea9b931b-ccae-5e33-918c-e8b0bd231f45', '724ccfc0-9eba-5147-97e3-8ea973541399', 'E', 'Takotsubo (stress) cardiomyopathy', true, 4);

-- Q70
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('e5c2082d-dd56-5016-9f94-3ba2159d1829', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000001', 'sba', 'A 24 year old man had flu-like symptoms 2 weeks ago. He now has chest pain, breathlessness and palpitations. Troponin is high, ECG shows diffuse T-wave changes, and coronary angiography is normal. Cardiac MRI shows patchy late gadolinium enhancement. What is the SINGLE most likely diagnosis?', 'Myocarditis is often viral (Coxsackie B, adenovirus, parvovirus, SARS-CoV-2). It can also follow vaccination or drugs. It causes chest pain, heart failure or arrhythmia with raised troponin. Cardiac MRI is the main diagnostic test. Treatment is supportive (heart failure therapy). Avoid competitive sport for 3-6 months because of the arrhythmia risk.', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v3')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = 'e5c2082d-dd56-5016-9f94-3ba2159d1829';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('dd7f6361-1e53-5d3d-9e82-d711f9c359be', 'e5c2082d-dd56-5016-9f94-3ba2159d1829', 'A', 'Pulmonary embolism', false, 0),
  ('0549af49-1562-55f9-b45f-942131db107f', 'e5c2082d-dd56-5016-9f94-3ba2159d1829', 'B', 'Viral myocarditis', true, 1),
  ('77b283df-11cd-587c-a54b-74ba2d86f641', 'e5c2082d-dd56-5016-9f94-3ba2159d1829', 'C', 'Takotsubo cardiomyopathy', false, 2),
  ('bb805fca-263b-5d59-8435-aefd64bb076c', 'e5c2082d-dd56-5016-9f94-3ba2159d1829', 'D', 'Pericarditis only', false, 3),
  ('b11e0513-dbd0-5441-9e6a-35df1f4a0370', 'e5c2082d-dd56-5016-9f94-3ba2159d1829', 'E', 'Acute coronary syndrome', false, 4);

-- Q71
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('cd0e0163-17f7-5f9d-b915-90a53d924b63', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000001', 'sba', 'A 79 year old woman is found unconscious at home in winter. Her core temperature is 29°C. Her ECG shows sinus bradycardia with a positive deflection at the junction of the QRS and ST segment in many leads. What is this ECG finding called?', 'J (Osborn) waves are characteristic of hypothermia (below 32°C). Other ECG features include bradycardia, prolonged PR, QRS and QT intervals, shivering artefact, and AF or VF at lower temperatures. Delta waves are seen in WPW, U waves in hypokalaemia, and epsilon waves in ARVC.', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v3')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = 'cd0e0163-17f7-5f9d-b915-90a53d924b63';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('ba550881-1855-561e-930e-c56dd4847fa5', 'cd0e0163-17f7-5f9d-b915-90a53d924b63', 'A', 'Epsilon waves', false, 0),
  ('27e5141b-80c8-584c-84e4-b7a58c59302b', 'cd0e0163-17f7-5f9d-b915-90a53d924b63', 'B', 'U waves', false, 1),
  ('6a9cdfca-6764-5c96-b955-46dbe4bd8af2', 'cd0e0163-17f7-5f9d-b915-90a53d924b63', 'C', 'Tented T waves', false, 2),
  ('6833e208-a8d0-53c2-b94b-9269bb79a650', 'cd0e0163-17f7-5f9d-b915-90a53d924b63', 'D', 'J (Osborn) waves', true, 3),
  ('1ca5be71-4cbc-5ed1-a8e1-a84b3dd8bfaf', 'cd0e0163-17f7-5f9d-b915-90a53d924b63', 'E', 'Delta waves', false, 4);

-- Q72
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('1fa8cc79-5e7e-54cc-873f-26e5985619c8', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000001', 'sba', 'A 72 year old woman on high-dose furosemide has muscle weakness and palpitations. Her ECG shows flattened T waves, prominent U waves and ST depression. Which electrolyte abnormality is MOST likely?', 'Hypokalaemia causes small or inverted T waves, prominent U waves, ST depression and a prolonged QT (really QU). It increases the risk of arrhythmias, especially with digoxin. Hyperkalaemia causes tented T waves, flattened P waves, broad QRS and a sine-wave pattern. Replace potassium (and magnesium).', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v3')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = '1fa8cc79-5e7e-54cc-873f-26e5985619c8';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('bfdd2a6c-d88c-530a-be0d-e0892e98b110', '1fa8cc79-5e7e-54cc-873f-26e5985619c8', 'A', 'Hyponatraemia', false, 0),
  ('b66e43d9-4ea6-5306-98c1-a8e40b685512', '1fa8cc79-5e7e-54cc-873f-26e5985619c8', 'B', 'Hypermagnesaemia', false, 1),
  ('d6150b89-a2a5-558a-961a-dc2898f0674e', '1fa8cc79-5e7e-54cc-873f-26e5985619c8', 'C', 'Hypercalcaemia', false, 2),
  ('e1bad395-d102-5506-8896-10512e196389', '1fa8cc79-5e7e-54cc-873f-26e5985619c8', 'D', 'Hyperkalaemia', false, 3),
  ('450e121c-0b6c-5306-bf65-3a908cbfe555', '1fa8cc79-5e7e-54cc-873f-26e5985619c8', 'E', 'Hypokalaemia', true, 4);

-- Q73
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('ccb52063-1652-5e5c-bbb1-76c67eb1e3c0', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000001', 'sba', 'A 60 year old man has had a dull central chest pain and fever for 2 days, 3 weeks after cardiac surgery. He has a pericardial rub, and ESR is raised. Which treatment is MOST appropriate?', 'Post-pericardiotomy syndrome (like Dressler''s) is an immune-mediated pericarditis weeks after cardiac surgery or injury. Treatment is NSAIDs or aspirin plus colchicine, with steroids for refractory cases. Echo checks for an effusion and tamponade.', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v3')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = 'ccb52063-1652-5e5c-bbb1-76c67eb1e3c0';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('c17d4b1f-f5d2-53fa-8159-f74e6f7e32c4', 'ccb52063-1652-5e5c-bbb1-76c67eb1e3c0', 'A', 'Primary PCI', false, 0),
  ('fd6f9bfd-5072-55ee-8923-a7af5855c6a6', 'ccb52063-1652-5e5c-bbb1-76c67eb1e3c0', 'B', 'NSAIDs (or aspirin) with colchicine', true, 1),
  ('3a12524d-7c8e-59ff-9a7a-cbc0e45185de', 'ccb52063-1652-5e5c-bbb1-76c67eb1e3c0', 'C', 'IV heparin', false, 2),
  ('c290a417-a747-56c6-8af8-ba17c0d03504', 'ccb52063-1652-5e5c-bbb1-76c67eb1e3c0', 'D', 'Long-term high-dose prednisolone first-line', false, 3),
  ('579d5a96-dcd2-5d98-862b-2e862fab7e2b', 'ccb52063-1652-5e5c-bbb1-76c67eb1e3c0', 'E', 'Thrombolysis', false, 4);

-- Q74
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('74765098-e198-5a30-a315-890eff43b75b', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000001', 'sba', 'A 50 year old man has central chest pain on exertion. His resting ECG is normal. A CT coronary angiogram shows a 75% stenosis in the proximal LAD. He is started on medication. Which drug combination is used for SECONDARY prevention in stable angina?', 'NICE CG126: in stable angina, offer aspirin 75 mg daily, a statin, and consider an ACE inhibitor if there is diabetes or another indication. Antianginal treatment is a beta-blocker or calcium channel blocker first-line, with sublingual GTN for attacks. Manage BP and support smoking cessation.', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v3')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = '74765098-e198-5a30-a315-890eff43b75b';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('848a14cf-9179-5bea-8178-e540787d5aaf', '74765098-e198-5a30-a315-890eff43b75b', 'A', 'Aspirin 75 mg and a statin, with an ACE inhibitor considered (especially with diabetes or hypertension)', true, 0),
  ('15d351c3-74fd-5a22-8f3e-d523051e5208', '74765098-e198-5a30-a315-890eff43b75b', 'B', 'No treatment until symptoms worsen', false, 1),
  ('795dca08-b64c-514a-abe2-f6cc3035ae12', '74765098-e198-5a30-a315-890eff43b75b', 'C', 'Clopidogrel and warfarin', false, 2),
  ('c901cb2c-bf7d-573b-88b9-cf467f4ae518', '74765098-e198-5a30-a315-890eff43b75b', 'D', 'Nitrates only', false, 3),
  ('7d18163d-d8f0-5bb5-bfcf-cc9fcd4008f8', '74765098-e198-5a30-a315-890eff43b75b', 'E', 'Digoxin and aspirin', false, 4);

-- Q75
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('9c85da17-a013-5285-8b84-e97ceac8a6ff', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000001', 'sba', 'A 32 year old woman has fatigue, palpitations and syncope. Her ECG shows epsilon waves and T-wave inversion in V1-V3, and she has runs of ventricular tachycardia with LBBB morphology. Her cousin died suddenly at 28. What is the SINGLE most likely diagnosis?', 'ARVC is an inherited (often desmosomal gene, autosomal dominant) fibro-fatty replacement of the right ventricular myocardium. It causes ventricular arrhythmias from the RV (LBBB pattern), epsilon waves, T-wave inversion in V1-V3, and sudden death in young people. Cardiac MRI helps diagnosis. Treatment includes exercise restriction, beta-blockers and ICD.', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v3')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = '9c85da17-a013-5285-8b84-e97ceac8a6ff';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('12c5324a-a229-540c-beab-63f4bdf87b92', '9c85da17-a013-5285-8b84-e97ceac8a6ff', 'A', 'Hypertrophic cardiomyopathy', false, 0),
  ('aa78b0ba-a6ce-559d-af89-13d8f0c8c70c', '9c85da17-a013-5285-8b84-e97ceac8a6ff', 'B', 'Arrhythmogenic right ventricular cardiomyopathy', true, 1),
  ('3aaa5970-05b6-5182-ad72-e2cc633c7ff6', '9c85da17-a013-5285-8b84-e97ceac8a6ff', 'C', 'Long QT syndrome', false, 2),
  ('678444cf-a79c-52d1-bd0a-568c983dbb89', '9c85da17-a013-5285-8b84-e97ceac8a6ff', 'D', 'Dilated cardiomyopathy', false, 3),
  ('e012e927-0392-5cc1-87b4-e652afbc6443', '9c85da17-a013-5285-8b84-e97ceac8a6ff', 'E', 'Brugada syndrome', false, 4);

-- Q76
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('1a57e541-d9e8-556e-bd7e-c5500bda4474', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000003', 'sba', 'A 30 year old man has blood tests: HBsAg positive, anti-HBc IgM negative, anti-HBc IgG positive, anti-HBs negative. The HBsAg was also positive 8 months ago. What is the SINGLE most likely interpretation?', 'HBsAg positive for more than 6 months means chronic infection. IgM anti-HBc indicates acute infection. Anti-HBs alone means vaccination. Anti-HBs with anti-HBc IgG and negative HBsAg means past, cleared infection. Chronic HBV needs HBeAg, viral load, LFT and fibrosis assessment, HCC surveillance in some groups, and testing and vaccination of contacts.', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v3')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = '1a57e541-d9e8-556e-bd7e-c5500bda4474';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('c90c90f9-9c15-5fce-a1bf-deca57554247', '1a57e541-d9e8-556e-bd7e-c5500bda4474', 'A', 'Past cleared infection with immunity', false, 0),
  ('55d7049a-c015-5c8e-b44d-7f6bdbdb938b', '1a57e541-d9e8-556e-bd7e-c5500bda4474', 'B', 'Acute hepatitis B infection', false, 1),
  ('3f6ac3b3-594a-56a5-832a-80025620583a', '1a57e541-d9e8-556e-bd7e-c5500bda4474', 'C', 'Chronic hepatitis B infection', true, 2),
  ('7cb435c8-5cf4-53ce-bab9-22e904650e48', '1a57e541-d9e8-556e-bd7e-c5500bda4474', 'D', 'Never infected and not immune', false, 3),
  ('8a8a6aec-e32e-5c6f-93f5-d8f16c30cba7', '1a57e541-d9e8-556e-bd7e-c5500bda4474', 'E', 'Immunity from vaccination', false, 4);

-- Q77
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('7cfb6d57-614a-57da-80af-a2774c5fa642', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000003', 'sba', 'A 45 year old man with heavy alcohol use has jaundice, fever, tender hepatomegaly and a raised WCC 2 weeks after a binge. Bilirubin is 260 µmol/L, AST:ALT ratio is 2.5 and PT is prolonged. His Maddrey discriminant function is 48. What is the SINGLE most appropriate treatment to consider?', 'Severe alcoholic hepatitis (Maddrey 32 or above, or GAHS 9 or above) may be treated with prednisolone (STOPAH showed short-term benefit), after excluding infection and GI bleeding. A Lille score at day 7 assesses response. Abstinence, nutrition and treating alcohol withdrawal are essential. Mortality is high.', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v3')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = '7cfb6d57-614a-57da-80af-a2774c5fa642';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('d52f4f26-a0fa-52b3-8b95-6e2348c60e53', '7cfb6d57-614a-57da-80af-a2774c5fa642', 'A', 'Discharge with reduced alcohol advice', false, 0),
  ('082eee69-c350-5f80-a990-4e984e595d30', '7cfb6d57-614a-57da-80af-a2774c5fa642', 'B', 'Liver transplant immediately', false, 1),
  ('3eca7dab-12d7-55de-85dd-b0d51b83d6d6', '7cfb6d57-614a-57da-80af-a2774c5fa642', 'C', 'Pentoxifylline as first choice in all', false, 2),
  ('57e200a7-fd7c-58bc-992d-1eeada6d09ab', '7cfb6d57-614a-57da-80af-a2774c5fa642', 'D', 'Oral prednisolone (if no infection or GI bleed), with alcohol abstinence and nutrition', true, 3),
  ('e65ac292-a9dd-502f-b973-09266ff4ecfe', '7cfb6d57-614a-57da-80af-a2774c5fa642', 'E', 'Oral antibiotics only', false, 4);

-- Q78
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('85e0c53a-4a23-5022-8ab3-500cb1cb01c7', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000003', 'sba', 'A 19 year old woman took a large paracetamol overdose 3 days ago and was not treated. She now has jaundice, confusion, an INR of 6.2, pH 7.22 after fluid resuscitation and creatinine of 320 µmol/L. What is the SINGLE most appropriate step?', 'King''s College criteria for paracetamol-induced liver failure: arterial pH below 7.3 after resuscitation, OR all of INR above 6.5, creatinine above 300 and grade 3-4 encephalopathy. Continue acetylcysteine (it helps even late), give organ support, and refer early to a liver transplant unit.', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v3')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = '85e0c53a-4a23-5022-8ab3-500cb1cb01c7';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('cac4bab0-9edb-51b7-9af6-efabff35614b', '85e0c53a-4a23-5022-8ab3-500cb1cb01c7', 'A', 'Give vitamin K and discharge', false, 0),
  ('4eaadbda-4a29-56da-b9d0-3cf40f6d75d9', '85e0c53a-4a23-5022-8ab3-500cb1cb01c7', 'B', 'Haemodialysis only', false, 1),
  ('44d300df-256d-51de-9ca9-25fef720a892', '85e0c53a-4a23-5022-8ab3-500cb1cb01c7', 'C', 'Start oral methionine', false, 2),
  ('7beb3f5d-0fce-531f-84f9-f5e86a0956ba', '85e0c53a-4a23-5022-8ab3-500cb1cb01c7', 'D', 'Discharge once medically stable', false, 3),
  ('920cafae-3354-5c3a-afdf-ca4a8195fe7f', '85e0c53a-4a23-5022-8ab3-500cb1cb01c7', 'E', 'Urgent discussion with a liver transplant centre (she meets King''s College criteria)', true, 4);

-- Q79
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('7f323723-ee09-5346-9a51-b15bf709f5e3', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000003', 'sba', 'A 32 year old woman on the combined pill has sudden abdominal pain, tender hepatomegaly and gross ascites. Doppler ultrasound shows absent flow in the hepatic veins. What is the SINGLE most likely diagnosis?', 'Budd-Chiari syndrome is hepatic venous outflow obstruction, linked to myeloproliferative disorders (JAK2), the pill, pregnancy, thrombophilias and malignancy. It causes the triad of abdominal pain, ascites and hepatomegaly. Treatment is anticoagulation, treating the cause, and TIPS or transplant in severe cases.', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v3')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = '7f323723-ee09-5346-9a51-b15bf709f5e3';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('628e3eb1-d814-5d79-8b33-32927e95d101', '7f323723-ee09-5346-9a51-b15bf709f5e3', 'A', 'Portal vein thrombosis', false, 0),
  ('3cd8250e-efc3-5581-a7e7-6a87423e5192', '7f323723-ee09-5346-9a51-b15bf709f5e3', 'B', 'Budd-Chiari syndrome', true, 1),
  ('34f77d73-b229-5132-b440-581e973624fa', '7f323723-ee09-5346-9a51-b15bf709f5e3', 'C', 'Alcoholic hepatitis', false, 2),
  ('773bcaa1-6f28-5190-9c7c-daba1ee125b2', '7f323723-ee09-5346-9a51-b15bf709f5e3', 'D', 'Acute hepatitis A', false, 3),
  ('f2871674-96d4-56e5-a60f-2b1d420d46e4', '7f323723-ee09-5346-9a51-b15bf709f5e3', 'E', 'Right heart failure', false, 4);

-- Q80
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('d08a7528-51c4-517e-8c6b-bbecbb3f5fac', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000003', 'sba', 'A 17 year old girl has abnormal LFTs, mild haemolytic anaemia and psychiatric symptoms. Slit-lamp examination shows a brown ring around the cornea. Which test is MOST likely to be abnormal?', 'Wilson''s disease is an autosomal recessive (ATP7B) copper accumulation disorder, affecting the liver (hepatitis, cirrhosis, acute liver failure with haemolysis), brain (movement and psychiatric disorders) and eyes (Kayser-Fleischer rings). It is diagnosed with low caeruloplasmin, high urinary copper and liver copper. Treatment is a chelator (penicillamine or trientine) or zinc.', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v3')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = 'd08a7528-51c4-517e-8c6b-bbecbb3f5fac';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('e78821f4-0b75-5164-bcc4-737e625e6268', 'd08a7528-51c4-517e-8c6b-bbecbb3f5fac', 'A', 'High serum ferritin', false, 0),
  ('56d6aa24-158d-531d-9f20-34a634d1d6f2', 'd08a7528-51c4-517e-8c6b-bbecbb3f5fac', 'B', 'Positive anti-mitochondrial antibodies', false, 1),
  ('2d89e35b-4827-5d88-b102-792e0342a898', 'd08a7528-51c4-517e-8c6b-bbecbb3f5fac', 'C', 'Low alpha-1 antitrypsin', false, 2),
  ('6d6d1327-a1e0-56d3-b360-54f8fb8147d5', 'd08a7528-51c4-517e-8c6b-bbecbb3f5fac', 'D', 'High alpha-fetoprotein', false, 3),
  ('6a4ae979-2924-5921-929f-739e6eb06229', 'd08a7528-51c4-517e-8c6b-bbecbb3f5fac', 'E', 'Low serum caeruloplasmin (and high 24-hour urinary copper)', true, 4);

-- Q81
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('217f7298-6ab2-5c34-bb5d-f71969d334fb', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000003', 'sba', 'A 20 year old man has pigmented freckles on his lips and buccal mucosa, and iron-deficiency anaemia. Small bowel imaging shows multiple hamartomatous polyps. He had an intussusception at age 12. What is the SINGLE most likely diagnosis?', 'Peutz-Jeghers syndrome is autosomal dominant (STK11). It causes mucocutaneous pigmentation and hamartomatous GI polyps, which cause bleeding, anaemia and intussusception. There is an increased lifetime risk of GI, breast, pancreatic and gynaecological cancers, so regular surveillance is needed.', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v3')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = '217f7298-6ab2-5c34-bb5d-f71969d334fb';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('0adcedeb-7b9b-5d0c-b2e9-e99f6226ab6b', '217f7298-6ab2-5c34-bb5d-f71969d334fb', 'A', 'Familial adenomatous polyposis', false, 0),
  ('f7882937-f8db-5638-b777-fda2b13c2d2d', '217f7298-6ab2-5c34-bb5d-f71969d334fb', 'B', 'Juvenile polyposis only', false, 1),
  ('c222f9a8-5e25-55ae-bd68-2d7a8efa1b13', '217f7298-6ab2-5c34-bb5d-f71969d334fb', 'C', 'Peutz-Jeghers syndrome', true, 2),
  ('130d188b-d54c-5a3f-888f-ea5f6697c349', '217f7298-6ab2-5c34-bb5d-f71969d334fb', 'D', 'Gardner syndrome', false, 3),
  ('ab86b918-cc2b-55ea-9c32-a29d94239082', '217f7298-6ab2-5c34-bb5d-f71969d334fb', 'E', 'Lynch syndrome', false, 4);

-- Q82
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('b64ae5e0-cfda-58f2-9b55-c227675a0b6d', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000003', 'sba', 'A 24 year old man''s father had colorectal cancer at 40 with hundreds of colonic polyps. Genetic testing shows an APC mutation. What is the SINGLE most appropriate management?', 'Familial adenomatous polyposis (autosomal dominant APC mutation) causes hundreds to thousands of colonic adenomas, and cancer is almost certain by age 40 without surgery. Screening starts at 12-14 years. Prophylactic colectomy is usually done in the late teens or twenties. Upper GI surveillance is needed for duodenal adenomas, and there are associations with desmoid tumours and thyroid cancer.', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v3')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = 'b64ae5e0-cfda-58f2-9b55-c227675a0b6d';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('71fcd908-0d0b-547e-b952-b6a325a0cf75', 'b64ae5e0-cfda-58f2-9b55-c227675a0b6d', 'A', 'Annual colonoscopic surveillance from adolescence, with prophylactic colectomy (usually by the mid-20s)', true, 0),
  ('c9d442b8-43d9-5c58-82d2-19da34156508', 'b64ae5e0-cfda-58f2-9b55-c227675a0b6d', 'B', 'Colonoscopy at 60', false, 1),
  ('380ad5f9-6d1f-51bb-b3f1-1f3f82958e25', 'b64ae5e0-cfda-58f2-9b55-c227675a0b6d', 'C', 'Aspirin only', false, 2),
  ('75b1cd28-c81b-599e-a5b6-ee30daa5c810', 'b64ae5e0-cfda-58f2-9b55-c227675a0b6d', 'D', 'Upper GI endoscopy only', false, 3),
  ('46ab7d20-25f7-566e-bea5-a48e7a1c55a3', 'b64ae5e0-cfda-58f2-9b55-c227675a0b6d', 'E', 'No surveillance needed', false, 4);

-- Q83
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('5f4257c5-8b83-573b-b382-3160a1d9be66', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000003', 'sba', 'A 30 year old woman with Crohn''s disease is due to start azathioprine for maintenance of remission. Which test should be done BEFORE starting?', 'TPMT breaks down azathioprine and mercaptopurine. People with low or absent activity are at risk of severe bone marrow suppression, so check TPMT before starting and reduce or avoid the drug as needed. Monitor FBC and LFTs regularly. Thiopurines can also cause pancreatitis and increase the risk of skin cancer and lymphoma.', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v3')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = '5f4257c5-8b83-573b-b382-3160a1d9be66';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('9cb5b21d-a867-501c-a8d0-e45bb64a04e0', '5f4257c5-8b83-573b-b382-3160a1d9be66', 'A', 'HLA-B*5701', false, 0),
  ('c098a2de-b19e-58ed-9327-e30e3dcf47f8', '5f4257c5-8b83-573b-b382-3160a1d9be66', 'B', 'G6PD activity', false, 1),
  ('b138da2c-e94a-5020-8848-f9506817e42d', '5f4257c5-8b83-573b-b382-3160a1d9be66', 'C', 'Thiopurine methyltransferase (TPMT) activity', true, 2),
  ('65ae4f6f-765a-56d8-a6c8-92ef7c165570', '5f4257c5-8b83-573b-b382-3160a1d9be66', 'D', 'Serum caeruloplasmin', false, 3),
  ('83b0e3e6-d207-52af-914f-aa34ad74dd05', '5f4257c5-8b83-573b-b382-3160a1d9be66', 'E', 'Anti-dsDNA antibodies', false, 4);

-- Q84
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('75cbe92d-2602-5fbb-80f4-86177d1dcbac', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000003', 'sba', 'A 34 year old woman with ulcerative colitis has a mild-moderate relapse of proctitis (rectal disease only). What is the SINGLE most appropriate first-line treatment?', 'NICE NG130: for mild-moderate proctitis, first-line is a topical aminosalicylate (suppository or enema). Add an oral aminosalicylate if there is no remission in 4 weeks. Topical or oral steroids are added if needed. Maintenance is usually with an aminosalicylate.', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v3')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = '75cbe92d-2602-5fbb-80f4-86177d1dcbac';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('ede0eb30-6e4b-5f23-ac69-1aada272bb1f', '75cbe92d-2602-5fbb-80f4-86177d1dcbac', 'A', 'Infliximab', false, 0),
  ('5b8feb83-2a03-5364-b683-41f832580b6e', '75cbe92d-2602-5fbb-80f4-86177d1dcbac', 'B', 'IV hydrocortisone', false, 1),
  ('c50fdf39-324a-5a8d-aa38-793bfd3e688c', '75cbe92d-2602-5fbb-80f4-86177d1dcbac', 'C', 'Oral azathioprine', false, 2),
  ('a8bde380-b525-5ebc-bfeb-bc0f55802cc6', '75cbe92d-2602-5fbb-80f4-86177d1dcbac', 'D', 'Oral prednisolone first-line', false, 3),
  ('54a06ede-9094-5fe8-b969-384535bd10e8', '75cbe92d-2602-5fbb-80f4-86177d1dcbac', 'E', 'Topical aminosalicylate (mesalazine suppository)', true, 4);

-- Q85
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('db5b4d81-a094-5805-a7cb-1d10b78761ee', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000003', 'sba', 'A 40 year old man with ulcerative colitis has painful red eyes, a large ulcer on his shin with a purple undermined edge, and lower back stiffness. Which ONE of these extra-intestinal features usually follows the activity of his colitis?', 'Extra-intestinal manifestations of IBD that track disease activity include peripheral arthritis, erythema nodosum, episcleritis and mouth ulcers. Those that run independently include ankylosing spondylitis/sacroiliitis, uveitis and primary sclerosing cholangitis. Pyoderma gangrenosum can be either. These features are important when choosing treatment.', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v3')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = 'db5b4d81-a094-5805-a7cb-1d10b78761ee';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('cc28e19d-c325-5b2d-b055-416c1fdd0e67', 'db5b4d81-a094-5805-a7cb-1d10b78761ee', 'A', 'Pyoderma gangrenosum', false, 0),
  ('ba821fa1-a316-5796-9513-051f3eadda20', 'db5b4d81-a094-5805-a7cb-1d10b78761ee', 'B', 'Ankylosing spondylitis', false, 1),
  ('e0f9a417-6b3e-537d-b283-4d477d5fd9c8', 'db5b4d81-a094-5805-a7cb-1d10b78761ee', 'C', 'Episcleritis', true, 2),
  ('2ed84879-5616-5eae-9421-981857f3478f', 'db5b4d81-a094-5805-a7cb-1d10b78761ee', 'D', 'Primary sclerosing cholangitis', false, 3),
  ('8eed5f20-c0a6-5a01-a96e-a80717a2a0b0', 'db5b4d81-a094-5805-a7cb-1d10b78761ee', 'E', 'Anterior uveitis', false, 4);

-- Q86
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('2e13b764-8ccf-5c13-adeb-cfb07e2a9975', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000003', 'sba', 'A 50 year old woman has coeliac disease and itchy, symmetrical, grouped vesicles on her elbows, knees and buttocks. What is the SINGLE most likely diagnosis?', 'Dermatitis herpetiformis is an intensely itchy, blistering rash on extensor surfaces associated with coeliac disease. Skin biopsy shows granular IgA deposits in the dermal papillae. Treatment is a strict gluten-free diet and dapsone for symptom control. Untreated coeliac disease also increases the risk of enteropathy-associated T-cell lymphoma.', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v3')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = '2e13b764-8ccf-5c13-adeb-cfb07e2a9975';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('d8650221-0dc6-57e2-b9e5-39bec86236bf', '2e13b764-8ccf-5c13-adeb-cfb07e2a9975', 'A', 'Psoriasis', false, 0),
  ('52fce43c-207c-5c38-b623-43a9d75f24e1', '2e13b764-8ccf-5c13-adeb-cfb07e2a9975', 'B', 'Dermatitis herpetiformis', true, 1),
  ('b188cf50-ef09-50db-8a9a-d898c4c01b50', '2e13b764-8ccf-5c13-adeb-cfb07e2a9975', 'C', 'Bullous pemphigoid', false, 2),
  ('5b2e2f67-5f6a-5ad3-aace-71da493c486e', '2e13b764-8ccf-5c13-adeb-cfb07e2a9975', 'D', 'Scabies', false, 3),
  ('2a040ee2-b3aa-50e8-a55f-edd9ea0543b9', '2e13b764-8ccf-5c13-adeb-cfb07e2a9975', 'E', 'Eczema herpeticum', false, 4);

-- Q87
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('63670bad-46d9-50b2-a589-9c2194023009', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000003', 'sba', 'A 25 year old man with eczema and asthma has had difficulty swallowing solids for years, with recurrent food bolus impaction. Endoscopy shows a ringed, furrowed oesophagus, and biopsies show more than 15 eosinophils per high-power field. What is the SINGLE most likely diagnosis?', 'Eosinophilic oesophagitis is an allergic, immune-mediated disease, common in young men with atopy. It causes dysphagia and food bolus impaction. Endoscopy shows rings, furrows or strictures, confirmed on biopsy (15 or more eosinophils per HPF). Treatment includes PPIs, topical steroids (budesonide orodispersible tablets), elimination diets and dilatation.', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v3')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = '63670bad-46d9-50b2-a589-9c2194023009';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('1f3bf7cb-8c16-5e32-b04b-7090dc999a93', '63670bad-46d9-50b2-a589-9c2194023009', 'A', 'Achalasia', false, 0),
  ('99df7299-af72-5745-85ba-cf8338caa7b5', '63670bad-46d9-50b2-a589-9c2194023009', 'B', 'Eosinophilic oesophagitis', true, 1),
  ('e1d1ff2e-cd99-558f-ad11-25349bd4d160', '63670bad-46d9-50b2-a589-9c2194023009', 'C', 'Barrett''s oesophagus', false, 2),
  ('30a48c73-1b05-5f5e-a974-4f224922c5ef', '63670bad-46d9-50b2-a589-9c2194023009', 'D', 'Oesophageal carcinoma', false, 3),
  ('4f56092e-21fd-578d-9f69-24fe475bdf58', '63670bad-46d9-50b2-a589-9c2194023009', 'E', 'Plummer-Vinson syndrome', false, 4);

-- Q88
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('a5dbf7db-f76f-545d-83e9-5889a7ab99a1', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000003', 'sba', 'A 50 year old woman with cirrhosis has large oesophageal varices found at screening endoscopy. They have never bled. What is the SINGLE most appropriate primary prevention?', 'NICE recommends a non-selective beta-blocker for primary prevention of variceal bleeding in medium or large varices, with band ligation if beta-blockers are contraindicated or not tolerated. After a variceal bleed, secondary prevention is band ligation plus a non-selective beta-blocker. TIPS is used for uncontrolled or recurrent bleeding.', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v3')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = 'a5dbf7db-f76f-545d-83e9-5889a7ab99a1';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('6b6db2e1-6385-50e2-a381-108ad9cc4790', 'a5dbf7db-f76f-545d-83e9-5889a7ab99a1', 'A', 'Omeprazole', false, 0),
  ('4379aeff-f740-5dde-9c32-b0fe982c3586', 'a5dbf7db-f76f-545d-83e9-5889a7ab99a1', 'B', 'TIPS', false, 1),
  ('f7a2c197-86df-5e71-b231-b800eb1dc5db', 'a5dbf7db-f76f-545d-83e9-5889a7ab99a1', 'C', 'No treatment', false, 2),
  ('2c440a24-6684-56a6-baec-e5819449b800', 'a5dbf7db-f76f-545d-83e9-5889a7ab99a1', 'D', 'Long-term terlipressin', false, 3),
  ('486f2c23-3f85-55e2-8f22-d48d8e9ad3c6', 'a5dbf7db-f76f-545d-83e9-5889a7ab99a1', 'E', 'A non-selective beta-blocker (e.g. carvedilol or propranolol), or variceal band ligation if not tolerated', true, 4);

-- Q89
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('4f81043a-8bf5-5ec3-a20c-8da5607bec43', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000003', 'sba', 'A 60 year old man with cirrhosis and ascites has increasing creatinine (from 90 to 210 µmol/L over 1 week) and oliguria. Diuretics have been stopped and albumin given for 2 days without improvement. There is no shock, nephrotoxins or structural kidney disease. What is the SINGLE most appropriate treatment?', 'This is hepatorenal syndrome-AKI: AKI in cirrhosis with ascites not responding to volume expansion, with no other cause. Treatment is a vasoconstrictor (terlipressin) with albumin. Liver transplantation is the definitive treatment. It is often triggered by spontaneous bacterial peritonitis, GI bleeding or over-diuresis.', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v3')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = '4f81043a-8bf5-5ec3-a20c-8da5607bec43';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('2e0dd451-1a67-5ae8-8ec9-ed86b1b375c6', '4f81043a-8bf5-5ec3-a20c-8da5607bec43', 'A', 'Restart diuretics at higher dose', false, 0),
  ('28ba52cb-5ffa-5d0f-b88e-27ca21aa68ca', '4f81043a-8bf5-5ec3-a20c-8da5607bec43', 'B', 'Large-volume paracentesis without albumin', false, 1),
  ('ed7711a3-d782-5162-afe3-dd346abdf1cc', '4f81043a-8bf5-5ec3-a20c-8da5607bec43', 'C', 'IV furosemide', false, 2),
  ('e83b786c-de32-5f6a-8315-af733960ee29', '4f81043a-8bf5-5ec3-a20c-8da5607bec43', 'D', 'Terlipressin with IV albumin', true, 3),
  ('cf7ed31c-94aa-52e0-8f8d-cb2c7276557f', '4f81043a-8bf5-5ec3-a20c-8da5607bec43', 'E', 'Long-term haemodialysis as first-line', false, 4);

-- Q90
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('bf870a3f-2a60-5e63-8450-7fedd103c46f', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000003', 'sba', 'A 66 year old man vomited blood after an upper GI bleed. He is stable with a Hb of 138 g/L, urea 5 mmol/L, BP 135/80 mmHg, HR 82 bpm, no melaena, syncope, liver disease or heart failure. His Glasgow-Blatchford score is 0. What is the SINGLE most appropriate management?', 'NICE CG141 suggests considering early discharge for patients with a pre-endoscopy Glasgow-Blatchford score of 0. The score uses urea, Hb, systolic BP, pulse, melaena, syncope, liver disease and heart failure. The full Rockall score after endoscopy predicts risk of rebleeding and death.', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v3')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = 'bf870a3f-2a60-5e63-8450-7fedd103c46f';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('57aa19b6-f5f2-5eee-92dd-e9629f35d800', 'bf870a3f-2a60-5e63-8450-7fedd103c46f', 'A', 'Admit to ICU', false, 0),
  ('7032cc15-a9aa-5a28-9a19-79aace9f6707', 'bf870a3f-2a60-5e63-8450-7fedd103c46f', 'B', 'Consider early discharge with outpatient endoscopy', true, 1),
  ('90deb9cc-e86a-5141-aee9-f652f7679bc4', 'bf870a3f-2a60-5e63-8450-7fedd103c46f', 'C', 'Transfuse 2 units of red cells', false, 2),
  ('5dbc6b80-1e4e-5159-9811-5cfa362f2de1', 'bf870a3f-2a60-5e63-8450-7fedd103c46f', 'D', 'Emergency endoscopy within 2 hours', false, 3),
  ('f92b0fcb-5a0d-5008-ab23-8e223919e8f0', 'bf870a3f-2a60-5e63-8450-7fedd103c46f', 'E', 'Start IV terlipressin', false, 4);

-- Q91
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('cdcfb908-33b5-5b89-96dd-d37777c3d9bc', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000003', 'sba', 'A 55 year old woman is due to have a urea breath test for Helicobacter pylori. She is taking omeprazole for dyspepsia. What advice should she be given?', 'PPIs and antibiotics suppress H. pylori and can cause false negative breath or stool antigen tests. Stop PPIs for 2 weeks and antibiotics for 4 weeks before testing. H2 receptor antagonists or antacids can be used in the meantime. Retesting after eradication is only needed in some cases (such as gastric ulcer or persistent symptoms).', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v3')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = 'cdcfb908-33b5-5b89-96dd-d37777c3d9bc';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('bdad73e4-7780-5742-9c88-02e49818bbdc', 'cdcfb908-33b5-5b89-96dd-d37777c3d9bc', 'A', 'Stop PPI for 6 months', false, 0),
  ('13825b16-8a5a-5b57-bac1-b3cad99c3aa3', 'cdcfb908-33b5-5b89-96dd-d37777c3d9bc', 'B', 'Stop the PPI for 2 weeks (and antibiotics for 4 weeks) before testing', true, 1),
  ('1af4d295-d791-50cd-b89e-41ec11afa964', 'cdcfb908-33b5-5b89-96dd-d37777c3d9bc', 'C', 'Stop PPI for 24 hours only', false, 2),
  ('86e1b7c6-097f-5f8a-a6a9-59bc7d6b2259', 'cdcfb908-33b5-5b89-96dd-d37777c3d9bc', 'D', 'Test only while taking antibiotics', false, 3),
  ('5d56c8e2-4eac-567a-a9d8-ff5381214e0e', 'cdcfb908-33b5-5b89-96dd-d37777c3d9bc', 'E', 'No need to stop any medication', false, 4);

-- Q92
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('abc7cc4d-71c8-5d15-9ee5-53f36f6cecf3', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000003', 'sba', 'An 80 year old man has painless, intermittent bright red rectal bleeding and iron-deficiency anaemia. He has aortic stenosis. Colonoscopy shows small, flat, red vascular lesions in the caecum. What is the SINGLE most likely diagnosis?', 'Angiodysplasia (vascular ectasia) is a common cause of lower GI bleeding and iron-deficiency anaemia in older people, usually in the right colon. It is associated with aortic stenosis (Heyde''s syndrome, through acquired von Willebrand deficiency). Treatment is endoscopic argon plasma coagulation, embolisation for acute bleeding, or valve replacement.', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v3')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = 'abc7cc4d-71c8-5d15-9ee5-53f36f6cecf3';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('d8d2c3f3-b32d-5cde-a700-6de640867eef', 'abc7cc4d-71c8-5d15-9ee5-53f36f6cecf3', 'A', 'Colorectal carcinoma', false, 0),
  ('cbfe07f7-fa5d-5667-8643-b75d7d2e1446', 'abc7cc4d-71c8-5d15-9ee5-53f36f6cecf3', 'B', 'Angiodysplasia', true, 1),
  ('c0117ef8-5822-53b8-8d88-21d29baa4cfc', 'abc7cc4d-71c8-5d15-9ee5-53f36f6cecf3', 'C', 'Ischaemic colitis', false, 2),
  ('b3b30ff9-c099-53c3-9735-2e0f15b8089c', 'abc7cc4d-71c8-5d15-9ee5-53f36f6cecf3', 'D', 'Haemorrhoids', false, 3),
  ('1843c0d5-5e3a-5a97-a8ed-25ce523808ff', 'abc7cc4d-71c8-5d15-9ee5-53f36f6cecf3', 'E', 'Diverticular bleeding', false, 4);

-- Q93
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('659d20d1-342d-56c5-be0a-5232d1230a1f', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000003', 'sba', 'A 45 year old man had a partial gastrectomy. Thirty minutes after eating, he has abdominal cramping, diarrhoea, palpitations and flushing. What is the SINGLE most likely diagnosis?', 'Early dumping (within 30 minutes) happens when hyperosmolar food enters the small bowel quickly, causing fluid shifts and vasoactive hormone release (cramps, diarrhoea, palpitations, flushing). Late dumping (1-3 hours) is reactive hypoglycaemia from excess insulin. Management is small frequent meals, fewer simple sugars, and avoiding fluids with meals.', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v3')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = '659d20d1-342d-56c5-be0a-5232d1230a1f';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('cc918da4-8d4d-5f07-84d6-b6641cfe7fe3', '659d20d1-342d-56c5-be0a-5232d1230a1f', 'A', 'Afferent loop syndrome', false, 0),
  ('c9f9e8f5-2fb7-5527-b4d6-a8f652485571', '659d20d1-342d-56c5-be0a-5232d1230a1f', 'B', 'Early dumping syndrome', true, 1),
  ('29b038b3-e055-5c79-b434-7923bf869c7f', '659d20d1-342d-56c5-be0a-5232d1230a1f', 'C', 'Carcinoid syndrome', false, 2),
  ('5802350a-5925-5800-b591-7765756110da', '659d20d1-342d-56c5-be0a-5232d1230a1f', 'D', 'Bile acid malabsorption', false, 3),
  ('a31a0222-3fc0-5fc5-bcc8-800820a43e57', '659d20d1-342d-56c5-be0a-5232d1230a1f', 'E', 'Late dumping syndrome (reactive hypoglycaemia)', false, 4);

-- Q94
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('e453a8f2-6d0b-5a62-a586-49dd3e342ad4', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000003', 'sba', 'A 40 year old woman had her terminal ileum resected for Crohn''s disease. She now has chronic watery diarrhoea, worse after meals. A SeHCAT scan shows low retention. What is the SINGLE most appropriate treatment?', 'The terminal ileum reabsorbs bile acids. After resection or ileal disease, unabsorbed bile acids reach the colon and cause secretory diarrhoea (bile acid malabsorption), diagnosed by SeHCAT. Colestyramine is the treatment. Larger resections cause fat malabsorption and B12 deficiency, so check B12.', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v3')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = 'e453a8f2-6d0b-5a62-a586-49dd3e342ad4';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('8eabacc8-0d17-5749-bdc8-29537c0de297', 'e453a8f2-6d0b-5a62-a586-49dd3e342ad4', 'A', 'A bile acid sequestrant (colestyramine)', true, 0),
  ('d943b852-4adc-5979-a63a-486e08a32164', 'e453a8f2-6d0b-5a62-a586-49dd3e342ad4', 'B', 'Loperamide only', false, 1),
  ('8f79fd07-f712-584a-add6-10edca5804d2', 'e453a8f2-6d0b-5a62-a586-49dd3e342ad4', 'C', 'Oral vancomycin', false, 2),
  ('abab3663-d2dc-5b62-a9e1-680d3526677a', 'e453a8f2-6d0b-5a62-a586-49dd3e342ad4', 'D', 'Lactose-free diet', false, 3),
  ('c94fab70-2670-50fc-905b-6dedf30fbf9b', 'e453a8f2-6d0b-5a62-a586-49dd3e342ad4', 'E', 'Mesalazine', false, 4);

-- Q95
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('155004f4-1f55-5908-8f16-86b0c4c83d62', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000003', 'sba', 'A 66 year old man has recurrent pancreatitis and obstructive jaundice. Imaging shows a diffusely enlarged ''sausage-shaped'' pancreas, and IgG4 is raised. He also has retroperitoneal fibrosis. What is the SINGLE most appropriate treatment?', 'Autoimmune pancreatitis type 1 is part of IgG4-related disease. It can mimic pancreatic cancer and is associated with sclerosing cholangitis, retroperitoneal fibrosis and sialadenitis. It responds well to steroids. Cancer must be carefully excluded.', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v3')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = '155004f4-1f55-5908-8f16-86b0c4c83d62';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('a75e7f8b-cf40-5c6c-a749-29e50c45320c', '155004f4-1f55-5908-8f16-86b0c4c83d62', 'A', 'Total pancreatectomy', false, 0),
  ('7db1f827-295c-5d26-961e-ad5dfe9cb585', '155004f4-1f55-5908-8f16-86b0c4c83d62', 'B', 'Oral corticosteroids (prednisolone)', true, 1),
  ('12cdacd5-5cab-5a37-93da-d58add3468a3', '155004f4-1f55-5908-8f16-86b0c4c83d62', 'C', 'Alcohol cessation only', false, 2),
  ('923d7578-a400-59fc-8978-060ff66517dd', '155004f4-1f55-5908-8f16-86b0c4c83d62', 'D', 'Whipple''s procedure', false, 3),
  ('13a5086d-b16d-564c-882b-5175dd5ecc0d', '155004f4-1f55-5908-8f16-86b0c4c83d62', 'E', 'Pancreatic enzyme replacement only', false, 4);

-- Q96
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('ccef4374-15d5-512a-adc8-27f01df602c2', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000003', 'sba', 'A 55 year old woman has abnormal LFTs 2 weeks after a course of co-amoxiclav for a chest infection. ALP and GGT are markedly raised with a mild ALT rise, and she is jaundiced. Ultrasound shows no biliary dilatation. What is the SINGLE most likely cause?', 'Co-amoxiclav is a common cause of drug-induced cholestatic hepatitis, typically within weeks (and sometimes after finishing the course). Other causes of cholestatic drug injury include flucloxacillin, combined pill, anabolic steroids, chlorpromazine and nitrofurantoin. Stop the drug. Most recover in weeks to months.', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v3')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = 'ccef4374-15d5-512a-adc8-27f01df602c2';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('126e84a1-be15-56ee-b4ef-b541943e4e44', 'ccef4374-15d5-512a-adc8-27f01df602c2', 'A', 'Gilbert''s syndrome', false, 0),
  ('436ab03e-fe31-5217-8490-59ca6488e1c6', 'ccef4374-15d5-512a-adc8-27f01df602c2', 'B', 'Drug-induced cholestatic liver injury (co-amoxiclav)', true, 1),
  ('fc6e0b7a-a165-5789-bcc0-304e1fd6ef4d', 'ccef4374-15d5-512a-adc8-27f01df602c2', 'C', 'Gallstones in the common bile duct', false, 2),
  ('30b7f8df-4acc-5337-8c97-856ea2cfe363', 'ccef4374-15d5-512a-adc8-27f01df602c2', 'D', 'Primary biliary cholangitis', false, 3),
  ('2fd18986-db09-52ee-8b3f-4dc52e3f81c8', 'ccef4374-15d5-512a-adc8-27f01df602c2', 'E', 'Hepatitis A', false, 4);

-- Q97
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('36359fd9-49ed-5840-8c61-621f7b134123', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000003', 'sba', 'A 58 year old woman with cirrhosis has had 2 episodes of hepatic encephalopathy despite lactulose. What is the SINGLE most appropriate addition to prevent recurrence?', 'NICE TA337 recommends rifaximin (a non-absorbed antibiotic) for reducing recurrence of overt hepatic encephalopathy in adults, usually with lactulose. Look for precipitants: infection, GI bleeding, constipation, hypokalaemia, dehydration and sedatives. Protein restriction is not recommended.', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v3')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = '36359fd9-49ed-5840-8c61-621f7b134123';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('2bb07826-85e2-5b9e-a8d9-4fe7cd113eca', '36359fd9-49ed-5840-8c61-621f7b134123', 'A', 'Diazepam', false, 0),
  ('f2787969-fb30-54cc-ae4a-45a40f1a4e80', '36359fd9-49ed-5840-8c61-621f7b134123', 'B', 'Metronidazole long-term', false, 1),
  ('2c3087bb-dcb0-5007-9922-dcee1d22faf5', '36359fd9-49ed-5840-8c61-621f7b134123', 'C', 'Rifaximin', true, 2),
  ('3d90c78d-a45e-5126-8eb7-10f0ee24c83f', '36359fd9-49ed-5840-8c61-621f7b134123', 'D', 'Neomycin long-term', false, 3),
  ('b5f57075-b9d7-5992-b112-4348a0bdbce6', '36359fd9-49ed-5840-8c61-621f7b134123', 'E', 'Protein-free diet', false, 4);

-- Q98
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('420bb8f0-bc0b-5b15-8da6-e2c95c455d2a', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000003', 'sba', 'A 60 year old man has a perianal itch, bleeding and a hard, ulcerated mass at the anal margin. He has HIV and a history of anal warts. Biopsy confirms cancer. What is the SINGLE most likely histological type and first-line treatment?', 'Anal cancer is usually squamous cell carcinoma linked to HPV (16/18), and is more common in HIV, MSM and immunosuppression. First-line treatment is chemoradiotherapy (Nigro protocol: mitomycin and 5-FU with radiotherapy). Surgery (abdominoperineal resection) is used for residual or recurrent disease.', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v3')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = '420bb8f0-bc0b-5b15-8da6-e2c95c455d2a';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('7850098c-8337-59d2-8716-d9916f7c9bf6', '420bb8f0-bc0b-5b15-8da6-e2c95c455d2a', 'A', 'Adenocarcinoma; abdominoperineal resection first-line', false, 0),
  ('ac0da3f9-7f7d-5f58-bca7-a87c617ec81e', '420bb8f0-bc0b-5b15-8da6-e2c95c455d2a', 'B', 'Melanoma; immunotherapy only', false, 1),
  ('4659524a-df66-534e-976a-7ab69cc40670', '420bb8f0-bc0b-5b15-8da6-e2c95c455d2a', 'C', 'Basal cell carcinoma; Mohs surgery', false, 2),
  ('1dda61e1-cc52-5956-97b0-efc5480eebea', '420bb8f0-bc0b-5b15-8da6-e2c95c455d2a', 'D', 'Lymphoma; R-CHOP', false, 3),
  ('c1569caf-3756-50bf-b911-076422a9fe03', '420bb8f0-bc0b-5b15-8da6-e2c95c455d2a', 'E', 'Squamous cell carcinoma; chemoradiotherapy', true, 4);

-- Q99
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('b7e83e2b-caa0-571f-8d6b-d460489695d2', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000003', 'sba', 'A 50 year old man has bowel cancer screening in England. What test is used in the national bowel cancer screening programme?', 'The NHS bowel cancer screening programme sends home FIT kits every 2 years to people aged 50-74 in England (extended down to 50). A positive result leads to colonoscopy. Flexible sigmoidoscopy screening at 55 has been stopped. Over-74s can request a kit.', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v3')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = 'b7e83e2b-caa0-571f-8d6b-d460489695d2';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('e0c8440f-2c5a-5a96-ad31-dc069edb6745', 'b7e83e2b-caa0-571f-8d6b-d460489695d2', 'A', 'CT colonography at 60', false, 0),
  ('81d9af3b-d23d-5ae3-93df-5fea6fc96e94', 'b7e83e2b-caa0-571f-8d6b-d460489695d2', 'B', 'Colonoscopy every 5 years from 40', false, 1),
  ('9a565afd-a0e0-5ca6-abd2-3deba92eab95', 'b7e83e2b-caa0-571f-8d6b-d460489695d2', 'C', 'Faecal occult blood (guaiac) annually from 30', false, 2),
  ('f84ca848-fa0f-54cc-b45b-8a72dbdbfda6', 'b7e83e2b-caa0-571f-8d6b-d460489695d2', 'D', 'Flexible sigmoidoscopy at 55 only', false, 3),
  ('650a1b91-2c96-5b46-b8ac-fdb2446b9dd9', 'b7e83e2b-caa0-571f-8d6b-d460489695d2', 'E', 'Faecal immunochemical test (FIT) every 2 years, for ages 50-74', true, 4);

-- Q100
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('ccc0c02f-1693-5f23-9972-a0c15b089101', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000003', 'sba', 'A 31 year old woman has heartburn in pregnancy at 30 weeks. Lifestyle changes have not helped. What is the SINGLE most appropriate first-line medication?', 'Heartburn is common in pregnancy because of progesterone relaxing the lower oesophageal sphincter and pressure from the uterus. First-line is lifestyle advice (small meals, avoid eating late, raise the head of the bed), then antacids or alginates. If symptoms persist, ranitidine (where available), famotidine or omeprazole can be used. Misoprostol is contraindicated in pregnancy.', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v3')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = 'ccc0c02f-1693-5f23-9972-a0c15b089101';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('588c508d-04e5-5276-8cd6-51dca34043a3', 'ccc0c02f-1693-5f23-9972-a0c15b089101', 'A', 'Omeprazole is contraindicated', false, 0),
  ('8fd504be-37c0-5766-93e3-33cca1ac83f1', 'ccc0c02f-1693-5f23-9972-a0c15b089101', 'B', 'Bismuth', false, 1),
  ('06af43b8-61fe-5092-a67b-33fe38f14f58', 'ccc0c02f-1693-5f23-9972-a0c15b089101', 'C', 'Metoclopramide long-term', false, 2),
  ('48b83cda-a405-5399-836d-523723158e92', 'ccc0c02f-1693-5f23-9972-a0c15b089101', 'D', 'An alginate or antacid (e.g. Gaviscon)', true, 3),
  ('3e345853-8b65-57a2-9a7c-d0fb582bee11', 'ccc0c02f-1693-5f23-9972-a0c15b089101', 'E', 'Misoprostol', false, 4);

-- Q101
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('8dc8e768-289b-52ae-add4-a53ea7144b62', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000003', 'sba', 'A 70 year old woman has had pain on swallowing and a feeling of food sticking. She has iron-deficiency anaemia, glossitis and koilonychia. Barium swallow shows a thin membrane in the upper oesophagus. What is the SINGLE most likely diagnosis?', 'Plummer-Vinson (Paterson-Brown-Kelly) syndrome is the triad of dysphagia (post-cricoid web), iron-deficiency anaemia and glossitis or koilonychia. It is more common in middle-aged women. It is premalignant (post-cricoid squamous cell carcinoma). Treat the iron deficiency, and dilate the web if needed.', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v3')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = '8dc8e768-289b-52ae-add4-a53ea7144b62';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('1f0aa208-b103-59be-a9ae-662c0a60698d', '8dc8e768-289b-52ae-add4-a53ea7144b62', 'A', 'Pharyngeal pouch', false, 0),
  ('4e6c6194-cc11-5a4a-995a-e07a9ecb6913', '8dc8e768-289b-52ae-add4-a53ea7144b62', 'B', 'Eosinophilic oesophagitis', false, 1),
  ('0fc11da7-4dbc-578a-b8a2-e58c0812e16b', '8dc8e768-289b-52ae-add4-a53ea7144b62', 'C', 'Oesophageal carcinoma', false, 2),
  ('85e144ae-c419-501a-bdb0-627108a756b4', '8dc8e768-289b-52ae-add4-a53ea7144b62', 'D', 'Plummer-Vinson syndrome (oesophageal web)', true, 3),
  ('9a5e6b18-acbd-5517-a178-45f725774988', '8dc8e768-289b-52ae-add4-a53ea7144b62', 'E', 'Achalasia', false, 4);

-- Q102
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('7f9d1959-5a25-53b1-b3a5-a26ade084a0b', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000030', 'sba', 'A 22 year old man has had right iliac fossa pain for 5 days. He now has a tender, fixed mass in the right iliac fossa, low-grade fever and raised CRP. CT shows an inflammatory phlegmon without a drainable abscess. What is the SINGLE most appropriate initial management?', 'An appendix mass (phlegmon) is usually treated conservatively with IV antibiotics and fluids, with drainage if an abscess forms. Interval appendicectomy is debated. In older patients, colonoscopy or CT later is advised to exclude a caecal cancer.', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v3')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = '7f9d1959-5a25-53b1-b3a5-a26ade084a0b';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('2374e0f8-87ad-5f82-b39d-90f6b2b9481c', '7f9d1959-5a25-53b1-b3a5-a26ade084a0b', 'A', 'Discharge with oral analgesia', false, 0),
  ('472bc9b7-97c2-5c61-a737-c56fd66609b8', '7f9d1959-5a25-53b1-b3a5-a26ade084a0b', 'B', 'Right hemicolectomy', false, 1),
  ('04de6116-2b79-5f22-b88b-0bf6bf9ef826', '7f9d1959-5a25-53b1-b3a5-a26ade084a0b', 'C', 'Immediate open appendicectomy', false, 2),
  ('29075abe-f541-5e64-954a-fe77d1fb45e2', '7f9d1959-5a25-53b1-b3a5-a26ade084a0b', 'D', 'Conservative management with IV antibiotics (appendix mass), with interval assessment', true, 3),
  ('e5c50cfc-753c-57eb-b66d-02211704cb14', '7f9d1959-5a25-53b1-b3a5-a26ade084a0b', 'E', 'Colonoscopy straight away', false, 4);

-- Q103
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('a74b407c-b560-5dd3-8260-df67225119b8', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000030', 'sba', 'A 70 year old woman has a small, tender, irreducible lump below and lateral to the pubic tubercle. She has vomiting and colicky abdominal pain. What is the SINGLE most likely diagnosis?', 'Femoral hernias are more common in women and lie below and lateral to the pubic tubercle. They have a narrow neck, so they carry a high risk of incarceration and strangulation. Even asymptomatic femoral hernias should be repaired promptly, and strangulation needs emergency surgery. Inguinal hernias emerge above and medial to the pubic tubercle.', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v3')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = 'a74b407c-b560-5dd3-8260-df67225119b8';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('b08b3b0c-b579-5c8c-b9a8-ba1a61a49829', 'a74b407c-b560-5dd3-8260-df67225119b8', 'A', 'Saphena varix', false, 0),
  ('60a1cf17-2714-5757-b3f2-7cbabbd4fa28', 'a74b407c-b560-5dd3-8260-df67225119b8', 'B', 'Direct inguinal hernia', false, 1),
  ('5e80652a-f45a-5629-83c6-3e831628157a', 'a74b407c-b560-5dd3-8260-df67225119b8', 'C', 'Inguinal lymphadenopathy', false, 2),
  ('7222dbc4-20f7-5f49-90d8-b35018fe47e0', 'a74b407c-b560-5dd3-8260-df67225119b8', 'D', 'Strangulated femoral hernia', true, 3),
  ('eb4d4d54-f976-58c4-a8d7-22879eceb37d', 'a74b407c-b560-5dd3-8260-df67225119b8', 'E', 'Psoas abscess', false, 4);

-- Q104
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('cf99eabd-4968-550d-9c59-d1c05fd8eb19', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000030', 'sba', 'An 8 month old baby has a soft, painless, reducible bulge at the umbilicus that gets bigger when he cries. He is otherwise well. What is the SINGLE most appropriate management?', 'Congenital umbilical hernias are common (especially in premature infants and Afro-Caribbean children) and usually close spontaneously. They rarely incarcerate. Surgical repair is considered if the hernia persists beyond 3-5 years, is large, or becomes symptomatic. Strapping is not recommended.', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v3')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = 'cf99eabd-4968-550d-9c59-d1c05fd8eb19';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('7d612ff2-5aa6-5243-80cc-20bd573dd356', 'cf99eabd-4968-550d-9c59-d1c05fd8eb19', 'A', 'Refer for urgent ultrasound', false, 0),
  ('abd4ad5b-2993-5607-b21d-b2f32a1d281b', 'cf99eabd-4968-550d-9c59-d1c05fd8eb19', 'B', 'Strap a coin over the umbilicus', false, 1),
  ('b47e744a-923d-53b1-949e-2d1d8d2aaca1', 'cf99eabd-4968-550d-9c59-d1c05fd8eb19', 'C', 'Antibiotics', false, 2),
  ('a5275432-6a72-5828-bbf1-71afa88e1cbc', 'cf99eabd-4968-550d-9c59-d1c05fd8eb19', 'D', 'Urgent surgical repair', false, 3),
  ('251179f5-1948-56ea-9bd4-db2b86ac45e4', 'cf99eabd-4968-550d-9c59-d1c05fd8eb19', 'E', 'Reassure; most close spontaneously by 3-5 years; refer if still present after that or if complications occur', true, 4);

-- Q105
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('c858e5c1-6aad-5ed5-a942-e7ec35981d01', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000030', 'sba', 'A 52 year old man has had a laparotomy scar for 2 years. He now has a bulge along the scar that is bigger on coughing and reducible. He is a smoker with a BMI of 36. What is the SINGLE most likely diagnosis?', 'Incisional hernias develop in about 10-20% of laparotomy wounds. Risk factors include obesity, smoking, wound infection, diabetes, steroids and poor closure technique. Repair (often with mesh) is offered for symptoms, but optimising weight and stopping smoking first improves outcomes. Divarication of the recti is a midline bulge above the umbilicus without a fascial defect.', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v3')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = 'c858e5c1-6aad-5ed5-a942-e7ec35981d01';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('8e551b04-5e82-505a-b389-f8c17165b8a7', 'c858e5c1-6aad-5ed5-a942-e7ec35981d01', 'A', 'Epigastric hernia', false, 0),
  ('80cc9cf8-428f-5f4a-b705-81eb7dcdfd29', 'c858e5c1-6aad-5ed5-a942-e7ec35981d01', 'B', 'Incisional hernia', true, 1),
  ('545031d8-aab9-565b-8999-84670f3e2bf9', 'c858e5c1-6aad-5ed5-a942-e7ec35981d01', 'C', 'Lipoma', false, 2),
  ('69735893-8e92-5714-b912-ae18c1279d98', 'c858e5c1-6aad-5ed5-a942-e7ec35981d01', 'D', 'Divarication of the recti', false, 3),
  ('ca4725c7-cba3-5157-9dbd-29b1d9c4ee3e', 'c858e5c1-6aad-5ed5-a942-e7ec35981d01', 'E', 'Spigelian hernia', false, 4);

-- Q106
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('f2344cde-2b82-5aa7-bf02-0a78ac374f18', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000030', 'sba', 'A 35 year old man has sudden severe epigastric pain, now generalised, with a rigid abdomen. He takes ibuprofen regularly for back pain. Erect chest X-ray shows free air under the diaphragm. What is the SINGLE most appropriate management?', 'A perforated peptic ulcer (often duodenal, linked to NSAIDs and H. pylori) causes sudden severe pain and peritonitis. Management is resuscitation, nil by mouth, NG tube, IV antibiotics, IV PPI and surgical repair (omental patch). Test for and eradicate H. pylori afterwards.', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v3')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = 'f2344cde-2b82-5aa7-bf02-0a78ac374f18';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('4652cdcc-598f-5f4b-9556-d31d40a69997', 'f2344cde-2b82-5aa7-bf02-0a78ac374f18', 'A', 'Resuscitation, IV antibiotics and PPI, and urgent surgical repair (laparoscopic or open omental patch)', true, 0),
  ('b0313e3a-8f33-5e4e-ae5c-99dc6d0b8509', 'f2344cde-2b82-5aa7-bf02-0a78ac374f18', 'B', 'Colonoscopy', false, 1),
  ('4d1a86a6-23f3-544f-a01c-aaa4bb95f5f4', 'f2344cde-2b82-5aa7-bf02-0a78ac374f18', 'C', 'Conservative management with oral PPI at home', false, 2),
  ('f8e23eee-d15b-5b79-8d17-ad78dfacb5e3', 'f2344cde-2b82-5aa7-bf02-0a78ac374f18', 'D', 'Barium meal', false, 3),
  ('5e6d399b-9ea2-5089-b7ae-f306f6e76c94', 'f2344cde-2b82-5aa7-bf02-0a78ac374f18', 'E', 'Upper GI endoscopy today', false, 4);

-- Q107
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('3fede964-fdae-578c-ba2a-270a02c6e6cb', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000030', 'sba', 'A 74 year old woman has a mass protruding from her anus on straining, which she can push back. Examination shows full-thickness concentric rings of rectal mucosa. She has faecal incontinence. What is the SINGLE most likely diagnosis?', 'Full-thickness rectal prolapse shows concentric mucosal folds, whereas haemorrhoids and mucosal prolapse show radial folds. It is more common in older women, and is linked to chronic straining, constipation and pelvic floor weakness. Treatment is surgical: abdominal (rectopexy) or perineal (Delorme''s or Altemeier''s) procedures depending on fitness.', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v3')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = '3fede964-fdae-578c-ba2a-270a02c6e6cb';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('539fe97c-a823-5c42-b0aa-f260aa6b0e5c', '3fede964-fdae-578c-ba2a-270a02c6e6cb', 'A', 'Rectal polyp', false, 0),
  ('744ab179-866e-5897-9426-dd0437349e1a', '3fede964-fdae-578c-ba2a-270a02c6e6cb', 'B', 'Full-thickness rectal prolapse', true, 1),
  ('e00ca9ff-2a14-5e88-9ecd-d839973f885d', '3fede964-fdae-578c-ba2a-270a02c6e6cb', 'C', 'Anal skin tags', false, 2),
  ('a5269887-37d8-5083-91e9-a0a9d45489d4', '3fede964-fdae-578c-ba2a-270a02c6e6cb', 'D', 'Anal carcinoma', false, 3),
  ('72112c7b-a865-503c-95f4-cc6b31cf000b', '3fede964-fdae-578c-ba2a-270a02c6e6cb', 'E', 'Prolapsed haemorrhoids', false, 4);

-- Q108
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('4c0e7c6d-3a4c-5f20-b2af-ebc9788fab64', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000030', 'sba', 'A 40 year old man has had an external opening of a fistula-in-ano for months at the 4 o''clock position (lithotomy), 5 cm from the anal verge. According to Goodsall''s rule, where will the internal opening MOST likely be?', 'Goodsall''s rule: external openings anterior to a transverse line through the anus usually have a straight radial tract to the internal opening. Posterior openings usually have a curved tract to an internal opening in the posterior midline. Openings more than 3 cm from the anal verge often follow the posterior rule. MRI helps map complex fistulae.', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v3')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = '4c0e7c6d-3a4c-5f20-b2af-ebc9788fab64';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('a3fe2d60-77cb-5d9a-b529-6bb4477d84a5', '4c0e7c6d-3a4c-5f20-b2af-ebc9788fab64', 'A', 'In the rectum above the dentate line at 12 o''clock', false, 0),
  ('23dcfe4a-68db-5cf9-bda1-4845ec249b90', '4c0e7c6d-3a4c-5f20-b2af-ebc9788fab64', 'B', 'At 12 o''clock anteriorly', false, 1),
  ('7a649bcb-e727-55ac-a012-8ded9ff07445', '4c0e7c6d-3a4c-5f20-b2af-ebc9788fab64', 'C', 'Directly radially opposite at 4 o''clock', false, 2),
  ('75c34a81-4526-53d9-af89-bb106270ad01', '4c0e7c6d-3a4c-5f20-b2af-ebc9788fab64', 'D', 'There is never an internal opening', false, 3),
  ('87b90bbe-c5a1-516a-9140-cee1ea4a463e', '4c0e7c6d-3a4c-5f20-b2af-ebc9788fab64', 'E', 'In the posterior midline (6 o''clock), via a curved tract', true, 4);

-- Q109
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('beae6142-da78-5846-aee2-5f11f5240dd9', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000030', 'sba', 'A 48 year old woman has large varicose veins with aching legs, ankle eczema and a healed venous ulcer. What is the SINGLE most appropriate management?', 'NICE CG168 recommends referral to a vascular service for symptomatic primary varicose veins, skin changes (pigmentation, eczema, lipodermatosclerosis), superficial vein thrombosis, or a healed or active venous ulcer. First-line treatment is endothermal ablation (radiofrequency or laser), then foam sclerotherapy, then surgery. Compression is used if interventional treatment is unsuitable.', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v3')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = 'beae6142-da78-5846-aee2-5f11f5240dd9';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('cc328017-1676-5e5e-9cac-3e6a91c2ecad', 'beae6142-da78-5846-aee2-5f11f5240dd9', 'A', 'Oral antibiotics', false, 0),
  ('e4280c07-a26e-513b-ad7c-e2fdf72f6ef3', 'beae6142-da78-5846-aee2-5f11f5240dd9', 'B', 'Long-term warfarin', false, 1),
  ('fd9b6145-25f5-50a1-8b18-9084ede7a473', 'beae6142-da78-5846-aee2-5f11f5240dd9', 'C', 'Compression stockings only for all, with no referral', false, 2),
  ('8700f0d4-3c9c-562a-9838-5b139b246451', 'beae6142-da78-5846-aee2-5f11f5240dd9', 'D', 'Refer to a vascular service for duplex ultrasound and consideration of endothermal ablation', true, 3),
  ('6e17e5d3-fb10-52b7-913f-4401942bfc10', 'beae6142-da78-5846-aee2-5f11f5240dd9', 'E', 'Reassure; varicose veins are cosmetic', false, 4);

-- Q110
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('15f919f3-0417-55da-ab57-a80f77319f74', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000030', 'sba', 'A 70 year old smoker has rest pain in his right foot at night, relieved by hanging the leg over the bed, with a small toe ulcer. His ankle-brachial pressure index is 0.35. What is the SINGLE most likely diagnosis and next step?', 'ABPI interpretation: 0.9-1.2 normal; 0.5-0.9 claudication range; below 0.5 severe ischaemia (critical with rest pain, ulceration or gangrene). Above 1.3 suggests calcified incompressible arteries (diabetes, CKD). Chronic limb-threatening ischaemia needs urgent vascular assessment for angioplasty or bypass. Compression is contraindicated.', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v3')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = '15f919f3-0417-55da-ab57-a80f77319f74';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('2c3f1d5f-6eec-5c8d-a28e-0acdbf4c336c', '15f919f3-0417-55da-ab57-a80f77319f74', 'A', 'Venous ulcer; compression bandaging', false, 0),
  ('20011595-34a7-5a34-9570-0850afce8e1d', '15f919f3-0417-55da-ab57-a80f77319f74', 'B', 'Diabetic neuropathy; refer to podiatry only', false, 1),
  ('635c173e-63cf-5c02-8bc7-50b8f0e4e7c7', '15f919f3-0417-55da-ab57-a80f77319f74', 'C', 'Normal ABPI; reassure', false, 2),
  ('3ca4a882-f277-5771-8b98-11ec737d973c', '15f919f3-0417-55da-ab57-a80f77319f74', 'D', 'Intermittent claudication; supervised exercise only', false, 3),
  ('f1aa8f38-6a61-50bf-a4bd-3cd90183a3fe', '15f919f3-0417-55da-ab57-a80f77319f74', 'E', 'Chronic limb-threatening ischaemia; urgent vascular referral for imaging and revascularisation', true, 4);

-- Q111
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('5b0837ad-9a5d-5355-a57e-ed5eb1f1569d', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000030', 'sba', 'A 30 year old man was hit in the left upper abdomen during a rugby tackle. He now has left shoulder tip pain, abdominal tenderness, BP 86/50 mmHg and HR 128 bpm despite 1 L of fluid. FAST scan shows free fluid. What is the SINGLE most appropriate management?', 'The spleen is the most commonly injured organ in blunt abdominal trauma. Left shoulder tip pain (Kehr''s sign) comes from diaphragmatic irritation. A haemodynamically unstable patient with positive FAST needs emergency laparotomy. Stable patients have CT and are often managed non-operatively or with embolisation.', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v3')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = '5b0837ad-9a5d-5355-a57e-ed5eb1f1569d';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('1d0323c6-12d4-5964-a06a-5ac8b0fc16b8', '5b0837ad-9a5d-5355-a57e-ed5eb1f1569d', 'A', 'CT abdomen first, then decide', false, 0),
  ('c2d70e5d-ec5b-53b0-b18b-77b2504c24c3', '5b0837ad-9a5d-5355-a57e-ed5eb1f1569d', 'B', 'Interventional radiology in 24 hours', false, 1),
  ('8087848b-2a7a-5b88-b352-37703954ca8a', '5b0837ad-9a5d-5355-a57e-ed5eb1f1569d', 'C', 'Discharge with analgesia', false, 2),
  ('d6e4d1b9-ee6b-5108-8f07-11a26765bf55', '5b0837ad-9a5d-5355-a57e-ed5eb1f1569d', 'D', 'Activate major haemorrhage protocol and take for emergency laparotomy (likely splenic injury)', true, 3),
  ('85acadc9-a8c0-5205-9c46-5ba8b6900f8e', '5b0837ad-9a5d-5355-a57e-ed5eb1f1569d', 'E', 'Observe on the ward', false, 4);

-- Q112
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('70aedbe5-0ec8-57b9-b1b9-19c5a71495a4', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000030', 'sba', 'A 35 year old man has had an emergency splenectomy after trauma. What is the SINGLE most important long-term preventive measure?', 'After splenectomy, there is a lifelong risk of overwhelming infection from encapsulated bacteria (Streptococcus pneumoniae, Haemophilus influenzae, Neisseria meningitidis). Vaccinate (ideally 2 weeks before elective surgery, or 2 weeks after emergency surgery), give prophylactic penicillin (or macrolide), provide a standby course and alert card, and advise about malaria and animal bites.', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v3')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = '70aedbe5-0ec8-57b9-b1b9-19c5a71495a4';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('9f2b137e-bf26-542c-92f4-0357de4c471d', '70aedbe5-0ec8-57b9-b1b9-19c5a71495a4', 'A', 'No action needed', false, 0),
  ('a4230c9a-942d-56b6-b632-8fad004b2ff4', '70aedbe5-0ec8-57b9-b1b9-19c5a71495a4', 'B', 'Iron supplements', false, 1),
  ('db7d5a2d-7d9f-5ba6-9af3-4f218fe042e7', '70aedbe5-0ec8-57b9-b1b9-19c5a71495a4', 'C', 'Lifelong aspirin', false, 2),
  ('d0b528ab-d805-5527-8ec4-51c4084ab88e', '70aedbe5-0ec8-57b9-b1b9-19c5a71495a4', 'D', 'Vaccination (pneumococcal, Hib, meningococcal ACWY and B, annual influenza) and lifelong or long-term antibiotic prophylaxis', true, 3),
  ('6fdc25b5-a72f-5d79-bfa9-75f520676579', '70aedbe5-0ec8-57b9-b1b9-19c5a71495a4', 'E', 'Annual abdominal ultrasound', false, 4);

-- Q113
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('e9508fb5-8485-5611-aa4e-2a859d63af75', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000030', 'sba', 'A 45 year old sheep farmer from Wales has RUQ discomfort. CT shows a large cyst in the liver with daughter cysts and a calcified wall. Serology is positive for Echinococcus. What is the SINGLE most important precaution during treatment?', 'Hydatid disease (Echinococcus granulosus) comes from contact with dogs in sheep-farming areas. Liver cysts are most common, followed by lung. Treatment is albendazole with surgery or PAIR (puncture, aspiration, injection, re-aspiration). Spilling the contents can cause anaphylaxis and secondary spread.', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v3')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = 'e9508fb5-8485-5611-aa4e-2a859d63af75';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('ea1e7583-8a73-5fbc-9ced-600e101e9d74', 'e9508fb5-8485-5611-aa4e-2a859d63af75', 'A', 'Treat with metronidazole only', false, 0),
  ('e7421a42-3223-5a33-94b9-f524dc276ee6', 'e9508fb5-8485-5611-aa4e-2a859d63af75', 'B', 'No treatment is needed', false, 1),
  ('2e1b2cad-35c9-5217-a4dd-673608c4259e', 'e9508fb5-8485-5611-aa4e-2a859d63af75', 'C', 'Avoid spilling cyst contents (risk of anaphylaxis and dissemination); give albendazole around the procedure', true, 2),
  ('5cdd5108-2620-5a1c-bd27-db7e376f5947', 'e9508fb5-8485-5611-aa4e-2a859d63af75', 'D', 'Immediate liver transplant', false, 3),
  ('5ac83756-f315-5bae-bdd2-7fe189f87f21', 'e9508fb5-8485-5611-aa4e-2a859d63af75', 'E', 'Diagnostic needle aspiration in clinic without precautions', false, 4);

-- Q114
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('0f514526-3b0f-58cb-aa5d-340034ddacd7', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000030', 'sba', 'A 65 year old man with diabetes has fever, rigors and RUQ pain for 1 week. CT shows a multiloculated liver abscess. He also has a recent history of diverticulitis. What is the SINGLE most appropriate management?', 'Pyogenic liver abscesses arise from biliary disease, portal spread (diverticulitis, appendicitis) or haematogenous spread. Common organisms are E. coli, Klebsiella and Streptococcus milleri. Treatment is image-guided drainage plus prolonged IV antibiotics. Amoebic liver abscess (travel history) is treated with metronidazole and rarely needs drainage. If Strep milleri or Strep bovis is found, look for colonic disease.', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v3')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = '0f514526-3b0f-58cb-aa5d-340034ddacd7';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('c1bc8f40-cb1c-53f8-a0bd-30a15d39d307', '0f514526-3b0f-58cb-aa5d-340034ddacd7', 'A', 'Oral metronidazole only', false, 0),
  ('6c9d074b-e349-51d0-9dc3-e0f38dffdc6d', '0f514526-3b0f-58cb-aa5d-340034ddacd7', 'B', 'Steroids', false, 1),
  ('cbaffcff-bf17-5d7d-881c-849b75137c0d', '0f514526-3b0f-58cb-aa5d-340034ddacd7', 'C', 'Percutaneous drainage plus IV antibiotics, with blood cultures and search for the source', true, 2),
  ('f6d0ceac-c52c-58e1-add5-89e8a1035aa1', '0f514526-3b0f-58cb-aa5d-340034ddacd7', 'D', 'Immediate liver resection', false, 3),
  ('63a36a2d-3ff0-5dcd-9d0c-f8a84671dc77', '0f514526-3b0f-58cb-aa5d-340034ddacd7', 'E', 'Observe only', false, 4);

-- Q115
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('8a385b05-85f4-521a-bc9c-24e2ea6f46bb', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000030', 'sba', 'A 20 year old man has a smooth, non-tender swelling at the anterior border of the sternocleidomastoid at the junction of its upper and middle thirds. It became painful and enlarged after a cold. Aspiration shows cholesterol crystals. What is the SINGLE most likely diagnosis?', 'Branchial cysts are remnants of the second branchial cleft, usually presenting in young adults with a smooth swelling at the anterior border of SCM. They may enlarge with URTIs. Fluid contains cholesterol crystals. Excision is the treatment. In older adults, a ''cyst'' in this area may be a cystic metastasis (such as from oropharyngeal SCC), so investigate carefully.', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v3')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = '8a385b05-85f4-521a-bc9c-24e2ea6f46bb';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('47aa57e2-c77e-59ca-8f70-2a0e2b911008', '8a385b05-85f4-521a-bc9c-24e2ea6f46bb', 'A', 'Branchial cyst', true, 0),
  ('736bbc56-1c7c-5472-abd3-dc60505e7228', '8a385b05-85f4-521a-bc9c-24e2ea6f46bb', 'B', 'Reactive lymph node', false, 1),
  ('8ccebba2-49d9-5e81-853b-d666acbc4694', '8a385b05-85f4-521a-bc9c-24e2ea6f46bb', 'C', 'Carotid body tumour', false, 2),
  ('2e74bb9e-f7a7-5153-9c0a-b4f525316647', '8a385b05-85f4-521a-bc9c-24e2ea6f46bb', 'D', 'Thyroglossal cyst', false, 3),
  ('cfe79129-5f23-5905-bb6c-cb2c7116ffbf', '8a385b05-85f4-521a-bc9c-24e2ea6f46bb', 'E', 'Cystic hygroma', false, 4);

-- Q116
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('0fda5216-d42a-528f-8774-d2576c929177', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000030', 'sba', 'A 55 year old man has a slowly enlarging painless lump at the angle of the jaw. It is pulsatile, can be moved side to side but not up and down, and a bruit is heard over it. What is the SINGLE most likely diagnosis?', 'A carotid body tumour (paraganglioma) lies at the carotid bifurcation. It is pulsatile, moves laterally but not vertically (Fontaine''s sign), and may have a bruit. Imaging (CT/MR angiography) shows splaying of the internal and external carotids (lyre sign). Biopsy should be avoided. Some cases are familial (SDH mutations). Treatment is surgical excision.', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v3')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = '0fda5216-d42a-528f-8774-d2576c929177';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('3d494435-96b6-5d62-9fe6-3f29978d25bd', '0fda5216-d42a-528f-8774-d2576c929177', 'A', 'Carotid body tumour (paraganglioma)', true, 0),
  ('bff259dd-63ce-5567-91ae-174885ada0f3', '0fda5216-d42a-528f-8774-d2576c929177', 'B', 'Thyroglossal cyst', false, 1),
  ('fcc78c36-8b76-54cb-a0c0-86d903dda076', '0fda5216-d42a-528f-8774-d2576c929177', 'C', 'Pleomorphic adenoma of the parotid', false, 2),
  ('6540bf3b-60da-534d-a9a9-457af69acf9f', '0fda5216-d42a-528f-8774-d2576c929177', 'D', 'Lymph node metastasis', false, 3),
  ('cf3125b2-803f-504c-ae38-8e8d75d2dd40', '0fda5216-d42a-528f-8774-d2576c929177', 'E', 'Branchial cyst', false, 4);

-- Q117
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('0ade6ed3-4841-5961-af8f-02d0fc70592b', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000030', 'sba', 'A 3 month old baby has a soft, fluctuant, painless swelling in the lower lateral neck that transilluminates brightly. What is the SINGLE most likely diagnosis?', 'Cystic hygromas are congenital lymphatic malformations, usually in the posterior triangle, present at birth or in early childhood. They are soft and transilluminate brightly. They can be associated with Turner syndrome and trisomies. Large lesions can compress the airway. Treatment is sclerotherapy or surgery.', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v3')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = '0ade6ed3-4841-5961-af8f-02d0fc70592b';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('f6ac7581-1cb8-5060-8b81-bfe737303242', '0ade6ed3-4841-5961-af8f-02d0fc70592b', 'A', 'Sternocleidomastoid tumour', false, 0),
  ('f1c12968-c586-50dc-a296-ba36b20dff71', '0ade6ed3-4841-5961-af8f-02d0fc70592b', 'B', 'Cystic hygroma (lymphatic malformation)', true, 1),
  ('35b27d41-b936-581c-9324-0834292b86ab', '0ade6ed3-4841-5961-af8f-02d0fc70592b', 'C', 'Thyroglossal cyst', false, 2),
  ('7bcf1576-6507-5707-a758-bf3c9cbd2fae', '0ade6ed3-4841-5961-af8f-02d0fc70592b', 'D', 'Branchial cyst', false, 3),
  ('c64e9dc1-ea31-5f90-b823-866f63c689c2', '0ade6ed3-4841-5961-af8f-02d0fc70592b', 'E', 'Dermoid cyst', false, 4);

-- Q118
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('7b5d1400-54d1-5fd6-8c1e-9166dc9fefba', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000030', 'sba', 'A 66 year old man with recurrent duodenal ulcers has had projectile vomiting of undigested food hours after eating, and a succussion splash. Bloods show hypochloraemic, hypokalaemic metabolic alkalosis. What is the SINGLE most likely diagnosis?', 'Gastric outlet obstruction causes vomiting of undigested food, a succussion splash and metabolic alkalosis from loss of acid. In adults it is caused by peptic ulcer scarring or malignancy (gastric or pancreatic). Endoscopy is needed. Treat with IV fluids (0.9% saline with potassium), NG decompression, then endoscopic dilatation, stenting or surgery.', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v3')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = '7b5d1400-54d1-5fd6-8c1e-9166dc9fefba';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('6cf588c6-6ac0-5b42-8424-582a39aa8ce9', '7b5d1400-54d1-5fd6-8c1e-9166dc9fefba', 'A', 'Achalasia', false, 0),
  ('8512f168-6144-5c84-b6e8-a867a986efb5', '7b5d1400-54d1-5fd6-8c1e-9166dc9fefba', 'B', 'Gastric outlet obstruction', true, 1),
  ('8eb9b068-e8bb-5741-b41f-c6a23dae1639', '7b5d1400-54d1-5fd6-8c1e-9166dc9fefba', 'C', 'Gastroparesis only', false, 2),
  ('aaf1948b-faec-52c9-a073-43511dc4a515', '7b5d1400-54d1-5fd6-8c1e-9166dc9fefba', 'D', 'Acute pancreatitis', false, 3),
  ('5cf1f615-effe-5472-8e13-16c71e8f97e9', '7b5d1400-54d1-5fd6-8c1e-9166dc9fefba', 'E', 'Small bowel obstruction due to adhesions', false, 4);

-- Q119
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('914a53c8-2c30-5664-9c6d-0bac8d71a9b0', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000030', 'sba', 'A 60 year old man has an expansile pulsatile mass behind his knee. Duplex shows a popliteal artery aneurysm of 2.5 cm. What is the SINGLE most important associated finding to check for?', 'Popliteal aneurysms are the most common peripheral aneurysms. They are bilateral in about 50% of cases and associated with AAA in about 30-50%. The main complication is thrombosis or distal embolism causing acute limb ischaemia, rather than rupture. Repair is recommended for aneurysms over 2-3 cm or those with thrombus.', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v3')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = '914a53c8-2c30-5664-9c6d-0bac8d71a9b0';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('abbd9925-7447-5cc4-9648-84715155d165', '914a53c8-2c30-5664-9c6d-0bac8d71a9b0', 'A', 'Femoral hernia', false, 0),
  ('efa77007-4bf8-5ad2-bac3-69eb7926fefc', '914a53c8-2c30-5664-9c6d-0bac8d71a9b0', 'B', 'Varicose veins', false, 1),
  ('33925d97-88d3-552a-8a89-ec31e3f7d75a', '914a53c8-2c30-5664-9c6d-0bac8d71a9b0', 'C', 'Abdominal aortic aneurysm and contralateral popliteal aneurysm', true, 2),
  ('68942328-01a9-5f29-850c-459c08f5fb3d', '914a53c8-2c30-5664-9c6d-0bac8d71a9b0', 'D', 'DVT', false, 3),
  ('70efaab0-2f87-5e7f-9038-4218ff70eef9', '914a53c8-2c30-5664-9c6d-0bac8d71a9b0', 'E', 'Baker''s cyst', false, 4);

-- Q120
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('3a259af1-2cba-5ac3-b5ee-f1e12416569e', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000030', 'sba', 'A 70 year old man has an abdominal aortic aneurysm. He presents with sudden severe back pain and collapse, and a BP of 80/50 mmHg. A vascular surgeon is available. What is the SINGLE most appropriate fluid strategy while transferring him to theatre?', 'In ruptured AAA, aggressive fluid resuscitation raises BP, which can worsen bleeding and dilute clotting factors. Permissive hypotension (keeping a systolic BP that maintains consciousness) is used until the aorta is controlled. Proceed straight to theatre for endovascular (EVAR) or open repair. A CT is done if the patient is stable enough.', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v3')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = '3a259af1-2cba-5ac3-b5ee-f1e12416569e';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('1a09505e-4a79-5f1b-bb97-80a1ac336c8c', '3a259af1-2cba-5ac3-b5ee-f1e12416569e', 'A', 'IV furosemide', false, 0),
  ('509fe8b6-b825-57d3-8e2b-024833404e56', '3a259af1-2cba-5ac3-b5ee-f1e12416569e', 'B', 'No IV access until in theatre', false, 1),
  ('c4afab2b-7b1d-5a3d-a621-137d4891beef', '3a259af1-2cba-5ac3-b5ee-f1e12416569e', 'C', 'Permissive hypotension (target systolic about 70-90 mmHg, or conscious level maintained) while arranging immediate repair', true, 2),
  ('5a191a4f-1fe6-5b3f-b085-0633c1014fc0', '3a259af1-2cba-5ac3-b5ee-f1e12416569e', 'D', 'Aggressive fluid resuscitation to a systolic BP of 140 mmHg', false, 3),
  ('022abaa8-33e8-5bfc-9a1a-771856bc2120', '3a259af1-2cba-5ac3-b5ee-f1e12416569e', 'E', 'Vasodilators to lower BP', false, 4);

-- Q121
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('e9f70d0f-77c0-592e-b199-baeac84e770c', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000030', 'sba', 'A 26 year old woman has a painless, smooth, round, mobile lump under the skin of her back with a central punctum. It has been there for years and occasionally discharges cheesy material. What is the SINGLE most likely diagnosis?', 'Epidermoid cysts are common, slow-growing, keratin-filled cysts with a central punctum. They may become inflamed or infected. Definitive treatment is complete excision of the cyst wall when not inflamed (otherwise it recurs). An inflamed or infected cyst is managed with incision and drainage, and excision later.', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v3')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = 'e9f70d0f-77c0-592e-b199-baeac84e770c';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('8fd3b45c-49f3-5f0a-adf6-8281cce28f36', 'e9f70d0f-77c0-592e-b199-baeac84e770c', 'A', 'Neurofibroma', false, 0),
  ('43f1059e-2739-5aa6-a818-9672ae1481ff', 'e9f70d0f-77c0-592e-b199-baeac84e770c', 'B', 'Lipoma', false, 1),
  ('74922eec-81ea-5da0-8b74-ffff595bf90c', 'e9f70d0f-77c0-592e-b199-baeac84e770c', 'C', 'Epidermoid (sebaceous) cyst', true, 2),
  ('245114fb-0108-54f0-99da-4b38e23ffd02', 'e9f70d0f-77c0-592e-b199-baeac84e770c', 'D', 'Ganglion', false, 3),
  ('9980307c-e675-5be4-8a4d-9a4ed3b63202', 'e9f70d0f-77c0-592e-b199-baeac84e770c', 'E', 'Dermatofibroma', false, 4);

-- Q122
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('0097b232-0fa8-5590-a193-bb260f6493ad', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000030', 'sba', 'A 55 year old woman has right upper quadrant pain and obstructive jaundice. Imaging shows a large stone impacted in the neck of the gallbladder compressing the common hepatic duct, with no stone in the duct itself. What is the SINGLE most likely diagnosis?', 'Mirizzi syndrome is extrinsic compression of the common hepatic duct by a gallstone impacted in the cystic duct or Hartmann''s pouch. It can cause obstructive jaundice and cholangitis, and sometimes a cholecystocholedochal fistula. MRCP or ERCP shows the anatomy. Treatment is cholecystectomy, which can be technically difficult.', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v3')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = '0097b232-0fa8-5590-a193-bb260f6493ad';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('88f47fa6-7ade-5d29-99a2-28baf90c7531', '0097b232-0fa8-5590-a193-bb260f6493ad', 'A', 'Cholangiocarcinoma', false, 0),
  ('db0bffa8-1b0a-5ac7-8254-3fcb92825482', '0097b232-0fa8-5590-a193-bb260f6493ad', 'B', 'Primary sclerosing cholangitis', false, 1),
  ('24263b99-2e06-5265-be99-713f92b59a66', '0097b232-0fa8-5590-a193-bb260f6493ad', 'C', 'Choledocholithiasis', false, 2),
  ('47b10bab-a034-5fa5-8bfc-98aecb8c0efc', '0097b232-0fa8-5590-a193-bb260f6493ad', 'D', 'Gallstone ileus', false, 3),
  ('4567392d-f467-5caa-954e-192e1dac7ad3', '0097b232-0fa8-5590-a193-bb260f6493ad', 'E', 'Mirizzi syndrome', true, 4);

-- Q123
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('dee017ea-338b-5d29-bc31-f193159fbb5a', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000008', 'sba', 'A 34 year old woman with two previous caesarean sections has an anterior low-lying placenta at 32 weeks. MRI suggests the placenta is invading the myometrium. What is the SINGLE most important planning step?', 'Placenta accreta spectrum is strongly linked to previous caesarean sections and placenta praevia. It risks massive haemorrhage at delivery. RCOG advises planned caesarean (usually 35-36+6 weeks) in a centre with interventional radiology, cell salvage, consultant obstetricians and anaesthetists, and blood bank support. Caesarean hysterectomy is often needed.', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v3')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = 'dee017ea-338b-5d29-bc31-f193159fbb5a';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('490326c6-ff85-5925-b252-dba1a2983921', 'dee017ea-338b-5d29-bc31-f193159fbb5a', 'A', 'Plan elective caesarean at 41 weeks by a junior team', false, 0),
  ('976a25a5-760b-5017-9638-a679e3c5e5b0', 'dee017ea-338b-5d29-bc31-f193159fbb5a', 'B', 'Discharge with no follow-up', false, 1),
  ('32385286-5f2f-513b-a38f-d11dbfc04fb9', 'dee017ea-338b-5d29-bc31-f193159fbb5a', 'C', 'Plan delivery in a specialist centre with a multidisciplinary team, blood products available and consent for possible hysterectomy', true, 2),
  ('209c2744-3328-53bb-a443-245354f1ec8e', 'dee017ea-338b-5d29-bc31-f193159fbb5a', 'D', 'Plan a routine vaginal delivery', false, 3),
  ('3299c169-36e5-5d3a-b938-1bf3052b562f', 'dee017ea-338b-5d29-bc31-f193159fbb5a', 'E', 'Start iron and review at term', false, 4);

-- Q124
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('847942ca-3bb2-5c0e-adef-1dafc551ab16', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000008', 'sba', 'A 32 year old woman with a known velamentous cord insertion is in labour. When her membranes rupture there is sudden painless fresh vaginal bleeding, and the CTG immediately shows a fetal bradycardia. Her BP is normal. What is the SINGLE most likely diagnosis?', 'Vasa praevia is when fetal vessels run through the membranes over the cervix. Rupture of the membranes tears the vessels, causing fetal blood loss and rapid fetal distress while the mother remains stable. It needs an immediate category 1 caesarean. If diagnosed antenatally, planned caesarean at 34-36 weeks is advised.', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v3')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = '847942ca-3bb2-5c0e-adef-1dafc551ab16';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('33acf987-7263-5233-9e79-118848132420', '847942ca-3bb2-5c0e-adef-1dafc551ab16', 'A', 'Uterine rupture', false, 0),
  ('23e7c139-2818-55fd-ae38-f96e43f1bb3c', '847942ca-3bb2-5c0e-adef-1dafc551ab16', 'B', 'Cervical ectropion', false, 1),
  ('edd37226-227c-5350-a0a3-e4114c0c0a79', '847942ca-3bb2-5c0e-adef-1dafc551ab16', 'C', 'Placenta praevia', false, 2),
  ('e16e881b-0444-58e4-945a-f98cbd36dec0', '847942ca-3bb2-5c0e-adef-1dafc551ab16', 'D', 'Placental abruption', false, 3),
  ('a64a12e5-eea8-58f8-958b-4db77d0805f5', '847942ca-3bb2-5c0e-adef-1dafc551ab16', 'E', 'Vasa praevia', true, 4);

-- Q125
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('add83cd9-5cbe-5bb9-b180-06a559c69e09', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000008', 'sba', 'A 33 year old woman is in labour, attempting vaginal birth after a previous caesarean. She develops sudden severe abdominal pain, vaginal bleeding, loss of the presenting part, haemodynamic instability and fetal bradycardia. What is the SINGLE most likely diagnosis?', 'Uterine rupture is a rare but life-threatening complication, mostly in women with a previous caesarean scar, especially with oxytocin or prostaglandin augmentation. Signs include abnormal CTG (often the first sign), pain, bleeding, loss of station and maternal shock. It needs immediate laparotomy and delivery.', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v3')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = 'add83cd9-5cbe-5bb9-b180-06a559c69e09';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('6c08e296-8c39-5552-9b4a-5808cae76d6b', 'add83cd9-5cbe-5bb9-b180-06a559c69e09', 'A', 'Placental abruption', false, 0),
  ('5f7b31f7-d920-5a00-93f8-cb4a4b5b5eca', 'add83cd9-5cbe-5bb9-b180-06a559c69e09', 'B', 'Amniotic fluid embolism', false, 1),
  ('d3d95c4e-12af-5942-a7e6-e93cc9111b5b', 'add83cd9-5cbe-5bb9-b180-06a559c69e09', 'C', 'Shoulder dystocia', false, 2),
  ('ff0c95cf-181b-52d4-95bf-b8c01f9576f5', 'add83cd9-5cbe-5bb9-b180-06a559c69e09', 'D', 'Uterine rupture', true, 3),
  ('d35f413e-6e05-5471-b373-f1e820bbb5f3', 'add83cd9-5cbe-5bb9-b180-06a559c69e09', 'E', 'Cord prolapse', false, 4);

-- Q126
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('2f828916-5ea6-5646-8f3d-d44f6d8d90e8', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000008', 'sba', 'A 35 year old woman has just had a rapid labour. She suddenly becomes breathless, cyanosed and hypotensive, then has a seizure and develops bleeding from her cannula sites (DIC). What is the SINGLE most likely diagnosis?', 'Amniotic fluid embolism presents during labour or shortly after delivery with sudden cardiorespiratory collapse, hypoxia, seizures and DIC. It is a clinical diagnosis of exclusion. Management is supportive: resuscitation, perimortem caesarean if in arrest before delivery, massive transfusion and correction of coagulopathy. Mortality is high.', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v3')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = '2f828916-5ea6-5646-8f3d-d44f6d8d90e8';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('424b3e05-6c9e-5ace-849e-547ff7cc6742', '2f828916-5ea6-5646-8f3d-d44f6d8d90e8', 'A', 'Pulmonary embolism', false, 0),
  ('9332ea46-5f64-5dd6-af47-8656c3d2eb35', '2f828916-5ea6-5646-8f3d-d44f6d8d90e8', 'B', 'Amniotic fluid embolism', true, 1),
  ('72a95c3b-49b5-52a0-a6f6-30caead68fbd', '2f828916-5ea6-5646-8f3d-d44f6d8d90e8', 'C', 'Septic shock', false, 2),
  ('5de8e4ac-5aee-5add-a075-fb4ca15146f9', '2f828916-5ea6-5646-8f3d-d44f6d8d90e8', 'D', 'Eclampsia', false, 3),
  ('0d67f5f2-07ba-50e4-9c54-24b51b3e67ad', '2f828916-5ea6-5646-8f3d-d44f6d8d90e8', 'E', 'Anaphylaxis to oxytocin', false, 4);

-- Q127
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('d7f1fd47-6433-53d0-b03d-b4822e3349c6', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000008', 'sba', 'A 28 year old woman had a vaginal delivery 2 weeks ago and is breastfeeding. She wants contraception. Which statement is CORRECT?', 'FSRH guidance: POP and implant can start any time after birth. Combined hormonal contraception is UKMEC 4 under 21 days postpartum, and in breastfeeding women UKMEC 2 from 6 weeks. IUD or IUS can be inserted within 48 hours of birth or from 4 weeks onwards. The lactational amenorrhoea method is over 98% effective only if under 6 months postpartum, amenorrhoeic and fully breastfeeding.', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v3')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = 'd7f1fd47-6433-53d0-b03d-b4822e3349c6';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('837476f8-9651-5ece-b00f-a6386a5a1456', 'd7f1fd47-6433-53d0-b03d-b4822e3349c6', 'A', 'The combined pill is safe to start straight away while breastfeeding', false, 0),
  ('8c41aa20-0451-50f2-a222-c3dffe1aa5c8', 'd7f1fd47-6433-53d0-b03d-b4822e3349c6', 'B', 'Depo-Provera is contraindicated after birth', false, 1),
  ('dba23f25-41f1-5549-8a7f-0c327f95a9c7', 'd7f1fd47-6433-53d0-b03d-b4822e3349c6', 'C', 'A progestogen-only pill or implant can be started at any time after birth', true, 2),
  ('487ea420-e069-5d14-9d3a-74de4edee9b7', 'd7f1fd47-6433-53d0-b03d-b4822e3349c6', 'D', 'Contraception is not needed until her periods return, regardless of breastfeeding pattern', false, 3),
  ('e896a105-af8a-5a7d-8aba-4f7cbdd349ff', 'd7f1fd47-6433-53d0-b03d-b4822e3349c6', 'E', 'An IUD can only be inserted after 6 months', false, 4);

-- Q128
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('24848af7-ae98-530b-8a8c-7ff59132d61c', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000008', 'sba', 'A 26 year old woman has painful regular contractions at 30 weeks. Her cervix is 3 cm dilated and membranes are intact. What is the SINGLE most appropriate treatment to improve neonatal outcomes?', 'For preterm labour: corticosteroids (two doses of IM betamethasone or dexamethasone 24 hours apart) reduce respiratory distress, intraventricular haemorrhage and death (offered 24+0 to 34+6 weeks). Magnesium sulfate for neuroprotection is offered at 24+0 to 29+6 weeks (and considered up to 33+6). Nifedipine tocolysis can delay birth to allow steroids to work or in-utero transfer.', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v3')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = '24848af7-ae98-530b-8a8c-7ff59132d61c';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('0cd5660b-b17f-53d4-9a08-ed3d64850191', '24848af7-ae98-530b-8a8c-7ff59132d61c', 'A', 'Progesterone pessary only', false, 0),
  ('01f614ff-02bb-532b-894f-2a2298813f4f', '24848af7-ae98-530b-8a8c-7ff59132d61c', 'B', 'Antibiotics for all women with intact membranes', false, 1),
  ('a58b3f6f-903e-5ee0-ab13-7c90f7af59d0', '24848af7-ae98-530b-8a8c-7ff59132d61c', 'C', 'Immediate caesarean section', false, 2),
  ('80f89a46-3cfe-5a54-b0e2-80d70481b28c', '24848af7-ae98-530b-8a8c-7ff59132d61c', 'D', 'No treatment; allow labour to progress', false, 3),
  ('9f5138b8-92d4-59e0-b7c8-921702aaadc8', '24848af7-ae98-530b-8a8c-7ff59132d61c', 'E', 'Antenatal corticosteroids, IV magnesium sulfate for neuroprotection, and consider tocolysis (nifedipine)', true, 4);

-- Q129
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('2517459c-3001-51b4-9ede-5c86a2c81e6b', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000008', 'sba', 'A 30 year old woman''s first baby had early-onset group B streptococcal sepsis. She is now pregnant again. What is the SINGLE most appropriate management?', 'RCOG Green-top 36: offer intrapartum IV benzylpenicillin to women with a previous baby affected by GBS disease, GBS found in the current pregnancy, GBS bacteriuria, preterm labour or intrapartum fever. Oral antibiotics before labour do not prevent neonatal infection. GBS is not an indication for caesarean section.', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v3')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = '2517459c-3001-51b4-9ede-5c86a2c81e6b';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('d100ce01-fb07-50f7-beeb-160e462d9e2a', '2517459c-3001-51b4-9ede-5c86a2c81e6b', 'A', 'Vaginal swabs weekly from 20 weeks', false, 0),
  ('5668a4e9-7928-5264-91f3-f0c26d6b08ae', '2517459c-3001-51b4-9ede-5c86a2c81e6b', 'B', 'No action is needed', false, 1),
  ('104c9d92-d2de-50d2-ba42-d0edb8c30790', '2517459c-3001-51b4-9ede-5c86a2c81e6b', 'C', 'Offer IV intrapartum antibiotic prophylaxis (benzylpenicillin) in labour', true, 2),
  ('f9b2172c-07e9-5239-a6f6-3ee6e77e16c9', '2517459c-3001-51b4-9ede-5c86a2c81e6b', 'D', 'Elective caesarean section to avoid GBS', false, 3),
  ('de19767b-272f-5d7a-99fb-203278abdee1', '2517459c-3001-51b4-9ede-5c86a2c81e6b', 'E', 'Treat with oral antibiotics at 36 weeks only', false, 4);

-- Q130
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('5a815830-1dc5-56ef-9856-5bcad9b8355a', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000008', 'sba', 'A 32 year old woman has identical twins (monochorionic diamniotic). At 20 weeks, one twin has polyhydramnios and a large bladder, and the other has oligohydramnios with no visible bladder. What is the SINGLE most likely diagnosis?', 'TTTS occurs in monochorionic twins because of unbalanced vascular connections in the shared placenta. The recipient becomes overloaded (polyhydramnios, large bladder, heart failure), and the donor becomes underfilled (oligohydramnios, ''stuck twin''). Monochorionic twins are scanned every 2 weeks from 16 weeks. Treatment is fetoscopic laser ablation of the connecting vessels.', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v3')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = '5a815830-1dc5-56ef-9856-5bcad9b8355a';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('2e60d455-28bd-5fbf-9e18-0767c6af8564', '5a815830-1dc5-56ef-9856-5bcad9b8355a', 'A', 'Dichorionic twin growth discordance', false, 0),
  ('71101e64-8e23-5aa5-b25d-fce2d5d855bf', '5a815830-1dc5-56ef-9856-5bcad9b8355a', 'B', 'Selective fetal growth restriction only', false, 1),
  ('7b74af3c-9dee-5ff5-ba33-1669dc9b7bf8', '5a815830-1dc5-56ef-9856-5bcad9b8355a', 'C', 'Fetal anaemia from parvovirus', false, 2),
  ('a65fd4d5-d39c-5bdc-8dba-a644aacb9be0', '5a815830-1dc5-56ef-9856-5bcad9b8355a', 'D', 'Placental abruption', false, 3),
  ('7f365ea5-d77d-58f5-bbcb-d7005bcd09ee', '5a815830-1dc5-56ef-9856-5bcad9b8355a', 'E', 'Twin-to-twin transfusion syndrome', true, 4);

-- Q131
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('c78b827c-a9ce-5682-9626-9625a8bc77cb', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000008', 'sba', 'A 38 year old woman is 12 weeks pregnant. She asks about screening for Down syndrome. What is the SINGLE most appropriate first-line screening test offered in England?', 'The NHS fetal anomaly screening programme offers the combined test at 11+2 to 14+1 weeks (quadruple test at 14+2 to 20+0 if too late). A higher-chance result (1 in 150 or higher) leads to an offer of NIPT (cell-free DNA) or diagnostic testing (CVS or amniocentesis). In Down syndrome, beta-hCG is high, PAPP-A is low and nuchal translucency is increased.', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v3')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = 'c78b827c-a9ce-5682-9626-9625a8bc77cb';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('6bb6fec6-bd8f-5e50-b334-30705d4b7e26', 'c78b827c-a9ce-5682-9626-9625a8bc77cb', 'A', 'Quadruple test at 10 weeks', false, 0),
  ('0e609567-7df6-5c9b-b12c-c15abe281c85', 'c78b827c-a9ce-5682-9626-9625a8bc77cb', 'B', 'Karyotyping of both parents', false, 1),
  ('413231b5-5b5e-50c0-92c8-d7a4aa70ef87', 'c78b827c-a9ce-5682-9626-9625a8bc77cb', 'C', 'Amniocentesis for all', false, 2),
  ('5891928e-6fde-5fca-99e8-a72da77a92bb', 'c78b827c-a9ce-5682-9626-9625a8bc77cb', 'D', 'Combined test (nuchal translucency, beta-hCG and PAPP-A with maternal age) at 10-14 weeks', true, 3),
  ('391a3224-8ef9-5a99-bffc-20899b19bb54', 'c78b827c-a9ce-5682-9626-9625a8bc77cb', 'E', 'Chorionic villus sampling for all women over 35', false, 4);

-- Q132
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('56344b26-8501-5b0c-99fb-e60ce497e324', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000008', 'sba', 'A 29 year old woman takes levothyroxine for hypothyroidism. She has just found out she is 5 weeks pregnant. What is the SINGLE most appropriate advice?', 'Thyroxine requirements rise early in pregnancy. Untreated hypothyroidism is linked to miscarriage, pre-eclampsia and impaired fetal neurodevelopment. Increase the dose as soon as pregnancy is confirmed and check TFTs every 4-6 weeks, aiming for the trimester-specific TSH range. Return to the pre-pregnancy dose after delivery.', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v3')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = '56344b26-8501-5b0c-99fb-e60ce497e324';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('8cf84953-7359-56f0-8b67-85a70ffa3620', '56344b26-8501-5b0c-99fb-e60ce497e324', 'A', 'Switch to carbimazole', false, 0),
  ('338dfd42-62be-5333-be6f-05f8c8105052', '56344b26-8501-5b0c-99fb-e60ce497e324', 'B', 'Stop levothyroxine because it is teratogenic', false, 1),
  ('33ae562c-a91d-59ec-9e0b-a44550a5792b', '56344b26-8501-5b0c-99fb-e60ce497e324', 'C', 'Increase her levothyroxine dose (often by 25-50 micrograms or about 30%) and check TFTs regularly', true, 2),
  ('d5babbb0-bf2f-5170-96b8-56bbb8ca4030', '56344b26-8501-5b0c-99fb-e60ce497e324', 'D', 'Halve her dose', false, 3),
  ('58650e61-e357-59f0-b711-f34798b0e045', '56344b26-8501-5b0c-99fb-e60ce497e324', 'E', 'Keep the dose the same until the third trimester', false, 4);

-- Q133
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('17b1bbf3-2e28-52f8-a940-fa3260d79f65', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000008', 'sba', 'A 30 year old woman with type 1 diabetes is planning a pregnancy. What HbA1c target is advised before conception?', 'NICE NG3 advises aiming for HbA1c below 48 mmol/mol before conception and avoiding pregnancy if HbA1c is above 86 mmol/mol, due to the high risk of congenital anomalies and miscarriage. Folic acid 5 mg daily is advised from before conception until 12 weeks. Retinal and renal assessment are needed. Aspirin from 12 weeks reduces pre-eclampsia risk.', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v3')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = '17b1bbf3-2e28-52f8-a940-fa3260d79f65';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('207a8ee9-5a36-560e-9bac-9503f82d4c5c', '17b1bbf3-2e28-52f8-a940-fa3260d79f65', 'A', 'Above 53 mmol/mol to avoid hypoglycaemia', false, 0),
  ('be98989f-6a9f-527d-a290-790ba301c281', '17b1bbf3-2e28-52f8-a940-fa3260d79f65', 'B', 'Below 75 mmol/mol', false, 1),
  ('06b01dc3-da4b-51fe-8184-90963f6cf2d0', '17b1bbf3-2e28-52f8-a940-fa3260d79f65', 'C', 'Below 86 mmol/mol', false, 2),
  ('7a20717f-3223-5238-be63-9fbb8906c8d2', '17b1bbf3-2e28-52f8-a940-fa3260d79f65', 'D', 'There is no target', false, 3),
  ('614cb118-74ce-552e-867d-52ec78d28a7d', '17b1bbf3-2e28-52f8-a940-fa3260d79f65', 'E', 'Below 48 mmol/mol (6.5%) if it can be achieved without problematic hypoglycaemia', true, 4);

-- Q134
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('7caaad47-55ee-5edb-9fe3-c8d2f75c5e18', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000008', 'sba', 'A 28 year old woman had gestational diabetes treated with metformin in pregnancy. She delivered 6 weeks ago. What follow-up is MOST appropriate?', 'NICE NG3: blood glucose-lowering treatment is usually stopped after birth in gestational diabetes. Offer fasting glucose at 6-13 weeks (HbA1c if later), then annual HbA1c. There is a high lifetime risk of type 2 diabetes. In future pregnancies, she should have early self-monitoring or an OGTT.', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v3')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = '7caaad47-55ee-5edb-9fe3-c8d2f75c5e18';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('02021346-a64c-502a-8a06-67b765b52f99', '7caaad47-55ee-5edb-9fe3-c8d2f75c5e18', 'A', 'Repeat glucose only in a future pregnancy', false, 0),
  ('60042bd6-a6dd-5ca7-9016-65b3d706ad5e', '7caaad47-55ee-5edb-9fe3-c8d2f75c5e18', 'B', 'OGTT at 1 week postpartum', false, 1),
  ('c8f16131-3552-5e26-899b-a60cfbcca4ff', '7caaad47-55ee-5edb-9fe3-c8d2f75c5e18', 'C', 'Continue metformin lifelong', false, 2),
  ('2c4af417-f30a-5b1f-8fbb-4993e848e950', '7caaad47-55ee-5edb-9fe3-c8d2f75c5e18', 'D', 'No follow-up is needed', false, 3),
  ('676ab145-50e4-5c83-a1b4-5eb99fb07042', '7caaad47-55ee-5edb-9fe3-c8d2f75c5e18', 'E', 'Stop metformin after birth; check fasting glucose or HbA1c 6-13 weeks postpartum, then annual HbA1c', true, 4);

-- Q135
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('79157b06-d632-5679-b6e1-889230492aef', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000008', 'sba', 'A 24 year old woman had a vaginal delivery. Examination shows a tear involving the perineal skin, perineal muscles and more than 50% of the external anal sphincter, but the internal sphincter and anal mucosa are intact. What degree of tear is this?', 'RCOG classification: 1st degree = skin only; 2nd = perineal muscles; 3a = under 50% of external anal sphincter; 3b = over 50% of EAS; 3c = EAS and internal anal sphincter; 4th = including anal mucosa. Obstetric anal sphincter injuries are repaired in theatre with antibiotics and laxatives, and followed up for incontinence.', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v3')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = '79157b06-d632-5679-b6e1-889230492aef';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('c155a8f9-9558-5364-81b2-9b3e14ad3762', '79157b06-d632-5679-b6e1-889230492aef', 'A', 'Third-degree tear (3b)', true, 0),
  ('f7a57814-c4b0-5c45-80ba-4506bbdb7ae7', '79157b06-d632-5679-b6e1-889230492aef', 'B', 'Second-degree tear', false, 1),
  ('62d95686-b262-528f-9983-00679906db37', '79157b06-d632-5679-b6e1-889230492aef', 'C', 'Fourth-degree tear', false, 2),
  ('52bb7b73-b801-5807-baa4-c59368c6936a', '79157b06-d632-5679-b6e1-889230492aef', 'D', 'Third-degree tear (3c)', false, 3),
  ('4eb9d119-88bc-5545-9d62-2c2923c3c5fd', '79157b06-d632-5679-b6e1-889230492aef', 'E', 'Third-degree tear (3a)', false, 4);

-- Q136
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('84f5e34f-3a26-525d-9552-393fe40df166', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000008', 'sba', 'A 30 year old woman delivered her baby. Controlled cord traction was applied before the uterus contracted. She now has severe pain, profound shock out of proportion to blood loss, and a mass in the vagina, and the fundus cannot be felt abdominally. What is the SINGLE most likely diagnosis?', 'Uterine inversion is a rare emergency caused by excessive cord traction or fundal pressure. It causes neurogenic and hypovolaemic shock. Management is immediate manual replacement (Johnson manoeuvre) without removing the placenta, fluids and blood, then oxytocics once reduced. Hydrostatic or surgical reduction may be needed.', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v3')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = '84f5e34f-3a26-525d-9552-393fe40df166';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('e3cfa030-9cca-50ad-97c1-d6953c89be22', '84f5e34f-3a26-525d-9552-393fe40df166', 'A', 'Acute uterine inversion', true, 0),
  ('11146040-3918-5afa-9d11-a667ff46e4e4', '84f5e34f-3a26-525d-9552-393fe40df166', 'B', 'Vaginal haematoma', false, 1),
  ('04e50361-8e66-5f0f-8844-5b9349383050', '84f5e34f-3a26-525d-9552-393fe40df166', 'C', 'Cervical tear', false, 2),
  ('ad7319c3-f7be-5c6c-bfcc-b048e3532cc8', '84f5e34f-3a26-525d-9552-393fe40df166', 'D', 'Uterine atony', false, 3),
  ('bb9e2a06-6f60-5a2c-b7b4-1b44a8289938', '84f5e34f-3a26-525d-9552-393fe40df166', 'E', 'Retained placenta', false, 4);

-- Q137
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('459b14b6-1444-5537-8e0e-8333d1dfaad2', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000008', 'sba', 'A 32 year old woman had a surgical evacuation for retained products of conception with curettage and subsequent infection. She now has had no periods for 8 months. Hormone tests are normal and a progestogen challenge produces no bleed. What is the SINGLE most likely diagnosis?', 'Asherman''s syndrome is intrauterine scarring after curettage (especially postpartum or with infection), causing amenorrhoea or hypomenorrhoea and subfertility. Hormones are normal, and there is no bleed after oestrogen-progestogen challenge. Diagnosis and treatment are by hysteroscopy (adhesiolysis).', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v3')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = '459b14b6-1444-5537-8e0e-8333d1dfaad2';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('2e4b9060-485c-5c63-9875-d5b7154b6a12', '459b14b6-1444-5537-8e0e-8333d1dfaad2', 'A', 'Polycystic ovary syndrome', false, 0),
  ('16ba4de3-73df-5ed6-8eeb-bf9f8d6e9b56', '459b14b6-1444-5537-8e0e-8333d1dfaad2', 'B', 'Asherman''s syndrome (intrauterine adhesions)', true, 1),
  ('b899dc36-9845-5d40-b3f6-384c4c71cf4d', '459b14b6-1444-5537-8e0e-8333d1dfaad2', 'C', 'Pregnancy', false, 2),
  ('03a8738b-fbd8-58f7-bc33-b0d8f8b82da8', '459b14b6-1444-5537-8e0e-8333d1dfaad2', 'D', 'Premature ovarian insufficiency', false, 3),
  ('a0fd54cb-131b-5fad-9f76-aad24b2669b2', '459b14b6-1444-5537-8e0e-8333d1dfaad2', 'E', 'Sheehan''s syndrome', false, 4);

-- Q138
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('e5ecb3d7-6c5e-5ad1-a1b7-7101078855a8', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000008', 'sba', 'A 62 year old woman with a BMI of 41, type 2 diabetes and nulliparity has postmenopausal bleeding. Which feature MOST increases her risk of endometrial cancer?', 'Endometrial cancer risk factors relate to unopposed oestrogen: obesity, nulliparity, early menarche or late menopause, PCOS, oestrogen-only HRT, tamoxifen, and Lynch syndrome. Diabetes is also a risk factor. The combined pill, smoking and multiparity are protective. Postmenopausal bleeding needs a 2-week-wait referral and transvaginal ultrasound (endometrium 4 mm or more is abnormal).', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v3')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = 'e5ecb3d7-6c5e-5ad1-a1b7-7101078855a8';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('6eaa51b7-f62c-5cdd-9a4e-53163f8b2cef', 'e5ecb3d7-6c5e-5ad1-a1b7-7101078855a8', 'A', 'Use of the combined pill for 10 years', false, 0),
  ('a311d3e7-12e1-5b3b-b3d0-e377b31529e1', 'e5ecb3d7-6c5e-5ad1-a1b7-7101078855a8', 'B', 'Unopposed oestrogen exposure (e.g. obesity through peripheral aromatisation)', true, 1),
  ('64bdbfcf-d9a4-5300-a0b8-d23c37eb7288', 'e5ecb3d7-6c5e-5ad1-a1b7-7101078855a8', 'C', 'Previous tubal ligation', false, 2),
  ('2937d0d7-9986-5d58-8b43-ce1a327e938e', 'e5ecb3d7-6c5e-5ad1-a1b7-7101078855a8', 'D', 'Smoking', false, 3),
  ('92fc2023-93a6-5646-a88e-4f816ac0c6b8', 'e5ecb3d7-6c5e-5ad1-a1b7-7101078855a8', 'E', 'Multiparity', false, 4);

-- Q139
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('66a3adca-0be5-5beb-bb8a-ad0a45f1eee5', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000008', 'sba', 'A 28 year old woman has a 6 cm right adnexal mass on ultrasound containing fat, hair and a calcified tooth-like structure. She is asymptomatic. What is the SINGLE most likely diagnosis?', 'Dermoid cysts are the most common ovarian germ cell tumour in young women. They contain tissue from all 3 germ layers (hair, sebaceous material, teeth). They carry a risk of torsion because they are heavy, and rarely rupture or become malignant. Laparoscopic cystectomy preserves the ovary.', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v3')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = '66a3adca-0be5-5beb-bb8a-ad0a45f1eee5';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('05968b43-81f2-5ca3-a0ec-63e9cf100a52', '66a3adca-0be5-5beb-bb8a-ad0a45f1eee5', 'A', 'Mature cystic teratoma (dermoid cyst)', true, 0),
  ('d5f4194a-d0fb-52fc-9519-6bfbc19c8d44', '66a3adca-0be5-5beb-bb8a-ad0a45f1eee5', 'B', 'Corpus luteum cyst', false, 1),
  ('7213de04-f84a-5c17-bc52-91bd5f88a8cb', '66a3adca-0be5-5beb-bb8a-ad0a45f1eee5', 'C', 'Endometrioma', false, 2),
  ('9bb4af9c-c9a7-59cb-a955-fbff84d61a25', '66a3adca-0be5-5beb-bb8a-ad0a45f1eee5', 'D', 'Serous cystadenoma', false, 3),
  ('d34d2548-3605-55ba-b0aa-15164aa10a94', '66a3adca-0be5-5beb-bb8a-ad0a45f1eee5', 'E', 'Granulosa cell tumour', false, 4);

-- Q140
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('08d5c5ee-3513-5628-b83c-7b50b07fbf43', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000008', 'sba', 'A 64 year old woman has an ovarian mass, ascites and a right pleural effusion. After removal of a benign ovarian fibroma, the ascites and effusion resolve. What is the name of this condition?', 'Meigs'' syndrome is the triad of a benign ovarian tumour (usually a fibroma), ascites and pleural effusion (usually right), which all resolve after the tumour is removed. Malignancy must be excluded. A Krukenberg tumour is an ovarian metastasis from a GI primary (often gastric) with signet-ring cells.', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v3')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = '08d5c5ee-3513-5628-b83c-7b50b07fbf43';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('c84975e8-48b2-53e5-a205-673c94b75541', '08d5c5ee-3513-5628-b83c-7b50b07fbf43', 'A', 'Meigs'' syndrome', true, 0),
  ('c067f978-d26d-57e9-9523-08ea99ce5006', '08d5c5ee-3513-5628-b83c-7b50b07fbf43', 'B', 'Budd-Chiari syndrome', false, 1),
  ('91c18ffd-2c17-55bd-a3f3-e3509b02865b', '08d5c5ee-3513-5628-b83c-7b50b07fbf43', 'C', 'Pseudo-Meigs'' syndrome due to malignancy', false, 2),
  ('10457479-a061-58d0-b1c9-1e3fceaf273c', '08d5c5ee-3513-5628-b83c-7b50b07fbf43', 'D', 'Ovarian hyperstimulation syndrome', false, 3),
  ('cffd364e-af23-558f-9325-6cfd49633682', '08d5c5ee-3513-5628-b83c-7b50b07fbf43', 'E', 'Krukenberg tumour', false, 4);

-- Q141
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('54314660-06bb-5935-9814-c7eda383f970', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000008', 'sba', 'A 27 year old woman with known fibroids is 18 weeks pregnant. She has acute localised abdominal pain over a fibroid, low-grade fever and vomiting. Ultrasound shows a fibroid with central degeneration. What is the SINGLE most appropriate management?', 'Red (carneous) degeneration happens when a fibroid outgrows its blood supply, usually in the second trimester. It causes pain, tenderness, low-grade fever and a raised WCC. It is managed conservatively and settles within days. Myomectomy in pregnancy is avoided because of haemorrhage risk.', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v3')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = '54314660-06bb-5935-9814-c7eda383f970';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('021b6380-04cf-5c6e-855d-ef7c4da1b912', '54314660-06bb-5935-9814-c7eda383f970', 'A', 'Immediate caesarean section', false, 0),
  ('ce5cfd58-c455-5a03-ad5b-fb89d6e17898', '54314660-06bb-5935-9814-c7eda383f970', 'B', 'Conservative: rest, analgesia (avoid NSAIDs after 30 weeks) and hydration', true, 1),
  ('262444c0-daf3-5c98-815c-c9c6cf04b24f', '54314660-06bb-5935-9814-c7eda383f970', 'C', 'IV antibiotics only', false, 2),
  ('d229e8dd-388a-54a2-aada-f11fc66babc9', '54314660-06bb-5935-9814-c7eda383f970', 'D', 'Emergency myomectomy', false, 3),
  ('d2bb19be-e937-54a9-8005-beae1df5fccb', '54314660-06bb-5935-9814-c7eda383f970', 'E', 'Termination of pregnancy', false, 4);

-- Q142
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('49aa1cf1-3e6d-5283-a6ba-950a9fc7b154', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000008', 'sba', 'A 55 year old woman has vaginal dryness and painful intercourse 3 years after her last period. She has no vasomotor symptoms. What is the SINGLE most appropriate first-line treatment?', 'Genitourinary syndrome of menopause (vaginal atrophy) is treated with vaginal oestrogen, which can be used long term, even alongside systemic HRT. No progestogen is needed with low-dose vaginal oestrogen. Moisturisers and lubricants are also helpful. Ospemifene and vaginal prasterone are alternatives.', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v3')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = '49aa1cf1-3e6d-5283-a6ba-950a9fc7b154';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('cb130177-56fe-5353-9d85-30e622da1c99', '49aa1cf1-3e6d-5283-a6ba-950a9fc7b154', 'A', 'Systemic combined HRT', false, 0),
  ('ee41106b-64ce-50e8-a603-609baaaa4209', '49aa1cf1-3e6d-5283-a6ba-950a9fc7b154', 'B', 'Topical clotrimazole', false, 1),
  ('8e5d4cb0-f1f3-5fab-9ce7-50531ebf6915', '49aa1cf1-3e6d-5283-a6ba-950a9fc7b154', 'C', 'Vaginal oestrogen (cream, pessary or ring), with moisturisers and lubricants', true, 2),
  ('3db65afa-f3d4-5f6e-8141-71d55635fa19', '49aa1cf1-3e6d-5283-a6ba-950a9fc7b154', 'D', 'Oral tranexamic acid', false, 3),
  ('118e9ecf-748b-58b6-bc08-301564f56236', '49aa1cf1-3e6d-5283-a6ba-950a9fc7b154', 'E', 'Oral oxybutynin', false, 4);

-- Q143
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('74c49fef-87b9-580f-872c-8cbd8e6a921b', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000008', 'sba', 'A 51 year old woman with a history of oestrogen-receptor-positive breast cancer has troublesome hot flushes. What is the SINGLE most appropriate management?', 'HRT is generally contraindicated after breast cancer. Non-hormonal options for vasomotor symptoms include venlafaxine, citalopram, clonidine, gabapentin, and the newer neurokinin-3 antagonist fezolinetant. Paroxetine and fluoxetine inhibit CYP2D6 and can reduce tamoxifen''s effectiveness. CBT can help.', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v3')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = '74c49fef-87b9-580f-872c-8cbd8e6a921b';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('bb19be38-a9b4-5728-9560-68c2ce84c397', '74c49fef-87b9-580f-872c-8cbd8e6a921b', 'A', 'Start combined HRT', false, 0),
  ('a6ea9403-ab97-51f5-a208-9cf1dff0aee5', '74c49fef-87b9-580f-872c-8cbd8e6a921b', 'B', 'Start tibolone', false, 1),
  ('038f176b-b18f-553d-b714-8c3bfca910a1', '74c49fef-87b9-580f-872c-8cbd8e6a921b', 'C', 'Avoid HRT; consider non-hormonal options such as an SSRI/SNRI (avoid fluoxetine/paroxetine with tamoxifen), gabapentin or fezolinetant', true, 2),
  ('b1f76f8b-447e-5b44-bff7-dacbd4c2f85d', '74c49fef-87b9-580f-872c-8cbd8e6a921b', 'D', 'Start oestrogen-only HRT', false, 3),
  ('5637998a-dd84-5668-96c5-0c04bfcdf005', '74c49fef-87b9-580f-872c-8cbd8e6a921b', 'E', 'Vaginal oestrogen for systemic symptoms', false, 4);

-- Q144
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('345c1204-bd65-560d-af8c-b00cfbef7698', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000008', 'sba', 'A 47 year old woman is using the combined pill for contraception. She asks how long she needs to continue contraception. What is the CORRECT advice?', 'FSRH: the combined pill can be used until age 50 if there are no contraindications, then a non-oestrogen method is advised. Women can stop contraception at 55 (natural loss of fertility). Under 50 with amenorrhoea, contraception continues for 2 years after the last period. Over 50, it continues for 1 year.', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v3')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = '345c1204-bd65-560d-af8c-b00cfbef7698';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('b1530a39-0750-5d08-940f-0c96a4d28023', '345c1204-bd65-560d-af8c-b00cfbef7698', 'A', 'She can stop now at 47', false, 0),
  ('a8e23c87-e5f2-5acc-9822-4665a5ab1d1e', '345c1204-bd65-560d-af8c-b00cfbef7698', 'B', 'She needs contraception for 1 year after any missed period at any age', false, 1),
  ('0271d737-409c-5091-9f47-258bd19da4d5', '345c1204-bd65-560d-af8c-b00cfbef7698', 'C', 'The combined pill is safe until 60', false, 2),
  ('c1fa7dc5-80bc-5f9a-8a82-912c72adfad9', '345c1204-bd65-560d-af8c-b00cfbef7698', 'D', 'Contraception is needed until age 50 (then switch to a non-oestrogen method), and can usually stop at 55', true, 3),
  ('43508aa1-085f-584a-9bcf-6f0dd309ad04', '345c1204-bd65-560d-af8c-b00cfbef7698', 'E', 'She needs contraception until 70', false, 4);

-- Q145
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('e6025abb-8263-5389-afb3-4c9ee9bdae1d', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000008', 'sba', 'A 30 year old woman has a copper IUD. At her check-up, the threads cannot be seen. She has not had a period since her last menses 2 weeks ago and has no pain. What is the SINGLE most appropriate next step?', 'If the threads are missing, exclude pregnancy and advise alternative contraception until the device is located. Ultrasound shows whether it is in the uterus. If it is not seen, an X-ray looks for it in the abdomen (perforation), which needs laparoscopic removal. It may also have been expelled.', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v3')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = 'e6025abb-8263-5389-afb3-4c9ee9bdae1d';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('0d6964e4-fddf-5d58-9ec2-2769b7886908', 'e6025abb-8263-5389-afb3-4c9ee9bdae1d', 'A', 'Pregnancy test, use additional contraception, and arrange pelvic ultrasound to locate the device', true, 0),
  ('7a8e5de7-99c7-5f75-8a04-f5e38240d93c', 'e6025abb-8263-5389-afb3-4c9ee9bdae1d', 'B', 'Abdominal X-ray as first-line', false, 1),
  ('aeecd4f4-ba1e-53af-adff-1329a52d4dba', 'e6025abb-8263-5389-afb3-4c9ee9bdae1d', 'C', 'Remove the threads blindly with forceps in clinic', false, 2),
  ('633c4c92-e993-5a08-bbf8-38281af5f90b', 'e6025abb-8263-5389-afb3-4c9ee9bdae1d', 'D', 'Reassure; no action', false, 3),
  ('10ecdb7f-a3e5-5520-a009-8fc91bb0f673', 'e6025abb-8263-5389-afb3-4c9ee9bdae1d', 'E', 'Insert a second IUD', false, 4);

-- Q146
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('e43d70d3-7ef6-568c-a27f-69b9fc7eedaa', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000008', 'sba', 'A 21 year old woman had unprotected sex 3 days ago. She does not want an IUD. She is on day 14 of her cycle and takes no regular medication. Her BMI is 23. Which oral emergency contraception is MOST effective?', 'The copper IUD is the most effective emergency contraception. Of the oral options, ulipristal is more effective than levonorgestrel and is licensed up to 120 hours. Ulipristal''s effect is reduced by progestogens taken in the 5 days before or after it, so hormonal contraception should wait 5 days. Levonorgestrel is licensed for up to 72 hours (double dose if BMI over 26 or weight over 70 kg).', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v3')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = 'e43d70d3-7ef6-568c-a27f-69b9fc7eedaa';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('b6e3aeb8-40a9-5acb-a8e4-b5917bdcda90', 'e43d70d3-7ef6-568c-a27f-69b9fc7eedaa', 'A', 'Combined pill (Yuzpe method)', false, 0),
  ('363cdcd2-d238-5162-865e-06b46b46f78c', 'e43d70d3-7ef6-568c-a27f-69b9fc7eedaa', 'B', 'Mifepristone 200 mg', false, 1),
  ('f8878ae6-a623-5f2b-a97c-a38063281257', 'e43d70d3-7ef6-568c-a27f-69b9fc7eedaa', 'C', 'Levonorgestrel 1.5 mg only up to 72 hours is more effective', false, 2),
  ('9c7b9956-5439-5f97-94f6-a258d86b0a32', 'e43d70d3-7ef6-568c-a27f-69b9fc7eedaa', 'D', 'Ulipristal acetate 30 mg (within 120 hours)', true, 3),
  ('21c69d21-d5f3-5d7b-8b8c-a8b0e28d746e', 'e43d70d3-7ef6-568c-a27f-69b9fc7eedaa', 'E', 'Doxycycline', false, 4);

-- Q147
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('8e81a597-e976-53eb-bdf7-ded70416e59a', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000008', 'sba', 'A 16 year old girl has not started her periods. She has short stature, a webbed neck, widely spaced nipples and a heart murmur. What is the SINGLE most appropriate investigation?', 'Turner syndrome (45,X) causes primary amenorrhoea due to streak ovaries (high FSH/LH), short stature, webbed neck, lymphoedema, coarctation of the aorta, bicuspid aortic valve and horseshoe kidney. Karyotype confirms it. Management includes growth hormone, oestrogen replacement for puberty, and cardiac and renal monitoring.', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v3')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = '8e81a597-e976-53eb-bdf7-ded70416e59a';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('cd158461-205b-5d60-8cf0-46eb1c566323', '8e81a597-e976-53eb-bdf7-ded70416e59a', 'A', 'Thyroid function tests only', false, 0),
  ('614d33a2-a038-580b-918c-4580e842f6a7', '8e81a597-e976-53eb-bdf7-ded70416e59a', 'B', 'Karyotype', true, 1),
  ('7de8db17-9309-50b0-a287-c31c707617e9', '8e81a597-e976-53eb-bdf7-ded70416e59a', 'C', 'Pelvic ultrasound only', false, 2),
  ('edcedc87-3c69-5e8e-81d8-7a5d43d78409', '8e81a597-e976-53eb-bdf7-ded70416e59a', 'D', 'MRI pituitary', false, 3),
  ('30047989-30d2-54b1-9854-4fdf301a0112', '8e81a597-e976-53eb-bdf7-ded70416e59a', 'E', 'Serum prolactin', false, 4);

-- Q148
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('f608cf4e-1548-56cf-bc1f-528d62f757c0', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000008', 'sba', 'A 16 year old girl has primary amenorrhoea with normal breast development but sparse pubic and axillary hair. Ultrasound shows no uterus, and there are bilateral inguinal masses. Testosterone is in the male range. What is the SINGLE most likely diagnosis?', 'Complete androgen insensitivity (46,XY, X-linked androgen receptor mutation) results in female external genitalia, breast development (from aromatisation of testosterone), absent or sparse body hair, no uterus, and undescended testes. Gonadectomy (because of malignancy risk) is usually done after puberty, then oestrogen replacement. Psychological support is important.', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v3')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = 'f608cf4e-1548-56cf-bc1f-528d62f757c0';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('2194bc66-63f2-5c8f-8416-613e1be1b18f', 'f608cf4e-1548-56cf-bc1f-528d62f757c0', 'A', 'Kallmann syndrome', false, 0),
  ('ddd91f92-f319-5883-8f6b-c6be4b27e7cc', 'f608cf4e-1548-56cf-bc1f-528d62f757c0', 'B', 'Mayer-Rokitansky-Küster-Hauser syndrome', false, 1),
  ('0f308616-3ec3-5eeb-ab71-a40ffb037a2e', 'f608cf4e-1548-56cf-bc1f-528d62f757c0', 'C', 'Complete androgen insensitivity syndrome', true, 2),
  ('5fe89fd2-31d8-5442-9b8f-c5ba09825997', 'f608cf4e-1548-56cf-bc1f-528d62f757c0', 'D', 'Imperforate hymen', false, 3),
  ('7128fc53-be38-5080-b5d8-a57da762626f', 'f608cf4e-1548-56cf-bc1f-528d62f757c0', 'E', 'Turner syndrome', false, 4);

-- Q149
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('9cd5aa8f-cbd1-5798-bcf3-4684e57e5aff', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000008', 'sba', 'A 14 year old girl has cyclical lower abdominal pain each month for 4 months, but no periods. She has normal secondary sexual characteristics. On examination there is a bulging bluish membrane at the introitus. What is the SINGLE most likely diagnosis?', 'An imperforate hymen causes retained menstrual blood in the vagina (haematocolpos) with cyclical pain, primary amenorrhoea and a bluish bulging membrane. It may also cause urinary retention. Treatment is a surgical hymenotomy. A transverse vaginal septum gives a similar picture but without the bulging membrane at the introitus.', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v3')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = '9cd5aa8f-cbd1-5798-bcf3-4684e57e5aff';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('0545517d-0ab9-53c6-bae1-28eedfebb2b9', '9cd5aa8f-cbd1-5798-bcf3-4684e57e5aff', 'A', 'Turner syndrome', false, 0),
  ('7c8a4cd0-bc93-5c12-894d-fc410dcfdb83', '9cd5aa8f-cbd1-5798-bcf3-4684e57e5aff', 'B', 'Androgen insensitivity', false, 1),
  ('0eab51d0-b3b1-5cfb-9457-71c3ed8aa89d', '9cd5aa8f-cbd1-5798-bcf3-4684e57e5aff', 'C', 'Ovarian torsion', false, 2),
  ('eec1764b-c54c-5e89-9bf1-18bb9c525b5e', '9cd5aa8f-cbd1-5798-bcf3-4684e57e5aff', 'D', 'Pregnancy', false, 3),
  ('daa078f7-6f4b-5550-87fe-29a65fd13f13', '9cd5aa8f-cbd1-5798-bcf3-4684e57e5aff', 'E', 'Imperforate hymen (haematocolpos)', true, 4);

-- Q150
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('fa828c0f-ee0e-5de5-b59d-7c906677356c', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000008', 'sba', 'A 50 year old woman with a BRCA1 mutation asks about reducing her ovarian cancer risk. She has completed her family. What is the SINGLE most effective option?', 'BRCA1 carriers have a lifetime ovarian cancer risk of about 40%. Screening is not effective. Risk-reducing bilateral salpingo-oophorectomy (usually from 35-40 for BRCA1 and 40-45 for BRCA2, after childbearing) greatly reduces the risk of ovarian and fallopian tube cancer. Premenopausal oophorectomy causes surgical menopause, so HRT may be considered (until natural menopause age if no breast cancer).', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v3')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = 'fa828c0f-ee0e-5de5-b59d-7c906677356c';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('f580d644-7e88-5f13-806f-995db84a731b', 'fa828c0f-ee0e-5de5-b59d-7c906677356c', 'A', 'Hysterectomy alone', false, 0),
  ('964e79f3-bcba-5bcf-a89a-2ac15a6f87f6', 'fa828c0f-ee0e-5de5-b59d-7c906677356c', 'B', 'Combined pill only', false, 1),
  ('02ccd3a6-db89-5e82-931f-b1afe34baa2a', 'fa828c0f-ee0e-5de5-b59d-7c906677356c', 'C', 'Annual CA-125 and ultrasound screening as equally effective', false, 2),
  ('ac1e4ce3-220d-586a-8df0-3c3e6bf040b0', 'fa828c0f-ee0e-5de5-b59d-7c906677356c', 'D', 'Risk-reducing bilateral salpingo-oophorectomy', true, 3),
  ('1a1067f6-4a19-51be-849d-122fed538fd0', 'fa828c0f-ee0e-5de5-b59d-7c906677356c', 'E', 'No intervention is effective', false, 4);

-- Q151
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('d7358043-2ba6-5065-ade3-c397b7c6e335', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000008', 'sba', 'A 30 year old woman asks about the NHS cervical screening programme in England. Which statement is CORRECT?', 'England uses primary HPV testing, with cytology only if HPV is positive. Screening is invited from 25 to 64. Since 2025, HPV-negative women aged 25-49 are recalled every 5 years in England (previously every 3). Over 65s are screened only if recent results were abnormal. Women who have had a total hysterectomy for benign reasons do not need screening.', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v3')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = 'd7358043-2ba6-5065-ade3-c397b7c6e335';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('dc2f1f47-0b79-58a5-9c46-697bb94a4ad9', 'd7358043-2ba6-5065-ade3-c397b7c6e335', 'A', 'Screening is annual for all women', false, 0),
  ('e7bff779-2399-5efc-bedc-3dcd7aa4c01c', 'd7358043-2ba6-5065-ade3-c397b7c6e335', 'B', 'Screening is offered every 3 years from 25 to 49 and every 5 years from 50 to 64, with primary HPV testing (extended intervals being introduced for HPV-negative results)', true, 1),
  ('39f75626-9573-5659-9806-f2cbd3c51717', 'd7358043-2ba6-5065-ade3-c397b7c6e335', 'C', 'Screening uses cytology first in all samples', false, 2),
  ('abb36ed9-351f-5cbc-9b65-94a4303d7d06', 'd7358043-2ba6-5065-ade3-c397b7c6e335', 'D', 'Screening starts at 16', false, 3),
  ('6f745931-a95b-5d37-ad47-06ef06dc83a5', 'd7358043-2ba6-5065-ade3-c397b7c6e335', 'E', 'Women over 65 must have screening every year', false, 4);

-- Q152
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('9f9ad764-9b5b-5cc2-a7b4-6446e3772bd1', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000008', 'sba', 'A 72 year old woman has had a persistent vulval itch and a raised, ulcerated lump on her labium majus for 2 months. She has a history of lichen sclerosus. What is the SINGLE most likely diagnosis?', 'Vulval cancer is mostly squamous cell carcinoma in older women, associated with lichen sclerosus (in older women) and HPV/VIN (in younger women). It presents with itch, pain, a lump or ulcer, or bleeding. Refer on a 2-week-wait pathway for biopsy. Treatment is wide local excision with assessment of the groin nodes (sentinel node biopsy).', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v3')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = '9f9ad764-9b5b-5cc2-a7b4-6446e3772bd1';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('32ab0284-1459-5830-8a6a-c9c5afe16485', '9f9ad764-9b5b-5cc2-a7b4-6446e3772bd1', 'A', 'Genital herpes', false, 0),
  ('7e444283-39c1-5900-9baf-fa4223845719', '9f9ad764-9b5b-5cc2-a7b4-6446e3772bd1', 'B', 'Vulval candidiasis', false, 1),
  ('b3fb9d1d-0e40-528c-8b1b-65adc78ca5cc', '9f9ad764-9b5b-5cc2-a7b4-6446e3772bd1', 'C', 'Bartholin''s abscess', false, 2),
  ('1f1845eb-4a05-5cbd-9c12-a13232db8f04', '9f9ad764-9b5b-5cc2-a7b4-6446e3772bd1', 'D', 'Vulval squamous cell carcinoma', true, 3),
  ('4f835651-28cb-5295-808e-3e800b00d9c7', '9f9ad764-9b5b-5cc2-a7b4-6446e3772bd1', 'E', 'Lichen planus only', false, 4);

-- Q153
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('0f9ac90d-d89f-54cd-82e9-ed7fde01c45f', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000008', 'sba', 'A 26 year old woman who is 12 weeks pregnant had a rash and fever. Testing confirms primary rubella infection. What is the MOST likely risk to the fetus?', 'Rubella in the first 12-16 weeks carries a high risk of congenital rubella syndrome: sensorineural deafness, eye defects (cataracts, microphthalmia), heart defects (PDA, pulmonary stenosis), microcephaly and learning disability. The risk falls sharply after 16 weeks. MMR vaccination is given before pregnancy (it is a live vaccine and contraindicated during pregnancy). Rubella is notifiable.', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v3')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = '0f9ac90d-d89f-54cd-82e9-ed7fde01c45f';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('28454b68-a4f9-5bbb-8ef5-9c5846c53e74', '0f9ac90d-d89f-54cd-82e9-ed7fde01c45f', 'A', 'No risk at this gestation', false, 0),
  ('c61dc965-16fd-52c7-a7fe-42b27d5bb54d', '0f9ac90d-d89f-54cd-82e9-ed7fde01c45f', 'B', 'Congenital rubella syndrome (sensorineural deafness, cataracts, heart defects such as PDA)', true, 1),
  ('2cc4603f-3576-52cb-bbea-9968de58a9f9', '0f9ac90d-d89f-54cd-82e9-ed7fde01c45f', 'C', 'Hydrops fetalis from aplastic anaemia', false, 2),
  ('25f19d98-0f7d-5f8b-ab3a-f19640074382', '0f9ac90d-d89f-54cd-82e9-ed7fde01c45f', 'D', 'Neonatal herpes', false, 3),
  ('0a69c387-7236-571a-a467-ff14d79f8be4', '0f9ac90d-d89f-54cd-82e9-ed7fde01c45f', 'E', 'Fetal macrosomia', false, 4);

-- Q154
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('7ed40de5-f011-5ea2-86bb-989d6ab37fed', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000008', 'sba', 'A 24 year old woman at her booking visit tests positive for syphilis (treponemal EIA and RPR positive). What is the SINGLE most appropriate management?', 'All pregnant women in the UK are screened for syphilis, HIV and hepatitis B. Untreated syphilis can cause miscarriage, stillbirth and congenital syphilis. Penicillin is the treatment in pregnancy. Doxycycline is contraindicated in pregnancy. The baby needs assessment and follow-up after birth.', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v3')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = '7ed40de5-f011-5ea2-86bb-989d6ab37fed';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('96eb776d-c166-5d73-bcf3-261572872655', '7ed40de5-f011-5ea2-86bb-989d6ab37fed', 'A', 'Wait until after delivery to treat', false, 0),
  ('6f2bad93-fdb6-5089-8fdd-f53b897f7586', '7ed40de5-f011-5ea2-86bb-989d6ab37fed', 'B', 'Refer to GUM for treatment with penicillin (benzathine benzylpenicillin), partner notification and neonatal follow-up', true, 1),
  ('2bb5d1c6-4539-56bf-8fb3-0c48c2896e12', '7ed40de5-f011-5ea2-86bb-989d6ab37fed', 'C', 'Give oral doxycycline in pregnancy', false, 2),
  ('f6388308-6188-504d-86d5-d2ffede452fd', '7ed40de5-f011-5ea2-86bb-989d6ab37fed', 'D', 'Terminate the pregnancy', false, 3),
  ('943b0301-1bca-5427-9cb5-2c82d920bf90', '7ed40de5-f011-5ea2-86bb-989d6ab37fed', 'E', 'No treatment is needed if she is asymptomatic', false, 4);

-- Q155
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('c21409bf-2873-53d6-97fa-92498c3df343', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000008', 'sba', 'A 30 year old woman is rhesus D negative. Which of these events at 22 weeks'' gestation requires anti-D immunoglobulin?', 'Anti-D is given within 72 hours of potentially sensitising events after 12 weeks (and for some events before 12 weeks): antepartum haemorrhage, abdominal trauma, external cephalic version, amniocentesis/CVS, intrauterine death, ectopic pregnancy and surgical management of miscarriage. A Kleihauer test after 20 weeks measures fetomaternal haemorrhage. Routine prophylaxis is also given at 28 weeks.', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v3')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = 'c21409bf-2873-53d6-97fa-92498c3df343';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('733d17e3-32a0-5c81-912f-1d58a9dd9233', 'c21409bf-2873-53d6-97fa-92498c3df343', 'A', 'Taking folic acid', false, 0),
  ('a6c27d02-45c6-5ca1-a821-219ad0de7bce', 'c21409bf-2873-53d6-97fa-92498c3df343', 'B', 'Routine antenatal visit with no bleeding', false, 1),
  ('0271df73-a970-5895-8a07-c3d0bef77ded', 'c21409bf-2873-53d6-97fa-92498c3df343', 'C', 'Normal ultrasound scan', false, 2),
  ('984e368b-4841-5659-a475-e3ec9af54210', 'c21409bf-2873-53d6-97fa-92498c3df343', 'D', 'Abdominal trauma (e.g. a fall onto her abdomen)', true, 3),
  ('764cceea-fa6d-520d-b804-f774745fc640', 'c21409bf-2873-53d6-97fa-92498c3df343', 'E', 'Common cold', false, 4);

-- Q156
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('7570d961-8b25-5347-9935-6bcd76551fac', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000008', 'sba', 'A 32 year old woman is in labour at term. Her temperature is 38.6°C, fetal heart rate is 175 bpm, and liquor is offensive. Membranes ruptured 30 hours ago. What is the SINGLE most likely diagnosis and management?', 'Intrapartum maternal fever, fetal tachycardia, uterine tenderness and offensive liquor after prolonged rupture of the membranes suggest chorioamnionitis. Give broad-spectrum IV antibiotics and expedite delivery. Inform the neonatal team, as the baby is at risk of early-onset sepsis.', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v3')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = '7570d961-8b25-5347-9935-6bcd76551fac';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('9396a93e-7443-5aab-b497-ab54f68e61f5', '7570d961-8b25-5347-9935-6bcd76551fac', 'A', 'Normal labour; no action', false, 0),
  ('30a08d2d-9c2d-58a5-b682-312e6688ec7e', '7570d961-8b25-5347-9935-6bcd76551fac', 'B', 'Epidural fever; paracetamol only', false, 1),
  ('28ef54c3-6f7f-5855-9fb1-3ae8ff0241ac', '7570d961-8b25-5347-9935-6bcd76551fac', 'C', 'Placental abruption; immediate caesarean in all', false, 2),
  ('5db5a3d9-412a-5add-8334-13aba7a3749b', '7570d961-8b25-5347-9935-6bcd76551fac', 'D', 'Urinary tract infection; oral antibiotics', false, 3),
  ('b05f92f5-d7a3-5061-b784-6a9ada6b803e', '7570d961-8b25-5347-9935-6bcd76551fac', 'E', 'Chorioamnionitis; broad-spectrum IV antibiotics and expedite delivery', true, 4);

-- Q157
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('0d5f0e74-1273-501c-ab6f-ed3bdf9f8474', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000008', 'sba', 'A 29 year old woman is at 41 weeks for induction of labour. On vaginal examination, the cervix is 1 cm dilated, 1 cm long, firm, posterior, and the head is at station -2. What does this tell you?', 'The Bishop score assesses dilatation, length (effacement), consistency, position and station (0-13). A score of 6 or less (or 8 or less, depending on guidance) is unfavourable and needs ripening with vaginal prostaglandin E2, oral misoprostol or a balloon catheter. A favourable cervix allows amniotomy and oxytocin. Watch for uterine hyperstimulation.', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v3')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = '0d5f0e74-1273-501c-ab6f-ed3bdf9f8474';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('f1643f1b-43a3-5b14-b94e-8f1a6177be2e', '0d5f0e74-1273-501c-ab6f-ed3bdf9f8474', 'A', 'An emergency caesarean is needed', false, 0),
  ('4fd4a887-69da-5753-991a-34e9abb18298', '0d5f0e74-1273-501c-ab6f-ed3bdf9f8474', 'B', 'A high Bishop score, so start oxytocin immediately', false, 1),
  ('967c8e28-34ed-5ecb-95e5-fc66a98215ff', '0d5f0e74-1273-501c-ab6f-ed3bdf9f8474', 'C', 'A low Bishop score (unfavourable cervix), so cervical ripening with prostaglandins (or balloon) is needed first', true, 2),
  ('dd8a1f5e-bfa8-5ec6-9330-bc3191aab255', '0d5f0e74-1273-501c-ab6f-ed3bdf9f8474', 'D', 'She is in established labour', false, 3),
  ('d58e51fc-afda-59eb-b26a-f121606ab5f3', '0d5f0e74-1273-501c-ab6f-ed3bdf9f8474', 'E', 'Induction is contraindicated', false, 4);

-- Q158
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('e1f699bd-371c-5d98-b178-3608480cd290', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000008', 'sba', 'A 28 year old woman with known endometriosis has severe dysmenorrhoea despite NSAIDs and the combined pill. She wants children in the future. What is the SINGLE most appropriate next step?', 'NICE NG73: if initial analgesia and hormonal treatment fail or are not tolerated, refer to gynaecology (an endometriosis centre for deep disease). Laparoscopy can confirm the diagnosis and excise or ablate lesions, which may improve fertility. GnRH agonists can be used. Hysterectomy is for women who have finished having children.', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v3')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = 'e1f699bd-371c-5d98-b178-3608480cd290';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('4f2d718e-7529-5f90-aa58-8b722347032f', 'e1f699bd-371c-5d98-b178-3608480cd290', 'A', 'Refer to gynaecology for consideration of laparoscopy (diagnosis and excision/ablation), or second-line hormonal treatment', true, 0),
  ('f5bd9fc5-a3bb-528c-a39f-518a3732767c', 'e1f699bd-371c-5d98-b178-3608480cd290', 'B', 'Hysterectomy and bilateral oophorectomy now', false, 1),
  ('24bade30-69e1-54a7-b680-2c25bf0ed18a', 'e1f699bd-371c-5d98-b178-3608480cd290', 'C', 'Endometrial ablation', false, 2),
  ('81b8baa8-ef6e-5431-8259-bf0c7e498f60', 'e1f699bd-371c-5d98-b178-3608480cd290', 'D', 'No further treatment is possible', false, 3),
  ('68e0cd26-ee67-5d0b-8205-df5e9356aafd', 'e1f699bd-371c-5d98-b178-3608480cd290', 'E', 'Long-term opioids', false, 4);

-- Q159
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('9c3aa8c6-1b73-53e4-bf1c-60d295ce4b0d', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000009', 'sba', 'A baby born to a mother with insulin-treated diabetes is jittery and sweaty at 2 hours of age. His capillary glucose is 1.6 mmol/L. He is feeding poorly. What is the SINGLE most appropriate management?', 'Infants of diabetic mothers have hyperinsulinism after birth and are at risk of hypoglycaemia. They may also be macrosomic, polycythaemic, jaundiced and have respiratory distress. Symptomatic hypoglycaemia, or glucose below 1.0 mmol/L, needs IV 10% dextrose (2.5 mL/kg bolus then infusion). Asymptomatic mild cases can be managed with feeding and buccal glucose gel. Never give 50% dextrose to neonates.', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v3')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = '9c3aa8c6-1b73-53e4-bf1c-60d295ce4b0d';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('349b49b4-76dd-5b3f-8347-026a83029f03', '9c3aa8c6-1b73-53e4-bf1c-60d295ce4b0d', 'A', 'Wait for the next feed in 3 hours', false, 0),
  ('ac8f5548-7fd4-5991-9584-0f332d9e6bfe', '9c3aa8c6-1b73-53e4-bf1c-60d295ce4b0d', 'B', 'Oral glucose gel only and discharge', false, 1),
  ('b3f7a572-948d-5105-994b-c887e8901fb8', '9c3aa8c6-1b73-53e4-bf1c-60d295ce4b0d', 'C', 'IV 50% dextrose bolus', false, 2),
  ('f366ebbd-a9ac-5d54-b1ba-048f428a24c8', '9c3aa8c6-1b73-53e4-bf1c-60d295ce4b0d', 'D', 'IV 10% dextrose bolus followed by an infusion (as he is symptomatic and not feeding well)', true, 3),
  ('ee3f7ca6-0f69-5eb2-b367-f9be7f839af9', '9c3aa8c6-1b73-53e4-bf1c-60d295ce4b0d', 'E', 'Glucagon IM and discharge', false, 4);

-- Q160
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('6f8a97c7-f215-5d5e-97c6-5e1b7e609bc7', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000009', 'sba', 'A baby is born at term by elective caesarean section. Shortly after birth he has tachypnoea (RR 80/min) with mild recession, but good oxygen saturations. Chest X-ray shows fluid in the horizontal fissure and hyperinflation. He improves over 48 hours. What is the SINGLE most likely diagnosis?', 'TTN is caused by delayed clearance of fetal lung fluid, more common after caesarean section without labour. It causes tachypnoea in the first hours of life and resolves within 24-72 hours with supportive care. RDS (surfactant deficiency) mostly affects preterm babies and shows a ground-glass appearance with air bronchograms.', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v3')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = '6f8a97c7-f215-5d5e-97c6-5e1b7e609bc7';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('0164f2d0-9910-55ea-80f2-05fcd2eafa36', '6f8a97c7-f215-5d5e-97c6-5e1b7e609bc7', 'A', 'Transient tachypnoea of the newborn', true, 0),
  ('d7a06caf-4e5f-55bc-8065-eb0d8991f22a', '6f8a97c7-f215-5d5e-97c6-5e1b7e609bc7', 'B', 'Meconium aspiration syndrome', false, 1),
  ('5503ee1f-bd77-5af9-93d2-e8d21ccee24c', '6f8a97c7-f215-5d5e-97c6-5e1b7e609bc7', 'C', 'Respiratory distress syndrome', false, 2),
  ('2a94adce-28c0-5dba-865e-693708f2e5b6', '6f8a97c7-f215-5d5e-97c6-5e1b7e609bc7', 'D', 'Congenital pneumonia', false, 3),
  ('9a8a19f3-ccc1-52de-bd94-c9f8ae7b12de', '6f8a97c7-f215-5d5e-97c6-5e1b7e609bc7', 'E', 'Diaphragmatic hernia', false, 4);

-- Q161
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('377b71af-106a-58fe-a18f-8424ac2bf777', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000009', 'sba', 'A newborn baby is not breathing at birth and is floppy. He has been dried and stimulated, and his heart rate is 70 bpm. What is the SINGLE most appropriate next step according to newborn life support?', 'Newborn life support: dry, stimulate and assess tone, breathing and heart rate. If not breathing, open the airway and give 5 inflation breaths (30 cm H2O for term babies), then ventilation breaths. If the heart rate stays below 60 bpm after effective ventilation, start chest compressions at 3:1. Use air for term babies, and add oxygen if needed.', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v3')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = '377b71af-106a-58fe-a18f-8424ac2bf777';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('37d8f1e3-6576-57a3-9a69-7301e20d0d1a', '377b71af-106a-58fe-a18f-8424ac2bf777', 'A', 'Give naloxone', false, 0),
  ('968de193-7b96-5f7e-a333-e84f477fceb9', '377b71af-106a-58fe-a18f-8424ac2bf777', 'B', 'Give IV adrenaline', false, 1),
  ('43cedb04-3b27-5e26-ba65-0541d8152776', '377b71af-106a-58fe-a18f-8424ac2bf777', 'C', 'Open the airway and give 5 inflation breaths (with air for term babies)', true, 2),
  ('b2d57694-f613-5544-a38d-f9314515b0a7', '377b71af-106a-58fe-a18f-8424ac2bf777', 'D', 'Start chest compressions immediately', false, 3),
  ('d485c189-137f-5858-b167-f63f150016d8', '377b71af-106a-58fe-a18f-8424ac2bf777', 'E', 'Intubate before any breaths', false, 4);

-- Q162
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('4a72efc4-7e70-5992-929c-9ba8be5f2508', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000009', 'sba', 'A 10 day old baby is irritable, feeding poorly and vomiting. His mother took methadone throughout pregnancy. He has a high-pitched cry, tremors, sneezing, loose stools and sweating. What is the SINGLE most likely diagnosis?', 'Neonatal abstinence syndrome follows in-utero exposure to opioids (and other drugs). Symptoms start within days, or later with methadone, and include irritability, high-pitched cry, tremor, poor feeding, vomiting, diarrhoea, sweating, sneezing and seizures. Assess with a scoring system. Manage supportively (swaddling, quiet environment, frequent feeds). Oral morphine is used for severe symptoms. Breastfeeding is generally encouraged if the mother is stable on treatment.', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v3')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = '4a72efc4-7e70-5992-929c-9ba8be5f2508';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('66596eae-ba85-5bc3-97b0-7ab51c4d80e0', '4a72efc4-7e70-5992-929c-9ba8be5f2508', 'A', 'Hypothyroidism', false, 0),
  ('c61069d7-575b-593e-b256-05fcb75f84d5', '4a72efc4-7e70-5992-929c-9ba8be5f2508', 'B', 'Neonatal abstinence syndrome', true, 1),
  ('0314ce31-cbbb-5f81-98ee-8f42b0f7664f', '4a72efc4-7e70-5992-929c-9ba8be5f2508', 'C', 'Neonatal sepsis', false, 2),
  ('cc02c3b8-4c3b-54cf-893f-ac2a4b745bcc', '4a72efc4-7e70-5992-929c-9ba8be5f2508', 'D', 'Hypoglycaemia', false, 3),
  ('b960b776-8d7f-5072-89f8-72420c657788', '4a72efc4-7e70-5992-929c-9ba8be5f2508', 'E', 'Cow''s milk protein allergy', false, 4);

-- Q163
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('c8097ed4-c026-5711-9264-8d2106bbccb7', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000009', 'sba', 'A 2 week old baby has prolonged jaundice. Newborn blood spot screening shows a raised TSH. He has a large tongue, an umbilical hernia, constipation and is sleepy. What is the SINGLE most appropriate management?', 'Congenital hypothyroidism (most commonly thyroid dysgenesis) is detected on the newborn blood spot (heel prick) test at 5 days. Early levothyroxine prevents intellectual disability. Features include prolonged jaundice, poor feeding, constipation, a large tongue, hypotonia, a large fontanelle and umbilical hernia.', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v3')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = 'c8097ed4-c026-5711-9264-8d2106bbccb7';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('8dc3479b-2e13-5e8a-bf48-239bbe3c2cb1', 'c8097ed4-c026-5711-9264-8d2106bbccb7', 'A', 'Reassure; it will resolve', false, 0),
  ('f94df672-b56a-5456-807b-1ce31a8f6164', 'c8097ed4-c026-5711-9264-8d2106bbccb7', 'B', 'Start levothyroxine promptly (ideally within 2 weeks of birth) and refer to paediatric endocrinology', true, 1),
  ('2326c11a-2dd5-51a1-8b55-dd46911e33e8', 'c8097ed4-c026-5711-9264-8d2106bbccb7', 'C', 'Repeat the test at 6 months', false, 2),
  ('9183a799-4ee2-5e3e-8cb7-d9b477130085', 'c8097ed4-c026-5711-9264-8d2106bbccb7', 'D', 'Carbimazole', false, 3),
  ('4b6f10e2-98f7-5ace-acc4-c7eaba8b5844', 'c8097ed4-c026-5711-9264-8d2106bbccb7', 'E', 'Iodine supplements', false, 4);

-- Q164
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('7a67af82-b612-5dfa-978c-c49556620d7d', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000009', 'sba', 'A 10 day old baby boy has vomiting, poor feeding and lethargy. He is dehydrated. Sodium is 124 mmol/L, potassium 6.8 mmol/L and glucose 2.6 mmol/L. His genitalia appear normal. What is the SINGLE most likely diagnosis?', 'CAH (mostly 21-hydroxylase deficiency, autosomal recessive) causes cortisol and aldosterone deficiency with excess androgens. Girls may have ambiguous genitalia at birth. Boys often present at 1-3 weeks with a salt-wasting crisis (hyponatraemia, hyperkalaemia, hypoglycaemia, shock). Raised 17-hydroxyprogesterone confirms it. Treat with IV fluids, hydrocortisone and later fludrocortisone.', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v3')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = '7a67af82-b612-5dfa-978c-c49556620d7d';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('d4b39f7b-fd2c-5023-bf4c-e6bacd3e5c34', '7a67af82-b612-5dfa-978c-c49556620d7d', 'A', 'Diabetes insipidus', false, 0),
  ('232d365d-1371-54c0-a21e-190443080f08', '7a67af82-b612-5dfa-978c-c49556620d7d', 'B', 'Neonatal sepsis only', false, 1),
  ('0708a9a0-c408-5935-8f0d-db94e81f496d', '7a67af82-b612-5dfa-978c-c49556620d7d', 'C', 'Congenital hypothyroidism', false, 2),
  ('27cdfe54-92b9-58f2-8a37-2030de73cad3', '7a67af82-b612-5dfa-978c-c49556620d7d', 'D', 'Congenital adrenal hyperplasia (21-hydroxylase deficiency) with salt-wasting crisis', true, 3),
  ('95c5c3a7-ef60-573a-84de-e70b49276f34', '7a67af82-b612-5dfa-978c-c49556620d7d', 'E', 'Pyloric stenosis', false, 4);

-- Q165
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('e7363e33-f5cd-5533-bd7c-eeeb3d3b4a1e', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000009', 'sba', 'A newborn has a defect in the abdominal wall to the right of the umbilicus, with loops of bowel outside the abdomen and no covering sac. The mother is 19 years old. What is the SINGLE most likely diagnosis?', 'Gastroschisis is a full-thickness defect to the right of the umbilicus with uncovered bowel, linked to young maternal age and smoking. It is rarely associated with other anomalies. Exomphalos is a midline defect covered by a sac, and is associated with chromosomal anomalies (trisomies 13, 18), Beckwith-Wiedemann and cardiac defects. At birth, cover the bowel with cling film, keep it warm and give IV fluids.', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v3')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = 'e7363e33-f5cd-5533-bd7c-eeeb3d3b4a1e';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('f4bbb65c-0b68-5f56-9bab-cca97fcdebac', 'e7363e33-f5cd-5533-bd7c-eeeb3d3b4a1e', 'A', 'Prune belly syndrome', false, 0),
  ('e4479609-785d-5f38-abff-b2dff08d52b7', 'e7363e33-f5cd-5533-bd7c-eeeb3d3b4a1e', 'B', 'Umbilical hernia', false, 1),
  ('6fdf3257-dd74-586a-95dd-c98f022ae844', 'e7363e33-f5cd-5533-bd7c-eeeb3d3b4a1e', 'C', 'Gastroschisis', true, 2),
  ('1c1e78c8-1843-5f3a-a764-57af68ebb544', 'e7363e33-f5cd-5533-bd7c-eeeb3d3b4a1e', 'D', 'Bladder exstrophy', false, 3),
  ('72bc4de0-35e4-591b-b5a1-ecae41051323', 'e7363e33-f5cd-5533-bd7c-eeeb3d3b4a1e', 'E', 'Exomphalos (omphalocele)', false, 4);

-- Q166
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('e87f07b1-2d04-5dc8-a453-796a0506bc40', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000009', 'sba', 'A baby is born with a unilateral cleft lip and palate. Which is the MOST important immediate concern for the parents and team?', 'Babies with cleft palate can struggle to create suction, so feeding support with special bottles or teats is needed early. Refer to a regional cleft lip and palate team. Lip repair is typically at about 3 months and palate repair at 6-12 months. Long-term issues include speech, glue ear and hearing, dental problems and psychological support.', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v3')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = 'e87f07b1-2d04-5dc8-a453-796a0506bc40';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('b2bf0767-f196-5db0-ad5e-a59d5776c799', 'e87f07b1-2d04-5dc8-a453-796a0506bc40', 'A', 'No referral is needed', false, 0),
  ('3d403a9e-4ba3-55dd-95d5-98c132b78917', 'e87f07b1-2d04-5dc8-a453-796a0506bc40', 'B', 'Immediate surgical repair in the first 24 hours', false, 1),
  ('c7093a09-1ea6-5677-94ef-a8858fc89552', 'e87f07b1-2d04-5dc8-a453-796a0506bc40', 'C', 'Speech will not be affected', false, 2),
  ('80f8462c-bf26-58b2-8651-d2e050d072c9', 'e87f07b1-2d04-5dc8-a453-796a0506bc40', 'D', 'Feeding difficulties (specialist feeding support and bottles), with referral to a cleft team', true, 3),
  ('8f672b2d-3d5c-593c-b456-42c7b636ede2', 'e87f07b1-2d04-5dc8-a453-796a0506bc40', 'E', 'Hearing will never be affected', false, 4);

-- Q167
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('509827e5-088c-545b-a046-72fd0af6e2fb', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000009', 'sba', 'A 3 year old boy has lost his ability to climb stairs and uses his hands to ''walk up'' his legs when getting up from the floor. He has enlarged calves. His CK is very high. What is the SINGLE most likely diagnosis?', 'Duchenne muscular dystrophy is X-linked recessive (dystrophin gene, no functional dystrophin). It presents at 2-5 years with proximal weakness, Gowers'' sign, calf pseudohypertrophy, a waddling gait and very high CK. Loss of walking is usual by about 12. Cardiomyopathy and respiratory failure develop. Steroids slow decline. Becker is milder and later.', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v3')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = '509827e5-088c-545b-a046-72fd0af6e2fb';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('f806636d-5918-5910-8b78-303ed27152e8', '509827e5-088c-545b-a046-72fd0af6e2fb', 'A', 'Spinal muscular atrophy', false, 0),
  ('f0e85db7-e9b5-5a84-8cd3-04732e3b8ed7', '509827e5-088c-545b-a046-72fd0af6e2fb', 'B', 'Becker muscular dystrophy', false, 1),
  ('bad23370-0f29-5585-bd07-3ec4507bb3e0', '509827e5-088c-545b-a046-72fd0af6e2fb', 'C', 'Cerebral palsy', false, 2),
  ('4fb843bc-8ef8-5857-9ed8-e5c8ee3df96f', '509827e5-088c-545b-a046-72fd0af6e2fb', 'D', 'Myasthenia gravis', false, 3),
  ('97e6c6ec-6dac-537c-a7ff-97213d074a0e', '509827e5-088c-545b-a046-72fd0af6e2fb', 'E', 'Duchenne muscular dystrophy', true, 4);

-- Q168
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('a9e975f6-ed27-5542-9214-56185246f79c', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000009', 'sba', 'A 2 year old boy was born at 28 weeks. He has stiffness of both legs, scissoring gait, brisk reflexes and toe walking. His arms are only mildly affected, and his intelligence is normal. What type of cerebral palsy is this?', 'Spastic diplegia (legs more affected than arms) is classically linked to prematurity and periventricular leukomalacia. Hemiplegia affects one side (often perinatal stroke). Quadriplegia affects all limbs, often with learning disability and epilepsy. Dyskinetic CP is linked to basal ganglia injury (hypoxic-ischaemic injury or kernicterus). Management is multidisciplinary (physiotherapy, botulinum toxin, baclofen, orthoses).', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v3')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = 'a9e975f6-ed27-5542-9214-56185246f79c';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('e95ee5fa-e936-56c9-884d-8cc313518601', 'a9e975f6-ed27-5542-9214-56185246f79c', 'A', 'Ataxic cerebral palsy', false, 0),
  ('1f4c7c42-1ca0-5455-8120-4241093a089e', 'a9e975f6-ed27-5542-9214-56185246f79c', 'B', 'Spastic diplegia', true, 1),
  ('7f1f0737-0091-5360-8e90-279fbd7208f4', 'a9e975f6-ed27-5542-9214-56185246f79c', 'C', 'Spastic quadriplegia', false, 2),
  ('0c17f9c1-ce66-5031-ba24-44a6e0ebc82e', 'a9e975f6-ed27-5542-9214-56185246f79c', 'D', 'Spastic hemiplegia', false, 3),
  ('81cbf11b-8e00-5d6d-a7e0-957cc253ce71', 'a9e975f6-ed27-5542-9214-56185246f79c', 'E', 'Dyskinetic (athetoid) cerebral palsy', false, 4);

-- Q169
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('5ceddcf9-92c7-553a-b21e-b4b6e8fb6ca7', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000009', 'sba', 'A newborn with Down syndrome has a murmur. What congenital heart defect is MOST characteristic of Down syndrome?', 'About 40-50% of babies with Down syndrome have congenital heart disease, most characteristically AVSD (endocardial cushion defect), followed by VSD, ASD, tetralogy and PDA. All babies with Down syndrome need an echocardiogram in the newborn period. Other associations include duodenal atresia, Hirschsprung''s, hypothyroidism, leukaemia, hearing loss and atlantoaxial instability.', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v3')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = '5ceddcf9-92c7-553a-b21e-b4b6e8fb6ca7';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('f36a2b46-7038-5ab4-82df-a38c8ea7907a', '5ceddcf9-92c7-553a-b21e-b4b6e8fb6ca7', 'A', 'Coarctation of the aorta', false, 0),
  ('02d5484c-b074-5577-96cf-821e88e19f1b', '5ceddcf9-92c7-553a-b21e-b4b6e8fb6ca7', 'B', 'Atrioventricular septal defect (AVSD)', true, 1),
  ('443f7e10-417c-5410-8430-049eeb18aa8b', '5ceddcf9-92c7-553a-b21e-b4b6e8fb6ca7', 'C', 'Transposition of the great arteries', false, 2),
  ('ea343255-e8f0-5e88-8e12-a23a94b49af9', '5ceddcf9-92c7-553a-b21e-b4b6e8fb6ca7', 'D', 'Ebstein''s anomaly', false, 3),
  ('50081901-9460-5cee-bf94-9d43733ba6de', '5ceddcf9-92c7-553a-b21e-b4b6e8fb6ca7', 'E', 'Hypoplastic left heart syndrome', false, 4);

-- Q170
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('933f8f6b-413e-5bf8-8f9e-3af9cb2297fd', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000009', 'sba', 'A 4 year old girl is on the 2nd centile for height and has been growing at a normal rate along it. Her parents are both short (mid-parental height on the 2nd centile). Bone age equals chronological age. What is the SINGLE most likely diagnosis?', 'Familial short stature: a child grows parallel to a low centile consistent with mid-parental height, with normal growth velocity and bone age matching chronological age. In constitutional delay, bone age is delayed, there is a family history of late puberty, and final height is normal. Investigate if growth velocity falls (crossing centiles downwards) or height is far below the mid-parental range.', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v3')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = '933f8f6b-413e-5bf8-8f9e-3af9cb2297fd';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('959fc0c4-6094-5906-a034-689e642f8fed', '933f8f6b-413e-5bf8-8f9e-3af9cb2297fd', 'A', 'Constitutional delay of growth and puberty', false, 0),
  ('c2c52549-e2de-52a5-ad4c-5d5530641a08', '933f8f6b-413e-5bf8-8f9e-3af9cb2297fd', 'B', 'Growth hormone deficiency', false, 1),
  ('4895ecf4-0255-5fe5-ae98-44db2db8e4ab', '933f8f6b-413e-5bf8-8f9e-3af9cb2297fd', 'C', 'Hypothyroidism', false, 2),
  ('c062176d-598f-54bc-9308-78d809233d4c', '933f8f6b-413e-5bf8-8f9e-3af9cb2297fd', 'D', 'Familial short stature', true, 3),
  ('57249766-746b-52b5-8bce-543abda1e009', '933f8f6b-413e-5bf8-8f9e-3af9cb2297fd', 'E', 'Turner syndrome', false, 4);

-- Q171
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('ee72c9ce-64f1-53b4-a462-80a10dfec047', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000009', 'sba', 'A 14 year old boy is the shortest in his class and has no signs of puberty. His father was a ''late developer''. Bone age is 12 years. Examination is otherwise normal. What is the SINGLE most likely diagnosis?', 'Constitutional delay is the commonest cause of delayed puberty in boys (no testicular enlargement by 14). There is often a family history, delayed bone age and normal final height. Reassure, and short courses of low-dose testosterone can be used to trigger puberty. Kallmann syndrome (hypogonadotropic hypogonadism with anosmia) is the main differential.', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v3')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = 'ee72c9ce-64f1-53b4-a462-80a10dfec047';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('352791ba-9722-5282-b276-b48f9d520a3b', 'ee72c9ce-64f1-53b4-a462-80a10dfec047', 'A', 'Growth hormone deficiency', false, 0),
  ('9bb224bf-9530-5972-93ab-6564a702c75b', 'ee72c9ce-64f1-53b4-a462-80a10dfec047', 'B', 'Kallmann syndrome', false, 1),
  ('9b3f7040-4573-5c5a-8af1-a40c6fb6976e', 'ee72c9ce-64f1-53b4-a462-80a10dfec047', 'C', 'Hypothyroidism', false, 2),
  ('8ced0bca-e91f-5b66-8078-9f9b2c9d326e', 'ee72c9ce-64f1-53b4-a462-80a10dfec047', 'D', 'Constitutional delay of growth and puberty', true, 3),
  ('7a072dd0-612e-5765-be9e-bba995693862', 'ee72c9ce-64f1-53b4-a462-80a10dfec047', 'E', 'Klinefelter syndrome', false, 4);

-- Q172
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('940c9628-9731-5430-94ec-ca90925fa31f', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000009', 'sba', 'A 2 year old child has a temperature of 39°C. She is pale and has reduced activity, a capillary refill time of 3 seconds, and nasal flaring. She is not drinking well. Using the NICE traffic light system for fever in under-5s, which category is she in at least?', 'NICE NG143 amber features include pallor reported by parents, reduced activity, nasal flaring, tachypnoea, CRT 3 seconds or more, reduced fluid intake, reduced urine output, fever for 5 days or more, rigors, swelling of a joint or limb, and a temperature of 39°C or more in a 3-6 month old. Red features include mottled or ashen skin, no response to social cues, grunting, RR over 60, reduced skin turgor, non-blanching rash and a temperature of 38°C or more under 3 months.', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v3')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = '940c9628-9731-5430-94ec-ca90925fa31f';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('5d14b94d-7bde-547c-bff2-06d9b75d95f3', '940c9628-9731-5430-94ec-ca90925fa31f', 'A', 'Amber (intermediate risk)', true, 0),
  ('57d9e15d-0d7b-5356-b798-f477ad572f23', '940c9628-9731-5430-94ec-ca90925fa31f', 'B', 'Red (high risk) due to temperature alone', false, 1),
  ('a2fb2da6-8995-5eb0-981e-ebeb10f6e1d8', '940c9628-9731-5430-94ec-ca90925fa31f', 'C', 'Purple', false, 2),
  ('8c1769aa-c386-5c7b-92f5-4b72dc65eb83', '940c9628-9731-5430-94ec-ca90925fa31f', 'D', 'Green (low risk)', false, 3),
  ('a0447542-8912-5986-ad92-a32f78dab5d5', '940c9628-9731-5430-94ec-ca90925fa31f', 'E', 'Not applicable to under 5s', false, 4);

-- Q173
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('5b983b40-5c1c-53d9-b0cb-4842a4209271', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000009', 'sba', 'A 6 week old formula-fed baby has vomiting, loose stools with mucus, eczema and poor weight gain. Symptoms started when formula was introduced. What is the SINGLE most appropriate management?', 'Non-IgE-mediated cow''s milk protein allergy causes GI symptoms (vomiting, diarrhoea, blood or mucus in stools, reflux), eczema and faltering growth. In formula-fed babies, use an extensively hydrolysed formula (amino acid formula if severe). In breastfed babies, the mother excludes cow''s milk from her diet. Soya is not recommended under 6 months. Goat''s milk cross-reacts. Reintroduce milk later using the milk ladder.', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v3')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = '5b983b40-5c1c-53d9-b0cb-4842a4209271';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('9b20fdbf-23d0-5dbd-9c90-f61cfd28d2ba', '5b983b40-5c1c-53d9-b0cb-4842a4209271', 'A', 'Continue the same formula and add thickener', false, 0),
  ('ffce6b3d-cbd1-55d3-a41b-27949df0dcc7', '5b983b40-5c1c-53d9-b0cb-4842a4209271', 'B', 'Lactose-free cow''s milk formula', false, 1),
  ('a59ec35e-59b0-5269-bb92-ed0ec8920090', '5b983b40-5c1c-53d9-b0cb-4842a4209271', 'C', 'Switch to an extensively hydrolysed formula (and refer to a dietitian)', true, 2),
  ('315e71ba-29a0-5d0d-a92d-11001f1b727c', '5b983b40-5c1c-53d9-b0cb-4842a4209271', 'D', 'Switch to goat''s milk formula', false, 3),
  ('5550ea25-166a-51c5-b88c-da4674ceb0bf', '5b983b40-5c1c-53d9-b0cb-4842a4209271', 'E', 'Switch to soya formula as first-line under 6 months', false, 4);

-- Q174
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('5383acab-e768-52ae-b243-dce9b6ee59f0', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000009', 'sba', 'A 7 week old baby cries inconsolably for more than 3 hours a day, especially in the evening, drawing up her legs. She is feeding well and gaining weight. Examination is normal. What is the SINGLE most appropriate management?', 'Infant colic is common, starting in the first few weeks and resolving by 3-4 months. Red flags such as fever, faltering growth, vomiting or blood in the stool should be excluded. Management is reassurance, parent support and advice on coping strategies (including what to do if they feel overwhelmed, to prevent abusive head trauma). Simeticone and lactase have limited evidence.', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v3')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = '5383acab-e768-52ae-b243-dce9b6ee59f0';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('7fad9f31-b987-5766-a2da-60b950f14f14', '5383acab-e768-52ae-b243-dce9b6ee59f0', 'A', 'Refer for urgent abdominal ultrasound', false, 0),
  ('85510f31-592e-57b1-ab2c-10f76d53dff2', '5383acab-e768-52ae-b243-dce9b6ee59f0', 'B', 'Start lactase drops as essential treatment', false, 1),
  ('11731277-3982-5a07-b4e7-fb407d46a24f', '5383acab-e768-52ae-b243-dce9b6ee59f0', 'C', 'Start omeprazole', false, 2),
  ('700ca85c-24f5-57d2-848b-da3edaadbaca', '5383acab-e768-52ae-b243-dce9b6ee59f0', 'D', 'Reassure and support the parents (infant colic usually settles by 3-4 months)', true, 3),
  ('f06ea556-0cc2-5fda-86c3-3c374ae67893', '5383acab-e768-52ae-b243-dce9b6ee59f0', 'E', 'Change to a soya formula', false, 4);

-- Q175
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('8c45bdb8-e88e-5a8f-bbb2-fd679bd05b4d', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000009', 'sba', 'A 14 month old boy who was born at term is pale and irritable. He drinks 1.5 litres of cow''s milk a day and eats little solid food. Hb is 78 g/L, MCV 58 fL, ferritin is low. What is the SINGLE most appropriate management?', 'Excessive cow''s milk intake in toddlers causes iron deficiency anaemia: milk is low in iron, inhibits iron absorption, displaces iron-rich foods, and can cause occult GI blood loss. Cow''s milk should not be the main drink before 12 months. Treat with oral iron (for about 3 months after Hb normalises) and dietary advice.', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v3')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = '8c45bdb8-e88e-5a8f-bbb2-fd679bd05b4d';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('3d805fe4-fd6a-58d9-8d90-811e94dd468b', '8c45bdb8-e88e-5a8f-bbb2-fd679bd05b4d', 'A', 'Switch to goat''s milk with no other change', false, 0),
  ('ec61c6b6-a47b-5cfa-b083-54957556bc5d', '8c45bdb8-e88e-5a8f-bbb2-fd679bd05b4d', 'B', 'IV iron', false, 1),
  ('bd914587-c5f2-5f5c-ad96-5ef85791290e', '8c45bdb8-e88e-5a8f-bbb2-fd679bd05b4d', 'C', 'Bone marrow biopsy', false, 2),
  ('a1d4e6e5-0a3f-517f-a3e6-ca381e7f7d7e', '8c45bdb8-e88e-5a8f-bbb2-fd679bd05b4d', 'D', 'Blood transfusion', false, 3),
  ('a5d837c9-7ca8-5a66-96c1-b38d983c5a73', '8c45bdb8-e88e-5a8f-bbb2-fd679bd05b4d', 'E', 'Reduce cow''s milk to about 400-500 mL a day, increase iron-rich foods, and give oral iron supplements', true, 4);

-- Q176
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('15370970-aaa0-5a1f-94f9-e13e73ce35ca', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000009', 'sba', 'A 2 year old boy has bowed legs, widened wrists and a ''rickety rosary'' on his chest. He has dark skin, is exclusively breastfed and rarely goes outside. Bloods show low calcium and phosphate, raised ALP and raised PTH. What is the SINGLE most appropriate treatment?', 'Nutritional rickets (vitamin D deficiency) causes bowing, wrist widening, rachitic rosary, delayed walking, hypocalcaemic seizures and dental problems. Risk factors are dark skin, limited sun exposure, exclusive breastfeeding without supplements, and covered clothing. The UK recommends vitamin D for breastfed babies from birth and for all children up to 5 years (Healthy Start vitamins).', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v3')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = '15370970-aaa0-5a1f-94f9-e13e73ce35ca';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('128622ac-2226-5a55-aa5d-bdf04a6d536f', '15370970-aaa0-5a1f-94f9-e13e73ce35ca', 'A', 'Growth hormone', false, 0),
  ('ae1d24bb-aa70-50a8-bd66-b5c9aa489821', '15370970-aaa0-5a1f-94f9-e13e73ce35ca', 'B', 'Surgical correction of the legs now', false, 1),
  ('bd462653-3adb-548d-8220-d8796e5b3d7c', '15370970-aaa0-5a1f-94f9-e13e73ce35ca', 'C', 'Vitamin D (colecalciferol) treatment with calcium supplementation if needed', true, 2),
  ('9021f8d2-de34-5ea6-bdf3-f9b8432e5cbc', '15370970-aaa0-5a1f-94f9-e13e73ce35ca', 'D', 'Phosphate alone', false, 3),
  ('adad4767-1631-541f-98ff-11d8cf84daa3', '15370970-aaa0-5a1f-94f9-e13e73ce35ca', 'E', 'Calcium alone', false, 4);

-- Q177
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('f21cfda7-7058-5f71-b3f1-c90c7cec6b61', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000009', 'sba', 'A 9 month old boy with sickle cell disease has painful, swollen hands and feet for 2 days. He is afebrile. What is the SINGLE most likely diagnosis?', 'Dactylitis is often the first presentation of sickle cell disease in infants (6 months to 2 years), as fetal haemoglobin falls. It is caused by infarction in the small bones of the hands and feet. Treatment is analgesia and fluids. Children with SCD need penicillin prophylaxis, vaccinations, folic acid and annual transcranial Doppler from age 2 (stroke risk). Hydroxycarbamide is offered from 9 months.', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v3')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = 'f21cfda7-7058-5f71-b3f1-c90c7cec6b61';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('aa412958-a3d6-5a5b-806c-ad1a5ba88cdf', 'f21cfda7-7058-5f71-b3f1-c90c7cec6b61', 'A', 'Juvenile idiopathic arthritis', false, 0),
  ('19c964e9-91ac-5c42-a5ae-6fbdeabd71bb', 'f21cfda7-7058-5f71-b3f1-c90c7cec6b61', 'B', 'Septic arthritis', false, 1),
  ('ab85a15f-2981-523b-8c33-a20b248a7946', 'f21cfda7-7058-5f71-b3f1-c90c7cec6b61', 'C', 'Osteomyelitis only', false, 2),
  ('c6a2c087-3223-5b04-bb7a-c7ffe295faa0', 'f21cfda7-7058-5f71-b3f1-c90c7cec6b61', 'D', 'Acute splenic sequestration', false, 3),
  ('a70813c3-ed6a-55e8-bac2-05a89ad0ca99', 'f21cfda7-7058-5f71-b3f1-c90c7cec6b61', 'E', 'Dactylitis (hand-foot syndrome), a vaso-occlusive crisis', true, 4);

-- Q178
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('1ad28845-0811-5945-b19e-fe571727c468', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000009', 'sba', 'A 3 year old girl has a large abdominal mass that crosses the midline, periorbital bruising (''raccoon eyes''), and is pale and unwell. Urinary catecholamine metabolites (VMA/HVA) are raised. What is the SINGLE most likely diagnosis?', 'Neuroblastoma arises from neural crest cells (adrenal medulla or sympathetic chain), usually in children under 5. It causes an irregular abdominal mass that often crosses the midline, with metastases to bone (periorbital ecchymoses, proptosis), liver and bone marrow. Urinary VMA and HVA are raised. MYCN amplification indicates a poor prognosis. Wilms tumour is smooth and usually does not cross the midline.', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v3')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = '1ad28845-0811-5945-b19e-fe571727c468';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('d80154ba-6d36-57e8-aa27-dc7fc973f18b', '1ad28845-0811-5945-b19e-fe571727c468', 'A', 'Neuroblastoma', true, 0),
  ('dc2187c7-d457-5092-85f8-bf865473974e', '1ad28845-0811-5945-b19e-fe571727c468', 'B', 'Hepatoblastoma', false, 1),
  ('2fc77ea8-aa4f-5dab-8543-ca03a71fe4fb', '1ad28845-0811-5945-b19e-fe571727c468', 'C', 'Wilms tumour', false, 2),
  ('aa0a0813-b88e-5c82-b93d-5f6148bdadc0', '1ad28845-0811-5945-b19e-fe571727c468', 'D', 'Rhabdomyosarcoma', false, 3),
  ('48568875-308c-5d9d-87a8-12c532dddc15', '1ad28845-0811-5945-b19e-fe571727c468', 'E', 'Burkitt lymphoma', false, 4);

-- Q179
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('b99c3b1e-1b1a-51b5-ab04-5c4a64d61f12', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000009', 'sba', 'A 7 year old girl has had morning headaches and vomiting for 3 weeks, getting worse, and now has an unsteady gait. She has papilloedema and nystagmus. What is the SINGLE most appropriate investigation?', 'Brain tumours are the commonest solid tumours in children, and many are in the posterior fossa (medulloblastoma, astrocytoma, ependymoma), causing ataxia and hydrocephalus. Red flags: morning headache with vomiting, headache waking the child, neurological signs, papilloedema, growth or puberty change, or behaviour change. Image urgently (HeadSmart). LP is contraindicated with raised ICP.', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v3')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = 'b99c3b1e-1b1a-51b5-ab04-5c4a64d61f12';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('4a1dbe74-7a0b-55bb-8fcb-fff15dd2ec44', 'b99c3b1e-1b1a-51b5-ab04-5c4a64d61f12', 'A', 'Skull X-ray', false, 0),
  ('7be6860c-b0c6-5d93-ad32-9dd70455030f', 'b99c3b1e-1b1a-51b5-ab04-5c4a64d61f12', 'B', 'Urgent MRI brain', true, 1),
  ('c7f47b46-17f3-5a5e-af7f-9821e72f650c', 'b99c3b1e-1b1a-51b5-ab04-5c4a64d61f12', 'C', 'Lumbar puncture', false, 2),
  ('4b20c635-2691-5e48-bed4-8128f4a80a3f', 'b99c3b1e-1b1a-51b5-ab04-5c4a64d61f12', 'D', 'EEG', false, 3),
  ('96db5efb-4e91-5ea7-96b3-2ade9d5c0e49', 'b99c3b1e-1b1a-51b5-ab04-5c4a64d61f12', 'E', 'Eye test with an optometrist only', false, 4);

-- Q180
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('05bd4917-63bc-5f39-8dd8-c2825f74531d', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000009', 'sba', 'A 5 year old boy has had a limp and pain in his right hip for 2 days after a cold. He is afebrile, well, and can bear weight. He has slightly reduced internal rotation. CRP and WCC are normal. What is the SINGLE most likely diagnosis?', 'Transient synovitis is the commonest cause of acute hip pain in children aged 3-10, often after a viral infection. The child is well and afebrile and can usually bear weight. Kocher criteria (fever over 38.5°C, inability to bear weight, ESR over 40, WCC over 12) help distinguish septic arthritis. Management is rest and NSAIDs, with safety-netting and review.', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v3')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = '05bd4917-63bc-5f39-8dd8-c2825f74531d';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('21b257d5-7ea1-5b70-9721-28978076f573', '05bd4917-63bc-5f39-8dd8-c2825f74531d', 'A', 'Perthes disease', false, 0),
  ('efd80a68-c074-5305-a090-1248f03627f8', '05bd4917-63bc-5f39-8dd8-c2825f74531d', 'B', 'Juvenile idiopathic arthritis', false, 1),
  ('331e1ec1-e473-5e45-8279-287558a5d011', '05bd4917-63bc-5f39-8dd8-c2825f74531d', 'C', 'Transient synovitis (irritable hip)', true, 2),
  ('8d185884-d334-5bf8-808f-a751282a2b97', '05bd4917-63bc-5f39-8dd8-c2825f74531d', 'D', 'Slipped capital femoral epiphysis', false, 3),
  ('69cc2fc4-0479-51e3-944e-c592fccc1935', '05bd4917-63bc-5f39-8dd8-c2825f74531d', 'E', 'Septic arthritis', false, 4);

-- Q181
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('992ab181-0dbe-5190-8c69-507f60fe239d', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000009', 'sba', 'A 4 year old boy has had daily spiking fevers for 3 weeks, a salmon-pink evanescent rash that appears with the fever, arthritis, hepatosplenomegaly and lymphadenopathy. Ferritin is very high. What is the SINGLE most likely diagnosis?', 'Systemic JIA presents with quotidian spiking fever, an evanescent salmon-pink rash, arthritis, lymphadenopathy, hepatosplenomegaly and serositis, with high inflammatory markers and ferritin. Exclude infection and malignancy (leukaemia). It can be complicated by macrophage activation syndrome. Treatment includes steroids and IL-1 or IL-6 blockers.', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v3')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = '992ab181-0dbe-5190-8c69-507f60fe239d';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('2e722653-40b9-5845-8826-e68bdc075d10', '992ab181-0dbe-5190-8c69-507f60fe239d', 'A', 'Septic arthritis', false, 0),
  ('c8fb7979-f7d5-5d43-a376-37a47857c074', '992ab181-0dbe-5190-8c69-507f60fe239d', 'B', 'Kawasaki disease', false, 1),
  ('0c4f9c3e-56b6-55b5-9516-00ffb8e03757', '992ab181-0dbe-5190-8c69-507f60fe239d', 'C', 'Acute lymphoblastic leukaemia', false, 2),
  ('c0f22e4d-8525-526e-b58e-3dc0c5e8510c', '992ab181-0dbe-5190-8c69-507f60fe239d', 'D', 'Systemic-onset juvenile idiopathic arthritis (Still''s disease)', true, 3),
  ('b8b24214-133c-5150-aea7-0b7fabe26e47', '992ab181-0dbe-5190-8c69-507f60fe239d', 'E', 'Rheumatic fever', false, 4);

-- Q182
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('b6eea9fb-4d42-5fc5-984c-ed112ac6302c', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000009', 'sba', 'A 13 year old girl was born in Somalia and is now living in England. During a consultation, she tells her GP that she had female genital mutilation (FGM) when she was 7. What is the GP''s legal duty?', 'In England and Wales, regulated health and social care professionals and teachers must report to the police (call 101) if they are told, or observe physical signs, that FGM has been carried out on a girl under 18. FGM is illegal in the UK, including taking a UK resident abroad for it. Also follow local safeguarding procedures and record it in the FGM enhanced dataset.', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v3')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = 'b6eea9fb-4d42-5fc5-984c-ed112ac6302c';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('0f8390b8-0fa1-58f3-9b28-7b70cc12b1c5', 'b6eea9fb-4d42-5fc5-984c-ed112ac6302c', 'A', 'No action is needed because it was years ago', false, 0),
  ('d6e12194-66a9-5ec5-8d7c-d99d6bd36cb0', 'b6eea9fb-4d42-5fc5-984c-ed112ac6302c', 'B', 'Tell her parents only', false, 1),
  ('215a2061-c789-51fc-beca-ff4d98ce7e23', 'b6eea9fb-4d42-5fc5-984c-ed112ac6302c', 'C', 'Report it to the police (mandatory reporting duty for FGM known in under-18s), and follow safeguarding procedures', true, 2),
  ('1a352429-0eaf-53fd-b7b4-89225e69d9a2', 'b6eea9fb-4d42-5fc5-984c-ed112ac6302c', 'D', 'Report it only if the girl consents', false, 3),
  ('451be665-0854-5c76-8578-6bd08109fa84', 'b6eea9fb-4d42-5fc5-984c-ed112ac6302c', 'E', 'Keep it confidential as it happened abroad', false, 4);

-- Q183
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('d912f5b2-6b98-570c-8e59-5b81c89dbe19', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000009', 'sba', 'A 4 month old baby has an unexplained bruise on his cheek. His parents say they do not know how it happened. He is not yet rolling over. What is the SINGLE most appropriate action?', '''Those who don''t cruise rarely bruise.'' A bruise in a non-mobile baby is very rarely accidental and must prompt a safeguarding assessment, including a full examination, skeletal survey, bloods (clotting) and often a CT head, plus discussion with children''s social care. NICE CG89 lists features suggesting abuse. Bleeding disorders must be excluded.', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v3')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = 'd912f5b2-6b98-570c-8e59-5b81c89dbe19';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('01c9be02-5487-50d3-8c8e-186480d09337', 'd912f5b2-6b98-570c-8e59-5b81c89dbe19', 'A', 'Refer to dermatology', false, 0),
  ('1f07d9c7-353e-5ded-bfe8-623538a12ef1', 'd912f5b2-6b98-570c-8e59-5b81c89dbe19', 'B', 'Reassure the parents and discharge', false, 1),
  ('6a496a9d-821f-5c15-b88b-a26c710f1bc3', 'd912f5b2-6b98-570c-8e59-5b81c89dbe19', 'C', 'Prescribe arnica cream', false, 2),
  ('14a2d33d-b6a2-50b5-9392-1a22306c19d2', 'd912f5b2-6b98-570c-8e59-5b81c89dbe19', 'D', 'Treat as possible physical abuse: refer to paediatrics/safeguarding for assessment (including skeletal survey and bloods)', true, 3),
  ('20047da9-1e03-564e-9433-322a4ff4ca8c', 'd912f5b2-6b98-570c-8e59-5b81c89dbe19', 'E', 'Review in 2 weeks', false, 4);

-- Q184
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('89a8fc9c-7e0e-54d8-8cf4-d14414e98d26', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000009', 'sba', 'A 5 month old baby is brought in floppy and drowsy after being ''found that way''. He has bulging fontanelle and seizures. CT shows bilateral subdural haematomas of different ages, and fundoscopy shows extensive retinal haemorrhages. What is the SINGLE most likely cause?', 'Subdural haemorrhages (especially of different ages), extensive multilayered retinal haemorrhages and encephalopathy in an infant strongly suggest abusive head trauma. There may also be rib or metaphyseal fractures. Safeguarding procedures must be followed. A skeletal survey and full investigations (clotting, metabolic) are needed. It is linked to crying, so coping advice is part of prevention.', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v3')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = '89a8fc9c-7e0e-54d8-8cf4-d14414e98d26';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('61a8e6ea-8289-545f-9c06-1f4ebe99fdac', '89a8fc9c-7e0e-54d8-8cf4-d14414e98d26', 'A', 'Benign external hydrocephalus only', false, 0),
  ('c10c565d-dfec-548b-ba9c-9c1a94ca7c25', '89a8fc9c-7e0e-54d8-8cf4-d14414e98d26', 'B', 'Accidental fall from a sofa', false, 1),
  ('87cddcb9-e02b-511b-a524-1c648106432a', '89a8fc9c-7e0e-54d8-8cf4-d14414e98d26', 'C', 'Birth trauma', false, 2),
  ('4b10058d-1678-5192-917e-90454c409c44', '89a8fc9c-7e0e-54d8-8cf4-d14414e98d26', 'D', 'Abusive head trauma (non-accidental injury, e.g. shaking)', true, 3),
  ('38ee8f28-8ed3-5d36-bacc-a7acd7fb5a52', '89a8fc9c-7e0e-54d8-8cf4-d14414e98d26', 'E', 'Vitamin D deficiency', false, 4);

-- Q185
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('8351ae4d-725f-5641-8697-a657ec864a35', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000009', 'sba', 'A 2 year old has a wheeze only with colds, and is well between episodes. Which is the MOST appropriate description and first-line treatment?', 'Episodic viral wheeze occurs in preschool children only with viral infections and is not associated with atopy. It is treated with short-acting bronchodilators via spacer. Montelukast or ICS are trialled if episodes are frequent or severe. Multiple-trigger wheeze is more likely to become asthma. Most children grow out of viral wheeze by school age.', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v3')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = '8351ae4d-725f-5641-8697-a657ec864a35';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('b9582836-cd0c-5cfc-be99-3d02a6c1ff7a', '8351ae4d-725f-5641-8697-a657ec864a35', 'A', 'Cystic fibrosis; sweat test before any treatment', false, 0),
  ('b0124c9b-fa66-5ff7-ac85-92795c732bc9', '8351ae4d-725f-5641-8697-a657ec864a35', 'B', 'Episodic viral wheeze; salbutamol via spacer during episodes', true, 1),
  ('1f728705-ea80-5950-86b1-ddb8f955b5c8', '8351ae4d-725f-5641-8697-a657ec864a35', 'C', 'Asthma; start high-dose inhaled steroid daily', false, 2),
  ('2e973760-44a8-5cab-bcc0-00eb8a86b95c', '8351ae4d-725f-5641-8697-a657ec864a35', 'D', 'Inhaled foreign body; bronchoscopy', false, 3),
  ('5b266166-92f0-5343-bd6f-da87414e82ae', '8351ae4d-725f-5641-8697-a657ec864a35', 'E', 'Bronchiectasis; long-term antibiotics', false, 4);

-- Q186
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('16589144-d4de-5739-a382-a31873f091aa', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000009', 'sba', 'A 9 year old with asthma has symptoms 3 times a week and wakes at night despite a low-dose inhaled corticosteroid. Inhaler technique and adherence are good. According to the 2024 BTS/NICE/SIGN guideline, what is the SINGLE most appropriate next step for a child aged 5-11?', 'The 2024 BTS/NICE/SIGN guideline recommends children aged 5-11 move to a paediatric low-dose MART (budesonide/formoterol) if not controlled on low-dose ICS, then moderate-dose MART, then specialist referral. Older pathways added a leukotriene receptor antagonist. Always check adherence, inhaler technique and triggers first.', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v3')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = '16589144-d4de-5739-a382-a31873f091aa';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('6a4c5487-2c8f-5ad8-9c61-1d21ad076944', '16589144-d4de-5739-a382-a31873f091aa', 'A', 'Add theophylline first', false, 0),
  ('e5e5543e-f6e7-5abe-a185-169c46f8b43e', '16589144-d4de-5739-a382-a31873f091aa', 'B', 'Oral prednisolone daily', false, 1),
  ('15799f93-4034-5fe6-9caa-b97fe7b2fa79', '16589144-d4de-5739-a382-a31873f091aa', 'C', 'Stop the ICS', false, 2),
  ('612bea08-9b45-5838-a0dd-ab4fb52666a6', '16589144-d4de-5739-a382-a31873f091aa', 'D', 'Switch to a low-dose ICS/formoterol combination as MART (or add a leukotriene receptor antagonist / LABA depending on local practice)', true, 3),
  ('1e0eb98b-7048-55ca-855c-db083b94fa5d', '16589144-d4de-5739-a382-a31873f091aa', 'E', 'Increase salbutamol use only', false, 4);

-- Q187
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('c7ef6cb1-b71d-5c4b-8a0c-1558b01e6f26', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000009', 'sba', 'A 3 year old has a cough and fever (39°C), RR 45/min and crackles at the right base. SpO2 is 95% on air. He is drinking well and not in distress. What is the SINGLE most appropriate treatment?', 'Community-acquired pneumonia in children is most often caused by Streptococcus pneumoniae (and viruses). NICE NG138 recommends oral amoxicillin for 5 days in children who are not severely unwell. A macrolide is used for penicillin allergy or suspected atypical infection. Admit if SpO2 is below 92%, there is respiratory distress, the child is under 3 months, or is not feeding.', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v3')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = 'c7ef6cb1-b71d-5c4b-8a0c-1558b01e6f26';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('6073d5a1-7162-5c66-a1ac-428199b247d3', 'c7ef6cb1-b71d-5c4b-8a0c-1558b01e6f26', 'A', 'No antibiotics', false, 0),
  ('0964360b-0b69-550c-892a-32d0ae7f0b2a', 'c7ef6cb1-b71d-5c4b-8a0c-1558b01e6f26', 'B', 'Oral amoxicillin for 5 days', true, 1),
  ('9bf36073-8804-5b1f-ba00-e63af0bb873a', 'c7ef6cb1-b71d-5c4b-8a0c-1558b01e6f26', 'C', 'IV ceftriaxone', false, 2),
  ('deb05ea8-2b93-5efb-bd4b-d3e4cfdfec56', 'c7ef6cb1-b71d-5c4b-8a0c-1558b01e6f26', 'D', 'Oral clarithromycin as first-line for all', false, 3),
  ('3ce890a9-85f0-5133-846f-9d00758d6f34', 'c7ef6cb1-b71d-5c4b-8a0c-1558b01e6f26', 'E', 'Nebulised salbutamol only', false, 4);

-- Q188
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('277ccfd1-0a4a-5a8b-a190-5a15179bac67', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000009', 'sba', 'A 12 year old boy has had right iliac fossa pain for 2 days after a sore throat and cold. He has a low-grade fever, tender cervical nodes, and diffuse right-sided tenderness without guarding. Ultrasound shows enlarged mesenteric lymph nodes and a normal appendix. What is the SINGLE most likely diagnosis?', 'Mesenteric adenitis causes RIF pain mimicking appendicitis, often after a viral URTI, with enlarged mesenteric lymph nodes. It is self-limiting and managed with analgesia and observation. Appendicitis can be difficult to exclude, so re-examination and safety-netting are important.', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v3')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = '277ccfd1-0a4a-5a8b-a190-5a15179bac67';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('d4a3c395-3269-563e-9db4-5c9d4a7b9b00', '277ccfd1-0a4a-5a8b-a190-5a15179bac67', 'A', 'Meckel''s diverticulitis', false, 0),
  ('ac03f266-72fb-5a78-a2a4-7d305816a672', '277ccfd1-0a4a-5a8b-a190-5a15179bac67', 'B', 'Intussusception', false, 1),
  ('6641889b-75d5-58b9-9fc7-f09f24e6ce79', '277ccfd1-0a4a-5a8b-a190-5a15179bac67', 'C', 'Acute appendicitis', false, 2),
  ('8e3e6309-c041-5b74-b613-785acb14dbf6', '277ccfd1-0a4a-5a8b-a190-5a15179bac67', 'D', 'Crohn''s disease', false, 3),
  ('742d8279-358f-5b47-9300-edee5b9708ff', '277ccfd1-0a4a-5a8b-a190-5a15179bac67', 'E', 'Mesenteric adenitis', true, 4);

-- Q189
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('56ec238f-cf0a-5fcc-8560-e1c5f8c28881', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000009', 'sba', 'A mother asks if her 13 month old son with egg allergy (urticaria after eating egg) can have the MMR vaccine. What is the CORRECT advice?', 'MMR is grown in chick fibroblast cell culture and contains negligible egg protein. Children with egg allergy, even severe, can have MMR in primary care as normal. True contraindications to MMR include severe immunosuppression, pregnancy and anaphylaxis to a previous dose or to a vaccine component (such as neomycin or gelatin). Some influenza vaccines contain more egg protein.', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v3')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = '56ec238f-cf0a-5fcc-8560-e1c5f8c28881';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('da3a4a1d-4ea2-50b7-aac0-195b58e28266', '56ec238f-cf0a-5fcc-8560-e1c5f8c28881', 'A', 'He must never have MMR', false, 0),
  ('f8d6407c-3554-5455-a96d-e3a4866dbccb', '56ec238f-cf0a-5fcc-8560-e1c5f8c28881', 'B', 'Yes, give MMR as normal in primary care; egg allergy is not a contraindication', true, 1),
  ('2ea1fd62-1052-5e29-a332-c33c3f38019c', '56ec238f-cf0a-5fcc-8560-e1c5f8c28881', 'C', 'Only in hospital with an anaesthetist present', false, 2),
  ('a2a0d8c9-96d5-5924-9eb8-c8d624cd24ca', '56ec238f-cf0a-5fcc-8560-e1c5f8c28881', 'D', 'Give single measles vaccine only', false, 3),
  ('b61146d0-415d-54f9-b18d-37d042cb1f36', '56ec238f-cf0a-5fcc-8560-e1c5f8c28881', 'E', 'Delay until he is 5 years old', false, 4);

-- Q190
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('748e9a6d-7fb7-53b7-80e7-4ffd0eb82b66', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000007', 'sba', 'A 19 year old woman with anorexia nervosa has a BMI of 13.2, HR 38 bpm, BP 80/50 mmHg and potassium 2.6 mmol/L. She is admitted to a medical ward. Which complication is MOST important to prevent during the first week of feeding?', 'MEED guidance (2022): in severe anorexia, start feeding promptly but monitor for refeeding syndrome, a dangerous shift of phosphate, potassium and magnesium into cells when feeding restarts. It can cause arrhythmias, heart failure, seizures and death. Check bloods daily initially, replace electrolytes and give thiamine. Bradycardia, hypotension, hypoglycaemia and electrolyte disturbance are markers of high risk.', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v3')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = '748e9a6d-7fb7-53b7-80e7-4ffd0eb82b66';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('f2bf5f14-84fd-5eef-909f-aa8384cb5003', '748e9a6d-7fb7-53b7-80e7-4ffd0eb82b66', 'A', 'Hyperkalaemia', false, 0),
  ('6057f5ee-d437-5e82-9713-94cf148abb1d', '748e9a6d-7fb7-53b7-80e7-4ffd0eb82b66', 'B', 'Hypercalcaemia', false, 1),
  ('a2d616d1-9878-5900-909f-316cbc194338', '748e9a6d-7fb7-53b7-80e7-4ffd0eb82b66', 'C', 'Hypernatraemia', false, 2),
  ('450c88e6-3f36-550c-abad-abb777630e83', '748e9a6d-7fb7-53b7-80e7-4ffd0eb82b66', 'D', 'Iron overload', false, 3),
  ('1775bdce-8faf-5515-af4f-5584b23bce84', '748e9a6d-7fb7-53b7-80e7-4ffd0eb82b66', 'E', 'Refeeding syndrome (monitor and replace phosphate, potassium and magnesium; give thiamine)', true, 4);

-- Q191
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('7e06baae-6474-5f9a-b7e0-ea1fc158a805', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000007', 'sba', 'A 25 year old man is convinced that his nose is deformed and ugly, although it looks normal. He spends hours checking it in mirrors, avoids going out and has seen several cosmetic surgeons. What is the SINGLE most likely diagnosis?', 'Body dysmorphic disorder is a preoccupation with a perceived defect in appearance that is not observable or is slight, with repetitive behaviours (mirror checking, grooming, seeking reassurance). It is on the obsessive-compulsive spectrum. Treatment is CBT with exposure and response prevention, and/or an SSRI. Cosmetic surgery rarely helps.', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v3')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = '7e06baae-6474-5f9a-b7e0-ea1fc158a805';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('ca500cc1-55c8-505a-a615-39598b206e0d', '7e06baae-6474-5f9a-b7e0-ea1fc158a805', 'A', 'Obsessive-compulsive personality disorder', false, 0),
  ('2efb2d28-ff52-56ec-9999-a757961012d1', '7e06baae-6474-5f9a-b7e0-ea1fc158a805', 'B', 'Social anxiety disorder', false, 1),
  ('050d758c-510f-52a6-8e5a-63854f3668c9', '7e06baae-6474-5f9a-b7e0-ea1fc158a805', 'C', 'Delusional disorder (somatic type) only', false, 2),
  ('9ea529c3-a4fa-5f8d-967c-c8002768c43f', '7e06baae-6474-5f9a-b7e0-ea1fc158a805', 'D', 'Body dysmorphic disorder', true, 3),
  ('6f2304d0-f853-5f70-919e-920cbaff7738', '7e06baae-6474-5f9a-b7e0-ea1fc158a805', 'E', 'Schizophrenia', false, 4);

-- Q192
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('fb5955c0-430d-5185-9143-4c9d757b4c48', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000007', 'sba', 'A 45 year old man has been convinced for 2 years that he has a serious undiagnosed cancer despite repeated normal tests and reassurance. He checks his body daily and repeatedly seeks medical tests. What is the SINGLE most likely diagnosis?', 'Health anxiety is a persistent preoccupation with the possibility of having a serious illness, despite reassurance. Somatisation (somatic symptom disorder) focuses on distressing physical symptoms themselves. Factitious disorder involves deliberately producing symptoms to adopt the sick role. Malingering is deliberate production of symptoms for external gain. CBT is effective for health anxiety.', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v3')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = 'fb5955c0-430d-5185-9143-4c9d757b4c48';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('68e62e80-7d26-58aa-9b25-7ef9f18643a6', 'fb5955c0-430d-5185-9143-4c9d757b4c48', 'A', 'Malingering', false, 0),
  ('01f5e20f-a2ba-5c0e-a4d1-866cd0155006', 'fb5955c0-430d-5185-9143-4c9d757b4c48', 'B', 'Conversion disorder', false, 1),
  ('a7014732-33dd-500f-9b45-1c1598a9c1e6', 'fb5955c0-430d-5185-9143-4c9d757b4c48', 'C', 'Somatisation disorder', false, 2),
  ('4308f6c5-8c6c-54dc-a85f-f36556263d94', 'fb5955c0-430d-5185-9143-4c9d757b4c48', 'D', 'Health anxiety (hypochondriacal disorder)', true, 3),
  ('bab2ef81-ef4c-5d52-95c0-6c75cc2fff5b', 'fb5955c0-430d-5185-9143-4c9d757b4c48', 'E', 'Factitious disorder', false, 4);

-- Q193
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('21847970-9499-5bea-9460-ade3588499ef', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000007', 'sba', 'A 30 year old nurse has recurrent episodes of hypoglycaemia. Blood tests during an episode show high insulin and a low C-peptide. She has no diabetes. What is the SINGLE most likely explanation?', 'Exogenous insulin injection causes hypoglycaemia with high insulin and low C-peptide (because commercial insulin has no C-peptide). An insulinoma or sulfonylurea use raises both insulin and C-peptide (check a sulfonylurea screen). Factitious disorder is the deliberate production of symptoms to assume the sick role, without external gain, and is more common in healthcare workers.', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v3')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = '21847970-9499-5bea-9460-ade3588499ef';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('3a61dc20-a48f-5bf4-911e-c71b764dcff6', '21847970-9499-5bea-9460-ade3588499ef', 'A', 'Addison''s disease', false, 0),
  ('9cda6b29-8ee8-551a-a1cc-562790bf2435', '21847970-9499-5bea-9460-ade3588499ef', 'B', 'Insulinoma', false, 1),
  ('55941677-4971-517c-9486-8e2a552bc356', '21847970-9499-5bea-9460-ade3588499ef', 'C', 'Sulfonylurea misuse', false, 2),
  ('bd523b75-b148-59de-ba60-ddc465557936', '21847970-9499-5bea-9460-ade3588499ef', 'D', 'Factitious disorder (surreptitious exogenous insulin administration)', true, 3),
  ('58ca5d69-dea2-55cc-afe6-68603df31453', '21847970-9499-5bea-9460-ade3588499ef', 'E', 'Malingering for financial gain', false, 4);

-- Q194
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('25faf5e2-8793-5dae-bcf9-6a981637b785', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000007', 'sba', 'A 28 year old woman developed sudden blindness in both eyes after a major argument with her partner. Her pupils react normally and an optokinetic drum produces nystagmus. Neurological examination is otherwise normal. What is the SINGLE most likely diagnosis?', 'Functional neurological disorder causes genuine neurological symptoms (weakness, blindness, seizures) that are not explained by structural disease and are inconsistent with known pathology, often after stress. The symptoms are not deliberately produced. Explain the diagnosis positively, and offer physiotherapy and psychological therapy.', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v3')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = '25faf5e2-8793-5dae-bcf9-6a981637b785';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('6dfb0d02-d1d5-50a1-9c37-9a6f5496beb5', '25faf5e2-8793-5dae-bcf9-6a981637b785', 'A', 'Functional neurological disorder (conversion disorder)', true, 0),
  ('7bcfec4a-9ef0-575b-8c55-f9c7700eb336', '25faf5e2-8793-5dae-bcf9-6a981637b785', 'B', 'Bilateral occipital infarction', false, 1),
  ('36e48551-01f7-54c7-af5c-844f9d4f3259', '25faf5e2-8793-5dae-bcf9-6a981637b785', 'C', 'Malingering', false, 2),
  ('c40c7e91-8f1e-53f9-b4c8-47abf41ef497', '25faf5e2-8793-5dae-bcf9-6a981637b785', 'D', 'Factitious disorder', false, 3),
  ('4cc22278-6e92-5515-8cdd-f3ac00ce32f1', '25faf5e2-8793-5dae-bcf9-6a981637b785', 'E', 'Optic neuritis', false, 4);

-- Q195
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('49a41ad4-3822-5fb6-ab26-e4a8f827ae21', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000007', 'sba', 'A 32 year old woman with bipolar disorder takes lithium and is planning a pregnancy. Which fetal risk is MOST associated with lithium?', 'First-trimester lithium is associated with a small increased risk of cardiac malformations, notably Ebstein''s anomaly. Discuss risks and benefits with specialist perinatal psychiatry. If lithium continues, monitor levels more often (every 4 weeks, then weekly from 36 weeks), offer a fetal echo, and give it at a lower level around delivery. Valproate is much more teratogenic.', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v3')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = '49a41ad4-3822-5fb6-ab26-e4a8f827ae21';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('03e7eab9-61fc-5cd1-ba09-ff024ea8c02b', '49a41ad4-3822-5fb6-ab26-e4a8f827ae21', 'A', 'Ebstein''s anomaly (cardiac malformation)', true, 0),
  ('63c708ea-9a29-51fb-a836-90585781aa3b', '49a41ad4-3822-5fb6-ab26-e4a8f827ae21', 'B', 'Limb reduction defects', false, 1),
  ('23887dd6-41c5-5665-b3af-d7f26df40b48', '49a41ad4-3822-5fb6-ab26-e4a8f827ae21', 'C', 'Cleft lip', false, 2),
  ('f6991f60-f5df-5e6c-97b1-566d433f4988', '49a41ad4-3822-5fb6-ab26-e4a8f827ae21', 'D', 'Gray baby syndrome', false, 3),
  ('a36a9d34-109b-50df-9fc6-e2c3086e7ce7', '49a41ad4-3822-5fb6-ab26-e4a8f827ae21', 'E', 'Neural tube defects', false, 4);

-- Q196
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('1bbca81b-9516-5f25-8369-1abeae3736bb', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000007', 'sba', 'A 42 year old man takes phenelzine for depression. After a meal of aged cheese, cured meats and red wine, he develops a severe occipital headache, palpitations and a BP of 220/130 mmHg. What is the SINGLE most likely cause?', 'MAOIs prevent the breakdown of dietary tyramine, which can release noradrenaline and cause a hypertensive crisis (''cheese reaction''). Patients must avoid tyramine-rich foods (aged cheese, cured meats, yeast extracts, fermented products, some wines). MAOIs also interact dangerously with other serotonergic drugs and sympathomimetics.', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v3')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = '1bbca81b-9516-5f25-8369-1abeae3736bb';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('be4e931c-8621-53e1-b850-c502bd06ad48', '1bbca81b-9516-5f25-8369-1abeae3736bb', 'A', 'Phaeochromocytoma', false, 0),
  ('043a83e8-563d-5892-ad1d-8f42709560c8', '1bbca81b-9516-5f25-8369-1abeae3736bb', 'B', 'Neuroleptic malignant syndrome', false, 1),
  ('f1ff5b6b-94dc-51bc-8171-7f3e2b358e48', '1bbca81b-9516-5f25-8369-1abeae3736bb', 'C', 'Serotonin syndrome', false, 2),
  ('a9714bfb-c073-5364-b114-7492d392e31f', '1bbca81b-9516-5f25-8369-1abeae3736bb', 'D', 'Hypertensive crisis from tyramine interaction with an MAOI', true, 3),
  ('0b905b53-27d5-587c-a702-811e56c4acce', '1bbca81b-9516-5f25-8369-1abeae3736bb', 'E', 'Subarachnoid haemorrhage only', false, 4);

-- Q197
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('a10749d3-39f4-5894-abbf-b5336a2a7ef7', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000007', 'sba', 'A 55 year old woman taking venlafaxine at a high dose for depression has a BP of 165/100 mmHg at review, previously normal. What is the SINGLE most likely explanation?', 'Venlafaxine (an SNRI) can raise blood pressure at higher doses through noradrenergic effects, so BP should be monitored. It also has a significant discontinuation syndrome and is more dangerous in overdose than SSRIs. Mirtazapine causes sedation and weight gain. Tricyclics cause anticholinergic effects and are cardiotoxic in overdose.', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v3')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = 'a10749d3-39f4-5894-abbf-b5336a2a7ef7';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('c854ad3b-aa59-5c7f-92a3-9d97bf83debe', 'a10749d3-39f4-5894-abbf-b5336a2a7ef7', 'A', 'Dose-related hypertension caused by venlafaxine (an SNRI)', true, 0),
  ('9a5be773-50ed-5e10-a336-da4ecaeb2794', 'a10749d3-39f4-5894-abbf-b5336a2a7ef7', 'B', 'Primary hyperaldosteronism', false, 1),
  ('23005d70-dfa1-5905-8bd5-4f60d9c301e2', 'a10749d3-39f4-5894-abbf-b5336a2a7ef7', 'C', 'Lithium toxicity', false, 2),
  ('8f6e0e6d-c8a7-5823-adcb-efa2c066ef18', 'a10749d3-39f4-5894-abbf-b5336a2a7ef7', 'D', 'Serotonin syndrome', false, 3),
  ('dc75669e-0985-5f46-b196-d1bffa3064b2', 'a10749d3-39f4-5894-abbf-b5336a2a7ef7', 'E', 'White coat hypertension only', false, 4);

-- Q198
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('e1ea746e-0087-5aab-8fd5-7661e9999afc', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000007', 'sba', 'A 72 year old woman with depression has poor sleep and weight loss. She is also on several drugs that interact with SSRIs. Which antidepressant is particularly useful when insomnia and poor appetite are prominent?', 'Mirtazapine is sedating and increases appetite, so it is useful for people with insomnia or weight loss, and it has fewer sexual side effects and drug interactions than SSRIs. Its side effects include weight gain and daytime sedation. Rarely, it causes agranulocytosis.', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v3')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = 'e1ea746e-0087-5aab-8fd5-7661e9999afc';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('772b2f15-1d01-5866-9906-18efb5eaf451', 'e1ea746e-0087-5aab-8fd5-7661e9999afc', 'A', 'Bupropion', false, 0),
  ('a89ecadc-9f3b-5c7b-b9d1-a23eec929f15', 'e1ea746e-0087-5aab-8fd5-7661e9999afc', 'B', 'Phenelzine', false, 1),
  ('4fdc333c-d390-5ff8-b344-bf6c5bc4aa84', 'e1ea746e-0087-5aab-8fd5-7661e9999afc', 'C', 'Fluoxetine', false, 2),
  ('9396f5a1-1e07-5c32-bcf5-5775598cb92a', 'e1ea746e-0087-5aab-8fd5-7661e9999afc', 'D', 'Mirtazapine', true, 3),
  ('8c47e62e-aa05-5e60-abdf-3aefc3ad655f', 'e1ea746e-0087-5aab-8fd5-7661e9999afc', 'E', 'Venlafaxine', false, 4);

-- Q199
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('76f8eaa9-84ec-5adb-b031-30867ca40e1a', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000007', 'sba', 'A 25 year old man with schizophrenia has had his positive symptoms well controlled for a year, but he remains withdrawn, has poverty of speech, flat affect and lack of motivation. What are these symptoms called?', 'Negative symptoms of schizophrenia include alogia (poverty of speech), avolition, anhedonia, affective blunting and asociality. They respond poorly to antipsychotics and are linked to worse functional outcome. Exclude depression and antipsychotic-induced parkinsonism (akinesia). Psychosocial interventions help.', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v3')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = '76f8eaa9-84ec-5adb-b031-30867ca40e1a';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('0e430798-34d9-5c2c-946c-d424fcb8cea8', '76f8eaa9-84ec-5adb-b031-30867ca40e1a', 'A', 'Positive symptoms', false, 0),
  ('d6ca6945-bc21-54df-a577-850f878b29fb', '76f8eaa9-84ec-5adb-b031-30867ca40e1a', 'B', 'Cognitive symptoms only', false, 1),
  ('154b9f1d-53c1-51ee-8531-f8c3e8de4c22', '76f8eaa9-84ec-5adb-b031-30867ca40e1a', 'C', 'Catatonic symptoms', false, 2),
  ('3cccc735-a315-5588-ab98-58c6ffa1ff67', '76f8eaa9-84ec-5adb-b031-30867ca40e1a', 'D', 'Negative symptoms', true, 3),
  ('d277bd6e-8892-585d-b084-307b12fd678c', '76f8eaa9-84ec-5adb-b031-30867ca40e1a', 'E', 'Extrapyramidal side effects', false, 4);

-- Q200
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('be1d046b-4a19-57be-ac4d-a25f72f564b9', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000007', 'sba', 'A 52 year old woman has believed for 3 years that her husband is having an affair, with no evidence. She checks his phone and follows him. She works normally and has no hallucinations or other symptoms. What is the SINGLE most likely diagnosis?', 'Delusional disorder is a persistent, fixed, non-bizarre delusion lasting 3 months or more, with otherwise relatively preserved functioning and no prominent hallucinations. The jealous type (Othello syndrome) is associated with alcohol misuse and carries a risk of violence towards the partner, so risk assessment is important. Treatment is with antipsychotics.', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v3')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = 'be1d046b-4a19-57be-ac4d-a25f72f564b9';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('0f908f09-a69b-5fbb-b5b4-43b444134af8', 'be1d046b-4a19-57be-ac4d-a25f72f564b9', 'A', 'Obsessive-compulsive disorder', false, 0),
  ('9ebbd8f6-9c98-5371-976a-3f17a586c1bd', 'be1d046b-4a19-57be-ac4d-a25f72f564b9', 'B', 'Paranoid personality disorder', false, 1),
  ('6a751715-a624-5c2e-993c-15d1ae42e7f2', 'be1d046b-4a19-57be-ac4d-a25f72f564b9', 'C', 'Schizophrenia', false, 2),
  ('f289e18f-9d47-5b89-887d-4850e0a6c231', 'be1d046b-4a19-57be-ac4d-a25f72f564b9', 'D', 'Bipolar disorder', false, 3),
  ('71b67091-592a-59fe-82ab-6048926f8881', 'be1d046b-4a19-57be-ac4d-a25f72f564b9', 'E', 'Delusional disorder (jealous type, Othello syndrome)', true, 4);

