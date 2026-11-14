-- =============================================================================
-- PLAB 1 bank v3 import PART 3 (Q401–600 of 830)
-- Paste AFTER seed_topics_expand.sql. Additive to banks v1/v2 — do NOT clear.
-- =============================================================================

-- Q401
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('644cb162-49ca-5e6a-9e6b-83df837e11d6', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000015', 'sba', 'A 16 year old was hit in the eye by a squash ball. He has reduced vision and a fluid level of blood in the anterior chamber. What is the SINGLE most appropriate management?', 'A hyphaema after blunt trauma needs ophthalmology assessment because of the risks of raised intraocular pressure, re-bleeding (days 3-5), corneal blood staining and associated injuries (retinal detachment, globe rupture). Patients with sickle cell disease are at higher risk. Avoid aspirin and NSAIDs. Treat with steroid and cycloplegic drops.', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v3')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = '644cb162-49ca-5e6a-9e6b-83df837e11d6';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('4ceab5a6-8f21-5980-aa37-97becabb9db0', '644cb162-49ca-5e6a-9e6b-83df837e11d6', 'A', 'Discharge with analgesia', false, 0),
  ('c3e42f11-ddd7-52f6-9ae9-db065ec869cc', '644cb162-49ca-5e6a-9e6b-83df837e11d6', 'B', 'Ice pack and review in 2 weeks', false, 1),
  ('67af5dbb-c907-5b9f-b173-ba08b2fda933', '644cb162-49ca-5e6a-9e6b-83df837e11d6', 'C', 'Same-day ophthalmology referral (traumatic hyphaema): check intraocular pressure, rest with head elevated, avoid NSAIDs', true, 2),
  ('91482a83-125b-5cdc-924a-421757ac2654', '644cb162-49ca-5e6a-9e6b-83df837e11d6', 'D', 'Drain in A&E', false, 3),
  ('ba02b9df-4d45-59db-820b-1a946a8b2944', '644cb162-49ca-5e6a-9e6b-83df837e11d6', 'E', 'Topical antibiotics only', false, 4);

-- Q402
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('2d68e590-33d4-52fd-8992-551ccdf55086', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000015', 'sba', 'A 40 year old man felt something hit his eye while hammering. He has reduced vision, an irregular, teardrop-shaped pupil and a positive Seidel test (aqueous leaking through the cornea). What is the SINGLE most appropriate immediate step?', 'A penetrating eye injury or open globe needs a rigid shield (not a pad), no pressure on the eye, and no drops. Give anti-emetics (vomiting raises intraocular pressure), tetanus cover and IV antibiotics. Get CT to look for an intraocular foreign body (MRI is contraindicated for metal). Emergency surgical repair follows.', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v3')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = '2d68e590-33d4-52fd-8992-551ccdf55086';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('5e9e1b5d-5808-51e9-a931-61eaa9c548b0', '2d68e590-33d4-52fd-8992-551ccdf55086', 'A', 'Irrigate vigorously', false, 0),
  ('b9a87e66-f567-5ce0-ba71-42c0d2321eb8', '2d68e590-33d4-52fd-8992-551ccdf55086', 'B', 'Instil topical drops and discharge', false, 1),
  ('ba6db97c-42e5-53f8-8022-5b0653ecb695', '2d68e590-33d4-52fd-8992-551ccdf55086', 'C', 'Apply a pressure patch', false, 2),
  ('58d06bb9-39e1-577f-8b0a-316903609dc9', '2d68e590-33d4-52fd-8992-551ccdf55086', 'D', 'Protect the eye with a rigid shield (no pressure), keep nil by mouth, and arrange emergency ophthalmology review with CT', true, 3),
  ('0c5a170a-57ad-57eb-bb75-756a4d2ad880', '2d68e590-33d4-52fd-8992-551ccdf55086', 'E', 'Remove any protruding object in A&E', false, 4);

-- Q403
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('8ef1fb73-d7c7-551c-b347-e573d686fdd8', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000015', 'sba', 'A 50 year old woman with rheumatoid arthritis has a severely painful red eye that wakes her at night, with tenderness of the globe. The redness does not blanch with phenylephrine drops. What is the SINGLE most likely diagnosis?', 'Scleritis is severe, boring pain (often waking the patient) with a deep red or violet eye, tenderness, and possible reduced vision. It is associated with RA, GPA and other vasculitides. It needs urgent ophthalmology review and systemic treatment (NSAIDs, steroids, immunosuppression). Episcleritis is mild with little pain, and blanches with phenylephrine.', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v3')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = '8ef1fb73-d7c7-551c-b347-e573d686fdd8';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('1137e14c-4df6-501a-945d-e599ef616241', '8ef1fb73-d7c7-551c-b347-e573d686fdd8', 'A', 'Conjunctivitis', false, 0),
  ('f5842d0b-44e0-559d-802a-5276d706c032', '8ef1fb73-d7c7-551c-b347-e573d686fdd8', 'B', 'Episcleritis', false, 1),
  ('f8d769b8-82de-504e-9e9a-eaa13d606969', '8ef1fb73-d7c7-551c-b347-e573d686fdd8', 'C', 'Subconjunctival haemorrhage', false, 2),
  ('b0280072-5090-5cb0-a816-492ce58d4f69', '8ef1fb73-d7c7-551c-b347-e573d686fdd8', 'D', 'Anterior uveitis', false, 3),
  ('74a6b12b-7349-5d9f-a5e9-4ac8198da5af', '8ef1fb73-d7c7-551c-b347-e573d686fdd8', 'E', 'Scleritis', true, 4);

-- Q404
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('ccd84f3d-6667-5410-b8a9-23a4f63ba563', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000015', 'sba', 'A 72 year old woman had cataract surgery 3 days ago. She now has a very painful red eye, reduced vision and a fluid level of pus in the anterior chamber. What is the SINGLE most likely diagnosis?', 'Endophthalmitis is a sight-threatening infection inside the eye, usually 1-7 days after intraocular surgery or injection. It causes pain, redness, reduced vision and hypopyon. It needs emergency ophthalmology care: vitreous tap and intravitreal antibiotics.', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v3')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = 'ccd84f3d-6667-5410-b8a9-23a4f63ba563';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('33b906d8-5ff5-5187-a209-437690aca044', 'ccd84f3d-6667-5410-b8a9-23a4f63ba563', 'A', 'Acute angle-closure glaucoma', false, 0),
  ('29dabee1-183a-564a-a4d9-211fdc6e8d03', 'ccd84f3d-6667-5410-b8a9-23a4f63ba563', 'B', 'Retinal detachment', false, 1),
  ('2874861f-6ab4-51c3-a830-b9561cecfd89', 'ccd84f3d-6667-5410-b8a9-23a4f63ba563', 'C', 'Posterior capsule opacification', false, 2),
  ('18d14591-b982-590d-b5c0-3e931e251674', 'ccd84f3d-6667-5410-b8a9-23a4f63ba563', 'D', 'Normal postoperative inflammation', false, 3),
  ('cc286cc0-c05d-58cc-87fd-363160285e7f', 'ccd84f3d-6667-5410-b8a9-23a4f63ba563', 'E', 'Acute postoperative endophthalmitis', true, 4);

-- Q405
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('a1423cdf-7171-51c2-9b41-5cb367e6278d', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000015', 'sba', 'A 75 year old man had uncomplicated cataract surgery 2 years ago. Over the last few months his vision in that eye has gradually become cloudy again, with glare. What is the SINGLE most likely cause and treatment?', 'Posterior capsule opacification is the commonest late complication of cataract surgery, as lens epithelial cells grow on the remaining capsule. It causes gradual blurring and glare. It is easily treated with a YAG laser capsulotomy in outpatients.', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v3')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = 'a1423cdf-7171-51c2-9b41-5cb367e6278d';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('ccca4fc1-1c64-5510-994d-502eae41e8ed', 'a1423cdf-7171-51c2-9b41-5cb367e6278d', 'A', 'Glaucoma; drops', false, 0),
  ('b32f4221-62f3-5ea8-957f-1df48c5e530f', 'a1423cdf-7171-51c2-9b41-5cb367e6278d', 'B', 'Endophthalmitis; antibiotics', false, 1),
  ('74a1769a-a062-5b35-bd86-0ae7dcf65341', 'a1423cdf-7171-51c2-9b41-5cb367e6278d', 'C', 'Wet AMD; anti-VEGF', false, 2),
  ('217de0bb-ff7b-5a8d-900f-0cef24fb8146', 'a1423cdf-7171-51c2-9b41-5cb367e6278d', 'D', 'Posterior capsule opacification; YAG laser capsulotomy', true, 3),
  ('8d8cce43-30a3-5f4e-a20f-fbd193fe9857', 'a1423cdf-7171-51c2-9b41-5cb367e6278d', 'E', 'Recurrent cataract in the lens; repeat surgery', false, 4);

-- Q406
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('df7d1385-4330-57ad-8829-ba0648953811', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000015', 'sba', 'A 58 year old man with type 1 diabetes has retinal screening showing new vessels on the optic disc and a pre-retinal haemorrhage. What is the SINGLE most appropriate treatment?', 'Proliferative diabetic retinopathy (new vessels on the disc or elsewhere) risks vitreous haemorrhage, tractional retinal detachment and neovascular glaucoma. It needs urgent referral for panretinal laser photocoagulation, with anti-VEGF injections as an alternative or adjunct. Vitrectomy is used for non-clearing haemorrhage or traction. Optimise glucose, BP and lipids.', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v3')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = 'df7d1385-4330-57ad-8829-ba0648953811';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('17994081-eb14-5d43-8ae4-657344b9493e', 'df7d1385-4330-57ad-8829-ba0648953811', 'A', 'Annual screening only', false, 0),
  ('b32fe6d0-9f40-55a1-9573-ef6b85f63d8c', 'df7d1385-4330-57ad-8829-ba0648953811', 'B', 'Oral aspirin', false, 1),
  ('5534f59b-6933-5e2e-8350-e884573c9d57', 'df7d1385-4330-57ad-8829-ba0648953811', 'C', 'Urgent ophthalmology referral for panretinal photocoagulation (and/or anti-VEGF)', true, 2),
  ('def5e2ea-a9db-542a-9c6b-201014bf7c55', 'df7d1385-4330-57ad-8829-ba0648953811', 'D', 'Topical steroid drops', false, 3),
  ('340c16b6-b62c-5ff1-92fe-9a35fdd95cb6', 'df7d1385-4330-57ad-8829-ba0648953811', 'E', 'Cataract surgery', false, 4);

-- Q407
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('6c57c679-cd00-548c-9216-eda4d64ee356', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000015', 'sba', 'A 52 year old man has a BP of 230/130 mmHg, headache and blurred vision. Fundoscopy shows flame haemorrhages, cotton wool spots and bilateral optic disc swelling. What does this indicate?', 'Papilloedema with haemorrhages and cotton wool spots in severe hypertension indicates accelerated hypertension, a medical emergency (risk of encephalopathy, AKI, heart failure). Admit for careful, controlled BP reduction (not too fast) and look for end-organ damage and secondary causes. Keith-Wagener grades: 1, arteriolar narrowing; 2, AV nipping; 3, haemorrhages and exudates; 4, papilloedema.', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v3')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = '6c57c679-cd00-548c-9216-eda4d64ee356';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('3e16ba6d-735a-5218-b0f5-4413d43f490d', '6c57c679-cd00-548c-9216-eda4d64ee356', 'A', 'Idiopathic intracranial hypertension', false, 0),
  ('59d23ac9-8268-593f-9e4c-db10fce3830b', '6c57c679-cd00-548c-9216-eda4d64ee356', 'B', 'Accelerated (malignant) hypertension with hypertensive retinopathy (Keith-Wagener grade 4); urgent hospital assessment', true, 1),
  ('3ef463a4-e3ed-5176-a35a-f7828f72fa9b', '6c57c679-cd00-548c-9216-eda4d64ee356', 'C', 'Central retinal vein occlusion', false, 2),
  ('577d3e7f-1611-5371-96b4-93a0b256432e', '6c57c679-cd00-548c-9216-eda4d64ee356', 'D', 'Diabetic retinopathy', false, 3),
  ('64a8ee05-26ec-541d-b3b1-cc1add161fce', '6c57c679-cd00-548c-9216-eda4d64ee356', 'E', 'Grade 1 hypertensive retinopathy; routine follow-up', false, 4);

-- Q408
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('aa1bafdf-4724-5b55-8b6b-d801479c5b5d', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000015', 'sba', 'A 20 year old man has had night blindness since childhood, and now has a constricted visual field (tunnel vision). Fundoscopy shows bone-spicule pigmentation in the peripheral retina. What is the SINGLE most likely diagnosis?', 'Retinitis pigmentosa is an inherited rod-cone dystrophy causing night blindness, then progressive peripheral field loss (tunnel vision), with bone-spicule pigmentation, attenuated vessels and waxy disc pallor. It can be part of syndromes (Usher syndrome with deafness). Gene therapy is available for some forms (RPE65). Driving and occupational advice are needed.', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v3')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = 'aa1bafdf-4724-5b55-8b6b-d801479c5b5d';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('fb4215f2-8627-5894-b020-6c04b2c15984', 'aa1bafdf-4724-5b55-8b6b-d801479c5b5d', 'A', 'Macular degeneration', false, 0),
  ('77defc2d-9548-5841-8cef-54e628156715', 'aa1bafdf-4724-5b55-8b6b-d801479c5b5d', 'B', 'Vitamin A deficiency only', false, 1),
  ('7c67ddda-493b-5ef3-9cc1-d621ebc0f293', 'aa1bafdf-4724-5b55-8b6b-d801479c5b5d', 'C', 'Glaucoma', false, 2),
  ('2bffe226-74d1-5b0f-b761-d8097c9b10f4', 'aa1bafdf-4724-5b55-8b6b-d801479c5b5d', 'D', 'Diabetic retinopathy', false, 3),
  ('2cfe79fc-6e21-5cbe-b29e-1ab26b2545bc', 'aa1bafdf-4724-5b55-8b6b-d801479c5b5d', 'E', 'Retinitis pigmentosa', true, 4);

-- Q409
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('5019ba76-eecc-5123-ad51-ca446c999ac8', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000015', 'sba', 'A 70 year old man uses latanoprost eye drops for glaucoma. What is a recognised side effect he should be warned about?', 'Prostaglandin analogues (latanoprost) are first-line for open-angle glaucoma. Side effects include brown iris pigmentation (often permanent), eyelash growth, periorbital fat atrophy and conjunctival redness. Topical beta-blockers (timolol) can cause bradycardia and bronchospasm (avoid in asthma and heart block). Carbonic anhydrase inhibitors and alpha-agonists are also used.', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v3')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = '5019ba76-eecc-5123-ad51-ca446c999ac8';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('88aa54e4-cbac-5cdb-882c-639bbb5501d9', '5019ba76-eecc-5123-ad51-ca446c999ac8', 'A', 'Bradycardia and bronchospasm', false, 0),
  ('ec1578c9-c822-57cf-94a6-841d4a4c1b3b', '5019ba76-eecc-5123-ad51-ca446c999ac8', 'B', 'Hyperglycaemia', false, 1),
  ('9862234a-dc5a-5d2f-8c89-6c6dcd2f171a', '5019ba76-eecc-5123-ad51-ca446c999ac8', 'C', 'Acute angle closure', false, 2),
  ('652d9c11-3348-5be2-b257-c69a009bde2c', '5019ba76-eecc-5123-ad51-ca446c999ac8', 'D', 'Cataracts within weeks', false, 3),
  ('6a231abb-4a57-5cd7-81a1-781e533f387b', '5019ba76-eecc-5123-ad51-ca446c999ac8', 'E', 'Darkening of the iris colour and lengthening of the eyelashes', true, 4);

-- Q410
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('f097ef20-ff57-5ceb-b9e4-6d3575c58323', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000015', 'sba', 'A 60 year old man has had 3 days of a painful swelling at the inner corner of his right eye below the medial canthus, with watering and pus on pressure. What is the SINGLE most likely diagnosis?', 'Acute dacryocystitis is infection of the lacrimal sac, usually from nasolacrimal duct obstruction. It causes a tender red swelling below the medial canthal tendon with epiphora and discharge. Treat with oral antibiotics (co-amoxiclav), warm compresses, and refer if there is orbital involvement. Dacryocystorhinostomy treats the underlying obstruction.', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v3')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = 'f097ef20-ff57-5ceb-b9e4-6d3575c58323';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('5d39e145-3f6a-5333-908e-26dd95d6baaf', 'f097ef20-ff57-5ceb-b9e4-6d3575c58323', 'A', 'Acute dacryocystitis', true, 0),
  ('c99b440a-9f19-5501-ace1-d4d6dc16399e', 'f097ef20-ff57-5ceb-b9e4-6d3575c58323', 'B', 'Orbital cellulitis', false, 1),
  ('1b7ea999-daf8-5850-91a7-15b781e09589', 'f097ef20-ff57-5ceb-b9e4-6d3575c58323', 'C', 'Blepharitis', false, 2),
  ('6e0b7202-f9c7-5a67-b6a7-cff411395b66', 'f097ef20-ff57-5ceb-b9e4-6d3575c58323', 'D', 'Stye (hordeolum)', false, 3),
  ('6a5f8245-7eef-536a-b896-efd2a6eee972', 'f097ef20-ff57-5ceb-b9e4-6d3575c58323', 'E', 'Chalazion', false, 4);

-- Q411
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('508196c3-6ae3-5b5a-ab1f-e049a71f491f', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000015', 'sba', 'A 75 year old woman has a sore red eye with watering. Her lower eyelid is turned inwards, and the lashes rub on the cornea. What is the SINGLE most likely diagnosis?', 'Entropion (inward-turning lid, usually lower and age-related) causes lashes to rub on the cornea (trichiasis), leading to irritation and corneal ulceration. Taping the lid gives temporary relief, and surgery corrects it. Ectropion (outward turning) causes epiphora and exposure. Chronic trichiasis from scarring is seen in trachoma.', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v3')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = '508196c3-6ae3-5b5a-ab1f-e049a71f491f';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('5dee65a3-4739-5305-9aeb-2f12fda0bcdc', '508196c3-6ae3-5b5a-ab1f-e049a71f491f', 'A', 'Blepharitis', false, 0),
  ('12c9e214-f243-5dae-b20c-17788e6d477e', '508196c3-6ae3-5b5a-ab1f-e049a71f491f', 'B', 'Entropion', true, 1),
  ('8e1d0853-2613-5e21-bc82-01318d737815', '508196c3-6ae3-5b5a-ab1f-e049a71f491f', 'C', 'Chalazion', false, 2),
  ('f86a0d22-240a-57d7-a41a-a21dc9b27e03', '508196c3-6ae3-5b5a-ab1f-e049a71f491f', 'D', 'Ptosis', false, 3),
  ('c41b3d36-d83b-57c0-b425-405036a12a17', '508196c3-6ae3-5b5a-ab1f-e049a71f491f', 'E', 'Ectropion', false, 4);

-- Q412
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('585fb798-d661-505d-85d1-482e8a26c719', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000015', 'sba', 'A 60 year old man asks about driving after being told he has glaucoma in both eyes with visual field loss. What is the CORRECT advice?', 'Drivers must tell the DVLA about any condition affecting both eyes (or one eye with Group 2) that affects the visual field, such as glaucoma. The DVLA will arrange formal field testing (Esterman). Car drivers also need to read a number plate at 20 metres (corrected acuity of at least 6/12). Clinicians should advise patients about this duty.', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v3')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = '585fb798-d661-505d-85d1-482e8a26c719';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('3b3c5ce4-0fde-57ee-8bcf-fc7ca7de1adb', '585fb798-d661-505d-85d1-482e8a26c719', 'A', 'He does not need to inform the DVLA', false, 0),
  ('865883da-298c-5eba-afcd-e18542cdff0e', '585fb798-d661-505d-85d1-482e8a26c719', 'B', 'Only lorry drivers need to inform the DVLA', false, 1),
  ('92a256bd-16af-51ff-86ba-c62c49725033', '585fb798-d661-505d-85d1-482e8a26c719', 'C', 'He can drive only at night', false, 2),
  ('fc5968ed-3325-5b50-a869-5c6ba24c89c3', '585fb798-d661-505d-85d1-482e8a26c719', 'D', 'He must inform the DVLA, which will assess whether his visual field meets the standard for driving', true, 3),
  ('b9cf3edb-c0b5-5345-acfa-a22e9ce64939', '585fb798-d661-505d-85d1-482e8a26c719', 'E', 'He must stop driving permanently', false, 4);

-- Q413
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('7bb85793-a0f3-5599-9023-75a3951ad821', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000011', 'sba', 'A 25 year old cyclist fell onto his shoulder. He has pain and a deformity in the middle third of his clavicle. The skin is intact, and he is neurovascularly intact. What is the SINGLE most appropriate management?', 'Most midshaft clavicle fractures are treated conservatively with a sling and early movement, and heal within 6-12 weeks (a bony lump is common). Surgery is considered for open fractures, skin tenting, neurovascular injury, significant shortening or displacement, or a ''floating shoulder''.', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v3')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = '7bb85793-a0f3-5599-9023-75a3951ad821';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('e5ebd3ca-6393-5949-9ba5-9cb6d92ce4df', '7bb85793-a0f3-5599-9023-75a3951ad821', 'A', 'Figure-of-eight bandage for 12 weeks', false, 0),
  ('8eb45d4c-1307-54a3-badc-7eb7f83cfc31', '7bb85793-a0f3-5599-9023-75a3951ad821', 'B', 'No support and no follow-up', false, 1),
  ('fbe0fcb9-c5ea-52f5-922c-bdf2461ce47d', '7bb85793-a0f3-5599-9023-75a3951ad821', 'C', 'Above-elbow cast', false, 2),
  ('d45966a8-441d-5883-b7d6-c0f4a5c97670', '7bb85793-a0f3-5599-9023-75a3951ad821', 'D', 'Broad arm sling for comfort and early mobilisation as pain allows', true, 3),
  ('bb013405-dadd-5a1f-b386-602ed8e9d197', '7bb85793-a0f3-5599-9023-75a3951ad821', 'E', 'Immediate open reduction and internal fixation', false, 4);

-- Q414
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('33e69eef-8e95-5373-a376-b084ec57aef1', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000011', 'sba', 'A 35 year old man had a generalised tonic-clonic seizure. He now has shoulder pain, and his arm is held internally rotated. He cannot externally rotate it. The AP X-ray shows a ''light bulb'' appearance of the humeral head. What is the SINGLE most likely diagnosis?', 'Posterior shoulder dislocations are rare and often missed. They are classically caused by seizures or electric shocks. The arm is held internally rotated and cannot externally rotate. The AP view shows a ''light bulb'' humeral head, and an axillary or Y view confirms it. Anterior dislocations (95%) put the axillary nerve at risk.', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v3')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = '33e69eef-8e95-5373-a376-b084ec57aef1';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('bd37907c-adef-5f8b-aff3-a14dfa446692', '33e69eef-8e95-5373-a376-b084ec57aef1', 'A', 'Rotator cuff tear', false, 0),
  ('e87c5910-4bbc-514d-8f4f-d05ed737073b', '33e69eef-8e95-5373-a376-b084ec57aef1', 'B', 'Anterior shoulder dislocation', false, 1),
  ('e1381c17-6b0a-5e34-a928-146b227607e6', '33e69eef-8e95-5373-a376-b084ec57aef1', 'C', 'Proximal humerus fracture only', false, 2),
  ('43aded79-3d6b-5e8e-8269-9a3662ec8fa9', '33e69eef-8e95-5373-a376-b084ec57aef1', 'D', 'Posterior shoulder dislocation', true, 3),
  ('ed3c9d78-699c-5854-a9aa-d9c6d609185a', '33e69eef-8e95-5373-a376-b084ec57aef1', 'E', 'Acromioclavicular joint dislocation', false, 4);

-- Q415
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('f77837d8-6de9-5a39-b944-1d248f3fb1e5', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000011', 'sba', 'A 30 year old man has had a painful swelling of the thumb after a fall while skiing, with the thumb pulled outwards. There is tenderness and laxity of the ulnar side of the thumb MCP joint on stress testing. What is the SINGLE most likely diagnosis?', 'Forced abduction of the thumb tears the ulnar collateral ligament of the MCP joint. Partial tears are treated in a thumb spica splint. Complete tears (often with a Stener lesion, where the adductor aponeurosis gets between the ligament ends) need surgical repair. Missed injuries cause chronic instability and weak pinch grip.', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v3')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = 'f77837d8-6de9-5a39-b944-1d248f3fb1e5';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('9d28a355-c7fc-5e89-bedb-71a494ef36ff', 'f77837d8-6de9-5a39-b944-1d248f3fb1e5', 'A', 'Ulnar collateral ligament injury of the thumb (skier''s/gamekeeper''s thumb)', true, 0),
  ('d3c232b6-e1df-5465-ad5e-cb14925c8808', 'f77837d8-6de9-5a39-b944-1d248f3fb1e5', 'B', 'De Quervain''s tenosynovitis', false, 1),
  ('41b48a03-6b0e-5385-aa98-bd1698600742', 'f77837d8-6de9-5a39-b944-1d248f3fb1e5', 'C', 'Boxer''s fracture', false, 2),
  ('d30a8feb-c479-56d3-92bc-5f32956c98ec', 'f77837d8-6de9-5a39-b944-1d248f3fb1e5', 'D', 'Bennett''s fracture', false, 3),
  ('4340b45d-0943-5db3-b92b-50aec27e4aad', 'f77837d8-6de9-5a39-b944-1d248f3fb1e5', 'E', 'Scaphoid fracture', false, 4);

-- Q416
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('9f80edf0-618d-55a4-8f85-0cc9e7c08c93', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000011', 'sba', 'A 25 year old man punched someone and has pain at the base of his thumb. X-ray shows an intra-articular fracture of the base of the first metacarpal with subluxation of the CMC joint. What is the SINGLE most likely diagnosis?', 'A Bennett''s fracture is an intra-articular fracture-dislocation at the base of the first metacarpal. The abductor pollicis longus pulls the shaft proximally, so it is unstable and usually needs surgical fixation (K-wires or screw). Rolando''s fracture is a comminuted (Y or T-shaped) version.', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v3')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = '9f80edf0-618d-55a4-8f85-0cc9e7c08c93';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('f49c3c9a-9dd9-56d3-93ef-b4d83b5d98fd', '9f80edf0-618d-55a4-8f85-0cc9e7c08c93', 'A', 'Scaphoid fracture', false, 0),
  ('9d4603f5-14c8-5f0d-82a2-4d5639bf984e', '9f80edf0-618d-55a4-8f85-0cc9e7c08c93', 'B', 'Bennett''s fracture', true, 1),
  ('f619cb2f-1171-5e89-ae97-097d06ec2374', '9f80edf0-618d-55a4-8f85-0cc9e7c08c93', 'C', 'Skier''s thumb', false, 2),
  ('6ba19cc9-99af-5e36-9c59-d9b445a1ecb1', '9f80edf0-618d-55a4-8f85-0cc9e7c08c93', 'D', 'Boxer''s fracture', false, 3),
  ('80f68c14-1188-52a1-8b89-55332f44e186', '9f80edf0-618d-55a4-8f85-0cc9e7c08c93', 'E', 'Smith''s fracture', false, 4);

-- Q417
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('6087307f-5306-579b-aafb-5277740f30bf', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000011', 'sba', 'A 28 year old driver had a head-on collision, with his knee hitting the dashboard. His leg is shortened, internally rotated and adducted, and he has weakness of ankle dorsiflexion and plantarflexion. What is the SINGLE most likely diagnosis?', 'Dashboard injuries cause posterior hip dislocation (often with an acetabular fracture). The leg is shortened, flexed, adducted and internally rotated. The sciatic nerve is at risk (often the peroneal division). It needs urgent reduction (within 6 hours) to reduce the risk of avascular necrosis of the femoral head.', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v3')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = '6087307f-5306-579b-aafb-5277740f30bf';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('413d4ce8-eaa2-5c66-9b6a-9a6ad5a4dc6c', '6087307f-5306-579b-aafb-5277740f30bf', 'A', 'Femoral shaft fracture', false, 0),
  ('b1019f3b-5a0a-5d10-8d6f-8ebe08fd2259', '6087307f-5306-579b-aafb-5277740f30bf', 'B', 'Patellar fracture', false, 1),
  ('115e966b-a2a2-50f9-917c-2acc8ee3899b', '6087307f-5306-579b-aafb-5277740f30bf', 'C', 'Anterior hip dislocation', false, 2),
  ('ad3ab314-692b-55c3-aa37-0d875ba1b1e7', '6087307f-5306-579b-aafb-5277740f30bf', 'D', 'Fractured neck of femur', false, 3),
  ('7f86ccaa-7fac-5f89-95b1-34e4bccd9b34', '6087307f-5306-579b-aafb-5277740f30bf', 'E', 'Posterior hip dislocation with sciatic nerve injury', true, 4);

-- Q418
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('faa21c3a-83ce-5d5f-994e-788e62ee12b2', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000011', 'sba', 'A 22 year old man fell 3 m onto his feet. He has knee pain and swelling, and cannot bear weight. X-ray shows a depressed fracture of the lateral tibial plateau. What associated injury is MOST likely?', 'Tibial plateau fractures (most often the lateral plateau from valgus force) are associated with ligament (MCL, ACL) and meniscal injuries, compartment syndrome and peroneal nerve injury. CT defines the fracture. Displaced or depressed fractures need ORIF to restore the joint surface.', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v3')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = 'faa21c3a-83ce-5d5f-994e-788e62ee12b2';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('d04991d3-49b2-5c24-99e2-5dd19b783bb1', 'faa21c3a-83ce-5d5f-994e-788e62ee12b2', 'A', 'Lisfranc injury', false, 0),
  ('aeb065f9-eb3e-5c8b-a2fe-757b86811271', 'faa21c3a-83ce-5d5f-994e-788e62ee12b2', 'B', 'Medial collateral ligament or meniscal injury', true, 1),
  ('5632fa35-d5f7-51a6-a10f-b44fdad0ff5f', 'faa21c3a-83ce-5d5f-994e-788e62ee12b2', 'C', 'Achilles tendon rupture', false, 2),
  ('9157e1c7-8a83-5b3c-987a-d11d84764d52', 'faa21c3a-83ce-5d5f-994e-788e62ee12b2', 'D', 'Posterior hip dislocation', false, 3),
  ('623bcd57-5786-5327-a46c-c7ca7ed98a40', 'faa21c3a-83ce-5d5f-994e-788e62ee12b2', 'E', 'Scaphoid fracture', false, 4);

-- Q419
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('1846405a-de8f-5574-86d5-96537a904d41', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000011', 'sba', 'A 16 year old girl felt her kneecap ''go out'' to the side when she twisted while dancing. It went back when she straightened her leg. Her knee is now swollen and she is apprehensive when her patella is pushed laterally. What is the SINGLE most likely diagnosis?', 'Patellar dislocation is usually lateral, common in adolescent girls and people with hypermobility or patella alta, and happens on twisting with the knee flexed. It often reduces on extension. Get an X-ray to exclude osteochondral fractures. Treatment is short-term immobilisation then physiotherapy. Recurrence is common and may need surgery (MPFL reconstruction).', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v3')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = '1846405a-de8f-5574-86d5-96537a904d41';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('bca47b97-f653-5e53-bbb5-3dbd2e6aa178', '1846405a-de8f-5574-86d5-96537a904d41', 'A', 'Osgood-Schlatter disease', false, 0),
  ('460a5e50-d151-5a97-93eb-418ce57f414e', '1846405a-de8f-5574-86d5-96537a904d41', 'B', 'Patellar tendon rupture', false, 1),
  ('5fd5e105-d8d1-5cd9-b4db-f7e5083c7d89', '1846405a-de8f-5574-86d5-96537a904d41', 'C', 'Lateral patellar dislocation (relocated)', true, 2),
  ('11e0b76f-db27-5eda-9f75-f3b1cca33580', '1846405a-de8f-5574-86d5-96537a904d41', 'D', 'ACL rupture', false, 3),
  ('68bcdbe8-8568-5ee1-ada0-00c21dd66e2d', '1846405a-de8f-5574-86d5-96537a904d41', 'E', 'Medial meniscal tear', false, 4);

-- Q420
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('842111aa-757d-566e-9966-181582fbe062', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000011', 'sba', 'A 65 year old man felt a pop above his kneecap while stepping down from a kerb. He cannot straight-leg raise, and there is a palpable gap above the patella. What is the SINGLE most likely diagnosis?', 'Quadriceps tendon rupture usually affects people over 40, often with risk factors (diabetes, CKD, steroids, fluoroquinolones). It causes a suprapatellar gap and inability to straight-leg raise against gravity. Patellar tendon rupture affects younger people, with a gap below the patella and a high-riding patella. Complete ruptures need surgical repair within days.', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v3')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = '842111aa-757d-566e-9966-181582fbe062';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('5ebd2448-4871-5218-b65e-e6a197bac34b', '842111aa-757d-566e-9966-181582fbe062', 'A', 'Baker''s cyst rupture', false, 0),
  ('a30ed0da-4490-5414-970d-327576ed510c', '842111aa-757d-566e-9966-181582fbe062', 'B', 'Patellar fracture', false, 1),
  ('b9086bae-9d59-5eda-ae71-0dbaf6631442', '842111aa-757d-566e-9966-181582fbe062', 'C', 'ACL rupture', false, 2),
  ('b35280e2-1b2a-5b21-a407-a6c4d3ef8255', '842111aa-757d-566e-9966-181582fbe062', 'D', 'Patellar tendon rupture', false, 3),
  ('a5bc54ed-c06e-5c93-9073-0d0ea1413a2e', '842111aa-757d-566e-9966-181582fbe062', 'E', 'Quadriceps tendon rupture', true, 4);

-- Q421
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('8b938dbd-ed66-550b-a055-1b47ad2d9e9e', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000011', 'sba', 'A 40 year old woman twisted her ankle. X-ray shows a fracture of the fibula above the level of the syndesmosis, with widening of the medial clear space. What is the SINGLE most appropriate management?', 'Weber classification is based on the fibular fracture relative to the syndesmosis: A is below (usually stable, treated with a boot), B is at the level (variable), and C is above (syndesmosis disrupted, unstable, needs ORIF). Talar shift (medial clear space widening) means instability. A Maisonneuve fracture is a proximal fibular fracture with a medial ankle injury.', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v3')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = '8b938dbd-ed66-550b-a055-1b47ad2d9e9e';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('f6e8f0d0-612e-5fbb-8c7f-fa94e0768188', '8b938dbd-ed66-550b-a055-1b47ad2d9e9e', 'A', 'Below-knee cast for 6 weeks', false, 0),
  ('8e901246-1e15-568d-9459-4ecaa5f03b1c', '8b938dbd-ed66-550b-a055-1b47ad2d9e9e', 'B', 'Open reduction and internal fixation (unstable Weber C ankle fracture)', true, 1),
  ('3d81c7af-bde7-5b6b-94c5-8fd4f78372de', '8b938dbd-ed66-550b-a055-1b47ad2d9e9e', 'C', 'Physiotherapy only', false, 2),
  ('54b9d4ab-4b8e-5463-964a-5f2692699b4a', '8b938dbd-ed66-550b-a055-1b47ad2d9e9e', 'D', 'Compression bandage', false, 3),
  ('eb92f1ba-883f-535f-be28-599bda231dd0', '8b938dbd-ed66-550b-a055-1b47ad2d9e9e', 'E', 'Walking boot and full weight bearing', false, 4);

-- Q422
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('c4d71521-0c50-592e-be50-cec0020d9e15', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000011', 'sba', 'A 30 year old man inverted his ankle and has pain over the base of the fifth metatarsal. X-ray shows a transverse fracture at the metaphyseal-diaphyseal junction about 2 cm from the base. What is the SINGLE most important point about this fracture?', 'Fifth metatarsal base fractures include avulsion fractures of the tuberosity (common, treated with a supportive shoe or boot) and Jones fractures at the metaphyseal-diaphyseal junction (watershed blood supply, high risk of non-union). Jones fractures need non-weight-bearing cast immobilisation or surgical fixation (especially in athletes).', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v3')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = 'c4d71521-0c50-592e-be50-cec0020d9e15';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('530f2bd3-1f24-56bd-a355-9ab70e83b4e7', 'c4d71521-0c50-592e-be50-cec0020d9e15', 'A', 'It is a Jones fracture with a high risk of non-union (poor blood supply), needing non-weight-bearing immobilisation or fixation', true, 0),
  ('56a1e519-354a-54d2-92e1-292c52b535ce', 'c4d71521-0c50-592e-be50-cec0020d9e15', 'B', 'It needs no follow-up', false, 1),
  ('c1517808-bc67-51c1-8124-8bd48f482681', 'c4d71521-0c50-592e-be50-cec0020d9e15', 'C', 'It is a stress fracture of the tibia', false, 2),
  ('00973567-77eb-5305-acfb-e4351efd67ee', 'c4d71521-0c50-592e-be50-cec0020d9e15', 'D', 'It is an avulsion fracture needing only a supportive shoe', false, 3),
  ('93d17703-037e-564c-8709-dc436bdf4beb', 'c4d71521-0c50-592e-be50-cec0020d9e15', 'E', 'It always heals quickly with no treatment', false, 4);

-- Q423
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('9c38a54a-4ddc-5277-a195-1e7d49123869', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000011', 'sba', 'A 30 year old man fell off a horse with his foot in the stirrup. He has midfoot pain, swelling, plantar bruising and pain on passive pronation of the forefoot. X-ray shows widening between the first and second metatarsal bases. What is the SINGLE most likely diagnosis?', 'Lisfranc injuries (tarsometatarsal joint disruption) are often missed. Plantar bruising and widening between the base of the first and second metatarsals are typical. Weight-bearing X-rays or CT help diagnosis. Unstable injuries need surgical fixation to prevent chronic pain and arthritis.', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v3')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = '9c38a54a-4ddc-5277-a195-1e7d49123869';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('c38536f1-3898-5f9c-8537-14d065ce8616', '9c38a54a-4ddc-5277-a195-1e7d49123869', 'A', 'Calcaneal fracture', false, 0),
  ('03622538-c244-5b00-afe2-6074a69d2443', '9c38a54a-4ddc-5277-a195-1e7d49123869', 'B', 'Jones fracture', false, 1),
  ('fa7157d2-477a-5e9f-8b98-69cbd6a06639', '9c38a54a-4ddc-5277-a195-1e7d49123869', 'C', 'Lisfranc (tarsometatarsal) injury', true, 2),
  ('faa5ed1a-5f37-5228-ae58-1d14086ed057', '9c38a54a-4ddc-5277-a195-1e7d49123869', 'D', 'Plantar fasciitis', false, 3),
  ('44b9c4f0-73d1-5bdd-a529-91d5599298fe', '9c38a54a-4ddc-5277-a195-1e7d49123869', 'E', 'Ankle sprain', false, 4);

-- Q424
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('88293df0-9b8a-5f9d-b9c0-a02fd0e3098b', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000011', 'sba', 'A 55 year old woman has burning pain between her third and fourth toes, worse with tight shoes. Squeezing the forefoot causes a click and reproduces the pain. What is the SINGLE most likely diagnosis?', 'Morton''s neuroma is a perineural fibrosis of the common digital nerve, usually between the 3rd and 4th metatarsal heads. It causes burning forefoot pain and numbness, and a positive Mulder''s click. Treatment is wider shoes, metatarsal pads, steroid injection, and excision if this fails. Ultrasound confirms it.', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v3')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = '88293df0-9b8a-5f9d-b9c0-a02fd0e3098b';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('610a4013-910f-5358-af0d-63eede5eaa6d', '88293df0-9b8a-5f9d-b9c0-a02fd0e3098b', 'A', 'Morton''s neuroma', true, 0),
  ('ee8e407b-5223-5571-8936-fb199d5bcf65', '88293df0-9b8a-5f9d-b9c0-a02fd0e3098b', 'B', 'Gout', false, 1),
  ('5041fe47-1709-5bbe-819e-340d38c71721', '88293df0-9b8a-5f9d-b9c0-a02fd0e3098b', 'C', 'Hallux valgus', false, 2),
  ('0768f84e-7b7d-5464-b8e0-47def9778cc5', '88293df0-9b8a-5f9d-b9c0-a02fd0e3098b', 'D', 'Metatarsal stress fracture', false, 3),
  ('e2446a83-ff0d-5ffe-b317-02c91e419841', '88293df0-9b8a-5f9d-b9c0-a02fd0e3098b', 'E', 'Plantar fasciitis', false, 4);

-- Q425
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('af2f0ba9-3508-5121-adde-1f21834f4710', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000011', 'sba', 'A 25 year old motorcyclist has an open fracture of the tibia with a 3 cm wound. He is stable. What is the SINGLE most important early management of the wound?', 'BOAST open fracture guidance: give IV antibiotics within 1 hour of injury, check tetanus status, remove gross contamination, photograph the wound, apply a saline-soaked dressing and splint. Do not explore it in A&E. Debridement should happen within 12 hours (24 hours for low-energy injuries). Definitive soft-tissue cover follows by a joint orthopaedic-plastics team.', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v3')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = 'af2f0ba9-3508-5121-adde-1f21834f4710';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('173080f5-9e1c-5ded-a840-0fe19c54c8a0', 'af2f0ba9-3508-5121-adde-1f21834f4710', 'A', 'IV antibiotics (e.g. co-amoxiclav) within 1 hour, photograph and cover with a saline-soaked dressing, tetanus cover, and splinting', true, 0),
  ('51b9501f-b1cc-5ece-b2fb-ed2cacdd305e', 'af2f0ba9-3508-5121-adde-1f21834f4710', 'B', 'Close the wound primarily in A&E', false, 1),
  ('36d90057-dddf-5036-9b6f-b124b1745e1e', 'af2f0ba9-3508-5121-adde-1f21834f4710', 'C', 'Apply a tourniquet routinely', false, 2),
  ('a25866eb-bec8-5e98-a60e-e4a809a76ece', 'af2f0ba9-3508-5121-adde-1f21834f4710', 'D', 'Wash out the wound in A&E with tap water and discharge', false, 3),
  ('b246102b-9092-50c8-bdf4-71313764358c', 'af2f0ba9-3508-5121-adde-1f21834f4710', 'E', 'Delay antibiotics until surgery', false, 4);

-- Q426
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('cdb0f118-989b-57f0-8d4f-67d8c2da3a32', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000011', 'sba', 'A 22 year old man fractured his femur 36 hours ago. He now has breathlessness, confusion and a petechial rash on his chest, axillae and conjunctivae. SpO2 is 86% on air. What is the SINGLE most likely diagnosis?', 'Fat embolism syndrome follows long bone (especially femoral) or pelvic fractures, usually 24-72 hours later. It causes respiratory failure, neurological changes and a petechial rash (Gurd''s criteria). Treatment is supportive (oxygen, ventilation). Early fixation of fractures reduces the risk.', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v3')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = 'cdb0f118-989b-57f0-8d4f-67d8c2da3a32';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('feea99b3-166b-5250-9200-826e656779e0', 'cdb0f118-989b-57f0-8d4f-67d8c2da3a32', 'A', 'Opioid toxicity', false, 0),
  ('d6483be7-b358-5bd9-808f-a1be16f70674', 'cdb0f118-989b-57f0-8d4f-67d8c2da3a32', 'B', 'Hospital-acquired pneumonia', false, 1),
  ('70a3181e-dcdd-5e40-bbbe-f825fb79fef8', 'cdb0f118-989b-57f0-8d4f-67d8c2da3a32', 'C', 'Meningococcal sepsis', false, 2),
  ('7e65ba5f-7e89-5601-bc06-1a3053aed2c5', 'cdb0f118-989b-57f0-8d4f-67d8c2da3a32', 'D', 'Pulmonary embolism', false, 3),
  ('e7adfce8-83d2-554f-96a6-cad73f21547a', 'cdb0f118-989b-57f0-8d4f-67d8c2da3a32', 'E', 'Fat embolism syndrome', true, 4);

-- Q427
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('eb077713-fb62-5fa8-b4bb-6ee55f43cd2f', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000011', 'sba', 'A 15 year old boy has a painful swelling of his femoral diaphysis with fever. X-ray shows a lytic lesion with an ''onion skin'' periosteal reaction. Biopsy shows small round blue cells. What is the SINGLE most likely diagnosis?', 'Ewing''s sarcoma affects children and young adults, often in the diaphysis of long bones or the pelvis, and can cause fever (mimicking infection). X-ray shows lytic lesions with onion-skin periosteal reaction. Histology shows small round blue cells with the t(11;22) EWSR1-FLI1 translocation. Osteosarcoma affects the metaphysis, with a sunburst pattern and Codman''s triangle.', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v3')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = 'eb077713-fb62-5fa8-b4bb-6ee55f43cd2f';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('91fcee5f-10f4-53fe-b96c-43127af6e7fc', 'eb077713-fb62-5fa8-b4bb-6ee55f43cd2f', 'A', 'Osteoid osteoma', false, 0),
  ('ea53a470-956c-562b-adff-2c8f97835d99', 'eb077713-fb62-5fa8-b4bb-6ee55f43cd2f', 'B', 'Osteomyelitis', false, 1),
  ('c3f6f1a2-bdf8-5b57-9ba7-0abc5b96be02', 'eb077713-fb62-5fa8-b4bb-6ee55f43cd2f', 'C', 'Chondrosarcoma', false, 2),
  ('c03e4861-ee5d-5659-bae8-5752394864b2', 'eb077713-fb62-5fa8-b4bb-6ee55f43cd2f', 'D', 'Ewing''s sarcoma', true, 3),
  ('64abb62d-90cd-5d15-987e-7c8063aefd2b', 'eb077713-fb62-5fa8-b4bb-6ee55f43cd2f', 'E', 'Osteosarcoma', false, 4);

-- Q428
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('61ed45ee-6001-5f2f-a9b5-4cecf9b42370', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000011', 'sba', 'A 12 year old boy has night pain in his tibia that is dramatically relieved by aspirin or ibuprofen. X-ray shows a small lucent nidus with surrounding sclerosis. What is the SINGLE most likely diagnosis?', 'Osteoid osteoma is a benign bone tumour in young people, causing night pain characteristically relieved by NSAIDs (prostaglandin-mediated). CT shows a small nidus with reactive sclerosis. Treatment is NSAIDs or radiofrequency ablation. A Brodie''s abscess (subacute osteomyelitis) can look similar.', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v3')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = '61ed45ee-6001-5f2f-a9b5-4cecf9b42370';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('dd8a33f3-d681-5ab5-a7e9-4b548959beda', '61ed45ee-6001-5f2f-a9b5-4cecf9b42370', 'A', 'Osteoid osteoma', true, 0),
  ('21c957fc-84df-5f37-8e3a-2409f79bd47f', '61ed45ee-6001-5f2f-a9b5-4cecf9b42370', 'B', 'Ewing''s sarcoma', false, 1),
  ('6948033e-b4cb-5ea9-9ef1-543af85195d8', '61ed45ee-6001-5f2f-a9b5-4cecf9b42370', 'C', 'Brodie''s abscess', false, 2),
  ('2a1c22b5-1e93-5190-8e68-9e69a88614a2', '61ed45ee-6001-5f2f-a9b5-4cecf9b42370', 'D', 'Osteosarcoma', false, 3),
  ('6778f306-e167-5c7e-919b-0587364584dd', '61ed45ee-6001-5f2f-a9b5-4cecf9b42370', 'E', 'Stress fracture', false, 4);

-- Q429
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('1d04972c-851a-504f-af2c-eea0f1031907', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000011', 'sba', 'A 13 year old girl has an asymmetrical shoulder height noticed by her mother. On forward bending, a rib hump is seen on the right. She has no pain or neurological symptoms. What is the SINGLE most likely diagnosis?', 'Adolescent idiopathic scoliosis is more common in girls and is usually painless. A rib hump on forward bending (Adams test) indicates a structural curve. Refer for standing X-rays (Cobb angle). Bracing is used for moderate curves in skeletally immature patients, and surgery for curves over about 45-50 degrees. Pain or neurological signs suggest another cause, so get an MRI.', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v3')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = '1d04972c-851a-504f-af2c-eea0f1031907';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('69a9855c-f7fd-50ae-9c96-589f891f93d6', '1d04972c-851a-504f-af2c-eea0f1031907', 'A', 'Adolescent idiopathic scoliosis', true, 0),
  ('e2d6e105-7f18-54f4-b42b-9bcf3f5411d5', '1d04972c-851a-504f-af2c-eea0f1031907', 'B', 'Ankylosing spondylitis', false, 1),
  ('041876ae-f639-530d-aac2-e0f28ecff70b', '1d04972c-851a-504f-af2c-eea0f1031907', 'C', 'Spondylolisthesis', false, 2),
  ('b992ea45-5306-524e-9afd-79e26bcc1062', '1d04972c-851a-504f-af2c-eea0f1031907', 'D', 'Leg length discrepancy only', false, 3),
  ('97da3ec4-d7c0-5267-b74c-9b45d842e6b9', '1d04972c-851a-504f-af2c-eea0f1031907', 'E', 'Scheuermann''s kyphosis', false, 4);

-- Q430
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('73c0af55-5ca3-549a-87ed-9c87556f0999', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000011', 'sba', 'A 4 year old child has had multiple fractures with minimal trauma, blue sclerae and a family history of hearing loss. What is the SINGLE most likely diagnosis?', 'Osteogenesis imperfecta is usually autosomal dominant (COL1A1/COL1A2, type I collagen). It causes bone fragility with recurrent fractures, blue sclerae, dentinogenesis imperfecta, hearing loss and joint laxity. It must be distinguished from non-accidental injury, although both can coexist. Bisphosphonates reduce fractures.', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v3')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = '73c0af55-5ca3-549a-87ed-9c87556f0999';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('bca08e9c-5c82-5d9c-93bf-f2d59d91f9ac', '73c0af55-5ca3-549a-87ed-9c87556f0999', 'A', 'Osteogenesis imperfecta', true, 0),
  ('c1a4f669-cd34-53b5-adb5-a81ab501b1b8', '73c0af55-5ca3-549a-87ed-9c87556f0999', 'B', 'Scurvy', false, 1),
  ('fe48bde2-ca27-5040-8af7-b219834033f7', '73c0af55-5ca3-549a-87ed-9c87556f0999', 'C', 'Non-accidental injury', false, 2),
  ('66fc021e-b925-55d0-89e5-ef5b4d4e0796', '73c0af55-5ca3-549a-87ed-9c87556f0999', 'D', 'Rickets', false, 3),
  ('46cc79fe-e380-5b1b-986e-fc75ab31f54c', '73c0af55-5ca3-549a-87ed-9c87556f0999', 'E', 'Achondroplasia', false, 4);

-- Q431
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('c34d3218-a785-51f9-be54-731c47dce730', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000011', 'sba', 'A 35 year old sexually active man has a hot, swollen knee, with pustules on his hands and painful tendons in his wrists. Joint aspirate Gram stain is negative. What is the SINGLE most likely organism?', 'Disseminated gonococcal infection causes the triad of tenosynovitis, migratory polyarthralgia or septic arthritis, and pustular skin lesions. Joint cultures are often negative, so take NAAT and culture swabs from the genital tract, throat and rectum. Treat with IV ceftriaxone. Staph aureus is the commonest cause of septic arthritis overall.', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v3')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = 'c34d3218-a785-51f9-be54-731c47dce730';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('9a5751e3-fe8e-536f-a4ab-3fa29fa42cc2', 'c34d3218-a785-51f9-be54-731c47dce730', 'A', 'Borrelia burgdorferi', false, 0),
  ('5e217f5d-ad8a-5136-9116-5b55cd4fd9f1', 'c34d3218-a785-51f9-be54-731c47dce730', 'B', 'Staphylococcus aureus', false, 1),
  ('35692251-6aa5-54be-b477-657dec79b59b', 'c34d3218-a785-51f9-be54-731c47dce730', 'C', 'Salmonella', false, 2),
  ('477c3faf-e7f6-5aec-9ab2-0c830a302963', 'c34d3218-a785-51f9-be54-731c47dce730', 'D', 'Streptococcus pyogenes', false, 3),
  ('3f3c54aa-9677-558a-ada5-e2d2ece6c396', 'c34d3218-a785-51f9-be54-731c47dce730', 'E', 'Neisseria gonorrhoeae (disseminated gonococcal infection)', true, 4);

-- Q432
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('5c68e888-0b6a-5f1e-b09a-f9e56f3b281e', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000011', 'sba', 'A 68 year old man has knee osteoarthritis. Exercise, weight loss and topical NSAIDs have helped only partly. Which additional treatment is recommended by NICE?', 'NICE NG226: core treatment is exercise and weight loss. Use topical NSAIDs first, then consider oral NSAIDs with a PPI. Intra-articular steroids give short-term relief. Do not offer glucosamine, hyaluronan injections, routine paracetamol or weak opioids (unless short-term), or arthroscopic lavage. Refer for joint replacement if symptoms remain severe.', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v3')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = '5c68e888-0b6a-5f1e-b09a-f9e56f3b281e';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('57a114ca-7531-5dc1-aab2-75acab5f4b38', '5c68e888-0b6a-5f1e-b09a-f9e56f3b281e', 'A', 'Arthroscopic lavage', false, 0),
  ('96b07c7c-5e73-5547-bd2f-85b9728a05d5', '5c68e888-0b6a-5f1e-b09a-f9e56f3b281e', 'B', 'Strong opioids long-term', false, 1),
  ('666f030c-b9dd-5ccb-a393-ca0f3779c816', '5c68e888-0b6a-5f1e-b09a-f9e56f3b281e', 'C', 'Hyaluronic acid injections', false, 2),
  ('2400029e-aaac-5358-9ed5-d968d3e571ee', '5c68e888-0b6a-5f1e-b09a-f9e56f3b281e', 'D', 'Glucosamine', false, 3),
  ('987402df-c3f3-555e-b1f5-35799aa12b93', '5c68e888-0b6a-5f1e-b09a-f9e56f3b281e', 'E', 'Oral NSAID at the lowest effective dose for the shortest time (with PPI), or intra-articular steroid for short-term relief', true, 4);

-- Q433
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('40559056-0f5c-5882-8076-9416e50a1950', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000011', 'sba', 'A 26 year old footballer had a valgus blow to his knee. He has medial knee pain and tenderness along the medial joint line extending above it, with laxity on valgus stress at 30 degrees of flexion. There is minimal swelling. What is the SINGLE most likely diagnosis?', 'MCL injuries are caused by valgus force. They give medial tenderness and laxity on valgus stress at 30 degrees. They are mostly treated conservatively with a hinged brace and physiotherapy, as the MCL heals well. Laxity at 0 degrees suggests combined cruciate injury. ACL ruptures cause a rapid haemarthrosis.', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v3')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = '40559056-0f5c-5882-8076-9416e50a1950';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('187836a7-0e95-5960-8d4d-0cba9373d355', '40559056-0f5c-5882-8076-9416e50a1950', 'A', 'Posterior cruciate ligament injury', false, 0),
  ('455ff3b9-1bc2-58d5-97a9-15f6e867ad62', '40559056-0f5c-5882-8076-9416e50a1950', 'B', 'Lateral meniscal tear', false, 1),
  ('04093157-840c-5ccb-b104-e8e40b956ab7', '40559056-0f5c-5882-8076-9416e50a1950', 'C', 'Medial collateral ligament injury', true, 2),
  ('42f576b5-0280-57ee-899b-9bec867ab178', '40559056-0f5c-5882-8076-9416e50a1950', 'D', 'ACL rupture', false, 3),
  ('aca2f94d-0d21-5044-b793-1058f50ff9ce', '40559056-0f5c-5882-8076-9416e50a1950', 'E', 'Patellar dislocation', false, 4);

-- Q434
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('9c60de16-5531-58ac-9892-ba0610116571', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000011', 'sba', 'A 30 year old man has numbness and tingling in his ring and little fingers, worse when his elbow is bent for long periods. He has weakness of finger abduction and a positive Froment''s sign. Where is the nerve MOST likely compressed?', 'Cubital tunnel syndrome is compression of the ulnar nerve at the elbow. It causes sensory symptoms in the little finger and half the ring finger (including the dorsal hand), weakness of the intrinsic hand muscles and Froment''s sign (adductor pollicis weakness). Management is avoiding prolonged elbow flexion and night splints, with surgical decompression or transposition if severe.', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v3')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = '9c60de16-5531-58ac-9892-ba0610116571';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('47d5d1c9-0a35-5c66-9e2d-b51bac594fbf', '9c60de16-5531-58ac-9892-ba0610116571', 'A', 'C6 nerve root', false, 0),
  ('d7064c6b-d016-5a87-90bb-dc39f7a640f2', '9c60de16-5531-58ac-9892-ba0610116571', 'B', 'Ulnar nerve at the elbow (cubital tunnel syndrome)', true, 1),
  ('0b5fc9c4-720b-576d-afbe-274236350142', '9c60de16-5531-58ac-9892-ba0610116571', 'C', 'Ulnar nerve at Guyon''s canal only, with sensory sparing', false, 2),
  ('5927d211-3299-5530-8571-234bc2f52a51', '9c60de16-5531-58ac-9892-ba0610116571', 'D', 'Median nerve at the wrist', false, 3),
  ('2c37d242-4591-5cfe-aab6-ef196e41b69b', '9c60de16-5531-58ac-9892-ba0610116571', 'E', 'Radial nerve in the spiral groove', false, 4);

-- Q435
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('93e62584-31d9-5210-afe0-9e2973d6135d', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000011', 'sba', 'A 60 year old woman with a painful bunion has a big toe deviated laterally, with a prominent medial first metatarsal head that is red and rubs on her shoes. Conservative measures have failed. What is the SINGLE most appropriate management?', 'Hallux valgus is lateral deviation of the great toe with a medial bunion. It is linked to footwear, genetics and inflammatory arthritis. Conservative measures are wide shoes, bunion pads and orthoses. Surgery (osteotomy) is for persistent pain affecting function, not for cosmetic reasons alone.', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v3')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = '93e62584-31d9-5210-afe0-9e2973d6135d';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('7d5dc953-635a-5b39-b24d-38827ae7b416', '93e62584-31d9-5210-afe0-9e2973d6135d', 'A', 'Refer for consideration of surgical correction (osteotomy)', true, 0),
  ('2c4c2a22-7fcc-50b5-8c0e-804f66f0e6e0', '93e62584-31d9-5210-afe0-9e2973d6135d', 'B', 'Bed rest', false, 1),
  ('b1409e1c-f4a0-5d3c-a045-2431dc64bec4', '93e62584-31d9-5210-afe0-9e2973d6135d', 'C', 'Steroid injection repeatedly', false, 2),
  ('75888741-c22a-5a47-a743-429f366663f2', '93e62584-31d9-5210-afe0-9e2973d6135d', 'D', 'Oral antibiotics', false, 3),
  ('6b3d92c6-e274-51e1-8995-078d1c7d5d5c', '93e62584-31d9-5210-afe0-9e2973d6135d', 'E', 'Amputation of the toe', false, 4);

-- Q436
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('e4cd771e-634d-5d75-be45-61f464a822ae', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000013', 'sba', 'A 30 year old man is brought unconscious to the Emergency Department after a motorbike crash. He needs an urgent operation to stop internal bleeding. No relatives are present, and there is no advance decision. What is the CORRECT approach?', 'In an emergency, when a patient lacks capacity and there is no valid advance decision or attorney, doctors can give treatment that is immediately necessary to save life or prevent serious deterioration, in the patient''s best interests. Record the reasons. Inform relatives later. Relatives cannot give consent on behalf of adults (unless they have an LPA).', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v3')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = 'e4cd771e-634d-5d75-be45-61f464a822ae';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('b41b7c8f-d64d-5ca4-99c3-09df3f574f59', 'e4cd771e-634d-5d75-be45-61f464a822ae', 'A', 'Wait until a relative can consent', false, 0),
  ('f6605d03-5cca-5dcc-a1ff-f0d91e40535d', 'e4cd771e-634d-5d75-be45-61f464a822ae', 'B', 'Do nothing until he regains consciousness', false, 1),
  ('66f9e3c8-f98e-5705-b5a7-b7db3c748fea', 'e4cd771e-634d-5d75-be45-61f464a822ae', 'C', 'Obtain a court order before operating', false, 2),
  ('292c078e-8c7f-513b-8188-de3e566240c8', 'e4cd771e-634d-5d75-be45-61f464a822ae', 'D', 'Proceed with treatment that is immediately necessary in his best interests under the Mental Capacity Act', true, 3),
  ('a0e42fca-806f-56fb-8b5c-08b4916ca0ed', 'e4cd771e-634d-5d75-be45-61f464a822ae', 'E', 'Ask the police to consent', false, 4);

-- Q437
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('01948033-ebb2-55f8-858a-7d656a5f951c', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000013', 'sba', 'Under the Mental Capacity Act 2005, which ability must a patient demonstrate to have capacity for a specific decision?', 'Capacity is decision-specific and time-specific. Assume capacity unless shown otherwise. A person lacks capacity if, because of an impairment of mind or brain, they cannot understand, retain, use or weigh the relevant information, or communicate their decision. An unwise decision does not mean lack of capacity. Practicable steps must be taken to support decision-making.', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v3')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = '01948033-ebb2-55f8-858a-7d656a5f951c';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('b3a5cfc5-b729-5221-a16b-f76861868d56', '01948033-ebb2-55f8-858a-7d656a5f951c', 'A', 'Understand, retain, use and weigh the information, and communicate their decision', true, 0),
  ('c0990905-22fc-5ac1-8fd3-210a2300b891', '01948033-ebb2-55f8-858a-7d656a5f951c', 'B', 'Have no mental illness', false, 1),
  ('9abd1046-5fe7-5af5-b177-fbd1daaee463', '01948033-ebb2-55f8-858a-7d656a5f951c', 'C', 'Agree with the doctor''s recommendation', false, 2),
  ('46912fa5-49a0-52a5-a30b-ef14bebb90a9', '01948033-ebb2-55f8-858a-7d656a5f951c', 'D', 'Be over 18 and not detained under the Mental Health Act', false, 3),
  ('f52a8833-aef2-5ed0-a011-6c0d30c59204', '01948033-ebb2-55f8-858a-7d656a5f951c', 'E', 'Score at least 24 on the MMSE', false, 4);

-- Q438
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('5aed87aa-cdab-5e99-bc5f-bf869b9577f0', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000013', 'sba', 'A 16 year old girl with capacity refuses a life-saving blood transfusion after an accident. Her parents also refuse. What is the CORRECT legal position in England?', 'Young people aged 16-17 can consent to treatment, but in England a refusal of life-saving treatment can be overridden by the court (or, in theory, by a person with parental responsibility) if it is in their best interests. In an emergency, treat to preserve life while seeking legal advice. Involve senior clinicians.', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v3')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = '5aed87aa-cdab-5e99-bc5f-bf869b9577f0';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('755b2b57-fc8a-5b55-a539-5e6eff1bba9b', '5aed87aa-cdab-5e99-bc5f-bf869b9577f0', 'A', 'Her refusal is absolute because she is over 16', false, 0),
  ('640bf4a1-e3e8-501a-add8-14b0ccf60ffe', '5aed87aa-cdab-5e99-bc5f-bf869b9577f0', 'B', 'Her refusal can be overridden by the court (or someone with parental responsibility) if treatment is in her best interests; seek urgent legal advice', true, 1),
  ('df0a89ad-858e-530c-9488-c790c356b655', '5aed87aa-cdab-5e99-bc5f-bf869b9577f0', 'C', 'Doctors must comply with the parents'' refusal', false, 2),
  ('dad312fa-4f99-5916-94e9-162b43742658', '5aed87aa-cdab-5e99-bc5f-bf869b9577f0', 'D', 'Treatment must wait until she is 18', false, 3),
  ('b036f59a-2e3e-53ab-9e80-e71d49af02c0', '5aed87aa-cdab-5e99-bc5f-bf869b9577f0', 'E', 'Only the police can authorise treatment', false, 4);

-- Q439
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('be8ac236-5b65-5da9-8a24-f852aee2408b', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000013', 'sba', 'A doctor is asked by the parents of a 14 year old not to tell their son that he has a terminal diagnosis. The boy is asking questions about his illness. What is the MOST appropriate approach?', 'GMC guidance (0-18 years): children and young people should be involved in decisions and given information appropriate to their understanding. Do not withhold information they want and need. Work with the parents, explore their fears, and plan honest communication together. Lying to the child damages trust.', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v3')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = 'be8ac236-5b65-5da9-8a24-f852aee2408b';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('950a41da-e20b-5f49-ac54-d64f217e29c2', 'be8ac236-5b65-5da9-8a24-f852aee2408b', 'A', 'Agree never to tell the boy', false, 0),
  ('2c5ead11-354f-5de6-b97b-7581b7c5433b', 'be8ac236-5b65-5da9-8a24-f852aee2408b', 'B', 'Refer the parents to social services', false, 1),
  ('2f474142-74e8-5251-9175-1288acfe96d7', 'be8ac236-5b65-5da9-8a24-f852aee2408b', 'C', 'Explore the parents'' concerns, explain the boy''s right to information appropriate to his maturity, and aim for honest, age-appropriate discussion with him', true, 2),
  ('7960ab81-9ea4-5e00-88f6-3a678dbcf1b4', 'be8ac236-5b65-5da9-8a24-f852aee2408b', 'D', 'Tell the boy everything immediately without involving the parents', false, 3),
  ('ac76041c-9fe4-5df5-b347-d2438fce676b', 'be8ac236-5b65-5da9-8a24-f852aee2408b', 'E', 'Lie to the boy to protect him', false, 4);

-- Q440
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('ff94cb12-e9a5-5fa5-a45c-23be71b53a81', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000013', 'sba', 'A GP''s patient with good English asks for her husband to interpret during a consultation about a sensitive gynaecological problem. The patient''s first language is Bengali. She seems uncomfortable. What is the MOST appropriate action?', 'Professional interpreters should be used for medical consultations. Family members (and especially children) may not interpret accurately, may affect what the patient says, and may breach confidentiality, particularly for sensitive issues or possible abuse. Respect patient choice, but offer to speak to her alone with a professional interpreter.', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v3')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = 'ff94cb12-e9a5-5fa5-a45c-23be71b53a81';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('06b00258-696c-58e2-9af0-dcb0eb74bab9', 'ff94cb12-e9a5-5fa5-a45c-23be71b53a81', 'A', 'Continue in English without checking understanding', false, 0),
  ('aba01af4-54ff-5773-aab3-0e9d54513b8a', 'ff94cb12-e9a5-5fa5-a45c-23be71b53a81', 'B', 'Offer a professional interpreter (in person or telephone) and see her alone', true, 1),
  ('65dcba42-e51e-562e-a35f-4de7a93f3346', 'ff94cb12-e9a5-5fa5-a45c-23be71b53a81', 'C', 'Use her 10 year old child as interpreter', false, 2),
  ('6a8513b7-d5b8-53d1-8af3-22d4c50c474f', 'ff94cb12-e9a5-5fa5-a45c-23be71b53a81', 'D', 'Postpone indefinitely', false, 3),
  ('d2b66e81-c8ea-5b2b-ac08-f898f1d16595', 'ff94cb12-e9a5-5fa5-a45c-23be71b53a81', 'E', 'Use the husband as interpreter as requested', false, 4);

-- Q441
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('ab7b21ec-adf5-5c21-866d-b8f90598af02', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000013', 'sba', 'A doctor believes abortion is morally wrong. A patient asks for a referral for termination of pregnancy. What does GMC guidance require?', 'Doctors can conscientiously object to participating directly in abortion (Abortion Act 1967, section 4), but not to providing emergency treatment. GMC guidance requires the doctor to tell the patient, not express their personal beliefs in a way that causes distress, and make sure the patient has enough information to see another doctor promptly.', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v3')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = 'ab7b21ec-adf5-5c21-866d-b8f90598af02';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('f75279bf-7716-5542-9266-606d7a4a139f', 'ab7b21ec-adf5-5c21-866d-b8f90598af02', 'A', 'The doctor must perform the procedure', false, 0),
  ('6b9f92ad-5dd3-55aa-ae9f-cf16b7923c21', 'ab7b21ec-adf5-5c21-866d-b8f90598af02', 'B', 'The doctor can refuse and give no further information', false, 1),
  ('a13d7ef4-c8d5-5614-a0eb-9f4b9570ba67', 'ab7b21ec-adf5-5c21-866d-b8f90598af02', 'C', 'The doctor should try to persuade the patient not to have it', false, 2),
  ('2496d989-9a7c-5578-a830-8d5517d971d1', 'ab7b21ec-adf5-5c21-866d-b8f90598af02', 'D', 'The doctor may decline to be involved in the procedure, but must explain this and ensure the patient can see another doctor without delay', true, 3),
  ('79e64fbc-dcd2-5948-aa68-f717453aa813', 'ab7b21ec-adf5-5c21-866d-b8f90598af02', 'E', 'The doctor can report the patient to the police', false, 4);

-- Q442
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('dc6261ba-05bb-587f-bfd7-9a4fe9763fe8', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000013', 'sba', 'Under the Abortion Act 1967, up to which gestation is abortion allowed in Great Britain on the ground that continuing the pregnancy involves greater risk to the woman''s physical or mental health than termination?', 'The most commonly used ground (risk to physical or mental health of the woman or existing children greater than ending the pregnancy) has a 24-week limit. There is no time limit for grave permanent injury, risk to life, or substantial risk of serious fetal abnormality. Two doctors must agree (one in an emergency). Different laws apply in Northern Ireland.', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v3')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = 'dc6261ba-05bb-587f-bfd7-9a4fe9763fe8';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('f5ec5d2a-e31c-53d5-b788-e8090f174e8c', 'dc6261ba-05bb-587f-bfd7-9a4fe9763fe8', 'A', '20 weeks', false, 0),
  ('83ba0e4c-c608-591e-bfda-f980f7a7a5e5', 'dc6261ba-05bb-587f-bfd7-9a4fe9763fe8', 'B', '24 weeks', true, 1),
  ('f0c99e0e-74b7-511e-af9f-6a4945623362', 'dc6261ba-05bb-587f-bfd7-9a4fe9763fe8', 'C', '28 weeks', false, 2),
  ('c6a059f9-6c9d-5305-bc5b-587ee8bffeb5', 'dc6261ba-05bb-587f-bfd7-9a4fe9763fe8', 'D', 'No time limit', false, 3),
  ('6c57f067-a0de-5b66-ad1a-da777ca68fea', 'dc6261ba-05bb-587f-bfd7-9a4fe9763fe8', 'E', '12 weeks', false, 4);

-- Q443
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('c0affeb9-1ef4-5681-b476-06895a758bb7', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000013', 'sba', 'A woman tells her GP that her partner has been hitting her. She has no children and has capacity. She does not want anyone informed. What is the MOST appropriate action?', 'For competent adults, information about domestic abuse should usually only be disclosed with consent. Breach confidentiality only if there is a serious risk of harm to others (such as children) or serious crime, or if the person lacks capacity or is under duress. Use risk assessment (DASH) and refer high-risk cases to MARAC (sometimes without consent if the risk is very high). Provide information about IDVAs and helplines.', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v3')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = 'c0affeb9-1ef4-5681-b476-06895a758bb7';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('2a4768ff-929a-596c-8525-99a1974e3d7c', 'c0affeb9-1ef4-5681-b476-06895a758bb7', 'A', 'Tell her partner that you know', false, 0),
  ('45ada726-86d7-5e8c-bd32-da9b424e6fa1', 'c0affeb9-1ef4-5681-b476-06895a758bb7', 'B', 'Do nothing and not document it', false, 1),
  ('cb920c27-c0db-59c0-8aef-a211f7c11f05', 'c0affeb9-1ef4-5681-b476-06895a758bb7', 'C', 'Report it to the police immediately against her wishes', false, 2),
  ('df5db7b2-7e89-5e37-854a-48d611e0b97f', 'c0affeb9-1ef4-5681-b476-06895a758bb7', 'D', 'Respect her confidentiality, document carefully, assess risk (e.g. DASH), and offer support and specialist domestic abuse services; disclose only if there is a serious risk to her or others', true, 3),
  ('bee0bfac-6f94-5c04-8b5b-a1f91b7235ca', 'c0affeb9-1ef4-5681-b476-06895a758bb7', 'E', 'Refer to social services without consent in all cases', false, 4);

-- Q444
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('c2e91f8e-c326-5eec-a6ad-66810e312f9a', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000013', 'sba', 'A doctor wants to take a photograph of a patient''s rash to post on a professional social media group for teaching. The patient is identifiable. What is the CORRECT approach?', 'GMC guidance requires consent to make recordings and use them for purposes other than direct care, such as teaching or publication. Recordings should be anonymised where possible. Identifiable images on social media need explicit consent. Doctors must also maintain professional boundaries and confidentiality online.', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v3')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = 'c2e91f8e-c326-5eec-a6ad-66810e312f9a';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('94442dfc-1c40-51f3-aad2-27ffb0a722c9', 'c2e91f8e-c326-5eec-a6ad-66810e312f9a', 'A', 'Obtain the patient''s explicit consent for that specific use, and anonymise wherever possible', true, 0),
  ('b0337c5f-b199-522e-864c-2d17ed9c341d', 'c2e91f8e-c326-5eec-a6ad-66810e312f9a', 'B', 'Post it if the face is partly visible only', false, 1),
  ('f252134f-e2c4-5e72-95b1-956df924a674', 'c2e91f8e-c326-5eec-a6ad-66810e312f9a', 'C', 'Ask a colleague to post it instead', false, 2),
  ('6c5abd41-b706-5bdf-bded-14585676f360', 'c2e91f8e-c326-5eec-a6ad-66810e312f9a', 'D', 'Consent is never required for teaching', false, 3),
  ('083a3554-9fab-528a-8948-849f7cbfd20c', 'c2e91f8e-c326-5eec-a6ad-66810e312f9a', 'E', 'Post it without consent because it is for education', false, 4);

-- Q445
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('7787ef7d-e337-5908-882c-dc76ff422e0d', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000013', 'sba', 'A doctor completing a Medical Certificate of Cause of Death in England (from September 2024) needs to have it reviewed. Which statement is CORRECT?', 'Since 9 September 2024, the statutory medical examiner system in England and Wales means all deaths not referred to the coroner are scrutinised by a medical examiner, who also speaks to the bereaved. The attending practitioner completes the MCCD. Deaths that are unnatural, sudden or unexplained, or after certain events, must be referred to the coroner.', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v3')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = '7787ef7d-e337-5908-882c-dc76ff422e0d';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('a374861b-98e5-514a-9e6c-54ff390d13e6', '7787ef7d-e337-5908-882c-dc76ff422e0d', 'A', 'All non-coronial deaths are reviewed by an independent medical examiner before the MCCD is finalised', true, 0),
  ('852e80b7-083c-5119-957b-005c24a6123b', '7787ef7d-e337-5908-882c-dc76ff422e0d', 'B', 'Only cremations need review', false, 1),
  ('a8c08688-5250-5855-87b7-299c23f06f1b', '7787ef7d-e337-5908-882c-dc76ff422e0d', 'C', 'Any registered nurse can certify the cause of death', false, 2),
  ('7dadd2fc-df67-521e-a8ed-19a66573c568', '7787ef7d-e337-5908-882c-dc76ff422e0d', 'D', 'No review is needed', false, 3),
  ('87a6fe22-a2b1-5406-9937-d2663f5f7676', '7787ef7d-e337-5908-882c-dc76ff422e0d', 'E', 'The GP must refer all deaths to the coroner', false, 4);

-- Q446
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('b8fdbd16-1d77-5b54-8141-a53083e91d27', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000013', 'sba', 'Under the organ donation law in England (Max and Keira''s Law), which statement is CORRECT about adults who die in circumstances where donation is possible?', 'England has had a ''deemed consent'' (opt-out) system since 2020. Excluded groups include under-18s, people who have lived in England less than 12 months, those not living voluntarily, and those who lacked capacity for a significant period before death. Specialist nurses always discuss donation with the family, and their views are considered. Wales and Scotland also have opt-out systems.', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v3')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = 'b8fdbd16-1d77-5b54-8141-a53083e91d27';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('472c9497-0c28-591d-b345-de4109fc47ce', 'b8fdbd16-1d77-5b54-8141-a53083e91d27', 'A', 'Organs can be taken from anyone, including children, without discussion', false, 0),
  ('d8d50f9d-af7c-510f-a748-140ea38b0897', 'b8fdbd16-1d77-5b54-8141-a53083e91d27', 'B', 'The law applies only to Scotland', false, 1),
  ('8f263876-f7af-5cc3-b473-2349bc6906c4', 'b8fdbd16-1d77-5b54-8141-a53083e91d27', 'C', 'Families have no role at all', false, 2),
  ('8448ffd0-554a-5c40-82c6-312fc4eac864', 'b8fdbd16-1d77-5b54-8141-a53083e91d27', 'D', 'They are considered to have agreed to donation unless they opted out, or are in an excluded group; families are still consulted', true, 3),
  ('ffd3a9c3-88d5-5815-acce-247752875189', 'b8fdbd16-1d77-5b54-8141-a53083e91d27', 'E', 'Donation can only happen if the person registered to donate', false, 4);

-- Q447
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('33948166-b1a0-5ae2-8059-7fe78e8ae423', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000013', 'sba', 'A patient asks his GP to prescribe medication for his wife, who is not the GP''s patient. The GP is also a friend of the family. What is the CORRECT approach according to the GMC?', 'GMC guidance: wherever possible, avoid prescribing for yourself or anyone you have a close personal relationship with. Exceptions are emergencies or where no other suitable person is available (and never controlled drugs except in exceptional circumstances). Make a clear record and inform their own doctor.', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v3')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = '33948166-b1a0-5ae2-8059-7fe78e8ae423';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('c8d53cd3-1813-5f96-93de-d38ccd20d70a', '33948166-b1a0-5ae2-8059-7fe78e8ae423', 'A', 'Do not prescribe for someone with whom you have a close personal relationship, except in emergencies; advise her to see her own doctor', true, 0),
  ('5177341d-f7cc-5d56-b05a-3f5bab63126f', '33948166-b1a0-5ae2-8059-7fe78e8ae423', 'B', 'Prescribe as requested to save time', false, 1),
  ('507b1766-6d77-5117-8dbb-7138d035ecaf', '33948166-b1a0-5ae2-8059-7fe78e8ae423', 'C', 'Prescribe if the husband vouches for her', false, 2),
  ('d1e883b8-2cff-5b5a-84b5-65a4b139f283', '33948166-b1a0-5ae2-8059-7fe78e8ae423', 'D', 'Prescribe after a short phone call', false, 3),
  ('24f45cfd-fe76-5407-8ba2-6b1ccfac1696', '33948166-b1a0-5ae2-8059-7fe78e8ae423', 'E', 'Prescribe controlled drugs only', false, 4);

-- Q448
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('9ae2a7d3-8b0b-5dfb-b351-edc6e2cd6b50', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000013', 'sba', 'A 30 year old male patient repeatedly sends his female GP personal messages and asks her out. She is concerned. What is the MOST appropriate action according to the GMC?', 'GMC guidance: doctors must not pursue a sexual or improper emotional relationship with a current patient. If a patient pursues one, the doctor should treat them politely and professionally, seek advice from a colleague or defence organisation, record it, and, if it continues, help transfer care to another doctor, explaining why.', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v3')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = '9ae2a7d3-8b0b-5dfb-b351-edc6e2cd6b50';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('71fb72ca-86a6-5694-808e-dec43c68bac2', '9ae2a7d3-8b0b-5dfb-b351-edc6e2cd6b50', 'A', 'Do not pursue a relationship; maintain professional boundaries, discuss with a colleague, and if needed arrange for him to see another doctor', true, 0),
  ('f0df4007-334e-572d-9357-e0a16fd643e1', '9ae2a7d3-8b0b-5dfb-b351-edc6e2cd6b50', 'B', 'Accept the invitation since he is an adult', false, 1),
  ('ee959830-4736-597d-9533-a37286f6b717', '9ae2a7d3-8b0b-5dfb-b351-edc6e2cd6b50', 'C', 'Report him to the police immediately', false, 2),
  ('afadef2d-cfdc-5adf-8645-bf8ba9083824', '9ae2a7d3-8b0b-5dfb-b351-edc6e2cd6b50', 'D', 'Block him and remove him from the practice list without explanation', false, 3),
  ('7b7c9562-01ae-5106-b87c-3be97b9eecd2', '9ae2a7d3-8b0b-5dfb-b351-edc6e2cd6b50', 'E', 'Ignore the messages and continue as normal', false, 4);

-- Q449
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('2c10db76-7f79-501d-a175-d5a5856e77f8', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000013', 'sba', 'A 70 year old man is in hospital and lacks capacity. His daughter asks the nurse to hide his medication in his food because he keeps refusing it. What is the CORRECT approach to covert medication?', 'Covert administration of medication is only acceptable for people who lack capacity, when it is in their best interests and the least restrictive option. It needs a documented best interests decision involving the prescriber, pharmacist (to check it is safe to crush or mix), nursing staff and family or advocate, with regular review. It may engage DoLS considerations.', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v3')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = '2c10db76-7f79-501d-a175-d5a5856e77f8';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('3945470f-596d-5c25-9220-731815729787', '2c10db76-7f79-501d-a175-d5a5856e77f8', 'A', 'The nurse can do this immediately if the daughter agrees', false, 0),
  ('e865880c-973d-5d64-8a32-e87c3781dbc4', '2c10db76-7f79-501d-a175-d5a5856e77f8', 'B', 'Only the daughter can decide', false, 1),
  ('c186deb3-c0db-57dc-ba9f-fd1dacef77c9', '2c10db76-7f79-501d-a175-d5a5856e77f8', 'C', 'It is allowed for patients with capacity who refuse', false, 2),
  ('d2af7dd9-2429-5db9-a17a-2ecde6adf757', '2c10db76-7f79-501d-a175-d5a5856e77f8', 'D', 'It is never permitted in any circumstances', false, 3),
  ('e3baf0c2-28f3-5a10-910d-2d47cc2385a2', '2c10db76-7f79-501d-a175-d5a5856e77f8', 'E', 'Only after a capacity assessment and best interests decision involving the MDT, pharmacist and family, documented and regularly reviewed', true, 4);

-- Q450
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('863aa4fd-9f7d-5f4e-a7c9-0e718e06fa24', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000013', 'sba', 'A research team wants to include adults who lack capacity in a trial of a new treatment for sepsis. Which statement is CORRECT under the Mental Capacity Act 2005?', 'Under the MCA (sections 30-34), research involving adults who lack capacity must be approved by an appropriate body, be connected to an impairing condition, not be possible with people who have capacity, and carry negligible risk or potential benefit. A personal or nominated consultee must be consulted and the person''s objections respected. Clinical trials of medicines follow the Clinical Trials Regulations.', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v3')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = '863aa4fd-9f7d-5f4e-a7c9-0e718e06fa24';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('ea9b3b21-ce1c-58d7-a601-6cb44a4c9ff9', '863aa4fd-9f7d-5f4e-a7c9-0e718e06fa24', 'A', 'Adults lacking capacity can never be included in research', false, 0),
  ('62dcfc05-6154-5f02-ae04-6c832aa47103', '863aa4fd-9f7d-5f4e-a7c9-0e718e06fa24', 'B', 'Only patients with dementia can be included', false, 1),
  ('e7cb0013-c950-5e14-8a1a-78bed4fa820f', '863aa4fd-9f7d-5f4e-a7c9-0e718e06fa24', 'C', 'Research can be done if approved by an appropriate ethics committee, a consultee is consulted, and the research relates to the person''s condition with minimal risk/burden', true, 2),
  ('fec77ab2-0b7e-5172-b2ec-2efa75e16da7', '863aa4fd-9f7d-5f4e-a7c9-0e718e06fa24', 'D', 'Consent from any relative is enough', false, 3),
  ('5b949da8-3265-5379-90f7-7d824ff7fbdb', '863aa4fd-9f7d-5f4e-a7c9-0e718e06fa24', 'E', 'The researcher alone can decide', false, 4);

-- Q451
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('be416f5f-76d4-5248-a9fe-9f7a705e77fc', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000013', 'sba', 'An 82 year old man on a ventilator after a catastrophic stroke has no prospect of recovery. His family agree that he would not want continued life support. He has no advance decision. What is the MOST appropriate approach?', 'Withdrawing life-sustaining treatment that is no longer in the patient''s best interests is lawful and not euthanasia. Decisions are made by the treating team in the patient''s best interests, taking account of their known wishes and values and consulting those close to them. Court involvement is needed only if there is disagreement that cannot be resolved (since the 2018 Supreme Court Y judgment, not routinely for clinically assisted nutrition).', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v3')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = 'be416f5f-76d4-5248-a9fe-9f7a705e77fc';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('d2cc20f7-5c80-56a1-aee0-e505b878b05a', 'be416f5f-76d4-5248-a9fe-9f7a705e77fc', 'A', 'The family alone decide', false, 0),
  ('def99b92-a5ca-5176-90d3-4120b40cbcbc', 'be416f5f-76d4-5248-a9fe-9f7a705e77fc', 'B', 'Continue ventilation indefinitely', false, 1),
  ('5303006a-7707-5195-b1db-b559c4ea32b0', 'be416f5f-76d4-5248-a9fe-9f7a705e77fc', 'C', 'A court order is always required', false, 2),
  ('abf132bf-05e6-5186-bb15-49fde759bc24', 'be416f5f-76d4-5248-a9fe-9f7a705e77fc', 'D', 'Withdraw treatment without consulting anyone', false, 3),
  ('3250a938-8d55-5308-bd5b-17b12511bbcb', 'be416f5f-76d4-5248-a9fe-9f7a705e77fc', 'E', 'A best interests decision by the clinical team, consulting the family, to withdraw life-sustaining treatment and provide palliative care', true, 4);

-- Q452
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('d11dd8e5-b533-5ff7-9bc7-4a93f4a26623', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000013', 'sba', 'A 35 year old woman has been diagnosed with Huntington''s disease. She refuses to tell her sister, who is planning a pregnancy. What is the MOST appropriate action?', 'GMC guidance on genetic information: confidentiality is important, but disclosure may be justified when relatives face a serious risk of harm that could be reduced. First encourage and support the patient to share. If they still refuse, consider whether the public interest in disclosure outweighs confidentiality (ABC v St George''s case). Seek advice and document reasoning.', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v3')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = 'd11dd8e5-b533-5ff7-9bc7-4a93f4a26623';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('f3641ce9-c385-5a1d-b6fb-9b3011501a7f', 'd11dd8e5-b533-5ff7-9bc7-4a93f4a26623', 'A', 'Encourage her to share the information; if she still refuses, disclosure without consent may be justified after careful consideration of the risk of serious harm, ideally with advice from genetics and ethics colleagues', true, 0),
  ('3bedcc07-58d7-5820-aa3f-295f1fb0d5a2', 'd11dd8e5-b533-5ff7-9bc7-4a93f4a26623', 'B', 'Never disclose under any circumstances', false, 1),
  ('6596c757-ead0-5a4d-83e3-4b18de5cdcd0', 'd11dd8e5-b533-5ff7-9bc7-4a93f4a26623', 'C', 'Tell the sister immediately without discussion', false, 2),
  ('3750595a-efa2-5b98-b0da-1b199444a902', 'd11dd8e5-b533-5ff7-9bc7-4a93f4a26623', 'D', 'Tell the sister''s employer', false, 3),
  ('95c6ba5c-125e-5df8-af8e-1a3669f0120c', 'd11dd8e5-b533-5ff7-9bc7-4a93f4a26623', 'E', 'Ask the police to inform her', false, 4);

-- Q453
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('39591610-8339-56ea-9cd6-fcb210f1db54', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000013', 'sba', 'A doctor in training realises she has made a mistake in a patient''s notes yesterday, recording the wrong medication dose. What is the CORRECT way to correct the record?', 'Medical records must be accurate, contemporaneous and never altered to hide errors. Corrections should be made with a new, clearly dated, timed and signed entry (single line through paper entries so they remain legible). Altering records dishonestly is a serious probity issue.', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v3')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = '39591610-8339-56ea-9cd6-fcb210f1db54';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('52b358ef-eccc-5a3f-9045-24ffed33959c', '39591610-8339-56ea-9cd6-fcb210f1db54', 'A', 'Use correction fluid', false, 0),
  ('a366714d-1f40-5912-9d15-aca9763a9755', '39591610-8339-56ea-9cd6-fcb210f1db54', 'B', 'Delete the original entry', false, 1),
  ('63546e36-b8f2-530c-af20-f338136bd918', '39591610-8339-56ea-9cd6-fcb210f1db54', 'C', 'Add a dated, timed and signed entry correcting the error, leaving the original visible', true, 2),
  ('6572a2ab-d95f-58b5-8a1a-cb0af24b3299', '39591610-8339-56ea-9cd6-fcb210f1db54', 'D', 'Remove the page', false, 3),
  ('5e8c3462-e651-5756-9aff-a91ac96494e5', '39591610-8339-56ea-9cd6-fcb210f1db54', 'E', 'Ask a colleague to rewrite the notes', false, 4);

-- Q454
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('12a45b13-3046-5663-88c1-a9069223e841', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000013', 'sba', 'A 40 year old woman has a brain tumour and is losing capacity. She wants to plan for future decisions about her care while she still can. Which document allows her to appoint someone to make health decisions for her later?', 'An LPA for Health and Welfare allows a chosen attorney to make health and care decisions once the person lacks capacity. It must be registered with the OPG before use. Advance statements of wishes are not legally binding but must be considered. An advance decision to refuse treatment is binding if valid and applicable. Enduring Powers of Attorney (pre-2007) cover property and financial affairs only.', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v3')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = '12a45b13-3046-5663-88c1-a9069223e841';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('e0d2f2fc-5e42-598c-ac49-137361b0456e', '12a45b13-3046-5663-88c1-a9069223e841', 'A', 'A Lasting Power of Attorney for Health and Welfare, registered with the Office of the Public Guardian', true, 0),
  ('705fbec6-cde0-55de-91ba-aec3658f721e', '12a45b13-3046-5663-88c1-a9069223e841', 'B', 'A will', false, 1),
  ('ac2f3af4-703a-54ff-af58-4ef398c7d40a', '12a45b13-3046-5663-88c1-a9069223e841', 'C', 'A DNACPR form', false, 2),
  ('72212141-438a-5057-b863-9f8260c38eb8', '12a45b13-3046-5663-88c1-a9069223e841', 'D', 'An Enduring Power of Attorney (made after 2007)', false, 3),
  ('c51595a7-9744-5fd7-aba9-44e75c5efb5d', '12a45b13-3046-5663-88c1-a9069223e841', 'E', 'An advance statement', false, 4);

-- Q455
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('cc89fe49-1c0c-5fbd-94f5-d1a6ec1dbb00', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000013', 'sba', 'A woman tells her GP that her 75 year old mother, who lives with her brother, has unexplained bruises and has stopped going out. She suspects her brother is taking her mother''s money. What is the MOST appropriate action?', 'Adult safeguarding (Care Act 2014): where an adult with care and support needs may be experiencing abuse or neglect (physical, financial, psychological, sexual, neglect) and cannot protect themselves, raise a concern with the local authority. Involve the adult where possible and consider their wishes and capacity. In an emergency, contact the police.', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v3')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = 'cc89fe49-1c0c-5fbd-94f5-d1a6ec1dbb00';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('cddd9e0c-209c-55dd-a8d7-7593aba285e3', 'cc89fe49-1c0c-5fbd-94f5-d1a6ec1dbb00', 'A', 'Raise a safeguarding concern with the local authority adult safeguarding team, following local procedures', true, 0),
  ('233aa005-ef16-51c3-91ce-ff580aba0fd4', 'cc89fe49-1c0c-5fbd-94f5-d1a6ec1dbb00', 'B', 'Confront the brother', false, 1),
  ('e32f8390-0de3-5319-8f86-801cc3f9c3b1', 'cc89fe49-1c0c-5fbd-94f5-d1a6ec1dbb00', 'C', 'Tell the daughter it is not the GP''s responsibility', false, 2),
  ('b2937af3-b8ed-5c51-ac74-9e051477d59b', 'cc89fe49-1c0c-5fbd-94f5-d1a6ec1dbb00', 'D', 'Ignore it, as the mother has not complained', false, 3),
  ('629b59f9-d936-565a-8a11-fd68ebf48656', 'cc89fe49-1c0c-5fbd-94f5-d1a6ec1dbb00', 'E', 'Inform the police only if the mother consents', false, 4);

-- Q456
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('22edadfe-c4ae-592b-93cc-8868617bd0d8', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000029', 'sba', 'A 78 year old woman needs help with all outside activities and housework, struggles with stairs and needs help bathing, but manages her own personal care otherwise. Using the Rockwood Clinical Frailty Scale, what score is she?', 'Clinical Frailty Scale: 4 = vulnerable (not dependent but slowed); 5 = mildly frail (needs help with instrumental ADLs: finances, transport, heavy housework); 6 = moderately frail (needs help with all outside activities and housework, and with bathing); 7 = severely frail (completely dependent for personal care); 8 = very severely frail; 9 = terminally ill. It helps guide decisions about treatment intensity.', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v3')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = '22edadfe-c4ae-592b-93cc-8868617bd0d8';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('ac5a3b78-e67f-5a89-a462-e39172880096', '22edadfe-c4ae-592b-93cc-8868617bd0d8', 'A', 'CFS 6 (moderately frail)', true, 0),
  ('2338457e-ab1d-5f09-be5f-7d4c0c68e008', '22edadfe-c4ae-592b-93cc-8868617bd0d8', 'B', 'CFS 8 (very severely frail)', false, 1),
  ('c5da51e6-7f11-53a9-bad0-dbdb8c82cdf6', '22edadfe-c4ae-592b-93cc-8868617bd0d8', 'C', 'CFS 9 (terminally ill)', false, 2),
  ('76ce771c-ba0f-5c96-8d13-0e576cbe07f7', '22edadfe-c4ae-592b-93cc-8868617bd0d8', 'D', 'CFS 3 (managing well)', false, 3),
  ('17d258db-52fe-5079-920e-ea5ef143e0ce', '22edadfe-c4ae-592b-93cc-8868617bd0d8', 'E', 'CFS 5 (mildly frail)', false, 4);

-- Q457
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('d1747a32-683d-5882-83e4-a928e6f11f52', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000029', 'sba', 'An 82 year old man with dementia has delirium and is very agitated, pulling at his lines and trying to hit staff. Verbal de-escalation and non-drug measures have failed, and he is at risk of harm. Which drug is MOST appropriate as short-term treatment if needed?', 'NICE CG103: if a person with delirium is distressed or a risk to themselves or others and verbal and non-verbal de-escalation fails, consider short-term (usually 1 week or less) haloperidol at the lowest dose. Avoid antipsychotics in Parkinson''s or DLB (use lorazepam with caution instead). Benzodiazepines are first-line in alcohol withdrawal. Always treat the underlying cause.', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v3')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = 'd1747a32-683d-5882-83e4-a928e6f11f52';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('1b8ce5e7-0f3e-5f69-9969-8a6b7dc02527', 'd1747a32-683d-5882-83e4-a928e6f11f52', 'A', 'Low-dose haloperidol (avoid in Parkinson''s disease or Lewy body dementia), for the shortest time possible', true, 0),
  ('8d921e7a-2fb9-53d6-a671-b85a3ae29762', 'd1747a32-683d-5882-83e4-a928e6f11f52', 'B', 'High-dose lorazepam', false, 1),
  ('0f20444a-fcf1-5c23-9618-95b8aff25d25', 'd1747a32-683d-5882-83e4-a928e6f11f52', 'C', 'Long-term risperidone', false, 2),
  ('ebc47d0c-dfcc-53ad-80e7-5f00e9e5be56', 'd1747a32-683d-5882-83e4-a928e6f11f52', 'D', 'Regular chlorpromazine', false, 3),
  ('3e66923e-c441-52cd-b3c4-905746425ec3', 'd1747a32-683d-5882-83e4-a928e6f11f52', 'E', 'IM ketamine', false, 4);

-- Q458
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('fe2a781d-803f-558c-9d45-e987481349ed', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000029', 'sba', 'An 84 year old man has dribbling incontinence and a constant feeling that his bladder is not empty. A bladder scan shows 850 mL after voiding. His abdomen is distended. What is the SINGLE most likely type of incontinence?', 'Overflow incontinence is caused by chronic retention (bladder outlet obstruction from BPH, constipation, anticholinergics, neurological disease). It causes dribbling with a high post-void residual. It needs catheterisation, a review of renal function, and treatment of the cause. Antimuscarinics would make it worse.', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v3')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = 'fe2a781d-803f-558c-9d45-e987481349ed';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('8056add6-c6fb-5bbe-9676-4a38aed36b50', 'fe2a781d-803f-558c-9d45-e987481349ed', 'A', 'Mixed incontinence', false, 0),
  ('5576d609-e747-56c4-8e68-cb2a2f859d69', 'fe2a781d-803f-558c-9d45-e987481349ed', 'B', 'Stress incontinence', false, 1),
  ('3d61039c-85da-589b-bf3e-6981e544156b', 'fe2a781d-803f-558c-9d45-e987481349ed', 'C', 'Urge incontinence', false, 2),
  ('6b27d46f-22cd-58e4-84f4-9228f4182c5d', 'fe2a781d-803f-558c-9d45-e987481349ed', 'D', 'Overflow incontinence from chronic urinary retention', true, 3),
  ('7c494a6d-4abe-5b3d-9181-57eac22fdabd', 'fe2a781d-803f-558c-9d45-e987481349ed', 'E', 'Functional incontinence', false, 4);

-- Q459
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('bd4a8020-bff8-5a23-bdf7-464267939c7d', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000029', 'sba', 'An 80 year old woman had a stroke and now coughs while drinking and has a wet voice after swallowing. What is the SINGLE most appropriate next step?', 'Dysphagia is common after stroke and increases the risk of aspiration pneumonia. A swallow screen should be done within 4 hours of admission, before any food, fluid or oral medication. Specialist SALT assessment guides texture-modified diets. Use NG feeding within 24 hours if oral intake is not safe. PEG is considered later if dysphagia persists.', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v3')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = 'bd4a8020-bff8-5a23-bdf7-464267939c7d';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('5f5b3bcd-5f7f-5c13-a094-dca566eb243f', 'bd4a8020-bff8-5a23-bdf7-464267939c7d', 'A', 'Keep nil by mouth and arrange a speech and language therapy swallow assessment, maintaining hydration (IV or NG)', true, 0),
  ('f6c618a6-c799-5830-a412-d1babb1b511e', 'bd4a8020-bff8-5a23-bdf7-464267939c7d', 'B', 'Give thickened fluids without assessment', false, 1),
  ('4e08b590-b678-5ec4-9810-d6caa246775a', 'bd4a8020-bff8-5a23-bdf7-464267939c7d', 'C', 'Feed normally with supervision', false, 2),
  ('f2cba66e-ebce-5258-87ed-ca26d354bfb7', 'bd4a8020-bff8-5a23-bdf7-464267939c7d', 'D', 'Give oral antibiotics', false, 3),
  ('5cc88d9c-a128-5545-8b09-7f8d02bbe6e7', 'bd4a8020-bff8-5a23-bdf7-464267939c7d', 'E', 'Insert a PEG tube immediately', false, 4);

-- Q460
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('80c6b66f-7481-5194-a78c-fb06354eb42c', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000029', 'sba', 'An 85 year old woman has lost 8 kg over 6 months, has a BMI of 18 and eats little. Which screening tool is recommended to identify malnutrition risk in hospital and the community?', 'MUST uses BMI, unplanned weight loss in 3-6 months, and acute disease effect to classify risk as low, medium or high. High risk needs dietitian referral and a nutritional care plan. Look for and treat reversible causes (depression, dental problems, dysphagia, cancer, medications, social isolation). Watch for refeeding syndrome.', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v3')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = '80c6b66f-7481-5194-a78c-fb06354eb42c';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('8d84e3b1-01b3-57b9-aade-e3c5c7e22ccb', '80c6b66f-7481-5194-a78c-fb06354eb42c', 'A', 'CURB-65', false, 0),
  ('1cf3eab7-8b0a-5bbf-8e49-1e99b16ce0ac', '80c6b66f-7481-5194-a78c-fb06354eb42c', 'B', 'Waterlow score only', false, 1),
  ('328a745c-06e8-5424-b4ca-cb295996881b', '80c6b66f-7481-5194-a78c-fb06354eb42c', 'C', 'MMSE', false, 2),
  ('272eb0c8-8abb-5b05-96dc-0d10df893e1f', '80c6b66f-7481-5194-a78c-fb06354eb42c', 'D', 'Barthel index', false, 3),
  ('fd9bcafe-db1e-56bd-a424-3ab99e770931', '80c6b66f-7481-5194-a78c-fb06354eb42c', 'E', 'Malnutrition Universal Screening Tool (MUST)', true, 4);

-- Q461
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('c8ba8417-af58-52a7-8320-06f57e1d2b38', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000029', 'sba', 'An 88 year old woman has progressive loss of muscle strength and mass, slow walking speed and reduced grip strength. She has no other illness. Which intervention has the BEST evidence to improve this?', 'Sarcopenia is age-related loss of muscle mass, strength and function, increasing the risk of falls, frailty and disability. It is diagnosed with low grip strength, low muscle quantity and reduced physical performance. Resistance exercise is the most effective intervention, supported by adequate protein (1-1.2 g/kg/day) and vitamin D if deficient.', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v3')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = 'c8ba8417-af58-52a7-8320-06f57e1d2b38';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('c92ce473-e8c7-5168-8a42-cd3f1fabb0b5', 'c8ba8417-af58-52a7-8320-06f57e1d2b38', 'A', 'Vitamin B12 injections', false, 0),
  ('17c72ba1-6ebd-5d96-9edf-e8a063bca17f', 'c8ba8417-af58-52a7-8320-06f57e1d2b38', 'B', 'Progressive resistance exercise training, with adequate protein intake', true, 1),
  ('4fdf28e8-0330-5b68-99b9-ed3b0ea71d44', 'c8ba8417-af58-52a7-8320-06f57e1d2b38', 'C', 'Growth hormone', false, 2),
  ('b58f15f8-0f31-5357-b9ac-3cb57fbc2cfa', 'c8ba8417-af58-52a7-8320-06f57e1d2b38', 'D', 'Long-term bed rest', false, 3),
  ('742e7dd6-4e82-5008-96b1-7f52cc95cf8d', 'c8ba8417-af58-52a7-8320-06f57e1d2b38', 'E', 'Testosterone injections', false, 4);

-- Q462
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('ef64cde5-9924-50dc-8ce0-1663eadd6721', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000029', 'sba', 'An 80 year old man with Alzheimer''s dementia is still driving. His wife says he got lost driving to a familiar shop. What is the MOST appropriate advice?', 'Drivers with dementia must tell the DVLA, which assesses their fitness to drive (sometimes with a driving assessment). Getting lost, near misses and poor judgement are warning signs. If a patient continues driving when unsafe and will not inform the DVLA, the GMC allows the doctor to inform the DVLA after telling the patient.', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v3')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = 'ef64cde5-9924-50dc-8ce0-1663eadd6721';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('728cc53f-be0e-557a-b41b-392125122397', 'ef64cde5-9924-50dc-8ce0-1663eadd6721', 'A', 'He must inform the DVLA of his dementia diagnosis, and should stop driving if there are safety concerns', true, 0),
  ('0ddb05e5-4858-5570-abf1-651f67e6d411', 'ef64cde5-9924-50dc-8ce0-1663eadd6721', 'B', 'He can drive as long as he feels confident', false, 1),
  ('2b7990e3-2ece-585d-ad2f-7cdd221b41e2', 'ef64cde5-9924-50dc-8ce0-1663eadd6721', 'C', 'He should drive only at night', false, 2),
  ('c397af02-af22-5050-9212-885ab85ee56f', 'ef64cde5-9924-50dc-8ce0-1663eadd6721', 'D', 'Only lorry drivers with dementia need to inform the DVLA', false, 3),
  ('9cf193ec-b7e3-5772-b761-0b9e674678b3', 'ef64cde5-9924-50dc-8ce0-1663eadd6721', 'E', 'The GP must confiscate his licence', false, 4);

-- Q463
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('3c873c01-cded-5cf5-bfbc-453217e50a0e', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000029', 'sba', 'A 79 year old woman has been more confused for a week. She takes citalopram, bendroflumethiazide and omeprazole. Her sodium is 121 mmol/L. She is euvolaemic. What is the SINGLE most appropriate first step?', 'Hyponatraemia in older people is common and often drug-related (thiazides, SSRIs, PPIs, carbamazepine, antipsychotics). It causes confusion and falls. Stop the culprits, assess fluid status, and restrict fluids if SIADH. Correct chronic hyponatraemia slowly (no more than 10 mmol/L in 24 hours) to avoid osmotic demyelination. Hypertonic saline is only for severe symptoms (seizures, reduced consciousness).', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v3')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = '3c873c01-cded-5cf5-bfbc-453217e50a0e';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('d1a47dc3-dbec-5277-8fdb-a66012a33227', '3c873c01-cded-5cf5-bfbc-453217e50a0e', 'A', 'Increase citalopram', false, 0),
  ('585b1df2-745a-560b-8e4c-ac2c4c228d99', '3c873c01-cded-5cf5-bfbc-453217e50a0e', 'B', 'Give IV 3% saline rapidly', false, 1),
  ('84fadfe3-9132-5292-bda5-3b2dae5dff4d', '3c873c01-cded-5cf5-bfbc-453217e50a0e', 'C', 'Review and stop the likely causative drugs (thiazide, SSRI), with fluid restriction and monitoring', true, 2),
  ('65fde13f-8709-5a14-aa22-ab1efd561191', '3c873c01-cded-5cf5-bfbc-453217e50a0e', 'D', 'Give IV 0.9% saline 3 L', false, 3),
  ('31e542de-41b8-59fe-9160-b3e08ddb6929', '3c873c01-cded-5cf5-bfbc-453217e50a0e', 'E', 'Start demeclocycline', false, 4);

-- Q464
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('ea5ffcc6-f006-512c-b16e-c6cdeed302ac', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000029', 'sba', 'A 72 year old man asks which vaccines he should have as an older adult in the UK. Which is CORRECT?', 'UK programmes for older adults: annual flu vaccine (65 and over), pneumococcal polysaccharide vaccine (65 and over), shingles vaccine (Shingrix, two doses, for those turning 65 and eligible older cohorts up to 79), RSV vaccine (75-79 from September 2024), and seasonal COVID-19 boosters for eligible groups. Check current eligibility, as programmes change.', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v3')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = 'ea5ffcc6-f006-512c-b16e-c6cdeed302ac';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('fbebaea6-bac8-52a5-8f7b-80b36b4247f1', 'ea5ffcc6-f006-512c-b16e-c6cdeed302ac', 'A', 'Only an annual flu vaccine', false, 0),
  ('e68c6293-7064-544d-b745-8827cfb02825', 'ea5ffcc6-f006-512c-b16e-c6cdeed302ac', 'B', 'Annual flu vaccine, a one-off pneumococcal vaccine, shingles vaccination (Shingrix) and RSV vaccine (if aged 75-79 under the current programme), plus COVID-19 boosters as offered', true, 1),
  ('a5cb5227-4765-5a66-8b58-c8fab7dcc5cc', 'ea5ffcc6-f006-512c-b16e-c6cdeed302ac', 'C', 'MMR every 5 years', false, 2),
  ('499e2b21-fe52-519c-bb9a-a7cd6fb70424', 'ea5ffcc6-f006-512c-b16e-c6cdeed302ac', 'D', 'BCG vaccination', false, 3),
  ('52f238aa-9c21-5f08-a55c-085f09830aaf', 'ea5ffcc6-f006-512c-b16e-c6cdeed302ac', 'E', 'Hepatitis A vaccine routinely', false, 4);

-- Q465
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('9662687b-8c52-5560-a9eb-d89eb38b2681', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000029', 'sba', 'An 83 year old woman has recurrent syncope while turning her head or shaving. Carotid sinus massage produces a 5-second pause with symptoms. What is the SINGLE most likely diagnosis and treatment?', 'Carotid sinus hypersensitivity causes syncope or falls in older people triggered by neck pressure or turning (tight collars, shaving). Carotid sinus massage (with monitoring, avoiding it if there is a bruit or recent stroke) reproduces a pause of 3 seconds or more (cardioinhibitory) or a BP fall of 50 mmHg or more (vasodepressor). Symptomatic cardioinhibitory forms are treated with pacing.', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v3')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = '9662687b-8c52-5560-a9eb-d89eb38b2681';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('b15d0116-17ae-5c2d-889e-338a8717402a', '9662687b-8c52-5560-a9eb-d89eb38b2681', 'A', 'Carotid sinus hypersensitivity (cardioinhibitory); consider dual-chamber pacemaker', true, 0),
  ('babef2e8-2dcd-531f-a6a4-789a6eba33a3', '9662687b-8c52-5560-a9eb-d89eb38b2681', 'B', 'Epilepsy; levetiracetam', false, 1),
  ('48b48120-4aa8-57d8-bffa-c023b21c608e', '9662687b-8c52-5560-a9eb-d89eb38b2681', 'C', 'Vasovagal syncope; tilt training', false, 2),
  ('235e5339-c70a-5a36-9ade-fae4eb25dbf3', '9662687b-8c52-5560-a9eb-d89eb38b2681', 'D', 'Orthostatic hypotension; fludrocortisone', false, 3),
  ('9e34612c-0d48-5676-96e7-3dd7a193ee6e', '9662687b-8c52-5560-a9eb-d89eb38b2681', 'E', 'Aortic stenosis; valve replacement', false, 4);

-- Q466
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('17d5ed36-f97f-5785-bdc6-c05aaab3d0c9', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000029', 'sba', 'An 80 year old man with type 2 diabetes, CKD and heart failure is on 11 regular medications. He has had falls and confusion. What is the MOST appropriate structured approach?', 'Polypharmacy (often 10 or more drugs) increases the risks of adverse drug reactions, falls, confusion and hospitalisation. Structured medication reviews (NICE NG5, STOPP/START, Beers) identify inappropriate drugs and omissions. Deprescribe gradually, prioritising high-risk drugs (sedatives, anticholinergics, NSAIDs, antipsychotics), and discuss with the patient their goals.', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v3')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = '17d5ed36-f97f-5785-bdc6-c05aaab3d0c9';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('19e6f829-cdb4-505c-9bb1-fdc6ba781a12', '17d5ed36-f97f-5785-bdc6-c05aaab3d0c9', 'A', 'Add another medication for confusion', false, 0),
  ('4683c134-a54f-5242-bf82-c94ab4b5b301', '17d5ed36-f97f-5785-bdc6-c05aaab3d0c9', 'B', 'Continue all medications unchanged', false, 1),
  ('2c19bf54-bf5d-5d95-b531-b224d4bff875', '17d5ed36-f97f-5785-bdc6-c05aaab3d0c9', 'C', 'A structured medication review using a tool such as STOPP/START, with shared decision-making and deprescribing', true, 2),
  ('1055e150-53ad-5c67-93cb-49367d3f980f', '17d5ed36-f97f-5785-bdc6-c05aaab3d0c9', 'D', 'Refer to pharmacy without telling the patient', false, 3),
  ('54457dee-6b8d-53fe-8ca2-1f0a43a1032d', '17d5ed36-f97f-5785-bdc6-c05aaab3d0c9', 'E', 'Stop all medications at once', false, 4);

-- Q467
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('713e6330-94a2-541d-a32e-2f02677505e4', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000029', 'sba', 'An 84 year old man with dementia has developed recurrent aspiration pneumonia. His family ask about ''risk feeding''. What does this mean?', 'Eating and drinking with acknowledged risk is a shared decision (with the person if possible, family and MDT) when the risks of aspiration cannot be removed and tube feeding would not be in their best interests (PEG does not prevent aspiration or improve survival in advanced dementia). Use the best texture and positioning, and good mouth care. Document clearly.', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v3')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = '713e6330-94a2-541d-a32e-2f02677505e4';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('e59b9b27-91fc-5651-a6d1-1dd177d56074', '713e6330-94a2-541d-a32e-2f02677505e4', 'A', 'Feeding with thickened fluids only, with no discussion', false, 0),
  ('6616ff67-a861-5038-8ff1-3a8e70d2be98', '713e6330-94a2-541d-a32e-2f02677505e4', 'B', 'Continuing oral intake for comfort and quality of life, accepting the risk of aspiration, as part of a documented best interests or patient-led decision', true, 1),
  ('8bf1b431-8a64-550b-b534-e90113ae9dd7', '713e6330-94a2-541d-a32e-2f02677505e4', 'C', 'Feeding only through an NG tube', false, 2),
  ('36aff1ff-bd61-51d7-a146-30067aa7805d', '713e6330-94a2-541d-a32e-2f02677505e4', 'D', 'Stopping all food and fluids', false, 3),
  ('75b3a989-f6d7-59a7-afca-9cef2f1be713', '713e6330-94a2-541d-a32e-2f02677505e4', 'E', 'Mandatory PEG placement', false, 4);

-- Q468
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('a0a72b5a-4d7e-5eb5-b903-97d83252f368', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000029', 'sba', 'An 82 year old woman with a fractured neck of femur is on the ward. What is the best evidence-based model of care for her?', 'NICE CG124 and the National Hip Fracture Database standards: surgery on the day of or the day after admission (within 36 hours), orthogeriatric assessment within 72 hours, nerve block for analgesia, delirium prevention, mobilisation the day after surgery, falls and bone health assessment, and multidisciplinary rehabilitation. These reduce mortality and improve outcomes.', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v3')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = 'a0a72b5a-4d7e-5eb5-b903-97d83252f368';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('da41e084-a404-57ec-bf88-301e2f7bde80', 'a0a72b5a-4d7e-5eb5-b903-97d83252f368', 'A', 'Analgesia only and no surgery', false, 0),
  ('71b93c49-baf6-5197-8bd9-8bf3ba892a88', 'a0a72b5a-4d7e-5eb5-b903-97d83252f368', 'B', 'Orthogeriatric shared care with surgery within 36 hours and early mobilisation (the day after surgery)', true, 1),
  ('567cffb0-d2fb-5c3b-8c95-a79d92bf9ae2', 'a0a72b5a-4d7e-5eb5-b903-97d83252f368', 'C', 'Bed rest for 1 week after surgery', false, 2),
  ('60b1a834-5213-55d0-8cdd-ee16d66f94d8', 'a0a72b5a-4d7e-5eb5-b903-97d83252f368', 'D', 'Surgery when convenient within 2 weeks', false, 3),
  ('60640537-a921-5474-9bab-0368d8173f00', 'a0a72b5a-4d7e-5eb5-b903-97d83252f368', 'E', 'Discharge to a care home before rehabilitation', false, 4);

-- Q469
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('78bcecdd-a997-5872-ab29-f6dda14758a3', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000029', 'sba', 'An 86 year old woman who lives alone has become less able to manage: she is not eating well, her home is cluttered, and she has missed medications. She has capacity. She wants to stay at home. What is the MOST appropriate next step?', 'Under the Care Act 2014, local authorities must assess adults who appear to need care and support. Support should promote wellbeing and respect the person''s wishes, using the least restrictive option (such as carers, meals, telecare or blister packs). A person with capacity can choose to remain at home even if there are risks.', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v3')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = '78bcecdd-a997-5872-ab29-f6dda14758a3';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('1be2a18b-0864-581d-bb9b-f1ee6e4505ac', '78bcecdd-a997-5872-ab29-f6dda14758a3', 'A', 'Do nothing as she has capacity', false, 0),
  ('0634f8ff-5b43-50a2-9c6d-7ac4abfbeed0', '78bcecdd-a997-5872-ab29-f6dda14758a3', 'B', 'Arrange immediate care home admission against her wishes', false, 1),
  ('97f3ece0-9a94-5407-9dde-617bb893ef9f', '78bcecdd-a997-5872-ab29-f6dda14758a3', 'C', 'Admit her to hospital', false, 2),
  ('25437c61-0dc5-5823-9d79-6ab018223c8c', '78bcecdd-a997-5872-ab29-f6dda14758a3', 'D', 'Ask her family to decide for her', false, 3),
  ('66bcb8bc-0ee8-5f66-b104-11529f2beb68', '78bcecdd-a997-5872-ab29-f6dda14758a3', 'E', 'Arrange a needs assessment by adult social care, with a care package and support to remain at home if possible', true, 4);

-- Q470
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('38da5fe2-f2f0-5f6b-92e3-786fab502107', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000029', 'sba', 'A 79 year old man has gradual hearing loss, and his family say he seems withdrawn. Which statement about hearing loss in older people is CORRECT?', 'Presbycusis is common. NICE NG98 recommends referral for audiological assessment for hearing difficulties. Hearing loss is a modifiable risk factor for dementia (Lancet Commission), and hearing aids may reduce this risk. Also check for ear wax, which is common and treatable.', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v3')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = '38da5fe2-f2f0-5f6b-92e3-786fab502107';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('241b0d4e-1e23-5dfd-a802-eefedb04ebe1', '38da5fe2-f2f0-5f6b-92e3-786fab502107', 'A', 'Hearing tests are not useful after 75', false, 0),
  ('e3102727-776a-5e55-ad07-bf787d23b640', '38da5fe2-f2f0-5f6b-92e3-786fab502107', 'B', 'Untreated hearing loss is associated with social isolation, depression and an increased risk of dementia; refer for audiology and hearing aids', true, 1),
  ('35c6887d-0266-5fc2-8291-209a372a4a91', '38da5fe2-f2f0-5f6b-92e3-786fab502107', 'C', 'It is a normal part of ageing and needs no action', false, 2),
  ('10d447cd-e63b-558d-acf7-7da670181519', '38da5fe2-f2f0-5f6b-92e3-786fab502107', 'D', 'Hearing aids cause dementia', false, 3),
  ('f4c2fbc6-655c-54c9-85e8-1211846ac436', '38da5fe2-f2f0-5f6b-92e3-786fab502107', 'E', 'It only affects the elderly who listen to loud music', false, 4);

-- Q471
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('ee839452-13ab-5ffd-9d47-c832dc1f6057', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000029', 'sba', 'An 84 year old woman takes zopiclone and lorazepam for sleep and anxiety. She has had 3 falls. What is the MOST appropriate change?', 'Benzodiazepines and Z-drugs increase the risk of falls, fractures, confusion and dependence in older people. They are on the STOPP list. Taper them gradually to avoid withdrawal, and support sleep with CBT for insomnia and sleep hygiene. Avoid sedating antihistamines (anticholinergic).', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v3')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = 'ee839452-13ab-5ffd-9d47-c832dc1f6057';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('97ead77e-4bd2-512a-95e1-eed52aa2dadf', 'ee839452-13ab-5ffd-9d47-c832dc1f6057', 'A', 'Add a sedating antihistamine', false, 0),
  ('99a6a447-91a8-5a0e-a5ee-3492e85cca6a', 'ee839452-13ab-5ffd-9d47-c832dc1f6057', 'B', 'Add an antipsychotic', false, 1),
  ('cdbee6e8-667c-5e5f-b1a4-ba0bfa59962a', 'ee839452-13ab-5ffd-9d47-c832dc1f6057', 'C', 'Gradually reduce and stop the sedatives (hypnotics/benzodiazepines), with sleep hygiene and support', true, 2),
  ('3ff7e6b8-9c38-526d-bece-1fdbad988d89', 'ee839452-13ab-5ffd-9d47-c832dc1f6057', 'D', 'Stop both drugs abruptly', false, 3),
  ('698a2805-8d15-516f-9e49-427f3993d8cf', 'ee839452-13ab-5ffd-9d47-c832dc1f6057', 'E', 'Increase the zopiclone dose', false, 4);

-- Q472
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('921d9ade-c188-58bd-8a43-14830d79b50b', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000029', 'sba', 'An 86 year old woman with advanced frailty and heart failure is admitted for the third time in 3 months. She says she does not want to go back into hospital. What is the MOST appropriate step?', 'Advance care planning helps people express wishes about future care and treatment while they can. Tools such as ReSPECT record recommendations about treatment escalation and CPR. Consider palliative care referral and the Gold Standards Framework. Respect a capacitous person''s wish to avoid hospital admission, with community support.', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v3')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = '921d9ade-c188-58bd-8a43-14830d79b50b';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('1ac4b26e-68ec-56e0-941a-81d844ac4a53', '921d9ade-c188-58bd-8a43-14830d79b50b', 'A', 'Avoid discussing her wishes to protect her', false, 0),
  ('178cc704-5008-5180-b3b4-36a6815c2ed8', '921d9ade-c188-58bd-8a43-14830d79b50b', 'B', 'Advance care planning discussion, including treatment escalation plans and preferred place of care, and recording her wishes (e.g. ReSPECT form)', true, 1),
  ('0d3a953a-7eaf-5f55-b4f1-0f4204436b71', '921d9ade-c188-58bd-8a43-14830d79b50b', 'C', 'Ask her son to decide', false, 2),
  ('38bfeef8-3ee0-5728-b0d7-3e6be9de0293', '921d9ade-c188-58bd-8a43-14830d79b50b', 'D', 'Plan for ICU admission next time', false, 3),
  ('e0107b47-c8ee-51a6-8b9d-be4a245fdffb', '921d9ade-c188-58bd-8a43-14830d79b50b', 'E', 'Start a new medication only', false, 4);

-- Q473
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('a260c813-9fb0-5280-a17a-ac899ad63e62', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000034', 'sba', 'A 68 year old man takes sertraline and ibuprofen regularly. What is the MOST important interaction to be aware of?', 'SSRIs reduce platelet serotonin, impairing aggregation. Combined with NSAIDs, antiplatelets or anticoagulants, they substantially increase the risk of GI bleeding. Avoid the combination where possible, or give gastroprotection (PPI), especially in older people. Mirtazapine may be safer if bleeding risk is high.', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v3')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = 'a260c813-9fb0-5280-a17a-ac899ad63e62';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('c36cf604-2762-5419-94b2-0f297f763077', 'a260c813-9fb0-5280-a17a-ac899ad63e62', 'A', 'Hyperkalaemia', false, 0),
  ('6feb2c41-3454-5e80-80c1-7d065be9f40f', 'a260c813-9fb0-5280-a17a-ac899ad63e62', 'B', 'Serotonin syndrome', false, 1),
  ('453cc547-5d58-586e-b116-e3ea24dd7955', 'a260c813-9fb0-5280-a17a-ac899ad63e62', 'C', 'Hypoglycaemia', false, 2),
  ('78f88631-0441-548c-b27d-5804d87d65ab', 'a260c813-9fb0-5280-a17a-ac899ad63e62', 'D', 'Increased risk of GI bleeding (consider stopping the NSAID or adding a PPI)', true, 3),
  ('7cbaa049-072e-59e3-b4a1-8b7a94ad0e0e', 'a260c813-9fb0-5280-a17a-ac899ad63e62', 'E', 'Reduced effectiveness of sertraline', false, 4);

-- Q474
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('a857dbd1-5e98-5c07-95cd-901fe99ad765', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000034', 'sba', 'A 55 year old man takes azathioprine after a liver transplant. He is diagnosed with gout and started on allopurinol at a usual dose. Two weeks later he has severe pancytopenia. What is the explanation?', 'Xanthine oxidase breaks down 6-mercaptopurine (the active metabolite of azathioprine). Allopurinol (and febuxostat) block this, causing dangerous accumulation and bone marrow suppression. If they must be used together, the azathioprine dose is reduced to about a quarter under specialist guidance, with close FBC monitoring.', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v3')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = 'a857dbd1-5e98-5c07-95cd-901fe99ad765';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('e7961f41-fa89-5bd2-8d8e-0d404b446969', 'a857dbd1-5e98-5c07-95cd-901fe99ad765', 'A', 'Azathioprine induces allopurinol metabolism', false, 0),
  ('7a6bf6ef-039b-584c-9908-20aee1c18ea9', 'a857dbd1-5e98-5c07-95cd-901fe99ad765', 'B', 'Allopurinol inhibits xanthine oxidase, which metabolises azathioprine/6-mercaptopurine, causing toxic levels', true, 1),
  ('016cd12f-533a-576d-bcdb-31f709c42e0c', 'a857dbd1-5e98-5c07-95cd-901fe99ad765', 'C', 'Gout causes pancytopenia', false, 2),
  ('abd6117c-fba6-56ec-bf12-93d50a260848', 'a857dbd1-5e98-5c07-95cd-901fe99ad765', 'D', 'It is a coincidence', false, 3),
  ('69da63b2-4b7d-58ae-bda1-74461108bb62', 'a857dbd1-5e98-5c07-95cd-901fe99ad765', 'E', 'Allopurinol causes vitamin B12 deficiency', false, 4);

-- Q475
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('4b8668cf-803f-56f3-a1af-9a7f7b835b35', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000034', 'sba', 'A 58 year old man with angina takes isosorbide mononitrate. He asks for sildenafil for erectile dysfunction. What is the MOST important advice?', 'PDE-5 inhibitors (sildenafil, tadalafil) increase cGMP and, combined with nitrates (which also act through cGMP), can cause profound hypotension and death. They are also cautioned in recent MI, stroke and severe hypotension. Discuss alternatives (vacuum devices, alprostadil) with cardiology input.', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v3')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = '4b8668cf-803f-56f3-a1af-9a7f7b835b35';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('906c2809-0c53-5e20-ac16-52a2945dad51', '4b8668cf-803f-56f3-a1af-9a7f7b835b35', 'A', 'He should stop his antiplatelets', false, 0),
  ('3f540c72-89bc-5940-a717-eb8ed8357bad', '4b8668cf-803f-56f3-a1af-9a7f7b835b35', 'B', 'It is safe as long as he takes it at night', false, 1),
  ('acb0aef6-9069-5856-904c-e0e7eb5ee192', '4b8668cf-803f-56f3-a1af-9a7f7b835b35', 'C', 'Sildenafil is contraindicated with nitrates because of the risk of severe hypotension', true, 2),
  ('e5f39ef2-7b0b-5780-9bed-94962bcf2445', '4b8668cf-803f-56f3-a1af-9a7f7b835b35', 'D', 'He should double his nitrate dose', false, 3),
  ('c67b19e9-9e35-57c6-bbda-aa09fde1ec20', '4b8668cf-803f-56f3-a1af-9a7f7b835b35', 'E', 'There is no interaction', false, 4);

-- Q476
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('7f9d1faf-99e1-5ff0-9932-7d15e624e6ab', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000034', 'sba', 'A 70 year old man with COPD takes theophylline. He is given ciprofloxacin for a chest infection. Three days later he has nausea, palpitations and a seizure. What is the SINGLE most likely explanation?', 'Theophylline has a narrow therapeutic range. Its levels are raised by CYP1A2 inhibitors (ciprofloxacin, erythromycin, clarithromycin, fluvoxamine) and by heart failure and liver disease. Toxicity causes vomiting, arrhythmias, hypokalaemia and seizures. Smoking (CYP1A2 induction) lowers levels, so stopping smoking can cause toxicity.', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v3')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = '7f9d1faf-99e1-5ff0-9932-7d15e624e6ab';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('509393a6-3a77-501b-b896-3761f1d078d4', '7f9d1faf-99e1-5ff0-9932-7d15e624e6ab', 'A', 'Ciprofloxacin directly causes seizures only', false, 0),
  ('14b64c4c-48a4-589d-81ca-f43ea6da23bb', '7f9d1faf-99e1-5ff0-9932-7d15e624e6ab', 'B', 'Hypoglycaemia', false, 1),
  ('9aab5932-1c71-57fa-a02d-f7b4ab41f245', '7f9d1faf-99e1-5ff0-9932-7d15e624e6ab', 'C', 'Hyponatraemia', false, 2),
  ('1e4338bb-0064-567b-9c9b-c5a79c41a2a0', '7f9d1faf-99e1-5ff0-9932-7d15e624e6ab', 'D', 'Ciprofloxacin inhibits theophylline metabolism (CYP1A2), causing theophylline toxicity', true, 3),
  ('e984bd48-9faf-5ef2-aca7-3771a9cd9525', '7f9d1faf-99e1-5ff0-9932-7d15e624e6ab', 'E', 'Stroke', false, 4);

-- Q477
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('d46e069c-33ec-5ab6-a163-2aeab04697f2', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000034', 'sba', 'A 60 year old man takes clopidogrel after a coronary stent. He needs a PPI for gastroprotection. Which PPI is generally preferred?', 'Clopidogrel is a prodrug activated by CYP2C19. Omeprazole and esomeprazole inhibit CYP2C19 and may reduce its antiplatelet effect (MHRA advice). Lansoprazole or pantoprazole are preferred when gastroprotection is needed. Prasugrel and ticagrelor are not affected in the same way.', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v3')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = 'd46e069c-33ec-5ab6-a163-2aeab04697f2';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('2a4702b5-5ce3-594a-993d-a04e45caeb2c', 'd46e069c-33ec-5ab6-a163-2aeab04697f2', 'A', 'Omeprazole', false, 0),
  ('83163da2-c31c-5691-96f9-fe3a7a78d38d', 'd46e069c-33ec-5ab6-a163-2aeab04697f2', 'B', 'No PPI can be used with clopidogrel', false, 1),
  ('494cb490-558d-56bf-a6a9-1c2452cd41ba', 'd46e069c-33ec-5ab6-a163-2aeab04697f2', 'C', 'Esomeprazole', false, 2),
  ('dbda6fbf-ffbe-5f04-8657-989480aac8fb', 'd46e069c-33ec-5ab6-a163-2aeab04697f2', 'D', 'Ranitidine is the only option', false, 3),
  ('6a7af0b0-3e88-5b5a-a79a-51cdc42ae1c3', 'd46e069c-33ec-5ab6-a163-2aeab04697f2', 'E', 'Lansoprazole or pantoprazole (avoid omeprazole/esomeprazole)', true, 4);

-- Q478
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('ac5f3fe8-6461-5139-b739-0e986ab86291', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000034', 'sba', 'Which group of drugs requires routine therapeutic drug level monitoring because of a narrow therapeutic index?', 'Therapeutic drug monitoring is used for drugs with a narrow therapeutic index, variable kinetics and a clear concentration-effect relationship. Timing matters: lithium 12 hours after the dose; digoxin at least 6 hours post-dose; gentamicin by nomogram or trough; vancomycin trough levels; phenytoin corrected for low albumin.', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v3')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = 'ac5f3fe8-6461-5139-b739-0e986ab86291';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('cf337903-9c33-5d3f-b9de-b7b630fabded', 'ac5f3fe8-6461-5139-b739-0e986ab86291', 'A', 'Salbutamol, beclometasone and montelukast', false, 0),
  ('54b5bddf-344e-5b06-965f-f7da43f8d018', 'ac5f3fe8-6461-5139-b739-0e986ab86291', 'B', 'Omeprazole, metformin and sertraline', false, 1),
  ('ef1dfe4c-649a-5de7-bb07-3ca64a01504d', 'ac5f3fe8-6461-5139-b739-0e986ab86291', 'C', 'Lithium, phenytoin, digoxin, gentamicin, vancomycin and ciclosporin/tacrolimus', true, 2),
  ('6cad7844-3a28-574c-a649-c15095708b1b', 'ac5f3fe8-6461-5139-b739-0e986ab86291', 'D', 'Atorvastatin, ramipril and amlodipine', false, 3),
  ('93b4e751-fc27-5693-a102-c93163804dbb', 'ac5f3fe8-6461-5139-b739-0e986ab86291', 'E', 'Paracetamol, ibuprofen and amoxicillin', false, 4);

-- Q479
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('c374e927-7eda-558a-a3b7-81efa786fdad', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000034', 'sba', 'A 40 year old woman with epilepsy on phenytoin has low albumin (24 g/L) after a long illness. Her total phenytoin level is within the reference range, but she has nystagmus and ataxia. What is the SINGLE most likely explanation?', 'Phenytoin is highly protein-bound. In hypoalbuminaemia (and renal failure or pregnancy), the free (active) fraction rises, so a ''therapeutic'' total level can still cause toxicity. Measure free phenytoin or use a corrected level. Phenytoin also has zero-order kinetics at higher doses, so small dose increases can cause large rises in level.', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v3')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = 'c374e927-7eda-558a-a3b7-81efa786fdad';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('010bf912-a75f-590d-9969-92c96e5db38a', 'c374e927-7eda-558a-a3b7-81efa786fdad', 'A', 'She is not taking her phenytoin', false, 0),
  ('9402d0a5-1f65-552f-98aa-eae2068df94f', 'c374e927-7eda-558a-a3b7-81efa786fdad', 'B', 'The free (unbound) phenytoin level is raised because of low albumin, so she is toxic despite a ''normal'' total level', true, 1),
  ('1dad9d98-9ad0-543f-85bd-e0764dee62cf', 'c374e927-7eda-558a-a3b7-81efa786fdad', 'C', 'Phenytoin levels are always accurate regardless of albumin', false, 2),
  ('bfe448bc-d0f1-5edb-8db3-177ef4378c0c', 'c374e927-7eda-558a-a3b7-81efa786fdad', 'D', 'Her dose is too low', false, 3),
  ('d096cc6d-288f-58a0-a943-f5ec8324c816', 'c374e927-7eda-558a-a3b7-81efa786fdad', 'E', 'She has a cerebellar stroke only', false, 4);

-- Q480
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('47566cc3-a2bc-5abd-bb6e-0be4a66a5803', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000034', 'sba', 'A 30 year old woman is breastfeeding a 2 month old baby. She needs an antibiotic for a UTI. Which is generally considered compatible with breastfeeding?', 'Many antibiotics are compatible with breastfeeding (penicillins, cephalosporins, nitrofurantoin, trimethoprim short-term), though the infant should be watched for diarrhoea or thrush. Avoid nitrofurantoin if the infant has G6PD deficiency or is very young. Use resources such as the UK Drugs in Lactation Advisory Service (UKDILAS) or the LactMed database.', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v3')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = '47566cc3-a2bc-5abd-bb6e-0be4a66a5803';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('14d15415-3186-5bbd-a992-187575b8aa97', '47566cc3-a2bc-5abd-bb6e-0be4a66a5803', 'A', 'Co-trimoxazole in the first weeks of life', false, 0),
  ('205a5bfe-e56e-5bd7-8735-cf4bad246372', '47566cc3-a2bc-5abd-bb6e-0be4a66a5803', 'B', 'Chloramphenicol', false, 1),
  ('e709f23f-f5f4-5bf7-8069-87c5c291795c', '47566cc3-a2bc-5abd-bb6e-0be4a66a5803', 'C', 'Ciprofloxacin as first-line', false, 2),
  ('83a9d9cc-ad93-56fe-9b25-381850b41bab', '47566cc3-a2bc-5abd-bb6e-0be4a66a5803', 'D', 'Nitrofurantoin or cefalexin (short course), with monitoring of the infant', true, 3),
  ('90e5a71b-b638-5900-a5c1-d3439a864939', '47566cc3-a2bc-5abd-bb6e-0be4a66a5803', 'E', 'Tetracyclines long-term', false, 4);

-- Q481
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('d80b745f-67b8-5db5-be31-5e92f5d518f7', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000034', 'sba', 'A 68 year old man with CKD (eGFR 25) is prescribed a drug that is mainly renally excreted. What is the MOST appropriate approach?', 'Drugs that are renally cleared (gentamicin, vancomycin, DOACs, metformin, lithium, digoxin, LMWH, gabapentin, some antibiotics) need dose adjustment in renal impairment. The BNF uses eGFR for most drugs, but Cockcroft-Gault creatinine clearance for some (such as DOACs) and in people at extremes of weight. Avoid nephrotoxins where possible.', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v3')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = 'd80b745f-67b8-5db5-be31-5e92f5d518f7';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('8f156f93-a20e-5b8d-bf76-358350f0b3f8', 'd80b745f-67b8-5db5-be31-5e92f5d518f7', 'A', 'Use the standard adult dose', false, 0),
  ('0709eb6f-ea47-54de-bca6-15d3d6c1a809', 'd80b745f-67b8-5db5-be31-5e92f5d518f7', 'B', 'Avoid all drugs in CKD', false, 1),
  ('3641655b-d900-5508-9b16-fbe905adbdf4', 'd80b745f-67b8-5db5-be31-5e92f5d518f7', 'C', 'Double the dose to ensure effect', false, 2),
  ('ab855f2c-a5c8-5cd0-9f2e-3c0325928d0d', 'd80b745f-67b8-5db5-be31-5e92f5d518f7', 'D', 'Check the BNF/SPC for renal dose adjustment (reduce dose and/or frequency), using creatinine clearance where advised, and monitor', true, 3),
  ('8ce7129b-475b-566b-9574-4562a6ea9da7', 'd80b745f-67b8-5db5-be31-5e92f5d518f7', 'E', 'Give the drug IV only', false, 4);

-- Q482
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('6ba191a0-3334-5a7d-805c-3d47484045d4', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000034', 'sba', 'A 72 year old man was given levofloxacin for a chest infection. He now has sudden pain in his heel and cannot stand on tiptoe. He also takes prednisolone. What is the SINGLE most likely diagnosis?', 'Fluoroquinolones can cause tendinitis and tendon rupture (especially Achilles), particularly in older people, those on corticosteroids, and transplant or renal patients. The MHRA restricts their use. Other risks include aortic aneurysm and dissection, QT prolongation, peripheral neuropathy and C. difficile. Stop the drug at the first sign of tendon pain.', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v3')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = '6ba191a0-3334-5a7d-805c-3d47484045d4';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('51ee1321-62b4-59ae-8402-c8a947dfb774', '6ba191a0-3334-5a7d-805c-3d47484045d4', 'A', 'Fluoroquinolone-associated Achilles tendon rupture', true, 0),
  ('118f6bf6-6692-5c4b-a4e2-6765ea7bbdb5', '6ba191a0-3334-5a7d-805c-3d47484045d4', 'B', 'Plantar fasciitis', false, 1),
  ('9077f6e6-6786-5cd0-a72e-1ef1482deed7', '6ba191a0-3334-5a7d-805c-3d47484045d4', 'C', 'Gout', false, 2),
  ('c15227f3-aaf1-5995-a6e2-14877e65798b', '6ba191a0-3334-5a7d-805c-3d47484045d4', 'D', 'Calcaneal stress fracture', false, 3),
  ('deb3ec03-f57c-5b75-8d2a-045bba4fa052', '6ba191a0-3334-5a7d-805c-3d47484045d4', 'E', 'DVT', false, 4);

-- Q483
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('81e3045d-6ebf-591d-8582-c4f59293a351', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000034', 'sba', 'A 75 year old woman has taken nitrofurantoin long-term for recurrent UTIs. She now has progressive breathlessness and a dry cough. CT shows pulmonary fibrosis. What is the SINGLE most likely cause?', 'Nitrofurantoin can cause acute hypersensitivity pneumonitis or chronic pulmonary reactions (interstitial pneumonitis and fibrosis), plus hepatotoxicity and peripheral neuropathy, especially with long-term use. Monitor lung and liver function on long-term treatment. Other drugs causing pulmonary fibrosis: amiodarone, methotrexate, bleomycin and busulfan.', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v3')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = '81e3045d-6ebf-591d-8582-c4f59293a351';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('860c3bb3-7bbe-56dc-bb39-7ed9d8a6e7c3', '81e3045d-6ebf-591d-8582-c4f59293a351', 'A', 'Asthma', false, 0),
  ('2c28d41d-2a97-5298-9fd6-64617f2c215a', '81e3045d-6ebf-591d-8582-c4f59293a351', 'B', 'Lung cancer', false, 1),
  ('f1ae235a-c526-51cd-a04d-17fe62bcdbf8', '81e3045d-6ebf-591d-8582-c4f59293a351', 'C', 'Nitrofurantoin-induced pulmonary fibrosis (chronic pulmonary reaction)', true, 2),
  ('4895f35b-b747-54f0-83e1-eb2669d2e6ca', '81e3045d-6ebf-591d-8582-c4f59293a351', 'D', 'Heart failure', false, 3),
  ('fff471cb-fb88-5dd0-b29f-4cd0ba55bb13', '81e3045d-6ebf-591d-8582-c4f59293a351', 'E', 'Idiopathic pulmonary fibrosis only', false, 4);

-- Q484
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('53cb0996-409b-5ded-928e-aeead253a63b', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000034', 'sba', 'A 19 year old woman has sudden painful upward deviation of her eyes and neck twisting after being given metoclopramide for vomiting. What is the SINGLE most likely diagnosis?', 'Dopamine antagonists (metoclopramide, prochlorperazine, antipsychotics) can cause acute dystonia, especially in young women. Treat with an anticholinergic such as IV or IM procyclidine. The MHRA restricts metoclopramide to short-term use (up to 5 days) at low doses, and it is avoided in under-20s where possible because of the risk of extrapyramidal side effects.', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v3')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = '53cb0996-409b-5ded-928e-aeead253a63b';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('1e47a22f-e493-591d-8330-abd3026bbc67', '53cb0996-409b-5ded-928e-aeead253a63b', 'A', 'Serotonin syndrome', false, 0),
  ('4be14f83-603c-567a-8df3-976f6ae09430', '53cb0996-409b-5ded-928e-aeead253a63b', 'B', 'Tetanus', false, 1),
  ('31b10b59-5e0e-5c35-90ef-7d409d3545ff', '53cb0996-409b-5ded-928e-aeead253a63b', 'C', 'Seizure', false, 2),
  ('1dbc5d8e-88a2-581c-8e02-6a6a608b5179', '53cb0996-409b-5ded-928e-aeead253a63b', 'D', 'Acute dystonic reaction (oculogyric crisis)', true, 3),
  ('eadb4726-5de2-5d90-881b-d4a799c2b383', '53cb0996-409b-5ded-928e-aeead253a63b', 'E', 'Neuroleptic malignant syndrome', false, 4);

-- Q485
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('cd2e4500-1d31-5f44-98b7-364660a3739d', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000034', 'sba', 'A 30 year old woman with depression takes St John''s wort, bought over the counter. She also takes the combined pill. What is the MOST important advice?', 'St John''s wort induces CYP3A4 and P-glycoprotein, reducing levels of combined hormonal contraceptives, warfarin, ciclosporin, digoxin, antiretrovirals and some anticonvulsants. It also has serotonergic effects (risk of serotonin syndrome with SSRIs and triptans). Ask about herbal remedies in every drug history.', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v3')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = 'cd2e4500-1d31-5f44-98b7-364660a3739d';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('bbdf35a0-2d0f-53b0-9165-73ba3c973610', 'cd2e4500-1d31-5f44-98b7-364660a3739d', 'A', 'It is a vitamin and has no interactions', false, 0),
  ('858ba6b1-8165-5aa8-b56c-76cdd1e89d7d', 'cd2e4500-1d31-5f44-98b7-364660a3739d', 'B', 'St John''s wort is an enzyme inducer that can reduce the effectiveness of her contraceptive pill (and interacts with many drugs)', true, 1),
  ('504e4b89-57d8-545d-8ec6-88969ac55e1b', 'cd2e4500-1d31-5f44-98b7-364660a3739d', 'C', 'It must be taken with grapefruit', false, 2),
  ('88071786-3dfc-52d4-b31e-e7f52bff86d6', 'cd2e4500-1d31-5f44-98b7-364660a3739d', 'D', 'It is safe to take with SSRIs', false, 3),
  ('85c136ec-043a-5dad-8e93-67bfc376b522', 'cd2e4500-1d31-5f44-98b7-364660a3739d', 'E', 'It increases the effect of the pill', false, 4);

-- Q486
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('f5592f9c-2293-576c-aeef-03af11e660d2', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000034', 'sba', 'A 52 year old man with hyperlipidaemia takes simvastatin 40 mg. He enjoys drinking a lot of grapefruit juice. What is the risk?', 'Grapefruit juice inhibits intestinal CYP3A4, raising levels of simvastatin, atorvastatin (to a lesser extent), some calcium channel blockers (felodipine), ciclosporin and others. Advise avoiding large amounts. Pravastatin and rosuvastatin are less affected. Simvastatin doses are also limited with amlodipine, diltiazem, verapamil and amiodarone.', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v3')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = 'f5592f9c-2293-576c-aeef-03af11e660d2';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('40b8bc33-8900-5fd9-a539-883580856642', 'f5592f9c-2293-576c-aeef-03af11e660d2', 'A', 'It causes hypoglycaemia', false, 0),
  ('6c5ab439-f666-51cc-8898-4ddc020f0c28', 'f5592f9c-2293-576c-aeef-03af11e660d2', 'B', 'It causes bleeding', false, 1),
  ('f8b50ef2-d43d-5f56-9f6c-dec8d3131e3b', 'f5592f9c-2293-576c-aeef-03af11e660d2', 'C', 'Grapefruit reduces statin effect', false, 2),
  ('94f68774-7447-50da-845b-a00f22a03dad', 'f5592f9c-2293-576c-aeef-03af11e660d2', 'D', 'No interaction', false, 3),
  ('84e2e913-4ec2-507e-a98c-cce12a676a59', 'f5592f9c-2293-576c-aeef-03af11e660d2', 'E', 'Grapefruit juice inhibits CYP3A4, raising simvastatin levels and the risk of myopathy/rhabdomyolysis', true, 4);

-- Q487
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('2e29309b-976a-53e0-addc-f6d26a2b28f7', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000034', 'sba', 'A 45 year old man has hypertension on amlodipine. He also takes furosemide for oedema. He now has tinnitus and hearing loss after being given IV furosemide rapidly at a high dose. What is the explanation?', 'Loop diuretics (especially at high doses given rapidly IV, in renal impairment, or with aminoglycosides) can cause ototoxicity (tinnitus, hearing loss), which is usually reversible. Infusion rates should be limited (for furosemide, no more than 4 mg/min). Other side effects include hypokalaemia, hyponatraemia, hypovolaemia, gout and hyperglycaemia.', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v3')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = '2e29309b-976a-53e0-addc-f6d26a2b28f7';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('633205e1-9aae-5d8d-a1b4-b432825a4544', '2e29309b-976a-53e0-addc-f6d26a2b28f7', 'A', 'Ear wax', false, 0),
  ('679a481d-e9cd-5929-8c54-c465a26fc3f4', '2e29309b-976a-53e0-addc-f6d26a2b28f7', 'B', 'Acoustic neuroma', false, 1),
  ('dca6b8ff-dcb4-5df4-bf74-24b3eb01baeb', '2e29309b-976a-53e0-addc-f6d26a2b28f7', 'C', 'Ototoxicity from rapid high-dose IV loop diuretic (worse with aminoglycosides or renal impairment)', true, 2),
  ('74e77e4e-9d51-5daf-bc0c-5302b02e3a11', '2e29309b-976a-53e0-addc-f6d26a2b28f7', 'D', 'Ménière''s disease', false, 3),
  ('8319a976-05a0-5ca4-bacf-245b8554b682', '2e29309b-976a-53e0-addc-f6d26a2b28f7', 'E', 'Amlodipine toxicity', false, 4);

-- Q488
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('bcf3be8a-0b28-590c-9f98-3faf15280b38', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000034', 'sba', 'A 26 year old woman with epilepsy takes lamotrigine and starts the combined pill. Her seizures become more frequent. What is the SINGLE most likely explanation?', 'Combined hormonal contraceptives reduce lamotrigine levels (via induction of glucuronidation), which can lead to breakthrough seizures. Lamotrigine levels then rise during the pill-free interval, which can cause toxicity. Consider a non-oestrogen method (IUD, IUS, implant, injection) or monitor and adjust the dose. Enzyme-inducing anticonvulsants reduce contraceptive effectiveness.', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v3')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = 'bcf3be8a-0b28-590c-9f98-3faf15280b38';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('e7f6e963-41b9-53db-91a5-53865008c353', 'bcf3be8a-0b28-590c-9f98-3faf15280b38', 'A', 'Ethinylestradiol increases lamotrigine metabolism (glucuronidation), lowering lamotrigine levels', true, 0),
  ('e9d65c4c-71f2-515d-b5af-ec5f5bb959f3', 'bcf3be8a-0b28-590c-9f98-3faf15280b38', 'B', 'Hypoglycaemia', false, 1),
  ('d7b93bbf-f5a4-5083-8580-af42b1318683', 'bcf3be8a-0b28-590c-9f98-3faf15280b38', 'C', 'She has stopped taking lamotrigine', false, 2),
  ('e934aff9-65cd-5e58-acd9-b26315621502', 'bcf3be8a-0b28-590c-9f98-3faf15280b38', 'D', 'Lamotrigine reduces the effectiveness of the pill', false, 3),
  ('86d2efba-c2e7-52b2-9253-6ea3dfaec872', 'bcf3be8a-0b28-590c-9f98-3faf15280b38', 'E', 'The pill directly causes seizures', false, 4);

-- Q489
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('574e9031-dce5-5ed6-b664-04b42e19bc1b', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000017', 'sba', 'A 66 year old woman with metastatic breast cancer takes oral modified-release morphine 45 mg twice daily with good pain control. She needs to switch to oral oxycodone because of side effects. What is an equivalent total daily dose of oral oxycodone?', 'Oral oxycodone is roughly 1.5-2 times as potent as oral morphine. 90 mg/day of oral morphine is equivalent to about 45-60 mg/day of oral oxycodone. When switching opioids because of side effects, it is common to reduce the calculated dose by 25-50% for incomplete cross-tolerance, then titrate. Always check local conversion guidance.', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v3')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = '574e9031-dce5-5ed6-b664-04b42e19bc1b';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('95c64e36-fce3-5efd-b060-3d1a5e5feae6', '574e9031-dce5-5ed6-b664-04b42e19bc1b', 'A', '15 mg per day', false, 0),
  ('c7c9f378-afcf-5c2d-b71b-d2fd6d9fa23d', '574e9031-dce5-5ed6-b664-04b42e19bc1b', 'B', '45 mg twice daily', false, 1),
  ('1836dd11-7da5-58cd-af59-04c88825ae3b', '574e9031-dce5-5ed6-b664-04b42e19bc1b', 'C', '45 mg per day (about 22.5 mg twice daily) as a starting point', true, 2),
  ('21293142-1682-5793-ade6-02f2205075c9', '574e9031-dce5-5ed6-b664-04b42e19bc1b', 'D', '90 mg per day', false, 3),
  ('f07366c5-0cd8-5779-88b0-d6922c7b33fa', '574e9031-dce5-5ed6-b664-04b42e19bc1b', 'E', '180 mg per day', false, 4);

-- Q490
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('2d1a9adf-5ed7-5a90-aa0a-111e00012416', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000017', 'sba', 'A 70 year old man with lung cancer takes 120 mg/24 hours of oral morphine and has stable pain. He cannot swallow tablets reliably, and a transdermal fentanyl patch is being considered. Which statement is CORRECT?', 'Transdermal fentanyl suits stable pain and people who cannot take oral medicines or who have renal impairment. A 12 microgram/hour patch is about 30-45 mg/day oral morphine, and 25 microgram/hour is about 60-90 mg/day. Patches are changed every 72 hours and take 12-24 hours to work. Fever, heat pads and hot baths increase absorption. Continue the previous opioid for the first 12 hours. Breakthrough doses are still needed.', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v3')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = '2d1a9adf-5ed7-5a90-aa0a-111e00012416';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('b1f5ad18-3587-5a4f-a4a0-cc329dd518a3', '2d1a9adf-5ed7-5a90-aa0a-111e00012416', 'A', 'Fentanyl patches are ideal for unstable, rapidly changing pain', false, 0),
  ('05d358ce-667a-5b2d-8f27-34af8afc9c95', '2d1a9adf-5ed7-5a90-aa0a-111e00012416', 'B', 'A fentanyl 50 microgram/hour patch is approximately equivalent to 120 mg/day oral morphine; it takes 12-24 hours to reach steady state', true, 1),
  ('9056a1b9-f8b3-5b99-bda0-fb81bf1fce2e', '2d1a9adf-5ed7-5a90-aa0a-111e00012416', 'C', 'Fentanyl patches act within 30 minutes', false, 2),
  ('f0d2e37a-05a3-5c01-954b-e8078f5fa5dc', '2d1a9adf-5ed7-5a90-aa0a-111e00012416', 'D', 'A 12 microgram/hour patch equals 200 mg/day oral morphine', false, 3),
  ('8e576ee3-30c5-5b09-bf2f-faf3c3fa54bd', '2d1a9adf-5ed7-5a90-aa0a-111e00012416', 'E', 'Patches can be cut in half to reduce the dose', false, 4);

-- Q491
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('d98dc68f-ac9f-546d-850a-0b7ea9dfd563', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000017', 'sba', 'A 60 year old man with advanced cancer is going home to die. The palliative care team prescribe ''anticipatory'' (just-in-case) medicines. Which set of drugs is typically included?', 'Anticipatory medicines are prescribed in advance so common end-of-life symptoms (pain, breathlessness, agitation, nausea and vomiting, respiratory secretions) can be treated promptly at home by community nurses. They are given subcutaneously as needed, with a syringe driver if needs persist.', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v3')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = 'd98dc68f-ac9f-546d-850a-0b7ea9dfd563';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('0aaaa7e6-899f-57ac-bf4f-258fe2cfc91e', 'd98dc68f-ac9f-546d-850a-0b7ea9dfd563', 'A', 'Oral antibiotics and steroids', false, 0),
  ('3c7ed181-cb03-5f16-90ab-db12662ab231', 'd98dc68f-ac9f-546d-850a-0b7ea9dfd563', 'B', 'A subcutaneous opioid (pain/breathlessness), midazolam (agitation/anxiety), an antiemetic (e.g. levomepromazine or haloperidol) and an antisecretory drug (e.g. glycopyrronium or hyoscine butylbromide)', true, 1),
  ('69003599-ed3b-50f3-ab82-954eaa264a6d', 'd98dc68f-ac9f-546d-850a-0b7ea9dfd563', 'C', 'Antidepressants and statins', false, 2),
  ('1b454c72-b46e-52c8-bb0f-b142f239add2', 'd98dc68f-ac9f-546d-850a-0b7ea9dfd563', 'D', 'IV fluids and insulin', false, 3),
  ('9f4152f8-a6f5-590c-a4bb-df9bdf754bf3', 'd98dc68f-ac9f-546d-850a-0b7ea9dfd563', 'E', 'Warfarin and aspirin', false, 4);

-- Q492
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('374a333e-0b6d-53fd-a490-cc7eb4d9a870', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000017', 'sba', 'A 78 year old man with metastatic prostate cancer on high-dose morphine is drowsy, confused and has myoclonic jerks. His renal function has worsened. His respiratory rate is 14/min and his pupils are small. What is the SINGLE most appropriate action?', 'Opioid toxicity (drowsiness, confusion, myoclonus, hallucinations, pinpoint pupils) is often caused by declining renal function. Reduce or switch the opioid and look for causes (AKI, infection, hypercalcaemia). Naloxone is only for life-threatening respiratory depression (RR below 8). Give small titrated doses, as a full reversal causes severe pain and withdrawal.', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v3')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = '374a333e-0b6d-53fd-a490-cc7eb4d9a870';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('ccbffffa-5a25-559f-b5b3-afab8208e938', '374a333e-0b6d-53fd-a490-cc7eb4d9a870', 'A', 'Increase the morphine dose', false, 0),
  ('84c1f1f9-f6e5-5725-a469-2792f63409d9', '374a333e-0b6d-53fd-a490-cc7eb4d9a870', 'B', 'Stop all analgesia permanently', false, 1),
  ('91b2553a-1172-52a0-83ad-bc1651ad1ce0', '374a333e-0b6d-53fd-a490-cc7eb4d9a870', 'C', 'Add a benzodiazepine', false, 2),
  ('1d1103aa-a993-5e71-a1e4-1c6dde900349', '374a333e-0b6d-53fd-a490-cc7eb4d9a870', 'D', 'Reduce the opioid dose (or switch to an alternative such as oxycodone/alfentanil), hydrate and look for reversible causes', true, 3),
  ('4a54fa25-f6d7-5036-9f79-9680ef2e9120', '374a333e-0b6d-53fd-a490-cc7eb4d9a870', 'E', 'Give a full IV bolus of naloxone 2 mg', false, 4);

-- Q493
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('1a8128c5-4565-5cc8-852b-dd29e7a9b815', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000017', 'sba', 'A 70 year old man with advanced cancer has severe, persistent hiccups that stop him eating and sleeping. Reversible causes have been addressed. Which drug can help?', 'Persistent hiccups in palliative care can come from gastric distension, diaphragmatic irritation, uraemia, hyponatraemia, CNS lesions or drugs (steroids). Treat the cause (antifoaming agents, prokinetics for gastric stasis). Drugs that may help include baclofen, chlorpromazine, haloperidol, metoclopramide and gabapentin.', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v3')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = '1a8128c5-4565-5cc8-852b-dd29e7a9b815';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('c2899b91-ca10-59c4-bc4d-3197d3b238d8', '1a8128c5-4565-5cc8-852b-dd29e7a9b815', 'A', 'Amlodipine', false, 0),
  ('909970ae-92eb-5e98-bca1-e67d3b224aed', '1a8128c5-4565-5cc8-852b-dd29e7a9b815', 'B', 'Ibuprofen', false, 1),
  ('f195ca9c-4b11-5b54-8a64-2a88d028ec9e', '1a8128c5-4565-5cc8-852b-dd29e7a9b815', 'C', 'Furosemide', false, 2),
  ('d5ecc8a8-82aa-55a7-a9d7-b9adf5b2cd3d', '1a8128c5-4565-5cc8-852b-dd29e7a9b815', 'D', 'Baclofen (or chlorpromazine, haloperidol, metoclopramide)', true, 3),
  ('70ad4c31-b5a3-5926-bd19-f0a5512ae364', '1a8128c5-4565-5cc8-852b-dd29e7a9b815', 'E', 'Paracetamol', false, 4);

-- Q494
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('7713d384-1af0-59bb-a519-c99b2df778d0', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000017', 'sba', 'A 65 year old woman with pancreatic cancer has obstructive jaundice and severe generalised itching. A biliary stent cannot be placed. Which treatment is MOST likely to help the itch?', 'Cholestatic itch is best relieved by biliary drainage (stent). If not possible, options include sertraline, rifampicin, naltrexone (avoid with opioid analgesia) and colestyramine (needs some bile flow). Sedating antihistamines mainly help sleep. Use emollients and keep the skin cool.', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v3')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = '7713d384-1af0-59bb-a519-c99b2df778d0';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('1172a2d7-b681-5f0d-acdd-2446fbebadeb', '7713d384-1af0-59bb-a519-c99b2df778d0', 'A', 'Calamine only', false, 0),
  ('827ea91a-6505-5e9f-9142-a7d996530d24', '7713d384-1af0-59bb-a519-c99b2df778d0', 'B', 'Topical steroids all over the body', false, 1),
  ('8337c9b8-7bc3-5457-82b7-4f267d6397b7', '7713d384-1af0-59bb-a519-c99b2df778d0', 'C', 'Colestyramine is often ineffective with complete obstruction; consider sertraline, rifampicin or naltrexone under specialist advice', true, 2),
  ('9bd6ca4b-e508-54c7-a27d-799d1e0b608c', '7713d384-1af0-59bb-a519-c99b2df778d0', 'D', 'Morphine', false, 3),
  ('6af8604d-19c2-5dca-b6ff-7b9c34ce8e3e', '7713d384-1af0-59bb-a519-c99b2df778d0', 'E', 'High-dose antihistamines are the most effective', false, 4);

-- Q495
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('98f2eae5-885a-561f-a626-9e4b2941ab3a', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000017', 'sba', 'A 58 year old woman with metastatic breast cancer has a painful bone metastasis in her femur that is not controlled by analgesia. Imaging shows no fracture. What is the SINGLE most effective treatment for localised bone pain?', 'Single-fraction palliative radiotherapy gives good pain relief for bone metastases in most patients within weeks. Long bones with high fracture risk (assessed by the Mirels score) may need prophylactic fixation. NSAIDs, opioids and bisphosphonates or denosumab are also used. Pathological fractures need orthopaedic review.', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v3')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = '98f2eae5-885a-561f-a626-9e4b2941ab3a';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('af9ad75a-9ea7-5f17-927d-522bc9f15ca0', '98f2eae5-885a-561f-a626-9e4b2941ab3a', 'A', 'Surgical amputation', false, 0),
  ('377b6d25-50ad-5556-bfe3-4f104d0682e4', '98f2eae5-885a-561f-a626-9e4b2941ab3a', 'B', 'Bed rest', false, 1),
  ('6911d1ca-f34f-50f3-9ee6-ebca8f1251a4', '98f2eae5-885a-561f-a626-9e4b2941ab3a', 'C', 'Palliative radiotherapy (often a single 8 Gy fraction)', true, 2),
  ('11e08894-9eb3-5819-8f90-533dde9e468a', '98f2eae5-885a-561f-a626-9e4b2941ab3a', 'D', 'IV fluids', false, 3),
  ('2b6e0f79-0a3e-547b-a5f8-89e131cadcf1', '98f2eae5-885a-561f-a626-9e4b2941ab3a', 'E', 'Increase opioids indefinitely', false, 4);

-- Q496
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('d5f386ac-2416-58eb-b643-fa9ce8d9184e', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000017', 'sba', 'A 72 year old man with advanced cancer has lost his appetite and weight, and he and his family are distressed. He has weeks to months to live. Which drug can temporarily improve appetite?', 'Anorexia-cachexia is common in advanced cancer and is not fully reversed by feeding. A short course of dexamethasone can improve appetite and wellbeing, but effects fade within weeks, with side effects (hyperglycaemia, myopathy, insomnia). Progestogens can increase appetite and weight but carry a thrombosis risk. Support the family and focus on comfort rather than forced feeding.', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v3')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = 'd5f386ac-2416-58eb-b643-fa9ce8d9184e';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('6598218c-bed9-58d3-80f9-b17e528d19b7', 'd5f386ac-2416-58eb-b643-fa9ce8d9184e', 'A', 'A short course of a corticosteroid (e.g. dexamethasone)', true, 0),
  ('13f9a4a9-51a8-545a-a7d7-7216d1935dde', 'd5f386ac-2416-58eb-b643-fa9ce8d9184e', 'B', 'Long-term high-dose megestrol in all', false, 1),
  ('f2ffb1bb-1274-5923-9edc-e5bc74652991', 'd5f386ac-2416-58eb-b643-fa9ce8d9184e', 'C', 'Thyroxine', false, 2),
  ('d654785e-d994-5bf6-ad5b-4bea33f15f88', 'd5f386ac-2416-58eb-b643-fa9ce8d9184e', 'D', 'Insulin', false, 3),
  ('86458d1e-05ab-54ad-8a3e-7134412e5093', 'd5f386ac-2416-58eb-b643-fa9ce8d9184e', 'E', 'Ondansetron', false, 4);

-- Q497
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('bf93e6a3-9092-5ed3-9f99-fda8809d22ce', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000017', 'sba', 'A 60 year old man with a brain tumour has persistent nausea and vomiting with headache, worse in the morning. What is the SINGLE most appropriate antiemetic choice?', 'Nausea from raised intracranial pressure is treated with cyclizine (an antihistamine acting on the vomiting centre) and dexamethasone to reduce oedema. Choose antiemetics by cause: chemical (haloperidol), gastric stasis (metoclopramide), vestibular or ICP (cyclizine), chemotherapy (5-HT3 antagonist plus dexamethasone), and broad-spectrum or refractory (levomepromazine).', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v3')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = 'bf93e6a3-9092-5ed3-9f99-fda8809d22ce';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('6c70f8ae-ddb9-5a4b-92af-212c5bc4bf6f', 'bf93e6a3-9092-5ed3-9f99-fda8809d22ce', 'A', 'Metoclopramide', false, 0),
  ('695367f0-c76f-535e-a7fd-e235f2449774', 'bf93e6a3-9092-5ed3-9f99-fda8809d22ce', 'B', 'Domperidone', false, 1),
  ('cb387449-3ab1-5b3d-8868-ae148342dddd', 'bf93e6a3-9092-5ed3-9f99-fda8809d22ce', 'C', 'Cyclizine, with dexamethasone to reduce cerebral oedema', true, 2),
  ('de43a283-83fb-5079-9988-aaf96e3025b3', 'bf93e6a3-9092-5ed3-9f99-fda8809d22ce', 'D', 'Ondansetron only', false, 3),
  ('6e8a4607-d097-5a1a-8f87-7dcca3b51f31', 'bf93e6a3-9092-5ed3-9f99-fda8809d22ce', 'E', 'Senna', false, 4);

-- Q498
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('14d1848e-6116-586d-a589-05b04655ef17', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000017', 'sba', 'A 45 year old woman has metastatic cancer. Her doctor needs to tell her that her disease has progressed and further chemotherapy will not help. Which approach to breaking bad news is recommended?', 'The SPIKES protocol: choose a private setting with time and support; find out what she already understands; ask how much she wants to know; give information clearly in small chunks with a warning shot; respond to emotions with empathy; summarise and agree a plan. Avoid jargon and false reassurance.', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v3')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = '14d1848e-6116-586d-a589-05b04655ef17';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('1c5098f9-cedb-5446-bc12-1c3654d06d46', '14d1848e-6116-586d-a589-05b04655ef17', 'A', 'Give all the information quickly at the bedside on a ward round', false, 0),
  ('125ae53d-561d-5963-8729-e0471ca0bcbb', '14d1848e-6116-586d-a589-05b04655ef17', 'B', 'A structured approach such as SPIKES: Setting, Perception, Invitation, Knowledge, Emotions/Empathy, Strategy/Summary', true, 1),
  ('53c8b068-da0c-5f00-8c5e-d8f410c88a8a', '14d1848e-6116-586d-a589-05b04655ef17', 'C', 'Tell her family first and let them decide whether to tell her', false, 2),
  ('72b13d99-8165-533d-92d0-90053aff9d45', '14d1848e-6116-586d-a589-05b04655ef17', 'D', 'Avoid using clear words like ''cancer''', false, 3),
  ('cd9ec4fa-1a27-5a9f-aad6-03e3c1173d11', '14d1848e-6116-586d-a589-05b04655ef17', 'E', 'Give the news by letter', false, 4);

-- Q499
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('965a6962-0209-5ecc-b8e7-c116b5f57076', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000017', 'sba', 'A 75 year old man is dying of lung cancer and has terminal agitation and restlessness. Reversible causes (urinary retention, constipation, pain) have been addressed. What is the SINGLE most appropriate medication?', 'Terminal agitation or restlessness is managed after excluding reversible causes. Subcutaneous midazolam is first-line, given as needed or by continuous infusion. Add levomepromazine or haloperidol if delirium is present. Provide a calm environment and family support.', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v3')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = '965a6962-0209-5ecc-b8e7-c116b5f57076';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('2ac56881-579a-52bc-8a1d-4acd130f2fe6', '965a6962-0209-5ecc-b8e7-c116b5f57076', 'A', 'IM chlorpromazine as first-line', false, 0),
  ('4da36191-cd94-5f34-8309-2f83f662d168', '965a6962-0209-5ecc-b8e7-c116b5f57076', 'B', 'IV phenytoin', false, 1),
  ('ddae756d-a08d-5865-9775-1abcc0aa9f90', '965a6962-0209-5ecc-b8e7-c116b5f57076', 'C', 'Oral diazepam tablets', false, 2),
  ('5c403c10-6f2f-57fa-869a-64a3f63fe679', '965a6962-0209-5ecc-b8e7-c116b5f57076', 'D', 'Oral zopiclone', false, 3),
  ('c89d0b44-451f-5c2f-9e02-2e9b7d06fb75', '965a6962-0209-5ecc-b8e7-c116b5f57076', 'E', 'Subcutaneous midazolam (with levomepromazine or haloperidol if delirium/agitation persists)', true, 4);

-- Q500
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('c64b6dee-4f45-5d4d-bea9-cd4eb9ec08b6', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000017', 'sba', 'A 70 year old woman with motor neurone disease has started noninvasive ventilation. She tells her team that she wants to stop it, knowing she will probably die. She has capacity. What is the CORRECT approach?', 'A person with capacity can refuse or withdraw any treatment, including life-sustaining treatment, even if this will lead to death. This is not assisted suicide. Explore her reasons and make sure she is informed. Plan withdrawal with the specialist palliative care team, with anticipatory medication to manage breathlessness and distress.', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v3')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = 'c64b6dee-4f45-5d4d-bea9-cd4eb9ec08b6';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('7648a75f-fe18-5a43-85ba-ae99f427ee7b', 'c64b6dee-4f45-5d4d-bea9-cd4eb9ec08b6', 'A', 'Ask her family to decide', false, 0),
  ('b773bc00-2f49-5327-8eb6-ba4d6537d462', 'c64b6dee-4f45-5d4d-bea9-cd4eb9ec08b6', 'B', 'Request a court order', false, 1),
  ('32d0e05e-977e-548f-8664-e2778c0eb37b', 'c64b6dee-4f45-5d4d-bea9-cd4eb9ec08b6', 'C', 'Respect her decision, explore her reasons, and plan withdrawal with symptom control (e.g. opioids and benzodiazepines)', true, 2),
  ('0a1f2ca5-548a-5625-84d3-8a2fffc4e30f', 'c64b6dee-4f45-5d4d-bea9-cd4eb9ec08b6', 'D', 'Refuse because stopping would cause her death', false, 3),
  ('b7c34fb7-4e28-59f9-8c4f-02715c5fe4ee', 'c64b6dee-4f45-5d4d-bea9-cd4eb9ec08b6', 'E', 'Transfer her to ICU', false, 4);

-- Q501
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('8478dc9d-d993-5ce6-bddb-448749297df8', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000017', 'sba', 'A 78 year old man with advanced COPD and heart failure is likely in the last year of life. Which tool can help identify patients who may benefit from a palliative care approach?', 'The ''surprise question'' (''Would you be surprised if this patient died in the next 12 months?'') and tools like SPICT and the Gold Standards Framework prognostic indicator help identify people approaching the end of life. This allows advance care planning, palliative care register inclusion and coordinated care.', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v3')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = '8478dc9d-d993-5ce6-bddb-448749297df8';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('46307846-572b-5e16-a6de-9d4edbd1cff8', '8478dc9d-d993-5ce6-bddb-448749297df8', 'A', 'Wells score', false, 0),
  ('1e8aaeda-bd5b-5e77-9b7b-6cceebc363ea', '8478dc9d-d993-5ce6-bddb-448749297df8', 'B', 'NEWS2 only', false, 1),
  ('7ef1043a-8a27-5ba3-85fa-b2924d25b6a7', '8478dc9d-d993-5ce6-bddb-448749297df8', 'C', 'CURB-65', false, 2),
  ('35827fd5-951b-5eff-87a1-02bfc8639c69', '8478dc9d-d993-5ce6-bddb-448749297df8', 'D', 'The Supportive and Palliative Care Indicators Tool (SPICT), or the ''surprise question''', true, 3),
  ('794d73f6-b7dc-5e5c-a7c3-75f2d98c9034', '8478dc9d-d993-5ce6-bddb-448749297df8', 'E', 'MMSE', false, 4);

-- Q502
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('da8cdecd-f8b7-59df-9f53-1d749f5d8b90', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000017', 'sba', 'A 66 year old man with advanced cancer has a large malignant ascites causing discomfort and breathlessness. What is the SINGLE most appropriate management?', 'Malignant ascites (often from ovarian, GI or breast cancer) is managed with paracentesis for symptom relief. If it recurs frequently, an indwelling tunnelled peritoneal catheter (such as PleurX) allows drainage at home. Diuretics (spironolactone) help less than in cirrhotic ascites, but may help if serum-ascites albumin gradient is high.', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v3')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = 'da8cdecd-f8b7-59df-9f53-1d749f5d8b90';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('2bb8e0c6-27cd-5f3e-9e89-ff6a2b974a34', 'da8cdecd-f8b7-59df-9f53-1d749f5d8b90', 'A', 'High-dose furosemide alone', false, 0),
  ('51b81a38-4c10-50ad-9ea3-d7c590e4a7e7', 'da8cdecd-f8b7-59df-9f53-1d749f5d8b90', 'B', 'Surgery to remove the tumour', false, 1),
  ('d7296009-8e0c-541b-8573-ef6ab7e2cbe0', 'da8cdecd-f8b7-59df-9f53-1d749f5d8b90', 'C', 'Antibiotics', false, 2),
  ('af1fc710-ebcb-5d0b-9226-0925c8bc9c14', 'da8cdecd-f8b7-59df-9f53-1d749f5d8b90', 'D', 'Fluid restriction only', false, 3),
  ('ba9721ca-bebe-5e33-bb75-7cf466b2f78b', 'da8cdecd-f8b7-59df-9f53-1d749f5d8b90', 'E', 'Therapeutic paracentesis (with consideration of an indwelling drain for recurrent ascites)', true, 4);

-- Q503
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('d2541eac-2448-52a8-bf2e-fb8ca30e519d', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000017', 'sba', 'A 75 year old woman with advanced cancer is anxious and distressed in her last weeks of life. She cannot swallow tablets easily. Which drug can be used for acute anxiety?', 'Anxiety is common at the end of life. Address the causes (fears, pain, breathlessness) with support and non-drug measures. For acute anxiety or panic, short-acting benzodiazepines are used: sublingual lorazepam, or buccal or subcutaneous midazolam. For longer-term anxiety or depression in patients with months to live, an SSRI or mirtazapine can be used.', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v3')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = 'd2541eac-2448-52a8-bf2e-fb8ca30e519d';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('93d00b15-662b-5d23-aa40-c4c0707528c7', 'd2541eac-2448-52a8-bf2e-fb8ca30e519d', 'A', 'Propranolol', false, 0),
  ('f9efb4a6-9497-5afd-b31c-da86724f7794', 'd2541eac-2448-52a8-bf2e-fb8ca30e519d', 'B', 'IV phenobarbital', false, 1),
  ('36ba857d-c8e8-518f-97d1-d1a07cfee4c9', 'd2541eac-2448-52a8-bf2e-fb8ca30e519d', 'C', 'Oral zopiclone', false, 2),
  ('3adb54bd-8d00-598e-8ff1-4a0a2857515a', 'd2541eac-2448-52a8-bf2e-fb8ca30e519d', 'D', 'Sublingual lorazepam (or buccal/subcutaneous midazolam)', true, 3),
  ('755987b6-d255-5e3a-b37d-23af9c367cce', 'd2541eac-2448-52a8-bf2e-fb8ca30e519d', 'E', 'Oral fluoxetine', false, 4);

-- Q504
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('a7c67c12-6c03-53b1-bc07-504919eafe5e', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000017', 'sba', 'A 60 year old man with head and neck cancer has a tumour near his carotid artery and small ''herald'' bleeds. What is the SINGLE most appropriate plan for a possible catastrophic bleed?', 'A catastrophic terminal haemorrhage is usually rapidly fatal. Plans focus on comfort and dignity: dark towels to reduce visible blood, staying with the patient, and crisis medication (midazolam) for distress if time allows. Discuss in advance where appropriate. Herald bleeds may allow interventional or surgical options in some cases.', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v3')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = 'a7c67c12-6c03-53b1-bc07-504919eafe5e';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('104bb11d-7159-580a-b35c-679f0fed5de8', 'a7c67c12-6c03-53b1-bc07-504919eafe5e', 'A', 'Leave the patient alone if it happens', false, 0),
  ('3497ceab-4908-5f85-9256-a26221ee18db', 'a7c67c12-6c03-53b1-bc07-504919eafe5e', 'B', 'Prepare: dark towels nearby, a crisis sedative (e.g. midazolam) available for distress, and a discussion with the patient and family', true, 1),
  ('9b5c30a5-a22c-5fb5-b17c-19cc04bf416f', 'a7c67c12-6c03-53b1-bc07-504919eafe5e', 'C', 'Daily IV tranexamic acid only', false, 2),
  ('a42b930b-e801-50cd-966a-f40e8768a855', 'a7c67c12-6c03-53b1-bc07-504919eafe5e', 'D', 'CPR if a bleed occurs', false, 3),
  ('077ce7a4-1ba3-51a1-b890-1f5ead3c78c8', 'a7c67c12-6c03-53b1-bc07-504919eafe5e', 'E', 'Plan an urgent blood transfusion at home', false, 4);

-- Q505
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('832f1616-e6cd-54aa-8119-72201c2ca23e', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000017', 'sba', 'A 55 year old woman with advanced lung cancer is bed-bound. Her family ask about stopping her statin, antihypertensives and diabetes tablets. What is the MOST appropriate approach?', 'In the last weeks or months of life, many long-term preventive drugs (statins, antihypertensives, bisphosphonates, tight glucose control) have little benefit and add pill burden and side effects. Deprescribe them after discussion, while keeping drugs for symptom control. Relax glucose targets (avoid hypoglycaemia and symptomatic hyperglycaemia).', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v3')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = '832f1616-e6cd-54aa-8119-72201c2ca23e';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('28906d25-ce4b-551f-970a-8ac7a7f15cbc', '832f1616-e6cd-54aa-8119-72201c2ca23e', 'A', 'Review and deprescribe medications that no longer benefit her, focusing on symptom control', true, 0),
  ('3692dc11-676d-59d3-97a2-951b90014532', '832f1616-e6cd-54aa-8119-72201c2ca23e', 'B', 'Start new preventive medications', false, 1),
  ('4a669be8-f624-5c97-bf87-2c3a8f78047c', '832f1616-e6cd-54aa-8119-72201c2ca23e', 'C', 'Stop all medications including analgesia', false, 2),
  ('a2908c4e-c68e-5edd-84f6-db2f0eec2bb5', '832f1616-e6cd-54aa-8119-72201c2ca23e', 'D', 'Continue all medications unchanged', false, 3),
  ('e1056d6f-6c10-5b22-ba0e-72ea42cb1710', '832f1616-e6cd-54aa-8119-72201c2ca23e', 'E', 'Increase her statin dose', false, 4);

-- Q506
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('3cffa9ab-28de-5a52-bc2d-9192d26fac63', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000017', 'sba', 'A 82 year old man has died peacefully at home under the palliative care team. What is required in England before his body can be released for cremation?', 'Expected deaths are verified by a doctor or trained nurse. The attending doctor completes the MCCD, which the medical examiner reviews. Since September 2024 the medical examiner system replaced the second cremation doctor''s form (Form 5). The coroner is only involved if the death is unnatural, sudden or unexplained, or meets referral criteria.', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v3')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = '3cffa9ab-28de-5a52-bc2d-9192d26fac63';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('b9132f23-ef60-5cef-b25a-e46a1485c09b', '3cffa9ab-28de-5a52-bc2d-9192d26fac63', 'A', 'The coroner must be informed of all home deaths', false, 0),
  ('4ce75611-3672-5a60-a5cd-44d9c067db8b', '3cffa9ab-28de-5a52-bc2d-9192d26fac63', 'B', 'Only the family need to sign a form', false, 1),
  ('eb319386-3e2b-592a-b5f8-d717456bb7a4', '3cffa9ab-28de-5a52-bc2d-9192d26fac63', 'C', 'The death is reviewed by a medical examiner and the cause of death certified (MCCD); a separate cremation form is completed', true, 2),
  ('c971b288-0935-58f8-bea0-c8db5da6fade', '3cffa9ab-28de-5a52-bc2d-9192d26fac63', 'D', 'A post-mortem is always required', false, 3),
  ('3b2fe564-6262-5652-9373-6337bccdca9f', '3cffa9ab-28de-5a52-bc2d-9192d26fac63', 'E', 'No paperwork is needed', false, 4);

-- Q507
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('52425079-2040-54f6-9646-3a92a2127ae6', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000018', 'sba', 'A 70 year old man is listed for elective major surgery. His Hb is 98 g/L with low ferritin. Surgery is in 6 weeks. What is the SINGLE most appropriate pre-operative management?', 'Pre-operative anaemia is associated with more transfusion, complications and mortality. Patient blood management: identify anaemia early, investigate (iron deficiency may signal GI cancer), and treat. IV iron works within 2-4 weeks and is useful before surgery. Transfusion is reserved for symptomatic or severe anaemia.', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v3')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = '52425079-2040-54f6-9646-3a92a2127ae6';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('fa374720-e91c-538d-bcb2-cd60f41ab304', '52425079-2040-54f6-9646-3a92a2127ae6', 'A', 'Investigate the cause of iron deficiency and give iron (IV iron if time is short or oral iron is not tolerated)', true, 0),
  ('b877019e-507a-5478-8a5b-1ab2bdd92c69', '52425079-2040-54f6-9646-3a92a2127ae6', 'B', 'Ignore it as it is mild', false, 1),
  ('060814ce-1160-5452-9337-9f79a1d9bfd0', '52425079-2040-54f6-9646-3a92a2127ae6', 'C', 'Give erythropoietin only', false, 2),
  ('43a66942-7825-5917-a74a-794106b1c0b9', '52425079-2040-54f6-9646-3a92a2127ae6', 'D', 'Postpone surgery for 1 year', false, 3),
  ('0918a9c5-19d2-51a9-ac8b-278bbd88d850', '52425079-2040-54f6-9646-3a92a2127ae6', 'E', 'Transfuse 2 units before surgery routinely', false, 4);

-- Q508
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('d712d0f1-7422-5b8f-88e9-9a4c2ff8a9ab', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000018', 'sba', 'A 45 year old man is assessed before a general anaesthetic. He has a small mouth opening, limited neck extension and a Mallampati score of 4. What does this suggest?', 'Airway assessment includes Mallampati class (visibility of the uvula and pharyngeal structures, 1-4), mouth opening, thyromental distance, neck movement, dentition and history of difficult intubation. Higher classes suggest difficult laryngoscopy. Plan for difficult airway equipment, awake techniques or regional anaesthesia as needed (DAS guidelines).', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v3')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = 'd712d0f1-7422-5b8f-88e9-9a4c2ff8a9ab';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('dad6f90c-b8a3-58e4-a6ee-f16cfb08c02c', 'd712d0f1-7422-5b8f-88e9-9a4c2ff8a9ab', 'A', 'He can safely have a general anaesthetic with no special preparation', false, 0),
  ('48bc3c54-7c9c-5445-a37c-197b74ad8943', 'd712d0f1-7422-5b8f-88e9-9a4c2ff8a9ab', 'B', 'He needs a spinal anaesthetic in all cases', false, 1),
  ('db339d0d-2ae5-5d10-9dcd-a2093f6fe436', 'd712d0f1-7422-5b8f-88e9-9a4c2ff8a9ab', 'C', 'A potentially difficult airway (difficult laryngoscopy/intubation), so the anaesthetist should plan accordingly', true, 2),
  ('42f37146-86eb-5006-95d9-9736b455bde6', 'd712d0f1-7422-5b8f-88e9-9a4c2ff8a9ab', 'D', 'Low risk of aspiration', false, 3),
  ('a15ead6a-0c5a-510b-aff0-1f719a23db6d', 'd712d0f1-7422-5b8f-88e9-9a4c2ff8a9ab', 'E', 'High risk of malignant hyperthermia', false, 4);

-- Q509
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('815768c3-d0cb-5e2c-bfef-0173ebf863c6', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000018', 'sba', 'A 60 year old man needs emergency surgery for bowel obstruction. He has been vomiting. Which anaesthetic technique is used to reduce the risk of aspiration?', 'Patients at high risk of aspiration (emergency surgery, bowel obstruction, full stomach, pregnancy, severe GORD) need RSI. This involves pre-oxygenation, a rapid induction agent (propofol, thiopental or ketamine) and a fast-acting neuromuscular blocker (rocuronium or suxamethonium), cricoid pressure (practice varies), and a cuffed ET tube. An NG tube should be aspirated beforehand.', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v3')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = '815768c3-d0cb-5e2c-bfef-0173ebf863c6';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('35dbbbe8-c533-5521-8ff6-c71972b78749', '815768c3-d0cb-5e2c-bfef-0173ebf863c6', 'A', 'Gas induction with a face mask', false, 0),
  ('4133cbda-b05e-5084-ba12-b61b3fb3331e', '815768c3-d0cb-5e2c-bfef-0173ebf863c6', 'B', 'Rapid sequence induction with cricoid pressure (pre-oxygenation, rapid-acting induction and neuromuscular blocker, and early intubation)', true, 1),
  ('7d4cb721-f8ea-512c-8d4c-2b6892911395', '815768c3-d0cb-5e2c-bfef-0173ebf863c6', 'C', 'Sedation only', false, 2),
  ('c26cb5c7-a5bc-594d-9ed7-c6813a2f5e49', '815768c3-d0cb-5e2c-bfef-0173ebf863c6', 'D', 'Laryngeal mask airway', false, 3),
  ('84a5a3dc-3519-594f-9d20-5e37beb24595', '815768c3-d0cb-5e2c-bfef-0173ebf863c6', 'E', 'Delay surgery until he has fasted for 6 hours', false, 4);

-- Q510
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('442d22a4-07ce-5811-b25f-24d3e082dcbd', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000018', 'sba', 'A 70 kg man needs a skin lesion excised under local anaesthetic. What is the maximum safe dose of plain lidocaine (without adrenaline)?', 'Maximum doses: lidocaine plain 3 mg/kg (max about 200 mg); lidocaine with adrenaline 7 mg/kg (max about 500 mg); bupivacaine 2 mg/kg. 1% lidocaine = 10 mg/mL. Exceeding these risks local anaesthetic systemic toxicity. Adrenaline prolongs action and reduces bleeding.', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v3')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = '442d22a4-07ce-5811-b25f-24d3e082dcbd';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('234b2240-3427-5ec5-8635-0f778a3b9964', '442d22a4-07ce-5811-b25f-24d3e082dcbd', 'A', 'There is no maximum', false, 0),
  ('efbeec3b-f3c4-5de1-beb0-5978a29cd1ee', '442d22a4-07ce-5811-b25f-24d3e082dcbd', 'B', '20 mg/kg', false, 1),
  ('5bd4221f-5634-537b-9b5c-1dcbdf19a677', '442d22a4-07ce-5811-b25f-24d3e082dcbd', 'C', 'About 3 mg/kg (210 mg, about 21 mL of 1% lidocaine)', true, 2),
  ('61a7132e-3d2f-59f6-b330-788815a06dc4', '442d22a4-07ce-5811-b25f-24d3e082dcbd', 'D', '0.5 mg/kg', false, 3),
  ('e4ecc3e7-25f5-5b48-a05b-e177d9a80f6b', '442d22a4-07ce-5811-b25f-24d3e082dcbd', 'E', '10 mg/kg', false, 4);

-- Q511
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('c0d42e53-282a-5f54-b73e-d6a56dda6e87', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000018', 'sba', 'A 68 year old woman takes enoxaparin 40 mg once daily as VTE prophylaxis. She is due to have a spinal anaesthetic. When should her last dose of prophylactic LMWH be given before the spinal?', 'Neuraxial anaesthesia in anticoagulated patients risks spinal or epidural haematoma, which can cause paraplegia. Guidelines: wait 12 hours after prophylactic LMWH and 24 hours after treatment-dose LMWH before neuraxial block or catheter removal. Timing also applies to DOACs, warfarin (INR) and antiplatelets (clopidogrel 7 days). Aspirin alone is usually acceptable.', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v3')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = 'c0d42e53-282a-5f54-b73e-d6a56dda6e87';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('0f509391-9f44-5fde-9192-f42004e97fc6', 'c0d42e53-282a-5f54-b73e-d6a56dda6e87', 'A', 'No gap is needed', false, 0),
  ('fdcb92c3-1562-5a83-8cde-3cab1feda1fb', 'c0d42e53-282a-5f54-b73e-d6a56dda6e87', 'B', '48 hours before', false, 1),
  ('6be29ab4-cfc9-5e4a-bd29-c8ec5d6ce962', 'c0d42e53-282a-5f54-b73e-d6a56dda6e87', 'C', '1 hour before', false, 2),
  ('da67087e-9b2b-56d5-b610-72d8fde20057', 'c0d42e53-282a-5f54-b73e-d6a56dda6e87', 'D', 'At least 12 hours before the spinal (24 hours if on a treatment dose)', true, 3),
  ('e1d1f4f1-1665-580e-9662-e367f2c13d24', 'c0d42e53-282a-5f54-b73e-d6a56dda6e87', 'E', 'Immediately after the spinal only', false, 4);

-- Q512
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('a25aac7d-b23e-57b3-a34c-c4d1e7ab3540', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000018', 'sba', 'A 72 year old man had abdominal surgery yesterday. He is now confused with SpO2 89% on air, RR 24 and fine crackles at the bases. Which is the MOST common cause of hypoxia on day 1 after surgery?', 'Atelectasis is the commonest cause of postoperative hypoxia and low-grade fever in the first 24-48 hours, especially after upper abdominal or thoracic surgery. It is due to reduced lung volumes, pain and secretions. Prevent and treat with good analgesia, early mobilisation, physiotherapy and deep breathing, plus oxygen. Consider PE, pneumonia, fluid overload and opioid sedation.', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v3')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = 'a25aac7d-b23e-57b3-a34c-c4d1e7ab3540';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('a2f9332f-77bb-5fed-b45d-22be301fcdc9', 'a25aac7d-b23e-57b3-a34c-c4d1e7ab3540', 'A', 'Myocardial infarction', false, 0),
  ('82267d4f-3279-5841-a427-9ac8c61aa8b9', 'a25aac7d-b23e-57b3-a34c-c4d1e7ab3540', 'B', 'Atelectasis (basal lung collapse)', true, 1),
  ('f513b3a6-bd11-5626-a948-2dd02b781c96', 'a25aac7d-b23e-57b3-a34c-c4d1e7ab3540', 'C', 'Hospital-acquired pneumonia', false, 2),
  ('5a095288-556a-5de6-835b-51e56134dbed', 'a25aac7d-b23e-57b3-a34c-c4d1e7ab3540', 'D', 'Anastomotic leak', false, 3),
  ('6c5ea234-77a3-5acf-b2f9-17571b64f954', 'a25aac7d-b23e-57b3-a34c-c4d1e7ab3540', 'E', 'Pulmonary embolism', false, 4);

-- Q513
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('99e562c1-29bb-5493-b22a-1689bcdbacc7', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000018', 'sba', 'A 72 year old man develops new atrial fibrillation (rate 140) 2 days after a lung resection. He is haemodynamically stable. What should be done FIRST alongside rate control?', 'Postoperative AF is common, especially after cardiothoracic surgery. Treat precipitants: hypokalaemia, hypomagnesaemia, hypoxia, sepsis, hypovolaemia or overload, pain and stopped beta-blockers. Rate control with beta-blockers (or amiodarone). It often reverts within days. Consider anticoagulation if it persists over 48 hours, weighing bleeding risk.', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v3')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = '99e562c1-29bb-5493-b22a-1689bcdbacc7';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('c31d5ea2-a6dc-50a2-901a-b719a6c4836c', '99e562c1-29bb-5493-b22a-1689bcdbacc7', 'A', 'Ignore it as it will resolve', false, 0),
  ('4cfd6e1d-7179-5b19-bd2c-37a6662d6496', '99e562c1-29bb-5493-b22a-1689bcdbacc7', 'B', 'Start warfarin immediately', false, 1),
  ('49a09d8b-1a1b-5b93-9ff3-5f6201fbbb90', '99e562c1-29bb-5493-b22a-1689bcdbacc7', 'C', 'Immediate DC cardioversion', false, 2),
  ('e6aeed77-7212-5544-a2fb-0c130e656329', '99e562c1-29bb-5493-b22a-1689bcdbacc7', 'D', 'IV adenosine', false, 3),
  ('5db2d717-6b7a-5f63-9bc5-805c0e9cd825', '99e562c1-29bb-5493-b22a-1689bcdbacc7', 'E', 'Look for and correct precipitants (electrolytes such as potassium and magnesium, hypoxia, infection, fluid status, pain)', true, 4);

-- Q514
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('6f2a537f-3b79-50a1-aab8-babdfc8b64ba', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000018', 'sba', 'A 75 year old man had a hip replacement under spinal anaesthesia. Eight hours later he has not passed urine and has lower abdominal discomfort. Bladder scan shows 900 mL. What is the SINGLE most appropriate management?', 'Postoperative urinary retention is common after spinal anaesthesia, opioids, anticholinergics and pelvic surgery, and in older men with BPH. Large volumes risk bladder overdistension injury. Catheterise, then do a trial without catheter when mobile and off contributing drugs. Tamsulosin can help with the trial without catheter.', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v3')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = '6f2a537f-3b79-50a1-aab8-babdfc8b64ba';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('b5890e1d-533e-533d-be06-125fd22f8ef0', '6f2a537f-3b79-50a1-aab8-babdfc8b64ba', 'A', 'Wait another 12 hours', false, 0),
  ('3c9f6b0f-e41b-5031-b9a5-3fdbf456f5c6', '6f2a537f-3b79-50a1-aab8-babdfc8b64ba', 'B', 'Oral tamsulosin alone', false, 1),
  ('f046d7f3-04b0-55c0-bc85-18f63685be52', '6f2a537f-3b79-50a1-aab8-babdfc8b64ba', 'C', 'Urethral catheterisation (in-out or indwelling), then trial without catheter later', true, 2),
  ('54254634-5d3c-5228-9898-a3c121010bde', '6f2a537f-3b79-50a1-aab8-babdfc8b64ba', 'D', 'Increase IV fluids', false, 3),
  ('0257446b-b36a-5550-99df-af6b8c0882eb', '6f2a537f-3b79-50a1-aab8-babdfc8b64ba', 'E', 'IV furosemide', false, 4);

-- Q515
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('d26b8f4d-e457-5b27-b62c-8df02b12a282', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000018', 'sba', 'A 55 year old woman is 3 days after a laparotomy. She has abdominal distension, nausea and absent bowel sounds, with no passage of flatus. Her potassium is 3.0 mmol/L. CT shows dilated small and large bowel without a transition point. What is the SINGLE most likely diagnosis?', 'Postoperative ileus is common after abdominal surgery and is worsened by opioids, electrolyte disturbance (low potassium, low magnesium) and immobility. CT shows diffuse dilatation without a transition point. Management: correct electrolytes, NG decompression if vomiting, reduce opioids, mobilise, and use enhanced recovery principles. Prolonged ileus may need parenteral nutrition.', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v3')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = 'd26b8f4d-e457-5b27-b62c-8df02b12a282';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('bef93111-22dc-5712-b20d-86dbf2a9f1c9', 'd26b8f4d-e457-5b27-b62c-8df02b12a282', 'A', 'Postoperative paralytic ileus', true, 0),
  ('9c569291-46ec-5145-b02b-1306a1859407', 'd26b8f4d-e457-5b27-b62c-8df02b12a282', 'B', 'Anastomotic leak', false, 1),
  ('7207df28-e63d-5ddc-ab5a-7cdcc81ded23', 'd26b8f4d-e457-5b27-b62c-8df02b12a282', 'C', 'Volvulus', false, 2),
  ('cba766de-a2d4-57ab-8007-03dd54250712', 'd26b8f4d-e457-5b27-b62c-8df02b12a282', 'D', 'Toxic megacolon', false, 3),
  ('6fe57f71-57c3-534e-a0f3-b6136ac7a2bd', 'd26b8f4d-e457-5b27-b62c-8df02b12a282', 'E', 'Mechanical small bowel obstruction from adhesions', false, 4);

-- Q516
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('03f2ec3d-ecf3-5ae3-b3f3-6643ebac9e48', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000018', 'sba', 'A 35 year old woman has a severe allergic reaction during induction of general anaesthesia: hypotension, bronchospasm and a rash. Which drugs are the commonest causes of perioperative anaphylaxis in the UK?', 'The NAP6 audit found antibiotics (especially teicoplanin and co-amoxiclav) are the commonest cause of perioperative anaphylaxis, followed by neuromuscular blockers (rocuronium, suxamethonium), chlorhexidine and patent blue dye. Treat with adrenaline (IV bolus by anaesthetist), fluids and supportive care. Take tryptase samples and refer to an allergy clinic.', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v3')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = '03f2ec3d-ecf3-5ae3-b3f3-6643ebac9e48';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('97912ef5-f4cb-5cf7-9fd5-c4fb698ab1aa', '03f2ec3d-ecf3-5ae3-b3f3-6643ebac9e48', 'A', 'Saline', false, 0),
  ('60f6a051-87ad-5409-9c04-912889a03ca5', '03f2ec3d-ecf3-5ae3-b3f3-6643ebac9e48', 'B', 'Oxygen', false, 1),
  ('5c3787d3-35ca-5261-b6c6-c9eec2d94813', '03f2ec3d-ecf3-5ae3-b3f3-6643ebac9e48', 'C', 'Paracetamol', false, 2),
  ('95872a1e-3815-5047-8280-a59e9bdd395d', '03f2ec3d-ecf3-5ae3-b3f3-6643ebac9e48', 'D', 'Antibiotics (e.g. teicoplanin, co-amoxiclav), neuromuscular blocking agents and chlorhexidine', true, 3),
  ('c8d11d4d-9e54-58ae-8af8-34fe89d6fdae', '03f2ec3d-ecf3-5ae3-b3f3-6643ebac9e48', 'E', 'Propofol only', false, 4);

-- Q517
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('2ac95b8a-d422-51c7-ada9-325ca1f09e4e', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000018', 'sba', 'A 6 year old child is extubated after a tonsillectomy. She develops sudden stridor and cannot ventilate, with paradoxical chest movement and desaturation. What is the SINGLE most likely diagnosis?', 'Laryngospasm is reflex closure of the vocal cords, often triggered by secretions or stimulation during light anaesthesia, especially in children and after airway surgery. Management: call for help, 100% oxygen with CPAP via a tight-fitting mask, jaw thrust (Larson''s point), deepen anaesthesia (propofol), and a small dose of suxamethonium if needed. It can cause negative-pressure pulmonary oedema.', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v3')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = '2ac95b8a-d422-51c7-ada9-325ca1f09e4e';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('ec3d2d5b-ee9d-51c5-9f2d-d742c6000fd4', '2ac95b8a-d422-51c7-ada9-325ca1f09e4e', 'A', 'Aspiration pneumonia', false, 0),
  ('f2aaebec-102b-5f89-8487-51eb07f96b44', '2ac95b8a-d422-51c7-ada9-325ca1f09e4e', 'B', 'Malignant hyperthermia', false, 1),
  ('a06d7c98-e695-52f6-9fa9-b4cd7c5f639f', '2ac95b8a-d422-51c7-ada9-325ca1f09e4e', 'C', 'Laryngospasm', true, 2),
  ('dd9edfae-11ed-5802-8575-fd33b981273e', '2ac95b8a-d422-51c7-ada9-325ca1f09e4e', 'D', 'Pneumothorax', false, 3),
  ('fc04bbf1-0e5d-5673-84bb-16472b0387f0', '2ac95b8a-d422-51c7-ada9-325ca1f09e4e', 'E', 'Anaphylaxis', false, 4);

-- Q518
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('7861a71f-66d1-5567-9fb8-80f9f57949c9', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000018', 'sba', 'A 65 year old man takes canagliflozin (SGLT2 inhibitor) for type 2 diabetes. He is having major elective surgery tomorrow. What is the CORRECT advice?', 'SGLT2 inhibitors increase the risk of euglycaemic DKA around surgery and fasting. Current guidance advises omitting them the day before and the day of surgery (at least 1-2 days), checking ketones if unwell even if glucose is normal, and restarting when eating and drinking normally.', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v3')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = '7861a71f-66d1-5567-9fb8-80f9f57949c9';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('87c09689-3b8b-5e63-8886-85f1a0dec602', '7861a71f-66d1-5567-9fb8-80f9f57949c9', 'A', 'Continue as normal', false, 0),
  ('660d86e1-e193-5329-8c69-66ff297e6401', '7861a71f-66d1-5567-9fb8-80f9f57949c9', 'B', 'Switch to insulin permanently', false, 1),
  ('a3e7e3a8-fbe0-5b32-bf4d-2e213994b7f3', '7861a71f-66d1-5567-9fb8-80f9f57949c9', 'C', 'Stop it 2 weeks before', false, 2),
  ('fae03299-4528-57a9-88fe-7977a702625b', '7861a71f-66d1-5567-9fb8-80f9f57949c9', 'D', 'Double the dose', false, 3),
  ('320426f9-55a5-5175-9254-116381d8d135', '7861a71f-66d1-5567-9fb8-80f9f57949c9', 'E', 'Omit the SGLT2 inhibitor the day before and the day of surgery (risk of euglycaemic DKA), restarting when eating and drinking normally', true, 4);

-- Q519
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('9efd2b8e-9eaf-517f-a335-1b550926ad5d', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000018', 'sba', 'A 70 year old man with a drug-eluting coronary stent placed 2 years ago takes aspirin. He is having an elective hernia repair. What is the SINGLE most appropriate advice about aspirin?', 'In patients with coronary stents, stopping antiplatelet therapy risks stent thrombosis. Aspirin is usually continued for most surgery. If dual antiplatelet therapy is still needed (recent stent), elective surgery should be delayed until it can be stopped safely, after discussion with cardiology. Clopidogrel is usually stopped 5-7 days before surgery if needed.', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v3')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = '9efd2b8e-9eaf-517f-a335-1b550926ad5d';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('644d5798-c27f-5e3c-8a71-80654e052d03', '9efd2b8e-9eaf-517f-a335-1b550926ad5d', 'A', 'Stop aspirin and start clopidogrel', false, 0),
  ('8f141b43-eb6e-504c-adb6-06c0d7efb6b8', '9efd2b8e-9eaf-517f-a335-1b550926ad5d', 'B', 'Stop aspirin 2 weeks before', false, 1),
  ('ac572727-413b-5042-8d5b-af6ac1bbf90e', '9efd2b8e-9eaf-517f-a335-1b550926ad5d', 'C', 'Continue aspirin around surgery (unless the surgeon says bleeding risk is prohibitive, e.g. neurosurgery)', true, 2),
  ('38362d79-d82c-5cab-a737-cdc920822196', '9efd2b8e-9eaf-517f-a335-1b550926ad5d', 'D', 'Switch to warfarin', false, 3),
  ('832812ef-a617-5bb0-afa1-2cf849ccb772', '9efd2b8e-9eaf-517f-a335-1b550926ad5d', 'E', 'Stop aspirin permanently', false, 4);

-- Q520
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('8af4d294-baf4-5fed-92bd-0aace63f47ea', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000018', 'sba', 'A 25 year old man with 40% burns 10 days ago needs a skin graft under general anaesthetic. Which neuromuscular blocking drug should be AVOIDED?', 'Suxamethonium causes potassium release from muscle. In burns (from about 24-48 hours to 1-2 years), crush injury, prolonged immobility, spinal cord injury and some neuromuscular diseases, upregulation of extrajunctional receptors can cause dangerous hyperkalaemia and cardiac arrest. Use a non-depolarising agent instead.', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v3')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = '8af4d294-baf4-5fed-92bd-0aace63f47ea';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('13418edf-191d-59fe-b334-0365303cf68f', '8af4d294-baf4-5fed-92bd-0aace63f47ea', 'A', 'Suxamethonium (risk of severe hyperkalaemia)', true, 0),
  ('b3407012-ffe4-5cf1-8853-40854e972d66', '8af4d294-baf4-5fed-92bd-0aace63f47ea', 'B', 'Rocuronium', false, 1),
  ('f6bf8cea-716b-565b-bf4d-8eef00557c78', '8af4d294-baf4-5fed-92bd-0aace63f47ea', 'C', 'Cisatracurium', false, 2),
  ('954d6123-b28e-5894-b881-55a6dfb99ee8', '8af4d294-baf4-5fed-92bd-0aace63f47ea', 'D', 'Atracurium', false, 3),
  ('42e7b4f3-d7de-5777-9c16-0fe140634c30', '8af4d294-baf4-5fed-92bd-0aace63f47ea', 'E', 'Vecuronium', false, 4);

-- Q521
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('bd62528f-9678-5aa6-b23a-b4539326922b', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000018', 'sba', 'A 60 year old man has had a laparoscopic operation using rocuronium. At the end, he needs reversal of neuromuscular blockade. Which drug specifically encapsulates rocuronium?', 'Sugammadex is a modified cyclodextrin that binds aminosteroid neuromuscular blockers (rocuronium, vecuronium), giving rapid reversal even from deep block. Neostigmine (an anticholinesterase) is given with glycopyrronium to counter muscarinic effects, and only works when some recovery has occurred. Monitor reversal with train-of-four.', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v3')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = 'bd62528f-9678-5aa6-b23a-b4539326922b';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('767faae6-063f-5742-9e14-7b23fdefaca9', 'bd62528f-9678-5aa6-b23a-b4539326922b', 'A', 'Sugammadex', true, 0),
  ('e12cf97b-74db-560e-8592-81c54acfce28', 'bd62528f-9678-5aa6-b23a-b4539326922b', 'B', 'Neostigmine with glycopyrronium', false, 1),
  ('d1cdd0a7-a10e-5800-80e5-e483d7620510', 'bd62528f-9678-5aa6-b23a-b4539326922b', 'C', 'Dantrolene', false, 2),
  ('ae00f533-de21-51be-a606-bdf92d90abf9', 'bd62528f-9678-5aa6-b23a-b4539326922b', 'D', 'Flumazenil', false, 3),
  ('b57b236e-0dad-5bfc-9e90-c36728c381e7', 'bd62528f-9678-5aa6-b23a-b4539326922b', 'E', 'Naloxone', false, 4);

-- Q522
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('9db0a6d2-1e45-5d19-884d-fc5704760693', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000018', 'sba', 'Before an operation starts, the team reads aloud the patient''s name, procedure and site, and confirms antibiotic prophylaxis and anticipated critical events. What is this process?', 'The WHO Surgical Safety Checklist has 3 parts: Sign In (before induction), Time Out (before incision: team introductions, patient, procedure and site confirmation, antibiotics, critical events) and Sign Out (instrument counts, specimen labelling, concerns). It reduces complications and deaths. Wrong-site surgery is a never event.', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v3')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = '9db0a6d2-1e45-5d19-884d-fc5704760693';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('415cf057-49c0-5531-8405-abb60aadfbfe', '9db0a6d2-1e45-5d19-884d-fc5704760693', 'A', 'Root cause analysis', false, 0),
  ('4ed4a15b-3985-5b93-bf0b-8885eb53cc5f', '9db0a6d2-1e45-5d19-884d-fc5704760693', 'B', 'Morbidity and mortality meeting', false, 1),
  ('540da0e0-5faf-5750-8fdf-9f7441d79030', '9db0a6d2-1e45-5d19-884d-fc5704760693', 'C', 'The WHO Surgical Safety Checklist (''Time Out'' before skin incision)', true, 2),
  ('a7f4d23b-2052-51be-9f2e-195484f307c4', '9db0a6d2-1e45-5d19-884d-fc5704760693', 'D', 'Informed consent', false, 3),
  ('e2e4eec9-6f02-58f2-977b-81d3ce1732e5', '9db0a6d2-1e45-5d19-884d-fc5704760693', 'E', 'Clinical audit', false, 4);

-- Q523
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('58795b38-1315-5159-b7bd-1c342d6fbba3', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000018', 'sba', 'A 55 year old man with obstructive sleep apnoea uses CPAP at night. He is having elective surgery. What is the MOST appropriate advice?', 'OSA increases perioperative risks: difficult airway, postoperative hypoxia and respiratory depression with opioids and sedatives. Patients should bring and use their CPAP after surgery, have opioid-sparing analgesia (regional techniques), and be monitored appropriately. Undiagnosed OSA can be screened with STOP-BANG.', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v3')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = '58795b38-1315-5159-b7bd-1c342d6fbba3';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('fd0f6459-4b77-506e-a811-b961dc6272d0', '58795b38-1315-5159-b7bd-1c342d6fbba3', 'A', 'Bring his CPAP machine to hospital and use it after surgery, with caution over opioids and sedatives', true, 0),
  ('62e3c170-a47c-527d-9aa3-440e30353bea', '58795b38-1315-5159-b7bd-1c342d6fbba3', 'B', 'No special measures are needed', false, 1),
  ('bb1ae91d-22c2-540a-89aa-64b0ce739b4a', '58795b38-1315-5159-b7bd-1c342d6fbba3', 'C', 'He cannot have a general anaesthetic', false, 2),
  ('984d137f-70a8-5541-8e2b-279d8b0b8ae8', '58795b38-1315-5159-b7bd-1c342d6fbba3', 'D', 'Stop CPAP 2 weeks before surgery', false, 3),
  ('463ac607-42b2-568c-8110-36bef3e5f37f', '58795b38-1315-5159-b7bd-1c342d6fbba3', 'E', 'Give extra sedation the night before', false, 4);

-- Q524
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('fd595cf9-32cc-5cd6-95b4-593ca72f19a7', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000035', 'sba', 'A 66 year old man with an anterior STEMI has cold peripheries, BP 78/50 mmHg, lactate 5 mmol/L, and pulmonary oedema despite PCI. Echo shows severe LV dysfunction. What is the SINGLE most likely type of shock and supportive drug?', 'Cardiogenic shock (low cardiac output with tissue hypoperfusion) is commonly caused by MI. Treat with early revascularisation, careful fluid management, inotropes (dobutamine or milrinone) to improve contractility, vasopressors to maintain MAP, and mechanical support (such as Impella or ECMO) in selected patients.', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v3')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = 'fd595cf9-32cc-5cd6-95b4-593ca72f19a7';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('bb3c7bfc-8a9c-53f2-b667-ced6f0ae4c8a', 'fd595cf9-32cc-5cd6-95b4-593ca72f19a7', 'A', 'Septic shock; noradrenaline only', false, 0),
  ('a5d2e2d1-f150-5e0d-8d77-07f7320bfc3c', 'fd595cf9-32cc-5cd6-95b4-593ca72f19a7', 'B', 'Hypovolaemic shock; 2 L of IV fluid', false, 1),
  ('f1c55701-ae0c-5448-8894-0e2478b2455f', 'fd595cf9-32cc-5cd6-95b4-593ca72f19a7', 'C', 'Cardiogenic shock; an inotrope (e.g. dobutamine), with noradrenaline if needed for MAP', true, 2),
  ('35fc734a-7dc0-5686-a712-b877659166fe', 'fd595cf9-32cc-5cd6-95b4-593ca72f19a7', 'D', 'Neurogenic shock; atropine', false, 3),
  ('851875c5-5370-5b92-a895-7b1e2f77a5b8', 'fd595cf9-32cc-5cd6-95b4-593ca72f19a7', 'E', 'Anaphylactic shock; adrenaline IM', false, 4);

-- Q525
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('5437085d-f208-5764-8105-83663d40a530', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000035', 'sba', 'A ventilated patient with ARDS has a PaO2 of 7.5 kPa on FiO2 0.8 despite lung-protective ventilation and optimised PEEP. What is the SINGLE most appropriate additional intervention?', 'In moderate-severe ARDS (P/F below 150 mmHg), prone positioning improves oxygenation and reduces mortality (PROSEVA). Other strategies include neuromuscular blockade in early severe ARDS, conservative fluid management, and ECMO referral for refractory hypoxaemia. Avoid high tidal volumes and plateau pressures above 30 cmH2O.', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v3')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = '5437085d-f208-5764-8105-83663d40a530';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('468bc2ad-8070-51b6-8f71-769869dd2743', '5437085d-f208-5764-8105-83663d40a530', 'A', 'Increase the tidal volume to 12 mL/kg', false, 0),
  ('329bea73-c29c-5029-9e59-913d03cc8515', '5437085d-f208-5764-8105-83663d40a530', 'B', 'Prone positioning (for at least 12-16 hours per day)', true, 1),
  ('26c6d713-dc41-5e3a-b044-bffd7bd7b65b', '5437085d-f208-5764-8105-83663d40a530', 'C', 'Routine high-dose steroids for all', false, 2),
  ('c4c1b364-de4f-5fad-9a34-92d43235e9ac', '5437085d-f208-5764-8105-83663d40a530', 'D', 'Stop PEEP', false, 3),
  ('b8a3d5b8-27d9-5722-9906-feb573eafa45', '5437085d-f208-5764-8105-83663d40a530', 'E', 'Give a fluid bolus of 2 L', false, 4);

-- Q526
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('4560161c-bfb7-5337-b8d6-c5a469220f0c', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000035', 'sba', 'A 75 year old man on ICU with sepsis has a sodium of 156 mmol/L after several days of high fluid losses and limited free water. He is clinically dry. What is the SINGLE most appropriate treatment?', 'Hypernatraemia usually reflects free water deficit (losses or limited access to water). It causes confusion, lethargy and seizures. Correct chronic hypernatraemia slowly (no more than 10-12 mmol/L per day) to avoid cerebral oedema. Calculate the free water deficit, and look for diabetes insipidus.', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v3')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = '4560161c-bfb7-5337-b8d6-c5a469220f0c';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('9e95b6b3-3419-5469-96f2-85e716129f94', '4560161c-bfb7-5337-b8d6-c5a469220f0c', 'A', 'Fluid restriction', false, 0),
  ('aaeb231e-a960-5063-9ea1-1ab1366c7011', '4560161c-bfb7-5337-b8d6-c5a469220f0c', 'B', 'Rapid correction with large volumes of water in 2 hours', false, 1),
  ('2afd2e6b-f85b-5699-95fe-73d24b766631', '4560161c-bfb7-5337-b8d6-c5a469220f0c', 'C', 'Gradual correction with hypotonic fluids (e.g. 5% glucose or enteral water), aiming for no more than about 10 mmol/L fall in 24 hours', true, 2),
  ('71536f22-a3c7-5eb2-af86-6aeae3f77b6a', '4560161c-bfb7-5337-b8d6-c5a469220f0c', 'D', 'Hypertonic saline', false, 3),
  ('b8f2e2be-694a-595c-97b4-64b10fd6c244', '4560161c-bfb7-5337-b8d6-c5a469220f0c', 'E', 'Furosemide alone', false, 4);

-- Q527
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('3104b96b-7877-5392-8329-331b6e6a2fc5', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000035', 'sba', 'A 65 year old woman was ventilated on ICU for 3 weeks with sepsis. She now has profound generalised weakness, reduced reflexes and difficulty weaning, with no other neurological cause. What is the SINGLE most likely diagnosis?', 'ICU-acquired weakness affects many patients after prolonged critical illness, especially with sepsis, multi-organ failure, corticosteroids, neuromuscular blockers and hyperglycaemia. It prolongs ventilation and recovery. Prevention and management include early mobilisation and rehabilitation, glucose control and minimising sedation. Recovery can take months.', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v3')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = '3104b96b-7877-5392-8329-331b6e6a2fc5';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('6878c008-76af-5dd5-a54f-631e69dc3136', '3104b96b-7877-5392-8329-331b6e6a2fc5', 'A', 'Hypokalaemia only', false, 0),
  ('149da9b2-7d0c-5f51-8b38-bffadf4fde8d', '3104b96b-7877-5392-8329-331b6e6a2fc5', 'B', 'ICU-acquired weakness (critical illness polyneuropathy/myopathy)', true, 1),
  ('6202c144-ea4a-5bb4-8878-5898aac7c0d4', '3104b96b-7877-5392-8329-331b6e6a2fc5', 'C', 'Stroke', false, 2),
  ('cd85ab2d-453a-5306-9369-19422217682f', '3104b96b-7877-5392-8329-331b6e6a2fc5', 'D', 'Guillain-Barré syndrome', false, 3),
  ('f77c1d43-e8da-502f-b918-bd2f30430940', '3104b96b-7877-5392-8329-331b6e6a2fc5', 'E', 'Myasthenia gravis', false, 4);

-- Q528
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('76b450db-fcdd-5d94-98cc-7d016456a3c6', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000035', 'sba', 'A 60 year old man is ventilated on ICU. Which measure reduces the risk of stress ulcer GI bleeding in patients at high risk (such as those on mechanical ventilation for more than 48 hours or with coagulopathy)?', 'Critically ill patients are at risk of stress-related mucosal bleeding. Risk factors include prolonged ventilation, coagulopathy, shock and high-dose steroids. A PPI or H2 antagonist is given to high-risk patients, and early enteral nutrition helps. Overuse of PPIs can increase the risk of C. difficile and pneumonia, so review daily.', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v3')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = '76b450db-fcdd-5d94-98cc-7d016456a3c6';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('7a74c977-a85d-5f2f-8bf6-8a576f52c9ea', '76b450db-fcdd-5d94-98cc-7d016456a3c6', 'A', 'Aspirin', false, 0),
  ('9f8cdd46-a617-5790-9255-8242640f4b21', '76b450db-fcdd-5d94-98cc-7d016456a3c6', 'B', 'Nil by mouth for 1 week', false, 1),
  ('81f7339d-6f1a-56f4-a78d-938f98335acd', '76b450db-fcdd-5d94-98cc-7d016456a3c6', 'C', 'High-dose steroids', false, 2),
  ('82f89033-0426-5d0a-8f87-432260237367', '76b450db-fcdd-5d94-98cc-7d016456a3c6', 'D', 'Routine antibiotics', false, 3),
  ('87ea6d18-f6a9-5b84-adef-a420a2930950', '76b450db-fcdd-5d94-98cc-7d016456a3c6', 'E', 'Pharmacological stress ulcer prophylaxis (e.g. a PPI) and early enteral feeding', true, 4);

-- Q529
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('7ba69b06-0838-5dd2-a68e-2bc7e1f8884d', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000035', 'sba', 'A 55 year old woman on ICU after major surgery has a blood glucose of 14 mmol/L on two occasions. She is not diabetic. What is the recommended glucose target for most critically ill adults?', 'Stress hyperglycaemia is common in critical illness. The NICE-SUGAR trial showed that tight glucose control (4.5-6 mmol/L) increased mortality and hypoglycaemia. A moderate target (around 6-10 mmol/L) using an insulin infusion is recommended. Monitor frequently.', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v3')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = '7ba69b06-0838-5dd2-a68e-2bc7e1f8884d';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('edb69d83-d715-5f3c-83e6-ed323add6caa', '7ba69b06-0838-5dd2-a68e-2bc7e1f8884d', 'A', 'Below 3 mmol/L', false, 0),
  ('5900ec71-d00d-5beb-8a35-c36d0770bcf7', '7ba69b06-0838-5dd2-a68e-2bc7e1f8884d', 'B', 'No monitoring needed', false, 1),
  ('a3c2f9ee-4cc9-5598-9453-f2920fdb9406', '7ba69b06-0838-5dd2-a68e-2bc7e1f8884d', 'C', '12-15 mmol/L', false, 2),
  ('9515500a-05a6-5f8e-83d6-e525fba978a9', '7ba69b06-0838-5dd2-a68e-2bc7e1f8884d', 'D', 'About 6-10 mmol/L (avoid both hyperglycaemia and hypoglycaemia)', true, 3),
  ('6359c3ff-078e-54b7-97e2-1b7aeaf784d7', '7ba69b06-0838-5dd2-a68e-2bc7e1f8884d', 'E', '4-6 mmol/L (tight control)', false, 4);

-- Q530
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('8d2944cf-8ac5-52ee-a972-a6b23adce200', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000035', 'sba', 'A 38 year old woman with acute liver failure from paracetamol overdose has grade 3 encephalopathy. Which is the MOST important complication to monitor and manage?', 'Acute liver failure (jaundice, coagulopathy, encephalopathy without pre-existing liver disease) can cause cerebral oedema, which is a major cause of death. Management includes ICU care, intubation for high-grade encephalopathy, ammonia monitoring, osmotherapy, glucose monitoring (hypoglycaemia), infection surveillance, renal support, and early referral to a transplant centre.', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v3')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = '8d2944cf-8ac5-52ee-a972-a6b23adce200';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('34df160a-1620-5455-8e5a-f73a2e542ccd', '8d2944cf-8ac5-52ee-a972-a6b23adce200', 'A', 'Hypercalcaemia', false, 0),
  ('efcba805-db8b-5397-b410-9d9d0b556973', '8d2944cf-8ac5-52ee-a972-a6b23adce200', 'B', 'Diabetes insipidus only', false, 1),
  ('e43c59f7-380d-52a8-8754-67b1854b567a', '8d2944cf-8ac5-52ee-a972-a6b23adce200', 'C', 'Hypertension', false, 2),
  ('ff6d32fb-32d5-503a-b139-2f5fdec4b5ea', '8d2944cf-8ac5-52ee-a972-a6b23adce200', 'D', 'Polycythaemia', false, 3),
  ('8f866b9f-1d36-5a7d-a884-5cceb3a7673d', '8d2944cf-8ac5-52ee-a972-a6b23adce200', 'E', 'Cerebral oedema and raised intracranial pressure (with hypoglycaemia, coagulopathy, AKI and infection)', true, 4);

-- Q531
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('7a740de1-4b63-5c4b-a9fa-227d37e7f56a', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000035', 'sba', 'A 30 year old man has been on a propofol infusion for 4 days on ICU for status epilepticus. He develops metabolic acidosis, rhabdomyolysis, hyperkalaemia and arrhythmia. What is the SINGLE most likely diagnosis?', 'Propofol infusion syndrome is a rare, often fatal complication of high-dose (over 4 mg/kg/hour) or prolonged propofol infusion. Features include metabolic (lactic) acidosis, rhabdomyolysis, hyperkalaemia, hyperlipidaemia, cardiac failure and arrhythmias. Stop propofol and give supportive care, which may include haemofiltration.', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v3')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = '7a740de1-4b63-5c4b-a9fa-227d37e7f56a';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('5bd9fd57-99c4-55d9-a409-edeb248333bc', '7a740de1-4b63-5c4b-a9fa-227d37e7f56a', 'A', 'Neuroleptic malignant syndrome', false, 0),
  ('87e978b8-aea7-52fb-8c63-8d68c7da8883', '7a740de1-4b63-5c4b-a9fa-227d37e7f56a', 'B', 'Serotonin syndrome', false, 1),
  ('329d8987-9494-5f0d-a5c5-fadacd1108f4', '7a740de1-4b63-5c4b-a9fa-227d37e7f56a', 'C', 'Malignant hyperthermia', false, 2),
  ('08121bb4-2a77-52f8-a293-585067a86319', '7a740de1-4b63-5c4b-a9fa-227d37e7f56a', 'D', 'Propofol infusion syndrome', true, 3),
  ('f36fbba1-5210-5cb2-9beb-44bf06d6a616', '7a740de1-4b63-5c4b-a9fa-227d37e7f56a', 'E', 'Sepsis', false, 4);

-- Q532
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('933d5a10-5112-50fb-9ac0-f0e40694a7f7', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000035', 'sba', 'A 55 year old woman with type 1 respiratory failure from pneumonia has an SpO2 of 88% on a 15 L non-rebreather mask. She is alert and not tiring. Which oxygen strategy can be tried before intubation?', 'High-flow nasal oxygen delivers humidified oxygen at high flow with a small amount of PEEP, improving comfort and oxygenation in type 1 respiratory failure. CPAP is also used (for example in COVID-19 and pulmonary oedema). NIV (BiPAP) is mainly for hypercapnic respiratory failure. Do not delay intubation if the patient is deteriorating.', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v3')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = '933d5a10-5112-50fb-9ac0-f0e40694a7f7';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('0b4f3e81-65fc-5f00-9ecb-1cce3f893431', '933d5a10-5112-50fb-9ac0-f0e40694a7f7', 'A', 'Wait until she is exhausted', false, 0),
  ('5e006722-3478-5d3f-8cf7-0931d29b1444', '933d5a10-5112-50fb-9ac0-f0e40694a7f7', 'B', 'BiPAP as the only option for type 1 failure', false, 1),
  ('7a9805d8-8f95-5d5b-a2b5-e9c22826059d', '933d5a10-5112-50fb-9ac0-f0e40694a7f7', 'C', 'Lower the oxygen to 2 L via nasal cannula', false, 2),
  ('9b54ac6c-0525-5f16-9808-0881bd7fa18b', '933d5a10-5112-50fb-9ac0-f0e40694a7f7', 'D', 'Give IV furosemide', false, 3),
  ('b46d2798-2986-5d43-90f0-bf54c414916e', '933d5a10-5112-50fb-9ac0-f0e40694a7f7', 'E', 'High-flow nasal oxygen (e.g. 40-60 L/min humidified) or CPAP, with close monitoring and early senior/ICU review', true, 4);

-- Q533
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('4856af97-8829-5f96-9fdd-ffa1e3534cbd', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000035', 'sba', 'A nurse on a surgical ward is worried about a deteriorating patient and calls the doctor. Which communication tool is recommended for a structured handover of an acutely unwell patient?', 'SBAR is a structured communication tool that improves handover and escalation: Situation (what is happening), Background (relevant history), Assessment (observations, NEWS2), Recommendation (what you need). It improves patient safety. Critical care outreach teams support ward staff with deteriorating patients.', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v3')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = '4856af97-8829-5f96-9fdd-ffa1e3534cbd';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('716427fb-720c-58ee-9f82-d5431f5a6ccc', '4856af97-8829-5f96-9fdd-ffa1e3534cbd', 'A', 'PICO', false, 0),
  ('3e449454-9496-595b-9880-4c8b2dc1e6f9', '4856af97-8829-5f96-9fdd-ffa1e3534cbd', 'B', 'SBAR (Situation, Background, Assessment, Recommendation)', true, 1),
  ('d588b27c-08d8-5e20-b6d6-445e307b8e9d', '4856af97-8829-5f96-9fdd-ffa1e3534cbd', 'C', 'SOCRATES', false, 2),
  ('83768823-8db6-51dc-952f-bd004c21f8d2', '4856af97-8829-5f96-9fdd-ffa1e3534cbd', 'D', 'SPIKES', false, 3),
  ('dad11f13-69ce-5ce0-aeab-facc14488199', '4856af97-8829-5f96-9fdd-ffa1e3534cbd', 'E', 'DR ABCDE only', false, 4);

-- Q534
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('14034931-f991-5a1f-9083-98343d8ca6fc', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000035', 'sba', 'A 70 kg woman in ICU with septic shock has a lactate of 6 mmol/L at admission. What does serial lactate measurement help with?', 'Lactate above 2 mmol/L in sepsis indicates tissue hypoperfusion or metabolic stress. Lactate of 4 mmol/L or more (or hypotension) needs urgent fluid resuscitation and senior or critical care review. Septic shock (Sepsis-3) is defined as vasopressors needed to keep MAP at 65 or above, with lactate above 2 despite adequate fluids. Clearance of lactate is used to guide resuscitation.', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v3')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = '14034931-f991-5a1f-9083-98343d8ca6fc';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('06f5b17a-a6c4-5ba8-8ffe-56d443396773', '14034931-f991-5a1f-9083-98343d8ca6fc', 'A', 'Diagnosing pneumonia', false, 0),
  ('fd893819-f86f-5526-9f40-087afe0936c3', '14034931-f991-5a1f-9083-98343d8ca6fc', 'B', 'Measuring renal function', false, 1),
  ('14dcdaee-c9ef-5ca0-8cce-7d685e6d1509', '14034931-f991-5a1f-9083-98343d8ca6fc', 'C', 'Choosing antibiotics', false, 2),
  ('ae474210-17d9-5921-b485-07be8e160141', '14034931-f991-5a1f-9083-98343d8ca6fc', 'D', 'Assessing tissue hypoperfusion and response to resuscitation (aim for lactate to fall)', true, 3),
  ('8786652d-200b-513a-ab06-fc20a5530306', '14034931-f991-5a1f-9083-98343d8ca6fc', 'E', 'Measuring cardiac output directly', false, 4);

-- Q535
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('9a465437-dd43-5381-b46e-96a9d3fac5a6', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000035', 'sba', 'A 45 year old man in ICU has a traumatic brain injury. His ICP is 28 mmHg and MAP 75 mmHg. What is his cerebral perfusion pressure (CPP), and is it adequate?', 'CPP = MAP - ICP = 75 - 28 = 47 mmHg. Targets are usually CPP 60-70 mmHg and ICP below 20-22 mmHg. Measures include head elevation at 30 degrees, adequate sedation and analgesia, normocapnia (PaCO2 4.5-5 kPa), normothermia, osmotherapy, vasopressors, CSF drainage and decompressive craniectomy if refractory.', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v3')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = '9a465437-dd43-5381-b46e-96a9d3fac5a6';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('a61c892b-6c36-533c-acac-514b28ce3de0', '9a465437-dd43-5381-b46e-96a9d3fac5a6', 'A', '75 mmHg; adequate', false, 0),
  ('7c85bb6f-f4b0-5421-95e3-f5d10b255c1f', '9a465437-dd43-5381-b46e-96a9d3fac5a6', 'B', '28 mmHg; adequate', false, 1),
  ('02c738af-767d-5d40-a647-a0c65cbb2cf6', '9a465437-dd43-5381-b46e-96a9d3fac5a6', 'C', '103 mmHg; too high', false, 2),
  ('fcc51e75-0ad9-54d1-b2e0-324ec1940ce3', '9a465437-dd43-5381-b46e-96a9d3fac5a6', 'D', 'Cannot be calculated', false, 3),
  ('1237ba28-64b0-5898-b4b6-1c7eb6386d55', '9a465437-dd43-5381-b46e-96a9d3fac5a6', 'E', '47 mmHg; below the usual target (60-70 mmHg), so measures to reduce ICP and/or raise MAP are needed', true, 4);

-- Q536
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('1be07075-a120-522d-8243-fa4bc7c1ce07', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000035', 'sba', 'A 60 year old man with severe pneumonia is in ICU on high-dose noradrenaline, and his PaO2/FiO2 ratio is worsening despite optimal ventilation. Which advanced support might be considered at a specialist centre?', 'VV-ECMO provides gas exchange for severe, potentially reversible respiratory failure (such as ARDS or severe pneumonia) despite optimal conventional management. In the UK it is provided at commissioned specialist centres. VA-ECMO supports both heart and lungs (cardiogenic shock or arrest).', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v3')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = '1be07075-a120-522d-8243-fa4bc7c1ce07';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('8f3674ff-8617-5ec3-b2b6-c46b282a119c', '1be07075-a120-522d-8243-fa4bc7c1ce07', 'A', 'Long-term oxygen at home', false, 0),
  ('9d74a7f3-d446-56aa-ad18-92a3cb990fa3', '1be07075-a120-522d-8243-fa4bc7c1ce07', 'B', 'Haemodialysis', false, 1),
  ('ab8670ac-986f-5cd4-912b-054c410d0fdf', '1be07075-a120-522d-8243-fa4bc7c1ce07', 'C', 'Splenectomy', false, 2),
  ('a8dc64e0-3109-5681-bd65-838dc96e0abe', '1be07075-a120-522d-8243-fa4bc7c1ce07', 'D', 'Plasma exchange', false, 3),
  ('373a01a0-8b68-54e7-b9a7-a61881a9b7ae', '1be07075-a120-522d-8243-fa4bc7c1ce07', 'E', 'Veno-venous ECMO (extracorporeal membrane oxygenation) for severe refractory hypoxaemia', true, 4);

-- Q537
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('c6b723b6-4f12-589e-a1e7-5ddb56c1b35b', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000035', 'sba', 'A 68 year old man is sedated and ventilated on ICU. Which daily practice reduces the duration of ventilation and ICU stay?', 'Daily sedation interruption, light sedation targets (RASS), spontaneous breathing trials, early mobilisation and delirium monitoring (the ABCDEF bundle) reduce ventilator days, ICU stay and delirium. Over-sedation is associated with worse outcomes. VAP prevention also includes head-of-bed elevation (30-45 degrees) and oral care.', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v3')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = 'c6b723b6-4f12-589e-a1e7-5ddb56c1b35b';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('4e29f412-c217-52d9-9d57-43accbf1fa37', 'c6b723b6-4f12-589e-a1e7-5ddb56c1b35b', 'A', 'Keeping the patient flat', false, 0),
  ('3814222e-d137-5170-abf5-123f08139b1e', 'c6b723b6-4f12-589e-a1e7-5ddb56c1b35b', 'B', 'Continuous deep sedation for all', false, 1),
  ('e6853d47-490b-5109-abaa-0e9f8c940668', 'c6b723b6-4f12-589e-a1e7-5ddb56c1b35b', 'C', 'Daily sedation holds (interruption) combined with spontaneous breathing trials', true, 2),
  ('a58310d8-6b28-5f34-a9ee-b9c704f2ea55', 'c6b723b6-4f12-589e-a1e7-5ddb56c1b35b', 'D', 'Routine neuromuscular blockade', false, 3),
  ('9da95d59-c809-5991-8b59-c327ee4962c9', 'c6b723b6-4f12-589e-a1e7-5ddb56c1b35b', 'E', 'Avoiding physiotherapy', false, 4);

-- Q538
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('3bb8ee00-8e33-59b9-bb43-b4e10830ef3e', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000035', 'sba', 'A 30 year old woman in ICU after major trauma has an arterial line. Which measurement does an arterial line allow?', 'Arterial lines (usually radial, after checking collateral flow) allow continuous BP monitoring (essential for vasopressors and unstable patients) and repeated ABG sampling. Complications include ischaemia, infection, bleeding and accidental drug injection. Central venous catheters allow CVP measurement, vasopressor infusion and ScvO2 sampling.', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v3')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = '3bb8ee00-8e33-59b9-bb43-b4e10830ef3e';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('5c6fcbaa-b95a-5d5e-b16e-4a39e139cf95', '3bb8ee00-8e33-59b9-bb43-b4e10830ef3e', 'A', 'Intracranial pressure', false, 0),
  ('d4e5e9d0-b941-58b4-a87f-add5c5e7ab2c', '3bb8ee00-8e33-59b9-bb43-b4e10830ef3e', 'B', 'Cardiac output directly in all cases', false, 1),
  ('2fafe766-be23-5ac9-8bfe-2e9fb111ed72', '3bb8ee00-8e33-59b9-bb43-b4e10830ef3e', 'C', 'Pulmonary artery wedge pressure', false, 2),
  ('c2ddf381-da08-57c6-a07f-1f95d8d85214', '3bb8ee00-8e33-59b9-bb43-b4e10830ef3e', 'D', 'Continuous beat-to-beat blood pressure monitoring and frequent arterial blood gas sampling', true, 3),
  ('b881d7ed-2332-56cc-b2c7-8cde7223cdf1', '3bb8ee00-8e33-59b9-bb43-b4e10830ef3e', 'E', 'Central venous pressure', false, 4);

-- Q539
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('45946178-408e-5b9c-85de-5e37fe487bb4', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000025', 'sba', 'A chest X-ray (PA view) shows a cardiothoracic ratio of 0.6. What does this suggest?', 'On a PA chest X-ray, a cardiothoracic ratio over 0.5 suggests cardiomegaly. On AP films (often portable), the heart looks larger, so CTR is less reliable. Causes include heart failure, cardiomyopathy and pericardial effusion (globular ''water bottle'' heart). Echo assesses structure and function.', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v3')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = '45946178-408e-5b9c-85de-5e37fe487bb4';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('2f3a0d49-a404-51b2-a8a6-a10fa0d975ee', '45946178-408e-5b9c-85de-5e37fe487bb4', 'A', 'Pleural effusion', false, 0),
  ('12d38692-2a88-535b-9eb8-d47126b0f4cd', '45946178-408e-5b9c-85de-5e37fe487bb4', 'B', 'Pneumothorax', false, 1),
  ('651a3f95-2f34-5037-bb2f-580faec1b7dd', '45946178-408e-5b9c-85de-5e37fe487bb4', 'C', 'Dextrocardia', false, 2),
  ('ce04d38f-d40b-5199-b5c5-4b71c92c0521', '45946178-408e-5b9c-85de-5e37fe487bb4', 'D', 'Cardiomegaly (CTR over 0.5 on a PA film)', true, 3),
  ('daee6d53-5084-52d9-8785-94a394aeb3c5', '45946178-408e-5b9c-85de-5e37fe487bb4', 'E', 'Normal heart size', false, 4);

-- Q540
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('e0509966-633b-56a9-a824-959594596e44', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000025', 'sba', 'A nasogastric tube has been placed for feeding. The pH of the aspirate is 6.5. What is the SINGLE most appropriate next step?', 'NHS Improvement guidance: check NG tube position by aspirate pH (5.5 or below is acceptable to feed). If pH is above 5.5 or no aspirate, get an X-ray read by a competent person: the tube should follow the oesophagus, bisect the carina, cross the diaphragm in the midline and have its tip below the left hemidiaphragm. The ''whoosh test'' is unsafe. Feeding through a misplaced tube in the lung is a never event.', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v3')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = 'e0509966-633b-56a9-a824-959594596e44';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('71441e77-548a-5f77-bcbb-c5ce05151df0', 'e0509966-633b-56a9-a824-959594596e44', 'A', 'Flush with water and start feeding', false, 0),
  ('953b1395-b1ac-523f-8057-db4de5dc1a92', 'e0509966-633b-56a9-a824-959594596e44', 'B', 'Auscultate with air injection (''whoosh test'') and feed', false, 1),
  ('b3279445-d835-5f16-9930-d278aff60018', 'e0509966-633b-56a9-a824-959594596e44', 'C', 'Do not feed; obtain a chest X-ray to confirm the tube position (tip below the diaphragm in the stomach)', true, 2),
  ('8cb72531-aa45-5169-9eae-4108bf7a487a', 'e0509966-633b-56a9-a824-959594596e44', 'D', 'Start feeding immediately', false, 3),
  ('fb771c71-2b69-5b13-9dbf-c670c557c4c9', 'e0509966-633b-56a9-a824-959594596e44', 'E', 'Assume it is correctly placed', false, 4);

-- Q541
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('9ba2c8d0-5365-5ef2-8d35-287c20feadc4', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000025', 'sba', 'A chest X-ray is taken after intubation in ICU. Where should the tip of a correctly placed endotracheal tube lie?', 'The ETT tip should lie in mid-trachea, about 5 cm above the carina (roughly level with the clavicular heads), with the head in a neutral position. Too deep tends to enter the right main bronchus (steeper and wider), causing left lung collapse. Capnography confirms tracheal placement. The X-ray confirms depth.', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v3')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = '9ba2c8d0-5365-5ef2-8d35-287c20feadc4';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('ac3b4612-bdaa-5813-90dc-7f46a3715fac', '9ba2c8d0-5365-5ef2-8d35-287c20feadc4', 'A', 'In the oesophagus', false, 0),
  ('78d49733-bb47-51f9-be11-27ee5764a8a2', '9ba2c8d0-5365-5ef2-8d35-287c20feadc4', 'B', 'At the carina', false, 1),
  ('633582c1-a338-56ac-b559-3e263e9e8130', '9ba2c8d0-5365-5ef2-8d35-287c20feadc4', 'C', 'In the right main bronchus', false, 2),
  ('92ab0986-472f-5ad8-a610-d2df20e8cd93', '9ba2c8d0-5365-5ef2-8d35-287c20feadc4', 'D', 'About 5 cm (3-7 cm) above the carina, in mid-trachea', true, 3),
  ('4051ec47-6ff4-5ce2-9d54-675fca9f5adf', '9ba2c8d0-5365-5ef2-8d35-287c20feadc4', 'E', 'Above the vocal cords', false, 4);

-- Q542
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('432e11e0-862b-573e-a888-1d68fb804bd5', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000025', 'sba', 'A central venous catheter has been inserted through the right internal jugular vein. On chest X-ray, where should the tip ideally lie?', 'The CVC tip should usually be in the lower SVC or at the cavoatrial junction (roughly at the carina level). A tip in the right atrium or ventricle risks arrhythmias and perforation. Always check for pneumothorax after jugular or subclavian insertion. An arterial course suggests accidental arterial cannulation.', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v3')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = '432e11e0-862b-573e-a888-1d68fb804bd5';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('99350210-a33c-528c-8c79-d495b849a059', '432e11e0-862b-573e-a888-1d68fb804bd5', 'A', 'In the lower superior vena cava/cavoatrial junction (around the level of the carina)', true, 0),
  ('80758197-8955-5da7-9bf9-4755a2175f53', '432e11e0-862b-573e-a888-1d68fb804bd5', 'B', 'In the subclavian vein', false, 1),
  ('cdc3fb89-7499-5fda-a5cf-532eb9ee4f7d', '432e11e0-862b-573e-a888-1d68fb804bd5', 'C', 'In the right ventricle', false, 2),
  ('e69f692f-2171-5995-912f-bb205b505e14', '432e11e0-862b-573e-a888-1d68fb804bd5', 'D', 'In the aortic arch', false, 3),
  ('032d878a-8b3f-565f-a2cf-4d4908a47e27', '432e11e0-862b-573e-a888-1d68fb804bd5', 'E', 'In the right atrium deep', false, 4);

-- Q543
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('29b57e1d-f748-5f9d-96e3-35964cdb341e', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000025', 'sba', 'An abdominal X-ray shows dilated bowel loops with valvulae conniventes crossing the entire width, located centrally, measuring 4 cm. What does this indicate?', 'The ''3-6-9 rule'': upper limits of normal diameter are 3 cm for small bowel, 6 cm for colon and 9 cm for caecum. Small bowel is central, with valvulae conniventes crossing the full width. Large bowel is peripheral, with haustra that do not cross the full width. CT abdomen identifies the cause and level of obstruction and any complications.', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v3')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = '29b57e1d-f748-5f9d-96e3-35964cdb341e';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('e2d2b787-4640-5f95-92a5-809512980e38', '29b57e1d-f748-5f9d-96e3-35964cdb341e', 'A', 'Large bowel obstruction', false, 0),
  ('ce2bed7c-d441-5bf4-83ee-bbdc6e3ff7be', '29b57e1d-f748-5f9d-96e3-35964cdb341e', 'B', 'Toxic megacolon', false, 1),
  ('365199a0-f93e-5437-967e-35601c52ce0a', '29b57e1d-f748-5f9d-96e3-35964cdb341e', 'C', 'Normal bowel gas pattern', false, 2),
  ('e796326e-52cf-5e10-8913-4b2882e455aa', '29b57e1d-f748-5f9d-96e3-35964cdb341e', 'D', 'Sigmoid volvulus', false, 3),
  ('f969e502-3208-55ac-b08a-7af2969c2c70', '29b57e1d-f748-5f9d-96e3-35964cdb341e', 'E', 'Small bowel obstruction (small bowel over 3 cm is dilated)', true, 4);

-- Q544
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('27d58902-3482-5990-9622-c0b78eb9ee88', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000025', 'sba', 'A 30 year old woman with ulcerative colitis has an abdominal X-ray showing a featureless colon without haustral markings (''lead pipe''). What does this suggest?', 'A ''lead pipe'' colon (smooth, narrowed, featureless, with loss of haustra) indicates long-standing UC. Thumbprinting (mucosal oedema) suggests ischaemic or inflammatory colitis. A transverse colon over 6 cm in acute colitis suggests toxic megacolon. Crohn''s disease shows ''string sign'' strictures, skip lesions and cobblestoning on contrast studies.', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v3')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = '27d58902-3482-5990-9622-c0b78eb9ee88';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('2de5aeef-b63d-5f53-9a3b-d0649be1c9b5', '27d58902-3482-5990-9622-c0b78eb9ee88', 'A', 'Acute small bowel obstruction', false, 0),
  ('66a43fd8-7adf-5e63-9607-d5433d01cb29', '27d58902-3482-5990-9622-c0b78eb9ee88', 'B', 'Chronic ulcerative colitis (loss of haustration)', true, 1),
  ('5d1f2444-84df-5c66-adb9-c14955723203', '27d58902-3482-5990-9622-c0b78eb9ee88', 'C', 'Normal colon', false, 2),
  ('18398976-53ef-5823-9f02-68ce7a29b817', '27d58902-3482-5990-9622-c0b78eb9ee88', 'D', 'Crohn''s disease with strictures', false, 3),
  ('af33c09d-cd3c-5470-ad67-2a98e2e5630b', '27d58902-3482-5990-9622-c0b78eb9ee88', 'E', 'Sigmoid volvulus', false, 4);

-- Q545
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('66db1f02-7826-5ac1-b929-e25439a2640f', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000025', 'sba', 'A 30 year old woman asks how much radiation she will get from a CT scan of her abdomen and pelvis compared with a chest X-ray. Which is the BEST estimate?', 'Approximate effective doses: chest X-ray 0.02 mSv (about 3 days of background radiation); CT head about 2 mSv; CT chest about 6 mSv; CT abdomen and pelvis about 10 mSv. Average UK background radiation is about 2.7 mSv per year. Justify all exposures (IR(ME)R), and use ultrasound or MRI where appropriate, especially in children and pregnancy.', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v3')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = '66db1f02-7826-5ac1-b929-e25439a2640f';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('b0d6a6cd-f074-5951-93f3-e441b9af176d', '66db1f02-7826-5ac1-b929-e25439a2640f', 'A', 'No radiation is involved', false, 0),
  ('e5fe1923-4eb7-544b-aadb-df167dcc2d2f', '66db1f02-7826-5ac1-b929-e25439a2640f', 'B', 'Roughly 400-500 chest X-rays (about 10 mSv, roughly 3-4 years of natural background radiation)', true, 1),
  ('0f01ba54-3ca7-59ea-ba4e-b97d5f990263', '66db1f02-7826-5ac1-b929-e25439a2640f', 'C', 'About 10 chest X-rays', false, 2),
  ('4efe1e2f-c94c-5887-883b-e5875bcf9887', '66db1f02-7826-5ac1-b929-e25439a2640f', 'D', 'The same as one chest X-ray', false, 3),
  ('7dd68f53-2b19-57f2-8d16-8fa442916151', '66db1f02-7826-5ac1-b929-e25439a2640f', 'E', 'About 1 million chest X-rays', false, 4);

-- Q546
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('e174c691-c854-54d0-8842-45a935c35cd8', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000025', 'sba', 'A 4 month old baby has suspected pyloric stenosis. What is the investigation of choice?', 'Ultrasound is first-line for pyloric stenosis, showing a thickened pyloric muscle (over 3 mm) and elongated canal (over 15 mm). It is also first-line for intussusception (target or doughnut sign), and helps assess hip effusion and appendicitis in children. Treatment of pyloric stenosis is fluid and electrolyte correction, then pyloromyotomy.', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v3')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = 'e174c691-c854-54d0-8842-45a935c35cd8';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('0cfa1c92-1b8d-5286-98c2-c4ca9dd96a8a', 'e174c691-c854-54d0-8842-45a935c35cd8', 'A', 'Upper GI endoscopy', false, 0),
  ('5f48e74d-7ead-5fae-8b58-b230df2ec043', 'e174c691-c854-54d0-8842-45a935c35cd8', 'B', 'CT abdomen', false, 1),
  ('5fe8d59e-c544-5d7d-a3bd-c0542607d135', 'e174c691-c854-54d0-8842-45a935c35cd8', 'C', 'Barium swallow', false, 2),
  ('f62b7f7f-ddfb-5e46-806b-14bee6fd7362', 'e174c691-c854-54d0-8842-45a935c35cd8', 'D', 'Abdominal ultrasound (thickened, elongated pylorus)', true, 3),
  ('3cd7a58c-2716-5a37-a1f0-71ef0cf65c6f', 'e174c691-c854-54d0-8842-45a935c35cd8', 'E', 'Abdominal X-ray', false, 4);

-- Q547
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('b245a0eb-6363-5562-ae8e-f39fd7674c0c', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000025', 'sba', 'A 60 year old man has back pain and his skull X-ray shows multiple small, well-defined lytic lesions (''pepper-pot skull''). Which is the SINGLE most likely diagnosis?', 'Myeloma causes punched-out lytic lesions (pepper-pot skull) and may show no uptake on isotope bone scan (osteoclastic with little osteoblastic activity), so whole-body low-dose CT or MRI is used. Prostate cancer metastases are typically sclerotic (osteoblastic). Hyperparathyroidism gives ''salt-and-pepper'' skull and subperiosteal resorption.', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v3')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = 'b245a0eb-6363-5562-ae8e-f39fd7674c0c';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('2e717e18-a5fb-5892-a855-afd9c8e437bc', 'b245a0eb-6363-5562-ae8e-f39fd7674c0c', 'A', 'Multiple myeloma', true, 0),
  ('88754ab3-720a-5db3-acd9-cb0e6c7bc2b5', 'b245a0eb-6363-5562-ae8e-f39fd7674c0c', 'B', 'Hyperparathyroidism', false, 1),
  ('62f4d10e-d55c-5b31-ad08-9f9331fe673e', 'b245a0eb-6363-5562-ae8e-f39fd7674c0c', 'C', 'Paget''s disease', false, 2),
  ('b688f0a4-eea5-556e-9344-46427cdf7080', 'b245a0eb-6363-5562-ae8e-f39fd7674c0c', 'D', 'Osteoporosis', false, 3),
  ('20830119-5dc3-553b-87a3-b4fb3f6a867a', 'b245a0eb-6363-5562-ae8e-f39fd7674c0c', 'E', 'Bone metastases from prostate cancer (sclerotic)', false, 4);

-- Q548
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('42b52c6f-e3e0-5fdf-9c00-1a3ecafd93df', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000025', 'sba', 'A 65 year old woman''s hand X-ray shows loss of joint space, osteophytes, subchondral sclerosis and subchondral cysts at the distal interphalangeal joints. Which condition does this show?', 'OA X-ray features (LOSS): Loss of joint space, Osteophytes, Subchondral sclerosis, Subchondral cysts. Heberden''s (DIP) and Bouchard''s (PIP) nodes are typical. RA shows periarticular osteopenia, soft-tissue swelling, marginal erosions and symmetrical joint space loss (MCP, PIP). Gout shows ''punched-out'' erosions with overhanging edges. Psoriatic arthritis can show ''pencil-in-cup'' deformity.', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v3')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = '42b52c6f-e3e0-5fdf-9c00-1a3ecafd93df';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('a3f7c212-0071-51a8-a441-b66703f56c0e', '42b52c6f-e3e0-5fdf-9c00-1a3ecafd93df', 'A', 'Psoriatic arthritis', false, 0),
  ('0c04b519-b7d0-5cb9-b849-513cf1dd1ec5', '42b52c6f-e3e0-5fdf-9c00-1a3ecafd93df', 'B', 'Ankylosing spondylitis', false, 1),
  ('6d1376b8-3efb-59cb-b7eb-b726cba246bd', '42b52c6f-e3e0-5fdf-9c00-1a3ecafd93df', 'C', 'Osteoarthritis', true, 2),
  ('c8b45b40-4f0b-56d3-852c-304ac9b96540', '42b52c6f-e3e0-5fdf-9c00-1a3ecafd93df', 'D', 'Gout', false, 3),
  ('8aae89f9-16b0-57f9-abf3-e0e4e3a2800a', '42b52c6f-e3e0-5fdf-9c00-1a3ecafd93df', 'E', 'Rheumatoid arthritis', false, 4);

-- Q549
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('a940c809-499d-5485-8c5c-c3ed4c202dde', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000025', 'sba', 'A 30 year old man has inflammatory back pain. His spinal X-ray shows vertical syndesmophytes fusing the vertebrae and squaring of the vertebral bodies (''bamboo spine''). What is the SINGLE most likely diagnosis?', 'Advanced ankylosing spondylitis shows squaring of the vertebral bodies, marginal syndesmophytes and fusion (bamboo spine), plus bilateral sacroiliitis. Early disease may only be seen on MRI. DISH (in older people) has flowing anterior ossification over 4 or more vertebrae with preserved disc spaces and normal sacroiliac joints. A fused spine is prone to fractures even with minor trauma.', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v3')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = 'a940c809-499d-5485-8c5c-c3ed4c202dde';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('16ca6b59-9667-5eaf-9447-f70a9fdee8e3', 'a940c809-499d-5485-8c5c-c3ed4c202dde', 'A', 'Paget''s disease', false, 0),
  ('fe558bdc-8e71-5a8d-8df0-bbcd6070a26b', 'a940c809-499d-5485-8c5c-c3ed4c202dde', 'B', 'Diffuse idiopathic skeletal hyperostosis', false, 1),
  ('87e5bb57-a7cf-5f21-a06e-13d4876e21b8', 'a940c809-499d-5485-8c5c-c3ed4c202dde', 'C', 'Osteoarthritis of the spine', false, 2),
  ('cf7ca85d-9ea1-5182-bf21-81a43d4a5696', 'a940c809-499d-5485-8c5c-c3ed4c202dde', 'D', 'Ankylosing spondylitis (advanced)', true, 3),
  ('5f8637b8-4ae2-51c6-8b6e-ab2e4920610e', 'a940c809-499d-5485-8c5c-c3ed4c202dde', 'E', 'Multiple myeloma', false, 4);

-- Q550
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('d4ba3b74-86c6-5896-9769-d12f77f4d4c9', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000025', 'sba', 'A 60 year old man has a suspected stroke 2 hours after onset. Which imaging is first-line in the emergency department?', 'NICE NG128: immediate non-contrast CT head for suspected acute stroke, to exclude haemorrhage before thrombolysis. Add CT angiography (and CT perfusion when indicated) if thrombectomy may be suitable. MRI with DWI is more sensitive for small infarcts and posterior circulation strokes but is less available.', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v3')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = 'd4ba3b74-86c6-5896-9769-d12f77f4d4c9';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('d1878a2f-f012-5925-a91d-01d97d3b8d0b', 'd4ba3b74-86c6-5896-9769-d12f77f4d4c9', 'A', 'Non-contrast CT head (with CT angiography if thrombectomy is being considered)', true, 0),
  ('c72fca42-d114-5724-9682-86c00cc4a0d6', 'd4ba3b74-86c6-5896-9769-d12f77f4d4c9', 'B', 'MRI brain in all cases first', false, 1),
  ('452d4ac2-d1d3-526c-b00a-02b2a7adebdd', 'd4ba3b74-86c6-5896-9769-d12f77f4d4c9', 'C', 'Skull X-ray', false, 2),
  ('25ac7e87-659e-53b9-8ab3-ab9aef8dbe07', 'd4ba3b74-86c6-5896-9769-d12f77f4d4c9', 'D', 'Carotid Doppler first', false, 3),
  ('2c924b81-c923-59b1-81c9-66ffc9ec4686', 'd4ba3b74-86c6-5896-9769-d12f77f4d4c9', 'E', 'EEG', false, 4);

-- Q551
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('f4065b56-e755-5340-83f4-86c0630f81c1', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000025', 'sba', 'A 25 year old man has a suspected right ureteric stone. What is the first-line imaging for adults within 24 hours of presentation?', 'NICE NG118: low-dose non-contrast CT KUB within 24 hours for adults with suspected renal colic. Ultrasound is first-line for pregnant women and children. CT shows stone size and position, hydronephrosis and alternative diagnoses. Over 90% of stones are radio-opaque on CT.', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v3')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = 'f4065b56-e755-5340-83f4-86c0630f81c1';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('7aa6c22f-b563-51d3-9972-3fccc984fde7', 'f4065b56-e755-5340-83f4-86c0630f81c1', 'A', 'Low-dose non-contrast CT of the kidneys, ureters and bladder (CT KUB)', true, 0),
  ('47586ca1-0dce-51e5-8eed-8843357bb389', 'f4065b56-e755-5340-83f4-86c0630f81c1', 'B', 'IV urogram', false, 1),
  ('7f75aa23-768c-55c6-b2bb-86f38ddbb812', 'f4065b56-e755-5340-83f4-86c0630f81c1', 'C', 'MRI urogram', false, 2),
  ('8eb86a0a-1b77-529f-8c31-d8e36be718b3', 'f4065b56-e755-5340-83f4-86c0630f81c1', 'D', 'Plain X-ray KUB alone', false, 3),
  ('fd951ace-644c-5519-bd70-19a98fecea43', 'f4065b56-e755-5340-83f4-86c0630f81c1', 'E', 'Renal ultrasound in all adults first', false, 4);

-- Q552
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('3668514f-b3f2-5e45-a939-5ae5aed3b350', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000025', 'sba', 'A 70 year old woman has a vertebral fracture on X-ray after minor trauma. Which investigation is the gold standard for diagnosing osteoporosis?', 'DEXA measures bone mineral density. T-score (compared with young adults): above -1 is normal, -1 to -2.5 is osteopenia, -2.5 or below is osteoporosis. Z-scores (compared with age-matched people) are used in children and premenopausal women. FRAX estimates 10-year fracture probability, and the NOGG thresholds guide treatment.', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v3')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = '3668514f-b3f2-5e45-a939-5ae5aed3b350';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('209be63f-643b-55e7-874d-e84385eaac23', '3668514f-b3f2-5e45-a939-5ae5aed3b350', 'A', 'DEXA (dual-energy X-ray absorptiometry) of the hip and lumbar spine', true, 0),
  ('f89d3b58-ce47-5597-8b32-b34ad346c41a', '3668514f-b3f2-5e45-a939-5ae5aed3b350', 'B', 'Plain X-ray of the spine', false, 1),
  ('6d57548e-f447-5612-998b-4cc96d238d07', '3668514f-b3f2-5e45-a939-5ae5aed3b350', 'C', 'Serum calcium', false, 2),
  ('cc6431b4-4cc8-5d78-912d-5d589f685f92', '3668514f-b3f2-5e45-a939-5ae5aed3b350', 'D', 'Isotope bone scan', false, 3),
  ('d56df1b3-d057-5d83-96bd-c34d539cf471', '3668514f-b3f2-5e45-a939-5ae5aed3b350', 'E', 'CT of the spine', false, 4);

-- Q553
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('06763213-ba52-5b7d-86e5-7863d7217073', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000025', 'sba', 'A 55 year old woman with breast cancer has bone pain. Which imaging test is commonly used to detect bone metastases across the whole skeleton?', 'An isotope bone scan (technetium-99m MDP) shows areas of increased bone turnover such as metastases (breast, prostate), fractures, Paget''s disease and infection. It is less sensitive for purely lytic lesions (such as myeloma). PSMA PET-CT is increasingly used for prostate cancer, and PET-CT and whole-body MRI are also used for staging.', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v3')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = '06763213-ba52-5b7d-86e5-7863d7217073';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('dffc8c80-3788-5722-916e-252f47e1ba2c', '06763213-ba52-5b7d-86e5-7863d7217073', 'A', 'Plain X-ray of every bone', false, 0),
  ('2bc8b6f7-d292-51eb-9275-0c94e0fc59cb', '06763213-ba52-5b7d-86e5-7863d7217073', 'B', 'DEXA scan', false, 1),
  ('0c60a02e-68c1-56f1-b549-c7db2e46e5e2', '06763213-ba52-5b7d-86e5-7863d7217073', 'C', 'Mammography', false, 2),
  ('bba3bf2c-213b-5f78-8398-d146f859d707', '06763213-ba52-5b7d-86e5-7863d7217073', 'D', 'Isotope bone scan (or whole-body MRI/PET-CT)', true, 3),
  ('a2ecfff7-96d5-5fce-8fab-dfd0ec221ced', '06763213-ba52-5b7d-86e5-7863d7217073', 'E', 'Ultrasound', false, 4);

-- Q554
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('8d2d80d7-71fe-54fc-99a2-4e5dade117f9', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000025', 'sba', 'A 40 year old woman has RUQ pain and fever. Ultrasound shows a gallbladder with stones but no definite cholecystitis. Which investigation can show cystic duct obstruction if acute cholecystitis is suspected but uncertain?', 'Ultrasound is first-line for gallbladder disease. A HIDA scan shows whether the gallbladder fills. Non-filling suggests cystic duct obstruction (acute cholecystitis). MRCP is used to detect common bile duct stones. ERCP is mainly therapeutic (stone extraction, stenting) because of its risks (pancreatitis, perforation).', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v3')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = '8d2d80d7-71fe-54fc-99a2-4e5dade117f9';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('fbe0e61d-56e6-50cc-bb9c-c19be1f08f56', '8d2d80d7-71fe-54fc-99a2-4e5dade117f9', 'A', 'Plain abdominal X-ray', false, 0),
  ('b18f3437-7216-5c76-bcf0-e79c34cc6e75', '8d2d80d7-71fe-54fc-99a2-4e5dade117f9', 'B', 'MRCP only', false, 1),
  ('e6f01277-dfd1-5d53-a5ae-59c8d0014685', '8d2d80d7-71fe-54fc-99a2-4e5dade117f9', 'C', 'ERCP', false, 2),
  ('c66a6a90-c03c-5c40-b2f2-13b2f75bf1b2', '8d2d80d7-71fe-54fc-99a2-4e5dade117f9', 'D', 'HIDA (cholescintigraphy) scan', true, 3),
  ('3295be3a-7d04-58af-8bfd-7c84a88352df', '8d2d80d7-71fe-54fc-99a2-4e5dade117f9', 'E', 'Barium meal', false, 4);

-- Q555
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('7dac43aa-8f22-5261-b727-18de28ca135c', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000025', 'sba', 'A 35 year old man has a head injury from a fall. He has a GCS of 15, but he vomited twice and has a boggy swelling behind his ear with blood behind the eardrum. What does this suggest and what imaging is needed?', 'NICE NG232 indications for CT head within 1 hour include: GCS below 13 on initial assessment, or below 15 at 2 hours; suspected open, depressed or basal skull fracture (haemotympanum, ''panda eyes'', Battle''s sign, CSF leak); post-traumatic seizure; focal neurological deficit; and more than 1 episode of vomiting. Anticoagulated patients need CT within 8 hours, or 1 hour if they have other risk factors.', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v3')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = '7dac43aa-8f22-5261-b727-18de28ca135c';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('0053e386-00ae-51c0-a6da-81d117331c2b', '7dac43aa-8f22-5261-b727-18de28ca135c', 'A', 'No injury; discharge', false, 0),
  ('d9215226-229d-56b1-ba66-6c80cd0576cb', '7dac43aa-8f22-5261-b727-18de28ca135c', 'B', 'Concussion only; no imaging', false, 1),
  ('06b5193e-1bd0-5995-a5e5-bec259a559b4', '7dac43aa-8f22-5261-b727-18de28ca135c', 'C', 'Ear infection; antibiotics', false, 2),
  ('1fbbb313-c8b9-5ddf-a7ec-51158a579f4a', '7dac43aa-8f22-5261-b727-18de28ca135c', 'D', 'Possible basal skull fracture; CT head within 1 hour', true, 3),
  ('0b4f5707-4d8e-5856-b96a-eb580a940fd5', '7dac43aa-8f22-5261-b727-18de28ca135c', 'E', 'Skull X-ray only', false, 4);

-- Q556
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('4343be74-bb61-5bb1-8186-41e1d15beddc', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000022', 'sba', 'A 32 year old woman has had a spontaneous, milky discharge from both nipples for 3 months. She is not pregnant or breastfeeding, and examination of the breasts is normal. What is the SINGLE most appropriate investigation?', 'Bilateral milky discharge (galactorrhoea) is usually hormonal: prolactinoma, drugs (antipsychotics, metoclopramide, SSRIs), hypothyroidism, pregnancy or chronic kidney disease. Check prolactin, pregnancy test and TFTs. A single-duct bloody discharge suggests intraductal papilloma or DCIS and needs breast imaging and referral.', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v3')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = '4343be74-bb61-5bb1-8186-41e1d15beddc';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('7a98bf28-d2d7-5a55-82e3-84507564b351', '4343be74-bb61-5bb1-8186-41e1d15beddc', 'A', 'Ductogram', false, 0),
  ('f0f01604-e6d7-5e8c-8571-9370b9213dc0', '4343be74-bb61-5bb1-8186-41e1d15beddc', 'B', 'Nipple discharge cytology', false, 1),
  ('a9b7b842-101f-5c6a-81de-d10e1ac6c911', '4343be74-bb61-5bb1-8186-41e1d15beddc', 'C', 'Mammogram', false, 2),
  ('2bdc394a-f6c6-5fec-a1cd-1bcc40375598', '4343be74-bb61-5bb1-8186-41e1d15beddc', 'D', 'Breast ultrasound', false, 3),
  ('3a599286-6997-5501-81a1-fbb59e8e9a8b', '4343be74-bb61-5bb1-8186-41e1d15beddc', 'E', 'Serum prolactin (with pregnancy test, TFTs and medication review)', true, 4);

-- Q557
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('2854c2f2-d5b7-5896-8627-8915e535405b', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000022', 'sba', 'A 55 year old woman has a breast lump. Triple assessment confirms invasive ductal carcinoma that is HER2 positive. Which drug is specifically used for HER2-positive breast cancer?', 'About 15-20% of breast cancers overexpress HER2, which is linked to more aggressive disease. Trastuzumab (and pertuzumab or T-DM1) significantly improve outcomes. It can cause cardiotoxicity, so LVEF is monitored by echo or MUGA scan. Hormone therapy is used if the cancer is also ER positive.', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v3')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = '2854c2f2-d5b7-5896-8627-8915e535405b';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('04d515b1-eef3-5225-a107-664274555645', '2854c2f2-d5b7-5896-8627-8915e535405b', 'A', 'Anastrozole alone', false, 0),
  ('939c0693-a2f9-5bce-93f0-c1f7df79b059', '2854c2f2-d5b7-5896-8627-8915e535405b', 'B', 'Tamoxifen alone', false, 1),
  ('7e2aa05c-4e56-51d3-a6cd-404a06cc7afa', '2854c2f2-d5b7-5896-8627-8915e535405b', 'C', 'Trastuzumab (Herceptin)', true, 2),
  ('b6f4d96f-dcb3-512b-aae0-adfb012c5773', '2854c2f2-d5b7-5896-8627-8915e535405b', 'D', 'Rituximab', false, 3),
  ('66e14c16-6350-5412-88b9-46a0acbe08d8', '2854c2f2-d5b7-5896-8627-8915e535405b', 'E', 'Imatinib', false, 4);

-- Q558
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('ae9b8c09-fddd-5a2c-86b0-d2e8931b7e57', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000022', 'sba', 'A 42 year old premenopausal woman has ER-positive breast cancer treated with surgery. Which adjuvant endocrine therapy is MOST appropriate?', 'In premenopausal women, tamoxifen (a selective oestrogen receptor modulator) is the standard adjuvant endocrine therapy. Aromatase inhibitors alone are not effective when the ovaries are working, but are used with ovarian suppression in higher-risk cases. Tamoxifen side effects include VTE, endometrial cancer, hot flushes and cataracts.', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v3')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = 'ae9b8c09-fddd-5a2c-86b0-d2e8931b7e57';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('5958e4f0-7e02-54c4-8551-3745c5e42860', 'ae9b8c09-fddd-5a2c-86b0-d2e8931b7e57', 'A', 'Tamoxifen (for 5-10 years)', true, 0),
  ('60b9a10c-e277-5bab-a483-851a82c71c47', 'ae9b8c09-fddd-5a2c-86b0-d2e8931b7e57', 'B', 'Trastuzumab', false, 1),
  ('4d4911b2-3755-501e-b714-71ae351f3825', 'ae9b8c09-fddd-5a2c-86b0-d2e8931b7e57', 'C', 'No endocrine therapy', false, 2),
  ('66696599-6138-581e-99e9-53eaf4354e53', 'ae9b8c09-fddd-5a2c-86b0-d2e8931b7e57', 'D', 'Anastrozole alone without ovarian suppression', false, 3),
  ('cc99dff9-5d82-5954-8229-18d9d1258284', 'ae9b8c09-fddd-5a2c-86b0-d2e8931b7e57', 'E', 'Letrozole alone without ovarian suppression', false, 4);

-- Q559
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('d2089f6e-1d51-55e1-a14b-8dd7722be3d6', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000022', 'sba', 'A 60 year old woman had axillary node clearance and radiotherapy for breast cancer 2 years ago. She now has a swollen, heavy right arm. What is the SINGLE most likely diagnosis and management?', 'Lymphoedema follows axillary surgery and radiotherapy because of disrupted lymphatic drainage. Management is specialist care: skin care, exercise, compression garments, manual lymphatic drainage and weight control. Treat cellulitis promptly. New swelling may reflect recurrence or DVT, so assess appropriately.', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v3')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = 'd2089f6e-1d51-55e1-a14b-8dd7722be3d6';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('5dd574ab-df00-523f-9e36-303f86ef3dcc', 'd2089f6e-1d51-55e1-a14b-8dd7722be3d6', 'A', 'Recurrence; chemotherapy', false, 0),
  ('db89acea-4f57-560a-96c2-0bd6ba237973', 'd2089f6e-1d51-55e1-a14b-8dd7722be3d6', 'B', 'Cellulitis; antibiotics only', false, 1),
  ('04af4c5e-badc-5972-b065-36f01862a39a', 'd2089f6e-1d51-55e1-a14b-8dd7722be3d6', 'C', 'Lymphoedema; referral to a lymphoedema service for compression garments, skin care and exercise', true, 2),
  ('eb7f6b28-1f8b-5a36-90a0-a983c58f0c7b', 'd2089f6e-1d51-55e1-a14b-8dd7722be3d6', 'D', 'DVT; anticoagulation only', false, 3),
  ('d3ee6491-5473-5acf-8cc3-12c26d11f5df', 'd2089f6e-1d51-55e1-a14b-8dd7722be3d6', 'E', 'Heart failure; furosemide', false, 4);

-- Q560
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('2d18e5c4-5902-5c7c-bc62-cafac1cf23ab', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000022', 'sba', 'A 70 year old woman has a breast lump with peau d''orange, skin redness covering a third of the breast and an enlarged axillary node, developing over weeks. What is the SINGLE most likely diagnosis?', 'Inflammatory breast cancer causes rapid onset of redness, oedema and peau d''orange from tumour emboli in dermal lymphatics, often without a discrete lump. It is aggressive (T4d). Do not treat repeatedly with antibiotics for ''mastitis'' in a non-lactating woman. Refer urgently. Treatment is neoadjuvant chemotherapy, then mastectomy and radiotherapy.', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v3')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = '2d18e5c4-5902-5c7c-bc62-cafac1cf23ab';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('27872b9c-f3eb-52e4-8014-6674a2b05776', '2d18e5c4-5902-5c7c-bc62-cafac1cf23ab', 'A', 'Breast abscess', false, 0),
  ('e883d700-9244-50bd-9099-4df441099f15', '2d18e5c4-5902-5c7c-bc62-cafac1cf23ab', 'B', 'Duct ectasia', false, 1),
  ('4955c64b-e564-50a2-8dd9-b8a74dfb5c87', '2d18e5c4-5902-5c7c-bc62-cafac1cf23ab', 'C', 'Fat necrosis', false, 2),
  ('92b3e036-fd42-5ee1-8ce5-7fee0affeed6', '2d18e5c4-5902-5c7c-bc62-cafac1cf23ab', 'D', 'Mastitis', false, 3),
  ('bd813f48-9a8e-50dd-9850-aa71554e0fa8', '2d18e5c4-5902-5c7c-bc62-cafac1cf23ab', 'E', 'Inflammatory breast cancer', true, 4);

-- Q561
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('cc7c25dc-49cc-5808-b7b1-3455f3023f5c', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000022', 'sba', 'A 55 year old woman has had nipple retraction and a creamy green discharge from multiple ducts for several months. Mammography shows tubular calcifications behind the nipple. What is the SINGLE most likely diagnosis?', 'Duct ectasia (dilated subareolar ducts) occurs around menopause, causing thick, coloured, multi-duct discharge and slit-like nipple retraction. It can be linked to periductal mastitis (smokers). Malignancy must be excluded with triple assessment, as nipple retraction can be a sign of cancer. It is usually managed conservatively, with duct excision if symptoms are troublesome.', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v3')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = 'cc7c25dc-49cc-5808-b7b1-3455f3023f5c';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('827a6c5b-68e4-55dc-8d94-0e5106f95f35', 'cc7c25dc-49cc-5808-b7b1-3455f3023f5c', 'A', 'Invasive lobular carcinoma', false, 0),
  ('2478b5ec-bf80-50d7-8173-b4b59fb1c393', 'cc7c25dc-49cc-5808-b7b1-3455f3023f5c', 'B', 'Duct ectasia', true, 1),
  ('bc5be09f-ebe5-5533-a164-008b4ae481c4', 'cc7c25dc-49cc-5808-b7b1-3455f3023f5c', 'C', 'Intraductal papilloma', false, 2),
  ('d2562ba4-982f-5ba0-a933-bde28467eea3', 'cc7c25dc-49cc-5808-b7b1-3455f3023f5c', 'D', 'Fibroadenoma', false, 3),
  ('51085d94-7b98-5bfd-82a3-c32006216de8', 'cc7c25dc-49cc-5808-b7b1-3455f3023f5c', 'E', 'Paget''s disease of the nipple', false, 4);

-- Q562
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('065b35b8-04d7-5dd4-a695-819a58cd6dd0', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000022', 'sba', 'A 47 year old woman asks about the NHS Breast Screening Programme. Which statement is CORRECT?', 'The NHS Breast Screening Programme invites women aged 50-70 for 2-view mammography every 3 years, and those over 71 can self-refer. Women at higher familial risk have earlier or more frequent screening (sometimes MRI). Screening reduces breast cancer mortality but also causes overdiagnosis.', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v3')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = '065b35b8-04d7-5dd4-a695-819a58cd6dd0';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('03bfcc3a-e8bc-596e-a5cd-0aa4a764402d', '065b35b8-04d7-5dd4-a695-819a58cd6dd0', 'A', 'Women with breast implants cannot be screened', false, 0),
  ('2d763fa1-f794-5ded-a5d1-b72166cecf6f', '065b35b8-04d7-5dd4-a695-819a58cd6dd0', 'B', 'Screening stops at 60', false, 1),
  ('c2fa1595-9439-505f-8fd0-c733554f3eda', '065b35b8-04d7-5dd4-a695-819a58cd6dd0', 'C', 'Screening is annual from age 30', false, 2),
  ('e33b484d-2f8c-5d0f-8437-e3af749cd161', '065b35b8-04d7-5dd4-a695-819a58cd6dd0', 'D', 'Screening uses ultrasound only', false, 3),
  ('38fb4815-ffe4-5e87-8cf4-a34b01055006', '065b35b8-04d7-5dd4-a695-819a58cd6dd0', 'E', 'Women aged 50 to their 71st birthday are invited for mammography every 3 years (with some trial age extensions)', true, 4);

-- Q563
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('d310df0c-0258-564e-afc9-ea48f034742b', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000022', 'sba', 'A 40 year old woman had a ''mammogram-occult'' breast cancer found on MRI. Which group is offered annual MRI surveillance under NICE familial breast cancer guidance?', 'NICE CG164: annual MRI is offered to women at high risk (BRCA1/2 carriers from 30; TP53 carriers from 20), and to some untested women with a very high risk. Mammography is added from 40 in many cases. Dense breast tissue reduces mammographic sensitivity in younger women.', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v3')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = 'd310df0c-0258-564e-afc9-ea48f034742b';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('265fcbe1-bf09-5f75-ae7e-87729eed3157', 'd310df0c-0258-564e-afc9-ea48f034742b', 'A', 'Women with any family history of cancer', false, 0),
  ('ebf6cd18-f8a9-592a-a2d7-4b81a151c86b', 'd310df0c-0258-564e-afc9-ea48f034742b', 'B', 'Women with fibroadenomas', false, 1),
  ('c87c4e7a-ff73-5b04-a01e-241a9391f768', 'd310df0c-0258-564e-afc9-ea48f034742b', 'C', 'Women at very high risk, such as BRCA1/2 or TP53 carriers, typically from age 30 (TP53 from 20)', true, 2),
  ('2683c957-2980-5bd1-8912-2aa0028c66ed', 'd310df0c-0258-564e-afc9-ea48f034742b', 'D', 'Women on the combined pill', false, 3),
  ('dafd8091-870c-5e4e-a733-5ced8fe4b099', 'd310df0c-0258-564e-afc9-ea48f034742b', 'E', 'All women from age 25', false, 4);

-- Q564
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('59024f76-069c-544d-bdbd-6139bfd88d7b', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000022', 'sba', 'A 52 year old woman has a 1.5 cm breast cancer with extensive microcalcification over 6 cm on mammography. Which surgery is MOST appropriate?', 'Mastectomy is chosen for multicentric or extensive disease (including widespread DCIS), large tumour-to-breast ratio, contraindications to radiotherapy, and patient preference. Breast-conserving surgery (wide local excision with radiotherapy) is equivalent for suitable tumours. Immediate or delayed reconstruction should be offered.', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v3')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = '59024f76-069c-544d-bdbd-6139bfd88d7b';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('5add76f3-08c0-5dbf-a219-cc22c7235c08', '59024f76-069c-544d-bdbd-6139bfd88d7b', 'A', 'Lumpectomy without margins', false, 0),
  ('abe3d5ba-1cb3-567d-9fcf-ad5d6b92c59b', '59024f76-069c-544d-bdbd-6139bfd88d7b', 'B', 'Wide local excision', false, 1),
  ('7f3689ea-f2b4-5112-a4a7-7957ed2f67bd', '59024f76-069c-544d-bdbd-6139bfd88d7b', 'C', 'Sentinel node biopsy only', false, 2),
  ('809f8b86-ea76-55a5-adab-73b545745667', '59024f76-069c-544d-bdbd-6139bfd88d7b', 'D', 'No surgery; radiotherapy alone', false, 3),
  ('7cfa0d21-c063-55f0-95fb-c92db1aa3a33', '59024f76-069c-544d-bdbd-6139bfd88d7b', 'E', 'Mastectomy (with option of reconstruction), as the disease is too extensive for breast-conserving surgery', true, 4);

-- Q565
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('098bbfad-ed88-520a-a208-a39b96ecbb26', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000022', 'sba', 'A 62 year old man has a painless, hard lump under his left nipple with skin tethering. What is the SINGLE most appropriate management?', 'Male breast cancer is rare but should be suspected with a unilateral, hard, eccentric, painless lump, especially over 50, with skin or nipple changes. NICE NG12 recommends a 2-week-wait referral for people 50 and over with unilateral nipple changes, or any unexplained breast lump in people 30 and over. Risk factors are BRCA2, Klinefelter syndrome and oestrogen exposure. Gynaecomastia is usually central, rubbery and often bilateral.', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v3')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = '098bbfad-ed88-520a-a208-a39b96ecbb26';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('f9c596b2-ae85-5d69-b671-f260a58566de', '098bbfad-ed88-520a-a208-a39b96ecbb26', 'A', 'Reassure; it is gynaecomastia', false, 0),
  ('7373640f-3ec7-5cf1-b9c5-7facf0b270d9', '098bbfad-ed88-520a-a208-a39b96ecbb26', 'B', 'Oral antibiotics', false, 1),
  ('dd752d63-8db0-5331-8148-d09ab770d56c', '098bbfad-ed88-520a-a208-a39b96ecbb26', 'C', 'Stop all medications only', false, 2),
  ('0a81f224-5532-5580-aa47-68caee0b0fd3', '098bbfad-ed88-520a-a208-a39b96ecbb26', 'D', 'Suspected cancer pathway (two-week wait) referral for triple assessment', true, 3),
  ('3953eebd-ef79-597f-9410-7d2b25530b62', '098bbfad-ed88-520a-a208-a39b96ecbb26', 'E', 'Review in 6 months', false, 4);

-- Q566
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('4aa4267d-4eca-5cff-9829-d6947163ab7f', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000022', 'sba', 'A 30 year old woman who is 5 months postpartum and breastfeeding has a 3 cm tender, fluctuant mass with redness in her breast. Ultrasound confirms an abscess. What is the SINGLE most appropriate management?', 'Lactational breast abscess (usually Staph aureus) is managed with repeated needle aspiration or small-incision drainage under ultrasound, plus antibiotics. Breastfeeding or expressing should continue to empty the breast. Non-lactational abscesses in smokers are often periductal and may recur.', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v3')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = '4aa4267d-4eca-5cff-9829-d6947163ab7f';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('c9398d87-8f87-5c5d-928b-f990d50f2b50', '4aa4267d-4eca-5cff-9829-d6947163ab7f', 'A', 'Ultrasound-guided needle aspiration (repeated if needed) with oral antibiotics (e.g. flucloxacillin); continue breastfeeding or expressing', true, 0),
  ('3543773d-f7f5-5c52-9925-c395afdeb725', '4aa4267d-4eca-5cff-9829-d6947163ab7f', 'B', 'Stop breastfeeding permanently', false, 1),
  ('3602179f-780d-50e4-aef4-93a256fcf7a8', '4aa4267d-4eca-5cff-9829-d6947163ab7f', 'C', 'Oral antibiotics alone without drainage', false, 2),
  ('0f35493b-c1ea-55a5-96f7-62310d3a3d4b', '4aa4267d-4eca-5cff-9829-d6947163ab7f', 'D', 'Open surgical incision and drainage as first-line', false, 3),
  ('e1c9af9c-7a94-5ea2-81e4-4a7947bba8ad', '4aa4267d-4eca-5cff-9829-d6947163ab7f', 'E', 'Mastectomy', false, 4);

-- Q567
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('3a6a7f44-cb21-5cbc-b77e-72f645ef08fa', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000022', 'sba', 'A 50 year old woman has a breast cancer with 4 positive axillary lymph nodes after surgery. Which adjuvant treatment is MOST likely to be recommended in addition to systemic therapy?', 'Adjuvant radiotherapy reduces local recurrence and improves survival in node-positive disease. It is given after breast-conserving surgery in nearly all cases, and after mastectomy for high-risk disease (such as 4 or more nodes or large tumours). NICE recommends 26 Gy in 5 fractions for many patients. Systemic therapy depends on receptor status and risk scores (PREDICT, Oncotype DX).', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v3')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = '3a6a7f44-cb21-5cbc-b77e-72f645ef08fa';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('adae9a7a-2522-5792-9eea-567b317d5036', '3a6a7f44-cb21-5cbc-b77e-72f645ef08fa', 'A', 'Bilateral oophorectomy only', false, 0),
  ('a4a56670-6b0d-5cdc-bfe3-edad3a779a91', '3a6a7f44-cb21-5cbc-b77e-72f645ef08fa', 'B', 'Post-mastectomy or breast/chest wall radiotherapy including the regional nodes', true, 1),
  ('b4057664-b9ff-51e8-bb06-72c8e0758e65', '3a6a7f44-cb21-5cbc-b77e-72f645ef08fa', 'C', 'Topical chemotherapy', false, 2),
  ('2ee8cce9-901c-5a8e-9614-8b3d7415bb58', '3a6a7f44-cb21-5cbc-b77e-72f645ef08fa', 'D', 'Repeat surgery', false, 3),
  ('de433d9a-198d-5681-9e63-3fcf3659f503', '3a6a7f44-cb21-5cbc-b77e-72f645ef08fa', 'E', 'No further treatment', false, 4);

-- Q568
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('77f1a2ae-a766-5954-8d93-dfc86315230c', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000022', 'sba', 'A 35 year old woman has a 1 cm breast lump. Ultrasound shows a well-circumscribed, anechoic lesion with posterior acoustic enhancement. What is the SINGLE most likely diagnosis?', 'Simple cysts are anechoic (fluid-filled) with smooth walls and posterior acoustic enhancement. They are common at 35-50. Asymptomatic simple cysts need no treatment. Painful cysts can be aspirated. Blood-stained aspirate, a residual mass, or complex cyst features need further investigation.', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v3')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = '77f1a2ae-a766-5954-8d93-dfc86315230c';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('62f9d24b-f5a0-5d01-8973-15b6784e73ca', '77f1a2ae-a766-5954-8d93-dfc86315230c', 'A', 'Fibroadenoma', false, 0),
  ('0e181c81-5497-5d3b-8b48-18e3ef83878c', '77f1a2ae-a766-5954-8d93-dfc86315230c', 'B', 'Phyllodes tumour', false, 1),
  ('764b7519-8019-561a-aeab-e9094b654c18', '77f1a2ae-a766-5954-8d93-dfc86315230c', 'C', 'Lipoma', false, 2),
  ('ce9a5782-850c-5cb9-b8a2-cd884c44d4c4', '77f1a2ae-a766-5954-8d93-dfc86315230c', 'D', 'Breast carcinoma', false, 3),
  ('fbd920fb-86ac-52c9-ad1c-f3406ca0a15f', '77f1a2ae-a766-5954-8d93-dfc86315230c', 'E', 'Simple breast cyst', true, 4);

-- Q569
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('ad02884d-9a39-5b17-a7bb-4ce4d05419de', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000022', 'sba', 'A 70 year old woman has a firm, irregular breast mass with skin dimpling. Biopsy shows invasive lobular carcinoma. Which characteristic is typical of lobular carcinoma?', 'Invasive lobular carcinoma (about 10-15% of breast cancers) grows in single-file lines (loss of E-cadherin), is often ER positive, and can be multifocal, bilateral and subtle on mammography (MRI helps). It can spread to unusual sites (peritoneum, GI tract, ovaries). Invasive ductal carcinoma (no special type) is the commonest type.', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v3')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = 'ad02884d-9a39-5b17-a7bb-4ce4d05419de';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('b38f315f-af80-52f5-881b-eb67096be4bb', 'ad02884d-9a39-5b17-a7bb-4ce4d05419de', 'A', 'It is HER2 positive in all cases', false, 0),
  ('977e0b90-e2c1-53c9-8596-305c0a722a90', 'ad02884d-9a39-5b17-a7bb-4ce4d05419de', 'B', 'It only affects men', false, 1),
  ('95b58c6c-1394-5152-acb2-4552e7ba3757', 'ad02884d-9a39-5b17-a7bb-4ce4d05419de', 'C', 'It is often multifocal and bilateral, and can be hard to see on mammography', true, 2),
  ('e4b964d0-112a-5c7b-b3c4-50fa53a480b7', 'ad02884d-9a39-5b17-a7bb-4ce4d05419de', 'D', 'It is always well circumscribed on mammography', false, 3),
  ('3dce8983-62c0-50e1-aee5-b411a1e538ff', 'ad02884d-9a39-5b17-a7bb-4ce4d05419de', 'E', 'It never spreads to unusual sites', false, 4);

-- Q570
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('dac829d0-64c1-578a-99b8-60c1703608ea', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000024', 'sba', 'A 66 year old man with lung cancer has fluid overload, hyponatraemia (sodium 119 mmol/L), confusion, and a low serum osmolality with inappropriately concentrated urine. Fluid restriction has failed. Which drug may be used under specialist advice?', 'SIADH (often from small cell lung cancer) is treated by managing the cause and fluid restriction. If this fails, demeclocycline (induces nephrogenic DI) or tolvaptan (V2 receptor antagonist, specialist use) can be used. Severe symptomatic hyponatraemia needs hypertonic saline. Correct slowly to avoid osmotic demyelination.', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v3')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = 'dac829d0-64c1-578a-99b8-60c1703608ea';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('33018dca-4486-5801-a4f4-70a1b21734eb', 'dac829d0-64c1-578a-99b8-60c1703608ea', 'A', 'Furosemide alone', false, 0),
  ('6cc5028e-c078-5861-8f5a-dad5a6b2e7ef', 'dac829d0-64c1-578a-99b8-60c1703608ea', 'B', 'Desmopressin', false, 1),
  ('9a9bfed3-82f9-5dc9-b6bc-e22e22ca8d29', 'dac829d0-64c1-578a-99b8-60c1703608ea', 'C', 'IV 0.9% saline at a high rate', false, 2),
  ('60b4dbde-68e0-5e51-917c-abfcf5378190', 'dac829d0-64c1-578a-99b8-60c1703608ea', 'D', 'Tolvaptan (vasopressin V2 receptor antagonist) or demeclocycline', true, 3),
  ('0e9260b9-c199-5004-b02f-803fc1173a16', 'dac829d0-64c1-578a-99b8-60c1703608ea', 'E', 'Spironolactone', false, 4);

-- Q571
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('0d372812-7d98-520a-b731-2341325060c6', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000024', 'sba', 'A 55 year old woman has had a 2 cm firm, painless lump in her neck for 4 weeks. She is otherwise well. What is the SINGLE most appropriate first investigation?', 'Unexplained neck lumps in adults (especially over 45, or persisting more than 3 weeks) need assessment for malignancy (lymphoma, head and neck cancer, thyroid cancer, metastases). Ultrasound-guided FNA or core biopsy are first-line. Excision biopsy is preferred if lymphoma is suspected. NICE NG12 suggests urgent referral pathways.', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v3')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = '0d372812-7d98-520a-b731-2341325060c6';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('28765fab-15e8-5320-9514-8f062f53f855', '0d372812-7d98-520a-b731-2341325060c6', 'A', 'No investigation', false, 0),
  ('7b340ec1-7c30-5e14-8339-cbb405eb49ce', '0d372812-7d98-520a-b731-2341325060c6', 'B', 'CT brain', false, 1),
  ('beed18f7-0a35-521c-838e-e323fc4c2b9c', '0d372812-7d98-520a-b731-2341325060c6', 'C', 'Ultrasound of the neck with fine needle aspiration/core biopsy (via urgent referral)', true, 2),
  ('be4ed7b4-4222-5a90-97f5-d28b114ee500', '0d372812-7d98-520a-b731-2341325060c6', 'D', 'Excision of the node in primary care', false, 3),
  ('a3320583-03e4-52f6-9185-47c2a6e77ed4', '0d372812-7d98-520a-b731-2341325060c6', 'E', 'Antibiotics and review in 6 months', false, 4);

-- Q572
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('564ed43f-72d6-5223-8a2c-ca20e328f47c', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000024', 'sba', 'A 60 year old man has had chemotherapy with 5-fluorouracil. He has severe diarrhoea, mucositis and neutropenia after the first dose. Which enzyme deficiency is MOST likely responsible?', 'DPD breaks down 5-FU and capecitabine. Deficiency causes severe, sometimes fatal, toxicity (mucositis, diarrhoea, neutropenia, neurotoxicity). Since 2020 the MHRA advises testing for DPD deficiency before starting fluoropyrimidines. Uridine triacetate is an antidote.', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v3')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = '564ed43f-72d6-5223-8a2c-ca20e328f47c';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('d5b7e2a5-430e-5bfb-a985-ab0b46b90fb5', '564ed43f-72d6-5223-8a2c-ca20e328f47c', 'A', 'Dihydropyrimidine dehydrogenase (DPD) deficiency', true, 0),
  ('5f1cd380-6e41-5678-869b-95fa985b5c11', '564ed43f-72d6-5223-8a2c-ca20e328f47c', 'B', 'TPMT deficiency', false, 1),
  ('23cda0e1-0c5c-549e-841d-bd8cb7dd0cb0', '564ed43f-72d6-5223-8a2c-ca20e328f47c', 'C', 'Alpha-1 antitrypsin deficiency', false, 2),
  ('8b9c5ae0-c520-584b-bbf3-79451361b5a3', '564ed43f-72d6-5223-8a2c-ca20e328f47c', 'D', 'G6PD deficiency', false, 3),
  ('1cc7c194-2b74-5d17-9118-0b34a5849d04', '564ed43f-72d6-5223-8a2c-ca20e328f47c', 'E', 'Pseudocholinesterase deficiency', false, 4);

-- Q573
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('4fcd4a4f-0ad3-570c-9575-0fd663c69472', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000024', 'sba', 'A 65 year old woman on cisplatin chemotherapy reports tinnitus and hearing loss, and her creatinine has risen. Which toxicities are characteristic of cisplatin?', 'Cisplatin causes nephrotoxicity (prevented with IV hydration and magnesium), ototoxicity, peripheral neuropathy, hypomagnesaemia and highly emetogenic nausea. Other classic toxicities: doxorubicin (cardiotoxicity), bleomycin (pulmonary fibrosis), cyclophosphamide (haemorrhagic cystitis, prevented with mesna), vincristine (neuropathy), and capecitabine (hand-foot syndrome).', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v3')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = '4fcd4a4f-0ad3-570c-9575-0fd663c69472';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('d92bae7f-0e54-52eb-82e6-71c4891c4c6c', '4fcd4a4f-0ad3-570c-9575-0fd663c69472', 'A', 'Haemorrhagic cystitis', false, 0),
  ('2b400490-8db3-5743-a390-c8833f103467', '4fcd4a4f-0ad3-570c-9575-0fd663c69472', 'B', 'Pulmonary fibrosis only', false, 1),
  ('f8a148d4-7656-522e-8093-87860a54b158', '4fcd4a4f-0ad3-570c-9575-0fd663c69472', 'C', 'Nephrotoxicity, ototoxicity, peripheral neuropathy and severe nausea/vomiting', true, 2),
  ('a1a8000e-27cb-518f-af9d-87df987c6fbd', '4fcd4a4f-0ad3-570c-9575-0fd663c69472', 'D', 'Hand-foot syndrome only', false, 3),
  ('88dd7f36-fb8d-5f87-af30-e77312b46ee3', '4fcd4a4f-0ad3-570c-9575-0fd663c69472', 'E', 'Cardiotoxicity and red urine', false, 4);

-- Q574
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('99ff21e5-4dde-56fe-ad94-1ddd1ad0e802', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000024', 'sba', 'A 56 year old man with metastatic melanoma is treated with an immune checkpoint inhibitor (pembrolizumab). Six weeks later he has diarrhoea 8 times a day with blood. What is the SINGLE most likely diagnosis and treatment?', 'Checkpoint inhibitors (anti-PD-1, anti-PD-L1, anti-CTLA-4) can cause immune-related adverse events in any organ: colitis, hepatitis, pneumonitis, thyroiditis, hypophysitis, adrenalitis, type 1 diabetes and myocarditis. Moderate-severe toxicity is treated by stopping the drug and giving steroids, with infliximab for refractory colitis. Exclude infection.', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v3')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = '99ff21e5-4dde-56fe-ad94-1ddd1ad0e802';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('cf335765-ebed-5855-bf1e-4177e57cb70e', '99ff21e5-4dde-56fe-ad94-1ddd1ad0e802', 'A', 'Tumour progression; increase dose', false, 0),
  ('8783915e-0e84-57a0-83e8-31d1704368b2', '99ff21e5-4dde-56fe-ad94-1ddd1ad0e802', 'B', 'IBS; dietary advice', false, 1),
  ('23209379-8146-5bda-9d7c-d782aff3be39', '99ff21e5-4dde-56fe-ad94-1ddd1ad0e802', 'C', 'Infective gastroenteritis; loperamide only', false, 2),
  ('7f626177-fd96-5134-8ba8-7cbf23fa0bd8', '99ff21e5-4dde-56fe-ad94-1ddd1ad0e802', 'D', 'Immune-related colitis; stop the immunotherapy and give high-dose corticosteroids', true, 3),
  ('184b3e89-b9a9-5c56-950c-bbba4aa99cc7', '99ff21e5-4dde-56fe-ad94-1ddd1ad0e802', 'E', 'C. difficile only; vancomycin', false, 4);

-- Q575
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('672221b8-1818-587c-8574-06d12fa30ac3', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000024', 'sba', 'A 68 year old man has had painless jaundice and weight loss. CT shows a mass in the head of the pancreas with no metastases and no major vessel involvement. What is the SINGLE most appropriate potentially curative treatment?', 'Pancreatic adenocarcinoma has a poor prognosis, and only about 10-20% of patients are resectable at diagnosis. For resectable head of pancreas tumours, a Whipple''s procedure with adjuvant chemotherapy (such as mFOLFIRINOX) offers the only chance of cure. Biliary stenting relieves jaundice in palliative cases. CA 19-9 is used for monitoring.', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v3')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = '672221b8-1818-587c-8574-06d12fa30ac3';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('41472d19-bc26-50a0-9f36-90f55ea5abcb', '672221b8-1818-587c-8574-06d12fa30ac3', 'A', 'Liver transplant', false, 0),
  ('2ad70586-cce0-5634-910c-2808f7102050', '672221b8-1818-587c-8574-06d12fa30ac3', 'B', 'Pancreaticoduodenectomy (Whipple''s procedure), with adjuvant chemotherapy', true, 1),
  ('4d4dab5f-01b7-5c6d-aa09-313e9baaa603', '672221b8-1818-587c-8574-06d12fa30ac3', 'C', 'Radiotherapy alone', false, 2),
  ('6aa4f708-a2a3-5c22-8789-f2b1c4e6196b', '672221b8-1818-587c-8574-06d12fa30ac3', 'D', 'Biliary stent and palliative care only', false, 3),
  ('11a152c6-e245-522c-a389-e8857d2a1eea', '672221b8-1818-587c-8574-06d12fa30ac3', 'E', 'Chemotherapy alone', false, 4);

-- Q576
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('3d7f505a-eed9-54c2-8698-81c09c640689', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000024', 'sba', 'A 50 year old man has a 4 cm mass in his kidney found incidentally on CT. He has haematuria. What is the MOST common histological type of renal cancer in adults?', 'Clear cell RCC (about 75%) arises from the proximal tubule and is linked to VHL mutations, smoking, obesity, hypertension and dialysis-associated cystic disease. Paraneoplastic features include polycythaemia (EPO), hypercalcaemia and Stauffer syndrome. Treatment is partial or radical nephrectomy, with immunotherapy and targeted therapy for metastatic disease.', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v3')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = '3d7f505a-eed9-54c2-8698-81c09c640689';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('cadf40b8-1ae0-5e3e-a35f-c1f46071bfd0', '3d7f505a-eed9-54c2-8698-81c09c640689', 'A', 'Wilms tumour', false, 0),
  ('5a78c30c-6ad1-5821-ba81-e035ee8123f3', '3d7f505a-eed9-54c2-8698-81c09c640689', 'B', 'Clear cell renal cell carcinoma', true, 1),
  ('f10738a5-410b-53d8-a22b-9a0846b25c39', '3d7f505a-eed9-54c2-8698-81c09c640689', 'C', 'Transitional cell carcinoma', false, 2),
  ('5e58026b-20f0-55d4-9893-184f740e22ab', '3d7f505a-eed9-54c2-8698-81c09c640689', 'D', 'Oncocytoma', false, 3),
  ('63f55ab6-527e-5bdf-a3f4-2e58e03fc3f6', '3d7f505a-eed9-54c2-8698-81c09c640689', 'E', 'Squamous cell carcinoma', false, 4);

-- Q577
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('17d61e20-ac65-5936-a0e7-7c9f41e7d08b', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000024', 'sba', 'A 72 year old man is starting a cycle of chemotherapy. His oncology team advise him to call the 24-hour helpline immediately if he develops which symptom?', 'Patients on chemotherapy are given an acute oncology helpline number for urgent symptoms, especially fever (possible neutropenic sepsis), as well as severe vomiting, diarrhoea, bleeding, breathlessness, chest pain, and new neurological symptoms. Neutropenic sepsis needs antibiotics within 1 hour. The UKONS triage tool guides helpline responses.', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v3')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = '17d61e20-ac65-5936-a0e7-7c9f41e7d08b';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('8e99b21d-9361-540a-a936-0f4841d6f475', '17d61e20-ac65-5936-a0e7-7c9f41e7d08b', 'A', 'Mild nausea controlled by antiemetics', false, 0),
  ('8da6e377-868c-5e3c-9af3-df0bc83b9f57', '17d61e20-ac65-5936-a0e7-7c9f41e7d08b', 'B', 'Thinning hair', false, 1),
  ('cda64292-c539-53dd-86c2-f8917346e244', '17d61e20-ac65-5936-a0e7-7c9f41e7d08b', 'C', 'A temperature of 37.5-38°C or above, or feeling unwell with chills/rigors', true, 2),
  ('fe39c442-31d1-5c24-b4ca-fb613bdeb46f', '17d61e20-ac65-5936-a0e7-7c9f41e7d08b', 'D', 'Mild taste changes', false, 3),
  ('6e06ee46-ac77-51d2-b056-f69556d3e6d8', '17d61e20-ac65-5936-a0e7-7c9f41e7d08b', 'E', 'Mild tiredness', false, 4);

-- Q578
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('b81f46ed-592f-594f-a033-b0fde319fa05', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000024', 'sba', 'A 62 year old woman has had progressive back pain, now waking her at night, with weight loss. She had breast cancer 8 years ago. Neurology is normal. What is the SINGLE most appropriate investigation?', 'NICE NG234: in patients with cancer and spinal pain suggestive of metastases (progressive, night pain, thoracic pain, pain on coughing or straining), get MRI of the whole spine within 1 week. If there are neurological symptoms or signs of cord compression, MRI is needed immediately (within 24 hours). Start dexamethasone if MSCC is suspected.', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v3')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = 'b81f46ed-592f-594f-a033-b0fde319fa05';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('2f6a1b59-3c7d-52a7-9f19-540d86c350b2', 'b81f46ed-592f-594f-a033-b0fde319fa05', 'A', 'No investigation', false, 0),
  ('ddfe276d-62ba-5af4-a27d-9fc795c0b33e', 'b81f46ed-592f-594f-a033-b0fde319fa05', 'B', 'Lumbar spine X-ray only', false, 1),
  ('0d91d3d7-1fe4-5a1f-a4cd-cf34e49865ea', 'b81f46ed-592f-594f-a033-b0fde319fa05', 'C', 'Physiotherapy referral', false, 2),
  ('ada497a0-9bb5-5835-8f2b-d37eca05c551', 'b81f46ed-592f-594f-a033-b0fde319fa05', 'D', 'Urgent MRI of the whole spine (within 1 week if no neurological signs, sooner if neurological symptoms develop)', true, 3),
  ('badc9f71-499c-53bf-83ac-cd620ec9c48c', 'b81f46ed-592f-594f-a033-b0fde319fa05', 'E', 'DEXA scan', false, 4);

-- Q579
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('2c4b783d-5aa0-5e62-9811-57745f8e2670', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000024', 'sba', 'A 58 year old woman has iron-deficiency anaemia, change in bowel habit and a right iliac fossa mass. Colonoscopy shows a caecal tumour. Which staging investigation is MOST appropriate?', 'Colorectal cancer is staged with CT chest, abdomen and pelvis (liver and lung metastases). Rectal cancer also needs pelvic MRI for local staging. CEA is measured at baseline. Management depends on stage (TNM): surgery, adjuvant chemotherapy for node-positive colon cancer, and neoadjuvant treatment for some rectal cancers.', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v3')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = '2c4b783d-5aa0-5e62-9811-57745f8e2670';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('d1b0920d-eba4-537b-86fe-239715f390eb', '2c4b783d-5aa0-5e62-9811-57745f8e2670', 'A', 'Plain chest X-ray only', false, 0),
  ('2b4f1a85-7ef3-5fb8-9aaa-1a38de188e3e', '2c4b783d-5aa0-5e62-9811-57745f8e2670', 'B', 'Abdominal ultrasound only', false, 1),
  ('1eb1492a-03c1-541b-ba24-adfd03b2ef28', '2c4b783d-5aa0-5e62-9811-57745f8e2670', 'C', 'CT of the chest, abdomen and pelvis', true, 2),
  ('af8e47a3-7676-5cb6-be3e-ae9b056100bc', '2c4b783d-5aa0-5e62-9811-57745f8e2670', 'D', 'Isotope bone scan', false, 3),
  ('e25a0782-7888-5129-95ba-2f4f5f469cf6', '2c4b783d-5aa0-5e62-9811-57745f8e2670', 'E', 'PET scan as first-line for all', false, 4);

-- Q580
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('398fdc4d-e6bb-56ac-ad53-559df0db661a', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000024', 'sba', 'A 30 year old man had a seminoma treated 2 years ago. At a follow-up visit he asks about long-term effects of platinum chemotherapy he received. Which is a recognised late effect?', 'Long-term effects of cisplatin-based chemotherapy include cardiovascular disease and metabolic syndrome, peripheral neuropathy, ototoxicity, renal impairment, hypogonadism, reduced fertility (so sperm banking is offered beforehand) and secondary leukaemias. Survivorship care includes monitoring BP, lipids, testosterone and psychological wellbeing.', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v3')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = '398fdc4d-e6bb-56ac-ad53-559df0db661a';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('7c2603c1-c689-58bb-be03-697b1ede3c35', '398fdc4d-e6bb-56ac-ad53-559df0db661a', 'A', 'Increased cardiovascular risk, hearing loss, neuropathy and secondary malignancies', true, 0),
  ('a0988c3f-6a10-51af-9893-8e83406e663f', '398fdc4d-e6bb-56ac-ad53-559df0db661a', 'B', 'Cataracts within months', false, 1),
  ('840354bb-0f72-5317-aba2-03f26fdf79a5', '398fdc4d-e6bb-56ac-ad53-559df0db661a', 'C', 'Complete infertility in all patients', false, 2),
  ('df7ab9b6-c883-586a-87dc-e309bb4e75d3', '398fdc4d-e6bb-56ac-ad53-559df0db661a', 'D', 'Type 1 diabetes in all', false, 3),
  ('43907ed3-8f7f-5c8f-8019-a5bde37e83e0', '398fdc4d-e6bb-56ac-ad53-559df0db661a', 'E', 'Lung cancer only', false, 4);

-- Q581
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('76a9bcd5-c6d1-5c6e-9bdc-94abd22aca44', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000024', 'sba', 'A 40 year old woman has had a slow-growing lump in her neck. Fine needle aspiration of a thyroid nodule shows a follicular lesion (Thy3f). What is the SINGLE most appropriate next step?', 'FNA cannot distinguish follicular adenoma from follicular carcinoma, because the distinction depends on capsular or vascular invasion. Thy3f lesions are usually managed with diagnostic hemithyroidectomy. Completion thyroidectomy and radioiodine follow if carcinoma is confirmed. Follicular carcinoma spreads through the blood to bone and lung.', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v3')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = '76a9bcd5-c6d1-5c6e-9bdc-94abd22aca44';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('8872d33c-e442-5a38-9cef-e74fa999fa65', '76a9bcd5-c6d1-5c6e-9bdc-94abd22aca44', 'A', 'No treatment', false, 0),
  ('f3226c41-6042-5a98-a3ab-e135ec3ed2d4', '76a9bcd5-c6d1-5c6e-9bdc-94abd22aca44', 'B', 'Total laryngectomy', false, 1),
  ('d0dacb50-062c-5327-9868-453b02f4e775', '76a9bcd5-c6d1-5c6e-9bdc-94abd22aca44', 'C', 'Radioactive iodine immediately', false, 2),
  ('7ea068ac-c071-518f-a296-eeb241f01ce0', '76a9bcd5-c6d1-5c6e-9bdc-94abd22aca44', 'D', 'Repeat FNA in 5 years', false, 3),
  ('ea6588c4-00ea-5c79-aee4-cdb2ee14749e', '76a9bcd5-c6d1-5c6e-9bdc-94abd22aca44', 'E', 'Diagnostic hemithyroidectomy (histology needed to distinguish follicular adenoma from carcinoma)', true, 4);

-- Q582
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('953c60d8-b674-5f13-8497-fd173e090898', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000024', 'sba', 'A 60 year old man has been diagnosed with colorectal cancer. He is found to have mismatch repair deficiency (MSI-high) in his tumour. What should be offered?', 'NICE recommends testing all colorectal and endometrial cancers for mismatch repair deficiency (immunohistochemistry or MSI) to identify possible Lynch syndrome. If there is MMR deficiency not explained by MLH1 promoter methylation or BRAF mutation, offer germline testing. MSI-high tumours also respond well to immunotherapy in the metastatic setting.', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v3')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = '953c60d8-b674-5f13-8497-fd173e090898';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('3c90385d-bae5-52be-a49b-0d35a6e6a595', '953c60d8-b674-5f13-8497-fd173e090898', 'A', 'Thyroid ultrasound', false, 0),
  ('19266ffc-1b25-5bb1-8bfc-1998c742bebf', '953c60d8-b674-5f13-8497-fd173e090898', 'B', 'No further action', false, 1),
  ('cc083aae-c4d7-5fd1-ab85-5b2d41fd935d', '953c60d8-b674-5f13-8497-fd173e090898', 'C', 'Annual mammography', false, 2),
  ('e3ad4d41-ebc4-5156-b29d-1daf54e09f61', '953c60d8-b674-5f13-8497-fd173e090898', 'D', 'Testing of all relatives for BRCA', false, 3),
  ('dec502a9-6b97-53a5-93e0-750f9fdfa971', '953c60d8-b674-5f13-8497-fd173e090898', 'E', 'Germline genetic testing for Lynch syndrome (via genetics services)', true, 4);

-- Q583
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('7b6824c1-c277-5232-9236-58cc1c9681c0', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000036', 'sba', 'A man with an X-linked recessive condition has children with a woman who is not a carrier. What is the chance that his daughters are carriers?', 'A father passes his X chromosome to all his daughters and his Y to all his sons. So all daughters of an affected man are obligate carriers, and none of his sons are affected (no male-to-male transmission). A carrier mother has a 50% chance of each son being affected and each daughter being a carrier.', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v3')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = '7b6824c1-c277-5232-9236-58cc1c9681c0';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('013b3147-8781-54b9-8332-b13d978d5c8b', '7b6824c1-c277-5232-9236-58cc1c9681c0', 'A', '0%', false, 0),
  ('b6da2345-8620-5c00-8918-cc95d073029e', '7b6824c1-c277-5232-9236-58cc1c9681c0', 'B', '25%', false, 1),
  ('0ec60675-0ced-5bf1-bce9-d539fb92c4ca', '7b6824c1-c277-5232-9236-58cc1c9681c0', 'C', '50%', false, 2),
  ('14f58d5e-5781-5828-9c32-79177bb4fcfb', '7b6824c1-c277-5232-9236-58cc1c9681c0', 'D', '75%', false, 3),
  ('65e54a81-6e32-594e-ac84-62da78b950b9', '7b6824c1-c277-5232-9236-58cc1c9681c0', 'E', '100% (all daughters are carriers)', true, 4);

-- Q584
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('e1e89788-126e-5bbf-b960-c26ade3c4587', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000036', 'sba', 'A boy is affected by an X-linked recessive disorder. His mother is a carrier. What is the chance that her next son will be affected?', 'A carrier mother passes the affected X to half her children. Each son has a 50% chance of being affected, and each daughter has a 50% chance of being a carrier. Overall, each pregnancy has a 25% chance of an affected son. Examples include haemophilia A and B, Duchenne muscular dystrophy, G6PD deficiency, fragile X (complex) and red-green colour blindness.', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v3')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = 'e1e89788-126e-5bbf-b960-c26ade3c4587';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('7ca9cde2-c539-56ec-a2c6-7d9667eeff57', 'e1e89788-126e-5bbf-b960-c26ade3c4587', 'A', '0%', false, 0),
  ('60f9c0ff-485c-5fce-b7b4-3dbca1197044', 'e1e89788-126e-5bbf-b960-c26ade3c4587', 'B', '25%', false, 1),
  ('a4b21da3-80c7-59d2-9206-d8fb0264c2e6', 'e1e89788-126e-5bbf-b960-c26ade3c4587', 'C', '50%', true, 2),
  ('acab935d-c9fd-5b17-9aa4-e58ce5c5f01a', 'e1e89788-126e-5bbf-b960-c26ade3c4587', 'D', '75%', false, 3),
  ('e8525003-f25e-5da0-959a-ac204e34546a', 'e1e89788-126e-5bbf-b960-c26ade3c4587', 'E', '100%', false, 4);

-- Q585
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('4f3d1ed3-5eee-5c7d-a3d4-8de713a256de', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000036', 'sba', 'A woman has a mitochondrial disorder (MELAS). Which statement about inheritance is CORRECT?', 'Mitochondrial DNA is inherited from the mother (sperm mitochondria are not passed on). An affected woman can pass it to all her children, but severity varies because cells contain a mix of normal and mutant mitochondria (heteroplasmy). Affected men do not pass it on. Examples include MELAS, MERRF and Leber''s hereditary optic neuropathy. Mitochondrial donation is licensed in the UK in some cases.', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v3')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = '4f3d1ed3-5eee-5c7d-a3d4-8de713a256de';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('c733e3c7-4bdd-57fa-87f3-2f1e81f71d1e', '4f3d1ed3-5eee-5c7d-a3d4-8de713a256de', 'A', 'It is autosomal recessive', false, 0),
  ('ef53d58a-a0d6-5b72-80e0-0397359cc9be', '4f3d1ed3-5eee-5c7d-a3d4-8de713a256de', 'B', 'It affects only daughters', false, 1),
  ('532cfddc-6275-532f-856d-c53100401562', '4f3d1ed3-5eee-5c7d-a3d4-8de713a256de', 'C', 'It is passed only from fathers to sons', false, 2),
  ('4c07f5db-1283-51cb-810c-1dc186ebddac', '4f3d1ed3-5eee-5c7d-a3d4-8de713a256de', 'D', 'Her children have a 25% risk', false, 3),
  ('669ce1e0-6bcb-5fcd-ae1f-9dacd880c5b3', '4f3d1ed3-5eee-5c7d-a3d4-8de713a256de', 'E', 'It is passed from the mother to all her children (maternal inheritance), with variable severity due to heteroplasmy', true, 4);

-- Q586
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('4873a19f-9602-5f24-ad6c-3e7a93e639a6', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000036', 'sba', 'A child has learning disability, seizures, an inappropriately happy demeanour with frequent laughter, ataxia and absent speech. Genetic testing shows a deletion on maternal chromosome 15q11-13. What is the SINGLE most likely diagnosis?', 'Angelman syndrome is caused by loss of the maternal UBE3A gene on 15q11-13 (deletion, paternal uniparental disomy, imprinting defect or UBE3A mutation). Prader-Willi syndrome is caused by loss of the paternal copy of the same region (deletion or maternal uniparental disomy). Both are examples of genomic imprinting.', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v3')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = '4873a19f-9602-5f24-ad6c-3e7a93e639a6';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('439c578c-3f95-52df-84b2-901be63768d5', '4873a19f-9602-5f24-ad6c-3e7a93e639a6', 'A', 'Angelman syndrome', true, 0),
  ('6a4771a8-5853-506e-8ab7-39d952192347', '4873a19f-9602-5f24-ad6c-3e7a93e639a6', 'B', 'Prader-Willi syndrome', false, 1),
  ('45ac6d76-55a8-525c-bff0-98ad76f4423c', '4873a19f-9602-5f24-ad6c-3e7a93e639a6', 'C', 'Rett syndrome', false, 2),
  ('5933449b-5540-5b42-b70b-b5b0a60e9019', '4873a19f-9602-5f24-ad6c-3e7a93e639a6', 'D', 'Fragile X syndrome', false, 3),
  ('5f985566-bc57-54e7-84d9-f71d13b70094', '4873a19f-9602-5f24-ad6c-3e7a93e639a6', 'E', 'Williams syndrome', false, 4);

-- Q587
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('799867b2-d1dc-52f4-8792-465934df2f3c', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000036', 'sba', 'A 4 year old girl has an elfin face, an outgoing friendly personality, learning difficulties, hypercalcaemia and supravalvular aortic stenosis. What is the SINGLE most likely diagnosis?', 'Williams syndrome is a microdeletion of 7q11.23 including the elastin gene. It causes characteristic facies, a very sociable personality with learning disability and strong verbal skills, supravalvular aortic stenosis, infantile hypercalcaemia and connective tissue problems. Diagnosis is by microarray or FISH.', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v3')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = '799867b2-d1dc-52f4-8792-465934df2f3c';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('02ed4588-3a01-553f-aea6-c59389d3ae75', '799867b2-d1dc-52f4-8792-465934df2f3c', 'A', 'Noonan syndrome', false, 0),
  ('026208a1-9e18-5853-89aa-6c09ffbd462f', '799867b2-d1dc-52f4-8792-465934df2f3c', 'B', 'Turner syndrome', false, 1),
  ('44e602a1-3252-5d27-af20-166221827d1e', '799867b2-d1dc-52f4-8792-465934df2f3c', 'C', 'DiGeorge syndrome', false, 2),
  ('1aa4109e-4b8a-5b1f-a8ec-0b5539357169', '799867b2-d1dc-52f4-8792-465934df2f3c', 'D', 'Williams syndrome (7q11.23 microdeletion)', true, 3),
  ('9f6d45f0-15ed-5738-b522-0a1e31deac66', '799867b2-d1dc-52f4-8792-465934df2f3c', 'E', 'Down syndrome', false, 4);

-- Q588
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('24f1e187-d380-58aa-a905-9bf51c2092ba', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000036', 'sba', 'A boy has short stature, a webbed neck, pectus excavatum, low-set ears and pulmonary valve stenosis. His karyotype is 46,XY. What is the SINGLE most likely diagnosis?', 'Noonan syndrome (often PTPN11, autosomal dominant) has a Turner-like appearance but a normal karyotype, and affects both sexes. Features include short stature, webbed neck, pulmonary stenosis, hypertrophic cardiomyopathy, cryptorchidism, bleeding tendency and mild learning difficulties. Turner syndrome (45,X) causes coarctation and bicuspid aortic valve.', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v3')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = '24f1e187-d380-58aa-a905-9bf51c2092ba';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('67ff24d3-0814-5040-96db-6d7c71b7bc09', '24f1e187-d380-58aa-a905-9bf51c2092ba', 'A', 'Turner syndrome', false, 0),
  ('aeffb236-37a6-5a33-8763-18b27cdb8685', '24f1e187-d380-58aa-a905-9bf51c2092ba', 'B', 'Marfan syndrome', false, 1),
  ('7112ae82-524d-51ca-abfc-f9a087fb3b78', '24f1e187-d380-58aa-a905-9bf51c2092ba', 'C', 'Noonan syndrome', true, 2),
  ('fb834130-e0ad-58bf-b417-5a302b25ddd6', '24f1e187-d380-58aa-a905-9bf51c2092ba', 'D', 'Klinefelter syndrome', false, 3),
  ('407c17e6-c47a-59d5-aed5-e84a7b718f25', '24f1e187-d380-58aa-a905-9bf51c2092ba', 'E', 'Down syndrome', false, 4);

-- Q589
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('f93bd935-d02a-575b-b3a3-494827733ef3', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000036', 'sba', 'A 7 year old girl developed normally until 18 months, then lost purposeful hand use and speech, developing hand-wringing movements, breathing irregularities and seizures. What is the SINGLE most likely diagnosis?', 'Rett syndrome is an X-linked dominant disorder (MECP2), almost exclusively affecting girls (usually lethal in males). After a period of normal development, it causes regression with loss of hand skills and speech, stereotyped hand-wringing, gait problems, breathing abnormalities, seizures and acquired microcephaly.', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v3')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = 'f93bd935-d02a-575b-b3a3-494827733ef3';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('a165278e-1ebe-5bf1-9d12-d6532776e3ed', 'f93bd935-d02a-575b-b3a3-494827733ef3', 'A', 'Cerebral palsy', false, 0),
  ('0b43c72a-614f-5d8a-812d-50649dde62ca', 'f93bd935-d02a-575b-b3a3-494827733ef3', 'B', 'Autism spectrum disorder', false, 1),
  ('2a4e985e-a3b1-5f44-a97d-217aea8e2142', 'f93bd935-d02a-575b-b3a3-494827733ef3', 'C', 'Fragile X syndrome', false, 2),
  ('30913c8e-fa63-581a-9e73-8185de3e1c6e', 'f93bd935-d02a-575b-b3a3-494827733ef3', 'D', 'Angelman syndrome', false, 3),
  ('2bdfde1b-17ce-5543-ba81-c7f42a0595f2', 'f93bd935-d02a-575b-b3a3-494827733ef3', 'E', 'Rett syndrome (MECP2 mutation)', true, 4);

-- Q590
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('424b6b31-8b1d-5d35-b204-0ba62c671c1c', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000036', 'sba', 'A couple both have sickle cell trait (HbAS). What is the probability that their child will have sickle cell disease (HbSS)?', 'Sickle cell disease is autosomal recessive. With 2 carrier parents, each pregnancy has a 25% chance of HbSS, 50% chance of HbAS (trait) and 25% chance of HbAA. The NHS Sickle Cell and Thalassaemia screening programme offers antenatal screening and newborn screening (heel prick). Prenatal diagnosis (CVS) is available.', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v3')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = '424b6b31-8b1d-5d35-b204-0ba62c671c1c';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('cdd173af-4ad0-54f4-ad5f-d4de0f62e38d', '424b6b31-8b1d-5d35-b204-0ba62c671c1c', 'A', '0%', false, 0),
  ('42a428ad-5a82-52bd-ac14-2a7401cf7155', '424b6b31-8b1d-5d35-b204-0ba62c671c1c', 'B', '25%', true, 1),
  ('70a4c9bc-f384-5a94-b835-6017782ab5ee', '424b6b31-8b1d-5d35-b204-0ba62c671c1c', 'C', '50%', false, 2),
  ('7c2d485a-8b67-5305-a066-03a7443488b2', '424b6b31-8b1d-5d35-b204-0ba62c671c1c', 'D', '75%', false, 3),
  ('d538e04c-4f39-5878-9f0f-3160ddbc62d7', '424b6b31-8b1d-5d35-b204-0ba62c671c1c', 'E', '100%', false, 4);

-- Q591
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('bf08ecb9-8b7e-5484-9847-adefb4662d93', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000036', 'sba', 'A 45 year old man has diabetes, bronze skin pigmentation, hepatomegaly and arthropathy of the 2nd and 3rd MCP joints. Transferrin saturation is 80% and ferritin is 2,000 µg/L. Which gene is MOST likely to be mutated?', 'Hereditary haemochromatosis is autosomal recessive, usually due to HFE C282Y homozygosity, and is common in people of Northern European descent. Excess iron absorption damages the liver (cirrhosis, HCC), pancreas (diabetes), heart (cardiomyopathy), joints, pituitary and skin. Treatment is venesection. Screen first-degree relatives.', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v3')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = 'bf08ecb9-8b7e-5484-9847-adefb4662d93';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('41109c27-b264-5a16-a9b9-292346c84cab', 'bf08ecb9-8b7e-5484-9847-adefb4662d93', 'A', 'HFE (C282Y homozygous)', true, 0),
  ('2aacd60c-8aab-5c55-b58d-0fb6b1b1f8f2', 'bf08ecb9-8b7e-5484-9847-adefb4662d93', 'B', 'JAK2', false, 1),
  ('8bda1f7e-f5a2-54ce-93fc-f5f6168825be', 'bf08ecb9-8b7e-5484-9847-adefb4662d93', 'C', 'SERPINA1', false, 2),
  ('a3cf79d1-1434-51bd-9ce3-0e5be4bd219f', 'bf08ecb9-8b7e-5484-9847-adefb4662d93', 'D', 'CFTR', false, 3),
  ('a5f5e8c2-6209-5c88-9495-a65dca699f5d', 'bf08ecb9-8b7e-5484-9847-adefb4662d93', 'E', 'ATP7B', false, 4);

-- Q592
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('e802e3a1-0210-5af5-af57-f48f2a0ac18e', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000036', 'sba', 'A newborn''s heel prick test is positive for phenylketonuria. What is the SINGLE most appropriate management?', 'PKU (autosomal recessive, phenylalanine hydroxylase deficiency) causes intellectual disability if untreated. Newborn blood spot screening allows early dietary treatment (low phenylalanine, with special protein supplements). Women with PKU need strict control before and during pregnancy, as high maternal phenylalanine harms the fetus (maternal PKU syndrome).', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v3')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = 'e802e3a1-0210-5af5-af57-f48f2a0ac18e';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('bf03ea47-0df8-5efc-96ea-0771c4eb5f2f', 'e802e3a1-0210-5af5-af57-f48f2a0ac18e', 'A', 'No treatment is needed', false, 0),
  ('a54c289e-3905-5e52-9517-7b3c5531a3d7', 'e802e3a1-0210-5af5-af57-f48f2a0ac18e', 'B', 'Lifelong low-phenylalanine diet supervised by a metabolic team (especially strict before and during pregnancy)', true, 1),
  ('2a2ca814-8b85-5541-8cb7-24448db2eca2', 'e802e3a1-0210-5af5-af57-f48f2a0ac18e', 'C', 'Liver transplant immediately', false, 2),
  ('f4e1f785-02ae-5b1e-be1a-21f03236a70a', 'e802e3a1-0210-5af5-af57-f48f2a0ac18e', 'D', 'Phenylalanine supplements', false, 3),
  ('62aac921-a030-568d-a483-c10cf906d64c', 'e802e3a1-0210-5af5-af57-f48f2a0ac18e', 'E', 'Thyroxine', false, 4);

-- Q593
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('b9cfe57c-efaf-5ec0-9a6c-7915cf226fc7', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000036', 'sba', 'Which conditions are screened for in the UK newborn blood spot (heel prick) test?', 'The NHS newborn blood spot test (day 5) screens for 9 core conditions (sickle cell disease, CF, congenital hypothyroidism, PKU, MCADD, MSUD, IVA, GA1, homocystinuria), with SCID added in England from 2025 (initially as an evaluation). Hearing and physical examination are separate screening programmes.', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v3')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = 'b9cfe57c-efaf-5ec0-9a6c-7915cf226fc7';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('f14d9033-2798-5400-b0a5-9ccc75bff0eb', 'b9cfe57c-efaf-5ec0-9a6c-7915cf226fc7', 'A', 'Huntington''s disease and BRCA', false, 0),
  ('0db9854a-7759-5006-a033-7f9bb739da99', 'b9cfe57c-efaf-5ec0-9a6c-7915cf226fc7', 'B', 'Down syndrome and Turner syndrome', false, 1),
  ('ce86dfee-490b-534f-907a-117195f3e3a2', 'b9cfe57c-efaf-5ec0-9a6c-7915cf226fc7', 'C', 'Duchenne muscular dystrophy and fragile X', false, 2),
  ('1c8ae929-3093-5f9c-bd0b-7db2b855b772', 'b9cfe57c-efaf-5ec0-9a6c-7915cf226fc7', 'D', 'Hearing loss only', false, 3),
  ('16c5c738-67d2-5ba4-8ebc-72bd68b24133', 'b9cfe57c-efaf-5ec0-9a6c-7915cf226fc7', 'E', 'Sickle cell disease, cystic fibrosis, congenital hypothyroidism and inherited metabolic diseases (e.g. PKU, MCADD, MSUD, IVA, GA1, HCU), plus SCID', true, 4);

-- Q594
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('ce1feb4c-1bef-54ed-a7fd-a0f00d530b22', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000036', 'sba', 'A 30 year old woman''s brother has cystic fibrosis. She does not have CF. Her partner has no family history. They ask about the chance of having an affected child. What is her chance of being a carrier?', 'Her parents must both be carriers. As an unaffected sibling, she is one of the 3 unaffected outcomes (AA, Aa, aA), so her chance of being a carrier is 2/3. The UK population carrier frequency is about 1 in 25. Her risk of an affected child is 2/3 x 1/25 x 1/4 = 1/150, unless her partner is tested.', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v3')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = 'ce1feb4c-1bef-54ed-a7fd-a0f00d530b22';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('58c9d448-e0a5-5156-b2bd-1dce3869275b', 'ce1feb4c-1bef-54ed-a7fd-a0f00d530b22', 'A', '1/25', false, 0),
  ('c8fbc9fc-304a-516a-a001-bc73362e183a', 'ce1feb4c-1bef-54ed-a7fd-a0f00d530b22', 'B', '1/4', false, 1),
  ('88909b33-46b0-50a2-83c9-14a2d98d43b0', 'ce1feb4c-1bef-54ed-a7fd-a0f00d530b22', 'C', '1/2', false, 2),
  ('7f1fc11c-9a25-544c-8be8-cec6ad48f48b', 'ce1feb4c-1bef-54ed-a7fd-a0f00d530b22', 'D', '2/3', true, 3),
  ('d9b758d9-2442-5504-89e3-a4cd0cbc9be1', 'ce1feb4c-1bef-54ed-a7fd-a0f00d530b22', 'E', '100%', false, 4);

-- Q595
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('fccfbb64-7030-5e7c-99aa-1c879bb9ea07', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000036', 'sba', 'A 35 year old man has epilepsy, learning difficulties and multiple angiofibromas on his face. His renal ultrasound shows angiomyolipomas. What is the inheritance pattern?', 'Tuberous sclerosis complex is autosomal dominant (about two-thirds are de novo). It causes hamartomas in many organs: skin (ash-leaf macules, angiofibromas, shagreen patches), brain (cortical tubers, SEGA), kidney (angiomyolipomas, cysts), heart (rhabdomyomas in infancy), lungs (LAM) and eyes. mTOR inhibitors (everolimus) treat some manifestations.', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v3')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = 'fccfbb64-7030-5e7c-99aa-1c879bb9ea07';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('7029318f-3a56-5c60-957d-a6de6a913202', 'fccfbb64-7030-5e7c-99aa-1c879bb9ea07', 'A', 'Multifactorial', false, 0),
  ('f673a94e-6917-5264-abb8-83949c643900', 'fccfbb64-7030-5e7c-99aa-1c879bb9ea07', 'B', 'X-linked recessive', false, 1),
  ('b01437eb-c181-5ebc-a7a1-775384ad6836', 'fccfbb64-7030-5e7c-99aa-1c879bb9ea07', 'C', 'Autosomal recessive', false, 2),
  ('37ee9034-48d2-5a03-ba37-b9feb8bf71f4', 'fccfbb64-7030-5e7c-99aa-1c879bb9ea07', 'D', 'Mitochondrial', false, 3),
  ('d2242a28-bbf8-56cf-8985-3541cc1d9631', 'fccfbb64-7030-5e7c-99aa-1c879bb9ea07', 'E', 'Autosomal dominant (TSC1 or TSC2), often from a new mutation', true, 4);

-- Q596
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('f836f92c-6179-5252-af3f-5a7c8d4bfee2', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000036', 'sba', 'A 40 year old man has bilateral vestibular schwannomas and a meningioma. What is the SINGLE most likely diagnosis?', 'NF2 (now termed NF2-related schwannomatosis) is autosomal dominant (chromosome 22, merlin). It causes bilateral vestibular schwannomas (hearing loss, tinnitus, imbalance), meningiomas, ependymomas and juvenile cataracts. NF1 (chromosome 17, neurofibromin) causes café-au-lait macules, neurofibromas, axillary freckling, Lisch nodules and optic gliomas.', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v3')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = 'f836f92c-6179-5252-af3f-5a7c8d4bfee2';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('7416439e-a631-59ba-9673-f124166116ec', 'f836f92c-6179-5252-af3f-5a7c8d4bfee2', 'A', 'Sturge-Weber syndrome', false, 0),
  ('0acf722f-9227-5142-b8f3-ad202b01cc43', 'f836f92c-6179-5252-af3f-5a7c8d4bfee2', 'B', 'Neurofibromatosis type 2 (NF2-related schwannomatosis)', true, 1),
  ('0ffdeb62-bf1c-5d3e-bb9c-138189638397', 'f836f92c-6179-5252-af3f-5a7c8d4bfee2', 'C', 'Tuberous sclerosis', false, 2),
  ('cf30de4e-7e5f-5fb5-b406-f0a114e02c55', 'f836f92c-6179-5252-af3f-5a7c8d4bfee2', 'D', 'Von Hippel-Lindau syndrome', false, 3),
  ('73adcf9d-f8f7-58eb-a1c2-c2b2df048d1b', 'f836f92c-6179-5252-af3f-5a7c8d4bfee2', 'E', 'Neurofibromatosis type 1', false, 4);

-- Q597
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('a047d4cd-5c8c-531a-b537-34a3fa5c6616', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000036', 'sba', 'A 28 year old man has retinal haemangioblastomas, a cerebellar haemangioblastoma and bilateral renal cysts. His father had kidney cancer at 40. What is the SINGLE most likely diagnosis?', 'VHL is an autosomal dominant tumour suppressor syndrome (chromosome 3). It causes haemangioblastomas (retina, cerebellum, spinal cord), clear cell renal cell carcinoma, phaeochromocytoma, pancreatic cysts and neuroendocrine tumours. Lifelong surveillance is needed. Belzutifan (a HIF-2-alpha inhibitor) is a newer treatment.', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v3')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = 'a047d4cd-5c8c-531a-b537-34a3fa5c6616';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('a3e43eeb-6e5d-5d70-93e6-de9cd18c308b', 'a047d4cd-5c8c-531a-b537-34a3fa5c6616', 'A', 'Polycystic kidney disease only', false, 0),
  ('08fddfc1-8593-553e-b253-7cb30ed0b198', 'a047d4cd-5c8c-531a-b537-34a3fa5c6616', 'B', 'Tuberous sclerosis', false, 1),
  ('ce3332d0-f688-5c73-a2ad-8b37fcef92ac', 'a047d4cd-5c8c-531a-b537-34a3fa5c6616', 'C', 'MEN2', false, 2),
  ('6a8d5ac1-1c69-5510-ad20-f6fed662dadd', 'a047d4cd-5c8c-531a-b537-34a3fa5c6616', 'D', 'Von Hippel-Lindau syndrome', true, 3),
  ('81d46a52-554c-5386-8370-5f7a075f5d46', 'a047d4cd-5c8c-531a-b537-34a3fa5c6616', 'E', 'Neurofibromatosis type 1', false, 4);

-- Q598
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('2b58149b-f5d2-5d63-991c-1ed7d88854c2', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000036', 'sba', 'A pregnant woman''s NIPT (cell-free DNA test) shows a ''high chance'' result for trisomy 21. What is the SINGLE most appropriate next step to confirm the diagnosis?', 'NIPT analyses cell-free fetal (placental) DNA in maternal blood. It is a highly sensitive screening test (over 99% for trisomy 21) but not diagnostic, because false positives occur (such as confined placental mosaicism). Confirm with CVS (11-14 weeks) or amniocentesis (from 15 weeks), each with a small miscarriage risk (about 0.5%). Decisions should follow counselling.', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v3')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = '2b58149b-f5d2-5d63-991c-1ed7d88854c2';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('0718e1ff-c032-5b9c-891e-3f4729153bf4', '2b58149b-f5d2-5d63-991c-1ed7d88854c2', 'A', 'No further action', false, 0),
  ('1685c42b-f9c6-599c-b429-f281c9232816', '2b58149b-f5d2-5d63-991c-1ed7d88854c2', 'B', 'Termination of pregnancy based on NIPT alone', false, 1),
  ('e563b2ab-bca3-5905-a2c0-41ada55ecd7a', '2b58149b-f5d2-5d63-991c-1ed7d88854c2', 'C', 'Offer an invasive diagnostic test (CVS or amniocentesis)', true, 2),
  ('2c2c4c1c-2edb-5f58-9b67-01f83d87d8d3', '2b58149b-f5d2-5d63-991c-1ed7d88854c2', 'D', 'Ultrasound only', false, 3),
  ('4a67d672-dc00-59a1-b572-53fee53d70cc', '2b58149b-f5d2-5d63-991c-1ed7d88854c2', 'E', 'Repeat NIPT in 10 weeks', false, 4);

-- Q599
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('4a66096c-b6bd-5828-a6ae-63462c2be2f3', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000036', 'sba', 'A 20 year old woman has a family history of hypertrophic cardiomyopathy (her father has an MYH7 mutation). She is asymptomatic. What is the SINGLE most appropriate step?', 'HCM is usually autosomal dominant (sarcomere genes such as MYH7, MYBPC3), so first-degree relatives have a 50% chance of carrying the variant. Offer cascade testing with counselling, and clinical screening (ECG, echo, sometimes cardiac MRI) from childhood. Those who test negative can be discharged. Carriers need lifelong surveillance.', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v3')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = '4a66096c-b6bd-5828-a6ae-63462c2be2f3';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('2e1ec1a0-84d9-5a0f-b44e-e1ecb51c31d5', '4a66096c-b6bd-5828-a6ae-63462c2be2f3', 'A', 'Start beta-blockers', false, 0),
  ('8ef1cf1e-0493-52b7-8234-5d7ec95285ae', '4a66096c-b6bd-5828-a6ae-63462c2be2f3', 'B', 'Advise her never to have children', false, 1),
  ('a1464c3b-a620-5d98-b0aa-21bae157ff9a', '4a66096c-b6bd-5828-a6ae-63462c2be2f3', 'C', 'No action needed as she is asymptomatic', false, 2),
  ('9ab3575a-c494-5a30-be06-19dc43812f65', '4a66096c-b6bd-5828-a6ae-63462c2be2f3', 'D', 'Implant an ICD', false, 3),
  ('7d53e389-5caa-5f27-8f10-61172666c66a', '4a66096c-b6bd-5828-a6ae-63462c2be2f3', 'E', 'Offer referral for genetic counselling and predictive testing, with cardiac screening (ECG and echo)', true, 4);

-- Q600
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('f7852824-d380-501b-8839-c40778fac69f', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000036', 'sba', 'A 40 year old man has early-onset familial Alzheimer''s disease diagnosed at 38. His father had the same at 41. Which gene mutation is MOST likely?', 'Early-onset familial Alzheimer''s disease (under 65, multiple affected generations) is caused by autosomal dominant mutations in PSEN1 (most common), PSEN2 or APP. APOE e4 is a risk factor for late-onset Alzheimer''s but is not deterministic. Down syndrome (extra APP on chromosome 21) also leads to early-onset Alzheimer''s.', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v3')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = 'f7852824-d380-501b-8839-c40778fac69f';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('72eb6770-123d-5cd0-b223-ad3299b28be1', 'f7852824-d380-501b-8839-c40778fac69f', 'A', 'SOD1', false, 0),
  ('022885d7-cfd8-56e9-b74e-b17a491f507a', 'f7852824-d380-501b-8839-c40778fac69f', 'B', 'Presenilin 1 (PSEN1), autosomal dominant', true, 1),
  ('cd9f1868-5d5a-59c9-abce-5bef88b4cbf3', 'f7852824-d380-501b-8839-c40778fac69f', 'C', 'APOE e4 homozygosity alone', false, 2),
  ('86c60e67-cf7c-5b5b-a658-03fd0abc624c', 'f7852824-d380-501b-8839-c40778fac69f', 'D', 'C9orf72 only', false, 3),
  ('f1837470-6964-5a71-8b1a-eeac9a518521', 'f7852824-d380-501b-8839-c40778fac69f', 'E', 'HTT', false, 4);

