-- =============================================================================
-- PLAB 1 bank v6 part 03: Q401–600 (source plab1-xlsx-v6)
-- Source: PLAB1_Question_Bank_6.xlsx — additive; does not clear v1/v2/v3/v4
-- Safe to re-run (stable UUIDs).
-- =============================================================================

-- Ensure exam exists
insert into public.exams (id, slug, name, description, is_active) values ('a1000000-0000-4000-8000-000000000001', 'plab1', 'PLAB 1', 'PLAB 1 single best answer study bank (PLABoratory).', true) on conflict (slug) do update set name = excluded.name, is_active = true;


-- Q401
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('0322007f-80fb-5a5b-830a-d872f8231c3c', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000006', 'sba', 'A 50 year old man has had an acute onset of ataxia, vertigo and vomiting. He cannot walk. HINTS exam: normal head impulse, direction-changing nystagmus and skew deviation. What is the SINGLE most likely diagnosis?', 'HINTS (Head Impulse, Nystagmus, Test of Skew) helps distinguish central from peripheral vertigo. A normal head impulse, direction-changing nystagmus or skew deviation suggest a central cause (stroke). MRI with DWI (CT is insensitive). Cerebellar strokes can swell and compress the brainstem.', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v6')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = '0322007f-80fb-5a5b-830a-d872f8231c3c';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('883c6e49-a63b-527d-8761-455d58debc25', '0322007f-80fb-5a5b-830a-d872f8231c3c', 'A', 'Ménière''s disease', false, 0),
  ('4ef165ab-ac52-5de5-b909-bac70ea2335b', '0322007f-80fb-5a5b-830a-d872f8231c3c', 'B', 'Vestibular neuronitis', false, 1),
  ('028fc915-256c-598a-b8d5-3a178ce82dbc', '0322007f-80fb-5a5b-830a-d872f8231c3c', 'C', 'BPPV', false, 2),
  ('20550ccb-01cf-59d3-9f4a-dd798beb9ae1', '0322007f-80fb-5a5b-830a-d872f8231c3c', 'D', 'Labyrinthitis', false, 3),
  ('d00f7265-a6b8-5e1f-82a0-30d0c99a2dc4', '0322007f-80fb-5a5b-830a-d872f8231c3c', 'E', 'Posterior circulation (cerebellar) stroke', true, 4);

-- Q402
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('00de85ec-9934-5c17-a018-b76370897b06', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000006', 'sba', 'A 55 year old woman has had a sudden severe headache, confusion, seizures and visual loss. BP is 210/120. MRI shows bilateral posterior white matter oedema. What is the SINGLE most likely diagnosis?', 'PRES causes headache, confusion, seizures and visual disturbance with reversible posterior oedema. Causes: severe hypertension, eclampsia, renal failure, immunosuppressants (tacrolimus, ciclosporin) and chemotherapy. Treat BP and the cause; it usually resolves.', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v6')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = '00de85ec-9934-5c17-a018-b76370897b06';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('dbd4c9bf-8c29-5276-9ab6-d4f68e1b2d50', '00de85ec-9934-5c17-a018-b76370897b06', 'A', 'Brain tumour', false, 0),
  ('df45ebd1-3761-56de-bdc9-2196ac5e310d', '00de85ec-9934-5c17-a018-b76370897b06', 'B', 'Migraine', false, 1),
  ('5acce4c0-1d26-569c-bd69-86f5664ecd8b', '00de85ec-9934-5c17-a018-b76370897b06', 'C', 'Encephalitis', false, 2),
  ('5c693c17-4a38-52ed-a899-3140c1569152', '00de85ec-9934-5c17-a018-b76370897b06', 'D', 'Posterior reversible encephalopathy syndrome (PRES)', true, 3),
  ('dec2662e-e142-57ba-ab05-c4234ead6083', '00de85ec-9934-5c17-a018-b76370897b06', 'E', 'Occipital stroke', false, 4);

-- Q403
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('37dfade4-73ab-57d3-9ba1-bee28dfc7dbe', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000018', 'sba', 'A 30 year old woman is to have a laparoscopic hysterectomy. She is on the combined pill. She has a history of DVT. What is the CORRECT VTE plan?', 'Previous VTE and oestrogen are risk factors. Stop CHC 4 weeks before major surgery. Assess VTE risk on admission (NICE NG89) and give LMWH plus mechanical prophylaxis. Review contraception (CHC is contraindicated after VTE).', null, true, true, jsonb_build_object('source', 'plab1-xlsx-v6', 'guidelines_text', 'NICE NG89')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = '37dfade4-73ab-57d3-9ba1-bee28dfc7dbe';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('0f367337-e314-5f66-89b3-6c4513b0149d', '37dfade4-73ab-57d3-9ba1-bee28dfc7dbe', 'A', 'No prophylaxis', false, 0),
  ('27bb996a-4dd3-553c-96f8-3f3d70600079', '37dfade4-73ab-57d3-9ba1-bee28dfc7dbe', 'B', 'Aspirin only', false, 1),
  ('744b895a-692b-5231-9dda-b0b56cf0d6dc', '37dfade4-73ab-57d3-9ba1-bee28dfc7dbe', 'C', 'Warfarin for 1 year', false, 2),
  ('3614aa0c-5dc7-5a4d-80b3-8adf3971e70f', '37dfade4-73ab-57d3-9ba1-bee28dfc7dbe', 'D', 'Stop the combined pill 4 weeks before surgery, use pharmacological plus mechanical prophylaxis, and seek haematology advice', true, 3),
  ('0edbf954-43f4-5492-9c3e-66929310bdc6', '37dfade4-73ab-57d3-9ba1-bee28dfc7dbe', 'E', 'Continue the pill', false, 4);

-- Q404
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('49019438-1614-5683-b731-26ed4ff4c84e', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000018', 'sba', 'A 65 year old man with COPD is having upper abdominal surgery. What is the SINGLE most important preoperative intervention to reduce pulmonary complications?', 'Postoperative pulmonary complications are reduced by smoking cessation, optimising COPD treatment, prehabilitation (exercise and breathing training), good analgesia (regional techniques) and early mobilisation.', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v6')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = '49019438-1614-5683-b731-26ed4ff4c84e';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('08e18d5c-ffee-5579-aa64-164b7404df57', '49019438-1614-5683-b731-26ed4ff4c84e', 'A', 'No intervention', false, 0),
  ('895cd0d2-cf86-5a38-b50e-a32ee6bbc9d2', '49019438-1614-5683-b731-26ed4ff4c84e', 'B', 'Routine antibiotics', false, 1),
  ('438a5d50-8410-55fb-8ca3-a6431be636cd', '49019438-1614-5683-b731-26ed4ff4c84e', 'C', 'Start oral steroids', false, 2),
  ('ab214d97-1200-56be-949d-3cb581e5cc0a', '49019438-1614-5683-b731-26ed4ff4c84e', 'D', 'Stop smoking (ideally at least 6-8 weeks before), optimise inhalers and consider prehabilitation', true, 3),
  ('54787c2d-2b6f-53f0-a8c5-d10daaccfdee', '49019438-1614-5683-b731-26ed4ff4c84e', 'E', 'Bed rest', false, 4);

-- Q405
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('c0e5fef5-cc1e-5d55-adf1-d3b4028e3f4a', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000018', 'sba', 'A 45 year old man has had surgery and is on a PCA. He has a history of heroin use and is on methadone 60 mg. His pain is uncontrolled. What is the MOST appropriate approach?', 'Patients on opioid substitution have tolerance and need their usual dose continued plus additional analgesia. Use multimodal analgesia (regional blocks, NSAIDs, paracetamol, ketamine) and involve the acute pain team. Undertreated pain increases relapse risk.', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v6')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = 'c0e5fef5-cc1e-5d55-adf1-d3b4028e3f4a';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('748a5b81-1f57-549d-bb21-c94c5b2d0a74', 'c0e5fef5-cc1e-5d55-adf1-d3b4028e3f4a', 'A', 'Continue his methadone, add multimodal analgesia and higher opioid doses with acute pain team input', true, 0),
  ('9faceead-c049-552a-b079-dc2c5708939b', 'c0e5fef5-cc1e-5d55-adf1-d3b4028e3f4a', 'B', 'Discharge early', false, 1),
  ('1ae25a23-808a-5d27-ae6d-e2f084af692a', 'c0e5fef5-cc1e-5d55-adf1-d3b4028e3f4a', 'C', 'Give naloxone', false, 2),
  ('0932c9ad-bb34-5b6b-8b76-9dd3c3c28900', 'c0e5fef5-cc1e-5d55-adf1-d3b4028e3f4a', 'D', 'Withhold all opioids', false, 3),
  ('900b31fd-a0e8-5423-bd28-d26f0cad6dc2', 'c0e5fef5-cc1e-5d55-adf1-d3b4028e3f4a', 'E', 'Stop methadone and give paracetamol only', false, 4);

-- Q406
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('fd8e6fac-eeca-5354-a9f3-061caee584da', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000018', 'sba', 'A 70 year old woman is having a hip fracture repair. What type of nerve block is recommended for analgesia in the emergency department?', 'NICE CG124: offer a nerve block (fascia iliaca or femoral) to people with hip fracture to reduce pain and opioid needs. Paracetamol every 6 hours, with opioids if needed. Avoid NSAIDs in older people.', null, true, true, jsonb_build_object('source', 'plab1-xlsx-v6', 'guidelines_text', 'NICE CG124')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = 'fd8e6fac-eeca-5354-a9f3-061caee584da';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('9e769c6e-2447-5610-a399-47e7af1e6852', 'fd8e6fac-eeca-5354-a9f3-061caee584da', 'A', 'Fascia iliaca compartment block (or femoral nerve block)', true, 0),
  ('15d87aad-aaf8-5a1b-8b50-287008c36742', 'fd8e6fac-eeca-5354-a9f3-061caee584da', 'B', 'Sciatic nerve block only', false, 1),
  ('5184cef2-f34b-5375-945b-aaec3d2adbb1', 'fd8e6fac-eeca-5354-a9f3-061caee584da', 'C', 'No nerve block', false, 2),
  ('7d21f4ce-068a-51b3-8fba-54c35ecf8bb3', 'fd8e6fac-eeca-5354-a9f3-061caee584da', 'D', 'Epidural for all', false, 3),
  ('0b356f44-2b8c-5c1a-b25b-d99714ddbf1c', 'fd8e6fac-eeca-5354-a9f3-061caee584da', 'E', 'Interscalene block', false, 4);

-- Q407
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('bf43c752-b029-5778-bf56-70d746bca776', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000018', 'sba', 'A 50 year old man is having a laparoscopic cholecystectomy. He becomes hypotensive and hypoxic during CO2 insufflation, with a ''mill-wheel'' murmur. What is the SINGLE most likely diagnosis?', 'Gas embolism during laparoscopy causes sudden hypotension, hypoxia, falling end-tidal CO2 and a mill-wheel murmur. Management: stop insufflation, release pneumoperitoneum, 100% oxygen, left lateral head-down position and resuscitation.', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v6')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = 'bf43c752-b029-5778-bf56-70d746bca776';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('4a690b69-a6d4-558d-9577-eed5707d9f78', 'bf43c752-b029-5778-bf56-70d746bca776', 'A', 'Gas (CO2) embolism', true, 0),
  ('21df6d2b-2c1f-5b24-bb1b-88b02525171d', 'bf43c752-b029-5778-bf56-70d746bca776', 'B', 'MI', false, 1),
  ('578e4d67-447a-50af-a604-68010a5c15a6', 'bf43c752-b029-5778-bf56-70d746bca776', 'C', 'Anaphylaxis', false, 2),
  ('b3b55eab-727d-51ea-afb2-126f071f81d3', 'bf43c752-b029-5778-bf56-70d746bca776', 'D', 'Haemorrhage', false, 3),
  ('c02f5e42-19a7-5162-a917-d41ea7896716', 'bf43c752-b029-5778-bf56-70d746bca776', 'E', 'Tension pneumothorax', false, 4);

-- Q408
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('8babce1f-b098-51be-8333-6d5f1a062036', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000005', 'sba', 'A 60 year old man has had ankle swelling and frothy urine. He has a 20-year history of rheumatoid arthritis. Urine protein is 5 g/day. Renal biopsy shows apple-green birefringence with Congo red stain. What is the SINGLE most likely diagnosis?', 'AA amyloidosis is secondary to chronic inflammation (RA, IBD, chronic infection, FMF). It commonly affects the kidneys (nephrotic syndrome). Congo red shows apple-green birefringence under polarised light. Treat the underlying inflammation.', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v6')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = '8babce1f-b098-51be-8333-6d5f1a062036';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('41a09a0a-69d7-572b-bcf6-12aeaaf001ca', '8babce1f-b098-51be-8333-6d5f1a062036', 'A', 'Diabetic nephropathy', false, 0),
  ('a8bd5529-f92d-5bea-ad06-30dd0abe7af0', '8babce1f-b098-51be-8333-6d5f1a062036', 'B', 'AA amyloidosis', true, 1),
  ('081866d1-b892-5de4-863e-a684b40d72ab', '8babce1f-b098-51be-8333-6d5f1a062036', 'C', 'Minimal change disease', false, 2),
  ('b024cd13-2a00-5088-b671-ef8b9ca0f0e2', '8babce1f-b098-51be-8333-6d5f1a062036', 'D', 'Membranous nephropathy', false, 3),
  ('a0f039f8-0daf-5606-8ac2-375cb5664e37', '8babce1f-b098-51be-8333-6d5f1a062036', 'E', 'IgA nephropathy', false, 4);

-- Q409
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('bd2a9422-9a9c-53f5-9e84-dc8115834cdc', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000005', 'sba', 'A 55 year old woman with type 2 diabetes has a potassium of 5.9 with a normal anion gap acidosis. She takes ramipril. eGFR is 45. What is the SINGLE most likely diagnosis?', 'Type 4 RTA is common in diabetes and CKD, causing hyperkalaemia and mild acidosis. ACE inhibitors, ARBs, spironolactone and NSAIDs worsen it. Treatment: low potassium diet, review drugs, potassium binders and fludrocortisone in some.', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v6')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = 'bd2a9422-9a9c-53f5-9e84-dc8115834cdc';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('113c0d17-e267-5693-b928-2c5c476aa436', 'bd2a9422-9a9c-53f5-9e84-dc8115834cdc', 'A', 'Addison''s disease', false, 0),
  ('4fb41fa4-31ae-51c1-bb89-0ddba6cac4fe', 'bd2a9422-9a9c-53f5-9e84-dc8115834cdc', 'B', 'Type 4 renal tubular acidosis (hyporeninaemic hypoaldosteronism)', true, 1),
  ('196f49f2-f579-549e-b3e9-429201a211c4', 'bd2a9422-9a9c-53f5-9e84-dc8115834cdc', 'C', 'Type 1 RTA', false, 2),
  ('7f930b87-c938-5c85-be8f-4f166f3b0400', 'bd2a9422-9a9c-53f5-9e84-dc8115834cdc', 'D', 'DKA', false, 3),
  ('d7240951-4a22-552b-94eb-ee48605ed375', 'bd2a9422-9a9c-53f5-9e84-dc8115834cdc', 'E', 'Type 2 RTA', false, 4);

-- Q410
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('dfceaaf9-2ff1-5e90-aef1-5e17bbfff3ce', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000005', 'sba', 'A 45 year old man with polycystic kidney disease has eGFR declining rapidly. He asks about drugs to slow progression. Which drug is licensed for this in ADPKD?', 'Tolvaptan slows cyst growth and eGFR decline in rapidly progressing ADPKD. It causes polyuria and thirst, and needs LFT monitoring (hepatotoxicity). Control BP with ACE inhibitors.', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v6')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = 'dfceaaf9-2ff1-5e90-aef1-5e17bbfff3ce';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('d1389509-9fb2-5f44-ae19-41571273787d', 'dfceaaf9-2ff1-5e90-aef1-5e17bbfff3ce', 'A', 'Furosemide', false, 0),
  ('4ab1e38f-7445-5510-9406-37e76a197c37', 'dfceaaf9-2ff1-5e90-aef1-5e17bbfff3ce', 'B', 'Metformin', false, 1),
  ('196a5cb7-ce07-5f91-845c-1a0e7a40f142', 'dfceaaf9-2ff1-5e90-aef1-5e17bbfff3ce', 'C', 'Allopurinol', false, 2),
  ('f2729925-4e8c-5bb8-974a-18c20ab10a5c', 'dfceaaf9-2ff1-5e90-aef1-5e17bbfff3ce', 'D', 'Spironolactone', false, 3),
  ('6fd974ee-ba84-57da-b023-fdba5375ada0', 'dfceaaf9-2ff1-5e90-aef1-5e17bbfff3ce', 'E', 'Tolvaptan (vasopressin V2 receptor antagonist)', true, 4);

-- Q411
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('2463a3bc-0ad7-5161-bb88-3c44179f6d68', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000020', 'sba', 'A 21 year old woman has had dysuria, frequency and urethral discharge. Her urine culture is negative and NAAT is negative for chlamydia and gonorrhoea. Microscopy shows pus cells. What is the MOST likely cause to test for?', 'Sterile pyuria or urethritis with negative chlamydia and gonorrhoea tests: consider Mycoplasma genitalium, Trichomonas, HSV and non-specific urethritis. Test with NAAT and treat partners.', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v6')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = '2463a3bc-0ad7-5161-bb88-3c44179f6d68';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('b076d77a-d502-52ac-b805-288d5c63e31b', '2463a3bc-0ad7-5161-bb88-3c44179f6d68', 'A', 'Mycoplasma genitalium or Trichomonas vaginalis', true, 0),
  ('e93269e8-41e9-5e4a-91ab-da4a9505d35a', '2463a3bc-0ad7-5161-bb88-3c44179f6d68', 'B', 'Candida', false, 1),
  ('3380e32c-87a1-559e-bd1f-09f35416ede7', '2463a3bc-0ad7-5161-bb88-3c44179f6d68', 'C', 'E. coli', false, 2),
  ('8b0df57c-d4af-5505-af04-966c1330ddca', '2463a3bc-0ad7-5161-bb88-3c44179f6d68', 'D', 'HSV', false, 3),
  ('46486f2f-6aca-58c8-b033-0f342aed6419', '2463a3bc-0ad7-5161-bb88-3c44179f6d68', 'E', 'Syphilis', false, 4);

-- Q412
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('f6c6c14b-941c-5adf-be5f-de982bbad69d', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000020', 'sba', 'A 30 year old man has been diagnosed with HIV. His CD4 is 600 and viral load is 50,000 copies/mL. When should ART be started?', 'BHIVA: start ART for all people with HIV, regardless of CD4 count, as soon as they are ready. Early treatment improves outcomes and prevents onward transmission (U=U). Check baseline resistance, hepatitis B and C, and drug interactions.', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v6')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = 'f6c6c14b-941c-5adf-be5f-de982bbad69d';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('16f646e1-b27d-5897-8005-a71fb4a9637b', 'f6c6c14b-941c-5adf-be5f-de982bbad69d', 'A', 'As soon as possible, regardless of CD4 count', true, 0),
  ('635775f7-f68d-5ba9-81f6-4e925f990da1', 'f6c6c14b-941c-5adf-be5f-de982bbad69d', 'B', 'After 5 years', false, 1),
  ('62d47c8a-40e1-56e4-8d0b-68eabf881989', 'f6c6c14b-941c-5adf-be5f-de982bbad69d', 'C', 'Only when CD4 falls below 350', false, 2),
  ('26470a14-4faf-5d99-8c08-3c5ead9b958c', 'f6c6c14b-941c-5adf-be5f-de982bbad69d', 'D', 'Only when symptomatic', false, 3),
  ('bc070cf7-91e3-5eeb-8d45-13f2a4cf8f6b', 'f6c6c14b-941c-5adf-be5f-de982bbad69d', 'E', 'Never', false, 4);

-- Q413
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('e4683f25-c801-5ec6-a3c4-0fe542b2b5d3', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000020', 'sba', 'A 19 year old woman has had a painful vulval ulcer and dysuria with fever and inguinal lymphadenopathy. It is her first episode. PCR confirms HSV-2. What is the SINGLE most appropriate treatment?', 'First-episode genital herpes: oral antivirals within 5 days of onset (or while new lesions form), analgesia, saline bathing and topical anaesthetic. Urinary retention may occur. Recurrences are milder. Advise on transmission and disclosure.', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v6')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = 'e4683f25-c801-5ec6-a3c4-0fe542b2b5d3';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('2cecee26-7df5-59b4-93b4-29419258784b', 'e4683f25-c801-5ec6-a3c4-0fe542b2b5d3', 'A', 'No treatment', false, 0),
  ('010c9d6f-f89d-5e25-a5eb-9061de7f35fe', 'e4683f25-c801-5ec6-a3c4-0fe542b2b5d3', 'B', 'Topical aciclovir alone', false, 1),
  ('a07bdde7-2d4d-5a1a-a673-894989fb79e4', 'e4683f25-c801-5ec6-a3c4-0fe542b2b5d3', 'C', 'IV antibiotics', false, 2),
  ('8a9b079a-872e-5cd6-b5cb-8c000518566d', 'e4683f25-c801-5ec6-a3c4-0fe542b2b5d3', 'D', 'Oral aciclovir (or valaciclovir) for 5 days, with analgesia, saline bathing and advice', true, 3),
  ('280e9906-d5b3-501a-912b-9c0fe7746633', 'e4683f25-c801-5ec6-a3c4-0fe542b2b5d3', 'E', 'Oral steroids', false, 4);

-- Q414
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('b01bb46d-12e1-571b-92a8-28dbeff985fc', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000020', 'sba', 'A 23 year old woman has missed her depot injection, which was due 15 weeks ago (13 weeks + 2 days late). She had unprotected sex 3 days ago. What is the MOST appropriate management?', 'DMPA (Depo-Provera) can be given up to 14 weeks after the last injection. If late and UPSI has occurred, offer emergency contraception, give the injection if reasonably certain she is not pregnant, with condoms for 7 days and a pregnancy test in 3 weeks.', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v6')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = 'b01bb46d-12e1-571b-92a8-28dbeff985fc';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('3ffb6d59-22c3-57e4-92cd-109b84a43ca7', 'b01bb46d-12e1-571b-92a8-28dbeff985fc', 'A', 'No contraception needed', false, 0),
  ('d0e28021-7f96-56af-8020-c971200d07ab', 'b01bb46d-12e1-571b-92a8-28dbeff985fc', 'B', 'Advise her to stop contraception', false, 1),
  ('9cda7166-1f20-5659-880b-adc1077f005b', 'b01bb46d-12e1-571b-92a8-28dbeff985fc', 'C', 'Give the injection with no other action', false, 2),
  ('3292bad0-457e-523c-811b-18a57b5437a9', 'b01bb46d-12e1-571b-92a8-28dbeff985fc', 'D', 'Offer emergency contraception (copper IUD preferred), a pregnancy test, give the injection, and use condoms for 7 days', true, 3),
  ('f377db04-8e44-5ac6-8723-656de3b0cde3', 'b01bb46d-12e1-571b-92a8-28dbeff985fc', 'E', 'Wait for her period', false, 4);

-- Q415
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('ca96fde9-b17d-5211-a19a-8d442e0c1cf4', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000035', 'sba', 'A 60 year old man in ICU has had a raised lactate of 6 mmol/L. He is not septic. He takes metformin and has AKI. What is the SINGLE most likely cause of the raised lactate?', 'Metformin-associated lactic acidosis is rare, usually in AKI, sepsis or hypoxia. Stop metformin; haemodialysis for severe acidosis or high lactate. Other causes of raised lactate: shock, ischaemia, liver failure, seizures and drugs.', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v6')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = 'ca96fde9-b17d-5211-a19a-8d442e0c1cf4';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('df298984-85ae-5405-8736-04b2de6d0139', 'ca96fde9-b17d-5211-a19a-8d442e0c1cf4', 'A', 'Metformin-associated lactic acidosis', true, 0),
  ('6442af86-40de-5a3b-ab8d-b1b99fdca764', 'ca96fde9-b17d-5211-a19a-8d442e0c1cf4', 'B', 'DKA', false, 1),
  ('b801c85b-7a65-5e19-86bf-a8d6e8aaa30d', 'ca96fde9-b17d-5211-a19a-8d442e0c1cf4', 'C', 'Liver failure', false, 2),
  ('cd1c7b9f-e99a-5c62-9fd6-404443723537', 'ca96fde9-b17d-5211-a19a-8d442e0c1cf4', 'D', 'Thiamine deficiency only', false, 3),
  ('e73ae832-702e-53e2-af05-66e6f0fd6ece', 'ca96fde9-b17d-5211-a19a-8d442e0c1cf4', 'E', 'Hypovolaemia only', false, 4);

-- Q416
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('56db6955-4594-568e-b4a0-b29f80267c58', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000035', 'sba', 'A 35 year old woman in ICU after major trauma has received 10 units of blood. She is oozing from line sites. What is the SINGLE most important principle of major haemorrhage management?', 'Major haemorrhage protocols use balanced blood products to prevent coagulopathy. Give tranexamic acid early (within 3 hours of trauma). Avoid the lethal triad (hypothermia, acidosis, coagulopathy) and replace calcium. Use viscoelastic testing where available.', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v6')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = '56db6955-4594-568e-b4a0-b29f80267c58';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('5e3c7688-4d43-5224-8ef8-2380c1e79441', '56db6955-4594-568e-b4a0-b29f80267c58', 'A', 'Crystalloids only', false, 0),
  ('3099b3c6-37fb-5744-bef5-810736e65c0a', '56db6955-4594-568e-b4a0-b29f80267c58', 'B', 'Red cells only', false, 1),
  ('88527d71-0205-5f80-8d47-8ff4c43389a7', '56db6955-4594-568e-b4a0-b29f80267c58', 'C', 'Aspirin', false, 2),
  ('64516f93-7aa2-504f-9a13-8fc9444eeb69', '56db6955-4594-568e-b4a0-b29f80267c58', 'D', 'Wait for clotting results before any products', false, 3),
  ('e0716a65-3063-5d92-bc7a-be0d61a3057a', '56db6955-4594-568e-b4a0-b29f80267c58', 'E', 'Balanced transfusion of red cells, FFP and platelets (with cryoprecipitate guided by fibrinogen), tranexamic acid, and correction of hypothermia, acidosis and calcium', true, 4);

-- Q417
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('083b0f58-74a4-59c5-ab6f-a1a32738dac6', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000035', 'sba', 'A 45 year old man is ventilated in ICU and becomes increasingly sedated, with low BP. He has been on a propofol infusion at high dose for 4 days. He has a metabolic acidosis, rhabdomyolysis and raised triglycerides. What is the SINGLE most likely diagnosis?', 'Propofol infusion syndrome is rare but life-threatening, with high-dose prolonged infusions: metabolic acidosis, rhabdomyolysis, hyperkalaemia, hypertriglyceridaemia, arrhythmias and cardiac failure. Stop propofol and give supportive care.', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v6')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = '083b0f58-74a4-59c5-ab6f-a1a32738dac6';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('8b626a52-c213-561b-a01e-4f968a47c48e', '083b0f58-74a4-59c5-ab6f-a1a32738dac6', 'A', 'Serotonin syndrome', false, 0),
  ('ff2f6242-59c2-5506-ba72-6afdabaced9e', '083b0f58-74a4-59c5-ab6f-a1a32738dac6', 'B', 'Neuroleptic malignant syndrome', false, 1),
  ('dfd80426-210c-5784-8f76-f5b0096324dc', '083b0f58-74a4-59c5-ab6f-a1a32738dac6', 'C', 'Propofol infusion syndrome', true, 2),
  ('fe7f9139-eb7d-5d86-b229-22b75448fc89', '083b0f58-74a4-59c5-ab6f-a1a32738dac6', 'D', 'Sepsis', false, 3),
  ('12bac4e5-2799-5f23-9935-c82f108fa0fb', '083b0f58-74a4-59c5-ab6f-a1a32738dac6', 'E', 'Malignant hyperthermia', false, 4);

-- Q418
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('e8892046-8841-58af-a9e1-482a74fe1975', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000012', 'sba', 'A 45 year old man has had numerous red, scaly, itchy lesions after starting a beta-blocker. He has known psoriasis. What is the SINGLE most likely explanation?', 'Drugs that worsen psoriasis: beta-blockers, lithium, antimalarials (hydroxychloroquine), NSAIDs, ACE inhibitors and withdrawal of systemic steroids. Review and change drugs where possible.', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v6')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = 'e8892046-8841-58af-a9e1-482a74fe1975';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('de6786f0-47fc-58d4-aa75-31b59b9ab794', 'e8892046-8841-58af-a9e1-482a74fe1975', 'A', 'Scabies', false, 0),
  ('e5be53b8-a8c1-5ed9-ae4a-c895bab98524', 'e8892046-8841-58af-a9e1-482a74fe1975', 'B', 'New eczema', false, 1),
  ('cb3a96fa-34dd-5cc1-9932-b1bd54d01386', 'e8892046-8841-58af-a9e1-482a74fe1975', 'C', 'Fungal infection', false, 2),
  ('5bef8137-cdfd-55d2-ae4a-c64c83fa7745', 'e8892046-8841-58af-a9e1-482a74fe1975', 'D', 'Drug-induced flare of psoriasis', true, 3),
  ('a396242f-5fa2-506e-9eed-9f28ec21cf2b', 'e8892046-8841-58af-a9e1-482a74fe1975', 'E', 'Drug-induced lupus', false, 4);

-- Q419
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('021aafed-c7c3-5f88-85c2-ecfc8e9f85ac', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000012', 'sba', 'A 35 year old woman has had a tender red nodule on her shin after starting the combined pill. She also has bilateral hilar lymphadenopathy. What is the MOST likely underlying cause?', 'Erythema nodosum with bilateral hilar lymphadenopathy suggests sarcoidosis (Löfgren''s syndrome). Other causes: streptococcal infection, TB, IBD, drugs, pregnancy. Investigate the underlying cause.', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v6')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = '021aafed-c7c3-5f88-85c2-ecfc8e9f85ac';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('f726f4a5-f6f6-574d-a0d2-c16aec4c293f', '021aafed-c7c3-5f88-85c2-ecfc8e9f85ac', 'A', 'Sarcoidosis', true, 0),
  ('621155ff-503e-5720-a143-8edbb1e4acaf', '021aafed-c7c3-5f88-85c2-ecfc8e9f85ac', 'B', 'TB', false, 1),
  ('58b9e123-f673-53a5-a7e0-161b2968b4b3', '021aafed-c7c3-5f88-85c2-ecfc8e9f85ac', 'C', 'Inflammatory bowel disease', false, 2),
  ('c523845c-a136-5f22-b5dc-3f9aa848635b', '021aafed-c7c3-5f88-85c2-ecfc8e9f85ac', 'D', 'Streptococcal infection', false, 3),
  ('e2313d68-362d-5d13-9a70-a687ad7c024d', '021aafed-c7c3-5f88-85c2-ecfc8e9f85ac', 'E', 'Combined pill only', false, 4);

-- Q420
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('3a64aaac-b943-50fa-b201-c6b064abc4e0', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000026', 'sba', 'A 3 year old child has had a hearing problem noticed at nursery. Tympanometry shows a flat (type B) trace bilaterally. What is the SINGLE most likely diagnosis?', 'A flat (type B) tympanogram indicates fluid behind the eardrum (glue ear) or a perforation (with large ear canal volume). Glue ear causes conductive hearing loss, often resolving within 3 months. Grommets or hearing aids for persistent bilateral hearing loss.', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v6')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = '3a64aaac-b943-50fa-b201-c6b064abc4e0';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('a6b349ac-be75-5872-96f8-b1a1a6500c88', '3a64aaac-b943-50fa-b201-c6b064abc4e0', 'A', 'Otitis media with effusion (glue ear)', true, 0),
  ('83ac5371-6b32-564e-9bc4-63896eea9d9f', '3a64aaac-b943-50fa-b201-c6b064abc4e0', 'B', 'Perforated eardrum', false, 1),
  ('37dac10c-ce50-5439-9880-9ebca266628b', '3a64aaac-b943-50fa-b201-c6b064abc4e0', 'C', 'Acute otitis media', false, 2),
  ('058be19c-6f5f-55f7-818a-d2bec3c8b0c5', '3a64aaac-b943-50fa-b201-c6b064abc4e0', 'D', 'Otosclerosis', false, 3),
  ('b010c55b-2faa-5605-8d3f-c66a93b3313d', '3a64aaac-b943-50fa-b201-c6b064abc4e0', 'E', 'Sensorineural hearing loss', false, 4);

-- Q421
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('dc279a16-1684-5be3-b8e9-dadb8d4dca23', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000026', 'sba', 'A 50 year old woman has had a constant feeling of fullness in one ear, hearing loss and tinnitus since a flight. She has a cold. Otoscopy shows a retracted eardrum. What is the SINGLE most likely diagnosis?', 'Barotrauma and Eustachian tube dysfunction occur with pressure changes (flying, diving), especially with a cold. Advise autoinflation (Valsalva), decongestants and nasal steroids. Persistent symptoms need ENT review.', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v6')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = 'dc279a16-1684-5be3-b8e9-dadb8d4dca23';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('f7460d8d-b16f-5e9c-b6eb-4c501396447d', 'dc279a16-1684-5be3-b8e9-dadb8d4dca23', 'A', 'Cholesteatoma', false, 0),
  ('5793b223-f5aa-5068-8f49-53197955f107', 'dc279a16-1684-5be3-b8e9-dadb8d4dca23', 'B', 'Otitis externa', false, 1),
  ('f9027df2-3fc2-5014-a555-112a2020e794', 'dc279a16-1684-5be3-b8e9-dadb8d4dca23', 'C', 'Ménière''s disease', false, 2),
  ('7a2a3fa6-181a-5693-bd31-88629f09af00', 'dc279a16-1684-5be3-b8e9-dadb8d4dca23', 'D', 'Acoustic neuroma', false, 3),
  ('af5e808d-8322-5802-aa0b-3369bbaf5d31', 'dc279a16-1684-5be3-b8e9-dadb8d4dca23', 'E', 'Eustachian tube dysfunction (barotrauma)', true, 4);

-- Q422
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('9b8beadd-4346-50c2-be56-c799ed074433', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000026', 'sba', 'A 40 year old woman has had a lump in her neck. Ultrasound shows a 3 cm thyroid nodule with microcalcifications. FNA shows Thy5 (papillary carcinoma). What is the SINGLE most appropriate management?', 'Papillary thyroid cancer has an excellent prognosis. Small low-risk tumours may need only hemithyroidectomy; larger or higher-risk tumours need total thyroidectomy and radioiodine ablation. TSH suppression and thyroglobulin monitoring follow.', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v6')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = '9b8beadd-4346-50c2-be56-c799ed074433';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('f93698ea-848a-5bbd-be4c-50e06a633133', '9b8beadd-4346-50c2-be56-c799ed074433', 'A', 'Radioiodine alone', false, 0),
  ('e1b06680-38a0-5d3d-aac3-9cfbb47c07ef', '9b8beadd-4346-50c2-be56-c799ed074433', 'B', 'Observation', false, 1),
  ('9a513967-4f1e-571b-94c1-f12d7114c207', '9b8beadd-4346-50c2-be56-c799ed074433', 'C', 'Chemotherapy', false, 2),
  ('d337d09d-efbd-55ea-95e1-327843134377', '9b8beadd-4346-50c2-be56-c799ed074433', 'D', 'Thyroid surgery (hemithyroidectomy or total thyroidectomy depending on risk), with radioiodine in selected cases', true, 3),
  ('1656aea3-999e-53ca-9e7e-f3d4ff6605c4', '9b8beadd-4346-50c2-be56-c799ed074433', 'E', 'Levothyroxine alone', false, 4);

-- Q423
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('ea733271-a64d-57cc-8774-d816974ab311', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000025', 'sba', 'A 70 year old woman has had a suspected stroke 1 hour ago. Which imaging is first-line to exclude haemorrhage before thrombolysis?', 'Non-contrast CT excludes haemorrhage before thrombolysis. CT angiography identifies large vessel occlusion. CT perfusion or MRI helps select patients beyond standard time windows.', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v6')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = 'ea733271-a64d-57cc-8774-d816974ab311';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('f325bab9-3b27-50c6-b909-4d23fe8d6ca0', 'ea733271-a64d-57cc-8774-d816974ab311', 'A', 'Skull X-ray', false, 0),
  ('c052e478-610f-53a1-94e6-7d17af685716', 'ea733271-a64d-57cc-8774-d816974ab311', 'B', 'Non-contrast CT head (with CT angiography if thrombectomy is being considered)', true, 1),
  ('920bad2d-683e-5a3b-bcb3-9549c77d44d3', 'ea733271-a64d-57cc-8774-d816974ab311', 'C', 'MRI with gadolinium only', false, 2),
  ('2bbad977-d83c-57e5-8c24-496228afd582', 'ea733271-a64d-57cc-8774-d816974ab311', 'D', 'Echocardiogram', false, 3),
  ('335f9839-3a5d-5748-aa73-23dddb0edf38', 'ea733271-a64d-57cc-8774-d816974ab311', 'E', 'Carotid Doppler', false, 4);

-- Q424
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('1a1c50f9-4a05-5b88-b734-8e778d75b163', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000034', 'sba', 'A 72 year old woman is started on furosemide for heart failure. She also takes gentamicin for a UTI. What is the main risk?', 'Loop diuretics and aminoglycosides both cause ototoxicity and nephrotoxicity; the combination increases the risk. Monitor gentamicin levels and renal function, and avoid together where possible.', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v6')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = '1a1c50f9-4a05-5b88-b734-8e778d75b163';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('278da8fb-f3dd-5355-abd9-9aea611a4d2b', '1a1c50f9-4a05-5b88-b734-8e778d75b163', 'A', 'Hyperkalaemia', false, 0),
  ('4a1a686f-a492-5d23-9f8f-999935d50c4e', '1a1c50f9-4a05-5b88-b734-8e778d75b163', 'B', 'Hypoglycaemia', false, 1),
  ('1943ef70-6c6e-50f1-b45b-67bcb0b57f56', '1a1c50f9-4a05-5b88-b734-8e778d75b163', 'C', 'Bradycardia', false, 2),
  ('1b31a5aa-6f8f-5bc6-8901-40075a81e33c', '1a1c50f9-4a05-5b88-b734-8e778d75b163', 'D', 'Ototoxicity and nephrotoxicity (combined loop diuretic and aminoglycoside)', true, 3),
  ('956b88b5-f68a-582e-9cba-fda540906203', '1a1c50f9-4a05-5b88-b734-8e778d75b163', 'E', 'Hypertension', false, 4);

-- Q425
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('3c58d3c5-41f5-5648-ab0a-9b5e55a5a1c9', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000034', 'sba', 'A 30 year old woman with epilepsy takes carbamazepine. She develops a low sodium of 126 mmol/L. What is the SINGLE most likely cause?', 'Carbamazepine (and oxcarbazepine) commonly cause hyponatraemia via SIADH. Other side effects: rash (SJS, HLA-B*1502 in Han Chinese), leucopenia, ataxia, diplopia and enzyme induction. Check sodium and FBC.', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v6')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = '3c58d3c5-41f5-5648-ab0a-9b5e55a5a1c9';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('6722d485-b597-50f1-a38f-85ee16dc1b35', '3c58d3c5-41f5-5648-ab0a-9b5e55a5a1c9', 'A', 'Hypothyroidism', false, 0),
  ('99d01d26-b03e-583c-a022-2ad72756a7ac', '3c58d3c5-41f5-5648-ab0a-9b5e55a5a1c9', 'B', 'Carbamazepine-induced SIADH', true, 1),
  ('ea1bbc2f-2ef0-504d-a88a-b8ef34a9b6a7', '3c58d3c5-41f5-5648-ab0a-9b5e55a5a1c9', 'C', 'Addison''s disease', false, 2),
  ('552000ee-6faa-50f5-9f24-9e7735c7b4d7', '3c58d3c5-41f5-5648-ab0a-9b5e55a5a1c9', 'D', 'Diuretic use', false, 3),
  ('69bc602d-c899-5cb2-b1f0-311ff19c76df', '3c58d3c5-41f5-5648-ab0a-9b5e55a5a1c9', 'E', 'Water excess', false, 4);

-- Q426
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('00bc7a07-efb7-54a4-863e-e0f6053000a6', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000034', 'sba', 'A 65 year old man takes spironolactone and ramipril for heart failure. He is prescribed trimethoprim for a UTI. What is the MAIN risk?', 'Trimethoprim acts like amiloride, reducing potassium excretion, and raises creatinine. Combined with ACE inhibitors, ARBs and MRAs, it can cause dangerous hyperkalaemia. Choose an alternative antibiotic or monitor potassium.', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v6')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = '00bc7a07-efb7-54a4-863e-e0f6053000a6';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('92222a9f-a7d8-54f1-91e1-ac8674eea44d', '00bc7a07-efb7-54a4-863e-e0f6053000a6', 'A', 'No risk', false, 0),
  ('57427264-99f8-56bd-afa8-ac36cef87a81', '00bc7a07-efb7-54a4-863e-e0f6053000a6', 'B', 'Hypokalaemia', false, 1),
  ('6ed0e7ec-a672-5882-8eb1-254074137ac3', '00bc7a07-efb7-54a4-863e-e0f6053000a6', 'C', 'Hypoglycaemia', false, 2),
  ('5a6bdef1-f5e1-5188-afd5-ba70b1761603', '00bc7a07-efb7-54a4-863e-e0f6053000a6', 'D', 'QT prolongation only', false, 3),
  ('6ed26607-64e4-51df-a4f4-ea98495e526b', '00bc7a07-efb7-54a4-863e-e0f6053000a6', 'E', 'Hyperkalaemia (trimethoprim reduces potassium excretion)', true, 4);

-- Q427
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('bfacba93-e9de-5d9d-908b-00d4c00fa21f', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000009', 'sba', 'A 2 year old boy has had a sudden onset of breathing difficulty and coughing after playing with small toys. He has unilateral wheeze and reduced air entry on the right. What is the SINGLE most likely diagnosis?', 'Sudden choking or coughing with unilateral wheeze suggests foreign body inhalation (often the right main bronchus). CXR may be normal or show air trapping. Rigid bronchoscopy to remove it.', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v6')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = 'bfacba93-e9de-5d9d-908b-00d4c00fa21f';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('99196e77-0d33-595e-a8e5-cb5694777c5f', 'bfacba93-e9de-5d9d-908b-00d4c00fa21f', 'A', 'Croup', false, 0),
  ('852eb8df-5148-5873-bd1e-9f5db0bb82cc', 'bfacba93-e9de-5d9d-908b-00d4c00fa21f', 'B', 'Inhaled foreign body', true, 1),
  ('fff075aa-8455-5838-80ed-d4c48e50497e', 'bfacba93-e9de-5d9d-908b-00d4c00fa21f', 'C', 'Pneumonia', false, 2),
  ('b132ed0e-e16f-5e81-abad-49b130d49b68', 'bfacba93-e9de-5d9d-908b-00d4c00fa21f', 'D', 'Asthma', false, 3),
  ('2437f0e1-03cf-5c6d-9af8-03ce8e4860a2', 'bfacba93-e9de-5d9d-908b-00d4c00fa21f', 'E', 'Bronchiolitis', false, 4);

-- Q428
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('ec3a3a7e-8fd2-5107-b38f-0b7c0a7e0ae4', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000009', 'sba', 'A 6 month old baby has had a weak cry, constipation, poor feeding and drooping eyelids. She has been given honey. What is the SINGLE most likely diagnosis?', 'Infant botulism follows ingestion of Clostridium botulinum spores (honey), causing constipation, poor feeding, weak cry, ptosis and descending paralysis. Treatment: supportive care and botulism immune globulin. Avoid honey under 1 year.', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v6')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = 'ec3a3a7e-8fd2-5107-b38f-0b7c0a7e0ae4';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('256bddf9-30ec-56cb-abbb-cd70497cb3b5', 'ec3a3a7e-8fd2-5107-b38f-0b7c0a7e0ae4', 'A', 'Hypothyroidism', false, 0),
  ('ae550b08-f6b1-59e6-8ea7-ead9ce2e6888', 'ec3a3a7e-8fd2-5107-b38f-0b7c0a7e0ae4', 'B', 'Myasthenia gravis', false, 1),
  ('3f05e48d-2b32-58b2-a936-9451b2fcb421', 'ec3a3a7e-8fd2-5107-b38f-0b7c0a7e0ae4', 'C', 'Spinal muscular atrophy', false, 2),
  ('6f17a84c-e464-5831-8bde-a1c782d59318', 'ec3a3a7e-8fd2-5107-b38f-0b7c0a7e0ae4', 'D', 'Guillain-Barré syndrome', false, 3),
  ('62811191-a433-57db-9a43-0c3a6293ca1f', 'ec3a3a7e-8fd2-5107-b38f-0b7c0a7e0ae4', 'E', 'Infant botulism', true, 4);

-- Q429
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('910cbf4b-4e64-5b50-b9a9-131347140a1b', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000009', 'sba', 'A 4 year old girl has had a high fever, a sore throat, a fine rough rash and a strawberry tongue. She is now pale, with joint pains and a new heart murmur 3 weeks later. What is the SINGLE most likely diagnosis?', 'Rheumatic fever follows group A strep pharyngitis (2-4 weeks), diagnosed with Jones criteria: carditis, polyarthritis, Sydenham''s chorea, erythema marginatum and subcutaneous nodules. Treat with penicillin, aspirin or NSAIDs, and long-term penicillin prophylaxis.', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v6')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = '910cbf4b-4e64-5b50-b9a9-131347140a1b';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('21c12901-4b22-537d-aefa-57264fbd6fbe', '910cbf4b-4e64-5b50-b9a9-131347140a1b', 'A', 'Infective endocarditis', false, 0),
  ('09747291-e1eb-5a06-93cd-b24d7111e98a', '910cbf4b-4e64-5b50-b9a9-131347140a1b', 'B', 'Viral myocarditis', false, 1),
  ('a367adb7-93e9-5b33-a9f6-fa638fbe4080', '910cbf4b-4e64-5b50-b9a9-131347140a1b', 'C', 'Scarlet fever only', false, 2),
  ('7fa4b855-f521-52ac-bea7-72e8a3108c21', '910cbf4b-4e64-5b50-b9a9-131347140a1b', 'D', 'Acute rheumatic fever', true, 3),
  ('ddebc7e4-75f1-512a-b11b-56e14c3fc3a4', '910cbf4b-4e64-5b50-b9a9-131347140a1b', 'E', 'Kawasaki disease', false, 4);

-- Q430
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('09ff69b4-1942-5320-b7e5-321b4aac8de8', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000008', 'sba', 'A 32 year old woman is 24 weeks pregnant. She has had pain and swelling in her left calf. Doppler confirms DVT. What is the SINGLE most appropriate treatment?', 'In pregnancy, LMWH is used for VTE (warfarin is teratogenic; DOACs are not recommended). Continue until at least 6 weeks postpartum and for a total of at least 3 months. Plan delivery with anaesthetic input (neuraxial timing).', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v6')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = '09ff69b4-1942-5320-b7e5-321b4aac8de8';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('3d97d485-1b58-5a6d-9e6d-59fc5a68634a', '09ff69b4-1942-5320-b7e5-321b4aac8de8', 'A', 'Therapeutic low molecular weight heparin for the rest of pregnancy and at least 6 weeks postnatally', true, 0),
  ('d47f677f-0936-5196-850f-256252218790', '09ff69b4-1942-5320-b7e5-321b4aac8de8', 'B', 'Warfarin', false, 1),
  ('1e67116c-4bd5-5a65-a4f8-b75b204b98ab', '09ff69b4-1942-5320-b7e5-321b4aac8de8', 'C', 'DOAC', false, 2),
  ('464ef2d5-823b-557a-81a5-e7379b083c5f', '09ff69b4-1942-5320-b7e5-321b4aac8de8', 'D', 'No treatment', false, 3),
  ('d9b72818-2e5f-5d02-a10d-54e978e1c1d6', '09ff69b4-1942-5320-b7e5-321b4aac8de8', 'E', 'Aspirin', false, 4);

-- Q431
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('c672c448-7a06-5d25-89ce-372f7aeeeeb2', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000008', 'sba', 'A 28 year old woman is 34 weeks pregnant. She has had itching and raised bile acids of 40 µmol/L. What is the SINGLE most appropriate management?', 'Intrahepatic cholestasis of pregnancy: stillbirth risk rises with peak bile acids of 100 µmol/L or more (consider birth at 35-36 weeks). With lower levels, birth may be planned closer to term. Repeat LFTs 4 weeks postpartum.', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v6')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = 'c672c448-7a06-5d25-89ce-372f7aeeeeb2';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('95c3b47b-70e1-5370-ab26-dec087e2c0ef', 'c672c448-7a06-5d25-89ce-372f7aeeeeb2', 'A', 'Monitor bile acids and LFTs, consider antihistamines or ursodeoxycholic acid for itch, and plan timing of birth based on bile acid levels', true, 0),
  ('532c7240-dc4a-58cd-992f-6a56af1a2aa1', 'c672c448-7a06-5d25-89ce-372f7aeeeeb2', 'B', 'Immediate caesarean section', false, 1),
  ('9d4cddd2-82b0-5c27-93c5-d528586fc0f5', 'c672c448-7a06-5d25-89ce-372f7aeeeeb2', 'C', 'No follow-up needed', false, 2),
  ('2bd0cc84-2e98-5362-bbee-1fb411059d3f', 'c672c448-7a06-5d25-89ce-372f7aeeeeb2', 'D', 'Stop all medicines', false, 3),
  ('4c6a60d7-338c-59af-b026-a2b181851549', 'c672c448-7a06-5d25-89ce-372f7aeeeeb2', 'E', 'Admit for daily CTG', false, 4);

-- Q432
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('1eb85911-0821-5bfe-842a-c7be4cd69226', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000007', 'sba', 'A 50 year old man has had low mood, early morning waking and weight loss for 3 months. He has made a plan to end his life and has access to medication. What is the SINGLE most appropriate management?', 'Active suicidal plans with access to means are high risk. Refer urgently to crisis or home treatment teams. Limit access to means (small supplies of medication). Involve family. Consider admission if risk cannot be managed safely.', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v6')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = '1eb85911-0821-5bfe-842a-c7be4cd69226';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('a074ef66-a958-56e7-a34d-379ecb3569be', '1eb85911-0821-5bfe-842a-c7be4cd69226', 'A', 'Prescribe a large supply of antidepressants', false, 0),
  ('2a78c3e0-5ba7-58ca-b40d-9f064d6ce133', '1eb85911-0821-5bfe-842a-c7be4cd69226', 'B', 'Guided self-help only', false, 1),
  ('f5e8693c-b771-5b4d-9185-f853ce914a2c', '1eb85911-0821-5bfe-842a-c7be4cd69226', 'C', 'Urgent referral to the crisis team or mental health services; remove access to means and involve family', true, 2),
  ('d61681c1-3122-5c58-9cc9-b0358a355161', '1eb85911-0821-5bfe-842a-c7be4cd69226', 'D', 'Review in 3 months', false, 3),
  ('59a8bc67-9353-5d40-b9c6-6c10248b8634', '1eb85911-0821-5bfe-842a-c7be4cd69226', 'E', 'Discharge', false, 4);

-- Q433
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('e671d49a-3419-55a1-a0e3-e885e2fdd8a7', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000007', 'sba', 'A 35 year old woman has had excessive daytime sleepiness, weight gain, increased appetite and low mood every winter for 4 years. What is the SINGLE most likely diagnosis?', 'Seasonal affective disorder is depression that recurs at the same time each year (usually winter), often with atypical features (hypersomnia, hyperphagia, weight gain). Treat as depression (CBT, SSRIs). Light therapy is sometimes used.', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v6')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = 'e671d49a-3419-55a1-a0e3-e885e2fdd8a7';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('a3a9ddc1-0cef-5851-85e2-34d16cfcca0f', 'e671d49a-3419-55a1-a0e3-e885e2fdd8a7', 'A', 'Depression with a seasonal pattern (seasonal affective disorder)', true, 0),
  ('fbf0d5f5-6fea-5f40-8c35-481151b31939', 'e671d49a-3419-55a1-a0e3-e885e2fdd8a7', 'B', 'Narcolepsy', false, 1),
  ('078bebf4-1c62-5d0b-be03-37fecec49025', 'e671d49a-3419-55a1-a0e3-e885e2fdd8a7', 'C', 'Hypothyroidism', false, 2),
  ('23cef42b-4305-575c-bb1d-c6d002cd4a9e', 'e671d49a-3419-55a1-a0e3-e885e2fdd8a7', 'D', 'Bipolar disorder', false, 3),
  ('65e2c677-67e5-5ecb-b951-45c655f5e960', 'e671d49a-3419-55a1-a0e3-e885e2fdd8a7', 'E', 'Chronic fatigue syndrome', false, 4);

-- Q434
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('34bdb3e9-dbb1-529e-b580-f24eecf8ae17', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000023', 'sba', 'A 55 year old man has had a seizure after being found collapsed. His glucose is 1.8 mmol/L. He is not diabetic. He drinks heavily. What is the SINGLE most likely cause of the hypoglycaemia?', 'Alcohol inhibits gluconeogenesis, especially in malnourished people with low glycogen. Give IV glucose (and thiamine first if malnourished or alcoholic). Exclude other causes (sulfonylurea, insulin, sepsis, liver failure, adrenal insufficiency).', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v6')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = '34bdb3e9-dbb1-529e-b580-f24eecf8ae17';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('feb9c0fb-ed51-5642-afed-17b34ef7f493', '34bdb3e9-dbb1-529e-b580-f24eecf8ae17', 'A', 'Insulinoma', false, 0),
  ('3c075bd4-9ba7-5eb8-80ae-120b49cbf022', '34bdb3e9-dbb1-529e-b580-f24eecf8ae17', 'B', 'Dumping syndrome', false, 1),
  ('cf400210-b00d-5e0a-83a0-69d25c6c659e', '34bdb3e9-dbb1-529e-b580-f24eecf8ae17', 'C', 'Addison''s disease', false, 2),
  ('c6ee2c7b-0ea6-5f6a-8deb-ac3be8c7904a', '34bdb3e9-dbb1-529e-b580-f24eecf8ae17', 'D', 'Sulfonylurea overdose', false, 3),
  ('fb4a2735-b15f-54d3-949d-5db53fdbb664', '34bdb3e9-dbb1-529e-b580-f24eecf8ae17', 'E', 'Alcohol-induced hypoglycaemia (impaired gluconeogenesis, low glycogen stores)', true, 4);

-- Q435
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('ffd24d58-90a8-57ea-966a-873fbd0d30be', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000023', 'sba', 'A 30 year old woman has had a sudden onset of severe headache and BP of 230/130. She has taken a weight loss product bought online. What is the SINGLE most important cause to consider?', 'Online ''weight loss'' products may contain stimulants (sibutramine, amphetamines, DNP). Sympathomimetic toxicity causes hypertension, tachycardia, agitation and hyperthermia. DNP causes hyperthermia and is often fatal. Benzodiazepines and cooling; avoid beta-blockers alone.', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v6')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = 'ffd24d58-90a8-57ea-966a-873fbd0d30be';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('abdf01ea-0a6f-5224-9860-f9fefaeaec22', 'ffd24d58-90a8-57ea-966a-873fbd0d30be', 'A', 'Migraine', false, 0),
  ('39a6afbb-dd0f-5831-adff-c0e649fcbbd3', 'ffd24d58-90a8-57ea-966a-873fbd0d30be', 'B', 'Meningitis', false, 1),
  ('ccdd04dd-1701-542c-86b5-913de2bc76bd', 'ffd24d58-90a8-57ea-966a-873fbd0d30be', 'C', 'Sinusitis', false, 2),
  ('3a5d98cc-4452-5f87-9d7f-e841b21fbf8a', 'ffd24d58-90a8-57ea-966a-873fbd0d30be', 'D', 'Tension headache', false, 3),
  ('f898a929-26d2-59b4-89a4-4ae3b6ce4856', 'ffd24d58-90a8-57ea-966a-873fbd0d30be', 'E', 'Sympathomimetic toxicity (e.g. amphetamine-like substances) or phaeochromocytoma', true, 4);

-- Q436
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('a5ac8964-df26-5ad5-8f03-a2b63394c094', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000023', 'sba', 'A 20 year old man has had severe hyperthermia (41°C), sweating, tachycardia and confusion after taking ''diet pills'' bought online. What is the SINGLE most likely toxin?', 'DNP uncouples oxidative phosphorylation, causing uncontrolled heat production, tachycardia, sweating and death. There is no antidote. Aggressive cooling and supportive care; dantrolene has been tried. Get advice from NPIS.', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v6')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = 'a5ac8964-df26-5ad5-8f03-a2b63394c094';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('4b6818a1-fd55-5518-96ea-22038e1e012a', 'a5ac8964-df26-5ad5-8f03-a2b63394c094', 'A', 'Alcohol', false, 0),
  ('efc25f0d-f788-525b-9348-d4437f24da5f', 'a5ac8964-df26-5ad5-8f03-a2b63394c094', 'B', 'Cannabis', false, 1),
  ('0838a7f7-2c3c-50fb-a152-c6f845ba18eb', 'a5ac8964-df26-5ad5-8f03-a2b63394c094', 'C', '2,4-dinitrophenol (DNP)', true, 2),
  ('9edb5dc2-a749-525f-853e-e9ef41dd590e', 'a5ac8964-df26-5ad5-8f03-a2b63394c094', 'D', 'Caffeine only', false, 3),
  ('61c79580-68c7-5920-9e27-dd973ca23159', 'a5ac8964-df26-5ad5-8f03-a2b63394c094', 'E', 'Paracetamol', false, 4);

-- Q437
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('8a407143-732f-5164-9a7d-7c4f5ae25680', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000016', 'sba', 'A 30 year old man has had a crush injury to his foot. He has severe midfoot pain and bruising on the sole. X-ray shows widening between the bases of the first and second metatarsals. What is the SINGLE most likely diagnosis?', 'Lisfranc injuries are often missed. Plantar bruising and widening between the 1st and 2nd metatarsal bases suggest it; weight-bearing X-rays or CT help. Unstable injuries need surgical fixation to prevent arthritis and deformity.', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v6')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = '8a407143-732f-5164-9a7d-7c4f5ae25680';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('87ad6234-547f-5b30-9497-3137b79013c9', '8a407143-732f-5164-9a7d-7c4f5ae25680', 'A', 'Plantar fasciitis', false, 0),
  ('98b44f3b-a520-5cfe-b6e9-45913eaa03cf', '8a407143-732f-5164-9a7d-7c4f5ae25680', 'B', 'Ankle sprain', false, 1),
  ('de1a7930-e2db-5938-a2d9-b7e3426c883b', '8a407143-732f-5164-9a7d-7c4f5ae25680', 'C', 'Metatarsal stress fracture', false, 2),
  ('51a5b516-be89-54d9-a776-ce27e32e3262', '8a407143-732f-5164-9a7d-7c4f5ae25680', 'D', 'Lisfranc (tarsometatarsal) injury', true, 3),
  ('fba321a6-e439-562e-b372-add02e5dad51', '8a407143-732f-5164-9a7d-7c4f5ae25680', 'E', 'Calcaneal fracture', false, 4);

-- Q438
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('daa65ccd-896b-510a-a075-de65e00479c9', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000016', 'sba', 'A 25 year old woman has had pain in her hip after a long run. X-ray shows a sclerotic line in the inferomedial femoral neck. MRI confirms a stress fracture. What is the SINGLE most important management?', 'Femoral neck stress fractures need prompt recognition. Tension-side (superolateral) fractures are high risk and usually need fixation; compression-side fractures are managed with protected weight bearing. Assess for RED-S (amenorrhoea, low BMI, osteoporosis) in athletes.', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v6')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = 'daa65ccd-896b-510a-a075-de65e00479c9';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('1147bf13-afa5-513c-9cdb-6752451b3e8b', 'daa65ccd-896b-510a-a075-de65e00479c9', 'A', 'Continue running', false, 0),
  ('78bb6f70-0707-5075-a03c-34661ed45702', 'daa65ccd-896b-510a-a075-de65e00479c9', 'B', 'Steroid injection', false, 1),
  ('b6fe7c24-bbf1-5222-8e8c-a7cf8a4a8d19', 'daa65ccd-896b-510a-a075-de65e00479c9', 'C', 'Discharge', false, 2),
  ('1c34a260-918b-5f3b-8173-7162795151b2', 'daa65ccd-896b-510a-a075-de65e00479c9', 'D', 'Non-weight-bearing and orthopaedic review (compression-side femoral neck stress fracture), and assess for low energy availability', true, 3),
  ('3019b8e3-e0ab-5add-b829-b2eebce5c947', 'daa65ccd-896b-510a-a075-de65e00479c9', 'E', 'Physiotherapy only', false, 4);

-- Q439
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('3761e395-50f8-5964-9daf-877808d2ca10', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000016', 'sba', 'A 70 year old woman has had a total hip replacement 6 weeks ago. She bent down to tie her shoelaces and felt a clunk, with pain and a shortened, internally rotated leg. What is the SINGLE most likely diagnosis?', 'Hip replacement dislocation (usually posterior) occurs with flexion, adduction and internal rotation, especially early after surgery. Reduce under sedation or anaesthesia and check neurovascular status. Recurrent dislocation may need revision.', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v6')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = '3761e395-50f8-5964-9daf-877808d2ca10';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('f68fb60f-b776-5e03-9e05-7b85d8af861b', '3761e395-50f8-5964-9daf-877808d2ca10', 'A', 'DVT', false, 0),
  ('0ca08fb8-9c56-5b53-9dcb-6ac7a9605e83', '3761e395-50f8-5964-9daf-877808d2ca10', 'B', 'Posterior dislocation of the hip prosthesis', true, 1),
  ('9f6c2478-221b-5c2c-a6b5-7c8b31f11a9a', '3761e395-50f8-5964-9daf-877808d2ca10', 'C', 'Periprosthetic fracture', false, 2),
  ('34582a68-a19c-5085-a49b-dc31aaf8aeb6', '3761e395-50f8-5964-9daf-877808d2ca10', 'D', 'Sciatic nerve palsy', false, 3),
  ('f6342283-0f78-57ce-ade1-8abe997d4123', '3761e395-50f8-5964-9daf-877808d2ca10', 'E', 'Prosthetic infection', false, 4);

-- Q440
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('987cedd3-1655-5a7c-8ce6-349f0e71c880', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000016', 'sba', 'A 35 year old man fell from his bike and has pain at the base of his thumb. There is tenderness in the anatomical snuffbox. X-ray shows a displaced proximal pole scaphoid fracture. What is the SINGLE most appropriate management?', 'The scaphoid''s blood supply enters distally, so proximal pole fractures have a high risk of AVN and non-union. Displaced or proximal fractures are usually fixed surgically. Undisplaced waist fractures can be treated in a cast.', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v6')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = '987cedd3-1655-5a7c-8ce6-349f0e71c880';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('f548abfc-7e25-5674-98a1-7e056f799049', '987cedd3-1655-5a7c-8ce6-349f0e71c880', 'A', 'Cast for 2 weeks only', false, 0),
  ('020ef539-3247-5fa5-aaaf-81df289282fd', '987cedd3-1655-5a7c-8ce6-349f0e71c880', 'B', 'Physiotherapy only', false, 1),
  ('a2d79e57-34b1-5599-85ca-77d883129e6c', '987cedd3-1655-5a7c-8ce6-349f0e71c880', 'C', 'No treatment', false, 2),
  ('9d2b0017-7d5d-5bd5-9c91-c86444783eca', '987cedd3-1655-5a7c-8ce6-349f0e71c880', 'D', 'Tubigrip and discharge', false, 3),
  ('3a86b77c-27fb-5f5f-b13c-cc081a8ce15e', '987cedd3-1655-5a7c-8ce6-349f0e71c880', 'E', 'Refer for surgical fixation (high risk of avascular necrosis and non-union)', true, 4);

-- Q441
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('4bd75488-63df-531e-aed5-fed81ba55ed5', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000016', 'sba', 'A 65 year old man had a hip fracture and is now 3 days after surgery. He suddenly becomes breathless, confused and develops a petechial rash on his chest and axillae. What is the SINGLE most likely diagnosis?', 'Fat embolism syndrome follows long bone and pelvic fractures (usually within 24-72 hours), with respiratory distress, neurological changes and petechial rash. Management is supportive; early fixation reduces risk.', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v6')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = '4bd75488-63df-531e-aed5-fed81ba55ed5';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('a695cdc3-5262-58eb-8dac-68b82deb86b5', '4bd75488-63df-531e-aed5-fed81ba55ed5', 'A', 'Sepsis', false, 0),
  ('a5d55dbd-b055-5e06-9c66-b161238068a7', '4bd75488-63df-531e-aed5-fed81ba55ed5', 'B', 'Anaphylaxis', false, 1),
  ('a8390a7f-3c2b-5091-b75c-aefa849fc15b', '4bd75488-63df-531e-aed5-fed81ba55ed5', 'C', 'Pneumonia', false, 2),
  ('39f3e731-9d10-53f7-89cd-ec12ddfcf8d4', '4bd75488-63df-531e-aed5-fed81ba55ed5', 'D', 'Pulmonary embolism from DVT', false, 3),
  ('a08038a3-2377-5ca9-949d-0c05d42bf3ea', '4bd75488-63df-531e-aed5-fed81ba55ed5', 'E', 'Fat embolism syndrome', true, 4);

-- Q442
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('1465dad1-d874-5d19-9334-c7c36c51c01d', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000016', 'sba', 'A 40 year old manual worker has had a painless swelling over the back of his elbow after leaning on it at work. It is fluctuant. He is afebrile and the skin is not red. What is the SINGLE most appropriate management?', 'Olecranon bursitis is often caused by repetitive pressure. Aseptic bursitis is managed conservatively. Septic bursitis (red, hot, tender, fever) needs aspiration and antibiotics against S. aureus.', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v6')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = '1465dad1-d874-5d19-9334-c7c36c51c01d';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('1907e573-423b-5dd5-91a9-928b241b5716', '1465dad1-d874-5d19-9334-c7c36c51c01d', 'A', 'Joint aspiration of the elbow', false, 0),
  ('68e76009-a6c5-579d-8fd4-37b12038729f', '1465dad1-d874-5d19-9334-c7c36c51c01d', 'B', 'Conservative management (rest, compression, avoid pressure) for aseptic olecranon bursitis', true, 1),
  ('48a2d597-2ca1-57d8-bf57-467233f787b5', '1465dad1-d874-5d19-9334-c7c36c51c01d', 'C', 'IV antibiotics', false, 2),
  ('7cd689d3-cb59-5f11-a45a-587be3212633', '1465dad1-d874-5d19-9334-c7c36c51c01d', 'D', 'Surgical excision immediately', false, 3),
  ('d74cf067-6cdf-5c22-ad26-b70f28b2873b', '1465dad1-d874-5d19-9334-c7c36c51c01d', 'E', 'Steroid injection in all', false, 4);

-- Q443
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('d9936eba-b1f6-5159-ae7b-cff19ae8816e', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000016', 'sba', 'A 55 year old woman has had pain at the inside of her knee, worse climbing stairs, with tenderness below the joint line on the medial tibia. She is overweight and has knee OA. What is the SINGLE most likely diagnosis?', 'Pes anserine bursitis causes medial knee pain below the joint line, common in overweight women and with OA. Treatment: rest, ice, NSAIDs, physiotherapy and steroid injection.', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v6')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = 'd9936eba-b1f6-5159-ae7b-cff19ae8816e';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('70346260-d64d-5d1c-bceb-c6559f4674a5', 'd9936eba-b1f6-5159-ae7b-cff19ae8816e', 'A', 'Pes anserine bursitis', true, 0),
  ('0c67a580-c48a-5930-ac8b-5b54c583c58a', 'd9936eba-b1f6-5159-ae7b-cff19ae8816e', 'B', 'MCL rupture', false, 1),
  ('8c0306c9-fd96-576d-ad2c-4d1e2cafed68', 'd9936eba-b1f6-5159-ae7b-cff19ae8816e', 'C', 'Medial meniscal tear', false, 2),
  ('4bb3b5f0-8fca-50fc-92bc-69288ba30abb', 'd9936eba-b1f6-5159-ae7b-cff19ae8816e', 'D', 'Patellar tendinopathy', false, 3),
  ('c82f61e3-7127-53a1-bb11-64ce04ca3ae4', 'd9936eba-b1f6-5159-ae7b-cff19ae8816e', 'E', 'Baker''s cyst', false, 4);

-- Q444
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('517d4c72-c636-53f0-90e8-f9ee0060f85b', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000031', 'sba', 'A 45 year old woman has had urinary frequency, urgency and suprapubic pain for 1 year. Urine cultures are always negative. Cystoscopy shows small haemorrhages after bladder distension. What is the SINGLE most likely diagnosis?', 'Bladder pain syndrome is chronic bladder pain with urinary symptoms and no infection. Diagnosis is by exclusion. Management: lifestyle and dietary changes, bladder training, amitriptyline, intravesical treatments and pain management.', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v6')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = '517d4c72-c636-53f0-90e8-f9ee0060f85b';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('a678d856-08da-509b-8a00-7d40949f96ff', '517d4c72-c636-53f0-90e8-f9ee0060f85b', 'A', 'Overactive bladder only', false, 0),
  ('761790b9-d3d0-5323-99a5-70297f262340', '517d4c72-c636-53f0-90e8-f9ee0060f85b', 'B', 'Recurrent UTI', false, 1),
  ('33db327d-24e9-5e63-b45d-ae266f5f8822', '517d4c72-c636-53f0-90e8-f9ee0060f85b', 'C', 'Bladder cancer', false, 2),
  ('457cefaf-9128-5ea3-8e0a-2ce3bcf971ba', '517d4c72-c636-53f0-90e8-f9ee0060f85b', 'D', 'Bladder stones', false, 3),
  ('a64cdc12-4210-538b-8723-13950ccca52b', '517d4c72-c636-53f0-90e8-f9ee0060f85b', 'E', 'Bladder pain syndrome (interstitial cystitis)', true, 4);

-- Q445
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('7ffbac81-9302-55da-93b8-92b09b58a6d1', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000031', 'sba', 'A 30 year old man has had recurrent kidney stones since adolescence. Urine microscopy shows hexagonal crystals. His brother is affected too. What is the SINGLE most likely stone type?', 'Cystinuria (autosomal recessive) causes recurrent cystine stones from early life. Hexagonal crystals are characteristic. Treatment: high fluid intake, urinary alkalinisation and chelating agents (tiopronin, penicillamine).', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v6')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = '7ffbac81-9302-55da-93b8-92b09b58a6d1';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('4b6d6eed-357a-55e4-b65a-3f0ca86713fe', '7ffbac81-9302-55da-93b8-92b09b58a6d1', 'A', 'Struvite', false, 0),
  ('8ca05c80-f3b1-503c-978a-d917259aced1', '7ffbac81-9302-55da-93b8-92b09b58a6d1', 'B', 'Calcium oxalate', false, 1),
  ('79c38a78-c99b-5de5-935c-deefd30e7e88', '7ffbac81-9302-55da-93b8-92b09b58a6d1', 'C', 'Calcium phosphate', false, 2),
  ('ab478fc9-6f45-5018-97f5-d24ded5ed3b1', '7ffbac81-9302-55da-93b8-92b09b58a6d1', 'D', 'Uric acid', false, 3),
  ('b4b2d5fb-0546-5d58-aa34-f3eca39962d6', '7ffbac81-9302-55da-93b8-92b09b58a6d1', 'E', 'Cystine stones (cystinuria)', true, 4);

-- Q446
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('f87d87f1-688f-5351-a519-7e4f88d66709', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000031', 'sba', 'A 70 year old man has had nocturia 4 times a night. Frequency-volume chart shows over 33% of his 24-hour urine is produced at night. He has heart failure. What is the SINGLE most likely cause?', 'Nocturnal polyuria (over a third of urine produced at night) causes include heart failure, peripheral oedema mobilised at night, sleep apnoea, evening fluids and diuretic timing. Manage the cause and adjust fluids and diuretic timing.', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v6')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = 'f87d87f1-688f-5351-a519-7e4f88d66709';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('c977880e-19cf-51d3-825a-ae7042956bcb', 'f87d87f1-688f-5351-a519-7e4f88d66709', 'A', 'Diabetes insipidus', false, 0),
  ('be7cd7e0-0efa-50c3-bd93-a424528798e5', 'f87d87f1-688f-5351-a519-7e4f88d66709', 'B', 'Nocturnal polyuria', true, 1),
  ('3cd27e0f-d28b-56d6-8ff5-bbad7777138c', 'f87d87f1-688f-5351-a519-7e4f88d66709', 'C', 'BPH only', false, 2),
  ('87fc75d3-a728-582b-9ae7-61f51287a7bf', 'f87d87f1-688f-5351-a519-7e4f88d66709', 'D', 'Prostate cancer', false, 3),
  ('6e3c73dd-a1b6-5e19-ad02-31f07ecd9106', 'f87d87f1-688f-5351-a519-7e4f88d66709', 'E', 'Overactive bladder', false, 4);

-- Q447
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('6808d34c-dd17-568c-8602-f7e48121fba1', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000031', 'sba', 'A 35 year old man is investigated for infertility. Semen analysis shows no sperm. FSH is very high and testes are small. What is the MOST likely cause?', 'Azoospermia with high FSH and small testes suggests testicular failure (Klinefelter, previous chemotherapy or orchitis). Normal FSH and normal testes suggest obstruction (congenital absence of the vas in CF carriers, vasectomy). Check karyotype and Y chromosome microdeletions.', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v6')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = '6808d34c-dd17-568c-8602-f7e48121fba1';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('f1c9c6eb-2a81-52ed-9d63-0614d731e3cd', '6808d34c-dd17-568c-8602-f7e48121fba1', 'A', 'Primary testicular failure (non-obstructive azoospermia, e.g. Klinefelter syndrome)', true, 0),
  ('55937826-12cb-582f-8302-4e8ca8cca9c1', '6808d34c-dd17-568c-8602-f7e48121fba1', 'B', 'Hypothalamic failure', false, 1),
  ('aafa99df-c71c-5e75-b740-3bf70c5f77b3', '6808d34c-dd17-568c-8602-f7e48121fba1', 'C', 'Varicocele only', false, 2),
  ('d97c4259-f50c-5a49-9e75-4eb012bb40d1', '6808d34c-dd17-568c-8602-f7e48121fba1', 'D', 'Retrograde ejaculation', false, 3),
  ('f04e1cc9-27d2-523b-a2a7-4bc1b8409792', '6808d34c-dd17-568c-8602-f7e48121fba1', 'E', 'Obstruction of the vas deferens', false, 4);

-- Q448
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('eee3e3cc-e473-5634-8cc6-28ecfe6cd9db', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000031', 'sba', 'A 40 year old man asks about vasectomy. What is the MOST important information to give him?', 'Vasectomy is very effective but takes time to clear sperm; use contraception until post-vasectomy semen analysis is clear. Complications: haematoma, infection, chronic scrotal pain and rare recanalisation. Reversal is possible but not guaranteed.', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v6')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = 'eee3e3cc-e473-5634-8cc6-28ecfe6cd9db';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('179da2f3-3147-5434-84cc-09c140a1bdc2', 'eee3e3cc-e473-5634-8cc6-28ecfe6cd9db', 'A', 'It reduces sexual function', false, 0),
  ('1bac6e51-7b07-55d6-8741-f2cab4554180', 'eee3e3cc-e473-5634-8cc6-28ecfe6cd9db', 'B', 'It causes prostate cancer', false, 1),
  ('7f15122c-0aee-5467-afc2-f95b5ce1240f', 'eee3e3cc-e473-5634-8cc6-28ecfe6cd9db', 'C', 'It is effective immediately', false, 2),
  ('c135c9d7-0884-54dc-910a-a96a133f133c', 'eee3e3cc-e473-5634-8cc6-28ecfe6cd9db', 'D', 'It is easily reversed in all', false, 3),
  ('51f765a2-92df-5d8d-a160-e982a602c85c', 'eee3e3cc-e473-5634-8cc6-28ecfe6cd9db', 'E', 'It should be considered permanent; contraception is needed until a semen test confirms azoospermia (about 12 weeks after)', true, 4);

-- Q449
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('f704b5f7-85cc-54a5-897b-534b75f79406', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000031', 'sba', 'A 3 year old boy has a non-retractable foreskin. He has no symptoms and passes urine normally. What is the SINGLE most appropriate advice?', 'Physiological phimosis is normal in young boys. Pathological phimosis (scarring, balanitis xerotica obliterans) or recurrent balanitis may need treatment (topical steroids or circumcision). Do not forcibly retract.', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v6')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = 'f704b5f7-85cc-54a5-897b-534b75f79406';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('3951b698-c2db-537b-b888-954fedd08eb7', 'f704b5f7-85cc-54a5-897b-534b75f79406', 'A', 'Topical antibiotics', false, 0),
  ('7ca807c4-3c2c-5056-81ef-7c86c15a1539', 'f704b5f7-85cc-54a5-897b-534b75f79406', 'B', 'Reassure; the foreskin is often non-retractable in young boys and usually becomes retractable with age', true, 1),
  ('066457f5-f781-555e-9386-fabbea20b7d4', 'f704b5f7-85cc-54a5-897b-534b75f79406', 'C', 'Circumcise immediately', false, 2),
  ('d00e0d4a-64ae-5cc9-9b34-73a8173edd43', 'f704b5f7-85cc-54a5-897b-534b75f79406', 'D', 'Forcibly retract the foreskin', false, 3),
  ('8aa39fdd-bcad-507a-876e-1c61a130af68', 'f704b5f7-85cc-54a5-897b-534b75f79406', 'E', 'Refer urgently', false, 4);

-- Q450
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('ede96a65-497c-579c-8669-6b8d21f0f995', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000032', 'sba', 'A 68 year old man had a sudden severe tearing pain in his back. CT shows a type B aortic dissection with no malperfusion. BP is 180/100 and HR 95. What is the target for initial medical management?', 'Uncomplicated type B dissection is managed medically with anti-impulse therapy (IV beta-blocker first, then vasodilators). Complications (malperfusion, rupture, refractory pain, expansion) need TEVAR. Lifelong imaging follow-up.', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v6')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = 'ede96a65-497c-579c-8669-6b8d21f0f995';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('cc9a3318-7436-5a2f-82dc-9de09906ba2b', 'ede96a65-497c-579c-8669-6b8d21f0f995', 'A', 'IV labetalol to target HR below 60 and systolic BP 100-120 mmHg', true, 0),
  ('ecaa5133-e3c3-526b-b8d5-2e827d6bd98a', 'ede96a65-497c-579c-8669-6b8d21f0f995', 'B', 'No BP control', false, 1),
  ('4a2792f6-24f8-5a0a-88b9-f6c2ffb76ff5', 'ede96a65-497c-579c-8669-6b8d21f0f995', 'C', 'Oral amlodipine only', false, 2),
  ('253aa09c-055b-5e53-babf-09407f793a5e', 'ede96a65-497c-579c-8669-6b8d21f0f995', 'D', 'Immediate open surgery', false, 3),
  ('c0a6f45e-4ac0-5e26-b6a5-abe9d0295b71', 'ede96a65-497c-579c-8669-6b8d21f0f995', 'E', 'Thrombolysis', false, 4);

-- Q451
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('2978bf0b-8bfa-53d1-affe-e39762050287', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000032', 'sba', 'A 55 year old woman has had leg swelling and aching. Duplex shows great saphenous vein reflux. She has skin changes and a healed venous ulcer. What is the SINGLE most appropriate management?', 'NICE CG168: endothermal ablation is first-line for truncal reflux, followed by foam sclerotherapy and surgery. Treating superficial reflux reduces venous ulcer recurrence (EVRA trial: early ablation speeds healing).', null, true, true, jsonb_build_object('source', 'plab1-xlsx-v6', 'guidelines_text', 'NICE CG168')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = '2978bf0b-8bfa-53d1-affe-e39762050287';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('3a47d44d-076f-5d9f-a26b-45f6ad8b448f', '2978bf0b-8bfa-53d1-affe-e39762050287', 'A', 'Endovenous thermal ablation of the incompetent vein', true, 0),
  ('fae79dcc-0e31-5cae-ada8-21305439dcb7', '2978bf0b-8bfa-53d1-affe-e39762050287', 'B', 'Aspirin', false, 1),
  ('16001b46-1ec3-5b2a-82c3-9939fd81d253', '2978bf0b-8bfa-53d1-affe-e39762050287', 'C', 'Warfarin', false, 2),
  ('c657bf2a-83f4-5bee-91b2-3384962e992a', '2978bf0b-8bfa-53d1-affe-e39762050287', 'D', 'Compression stockings only for life', false, 3),
  ('c9c34dce-7086-5620-8343-b8f00014a996', '2978bf0b-8bfa-53d1-affe-e39762050287', 'E', 'Antibiotics', false, 4);

-- Q452
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('606fc122-feb0-58aa-93be-1446d06bc95f', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000032', 'sba', 'A 40 year old woman has had a cold, painful, blue toe and livedo reticularis on her feet after coronary angiography a week ago. Pedal pulses are present. Eosinophils are raised and creatinine has risen. What is the SINGLE most likely diagnosis?', 'Cholesterol emboli follow arterial instrumentation or anticoagulation, causing ''blue toe syndrome'' with palpable pulses, livedo reticularis, AKI and eosinophilia. Management is supportive (statins, avoid further instrumentation).', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v6')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = '606fc122-feb0-58aa-93be-1446d06bc95f';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('7b6bfe66-ec8f-5925-9ea5-983913c3dd1f', '606fc122-feb0-58aa-93be-1446d06bc95f', 'A', 'Acute limb ischaemia from a large embolus', false, 0),
  ('0b2dc5cc-9f40-5fc8-8321-059f51b3a0ac', '606fc122-feb0-58aa-93be-1446d06bc95f', 'B', 'Frostbite', false, 1),
  ('c93004c5-00f3-5230-a165-13783ff97b7f', '606fc122-feb0-58aa-93be-1446d06bc95f', 'C', 'Cholesterol embolisation syndrome', true, 2),
  ('ceda76dd-c238-5648-a713-66c446a3a2cf', '606fc122-feb0-58aa-93be-1446d06bc95f', 'D', 'DVT', false, 3),
  ('0092eb70-e697-5c36-a2f5-00c5e6818cb4', '606fc122-feb0-58aa-93be-1446d06bc95f', 'E', 'Raynaud''s', false, 4);

-- Q453
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('839c3a40-7a89-5483-959d-f73f84d4f156', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000032', 'sba', 'A 60 year old man is on dialysis through a left forearm arteriovenous fistula. The thrill is absent this morning. What is the SINGLE most appropriate action?', 'A loss of thrill or bruit suggests AV fistula thrombosis, which needs urgent intervention to salvage access. Protect the fistula arm (no BP cuffs or cannulas).', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v6')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = '839c3a40-7a89-5483-959d-f73f84d4f156';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('6a608adc-2110-5daa-8b9e-ff2af4ab5cba', '839c3a40-7a89-5483-959d-f73f84d4f156', 'A', 'Apply a tourniquet', false, 0),
  ('4a9b0bfe-bc7e-5a4f-801e-45fec06dcf64', '839c3a40-7a89-5483-959d-f73f84d4f156', 'B', 'Take blood pressure in that arm', false, 1),
  ('84b5301a-5016-5767-82ba-a6c62e59ec49', '839c3a40-7a89-5483-959d-f73f84d4f156', 'C', 'Use the fistula for dialysis anyway', false, 2),
  ('a842aff3-fb8a-5900-9492-ac0fde16460a', '839c3a40-7a89-5483-959d-f73f84d4f156', 'D', 'Wait 1 week', false, 3),
  ('79b8c5df-dc38-5682-af43-51379ef738e0', '839c3a40-7a89-5483-959d-f73f84d4f156', 'E', 'Urgent referral to the vascular/renal access team for fistula thrombosis (thrombectomy or angioplasty)', true, 4);

-- Q454
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('68a3100c-069a-57bd-a6b3-5f807d71c592', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000032', 'sba', 'A 70 year old woman has had pain in her jaw when chewing and pain in her arms on raising them. She has unequal arm BP and an ESR of 90. PET-CT shows aortic wall inflammation. What is the SINGLE most likely diagnosis?', 'GCA can involve the aorta and its branches (large-vessel GCA), causing arm claudication and BP differences. Long-term risks include aortic aneurysm and dissection. Treat with steroids and consider tocilizumab; monitor with imaging.', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v6')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = '68a3100c-069a-57bd-a6b3-5f807d71c592';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('ae29a70b-89aa-5cd0-800d-e12002901617', '68a3100c-069a-57bd-a6b3-5f807d71c592', 'A', 'Polyarteritis nodosa', false, 0),
  ('cbac1600-5416-52a1-991f-33818fbbaeb8', '68a3100c-069a-57bd-a6b3-5f807d71c592', 'B', 'Thoracic outlet syndrome', false, 1),
  ('001eea62-d7f2-53a9-a639-09d36d6a0664', '68a3100c-069a-57bd-a6b3-5f807d71c592', 'C', 'Takayasu arteritis', false, 2),
  ('7946b80b-4a26-5968-94f2-4572dd9a5d95', '68a3100c-069a-57bd-a6b3-5f807d71c592', 'D', 'Atherosclerosis only', false, 3),
  ('015c6933-b2cc-550f-bd50-4acddaeee85f', '68a3100c-069a-57bd-a6b3-5f807d71c592', 'E', 'Giant cell arteritis with large-vessel (aortic) involvement', true, 4);

-- Q455
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('95f3a027-8b7b-5ca7-b9b5-15ba5c4d3936', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000032', 'sba', 'A 75 year old man has an ABPI of 0.75 and calf pain at 200 m. He is diabetic and smokes. What is the SINGLE most important intervention to improve walking distance?', 'NICE CG147: offer a supervised exercise programme to all people with intermittent claudication. Best medical therapy: antiplatelet (clopidogrel), high-intensity statin, BP and diabetes control and smoking cessation. Angioplasty if symptoms persist despite exercise.', null, true, true, jsonb_build_object('source', 'plab1-xlsx-v6', 'guidelines_text', 'NICE CG147')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = '95f3a027-8b7b-5ca7-b9b5-15ba5c4d3936';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('7cbf7c78-41ba-5525-844b-c8cd77d8348f', '95f3a027-8b7b-5ca7-b9b5-15ba5c4d3936', 'A', 'Bypass surgery', false, 0),
  ('2a49bdf4-4adb-52e7-89ac-9104add16fe6', '95f3a027-8b7b-5ca7-b9b5-15ba5c4d3936', 'B', 'Amputation', false, 1),
  ('548a2dad-4c21-5a6e-8276-a4721da1052b', '95f3a027-8b7b-5ca7-b9b5-15ba5c4d3936', 'C', 'Supervised exercise programme (2 hours a week for 3 months) with smoking cessation and best medical therapy', true, 2),
  ('4d0bbaa6-d2d9-5174-a104-0400c07793c4', '95f3a027-8b7b-5ca7-b9b5-15ba5c4d3936', 'D', 'Compression stockings', false, 3),
  ('ebaedec8-469a-59ae-8ef1-4fddee19b000', '95f3a027-8b7b-5ca7-b9b5-15ba5c4d3936', 'E', 'Warfarin', false, 4);

-- Q456
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('3af83147-c158-5bfd-bae3-24e8369c219e', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000032', 'sba', 'A 35 year old man has had pain and swelling of his calf after a long flight. Ultrasound shows an isolated calf (distal) DVT. He has no risk factors for extension. What is the MOST appropriate management?', 'Isolated distal DVT may be managed with anticoagulation or with serial ultrasound surveillance to detect proximal extension. Anticoagulate if symptomatic, with risk factors for extension, or if surveillance is not possible.', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v6')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = '3af83147-c158-5bfd-bae3-24e8369c219e';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('2586b998-648e-5c5c-940b-cca1fa6eb417', '3af83147-c158-5bfd-bae3-24e8369c219e', 'A', 'Either anticoagulation for 3 months or repeat ultrasound in 1 week to look for extension, according to local policy', true, 0),
  ('cc5a75d2-7de5-59b2-aa7e-3cd7ef732171', '3af83147-c158-5bfd-bae3-24e8369c219e', 'B', 'Thrombolysis', false, 1),
  ('c8dd694c-91b7-5cae-91d0-15622e0b77b6', '3af83147-c158-5bfd-bae3-24e8369c219e', 'C', 'IVC filter', false, 2),
  ('86ba9c48-9cf9-5b9f-a11d-9be7520cf9d4', '3af83147-c158-5bfd-bae3-24e8369c219e', 'D', 'Aspirin only', false, 3),
  ('6cd1522b-6a45-5710-843c-bae7717dfbf5', '3af83147-c158-5bfd-bae3-24e8369c219e', 'E', 'No follow-up', false, 4);

-- Q457
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('c0bce77e-c9aa-5924-99a2-2fb15a9415f9', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000037', 'sba', 'A 25 year old woman has had recurrent painful oval ulcers in her mouth with a yellow base and red halo. They heal within 2 weeks. She is otherwise well. What is the SINGLE most likely diagnosis?', 'Aphthous ulcers are common, recurrent and self-limiting. Treatment: topical steroids, analgesic mouthwashes and chlorhexidine. Check FBC, ferritin, B12, folate and coeliac serology if severe. Consider Behçet''s, IBD and HIV if associated features. Ulcers lasting over 3 weeks need referral.', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v6')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = 'c0bce77e-c9aa-5924-99a2-2fb15a9415f9';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('93582ca1-61aa-5467-beef-91d27636ded6', 'c0bce77e-c9aa-5924-99a2-2fb15a9415f9', 'A', 'Behçet''s disease', false, 0),
  ('942aca11-6cb6-5fbe-98ab-387b9ef214da', 'c0bce77e-c9aa-5924-99a2-2fb15a9415f9', 'B', 'Oral cancer', false, 1),
  ('8397a9ba-8729-5819-b13a-ab40edcaa1b5', 'c0bce77e-c9aa-5924-99a2-2fb15a9415f9', 'C', 'Herpes simplex', false, 2),
  ('0eb3cc72-f2ac-51f7-86c2-8925cebfb446', 'c0bce77e-c9aa-5924-99a2-2fb15a9415f9', 'D', 'Lichen planus', false, 3),
  ('557eb9e3-ee7d-5b68-95a2-729acf91f1e8', 'c0bce77e-c9aa-5924-99a2-2fb15a9415f9', 'E', 'Recurrent aphthous ulceration', true, 4);

-- Q458
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('94c71535-eb4c-5093-939d-67bf79b7250d', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000037', 'sba', 'A 30 year old woman has had painful oral ulcers, genital ulcers and red eyes with uveitis. She is of Turkish origin. Pathergy test is positive. What is the SINGLE most likely diagnosis?', 'Behçet''s disease is a vasculitis with recurrent oral and genital ulcers, uveitis, skin lesions and positive pathergy, more common along the Silk Road. Complications: neurological and vascular thrombosis. Treatment: colchicine, steroids and immunosuppression.', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v6')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = '94c71535-eb4c-5093-939d-67bf79b7250d';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('8d2c4e60-2079-5f9b-be0f-299767fb2c63', '94c71535-eb4c-5093-939d-67bf79b7250d', 'A', 'Behçet''s disease', true, 0),
  ('b3e593d5-8e6c-58fd-bbd8-e9e81c69cc41', '94c71535-eb4c-5093-939d-67bf79b7250d', 'B', 'Herpes simplex', false, 1),
  ('4bbf9448-b030-5ded-b84d-f9a57d19bbd2', '94c71535-eb4c-5093-939d-67bf79b7250d', 'C', 'Crohn''s disease', false, 2),
  ('b2ff99c2-e272-5a2a-be30-aa9569bc15bf', '94c71535-eb4c-5093-939d-67bf79b7250d', 'D', 'Reactive arthritis', false, 3),
  ('070a30e8-8629-58ef-b177-04180f81e061', '94c71535-eb4c-5093-939d-67bf79b7250d', 'E', 'SLE', false, 4);

-- Q459
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('07bb6bdf-0a0f-51c3-9ef9-e938c9571f0b', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000037', 'sba', 'A 55 year old man has had pain in the jaw and a sinus discharging pus in the skin of his neck after radiotherapy for head and neck cancer. X-ray shows bone destruction. What is the SINGLE most likely diagnosis?', 'Osteoradionecrosis is bone death after radiotherapy, often triggered by dental extractions. Prevention: dental assessment and treatment before radiotherapy. Treatment: antibiotics, pentoxifylline, hyperbaric oxygen and surgical resection.', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v6')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = '07bb6bdf-0a0f-51c3-9ef9-e938c9571f0b';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('ee658f83-dda5-5344-8631-498dad0246dd', '07bb6bdf-0a0f-51c3-9ef9-e938c9571f0b', 'A', 'Dental abscess', false, 0),
  ('825137ac-8496-57a5-a433-5c83c65a1c40', '07bb6bdf-0a0f-51c3-9ef9-e938c9571f0b', 'B', 'Osteoradionecrosis of the mandible', true, 1),
  ('6193b83c-a349-59e6-a8f2-80d04a9a3eac', '07bb6bdf-0a0f-51c3-9ef9-e938c9571f0b', 'C', 'Recurrent cancer only', false, 2),
  ('237a3093-6892-52e5-8030-930e28c779fa', '07bb6bdf-0a0f-51c3-9ef9-e938c9571f0b', 'D', 'MRONJ', false, 3),
  ('10a41006-8cc8-538d-bf62-62464d4598b7', '07bb6bdf-0a0f-51c3-9ef9-e938c9571f0b', 'E', 'Actinomycosis', false, 4);

-- Q460
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('1db71729-42d9-543d-8c29-f11e635af7c7', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000037', 'sba', 'A 35 year old man has had a slow-growing hard swelling on the side of his jaw with yellow ''sulphur granules'' in pus from a sinus. He had a tooth extraction months ago. What is the SINGLE most likely diagnosis?', 'Actinomyces israelii causes chronic infection after dental work, with woody swelling, sinuses and sulphur granules. Treatment: prolonged penicillin and surgical drainage.', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v6')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = '1db71729-42d9-543d-8c29-f11e635af7c7';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('7254501a-2d6e-51d1-b978-4bd1280044cb', '1db71729-42d9-543d-8c29-f11e635af7c7', 'A', 'Osteomyelitis only', false, 0),
  ('b863c238-3ab8-511a-a761-7b23aedc88c0', '1db71729-42d9-543d-8c29-f11e635af7c7', 'B', 'Oral cancer', false, 1),
  ('e7802171-7d21-5234-b0f4-feb3b4564c4a', '1db71729-42d9-543d-8c29-f11e635af7c7', 'C', 'TB lymphadenitis', false, 2),
  ('608e933f-0592-5d3d-9db2-78c4e7b9aace', '1db71729-42d9-543d-8c29-f11e635af7c7', 'D', 'Cervicofacial actinomycosis', true, 3),
  ('d00a987a-5e81-5572-88cc-1d001bc47d54', '1db71729-42d9-543d-8c29-f11e635af7c7', 'E', 'Parotid abscess', false, 4);

-- Q461
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('f94c74cd-aceb-5529-9631-2bb4d0adff32', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000037', 'sba', 'A 60 year old woman has had a painless, hard swelling of her mandible and loose teeth. X-ray shows a multilocular radiolucency (''soap bubble''). What is the SINGLE most likely diagnosis?', 'Ameloblastoma is a benign but locally aggressive odontogenic tumour, usually in the posterior mandible, with a multilocular radiolucency. It needs wide surgical excision because of high recurrence.', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v6')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = 'f94c74cd-aceb-5529-9631-2bb4d0adff32';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('1ed36bdb-2dac-588a-a0ef-5fae1d750426', 'f94c74cd-aceb-5529-9631-2bb4d0adff32', 'A', 'Myeloma', false, 0),
  ('2dd54e09-80f0-5a3c-8700-4ebe04315897', 'f94c74cd-aceb-5529-9631-2bb4d0adff32', 'B', 'Ameloblastoma', true, 1),
  ('2200328c-2eef-520a-8626-52f2a2c7de48', 'f94c74cd-aceb-5529-9631-2bb4d0adff32', 'C', 'Dental abscess', false, 2),
  ('e9397bbc-0fa4-5a4b-bff0-f22c8fff20cf', 'f94c74cd-aceb-5529-9631-2bb4d0adff32', 'D', 'Odontogenic keratocyst only', false, 3),
  ('30ba255d-3435-553a-bc6b-248dd138cee4', 'f94c74cd-aceb-5529-9631-2bb4d0adff32', 'E', 'Osteosarcoma', false, 4);

-- Q462
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('3db5106f-0691-5641-8974-65ad38ad9a61', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000037', 'sba', 'A 50 year old man was in a car crash. He has a mobile upper jaw (maxilla moves when the incisors are pulled), with facial swelling and a long-looking face. What is the SINGLE most likely injury?', 'Le Fort fractures: I (horizontal above the teeth, maxilla moves alone), II (pyramidal, nose moves with maxilla), III (craniofacial dissociation). Airway compromise, CSF leak and associated head injury are concerns. CT and maxillofacial surgery.', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v6')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = '3db5106f-0691-5641-8974-65ad38ad9a61';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('ce2412e2-eb13-51aa-b93b-f53eff0e723e', '3db5106f-0691-5641-8974-65ad38ad9a61', 'A', 'TMJ dislocation', false, 0),
  ('2ed88ef1-0037-502f-880a-4bde56af5553', '3db5106f-0691-5641-8974-65ad38ad9a61', 'B', 'Mandibular fracture only', false, 1),
  ('ee76fb62-c8e7-54a5-babf-021f6c5fbf6b', '3db5106f-0691-5641-8974-65ad38ad9a61', 'C', 'Le Fort fracture of the maxilla', true, 2),
  ('a1dc516c-1d2f-5513-8932-101f6523b5bc', '3db5106f-0691-5641-8974-65ad38ad9a61', 'D', 'Zygomatic arch fracture', false, 3),
  ('29ce46c6-eea4-546e-963d-9934a8b686ae', '3db5106f-0691-5641-8974-65ad38ad9a61', 'E', 'Nasal fracture only', false, 4);

-- Q463
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('a04e0597-742f-58cb-b3c8-8dfcb0540909', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000028', 'sba', 'A ward has a high rate of inpatient falls. The team wants to understand why. Which tool is BEST for mapping possible causes?', 'Fishbone diagrams organise causes into categories (people, process, environment, equipment). Pareto charts identify the most frequent causes (80/20 rule). Process maps show steps. Driver diagrams link aims to change ideas.', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v6')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = 'a04e0597-742f-58cb-b3c8-8dfcb0540909';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('bb1b4265-ff11-5126-9269-6bc75c5c9628', 'a04e0597-742f-58cb-b3c8-8dfcb0540909', 'A', 'Kaplan-Meier curve', false, 0),
  ('d3c8c66b-a664-54f8-b9d8-2cc66d741657', 'a04e0597-742f-58cb-b3c8-8dfcb0540909', 'B', 'Forest plot', false, 1),
  ('499b6a25-105d-52d5-901f-af8953740968', 'a04e0597-742f-58cb-b3c8-8dfcb0540909', 'C', 'Run chart only', false, 2),
  ('1e77ee99-4cbc-584b-ae0c-acbaa8bb5455', 'a04e0597-742f-58cb-b3c8-8dfcb0540909', 'D', 'Pareto chart only', false, 3),
  ('a861b2a2-81c8-5ad9-8215-b22a3448beee', 'a04e0597-742f-58cb-b3c8-8dfcb0540909', 'E', 'Fishbone (cause and effect / Ishikawa) diagram', true, 4);

-- Q464
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('21296226-5acb-5a59-8c06-39085473bb3f', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000028', 'sba', 'A hospital investigates a serious incident. The team keeps asking ''why?'' until reaching the underlying system cause. What is this technique called?', 'The ''5 Whys'' technique explores successive causes to reach root system problems rather than stopping at the individual error. It is used alongside fishbone diagrams in root cause analysis.', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v6')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = '21296226-5acb-5a59-8c06-39085473bb3f';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('307be478-9a70-5d34-beb5-63c5d406ed53', '21296226-5acb-5a59-8c06-39085473bb3f', 'A', 'Survey', false, 0),
  ('01b6ed87-c9f4-5f57-9c0b-5e0055ff2ae6', '21296226-5acb-5a59-8c06-39085473bb3f', 'B', 'SBAR', false, 1),
  ('a5583518-0f27-58e9-84a8-99a4628a0531', '21296226-5acb-5a59-8c06-39085473bb3f', 'C', 'PDSA', false, 2),
  ('1af830fc-a443-560c-8af6-593dc76918fb', '21296226-5acb-5a59-8c06-39085473bb3f', 'D', 'Audit', false, 3),
  ('ad702920-268e-56d9-b988-b4cc6c3469da', '21296226-5acb-5a59-8c06-39085473bb3f', 'E', 'The 5 Whys (part of root cause analysis)', true, 4);

-- Q465
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('2c52abcf-181f-54f8-b05b-d6011f4b3a61', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000028', 'sba', 'A team wants to measure whether a new discharge checklist improves outcomes. Which type of measure tracks whether staff are actually using the checklist?', 'QI measures: outcome (patient result, such as readmissions), process (whether the change is done, such as checklist completion) and balancing (unintended consequences, such as longer discharge times). Use all three.', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v6')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = '2c52abcf-181f-54f8-b05b-d6011f4b3a61';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('080ffe1c-8416-53a2-8345-b8fd9cdc20b2', '2c52abcf-181f-54f8-b05b-d6011f4b3a61', 'A', 'Structure measure', false, 0),
  ('227e60c2-35e8-5c75-9da9-a847990e372b', '2c52abcf-181f-54f8-b05b-d6011f4b3a61', 'B', 'Outcome measure', false, 1),
  ('5fd79830-c6c3-580f-a460-4cc40bdc8fb3', '2c52abcf-181f-54f8-b05b-d6011f4b3a61', 'C', 'Process measure', true, 2),
  ('029b558e-6089-5a43-81b0-aff29a817f31', '2c52abcf-181f-54f8-b05b-d6011f4b3a61', 'D', 'Balancing measure', false, 3),
  ('f3d811c1-d623-55c7-8805-dee868085418', '2c52abcf-181f-54f8-b05b-d6011f4b3a61', 'E', 'Financial measure', false, 4);

-- Q466
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('3bfdab28-8dd8-5dde-9a89-602ad835f133', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000028', 'sba', 'A junior doctor feels very tired after several night shifts and is unsure whether it is safe to drive home. What is the BEST advice?', 'Fatigue after night shifts increases the risk of accidents. Trusts should provide rest facilities. Doctors should prioritise their own and others'' safety and raise concerns about unsafe rotas.', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v6')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = '3bfdab28-8dd8-5dde-9a89-602ad835f133';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('d9a410a8-e852-556e-83b9-5c0cba79683b', '3bfdab28-8dd8-5dde-9a89-602ad835f133', 'A', 'Do not drive if too tired; rest first, use alternative transport, and raise rota concerns', true, 0),
  ('c2f0e9e4-4ab8-52e2-bc1c-5b83d3fc7a21', '3bfdab28-8dd8-5dde-9a89-602ad835f133', 'B', 'Ask a patient for a lift', false, 1),
  ('dde1cdab-c390-5d4f-b419-58223ed88fc2', '3bfdab28-8dd8-5dde-9a89-602ad835f133', 'C', 'Ignore it', false, 2),
  ('ad3b3e36-4ee6-52d9-b62f-8f3bb8ec235c', '3bfdab28-8dd8-5dde-9a89-602ad835f133', 'D', 'Drive home quickly', false, 3),
  ('6ac55340-9fbf-5cc1-a124-874418c83812', '3bfdab28-8dd8-5dde-9a89-602ad835f133', 'E', 'Drink energy drinks and drive', false, 4);

-- Q467
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('f49f5b4e-b081-5f43-b719-800be303f1da', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000028', 'sba', 'A nurse is about to give IV potassium chloride. Which safety practice is MOST important?', 'Concentrated potassium chloride is a high-risk medicine. Use pre-diluted bags, infusion devices and independent double checks. Many hospitals restrict access to concentrated ampoules.', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v6')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = 'f49f5b4e-b081-5f43-b719-800be303f1da';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('8748bd8d-3642-5965-924b-d172ac706b7d', 'f49f5b4e-b081-5f43-b719-800be303f1da', 'A', 'Use pre-mixed diluted bags, an infusion pump and a second-person check; never give concentrated potassium as a bolus', true, 0),
  ('787f0d13-1e84-565d-b9fd-95d2686ba987', 'f49f5b4e-b081-5f43-b719-800be303f1da', 'B', 'Use any available bag', false, 1),
  ('0369f8c2-feb0-5ceb-8f68-f3acff23478b', 'f49f5b4e-b081-5f43-b719-800be303f1da', 'C', 'Give concentrated potassium IV push', false, 2),
  ('0d645b09-bf7f-5bbd-8534-eb9bbdd633c1', 'f49f5b4e-b081-5f43-b719-800be303f1da', 'D', 'Give without a pump', false, 3),
  ('c0aeb068-5b10-5cf5-9272-c87c9f03b972', 'f49f5b4e-b081-5f43-b719-800be303f1da', 'E', 'Double the rate to save time', false, 4);

-- Q468
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('c191cba5-32ed-5100-860e-5be94aeb0401', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000028', 'sba', 'A drug chart has an illegible signature and an ambiguous dose for a sedative. Which human factor principle applies?', 'Prescribing errors come from illegibility, abbreviations, trailing zeros and missing information. Electronic prescribing, standard formats and pharmacist review reduce them.', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v6')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = 'c191cba5-32ed-5100-860e-5be94aeb0401';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('bd3ca49b-2eac-57c4-b265-08d9d785b66d', 'c191cba5-32ed-5100-860e-5be94aeb0401', 'A', 'Abbreviations save time', false, 0),
  ('d18d9375-7455-514a-91ff-b2a1f5ae1353', 'c191cba5-32ed-5100-860e-5be94aeb0401', 'B', 'Clear, standardised documentation (legible, unambiguous, no unapproved abbreviations) reduces error', true, 1),
  ('241ff73a-95b2-5887-ab97-5a2ef0a93ced', 'c191cba5-32ed-5100-860e-5be94aeb0401', 'C', 'Signatures are not needed', false, 2),
  ('ff33bc93-8216-5bb6-8846-25fe608835cd', 'c191cba5-32ed-5100-860e-5be94aeb0401', 'D', 'It is fine if the nurse guesses', false, 3),
  ('e902ab0a-d580-5b56-ac33-cdcc8c2d73d5', 'c191cba5-32ed-5100-860e-5be94aeb0401', 'E', 'Only verbal orders are safe', false, 4);

-- Q469
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('48baebd6-c39e-5459-afc0-11237e2c623e', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000028', 'sba', 'A consultant tells the team at the start of a list, ''If you see anything that worries you, please speak up.'' What does this promote?', 'Psychological safety means team members feel able to speak up without fear. Leaders encourage it by inviting challenge. It is associated with better team performance and fewer errors.', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v6')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = '48baebd6-c39e-5459-afc0-11237e2c623e';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('2fbd378c-21b0-5140-97be-0b3f7a3b77ad', '48baebd6-c39e-5459-afc0-11237e2c623e', 'A', 'Psychological safety and flattened hierarchy', true, 0),
  ('e606ab8d-5c43-55e8-8611-46bac187aa61', '48baebd6-c39e-5459-afc0-11237e2c623e', 'B', 'Blame culture', false, 1),
  ('0129233a-0a43-596b-b265-bc31844d5f3f', '48baebd6-c39e-5459-afc0-11237e2c623e', 'C', 'Strict hierarchy', false, 2),
  ('6458baea-68df-524f-855d-b2b9af811f0d', '48baebd6-c39e-5459-afc0-11237e2c623e', 'D', 'Reduced accountability', false, 3),
  ('a386b5f5-c1fc-54a9-bf91-295398187a9d', '48baebd6-c39e-5459-afc0-11237e2c623e', 'E', 'Reduced communication', false, 4);

-- Q470
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('74e1fc05-f783-54ef-a838-a6c1882a2d23', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000028', 'sba', 'A patient developed a pressure ulcer on the ward. Which scale helps assess pressure ulcer risk?', 'Pressure ulcer risk assessment tools include Waterlow, Braden and Purpose T. Prevention: regular repositioning, pressure-relieving mattresses, nutrition, skin care and continence management (SSKIN bundle).', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v6')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = '74e1fc05-f783-54ef-a838-a6c1882a2d23';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('428b0467-4bd6-5384-ab33-76ca44e307ec', '74e1fc05-f783-54ef-a838-a6c1882a2d23', 'A', 'NEWS2', false, 0),
  ('45844625-4035-501a-b2bf-82460620e281', '74e1fc05-f783-54ef-a838-a6c1882a2d23', 'B', 'Glasgow-Blatchford', false, 1),
  ('1ed4a5d1-52ba-5367-9a32-c66d6984a4d3', '74e1fc05-f783-54ef-a838-a6c1882a2d23', 'C', 'Waterlow score (or Purpose T)', true, 2),
  ('d4b2517a-9034-53e3-b5e2-38f1e1c10db8', '74e1fc05-f783-54ef-a838-a6c1882a2d23', 'D', 'MUST only', false, 3),
  ('42c48ca0-fefe-5584-8a8b-3ab1e7630aeb', '74e1fc05-f783-54ef-a838-a6c1882a2d23', 'E', 'CURB-65', false, 4);

-- Q471
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('18329203-3129-5d6a-a768-ce54cd0527fd', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000028', 'sba', 'A deteriorating patient''s observations are recorded but not escalated. Which tool standardises recognition of deterioration in UK hospitals?', 'NEWS2 aggregates RR, SpO2, BP, HR, consciousness (including new confusion) and temperature. Scores trigger escalation: 5 or more (or 3 in one parameter) needs urgent review; 7 or more needs emergency response. It does not apply to children or pregnant women.', null, true, true, jsonb_build_object('source', 'plab1-xlsx-v6')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = '18329203-3129-5d6a-a768-ce54cd0527fd';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('116c00ce-318c-58d7-b4bd-5f6ac33bb8cb', '18329203-3129-5d6a-a768-ce54cd0527fd', 'A', 'APGAR', false, 0),
  ('20c7f6c7-95f6-5e67-97f4-c82547e00974', '18329203-3129-5d6a-a768-ce54cd0527fd', 'B', 'MUST', false, 1),
  ('79b5c7ca-0adf-5b1a-9ed4-6e1cfc9d0387', '18329203-3129-5d6a-a768-ce54cd0527fd', 'C', 'Glasgow Coma Scale', false, 2),
  ('0011c224-cf7b-54f1-a96a-dc28843b3d9d', '18329203-3129-5d6a-a768-ce54cd0527fd', 'D', 'Waterlow', false, 3),
  ('ad420209-eea9-5f7f-b2f0-31da9aadf7fe', '18329203-3129-5d6a-a768-ce54cd0527fd', 'E', 'NEWS2 (National Early Warning Score)', true, 4);

-- Q472
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('710262bd-dbe9-5b14-9ee9-5a2c9954159c', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000022', 'sba', 'A 50 year old woman has had a lump in the axilla. Biopsy shows metastatic adenocarcinoma consistent with breast cancer. Mammography and ultrasound of both breasts are normal. What is the SINGLE most appropriate next imaging?', 'Axillary metastatic adenocarcinoma with normal mammography and ultrasound suggests occult breast cancer. MRI often finds the primary. Treatment follows breast cancer protocols.', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v6')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = '710262bd-dbe9-5b14-9ee9-5a2c9954159c';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('0139df93-83f3-5cee-a385-526682339427', '710262bd-dbe9-5b14-9ee9-5a2c9954159c', 'A', 'Bone scan', false, 0),
  ('7eb58290-609c-5e98-97e3-144437b9251c', '710262bd-dbe9-5b14-9ee9-5a2c9954159c', 'B', 'PET-CT only', false, 1),
  ('c2c0c72f-f284-5ff4-bf1e-a059247ac4e4', '710262bd-dbe9-5b14-9ee9-5a2c9954159c', 'C', 'Breast MRI (occult primary breast cancer)', true, 2),
  ('d3c109df-528a-5cce-bc13-e59d43591766', '710262bd-dbe9-5b14-9ee9-5a2c9954159c', 'D', 'Chest X-ray', false, 3),
  ('a5d245ce-6ac6-55c8-8722-18cbb108fb86', '710262bd-dbe9-5b14-9ee9-5a2c9954159c', 'E', 'No further imaging', false, 4);

-- Q473
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('b0f14473-f82b-5a6b-8c77-33b3a3e9c72b', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000022', 'sba', 'A 28 year old woman has had a painful red lump in her breast. She is not breastfeeding. Ultrasound shows a collection. She smokes. What is the SINGLE most appropriate management?', 'Non-lactational breast abscesses are often periareolar and linked to smoking (periductal mastitis) and anaerobes. Treat with aspiration and co-amoxiclav. Recurrent infections may need duct excision. Exclude inflammatory cancer if not resolving.', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v6')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = 'b0f14473-f82b-5a6b-8c77-33b3a3e9c72b';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('5c878a49-0de3-543b-92c9-edee4a0da756', 'b0f14473-f82b-5a6b-8c77-33b3a3e9c72b', 'A', 'Ultrasound-guided aspiration and antibiotics covering anaerobes (e.g. co-amoxiclav), with advice to stop smoking', true, 0),
  ('5ea5492a-7572-53cc-a285-bf97f74e1105', 'b0f14473-f82b-5a6b-8c77-33b3a3e9c72b', 'B', 'Steroids', false, 1),
  ('88d835a4-6d30-511d-98aa-9429ed81b1b8', 'b0f14473-f82b-5a6b-8c77-33b3a3e9c72b', 'C', 'Topical antifungal', false, 2),
  ('a20dced9-6cce-505f-a68c-28dc1f6949d0', 'b0f14473-f82b-5a6b-8c77-33b3a3e9c72b', 'D', 'No treatment', false, 3),
  ('ab1b010d-2e33-5d8d-b83a-0d41fdeba90c', 'b0f14473-f82b-5a6b-8c77-33b3a3e9c72b', 'E', 'Mastectomy', false, 4);

-- Q474
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('07d6835e-8091-598c-a41b-9035364e7880', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000022', 'sba', 'A 60 year old woman has had breast cancer surgery with axillary node clearance. Which advice helps reduce her risk of lymphoedema?', 'Lymphoedema risk is higher after axillary clearance and radiotherapy. Advise skin care, exercise, weight management and prompt treatment of cellulitis. Early referral to lymphoedema services improves outcomes.', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v6')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = '07d6835e-8091-598c-a41b-9035364e7880';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('fa89ff04-f31f-5037-81a1-ce3a321e90d2', '07d6835e-8091-598c-a41b-9035364e7880', 'A', 'Avoid all arm use', false, 0),
  ('d3aa35ba-b947-5a6f-8780-07c807f48a07', '07d6835e-8091-598c-a41b-9035364e7880', 'B', 'Have blood taken from that arm regularly', false, 1),
  ('9b68cd5f-e69e-55cb-8275-78a34261cace', '07d6835e-8091-598c-a41b-9035364e7880', 'C', 'Wear tight bracelets', false, 2),
  ('4ba90ed6-1b73-574e-b398-f6ae4f46f6c5', '07d6835e-8091-598c-a41b-9035364e7880', 'D', 'Skin care, avoid injury and infection to the arm, exercise and report early swelling', true, 3),
  ('24ef8e03-ccad-5aa5-bd00-5a79a2485bd9', '07d6835e-8091-598c-a41b-9035364e7880', 'E', 'Restrict fluids', false, 4);

-- Q475
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('716d7ea7-795d-5813-a455-63a80c7d804e', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000022', 'sba', 'A 40 year old woman has a 2 cm ER-negative, PR-negative, HER2-negative breast cancer with positive axillary nodes. What is the SINGLE most likely treatment approach?', 'Triple-negative breast cancer is aggressive, more common in younger women and BRCA1 carriers. It does not respond to endocrine or anti-HER2 therapy. Neoadjuvant chemotherapy (with pembrolizumab in high-risk disease) is common; offer BRCA testing.', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v6')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = '716d7ea7-795d-5813-a455-63a80c7d804e';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('dc8096e3-fd7d-5e70-b6c6-3f5dfb4237f4', '716d7ea7-795d-5813-a455-63a80c7d804e', 'A', 'Observation', false, 0),
  ('ff47ee2e-70ff-5a49-a0b8-15da44aa85e6', '716d7ea7-795d-5813-a455-63a80c7d804e', 'B', 'Trastuzumab alone', false, 1),
  ('96a53dad-deb4-53aa-8415-007b531071cf', '716d7ea7-795d-5813-a455-63a80c7d804e', 'C', 'Neoadjuvant chemotherapy (often with immunotherapy), then surgery and radiotherapy', true, 2),
  ('13893018-66b6-5257-b193-f323847dc370', '716d7ea7-795d-5813-a455-63a80c7d804e', 'D', 'Surgery only', false, 3),
  ('696fbb41-0adf-5215-9830-18305738fb83', '716d7ea7-795d-5813-a455-63a80c7d804e', 'E', 'Endocrine therapy alone', false, 4);

-- Q476
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('89e504b6-520d-5580-a909-4ec548c68699', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000022', 'sba', 'A 55 year old woman has a breast lump. She is HER2-positive with a 3 cm tumour. What is a common treatment approach?', 'HER2-positive cancers benefit from anti-HER2 therapy (trastuzumab, pertuzumab). Neoadjuvant therapy can shrink tumours and identify response; residual disease may be treated with trastuzumab emtansine. Monitor cardiac function.', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v6')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = '89e504b6-520d-5580-a909-4ec548c68699';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('43fb6e97-9998-5e5f-81fb-517b6d04dbad', '89e504b6-520d-5580-a909-4ec548c68699', 'A', 'Radiotherapy alone', false, 0),
  ('b4e2197d-0ec4-5e4d-befb-65097ee08fbb', '89e504b6-520d-5580-a909-4ec548c68699', 'B', 'Observation', false, 1),
  ('8e807dcb-5e3c-53af-8236-e012314cd199', '89e504b6-520d-5580-a909-4ec548c68699', 'C', 'Mastectomy only with no systemic therapy', false, 2),
  ('9d9a0d84-061e-5727-ae07-0a241a2f306b', '89e504b6-520d-5580-a909-4ec548c68699', 'D', 'Neoadjuvant chemotherapy with trastuzumab and pertuzumab, then surgery', true, 3),
  ('3867133d-946b-5025-94da-18edbca35ba3', '89e504b6-520d-5580-a909-4ec548c68699', 'E', 'Endocrine therapy alone', false, 4);

-- Q477
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('7fe494f4-7745-5a38-b8de-504101ee1949', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000035', 'sba', 'A 40 year old man is admitted to ICU with acute liver failure after paracetamol overdose. He is confused with a rising INR. What is the MOST important measure to reduce cerebral oedema risk?', 'Acute liver failure causes encephalopathy and cerebral oedema. Measures: hypertonic saline to keep sodium 145-150, glucose monitoring, temperature control, intubation for grade 3-4 encephalopathy, and early liaison with a transplant centre.', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v6')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = '7fe494f4-7745-5a38-b8de-504101ee1949';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('a0ff26cb-2577-56a5-9644-0c26d3d2800e', '7fe494f4-7745-5a38-b8de-504101ee1949', 'A', 'Allow fever', false, 0),
  ('5c15cf80-1b3b-59e8-a891-e729401a1958', '7fe494f4-7745-5a38-b8de-504101ee1949', 'B', 'Restrict glucose', false, 1),
  ('e2849b2b-fbe0-502f-be67-6b91dd86b1af', '7fe494f4-7745-5a38-b8de-504101ee1949', 'C', 'Hypotonic fluids', false, 2),
  ('a5e76d29-ae1c-5c88-a440-a18f2cc17adc', '7fe494f4-7745-5a38-b8de-504101ee1949', 'D', 'Lie flat', false, 3),
  ('ec330e1b-681c-5cdb-932f-be0955b9bcb9', '7fe494f4-7745-5a38-b8de-504101ee1949', 'E', 'Maintain sodium in the high-normal range, avoid hypoglycaemia, keep head up 30 degrees, and consider early intubation for encephalopathy', true, 4);

-- Q478
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('7b862263-e135-5158-be0c-46650e9ead17', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000035', 'sba', 'A 70 year old man has severe sepsis and requires noradrenaline. His glucose is 14 mmol/L. What is the appropriate glucose target in critically ill patients?', 'Stress hyperglycaemia is common in critical illness. Intensive insulin targets (4.4-6.1) increased mortality from hypoglycaemia (NICE-SUGAR). Target about 6-10 mmol/L using an insulin infusion.', null, true, true, jsonb_build_object('source', 'plab1-xlsx-v6', 'guidelines_text', 'NICE')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = '7b862263-e135-5158-be0c-46650e9ead17';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('62184595-b17c-5bee-9eb7-c0f5535970f6', '7b862263-e135-5158-be0c-46650e9ead17', 'A', 'Around 6-10 mmol/L (avoid tight control below 6 because of hypoglycaemia risk)', true, 0),
  ('7608f4b4-4714-5181-a796-229542bc128b', '7b862263-e135-5158-be0c-46650e9ead17', 'B', 'No monitoring needed', false, 1),
  ('1a32e05d-73dd-5b4d-955c-8a6c3efdeab5', '7b862263-e135-5158-be0c-46650e9ead17', 'C', 'Below 3 mmol/L', false, 2),
  ('da2b8457-3069-5953-bfd4-6d5cb3826fb0', '7b862263-e135-5158-be0c-46650e9ead17', 'D', '4-6 mmol/L strictly', false, 3),
  ('d3aee07f-fb13-52d7-89cf-84844e814e56', '7b862263-e135-5158-be0c-46650e9ead17', 'E', 'Above 15 mmol/L', false, 4);

-- Q479
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('3fcd73f3-a571-5467-85ae-1215d1594556', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000035', 'sba', 'A 35 year old woman has had an overdose and is intubated. Her CK is 60,000 U/L and urine is dark. What is the SINGLE most important treatment?', 'Rhabdomyolysis (immobility after overdose, crush, seizures, drugs) causes myoglobinuric AKI, hyperkalaemia and compartment syndrome. Early IV fluids target urine output of about 200-300 mL/hour in adults. RRT for refractory hyperkalaemia, acidosis or anuria.', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v6')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = '3fcd73f3-a571-5467-85ae-1215d1594556';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('d8cabcb3-a697-5f5b-ae1f-fe08f72d3fb4', '3fcd73f3-a571-5467-85ae-1215d1594556', 'A', 'Antibiotics', false, 0),
  ('6cee410e-20ee-5b17-9923-eb50dd7995f5', '3fcd73f3-a571-5467-85ae-1215d1594556', 'B', 'Aggressive IV fluids to maintain a high urine output, with monitoring of potassium and renal function', true, 1),
  ('74450401-54a8-53ef-bbcf-d673bc6385e6', '3fcd73f3-a571-5467-85ae-1215d1594556', 'C', 'Steroids', false, 2),
  ('6dbbd402-eea4-55bd-8f3e-a7834454eaae', '3fcd73f3-a571-5467-85ae-1215d1594556', 'D', 'Fluid restriction', false, 3),
  ('63e4c4db-011a-52bc-9bfb-132e6b567586', '3fcd73f3-a571-5467-85ae-1215d1594556', 'E', 'Furosemide first', false, 4);

-- Q480
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('1ba3d03a-bd6d-5b6b-9c34-c90ff8430fdb', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000035', 'sba', 'A 25 year old man is in ICU after a road traffic collision with a cervical spinal cord injury at C5. He is hypotensive (80/40) and bradycardic (45). His peripheries are warm. What is the SINGLE most likely diagnosis?', 'Neurogenic shock follows spinal cord injury above T6, with loss of sympathetic tone: hypotension, bradycardia and warm peripheries. Exclude haemorrhage first. Treat with fluids, vasopressors (noradrenaline) and atropine for bradycardia.', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v6')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = '1ba3d03a-bd6d-5b6b-9c34-c90ff8430fdb';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('a617b553-6672-548c-8859-43f81139e5e5', '1ba3d03a-bd6d-5b6b-9c34-c90ff8430fdb', 'A', 'Septic shock', false, 0),
  ('8192bd66-3954-55ce-94c4-68d96aea255f', '1ba3d03a-bd6d-5b6b-9c34-c90ff8430fdb', 'B', 'Neurogenic shock', true, 1),
  ('1769554a-5df9-51ac-901c-e7e9c910e6b1', '1ba3d03a-bd6d-5b6b-9c34-c90ff8430fdb', 'C', 'Hypovolaemic shock', false, 2),
  ('83c02b27-78b9-58ea-ac60-94e99309f516', '1ba3d03a-bd6d-5b6b-9c34-c90ff8430fdb', 'D', 'Cardiogenic shock', false, 3),
  ('1ff5d836-a334-500c-81a2-ccd69ff22dca', '1ba3d03a-bd6d-5b6b-9c34-c90ff8430fdb', 'E', 'Anaphylaxis', false, 4);

-- Q481
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('d09a3e0d-81fe-567e-b0ad-72255a139204', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000035', 'sba', 'A 60 year old woman in ICU develops a raised creatinine, oliguria and muddy brown granular casts on urine microscopy after a long episode of septic shock. What is the SINGLE most likely diagnosis?', 'ATN is caused by ischaemia (shock) or toxins (aminoglycosides, contrast, rhabdomyolysis). Urine shows muddy brown casts, high urine sodium and dilute urine. Management is supportive, with RRT if needed. Recovery often includes a polyuric phase.', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v6')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = 'd09a3e0d-81fe-567e-b0ad-72255a139204';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('fe27d193-de9e-5202-b9c9-6b68c5a7d15c', 'd09a3e0d-81fe-567e-b0ad-72255a139204', 'A', 'Obstruction', false, 0),
  ('19349935-0f4d-5702-9ac1-0da80ba7b883', 'd09a3e0d-81fe-567e-b0ad-72255a139204', 'B', 'Acute tubular necrosis', true, 1),
  ('788d83a5-bca7-5656-a689-691a5fa3d872', 'd09a3e0d-81fe-567e-b0ad-72255a139204', 'C', 'Pre-renal AKI', false, 2),
  ('aa06e952-9725-5de8-83b7-2cca23752bde', 'd09a3e0d-81fe-567e-b0ad-72255a139204', 'D', 'Glomerulonephritis', false, 3),
  ('b5d8764c-4e3a-51b3-8cd7-36c8dccae468', 'd09a3e0d-81fe-567e-b0ad-72255a139204', 'E', 'Acute interstitial nephritis', false, 4);

-- Q482
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('6d23e460-3ac9-506e-a2af-f9db2258cc66', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000025', 'sba', 'A 60 year old smoker has a 4 cm lung mass on CT. PET-CT shows high uptake in the mass and a mediastinal lymph node. What is the SINGLE most appropriate next step?', 'PET-positive mediastinal nodes need tissue confirmation (EBUS-TBNA) because false positives occur (infection, inflammation). Node status (N stage) determines whether surgery is suitable.', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v6')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = '6d23e460-3ac9-506e-a2af-f9db2258cc66';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('9128c696-fb02-58da-8789-9f824b9cff01', '6d23e460-3ac9-506e-a2af-f9db2258cc66', 'A', 'Radiotherapy without biopsy', false, 0),
  ('b7c05e77-04a9-5020-ad24-45718a3f87e9', '6d23e460-3ac9-506e-a2af-f9db2258cc66', 'B', 'EBUS-guided sampling of the mediastinal node (to stage the cancer)', true, 1),
  ('e979ac45-e140-5a73-94ec-e8b32282cf26', '6d23e460-3ac9-506e-a2af-f9db2258cc66', 'C', 'Repeat CT in 3 months', false, 2),
  ('9a287777-93d9-53e3-b1af-d5597fa7b6aa', '6d23e460-3ac9-506e-a2af-f9db2258cc66', 'D', 'Proceed to surgery without sampling', false, 3),
  ('44f54f86-bebb-5889-9354-f5e7c3304f59', '6d23e460-3ac9-506e-a2af-f9db2258cc66', 'E', 'MRI brain only', false, 4);

-- Q483
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('85beb432-a953-5af6-a517-3652698eb79f', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000025', 'sba', 'A 28 year old woman has had a sudden headache. MRI is planned. She has a metal foreign body in her eye from a previous welding injury. What is the SINGLE most important action?', 'Ferromagnetic intraocular foreign bodies can move in the MRI scanner, causing blindness. Screen with orbital X-ray or CT in people with a history of metalwork or eye injury.', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v6')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = '85beb432-a953-5af6-a517-3652698eb79f';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('df2109d3-d2b0-5776-99f2-48d17fd987af', '85beb432-a953-5af6-a517-3652698eb79f', 'A', 'No action', false, 0),
  ('1a17d421-100b-5a72-8856-2ea3cb54c43b', '85beb432-a953-5af6-a517-3652698eb79f', 'B', 'Proceed with MRI', false, 1),
  ('870ed6c0-c0b0-5699-8cb3-81ece1271079', '85beb432-a953-5af6-a517-3652698eb79f', 'C', 'Remove the eye', false, 2),
  ('61594912-7eed-55a8-91dd-29eba9ebe0ce', '85beb432-a953-5af6-a517-3652698eb79f', 'D', 'Use gadolinium contrast only', false, 3),
  ('b7c6ae51-a540-54ab-9826-56cbf0fff852', '85beb432-a953-5af6-a517-3652698eb79f', 'E', 'Perform orbital X-ray (or CT) to exclude intraocular metal before MRI', true, 4);

-- Q484
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('8e6eb88f-bda8-5493-8097-c10613beb0ae', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000025', 'sba', 'A 45 year old man has had abdominal pain and vomiting. He has a raised lipase. CT on day 1 is normal apart from mild pancreatic swelling. When is CT MOST useful in acute pancreatitis?', 'In acute pancreatitis, early CT is not needed if the diagnosis is clear, as necrosis may not be visible early. CT is used if the diagnosis is uncertain, or after 72 hours for patients not improving to look for necrosis and collections. Ultrasound looks for gallstones.', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v6')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = '8e6eb88f-bda8-5493-8097-c10613beb0ae';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('ad2d0db5-7f62-5fc4-80cc-3c54b5f0d214', '8e6eb88f-bda8-5493-8097-c10613beb0ae', 'A', 'Immediately in all cases', false, 0),
  ('47a9a756-2ce3-504f-972c-f90674b99629', '8e6eb88f-bda8-5493-8097-c10613beb0ae', 'B', 'After 72-96 hours, if not improving, to look for necrosis or collections (or if the diagnosis is uncertain)', true, 1),
  ('fac411ce-1942-5b8f-bea3-2e69ad0a92d4', '8e6eb88f-bda8-5493-8097-c10613beb0ae', 'C', 'Within 1 hour of admission in all', false, 2),
  ('f0a148f2-cb82-5544-b555-3b0171efc467', '8e6eb88f-bda8-5493-8097-c10613beb0ae', 'D', 'Only after discharge', false, 3),
  ('449ca1aa-91c9-51f6-ad20-00b5e9e50919', '8e6eb88f-bda8-5493-8097-c10613beb0ae', 'E', 'Never', false, 4);

-- Q485
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('4d7825a6-8f04-5946-b0f2-ea427bbf5241', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000025', 'sba', 'A 75 year old woman has had bone pain. A bone scan shows multiple hot spots in her spine, ribs and pelvis. She had breast cancer treated 5 years ago. What is the SINGLE most likely diagnosis?', 'Isotope bone scans show increased uptake in sclerotic and mixed metastases (breast, prostate). Myeloma lesions are lytic and often ''cold'' on bone scans; use skeletal survey, low-dose whole-body CT or MRI instead.', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v6')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = '4d7825a6-8f04-5946-b0f2-ea427bbf5241';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('af3c5702-1fe0-5f33-ad44-a83db57d5347', '4d7825a6-8f04-5946-b0f2-ea427bbf5241', 'A', 'Myeloma', false, 0),
  ('4029f1ec-884d-5ce4-80e9-8281c302a15f', '4d7825a6-8f04-5946-b0f2-ea427bbf5241', 'B', 'Osteoarthritis', false, 1),
  ('b4ec6b12-9806-5631-b423-96759d93cc17', '4d7825a6-8f04-5946-b0f2-ea427bbf5241', 'C', 'Paget''s disease only', false, 2),
  ('2355d5cd-62bb-5de1-95eb-87dfe163f146', '4d7825a6-8f04-5946-b0f2-ea427bbf5241', 'D', 'Bone metastases', true, 3),
  ('0cbd9239-1fa8-5875-b0c5-3753e969997e', '4d7825a6-8f04-5946-b0f2-ea427bbf5241', 'E', 'Osteoporosis', false, 4);

-- Q486
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('c02578ce-c69a-5c09-a157-a0c8a4831726', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000026', 'sba', 'A 50 year old man has had progressive unilateral sensorineural hearing loss, tinnitus and facial numbness. Corneal reflex is reduced. MRI shows a mass at the cerebellopontine angle. What is the SINGLE most likely diagnosis?', 'Vestibular schwannomas cause asymmetric hearing loss, tinnitus and imbalance. Larger tumours compress the trigeminal nerve (reduced corneal reflex) and facial nerve. Bilateral tumours suggest NF2. Options: monitoring, radiosurgery or surgery.', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v6')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = 'c02578ce-c69a-5c09-a157-a0c8a4831726';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('ae567860-70e5-593a-9c7b-a2f41bb705db', 'c02578ce-c69a-5c09-a157-a0c8a4831726', 'A', 'Cholesteatoma', false, 0),
  ('e6aab979-9f9b-554e-b024-725dd10278bb', 'c02578ce-c69a-5c09-a157-a0c8a4831726', 'B', 'Glomus tumour', false, 1),
  ('b7e23feb-6b52-5633-92cc-9e2e54fc7952', 'c02578ce-c69a-5c09-a157-a0c8a4831726', 'C', 'Vestibular schwannoma (acoustic neuroma)', true, 2),
  ('07ca01ae-8d81-5efe-8e51-59d01f1f1d94', 'c02578ce-c69a-5c09-a157-a0c8a4831726', 'D', 'Meningioma only', false, 3),
  ('181e47a6-80d2-51a1-a782-2e57a7fbdf6b', 'c02578ce-c69a-5c09-a157-a0c8a4831726', 'E', 'Ménière''s disease', false, 4);

-- Q487
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('24e50840-9a44-5036-bd67-d4e183377510', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000026', 'sba', 'A 40 year old woman has had pulsatile tinnitus and hearing loss in one ear. Otoscopy shows a red mass behind the eardrum. What is the SINGLE most likely diagnosis?', 'Glomus tumours are vascular paragangliomas causing pulsatile tinnitus, conductive hearing loss and a red mass behind the drum. Avoid biopsy (bleeding). Imaging (CT, MRI). Treatment: surgery or radiotherapy. Screen for hereditary paraganglioma syndromes.', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v6')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = '24e50840-9a44-5036-bd67-d4e183377510';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('9ac49515-39f0-5199-bc2e-73502e2c060c', '24e50840-9a44-5036-bd67-d4e183377510', 'A', 'Otosclerosis', false, 0),
  ('443db610-f0fa-5c72-bfdc-5530e715e9ab', '24e50840-9a44-5036-bd67-d4e183377510', 'B', 'Glomus tympanicum tumour (paraganglioma)', true, 1),
  ('8c3820a1-b308-5aeb-879d-c6b3f637c582', '24e50840-9a44-5036-bd67-d4e183377510', 'C', 'Acoustic neuroma', false, 2),
  ('95fab3ad-5280-54a6-9759-f335c397f3af', '24e50840-9a44-5036-bd67-d4e183377510', 'D', 'Cholesteatoma', false, 3),
  ('53dbae43-2131-5572-8805-e9b38a9649bd', '24e50840-9a44-5036-bd67-d4e183377510', 'E', 'Otitis media', false, 4);

-- Q488
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('9cc862a5-949e-55b0-a48b-8d694cf88113', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000026', 'sba', 'A 25 year old man has had a broken nose after a punch. Two days later he has severe pain, nasal obstruction and a soft bluish swelling on both sides of the nasal septum. What is the SINGLE most appropriate management?', 'Septal haematoma can cause septal necrosis, saddle nose deformity and abscess. It must be drained urgently. Always check for septal haematoma after nasal trauma.', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v6')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = '9cc862a5-949e-55b0-a48b-8d694cf88113';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('56115c83-a224-53ec-935d-ad732ec54a67', '9cc862a5-949e-55b0-a48b-8d694cf88113', 'A', 'Nasal steroid spray', false, 0),
  ('5aa7c94c-cf41-5d57-98f7-4eecbb552ac5', '9cc862a5-949e-55b0-a48b-8d694cf88113', 'B', 'Manipulation of the nose immediately', false, 1),
  ('b1968d5d-1d51-575e-9145-c1389dde0823', '9cc862a5-949e-55b0-a48b-8d694cf88113', 'C', 'Review in 1 week', false, 2),
  ('b68eae70-2009-567e-ada7-014e69b96848', '9cc862a5-949e-55b0-a48b-8d694cf88113', 'D', 'Urgent incision and drainage of the septal haematoma with nasal packing and antibiotics', true, 3),
  ('134126ab-a691-5f14-b378-33ec2ff9acd1', '9cc862a5-949e-55b0-a48b-8d694cf88113', 'E', 'No treatment', false, 4);

-- Q489
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('04f54291-d3c8-5832-80d6-f7cfd3d69032', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000026', 'sba', 'A 35 year old woman has had nasal blockage, discharge and loss of smell for 6 months. There are no unilateral features. Nasal endoscopy shows bilateral nasal polyps. What is the SINGLE most appropriate first-line treatment?', 'Chronic rhinosinusitis with nasal polyps: intranasal steroids and saline irrigation first; short oral steroid courses for severe symptoms; endoscopic sinus surgery for refractory disease; dupilumab for severe recurrent polyps.', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v6')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = '04f54291-d3c8-5832-80d6-f7cfd3d69032';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('3a1fcf61-c60c-5425-a6be-249cfe66438b', '04f54291-d3c8-5832-80d6-f7cfd3d69032', 'A', 'Topical intranasal corticosteroid drops or spray (with saline irrigation)', true, 0),
  ('ff43130a-42fa-5ae7-8c59-1dca7077aafe', '04f54291-d3c8-5832-80d6-f7cfd3d69032', 'B', 'Surgery immediately', false, 1),
  ('78e3f8f1-616f-5b7b-961e-699f5b9540bc', '04f54291-d3c8-5832-80d6-f7cfd3d69032', 'C', 'Antihistamines alone', false, 2),
  ('8ac735ad-76e2-5df6-bba5-ba0659dcb034', '04f54291-d3c8-5832-80d6-f7cfd3d69032', 'D', 'Decongestant spray long-term', false, 3),
  ('9dd54869-2404-5ea8-965d-9bc432984275', '04f54291-d3c8-5832-80d6-f7cfd3d69032', 'E', 'Oral antibiotics', false, 4);

-- Q490
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('78af9462-7af8-57a6-b231-6371d09f54c3', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000020', 'sba', 'A 45 year old man has had a painful, swollen testis and fever. He has no urethral discharge and is not sexually active. Urine shows E. coli. What is the SINGLE most appropriate antibiotic?', 'Epididymo-orchitis in older men or those at low STI risk is usually caused by enteric organisms. Treat with a quinolone. Investigate for underlying urinary tract abnormality. Sexually active younger men need STI cover.', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v6')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = '78af9462-7af8-57a6-b231-6371d09f54c3';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('6dcbfe0f-e964-5571-95be-1c8b4fb1b637', '78af9462-7af8-57a6-b231-6371d09f54c3', 'A', 'Azithromycin', false, 0),
  ('cfb72b85-c453-5d23-9cab-ada96ec41c31', '78af9462-7af8-57a6-b231-6371d09f54c3', 'B', 'Ofloxacin (or levofloxacin) for 14 days (enteric organism likely)', true, 1),
  ('52356f6d-0649-5c47-8193-7d8e18186582', '78af9462-7af8-57a6-b231-6371d09f54c3', 'C', 'Amoxicillin for 3 days', false, 2),
  ('ce95e59a-7334-5387-81ba-3d9cbcf70cf2', '78af9462-7af8-57a6-b231-6371d09f54c3', 'D', 'Ceftriaxone plus doxycycline', false, 3),
  ('b8823797-429a-567e-b7ab-bf52e7f4f63b', '78af9462-7af8-57a6-b231-6371d09f54c3', 'E', 'Metronidazole', false, 4);

-- Q491
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('15ed8a4a-ac2b-52b2-b2ab-7921ba79b459', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000020', 'sba', 'A 28 year old woman has had dyspareunia and vulval pain on touch for a year. Examination shows no abnormality except tenderness at the vestibule. STI screen is negative. What is the SINGLE most likely diagnosis?', 'Vulvodynia is chronic vulval pain without a visible cause. Management: avoid irritants, topical lidocaine, pelvic floor physiotherapy, psychosexual therapy and neuropathic agents (amitriptyline, gabapentin).', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v6')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = '15ed8a4a-ac2b-52b2-b2ab-7921ba79b459';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('1b252a2b-cb9d-529e-ac0b-0ae67971c98a', '15ed8a4a-ac2b-52b2-b2ab-7921ba79b459', 'A', 'Genital herpes', false, 0),
  ('eec1a0a3-25e7-5f79-9cab-bb283fb4d562', '15ed8a4a-ac2b-52b2-b2ab-7921ba79b459', 'B', 'Vulvodynia (provoked vestibulodynia)', true, 1),
  ('8b5769f4-b824-5d27-8e68-c1985550a042', '15ed8a4a-ac2b-52b2-b2ab-7921ba79b459', 'C', 'Lichen sclerosus', false, 2),
  ('f26b8a1a-bd64-5084-9eb2-47e4efa7942f', '15ed8a4a-ac2b-52b2-b2ab-7921ba79b459', 'D', 'Candidiasis', false, 3),
  ('4bfca113-5058-5b2d-972e-2c055bceb162', '15ed8a4a-ac2b-52b2-b2ab-7921ba79b459', 'E', 'Bartholin''s cyst', false, 4);

-- Q492
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('8ab7b2e3-6d4b-538a-8056-4d082c9c7505', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000020', 'sba', 'A 33 year old man has had recurrent episodes of anal pain, itching and discharge. He has sex with men. Anoscopy shows warts. What is an important long-term risk?', 'HPV (types 16 and 18) causes anal intraepithelial neoplasia and anal cancer, more common in MSM and people with HIV. HPV vaccination is offered to MSM up to age 45. Anal warts are usually HPV 6 and 11.', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v6')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = '8ab7b2e3-6d4b-538a-8056-4d082c9c7505';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('14ccf42e-9a7f-55f1-a13d-29b24d0ea0a1', '8ab7b2e3-6d4b-538a-8056-4d082c9c7505', 'A', 'Prostate cancer', false, 0),
  ('7de6709e-1a38-5190-b820-51177888b9cb', '8ab7b2e3-6d4b-538a-8056-4d082c9c7505', 'B', 'Anal cancer (HPV-related), especially with HIV', true, 1),
  ('66c87b9e-7a9f-51b3-b5e1-01b3effa6603', '8ab7b2e3-6d4b-538a-8056-4d082c9c7505', 'C', 'Testicular cancer', false, 2),
  ('fc9d264c-80d5-58a9-9c84-f86fd1ebfba6', '8ab7b2e3-6d4b-538a-8056-4d082c9c7505', 'D', 'Bladder cancer', false, 3),
  ('47827bed-f72b-514b-8f7f-fbc00e7c7671', '8ab7b2e3-6d4b-538a-8056-4d082c9c7505', 'E', 'Colon cancer', false, 4);

-- Q493
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('a777c13e-50fa-535a-af9a-70c15c65ea54', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000020', 'sba', 'A 26 year old woman is HIV positive and has just given birth. Her viral load was undetectable throughout pregnancy. What does the baby need?', 'Babies born to mothers with HIV receive antiretroviral PEP (usually 2-4 weeks) and HIV PCR testing at intervals. UK guidance recommends formula feeding, with informed choice and support for women with sustained undetectable viral load who choose to breastfeed.', null, true, true, jsonb_build_object('source', 'plab1-xlsx-v6')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = 'a777c13e-50fa-535a-af9a-70c15c65ea54';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('292e2d8a-1b45-5416-88ae-78cc0fb47502', 'a777c13e-50fa-535a-af9a-70c15c65ea54', 'A', 'Caesarean section for future births only', false, 0),
  ('9f7bf8b4-fc06-5b74-811e-8baf9061829b', 'a777c13e-50fa-535a-af9a-70c15c65ea54', 'B', 'BCG only', false, 1),
  ('3910ad5d-dff0-5cb5-94c8-fbf21d17bdd8', 'a777c13e-50fa-535a-af9a-70c15c65ea54', 'C', 'Breastfeeding is always recommended', false, 2),
  ('320ae13d-b4e8-5856-833b-ddefd5f8da87', 'a777c13e-50fa-535a-af9a-70c15c65ea54', 'D', 'No treatment', false, 3),
  ('173cf843-0c28-5f43-b4d6-c2eaf5d8b3fb', 'a777c13e-50fa-535a-af9a-70c15c65ea54', 'E', 'Post-exposure prophylaxis (antiretrovirals) for the baby, HIV PCR testing, and advice on infant feeding', true, 4);

-- Q494
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('75e64bd3-d7ce-5049-af34-6ccc74993018', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000024', 'sba', 'A 72 year old man has had a 3 cm right renal mass found incidentally on CT. He is fit. There is no metastasis. What is the SINGLE most appropriate treatment?', 'Small renal masses (T1a, under 4 cm) are usually treated with partial nephrectomy to preserve renal function. Ablation or active surveillance in older or frail patients. Larger tumours: radical nephrectomy.', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v6')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = '75e64bd3-d7ce-5049-af34-6ccc74993018';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('4f802702-09bf-5e10-bf0d-1b51984acb79', '75e64bd3-d7ce-5049-af34-6ccc74993018', 'A', 'Radical nephrectomy for all', false, 0),
  ('602ca641-3c19-57da-b5a2-059d7ceb8cda', '75e64bd3-d7ce-5049-af34-6ccc74993018', 'B', 'Chemotherapy', false, 1),
  ('44171e61-8870-5fc3-91b0-533a914ebe2d', '75e64bd3-d7ce-5049-af34-6ccc74993018', 'C', 'Radiotherapy alone', false, 2),
  ('69cead09-ceba-5e17-9bef-4c9bdc9f0e17', '75e64bd3-d7ce-5049-af34-6ccc74993018', 'D', 'Observation only', false, 3),
  ('9120ceac-9901-55bc-907c-c3f320727b42', '75e64bd3-d7ce-5049-af34-6ccc74993018', 'E', 'Partial nephrectomy (nephron-sparing surgery)', true, 4);

-- Q495
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('4fbc8ac9-4efc-5104-a2e0-0068682a5fc5', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000024', 'sba', 'A 50 year old man has had a hard lump in his testis and back pain. CT shows enlarged para-aortic lymph nodes. Tumour markers: AFP raised. What is the MOST likely tumour type?', 'Testicular cancers spread first to para-aortic lymph nodes (embryological origin). A raised AFP excludes pure seminoma. Treatment: orchidectomy, then chemotherapy (BEP), with excellent cure rates even with metastases.', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v6')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = '4fbc8ac9-4efc-5104-a2e0-0068682a5fc5';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('5a067716-ce99-5155-bbea-92aaf3c4c4f5', '4fbc8ac9-4efc-5104-a2e0-0068682a5fc5', 'A', 'Metastatic prostate cancer', false, 0),
  ('5f3ac0e0-bd43-5b84-80a7-0d783a60841b', '4fbc8ac9-4efc-5104-a2e0-0068682a5fc5', 'B', 'Pure seminoma', false, 1),
  ('c4900eaf-4391-5331-98ff-346ea8fc6ca2', '4fbc8ac9-4efc-5104-a2e0-0068682a5fc5', 'C', 'Non-seminomatous germ cell tumour (e.g. yolk sac or mixed)', true, 2),
  ('7d66484a-6abc-50e2-beea-771d510adc65', '4fbc8ac9-4efc-5104-a2e0-0068682a5fc5', 'D', 'Leydig cell tumour', false, 3),
  ('ca3cc4a3-40f1-5619-9180-8f08eabded42', '4fbc8ac9-4efc-5104-a2e0-0068682a5fc5', 'E', 'Lymphoma', false, 4);

-- Q496
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('0371f127-2c3f-5f35-883a-d21ad070e4e2', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000024', 'sba', 'A 65 year old man with bladder cancer has haematuria. Which occupational exposure is a recognised risk factor?', 'Bladder cancer risk factors: smoking (most important), aromatic amines (dyes, rubber), cyclophosphamide, pelvic radiotherapy and schistosomiasis (squamous cell carcinoma). Most are urothelial carcinomas.', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v6')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = '0371f127-2c3f-5f35-883a-d21ad070e4e2';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('17a6f541-6b51-54bb-b950-75eecf785b26', '0371f127-2c3f-5f35-883a-d21ad070e4e2', 'A', 'Aromatic amines (dye, rubber and leather industries)', true, 0),
  ('42a6bab3-2fae-596b-b0c6-7c019c95cacd', '0371f127-2c3f-5f35-883a-d21ad070e4e2', 'B', 'Coal dust', false, 1),
  ('ad89ae7d-4b07-59cb-a8c3-32aee5cb21e2', '0371f127-2c3f-5f35-883a-d21ad070e4e2', 'C', 'Silica', false, 2),
  ('677a9486-d595-5036-8336-552232ebc152', '0371f127-2c3f-5f35-883a-d21ad070e4e2', 'D', 'Asbestos', false, 3),
  ('af95181d-ee0c-51c2-b955-c57cbfc4f661', '0371f127-2c3f-5f35-883a-d21ad070e4e2', 'E', 'Wood dust', false, 4);

-- Q497
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('26b51098-46db-58fb-b814-e0e80485aba2', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000024', 'sba', 'A 45 year old woman has a pigmented lesion that biopsy confirms as melanoma with a BRAF V600E mutation. She has metastases. What is a targeted treatment option?', 'Advanced melanoma is treated with immunotherapy (anti-PD-1 with or without anti-CTLA-4) or, in BRAF-mutated tumours, combined BRAF and MEK inhibitors. Brain metastases are common.', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v6')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = '26b51098-46db-58fb-b814-e0e80485aba2';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('9ef07069-6d61-5159-9bd4-10211df9a764', '26b51098-46db-58fb-b814-e0e80485aba2', 'A', 'Tamoxifen', false, 0),
  ('98db0786-8c77-57c6-b2dd-c23058f90b5d', '26b51098-46db-58fb-b814-e0e80485aba2', 'B', 'Trastuzumab', false, 1),
  ('b7c75515-b876-53df-9250-bbee2350160c', '26b51098-46db-58fb-b814-e0e80485aba2', 'C', 'Rituximab', false, 2),
  ('b33e0e14-b738-5f04-b048-3d1c516d988a', '26b51098-46db-58fb-b814-e0e80485aba2', 'D', 'BRAF and MEK inhibitors (e.g. dabrafenib plus trametinib)', true, 3),
  ('079f2719-d805-5a59-a25f-7b8b4c8d5042', '26b51098-46db-58fb-b814-e0e80485aba2', 'E', 'Imatinib', false, 4);

-- Q498
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('56a583f3-0208-5c24-bb1f-1218f09dd464', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000017', 'sba', 'A 70 year old man with advanced cancer has a cough with large volumes of thick secretions and is anxious. He is not dying imminently. Which is the MOST appropriate first step?', 'Productive cough in palliative care: treat causes, nebulised saline to loosen secretions, physiotherapy and positioning. Antimuscarinics (hyoscine) are used for secretions in the last days of life.', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v6')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = '56a583f3-0208-5c24-bb1f-1218f09dd464';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('35207d0d-c818-5c23-89db-7f70cb93d063', '56a583f3-0208-5c24-bb1f-1218f09dd464', 'A', 'Antibiotics for all', false, 0),
  ('44c209cf-1d25-50db-8a94-fcc3f52e9a38', '56a583f3-0208-5c24-bb1f-1218f09dd464', 'B', 'Treat any reversible causes (infection, aspiration) and consider nebulised saline and physiotherapy', true, 1),
  ('c6562423-716b-5a8d-9b86-1588db2665a6', '56a583f3-0208-5c24-bb1f-1218f09dd464', 'C', 'No treatment', false, 2),
  ('b3b7c212-9036-56b6-ba7e-e5502992fa9c', '56a583f3-0208-5c24-bb1f-1218f09dd464', 'D', 'High-dose opioids only', false, 3),
  ('355d2658-af0f-5c87-9448-846537477d72', '56a583f3-0208-5c24-bb1f-1218f09dd464', 'E', 'Hyoscine for all', false, 4);

-- Q499
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('8975dc84-d51e-512f-89b2-0644f718929e', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000017', 'sba', 'A 55 year old woman with ovarian cancer has had worsening fatigue. She asks if anything can help. What is the MOST appropriate approach?', 'Cancer-related fatigue is common. Treat reversible causes, encourage activity pacing and exercise, and address sleep and mood. Short-term steroids may help in advanced disease.', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v6')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = '8975dc84-d51e-512f-89b2-0644f718929e';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('14117224-728e-5950-b659-820adb3267e4', '8975dc84-d51e-512f-89b2-0644f718929e', 'A', 'Nothing can be done', false, 0),
  ('53978543-db9a-52dd-9ae9-9a4398c06b7a', '8975dc84-d51e-512f-89b2-0644f718929e', 'B', 'High-dose steroids for all', false, 1),
  ('403106e4-353f-5d70-be8f-10b95e04b5a1', '8975dc84-d51e-512f-89b2-0644f718929e', 'C', 'Stop all treatment', false, 2),
  ('5afac1c7-e83c-5f93-b0d6-b2de62499dbb', '8975dc84-d51e-512f-89b2-0644f718929e', 'D', 'Bed rest', false, 3),
  ('09ee9583-a5aa-5291-a43a-a42dd9765a56', '8975dc84-d51e-512f-89b2-0644f718929e', 'E', 'Look for reversible causes (anaemia, depression, hypothyroidism, hypercalcaemia, drugs), and advise energy conservation and graded activity', true, 4);

-- Q500
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('073cf648-c7b0-53f2-bed0-c3b0a1327460', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000017', 'sba', 'A 68 year old man with lung cancer has severe anorexia and weight loss. He is likely to live several weeks. What may improve his appetite in the short term?', 'Cancer cachexia is not fully reversed by nutrition. Steroids can improve appetite and wellbeing short-term (side effects limit use). Focus on comfort, small meals and food the person enjoys.', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v6')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = '073cf648-c7b0-53f2-bed0-c3b0a1327460';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('60c470a2-60bf-5553-8095-24557a0eadd1', '073cf648-c7b0-53f2-bed0-c3b0a1327460', 'A', 'A short course of a corticosteroid (e.g. dexamethasone)', true, 0),
  ('c05f9570-fc12-5b65-bad7-d9e3891778a2', '073cf648-c7b0-53f2-bed0-c3b0a1327460', 'B', 'Insulin', false, 1),
  ('63ff612c-7e71-51dc-8a10-b9dd19e2980f', '073cf648-c7b0-53f2-bed0-c3b0a1327460', 'C', 'Megestrol long-term in all', false, 2),
  ('375a7148-b2b8-59c3-8e91-7af72ecb4e96', '073cf648-c7b0-53f2-bed0-c3b0a1327460', 'D', 'No treatment possible', false, 3),
  ('d04186a4-b161-5895-bfb0-7a93b9ff63bd', '073cf648-c7b0-53f2-bed0-c3b0a1327460', 'E', 'High-calorie tube feeding', false, 4);

-- Q501
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('6b51d17e-a5e2-5069-bc25-3c2246b3930b', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000017', 'sba', 'A 75 year old man is dying at home. He has a syringe driver with morphine and midazolam. His daughter asks whether the medicines are ''killing him''. What is the BEST response?', 'Families often worry that end-of-life medicines hasten death. Explain that they are titrated to symptoms and that the person is dying from their illness. Clear communication reduces distress.', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v6')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = '6b51d17e-a5e2-5069-bc25-3c2246b3930b';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('cccbf969-b5d5-5a26-8d87-fe5d3e8f0c4e', '6b51d17e-a5e2-5069-bc25-3c2246b3930b', 'A', 'Explain that the doses are for comfort, adjusted to his symptoms, and do not hasten death when used appropriately; his illness is causing his decline', true, 0),
  ('fd1c3906-a2ac-57f0-b92c-60ff64b62715', '6b51d17e-a5e2-5069-bc25-3c2246b3930b', 'B', 'Refuse to discuss', false, 1),
  ('6fcddff7-9dd2-5e22-99ca-54fc0b18623a', '6b51d17e-a5e2-5069-bc25-3c2246b3930b', 'C', 'Agree that the medicines are causing death', false, 2),
  ('7823bc8c-4582-5c09-a72a-2dcb833b7354', '6b51d17e-a5e2-5069-bc25-3c2246b3930b', 'D', 'Tell her to ask the GP', false, 3),
  ('b4fde24d-f67f-5d1a-9507-82ead2ad8bc2', '6b51d17e-a5e2-5069-bc25-3c2246b3930b', 'E', 'Stop all medicines', false, 4);

-- Q502
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('772c88d9-672f-5e66-8f0d-96ecc906295a', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000017', 'sba', 'A 40 year old woman with metastatic cancer has bone pain despite morphine. She develops sedation and myoclonus when the dose is increased. Renal function is normal. What is the SINGLE most appropriate strategy?', 'Opioid toxicity (sedation, myoclonus, hallucinations) or poor response can be managed by opioid rotation and adjuvant analgesics. Radiotherapy and NSAIDs help bone pain. Consider specialist palliative care input.', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v6')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = '772c88d9-672f-5e66-8f0d-96ecc906295a';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('709d14f8-3b78-5543-a236-1ec6a72ddad8', '772c88d9-672f-5e66-8f0d-96ecc906295a', 'A', 'Opioid switching (e.g. to oxycodone) and adding adjuvants (NSAID, radiotherapy for bone pain)', true, 0),
  ('d21deccf-fd0a-5783-8a69-28f2cb760e7a', '772c88d9-672f-5e66-8f0d-96ecc906295a', 'B', 'Add a benzodiazepine for myoclonus only', false, 1),
  ('62602576-6046-5372-a8ec-1ce609575492', '772c88d9-672f-5e66-8f0d-96ecc906295a', 'C', 'Stop all analgesia', false, 2),
  ('e429e979-d28b-5a77-8674-e9cdca5b8923', '772c88d9-672f-5e66-8f0d-96ecc906295a', 'D', 'Paracetamol only', false, 3),
  ('9a9b8ed2-3614-5512-9d8b-ea1a1fb3429c', '772c88d9-672f-5e66-8f0d-96ecc906295a', 'E', 'Increase morphine further', false, 4);

-- Q503
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('e74d5715-0619-50b9-9f4c-838e0d6f99aa', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000016', 'sba', 'A 45 year old woman has had numbness and tingling in her little and ring fingers, worse when her elbow is bent for long periods (e.g. holding a phone). Froment''s sign is positive. What is the SINGLE most likely diagnosis?', 'Cubital tunnel syndrome is the second most common compressive neuropathy. Sensory loss affects the little finger, half the ring finger and the dorsal ulnar hand (dorsal branch arises proximal to the wrist, so dorsal sensation is spared in Guyon''s canal lesions). Nerve conduction studies confirm. Manage with night splints in extension, then surgical decompression.', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v6')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = 'e74d5715-0619-50b9-9f4c-838e0d6f99aa';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('5b3fcd5b-884e-572e-b8ac-b3e61a6df13d', 'e74d5715-0619-50b9-9f4c-838e0d6f99aa', 'A', 'Cubital tunnel syndrome (ulnar nerve compression at the elbow)', true, 0),
  ('f4d9e350-5627-5820-87e5-5f52fc9f271a', 'e74d5715-0619-50b9-9f4c-838e0d6f99aa', 'B', 'C8 radiculopathy only', false, 1),
  ('2ae19573-4f17-5865-814a-0dbb5bed3e84', 'e74d5715-0619-50b9-9f4c-838e0d6f99aa', 'C', 'Carpal tunnel syndrome', false, 2),
  ('e4fcd693-1321-51bf-ae31-e420595e8fc9', 'e74d5715-0619-50b9-9f4c-838e0d6f99aa', 'D', 'Guyon''s canal syndrome', false, 3),
  ('28517edf-c083-523d-ad4f-464489cb68fd', 'e74d5715-0619-50b9-9f4c-838e0d6f99aa', 'E', 'Thoracic outlet syndrome', false, 4);

-- Q504
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('e60d5ec7-e4b3-5bd6-8ac7-ac80794ceaff', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000016', 'sba', 'A 60 year old man has had a lump at the back of his wrist that changes in size. It transilluminates. It is not painful. What is the SINGLE most appropriate management?', 'Ganglia arise from joint capsules or tendon sheaths. Most are harmless and up to half resolve. Aspiration has a high recurrence rate; excision for pain or functional problems.', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v6')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = 'e60d5ec7-e4b3-5bd6-8ac7-ac80794ceaff';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('f5040c0c-d4d1-55db-8db6-7de4946622a3', 'e60d5ec7-e4b3-5bd6-8ac7-ac80794ceaff', 'A', 'Immediate excision in all', false, 0),
  ('2b7c937d-72ee-59d3-9133-5fa5fbaadefc', 'e60d5ec7-e4b3-5bd6-8ac7-ac80794ceaff', 'B', 'Steroid injection into the joint', false, 1),
  ('874028cc-4dec-5745-b25a-4171b09528ea', 'e60d5ec7-e4b3-5bd6-8ac7-ac80794ceaff', 'C', 'Urgent biopsy', false, 2),
  ('774e1673-82d5-5a1e-9945-5e82e7788509', 'e60d5ec7-e4b3-5bd6-8ac7-ac80794ceaff', 'D', 'Antibiotics', false, 3),
  ('bf861b5c-04eb-5946-bdec-a7ee462fe8ae', 'e60d5ec7-e4b3-5bd6-8ac7-ac80794ceaff', 'E', 'Reassure; ganglion cysts often resolve spontaneously, with aspiration or excision if symptomatic', true, 4);

-- Q505
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('87b187dd-ec93-5be4-b2ad-0ea760807163', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000016', 'sba', 'A 50 year old diabetic woman has had a finger that clicks and locks in flexion when she makes a fist. There is a tender nodule at the base of the finger in the palm. What is the SINGLE most appropriate first-line treatment?', 'Trigger finger is caused by thickening of the A1 pulley. It is more common in diabetes and RA. Steroid injection is first line; surgical release of the A1 pulley if it recurs.', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v6')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = '87b187dd-ec93-5be4-b2ad-0ea760807163';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('f28da68f-5642-539e-95d3-24024da2a30f', '87b187dd-ec93-5be4-b2ad-0ea760807163', 'A', 'Surgical release immediately', false, 0),
  ('1d6664d9-56e8-5276-8001-96e833b60cd1', '87b187dd-ec93-5be4-b2ad-0ea760807163', 'B', 'Physiotherapy only', false, 1),
  ('dccd0016-b05c-5856-86b3-6457ef5f93fc', '87b187dd-ec93-5be4-b2ad-0ea760807163', 'C', 'Corticosteroid injection into the flexor tendon sheath', true, 2),
  ('efa9aef5-1148-5773-946b-26f49731f48c', '87b187dd-ec93-5be4-b2ad-0ea760807163', 'D', 'Splint for 6 months only', false, 3),
  ('5c4cde5c-2a03-54e5-9825-3c0877e726b3', '87b187dd-ec93-5be4-b2ad-0ea760807163', 'E', 'Oral antibiotics', false, 4);

-- Q506
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('0a3e2d5c-faca-5484-88d9-4d895898d372', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000016', 'sba', 'A 30 year old woman has had pain at the base of her thumb on the radial side of her wrist since having a baby. Pain is reproduced when she makes a fist over the thumb and deviates the wrist ulnarly. What is the SINGLE most likely diagnosis?', 'De Quervain''s tenosynovitis affects abductor pollicis longus and extensor pollicis brevis (first extensor compartment). Finkelstein''s test is positive. It is common in new mothers. Treatment: splint, NSAIDs, steroid injection, surgery if persistent.', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v6')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = '0a3e2d5c-faca-5484-88d9-4d895898d372';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('480c7cc8-173e-55d6-b31d-017b332400fa', '0a3e2d5c-faca-5484-88d9-4d895898d372', 'A', 'Thumb base osteoarthritis', false, 0),
  ('8c6db136-36e2-5048-bb1a-274ac64a4231', '0a3e2d5c-faca-5484-88d9-4d895898d372', 'B', 'Intersection syndrome', false, 1),
  ('db1de3c3-d792-5e43-b6ce-18f839a07b93', '0a3e2d5c-faca-5484-88d9-4d895898d372', 'C', 'Scaphoid fracture', false, 2),
  ('3e30b25d-0c2c-5961-8fa4-5cf6904da9a3', '0a3e2d5c-faca-5484-88d9-4d895898d372', 'D', 'Carpal tunnel syndrome', false, 3),
  ('835f47ba-7730-5cc5-a964-9fd8dd63ce3e', '0a3e2d5c-faca-5484-88d9-4d895898d372', 'E', 'De Quervain''s tenosynovitis', true, 4);

-- Q507
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('f89687e1-1245-5c5d-b91c-070570de6bd6', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000016', 'sba', 'A 25 year old man punched a wall. His little finger knuckle is depressed and the finger overlaps the ring finger when he makes a fist. X-ray shows a fifth metacarpal neck fracture with 30 degrees of angulation. What is the MOST important clinical check?', 'Boxer''s fractures with moderate angulation usually do well with buddy strapping. Rotational deformity is not accepted and needs correction. Look for ''fight bite'' wounds over the knuckle, which need washout and antibiotics.', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v6')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = 'f89687e1-1245-5c5d-b91c-070570de6bd6';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('3a281997-69e5-5c87-9512-a2c5114511a2', 'f89687e1-1245-5c5d-b91c-070570de6bd6', 'A', 'Sensation over the thumb', false, 0),
  ('9731e527-9342-50e5-a0a1-d009ba553c8d', 'f89687e1-1245-5c5d-b91c-070570de6bd6', 'B', 'Rotational deformity (scissoring), which needs reduction or fixation', true, 1),
  ('cb94a98f-1ca4-55d3-b647-b6012f2722ff', 'f89687e1-1245-5c5d-b91c-070570de6bd6', 'C', 'Grip strength only', false, 2),
  ('dd07c851-811a-5c01-afa1-3da606f1fcd1', 'f89687e1-1245-5c5d-b91c-070570de6bd6', 'D', 'Elbow range of movement', false, 3),
  ('dffba992-3902-52f8-8ef3-bb18ef8fd881', 'f89687e1-1245-5c5d-b91c-070570de6bd6', 'E', 'Radial pulse', false, 4);

-- Q508
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('f2f3ee13-b3e6-5819-b9d3-a828be44feb5', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000016', 'sba', 'A 28 year old man has a small wound over his knuckle after punching someone in the mouth 2 days ago. The hand is now swollen and red. What is the SINGLE most appropriate management?', 'Fight bites can inoculate oral bacteria (including Eikenella corrodens) into the MCP joint, causing septic arthritis. They need exploration, washout, and antibiotics. Never suture primarily.', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v6')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = 'f2f3ee13-b3e6-5819-b9d3-a828be44feb5';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('2ab18ac7-c3b3-5126-b2c3-29cb98a0f1c7', 'f2f3ee13-b3e6-5819-b9d3-a828be44feb5', 'A', 'Refer to hand surgery for surgical exploration and washout, with IV co-amoxiclav', true, 0),
  ('f3a363b7-2026-5858-b256-08576930b6db', 'f2f3ee13-b3e6-5819-b9d3-a828be44feb5', 'B', 'Oral flucloxacillin only and discharge', false, 1),
  ('ea165de3-8fdc-58d1-8c71-b991030ed505', 'f2f3ee13-b3e6-5819-b9d3-a828be44feb5', 'C', 'Review in 2 weeks', false, 2),
  ('cc36f061-e894-5ecd-9001-2dbfef3cae4e', 'f2f3ee13-b3e6-5819-b9d3-a828be44feb5', 'D', 'Steroid cream', false, 3),
  ('b7d258be-e99f-5b23-bafe-1e19ff5809b0', 'f2f3ee13-b3e6-5819-b9d3-a828be44feb5', 'E', 'Close the wound with sutures', false, 4);

-- Q509
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('b82b28a6-edb3-5ab3-b5fe-6a0557f55869', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000016', 'sba', 'A 35 year old man caught his finger in a rugby jersey. He cannot flex the tip of his ring finger (DIP joint) actively. What is the SINGLE most likely injury?', 'Jersey finger is FDP avulsion from the distal phalanx, most often in the ring finger. It needs early surgical repair (within 7-10 days) as the tendon may retract into the palm.', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v6')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = 'b82b28a6-edb3-5ab3-b5fe-6a0557f55869';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('5683feb0-5264-5f8a-9754-b55d6fc083cf', 'b82b28a6-edb3-5ab3-b5fe-6a0557f55869', 'A', 'Central slip injury', false, 0),
  ('c13ab938-e8e0-5c9d-9b01-ebf68c6e988c', 'b82b28a6-edb3-5ab3-b5fe-6a0557f55869', 'B', 'Avulsion of flexor digitorum profundus (jersey finger)', true, 1),
  ('f177b9af-8b79-552f-849a-ab9733ae3545', 'b82b28a6-edb3-5ab3-b5fe-6a0557f55869', 'C', 'Mallet finger', false, 2),
  ('ab37da56-f09c-5ceb-a03f-baff9e898814', 'b82b28a6-edb3-5ab3-b5fe-6a0557f55869', 'D', 'Trigger finger', false, 3),
  ('4409557a-bdbb-50f8-a8d9-3d04f2a5d147', 'b82b28a6-edb3-5ab3-b5fe-6a0557f55869', 'E', 'Volar plate injury', false, 4);

-- Q510
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('6be19aa5-6193-542c-b46c-ee58f4fa610a', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000016', 'sba', 'A 45 year old woman has had a jammed finger. She cannot actively extend the PIP joint and later develops flexion at the PIP joint with hyperextension at the DIP joint. What is the SINGLE most likely injury?', 'Central slip injuries of the extensor mechanism lead to boutonnière deformity. Early splinting of the PIP joint in extension (DIP free) for about 6 weeks prevents it.', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v6')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = '6be19aa5-6193-542c-b46c-ee58f4fa610a';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('3901cf76-bfc0-5be6-ac12-26644528bfbd', '6be19aa5-6193-542c-b46c-ee58f4fa610a', 'A', 'Jersey finger', false, 0),
  ('3cd1c636-aade-5833-8f73-eff63ee27ccd', '6be19aa5-6193-542c-b46c-ee58f4fa610a', 'B', 'Central slip rupture leading to boutonnière deformity', true, 1),
  ('319c536d-c72b-5ae7-9562-6322639bca65', '6be19aa5-6193-542c-b46c-ee58f4fa610a', 'C', 'Swan neck from volar plate injury', false, 2),
  ('4fa80abb-8c27-5159-bf49-d692ce3b257b', '6be19aa5-6193-542c-b46c-ee58f4fa610a', 'D', 'Trigger finger', false, 3),
  ('d75ad40b-7b95-5045-9bce-36aa027d2d94', '6be19aa5-6193-542c-b46c-ee58f4fa610a', 'E', 'Mallet finger', false, 4);

-- Q511
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('a7734dd0-bec1-5b75-9506-e52dd5586aac', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000016', 'sba', 'A 40 year old man has had sudden pain at the back of his heel while playing squash, like being kicked. He can walk with a limp. Simmonds'' (Thompson) test is positive. What is the SINGLE most likely diagnosis?', 'Achilles rupture: sudden pain, palpable gap and positive Simmonds'' test (no plantar flexion when squeezing the calf). Risk factors include quinolones and steroid injections. Treatment: functional bracing in equinus or surgical repair.', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v6')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = 'a7734dd0-bec1-5b75-9506-e52dd5586aac';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('e302496d-cfca-598a-8849-7337d0a09d7b', 'a7734dd0-bec1-5b75-9506-e52dd5586aac', 'A', 'Calcaneal fracture', false, 0),
  ('3da80226-b73a-54f7-abdf-a45cc8df2cb6', 'a7734dd0-bec1-5b75-9506-e52dd5586aac', 'B', 'Achilles tendon rupture', true, 1),
  ('2fb8481a-50b3-5cd0-b303-41ea149286b1', 'a7734dd0-bec1-5b75-9506-e52dd5586aac', 'C', 'Gastrocnemius strain only', false, 2),
  ('43f0e2d3-a515-5a4c-b22b-0b2b2a488f52', 'a7734dd0-bec1-5b75-9506-e52dd5586aac', 'D', 'Ankle sprain', false, 3),
  ('803fa74c-e412-5f82-b850-c18d1d84f304', 'a7734dd0-bec1-5b75-9506-e52dd5586aac', 'E', 'Plantar fasciitis', false, 4);

-- Q512
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('fe9221ce-6d6c-59d9-a3d0-f03904059544', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000016', 'sba', 'A 60 year old woman has had a painful bunion at the base of her big toe, with the toe angled towards the lesser toes. Shoes are painful. What is the SINGLE most likely diagnosis?', 'Hallux valgus is lateral deviation of the great toe with medial prominence of the first metatarsal head. Manage with wide shoes and padding; surgery (osteotomy) if pain persists.', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v6')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = 'fe9221ce-6d6c-59d9-a3d0-f03904059544';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('f75c7c7e-97d7-5851-8e81-ad0ed690fb45', 'fe9221ce-6d6c-59d9-a3d0-f03904059544', 'A', 'Morton''s neuroma', false, 0),
  ('bebd4e7c-70b1-5357-9110-5ec6fdb7bdf3', 'fe9221ce-6d6c-59d9-a3d0-f03904059544', 'B', 'Gout', false, 1),
  ('8a3e0508-418e-5202-ba6c-b7fc4f0475fe', 'fe9221ce-6d6c-59d9-a3d0-f03904059544', 'C', 'Sesamoiditis', false, 2),
  ('b4524785-80b5-5419-bbdb-b16eea4e005e', 'fe9221ce-6d6c-59d9-a3d0-f03904059544', 'D', 'Hallux valgus', true, 3),
  ('01daee38-e718-5e91-9fb5-50e6e5efc8e1', 'fe9221ce-6d6c-59d9-a3d0-f03904059544', 'E', 'Hallux rigidus', false, 4);

-- Q513
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('3c976094-697f-5a53-8749-c3b36e5d7400', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000016', 'sba', 'A 12 year old boy who plays football has pain and a bony lump below his kneecap at the front of the tibia. What is the SINGLE most likely diagnosis?', 'Osgood-Schlatter disease is a traction apophysitis of the tibial tuberosity in active adolescents. It is self-limiting: activity modification, ice, analgesia and stretching.', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v6')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = '3c976094-697f-5a53-8749-c3b36e5d7400';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('d4d59344-007e-5c82-97c0-2d94dbc28321', '3c976094-697f-5a53-8749-c3b36e5d7400', 'A', 'Osgood-Schlatter disease', true, 0),
  ('e5394cb3-df27-5e89-951d-659150e91cb2', '3c976094-697f-5a53-8749-c3b36e5d7400', 'B', 'Patellar fracture', false, 1),
  ('d8dd7fb9-87af-5c87-8a53-65305e9b1989', '3c976094-697f-5a53-8749-c3b36e5d7400', 'C', 'Prepatellar bursitis', false, 2),
  ('83484615-f300-5599-b875-8823c93e9266', '3c976094-697f-5a53-8749-c3b36e5d7400', 'D', 'Osteosarcoma', false, 3),
  ('de265636-15af-5dd7-b407-4fd149ceecb2', '3c976094-697f-5a53-8749-c3b36e5d7400', 'E', 'Sinding-Larsen-Johansson syndrome', false, 4);

-- Q514
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('8b072eb5-5b1c-56c5-bc76-468fb6cb6174', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000016', 'sba', 'A 15 year old girl has had anterior knee pain when sitting for long periods and going downstairs. Examination is normal apart from pain around the kneecap. What is the SINGLE most likely diagnosis?', 'Patellofemoral pain is common in adolescents. The ''cinema sign'' is typical. Treatment: physiotherapy to strengthen quadriceps and hip muscles, activity modification.', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v6')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = '8b072eb5-5b1c-56c5-bc76-468fb6cb6174';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('08865455-34f4-5792-97a4-c988c40a1414', '8b072eb5-5b1c-56c5-bc76-468fb6cb6174', 'A', 'Septic arthritis', false, 0),
  ('1f9f152f-385b-526e-af53-dd58ac145bf6', '8b072eb5-5b1c-56c5-bc76-468fb6cb6174', 'B', 'Patellofemoral pain syndrome', true, 1),
  ('6464bdfb-e8df-5ecd-9922-2a2fb530b945', '8b072eb5-5b1c-56c5-bc76-468fb6cb6174', 'C', 'Meniscal tear', false, 2),
  ('ae78b680-843c-5c42-816d-1950860925d6', '8b072eb5-5b1c-56c5-bc76-468fb6cb6174', 'D', 'ACL tear', false, 3),
  ('11811e86-f6eb-5242-aaf3-08a3ec6f4ba3', '8b072eb5-5b1c-56c5-bc76-468fb6cb6174', 'E', 'Osteochondritis dissecans', false, 4);

-- Q515
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('09fa4376-f646-5efc-b21d-6e9ab447d9cc', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000016', 'sba', 'A 35 year old skier felt a pop in his knee while twisting. The knee swelled within 2 hours. Lachman''s test shows increased anterior translation. What is the SINGLE most likely diagnosis?', 'Rapid haemarthrosis after a twisting injury suggests ACL rupture (or fracture or patellar dislocation). Lachman''s test is the most sensitive. MRI confirms. Treatment: physiotherapy or reconstruction depending on activity and instability.', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v6')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = '09fa4376-f646-5efc-b21d-6e9ab447d9cc';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('de0af676-4d5d-5edc-9abc-b0a180a430e3', '09fa4376-f646-5efc-b21d-6e9ab447d9cc', 'A', 'Posterior cruciate ligament tear', false, 0),
  ('a2b997eb-900d-584c-8cb2-0b79a48e65e6', '09fa4376-f646-5efc-b21d-6e9ab447d9cc', 'B', 'Medial meniscal tear only', false, 1),
  ('ec3aa11c-6059-5dc1-aeab-0e56aa8d7992', '09fa4376-f646-5efc-b21d-6e9ab447d9cc', 'C', 'Patellar dislocation', false, 2),
  ('b9667f5b-7866-5379-92e6-efd46308b466', '09fa4376-f646-5efc-b21d-6e9ab447d9cc', 'D', 'Anterior cruciate ligament rupture', true, 3),
  ('ae1c542b-4e9e-5a5c-9c48-e8b9734ce501', '09fa4376-f646-5efc-b21d-6e9ab447d9cc', 'E', 'MCL sprain only', false, 4);

-- Q516
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('be5cabd4-9635-5530-b414-7c3e5700ef3a', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000016', 'sba', 'A 25 year old woman has had her knee give way. She felt the kneecap move to the outside and then go back. The knee is swollen and the medial patella is tender. Apprehension test is positive. What is the SINGLE most likely diagnosis?', 'Patellar dislocations are lateral, often in young women with ligamentous laxity. MPFL is torn. X-ray to exclude osteochondral fragments. Most are managed with physiotherapy; recurrent dislocation may need MPFL reconstruction.', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v6')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = 'be5cabd4-9635-5530-b414-7c3e5700ef3a';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('a8437c00-c85e-5f23-8254-65fbad986f45', 'be5cabd4-9635-5530-b414-7c3e5700ef3a', 'A', 'ACL tear', false, 0),
  ('9a755972-8f0d-5afd-ac10-1911ace11c18', 'be5cabd4-9635-5530-b414-7c3e5700ef3a', 'B', 'Meniscal tear', false, 1),
  ('148c744b-b1a2-50aa-b5cf-e665c3a384ec', 'be5cabd4-9635-5530-b414-7c3e5700ef3a', 'C', 'Fracture of the tibial plateau', false, 2),
  ('f444f4fe-1c2b-578e-89ad-3b9558ac5194', 'be5cabd4-9635-5530-b414-7c3e5700ef3a', 'D', 'Lateral patellar dislocation (now relocated)', true, 3),
  ('3705b355-db8f-57e0-a78e-5fe0ae774bb5', 'be5cabd4-9635-5530-b414-7c3e5700ef3a', 'E', 'Quadriceps tendon rupture', false, 4);

-- Q517
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('a6dca2b3-e2fa-5ad9-9f47-93d19c60b574', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000016', 'sba', 'A 70 year old man has had sudden inability to straighten his knee after stumbling. There is a gap above the patella. He takes ciprofloxacin. What is the SINGLE most likely diagnosis?', 'Quadriceps tendon ruptures occur in people over 40 with risk factors (quinolones, steroids, CKD, diabetes). The patella is low (patella baja). Patellar tendon ruptures occur in younger people with patella alta. Both need early surgical repair.', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v6')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = 'a6dca2b3-e2fa-5ad9-9f47-93d19c60b574';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('816eab3f-7691-5a86-b3d0-6fe434a782d6', 'a6dca2b3-e2fa-5ad9-9f47-93d19c60b574', 'A', 'ACL rupture', false, 0),
  ('210eba52-d965-5cfa-b074-8dbbcf26ab92', 'a6dca2b3-e2fa-5ad9-9f47-93d19c60b574', 'B', 'Patellar tendon rupture', false, 1),
  ('6aa86db7-1510-5753-8bc4-964cbece862b', 'a6dca2b3-e2fa-5ad9-9f47-93d19c60b574', 'C', 'Hamstring tear', false, 2),
  ('fc04805b-9516-5567-9aed-ec224f3b066e', 'a6dca2b3-e2fa-5ad9-9f47-93d19c60b574', 'D', 'Quadriceps tendon rupture', true, 3),
  ('11df591e-8b4c-5956-be41-0aa471990386', 'a6dca2b3-e2fa-5ad9-9f47-93d19c60b574', 'E', 'Patellar fracture', false, 4);

-- Q518
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('e44f84d1-94e3-568a-9746-595e26d9befe', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000016', 'sba', 'A 40 year old man fell and has a fracture of the proximal ulna with dislocation of the radial head. He cannot extend his fingers. What nerve is MOST likely injured?', 'Monteggia fractures can injure the posterior interosseous nerve (a branch of the radial nerve), causing finger drop without sensory loss. Wrist extension is often preserved.', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v6')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = 'e44f84d1-94e3-568a-9746-595e26d9befe';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('11dca3af-84aa-5849-a4fd-1de480019039', 'e44f84d1-94e3-568a-9746-595e26d9befe', 'A', 'Musculocutaneous nerve', false, 0),
  ('1bf10136-23cd-5ecc-a655-9baf6eb057bb', 'e44f84d1-94e3-568a-9746-595e26d9befe', 'B', 'Ulnar nerve', false, 1),
  ('ae5a0392-9695-546b-b9a8-15d145728059', 'e44f84d1-94e3-568a-9746-595e26d9befe', 'C', 'Axillary nerve', false, 2),
  ('5f3ca393-17fc-5f42-b3ed-e3b0ca1278c9', 'e44f84d1-94e3-568a-9746-595e26d9befe', 'D', 'Median nerve', false, 3),
  ('3a34a005-92d6-5fbd-a532-018d8473d7fb', 'e44f84d1-94e3-568a-9746-595e26d9befe', 'E', 'Posterior interosseous nerve', true, 4);

-- Q519
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('51d06d27-f339-506a-b023-e4f97863187a', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000016', 'sba', 'A 55 year old man was in a motorbike crash. He has a deformed, swollen thigh. BP is 95/60, HR 120. X-ray shows a femoral shaft fracture. What is the MOST important initial management?', 'Femoral shaft fractures can cause loss of 1-1.5 L of blood. Resuscitate, give analgesia (femoral nerve block), apply a traction splint and arrange early intramedullary nailing.', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v6')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = '51d06d27-f339-506a-b023-e4f97863187a';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('929d5114-9e52-5df5-ae14-226be3c8a1fd', '51d06d27-f339-506a-b023-e4f97863187a', 'A', 'Immediate intramedullary nailing before resuscitation', false, 0),
  ('0e4b929e-61e0-5e7f-9720-936af9823821', '51d06d27-f339-506a-b023-e4f97863187a', 'B', 'Physiotherapy', false, 1),
  ('937ba9eb-9508-5f95-8a8d-a500062d075c', '51d06d27-f339-506a-b023-e4f97863187a', 'C', 'ABCDE resuscitation with IV access and blood, and apply a traction splint', true, 2),
  ('7c4442f9-9643-5e25-8fcd-00999d55ef26', '51d06d27-f339-506a-b023-e4f97863187a', 'D', 'Discharge with crutches', false, 3),
  ('e885f64a-6095-573f-af82-7d3bee6b7a3c', '51d06d27-f339-506a-b023-e4f97863187a', 'E', 'Oral analgesia only', false, 4);

-- Q520
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('13d9f14f-243d-5323-89a3-efe3109b9db0', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000016', 'sba', 'A 25 year old woman was in a car crash. Pelvic X-ray shows an open-book pelvic fracture. She is hypotensive despite 2 units of blood. What is the SINGLE most appropriate immediate step?', 'Pelvic fractures can cause major haemorrhage. A pelvic binder reduces pelvic volume. Further control with angioembolisation or pre-peritoneal packing. Avoid repeated pelvic springing. Look for urethral injury before catheterisation.', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v6')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = '13d9f14f-243d-5323-89a3-efe3109b9db0';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('cff1a53e-445f-5738-a005-9c1cea267ac6', '13d9f14f-243d-5323-89a3-efe3109b9db0', 'A', 'Await CT before any treatment', false, 0),
  ('7b2cd2af-08f2-5e7f-9ab1-6b194a4baddd', '13d9f14f-243d-5323-89a3-efe3109b9db0', 'B', 'Pelvic examination with springing', false, 1),
  ('825c0320-4f5c-5dcd-800c-91f409bea3d3', '13d9f14f-243d-5323-89a3-efe3109b9db0', 'C', 'Urinary catheter immediately', false, 2),
  ('5214a3e3-32a2-57da-b55f-3800cb88c1db', '13d9f14f-243d-5323-89a3-efe3109b9db0', 'D', 'Physiotherapy', false, 3),
  ('7c00e93a-e6b9-59d5-895c-fc1f5b0cb9f2', '13d9f14f-243d-5323-89a3-efe3109b9db0', 'E', 'Apply a pelvic binder at the level of the greater trochanters and activate major haemorrhage protocol', true, 4);

-- Q521
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('0f67c617-051f-51df-8e01-1ad42adf943f', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000016', 'sba', 'A 65 year old woman has had a total knee replacement 2 years ago. She now has knee pain, swelling and a discharging sinus. CRP is raised. What is the SINGLE most likely diagnosis?', 'A sinus tract communicating with a prosthesis confirms infection. Do not start antibiotics before joint aspiration and tissue samples unless septic. Management: debridement and implant retention, or one- or two-stage revision.', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v6')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = '0f67c617-051f-51df-8e01-1ad42adf943f';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('a751bc6f-d718-591f-a636-90be496319fe', '0f67c617-051f-51df-8e01-1ad42adf943f', 'A', 'Prosthetic joint infection', true, 0),
  ('af62e64b-a94f-5cf9-be8b-e9d0227fba5c', '0f67c617-051f-51df-8e01-1ad42adf943f', 'B', 'Gout', false, 1),
  ('bc53e9dc-6f87-5e41-a4f6-6da33db7b716', '0f67c617-051f-51df-8e01-1ad42adf943f', 'C', 'DVT', false, 2),
  ('3c9dd70f-5703-5259-837e-837f4d05a61e', '0f67c617-051f-51df-8e01-1ad42adf943f', 'D', 'Osteoarthritis progression', false, 3),
  ('cb10390e-c413-5817-a3fc-c38f271fccc3', '0f67c617-051f-51df-8e01-1ad42adf943f', 'E', 'Aseptic loosening only', false, 4);

-- Q522
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('d3fb31d6-a449-58e1-9550-66ef12affb7f', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000031', 'sba', 'A 30 year old man has had a sudden, severe left testicular pain for 3 hours. The testis lies high with a horizontal lie and the cremasteric reflex is absent. What is the SINGLE most appropriate management?', 'Testicular torsion is a surgical emergency. Testicular salvage is best within 6 hours. Explore without imaging if suspected, detorting and fixing both testes (orchidopexy). Orchidectomy if non-viable.', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v6')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = 'd3fb31d6-a449-58e1-9550-66ef12affb7f';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('4b76cbad-92c2-5d0c-b823-e77fbe837498', 'd3fb31d6-a449-58e1-9550-66ef12affb7f', 'A', 'Elevation and NSAIDs', false, 0),
  ('fc0662c2-3e2d-5c69-9714-4b1196a9696f', 'd3fb31d6-a449-58e1-9550-66ef12affb7f', 'B', 'Analgesia and discharge', false, 1),
  ('a0ec13ec-70c6-5294-a25a-69eccecb5246', 'd3fb31d6-a449-58e1-9550-66ef12affb7f', 'C', 'Ultrasound and review in the morning', false, 2),
  ('99f7c18b-29ce-5675-bce2-256d59224fa0', 'd3fb31d6-a449-58e1-9550-66ef12affb7f', 'D', 'Antibiotics for epididymitis', false, 3),
  ('49810aec-cd49-5f72-ae96-7eb5bbe244a9', 'd3fb31d6-a449-58e1-9550-66ef12affb7f', 'E', 'Urgent scrotal exploration (do not delay for imaging)', true, 4);

-- Q523
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('b30b6c5d-32cd-55ea-8cf8-c2e8b21da8c9', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000031', 'sba', 'A 60 year old man has had difficulty passing urine after an inguinal hernia repair under general anaesthetic. His bladder is palpable. What is the SINGLE most appropriate management?', 'Post-operative urinary retention is common (anaesthesia, opioids, pain, prostate enlargement). Catheterise, then TWOC, often with an alpha-blocker.', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v6')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = 'b30b6c5d-32cd-55ea-8cf8-c2e8b21da8c9';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('e97d482f-2c14-57fb-b657-489bb0967256', 'b30b6c5d-32cd-55ea-8cf8-c2e8b21da8c9', 'A', 'Urethral catheterisation, then trial without catheter', true, 0),
  ('39469f6c-3e0c-5a77-8fc2-21557cc91b3d', 'b30b6c5d-32cd-55ea-8cf8-c2e8b21da8c9', 'B', 'Oral tamsulosin alone without catheter', false, 1),
  ('2f67140a-bf07-5f84-8fc6-4fee6b7b36ae', 'b30b6c5d-32cd-55ea-8cf8-c2e8b21da8c9', 'C', 'Wait 24 hours', false, 2),
  ('b016e943-ebf5-56d4-b380-ae9bd0ee3363', 'b30b6c5d-32cd-55ea-8cf8-c2e8b21da8c9', 'D', 'Suprapubic aspiration only', false, 3),
  ('273d8344-65fe-5e99-be8a-f43f9b196529', 'b30b6c5d-32cd-55ea-8cf8-c2e8b21da8c9', 'E', 'Furosemide', false, 4);

-- Q524
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('8c71e79f-d4b2-504f-87c9-0c40d5684d25', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000031', 'sba', 'A 68 year old man had low-risk localised prostate cancer (Gleason 3+3, PSA 6). He is fit and wants to avoid side effects. What is the SINGLE most appropriate management?', 'NICE NG131: active surveillance is offered to people with low-risk localised prostate cancer (CPG1). It involves regular PSA, MRI and biopsy, with treatment if progression.', null, true, true, jsonb_build_object('source', 'plab1-xlsx-v6', 'guidelines_text', 'NICE NG131')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = '8c71e79f-d4b2-504f-87c9-0c40d5684d25';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('0d47b949-4694-5eeb-a0cc-2e175eef6ad1', '8c71e79f-d4b2-504f-87c9-0c40d5684d25', 'A', 'Orchidectomy', false, 0),
  ('868bb24d-f495-5100-925f-70f254ec91c8', '8c71e79f-d4b2-504f-87c9-0c40d5684d25', 'B', 'Androgen deprivation therapy', false, 1),
  ('6dd803a8-fa66-5161-8101-f4a2dda2c6be', '8c71e79f-d4b2-504f-87c9-0c40d5684d25', 'C', 'Radical prostatectomy immediately', false, 2),
  ('12df26d8-8e28-508f-a40a-b6ddfa2fd59d', '8c71e79f-d4b2-504f-87c9-0c40d5684d25', 'D', 'Chemotherapy', false, 3),
  ('2fd84a5f-a711-5ec6-a149-43caa9d7aaeb', '8c71e79f-d4b2-504f-87c9-0c40d5684d25', 'E', 'Active surveillance', true, 4);

-- Q525
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('75acb82a-c03b-5c65-8680-caca2590d304', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000031', 'sba', 'A 70 year old man is starting androgen deprivation therapy (goserelin) for metastatic prostate cancer. What should be given at the start to prevent tumour flare?', 'LHRH agonists cause an initial testosterone surge (flare) which can worsen bone pain or cause spinal cord compression. Anti-androgen cover is given at the start. LHRH antagonists (degarelix) do not cause flare.', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v6')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = '75acb82a-c03b-5c65-8680-caca2590d304';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('0ddcaa51-8bb0-522d-bf44-156b90240ff1', '75acb82a-c03b-5c65-8680-caca2590d304', 'A', 'Finasteride', false, 0),
  ('5cbff78b-b428-5e58-b4b1-4357cd587cb9', '75acb82a-c03b-5c65-8680-caca2590d304', 'B', 'Testosterone', false, 1),
  ('5ebc55c5-88d4-5fb0-a3af-2b97dea9b27e', '75acb82a-c03b-5c65-8680-caca2590d304', 'C', 'An anti-androgen (e.g. bicalutamide) for the first few weeks', true, 2),
  ('7205c5d2-6240-5da6-9184-8c609fa17d06', '75acb82a-c03b-5c65-8680-caca2590d304', 'D', 'Tamsulosin', false, 3),
  ('2153bb7e-aa10-5228-819c-f0aea3721f34', '75acb82a-c03b-5c65-8680-caca2590d304', 'E', 'Allopurinol', false, 4);

-- Q526
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('5cd5c883-7757-5dbe-b11c-d2a0e5ad8191', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000031', 'sba', 'A 50 year old woman has had stress urinary incontinence. Pelvic floor muscle training for 3 months has not helped. She does not want surgery. What medication may be offered?', 'NICE NG123: duloxetine is a second-line option for stress incontinence if surgery is not wanted or suitable. Surgical options: colposuspension, autologous fascial sling, bulking agents. Mesh tapes are restricted.', null, true, true, jsonb_build_object('source', 'plab1-xlsx-v6', 'guidelines_text', 'NICE NG123')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = '5cd5c883-7757-5dbe-b11c-d2a0e5ad8191';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('3151cd2b-d807-5df2-8178-c03409bac09c', '5cd5c883-7757-5dbe-b11c-d2a0e5ad8191', 'A', 'Desmopressin', false, 0),
  ('d7baace1-94c5-5ed2-8789-325d54cedec6', '5cd5c883-7757-5dbe-b11c-d2a0e5ad8191', 'B', 'Oxybutynin', false, 1),
  ('09781cdc-314a-5f61-9a1f-1c64269d3dd3', '5cd5c883-7757-5dbe-b11c-d2a0e5ad8191', 'C', 'Duloxetine', true, 2),
  ('e0d5326d-daa9-537a-8e0c-e5739d7bbf57', '5cd5c883-7757-5dbe-b11c-d2a0e5ad8191', 'D', 'Mirabegron', false, 3),
  ('043d7010-ce81-5454-a994-6250faf1223a', '5cd5c883-7757-5dbe-b11c-d2a0e5ad8191', 'E', 'Tamsulosin', false, 4);

-- Q527
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('e32df246-0b13-51bf-b948-e30081690cf0', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000031', 'sba', 'A 35 year old man has had a heavy, dragging feeling in his scrotum. On standing, there is a soft mass above the testis that feels like a ''bag of worms'' and disappears on lying. What is the SINGLE most likely diagnosis?', 'Varicoceles are more common on the left (left testicular vein drains into the renal vein at a right angle). A sudden right-sided or non-reducing varicocele may suggest a renal or retroperitoneal mass. They may affect fertility.', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v6')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = 'e32df246-0b13-51bf-b948-e30081690cf0';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('7d7561c0-0b52-561d-bff0-1db45b4ad473', 'e32df246-0b13-51bf-b948-e30081690cf0', 'A', 'Varicocele', true, 0),
  ('ec92d77c-90c7-5305-b399-d8b609c11074', 'e32df246-0b13-51bf-b948-e30081690cf0', 'B', 'Hydrocele', false, 1),
  ('0aa20b24-aebd-50f8-b230-666031ef1ffe', 'e32df246-0b13-51bf-b948-e30081690cf0', 'C', 'Inguinal hernia', false, 2),
  ('f68e7afa-1cb3-518b-bb9d-06eb4de39d0d', 'e32df246-0b13-51bf-b948-e30081690cf0', 'D', 'Testicular cancer', false, 3),
  ('f2adfcac-4a07-5fc5-b422-280889e2e2a0', 'e32df246-0b13-51bf-b948-e30081690cf0', 'E', 'Epididymal cyst', false, 4);

-- Q528
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('a7ce434c-576a-55b2-b2bc-523480f8d0a9', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000031', 'sba', 'A 25 year old man has had a painful erection for 5 hours. He uses intracavernosal injections for erectile dysfunction. What is the SINGLE most appropriate management?', 'Ischaemic priapism lasting over 4 hours is an emergency. Causes: intracavernosal drugs, sickle cell disease, antipsychotics, trazodone. Aspirate and give phenylephrine; shunt surgery if unsuccessful.', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v6')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = 'a7ce434c-576a-55b2-b2bc-523480f8d0a9';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('628478c5-d4ac-5d30-8ad8-6caca081dd25', 'a7ce434c-576a-55b2-b2bc-523480f8d0a9', 'A', 'Oral sildenafil', false, 0),
  ('f25b0e76-799e-542a-8ce1-9ca2f89c8654', 'a7ce434c-576a-55b2-b2bc-523480f8d0a9', 'B', 'Ice packs only', false, 1),
  ('c1f7955b-91d2-5559-8361-f75d325be81e', 'a7ce434c-576a-55b2-b2bc-523480f8d0a9', 'C', 'Wait until it resolves', false, 2),
  ('fc1c7009-5771-5d00-a7ff-74b732066a7f', 'a7ce434c-576a-55b2-b2bc-523480f8d0a9', 'D', 'Aspiration of corpora cavernosa and intracavernosal phenylephrine (emergency)', true, 3),
  ('d258bc39-72c7-5d13-b802-90dec136ddfd', 'a7ce434c-576a-55b2-b2bc-523480f8d0a9', 'E', 'Discharge with analgesia', false, 4);

-- Q529
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('a4db1011-f11f-5474-915b-9b9685f5b03f', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000032', 'sba', 'A 55 year old man has had pain in his buttocks and thighs on walking, and erectile dysfunction. Femoral pulses are weak on both sides. What is the SINGLE most likely diagnosis?', 'Leriche syndrome is aortoiliac occlusion causing buttock claudication, impotence and absent femoral pulses. Investigation: duplex or CT angiography. Treatment: endovascular stenting or aortobifemoral bypass.', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v6')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = 'a4db1011-f11f-5474-915b-9b9685f5b03f';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('5a5e9af8-bc25-5964-97c5-32b9bd639919', 'a4db1011-f11f-5474-915b-9b9685f5b03f', 'A', 'Aortoiliac occlusive disease (Leriche syndrome)', true, 0),
  ('b7290d8e-b2c4-56e8-b6f4-e77b045872fb', 'a4db1011-f11f-5474-915b-9b9685f5b03f', 'B', 'Spinal stenosis', false, 1),
  ('11093e4c-618d-583e-9ec3-13439186efee', 'a4db1011-f11f-5474-915b-9b9685f5b03f', 'C', 'Hip OA', false, 2),
  ('b9299a99-1fee-5130-9bca-495668c880e7', 'a4db1011-f11f-5474-915b-9b9685f5b03f', 'D', 'Femoral artery stenosis only', false, 3),
  ('fe7fec1c-6247-561b-85d8-7d40747432a9', 'a4db1011-f11f-5474-915b-9b9685f5b03f', 'E', 'Popliteal entrapment', false, 4);

-- Q530
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('28094886-e7c7-531b-9002-89d53d73d66d', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000032', 'sba', 'A 25 year old male athlete has had calf pain on exercise. Pulses disappear on active plantar flexion. He has no vascular risk factors. What is the SINGLE most likely diagnosis?', 'Popliteal artery entrapment occurs when the gastrocnemius compresses the artery in young athletes. Pulses fall with plantar flexion against resistance. Treatment: surgical release.', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v6')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = '28094886-e7c7-531b-9002-89d53d73d66d';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('b1e3e1ef-fafd-5122-82fc-c01658f96c5a', '28094886-e7c7-531b-9002-89d53d73d66d', 'A', 'Achilles tendinopathy', false, 0),
  ('d2f6b003-b793-5e0e-b309-73aeca2a5f02', '28094886-e7c7-531b-9002-89d53d73d66d', 'B', 'DVT', false, 1),
  ('bc3bbd95-d8f8-5f0e-921e-4250162f8ae8', '28094886-e7c7-531b-9002-89d53d73d66d', 'C', 'Atherosclerotic PAD', false, 2),
  ('e07ed86d-0490-5ebe-86b8-bb78155860ac', '28094886-e7c7-531b-9002-89d53d73d66d', 'D', 'Popliteal artery entrapment syndrome', true, 3),
  ('a75e76d7-66b5-5d42-86b2-d3544434c518', '28094886-e7c7-531b-9002-89d53d73d66d', 'E', 'Chronic exertional compartment syndrome', false, 4);

-- Q531
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('b8f64754-b1b4-50ba-85f3-8c8ba5c11c59', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000032', 'sba', 'A 70 year old woman has a varicose vein that is bleeding heavily after a minor knock. What is the SINGLE most appropriate first aid?', 'Bleeding varicose veins can cause significant blood loss. Elevate and compress. NICE CG168 recommends referral to vascular services for bleeding varicose veins.', null, true, true, jsonb_build_object('source', 'plab1-xlsx-v6', 'guidelines_text', 'NICE CG168')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = 'b8f64754-b1b4-50ba-85f3-8c8ba5c11c59';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('69af5857-9bb1-5b38-b458-9d8e44308cc1', 'b8f64754-b1b4-50ba-85f3-8c8ba5c11c59', 'A', 'Apply heat', false, 0),
  ('bfb86ce9-646a-50ff-997e-00c96bca82e8', 'b8f64754-b1b4-50ba-85f3-8c8ba5c11c59', 'B', 'Lie down, elevate the leg and apply direct pressure, then refer to vascular services', true, 1),
  ('6526afa9-d101-50f2-a381-5d26b9b164b3', 'b8f64754-b1b4-50ba-85f3-8c8ba5c11c59', 'C', 'Apply a tourniquet above the knee', false, 2),
  ('1df9a33e-f5eb-5afe-8915-ec3c8768e892', 'b8f64754-b1b4-50ba-85f3-8c8ba5c11c59', 'D', 'Ignore it', false, 3),
  ('e8c4f482-46ff-5a74-acaa-3a4ebbacd592', 'b8f64754-b1b4-50ba-85f3-8c8ba5c11c59', 'E', 'Stand up and walk', false, 4);

-- Q532
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('5cf1f30a-d888-53d6-8947-e5d88d7731c9', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000032', 'sba', 'A 60 year old man had an EVAR for AAA 2 years ago. Surveillance CT shows contrast outside the graft but within the aneurysm sac, from a lumbar artery. The sac is not growing. What is this called?', 'Endoleaks are blood flow within the sac outside the graft. Type I (seal failure) and III (graft defect) need urgent repair. Type II (branch backflow) is commonest and often monitored if the sac is stable.', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v6')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = '5cf1f30a-d888-53d6-8947-e5d88d7731c9';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('749e5454-48e5-5c7e-996c-ec114d7c0273', '5cf1f30a-d888-53d6-8947-e5d88d7731c9', 'A', 'Type III endoleak', false, 0),
  ('32e0aad5-5f9b-5665-9a8e-ff92608f9082', '5cf1f30a-d888-53d6-8947-e5d88d7731c9', 'B', 'Rupture', false, 1),
  ('dc2040b4-01c5-5120-99f4-1b956954031d', '5cf1f30a-d888-53d6-8947-e5d88d7731c9', 'C', 'Type II endoleak', true, 2),
  ('1f2dd0a2-21ed-5286-98d2-ca5cf90010e2', '5cf1f30a-d888-53d6-8947-e5d88d7731c9', 'D', 'Graft infection', false, 3),
  ('2bccd4d0-f170-52fa-9d18-4ed56fd21e19', '5cf1f30a-d888-53d6-8947-e5d88d7731c9', 'E', 'Type I endoleak', false, 4);

-- Q533
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('fb34b95a-5143-54a1-982a-46c54704fb44', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000032', 'sba', 'A 50 year old diabetic man has a deep ulcer on the sole of his foot. X-ray shows bone erosion under the ulcer. Probe-to-bone test is positive. What is the SINGLE most likely diagnosis?', 'Probe-to-bone is a useful test for osteomyelitis. MRI if uncertain. Treat with prolonged antibiotics guided by bone samples and refer to the multidisciplinary foot team. Surgery may be needed.', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v6')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = 'fb34b95a-5143-54a1-982a-46c54704fb44';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('e8f6b2f8-29d5-5b71-bd59-3cab91623f22', 'fb34b95a-5143-54a1-982a-46c54704fb44', 'A', 'Diabetic foot osteomyelitis', true, 0),
  ('fd743d29-5a4c-5aca-bed0-6f131761c354', 'fb34b95a-5143-54a1-982a-46c54704fb44', 'B', 'Cellulitis only', false, 1),
  ('642a8158-7468-547a-8ab9-e03c584bcda4', 'fb34b95a-5143-54a1-982a-46c54704fb44', 'C', 'Charcot foot only', false, 2),
  ('81c2ab67-05c9-53ff-9672-b211debe1667', 'fb34b95a-5143-54a1-982a-46c54704fb44', 'D', 'Venous ulcer', false, 3),
  ('38656c92-6162-5389-9113-e76ca9395518', 'fb34b95a-5143-54a1-982a-46c54704fb44', 'E', 'Gout', false, 4);

-- Q534
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('c090f8d1-3d50-5598-94b9-7485372347d4', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000032', 'sba', 'A 55 year old diabetic woman has a hot, swollen, red foot with no ulcer and no fever. Her foot is 3 °C warmer than the other. X-ray is normal. What is the SINGLE most appropriate management?', 'Acute Charcot foot mimics cellulitis or gout. X-rays may be normal early. Prompt offloading (total contact cast) prevents collapse (rocker-bottom deformity).', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v6')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = 'c090f8d1-3d50-5598-94b9-7485372347d4';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('b9206b12-5678-5b6d-87e4-174acb71f828', 'c090f8d1-3d50-5598-94b9-7485372347d4', 'A', 'NSAIDs and discharge', false, 0),
  ('0ee060e1-5516-5480-8aae-29001e24b5d2', 'c090f8d1-3d50-5598-94b9-7485372347d4', 'B', 'Antibiotics for cellulitis', false, 1),
  ('5fffd1bd-304b-5049-a2b9-d9254f458221', 'c090f8d1-3d50-5598-94b9-7485372347d4', 'C', 'Elevation only', false, 2),
  ('34895e47-1aed-5acd-9bf2-1c13c03106f1', 'c090f8d1-3d50-5598-94b9-7485372347d4', 'D', 'Walk normally', false, 3),
  ('ee8dd3b6-584a-5111-b980-f7ed1b602c10', 'c090f8d1-3d50-5598-94b9-7485372347d4', 'E', 'Suspect active Charcot neuroarthropathy; offload in a non-removable cast and refer urgently to the foot team (MRI)', true, 4);

-- Q535
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('f3eea1de-edf8-5764-989a-bd930a83a531', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000037', 'sba', 'A 35 year old man has had pain and swelling in his jaw. He cannot open his mouth fully. He has a partially erupted lower wisdom tooth with swollen, inflamed gum over it. What is the SINGLE most likely diagnosis?', 'Pericoronitis is inflammation around a partially erupted tooth, usually the lower third molar. Treatment: irrigation, chlorhexidine mouthwash, analgesia, metronidazole if systemic features, then dental review. Extraction for recurrent episodes.', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v6')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = 'f3eea1de-edf8-5764-989a-bd930a83a531';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('bc40bbad-da68-5b8d-9dd1-dc674f64bb4e', 'f3eea1de-edf8-5764-989a-bd930a83a531', 'A', 'Tonsillitis', false, 0),
  ('b60060d3-ac60-5880-be55-063e66cc4e77', 'f3eea1de-edf8-5764-989a-bd930a83a531', 'B', 'Ludwig''s angina', false, 1),
  ('106cc6fe-c6f3-55b8-8326-6a694f16ee8c', 'f3eea1de-edf8-5764-989a-bd930a83a531', 'C', 'Mumps', false, 2),
  ('e959163c-81da-5c35-83ab-d8693eee52f8', 'f3eea1de-edf8-5764-989a-bd930a83a531', 'D', 'Pericoronitis', true, 3),
  ('f5777e32-c864-5515-bed8-ccaabd52cb1d', 'f3eea1de-edf8-5764-989a-bd930a83a531', 'E', 'TMJ dislocation', false, 4);

-- Q536
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('b5a0dcba-7c9f-56c8-9942-227024d25e09', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000037', 'sba', 'A 30 year old woman has had clicking of her jaw and pain in front of her ear, worse in the morning. She grinds her teeth. Examination shows tender muscles of mastication. What is the SINGLE most appropriate management?', 'Temporomandibular disorder is common and related to bruxism and stress. Most improve with conservative management. Refer if persistent or with trismus or red flags.', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v6')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = 'b5a0dcba-7c9f-56c8-9942-227024d25e09';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('1d844440-76c1-5550-b8f2-db522feec386', 'b5a0dcba-7c9f-56c8-9942-227024d25e09', 'A', 'Surgery', false, 0),
  ('4863f2c8-e9a2-5334-abf1-d63d2d94645e', 'b5a0dcba-7c9f-56c8-9942-227024d25e09', 'B', 'Antibiotics', false, 1),
  ('48e03451-7bce-5e14-808f-d5e1a24be073', 'b5a0dcba-7c9f-56c8-9942-227024d25e09', 'C', 'Steroid tablets', false, 2),
  ('1dac0cfe-702f-57b9-949a-30729267c4df', 'b5a0dcba-7c9f-56c8-9942-227024d25e09', 'D', 'Reassurance, soft diet, NSAIDs, jaw exercises and a night bite guard', true, 3),
  ('f986a077-f81a-552f-9fe7-c1f752fc3d8f', 'b5a0dcba-7c9f-56c8-9942-227024d25e09', 'E', 'Tooth extraction', false, 4);

-- Q537
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('46d6f7c9-829f-5b2f-b927-52324251f7b3', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000037', 'sba', 'A 60 year old man has had a painless lump in his parotid gland for 3 years. It is firm, mobile, and the facial nerve is normal. What is the SINGLE most likely diagnosis?', 'Pleomorphic adenoma is the most common salivary gland tumour. It is benign but can recur and rarely turn malignant. Treatment: superficial parotidectomy. Facial nerve palsy suggests malignancy.', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v6')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = '46d6f7c9-829f-5b2f-b927-52324251f7b3';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('a13712b7-c0bd-597f-8e08-1a355b5c347f', '46d6f7c9-829f-5b2f-b927-52324251f7b3', 'A', 'Warthin''s tumour', false, 0),
  ('b644c9ed-af77-55a3-8e08-6bd5f6a3245c', '46d6f7c9-829f-5b2f-b927-52324251f7b3', 'B', 'Mucoepidermoid carcinoma', false, 1),
  ('4bd48844-24c7-5f36-a82f-850a86f062bf', '46d6f7c9-829f-5b2f-b927-52324251f7b3', 'C', 'Parotid stone', false, 2),
  ('b35a83a6-f2cf-5a97-a8a5-ce59059296dc', '46d6f7c9-829f-5b2f-b927-52324251f7b3', 'D', 'Pleomorphic adenoma', true, 3),
  ('e6d9e620-009d-51c7-9b4b-8fc0e7fa8c31', '46d6f7c9-829f-5b2f-b927-52324251f7b3', 'E', 'Mumps', false, 4);

-- Q538
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('0c52cf7b-d2ff-5ca7-a569-2a6efb6dc218', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000037', 'sba', 'A 70 year old woman has had a painful parotid lump and a facial droop on the same side over 2 months. What is the SINGLE most appropriate next step?', 'A parotid lump with facial nerve weakness strongly suggests malignancy (e.g. adenoid cystic or mucoepidermoid carcinoma). Adenoid cystic carcinoma spreads along nerves.', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v6')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = '0c52cf7b-d2ff-5ca7-a569-2a6efb6dc218';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('6efe25ae-f282-56ed-970f-09c77fdc4807', '0c52cf7b-d2ff-5ca7-a569-2a6efb6dc218', 'A', 'Steroids for Bell''s palsy', false, 0),
  ('dc11ec49-c71d-5af1-9a91-fa5649555bae', '0c52cf7b-d2ff-5ca7-a569-2a6efb6dc218', 'B', 'Antibiotics', false, 1),
  ('0ead1d24-a28a-5eb6-b94f-920e48e777f7', '0c52cf7b-d2ff-5ca7-a569-2a6efb6dc218', 'C', 'Urgent referral (suspected parotid malignancy) for ultrasound-guided biopsy and MRI', true, 2),
  ('6362759f-783a-5521-866d-259b2781bab5', '0c52cf7b-d2ff-5ca7-a569-2a6efb6dc218', 'D', 'Dental review', false, 3),
  ('d93fc13a-0413-5d6d-ae28-da0e7ed44d83', '0c52cf7b-d2ff-5ca7-a569-2a6efb6dc218', 'E', 'Reassure', false, 4);

-- Q539
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('2d640cca-1a29-5c89-9cf9-af70cfb163d3', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000037', 'sba', 'A 45 year old woman has had bilateral salivary gland swelling, dry eyes and dry mouth. What test is MOST helpful to diagnose the underlying condition?', 'Sjögren''s syndrome: dry eyes and mouth, salivary swelling. Anti-Ro and anti-La are typical; Schirmer''s test and lip biopsy help. Risk of lymphoma (MALT) is increased.', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v6')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = '2d640cca-1a29-5c89-9cf9-af70cfb163d3';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('94bb5177-1b19-5ba4-8cb4-ff82b141ba50', '2d640cca-1a29-5c89-9cf9-af70cfb163d3', 'A', 'Anti-dsDNA only', false, 0),
  ('dc582f89-2f6d-5d9c-a383-5462289ababe', '2d640cca-1a29-5c89-9cf9-af70cfb163d3', 'B', 'ANCA', false, 1),
  ('58a140d7-0466-5a2e-a3fa-eb828be891c2', '2d640cca-1a29-5c89-9cf9-af70cfb163d3', 'C', 'Anti-CCP', false, 2),
  ('c87bf562-2027-54fb-9a6c-9e60f71650cf', '2d640cca-1a29-5c89-9cf9-af70cfb163d3', 'D', 'Anti-Ro and anti-La antibodies (Sjögren''s syndrome)', true, 3),
  ('11e12dbd-aaa0-57e0-b15a-1e98954883f2', '2d640cca-1a29-5c89-9cf9-af70cfb163d3', 'E', 'HLA-B27', false, 4);

-- Q540
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('946d4801-018f-52ef-9171-5460b0300d9f', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000037', 'sba', 'A 20 year old man has had a punch to his eye. He has diplopia on upward gaze, nausea and bradycardia when he tries to look up. CT shows an orbital floor fracture with trapped inferior rectus. What is the SINGLE most appropriate management?', '''White-eyed'' blowout fractures in young people with muscle entrapment cause the oculocardiac reflex (bradycardia, nausea). They need urgent release to prevent muscle ischaemia. Advise not to blow the nose.', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v6')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = '946d4801-018f-52ef-9171-5460b0300d9f';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('ff928ae2-ee4d-5ac9-883c-bb50817dccdf', '946d4801-018f-52ef-9171-5460b0300d9f', 'A', 'Wait for swelling to settle over 2 weeks', false, 0),
  ('29d87df3-c49e-565d-b508-b516e89b616b', '946d4801-018f-52ef-9171-5460b0300d9f', 'B', 'Discharge', false, 1),
  ('935d1075-4460-5985-afca-fc95df747b9d', '946d4801-018f-52ef-9171-5460b0300d9f', 'C', 'Nose blowing to clear sinuses', false, 2),
  ('c78552ad-9167-5642-8f7a-fe115a324d88', '946d4801-018f-52ef-9171-5460b0300d9f', 'D', 'Urgent surgical release (trapdoor fracture with muscle entrapment)', true, 3),
  ('7d52b822-141c-5278-b991-dd4c71bffc4d', '946d4801-018f-52ef-9171-5460b0300d9f', 'E', 'Antibiotics only', false, 4);

-- Q541
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('fa84812a-b519-54c9-b096-7ab545f2ff7f', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000037', 'sba', 'A 55 year old man has had a white patch on his buccal mucosa that cannot be rubbed off. He smokes. What is the SINGLE most appropriate management?', 'Leukoplakia is a white patch that cannot be rubbed off and is not attributable to another condition. It can contain dysplasia. Erythroplakia has a higher malignant risk. Stop smoking and refer for biopsy.', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v6')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = 'fa84812a-b519-54c9-b096-7ab545f2ff7f';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('c830f717-fe15-583e-b441-98d8e59f001e', 'fa84812a-b519-54c9-b096-7ab545f2ff7f', 'A', 'Chlorhexidine only', false, 0),
  ('434a84c5-948e-5ba9-94f1-ef9c0d1adf7c', 'fa84812a-b519-54c9-b096-7ab545f2ff7f', 'B', 'Antifungal treatment and no follow-up', false, 1),
  ('da03bbc3-dc96-5f6c-b405-a38d9a5abfe4', 'fa84812a-b519-54c9-b096-7ab545f2ff7f', 'C', 'Refer for biopsy (leukoplakia is potentially malignant)', true, 2),
  ('6d06fa16-342c-5f58-a564-2e10d700c4bd', 'fa84812a-b519-54c9-b096-7ab545f2ff7f', 'D', 'Reassure', false, 3),
  ('7cdfdf4c-a057-59b0-9123-75091be874e4', 'fa84812a-b519-54c9-b096-7ab545f2ff7f', 'E', 'Antibiotics', false, 4);

-- Q542
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('6ec2819d-7d12-5989-84b7-d1e6d666281d', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000028', 'sba', 'A ward team wants to test a new handover tool. They try it on one shift, measure, review and adapt it. What QI method is this?', 'PDSA cycles test small changes quickly and iteratively. Multiple cycles refine an intervention before wider rollout. Data are often displayed on run charts.', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v6')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = '6ec2819d-7d12-5989-84b7-d1e6d666281d';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('cddb57ba-d827-5e6e-a162-c8f5abc96e2e', '6ec2819d-7d12-5989-84b7-d1e6d666281d', 'A', 'Root cause analysis', false, 0),
  ('c64e1532-5298-5a6a-9cfd-bc8133ad68f0', '6ec2819d-7d12-5989-84b7-d1e6d666281d', 'B', 'Plan-Do-Study-Act (PDSA) cycle', true, 1),
  ('9d0b8f8d-df64-5883-b1bf-18baa8cccaa8', '6ec2819d-7d12-5989-84b7-d1e6d666281d', 'C', 'Pareto analysis', false, 2),
  ('905b8459-186a-5f6e-9e09-58378be5c8ac', '6ec2819d-7d12-5989-84b7-d1e6d666281d', 'D', 'Randomised controlled trial', false, 3),
  ('3ce4425c-97dc-52e4-8683-3f3a6110dfc6', '6ec2819d-7d12-5989-84b7-d1e6d666281d', 'E', 'Clinical audit', false, 4);

-- Q543
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('b5e937d0-32ba-55c5-9e22-3ea35ecd093c', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000028', 'sba', 'A run chart shows 6 consecutive points above the median after a QI change. What does this suggest?', 'Run chart rules: a shift is 6 or more consecutive points on one side of the median; a trend is 5 or more consecutive rising or falling points. These signal non-random variation.', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v6')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = 'b5e937d0-32ba-55c5-9e22-3ea35ecd093c';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('e5b4b4a4-123a-5e74-9a50-4f107ad21df4', 'b5e937d0-32ba-55c5-9e22-3ea35ecd093c', 'A', 'Random variation only', false, 0),
  ('6b714c37-92da-5726-b89f-be9db09672e3', 'b5e937d0-32ba-55c5-9e22-3ea35ecd093c', 'B', 'A data error', false, 1),
  ('6ccb9da7-9011-59e6-9b05-e0b87501c608', 'b5e937d0-32ba-55c5-9e22-3ea35ecd093c', 'C', 'The change has failed', false, 2),
  ('af212151-6e8c-52e8-8bb3-0af534bd163e', 'b5e937d0-32ba-55c5-9e22-3ea35ecd093c', 'D', 'Nothing can be concluded', false, 3),
  ('3173535e-c706-5473-b1f9-9590207bd3d0', 'b5e937d0-32ba-55c5-9e22-3ea35ecd093c', 'E', 'A shift (a non-random signal that the change may have had an effect)', true, 4);

-- Q544
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('01a1f5f9-26e6-5a0b-8f0a-4343803c3a7d', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000028', 'sba', 'A hospital audit compares current practice against a standard. What is the KEY difference between audit and research?', 'Clinical audit cycle: choose a standard, collect data, compare, implement change and re-audit. Research usually requires ethics approval; audit generally does not.', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v6')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = '01a1f5f9-26e6-5a0b-8f0a-4343803c3a7d';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('d37fa1c5-b7ba-5532-a96d-eccab4922bd9', '01a1f5f9-26e6-5a0b-8f0a-4343803c3a7d', 'A', 'Audit measures practice against an existing standard; research generates new knowledge', true, 0),
  ('5f1c1c3a-7865-5059-9024-6c781afdd719', '01a1f5f9-26e6-5a0b-8f0a-4343803c3a7d', 'B', 'Research does not need consent', false, 1),
  ('8d1e9c80-1cdd-526b-8d24-dafb599ab9fc', '01a1f5f9-26e6-5a0b-8f0a-4343803c3a7d', 'C', 'They are the same', false, 2),
  ('99fbd2ef-b8cf-5c69-9447-10378841306d', '01a1f5f9-26e6-5a0b-8f0a-4343803c3a7d', 'D', 'Audit tests new treatments', false, 3),
  ('c9b53d7a-52b3-5f08-9035-858bd8977205', '01a1f5f9-26e6-5a0b-8f0a-4343803c3a7d', 'E', 'Audit always needs ethics approval', false, 4);

-- Q545
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('6552ef00-2110-507e-82e0-2ac076c20f03', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000028', 'sba', 'A nurse notices that the name on a patient''s wristband does not match the drug chart before giving a drug. She stops and checks. What is this an example of?', 'Near misses should be reported (e.g. via Datix) to learn and prevent future harm. Positive patient identification uses at least name, date of birth and hospital number.', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v6')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = '6552ef00-2110-507e-82e0-2ac076c20f03';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('2b666fdd-95c7-5ef5-9f9e-d42e752280ae', '6552ef00-2110-507e-82e0-2ac076c20f03', 'A', 'A near miss (an error caught before reaching the patient)', true, 0),
  ('7d0d6e9d-b314-5c0d-b3ad-69a9686f5b16', '6552ef00-2110-507e-82e0-2ac076c20f03', 'B', 'An adverse event causing harm', false, 1),
  ('e43c69fd-6582-5680-9a1c-24955d9e0fd0', '6552ef00-2110-507e-82e0-2ac076c20f03', 'C', 'A complaint', false, 2),
  ('1cc3559d-d99a-509e-8eb0-2892f11d433d', '6552ef00-2110-507e-82e0-2ac076c20f03', 'D', 'A serious incident', false, 3),
  ('6c4b14ab-ab0b-52fe-95b6-855ceea8649e', '6552ef00-2110-507e-82e0-2ac076c20f03', 'E', 'A never event', false, 4);

-- Q546
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('bafaeef6-3f29-550f-9929-85c5bae1dddb', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000028', 'sba', 'A surgeon operated on the wrong knee. What type of incident is this?', 'Never events are serious, preventable incidents that should not happen if safety measures are followed, such as wrong-site surgery, retained foreign objects and wrong-route medication. They are investigated under the Patient Safety Incident Response Framework.', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v6')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = 'bafaeef6-3f29-550f-9929-85c5bae1dddb';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('bdc4c95a-4ce4-570f-80b0-ad537bf886c6', 'bafaeef6-3f29-550f-9929-85c5bae1dddb', 'A', 'An expected complication', false, 0),
  ('6e021aa4-7510-5c7d-bd70-9c7c874d983b', 'bafaeef6-3f29-550f-9929-85c5bae1dddb', 'B', 'A near miss', false, 1),
  ('768a1ef4-cb83-53ab-9beb-806dc5e8a91a', 'bafaeef6-3f29-550f-9929-85c5bae1dddb', 'C', 'A never event', true, 2),
  ('7c7f11cb-0a46-5c95-bb0d-474ae32cd572', 'bafaeef6-3f29-550f-9929-85c5bae1dddb', 'D', 'A minor incident', false, 3),
  ('c451b5c7-c04c-57dd-94db-9d0221ddf2e6', 'bafaeef6-3f29-550f-9929-85c5bae1dddb', 'E', 'A complaint only', false, 4);

-- Q547
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('44966309-1b93-586b-9cd3-2036b4405476', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000028', 'sba', 'A team is reviewing a serious incident. The review focuses on the system rather than blaming individuals. What is the UK framework for responding to patient safety incidents?', 'PSIRF replaced the Serious Incident Framework in England. It focuses on learning, system-based approaches (e.g. SEIPS) and involving patients and staff.', null, true, true, jsonb_build_object('source', 'plab1-xlsx-v6')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = '44966309-1b93-586b-9cd3-2036b4405476';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('7ccf034e-d766-5c0d-a85e-03b18ba83d75', '44966309-1b93-586b-9cd3-2036b4405476', 'A', 'Duty of candour only', false, 0),
  ('cd37e34e-c209-593d-bff6-76d3b99cc766', '44966309-1b93-586b-9cd3-2036b4405476', 'B', 'Bolam test', false, 1),
  ('fd1a7b56-344e-51b0-a320-88ba7fdb4db5', '44966309-1b93-586b-9cd3-2036b4405476', 'C', 'Mental Capacity Act', false, 2),
  ('61de4ea5-4892-58f8-8bc4-084f5b91d049', '44966309-1b93-586b-9cd3-2036b4405476', 'D', 'Patient Safety Incident Response Framework (PSIRF)', true, 3),
  ('9301f17d-ef2e-5c4d-a19c-34cabc050459', '44966309-1b93-586b-9cd3-2036b4405476', 'E', 'Caldicott principles', false, 4);

-- Q548
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('b64e3e38-8c19-56d8-8e05-821b48bed432', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000028', 'sba', 'A doctor is interrupted 6 times while writing a drug chart. Which practice reduces interruption-related errors?', 'Interruptions increase errors in medication prescribing and administration. Strategies include protected time, tabards and quiet zones.', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v6')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = 'b64e3e38-8c19-56d8-8e05-821b48bed432';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('fb697478-73fc-59e3-bccb-db0458b67294', 'b64e3e38-8c19-56d8-8e05-821b48bed432', 'A', 'Multitasking', false, 0),
  ('633e7d7a-059d-5346-a5aa-5a9aea242b83', 'b64e3e38-8c19-56d8-8e05-821b48bed432', 'B', 'Ignoring checklists', false, 1),
  ('46f9da12-936f-5413-a4f8-50e396ca54c1', 'b64e3e38-8c19-56d8-8e05-821b48bed432', 'C', 'Writing from memory', false, 2),
  ('f6615db4-84d3-56a1-bdb2-befb9d567681', 'b64e3e38-8c19-56d8-8e05-821b48bed432', 'D', 'Working faster', false, 3),
  ('94d638e2-09f1-5e17-8db0-fbd2660b84cd', 'b64e3e38-8c19-56d8-8e05-821b48bed432', 'E', '''Do not disturb'' tabards or protected time during high-risk tasks such as drug rounds', true, 4);

-- Q549
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('e748ee29-7c5f-52dc-b7f9-b5a15abfe77f', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000028', 'sba', 'A ward bay is being reorganised so that equipment is stored in the same place in every bay. Which human factors principle is applied?', 'Standardising equipment, layouts and processes makes errors less likely. Other human factors tools: forcing functions, checklists and design that makes the right action easy.', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v6')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = 'e748ee29-7c5f-52dc-b7f9-b5a15abfe77f';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('55b1aa16-87b1-5c44-bf5d-9a30e9a3028e', 'e748ee29-7c5f-52dc-b7f9-b5a15abfe77f', 'A', 'Blame culture', false, 0),
  ('259a74f0-eb27-5aee-a31c-238f05f0e26e', 'e748ee29-7c5f-52dc-b7f9-b5a15abfe77f', 'B', 'Variety improves safety', false, 1),
  ('1c6a73bf-b83c-5652-93fb-b7ae506d7527', 'e748ee29-7c5f-52dc-b7f9-b5a15abfe77f', 'C', 'Personal preference', false, 2),
  ('430af5d3-60ad-5098-bb4a-6c5ff88ec75c', 'e748ee29-7c5f-52dc-b7f9-b5a15abfe77f', 'D', 'Hierarchy', false, 3),
  ('e550a2bc-0cf6-5904-9f81-73a826d18a97', 'e748ee29-7c5f-52dc-b7f9-b5a15abfe77f', 'E', 'Standardisation reduces cognitive load and error', true, 4);

-- Q550
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('ca5953c9-e8e7-582e-baf2-f76debd096e9', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000028', 'sba', 'Oral syringes that cannot connect to IV lines have been introduced. What type of safety measure is this?', 'Forcing functions are the strongest error prevention (hierarchy of controls), followed by automation, standardisation, checklists and training. Education alone is weakest.', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v6')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = 'ca5953c9-e8e7-582e-baf2-f76debd096e9';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('dc0805d3-84c8-54c8-8fee-6e09b3173adf', 'ca5953c9-e8e7-582e-baf2-f76debd096e9', 'A', 'Training', false, 0),
  ('6fa1ae93-fe28-5336-a028-3178ad9f2255', 'ca5953c9-e8e7-582e-baf2-f76debd096e9', 'B', 'A forcing function (design that makes the error impossible)', true, 1),
  ('60bf680b-cb89-508f-b944-ffa23a15214a', 'ca5953c9-e8e7-582e-baf2-f76debd096e9', 'C', 'A warning label', false, 2),
  ('186fe909-9595-5779-b520-e1892d934910', 'ca5953c9-e8e7-582e-baf2-f76debd096e9', 'D', 'An audit', false, 3),
  ('5cb9d188-8512-5acc-a82b-a3f58a9ee7e1', 'ca5953c9-e8e7-582e-baf2-f76debd096e9', 'E', 'A policy', false, 4);

-- Q551
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('51181275-b17f-53d8-b483-504664863253', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000028', 'sba', 'A foundation doctor is struggling with workload and feels burnt out. What is the MOST appropriate action?', 'GMC Good Medical Practice: doctors should look after their own health and seek help. Do not self-prescribe. NHS Practitioner Health supports doctors with mental health problems.', null, true, true, jsonb_build_object('source', 'plab1-xlsx-v6', 'guidelines_text', 'GMC')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = '51181275-b17f-53d8-b483-504664863253';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('4eb9df92-9895-520d-9d82-08698294bc63', '51181275-b17f-53d8-b483-504664863253', 'A', 'Take sleeping tablets', false, 0),
  ('321d9d06-b6e5-5086-a955-f9d2bd5cd748', '51181275-b17f-53d8-b483-504664863253', 'B', 'Speak to their educational or clinical supervisor and seek support (occupational health, GP, practitioner health)', true, 1),
  ('cd348557-922d-5116-87ae-15634c0360b5', '51181275-b17f-53d8-b483-504664863253', 'C', 'Resign immediately', false, 2),
  ('31b2cdec-604f-5c08-8534-cde050e274e4', '51181275-b17f-53d8-b483-504664863253', 'D', 'Keep quiet', false, 3),
  ('dc1bc203-129e-5e81-aa74-703455f2582c', '51181275-b17f-53d8-b483-504664863253', 'E', 'Self-prescribe antidepressants', false, 4);

-- Q552
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('c8b04c8b-9985-55a1-b956-465624c1bf4b', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000028', 'sba', 'A theatre team uses ''stop moments'' during an operation to share the plan and concerns. Which non-technical skill does this support?', 'Non-technical skills include situational awareness, decision-making, communication, teamwork and leadership. Briefings, debriefs and pauses keep the team aligned.', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v6')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = 'c8b04c8b-9985-55a1-b956-465624c1bf4b';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('b6875f8c-8eff-527a-ad39-dd16e273b2b0', 'c8b04c8b-9985-55a1-b956-465624c1bf4b', 'A', 'Speed', false, 0),
  ('22f29f68-ea70-5e6e-9332-283932a8568b', 'c8b04c8b-9985-55a1-b956-465624c1bf4b', 'B', 'Technical dexterity', false, 1),
  ('16064803-0b2d-5fd4-95c8-ec4cfa50818d', 'c8b04c8b-9985-55a1-b956-465624c1bf4b', 'C', 'Situational awareness and shared mental model', true, 2),
  ('a2f297f4-7679-50ab-adaf-80516381c9a5', 'c8b04c8b-9985-55a1-b956-465624c1bf4b', 'D', 'Hierarchy', false, 3),
  ('778768bd-5e95-5b79-a6e0-a182f72d221e', 'c8b04c8b-9985-55a1-b956-465624c1bf4b', 'E', 'Blame', false, 4);

-- Q553
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('3d1a7e8d-839e-50ae-bb14-9a5c1c202187', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000022', 'sba', 'A 45 year old woman has had a pale, crusting, scaly rash on her nipple that started at the nipple and spread to the areola. It does not respond to steroid cream. What is the SINGLE most likely diagnosis?', 'Paget''s disease of the nipple starts on the nipple (eczema usually starts on the areola). It is associated with underlying DCIS or invasive cancer. Refer urgently for imaging and punch biopsy.', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v6')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = '3d1a7e8d-839e-50ae-bb14-9a5c1c202187';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('f1843cf1-3e48-5191-b407-1abb3bbd9373', '3d1a7e8d-839e-50ae-bb14-9a5c1c202187', 'A', 'Eczema of the areola', false, 0),
  ('46aa1fbb-1de3-5c79-8bdf-c559e1839d7e', '3d1a7e8d-839e-50ae-bb14-9a5c1c202187', 'B', 'Fungal infection', false, 1),
  ('49cf513a-a23a-57ed-8f1d-5f2bac6a5eab', '3d1a7e8d-839e-50ae-bb14-9a5c1c202187', 'C', 'Paget''s disease of the nipple', true, 2),
  ('f1c409ac-9568-543a-b938-7d358fb49270', '3d1a7e8d-839e-50ae-bb14-9a5c1c202187', 'D', 'Nipple adenoma', false, 3),
  ('cddf8061-dd66-53bd-ba70-4c727aeb7766', '3d1a7e8d-839e-50ae-bb14-9a5c1c202187', 'E', 'Duct ectasia', false, 4);

-- Q554
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('d58185bd-ee0a-5b5d-b0c7-00a0a2de77a6', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000022', 'sba', 'A 55 year old woman has had a green nipple discharge from multiple ducts on both sides. She smokes. Examination shows no lump. What is the SINGLE most likely diagnosis?', 'Duct ectasia is dilated ducts with thick discharge, common in perimenopausal women and smokers. It can cause nipple retraction (slit-like). Imaging to exclude cancer; reassure.', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v6')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = 'd58185bd-ee0a-5b5d-b0c7-00a0a2de77a6';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('318395f0-cf5e-576e-b19b-c24d4e57cb7b', 'd58185bd-ee0a-5b5d-b0c7-00a0a2de77a6', 'A', 'Intraductal papilloma', false, 0),
  ('62a0a335-98ba-554f-a0d3-76d4ef452bbd', 'd58185bd-ee0a-5b5d-b0c7-00a0a2de77a6', 'B', 'Breast cancer', false, 1),
  ('b0bdd914-e052-5b71-8706-eef75888d43a', 'd58185bd-ee0a-5b5d-b0c7-00a0a2de77a6', 'C', 'Paget''s disease', false, 2),
  ('340a775a-7527-5946-ad59-cb85524bc3a5', 'd58185bd-ee0a-5b5d-b0c7-00a0a2de77a6', 'D', 'Prolactinoma', false, 3),
  ('1c1bd404-8312-5191-9bc8-a4b52f08ab69', 'd58185bd-ee0a-5b5d-b0c7-00a0a2de77a6', 'E', 'Duct ectasia', true, 4);

-- Q555
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('d31d2c36-6c8d-516a-92a1-049b9ef10a62', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000022', 'sba', 'A 22 year old woman has a 2 cm smooth, firm, mobile lump in her breast. Ultrasound shows a benign fibroadenoma. What is the SINGLE most appropriate management?', 'Fibroadenomas are common benign lumps in young women. Triple assessment confirms. Giant or rapidly enlarging lumps may be phyllodes tumours and need excision.', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v6')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = 'd31d2c36-6c8d-516a-92a1-049b9ef10a62';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('14767f47-9519-5bba-acae-a0694d6e1e0e', 'd31d2c36-6c8d-516a-92a1-049b9ef10a62', 'A', 'Chemotherapy', false, 0),
  ('2f5818a0-b39e-5b65-b1f0-6778b5436a68', 'd31d2c36-6c8d-516a-92a1-049b9ef10a62', 'B', 'Mastectomy', false, 1),
  ('a6ace51e-9194-5d79-bdfc-451f11ab83b2', 'd31d2c36-6c8d-516a-92a1-049b9ef10a62', 'C', 'Reassure; excision only if it enlarges, is over 3 cm, or the patient wishes', true, 2),
  ('9a43709e-7adc-52bc-9d30-b3cd4d278e50', 'd31d2c36-6c8d-516a-92a1-049b9ef10a62', 'D', 'Tamoxifen', false, 3),
  ('88fb83a4-8833-5892-8e54-12dce9c76c7c', 'd31d2c36-6c8d-516a-92a1-049b9ef10a62', 'E', 'Antibiotics', false, 4);

-- Q556
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('1e80e19f-8195-537a-ab17-51e36ea3cc45', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000022', 'sba', 'A 45 year old woman has a rapidly growing 6 cm breast mass. Core biopsy shows a fibroepithelial lesion with stromal overgrowth. What is the SINGLE most likely diagnosis?', 'Phyllodes tumours are fibroepithelial and can be benign, borderline or malignant. They grow quickly and need wide local excision with clear margins.', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v6')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = '1e80e19f-8195-537a-ab17-51e36ea3cc45';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('fd291294-0eb8-53f3-9088-6b2d88e5074e', '1e80e19f-8195-537a-ab17-51e36ea3cc45', 'A', 'Fibroadenoma', false, 0),
  ('91766ae6-0fd7-5ce4-96e9-eacd9ff5cab1', '1e80e19f-8195-537a-ab17-51e36ea3cc45', 'B', 'Inflammatory breast cancer', false, 1),
  ('91dce09c-cd63-597c-be6a-20774abf571c', '1e80e19f-8195-537a-ab17-51e36ea3cc45', 'C', 'Breast cyst', false, 2),
  ('4374a867-e429-5668-8422-d725b3e33238', '1e80e19f-8195-537a-ab17-51e36ea3cc45', 'D', 'Lipoma', false, 3),
  ('573154e7-1c61-5c08-8572-1abecef6556d', '1e80e19f-8195-537a-ab17-51e36ea3cc45', 'E', 'Phyllodes tumour', true, 4);

-- Q557
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('8663faca-a653-5cdc-ae21-2e6e32d6b913', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000022', 'sba', 'A 50 year old woman has had breast cancer treated and is on letrozole. What should be monitored because of this drug?', 'Aromatase inhibitors reduce oestrogen, causing osteoporosis and arthralgia. Baseline DEXA, calcium and vitamin D; bisphosphonates for osteopenia. Tamoxifen causes VTE and endometrial cancer.', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v6')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = '8663faca-a653-5cdc-ae21-2e6e32d6b913';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('3dba92a5-2f9b-5cc6-893f-8f7fe9bf53ab', '8663faca-a653-5cdc-ae21-2e6e32d6b913', 'A', 'Endometrial thickness', false, 0),
  ('44b2e04b-5e17-5f36-b3d0-b018265e69d5', '8663faca-a653-5cdc-ae21-2e6e32d6b913', 'B', 'Liver enzymes every week', false, 1),
  ('d549c064-a008-5506-a41e-8191c584c4b6', '8663faca-a653-5cdc-ae21-2e6e32d6b913', 'C', 'Visual fields', false, 2),
  ('2ff68005-9048-5bf3-b9a7-84e1818057fd', '8663faca-a653-5cdc-ae21-2e6e32d6b913', 'D', 'ECG', false, 3),
  ('03995a48-a49a-5e81-9c46-13a43d4cf5e6', '8663faca-a653-5cdc-ae21-2e6e32d6b913', 'E', 'Bone density (DEXA), as aromatase inhibitors cause bone loss', true, 4);

-- Q558
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('43e31956-2dc2-566b-abbd-047ea11a5919', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000035', 'sba', 'A 50 year old man is ventilated in ICU. A tube check shows the endotracheal tube tip is 1 cm above the carina. His SpO2 is falling and breath sounds are reduced on the left. What is the MOST likely cause?', 'Right main bronchus intubation causes left lung collapse and hypoxaemia. The tip should be 3-5 cm above the carina. Withdraw the tube and confirm with CXR.', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v6')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = '43e31956-2dc2-566b-abbd-047ea11a5919';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('8c4572eb-e246-52df-a85c-b1d9e77b451a', '43e31956-2dc2-566b-abbd-047ea11a5919', 'A', 'Bronchospasm', false, 0),
  ('ce3c2673-b790-58b4-8c2c-27213ae8532f', '43e31956-2dc2-566b-abbd-047ea11a5919', 'B', 'Pulmonary oedema', false, 1),
  ('fea48148-9fa6-54c6-bb85-95bcb4082ada', '43e31956-2dc2-566b-abbd-047ea11a5919', 'C', 'Pleural effusion', false, 2),
  ('59f242b9-efd3-5a40-ae8c-a860a045c088', '43e31956-2dc2-566b-abbd-047ea11a5919', 'D', 'Endotracheal tube migrated into the right main bronchus', true, 3),
  ('4c6c194f-1ce8-5b77-b35a-eaac54e549f7', '43e31956-2dc2-566b-abbd-047ea11a5919', 'E', 'Left pneumothorax only', false, 4);

-- Q559
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('76af2889-2826-5823-a3a9-b2c4dbff40e2', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000035', 'sba', 'A ventilated patient in ICU develops a fever, purulent secretions and new infiltrates on CXR after 5 days of ventilation. What is the SINGLE most likely diagnosis?', 'VAP occurs after 48 hours of ventilation. Prevention bundle: head elevation 30-45 degrees, daily sedation holds, subglottic suction, oral care. Antibiotics guided by local resistance (Pseudomonas, MRSA).', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v6')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = '76af2889-2826-5823-a3a9-b2c4dbff40e2';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('453b86de-d47a-52e2-9e98-27a6c624a303', '76af2889-2826-5823-a3a9-b2c4dbff40e2', 'A', 'Ventilator-associated pneumonia', true, 0),
  ('ad8160e1-1163-5ed7-b268-1deb335ebc69', '76af2889-2826-5823-a3a9-b2c4dbff40e2', 'B', 'Pulmonary embolism', false, 1),
  ('aa8004e0-6340-5f8b-a347-8f892e82dfc1', '76af2889-2826-5823-a3a9-b2c4dbff40e2', 'C', 'Atelectasis', false, 2),
  ('c9043bd7-e8da-5422-addf-14b6be72017b', '76af2889-2826-5823-a3a9-b2c4dbff40e2', 'D', 'Aspiration pneumonitis', false, 3),
  ('1a9c311f-d4f1-5a6d-bf10-2bd869e47883', '76af2889-2826-5823-a3a9-b2c4dbff40e2', 'E', 'ARDS only', false, 4);

-- Q560
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('4e1207d0-ef69-59b6-aa6c-eb81aded18bc', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000035', 'sba', 'A 70 year old man in ICU has delirium. He is agitated and pulling at lines. Which tool is used to screen for ICU delirium?', 'CAM-ICU and ICDSC assess delirium in ventilated patients. Non-drug measures: reorientation, sleep, early mobilisation, family visits. Minimise benzodiazepines.', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v6')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = '4e1207d0-ef69-59b6-aa6c-eb81aded18bc';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('b0af6e41-fde9-5dad-be92-6fc1a9c2e2b7', '4e1207d0-ef69-59b6-aa6c-eb81aded18bc', 'A', 'CAM-ICU (Confusion Assessment Method for ICU)', true, 0),
  ('0e05696b-03ce-5332-ae3f-3b2cf6008e56', '4e1207d0-ef69-59b6-aa6c-eb81aded18bc', 'B', '4AT is not validated anywhere', false, 1),
  ('b835de22-2cce-5468-851d-c024f2f6958a', '4e1207d0-ef69-59b6-aa6c-eb81aded18bc', 'C', 'MMSE', false, 2),
  ('7dae3a9a-1a79-59c0-b135-45a494ae4b9c', '4e1207d0-ef69-59b6-aa6c-eb81aded18bc', 'D', 'AMTS only', false, 3),
  ('8bdb8912-71f7-553d-89b5-4edf04d046f5', '4e1207d0-ef69-59b6-aa6c-eb81aded18bc', 'E', 'GCS only', false, 4);

-- Q561
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('b938f0e2-b1f1-527d-b8df-b6dde9467b1c', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000035', 'sba', 'A 45 year old woman has been in ICU for 3 weeks. She has generalised weakness and cannot be weaned from the ventilator. Reflexes are reduced. What is the SINGLE most likely diagnosis?', 'ICU-acquired weakness is linked to sepsis, multi-organ failure, steroids, neuromuscular blockers and hyperglycaemia. Early mobilisation and rehabilitation help.', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v6')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = 'b938f0e2-b1f1-527d-b8df-b6dde9467b1c';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('ad41205a-3904-5ba1-a611-2c4d34d4c317', 'b938f0e2-b1f1-527d-b8df-b6dde9467b1c', 'A', 'Guillain-Barré syndrome', false, 0),
  ('b2cb355b-0caa-54cc-a000-e9820274d7e9', 'b938f0e2-b1f1-527d-b8df-b6dde9467b1c', 'B', 'Spinal cord injury', false, 1),
  ('a9191859-3886-5702-ae65-54cb0b2b836b', 'b938f0e2-b1f1-527d-b8df-b6dde9467b1c', 'C', 'ICU-acquired weakness (critical illness polyneuropathy/myopathy)', true, 2),
  ('e9256b88-2916-5ad2-8108-894c9f6fd05c', 'b938f0e2-b1f1-527d-b8df-b6dde9467b1c', 'D', 'Stroke', false, 3),
  ('a970f7d9-857b-53c1-9cb6-2e34a67702b1', 'b938f0e2-b1f1-527d-b8df-b6dde9467b1c', 'E', 'Myasthenia gravis', false, 4);

-- Q562
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('21ca9090-def8-5d0f-955a-d301388c9143', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000035', 'sba', 'A 30 year old woman is brought to ICU after a traumatic brain injury. Her ICP is 28 mmHg. Which is the target cerebral perfusion pressure?', 'In severe TBI, target ICP below 22 mmHg and CPP 60-70 mmHg. Measures: head up 30 degrees, sedation, osmotherapy (mannitol or hypertonic saline), normocapnia, and decompressive craniectomy if refractory.', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v6')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = '21ca9090-def8-5d0f-955a-d301388c9143';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('7512f9b0-c64e-5b47-a7d7-9e303d428d24', '21ca9090-def8-5d0f-955a-d301388c9143', 'A', 'Above 120 mmHg', false, 0),
  ('9fe8c1e5-7e27-574b-903c-7c2f3eb007a5', '21ca9090-def8-5d0f-955a-d301388c9143', 'B', 'Below 40 mmHg', false, 1),
  ('378ebf14-5adb-5499-b112-e1bdebe37455', '21ca9090-def8-5d0f-955a-d301388c9143', 'C', 'Not relevant', false, 2),
  ('0c09638d-9659-5da4-b159-dfa669955fed', '21ca9090-def8-5d0f-955a-d301388c9143', 'D', '20 mmHg', false, 3),
  ('508cfebc-4f7b-5595-9403-057cc3ef5697', '21ca9090-def8-5d0f-955a-d301388c9143', 'E', '60-70 mmHg (CPP = MAP minus ICP)', true, 4);

-- Q563
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('97580d29-1449-577f-a759-c000037a3be5', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000035', 'sba', 'A 55 year old man is to undergo brainstem death testing in ICU. Which is a prerequisite?', 'Brainstem death testing requires known cause of irreversible brain damage, exclusion of reversible causes, and two sets of tests by two experienced doctors (at least one consultant). Time of death is the first test.', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v6')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = '97580d29-1449-577f-a759-c000037a3be5';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('b851f5df-9e9f-53bf-b063-44e5d35fd81d', '97580d29-1449-577f-a759-c000037a3be5', 'A', 'Spontaneous breathing', false, 0),
  ('b45c8412-1c6a-531b-9326-bdff3bce3087', '97580d29-1449-577f-a759-c000037a3be5', 'B', 'A positive gag reflex', false, 1),
  ('754c200a-4590-5a1e-9ea8-e4e4e1871637', '97580d29-1449-577f-a759-c000037a3be5', 'C', 'A family request', false, 2),
  ('939c6ee1-2505-5587-915b-2a7009d871e0', '97580d29-1449-577f-a759-c000037a3be5', 'D', 'Pupils reacting to light', false, 3),
  ('0c91dd95-eebb-5f40-a1cc-319b50684bf8', '97580d29-1449-577f-a759-c000037a3be5', 'E', 'Exclusion of reversible causes (sedatives, hypothermia, metabolic or endocrine disturbance)', true, 4);

-- Q564
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('6f93fef1-c57d-5cf8-b402-96ed5f9e99ca', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000025', 'sba', 'A 30 year old woman is pregnant and has had sudden breathlessness. A CTPA is considered. What is the MOST important advice?', 'In suspected PE in pregnancy, start LMWH and image. If CXR is normal, V/Q (perfusion) is often preferred; CTPA if abnormal. Explain the small risks.', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v6')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = '6f93fef1-c57d-5cf8-b402-96ed5f9e99ca';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('ff0e59e8-51a6-5513-a47b-99de790cce8b', '6f93fef1-c57d-5cf8-b402-96ed5f9e99ca', 'A', 'Only MRI is allowed', false, 0),
  ('de1dd463-9abf-574c-a019-cf678487e13b', '6f93fef1-c57d-5cf8-b402-96ed5f9e99ca', 'B', 'Use contrast-free CT only', false, 1),
  ('8bda71d4-af1f-572e-af35-9ccc82dc0edc', '6f93fef1-c57d-5cf8-b402-96ed5f9e99ca', 'C', 'Imaging is contraindicated in pregnancy', false, 2),
  ('a58c2bf9-3e36-50cb-8113-e7aa3b9740cb', '6f93fef1-c57d-5cf8-b402-96ed5f9e99ca', 'D', 'Wait until after delivery', false, 3),
  ('ccb0fe09-1685-55a0-a05a-4a8d1219326a', '6f93fef1-c57d-5cf8-b402-96ed5f9e99ca', 'E', 'CTPA gives a higher breast radiation dose; V/Q scanning gives a higher fetal dose, though both are low; neither should be withheld if needed', true, 4);

-- Q565
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('2755a4a8-d16e-576e-b0d9-5c7707fd2fe0', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000025', 'sba', 'A 65 year old man has had sudden severe abdominal pain. Abdominal X-ray shows gas outlining both sides of the bowel wall (Rigler''s sign). What is the SINGLE most likely diagnosis?', 'Rigler''s sign (double-wall sign) indicates free intraperitoneal gas. An erect CXR showing gas under the diaphragm is also useful. CT is more sensitive.', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v6')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = '2755a4a8-d16e-576e-b0d9-5c7707fd2fe0';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('4aa55664-76d2-53ff-aaeb-bd6ef97e1d9c', '2755a4a8-d16e-576e-b0d9-5c7707fd2fe0', 'A', 'Toxic megacolon', false, 0),
  ('20190434-c43e-580d-b744-3cf3ceddc0cf', '2755a4a8-d16e-576e-b0d9-5c7707fd2fe0', 'B', 'Pancreatitis', false, 1),
  ('f1ba610c-d4ab-53c7-b622-c9fa1d7cf856', '2755a4a8-d16e-576e-b0d9-5c7707fd2fe0', 'C', 'Pneumoperitoneum (perforated viscus)', true, 2),
  ('73d6a5cd-d375-526d-b589-025fd90667d4', '2755a4a8-d16e-576e-b0d9-5c7707fd2fe0', 'D', 'Volvulus', false, 3),
  ('c88f523f-d7bf-532a-bdef-8686beba6eca', '2755a4a8-d16e-576e-b0d9-5c7707fd2fe0', 'E', 'Small bowel obstruction', false, 4);

-- Q566
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('a6b9860c-bd7e-5441-8989-42d1f2e77fe3', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000025', 'sba', 'A 75 year old woman has had abdominal distension and constipation. Abdominal X-ray shows a large ''coffee bean'' loop arising from the left iliac fossa. What is the SINGLE most likely diagnosis?', 'Sigmoid volvulus is common in older, constipated, institutionalised people. Treatment: flexible sigmoidoscopy decompression with a flatus tube; surgery if ischaemic or recurrent.', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v6')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = 'a6b9860c-bd7e-5441-8989-42d1f2e77fe3';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('e7111e77-2170-54dd-a5d1-7aa860d86bfe', 'a6b9860c-bd7e-5441-8989-42d1f2e77fe3', 'A', 'Small bowel obstruction', false, 0),
  ('1cfb05e2-c7b7-59d8-8b53-629e82674fde', 'a6b9860c-bd7e-5441-8989-42d1f2e77fe3', 'B', 'Toxic megacolon', false, 1),
  ('42331284-95c5-510e-8e95-4e1f3d795d43', 'a6b9860c-bd7e-5441-8989-42d1f2e77fe3', 'C', 'Caecal volvulus', false, 2),
  ('6f5f4bdf-f296-5814-b259-cea8dcea087f', 'a6b9860c-bd7e-5441-8989-42d1f2e77fe3', 'D', 'Pseudo-obstruction', false, 3),
  ('0d19a474-0981-55b0-8d9e-42bf767067af', 'a6b9860c-bd7e-5441-8989-42d1f2e77fe3', 'E', 'Sigmoid volvulus', true, 4);

-- Q567
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('a8d73ac8-f953-5469-824c-d4fc38396f6f', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000025', 'sba', 'A 55 year old man has had headache and vomiting. CT head shows a hyperdense crescent-shaped collection crossing suture lines. He takes warfarin. What is the SINGLE most likely diagnosis?', 'Subdural haematomas are crescent-shaped and cross sutures. Extradural are lens-shaped (biconvex) and limited by sutures. Reverse anticoagulation (vitamin K and prothrombin complex concentrate) and discuss with neurosurgery.', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v6', 'image_url', 'https://commons.wikimedia.org/wiki/Special:FilePath/Trauma_subdural_arrows.jpg')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = 'a8d73ac8-f953-5469-824c-d4fc38396f6f';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('6bec8eed-ddb3-560f-b6c7-3a91374f67fa', 'a8d73ac8-f953-5469-824c-d4fc38396f6f', 'A', 'Extradural haematoma', false, 0),
  ('0eed6a92-206b-572e-be21-87bac80ce031', 'a8d73ac8-f953-5469-824c-d4fc38396f6f', 'B', 'Subarachnoid haemorrhage', false, 1),
  ('a7f7496a-8dda-54b8-8a53-e46cfafd6eca', 'a8d73ac8-f953-5469-824c-d4fc38396f6f', 'C', 'Acute subdural haematoma', true, 2),
  ('1e0c4524-ef65-51d5-be1a-4e03cc67722c', 'a8d73ac8-f953-5469-824c-d4fc38396f6f', 'D', 'Chronic subdural', false, 3),
  ('c1c6c868-6be6-58b6-9688-01ea41e66457', 'a8d73ac8-f953-5469-824c-d4fc38396f6f', 'E', 'Ischaemic stroke', false, 4);

-- Q568
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('db8cdbd6-e79b-5c36-b310-0f625b92e5b2', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000025', 'sba', 'A 20 year old man was hit on the side of the head with a cricket ball. He was briefly unconscious, then talked normally, then deteriorated. CT shows a biconvex hyperdense collection. What is the SINGLE most likely diagnosis?', 'Extradural haematomas follow temporal bone fracture with middle meningeal artery injury. There is often a lucid interval. Urgent neurosurgical evacuation.', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v6', 'image_url', 'https://commons.wikimedia.org/wiki/Special:FilePath/Epidural_hematoma.png')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = 'db8cdbd6-e79b-5c36-b310-0f625b92e5b2';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('6991f634-bd6f-5af5-9846-f58cab90867a', 'db8cdbd6-e79b-5c36-b310-0f625b92e5b2', 'A', 'Subarachnoid haemorrhage', false, 0),
  ('59f72880-5a9d-5403-b502-5b4c3961ccb4', 'db8cdbd6-e79b-5c36-b310-0f625b92e5b2', 'B', 'Contusion only', false, 1),
  ('74740dc0-5e48-551e-96b8-21dc98abda62', 'db8cdbd6-e79b-5c36-b310-0f625b92e5b2', 'C', 'Diffuse axonal injury', false, 2),
  ('ad1c01c5-5dd0-5cb7-987c-989020b72da2', 'db8cdbd6-e79b-5c36-b310-0f625b92e5b2', 'D', 'Extradural haematoma (middle meningeal artery)', true, 3),
  ('132d1f1e-6b5c-596b-976f-6b6b7955da2a', 'db8cdbd6-e79b-5c36-b310-0f625b92e5b2', 'E', 'Acute subdural haematoma', false, 4);

-- Q569
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('f767437b-5319-54e4-ad92-5e746971379b', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000026', 'sba', 'A 45 year old man has had a hoarse voice for 4 weeks. He smokes. There is no sore throat or infection. What is the SINGLE most appropriate management?', 'NICE NG12: persistent unexplained hoarseness in people aged 45 or over warrants suspected cancer referral. Also check CXR for lung cancer (recurrent laryngeal nerve).', null, true, true, jsonb_build_object('source', 'plab1-xlsx-v6', 'guidelines_text', 'NICE NG12')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = 'f767437b-5319-54e4-ad92-5e746971379b';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('576a99ef-90d8-5f27-a0e9-cbfd4c17eb69', 'f767437b-5319-54e4-ad92-5e746971379b', 'A', 'Antibiotics', false, 0),
  ('05246f14-07ae-5a24-9033-6d8bfef45ac7', 'f767437b-5319-54e4-ad92-5e746971379b', 'B', 'Two-week-wait referral for suspected laryngeal cancer', true, 1),
  ('5c237daa-010c-50b8-af2a-0b3e51f693b7', 'f767437b-5319-54e4-ad92-5e746971379b', 'C', 'Voice rest for 3 months', false, 2),
  ('4e3f48cf-07da-5e6b-b337-d05f944c1ed3', 'f767437b-5319-54e4-ad92-5e746971379b', 'D', 'PPI trial only', false, 3),
  ('8f79f2a7-ea9e-5709-be27-76958ed85187', 'f767437b-5319-54e4-ad92-5e746971379b', 'E', 'Reassure', false, 4);

-- Q570
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('eb39ed37-66a5-526c-b36d-4e9d4168447b', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000026', 'sba', 'A 30 year old singer has had hoarseness for months. Laryngoscopy shows bilateral small nodules at the junction of the anterior and middle thirds of the vocal cords. What is the SINGLE most appropriate first-line management?', 'Vocal cord nodules (''singer''s nodules'') are caused by voice overuse. Voice therapy is first line; surgery for persistent nodules.', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v6')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = 'eb39ed37-66a5-526c-b36d-4e9d4168447b';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('b58ceb30-29fa-5210-81e3-b716c4407914', 'eb39ed37-66a5-526c-b36d-4e9d4168447b', 'A', 'Steroid injection', false, 0),
  ('5cc3d2be-117e-5fd8-ae10-b1e806446161', 'eb39ed37-66a5-526c-b36d-4e9d4168447b', 'B', 'Antibiotics', false, 1),
  ('c8efd892-ed19-58ea-b3fc-f9f251ffe820', 'eb39ed37-66a5-526c-b36d-4e9d4168447b', 'C', 'Surgery', false, 2),
  ('6d4fbe08-6af3-5e2d-b4e7-9f58575caf95', 'eb39ed37-66a5-526c-b36d-4e9d4168447b', 'D', 'Radiotherapy', false, 3),
  ('1bcc9885-8b0a-5478-9d4a-34ec7cbb9ca4', 'eb39ed37-66a5-526c-b36d-4e9d4168447b', 'E', 'Speech and language therapy (voice therapy)', true, 4);

-- Q571
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('01e3cac1-de14-5af1-8538-512fbfff4fe4', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000026', 'sba', 'A 5 year old has had loud snoring, pauses in breathing at night, daytime sleepiness and poor concentration. Tonsils are large. What is the SINGLE most appropriate management?', 'Paediatric OSA is usually caused by adenotonsillar hypertrophy. Adenotonsillectomy is effective. Complications of untreated OSA: behavioural problems, poor growth and pulmonary hypertension.', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v6')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = '01e3cac1-de14-5af1-8538-512fbfff4fe4';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('474026b5-1ea6-563a-a303-e73ec18131e7', '01e3cac1-de14-5af1-8538-512fbfff4fe4', 'A', 'Reassure', false, 0),
  ('ba5eb565-251f-5681-ab66-a5bb8a33eac9', '01e3cac1-de14-5af1-8538-512fbfff4fe4', 'B', 'Antibiotics', false, 1),
  ('8218053b-5e3f-551d-a6d4-46a4af0f9aac', '01e3cac1-de14-5af1-8538-512fbfff4fe4', 'C', 'Nasal steroid only', false, 2),
  ('6ffcf269-40c1-5080-9283-8fefd28942e2', '01e3cac1-de14-5af1-8538-512fbfff4fe4', 'D', 'CPAP as first-line', false, 3),
  ('f912e377-b3b1-59ef-b350-7ce22fc0f812', '01e3cac1-de14-5af1-8538-512fbfff4fe4', 'E', 'Refer to ENT for consideration of adenotonsillectomy (obstructive sleep apnoea)', true, 4);

-- Q572
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('a328b0c5-4d52-5b5d-a681-1d67236b5d2a', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000026', 'sba', 'A 55 year old man has had recurrent episodes of bleeding from one nostril and nasal obstruction for 2 months. He worked in the furniture industry. What is the SINGLE most likely concern?', 'Unilateral nasal symptoms (obstruction, bleeding, discharge) are red flags. Wood dust exposure is linked to sinonasal adenocarcinoma. Refer urgently.', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v6')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = 'a328b0c5-4d52-5b5d-a681-1d67236b5d2a';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('0c83df59-1d53-5c45-a41d-71412f423c8d', 'a328b0c5-4d52-5b5d-a681-1d67236b5d2a', 'A', 'Allergic rhinitis', false, 0),
  ('13c68111-7d4f-5524-8b98-419b694d9760', 'a328b0c5-4d52-5b5d-a681-1d67236b5d2a', 'B', 'Septal deviation', false, 1),
  ('937baa14-1208-5120-ac36-d85d9b6d2bfe', 'a328b0c5-4d52-5b5d-a681-1d67236b5d2a', 'C', 'Nasal polyps', false, 2),
  ('2fa28e7e-5da0-5851-8ffe-cc6682219b2e', 'a328b0c5-4d52-5b5d-a681-1d67236b5d2a', 'D', 'Sinonasal carcinoma (adenocarcinoma linked to wood dust)', true, 3),
  ('5accfeac-e247-5db5-b796-d36abd5edea6', 'a328b0c5-4d52-5b5d-a681-1d67236b5d2a', 'E', 'Epistaxis from hypertension', false, 4);

-- Q573
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('0ca08ba8-3032-58e7-9273-48e4f852fddd', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000026', 'sba', 'A 70 year old man has had a sore throat, otalgia, and difficulty swallowing for 6 weeks. He has lost weight. His ears look normal. What is the SINGLE most appropriate action?', 'Referred otalgia with dysphagia and weight loss suggests oropharyngeal, laryngeal or hypopharyngeal cancer (via glossopharyngeal and vagus nerves).', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v6')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = '0ca08ba8-3032-58e7-9273-48e4f852fddd';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('daadf3c3-2eb6-595f-9704-0dd5bc820dbd', '0ca08ba8-3032-58e7-9273-48e4f852fddd', 'A', 'Antibiotics', false, 0),
  ('ec0f2d75-25f5-58f8-9b58-a747f9b47e32', '0ca08ba8-3032-58e7-9273-48e4f852fddd', 'B', 'Review in 3 months', false, 1),
  ('87340549-23df-554e-872c-ca5e1d9217c5', '0ca08ba8-3032-58e7-9273-48e4f852fddd', 'C', 'Ear drops', false, 2),
  ('788aac5d-55fe-5a90-8bf0-e077606916e2', '0ca08ba8-3032-58e7-9273-48e4f852fddd', 'D', 'Reassure', false, 3),
  ('d4d9636c-6926-503f-9607-5452a886e527', '0ca08ba8-3032-58e7-9273-48e4f852fddd', 'E', 'Urgent two-week-wait referral for suspected head and neck cancer (referred otalgia)', true, 4);

-- Q574
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('21483f80-c287-54ce-a71e-245b79a7a165', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000020', 'sba', 'A 25 year old woman has had a single painless ulcer on her vulva with a firm, rubbery base. Inguinal lymph nodes are enlarged and painless. What is the SINGLE most appropriate treatment?', 'Primary syphilis causes a painless chancre. Diagnosis: dark-field microscopy, PCR, serology. Treatment: benzathine penicillin. Jarisch-Herxheimer reaction may follow. Contact tracing and HIV testing.', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v6')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = '21483f80-c287-54ce-a71e-245b79a7a165';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('142c2122-cdfc-5d56-95e3-e7ff49273967', '21483f80-c287-54ce-a71e-245b79a7a165', 'A', 'Ceftriaxone', false, 0),
  ('38ab25e0-7ae9-56ea-8af5-60a226980161', '21483f80-c287-54ce-a71e-245b79a7a165', 'B', 'Aciclovir', false, 1),
  ('52d12873-4067-5ce8-b826-8b78ba422abc', '21483f80-c287-54ce-a71e-245b79a7a165', 'C', 'Metronidazole', false, 2),
  ('d75d4434-bc84-502c-8217-b217b3166c0d', '21483f80-c287-54ce-a71e-245b79a7a165', 'D', 'Single dose of benzathine penicillin IM (primary syphilis)', true, 3),
  ('a9b20d84-ca56-5575-b7d2-8962dbb2f06a', '21483f80-c287-54ce-a71e-245b79a7a165', 'E', 'Azithromycin', false, 4);

-- Q575
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('92f82eaf-8e02-5244-98a4-f1857b24c7b1', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000020', 'sba', 'A 30 year old man has had a rash on his palms and soles, mouth ulcers and generalised lymphadenopathy. He had a painless genital ulcer 2 months ago. What is the SINGLE most likely diagnosis?', 'Secondary syphilis occurs weeks to months after the chancre with a non-itchy rash on the palms and soles, condylomata lata, snail-track ulcers and lymphadenopathy.', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v6')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = '92f82eaf-8e02-5244-98a4-f1857b24c7b1';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('f372c827-8aeb-5087-b82d-711d81a2a240', '92f82eaf-8e02-5244-98a4-f1857b24c7b1', 'A', 'Secondary syphilis', true, 0),
  ('48f32df4-bb2f-54c2-9f9e-6a6eff2014b1', '92f82eaf-8e02-5244-98a4-f1857b24c7b1', 'B', 'Psoriasis', false, 1),
  ('f5b59232-0eb1-5698-9d68-40f1748c3545', '92f82eaf-8e02-5244-98a4-f1857b24c7b1', 'C', 'Erythema multiforme', false, 2),
  ('ec1e8eae-cd35-5605-ab11-d24fbeef8dda', '92f82eaf-8e02-5244-98a4-f1857b24c7b1', 'D', 'Pityriasis rosea', false, 3),
  ('ccc076a4-d6d6-568f-8e0b-8008c411feea', '92f82eaf-8e02-5244-98a4-f1857b24c7b1', 'E', 'Hand, foot and mouth disease', false, 4);

-- Q576
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('55d14320-ba51-5b2a-aaea-94d9844b3779', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000020', 'sba', 'A 22 year old man has had painful genital ulcers, inguinal lymphadenopathy that is fluctuant, and he recently travelled to Africa. Gram stain shows gram-negative rods in ''school of fish''. What is the SINGLE most likely diagnosis?', 'Chancroid causes painful ulcers and suppurative lymphadenopathy. Treatment: azithromycin or ceftriaxone. Screen for HIV and syphilis.', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v6')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = '55d14320-ba51-5b2a-aaea-94d9844b3779';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('f070c98b-84f1-5030-9ba7-5a2b3cef8492', '55d14320-ba51-5b2a-aaea-94d9844b3779', 'A', 'Granuloma inguinale', false, 0),
  ('0730da91-fe0a-55f8-b061-f9d92de347a5', '55d14320-ba51-5b2a-aaea-94d9844b3779', 'B', 'Herpes', false, 1),
  ('96a81ec0-61bf-513c-ad3d-5a3a270e40c1', '55d14320-ba51-5b2a-aaea-94d9844b3779', 'C', 'Syphilis', false, 2),
  ('c6245db6-f578-5ab0-a9cb-96bede2172eb', '55d14320-ba51-5b2a-aaea-94d9844b3779', 'D', 'Chancroid (Haemophilus ducreyi)', true, 3),
  ('8d692ef8-105e-5d63-a0ba-403d46ab62b6', '55d14320-ba51-5b2a-aaea-94d9844b3779', 'E', 'Lymphogranuloma venereum', false, 4);

-- Q577
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('e0698bc8-1633-5d7d-b9a4-5977eda1c163', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000020', 'sba', 'A 35 year old man who has sex with men has had rectal pain, bloody discharge and tenesmus. Proctoscopy shows proctitis. NAAT is positive for chlamydia. Which genotype test is important?', 'Lymphogranuloma venereum presents with proctitis in MSM. Positive rectal chlamydia samples in MSM are tested for LGV. Treatment: doxycycline for 21 days.', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v6')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = 'e0698bc8-1633-5d7d-b9a4-5977eda1c163';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('84746975-ed34-5cad-864e-dd670a92137a', 'e0698bc8-1633-5d7d-b9a4-5977eda1c163', 'A', 'LGV (L1-L3 serovars) testing, as LGV needs 3 weeks of doxycycline', true, 0),
  ('70eb1c1f-a3c4-5077-86f8-71a7344b1d9d', 'e0698bc8-1633-5d7d-b9a4-5977eda1c163', 'B', 'HPV typing', false, 1),
  ('20f05b9b-6bf9-5cdc-a008-4d2ead545fe2', 'e0698bc8-1633-5d7d-b9a4-5977eda1c163', 'C', 'No further testing', false, 2),
  ('731b78fa-d379-5d06-a041-7a4ee1091a10', 'e0698bc8-1633-5d7d-b9a4-5977eda1c163', 'D', 'Herpes serology only', false, 3),
  ('b6e9ac6b-d4b7-5928-aa94-6be5144ee283', 'e0698bc8-1633-5d7d-b9a4-5977eda1c163', 'E', 'Trichomonas', false, 4);

-- Q578
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('5a360772-3a0b-5f55-bbe4-4f84654a4da3', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000024', 'sba', 'A 55 year old man with lymphoma starts chemotherapy. On day 2 his potassium is 6.8, phosphate is high, calcium is low, and urate is raised. What is the SINGLE most likely diagnosis?', 'Tumour lysis syndrome occurs with high-turnover tumours after treatment. Prevention: IV fluids, allopurinol or rasburicase. Treat hyperkalaemia, and arrange dialysis for refractory AKI.', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v6')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = '5a360772-3a0b-5f55-bbe4-4f84654a4da3';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('ff729af9-4c69-5a5d-a8b0-943e63d93b9d', '5a360772-3a0b-5f55-bbe4-4f84654a4da3', 'A', 'Hyperaldosteronism', false, 0),
  ('15325652-245f-5671-b485-5223ca607331', '5a360772-3a0b-5f55-bbe4-4f84654a4da3', 'B', 'Tumour lysis syndrome', true, 1),
  ('39536629-90e7-5455-ba82-604d59a5dc17', '5a360772-3a0b-5f55-bbe4-4f84654a4da3', 'C', 'Hypoparathyroidism', false, 2),
  ('f78b3417-4854-5714-936b-423181df62c8', '5a360772-3a0b-5f55-bbe4-4f84654a4da3', 'D', 'Addisonian crisis', false, 3),
  ('abcd7b18-c2d9-52a1-bdf0-953eab60b239', '5a360772-3a0b-5f55-bbe4-4f84654a4da3', 'E', 'Rhabdomyolysis', false, 4);

-- Q579
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('0bf9b8dd-c279-52c4-9b42-c1901e2716d9', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000024', 'sba', 'A 70 year old man with lung cancer has had facial swelling, headache on bending forward, and dilated veins over his chest. What is the SINGLE most likely diagnosis?', 'SVCO is usually caused by lung cancer or lymphoma. Management: dexamethasone, endovascular stenting and treatment of the cancer. Stridor is an emergency.', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v6')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = '0bf9b8dd-c279-52c4-9b42-c1901e2716d9';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('6105fdc2-7206-5b80-894f-89bca340abc5', '0bf9b8dd-c279-52c4-9b42-c1901e2716d9', 'A', 'Pericardial effusion', false, 0),
  ('dd4173fa-8303-563a-8ec6-9f57af495eb5', '0bf9b8dd-c279-52c4-9b42-c1901e2716d9', 'B', 'Heart failure', false, 1),
  ('1be84ad6-7484-5a6f-84fe-8c2fc7e6fb41', '0bf9b8dd-c279-52c4-9b42-c1901e2716d9', 'C', 'Angioedema', false, 2),
  ('59785474-8b18-51d2-b900-6bba38fff4cc', '0bf9b8dd-c279-52c4-9b42-c1901e2716d9', 'D', 'Cushing''s syndrome', false, 3),
  ('538bffc3-29c7-5558-a0f5-5cdddad8936c', '0bf9b8dd-c279-52c4-9b42-c1901e2716d9', 'E', 'Superior vena cava obstruction', true, 4);

-- Q580
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('19109f2e-26f3-515e-b4c6-1b993eaa5409', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000024', 'sba', 'A 65 year old man with prostate cancer has had back pain, leg weakness and urinary retention. What is the SINGLE most appropriate immediate management?', 'NICE NG234: suspected MSCC needs whole-spine MRI and dexamethasone. Definitive treatment: radiotherapy or surgery.', null, true, true, jsonb_build_object('source', 'plab1-xlsx-v6', 'guidelines_text', 'NICE NG234')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = '19109f2e-26f3-515e-b4c6-1b993eaa5409';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('91ab1eb7-c065-55bd-befd-c649d9885ed7', '19109f2e-26f3-515e-b4c6-1b993eaa5409', 'A', 'Bone scan in 2 weeks', false, 0),
  ('c961632c-e9b2-5557-9ad7-9efe0e8a9716', '19109f2e-26f3-515e-b4c6-1b993eaa5409', 'B', 'Bed rest only', false, 1),
  ('0d206d7b-244b-5f97-97ab-d24f8191a83d', '19109f2e-26f3-515e-b4c6-1b993eaa5409', 'C', 'Dexamethasone 16 mg and urgent whole-spine MRI within 24 hours (metastatic spinal cord compression)', true, 2),
  ('0c37bd2b-eb7c-5c3e-ae85-6b1d037c1b0f', '19109f2e-26f3-515e-b4c6-1b993eaa5409', 'D', 'Analgesia and review in a week', false, 3),
  ('f1702c8f-3d56-5aba-874b-9ed6d2efc58c', '19109f2e-26f3-515e-b4c6-1b993eaa5409', 'E', 'Physiotherapy', false, 4);

-- Q581
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('910960fb-ad96-54a2-97cf-f1884073e345', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000017', 'sba', 'A 60 year old woman with advanced cancer is anxious and breathless at rest. Fan therapy has helped a little. What medication is MOST helpful for her breathlessness?', 'Opioids reduce the sensation of breathlessness. Benzodiazepines help associated anxiety. Non-drug measures: fan, positioning, breathing techniques.', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v6')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = '910960fb-ad96-54a2-97cf-f1884073e345';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('ac171c3b-c110-537f-a39b-30c597ec80b2', '910960fb-ad96-54a2-97cf-f1884073e345', 'A', 'Steroids for all', false, 0),
  ('7e91411e-877c-59de-838a-d661d5e02e51', '910960fb-ad96-54a2-97cf-f1884073e345', 'B', 'Antibiotics', false, 1),
  ('2f380aab-edd7-5085-b170-73cab3010352', '910960fb-ad96-54a2-97cf-f1884073e345', 'C', 'Low-dose oral morphine', true, 2),
  ('bce767d8-a20b-5f21-9b8f-583e276acbbc', '910960fb-ad96-54a2-97cf-f1884073e345', 'D', 'Furosemide', false, 3),
  ('01a2f701-cae0-59d6-9519-8c61c5493d34', '910960fb-ad96-54a2-97cf-f1884073e345', 'E', 'Salbutamol', false, 4);

-- Q582
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('e1e5d853-0516-526d-ae8c-d8e77a2ba92e', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000017', 'sba', 'A 65 year old woman with advanced ovarian cancer has colicky abdominal pain and vomiting. She has inoperable malignant bowel obstruction. What medication reduces colic and secretions?', 'In complete malignant bowel obstruction, avoid prokinetics (metoclopramide). Hyoscine butylbromide reduces colic and secretions; octreotide reduces secretions; dexamethasone may help.', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v6')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = 'e1e5d853-0516-526d-ae8c-d8e77a2ba92e';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('3e37457f-841b-5365-8d44-63d4fbf83474', 'e1e5d853-0516-526d-ae8c-d8e77a2ba92e', 'A', 'Lactulose', false, 0),
  ('7e20a56e-b05e-5486-9302-82c38111309e', 'e1e5d853-0516-526d-ae8c-d8e77a2ba92e', 'B', 'Hyoscine butylbromide (subcutaneous)', true, 1),
  ('fca5fb94-95a6-5dbe-95ef-504675965f85', 'e1e5d853-0516-526d-ae8c-d8e77a2ba92e', 'C', 'Loperamide', false, 2),
  ('923ea9e7-37da-58d9-9a71-82f65faeac90', 'e1e5d853-0516-526d-ae8c-d8e77a2ba92e', 'D', 'Metoclopramide', false, 3),
  ('85f6f059-8583-532a-8547-e963feef315e', 'e1e5d853-0516-526d-ae8c-d8e77a2ba92e', 'E', 'Senna', false, 4);

-- Q583
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('15e7ef9e-63c6-566a-b39e-02ce0257076a', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000017', 'sba', 'A 50 year old man is in the last days of life. He is restless and agitated. Reversible causes (urinary retention, pain) have been excluded. Which drug is MOST appropriate?', 'Terminal agitation: treat reversible causes (pain, retention, constipation), then midazolam. Haloperidol or levomepromazine for delirium.', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v6')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = '15e7ef9e-63c6-566a-b39e-02ce0257076a';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('96fe2e16-86e0-5434-a875-4d15c5f1b710', '15e7ef9e-63c6-566a-b39e-02ce0257076a', 'A', 'Oral diazepam', false, 0),
  ('271c6358-2fc6-5fd4-b592-7f5e148be438', '15e7ef9e-63c6-566a-b39e-02ce0257076a', 'B', 'Chlorpromazine IM', false, 1),
  ('1af548ec-bf1c-5e92-9abf-2fedf92057d5', '15e7ef9e-63c6-566a-b39e-02ce0257076a', 'C', 'Haloperidol IV', false, 2),
  ('c1df5f54-b9ad-5fae-8cd0-47bf7220bc93', '15e7ef9e-63c6-566a-b39e-02ce0257076a', 'D', 'Morphine', false, 3),
  ('12c0b383-7efa-576e-bb9b-e41bf42da637', '15e7ef9e-63c6-566a-b39e-02ce0257076a', 'E', 'Subcutaneous midazolam', true, 4);

-- Q584
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('ae58ff01-e93a-5398-98a8-fc6061fa8ae8', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000017', 'sba', 'A patient with advanced COPD is in the last months of life. He wants to avoid hospital admission. What is the MOST appropriate action?', 'Advance care planning helps people make decisions about future care. Record wishes, appoint a lasting power of attorney, and share with services (ReSPECT form).', null, true, true, jsonb_build_object('source', 'plab1-xlsx-v6')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = 'ae58ff01-e93a-5398-98a8-fc6061fa8ae8';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('e4414e41-848c-54df-a21a-22a06da9065d', 'ae58ff01-e93a-5398-98a8-fc6061fa8ae8', 'A', 'Stop all treatment', false, 0),
  ('a03019c8-e1e8-5e1b-a9f3-b50749879f96', 'ae58ff01-e93a-5398-98a8-fc6061fa8ae8', 'B', 'Advance care planning, discussing preferences and recording them (including treatment escalation plan and DNACPR if appropriate)', true, 1),
  ('563442b6-69ae-5004-8533-ade4cb06a739', 'ae58ff01-e93a-5398-98a8-fc6061fa8ae8', 'C', 'Refer to ICU', false, 2),
  ('ef353a60-a2da-5934-bf9f-697b4a808c6c', 'ae58ff01-e93a-5398-98a8-fc6061fa8ae8', 'D', 'Wait until he is unconscious', false, 3),
  ('481316e2-169f-5908-b15b-c8aa70844763', 'ae58ff01-e93a-5398-98a8-fc6061fa8ae8', 'E', 'Do not discuss', false, 4);

-- Q585
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('c033c4f3-373b-5dab-8811-e4ecb124fdc5', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000031', 'sba', 'A 28 year old woman has had three proven UTIs in the last 6 months. Each settled with antibiotics. She is not pregnant. Urinalysis between episodes is normal. What is the MOST appropriate next step?', 'NICE NG112: recurrent UTI is 2 or more in 6 months or 3 or more in 12 months. Options include hydration, avoiding delay in voiding, vaginal oestrogen in postmenopausal women, methenamine and antibiotic prophylaxis. Investigate men, people with haematuria or atypical features.', null, true, true, jsonb_build_object('source', 'plab1-xlsx-v6', 'guidelines_text', 'NICE NG112')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = 'c033c4f3-373b-5dab-8811-e4ecb124fdc5';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('c7362e7b-2826-55f7-9f17-0b298864c203', 'c033c4f3-373b-5dab-8811-e4ecb124fdc5', 'A', 'Renal biopsy', false, 0),
  ('21053c51-5bfa-56f7-a79e-29bda5c9e97a', 'c033c4f3-373b-5dab-8811-e4ecb124fdc5', 'B', 'Cystoscopy urgently', false, 1),
  ('0945631b-5f55-5b41-bd96-6eed1434b0bb', 'c033c4f3-373b-5dab-8811-e4ecb124fdc5', 'C', 'No action', false, 2),
  ('cb82045a-9657-5a27-b18c-63d6fc9cab90', 'c033c4f3-373b-5dab-8811-e4ecb124fdc5', 'D', 'Discuss behavioural measures and options including antibiotic prophylaxis (post-coital or daily) or methenamine hippurate', true, 3),
  ('56906a65-a1e0-5326-b158-a0fcaecba18a', 'c033c4f3-373b-5dab-8811-e4ecb124fdc5', 'E', 'Lifelong daily ciprofloxacin', false, 4);

-- Q586
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('e119efb8-610c-52c5-aef3-d03f49042bb3', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000031', 'sba', 'A 72 year old woman has had recurrent UTIs since menopause. She has vaginal dryness. What is the SINGLE most appropriate first-line preventive measure?', 'Vaginal oestrogen restores vaginal flora and reduces recurrent UTI in postmenopausal women (NICE NG112). Review within 12 months.', null, true, true, jsonb_build_object('source', 'plab1-xlsx-v6', 'guidelines_text', 'NICE NG112')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = 'e119efb8-610c-52c5-aef3-d03f49042bb3';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('0d751ad8-c4b1-5e1c-9342-b6aeed2834af', 'e119efb8-610c-52c5-aef3-d03f49042bb3', 'A', 'Cranberry tablets as sole treatment', false, 0),
  ('c3bf75e7-bdc7-55b4-bd6f-af87a1f8e580', 'e119efb8-610c-52c5-aef3-d03f49042bb3', 'B', 'Topical vaginal oestrogen', true, 1),
  ('25ebdfa5-144b-580d-befc-ace378536010', 'e119efb8-610c-52c5-aef3-d03f49042bb3', 'C', 'Long-term catheter', false, 2),
  ('e460b871-dc3e-5d75-8725-08003c8282c3', 'e119efb8-610c-52c5-aef3-d03f49042bb3', 'D', 'Oral HRT', false, 3),
  ('aeebddc2-2eea-5dab-aeb9-a01400f85aa5', 'e119efb8-610c-52c5-aef3-d03f49042bb3', 'E', 'Daily ciprofloxacin', false, 4);

-- Q587
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('56a69574-7445-52a2-8dd3-77a980625146', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000031', 'sba', 'A 45 year old man has had loin pain and a stone of 4 mm in the distal ureter on CT KUB. He has no fever and pain is controlled. What is the SINGLE most appropriate management?', 'NICE NG118: NSAIDs are first-line analgesia. Stones under 5 mm often pass. Consider an alpha-blocker for distal ureteric stones under 10 mm. Intervene if pain persists, stone unlikely to pass, or obstruction with infection.', null, true, true, jsonb_build_object('source', 'plab1-xlsx-v6', 'guidelines_text', 'NICE NG118')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = '56a69574-7445-52a2-8dd3-77a980625146';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('f7f602d2-6f66-5a34-921f-a653411bfd7f', '56a69574-7445-52a2-8dd3-77a980625146', 'A', 'Emergency nephrostomy', false, 0),
  ('af093e68-2223-5bfb-be25-1fe865e51cf1', '56a69574-7445-52a2-8dd3-77a980625146', 'B', 'Open surgery', false, 1),
  ('4615eacf-ef14-5a37-a6d1-d5513877cca2', '56a69574-7445-52a2-8dd3-77a980625146', 'C', 'Watchful waiting with analgesia (most stones under 5 mm pass spontaneously); alpha-blocker if distal stone under 10 mm', true, 2),
  ('5a7ce4f1-dd13-5c8d-920d-d8d354ecf7cb', '56a69574-7445-52a2-8dd3-77a980625146', 'D', 'Percutaneous nephrolithotomy', false, 3),
  ('768548ca-6e5a-5325-8575-36216e109837', '56a69574-7445-52a2-8dd3-77a980625146', 'E', 'IV antibiotics', false, 4);

-- Q588
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('5bea8573-1932-52fb-882a-373bed8372b7', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000031', 'sba', 'A 50 year old woman has an obstructing ureteric stone with fever of 39 °C and a raised white cell count. What is the SINGLE most appropriate management?', 'An infected obstructed kidney is a urological emergency (risk of urosepsis). Decompress first, treat infection, and remove the stone later.', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v6')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = '5bea8573-1932-52fb-882a-373bed8372b7';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('b33aaa9d-f62a-5515-9165-3c584f1268e1', '5bea8573-1932-52fb-882a-373bed8372b7', 'A', 'Oral antibiotics and discharge', false, 0),
  ('18d36fee-103c-50df-b1d0-0ed455930a37', '5bea8573-1932-52fb-882a-373bed8372b7', 'B', 'Alpha-blocker only', false, 1),
  ('c9437d9b-a5f0-57b1-a028-459845170e5c', '5bea8573-1932-52fb-882a-373bed8372b7', 'C', 'Lithotripsy now', false, 2),
  ('f4e89fc6-e11b-5654-bd89-da4922c8cf4c', '5bea8573-1932-52fb-882a-373bed8372b7', 'D', 'Urgent decompression (nephrostomy or ureteric stent) with IV antibiotics', true, 3),
  ('f812f83f-2906-555b-b288-d5cd63f4bf24', '5bea8573-1932-52fb-882a-373bed8372b7', 'E', 'Wait for the stone to pass', false, 4);

-- Q589
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('a2c0f19d-9563-51bc-9260-cf4d1cc55770', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000031', 'sba', 'A 35 year old man has a 12 mm renal pelvis stone that is causing recurrent pain. What is the SINGLE most likely definitive treatment?', 'NICE NG118: renal stones 10-20 mm: shockwave lithotripsy or ureteroscopy. Over 20 mm: percutaneous nephrolithotomy. Smaller asymptomatic renal stones may be observed.', null, true, true, jsonb_build_object('source', 'plab1-xlsx-v6', 'guidelines_text', 'NICE NG118')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = 'a2c0f19d-9563-51bc-9260-cf4d1cc55770';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('f6afbaec-2694-587b-8254-a9246308a65d', 'a2c0f19d-9563-51bc-9260-cf4d1cc55770', 'A', 'Alpha-blocker', false, 0),
  ('8fbac2ff-7d21-5635-a6c8-2f991b0511b1', 'a2c0f19d-9563-51bc-9260-cf4d1cc55770', 'B', 'Shockwave lithotripsy or ureteroscopy (flexible) with laser', true, 1),
  ('6266b4f5-02af-5134-b2d6-5113f8dfff0c', 'a2c0f19d-9563-51bc-9260-cf4d1cc55770', 'C', 'Nephrectomy', false, 2),
  ('65aec979-9193-57b8-a844-6c57c33fc9ed', 'a2c0f19d-9563-51bc-9260-cf4d1cc55770', 'D', 'Open pyelolithotomy', false, 3),
  ('95c57278-b11a-5107-870a-97177f5e7866', 'a2c0f19d-9563-51bc-9260-cf4d1cc55770', 'E', 'Watchful waiting', false, 4);

-- Q590
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('3e36153c-7f41-594f-bb21-4e6292547c61', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000031', 'sba', 'A 70 year old man has had nocturia, frequency and weak stream. His IPSS score is moderate. Prostate feels smooth and enlarged (about 50 g). PSA is normal. He is bothered by symptoms. What is the SINGLE most appropriate first drug?', 'NICE CG97: alpha-blockers for moderate-severe LUTS. 5-alpha reductase inhibitors for enlarged prostates (over 30 g or PSA over 1.4) at risk of progression; combine if both apply. Finasteride takes 6 months to work.', null, true, true, jsonb_build_object('source', 'plab1-xlsx-v6', 'guidelines_text', 'NICE CG97')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = '3e36153c-7f41-594f-bb21-4e6292547c61';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('6b09eb56-718f-5a34-bb36-5cde880040e8', '3e36153c-7f41-594f-bb21-4e6292547c61', 'A', 'Finasteride alone for immediate relief', false, 0),
  ('4306e0ca-c742-55a8-aab6-b0549df91322', '3e36153c-7f41-594f-bb21-4e6292547c61', 'B', 'Alpha-blocker (e.g. tamsulosin)', true, 1),
  ('8c891f75-036f-5a16-b22c-f46cde131209', '3e36153c-7f41-594f-bb21-4e6292547c61', 'C', 'Bicalutamide', false, 2),
  ('f807262e-11ca-59ea-aef6-a376cbe3e197', '3e36153c-7f41-594f-bb21-4e6292547c61', 'D', 'Desmopressin', false, 3),
  ('246dd8f2-619a-51a8-a745-dd1bd91a2088', '3e36153c-7f41-594f-bb21-4e6292547c61', 'E', 'Oxybutynin', false, 4);

-- Q591
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('a2767732-3b2c-56bf-ad3b-809cd6732f99', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000031', 'sba', 'A 75 year old man has had BPH and starts finasteride. What should he be told about his PSA?', '5-alpha reductase inhibitors reduce PSA by about 50% after 6 months. A rising PSA on finasteride needs investigation. Side effects: reduced libido, erectile dysfunction, gynaecomastia.', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v6')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = 'a2767732-3b2c-56bf-ad3b-809cd6732f99';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('23958cab-bf0c-551d-9dde-d883cba7da02', 'a2767732-3b2c-56bf-ad3b-809cd6732f99', 'A', 'PSA becomes unreliable and should never be checked', false, 0),
  ('f0c3ef34-3a41-59be-87b5-4b8c9a404801', 'a2767732-3b2c-56bf-ad3b-809cd6732f99', 'B', 'PSA will double', false, 1),
  ('edcd2cfc-6f4c-5ce7-ab2a-f9c6706f0cb7', 'a2767732-3b2c-56bf-ad3b-809cd6732f99', 'C', 'Finasteride roughly halves PSA, so values must be interpreted accordingly', true, 2),
  ('42cc0b91-6f4d-5a53-8161-d7a23a798fc0', 'a2767732-3b2c-56bf-ad3b-809cd6732f99', 'D', 'PSA will be undetectable', false, 3),
  ('7efd9b49-246b-544c-aee2-2b71da082f56', 'a2767732-3b2c-56bf-ad3b-809cd6732f99', 'E', 'No effect on PSA', false, 4);

-- Q592
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('cc707c13-d50e-5930-8c00-4d931420b0fd', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000031', 'sba', 'A 55 year old man has had erectile dysfunction for 1 year. Morning erections are absent. He has hypertension and is overweight. What is the MOST important additional assessment?', 'ED is often vascular and a marker of cardiovascular disease. Check QRISK, glucose, lipids and testosterone. PDE5 inhibitors are first line; contraindicated with nitrates.', null, true, true, jsonb_build_object('source', 'plab1-xlsx-v6')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = 'cc707c13-d50e-5930-8c00-4d931420b0fd';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('2116ae28-3d36-53a5-9542-392a3f75e362', 'cc707c13-d50e-5930-8c00-4d931420b0fd', 'A', 'Testicular ultrasound', false, 0),
  ('bf0bf581-5cbd-5b3c-80c4-0c6c71a5e441', 'cc707c13-d50e-5930-8c00-4d931420b0fd', 'B', 'Penile ultrasound only', false, 1),
  ('0fce4630-3047-52de-8ef4-eab4ceb1e622', 'cc707c13-d50e-5930-8c00-4d931420b0fd', 'C', 'Urinary flow test', false, 2),
  ('b378459c-fd78-5bc5-8ec2-4886754f8f72', 'cc707c13-d50e-5930-8c00-4d931420b0fd', 'D', 'Cardiovascular risk assessment (lipids, HbA1c, BP) and morning testosterone', true, 3),
  ('b7459e64-c134-5601-bdb3-c6d3ce7056b5', 'cc707c13-d50e-5930-8c00-4d931420b0fd', 'E', 'Psychological assessment only', false, 4);

-- Q593
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('c3ac4266-a88b-525c-b8f3-bf5bcc383c62', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000031', 'sba', 'A 40 year old man is taking sildenafil for erectile dysfunction. Which medicine is an ABSOLUTE contraindication?', 'PDE5 inhibitors with nitrates can cause severe hypotension. Use caution with alpha-blockers. Seek help for erections over 4 hours.', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v6')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = 'c3ac4266-a88b-525c-b8f3-bf5bcc383c62';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('1dfeedea-0b32-533a-bce0-f7550732d717', 'c3ac4266-a88b-525c-b8f3-bf5bcc383c62', 'A', 'Ramipril', false, 0),
  ('68b660cb-4e76-5c8e-a63e-44cdbe70d1c7', 'c3ac4266-a88b-525c-b8f3-bf5bcc383c62', 'B', 'Metformin', false, 1),
  ('f9e9e42a-7c22-571c-a4f9-b174e3f9c1cb', 'c3ac4266-a88b-525c-b8f3-bf5bcc383c62', 'C', 'Isosorbide mononitrate (or any nitrate)', true, 2),
  ('ec365442-eadb-51b4-bdf2-7bba1822ecc9', 'c3ac4266-a88b-525c-b8f3-bf5bcc383c62', 'D', 'Amlodipine', false, 3),
  ('e6adbaeb-b4db-55b2-b06c-b71815b87387', 'c3ac4266-a88b-525c-b8f3-bf5bcc383c62', 'E', 'Atorvastatin', false, 4);

-- Q594
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('372583a8-c54e-56e3-95b8-75015f0d1d94', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000031', 'sba', 'A 6 week old boy has a scrotal swelling that transilluminates and you can get above it. It does not change in size during the day. What is the SINGLE most likely diagnosis and management?', 'Congenital hydroceles result from a patent processus vaginalis. Most resolve. Surgery if persistent beyond 2 years. Inguinal hernias in infants need prompt repair because of incarceration risk.', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v6')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = '372583a8-c54e-56e3-95b8-75015f0d1d94';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('8368b90f-7e47-5212-9462-dc5816be3d74', '372583a8-c54e-56e3-95b8-75015f0d1d94', 'A', 'Testicular torsion', false, 0),
  ('6730e981-b31a-5bc4-ad97-096973b14aa8', '372583a8-c54e-56e3-95b8-75015f0d1d94', 'B', 'Congenital hydrocele; observe, as most resolve by 1-2 years', true, 1),
  ('f6c7bd19-763c-56f2-aec5-a455822c5468', '372583a8-c54e-56e3-95b8-75015f0d1d94', 'C', 'Varicocele', false, 2),
  ('c4a312fe-d36f-5008-87d7-453d54ae462a', '372583a8-c54e-56e3-95b8-75015f0d1d94', 'D', 'Inguinal hernia needing urgent surgery', false, 3),
  ('b3e3a339-6609-5edf-902f-7647c05bb5e0', '372583a8-c54e-56e3-95b8-75015f0d1d94', 'E', 'Testicular tumour', false, 4);

-- Q595
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('6c550c17-717b-52b2-a949-8b02ae018faf', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000031', 'sba', 'A 60 year old man has had a hard, painless lump in his testis. What is the SINGLE most likely tumour type at this age?', 'Testicular lymphoma is the most common testicular tumour in men over 60. Germ cell tumours (seminoma, non-seminoma) occur in younger men (20-45).', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v6')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = '6c550c17-717b-52b2-a949-8b02ae018faf';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('d4cda3bb-7f01-5279-8eb5-b2f4f9e6dc3a', '6c550c17-717b-52b2-a949-8b02ae018faf', 'A', 'Seminoma', false, 0),
  ('66349328-b025-55d5-bcef-cd8873ca68aa', '6c550c17-717b-52b2-a949-8b02ae018faf', 'B', 'Lymphoma', true, 1),
  ('d27d5194-a1d0-542d-bd3b-a7642c94b74c', '6c550c17-717b-52b2-a949-8b02ae018faf', 'C', 'Leydig cell tumour', false, 2),
  ('538d49bb-4dee-54f4-b970-9f2dd0369cfc', '6c550c17-717b-52b2-a949-8b02ae018faf', 'D', 'Teratoma', false, 3),
  ('09000613-5c69-5e6c-b2f4-ce8cc4a82342', '6c550c17-717b-52b2-a949-8b02ae018faf', 'E', 'Yolk sac tumour', false, 4);

-- Q596
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('47ac2338-2550-5cdc-b7e8-0d1d287f12e3', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000031', 'sba', 'A 30 year old man has a testicular tumour. Before orchidectomy, which tumour markers should be measured?', 'AFP is raised in non-seminomas (yolk sac); hCG can be raised in seminoma and choriocarcinoma; LDH reflects tumour bulk. Markers help diagnosis, staging and follow-up. Offer sperm banking.', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v6')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = '47ac2338-2550-5cdc-b7e8-0d1d287f12e3';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('ef9bd8d4-3232-5467-9ca0-ce10646f3540', '47ac2338-2550-5cdc-b7e8-0d1d287f12e3', 'A', 'CEA, CA 19-9', false, 0),
  ('443b5c2c-61de-50e0-99f9-a112af7b9ab5', '47ac2338-2550-5cdc-b7e8-0d1d287f12e3', 'B', 'AFP, beta-hCG and LDH', true, 1),
  ('a6ec7c8c-ce5b-53d9-8240-8939e7a0bbbd', '47ac2338-2550-5cdc-b7e8-0d1d287f12e3', 'C', 'CA-125', false, 2),
  ('fee5062f-f6dd-51db-826f-7890a906afa6', '47ac2338-2550-5cdc-b7e8-0d1d287f12e3', 'D', 'PSA', false, 3),
  ('44273efe-7d7b-5cd0-8337-419253d8de51', '47ac2338-2550-5cdc-b7e8-0d1d287f12e3', 'E', 'Calcitonin', false, 4);

-- Q597
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('1ed64ebf-8677-591a-8bcf-91a756e0e8bd', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000031', 'sba', 'A 65 year old man has had a non-muscle invasive bladder cancer resected (TURBT). It is high grade. What is the SINGLE most appropriate further treatment?', 'High-risk non-muscle invasive bladder cancer is treated with induction and maintenance intravesical BCG. Muscle-invasive disease: radical cystectomy or radiotherapy with neoadjuvant chemotherapy.', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v6')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = '1ed64ebf-8677-591a-8bcf-91a756e0e8bd';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('9f1e194a-3009-5b46-8698-d8d7224c8c4b', '1ed64ebf-8677-591a-8bcf-91a756e0e8bd', 'A', 'No further treatment', false, 0),
  ('892a174d-cc70-5386-9cc2-2002d3bd781d', '1ed64ebf-8677-591a-8bcf-91a756e0e8bd', 'B', 'Oral chemotherapy', false, 1),
  ('55e3bada-9e40-57ca-bea8-920c787fcee5', '1ed64ebf-8677-591a-8bcf-91a756e0e8bd', 'C', 'Intravesical BCG (immunotherapy)', true, 2),
  ('0674805a-eab0-5b6f-92b3-4c45aa27e5ce', '1ed64ebf-8677-591a-8bcf-91a756e0e8bd', 'D', 'Radiotherapy alone', false, 3),
  ('98bb6c5f-db9f-5b1c-99b8-7e7367580198', '1ed64ebf-8677-591a-8bcf-91a756e0e8bd', 'E', 'Radical cystectomy for all', false, 4);

-- Q598
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('86279a9e-108a-5990-9b57-774b4200f23e', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000032', 'sba', 'A 45 year old man smokes heavily and has had painful fingertip ulcers, foot claudication and superficial thrombophlebitis. He has no diabetes or high cholesterol. What is the SINGLE most likely diagnosis?', 'Buerger''s disease affects young male smokers, involving small and medium vessels of hands and feet. Stopping smoking completely is the only effective treatment.', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v6')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = '86279a9e-108a-5990-9b57-774b4200f23e';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('7dcb585c-8c78-526b-b33a-77713e907e43', '86279a9e-108a-5990-9b57-774b4200f23e', 'A', 'Atherosclerosis', false, 0),
  ('61f07ec6-9115-5c98-a598-48b1704a0035', '86279a9e-108a-5990-9b57-774b4200f23e', 'B', 'Scleroderma', false, 1),
  ('1bce7943-67ad-590d-b510-a35129431a98', '86279a9e-108a-5990-9b57-774b4200f23e', 'C', 'Thromboangiitis obliterans (Buerger''s disease)', true, 2),
  ('1868c3f1-fb6a-52f1-ab58-72316d2dedcd', '86279a9e-108a-5990-9b57-774b4200f23e', 'D', 'Raynaud''s disease', false, 3),
  ('38281b31-c250-5d9d-b33d-e302c53243ff', '86279a9e-108a-5990-9b57-774b4200f23e', 'E', 'Takayasu arteritis', false, 4);

-- Q599
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('5cbbf498-d4f5-5322-bcbe-4e2031de65a2', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000032', 'sba', 'A 70 year old woman has had a cold, painful, pale left leg for 4 hours. She has atrial fibrillation and is not anticoagulated. Sensation and power are reduced. What is the SINGLE most appropriate management?', 'Acute limb ischaemia: 6 Ps (pain, pallor, pulselessness, paraesthesia, paralysis, perishing cold). Sensory or motor loss means the limb is immediately threatened and needs urgent revascularisation. Embolic causes are usually from AF.', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v6')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = '5cbbf498-d4f5-5322-bcbe-4e2031de65a2';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('b11362b6-8265-56da-bd67-edcab4837898', '5cbbf498-d4f5-5322-bcbe-4e2031de65a2', 'A', 'IV heparin and urgent embolectomy (immediately threatened limb)', true, 0),
  ('b61a9c3e-8971-5673-be79-1390d997ef84', '5cbbf498-d4f5-5322-bcbe-4e2031de65a2', 'B', 'Catheter-directed thrombolysis over days', false, 1),
  ('591a7213-abd9-5ca4-b298-ae048adc0fec', '5cbbf498-d4f5-5322-bcbe-4e2031de65a2', 'C', 'Elevate the leg', false, 2),
  ('b9ff46fc-b3d3-5e46-bcca-e98231e68724', '5cbbf498-d4f5-5322-bcbe-4e2031de65a2', 'D', 'Compression stockings', false, 3),
  ('8edbd199-6b51-5e09-b280-dc18d38bb781', '5cbbf498-d4f5-5322-bcbe-4e2031de65a2', 'E', 'Aspirin and review', false, 4);

-- Q600
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('4704b76d-6ec6-5e25-9bd3-19243c3f682a', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000032', 'sba', 'A 65 year old man has had a pulsatile lump behind his knee. He has had an aortic aneurysm repaired. What is the MOST important complication of a popliteal aneurysm?', 'Popliteal aneurysms are the most common peripheral aneurysm; about half are bilateral and many coexist with AAA. Thrombosis and embolism threaten the limb. Repair when over 2 cm or symptomatic.', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v6')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = '4704b76d-6ec6-5e25-9bd3-19243c3f682a';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('916a6dcb-5094-5200-887a-c250a123020d', '4704b76d-6ec6-5e25-9bd3-19243c3f682a', 'A', 'No complications', false, 0),
  ('309112c1-df03-5746-9428-b0a37c11d026', '4704b76d-6ec6-5e25-9bd3-19243c3f682a', 'B', 'Thrombosis or distal embolisation causing acute limb ischaemia', true, 1),
  ('af72d406-f731-5bc4-a3ca-742bca84f20a', '4704b76d-6ec6-5e25-9bd3-19243c3f682a', 'C', 'Nerve compression only', false, 2),
  ('4203255a-b38d-59af-ad09-f6ef428b93f6', '4704b76d-6ec6-5e25-9bd3-19243c3f682a', 'D', 'Rupture is the commonest complication', false, 3),
  ('e17361cb-6694-5d6e-8216-8f9fa0a20958', '4704b76d-6ec6-5e25-9bd3-19243c3f682a', 'E', 'Venous ulcers', false, 4);

