-- =============================================================================
-- PLAB 1 bank v6 part 02: Q201–400 (source plab1-xlsx-v6)
-- Source: PLAB1_Question_Bank_6.xlsx — additive; does not clear v1/v2/v3/v4
-- Safe to re-run (stable UUIDs).
-- =============================================================================

-- Ensure exam exists
insert into public.exams (id, slug, name, description, is_active) values ('a1000000-0000-4000-8000-000000000001', 'plab1', 'PLAB 1', 'PLAB 1 single best answer study bank (PLABoratory).', true) on conflict (slug) do update set name = excluded.name, is_active = true;


-- Q201
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('1b4ef811-2f2f-558d-b550-3457d5453993', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000009', 'sba', 'A 14 month old girl is brought in with a 2-day history of vomiting and diarrhoea, now with 10 watery stools in 24 hours. She has not passed urine for 12 hours. She is drowsy but rousable. HR 170, RR 45, capillary refill time 4 seconds, cool peripheries, sunken eyes and dry mucous membranes. Weight 10 kg. What is the SINGLE most appropriate immediate management?', 'This child has clinical shock (drowsy, cold peripheries, prolonged CRT, tachycardia). NICE: give a rapid IV bolus of 10 mL/kg 0.9% saline (or balanced crystalloid), reassess and repeat if needed, then rehydrate and give maintenance fluids. Check electrolytes and glucose.', null, true, true, jsonb_build_object('source', 'plab1-xlsx-v6', 'guidelines_text', 'NICE')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = '1b4ef811-2f2f-558d-b550-3457d5453993';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('ac59ea20-8c6d-5cf9-bd2d-834936889a06', '1b4ef811-2f2f-558d-b550-3457d5453993', 'A', 'Loperamide', false, 0),
  ('19e6ae64-b9bf-54d5-93f4-5116067333b3', '1b4ef811-2f2f-558d-b550-3457d5453993', 'B', 'Wait for blood results before fluids', false, 1),
  ('e993ed2b-6d0a-50e8-8e29-4db96a09ab1d', '1b4ef811-2f2f-558d-b550-3457d5453993', 'C', 'IV bolus of 10 mL/kg 0.9% saline, reassess, then rehydration fluids with electrolyte monitoring', true, 2),
  ('3ceb81ac-5703-57a9-a59c-598befb7bae9', '1b4ef811-2f2f-558d-b550-3457d5453993', 'D', 'IV 5% dextrose', false, 3),
  ('414d02d9-b061-5f3c-97f4-9c93a591b0ff', '1b4ef811-2f2f-558d-b550-3457d5453993', 'E', 'Oral rehydration solution only', false, 4);

-- Q202
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('919e655f-c56f-5a27-b418-26f2757975d1', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000009', 'sba', 'A 6 year old boy has had a sore throat and fever for 3 days, now with swelling around his eyes and passing reduced amounts of cola-coloured urine. He had impetigo 3 weeks ago. BP is 135/90 (above the 99th centile). Urine dipstick: blood 3+, protein 2+. Bloods: creatinine 95 µmol/L (raised for age), C3 low, ASO titre raised. What is the SINGLE most likely diagnosis?', 'Post-streptococcal GN follows throat infection (1-2 weeks) or skin infection (3-6 weeks), with nephritic syndrome (haematuria, hypertension, oedema, oliguria) and low C3. Supportive care: fluid and salt restriction, antihypertensives and diuretics. C3 normalises within 8 weeks; persistent low C3 suggests another cause.', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v6')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = '919e655f-c56f-5a27-b418-26f2757975d1';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('696ab9ac-cda5-5969-8c0e-c13dee3fde8b', '919e655f-c56f-5a27-b418-26f2757975d1', 'A', 'Henoch-Schönlein purpura', false, 0),
  ('ea349a7b-2856-5de4-9895-2bc0ad3485da', '919e655f-c56f-5a27-b418-26f2757975d1', 'B', 'Minimal change disease', false, 1),
  ('d56c9255-74cb-5152-8f00-c0f551f54776', '919e655f-c56f-5a27-b418-26f2757975d1', 'C', 'Haemolytic uraemic syndrome', false, 2),
  ('d4a35dad-8628-563c-94db-71abe4166e3b', '919e655f-c56f-5a27-b418-26f2757975d1', 'D', 'IgA nephropathy', false, 3),
  ('2efbf18f-7e9a-5b23-8b3a-fa07c8cee9d3', '919e655f-c56f-5a27-b418-26f2757975d1', 'E', 'Post-streptococcal glomerulonephritis', true, 4);

-- Q203
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('b39632a9-c0da-525b-aadb-d28273f83e69', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000006', 'sba', 'A 66 year old right-handed man is brought in by ambulance. His wife noticed that at 14:30, while eating lunch, his speech became garbled and he dropped his fork from his right hand. It is now 15:45. He has AF and stopped warfarin 2 months ago because of a nosebleed. On examination he has expressive dysphasia, right facial droop sparing the forehead and right arm weakness (power 2/5). BP 175/95. Glucose 6.2. CT head shows no haemorrhage, and CT angiography shows an occluded left middle cerebral artery (M1). What is the SINGLE most appropriate treatment?', 'Acute ischaemic stroke within 4.5 hours with a proximal large vessel occlusion: thrombolysis plus thrombectomy. BP must be below 185/110 before thrombolysis. Anticoagulation for AF is restarted later (timing based on stroke severity). Admit to a hyperacute stroke unit.', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v6')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = 'b39632a9-c0da-525b-aadb-d28273f83e69';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('1832d9dd-e60f-5b44-b107-9f5c7de16a07', 'b39632a9-c0da-525b-aadb-d28273f83e69', 'A', 'IV heparin infusion', false, 0),
  ('7054f08e-bb66-5f2c-8413-6ae9b6f4e4f1', 'b39632a9-c0da-525b-aadb-d28273f83e69', 'B', 'IV thrombolysis (if no contraindications) and mechanical thrombectomy', true, 1),
  ('d1cfd717-69c8-57dd-a1c5-be725fb2c9d5', 'b39632a9-c0da-525b-aadb-d28273f83e69', 'C', 'Start warfarin immediately', false, 2),
  ('2bdab0b4-210b-5247-8cc6-4676a1597da6', 'b39632a9-c0da-525b-aadb-d28273f83e69', 'D', 'Lower BP to 120/80 first', false, 3),
  ('b49c174f-289d-520e-8b2c-99c35d800637', 'b39632a9-c0da-525b-aadb-d28273f83e69', 'E', 'Aspirin 300 mg only', false, 4);

-- Q204
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('316cc6ab-8777-5116-b114-865a3b2c003f', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000006', 'sba', 'A 38 year old woman has a sudden, severe ''worst ever'' headache while at the gym 6 hours ago. She vomited twice and has neck stiffness. She is alert with no focal neurology. BP 160/90. She has polycystic kidney disease. CT head (done 7 hours after onset) is reported as normal. What is the SINGLE most appropriate next step?', 'Thunderclap headache with neck stiffness suggests subarachnoid haemorrhage. ADPKD is associated with berry aneurysms. CT sensitivity falls after 6 hours, so an LP at 12 hours or more is needed if CT is normal. If SAH is confirmed: CT angiography, nimodipine and neurosurgery.', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v6')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = '316cc6ab-8777-5116-b114-865a3b2c003f';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('ac2ef4e2-1178-5d19-8e88-b48966bd696a', '316cc6ab-8777-5116-b114-865a3b2c003f', 'A', 'Discharge with analgesia', false, 0),
  ('5f577e38-f6ac-5a37-812f-ebf03194339a', '316cc6ab-8777-5116-b114-865a3b2c003f', 'B', 'Lumbar puncture at least 12 hours after headache onset for xanthochromia (or CT angiography per local pathway)', true, 1),
  ('1981b670-6824-59ff-b2a9-eb3f80a2753c', '316cc6ab-8777-5116-b114-865a3b2c003f', 'C', 'Repeat CT in 1 week', false, 2),
  ('71fe8cda-40f8-5ce4-94bc-9d1b2c85bc93', '316cc6ab-8777-5116-b114-865a3b2c003f', 'D', 'MRI in 2 weeks', false, 3),
  ('09a50551-48db-50f7-a040-09434cba0b2a', '316cc6ab-8777-5116-b114-865a3b2c003f', 'E', 'Start triptans', false, 4);

-- Q205
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('4ab7804e-1687-51ba-a717-bc05f467e3d2', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000006', 'sba', 'A 52 year old man has a 3-day history of fever, headache and confusion. His wife says he has been behaving strangely and smelling odd smells. Today he had a generalised seizure. Temperature 38.8°C, GCS 13, no rash, mild neck stiffness. MRI shows bilateral temporal lobe high signal. CSF: lymphocytes 120 cells/µL, protein 0.8 g/L, glucose normal, Gram stain negative. What is the SINGLE most appropriate treatment?', 'Herpes simplex encephalitis: fever, confusion, behaviour change, olfactory hallucinations, seizures and temporal lobe changes. CSF lymphocytosis with normal glucose. Start IV aciclovir on suspicion (do not wait for PCR) and give for 14-21 days if confirmed. Mortality is high without treatment.', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v6')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = '4ab7804e-1687-51ba-a717-bc05f467e3d2';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('b48fe4c2-cac9-5a7b-b521-31c42aaf54c3', '4ab7804e-1687-51ba-a717-bc05f467e3d2', 'A', 'Antiepileptics alone', false, 0),
  ('dbc407ec-e2e0-5e53-afcb-34aa488a775d', '4ab7804e-1687-51ba-a717-bc05f467e3d2', 'B', 'IV ceftriaxone alone', false, 1),
  ('567c86f1-1715-5922-a687-758ec9458db7', '4ab7804e-1687-51ba-a717-bc05f467e3d2', 'C', 'Oral aciclovir', false, 2),
  ('fa113165-df69-5181-8d29-e58c371a065a', '4ab7804e-1687-51ba-a717-bc05f467e3d2', 'D', 'IV aciclovir (10 mg/kg 8-hourly), continued until HSV PCR results and clinical picture guide duration', true, 3),
  ('44022076-4f1b-54bb-ac9c-8366f0f633a7', '4ab7804e-1687-51ba-a717-bc05f467e3d2', 'E', 'IV steroids alone', false, 4);

-- Q206
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('e2486268-4b5a-5599-8075-4a7e06133dee', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000003', 'sba', 'A 48 year old man with alcohol-related cirrhosis is brought in after vomiting about a pint of fresh blood. He has had melaena. He is confused and jaundiced with ascites. HR 128, BP 84/52. Hb 72 g/L, platelets 65, INR 1.9. What is the SINGLE most appropriate initial management (before endoscopy)?', 'Suspected variceal bleed: resuscitate (avoid over-transfusion, which raises portal pressure), terlipressin, prophylactic antibiotics, and endoscopy within 24 hours (immediately after resuscitation if unstable) for band ligation. Balloon tamponade or TIPSS if uncontrolled. Treat encephalopathy with lactulose.', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v6')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = 'e2486268-4b5a-5599-8075-4a7e06133dee';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('a8e29ae4-ea66-5b34-8c31-d8b1decf3677', 'e2486268-4b5a-5599-8075-4a7e06133dee', 'A', 'TIPSS before endoscopy in all', false, 0),
  ('04074d08-7e6e-5f10-95db-197631c4718f', 'e2486268-4b5a-5599-8075-4a7e06133dee', 'B', 'Resuscitate (blood transfusion to target Hb 70-80 g/L), IV terlipressin and IV antibiotics, then urgent endoscopy for band ligation', true, 1),
  ('f55d7543-166a-5c95-a83e-e75740378c06', 'e2486268-4b5a-5599-8075-4a7e06133dee', 'C', 'IV PPI alone and endoscopy in 48 hours', false, 2),
  ('40df2c2b-0f66-5ce6-a724-56b189917523', 'e2486268-4b5a-5599-8075-4a7e06133dee', 'D', 'Oral propranolol immediately', false, 3),
  ('2a636bb8-1be0-5405-af35-a2914cbd78d4', 'e2486268-4b5a-5599-8075-4a7e06133dee', 'E', 'Aim for Hb 140 g/L', false, 4);

-- Q207
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('2dff13e7-43aa-5d9f-808f-b09d08ab303e', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000003', 'sba', 'A 42 year old woman has a 1-day history of severe epigastric pain radiating to her back, with vomiting. She has known gallstones. Temperature 37.9°C, HR 115, BP 105/65, RR 24, SpO2 93% on air. Bloods: amylase 2,100, WCC 17, CRP 210, glucose 11, calcium 1.95, urea 9, albumin 30, LDH raised, PaO2 7.8 kPa. What does her modified Glasgow score indicate?', 'Modified Glasgow (PANCREAS): PaO2 below 8, Age over 55, Neutrophilia (WCC over 15), Calcium below 2, Renal (urea over 16), Enzymes (LDH over 600 or AST over 200), Albumin below 32, Sugar (glucose over 10). Three or more indicates severe disease. Aggressive fluids, oxygen and critical care input.', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v6')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = '2dff13e7-43aa-5d9f-808f-b09d08ab303e';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('4fc08ced-2027-5982-8f68-09f337932e46', '2dff13e7-43aa-5d9f-808f-b09d08ab303e', 'A', 'Not pancreatitis', false, 0),
  ('7698dbcf-7144-52a5-835d-c719994d72b6', '2dff13e7-43aa-5d9f-808f-b09d08ab303e', 'B', 'Moderate; ward care with no monitoring', false, 1),
  ('aa3afc4f-40f6-5450-a6f8-d9c1e3beb2cf', '2dff13e7-43aa-5d9f-808f-b09d08ab303e', 'C', 'Severe acute pancreatitis (score of 3 or more); needs HDU/ICU review', true, 2),
  ('0cac4339-0ada-556e-ad0a-d9f734e4f353', '2dff13e7-43aa-5d9f-808f-b09d08ab303e', 'D', 'Chronic pancreatitis', false, 3),
  ('fe56e7bc-6387-5011-8ef7-0aa3e7a96b87', '2dff13e7-43aa-5d9f-808f-b09d08ab303e', 'E', 'Mild pancreatitis; discharge', false, 4);

-- Q208
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('e8d585ce-553c-5d75-b981-fdb6232f28eb', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000013', 'sba', 'A 54 year old man with motor neurone disease has had progressive weakness over 3 years. He is now dependent on non-invasive ventilation for most of the day. He has capacity. He tells his consultant, clearly and consistently over several conversations, that he wants the ventilator removed because the burden of treatment is no longer acceptable to him. His wife is very upset and asks the team to continue. What is the CORRECT approach?', 'A competent adult can refuse life-sustaining treatment, including withdrawing ventilation. This is not assisted suicide. Plan carefully with palliative care to relieve breathlessness and distress (opioids, benzodiazepines). Families should be supported but cannot override a capacitous decision.', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v6')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = 'e8d585ce-553c-5d75-b981-fdb6232f28eb';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('bb2dc59e-51c5-5a27-8bb4-757a2dc04244', 'e8d585ce-553c-5d75-b981-fdb6232f28eb', 'A', 'Continue ventilation because his wife disagrees', false, 0),
  ('b4dd91d6-ba12-5b21-a45c-f449b0d2d860', 'e8d585ce-553c-5d75-b981-fdb6232f28eb', 'B', 'Apply to court before any decision', false, 1),
  ('1b1d05b7-edf3-5f5a-ab78-e007856611da', 'e8d585ce-553c-5d75-b981-fdb6232f28eb', 'C', 'Respect his capacitous refusal; plan withdrawal of NIV with palliative care support (symptom control with opioids and sedatives) and support his family', true, 2),
  ('13c56c30-50ab-5a84-997c-02e941945d68', 'e8d585ce-553c-5d75-b981-fdb6232f28eb', 'D', 'Refuse because withdrawal is euthanasia', false, 3),
  ('6e741a8c-d120-53bb-8a5c-cb993af38f52', 'e8d585ce-553c-5d75-b981-fdb6232f28eb', 'E', 'Refer for psychiatric detention', false, 4);

-- Q209
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('ed4827cc-5c64-5597-b994-bbaa88ca7b39', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000007', 'sba', 'A 23 year old university student is brought to the ED by her flatmates at 22:00. She told them she had taken all her antidepressant tablets and wrote a note. She has recently split up with her partner, failed exams and has had low mood for months. She says she still wants to die and plans to try again. Her medical assessment is complete and she is physically well after treatment. She wants to leave the ED. What is the SINGLE most appropriate next step?', 'High-risk features: a note, planning, ongoing intent, recent losses and continuing depression. She needs urgent specialist mental health assessment. If she tries to leave, staff may act under common law or the MCA in an emergency, and the Mental Health Act may be needed. Remove access to means.', null, true, true, jsonb_build_object('source', 'plab1-xlsx-v6', 'guidelines_text', 'Mental Health Act')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = 'ed4827cc-5c64-5597-b994-bbaa88ca7b39';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('6cd1bc3a-b5f5-58aa-a753-e379aecda95f', 'ed4827cc-5c64-5597-b994-bbaa88ca7b39', 'A', 'Allow her to leave as she is an adult', false, 0),
  ('0817558b-34f6-58b7-baf2-4fa5e7c07ffe', 'ed4827cc-5c64-5597-b994-bbaa88ca7b39', 'B', 'Urgent psychiatric assessment; if she tries to leave and is at high risk, assess capacity and use the appropriate legal framework (MCA or Mental Health Act) to keep her safe', true, 1),
  ('3692eef2-f031-549b-9704-19377264f50a', 'ed4827cc-5c64-5597-b994-bbaa88ca7b39', 'C', 'Discharge with a GP letter', false, 2),
  ('d65110d3-9f39-581c-a8fa-b54f40101f28', 'ed4827cc-5c64-5597-b994-bbaa88ca7b39', 'D', 'Ask her flatmates to watch her at home', false, 3),
  ('6c449b49-2ac5-50de-a28d-fe23be8a4fee', 'ed4827cc-5c64-5597-b994-bbaa88ca7b39', 'E', 'Prescribe more antidepressants', false, 4);

-- Q210
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('81172048-ebc8-5bac-b1ee-aa3eecf3aa7a', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000019', 'sba', 'A 67 year old woman has had a headache for 2 weeks over her right temple, pain in her jaw when chewing, and aches in her shoulders and hips. This morning she had a 10-minute episode of blurred vision in her right eye. She has lost 3 kg. Temporal artery is tender and pulseless. ESR 88, CRP 95, Hb 112, platelets 480. What is the SINGLE most appropriate immediate management?', 'Giant cell arteritis with visual symptoms is an emergency: give IV methylprednisolone (or 60 mg oral prednisolone without visual loss) immediately. Arrange temporal artery ultrasound or biopsy within 1 week. Bone protection, PPI and consider tocilizumab. Polymyalgia symptoms often coexist.', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v6')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = '81172048-ebc8-5bac-b1ee-aa3eecf3aa7a';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('6df9420a-610f-5e3c-9e4b-02ad2c7c892b', '81172048-ebc8-5bac-b1ee-aa3eecf3aa7a', 'A', 'IV methylprednisolone (because of visual symptoms), then high-dose oral prednisolone, with urgent ophthalmology and temporal artery ultrasound or biopsy', true, 0),
  ('31687132-9d18-5e51-b130-45fabbe8b2c2', '81172048-ebc8-5bac-b1ee-aa3eecf3aa7a', 'B', 'NSAIDs', false, 1),
  ('962bb600-123f-5869-bc96-7e2216afc25f', '81172048-ebc8-5bac-b1ee-aa3eecf3aa7a', 'C', 'Wait for biopsy before steroids', false, 2),
  ('8f94ac92-807a-5910-9445-b37db7f77a52', '81172048-ebc8-5bac-b1ee-aa3eecf3aa7a', 'D', 'Aspirin only', false, 3),
  ('eb981294-ef39-5699-b12e-c06b9094c88b', '81172048-ebc8-5bac-b1ee-aa3eecf3aa7a', 'E', 'Oral prednisolone 15 mg', false, 4);

-- Q211
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('ad3157a4-07b7-57e7-b26a-dfa317d90880', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000014', 'sba', 'A 62 year old man has 3 months of fatigue, bone pain in his back and ribs, and two chest infections. He has lost 5 kg. Bloods: Hb 90 g/L, ESR 105, adjusted calcium 2.95 mmol/L, creatinine 180 µmol/L (baseline 90), total protein 92 g/L, albumin 30 g/L. Urine protein:creatinine ratio is high but dipstick protein is only trace. Spine X-ray shows multiple lytic lesions. What is the SINGLE most important set of investigations?', 'Myeloma: CRAB features (hypercalcaemia, renal failure, anaemia, bone lesions), high globulin gap and recurrent infections. Light chains are not detected on dipstick. Confirm with electrophoresis, free light chains, BJP and marrow. Manage hypercalcaemia (fluids, bisphosphonates) and avoid nephrotoxic drugs.', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v6')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = 'ad3157a4-07b7-57e7-b26a-dfa317d90880';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('bdee5230-5f0d-54da-8e97-ed59a1252e10', 'ad3157a4-07b7-57e7-b26a-dfa317d90880', 'A', 'Thyroid function only', false, 0),
  ('ab16308e-f6c2-5885-b0ab-eb28a9e4f33d', 'ad3157a4-07b7-57e7-b26a-dfa317d90880', 'B', 'Repeat X-rays in 6 months', false, 1),
  ('b71ea7bc-a983-5d77-bb29-8b776d9c5b61', 'ad3157a4-07b7-57e7-b26a-dfa317d90880', 'C', 'PSA only', false, 2),
  ('8554ce85-e474-5568-a3e7-5957fcb1410e', 'ad3157a4-07b7-57e7-b26a-dfa317d90880', 'D', 'Serum protein electrophoresis, serum free light chains and urine Bence Jones protein, then bone marrow biopsy', true, 3),
  ('bc66cfb0-c0a7-5c66-ba1c-f36bb0bcf9dd', 'ad3157a4-07b7-57e7-b26a-dfa317d90880', 'E', 'Liver ultrasound', false, 4);

-- Q212
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('6efe8c23-107f-5a1b-bc9e-b41d4c74c45f', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000004', 'sba', 'A 44 year old woman has had palpitations, anxiety, heat intolerance and weight loss of 6 kg over 3 months. She has diarrhoea and her periods are lighter. Examination: HR 118 (irregularly irregular), fine tremor, warm sweaty hands, a diffuse smooth goitre with a bruit, lid lag and proptosis. Bloods: TSH below 0.01, free T4 48 pmol/L. TSH receptor antibodies are positive. What are the SINGLE most appropriate initial treatments?', 'Graves'' disease with thyrotoxic AF: beta-blocker, antithyroid drugs (carbimazole), and anticoagulation based on stroke risk. Thyroid eye disease: stop smoking and refer to ophthalmology; avoid radioiodine in active eye disease. AF often reverts when euthyroid.', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v6')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = '6efe8c23-107f-5a1b-bc9e-b41d4c74c45f';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('b1ec37fa-8c79-50b2-bbb1-763d6b00f48f', '6efe8c23-107f-5a1b-bc9e-b41d4c74c45f', 'A', 'Thyroidectomy immediately', false, 0),
  ('4a59e5bb-7e33-5da6-8fe4-a7589822af12', '6efe8c23-107f-5a1b-bc9e-b41d4c74c45f', 'B', 'Amiodarone', false, 1),
  ('ea01d580-9143-5641-a854-7d5fb8d23890', '6efe8c23-107f-5a1b-bc9e-b41d4c74c45f', 'C', 'Beta-blocker (propranolol) for symptoms and rate control, carbimazole, and anticoagulation assessment for AF (CHA2DS2-VASc)', true, 2),
  ('0a95ff50-4003-529d-be13-31e612107cb3', '6efe8c23-107f-5a1b-bc9e-b41d4c74c45f', 'D', 'Levothyroxine', false, 3),
  ('2690adda-bf64-53dd-9eac-4aced6001fd8', '6efe8c23-107f-5a1b-bc9e-b41d4c74c45f', 'E', 'Radioiodine immediately in active eye disease', false, 4);

-- Q213
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('24de9738-225a-5903-9d9d-abfdcac4839c', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000005', 'sba', 'A 76 year old man with prostate enlargement, hypertension and type 2 diabetes is admitted with 3 days of vomiting and diarrhoea. He takes metformin, ramipril, bendroflumethiazide and naproxen for back pain. He is dry with postural hypotension. Urine output 15 mL/hour. Creatinine 340 (baseline 105), urea 22, potassium 6.1, bicarbonate 16, lactate 4. Bladder scan shows 80 mL. Which drugs should be STOPPED, and what is the likely type of AKI?', 'AKI stage 3 (creatinine more than 3 times baseline). Pre-renal from volume loss, with ACE inhibitor, diuretic and NSAID adding to it (''triple whammy''). Metformin with AKI risks lactic acidosis. Small bladder volume makes outflow obstruction unlikely. IV fluids, treat hyperkalaemia, monitor closely and involve renal team if not improving.', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v6')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = '24de9738-225a-5903-9d9d-abfdcac4839c';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('d524555c-5663-5dd2-bc15-7efa9308f871', '24de9738-225a-5903-9d9d-abfdcac4839c', 'A', 'Stop metformin, ramipril, bendroflumethiazide and naproxen; pre-renal AKI from dehydration worsened by nephrotoxic drugs', true, 0),
  ('79c1189b-ef96-5a22-ac17-06dc6a6077b3', '24de9738-225a-5903-9d9d-abfdcac4839c', 'B', 'Stop only naproxen; intrinsic glomerulonephritis', false, 1),
  ('05429556-fa92-5779-8517-7b32c77220b6', '24de9738-225a-5903-9d9d-abfdcac4839c', 'C', 'Stop none; obstructive AKI', false, 2),
  ('d052c93d-22d4-5ad9-bf63-26289c4a0c79', '24de9738-225a-5903-9d9d-abfdcac4839c', 'D', 'Stop only metformin; post-renal AKI', false, 3),
  ('5cc00260-9a17-5a15-b1d7-81cba742c71d', '24de9738-225a-5903-9d9d-abfdcac4839c', 'E', 'Continue all and give furosemide', false, 4);

-- Q214
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('51a3e4ae-a536-5f0d-8fb5-3e169e0f8981', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000016', 'sba', 'A 28 year old man fell skiing and has shoulder pain. The arm is held slightly abducted and externally rotated, with a ''squared-off'' shoulder contour. What is the SINGLE most likely diagnosis?', 'Anterior dislocation is the commonest (over 95%). Check axillary nerve (regimental badge sensation) before and after reduction. X-ray before reduction to exclude fracture. Recurrence is common in young people.', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v6')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = '51a3e4ae-a536-5f0d-8fb5-3e169e0f8981';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('7ab3ecfe-cf48-5a1b-a528-4e2c7dfc674d', '51a3e4ae-a536-5f0d-8fb5-3e169e0f8981', 'A', 'Rotator cuff tear', false, 0),
  ('960ce3c8-5aea-5ac0-939d-24c5e9917db4', '51a3e4ae-a536-5f0d-8fb5-3e169e0f8981', 'B', 'Posterior shoulder dislocation', false, 1),
  ('99c2e09a-506e-5e5a-bcda-b6300a51a340', '51a3e4ae-a536-5f0d-8fb5-3e169e0f8981', 'C', 'Anterior shoulder dislocation', true, 2),
  ('3b4561cf-c4ab-57b7-a161-9c8699e84522', '51a3e4ae-a536-5f0d-8fb5-3e169e0f8981', 'D', 'Clavicle fracture', false, 3),
  ('c8039048-feca-5953-b118-640789798583', '51a3e4ae-a536-5f0d-8fb5-3e169e0f8981', 'E', 'AC joint dislocation', false, 4);

-- Q215
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('e963ade4-82bf-53d7-9525-c86d3738b05c', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000016', 'sba', 'A 25 year old man fell on his outstretched hand. X-ray shows a displaced fracture of the radial shaft with dislocation of the distal radioulnar joint. What is the SINGLE most likely injury?', 'Galeazzi: distal third radial shaft fracture with DRUJ dislocation. Monteggia: proximal ulna fracture with radial head dislocation. Both need open reduction and internal fixation in adults.', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v6')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = 'e963ade4-82bf-53d7-9525-c86d3738b05c';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('a1b129bb-7ec2-58cb-a7c9-eb2ea3e2222f', 'e963ade4-82bf-53d7-9525-c86d3738b05c', 'A', 'Barton''s fracture', false, 0),
  ('a497370b-6563-57af-a2ca-34462f67b41a', 'e963ade4-82bf-53d7-9525-c86d3738b05c', 'B', 'Colles'' fracture', false, 1),
  ('a47da9d2-6a07-5087-b500-6ea626e08950', 'e963ade4-82bf-53d7-9525-c86d3738b05c', 'C', 'Smith''s fracture', false, 2),
  ('b72051a7-193d-5021-8824-053ac57fe7b3', 'e963ade4-82bf-53d7-9525-c86d3738b05c', 'D', 'Monteggia fracture-dislocation', false, 3),
  ('c345200a-e48d-5000-9f71-81137a6e6f3b', 'e963ade4-82bf-53d7-9525-c86d3738b05c', 'E', 'Galeazzi fracture-dislocation', true, 4);

-- Q216
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('c7acaec3-e093-53e1-b030-3d5e886b6a5e', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000016', 'sba', 'A 12 year old girl fell onto her wrist. X-ray shows a fracture through the growth plate of the distal radius extending into the metaphysis. What is the Salter-Harris classification?', 'Salter-Harris (SALTR): I straight across the physis, II above (metaphysis, commonest), III lower (epiphysis), IV through both, V crush (rammed). Higher types have greater risk of growth disturbance. Types III and IV often need fixation.', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v6')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = 'c7acaec3-e093-53e1-b030-3d5e886b6a5e';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('41bd910b-18e8-5dee-91e1-894219b038c9', 'c7acaec3-e093-53e1-b030-3d5e886b6a5e', 'A', 'Type I', false, 0),
  ('c65115bd-5669-5719-b8cc-282a9786d096', 'c7acaec3-e093-53e1-b030-3d5e886b6a5e', 'B', 'Type II', true, 1),
  ('375d7f57-d5df-58cd-812c-79d66d4ce2b6', 'c7acaec3-e093-53e1-b030-3d5e886b6a5e', 'C', 'Type III', false, 2),
  ('50679e7f-a316-5dde-a25d-c0514bb415a1', 'c7acaec3-e093-53e1-b030-3d5e886b6a5e', 'D', 'Type IV', false, 3),
  ('3ffa7399-559b-5262-a35a-04947070c741', 'c7acaec3-e093-53e1-b030-3d5e886b6a5e', 'E', 'Type V', false, 4);

-- Q217
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('98ceed16-a8d8-507c-9883-cd346c9d19b0', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000016', 'sba', 'A 6 year old boy has had a painful arm after his father pulled him up by the hand. He holds the arm pronated and slightly flexed and will not use it. X-ray is normal. What is the SINGLE most likely diagnosis and treatment?', 'Pulled elbow is common in children aged 1-4 after traction on the arm. X-ray is not needed with a typical history. Reduce with hyperpronation or supination-flexion; the child usually uses the arm within minutes.', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v6')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = '98ceed16-a8d8-507c-9883-cd346c9d19b0';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('c3485900-1bbf-5dfd-b699-83c9f1995bdc', '98ceed16-a8d8-507c-9883-cd346c9d19b0', 'A', 'Septic arthritis; antibiotics', false, 0),
  ('ac77f4f8-e33d-596b-8fd6-5512373d81b5', '98ceed16-a8d8-507c-9883-cd346c9d19b0', 'B', 'Non-accidental injury; skeletal survey in all', false, 1),
  ('98ae9634-a9ba-5d4a-9c40-4ea11a8192ad', '98ceed16-a8d8-507c-9883-cd346c9d19b0', 'C', 'Supracondylar fracture; cast', false, 2),
  ('b51f957b-597e-522b-af50-02889b87ba2a', '98ceed16-a8d8-507c-9883-cd346c9d19b0', 'D', 'Pulled elbow (radial head subluxation); reduce by supination and flexion or hyperpronation', true, 3),
  ('4a986441-f98d-5329-8875-c182b4ecd48d', '98ceed16-a8d8-507c-9883-cd346c9d19b0', 'E', 'Clavicle fracture; sling', false, 4);

-- Q218
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('99ff8681-45be-50fa-9a26-605c557cb3b7', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000016', 'sba', 'A 70 year old man has a total knee replacement. Two years later he has gradually worsening knee pain without fever. CRP is normal. X-ray shows a lucent line around the tibial component. What is the SINGLE most likely diagnosis?', 'Aseptic loosening causes progressive pain and radiolucent lines around components. Exclude infection (CRP, aspiration). Revision surgery may be needed. Infection is suggested by fever, raised CRP, wound problems and early failure.', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v6')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = '99ff8681-45be-50fa-9a26-605c557cb3b7';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('830f97e9-f8bc-57e4-802c-cf092fd9ec17', '99ff8681-45be-50fa-9a26-605c557cb3b7', 'A', 'Periprosthetic fracture', false, 0),
  ('eea343af-a744-51ce-8753-cce306be13e1', '99ff8681-45be-50fa-9a26-605c557cb3b7', 'B', 'Referred hip pain', false, 1),
  ('304d364f-0171-55d6-b663-a7e97c7409aa', '99ff8681-45be-50fa-9a26-605c557cb3b7', 'C', 'Prosthetic joint infection', false, 2),
  ('6143f25b-aec8-510e-b183-0d49c4242fcd', '99ff8681-45be-50fa-9a26-605c557cb3b7', 'D', 'Gout', false, 3),
  ('de983c11-fdf3-5d51-a2ea-7776b9db1b24', '99ff8681-45be-50fa-9a26-605c557cb3b7', 'E', 'Aseptic loosening of the prosthesis', true, 4);

-- Q219
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('562095ba-d115-5ee2-becc-9efbfbaa4f95', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000016', 'sba', 'A 45 year old woman has had pain in her hip groin for 6 months. She has taken high-dose steroids for SLE. X-ray shows a crescent sign and flattening of the femoral head. What is the SINGLE most likely diagnosis?', 'AVN risk factors: steroids, alcohol, sickle cell disease, SLE, displaced intracapsular fracture, radiotherapy and decompression sickness. MRI detects early disease. Treatment: core decompression early, joint replacement for collapse.', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v6')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = '562095ba-d115-5ee2-becc-9efbfbaa4f95';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('ff10cd9e-74b6-5d77-ae44-0b7c7c5803bd', '562095ba-d115-5ee2-becc-9efbfbaa4f95', 'A', 'Osteoarthritis', false, 0),
  ('5882ddbe-febe-5ae2-a963-28164a807fc7', '562095ba-d115-5ee2-becc-9efbfbaa4f95', 'B', 'Avascular necrosis of the femoral head', true, 1),
  ('243db8ad-68c9-505d-b036-b8d2f5287149', '562095ba-d115-5ee2-becc-9efbfbaa4f95', 'C', 'Trochanteric bursitis', false, 2),
  ('a9c57d77-ee37-5ad9-a929-18a583e712af', '562095ba-d115-5ee2-becc-9efbfbaa4f95', 'D', 'Stress fracture', false, 3),
  ('a231810b-0da2-5ab4-b52c-65624a20dc9f', '562095ba-d115-5ee2-becc-9efbfbaa4f95', 'E', 'Septic arthritis', false, 4);

-- Q220
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('04b19ab1-829d-53fb-93b7-7c39db40eca8', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000016', 'sba', 'A 35 year old man has had back pain after a fall from a ladder. CT shows a burst fracture of L1 with retropulsion of bone into the canal. He has leg weakness. What is the SINGLE most appropriate management?', 'Unstable spinal fractures with neurological deficit need urgent decompression and stabilisation. Use the three-column concept (Denis) to judge stability. Look for associated injuries (calcaneal, pelvic, abdominal).', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v6')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = '04b19ab1-829d-53fb-93b7-7c39db40eca8';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('a4f48572-4958-5862-b69d-0c1ba4966c90', '04b19ab1-829d-53fb-93b7-7c39db40eca8', 'A', 'Physiotherapy', false, 0),
  ('6c52446a-1e49-5b09-9ed1-2dba7d3a2162', '04b19ab1-829d-53fb-93b7-7c39db40eca8', 'B', 'Spinal immobilisation and urgent spinal surgical decompression and stabilisation', true, 1),
  ('3518ccf3-1faa-59f2-aab6-17721fe6cfa6', '04b19ab1-829d-53fb-93b7-7c39db40eca8', 'C', 'Analgesia and mobilise', false, 2),
  ('780345cd-5f0f-5bae-8753-785dd3c1479f', '04b19ab1-829d-53fb-93b7-7c39db40eca8', 'D', 'Brace only', false, 3),
  ('f7ad5f36-644e-5fd8-9665-e803dcd41617', '04b19ab1-829d-53fb-93b7-7c39db40eca8', 'E', 'Discharge', false, 4);

-- Q221
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('99bd195a-05be-5cdf-8d46-42992aee8762', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000016', 'sba', 'A 22 year old man has a crush injury to his forearm. Several hours later he has severe pain, pain on passive finger extension and a tense forearm. Radial pulse is present. What is the SINGLE most appropriate management?', 'Compartment syndrome is a clinical diagnosis: pain out of proportion and pain on passive stretch. Pulses are often preserved. Remove dressings, keep the limb at heart level and arrange urgent fasciotomy. Compartment pressure monitoring helps in unconscious patients.', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v6')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = '99bd195a-05be-5cdf-8d46-42992aee8762';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('c9893e39-5bba-5f03-9cd2-5a2ac5d24cdd', '99bd195a-05be-5cdf-8d46-42992aee8762', 'A', 'Doppler ultrasound', false, 0),
  ('759a1338-c0a8-5ba8-a2b6-8ddaf55e34a8', '99bd195a-05be-5cdf-8d46-42992aee8762', 'B', 'Urgent fasciotomy (forearm compartment syndrome)', true, 1),
  ('c9c5d918-ad1d-5aa3-a9ff-7a3a44ad0055', '99bd195a-05be-5cdf-8d46-42992aee8762', 'C', 'Elevate the arm above heart level and observe', false, 2),
  ('dc6bb077-f8e9-53d6-8d5d-bfb53477d36b', '99bd195a-05be-5cdf-8d46-42992aee8762', 'D', 'Increase opioids', false, 3),
  ('7d0ef93c-7384-54fd-a1f7-568922664c0d', '99bd195a-05be-5cdf-8d46-42992aee8762', 'E', 'Splint and discharge', false, 4);

-- Q222
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('594543a1-cf2f-5c4d-b32c-da9dc60a015c', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000016', 'sba', 'A 55 year old man has had a fracture of his tibia treated with a cast 4 months ago. X-ray shows no bridging callus and persistent fracture lines. He smokes. What is the SINGLE most likely diagnosis?', 'Delayed union is slower than expected healing; non-union is failure to heal (usually beyond 6-9 months). Risk factors: smoking, diabetes, NSAIDs, infection, poor blood supply (scaphoid, tibia, femoral neck) and instability. Treatment: stop smoking, fixation and bone grafting.', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v6')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = '594543a1-cf2f-5c4d-b32c-da9dc60a015c';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('d6213ffc-7cda-51ec-8625-9224d892116e', '594543a1-cf2f-5c4d-b32c-da9dc60a015c', 'A', 'Compartment syndrome', false, 0),
  ('8432fc36-6033-5208-bf83-618d68762671', '594543a1-cf2f-5c4d-b32c-da9dc60a015c', 'B', 'Malunion', false, 1),
  ('8fae16ef-5474-5bd9-8404-71c0fdcef831', '594543a1-cf2f-5c4d-b32c-da9dc60a015c', 'C', 'Delayed union or non-union', true, 2),
  ('6f76d6b8-d8a4-5bac-abce-e50582580469', '594543a1-cf2f-5c4d-b32c-da9dc60a015c', 'D', 'Osteomyelitis only', false, 3),
  ('65c2e87c-3cca-5f01-a349-055adc259474', '594543a1-cf2f-5c4d-b32c-da9dc60a015c', 'E', 'Normal healing', false, 4);

-- Q223
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('ac63ed16-5c4b-50f4-b69a-c68d498847e7', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000016', 'sba', 'A 70 year old woman has had pain in her mid-back after lifting a bag of shopping. X-ray shows a wedge compression fracture of T10. There is no neurology. What is the SINGLE most appropriate management?', 'Osteoporotic vertebral fractures cause sudden back pain, height loss and kyphosis. Treatment: analgesia, mobilisation and bone protection. Vertebroplasty or kyphoplasty is reserved for severe ongoing pain. Exclude malignancy and myeloma if atypical.', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v6')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = 'ac63ed16-5c4b-50f4-b69a-c68d498847e7';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('ea0286f5-44d0-5bac-ae17-e5a51513aee8', 'ac63ed16-5c4b-50f4-b69a-c68d498847e7', 'A', 'Spinal fusion surgery', false, 0),
  ('6db4f298-4670-5c10-a5f0-175e6e79a4b8', 'ac63ed16-5c4b-50f4-b69a-c68d498847e7', 'B', 'Analgesia, early mobilisation, and assessment and treatment for osteoporosis', true, 1),
  ('87da8b24-bcd9-505b-ac08-cd767de60e74', 'ac63ed16-5c4b-50f4-b69a-c68d498847e7', 'C', 'No investigation', false, 2),
  ('172e14f3-a63b-5494-a262-62864b20fc4d', 'ac63ed16-5c4b-50f4-b69a-c68d498847e7', 'D', 'Cast', false, 3),
  ('ca13dc70-72a7-5d60-9732-5ad286b009e5', 'ac63ed16-5c4b-50f4-b69a-c68d498847e7', 'E', 'Bed rest for 6 weeks', false, 4);

-- Q224
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('1bf28075-72d8-5aa0-b57c-e3609356667a', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000016', 'sba', 'A 30 year old woman fell on her outstretched hand and has pain in her wrist. X-ray shows an intra-articular fracture of the distal radius with dislocation of the carpus (volar rim). What is the SINGLE most likely name?', 'Barton''s fracture is an intra-articular distal radius fracture with radiocarpal dislocation (volar or dorsal). It is unstable and usually needs ORIF. Chauffeur''s fracture is a radial styloid fracture.', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v6')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = '1bf28075-72d8-5aa0-b57c-e3609356667a';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('289c2ffb-c5d4-5c8e-9658-e71bb19f1092', '1bf28075-72d8-5aa0-b57c-e3609356667a', 'A', 'Smith''s fracture', false, 0),
  ('506f70d8-d2e2-5e37-bbb9-a2da4de75ab0', '1bf28075-72d8-5aa0-b57c-e3609356667a', 'B', 'Chauffeur''s fracture', false, 1),
  ('25c37bfa-1205-5286-be1b-a639ae1e6977', '1bf28075-72d8-5aa0-b57c-e3609356667a', 'C', 'Bennett''s fracture', false, 2),
  ('f9b6be81-c630-5585-8d9f-a99addf7a6af', '1bf28075-72d8-5aa0-b57c-e3609356667a', 'D', 'Colles'' fracture', false, 3),
  ('edaf30a0-473e-5640-860b-28cbb7d26f61', '1bf28075-72d8-5aa0-b57c-e3609356667a', 'E', 'Barton''s fracture', true, 4);

-- Q225
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('1312beeb-2922-5218-ac6d-f309f6abdc05', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000016', 'sba', 'A 60 year old man fell onto his elbow. He has swelling over the olecranon and cannot extend his elbow against gravity. X-ray shows a displaced olecranon fracture. What is the SINGLE most appropriate management?', 'Displaced olecranon fractures disrupt the triceps mechanism and need ORIF. Undisplaced fractures with intact extension may be treated conservatively, especially in frail older people.', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v6')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = '1312beeb-2922-5218-ac6d-f309f6abdc05';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('b36f20c1-f7c0-5803-b5d6-49d0a0292ac0', '1312beeb-2922-5218-ac6d-f309f6abdc05', 'A', 'Cast in extension for 3 months', false, 0),
  ('d6dbde7f-1fb0-5a9d-8fda-bbeb0aacab9c', '1312beeb-2922-5218-ac6d-f309f6abdc05', 'B', 'Sling only', false, 1),
  ('8dad3a96-a7cb-5be9-8e14-c8d28fb896b9', '1312beeb-2922-5218-ac6d-f309f6abdc05', 'C', 'Open reduction and internal fixation (tension band wiring or plate)', true, 2),
  ('f19eed9d-d390-5018-bdbd-ec99c55e477a', '1312beeb-2922-5218-ac6d-f309f6abdc05', 'D', 'Physiotherapy only', false, 3),
  ('ed97b0c5-4545-5e84-a1dd-356daa44fee6', '1312beeb-2922-5218-ac6d-f309f6abdc05', 'E', 'Aspiration', false, 4);

-- Q226
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('3aec3d4e-50f8-5293-b477-42c52fec1b5d', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000016', 'sba', 'A 25 year old man has injured his knee. He has a large effusion within 2 hours. Aspiration shows blood with fat globules. What does this indicate?', 'Fat globules in a haemarthrosis indicate marrow fat released by an intra-articular fracture (such as tibial plateau). A fat-fluid level may be seen on a horizontal-beam lateral X-ray. CT defines the fracture.', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v6')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = '3aec3d4e-50f8-5293-b477-42c52fec1b5d';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('423844b1-8d68-5fbd-9e5f-4d6cd470ce55', '3aec3d4e-50f8-5293-b477-42c52fec1b5d', 'A', 'Septic arthritis', false, 0),
  ('51fcd32a-5b5d-5a0d-b8f0-880cfc20753a', '3aec3d4e-50f8-5293-b477-42c52fec1b5d', 'B', 'Gout', false, 1),
  ('902baecd-a722-55d5-a353-3fac0f08b1f9', '3aec3d4e-50f8-5293-b477-42c52fec1b5d', 'C', 'An intra-articular fracture (lipohaemarthrosis)', true, 2),
  ('b052804f-22e9-5f1b-8f88-3f5dda3b3649', '3aec3d4e-50f8-5293-b477-42c52fec1b5d', 'D', 'Meniscal tear only', false, 3),
  ('f8d19933-939a-595d-9219-e00f28160052', '3aec3d4e-50f8-5293-b477-42c52fec1b5d', 'E', 'ACL rupture alone', false, 4);

-- Q227
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('381d3fe3-7cfa-52c8-a887-262cc90eb1f8', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000016', 'sba', 'A 32 year old man was hit by a car bumper on the outside of his knee. X-ray shows a lateral tibial plateau fracture with depression. What associated structure is commonly injured?', 'Lateral tibial plateau fractures follow valgus force (''bumper fracture'') and are often associated with MCL, ACL and meniscal injuries, and common peroneal nerve injury. CT for planning; depressed or displaced fractures need ORIF.', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v6')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = '381d3fe3-7cfa-52c8-a887-262cc90eb1f8';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('75fd863c-1fbd-5c86-8f8b-a955bbd8ac7d', '381d3fe3-7cfa-52c8-a887-262cc90eb1f8', 'A', 'Achilles tendon', false, 0),
  ('6af941f6-c621-5cbe-8922-27cd877e7878', '381d3fe3-7cfa-52c8-a887-262cc90eb1f8', 'B', 'Posterior cruciate ligament only', false, 1),
  ('0228bed2-eb72-5df3-8917-13c5a4ab56a0', '381d3fe3-7cfa-52c8-a887-262cc90eb1f8', 'C', 'Medial collateral ligament (and menisci)', true, 2),
  ('eaaf6e3c-5869-55b3-8f25-d531f45a3bb3', '381d3fe3-7cfa-52c8-a887-262cc90eb1f8', 'D', 'Quadriceps tendon', false, 3),
  ('de056dd5-de8d-5a18-8184-983176d20566', '381d3fe3-7cfa-52c8-a887-262cc90eb1f8', 'E', 'Patellar tendon', false, 4);

-- Q228
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('9b79b752-66a9-5100-a4a5-98c24851a3e2', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000032', 'sba', 'A 72 year old woman has had a sudden onset of severe pain and paralysis in her right leg. The leg is pale, cold and pulseless. She had an MI 2 weeks ago. What is the SINGLE most likely source of the embolus?', 'After an MI (especially anterior), a left ventricular thrombus can form and embolise. Other sources: AF (left atrial appendage), aneurysms and valve disease. Treat with heparin and urgent embolectomy; echo to look for thrombus; anticoagulate.', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v6')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = '9b79b752-66a9-5100-a4a5-98c24851a3e2';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('96a4aa55-3a87-5f61-b795-c939de5aa286', '9b79b752-66a9-5100-a4a5-98c24851a3e2', 'A', 'DVT', false, 0),
  ('a80b3a12-8f08-5716-9631-5796bf14b8f2', '9b79b752-66a9-5100-a4a5-98c24851a3e2', 'B', 'Left ventricular mural thrombus', true, 1),
  ('ccd81c66-4a6d-5ac2-b0f9-20275e6e3b62', '9b79b752-66a9-5100-a4a5-98c24851a3e2', 'C', 'Carotid plaque', false, 2),
  ('10e3056f-ef18-5306-bdf0-93f2c1818675', '9b79b752-66a9-5100-a4a5-98c24851a3e2', 'D', 'Venous varicosity', false, 3),
  ('ecafa294-5f57-5b6f-a7bf-138e01657756', '9b79b752-66a9-5100-a4a5-98c24851a3e2', 'E', 'Aortic aneurysm only', false, 4);

-- Q229
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('4648d973-df78-5401-ad3b-14f5383bc5ce', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000032', 'sba', 'A 58 year old smoker has had pain in his calves when walking 50 m, impotence and buttock claudication. Femoral pulses are absent bilaterally. What is the SINGLE most likely diagnosis?', 'Leriche syndrome: buttock and thigh claudication, erectile dysfunction and absent femoral pulses from aortoiliac occlusion. Investigate with duplex or CT angiography. Treatment: risk factor modification, endovascular stenting or bypass.', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v6')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = '4648d973-df78-5401-ad3b-14f5383bc5ce';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('5b81703e-3912-5fb2-9472-4520f900cdbd', '4648d973-df78-5401-ad3b-14f5383bc5ce', 'A', 'DVT', false, 0),
  ('c7e67690-fe87-56b1-910f-28c5ee3a74da', '4648d973-df78-5401-ad3b-14f5383bc5ce', 'B', 'Femoral artery aneurysm', false, 1),
  ('2fbd8908-6061-55c7-85b3-f16ba20231b2', '4648d973-df78-5401-ad3b-14f5383bc5ce', 'C', 'Diabetic neuropathy', false, 2),
  ('0b57856d-6849-5431-8e4d-04f19bb69218', '4648d973-df78-5401-ad3b-14f5383bc5ce', 'D', 'Aortoiliac occlusive disease (Leriche syndrome)', true, 3),
  ('41adb31f-e8d1-5d50-86ed-5e14498d32a7', '4648d973-df78-5401-ad3b-14f5383bc5ce', 'E', 'Spinal stenosis', false, 4);

-- Q230
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('47d0d946-48cb-5671-8d46-475dcb2ca360', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000032', 'sba', 'A 65 year old man with diabetes has a black, dry toe that is not painful. The foot is cool and pulses are absent. What is the SINGLE most likely diagnosis?', 'Dry gangrene is ischaemic tissue death without infection. Wet gangrene is infected (swollen, smelly, spreading) and needs urgent debridement or amputation. Refer urgently to vascular surgery for revascularisation assessment.', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v6')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = '47d0d946-48cb-5671-8d46-475dcb2ca360';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('ec46730b-b52b-56b2-8203-93d5bd8945f5', '47d0d946-48cb-5671-8d46-475dcb2ca360', 'A', 'Frostbite', false, 0),
  ('cf292094-f60d-598e-a2d6-2ebcb2aa0137', '47d0d946-48cb-5671-8d46-475dcb2ca360', 'B', 'Dry gangrene from critical ischaemia', true, 1),
  ('fb3f604e-6de8-5c59-8485-b904b24266d2', '47d0d946-48cb-5671-8d46-475dcb2ca360', 'C', 'Melanoma', false, 2),
  ('76d9e031-23cb-5bea-b497-7ef21f8871f8', '47d0d946-48cb-5671-8d46-475dcb2ca360', 'D', 'Wet gangrene', false, 3),
  ('00fd021a-997a-5465-8957-c2f21bd0837d', '47d0d946-48cb-5671-8d46-475dcb2ca360', 'E', 'Diabetic neuropathic ulcer', false, 4);

-- Q231
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('5554e380-d937-5f01-a1ef-9243c8b52e74', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000032', 'sba', 'A 70 year old man has had episodes of central abdominal pain 30 minutes after eating, food fear and weight loss. He has severe vascular disease. What is the SINGLE most likely diagnosis?', 'Chronic mesenteric ischaemia (''intestinal angina'') causes post-prandial pain, fear of eating and weight loss, from atherosclerosis of at least two mesenteric arteries. CT angiography confirms. Treatment: angioplasty and stenting or bypass.', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v6')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = '5554e380-d937-5f01-a1ef-9243c8b52e74';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('26a3e691-875f-5010-849f-962a82f5db3e', '5554e380-d937-5f01-a1ef-9243c8b52e74', 'A', 'Chronic mesenteric ischaemia', true, 0),
  ('873104db-d281-595c-bafd-bd38099c57cd', '5554e380-d937-5f01-a1ef-9243c8b52e74', 'B', 'Gallstones', false, 1),
  ('2d6ebf11-fb50-5a70-b813-43bae066e134', '5554e380-d937-5f01-a1ef-9243c8b52e74', 'C', 'Peptic ulcer', false, 2),
  ('e8238991-487c-55f9-9bbb-494462b63502', '5554e380-d937-5f01-a1ef-9243c8b52e74', 'D', 'Gastric cancer', false, 3),
  ('5f9c3a61-5cb9-5cb6-970f-e80c1f4095da', '5554e380-d937-5f01-a1ef-9243c8b52e74', 'E', 'IBS', false, 4);

-- Q232
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('bc0a6b97-9e9c-5e97-a53b-64d9c2ae58b2', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000032', 'sba', 'A 60 year old man has had a renal artery stenosis found. He has worsening renal function after starting ramipril. What is the MOST likely explanation?', 'In bilateral renal artery stenosis (or a single kidney), ACE inhibitors and ARBs can cause a sharp fall in GFR by removing efferent arteriolar constriction. A creatinine rise over 30% after starting suggests this. Atherosclerotic RAS is usually treated medically.', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v6')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = 'bc0a6b97-9e9c-5e97-a53b-64d9c2ae58b2';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('5507142b-4c44-5edc-ad91-47ffcc89e034', 'bc0a6b97-9e9c-5e97-a53b-64d9c2ae58b2', 'A', 'ACE inhibitor allergy', false, 0),
  ('a8993359-1528-5bc0-a3bd-64f2eb56848f', 'bc0a6b97-9e9c-5e97-a53b-64d9c2ae58b2', 'B', 'Contrast nephropathy', false, 1),
  ('5536cc5b-e019-5c18-b744-83648b16846a', 'bc0a6b97-9e9c-5e97-a53b-64d9c2ae58b2', 'C', 'Glomerulonephritis', false, 2),
  ('be473723-e15d-57b5-9f0d-6952610cb600', 'bc0a6b97-9e9c-5e97-a53b-64d9c2ae58b2', 'D', 'Bilateral renal artery stenosis (ACE inhibitors reduce glomerular filtration pressure)', true, 3),
  ('8987da16-ca2b-5bd4-915e-f190cc2d68b7', 'bc0a6b97-9e9c-5e97-a53b-64d9c2ae58b2', 'E', 'Dehydration only', false, 4);

-- Q233
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('58f33eb0-e997-5d94-826e-7f686bfe45dc', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000032', 'sba', 'A 35 year old woman has had acute limb ischaemia. She has had two previous DVTs and a miscarriage. What is the SINGLE most important blood test?', 'Arterial and venous thrombosis plus pregnancy loss suggests antiphospholipid syndrome. Long-term warfarin is used. Other causes of arterial thrombosis in young people: vasculitis, thrombophilia, cocaine, heparin-induced thrombocytopenia and paradoxical embolism (PFO).', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v6')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = '58f33eb0-e997-5d94-826e-7f686bfe45dc';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('758b7e71-414c-5132-9a2b-7c8c5cc420d3', '58f33eb0-e997-5d94-826e-7f686bfe45dc', 'A', 'HbA1c', false, 0),
  ('49104ca8-e810-5a8b-bf69-2ff4522b1243', '58f33eb0-e997-5d94-826e-7f686bfe45dc', 'B', 'Factor V Leiden', false, 1),
  ('db82f9ba-1946-58ae-8147-b112cedf6ce2', '58f33eb0-e997-5d94-826e-7f686bfe45dc', 'C', 'Homocysteine only', false, 2),
  ('5745756e-fe54-524d-9385-1833ea88bea4', '58f33eb0-e997-5d94-826e-7f686bfe45dc', 'D', 'Antiphospholipid antibodies', true, 3),
  ('f91811ad-5f2d-56a6-82ec-2a9e6774e0be', '58f33eb0-e997-5d94-826e-7f686bfe45dc', 'E', 'Lipid profile', false, 4);

-- Q234
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('cac9ff13-9433-54ce-b75c-e44ecde673f8', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000032', 'sba', 'A 50 year old man has had a carotid endarterectomy. The next day he has hoarseness and difficulty swallowing. Which nerve is MOST likely injured?', 'Cranial nerve injury is a recognised complication of carotid endarterectomy: hypoglossal (tongue deviation), vagus/recurrent laryngeal (hoarseness), marginal mandibular (lip asymmetry) and glossopharyngeal (dysphagia). Most are temporary. Other complications: stroke, MI and neck haematoma.', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v6')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = 'cac9ff13-9433-54ce-b75c-e44ecde673f8';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('cc522a05-37e8-5817-93dc-6a3551fb2121', 'cac9ff13-9433-54ce-b75c-e44ecde673f8', 'A', 'Accessory nerve', false, 0),
  ('e4399dad-d393-540c-bc42-e744453fa804', 'cac9ff13-9433-54ce-b75c-e44ecde673f8', 'B', 'Trigeminal nerve', false, 1),
  ('6ce75703-fd3b-5991-a553-f1bbeec1ca6b', 'cac9ff13-9433-54ce-b75c-e44ecde673f8', 'C', 'Phrenic nerve', false, 2),
  ('1dbd3588-a2b3-593c-a3e1-f9b75949a008', 'cac9ff13-9433-54ce-b75c-e44ecde673f8', 'D', 'Facial nerve', false, 3),
  ('c4e2528c-3dc1-5c42-abaa-257ec806bb6f', 'cac9ff13-9433-54ce-b75c-e44ecde673f8', 'E', 'Vagus or recurrent laryngeal nerve (or hypoglossal nerve for tongue deviation)', true, 4);

-- Q235
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('70ad9355-4dc8-592e-a1ee-30e7dbc8a942', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000032', 'sba', 'A 75 year old man is 2 days after EVAR for AAA. He has back pain and lower limb mottling. What is the MOST important complication to consider?', 'EVAR complications: endoleaks (type II commonest), graft limb occlusion, distal embolisation, contrast nephropathy, access site problems and colonic or spinal cord ischaemia. Lifelong surveillance (CT or ultrasound) for endoleaks and sac growth.', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v6')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = '70ad9355-4dc8-592e-a1ee-30e7dbc8a942';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('e16fca08-8614-5607-b4e8-e98fa5db778c', '70ad9355-4dc8-592e-a1ee-30e7dbc8a942', 'A', 'Constipation', false, 0),
  ('475478d3-14db-55cb-92b9-04d38d2df981', '70ad9355-4dc8-592e-a1ee-30e7dbc8a942', 'B', 'Limb or bowel ischaemia from graft occlusion or embolisation', true, 1),
  ('ac43a98c-f5f0-59b5-b6e5-8f17f2f9c282', '70ad9355-4dc8-592e-a1ee-30e7dbc8a942', 'C', 'Wound infection', false, 2),
  ('2cf8eea7-8d8b-59be-8a3b-c176c77fb80a', '70ad9355-4dc8-592e-a1ee-30e7dbc8a942', 'D', 'Endoleak only', false, 3),
  ('053bb72b-a37f-5295-b37c-518b0e302fad', '70ad9355-4dc8-592e-a1ee-30e7dbc8a942', 'E', 'Pneumonia', false, 4);

-- Q236
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('16c8f395-f98e-5380-b2be-50f8f5f10585', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000037', 'sba', 'A 30 year old man was punched in the face. He has a black eye, subconjunctival haemorrhage and pain on looking up. Upward gaze is restricted and he has double vision. Cheek numbness is present. What is the SINGLE most likely diagnosis?', 'Orbital floor fractures cause diplopia (especially upward gaze from inferior rectus entrapment), infraorbital nerve numbness and enophthalmos. CT confirms. Urgent surgery if muscle entrapment with oculocardiac reflex (bradycardia, vomiting), especially in children.', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v6')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = '16c8f395-f98e-5380-b2be-50f8f5f10585';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('f0249008-ce3c-5b54-b228-0bcb4994721b', '16c8f395-f98e-5380-b2be-50f8f5f10585', 'A', 'Orbital floor (blow-out) fracture with inferior rectus entrapment', true, 0),
  ('e374d492-5c22-53aa-8839-cff83cbf9e6a', '16c8f395-f98e-5380-b2be-50f8f5f10585', 'B', 'Nasal fracture', false, 1),
  ('f7caac37-7ef9-54f6-a312-6feffe486bde', '16c8f395-f98e-5380-b2be-50f8f5f10585', 'C', 'Retrobulbar haemorrhage', false, 2),
  ('357d47b4-6198-58c6-ae49-965ed86bd470', '16c8f395-f98e-5380-b2be-50f8f5f10585', 'D', 'Mandibular fracture', false, 3),
  ('29f84f42-ea8d-5d6d-9723-67640c5a7761', '16c8f395-f98e-5380-b2be-50f8f5f10585', 'E', 'Zygomatic arch fracture only', false, 4);

-- Q237
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('2614387a-f4da-57cf-9657-d91cb9000329', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000037', 'sba', 'A 35 year old man had facial trauma. He has a painful, tense, proptosed eye with reduced vision and a relative afferent pupillary defect. What is the SINGLE most appropriate immediate management?', 'Retrobulbar haemorrhage raises orbital pressure, compressing the optic nerve. Signs: proptosis, pain, reduced vision, RAPD and a tense orbit. Immediate lateral canthotomy and cantholysis can save sight; do not delay for imaging.', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v6')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = '2614387a-f4da-57cf-9657-d91cb9000329';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('e24d5bb0-055c-5661-b2f9-f536efa08402', '2614387a-f4da-57cf-9657-d91cb9000329', 'A', 'Oral steroids only', false, 0),
  ('e37b3de2-3566-5c06-910e-b11e5b8061c6', '2614387a-f4da-57cf-9657-d91cb9000329', 'B', 'Topical antibiotics', false, 1),
  ('fd7d4c4d-d097-5399-beae-1c232fccdfcd', '2614387a-f4da-57cf-9657-d91cb9000329', 'C', 'CT and wait', false, 2),
  ('bc3f8930-7ea5-5e0c-a8a4-f4a6f62811c0', '2614387a-f4da-57cf-9657-d91cb9000329', 'D', 'Lateral canthotomy and cantholysis (orbital compartment syndrome from retrobulbar haemorrhage)', true, 3),
  ('ace50acd-12cf-5258-94c7-384328536788', '2614387a-f4da-57cf-9657-d91cb9000329', 'E', 'Eye patch', false, 4);

-- Q238
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('4ed51908-ad72-5f0e-be20-181b42d7f196', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000037', 'sba', 'A 50 year old man has had a gradually enlarging painless swelling in his upper neck under the jaw. It is firm. He has had a submandibular gland swelling for months. Ultrasound shows a solid mass. What is the SINGLE most appropriate next step?', 'A solid submandibular gland mass has a higher risk of malignancy than parotid masses (about 50%). Investigate with ultrasound-guided biopsy and MRI. Refer to the head and neck cancer team.', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v6')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = '4ed51908-ad72-5f0e-be20-181b42d7f196';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('2f820f85-b137-545f-be0f-38ab806fbdab', '4ed51908-ad72-5f0e-be20-181b42d7f196', 'A', 'Ultrasound-guided core biopsy or FNA and referral to head and neck MDT', true, 0),
  ('02dfa085-2f5a-5c81-a337-5985c59df9db', '4ed51908-ad72-5f0e-be20-181b42d7f196', 'B', 'Antibiotics', false, 1),
  ('7705ab80-1309-5f5d-8cae-c8921c58e365', '4ed51908-ad72-5f0e-be20-181b42d7f196', 'C', 'Sialography only', false, 2),
  ('a99a6159-3d31-5b0d-9fee-73bfb0524ed6', '4ed51908-ad72-5f0e-be20-181b42d7f196', 'D', 'Excision in primary care', false, 3),
  ('6bd702e6-a31a-5803-9555-f179bda9a8d5', '4ed51908-ad72-5f0e-be20-181b42d7f196', 'E', 'Reassure', false, 4);

-- Q239
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('4d6ebac6-20e1-54b9-94a2-289ee4279afe', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000037', 'sba', 'A 25 year old man has a fixed open mouth and cannot close his jaw after yawning. The jaw protrudes and he has pain in front of both ears. What is the SINGLE most likely diagnosis?', 'TMJ dislocation: inability to close the mouth after wide opening (yawning, laughing, dental work). Reduce by pressing down and back on the lower molars, with analgesia and sedation. Exclude fracture if trauma. Dystonic reactions (antipsychotics, metoclopramide) can mimic it.', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v6')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = '4d6ebac6-20e1-54b9-94a2-289ee4279afe';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('127efb3b-c97b-5eaf-aab9-abbd9a90a3e0', '4d6ebac6-20e1-54b9-94a2-289ee4279afe', 'A', 'Mandible fracture', false, 0),
  ('2982f8de-f03b-5a0b-93b7-333911fcea8d', '4d6ebac6-20e1-54b9-94a2-289ee4279afe', 'B', 'Anterior dislocation of the temporomandibular joint', true, 1),
  ('6f438a30-4e2c-5ea3-8bd6-bb20c92d048f', '4d6ebac6-20e1-54b9-94a2-289ee4279afe', 'C', 'Dystonic reaction', false, 2),
  ('f3b07653-d261-5868-9bfd-84f66dab18f3', '4d6ebac6-20e1-54b9-94a2-289ee4279afe', 'D', 'TMJ dysfunction', false, 3),
  ('07704291-03bf-5a18-8424-ef9f4b097759', '4d6ebac6-20e1-54b9-94a2-289ee4279afe', 'E', 'Tetanus', false, 4);

-- Q240
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('27be8f0d-ad2e-5def-b9dc-b91a86811940', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000037', 'sba', 'A 40 year old woman has had pain and swelling of her face after a tooth abscess. She now has fever, swelling of her eyelids, proptosis and cranial nerve palsies. What is the SINGLE most likely diagnosis?', 'Facial infections in the ''danger triangle'' (and dental, sinus and orbital infection) can spread to the cavernous sinus, causing fever, proptosis, chemosis, ophthalmoplegia (III, IV, VI) and V1/V2 sensory loss. MRI or CT venography. IV antibiotics and consider anticoagulation.', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v6')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = '27be8f0d-ad2e-5def-b9dc-b91a86811940';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('60c86091-ece2-5ff9-b8c1-62b0c3621554', '27be8f0d-ad2e-5def-b9dc-b91a86811940', 'A', 'Cavernous sinus thrombosis', true, 0),
  ('12cb4364-28db-5110-aa7c-64ceff00a327', '27be8f0d-ad2e-5def-b9dc-b91a86811940', 'B', 'Orbital cellulitis only', false, 1),
  ('93b6eecd-c210-580a-bf11-77d4cfe89c7f', '27be8f0d-ad2e-5def-b9dc-b91a86811940', 'C', 'Periorbital cellulitis', false, 2),
  ('14b87ca9-5d56-53f2-a29f-f0b35a451719', '27be8f0d-ad2e-5def-b9dc-b91a86811940', 'D', 'Allergic reaction', false, 3),
  ('c7c8424e-2700-5139-9c61-066b115e73c3', '27be8f0d-ad2e-5def-b9dc-b91a86811940', 'E', 'Sinusitis', false, 4);

-- Q241
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('7314fecb-d91d-5c1e-96e9-f411baae808e', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000037', 'sba', 'A 9 year old boy has had a swelling in front of his ear after a dental extraction under local anaesthetic. He cannot close his eye and his face droops on one side for a few hours. What is the SINGLE most likely explanation?', 'Inferior alveolar nerve blocks can occasionally diffuse into the parotid gland, causing a transient facial nerve palsy lasting a few hours. Protect the eye until it resolves. Persistent palsy needs further assessment.', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v6')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = '7314fecb-d91d-5c1e-96e9-f411baae808e';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('cd998b4f-e03c-50d9-891c-d258604acbf9', '7314fecb-d91d-5c1e-96e9-f411baae808e', 'A', 'Ramsay Hunt syndrome', false, 0),
  ('eb12dace-f7cd-57bf-827e-7fe004e465c5', '7314fecb-d91d-5c1e-96e9-f411baae808e', 'B', 'Stroke', false, 1),
  ('b2950d54-90cb-5ac1-8c08-7c76b72ceb17', '7314fecb-d91d-5c1e-96e9-f411baae808e', 'C', 'Bell''s palsy', false, 2),
  ('e4379082-3bf9-58c4-a3f7-468393893fba', '7314fecb-d91d-5c1e-96e9-f411baae808e', 'D', 'Mumps', false, 3),
  ('489b5915-33db-548d-b53a-0f2407d63391', '7314fecb-d91d-5c1e-96e9-f411baae808e', 'E', 'Temporary facial nerve block from local anaesthetic spreading into the parotid gland', true, 4);

-- Q242
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('b75bb5b9-0797-57f7-b6ed-4e7eeea14964', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000037', 'sba', 'A 60 year old man has had a painless lump in the parotid region for 1 year, and now has facial weakness and pain. What is the SINGLE most likely diagnosis?', 'Facial nerve weakness, pain, rapid growth, skin fixation and lymphadenopathy suggest malignancy. Adenoid cystic carcinoma spreads along nerves (perineural invasion). Refer urgently to the head and neck MDT.', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v6')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = 'b75bb5b9-0797-57f7-b6ed-4e7eeea14964';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('e99a170a-7a76-547a-b8ed-267e782e0cea', 'b75bb5b9-0797-57f7-b6ed-4e7eeea14964', 'A', 'Mumps', false, 0),
  ('6d378330-01c6-51f8-b7e8-22e6a4ee6dc6', 'b75bb5b9-0797-57f7-b6ed-4e7eeea14964', 'B', 'Sialolithiasis', false, 1),
  ('54931ca5-b444-5692-bb9b-48730aa53e12', 'b75bb5b9-0797-57f7-b6ed-4e7eeea14964', 'C', 'Warthin''s tumour', false, 2),
  ('fdb8e141-5f86-59b1-9403-66fc272b68a6', 'b75bb5b9-0797-57f7-b6ed-4e7eeea14964', 'D', 'Pleomorphic adenoma', false, 3),
  ('2755d7e6-0f9a-5679-9603-c095a2efa61d', 'b75bb5b9-0797-57f7-b6ed-4e7eeea14964', 'E', 'Malignant parotid tumour (e.g. mucoepidermoid or adenoid cystic carcinoma)', true, 4);

-- Q243
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('2c8f4115-1671-5796-b666-f6662d133388', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000037', 'sba', 'A 70 year old man has had a non-healing ulcer on his lower lip for 2 months. He was a farmer with lots of sun exposure. What is the SINGLE most likely diagnosis?', 'SCC is the commonest lip cancer, usually on the lower lip, linked to sun exposure and smoking. Refer urgently. Actinic cheilitis (scaly, dry lip) is premalignant. BCC is more common on the upper lip and face.', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v6')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = '2c8f4115-1671-5796-b666-f6662d133388';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('2aa35274-562e-5547-8246-2e94b186a535', '2c8f4115-1671-5796-b666-f6662d133388', 'A', 'Herpes labialis', false, 0),
  ('6806e5ca-27df-590d-bf8e-b54db6192af9', '2c8f4115-1671-5796-b666-f6662d133388', 'B', 'Aphthous ulcer', false, 1),
  ('fd35d4b9-1ed2-50cf-9a54-0e7718be7594', '2c8f4115-1671-5796-b666-f6662d133388', 'C', 'Squamous cell carcinoma of the lip', true, 2),
  ('b899a8cb-1758-5c7e-aaf8-d9c94aa6c906', '2c8f4115-1671-5796-b666-f6662d133388', 'D', 'Actinic cheilitis only', false, 3),
  ('d7b18976-6794-5d26-8419-8cb5af19e332', '2c8f4115-1671-5796-b666-f6662d133388', 'E', 'Basal cell carcinoma', false, 4);

-- Q244
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('493ab5eb-b2e0-5462-9ee0-b9257cb7ea98', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000028', 'sba', 'A medical team wants to show whether a new sepsis screening tool improves time to antibiotics. They plot weekly data on a chart with a median line and look for shifts and trends. What is this chart called?', 'Run charts show data over time, with a median line, to detect non-random patterns (shifts, trends, runs). Statistical process control charts add control limits to distinguish special-cause variation from common-cause variation. They are central to measurement in quality improvement.', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v6')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = '493ab5eb-b2e0-5462-9ee0-b9257cb7ea98';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('b0e8a4b2-c099-56de-b201-6ef60465e08f', '493ab5eb-b2e0-5462-9ee0-b9257cb7ea98', 'A', 'Forest plot', false, 0),
  ('a108b0fe-00a8-5cab-9cd6-7929ae217dff', '493ab5eb-b2e0-5462-9ee0-b9257cb7ea98', 'B', 'Run chart', true, 1),
  ('a8b08866-b910-5ece-ab4d-64edcbc233c4', '493ab5eb-b2e0-5462-9ee0-b9257cb7ea98', 'C', 'Funnel plot', false, 2),
  ('f8024f51-bbdc-530b-8c14-4e4566e67ee7', '493ab5eb-b2e0-5462-9ee0-b9257cb7ea98', 'D', 'Kaplan-Meier curve', false, 3),
  ('5a8f5ffe-39b0-5fa5-bac8-9c44acc6da40', '493ab5eb-b2e0-5462-9ee0-b9257cb7ea98', 'E', 'Bar chart only', false, 4);

-- Q245
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('4baabc71-b9a9-56ae-8c6a-081d3b01baee', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000028', 'sba', 'A doctor is distracted by repeated phone calls while preparing an IV drug and gives the wrong dose. Which approach BEST reduces this type of error?', 'Interruptions are a major cause of medication error. System solutions (red tabards, protected areas, checklists, independent double-checks, smart pumps) work better than relying on individual vigilance. The hierarchy of interventions favours designing out error.', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v6')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = '4baabc71-b9a9-56ae-8c6a-081d3b01baee';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('50412886-f407-56c6-8aba-5a7992e92d5d', '4baabc71-b9a9-56ae-8c6a-081d3b01baee', 'A', 'Removing checklists', false, 0),
  ('90add87d-19d5-5ad6-84f9-e88c610e3480', '4baabc71-b9a9-56ae-8c6a-081d3b01baee', 'B', 'Blaming the individual', false, 1),
  ('f13555d0-41dd-5219-a40e-61ba8fa04a83', '4baabc71-b9a9-56ae-8c6a-081d3b01baee', 'C', 'More phone calls for reminders', false, 2),
  ('2519a3dc-3b4f-5138-bdb8-3dad2ed3b09c', '4baabc71-b9a9-56ae-8c6a-081d3b01baee', 'D', 'Protected ''do not disturb'' time for drug preparation, with checklists and double-checks for high-risk medicines', true, 3),
  ('d24cc0ab-de8e-53ee-a0e6-9a03310a1b0a', '4baabc71-b9a9-56ae-8c6a-081d3b01baee', 'E', 'Telling staff to concentrate harder', false, 4);

-- Q246
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('3ed089ee-951d-5407-a44d-2043c82beaf2', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000028', 'sba', 'Which statement BEST describes a ''just culture'' in healthcare?', 'A just culture balances learning and accountability: human error is consoled, at-risk behaviour is coached, and reckless behaviour is sanctioned. It encourages reporting and openness, which improves safety.', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v6')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = '3ed089ee-951d-5407-a44d-2043c82beaf2';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('09b7d5fd-0ce6-5f1d-a43d-a4e2e31c88b9', '3ed089ee-951d-5407-a44d-2043c82beaf2', 'A', 'Individuals are blamed for all errors', false, 0),
  ('cef0b66b-1ba4-5f38-857a-622cd8222210', '3ed089ee-951d-5407-a44d-2043c82beaf2', 'B', 'Staff are supported to report errors and system failures, while reckless or deliberate harmful behaviour is still held to account', true, 1),
  ('0169958d-73d9-57bf-b9ef-a622d16c7442', '3ed089ee-951d-5407-a44d-2043c82beaf2', 'C', 'Only consultants report incidents', false, 2),
  ('c9ae4494-f1ae-5ff9-aa81-0f68fe0f08b2', '3ed089ee-951d-5407-a44d-2043c82beaf2', 'D', 'No one is ever held responsible', false, 3),
  ('06c82c02-8f8c-5091-8b9a-e623258a15e1', '3ed089ee-951d-5407-a44d-2043c82beaf2', 'E', 'Errors are hidden to protect staff', false, 4);

-- Q247
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('0bcb1953-3bbe-5bf2-a76b-2819ba607de6', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000028', 'sba', 'A patient receives a medication intended for another patient with a similar name on the same ward. Which intervention is MOST likely to prevent this?', 'Patient misidentification causes medication, transfusion and procedure errors. Use at least two identifiers and check against the wristband, and use ''name alert'' systems for similar names. Active identification (asking the patient to state their details) is better than asking ''Are you...?''.', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v6')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = '0bcb1953-3bbe-5bf2-a76b-2819ba607de6';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('a92a47ee-6d9d-5747-93a3-bb748d34e98a', '0bcb1953-3bbe-5bf2-a76b-2819ba607de6', 'A', 'Asking the patient their name only', false, 0),
  ('5610721d-8923-50fe-ae6c-87bb656d15a7', '0bcb1953-3bbe-5bf2-a76b-2819ba607de6', 'B', 'Asking a relative', false, 1),
  ('9079c3e1-30d1-5341-8b29-3139f80a10f5', '0bcb1953-3bbe-5bf2-a76b-2819ba607de6', 'C', 'Positive patient identification using two identifiers (name and date of birth or hospital number) checked against the wristband', true, 2),
  ('da791414-4a38-546d-886d-ad49fdc16761', '0bcb1953-3bbe-5bf2-a76b-2819ba607de6', 'D', 'Checking the bed number', false, 3),
  ('689fb00f-7426-5d2e-85a7-550c4f544b3f', '0bcb1953-3bbe-5bf2-a76b-2819ba607de6', 'E', 'Using the patient''s photo only', false, 4);

-- Q248
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('f78280cb-8071-5e6e-b781-1c533b937a1d', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000028', 'sba', 'In a busy emergency department, a doctor focuses only on the patient''s obvious fracture and misses signs of a head injury. Which cognitive bias does this MOST represent?', 'Diagnostic errors often arise from cognitive biases: anchoring (fixing on initial information), premature closure (stopping thinking once a diagnosis is made), availability (recent memorable cases), and confirmation bias. Use structured approaches (ABCDE, secondary survey), checklists and ''diagnostic time-outs''.', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v6')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = 'f78280cb-8071-5e6e-b781-1c533b937a1d';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('96fefed7-72fa-53ed-b02e-a4d58477fa2a', 'f78280cb-8071-5e6e-b781-1c533b937a1d', 'A', 'Availability bias', false, 0),
  ('b7c7cfd0-28ee-58df-9357-3e83012644da', 'f78280cb-8071-5e6e-b781-1c533b937a1d', 'B', 'Framing effect', false, 1),
  ('ec8dd57d-0801-51fc-b8ba-76bf900c7cae', 'f78280cb-8071-5e6e-b781-1c533b937a1d', 'C', 'Premature closure (with anchoring)', true, 2),
  ('9b02ff29-65b2-5ba2-9c75-1642bc3aff42', 'f78280cb-8071-5e6e-b781-1c533b937a1d', 'D', 'Confirmation bias only', false, 3),
  ('32b22039-abf3-5d90-a15b-c33b2035123c', 'f78280cb-8071-5e6e-b781-1c533b937a1d', 'E', 'Hindsight bias', false, 4);

-- Q249
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('415218b7-8d6f-571f-941c-092a50ac0792', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000028', 'sba', 'After a patient death on the ward, the team meets to discuss what happened, what went well and what could be improved, without blame. What is this called?', 'M&M meetings and debriefs support learning and improvement. Structured judgement reviews and the Learning from Deaths framework identify problems in care. Debriefs after critical incidents also support staff wellbeing.', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v6')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = '415218b7-8d6f-571f-941c-092a50ac0792';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('aa09becc-380e-5434-9557-5d4adb3f5587', '415218b7-8d6f-571f-941c-092a50ac0792', 'A', 'Root cause analysis only', false, 0),
  ('c09c0ca9-dd15-50c9-a3e4-12f0115cc155', '415218b7-8d6f-571f-941c-092a50ac0792', 'B', 'Morbidity and mortality meeting (or structured debrief)', true, 1),
  ('74044237-1669-5d9a-85fa-c328376fe51d', '415218b7-8d6f-571f-941c-092a50ac0792', 'C', 'Clinical audit', false, 2),
  ('a5dcbfa7-6c29-5e40-ad9e-3508c4eba643', '415218b7-8d6f-571f-941c-092a50ac0792', 'D', 'Disciplinary hearing', false, 3),
  ('d06293bd-814d-5f4e-b8f0-9d7f3a44350b', '415218b7-8d6f-571f-941c-092a50ac0792', 'E', 'Coroner''s inquest', false, 4);

-- Q250
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('3b0d6cb6-8ef5-5fe9-bd55-8e132db459b8', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000028', 'sba', 'A junior doctor is unsure about a complex prescription for a child. What is the MOST appropriate action?', 'GMC: recognise and work within the limits of your competence. Paediatric doses are weight-based and errors can be 10-fold. Use the BNFc, double-check calculations, and seek help. Pharmacists are an important safety resource.', null, true, true, jsonb_build_object('source', 'plab1-xlsx-v6', 'guidelines_text', 'GMC; BNF')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = '3b0d6cb6-8ef5-5fe9-bd55-8e132db459b8';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('cec401b0-4400-5f91-aadf-0132b0f45aa9', '3b0d6cb6-8ef5-5fe9-bd55-8e132db459b8', 'A', 'Guess the dose', false, 0),
  ('519e7609-abd7-54be-8c73-4b0d938795bb', '3b0d6cb6-8ef5-5fe9-bd55-8e132db459b8', 'B', 'Prescribe the adult dose', false, 1),
  ('6ece807e-c183-5f9e-8eca-1cab1460da39', '3b0d6cb6-8ef5-5fe9-bd55-8e132db459b8', 'C', 'Copy a previous prescription', false, 2),
  ('37dda4be-030c-542d-952e-4db076407a98', '3b0d6cb6-8ef5-5fe9-bd55-8e132db459b8', 'D', 'Ask the parent to decide', false, 3),
  ('83aed26b-846a-5893-9431-641b13536d76', '3b0d6cb6-8ef5-5fe9-bd55-8e132db459b8', 'E', 'Check with a senior or a pharmacist and use the BNF for Children before prescribing', true, 4);

-- Q251
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('a7bd00e1-7dd6-54b5-b2f3-3bdd11e40d1d', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000028', 'sba', 'A hospital introduces a ''sepsis six'' care bundle. What is the main purpose of a care bundle?', 'Care bundles (sepsis, VAP, central line insertion) group a few evidence-based steps that are delivered together and measured as all-or-nothing compliance, improving reliability of care.', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v6')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = 'a7bd00e1-7dd6-54b5-b2f3-3bdd11e40d1d';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('8e196b50-3b8e-579d-ba9b-274a7f359f19', 'a7bd00e1-7dd6-54b5-b2f3-3bdd11e40d1d', 'A', 'A financial incentive scheme', false, 0),
  ('7014d9da-29f6-53c3-a2b8-dc3b280b6598', 'a7bd00e1-7dd6-54b5-b2f3-3bdd11e40d1d', 'B', 'A replacement for clinical judgement', false, 1),
  ('05090087-f5ca-548a-9c3e-a4de1fd66913', 'a7bd00e1-7dd6-54b5-b2f3-3bdd11e40d1d', 'C', 'A single drug for all patients', false, 2),
  ('64d4526c-9d62-5d34-a71b-eb8996f72731', 'a7bd00e1-7dd6-54b5-b2f3-3bdd11e40d1d', 'D', 'An audit tool only', false, 3),
  ('2d9d26a9-a99f-5adb-9cf6-ed28145a604e', 'a7bd00e1-7dd6-54b5-b2f3-3bdd11e40d1d', 'E', 'A small set of evidence-based interventions that, when delivered together reliably, improve outcomes', true, 4);

-- Q252
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('3e19e196-2866-51cb-909c-6b78ffae3d9c', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000028', 'sba', 'A doctor wants to escalate concerns to a consultant who seems dismissive. Which technique helps assertively communicate a safety concern?', 'Graded assertiveness frameworks (PACE: Probe, Alert, Challenge, Emergency; CUS words) help junior staff escalate concerns. Hierarchy and fear of conflict are known barriers to speaking up. Senior staff should encourage challenge.', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v6')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = '3e19e196-2866-51cb-909c-6b78ffae3d9c';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('b8622b2d-eadc-50ba-b2c3-cdf594a3bbe7', '3e19e196-2866-51cb-909c-6b78ffae3d9c', 'A', 'Leave the ward', false, 0),
  ('5ecbb0fd-30e4-5430-ad78-ad7fd19cf958', '3e19e196-2866-51cb-909c-6b78ffae3d9c', 'B', 'Complain to the patient', false, 1),
  ('2076c4cf-65a1-5801-9903-08e7d3084d5c', '3e19e196-2866-51cb-909c-6b78ffae3d9c', 'C', 'Stay silent', false, 2),
  ('274ab110-0d0a-5f0e-b5e1-ec1b8b822a00', '3e19e196-2866-51cb-909c-6b78ffae3d9c', 'D', 'Graded assertiveness (e.g. the PACE or CUS approach: ''I am Concerned, I am Uncomfortable, this is a Safety issue'')', true, 3),
  ('817d9ccd-4036-533a-826b-596bc17e483a', '3e19e196-2866-51cb-909c-6b78ffae3d9c', 'E', 'Use only written notes', false, 4);

-- Q253
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('d91a0446-4f04-59e3-b570-64bf3e26f955', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000028', 'sba', 'A new electronic prescribing system is introduced. Errors increase in the first weeks. Which human factors principle BEST explains this?', 'All systems have human factors issues. Good design (usability, defaults, alerts without alert fatigue), training, testing and feedback reduce errors. Alert fatigue causes clinicians to override important warnings.', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v6')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = 'd91a0446-4f04-59e3-b570-64bf3e26f955';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('5c03f6ff-1cbe-584b-a3c5-738315d83983', 'd91a0446-4f04-59e3-b570-64bf3e26f955', 'A', 'Errors are random', false, 0),
  ('6c1c6418-1c81-5ef2-aa24-1a661fb71a6f', 'd91a0446-4f04-59e3-b570-64bf3e26f955', 'B', 'Electronic systems never cause errors', false, 1),
  ('8e527fae-392a-5be0-ba0a-fbe3770a2311', 'd91a0446-4f04-59e3-b570-64bf3e26f955', 'C', 'New systems introduce new types of error during implementation; staff need training and the system must be designed around users', true, 2),
  ('23857ea6-6a9c-54a2-b7f9-fd9a0fd97484', 'd91a0446-4f04-59e3-b570-64bf3e26f955', 'D', 'Staff are less competent', false, 3),
  ('c373da00-fe02-5bc1-9008-e176cdd16e9c', 'd91a0446-4f04-59e3-b570-64bf3e26f955', 'E', 'The old paper system was perfect', false, 4);

-- Q254
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('0888d8c2-024e-5cf1-9521-851889fa5073', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000028', 'sba', 'Which of the following is a recognised barrier to effective handover between shifts?', 'Handover errors are a major cause of harm. Use structured tools (SBAR, standardised templates), protect time and space, include sick and deteriorating patients and outstanding tasks, and allow questions.', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v6')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = '0888d8c2-024e-5cf1-9521-851889fa5073';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('20891242-6437-571c-abae-5c7cb3059bae', '0888d8c2-024e-5cf1-9521-851889fa5073', 'A', 'Written and verbal handover together', false, 0),
  ('d1bbd3a6-d724-50a3-a1bf-6b9652e75b0c', '0888d8c2-024e-5cf1-9521-851889fa5073', 'B', 'Using SBAR', false, 1),
  ('301981d4-d82e-5fb4-a6ba-8b110a401b88', '0888d8c2-024e-5cf1-9521-851889fa5073', 'C', 'Unstructured, interrupted handovers without a standard format', true, 2),
  ('fef64761-4fff-5a10-a622-48cd95d49617', '0888d8c2-024e-5cf1-9521-851889fa5073', 'D', 'Face-to-face handover', false, 3),
  ('82309c19-06ab-5bbd-a3cf-2aca3271fce2', '0888d8c2-024e-5cf1-9521-851889fa5073', 'E', 'Handover at a set time and place', false, 4);

-- Q255
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('baf6cb89-9df2-5420-b196-e9c84bf7d10e', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000031', 'sba', 'A 25 year old man has a tight foreskin that he cannot pull back. Now it is retracted behind the glans and will not return, with a swollen glans. What is the SINGLE most likely diagnosis and immediate management?', 'Paraphimosis is a urological emergency (venous congestion, risk of necrosis). Reduce manually after reducing swelling. Dorsal slit if this fails. Circumcision may be offered later. Common after catheterisation if the foreskin is not replaced.', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v6')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = 'baf6cb89-9df2-5420-b196-e9c84bf7d10e';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('b2de01d6-8fbe-5d5a-af47-8c5a8666c871', 'baf6cb89-9df2-5420-b196-e9c84bf7d10e', 'A', 'Phimosis; topical steroid', false, 0),
  ('c9bd82bf-03a2-5562-98c2-b9afdbe7d94f', 'baf6cb89-9df2-5420-b196-e9c84bf7d10e', 'B', 'Paraphimosis; urgent manual reduction (with analgesia, compression or osmotic agents)', true, 1),
  ('e5647aa1-418c-5ec4-adde-735926e16026', 'baf6cb89-9df2-5420-b196-e9c84bf7d10e', 'C', 'Penile fracture; surgery', false, 2),
  ('0e516d9f-adfd-5f5d-b537-243b0faac81d', 'baf6cb89-9df2-5420-b196-e9c84bf7d10e', 'D', 'Balanitis; antifungal', false, 3),
  ('bc17f61b-98c5-59b8-987b-85aa78a53b33', 'baf6cb89-9df2-5420-b196-e9c84bf7d10e', 'E', 'Priapism; aspiration', false, 4);

-- Q256
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('0b9d4945-88c1-5f46-a509-1e6679dce1f0', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000031', 'sba', 'A 45 year old man has had a crack and sudden detumescence during intercourse, with swelling and bruising of the penis (''aubergine deformity''). What is the SINGLE most appropriate management?', 'Penile fracture is rupture of the tunica albuginea during erection. Urethral injury (blood at the meatus, retention) may coexist. Early surgical repair reduces long-term curvature and erectile dysfunction.', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v6')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = '0b9d4945-88c1-5f46-a509-1e6679dce1f0';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('e909b3dc-9623-5c8a-82d0-fb5444122ea7', '0b9d4945-88c1-5f46-a509-1e6679dce1f0', 'A', 'Discharge', false, 0),
  ('7d1cc6c1-4d22-5320-b6cf-479076ada23f', '0b9d4945-88c1-5f46-a509-1e6679dce1f0', 'B', 'Ice and analgesia only', false, 1),
  ('ef36c851-a168-5c3e-b35c-80204d82f5b2', '0b9d4945-88c1-5f46-a509-1e6679dce1f0', 'C', 'Antibiotics', false, 2),
  ('d7a5b326-d39b-5dba-b91a-25d8b04b9877', '0b9d4945-88c1-5f46-a509-1e6679dce1f0', 'D', 'Urgent surgical repair of the tunica albuginea (penile fracture)', true, 3),
  ('03215a3d-99ac-5ee1-aece-b7da6192b871', '0b9d4945-88c1-5f46-a509-1e6679dce1f0', 'E', 'Catheter and observe', false, 4);

-- Q257
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('17964bae-4ea3-5b0c-86a8-4425857ffaf6', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000031', 'sba', 'A 70 year old man has a red, scaly lesion on the glans penis that has not healed with antifungal treatment. He is uncircumcised. What is the SINGLE most appropriate action?', 'NICE NG12: refer urgently for a penile mass or ulcer, or persistent unexplained penile changes. Risk factors for penile SCC: phimosis, poor hygiene, HPV, smoking and lichen sclerosus. Biopsy confirms.', null, true, true, jsonb_build_object('source', 'plab1-xlsx-v6', 'guidelines_text', 'NICE NG12')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = '17964bae-4ea3-5b0c-86a8-4425857ffaf6';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('2b6daffb-6a7d-552f-a3ce-58cdcc9ca2bb', '17964bae-4ea3-5b0c-86a8-4425857ffaf6', 'A', 'Reassure', false, 0),
  ('a15cf36d-4401-53ae-8a6b-54099d9f0463', '17964bae-4ea3-5b0c-86a8-4425857ffaf6', 'B', 'More antifungal cream', false, 1),
  ('63627526-1448-5ddd-93b8-4e3b350ed879', '17964bae-4ea3-5b0c-86a8-4425857ffaf6', 'C', 'Topical steroid', false, 2),
  ('6d0752d8-d7bd-5024-8a89-4a5af84d9aeb', '17964bae-4ea3-5b0c-86a8-4425857ffaf6', 'D', 'Antibiotics', false, 3),
  ('2e46c0c7-c16e-5905-b40a-ba9c8064465a', '17964bae-4ea3-5b0c-86a8-4425857ffaf6', 'E', 'Urgent referral on the suspected cancer pathway (possible penile cancer or premalignant lesion)', true, 4);

-- Q258
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('824af43f-8aff-5e5a-aec3-04abdd4905b3', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000031', 'sba', 'A 55 year old woman has had leakage of urine on coughing and sneezing. She has had 3 children. Urine dip is normal. What is the SINGLE most appropriate first-line treatment?', 'NICE NG123: stress incontinence: pelvic floor muscle training (at least 8 contractions 3 times a day for 3 months), with lifestyle changes (weight loss, reduce caffeine). Duloxetine is second-line if surgery is not wanted. Surgery for persistent symptoms.', null, true, true, jsonb_build_object('source', 'plab1-xlsx-v6', 'guidelines_text', 'NICE NG123')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = '824af43f-8aff-5e5a-aec3-04abdd4905b3';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('9d5049be-16cf-5b55-8d71-39f4b10d1249', '824af43f-8aff-5e5a-aec3-04abdd4905b3', 'A', 'Surgery', false, 0),
  ('ffa25a1e-f5af-5c7f-84b5-730c1d74c4dd', '824af43f-8aff-5e5a-aec3-04abdd4905b3', 'B', 'Supervised pelvic floor muscle training for at least 3 months', true, 1),
  ('b0ca5979-1d40-5dc3-81ad-094084e58f0d', '824af43f-8aff-5e5a-aec3-04abdd4905b3', 'C', 'Catheter', false, 2),
  ('229e72f6-08f6-5f4d-a951-5b9d997bf8db', '824af43f-8aff-5e5a-aec3-04abdd4905b3', 'D', 'Oxybutynin', false, 3),
  ('d882b505-7f36-5bed-ba55-2e874a2a664e', '824af43f-8aff-5e5a-aec3-04abdd4905b3', 'E', 'Mirabegron', false, 4);

-- Q259
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('c8efa182-d095-5c57-b22f-6a5336214a3d', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000031', 'sba', 'A 68 year old man has had hesitancy, poor flow and nocturia. DRE shows a hard, irregular, craggy prostate. PSA is 15. What is the SINGLE most appropriate next step?', 'An abnormal DRE (hard, nodular) or raised PSA needs urgent referral. Multiparametric MRI then targeted biopsy. Gleason score (Grade Group) and stage guide treatment: active surveillance, radical prostatectomy, radiotherapy or hormone therapy.', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v6')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = 'c8efa182-d095-5c57-b22f-6a5336214a3d';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('e87174e2-a823-59dd-89aa-156d9008e8b8', 'c8efa182-d095-5c57-b22f-6a5336214a3d', 'A', 'Start tamsulosin and review in 3 months', false, 0),
  ('e088b25d-8b47-51c3-b2da-baa6711ae3b1', 'c8efa182-d095-5c57-b22f-6a5336214a3d', 'B', 'TURP', false, 1),
  ('65b27325-2845-5689-966c-99ee39a8e5f4', 'c8efa182-d095-5c57-b22f-6a5336214a3d', 'C', 'Antibiotics', false, 2),
  ('0a4d2bbd-0232-5a9f-8172-a43ec7f99dff', 'c8efa182-d095-5c57-b22f-6a5336214a3d', 'D', 'Repeat PSA in 1 year', false, 3),
  ('7154b677-6a46-563f-8078-04651ed783dd', 'c8efa182-d095-5c57-b22f-6a5336214a3d', 'E', 'Urgent referral on the suspected cancer pathway for MRI and biopsy', true, 4);

-- Q260
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('72e57c1c-7bdc-579d-a0e4-1428dd7a8cec', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000031', 'sba', 'A 50 year old man has had a sudden onset of loin pain and haematuria. He is not dehydrated, and there is no fever. CT KUB shows a 12 mm stone in the renal pelvis. What is the SINGLE most likely definitive treatment?', 'Renal stones under 10 mm: SWL or ureteroscopy. 10-20 mm: SWL or ureteroscopy. Over 20 mm or staghorn: PCNL. Medical expulsive therapy is for distal ureteric stones under 10 mm. Metabolic screening for recurrence.', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v6')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = '72e57c1c-7bdc-579d-a0e4-1428dd7a8cec';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('0c117512-982d-54d2-b4e7-360d7101f6d9', '72e57c1c-7bdc-579d-a0e4-1428dd7a8cec', 'A', 'Alpha-blocker only', false, 0),
  ('333d7324-f064-5b47-9eda-78b1e47295a2', '72e57c1c-7bdc-579d-a0e4-1428dd7a8cec', 'B', 'Shockwave lithotripsy or ureteroscopy (percutaneous nephrolithotomy for larger or complex stones)', true, 1),
  ('ad156b05-a32a-5555-bba2-4fac3fc9eb23', '72e57c1c-7bdc-579d-a0e4-1428dd7a8cec', 'C', 'Open surgery', false, 2),
  ('edf3f640-4d33-5a0f-9b31-5189cda7ec0a', '72e57c1c-7bdc-579d-a0e4-1428dd7a8cec', 'D', 'No treatment', false, 3),
  ('39d0b9e6-3b54-566b-b6db-dbe57b5ee403', '72e57c1c-7bdc-579d-a0e4-1428dd7a8cec', 'E', 'Watchful waiting', false, 4);

-- Q261
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('3ddd0c57-aeca-59da-bd1b-400bef620855', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000031', 'sba', 'A 40 year old woman has recurrent UTIs and a large branching stone in the kidney (''staghorn''). Urine pH is alkaline and culture grows Proteus. What type of stone is MOST likely?', 'Struvite stones form in alkaline urine caused by urease-producing bacteria (Proteus, Klebsiella). They grow into staghorn calculi. Treatment: complete stone removal (PCNL) and antibiotics. Uric acid stones are radiolucent and form in acidic urine; cystine stones are hexagonal and hereditary.', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v6')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = '3ddd0c57-aeca-59da-bd1b-400bef620855';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('7aa2c3e9-a4a8-55a0-bca7-0e5e999b82ff', '3ddd0c57-aeca-59da-bd1b-400bef620855', 'A', 'Cystine', false, 0),
  ('4fc92740-ea80-5421-b0c6-a31c34d6f55e', '3ddd0c57-aeca-59da-bd1b-400bef620855', 'B', 'Uric acid', false, 1),
  ('6a63ba8c-d8f2-5ce3-b739-72ddc8854755', '3ddd0c57-aeca-59da-bd1b-400bef620855', 'C', 'Calcium phosphate only', false, 2),
  ('6d90e15a-5146-59b2-88f4-12b183f755c5', '3ddd0c57-aeca-59da-bd1b-400bef620855', 'D', 'Calcium oxalate', false, 3),
  ('0932e098-99d0-5894-9cfe-2c5d0fec055f', '3ddd0c57-aeca-59da-bd1b-400bef620855', 'E', 'Struvite (magnesium ammonium phosphate)', true, 4);

-- Q262
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('eede5ece-b909-56e2-aec5-18d7824e03c4', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000031', 'sba', 'A 25 year old man has had a blow to his loin playing rugby. He has visible haematuria. He is stable. CT shows a small renal laceration without active bleeding. What is the SINGLE most appropriate management?', 'Most blunt renal injuries are managed conservatively. Haemodynamic instability or active bleeding may need embolisation or surgery. CT with contrast (including a delayed phase for collecting system injury) grades the injury.', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v6')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = 'eede5ece-b909-56e2-aec5-18d7824e03c4';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('b40fc9be-1b4f-5ec1-876c-674a16962ea9', 'eede5ece-b909-56e2-aec5-18d7824e03c4', 'A', 'Discharge without follow-up', false, 0),
  ('68e891f6-da23-5241-8fd4-836812028840', 'eede5ece-b909-56e2-aec5-18d7824e03c4', 'B', 'Nephrectomy', false, 1),
  ('01f3c529-7f24-57e7-9996-ecbfa8e58bfc', 'eede5ece-b909-56e2-aec5-18d7824e03c4', 'C', 'Conservative management (bed rest, monitoring of Hb and observations)', true, 2),
  ('c018d32d-628a-5315-8bc3-1fa89eea584b', 'eede5ece-b909-56e2-aec5-18d7824e03c4', 'D', 'Angiography in all', false, 3),
  ('a8522c4c-5e65-5f3f-aad1-b56e440f7885', 'eede5ece-b909-56e2-aec5-18d7824e03c4', 'E', 'Immediate surgery', false, 4);

-- Q263
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('20292232-799f-5ed1-9e41-f8011b45749f', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000031', 'sba', 'A 70 year old man has had a pelvic fracture. There is blood at the urethral meatus and he cannot pass urine. What is the SINGLE most appropriate management?', 'Blood at the meatus, scrotal or perineal bruising and a high-riding prostate suggest urethral injury. A urethral catheter may convert a partial tear into a complete one. Retrograde urethrogram and suprapubic catheter.', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v6')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = '20292232-799f-5ed1-9e41-f8011b45749f';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('8335ccf8-40a3-594d-bad9-0ba829944c41', '20292232-799f-5ed1-9e41-f8011b45749f', 'A', 'Insert a urethral catheter immediately', false, 0),
  ('24844651-9baf-5feb-ac79-36c703ff0500', '20292232-799f-5ed1-9e41-f8011b45749f', 'B', 'Discharge', false, 1),
  ('f3fe0a5e-c256-56d0-ba5f-888e6ccd9b75', '20292232-799f-5ed1-9e41-f8011b45749f', 'C', 'Wait for him to pass urine', false, 2),
  ('cddf6e8b-114c-5a9d-8adc-478ac7d7142e', '20292232-799f-5ed1-9e41-f8011b45749f', 'D', 'Do not pass a urethral catheter; arrange retrograde urethrogram and suprapubic catheter', true, 3),
  ('7bd9bdb6-32e9-5ffe-a71c-d40cc6ee13f6', '20292232-799f-5ed1-9e41-f8011b45749f', 'E', 'Give diuretics', false, 4);

-- Q264
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('d9ab9217-0636-5fa2-af1c-ffaa28532f00', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000031', 'sba', 'A 65 year old man has had a sudden onset of painless frank haematuria with clots and now cannot pass urine. He has known bladder cancer. What is the SINGLE most appropriate management?', 'Clot retention is managed with a large three-way catheter for washout and continuous irrigation. Check Hb and clotting. Persistent bleeding may need cystoscopy and diathermy. Causes: bladder cancer, BPH, radiation cystitis and anticoagulants.', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v6')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = 'd9ab9217-0636-5fa2-af1c-ffaa28532f00';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('2caaf486-9e6e-5301-8138-c25a0f62932d', 'd9ab9217-0636-5fa2-af1c-ffaa28532f00', 'A', 'Discharge', false, 0),
  ('b3f4614a-5132-5926-bbb3-e25b65d82ed3', 'd9ab9217-0636-5fa2-af1c-ffaa28532f00', 'B', 'Oral antibiotics', false, 1),
  ('bf1e164b-2ad1-5ca7-a1af-e5aaf1e168f9', 'd9ab9217-0636-5fa2-af1c-ffaa28532f00', 'C', 'Standard urethral catheter only', false, 2),
  ('924b2252-d29d-55c5-8dce-6596ea8c0a47', 'd9ab9217-0636-5fa2-af1c-ffaa28532f00', 'D', 'Insert a three-way catheter and start bladder irrigation (clot retention)', true, 3),
  ('613893c6-ce09-575a-abae-5bf1100ae161', 'd9ab9217-0636-5fa2-af1c-ffaa28532f00', 'E', 'Suprapubic catheter first', false, 4);

-- Q265
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('3a511aa7-b0fe-5954-9fed-318b67149877', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000030', 'sba', 'A 22 year old woman has had right iliac fossa pain for 2 days. She is not pregnant. Ultrasound shows a normal appendix and free fluid. She has a high fever, cervical motion tenderness and vaginal discharge. What is the SINGLE most likely diagnosis?', 'In young women with right iliac fossa pain, consider gynaecological causes: PID, ovarian cyst rupture or torsion, ectopic pregnancy and endometriosis. Always do a pregnancy test. Cervical motion tenderness and discharge suggest PID.', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v6')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = '3a511aa7-b0fe-5954-9fed-318b67149877';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('642289a0-45b4-51bc-8117-bd3eff08f05d', '3a511aa7-b0fe-5954-9fed-318b67149877', 'A', 'Ovarian torsion', false, 0),
  ('5a44d63a-9c14-5283-b252-e575e41b795e', '3a511aa7-b0fe-5954-9fed-318b67149877', 'B', 'Mesenteric adenitis', false, 1),
  ('1c78414f-e0bc-51bd-8227-c223ccbc9f1b', '3a511aa7-b0fe-5954-9fed-318b67149877', 'C', 'Appendicitis', false, 2),
  ('7fd491aa-56f5-59e9-8eac-93695c76e70c', '3a511aa7-b0fe-5954-9fed-318b67149877', 'D', 'Pelvic inflammatory disease', true, 3),
  ('b5f40569-fb1e-5ce2-b645-2d8987f302fe', '3a511aa7-b0fe-5954-9fed-318b67149877', 'E', 'Ectopic pregnancy', false, 4);

-- Q266
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('c35f6fe2-5299-5d3a-9fc9-3cc356bc4030', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000030', 'sba', 'A 30 year old woman has had a tender lump in the right iliac fossa 5 days after symptoms of appendicitis. She is improving and eating. CT shows an appendix mass without abscess. What is the SINGLE most appropriate management?', 'Appendix mass (phlegmon) is usually managed conservatively with antibiotics. Abscesses are drained percutaneously. In older patients, exclude caecal cancer with colonoscopy or CT afterwards. Interval appendicectomy is considered.', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v6')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = 'c35f6fe2-5299-5d3a-9fc9-3cc356bc4030';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('3e010ccf-2a29-52a7-9b31-daf8a781052f', 'c35f6fe2-5299-5d3a-9fc9-3cc356bc4030', 'A', 'Colectomy', false, 0),
  ('bc58ae10-02fb-5065-b28d-c95aecb02866', 'c35f6fe2-5299-5d3a-9fc9-3cc356bc4030', 'B', 'Immediate appendicectomy', false, 1),
  ('a3ac1bfb-3a8f-5caa-ad4f-fcbc045432d2', 'c35f6fe2-5299-5d3a-9fc9-3cc356bc4030', 'C', 'Discharge without follow-up', false, 2),
  ('7b6ec290-0911-555e-9663-f7be591dffe6', 'c35f6fe2-5299-5d3a-9fc9-3cc356bc4030', 'D', 'Conservative management with antibiotics, then interval assessment (colonoscopy/CT if older) and consideration of interval appendicectomy', true, 3),
  ('446c6673-bd37-54d5-819e-248a0cf4648c', 'c35f6fe2-5299-5d3a-9fc9-3cc356bc4030', 'E', 'Percutaneous drainage', false, 4);

-- Q267
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('b0cad113-06aa-51c6-986f-418ed98bb03a', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000030', 'sba', 'A 65 year old man had a laparoscopic cholecystectomy 3 days ago. He now has abdominal pain, fever, jaundice and bile in his drain. What is the SINGLE most likely complication?', 'Bile duct injury and bile leak are recognised complications of cholecystectomy. Investigate with ultrasound or CT and MRCP. Treatment: drainage of collections, ERCP with stent for leaks, and hepaticojejunostomy for major duct injuries.', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v6')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = 'b0cad113-06aa-51c6-986f-418ed98bb03a';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('4a4ad2b2-5c38-5205-a640-b0c2feed7f46', 'b0cad113-06aa-51c6-986f-418ed98bb03a', 'A', 'Pancreatitis only', false, 0),
  ('b3932959-5469-55c4-8e84-b3a1740a9cb9', 'b0cad113-06aa-51c6-986f-418ed98bb03a', 'B', 'Wound infection', false, 1),
  ('8191708c-766f-5af7-beac-5f792329b4b0', 'b0cad113-06aa-51c6-986f-418ed98bb03a', 'C', 'Pneumonia', false, 2),
  ('7d4d0b71-f147-5f6a-b1b1-1f10e17e52c9', 'b0cad113-06aa-51c6-986f-418ed98bb03a', 'D', 'Bile leak or bile duct injury', true, 3),
  ('79c67a30-0edc-5eb1-9317-6d1bda0d3a6c', 'b0cad113-06aa-51c6-986f-418ed98bb03a', 'E', 'Paralytic ileus', false, 4);

-- Q268
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('6094ac22-cd85-559d-86e4-ff9cedec6fcb', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000030', 'sba', 'A 55 year old woman has had recurrent pancreatitis. She does not drink alcohol and has no gallstones on ultrasound. Calcium is raised. What is the SINGLE most likely cause?', 'Causes of pancreatitis (GET SMASHED): Gallstones, Ethanol, Trauma, Steroids, Mumps, Autoimmune, Scorpion, Hypercalcaemia or hypertriglyceridaemia, ERCP, Drugs (azathioprine, thiazides, valproate). Look for causes when gallstones and alcohol are excluded (EUS for microlithiasis).', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v6')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = '6094ac22-cd85-559d-86e4-ff9cedec6fcb';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('3356ec27-e445-5f30-9d2c-9a6972555b30', '6094ac22-cd85-559d-86e4-ff9cedec6fcb', 'A', 'Drugs', false, 0),
  ('c4bdbd5e-d004-53f1-a146-3485ccb384c5', '6094ac22-cd85-559d-86e4-ff9cedec6fcb', 'B', 'Hypercalcaemia (primary hyperparathyroidism)', true, 1),
  ('58d97008-3300-5876-a4a2-e8ecc58ba939', '6094ac22-cd85-559d-86e4-ff9cedec6fcb', 'C', 'Alcohol', false, 2),
  ('caf0a0e8-77f6-5c52-b295-bb74e3548282', '6094ac22-cd85-559d-86e4-ff9cedec6fcb', 'D', 'Hypertriglyceridaemia', false, 3),
  ('dd989803-0780-53cd-96ac-f32bbccf4f51', '6094ac22-cd85-559d-86e4-ff9cedec6fcb', 'E', 'Autoimmune pancreatitis', false, 4);

-- Q269
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('c95ed0c3-4268-5d64-8d02-8787cfbf678c', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000030', 'sba', 'A 75 year old man has had a lump in his groin that has been there for months and is painless. It is soft and reduces when he lies down. He is fit. What is the SINGLE most appropriate management?', 'Asymptomatic or minimally symptomatic inguinal hernias in men can be managed with watchful waiting, but most eventually become symptomatic. Elective mesh repair (open Lichtenstein or laparoscopic) is offered. Femoral hernias should always be repaired.', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v6')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = 'c95ed0c3-4268-5d64-8d02-8787cfbf678c';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('7b26ba3f-0377-562a-88ec-c6a0c66f2cdc', 'c95ed0c3-4268-5d64-8d02-8787cfbf678c', 'A', 'Refer for elective mesh repair (or watchful waiting if minimally symptomatic and he prefers)', true, 0),
  ('e50736df-3430-5f11-bad8-bb6e525fd375', 'c95ed0c3-4268-5d64-8d02-8787cfbf678c', 'B', 'Truss only', false, 1),
  ('b9615dd3-f8b1-5722-a92d-47baeb131335', 'c95ed0c3-4268-5d64-8d02-8787cfbf678c', 'C', 'Ultrasound only', false, 2),
  ('0f1709ef-fb3f-543d-af7d-dd84e3f0efaa', 'c95ed0c3-4268-5d64-8d02-8787cfbf678c', 'D', 'No action', false, 3),
  ('2ef66638-7195-5db5-93bb-025bcfdf8afc', 'c95ed0c3-4268-5d64-8d02-8787cfbf678c', 'E', 'Emergency surgery', false, 4);

-- Q270
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('9370760a-8b7d-548c-8749-0ce036e59b35', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000030', 'sba', 'A 60 year old man has had difficulty swallowing and a palpable lump on the left side of his neck that gurgles. Barium swallow shows a pouch posteriorly at the level of the cricopharyngeus. What is the SINGLE most appropriate management?', 'Pharyngeal pouches cause dysphagia, regurgitation, halitosis and aspiration. Barium swallow is the investigation of choice. Treatment for symptomatic pouches is endoscopic stapling (cricopharyngeal myotomy) or open surgery.', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v6')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = '9370760a-8b7d-548c-8749-0ce036e59b35';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('861ee53d-4a60-5395-b4ee-379b23ac5647', '9370760a-8b7d-548c-8749-0ce036e59b35', 'A', 'Observation in all', false, 0),
  ('b6d1c951-6ee4-59fc-b919-ad976bfa0876', '9370760a-8b7d-548c-8749-0ce036e59b35', 'B', 'Endoscopic stapling or open excision of the pharyngeal pouch', true, 1),
  ('d0c9cdb3-fabc-521b-b1f5-fa4f6720b61f', '9370760a-8b7d-548c-8749-0ce036e59b35', 'C', 'Dilatation', false, 2),
  ('9168e7a8-cbf7-59bf-b5bf-e01f4d1bc735', '9370760a-8b7d-548c-8749-0ce036e59b35', 'D', 'Antibiotics', false, 3),
  ('da6feeee-8c41-5f4a-ba08-5d483ae2b26a', '9370760a-8b7d-548c-8749-0ce036e59b35', 'E', 'PPI only', false, 4);

-- Q271
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('ad78030a-acd9-5882-871d-b614b7a3db97', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000030', 'sba', 'A 40 year old woman has had a single large gallstone and episodes of biliary colic. She is planning a long trip abroad and wants to delay surgery. What is the MAIN risk of delaying?', 'Once symptomatic, gallstones commonly cause further symptoms and complications. NICE: offer laparoscopic cholecystectomy for symptomatic gallstones. Ursodeoxycholic acid is rarely effective.', null, true, true, jsonb_build_object('source', 'plab1-xlsx-v6', 'guidelines_text', 'NICE')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = 'ad78030a-acd9-5882-871d-b614b7a3db97';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('cd52994c-49c9-5080-8815-0b0bb0ad155f', 'ad78030a-acd9-5882-871d-b614b7a3db97', 'A', 'Gallbladder cancer in all', false, 0),
  ('df2b1e8d-b7ab-50f6-9791-130faabfdb7c', 'ad78030a-acd9-5882-871d-b614b7a3db97', 'B', 'Liver failure', false, 1),
  ('d6e136c9-3f78-5a57-acad-cac4bed14438', 'ad78030a-acd9-5882-871d-b614b7a3db97', 'C', 'No risk at all', false, 2),
  ('08cb0df6-2cc7-5770-8adf-ae5dee1f414a', 'ad78030a-acd9-5882-871d-b614b7a3db97', 'D', 'Kidney stones', false, 3),
  ('704b63ec-e1ea-5910-b8c1-ff95f474b372', 'ad78030a-acd9-5882-871d-b614b7a3db97', 'E', 'Recurrent attacks and complications (cholecystitis, cholangitis, pancreatitis)', true, 4);

-- Q272
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('fb834c68-f971-5cb6-b157-1b89971bbbfd', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000030', 'sba', 'A 72 year old man has had a painless mass in the left upper abdomen and weight loss. CT shows a large mass in the tail of the pancreas with liver metastases. What is the SINGLE most likely diagnosis?', 'Tumours of the body and tail of the pancreas usually present late (pain, weight loss), as they do not cause early jaundice. Most are metastatic at diagnosis. Treatment is palliative chemotherapy and symptom control (coeliac plexus block for pain, pancreatic enzymes).', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v6')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = 'fb834c68-f971-5cb6-b157-1b89971bbbfd';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('877bcc4d-bf17-5c50-95d9-caff1f2a67b1', 'fb834c68-f971-5cb6-b157-1b89971bbbfd', 'A', 'Splenic abscess', false, 0),
  ('7f5a294c-f4df-5652-8441-0be65d952d23', 'fb834c68-f971-5cb6-b157-1b89971bbbfd', 'B', 'Insulinoma', false, 1),
  ('e55216bd-2da8-54cd-a9b1-9fc620b4a39f', 'fb834c68-f971-5cb6-b157-1b89971bbbfd', 'C', 'Gallstones', false, 2),
  ('524021e3-cf52-597f-b578-9cb6f9713b85', 'fb834c68-f971-5cb6-b157-1b89971bbbfd', 'D', 'Pancreatic pseudocyst', false, 3),
  ('a984b823-786f-546a-8232-d1e672b704c1', 'fb834c68-f971-5cb6-b157-1b89971bbbfd', 'E', 'Pancreatic adenocarcinoma of the body/tail (often presents late without jaundice)', true, 4);

-- Q273
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('8c5bc68b-b052-5e39-8102-918e97705184', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000030', 'sba', 'A 30 year old man had a laparotomy for a stab wound. On day 6 he has fever, pelvic pain and diarrhoea with mucus. Rectal examination shows a tender boggy mass. What is the SINGLE most likely diagnosis?', 'Pelvic abscesses after abdominal surgery cause swinging fever, pelvic pain, tenesmus and mucus diarrhoea, with a boggy mass on PR. CT confirms. Treatment: antibiotics and drainage (radiological, transrectal or surgical).', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v6')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = '8c5bc68b-b052-5e39-8102-918e97705184';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('b9d1cecf-c6ff-5795-a3d6-0aa35185868d', '8c5bc68b-b052-5e39-8102-918e97705184', 'A', 'Anastomotic leak only', false, 0),
  ('eddf3b68-993a-5d5e-9f7f-11ad27013f53', '8c5bc68b-b052-5e39-8102-918e97705184', 'B', 'Paralytic ileus', false, 1),
  ('7e985b95-b9dd-5266-aaff-8d3de0213289', '8c5bc68b-b052-5e39-8102-918e97705184', 'C', 'Gastroenteritis', false, 2),
  ('72074f4c-da73-5b20-94cd-0c4dc9b9ffc4', '8c5bc68b-b052-5e39-8102-918e97705184', 'D', 'Pelvic abscess', true, 3),
  ('4a9a5ea0-7b27-5bb7-8dd1-4e40bb2ad78e', '8c5bc68b-b052-5e39-8102-918e97705184', 'E', 'Prostatitis', false, 4);

-- Q274
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('c65a973e-3feb-5a96-bd73-707acfe2fd51', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000030', 'sba', 'A 68 year old man has a subphrenic collection after a perforated duodenal ulcer repair. He has swinging fever and right shoulder tip pain. What is the SINGLE most appropriate management?', 'Postoperative intra-abdominal abscesses cause swinging fever and localised pain. Subphrenic collections cause shoulder tip pain and a pleural effusion. CT confirms; percutaneous drainage with antibiotics is first-line.', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v6')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = 'c65a973e-3feb-5a96-bd73-707acfe2fd51';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('76b68a39-7c74-535a-8872-9a3feea4e1be', 'c65a973e-3feb-5a96-bd73-707acfe2fd51', 'A', 'Observation', false, 0),
  ('fb0f273b-a83d-5fde-b44b-bf801b7eeb15', 'c65a973e-3feb-5a96-bd73-707acfe2fd51', 'B', 'PPI only', false, 1),
  ('daf8f4b7-6dfb-5ee9-bc2d-9ac5a1621d03', 'c65a973e-3feb-5a96-bd73-707acfe2fd51', 'C', 'IV antibiotics and image-guided percutaneous drainage', true, 2),
  ('c8047d6b-ab38-5a68-afa5-9182acb76835', 'c65a973e-3feb-5a96-bd73-707acfe2fd51', 'D', 'Laparotomy for all', false, 3),
  ('72b75b3d-c6a6-54bd-b0b2-747f86309b3f', 'c65a973e-3feb-5a96-bd73-707acfe2fd51', 'E', 'Oral antibiotics only', false, 4);

-- Q275
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('407bb4b3-8edc-591c-888c-20fb56197fa5', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000013', 'sba', 'A 17 year old boy with capacity refuses a blood transfusion after a car crash. Without it, he is likely to die. His parents want him to have it. What is the CORRECT legal position in England?', '16-17 year olds are presumed to have capacity to consent. However, the courts have overridden refusals of life-saving treatment by young people. In practice, involve senior clinicians and seek legal advice; in an emergency, act in the young person''s best interests.', null, true, true, jsonb_build_object('source', 'plab1-xlsx-v6')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = '407bb4b3-8edc-591c-888c-20fb56197fa5';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('6e1af586-d075-5961-9db0-44bb557c9560', '407bb4b3-8edc-591c-888c-20fb56197fa5', 'A', 'The police decide', false, 0),
  ('21fe52a4-63a2-5470-b2b3-bd91c3471a26', '407bb4b3-8edc-591c-888c-20fb56197fa5', 'B', 'His refusal is absolute and must be respected in all circumstances', false, 1),
  ('db6a580e-b8ce-5fa6-958a-2121dbcf0947', '407bb4b3-8edc-591c-888c-20fb56197fa5', 'C', 'Treatment must wait until he is 18', false, 2),
  ('83df04e5-4928-57ee-bd1b-f2b12f53570d', '407bb4b3-8edc-591c-888c-20fb56197fa5', 'D', 'Only the doctor can decide', false, 3),
  ('3fc5f499-3566-56da-bca7-eab0c22f1de1', '407bb4b3-8edc-591c-888c-20fb56197fa5', 'E', 'A refusal by a competent 16-17 year old can, in exceptional cases, be overridden by the court (or someone with parental responsibility) when life is at risk; seek urgent legal advice', true, 4);

-- Q276
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('6b0bdbee-980f-5906-847e-43f46ba961c3', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000013', 'sba', 'A 14 year old girl attends alone requesting the contraceptive pill. During the consultation she says her boyfriend is 22. What is the MOST appropriate action?', 'A significant age gap raises concern about exploitation. Safeguarding takes priority over confidentiality; discuss with the safeguarding lead and refer to children''s social care. Explain to the young person what will happen and why. Sexual activity under 13 is always a child protection issue.', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v6')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = '6b0bdbee-980f-5906-847e-43f46ba961c3';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('664a66d6-9db2-54d7-a243-384c6f0a7b38', '6b0bdbee-980f-5906-847e-43f46ba961c3', 'A', 'Explore the relationship and refer to safeguarding, as there is a risk of sexual exploitation; she can still be offered contraception if Fraser competent', true, 0),
  ('bd9a8d78-7dad-5602-8d65-b3c2a0df505e', '6b0bdbee-980f-5906-847e-43f46ba961c3', 'B', 'Refuse and send her home', false, 1),
  ('f2327fe5-df51-5ef1-8f30-2a1446d71800', '6b0bdbee-980f-5906-847e-43f46ba961c3', 'C', 'Call the police in front of her', false, 2),
  ('ed20c86d-1780-5050-86f6-9885f532441d', '6b0bdbee-980f-5906-847e-43f46ba961c3', 'D', 'Tell her parents without asking her', false, 3),
  ('b4e81dca-954d-55f5-8235-fa19371b9964', '6b0bdbee-980f-5906-847e-43f46ba961c3', 'E', 'Prescribe and keep it confidential without further action', false, 4);

-- Q277
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('7d5112a9-d9a0-5974-a5d5-3e32e73534a8', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000013', 'sba', 'A 45 year old man is diagnosed with a serious infectious disease that is notifiable. He asks the doctor not to tell anyone. What is the CORRECT action?', 'Notification of certain infectious diseases is a statutory duty, overriding confidentiality. Explain to the patient what is shared and why. The health protection team decides on contact tracing and may contact others without naming the patient where possible.', null, true, true, jsonb_build_object('source', 'plab1-xlsx-v6')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = '7d5112a9-d9a0-5974-a5d5-3e32e73534a8';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('83344d15-ad68-5f86-946e-e40d9227d444', '7d5112a9-d9a0-5974-a5d5-3e32e73534a8', 'A', 'Notify the proper officer (UKHSA health protection team) as legally required, explaining this to the patient', true, 0),
  ('d8870c40-5410-5a71-a081-ed5078e204ac', '7d5112a9-d9a0-5974-a5d5-3e32e73534a8', 'B', 'Inform his employer', false, 1),
  ('580568bc-473e-5ab8-9c17-7271fe9ec569', '7d5112a9-d9a0-5974-a5d5-3e32e73534a8', 'C', 'Ask him to notify', false, 2),
  ('e508e751-e986-52fc-9738-bff7a6680d13', '7d5112a9-d9a0-5974-a5d5-3e32e73534a8', 'D', 'Tell his family', false, 3),
  ('da4846cb-3639-5e53-bed6-1be199e39130', '7d5112a9-d9a0-5974-a5d5-3e32e73534a8', 'E', 'Keep it confidential', false, 4);

-- Q278
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('7583eca5-3964-5702-82fa-301324b9a641', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000013', 'sba', 'A GP is asked by a patient''s daughter to tell her about her father''s diagnosis. The father has capacity and has not given consent. What is the CORRECT action?', 'Relatives have no automatic right to information about an adult with capacity. The doctor can listen to concerns and give general information, but not disclose personal information without consent. Encourage the patient to involve family.', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v6')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = '7583eca5-3964-5702-82fa-301324b9a641';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('fdd2ceaf-a9bb-5caa-b117-8024a1af2fe9', '7583eca5-3964-5702-82fa-301324b9a641', 'A', 'Share only test results', false, 0),
  ('eaf51e80-b207-5997-9f45-156e3f3f2e8b', '7583eca5-3964-5702-82fa-301324b9a641', 'B', 'Share if she pays a fee', false, 1),
  ('8e1b920a-0bc9-52bc-81b8-d4b4bc64ea1e', '7583eca5-3964-5702-82fa-301324b9a641', 'C', 'Share if she lives with him', false, 2),
  ('84a953c9-142b-58a1-9019-42e4644e93c5', '7583eca5-3964-5702-82fa-301324b9a641', 'D', 'Do not share information without the father''s consent; listen to the daughter''s concerns', true, 3),
  ('a040d5f7-d505-5028-8201-4616aee9ad9b', '7583eca5-3964-5702-82fa-301324b9a641', 'E', 'Share because she is next of kin', false, 4);

-- Q279
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('13944931-814b-5238-b923-b8d036789069', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000013', 'sba', 'A 70 year old man with dementia lacks capacity. He has a lasting power of attorney for property and finance, but not health and welfare. His son, the attorney, wants to refuse treatment for pneumonia. What is the CORRECT position?', 'There are two types of LPA: property and financial affairs, and health and welfare. Only a health and welfare LPA (which specifically covers life-sustaining treatment) allows the attorney to make treatment decisions. Otherwise, clinicians decide in best interests after consulting family.', null, true, true, jsonb_build_object('source', 'plab1-xlsx-v6')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = '13944931-814b-5238-b923-b8d036789069';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('a3d92e1a-93f3-5324-8e77-6294692ebfd1', '13944931-814b-5238-b923-b8d036789069', 'A', 'The son can refuse treatment', false, 0),
  ('a0e6b364-9b08-5feb-af30-0ee6da275dc2', '13944931-814b-5238-b923-b8d036789069', 'B', 'The patient must be treated against all views', false, 1),
  ('68379f0f-e75c-5cc5-8571-8fd345b1e65d', '13944931-814b-5238-b923-b8d036789069', 'C', 'The son cannot make health decisions under a property and finance LPA; the clinician decides in the patient''s best interests, consulting the son', true, 2),
  ('be028d13-5dc8-57d9-b6b6-b89513f5bb51', '13944931-814b-5238-b923-b8d036789069', 'D', 'The GP decides alone', false, 3),
  ('635e489c-a6ac-50f3-907b-9548dd992b5a', '13944931-814b-5238-b923-b8d036789069', 'E', 'A court must decide in all cases', false, 4);

-- Q280
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('09cdbfdd-e34a-58b1-aa2e-c03136e535e9', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000013', 'sba', 'A doctor notices that a colleague has been taking controlled drugs from the ward. What is the MOST appropriate action?', 'Misuse of controlled drugs by staff is a patient safety and probity concern. Report through local systems (Controlled Drugs Accountable Officer, clinical director). The colleague may also need occupational health support.', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v6')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = '09cdbfdd-e34a-58b1-aa2e-c03136e535e9';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('fffc4561-8d18-5fc7-bc40-ec30db2f5220', '09cdbfdd-e34a-58b1-aa2e-c03136e535e9', 'A', 'Confront the colleague in front of patients', false, 0),
  ('27b14a22-4f97-5c98-b78b-4f9d752c8579', '09cdbfdd-e34a-58b1-aa2e-c03136e535e9', 'B', 'Take the drugs away yourself', false, 1),
  ('972f627b-ee2a-534b-9fae-efe55d8eadf9', '09cdbfdd-e34a-58b1-aa2e-c03136e535e9', 'C', 'Ignore it', false, 2),
  ('34d364b2-c924-5b89-aa02-98831289bcf0', '09cdbfdd-e34a-58b1-aa2e-c03136e535e9', 'D', 'Report the concern to a senior colleague or the controlled drugs accountable officer, through local procedures', true, 3),
  ('eb4caeb3-fccd-56c7-a431-d34262699823', '09cdbfdd-e34a-58b1-aa2e-c03136e535e9', 'E', 'Post anonymously on social media', false, 4);

-- Q281
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('381150df-316f-5d15-a05b-6b439b12ae17', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000013', 'sba', 'A 32 year old woman asks a GP to sign her passport application. The GP has known her for 1 year. What is the correct consideration?', 'Doctors must be honest and trustworthy when signing documents and must check information is accurate. Doctors may charge fees for non-NHS work but must not let financial interests affect honesty.', null, true, true, jsonb_build_object('source', 'plab1-xlsx-v6')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = '381150df-316f-5d15-a05b-6b439b12ae17';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('07697f77-9513-53f5-8739-7b050a976742', '381150df-316f-5d15-a05b-6b439b12ae17', 'A', 'Doctors cannot sign passport forms', false, 0),
  ('6ee6f3c5-9e22-573c-a323-3bd1a7510cbc', '381150df-316f-5d15-a05b-6b439b12ae17', 'B', 'Charge a large fee and sign anything', false, 1),
  ('20f79a50-4cb7-54ac-abe4-980f7224fc24', '381150df-316f-5d15-a05b-6b439b12ae17', 'C', 'The GP can sign if they meet the passport office criteria and confirm identity honestly; they must not sign anything they know to be untrue', true, 2),
  ('598fd907-2e1f-5433-b71d-c7870d63305c', '381150df-316f-5d15-a05b-6b439b12ae17', 'D', 'Sign without checking', false, 3),
  ('ddfe5dde-f446-52f5-89c9-a27917c79e45', '381150df-316f-5d15-a05b-6b439b12ae17', 'E', 'Ask a colleague to sign without knowing her', false, 4);

-- Q282
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('a663c4bc-32ee-5ec9-a751-f4aa84b5edb7', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000013', 'sba', 'A patient asks a doctor out for a date after a consultation. What is the CORRECT action?', 'GMC: doctors must not pursue a sexual or improper emotional relationship with a current patient, or use their position to do so. Relationships with former patients may also be inappropriate depending on vulnerability and the nature of the care.', null, true, true, jsonb_build_object('source', 'plab1-xlsx-v6', 'guidelines_text', 'GMC')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = 'a663c4bc-32ee-5ec9-a751-f4aa84b5edb7';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('25c7d154-8719-5863-b5e0-38fef9d8c8fd', 'a663c4bc-32ee-5ec9-a751-f4aa84b5edb7', 'A', 'Accept if the doctor is single', false, 0),
  ('6a1dc75e-a68c-5384-a385-ae824523a9a4', 'a663c4bc-32ee-5ec9-a751-f4aa84b5edb7', 'B', 'Ignore the request entirely', false, 1),
  ('0a6c6f5a-6e24-5bf0-abb6-21ae062d4a99', 'a663c4bc-32ee-5ec9-a751-f4aa84b5edb7', 'C', 'Decline politely and maintain professional boundaries; consider whether the patient should see another doctor', true, 2),
  ('ba5bdca2-2e30-5286-8119-1616366f0c7c', 'a663c4bc-32ee-5ec9-a751-f4aa84b5edb7', 'D', 'Accept after the next appointment', false, 3),
  ('c0d9a52c-b1d4-5793-b9de-f89cab495441', 'a663c4bc-32ee-5ec9-a751-f4aa84b5edb7', 'E', 'Report the patient to the police', false, 4);

-- Q283
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('bfe54097-d1e5-5dc8-a240-f1e2b5ea2e28', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000013', 'sba', 'A patient in a hospital bay is dying. The nurse asks if CPR should be performed, as there is no DNACPR form. The patient''s death is expected and CPR would not work. What is the CORRECT approach?', 'If CPR would not be successful, doctors are not obliged to offer it, but must discuss the decision with the patient (unless it would cause physical or psychological harm) or those close to them (Tracey judgment). Document clearly.', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v6')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = 'bfe54097-d1e5-5dc8-a240-f1e2b5ea2e28';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('2be1780e-8793-553c-823f-9807250c7ac5', 'bfe54097-d1e5-5dc8-a240-f1e2b5ea2e28', 'A', 'A senior clinician should make a DNACPR decision based on clinical futility, discuss it with the patient (if possible) and family, and document it', true, 0),
  ('fa8e2dfb-2cbe-55c1-9c1e-68ade273e82a', 'bfe54097-d1e5-5dc8-a240-f1e2b5ea2e28', 'B', 'Leave it to the nurse', false, 1),
  ('328c409d-97d6-5c51-bdd7-96f6ce90968b', 'bfe54097-d1e5-5dc8-a240-f1e2b5ea2e28', 'C', 'Always perform CPR without a form', false, 2),
  ('c1b8d0d9-6d19-5c79-90cb-a4954e46091e', 'bfe54097-d1e5-5dc8-a240-f1e2b5ea2e28', 'D', 'Wait until the patient arrests', false, 3),
  ('d3255e74-996e-5226-ace7-648ba566d486', 'bfe54097-d1e5-5dc8-a240-f1e2b5ea2e28', 'E', 'Ask the family to decide', false, 4);

-- Q284
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('86a6aac8-3bd5-560b-814e-0a30d05064c6', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000013', 'sba', 'A medical student takes a photograph of an interesting rash on a patient''s arm using her own phone, without asking. What is the CORRECT view?', 'Recordings of patients for teaching require consent and must comply with local policy on storage and devices. Images on personal devices risk breaches of confidentiality and data protection.', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v6')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = '86a6aac8-3bd5-560b-814e-0a30d05064c6';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('4d34998b-3548-5d4a-a99f-1da8a057377d', '86a6aac8-3bd5-560b-814e-0a30d05064c6', 'A', 'This is not acceptable; recordings need consent and should be made on approved devices under local policy', true, 0),
  ('be30d67c-c616-56e0-80f3-e4129a53621f', '86a6aac8-3bd5-560b-814e-0a30d05064c6', 'B', 'It is fine for learning', false, 1),
  ('9b00d4c5-ec05-5a02-bfb0-10a6cf093e97', '86a6aac8-3bd5-560b-814e-0a30d05064c6', 'C', 'It is fine because the face is not shown', false, 2),
  ('1f43210f-7e17-510a-ae9c-993d3c9237bd', '86a6aac8-3bd5-560b-814e-0a30d05064c6', 'D', 'It is only an issue if published', false, 3),
  ('a1825825-1a31-5fc1-9602-10f87792441f', '86a6aac8-3bd5-560b-814e-0a30d05064c6', 'E', 'It is acceptable if deleted within a week', false, 4);

-- Q285
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('ebb1975b-6531-5220-9a51-ce2b6692ba7b', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000013', 'sba', 'An 82 year old woman with capacity refuses to go into a care home after falls, despite her family''s wishes. What is the CORRECT approach?', 'Adults with capacity can make unwise decisions. Support her with risk reduction (care package, pendant alarm, occupational therapy) and review her capacity if circumstances change. Safeguarding concerns can still be raised with her consent or if others are at risk.', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v6')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = 'ebb1975b-6531-5220-9a51-ce2b6692ba7b';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('3fea897e-39a1-5a64-99dd-8381af42b4f3', 'ebb1975b-6531-5220-9a51-ce2b6692ba7b', 'A', 'Ask the family to decide', false, 0),
  ('77607a4c-2460-5756-839f-66b759f100f5', 'ebb1975b-6531-5220-9a51-ce2b6692ba7b', 'B', 'Respect her decision, explore risks and support options (care package, alarms, adaptations), and document the discussion', true, 1),
  ('2d95b465-3a5e-5797-8ad9-c1f13ce47e5b', 'ebb1975b-6531-5220-9a51-ce2b6692ba7b', 'C', 'Use the Mental Health Act', false, 2),
  ('98057503-bb9d-53b1-bb22-c5d0f9dae8c1', 'ebb1975b-6531-5220-9a51-ce2b6692ba7b', 'D', 'Arrange a care home placement anyway', false, 3),
  ('3c9051d5-8539-58e3-b33a-c1fbc4f0ef27', 'ebb1975b-6531-5220-9a51-ce2b6692ba7b', 'E', 'Apply to the Court of Protection in all cases', false, 4);

-- Q286
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('f87bac6d-1c67-5a12-9b81-f7656b9c34e6', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000013', 'sba', 'A doctor receives a subpoena (witness summons) to give evidence about a patient in court. What is the CORRECT approach to confidentiality?', 'Disclosure required by a court order is lawful. Doctors may object to the judge about disclosing information they consider irrelevant. Disclose only what is necessary. Inform the patient where practicable.', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v6')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = 'f87bac6d-1c67-5a12-9b81-f7656b9c34e6';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('c405c8b4-b8c3-5e9c-a737-488d5888321f', 'f87bac6d-1c67-5a12-9b81-f7656b9c34e6', 'A', 'Disclose the information ordered by the court; you may raise objections to the judge about disclosing irrelevant information', true, 0),
  ('fa700089-7f93-5f48-a57b-c2a24ae41c5c', 'f87bac6d-1c67-5a12-9b81-f7656b9c34e6', 'B', 'Ignore it', false, 1),
  ('f3b61c39-077b-58fc-98ad-945591ae3fa7', 'f87bac6d-1c67-5a12-9b81-f7656b9c34e6', 'C', 'Ask the patient to attend instead', false, 2),
  ('010ffc1a-9e69-5dec-a6e8-f5b716dec239', 'f87bac6d-1c67-5a12-9b81-f7656b9c34e6', 'D', 'Disclose the full record to anyone who asks', false, 3),
  ('b026ad59-6878-5390-b997-28e5f6d9ebb0', 'f87bac6d-1c67-5a12-9b81-f7656b9c34e6', 'E', 'Refuse to attend', false, 4);

-- Q287
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('9cfa7222-3446-5ff9-8bf5-ed31d6a5260a', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000034', 'sba', 'A 70 year old woman takes amitriptyline for neuropathic pain and is started on tramadol. She develops agitation, sweating and myoclonus. What is the SINGLE most likely cause?', 'Tramadol plus serotonergic drugs (tricyclics, SSRIs, SNRIs, MAOIs) can cause serotonin syndrome and lower the seizure threshold. Stop the drugs and give supportive care, benzodiazepines and cyproheptadine if severe.', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v6')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = '9cfa7222-3446-5ff9-8bf5-ed31d6a5260a';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('8ef5a926-67ff-5f3f-8f2f-953284549b2a', '9cfa7222-3446-5ff9-8bf5-ed31d6a5260a', 'A', 'Serotonin syndrome (tricyclic plus tramadol)', true, 0),
  ('89b89af0-2b69-52d5-9fba-250ed2a286bd', '9cfa7222-3446-5ff9-8bf5-ed31d6a5260a', 'B', 'Opioid withdrawal', false, 1),
  ('acc655be-fb74-562d-9df3-19ea5d690868', '9cfa7222-3446-5ff9-8bf5-ed31d6a5260a', 'C', 'Hypoglycaemia', false, 2),
  ('db69ec2d-22c4-54bf-9bc0-a52a1edbf2f0', '9cfa7222-3446-5ff9-8bf5-ed31d6a5260a', 'D', 'Stroke', false, 3),
  ('02e5bea3-fe75-5787-9be7-ae2ca99727a5', '9cfa7222-3446-5ff9-8bf5-ed31d6a5260a', 'E', 'Anticholinergic toxicity only', false, 4);

-- Q288
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('1c0b9990-493e-5124-b904-17d1dc852843', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000034', 'sba', 'A 65 year old man with gout takes allopurinol. He is started on azathioprine after a kidney transplant. What is the CORRECT management?', 'Allopurinol inhibits xanthine oxidase, which metabolises azathioprine, causing toxicity and bone marrow suppression. Consider mycophenolate as an alternative immunosuppressant, or reduce azathioprine dose with specialist advice.', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v6')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = '1c0b9990-493e-5124-b904-17d1dc852843';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('a88c0f48-81db-5e75-b3f1-c05e66101fee', '1c0b9990-493e-5124-b904-17d1dc852843', 'A', 'Avoid the combination or reduce azathioprine dose markedly (about 25%) with close FBC monitoring', true, 0),
  ('7b941d9c-c10f-500f-92c9-d1f016cc2661', '1c0b9990-493e-5124-b904-17d1dc852843', 'B', 'Give folic acid', false, 1),
  ('a29d5bc0-5984-50e1-ba71-5fa306689a11', '1c0b9990-493e-5124-b904-17d1dc852843', 'C', 'Double azathioprine', false, 2),
  ('482637a3-c9c4-5418-93f7-087e3ebc6910', '1c0b9990-493e-5124-b904-17d1dc852843', 'D', 'Stop allopurinol permanently in all', false, 3),
  ('6801143d-fbdf-55eb-ad4a-b60b785f1ae8', '1c0b9990-493e-5124-b904-17d1dc852843', 'E', 'No interaction', false, 4);

-- Q289
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('6e992241-7e6c-57ce-83f8-f8fdccb4a693', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000034', 'sba', 'A 72 year old man takes clopidogrel after a stent. He is started on omeprazole for dyspepsia. What is the CORRECT advice?', 'Omeprazole and esomeprazole inhibit CYP2C19, reducing activation of clopidogrel. MHRA advice: avoid these combinations unless essential. Lansoprazole or pantoprazole are alternatives.', null, true, true, jsonb_build_object('source', 'plab1-xlsx-v6', 'guidelines_text', 'MHRA')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = '6e992241-7e6c-57ce-83f8-f8fdccb4a693';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('eeec58ca-ec95-5c7f-9ffc-bc27c8829b06', '6e992241-7e6c-57ce-83f8-f8fdccb4a693', 'A', 'Increase clopidogrel dose', false, 0),
  ('7479632d-5581-588b-8495-977bff36f995', '6e992241-7e6c-57ce-83f8-f8fdccb4a693', 'B', 'Use ranitidine', false, 1),
  ('9c08f870-b185-59c5-b57a-28f14c6a0963', '6e992241-7e6c-57ce-83f8-f8fdccb4a693', 'C', 'Omeprazole and esomeprazole may reduce clopidogrel''s antiplatelet effect; lansoprazole or pantoprazole is preferred', true, 2),
  ('3e8985ec-c8c4-5cb1-adbf-8e2d23ccea82', '6e992241-7e6c-57ce-83f8-f8fdccb4a693', 'D', 'No interaction', false, 3),
  ('6fbb140c-5323-5615-87d7-cb17478eae2d', '6e992241-7e6c-57ce-83f8-f8fdccb4a693', 'E', 'Stop clopidogrel', false, 4);

-- Q290
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('eeb7508f-af71-5d5e-9073-540e64af2735', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000034', 'sba', 'A 55 year old man takes simvastatin 40 mg and is started on amlodipine. What is the CORRECT advice?', 'Amlodipine raises simvastatin levels; the maximum simvastatin dose is 20 mg with amlodipine. Diltiazem and verapamil also interact (maximum 20 mg). Consider switching to atorvastatin, which is less affected.', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v6')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = 'eeb7508f-af71-5d5e-9073-540e64af2735';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('bbdc6e35-072d-5c24-8af2-48beb951e151', 'eeb7508f-af71-5d5e-9073-540e64af2735', 'A', 'Take them at different times only', false, 0),
  ('31f825e5-f6bd-5af1-9334-ac060c16e152', 'eeb7508f-af71-5d5e-9073-540e64af2735', 'B', 'Double the simvastatin', false, 1),
  ('a16b8357-e1dc-593b-b28e-d90785e83fa8', 'eeb7508f-af71-5d5e-9073-540e64af2735', 'C', 'Stop amlodipine', false, 2),
  ('545e86c5-72ff-55ab-8848-04322d73fd1c', 'eeb7508f-af71-5d5e-9073-540e64af2735', 'D', 'Limit simvastatin to 20 mg daily (or switch to atorvastatin) because amlodipine increases simvastatin levels', true, 3),
  ('35311256-877c-531e-a2c7-1cdec8456c40', 'eeb7508f-af71-5d5e-9073-540e64af2735', 'E', 'No dose change', false, 4);

-- Q291
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('bf0a47fd-4c35-5de1-a7e4-30ec51596423', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000034', 'sba', 'A 68 year old woman takes amiodarone for AF. Which monitoring is needed?', 'Amiodarone side effects: thyroid dysfunction, hepatotoxicity, pulmonary fibrosis, photosensitivity (slate-grey skin), corneal deposits, peripheral neuropathy and many drug interactions (warfarin, digoxin, statins). Very long half-life.', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v6')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = 'bf0a47fd-4c35-5de1-a7e4-30ec51596423';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('5c7fb260-c9bc-5142-a656-8b5760ffd376', 'bf0a47fd-4c35-5de1-a7e4-30ec51596423', 'A', 'Thyroid function and liver function every 6 months, and baseline chest X-ray and lung function (with review for symptoms)', true, 0),
  ('d18c55a1-84fa-5770-a373-1ccdae1be1da', 'bf0a47fd-4c35-5de1-a7e4-30ec51596423', 'B', 'Weekly ECG', false, 1),
  ('0d361943-93b4-55fb-b949-6f6150c80ff5', 'bf0a47fd-4c35-5de1-a7e4-30ec51596423', 'C', 'Monthly CK', false, 2),
  ('bd615c76-021a-5817-ae19-4be3068fa94b', 'bf0a47fd-4c35-5de1-a7e4-30ec51596423', 'D', 'Annual eye test only', false, 3),
  ('5df5d688-ae5d-5424-b992-5abf1d8a3f28', 'bf0a47fd-4c35-5de1-a7e4-30ec51596423', 'E', 'No monitoring needed', false, 4);

-- Q292
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('e8e7fecc-af0d-5464-aa87-fa83222b4a4e', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000034', 'sba', 'A 45 year old woman takes lithium. She starts bendroflumethiazide for hypertension. Two weeks later she has tremor, vomiting and confusion. What is the SINGLE most likely cause?', 'Thiazides, ACE inhibitors, ARBs and NSAIDs increase lithium levels. Check lithium level, stop the interacting drug and lithium, and give IV fluids. Haemodialysis for severe toxicity.', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v6')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = 'e8e7fecc-af0d-5464-aa87-fa83222b4a4e';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('a9c19a95-2464-5ed5-b910-473a424d677b', 'e8e7fecc-af0d-5464-aa87-fa83222b4a4e', 'A', 'Stroke', false, 0),
  ('f5e86f00-d400-5939-a0f1-5cae629802d5', 'e8e7fecc-af0d-5464-aa87-fa83222b4a4e', 'B', 'Viral gastroenteritis', false, 1),
  ('676d3eae-d628-5acf-b68a-2cb46a61a24a', 'e8e7fecc-af0d-5464-aa87-fa83222b4a4e', 'C', 'Thyroid storm', false, 2),
  ('5b8ea7bd-9a53-5f9f-84e7-acda7b4543ec', 'e8e7fecc-af0d-5464-aa87-fa83222b4a4e', 'D', 'Hypokalaemia only', false, 3),
  ('b98aa5ec-332f-53f5-9077-5f8598c4fd1a', 'e8e7fecc-af0d-5464-aa87-fa83222b4a4e', 'E', 'Lithium toxicity (thiazides reduce renal lithium clearance)', true, 4);

-- Q293
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('f03c33fa-d23a-5bc0-b6c5-3f65e8739849', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000034', 'sba', 'A 25 year old woman is planning pregnancy. She takes methotrexate for psoriasis. What is the CORRECT advice?', 'Methotrexate is teratogenic and an abortifacient. Women should stop it at least 3-6 months before trying to conceive (SPC), with folic acid supplementation. Men are also advised to stop before conception per some guidance.', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v6')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = 'f03c33fa-d23a-5bc0-b6c5-3f65e8739849';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('e83c56de-4938-550d-ada4-9005885bdf76', 'f03c33fa-d23a-5bc0-b6c5-3f65e8739849', 'A', 'Methotrexate is safe in pregnancy', false, 0),
  ('068c5886-de33-5985-bb2a-15a9178cdd1a', 'f03c33fa-d23a-5bc0-b6c5-3f65e8739849', 'B', 'Only men need to stop it', false, 1),
  ('a0a2d7ed-d727-529a-bf31-8e0d46e0cc57', 'f03c33fa-d23a-5bc0-b6c5-3f65e8739849', 'C', 'Stop it the day she conceives', false, 2),
  ('31f37222-60c3-5e25-85e5-de18ac78e0bc', 'f03c33fa-d23a-5bc0-b6c5-3f65e8739849', 'D', 'Stop methotrexate at least 3 months (per BNF/SPC) before conception, with effective contraception until then', true, 3),
  ('be119d19-1826-5741-8463-87785fd2f03c', 'f03c33fa-d23a-5bc0-b6c5-3f65e8739849', 'E', 'Continue in pregnancy', false, 4);

-- Q294
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('96c1c30f-1c4b-5ffa-aa92-f5d9c7682cda', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000034', 'sba', 'An 80 year old woman with CKD stage 4 is started on nitrofurantoin for a UTI. What is the main concern?', 'Nitrofurantoin needs adequate renal function to reach therapeutic urinary concentrations, and has more adverse effects (neuropathy, pulmonary toxicity) in renal impairment. Use an alternative such as pivmecillinam or fosfomycin.', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v6')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = '96c1c30f-1c4b-5ffa-aa92-f5d9c7682cda';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('962d933f-02aa-58f7-af6d-2253ada3141e', '96c1c30f-1c4b-5ffa-aa92-f5d9c7682cda', 'A', 'Nitrofurantoin is ineffective and more toxic in reduced renal function (avoid if eGFR below 45)', true, 0),
  ('819c8911-8a37-5cd2-9e94-6e193d1f10c6', '96c1c30f-1c4b-5ffa-aa92-f5d9c7682cda', 'B', 'No concern', false, 1),
  ('833fc18f-29bc-53e7-94ec-a6e9be4a9a4a', '96c1c30f-1c4b-5ffa-aa92-f5d9c7682cda', 'C', 'It is nephrotoxic only at high doses', false, 2),
  ('b612923e-b0f9-5a64-a61d-b7c2e6aba33b', '96c1c30f-1c4b-5ffa-aa92-f5d9c7682cda', 'D', 'It causes hyperkalaemia', false, 3),
  ('fcd48c71-d8a6-5adb-a2b9-e91c1a246b29', '96c1c30f-1c4b-5ffa-aa92-f5d9c7682cda', 'E', 'It causes hypoglycaemia', false, 4);

-- Q295
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('0a273fc6-f31b-5646-87fd-c8522cb0d9e5', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000034', 'sba', 'A 70 year old man is on long-term prednisolone. Which additional treatment is recommended to protect his bones?', 'Glucocorticoid-induced osteoporosis: offer bone protection (bisphosphonate) to people aged 70 and over, those with a fragility fracture, or high FRAX risk, taking prednisolone 7.5 mg or more for 3 months or more. Use the lowest effective steroid dose.', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v6')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = '0a273fc6-f31b-5646-87fd-c8522cb0d9e5';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('0b286748-ecba-50ab-9ad0-b69eb4bc6ae6', '0a273fc6-f31b-5646-87fd-c8522cb0d9e5', 'A', 'Thiazide diuretic', false, 0),
  ('dafe0c98-ca70-5041-9d1d-c3b84979ce4a', '0a273fc6-f31b-5646-87fd-c8522cb0d9e5', 'B', 'Bisphosphonate (e.g. alendronic acid) with calcium and vitamin D if steroids are expected for 3 months or more and he is at risk', true, 1),
  ('5f03171d-70dd-5445-a1af-eae3dc4b7035', '0a273fc6-f31b-5646-87fd-c8522cb0d9e5', 'C', 'Iron supplements', false, 2),
  ('27ce0a1f-c452-5de3-b5df-6116009d6412', '0a273fc6-f31b-5646-87fd-c8522cb0d9e5', 'D', 'Vitamin B12', false, 3),
  ('c144462d-3df0-584d-b322-bca5412273f5', '0a273fc6-f31b-5646-87fd-c8522cb0d9e5', 'E', 'No treatment needed', false, 4);

-- Q296
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('5c4556f8-f523-5ad3-8314-77510dd0d2f0', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000034', 'sba', 'A 30 year old man with depression takes phenelzine (an MAOI). He eats aged cheese and develops a severe headache and BP of 220/120. What is the SINGLE most likely diagnosis?', 'MAOIs block tyramine breakdown. Tyramine-rich foods (aged cheese, cured meats, yeast extracts, soy sauce) and sympathomimetics can cause hypertensive crisis. Avoid these foods during and for 2 weeks after stopping MAOIs. Treat with an alpha-blocker (phentolamine).', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v6')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = '5c4556f8-f523-5ad3-8314-77510dd0d2f0';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('84341170-c319-59b4-b354-0843a9b774de', '5c4556f8-f523-5ad3-8314-77510dd0d2f0', 'A', 'Serotonin syndrome', false, 0),
  ('529738f0-e197-58a3-a890-0991b8370ae7', '5c4556f8-f523-5ad3-8314-77510dd0d2f0', 'B', 'Migraine', false, 1),
  ('9f1466a0-03cd-5ccc-9194-4693632cc7b5', '5c4556f8-f523-5ad3-8314-77510dd0d2f0', 'C', 'Hypertensive crisis from tyramine (the ''cheese reaction'')', true, 2),
  ('fe01aa8b-8e84-515b-b043-80fe072df857', '5c4556f8-f523-5ad3-8314-77510dd0d2f0', 'D', 'Phaeochromocytoma', false, 3),
  ('5af506de-745c-54b4-8360-25e9b71d7ae9', '5c4556f8-f523-5ad3-8314-77510dd0d2f0', 'E', 'Subarachnoid haemorrhage', false, 4);

-- Q297
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('751f5103-0106-57c7-a99d-d67addbc8caa', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000018', 'sba', 'A 35 year old woman is having a laparoscopic cholecystectomy. She had severe nausea and vomiting after a previous anaesthetic and gets motion sickness. She is a non-smoker. What is the BEST approach?', 'Her Apfel score is high (female, non-smoker, previous PONV or motion sickness, and post-op opioids likely). Use combination prophylaxis, TIVA, and opioid-sparing techniques (regional blocks, NSAIDs, paracetamol).', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v6')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = '751f5103-0106-57c7-a99d-d67addbc8caa';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('3e9662e6-d81e-5710-a66c-8efd8f7f3c71', '751f5103-0106-57c7-a99d-d67addbc8caa', 'A', 'Nitrous oxide', false, 0),
  ('99d00337-7d72-5221-9865-5901b1308254', '751f5103-0106-57c7-a99d-d67addbc8caa', 'B', 'No prophylaxis', false, 1),
  ('3defa9ff-3e05-5bd8-b8e3-50fdb4d28bbd', '751f5103-0106-57c7-a99d-d67addbc8caa', 'C', 'Multimodal antiemetic prophylaxis (e.g. dexamethasone plus ondansetron), consider total intravenous anaesthesia with propofol, and minimise opioids', true, 2),
  ('de43fa5f-9ab7-52d1-8487-8230cdccd672', '751f5103-0106-57c7-a99d-d67addbc8caa', 'D', 'Single antiemetic only after surgery', false, 3),
  ('5b5d197d-71f7-59ec-8c53-58045b8842e3', '751f5103-0106-57c7-a99d-d67addbc8caa', 'E', 'More volatile anaesthetic', false, 4);

-- Q298
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('ca7a2706-6e60-5cbd-8f2f-72c4768cdcfe', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000018', 'sba', 'A 60 year old man had a femoral nerve block for a hip fracture. Shortly after, he has perioral tingling, tinnitus and then a seizure. What is the SINGLE most likely cause and treatment?', 'LAST: early signs include perioral tingling, metallic taste, tinnitus and agitation, then seizures and cardiovascular collapse. Treatment: stop the injection, manage airway, benzodiazepines for seizures, and IV 20% lipid emulsion (AAGBI guidance). Prevent with maximum dose limits and aspiration before injecting.', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v6')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = 'ca7a2706-6e60-5cbd-8f2f-72c4768cdcfe';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('81f56a12-6db0-53bf-95db-fdd2176bd92f', 'ca7a2706-6e60-5cbd-8f2f-72c4768cdcfe', 'A', 'Local anaesthetic systemic toxicity; stop injecting, airway and seizure management, and IV lipid emulsion (Intralipid)', true, 0),
  ('e16d616a-407a-50dd-9515-ef110aa8a00a', 'ca7a2706-6e60-5cbd-8f2f-72c4768cdcfe', 'B', 'Stroke; thrombolysis', false, 1),
  ('281ac4b5-0614-5b58-b3c1-cff68f72fb27', 'ca7a2706-6e60-5cbd-8f2f-72c4768cdcfe', 'C', 'Allergic reaction; antihistamine', false, 2),
  ('b0af708c-8293-5191-bb09-68c7db67715a', 'ca7a2706-6e60-5cbd-8f2f-72c4768cdcfe', 'D', 'Vasovagal; lie flat', false, 3),
  ('37e80a77-b883-5dde-a67e-d5e1fef29ce1', 'ca7a2706-6e60-5cbd-8f2f-72c4768cdcfe', 'E', 'Hypoglycaemia; glucose', false, 4);

-- Q299
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('12538d2a-ce6f-56ba-8a1b-8fd07079c429', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000018', 'sba', 'A 70 year old woman is having a hip replacement. She has severe aortic stenosis. Which anaesthetic consideration is MOST important?', 'Severe aortic stenosis has a fixed cardiac output; vasodilation can cause severe hypotension and myocardial ischaemia. Careful general anaesthesia or slow-onset regional techniques with invasive monitoring. Consider valve intervention before elective surgery if symptomatic.', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v6')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = '12538d2a-ce6f-56ba-8a1b-8fd07079c429';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('24048bde-d18d-54fd-a9b1-0998931287e2', '12538d2a-ce6f-56ba-8a1b-8fd07079c429', 'A', 'No special precautions', false, 0),
  ('522193d1-1b93-5f39-9098-d3a842777a60', '12538d2a-ce6f-56ba-8a1b-8fd07079c429', 'B', 'Avoid sudden falls in systemic vascular resistance (e.g. from a dense spinal block); maintain preload and BP', true, 1),
  ('e7ca1165-16cd-5d29-ac7c-92e67ef4c856', '12538d2a-ce6f-56ba-8a1b-8fd07079c429', 'C', 'Spinal anaesthesia is always preferred', false, 2),
  ('fffae03e-c013-5ec8-907c-8df4d28457ce', '12538d2a-ce6f-56ba-8a1b-8fd07079c429', 'D', 'Give large doses of vasodilators', false, 3),
  ('893e3bf9-e190-5eb3-847a-e5ed6eccaf69', '12538d2a-ce6f-56ba-8a1b-8fd07079c429', 'E', 'Use high-dose beta-agonists', false, 4);

-- Q300
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('ccaeaeb2-7b7f-534b-a493-f15f2c07a5b5', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000018', 'sba', 'A 25 year old man is having an emergency appendicectomy. He ate a large meal 1 hour ago. Which anaesthetic technique reduces aspiration risk?', 'Patients with a full stomach (emergency surgery, bowel obstruction, pregnancy, trauma) have a high aspiration risk. Rapid sequence induction uses preoxygenation, fast-acting induction agent and neuromuscular blocker, and early tracheal intubation.', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v6')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = 'ccaeaeb2-7b7f-534b-a493-f15f2c07a5b5';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('6c17cc89-b99d-5aa7-ad15-bcd40e9fbe53', 'ccaeaeb2-7b7f-534b-a493-f15f2c07a5b5', 'A', 'Delay surgery 24 hours in all cases', false, 0),
  ('b55cce41-94ee-52f4-a4f6-d1ea02576396', 'ccaeaeb2-7b7f-534b-a493-f15f2c07a5b5', 'B', 'Spontaneous breathing via face mask', false, 1),
  ('391d78a8-3f4c-5830-8d41-d3641eead5ad', 'ccaeaeb2-7b7f-534b-a493-f15f2c07a5b5', 'C', 'Laryngeal mask airway', false, 2),
  ('666b9950-d42b-56e3-8931-b557de6d5c32', 'ccaeaeb2-7b7f-534b-a493-f15f2c07a5b5', 'D', 'Sedation only', false, 3),
  ('295c88b7-08bf-5d81-ae62-a150a13d1255', 'ccaeaeb2-7b7f-534b-a493-f15f2c07a5b5', 'E', 'Rapid sequence induction with cricoid pressure (per local practice) and a cuffed endotracheal tube', true, 4);

-- Q301
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('d92afba4-e442-5743-8279-39030756a9c8', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000018', 'sba', 'A 75 year old woman is having elective surgery. She has a pacemaker and is pacing-dependent. The surgery requires monopolar diathermy near the chest. What is the SINGLE most appropriate step?', 'Diathermy interference can inhibit pacing in pacing-dependent patients. Reprogramming to an asynchronous mode (or using a magnet per device guidance) avoids inhibition. ICD therapies are suspended. Recheck the device after surgery.', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v6')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = 'd92afba4-e442-5743-8279-39030756a9c8';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('a018a7e3-db28-579a-b73d-ec6f809d3e3d', 'd92afba4-e442-5743-8279-39030756a9c8', 'A', 'Place a magnet on the pacemaker without advice in all cases', false, 0),
  ('fea16959-4aee-5fde-9393-0b0fd68921b2', 'd92afba4-e442-5743-8279-39030756a9c8', 'B', 'Cancel surgery', false, 1),
  ('61e2c130-3d7a-5a36-a2f2-64c426d16f5b', 'd92afba4-e442-5743-8279-39030756a9c8', 'C', 'Remove the pacemaker', false, 2),
  ('70bf1c16-dcc5-5e60-8dd8-9abd1c56d42c', 'd92afba4-e442-5743-8279-39030756a9c8', 'D', 'No action needed', false, 3),
  ('72c60f84-ea22-59a1-9f43-1424e1b6db13', 'd92afba4-e442-5743-8279-39030756a9c8', 'E', 'Have the device reprogrammed to an asynchronous (fixed-rate) mode before surgery by cardiac physiology, with recheck afterwards', true, 4);

-- Q302
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('153c0a85-0ae7-5cb0-9282-ebc82443c26d', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000018', 'sba', 'A 45 year old woman is having day-case surgery. She drank alcohol heavily last week and is anxious. She asks if she can drive home after a general anaesthetic. What is the CORRECT advice?', 'After general anaesthesia or sedation, patients should not drive, operate machinery, drink alcohol or sign legal documents for 24 hours, and need a responsible adult at home. Insurance may be invalidated.', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v6')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = '153c0a85-0ae7-5cb0-9282-ebc82443c26d';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('4e1e0dd2-53d7-5586-8a5d-0328f4b9228e', '153c0a85-0ae7-5cb0-9282-ebc82443c26d', 'A', 'She must not drive for at least 24 hours and should have a responsible adult with her for 24 hours', true, 0),
  ('7149c223-9ebe-517f-b4c9-a9d74541819d', '153c0a85-0ae7-5cb0-9282-ebc82443c26d', 'B', 'She can drive immediately', false, 1),
  ('82049ff7-1434-5558-ab26-f934235fbeb5', '153c0a85-0ae7-5cb0-9282-ebc82443c26d', 'C', 'She can drive after 6 hours', false, 2),
  ('c113688f-a44f-5c2e-a7ca-aa2c22dea483', '153c0a85-0ae7-5cb0-9282-ebc82443c26d', 'D', 'She can drive if she feels fine', false, 3),
  ('ed34a1ba-b8b1-57c8-b5e4-4902e35d6c20', '153c0a85-0ae7-5cb0-9282-ebc82443c26d', 'E', 'She can drive after 2 hours', false, 4);

-- Q303
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('03c2348d-07d2-54de-ad28-fe574be05c2f', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000018', 'sba', 'A 60 year old man has had major abdominal surgery. On day 1 he is breathless with SpO2 88%. CXR shows bibasal collapse. He is reluctant to cough because of pain. What is the SINGLE most appropriate management?', 'Postoperative atelectasis results from pain, shallow breathing and immobility. Effective analgesia enables deep breathing and coughing. Physiotherapy and early mobilisation reduce progression to pneumonia.', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v6')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = '03c2348d-07d2-54de-ad28-fe574be05c2f';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('3cdf5d96-8633-51ae-b8f7-ebf143ed38ac', '03c2348d-07d2-54de-ad28-fe574be05c2f', 'A', 'Bronchoscopy for all', false, 0),
  ('05b65d26-3a44-5cfb-a33c-ffc16421f22e', '03c2348d-07d2-54de-ad28-fe574be05c2f', 'B', 'Optimise analgesia (e.g. epidural or regional blocks), chest physiotherapy, incentive spirometry, oxygen and early mobilisation', true, 1),
  ('401a85cc-780e-5fb9-8d79-af7c9b358dae', '03c2348d-07d2-54de-ad28-fe574be05c2f', 'C', 'Bed rest', false, 2),
  ('3ffdc29d-0c64-586c-9352-b14cc88aed81', '03c2348d-07d2-54de-ad28-fe574be05c2f', 'D', 'Diuretics', false, 3),
  ('927f9bf5-8719-5e55-b45d-83263a9be013', '03c2348d-07d2-54de-ad28-fe574be05c2f', 'E', 'Antibiotics only', false, 4);

-- Q304
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('79ef356b-c883-5e4b-8904-a5435d6e75d0', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000018', 'sba', 'A 72 year old woman is 4 days after a hemiarthroplasty. She has become acutely confused. Her sodium is 122 mmol/L. She was given 5% dextrose IV maintenance fluid for 3 days. What is the SINGLE most likely cause?', 'After surgery, ADH secretion increases (pain, nausea, opioids), so hypotonic fluids (5% dextrose) can cause dangerous hyponatraemia. NICE CG174: use balanced crystalloids for maintenance where appropriate, monitor electrolytes, and give fluids based on need (25-30 mL/kg/day water, 1 mmol/kg/day sodium and potassium).', null, true, true, jsonb_build_object('source', 'plab1-xlsx-v6', 'guidelines_text', 'NICE CG174')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = '79ef356b-c883-5e4b-8904-a5435d6e75d0';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('2c196e97-0451-5add-bd32-6dbb434ace38', '79ef356b-c883-5e4b-8904-a5435d6e75d0', 'A', 'Addison''s disease', false, 0),
  ('7df205c5-9643-5010-b456-40d14fa345a6', '79ef356b-c883-5e4b-8904-a5435d6e75d0', 'B', 'Hypothyroidism', false, 1),
  ('1bea1336-9c0c-5b06-bef0-42a2f11c6f81', '79ef356b-c883-5e4b-8904-a5435d6e75d0', 'C', 'Iatrogenic hyponatraemia from hypotonic fluids (with postoperative ADH release)', true, 2),
  ('4279ebda-c9a9-5b37-9e03-128bf7e1469c', '79ef356b-c883-5e4b-8904-a5435d6e75d0', 'D', 'SIADH from lung cancer', false, 3),
  ('6d53cd64-2e84-5e26-b776-068498926931', '79ef356b-c883-5e4b-8904-a5435d6e75d0', 'E', 'Heart failure', false, 4);

-- Q305
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('498f187e-b283-590a-8a80-c31c045b93fa', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000018', 'sba', 'A 40 year old man is 2 hours after a general anaesthetic. He is shivering and his temperature is 35.2°C. What is the MAIN concern of perioperative hypothermia?', 'NICE CG65: keep patients warm (36.0°C or above) before, during and after surgery using forced-air warming and warmed fluids. Hypothermia causes coagulopathy, wound infection, myocardial ischaemia, drug effects lasting longer and patient discomfort.', null, true, true, jsonb_build_object('source', 'plab1-xlsx-v6', 'guidelines_text', 'NICE CG65')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = '498f187e-b283-590a-8a80-c31c045b93fa';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('dc8c2560-d8d3-5bfe-ab89-89cbf0d2eddc', '498f187e-b283-590a-8a80-c31c045b93fa', 'A', 'Increased risk of wound infection, bleeding, cardiac events and delayed recovery', true, 0),
  ('f6caa25a-57c2-5ef5-a4fd-bb24c5d82df2', '498f187e-b283-590a-8a80-c31c045b93fa', 'B', 'It has no consequences', false, 1),
  ('97fcb446-dc77-5ca3-bcc8-3b5158c38b90', '498f187e-b283-590a-8a80-c31c045b93fa', 'C', 'It improves wound healing', false, 2),
  ('77965b8d-6328-52e1-ad68-a67b66d09ae6', '498f187e-b283-590a-8a80-c31c045b93fa', 'D', 'It prevents infection', false, 3),
  ('72ec5036-73b9-5f86-aa78-1dd43843eaba', '498f187e-b283-590a-8a80-c31c045b93fa', 'E', 'It reduces bleeding', false, 4);

-- Q306
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('88f7fb29-08bc-57b9-b5f7-05926e952f2f', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000011', 'sba', 'A 40 year old woman has had pain on the outer elbow for 6 months. She has had physiotherapy and a steroid injection with only short-term benefit. What is the CORRECT statement?', 'Lateral epicondylitis is usually self-limiting. Physiotherapy (loading exercises) and activity modification are first-line. Steroid injections give short-term benefit only. Surgery is rarely needed.', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v6')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = '88f7fb29-08bc-57b9-b5f7-05926e952f2f';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('2070dcf2-e48e-5eb9-ba79-3b2679011af4', '88f7fb29-08bc-57b9-b5f7-05926e952f2f', 'A', 'Antibiotics are needed', false, 0),
  ('ff35a2df-fa2c-5918-beab-2a504861ffa7', '88f7fb29-08bc-57b9-b5f7-05926e952f2f', 'B', 'Surgery is first-line', false, 1),
  ('fe3ad747-aee4-50e4-a008-b4c880d9cf76', '88f7fb29-08bc-57b9-b5f7-05926e952f2f', 'C', 'Steroid injections cure it', false, 2),
  ('981f4676-3abc-59ad-97d6-61546e93216a', '88f7fb29-08bc-57b9-b5f7-05926e952f2f', 'D', 'It never improves', false, 3),
  ('9dd8e559-ce6c-5854-b80b-19dc2f022c07', '88f7fb29-08bc-57b9-b5f7-05926e952f2f', 'E', 'Most cases of lateral epicondylitis settle within 1-2 years; steroid injections give short-term relief but may worsen long-term outcome', true, 4);

-- Q307
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('750e4315-0d85-5e40-97be-b8bde1f54f35', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000011', 'sba', 'A 50 year old man has had shoulder pain after a fall onto an outstretched hand. He cannot actively raise his arm, but passive movement is full. When the arm is placed at 90 degrees abduction, it drops. What is the SINGLE most likely diagnosis?', 'Rotator cuff tears cause weakness (positive drop arm test) with preserved passive movement. Acute traumatic tears in younger, active people should be referred early for surgical repair. Ultrasound or MRI confirms.', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v6')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = '750e4315-0d85-5e40-97be-b8bde1f54f35';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('3ae61016-97c8-5970-a5aa-78315a08b1c9', '750e4315-0d85-5e40-97be-b8bde1f54f35', 'A', 'Biceps tendinopathy', false, 0),
  ('a31ea152-8948-5e1e-86aa-9876bc8dd9a3', '750e4315-0d85-5e40-97be-b8bde1f54f35', 'B', 'Shoulder dislocation', false, 1),
  ('5fe88666-4e20-55b2-8137-6c95d5904c39', '750e4315-0d85-5e40-97be-b8bde1f54f35', 'C', 'Glenohumeral osteoarthritis', false, 2),
  ('45954ca5-ee33-5974-a994-06ace0ad4238', '750e4315-0d85-5e40-97be-b8bde1f54f35', 'D', 'Full-thickness rotator cuff (supraspinatus) tear', true, 3),
  ('484b4b22-89d7-5c75-ac12-f4a1c36ff55f', '750e4315-0d85-5e40-97be-b8bde1f54f35', 'E', 'Frozen shoulder', false, 4);

-- Q308
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('097db5bd-19c5-5136-98ca-e83a5756774c', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000011', 'sba', 'A 32 year old man has had pain in his heel after a run. Ultrasound shows a partial tear of the plantar fascia. He has had multiple steroid injections. What is the MOST likely explanation?', 'Repeated steroid injections into the plantar fascia or tendons increase the risk of rupture and fat pad atrophy. Limit injections and prefer physical therapies.', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v6')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = '097db5bd-19c5-5136-98ca-e83a5756774c';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('21511f8b-045f-5a2d-96fe-6b0758f8e0e4', '097db5bd-19c5-5136-98ca-e83a5756774c', 'A', 'Gout', false, 0),
  ('80190ee9-df36-5b07-b7d1-62252bf458ad', '097db5bd-19c5-5136-98ca-e83a5756774c', 'B', 'Calcaneal fracture', false, 1),
  ('fc4c00ed-e7df-59ce-8030-5e550dd0b156', '097db5bd-19c5-5136-98ca-e83a5756774c', 'C', 'Tarsal tunnel syndrome', false, 2),
  ('2241fdac-a57c-51f3-ab4d-c33f0210df0a', '097db5bd-19c5-5136-98ca-e83a5756774c', 'D', 'Achilles rupture', false, 3),
  ('8ef3daef-1219-579b-9d7f-0d35a43aa582', '097db5bd-19c5-5136-98ca-e83a5756774c', 'E', 'Steroid injections can weaken the fascia and cause rupture', true, 4);

-- Q309
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('f0e90b90-abb5-51cd-a3a0-9f608c69ce3c', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000011', 'sba', 'A 60 year old woman with diabetes has had shoulder pain and stiffness for 6 months. She cannot reach behind her back. X-ray is normal. External rotation is reduced passively and actively. What is the SINGLE most appropriate first-line management?', 'Frozen shoulder (adhesive capsulitis) passes through freezing, frozen and thawing phases. Treatment: analgesia, physiotherapy and steroid injection in the painful phase. Hydrodilatation or arthroscopic release for refractory cases. More common in diabetes.', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v6')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = 'f0e90b90-abb5-51cd-a3a0-9f608c69ce3c';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('f2ac58c6-5c0f-59cb-9f46-62942fb53e2e', 'f0e90b90-abb5-51cd-a3a0-9f608c69ce3c', 'A', 'Analgesia, physiotherapy and an intra-articular steroid injection (frozen shoulder)', true, 0),
  ('3325215c-6596-5a95-9bdc-86b9d53a9c5d', 'f0e90b90-abb5-51cd-a3a0-9f608c69ce3c', 'B', 'Shoulder replacement', false, 1),
  ('d4adf9da-6d3d-5086-a0b6-2305a737aeea', 'f0e90b90-abb5-51cd-a3a0-9f608c69ce3c', 'C', 'Rest in a sling for 3 months', false, 2),
  ('399222f5-dba9-59f1-a665-1bd57e31e151', 'f0e90b90-abb5-51cd-a3a0-9f608c69ce3c', 'D', 'Antibiotics', false, 3),
  ('aa4a7c1d-2e22-508f-a04e-47a1260a1e8e', 'f0e90b90-abb5-51cd-a3a0-9f608c69ce3c', 'E', 'Arthroscopic repair of the rotator cuff', false, 4);

-- Q310
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('2087f48a-21b3-5f09-9126-9ab4772de221', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000011', 'sba', 'A 45 year old woman has had pain on the radial side of the wrist and swelling. She has a firm lump on the dorsum of the wrist that is mobile. It has been aspirated twice and recurred. What is the SINGLE most appropriate management?', 'Ganglion cysts often resolve without treatment. Aspiration has a high recurrence rate. Surgical excision has a lower recurrence rate but carries risks (scar, stiffness, nerve injury).', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v6')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = '2087f48a-21b3-5f09-9126-9ab4772de221';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('508256d9-2649-52fd-90f1-89610b7bfc99', '2087f48a-21b3-5f09-9126-9ab4772de221', 'A', 'Antibiotics', false, 0),
  ('f5e375d3-1a48-5981-93c0-d1666fdb32cb', '2087f48a-21b3-5f09-9126-9ab4772de221', 'B', 'Steroid injection in all', false, 1),
  ('d4dcaa26-7e5d-526c-b05a-d5f6a292e5c8', '2087f48a-21b3-5f09-9126-9ab4772de221', 'C', 'Surgical excision of the ganglion if symptomatic (recurrence is still possible)', true, 2),
  ('9c6624c8-2e72-5c17-9055-08204f685989', '2087f48a-21b3-5f09-9126-9ab4772de221', 'D', 'Radiotherapy', false, 3),
  ('0b41265d-c6cc-59d3-b7ae-14c4423c0db3', '2087f48a-21b3-5f09-9126-9ab4772de221', 'E', 'Smash with a book', false, 4);

-- Q311
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('4c264749-d581-565f-8b3e-02d2cda80bac', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000011', 'sba', 'A 55 year old man has had low back pain for 3 days after lifting. He has no red flags and is otherwise well. He asks whether he needs a scan. What is the CORRECT advice?', 'NICE NG59: do not routinely image people with non-specific low back pain. Red flags (cancer, infection, fracture, cauda equina, inflammatory disease) warrant investigation. Most acute back pain improves within 6 weeks.', null, true, true, jsonb_build_object('source', 'plab1-xlsx-v6', 'guidelines_text', 'NICE NG59')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = '4c264749-d581-565f-8b3e-02d2cda80bac';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('15ff1994-2516-55b6-aedf-af13e8b59497', '4c264749-d581-565f-8b3e-02d2cda80bac', 'A', 'CT is needed', false, 0),
  ('b2ab9be0-f171-5ba1-bda2-2a1e882c4dfc', '4c264749-d581-565f-8b3e-02d2cda80bac', 'B', 'MRI is needed for all back pain', false, 1),
  ('324b9464-4271-5046-ac6c-fd00714d552c', '4c264749-d581-565f-8b3e-02d2cda80bac', 'C', 'X-ray of the spine is needed', false, 2),
  ('92025da2-dd52-5565-b244-6f641d450e06', '4c264749-d581-565f-8b3e-02d2cda80bac', 'D', 'Imaging is not needed for non-specific back pain without red flags; stay active and use simple analgesia', true, 3),
  ('cce73094-5c13-5848-8dac-daa2fd83e1c0', '4c264749-d581-565f-8b3e-02d2cda80bac', 'E', 'Bed rest is best', false, 4);

-- Q312
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('e0946f0a-76ff-59de-ad46-c58355e19f92', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000011', 'sba', 'A 70 year old man has had severe hip pain at night and at rest, rapidly worsening over 3 weeks. He has prostate cancer. X-ray shows a lytic lesion in the proximal femur involving over half the cortical thickness. What is the MAIN risk?', 'Mirels scoring (site, pain, lesion type and size) estimates pathological fracture risk. High scores (9 or more) favour prophylactic fixation, followed by radiotherapy. Pain on weight bearing and large lesions in the femoral neck or subtrochanteric region are high risk.', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v6')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = 'e0946f0a-76ff-59de-ad46-c58355e19f92';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('6d8d0afe-266b-5bac-a323-57e71925a003', 'e0946f0a-76ff-59de-ad46-c58355e19f92', 'A', 'Gout', false, 0),
  ('2138e1a5-54a2-55fe-a5e9-c59481a2dc07', 'e0946f0a-76ff-59de-ad46-c58355e19f92', 'B', 'Osteoarthritis only', false, 1),
  ('debab2ce-3d9d-5848-a632-c8a53b83a5c9', 'e0946f0a-76ff-59de-ad46-c58355e19f92', 'C', 'Infection only', false, 2),
  ('c42f564b-2b9e-56a6-8aa6-718c57b8d190', 'e0946f0a-76ff-59de-ad46-c58355e19f92', 'D', 'Pathological fracture (consider prophylactic fixation)', true, 3),
  ('8204893b-99f7-5cb2-9961-79c8320e9b32', 'e0946f0a-76ff-59de-ad46-c58355e19f92', 'E', 'Avascular necrosis', false, 4);

-- Q313
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('7782d83c-15ed-5859-a2ef-832d25e2606d', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000011', 'sba', 'A 50 year old man has had a sudden onset of severe back pain after a minor strain. He has a history of IV drug use, fever and a raised CRP. What is the MOST important investigation?', 'Red flags for spinal infection: fever, IV drug use, immunosuppression, recent infection or procedure. MRI is the investigation of choice. Take blood cultures and treat with prolonged antibiotics; surgery for neurological deficit or abscess.', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v6')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = '7782d83c-15ed-5859-a2ef-832d25e2606d';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('c30f8a4a-c853-5e67-bd61-e67c6410c48d', '7782d83c-15ed-5859-a2ef-832d25e2606d', 'A', 'Ultrasound', false, 0),
  ('f3a970ba-4cc7-598b-b871-245150efdf5c', '7782d83c-15ed-5859-a2ef-832d25e2606d', 'B', 'Plain X-ray only', false, 1),
  ('be69529a-c3ab-5ba8-b38b-9e45814683e8', '7782d83c-15ed-5859-a2ef-832d25e2606d', 'C', 'CT abdomen', false, 2),
  ('9812629a-2232-5d0c-a453-77e16ed2511b', '7782d83c-15ed-5859-a2ef-832d25e2606d', 'D', 'MRI spine with contrast (suspected spinal infection: discitis or epidural abscess)', true, 3),
  ('a3504e78-92ee-5da1-b8ee-c8afb8437b2a', '7782d83c-15ed-5859-a2ef-832d25e2606d', 'E', 'No imaging needed', false, 4);

-- Q314
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('090c0f29-0915-5b86-8609-0ada1bcd23d2', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000019', 'sba', 'A 35 year old woman with SLE has had a fever, rash and joint pain flare. Which medicine should all patients with SLE take unless contraindicated?', 'Hydroxychloroquine reduces flares, improves survival and protects against thrombosis in SLE. Check eyes at baseline and annually after 5 years (retinopathy). Steroids, azathioprine, mycophenolate and biologics (belimumab, anifrolumab) are used for active disease.', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v6')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = '090c0f29-0915-5b86-8609-0ada1bcd23d2';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('354cf7cf-6d4e-502c-849f-b9058e237afd', '090c0f29-0915-5b86-8609-0ada1bcd23d2', 'A', 'Long-term high-dose prednisolone', false, 0),
  ('40f06488-fd19-5336-98fa-50e6b8907b76', '090c0f29-0915-5b86-8609-0ada1bcd23d2', 'B', 'Azathioprine', false, 1),
  ('bd3d8536-1bd4-5c5e-b028-5bee3a3cf983', '090c0f29-0915-5b86-8609-0ada1bcd23d2', 'C', 'Rituximab', false, 2),
  ('9265d0c3-f7da-5053-a111-b2b015f7860f', '090c0f29-0915-5b86-8609-0ada1bcd23d2', 'D', 'Methotrexate', false, 3),
  ('f589db10-5004-52cf-b221-e6fd655e54c3', '090c0f29-0915-5b86-8609-0ada1bcd23d2', 'E', 'Hydroxychloroquine', true, 4);

-- Q315
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('2330f2a6-1f6c-53c3-97d4-333efbbed8b5', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000019', 'sba', 'A 28 year old woman has had a rash after sun exposure, arthritis and positive ANA. She is taking hydralazine. Anti-histone antibodies are positive. What is the SINGLE most likely diagnosis?', 'Drug-induced lupus is associated with hydralazine, procainamide, isoniazid, minocycline and anti-TNF drugs. Anti-histone antibodies are positive; renal and CNS involvement is rare. It resolves after stopping the drug.', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v6')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = '2330f2a6-1f6c-53c3-97d4-333efbbed8b5';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('11ff3f7a-6573-5d97-9e44-6decb418e5b1', '2330f2a6-1f6c-53c3-97d4-333efbbed8b5', 'A', 'Rheumatoid arthritis', false, 0),
  ('62422d4b-594f-5722-8dc8-dbd326469408', '2330f2a6-1f6c-53c3-97d4-333efbbed8b5', 'B', 'Dermatomyositis', false, 1),
  ('91893284-6e2e-5139-b3bf-6362de866289', '2330f2a6-1f6c-53c3-97d4-333efbbed8b5', 'C', 'Drug-induced lupus', true, 2),
  ('7d719592-e46e-5c1f-954f-7e9a5833bbbe', '2330f2a6-1f6c-53c3-97d4-333efbbed8b5', 'D', 'Sjögren''s syndrome', false, 3),
  ('91a13616-c1ac-5f3b-acfe-2e4e21a89596', '2330f2a6-1f6c-53c3-97d4-333efbbed8b5', 'E', 'SLE', false, 4);

-- Q316
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('c3f2a4b8-9d3f-5391-8b65-00c4d6649c09', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000019', 'sba', 'A 45 year old woman with rheumatoid arthritis is starting methotrexate. Which pre-treatment checks are recommended?', 'Before starting methotrexate: bloods (FBC, U&E, LFTs), CXR, and viral hepatitis screening. Monitor bloods regularly. Give folic acid weekly (on a different day). Avoid live vaccines. Advise contraception and limiting alcohol.', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v6')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = 'c3f2a4b8-9d3f-5391-8b65-00c4d6649c09';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('6850658a-f933-5eb8-9eca-645bf195b1e6', 'c3f2a4b8-9d3f-5391-8b65-00c4d6649c09', 'A', 'Only an ECG', false, 0),
  ('dab2400d-82bb-5173-89d7-48cc61927d9c', 'c3f2a4b8-9d3f-5391-8b65-00c4d6649c09', 'B', 'FBC, U&E, LFTs, chest X-ray, and hepatitis B, C and HIV screening, with vaccination review', true, 1),
  ('48362a46-0240-563b-9521-6316b3ead87a', 'c3f2a4b8-9d3f-5391-8b65-00c4d6649c09', 'C', 'Only an eye exam', false, 2),
  ('5855fc59-049e-521a-850e-b9eae8024636', 'c3f2a4b8-9d3f-5391-8b65-00c4d6649c09', 'D', 'Only a urine dip', false, 3),
  ('d1b8faa0-6ea4-54f0-ac69-03f0868db8c4', 'c3f2a4b8-9d3f-5391-8b65-00c4d6649c09', 'E', 'No checks needed', false, 4);

-- Q317
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('286b75d7-9a7b-5450-b9b9-43bd68a41f94', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000019', 'sba', 'A 52 year old man has had a red, hot, swollen ankle. Aspiration shows needle-shaped, negatively birefringent crystals. He drinks heavily and is on a thiazide. What is the SINGLE most likely diagnosis?', 'Gout: needle-shaped, negatively birefringent urate crystals. Risk factors: male sex, alcohol, purine-rich diet, thiazide and loop diuretics, CKD, obesity and metabolic syndrome. Pseudogout: rhomboid, positively birefringent CPPD crystals.', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v6')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = '286b75d7-9a7b-5450-b9b9-43bd68a41f94';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('b9135b38-eaec-51f3-b7b9-b02d76a1f671', '286b75d7-9a7b-5450-b9b9-43bd68a41f94', 'A', 'Reactive arthritis', false, 0),
  ('de12cc97-7f06-5b0d-b040-82c856bec87f', '286b75d7-9a7b-5450-b9b9-43bd68a41f94', 'B', 'Rheumatoid arthritis', false, 1),
  ('97db5a70-da43-5c0b-835d-d39422629a52', '286b75d7-9a7b-5450-b9b9-43bd68a41f94', 'C', 'Gout (monosodium urate crystals)', true, 2),
  ('fd250390-67db-5f77-9109-5fc866a22aa4', '286b75d7-9a7b-5450-b9b9-43bd68a41f94', 'D', 'Septic arthritis', false, 3),
  ('ef2c1c43-8ee4-56a3-baeb-67fc92a31003', '286b75d7-9a7b-5450-b9b9-43bd68a41f94', 'E', 'Pseudogout', false, 4);

-- Q318
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('8a092974-1233-510e-881a-389466dd810f', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000019', 'sba', 'A 60 year old woman has had dry mouth and eyes, fatigue and arthralgia. She has a raised ESR and positive rheumatoid factor. Schirmer''s test is abnormal. What is the BEST test to confirm the diagnosis?', 'Primary Sjögren''s syndrome: dry eyes and mouth, parotid swelling, fatigue and arthralgia. Anti-Ro and anti-La are positive in most. Lip (minor salivary gland) biopsy shows lymphocytic infiltration. Increased lymphoma risk.', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v6')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = '8a092974-1233-510e-881a-389466dd810f';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('e057f12d-2767-544c-bbde-ee8f6f007e4a', '8a092974-1233-510e-881a-389466dd810f', 'A', 'ANCA', false, 0),
  ('35c5f185-05c2-5c12-8061-d3ded34ef032', '8a092974-1233-510e-881a-389466dd810f', 'B', 'HLA-B27', false, 1),
  ('0584cab7-9398-53d6-a050-a5fc14e1d1a3', '8a092974-1233-510e-881a-389466dd810f', 'C', 'Anti-Ro and anti-La antibodies (and lip biopsy if needed)', true, 2),
  ('17b54d01-b4a1-5dad-a0e9-eb0921a2484d', '8a092974-1233-510e-881a-389466dd810f', 'D', 'Anti-CCP', false, 3),
  ('939ca9dc-042f-50db-9e99-de92021f875f', '8a092974-1233-510e-881a-389466dd810f', 'E', 'Anti-dsDNA', false, 4);

-- Q319
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('a90a2e7b-27cb-5db6-803a-f1aaa80acd2c', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000019', 'sba', 'A 45 year old man has had a fever, weight loss, asthma, eosinophilia and nasal polyps, then numbness of his foot. What is the SINGLE most likely diagnosis?', 'EGPA: asthma, eosinophilia, sinusitis, neuropathy (mononeuritis multiplex), skin and cardiac involvement. MPO-ANCA positive in some. Treatment: steroids, with immunosuppression for severe disease, and mepolizumab.', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v6')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = 'a90a2e7b-27cb-5db6-803a-f1aaa80acd2c';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('2ddc47d4-b9f3-593f-9ab4-b8bd9c1f3a2f', 'a90a2e7b-27cb-5db6-803a-f1aaa80acd2c', 'A', 'Sarcoidosis', false, 0),
  ('8bea824d-b560-514e-a915-a8f21b7e9b04', 'a90a2e7b-27cb-5db6-803a-f1aaa80acd2c', 'B', 'Granulomatosis with polyangiitis', false, 1),
  ('71dc1771-330b-59d1-98d9-3bbf377b5d29', 'a90a2e7b-27cb-5db6-803a-f1aaa80acd2c', 'C', 'Eosinophilic granulomatosis with polyangiitis', true, 2),
  ('dad82ee9-fd00-5064-8de3-41abc23566b6', 'a90a2e7b-27cb-5db6-803a-f1aaa80acd2c', 'D', 'Polyarteritis nodosa', false, 3),
  ('2223e435-e6e6-546c-9b72-13dc9d2cf0df', 'a90a2e7b-27cb-5db6-803a-f1aaa80acd2c', 'E', 'ABPA', false, 4);

-- Q320
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('94a4ab9a-cafc-55ed-ad47-9dee59202359', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000029', 'sba', 'An 88 year old man in a care home has had a fall. He is on 12 medications. Which drug class is MOST associated with falls in older people?', 'Falls-risk-increasing drugs include sedatives, antidepressants, antipsychotics, antihypertensives (especially alpha-blockers), diuretics, anticholinergics and opioids. Medication review is a key part of falls prevention.', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v6')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = '94a4ab9a-cafc-55ed-ad47-9dee59202359';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('0628ca14-1f6c-5c76-b814-729b6b0717d3', '94a4ab9a-cafc-55ed-ad47-9dee59202359', 'A', 'Paracetamol', false, 0),
  ('56a3e22e-86bf-582c-90ef-8cbba2f2f992', '94a4ab9a-cafc-55ed-ad47-9dee59202359', 'B', 'Proton pump inhibitors', false, 1),
  ('d7293c20-cd4e-5180-83dc-b25170b6e983', '94a4ab9a-cafc-55ed-ad47-9dee59202359', 'C', 'Statins', false, 2),
  ('a0895de7-aba4-5e16-85e3-f4cc9af07bd1', '94a4ab9a-cafc-55ed-ad47-9dee59202359', 'D', 'Vitamin D', false, 3),
  ('47f3ae60-fa74-5514-a124-68b1d310beaa', '94a4ab9a-cafc-55ed-ad47-9dee59202359', 'E', 'Psychotropic drugs (benzodiazepines, Z-drugs, antidepressants, antipsychotics)', true, 4);

-- Q321
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('b618f19e-e542-5d55-809a-09071b9573c5', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000029', 'sba', 'An 85 year old woman has had urinary incontinence and confusion. She takes oxybutynin for overactive bladder. What is the MOST appropriate change?', 'Oxybutynin (immediate-release) should be avoided in frail older women due to cognitive impairment risk. Mirabegron is an alternative (check BP). Bladder training and prompted voiding are non-drug options.', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v6')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = 'b618f19e-e542-5d55-809a-09071b9573c5';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('e4e2555d-abbf-547b-b528-7b9f3846f6ff', 'b618f19e-e542-5d55-809a-09071b9573c5', 'A', 'Increase oxybutynin', false, 0),
  ('8e8b08c1-108c-5d01-a459-a49786424b93', 'b618f19e-e542-5d55-809a-09071b9573c5', 'B', 'Add amitriptyline', false, 1),
  ('35bec9ff-a6eb-5565-adb1-1b8e501590d2', 'b618f19e-e542-5d55-809a-09071b9573c5', 'C', 'Catheterise', false, 2),
  ('d3a063da-b263-52f8-9791-ebbf22212987', 'b618f19e-e542-5d55-809a-09071b9573c5', 'D', 'Start haloperidol', false, 3),
  ('9258e747-ff45-559d-8f35-e015186f1130', 'b618f19e-e542-5d55-809a-09071b9573c5', 'E', 'Stop oxybutynin (anticholinergic) and consider mirabegron or a non-drug approach', true, 4);

-- Q322
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('cfda05a1-d00a-54b4-8711-d0513ccff030', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000029', 'sba', 'An 80 year old woman has had progressive weight loss, constipation, confusion and thirst. Her calcium is 3.1 mmol/L. PTH is raised. She is frail. What is the SINGLE most appropriate management?', 'Primary hyperparathyroidism is common in older women. Treat severe or symptomatic hypercalcaemia with fluids. Parathyroidectomy is curative, but cinacalcet and bisphosphonates are options for frail people. Avoid thiazides.', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v6')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = 'cfda05a1-d00a-54b4-8711-d0513ccff030';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('057b6bb1-97f2-5917-9106-7c241fac6452', 'cfda05a1-d00a-54b4-8711-d0513ccff030', 'A', 'Calcium supplements', false, 0),
  ('0e952f22-0bb5-5c84-a6e4-166c06dd4b16', 'cfda05a1-d00a-54b4-8711-d0513ccff030', 'B', 'Vitamin D', false, 1),
  ('227679d1-48a3-592e-a6d6-fac7817d9188', 'cfda05a1-d00a-54b4-8711-d0513ccff030', 'C', 'IV fluids, then consider cinacalcet or surgery depending on fitness and symptoms', true, 2),
  ('b8a9615d-3e75-5250-9747-25ec2ebb6553', 'cfda05a1-d00a-54b4-8711-d0513ccff030', 'D', 'Thiazide diuretic', false, 3),
  ('c6a3a0a6-1b86-5e51-a5e2-12b469fd6bd5', 'cfda05a1-d00a-54b4-8711-d0513ccff030', 'E', 'Ignore it at her age', false, 4);

-- Q323
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('cfb5e0ea-044a-51ad-9b71-b60e0e7f85b6', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000029', 'sba', 'A 79 year old man is admitted with pneumonia. On day 3 he is pulling out his cannula and believes he is in prison. He has no previous cognitive problems. What is the SINGLE most likely diagnosis?', 'Delirium is acute, fluctuating disturbance of attention and cognition. Hyperactive (agitation, hallucinations), hypoactive (drowsy, withdrawn, often missed) and mixed types. Treat the cause and use non-drug approaches; delirium increases mortality and risk of dementia.', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v6')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = 'cfb5e0ea-044a-51ad-9b71-b60e0e7f85b6';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('e65b3c9e-af9f-54ac-8132-d6daf5209852', 'cfb5e0ea-044a-51ad-9b71-b60e0e7f85b6', 'A', 'Psychosis', false, 0),
  ('2f792231-20ec-54af-9ab6-a6255f142515', 'cfb5e0ea-044a-51ad-9b71-b60e0e7f85b6', 'B', 'Hyperactive delirium', true, 1),
  ('57b1166d-3224-5324-894d-8ae236d65b0f', 'cfb5e0ea-044a-51ad-9b71-b60e0e7f85b6', 'C', 'Depression', false, 2),
  ('a21debb7-8b12-53d9-a2cd-d1962f35ec1c', 'cfb5e0ea-044a-51ad-9b71-b60e0e7f85b6', 'D', 'Dementia', false, 3),
  ('b4722f5a-5794-5c6a-93e5-78b1afaad52d', 'cfb5e0ea-044a-51ad-9b71-b60e0e7f85b6', 'E', 'Mania', false, 4);

-- Q324
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('02e8f20d-70de-5a80-85db-075046f14e29', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000029', 'sba', 'An 87 year old man has had constipation, abdominal discomfort and overflow incontinence. He takes co-codamol, amitriptyline and furosemide. What is the SINGLE most appropriate management?', 'Constipation is common in older people (opioids, anticholinergics, immobility, poor fluid and fibre intake). It causes overflow diarrhoea, urinary retention, delirium and falls. Treat with laxatives (macrogol) and deprescribe where possible.', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v6')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = '02e8f20d-70de-5a80-85db-075046f14e29';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('2619385f-6430-58ed-a365-6bf052ff8bcb', '02e8f20d-70de-5a80-85db-075046f14e29', 'A', 'Antibiotics', false, 0),
  ('343113ae-926f-5faa-b701-34bac8048f9c', '02e8f20d-70de-5a80-85db-075046f14e29', 'B', 'Start oxybutynin', false, 1),
  ('0016fa6e-2950-5e10-a5de-a1dbb17a1ccd', '02e8f20d-70de-5a80-85db-075046f14e29', 'C', 'Loperamide', false, 2),
  ('cfa98045-76b2-5ef8-bdaa-334b67f60cfb', '02e8f20d-70de-5a80-85db-075046f14e29', 'D', 'Catheterise', false, 3),
  ('035ecd9b-270a-51fb-915d-4b062979384b', '02e8f20d-70de-5a80-85db-075046f14e29', 'E', 'Treat constipation (laxatives, disimpaction) and review constipating drugs', true, 4);

-- Q325
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('61877c09-0f12-5e33-9807-908f6539c455', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000029', 'sba', 'An 83 year old woman lives alone. She has had several hospital admissions this year. She wants to stay at home. What is the MOST appropriate approach?', 'Comprehensive geriatric assessment improves outcomes for frail older people (more likely to be alive and living at home). It covers medical problems, function, cognition, mood, social support, environment and medications.', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v6')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = '61877c09-0f12-5e33-9807-908f6539c455';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('233c8368-36ea-5e41-a374-0cd791b77ef9', '61877c09-0f12-5e33-9807-908f6539c455', 'A', 'Refer only to a specialist', false, 0),
  ('5b4f8775-ae7b-5c4b-bb22-f28f36db8532', '61877c09-0f12-5e33-9807-908f6539c455', 'B', 'Comprehensive geriatric assessment with a multidisciplinary care plan (medical, functional, psychological and social)', true, 1),
  ('9bfd0621-6ed7-5f91-bfd3-ee40d45f2917', '61877c09-0f12-5e33-9807-908f6539c455', 'C', 'Admit to a care home', false, 2),
  ('e9a6342a-9271-5a41-be33-af26c8b31797', '61877c09-0f12-5e33-9807-908f6539c455', 'D', 'Discharge with no follow-up', false, 3),
  ('a62d9c15-83b0-5d0b-a36e-c59198c95833', '61877c09-0f12-5e33-9807-908f6539c455', 'E', 'Stop all medications', false, 4);

-- Q326
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('d209ab86-d156-54e9-8f76-7fbd7e4b5e3c', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000017', 'sba', 'A 70 year old woman with advanced dementia is in the last days of life. She grimaces and moans when turned. She cannot report pain. Which tool can help assess pain?', 'People with advanced dementia may not be able to report pain. Observational tools (Abbey Pain Scale, PAINAD) assess vocalisation, facial expression, body language and behaviour. Treat pain regularly and reassess.', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v6')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = 'd209ab86-d156-54e9-8f76-7fbd7e4b5e3c';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('36a08d39-0e08-5b79-aac9-71eff6b0c11b', 'd209ab86-d156-54e9-8f76-7fbd7e4b5e3c', 'A', 'MMSE', false, 0),
  ('e2d6da0a-1387-59d1-b94f-fb2bc099a956', 'd209ab86-d156-54e9-8f76-7fbd7e4b5e3c', 'B', 'GCS', false, 1),
  ('7ffc308a-cc12-542f-ad51-4340a111e2db', 'd209ab86-d156-54e9-8f76-7fbd7e4b5e3c', 'C', 'Numerical rating scale', false, 2),
  ('18bbbd89-b9cc-5b9b-8f55-7ccb531b6af2', 'd209ab86-d156-54e9-8f76-7fbd7e4b5e3c', 'D', 'Visual analogue scale', false, 3),
  ('8d527cbb-5826-5bf7-a95a-d465f1c7cbde', 'd209ab86-d156-54e9-8f76-7fbd7e4b5e3c', 'E', 'Abbey Pain Scale (or PAINAD)', true, 4);

-- Q327
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('c25a61d2-939b-5a5a-9908-f4bfba998216', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000017', 'sba', 'A 65 year old man with metastatic cancer has nausea from raised intracranial pressure. He has brain metastases. Which antiemetic and treatment are MOST appropriate?', 'Raised ICP causes headache and nausea. Dexamethasone reduces cerebral oedema; cyclizine acts centrally. Give dexamethasone in the morning to avoid insomnia, with PPI cover and glucose monitoring.', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v6')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = 'c25a61d2-939b-5a5a-9908-f4bfba998216';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('b0e45940-dc92-5c58-8d7a-ebd7cb69bdf1', 'c25a61d2-939b-5a5a-9908-f4bfba998216', 'A', 'Metoclopramide alone', false, 0),
  ('4901d87f-80ce-5082-af67-7d3e2271bba4', 'c25a61d2-939b-5a5a-9908-f4bfba998216', 'B', 'Haloperidol alone', false, 1),
  ('1eb97baf-f472-5453-99dd-ef85eb3d45de', 'c25a61d2-939b-5a5a-9908-f4bfba998216', 'C', 'Ondansetron alone', false, 2),
  ('76f442dc-ba29-5580-aa5b-76666513fb05', 'c25a61d2-939b-5a5a-9908-f4bfba998216', 'D', 'Cyclizine with dexamethasone', true, 3),
  ('daab1b3e-7e7e-587e-aace-b81a13de4ba0', 'c25a61d2-939b-5a5a-9908-f4bfba998216', 'E', 'Domperidone', false, 4);

-- Q328
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('ae858062-ae86-5a7b-8c8e-c8c5f24ac9a8', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000017', 'sba', 'A 72 year old man with end-stage heart failure is breathless at rest despite maximal medical therapy. He wants to stay at home. What is the MOST appropriate approach?', 'End-stage heart failure has a symptom burden similar to cancer. Palliative care should run alongside cardiac care. Discuss preferences, ICD deactivation, and anticipatory medicines. Subcutaneous furosemide can be given at home.', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v6')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = 'ae858062-ae86-5a7b-8c8e-c8c5f24ac9a8';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('3b4addf6-d83e-588c-8c18-c83e61388ca3', 'ae858062-ae86-5a7b-8c8e-c8c5f24ac9a8', 'A', 'Continue escalating heart failure drugs only', false, 0),
  ('04671322-8afe-599d-9e94-b40411902c97', 'ae858062-ae86-5a7b-8c8e-c8c5f24ac9a8', 'B', 'Palliative care involvement, symptom control (low-dose opioids for breathlessness, diuretics), advance care planning and discussion of deactivating his ICD', true, 1),
  ('843b82b0-e484-567d-86e1-931fef978a56', 'ae858062-ae86-5a7b-8c8e-c8c5f24ac9a8', 'C', 'No change', false, 2),
  ('aaa61d1b-e209-58b7-a925-44e37b7aed42', 'ae858062-ae86-5a7b-8c8e-c8c5f24ac9a8', 'D', 'Admit to ICU', false, 3),
  ('a24e6571-7f64-5bfd-b138-68388cdd5bcf', 'ae858062-ae86-5a7b-8c8e-c8c5f24ac9a8', 'E', 'Heart transplant listing in all', false, 4);

-- Q329
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('5932ac12-acff-51bd-8caa-ef0a08768832', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000017', 'sba', 'A 60 year old man with pancreatic cancer has itching, jaundice and pale stools. He is not fit for surgery. What is the SINGLE most appropriate intervention to relieve his symptoms?', 'Biliary obstruction from pancreatic cancer causes jaundice, itch and cholangitis risk. ERCP with metal stent (or percutaneous drainage) relieves symptoms. Duodenal obstruction may need a duodenal stent or gastrojejunostomy.', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v6')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = '5932ac12-acff-51bd-8caa-ef0a08768832';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('46720500-5612-5fe9-9ce7-b1ab76193043', '5932ac12-acff-51bd-8caa-ef0a08768832', 'A', 'Radiotherapy alone', false, 0),
  ('96b8603c-df75-5a25-8752-9849cee61066', '5932ac12-acff-51bd-8caa-ef0a08768832', 'B', 'Cholecystectomy', false, 1),
  ('8bc1e589-1676-57b4-a467-5c58230039ac', '5932ac12-acff-51bd-8caa-ef0a08768832', 'C', 'No intervention', false, 2),
  ('db2d6e44-b81e-5486-b1b5-f526487b456a', '5932ac12-acff-51bd-8caa-ef0a08768832', 'D', 'High-dose antihistamines only', false, 3),
  ('b2f7c243-dd87-5016-89a0-bb42fe0ca96c', '5932ac12-acff-51bd-8caa-ef0a08768832', 'E', 'Endoscopic (ERCP) biliary stent insertion', true, 4);

-- Q330
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('4b098f25-9d44-5069-b5e6-865396b06934', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000017', 'sba', 'A 58 year old woman with metastatic breast cancer has a pathological fracture of her humerus. She is likely to live several months. What is the SINGLE most appropriate management?', 'Pathological fractures in people with reasonable life expectancy are usually fixed to relieve pain and restore function, then irradiated to control local disease. Check calcium and use bone-targeted agents.', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v6')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = '4b098f25-9d44-5069-b5e6-865396b06934';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('dec895c3-73c2-59c5-af5d-5c37b1edf011', '4b098f25-9d44-5069-b5e6-865396b06934', 'A', 'Sling only for all', false, 0),
  ('01252f34-c8ae-5004-9765-766c2a7d1f41', '4b098f25-9d44-5069-b5e6-865396b06934', 'B', 'Cast for 3 months', false, 1),
  ('af46fbf1-1ae8-54ec-b84f-77905214bff4', '4b098f25-9d44-5069-b5e6-865396b06934', 'C', 'Surgical fixation (e.g. intramedullary nail) followed by radiotherapy', true, 2),
  ('ee127124-298b-56b5-90fd-c4d8120a80dc', '4b098f25-9d44-5069-b5e6-865396b06934', 'D', 'No treatment', false, 3),
  ('e56cb817-2624-514d-a3be-3575549bcb5c', '4b098f25-9d44-5069-b5e6-865396b06934', 'E', 'Amputation', false, 4);

-- Q331
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('2ec533c9-d560-55af-bde6-8bc3baee81d8', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000027', 'sba', 'A 25 year old man asks for a fit note. He has had back pain for 10 days. Which statement about fit notes is CORRECT?', 'Fit notes can be issued after 7 calendar days of sickness absence (self-certification covers the first 7). They can state ''not fit for work'' or ''may be fit for work'' with adjustments (phased return, altered hours, amended duties). Nurses, pharmacists, OTs and physiotherapists can also issue them.', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v6')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = '2ec533c9-d560-55af-bde6-8bc3baee81d8';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('5e30fc0b-cb47-556e-a132-974136d157b4', '2ec533c9-d560-55af-bde6-8bc3baee81d8', 'A', 'Fit notes are needed from day 1', false, 0),
  ('f10e89dd-fa08-5642-84e0-cd92325ad996', '2ec533c9-d560-55af-bde6-8bc3baee81d8', 'B', 'A doctor (or other registered healthcare professional) can issue a fit note after 7 days of absence; the first 7 days are self-certified', true, 1),
  ('4603d36e-ad21-521e-bc5c-31bc363219b4', '2ec533c9-d560-55af-bde6-8bc3baee81d8', 'C', 'Only consultants can issue them', false, 2),
  ('d7c907af-bc9b-56e4-b22e-f3ae68d1401f', '2ec533c9-d560-55af-bde6-8bc3baee81d8', 'D', 'They must be for at least 3 months', false, 3),
  ('b90df72a-f2ca-5acf-9171-bb339ae670ac', '2ec533c9-d560-55af-bde6-8bc3baee81d8', 'E', 'They can only say ''not fit''', false, 4);

-- Q332
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('8ea171a0-4cbf-501b-bd81-b37589ccebde', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000027', 'sba', 'A 35 year old woman has had palpitations and anxiety. She has drunk 6 cups of coffee and 2 energy drinks a day. ECG and TFTs are normal. What is the MOST appropriate first management?', 'Caffeine, alcohol, nicotine and stimulants commonly cause palpitations. Exclude arrhythmias (ECG during symptoms, ambulatory monitoring if recurrent), thyroid disease and anaemia. Red flags: syncope, chest pain, family history of sudden death and exertional symptoms.', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v6')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = '8ea171a0-4cbf-501b-bd81-b37589ccebde';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('30545ebf-897e-5a89-9629-907f8223dd16', '8ea171a0-4cbf-501b-bd81-b37589ccebde', 'A', 'Holter monitor in all', false, 0),
  ('777d7094-24ef-58d9-aa3b-35ca6657b137', '8ea171a0-4cbf-501b-bd81-b37589ccebde', 'B', 'Start an SSRI', false, 1),
  ('ca0ed23c-ebde-588c-ac93-a2198621203a', '8ea171a0-4cbf-501b-bd81-b37589ccebde', 'C', 'Refer to cardiology urgently', false, 2),
  ('fb948450-58bd-5efc-abb3-99fe098eeecc', '8ea171a0-4cbf-501b-bd81-b37589ccebde', 'D', 'Reduce caffeine and stimulants, with reassurance and review', true, 3),
  ('2c5553c2-567c-5241-88ac-bc8d46fe5fa9', '8ea171a0-4cbf-501b-bd81-b37589ccebde', 'E', 'Start a beta-blocker immediately', false, 4);

-- Q333
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('e5b07d9b-3ba6-5e40-bcc5-f3052ac7f32d', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000027', 'sba', 'A 60 year old man asks about the NHS lung cancer screening programme. He smoked for 40 years and quit 5 years ago. What is the CORRECT advice?', 'The NHS targeted lung cancer screening programme invites people aged 55-74 with a smoking history for a risk assessment, then low-dose CT if high risk. It detects lung cancer at earlier, more treatable stages.', null, true, true, jsonb_build_object('source', 'plab1-xlsx-v6')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = 'e5b07d9b-3ba6-5e40-bcc5-f3052ac7f32d';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('f7a74bea-5cb1-5ccc-87c7-c9ba37fb7bd3', 'e5b07d9b-3ba6-5e40-bcc5-f3052ac7f32d', 'A', 'He may be invited for a targeted lung health check (low-dose CT for those at high risk aged 55-74 with a smoking history)', true, 0),
  ('266ba2b3-b249-5311-83a3-f6722532382b', 'e5b07d9b-3ba6-5e40-bcc5-f3052ac7f32d', 'B', 'Screening is only for current smokers', false, 1),
  ('c028e63c-70d2-5bd0-9228-78d0c21b80d9', 'e5b07d9b-3ba6-5e40-bcc5-f3052ac7f32d', 'C', 'There is no lung screening', false, 2),
  ('d91b29c5-14b1-53e6-8b0c-d326725a6c20', 'e5b07d9b-3ba6-5e40-bcc5-f3052ac7f32d', 'D', 'Screening uses sputum cytology', false, 3),
  ('1461e5a8-aa17-545b-b42d-f7a03c8c87cf', 'e5b07d9b-3ba6-5e40-bcc5-f3052ac7f32d', 'E', 'Annual chest X-ray for all smokers', false, 4);

-- Q334
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('e7e78a32-e085-5857-84fe-32919c5235ad', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000027', 'sba', 'A 45 year old woman has had fatigue and generalised itch. Bloods show raised ALP and GGT, normal bilirubin. Anti-mitochondrial antibody is positive. What is the SINGLE most appropriate next step?', 'Primary biliary cholangitis is often detected on routine LFTs. Treatment with ursodeoxycholic acid slows progression. Monitor for osteoporosis, fat-soluble vitamin deficiency and complications of cirrhosis.', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v6')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = 'e7e78a32-e085-5857-84fe-32919c5235ad';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('e0edac1f-6655-5bc2-be62-d351a0bf6b14', 'e7e78a32-e085-5857-84fe-32919c5235ad', 'A', 'Refer to gastroenterology/hepatology and start ursodeoxycholic acid', true, 0),
  ('7be1a9e1-8113-5f34-b31f-9c38d382c367', 'e7e78a32-e085-5857-84fe-32919c5235ad', 'B', 'Repeat bloods in 5 years', false, 1),
  ('4a73ff2c-98ac-5e34-bee0-074c09ea2660', 'e7e78a32-e085-5857-84fe-32919c5235ad', 'C', 'Reassure', false, 2),
  ('92b1b73a-95c1-5791-b873-c55598345a3e', 'e7e78a32-e085-5857-84fe-32919c5235ad', 'D', 'Liver transplant listing', false, 3),
  ('e3efa520-1c7c-50a9-aa66-e2f200b610c9', 'e7e78a32-e085-5857-84fe-32919c5235ad', 'E', 'Start steroids', false, 4);

-- Q335
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('131deb25-a89c-597a-8989-01c228ad7a87', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000027', 'sba', 'A 55 year old man has had erectile dysfunction for 6 months. He has no other symptoms. What is the MOST important additional assessment?', 'ED shares risk factors with cardiovascular disease and can be an early warning sign. Assess lipids, glucose, BP and smoking. Check morning testosterone if low libido. Treatment: PDE-5 inhibitors and lifestyle changes.', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v6')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = '131deb25-a89c-597a-8989-01c228ad7a87';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('20366577-1f34-50e1-a4a4-7b7e637bc6d7', '131deb25-a89c-597a-8989-01c228ad7a87', 'A', 'Prostate biopsy', false, 0),
  ('93caf1df-e3ce-504b-9347-6582ce9ed6c7', '131deb25-a89c-597a-8989-01c228ad7a87', 'B', 'Testicular ultrasound', false, 1),
  ('fad0eeb1-5934-5ab5-9e9e-fe5e07d5d927', '131deb25-a89c-597a-8989-01c228ad7a87', 'C', 'Brain MRI', false, 2),
  ('a1337692-0701-5dce-9c78-7ff523eab52a', '131deb25-a89c-597a-8989-01c228ad7a87', 'D', 'No assessment needed', false, 3),
  ('0e23985c-b8a6-5be0-b65c-8cd04d9459fe', '131deb25-a89c-597a-8989-01c228ad7a87', 'E', 'Cardiovascular risk assessment (lipids, HbA1c, BP), as ED can precede cardiac disease', true, 4);

-- Q336
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('c41591ab-7074-5211-a625-c3168d8271bd', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000027', 'sba', 'A 28 year old woman has had a migraine for 8 hours. She has had similar attacks before. She has taken ibuprofen without benefit. What is the SINGLE most appropriate acute treatment?', 'NICE CG150: for acute migraine, offer an oral triptan with an NSAID or paracetamol. Add an antiemetic (metoclopramide or prochlorperazine) if needed. Avoid opioids. Limit acute treatments to avoid medication-overuse headache.', null, true, true, jsonb_build_object('source', 'plab1-xlsx-v6', 'guidelines_text', 'NICE CG150')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = 'c41591ab-7074-5211-a625-c3168d8271bd';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('b5a57599-3f5e-50b1-99d6-ce03e610361a', 'c41591ab-7074-5211-a625-c3168d8271bd', 'A', 'No treatment', false, 0),
  ('b365fc45-fc42-57d3-980b-9578c4275c43', 'c41591ab-7074-5211-a625-c3168d8271bd', 'B', 'Long-term propranolol only', false, 1),
  ('60c7887d-4e19-561a-9ea8-85f91118c553', 'c41591ab-7074-5211-a625-c3168d8271bd', 'C', 'Opioids', false, 2),
  ('2579a800-41a1-50de-a402-fa52505bf6e7', 'c41591ab-7074-5211-a625-c3168d8271bd', 'D', 'Ergotamine', false, 3),
  ('1084d6bf-2b9c-543b-a4c0-1b767627dae3', 'c41591ab-7074-5211-a625-c3168d8271bd', 'E', 'A triptan (e.g. sumatriptan) with an NSAID or paracetamol, plus an antiemetic if needed', true, 4);

-- Q337
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('3b36cdf4-18fa-5b1b-afb8-af1299ae5241', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000027', 'sba', 'A 50 year old woman has had pain in her calves at night with cramps. She takes a statin. CK is normal. What is the MOST appropriate advice?', 'Nocturnal leg cramps are common and usually benign. Stretching helps. Quinine is no longer routinely recommended (risk of serious side effects). Statin-associated muscle symptoms may improve with a dose change or alternative statin.', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v6')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = '3b36cdf4-18fa-5b1b-afb8-af1299ae5241';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('87d57b9d-c50e-5642-b3fd-d11c786180c8', '3b36cdf4-18fa-5b1b-afb8-af1299ae5241', 'A', 'No change', false, 0),
  ('35312557-f956-5543-b137-d170b526b7ff', '3b36cdf4-18fa-5b1b-afb8-af1299ae5241', 'B', 'Stretching exercises; review the statin if symptoms persist (consider a trial off statin and rechallenge)', true, 1),
  ('d0a4095e-f6d8-5ab5-a585-96f7570b52a0', '3b36cdf4-18fa-5b1b-afb8-af1299ae5241', 'C', 'Stop the statin permanently', false, 2),
  ('59100555-9bd9-5526-80f8-ab2e798b7cc0', '3b36cdf4-18fa-5b1b-afb8-af1299ae5241', 'D', 'Start a fibrate', false, 3),
  ('bfa710fe-9550-5d56-9116-a4f72c94a4b2', '3b36cdf4-18fa-5b1b-afb8-af1299ae5241', 'E', 'Quinine for all', false, 4);

-- Q338
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('0b672c2d-f2eb-55af-9d8e-6a1a96a2d325', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000021', 'sba', 'Which measure is used to compare death rates between populations with different age structures?', 'Standardisation adjusts for age differences between populations. Direct standardisation applies age-specific rates to a standard population. Indirect standardisation gives a standardised mortality ratio (observed/expected deaths x 100).', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v6')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = '0b672c2d-f2eb-55af-9d8e-6a1a96a2d325';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('f0bbb9b0-dc30-52c7-b24f-4e501cdc2433', '0b672c2d-f2eb-55af-9d8e-6a1a96a2d325', 'A', 'Case fatality rate', false, 0),
  ('3b2087f5-0ca0-57f6-bd62-a2076afe92cb', '0b672c2d-f2eb-55af-9d8e-6a1a96a2d325', 'B', 'Prevalence', false, 1),
  ('bdf9fdbb-3441-5eba-921c-7aed75ec0389', '0b672c2d-f2eb-55af-9d8e-6a1a96a2d325', 'C', 'Crude mortality rate', false, 2),
  ('27a57ae6-5b2e-5a21-9c63-92ffa77c2e96', '0b672c2d-f2eb-55af-9d8e-6a1a96a2d325', 'D', 'Incidence rate ratio', false, 3),
  ('c02fbd7d-d62e-526e-92bd-eec531864626', '0b672c2d-f2eb-55af-9d8e-6a1a96a2d325', 'E', 'Age-standardised mortality rate (or standardised mortality ratio)', true, 4);

-- Q339
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('f2b6b069-ae03-51a5-b0d0-f5992b1c10c1', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000021', 'sba', 'A study reports that 30% of people with a disease die within 1 year of diagnosis. What does this measure?', 'Case fatality rate is the proportion of people with a disease who die from it within a defined time. Mortality rate is deaths per population per year. Case fatality reflects disease severity.', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v6')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = 'f2b6b069-ae03-51a5-b0d0-f5992b1c10c1';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('0245f3eb-9862-5fab-b8d7-5670d42d98cc', 'f2b6b069-ae03-51a5-b0d0-f5992b1c10c1', 'A', 'Mortality rate', false, 0),
  ('6930cbb9-0256-5cf4-b696-2bfc0e32021a', 'f2b6b069-ae03-51a5-b0d0-f5992b1c10c1', 'B', 'Case fatality rate', true, 1),
  ('e8fa1e2d-d424-5160-9f89-1d9bf22d71e8', 'f2b6b069-ae03-51a5-b0d0-f5992b1c10c1', 'C', 'Incidence', false, 2),
  ('b91283a1-74af-58cc-b8ae-b2e8d71b0023', 'f2b6b069-ae03-51a5-b0d0-f5992b1c10c1', 'D', 'Prevalence', false, 3),
  ('b654fd24-b042-50ef-88a0-6933324db66c', 'f2b6b069-ae03-51a5-b0d0-f5992b1c10c1', 'E', 'Relative risk', false, 4);

-- Q340
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('0267c61a-7ffc-5cfd-b173-0385e019ec43', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000021', 'sba', 'A screening test has 99% specificity. It is used in a population where the disease prevalence is 0.1%. What is the MAIN problem?', 'Even a highly specific test produces many false positives when prevalence is low. PPV depends on prevalence, sensitivity and specificity. Confirmatory testing is needed.', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v6')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = '0267c61a-7ffc-5cfd-b173-0385e019ec43';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('2340cd4e-4a84-5068-8308-2c409a7ec1fc', '0267c61a-7ffc-5cfd-b173-0385e019ec43', 'A', 'Most negatives will be false', false, 0),
  ('58c89afb-ac1f-54cb-b8fb-a59d46363700', '0267c61a-7ffc-5cfd-b173-0385e019ec43', 'B', 'Most positive results will be false positives (low positive predictive value)', true, 1),
  ('3c8ded02-1ebe-5980-b3fb-6ff7eed3c132', '0267c61a-7ffc-5cfd-b173-0385e019ec43', 'C', 'The test is perfect', false, 2),
  ('8b8736bd-63fa-5e38-bc2d-9eee25202820', '0267c61a-7ffc-5cfd-b173-0385e019ec43', 'D', 'The test will miss most cases', false, 3),
  ('4a14972f-e134-5eb5-960d-102c67ead50f', '0267c61a-7ffc-5cfd-b173-0385e019ec43', 'E', 'Sensitivity is low', false, 4);

-- Q341
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('cce34bac-d2ac-5f34-9faf-f2bc9a0d1501', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000021', 'sba', 'A doctor wants to know whether a new drug works better than standard treatment. What is the BEST study design?', 'RCTs randomise participants to reduce confounding, ideally with blinding and intention-to-treat analysis. They are the best design for testing interventions. CONSORT guidelines report RCTs.', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v6')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = 'cce34bac-d2ac-5f34-9faf-f2bc9a0d1501';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('acc172f8-5663-584a-9be9-65b87ad349a6', 'cce34bac-d2ac-5f34-9faf-f2bc9a0d1501', 'A', 'Cohort study', false, 0),
  ('61583518-0029-5368-89e9-8480f862415f', 'cce34bac-d2ac-5f34-9faf-f2bc9a0d1501', 'B', 'Randomised controlled trial', true, 1),
  ('1a61a967-47ba-5420-a401-4838c1b45d94', 'cce34bac-d2ac-5f34-9faf-f2bc9a0d1501', 'C', 'Cross-sectional survey', false, 2),
  ('078369fe-ecb2-50cc-b053-3ac1bfbc9a95', 'cce34bac-d2ac-5f34-9faf-f2bc9a0d1501', 'D', 'Case-control study', false, 3),
  ('b489d74e-71d8-5041-a2ab-0efa9537074a', 'cce34bac-d2ac-5f34-9faf-f2bc9a0d1501', 'E', 'Case series', false, 4);

-- Q342
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('d83cf082-e6f1-5e66-aa41-cfed6ecb20fb', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000021', 'sba', 'In a trial, patients are analysed according to the group they were randomised to, even if they did not complete treatment. What is this called?', 'Intention-to-treat analysis preserves the benefits of randomisation and gives a realistic estimate of effectiveness. Per-protocol analysis includes only those who completed treatment and may overestimate benefit.', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v6')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = 'd83cf082-e6f1-5e66-aa41-cfed6ecb20fb';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('dd858586-b477-5066-a887-d9500af9a0b1', 'd83cf082-e6f1-5e66-aa41-cfed6ecb20fb', 'A', 'Sensitivity analysis', false, 0),
  ('1c51d4b0-78e2-524e-b869-f282ac3b56b4', 'd83cf082-e6f1-5e66-aa41-cfed6ecb20fb', 'B', 'Subgroup analysis', false, 1),
  ('e4a21a54-52e9-52d7-9386-e817c05c2ead', 'd83cf082-e6f1-5e66-aa41-cfed6ecb20fb', 'C', 'Multivariate analysis', false, 2),
  ('1a18d9b2-8fe5-5b0e-a790-ddb1ebaf551a', 'd83cf082-e6f1-5e66-aa41-cfed6ecb20fb', 'D', 'Per-protocol analysis', false, 3),
  ('b7c93311-52ce-548d-be2b-d3e1383a28bd', 'd83cf082-e6f1-5e66-aa41-cfed6ecb20fb', 'E', 'Intention-to-treat analysis', true, 4);

-- Q343
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('e0f2c9a4-bdc9-525c-9b92-327279ea4cdf', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000021', 'sba', 'A drug has a relative risk reduction of 50% for stroke. The baseline risk is 2%. What is the absolute risk reduction and NNT?', 'ARR = baseline risk x RRR = 2% x 0.5 = 1%. NNT = 1/0.01 = 100. Relative risk reductions can make benefits look larger than they are; absolute measures are more meaningful for decisions.', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v6')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = 'e0f2c9a4-bdc9-525c-9b92-327279ea4cdf';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('9781b434-4b0f-51ef-90c7-034f2977e6e5', 'e0f2c9a4-bdc9-525c-9b92-327279ea4cdf', 'A', 'ARR 50%; NNT 2', false, 0),
  ('f465c00b-f310-5f4f-ba84-af48a3d13454', 'e0f2c9a4-bdc9-525c-9b92-327279ea4cdf', 'B', 'ARR 10%; NNT 10', false, 1),
  ('ea4b32f2-6dff-50e6-acf4-976fd8635c1f', 'e0f2c9a4-bdc9-525c-9b92-327279ea4cdf', 'C', 'ARR 0.5%; NNT 200', false, 2),
  ('5315ce79-8254-59cd-9998-6afa3a72898f', 'e0f2c9a4-bdc9-525c-9b92-327279ea4cdf', 'D', 'ARR 2%; NNT 50', false, 3),
  ('89c678da-54aa-5dd0-b2e3-f7ff9bb2e9bd', 'e0f2c9a4-bdc9-525c-9b92-327279ea4cdf', 'E', 'ARR 1%; NNT 100', true, 4);

-- Q344
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('9e45b337-9e00-5699-9f1e-cc9a9ba41ba6', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000036', 'sba', 'A 35 year old woman''s father has haemochromatosis (HFE C282Y homozygous). What is the MOST appropriate test for her?', 'First-degree relatives of people with haemochromatosis should be offered testing (iron studies and HFE genotype). Treatment with venesection prevents complications. Penetrance is incomplete, and women are protected by menstruation.', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v6')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = '9e45b337-9e00-5699-9f1e-cc9a9ba41ba6';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('36cd40f0-8b6c-514d-a2de-de8d588a7b9e', '9e45b337-9e00-5699-9f1e-cc9a9ba41ba6', 'A', 'Iron studies (ferritin, transferrin saturation) and HFE genetic testing', true, 0),
  ('1093297f-f354-5170-b464-b06c32f0c70b', '9e45b337-9e00-5699-9f1e-cc9a9ba41ba6', 'B', 'No testing needed', false, 1),
  ('45b6501e-5484-554b-8b9f-15c9818f6888', '9e45b337-9e00-5699-9f1e-cc9a9ba41ba6', 'C', 'Bone marrow biopsy', false, 2),
  ('e3501bae-2dc5-5349-9fe3-5b804c7f9e4b', '9e45b337-9e00-5699-9f1e-cc9a9ba41ba6', 'D', 'MRI liver', false, 3),
  ('510f9c68-92b5-58d8-ad9f-0327db6984d1', '9e45b337-9e00-5699-9f1e-cc9a9ba41ba6', 'E', 'Liver biopsy', false, 4);

-- Q345
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('9190bf48-8c26-5106-b723-61ff440c0cd7', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000036', 'sba', 'A newborn has a cleft lip and palate, polydactyly and congenital heart disease. Which chromosome abnormality is MOST likely?', 'Patau syndrome: cleft lip and palate, polydactyly, microphthalmia, holoprosencephaly and heart defects; most die in infancy. Edwards (trisomy 18): rocker-bottom feet, clenched hands with overlapping fingers, small jaw and heart defects.', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v6')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = '9190bf48-8c26-5106-b723-61ff440c0cd7';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('d6fd2e65-deec-5178-88f3-c80e7a08e1fc', '9190bf48-8c26-5106-b723-61ff440c0cd7', 'A', 'Trisomy 13 (Patau syndrome)', true, 0),
  ('ee1b79d3-0e55-5491-ba85-daa9daad4ef8', '9190bf48-8c26-5106-b723-61ff440c0cd7', 'B', 'Trisomy 21', false, 1),
  ('82eb7920-8cad-5c56-9042-5ee4a1e1b0fa', '9190bf48-8c26-5106-b723-61ff440c0cd7', 'C', 'Trisomy 18', false, 2),
  ('869ed7de-a596-5d10-9bf0-4d56a98dec00', '9190bf48-8c26-5106-b723-61ff440c0cd7', 'D', 'Turner syndrome', false, 3),
  ('3198f868-240b-5f66-b0c7-8bef05112172', '9190bf48-8c26-5106-b723-61ff440c0cd7', 'E', 'Klinefelter syndrome', false, 4);

-- Q346
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('7baf3866-7fe3-5cbe-9b82-3f13ee45bc3e', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000036', 'sba', 'A 7 year old girl has short stature, a webbed neck and pulmonary stenosis. Her karyotype is normal. Her father is also short with a webbed neck. What is the SINGLE most likely diagnosis?', 'Noonan syndrome is autosomal dominant (PTPN11 and others), with a normal karyotype, short stature, webbed neck, pulmonary stenosis, hypertrophic cardiomyopathy and learning difficulties. It affects both sexes, unlike Turner syndrome.', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v6')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = '7baf3866-7fe3-5cbe-9b82-3f13ee45bc3e';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('e2630155-0439-5625-a860-28231510d18a', '7baf3866-7fe3-5cbe-9b82-3f13ee45bc3e', 'A', 'Down syndrome', false, 0),
  ('ab2c3b65-d64b-5246-952d-7a859ae4414e', '7baf3866-7fe3-5cbe-9b82-3f13ee45bc3e', 'B', 'Turner syndrome', false, 1),
  ('ee1e0930-ea8e-5612-97d9-01e93fbce6da', '7baf3866-7fe3-5cbe-9b82-3f13ee45bc3e', 'C', 'Klinefelter syndrome', false, 2),
  ('838a6922-4832-5240-b604-4b76d5310118', '7baf3866-7fe3-5cbe-9b82-3f13ee45bc3e', 'D', 'Marfan syndrome', false, 3),
  ('b6a57357-af61-5515-b130-850e659e52bc', '7baf3866-7fe3-5cbe-9b82-3f13ee45bc3e', 'E', 'Noonan syndrome', true, 4);

-- Q347
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('ed6c64e2-d5e1-55c2-a651-60a339162d1b', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000036', 'sba', 'A 4 year old boy has hyperphagia, obesity, small hands and feet, and mild learning disability. He was floppy and fed poorly as a baby. What is the SINGLE most likely diagnosis?', 'Prader-Willi syndrome: neonatal hypotonia and poor feeding, then hyperphagia and obesity, hypogonadism, short stature and behavioural problems. Management: dietary control, growth hormone and behavioural support.', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v6')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = 'ed6c64e2-d5e1-55c2-a651-60a339162d1b';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('9f205b59-ea67-5ed4-b0df-2b9fbad05914', 'ed6c64e2-d5e1-55c2-a651-60a339162d1b', 'A', 'Down syndrome', false, 0),
  ('4218971f-5328-5583-8f01-bab7333eaaff', 'ed6c64e2-d5e1-55c2-a651-60a339162d1b', 'B', 'Prader-Willi syndrome', true, 1),
  ('48558eb0-cf41-5fde-a3c9-dc5851bbb5d1', 'ed6c64e2-d5e1-55c2-a651-60a339162d1b', 'C', 'Hypothyroidism', false, 2),
  ('2b8e0c99-2a58-5d2c-a54f-639dcc07519f', 'ed6c64e2-d5e1-55c2-a651-60a339162d1b', 'D', 'Cushing''s syndrome', false, 3),
  ('eef536a1-a866-5d50-b50a-1b77ab649f03', 'ed6c64e2-d5e1-55c2-a651-60a339162d1b', 'E', 'Angelman syndrome', false, 4);

-- Q348
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('81aee548-69d2-5ddb-afeb-1c0bff5ef2de', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000015', 'sba', 'A 25 year old man has had a sudden painful red eye. He has a history of ulcerative colitis. There is ciliary injection and a small pupil. What is the SINGLE most likely diagnosis?', 'IBD is associated with anterior uveitis, episcleritis, scleritis and conjunctivitis. Uveitis needs urgent ophthalmology review and topical steroids. Episcleritis often parallels bowel activity.', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v6')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = '81aee548-69d2-5ddb-afeb-1c0bff5ef2de';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('18cb5ed5-8dd1-5fca-a510-b9d772624744', '81aee548-69d2-5ddb-afeb-1c0bff5ef2de', 'A', 'Episcleritis', false, 0),
  ('0bfcb123-d96b-528a-8c64-c9bdd97101a4', '81aee548-69d2-5ddb-afeb-1c0bff5ef2de', 'B', 'Acute glaucoma', false, 1),
  ('9b495469-82be-55d0-9fa0-5b4b41dd3ede', '81aee548-69d2-5ddb-afeb-1c0bff5ef2de', 'C', 'Anterior uveitis', true, 2),
  ('24162113-5c29-586c-83ee-7f9d6c5921d2', '81aee548-69d2-5ddb-afeb-1c0bff5ef2de', 'D', 'Conjunctivitis', false, 3),
  ('c64bff0c-bfdc-5e67-9814-498cb9cf0ff7', '81aee548-69d2-5ddb-afeb-1c0bff5ef2de', 'E', 'Keratitis', false, 4);

-- Q349
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('74d64f2a-af98-5874-89c3-ed1f8c02ec98', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000015', 'sba', 'A 70 year old woman has had gradual loss of vision in both eyes with drusen. She asks how to slow progression. What is the BEST advice?', 'Dry AMD has no cure. Smoking cessation is the most important modifiable factor. AREDS2 supplements (vitamins C, E, zinc, copper, lutein, zeaxanthin) can slow progression in intermediate AMD. Self-monitor with an Amsler grid for wet AMD.', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v6')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = '74d64f2a-af98-5874-89c3-ed1f8c02ec98';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('45b27238-0e6f-5f20-bbf7-2918ee2d4b00', '74d64f2a-af98-5874-89c3-ed1f8c02ec98', 'A', 'Stop smoking and consider AREDS2 supplements (for intermediate AMD)', true, 0),
  ('8e69fc04-fa10-561b-a84f-db62fe4b058b', '74d64f2a-af98-5874-89c3-ed1f8c02ec98', 'B', 'Wear sunglasses only', false, 1),
  ('5108e5ae-4d9f-574f-97bb-83c911ef1b0f', '74d64f2a-af98-5874-89c3-ed1f8c02ec98', 'C', 'Laser treatment', false, 2),
  ('d35990af-8161-5371-8564-b15af937dcf2', '74d64f2a-af98-5874-89c3-ed1f8c02ec98', 'D', 'High-dose vitamin A', false, 3),
  ('10f8cabe-6e37-5bd6-870f-2d6ef98bd939', '74d64f2a-af98-5874-89c3-ed1f8c02ec98', 'E', 'No action can help', false, 4);

-- Q350
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('fa491b0c-91b3-52f1-bab7-8096cfa88099', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000015', 'sba', 'A 30 year old woman has had pain, redness and swelling of her eyelid after a cold. Eye movements are normal and painless, with normal vision. What is the SINGLE most likely diagnosis?', 'Preseptal cellulitis involves only the eyelid, without proptosis, painful or restricted eye movements or reduced vision. Treat with oral antibiotics (co-amoxiclav). Red flags for orbital cellulitis need IV antibiotics and CT.', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v6')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = 'fa491b0c-91b3-52f1-bab7-8096cfa88099';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('6c1ac247-0cb8-55d1-a1db-0da935bc1761', 'fa491b0c-91b3-52f1-bab7-8096cfa88099', 'A', 'Chalazion', false, 0),
  ('9888afaa-0cc0-5ab5-8bcf-67cbbca0f6bc', 'fa491b0c-91b3-52f1-bab7-8096cfa88099', 'B', 'Conjunctivitis', false, 1),
  ('a65f873e-f4ce-50fd-b8b3-f5ca66d3e5be', 'fa491b0c-91b3-52f1-bab7-8096cfa88099', 'C', 'Periorbital (preseptal) cellulitis', true, 2),
  ('ab7924ba-a5c0-53e6-8f30-fa1c462a34b8', 'fa491b0c-91b3-52f1-bab7-8096cfa88099', 'D', 'Orbital cellulitis', false, 3),
  ('7c934bc7-58c5-5e4d-a238-7a2b9596fee4', 'fa491b0c-91b3-52f1-bab7-8096cfa88099', 'E', 'Dacryoadenitis', false, 4);

-- Q351
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('d58b46f5-9199-5e79-93ab-b80a34781a2d', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000015', 'sba', 'A 55 year old man has had painful, red, watery eyes and a sensation of grit after welding without protection yesterday. Fluorescein shows multiple small corneal staining spots. What is the SINGLE most likely diagnosis?', 'UV keratitis (arc eye or snow blindness) occurs hours after UV exposure, causing pain, photophobia and punctate staining. Treatment: lubricants, cycloplegics, analgesia and antibiotic ointment. Usually resolves in 24-48 hours. Avoid repeated topical anaesthetic use.', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v6')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = 'd58b46f5-9199-5e79-93ab-b80a34781a2d';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('ce771e93-3f21-5204-addf-50264fb78741', 'd58b46f5-9199-5e79-93ab-b80a34781a2d', 'A', 'Acute glaucoma', false, 0),
  ('d533cc3e-d6c6-5d9f-8378-c6c16d3502ae', 'd58b46f5-9199-5e79-93ab-b80a34781a2d', 'B', 'Uveitis', false, 1),
  ('c12bb178-aa7f-5b4c-81f3-904fa01c11f0', 'd58b46f5-9199-5e79-93ab-b80a34781a2d', 'C', 'Corneal foreign body', false, 2),
  ('0b577981-066f-59a9-a5ba-3895b5126d75', 'd58b46f5-9199-5e79-93ab-b80a34781a2d', 'D', 'Photokeratitis (arc eye)', true, 3),
  ('0880f486-6dbb-59eb-91d0-3d6ed4f9e676', 'd58b46f5-9199-5e79-93ab-b80a34781a2d', 'E', 'Bacterial keratitis', false, 4);

-- Q352
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('34839a69-8b28-5736-a4ad-b71996e247d8', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000015', 'sba', 'A 35 year old man has had a sudden onset of a curtain of vision loss after a high-myopia history. He sees flashing lights and new floaters. Fundoscopy shows a grey, elevated retina. What is the SINGLE most likely diagnosis?', 'Rhegmatogenous retinal detachment: flashes, floaters and a curtain-like field defect. Risk factors: myopia, previous eye surgery, trauma and family history. Same-day referral; macula-on detachments are urgent to preserve central vision.', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v6')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = '34839a69-8b28-5736-a4ad-b71996e247d8';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('6647328e-7006-51d1-9ae4-035fae6da3e7', '34839a69-8b28-5736-a4ad-b71996e247d8', 'A', 'Migraine aura', false, 0),
  ('e3bd901d-3331-5e5a-95e3-32a63d7f138d', '34839a69-8b28-5736-a4ad-b71996e247d8', 'B', 'Vitreous haemorrhage', false, 1),
  ('e848e80e-c9e9-574f-92a6-b875b39ebb88', '34839a69-8b28-5736-a4ad-b71996e247d8', 'C', 'Central retinal vein occlusion', false, 2),
  ('c6dba863-5ad0-53a7-be3f-aa4bb4d78c66', '34839a69-8b28-5736-a4ad-b71996e247d8', 'D', 'Optic neuritis', false, 3),
  ('ec3f2126-903c-57c1-9fe2-64ce17f08640', '34839a69-8b28-5736-a4ad-b71996e247d8', 'E', 'Retinal detachment', true, 4);

-- Q353
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('90f89b9d-efe9-5ae8-b9ab-723eecc0410b', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000022', 'sba', 'A 52 year old woman has had breast reconstruction with a latissimus dorsi flap after mastectomy. Which nerve must be preserved for the flap to work?', 'The latissimus dorsi muscle is supplied by the thoracodorsal nerve and vessels, which must be preserved for a pedicled LD flap. Other reconstruction options: implants and free abdominal flaps (DIEP). The intercostobrachial nerve is often divided in axillary surgery, causing numbness of the inner arm.', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v6')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = '90f89b9d-efe9-5ae8-b9ab-723eecc0410b';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('9ca686f8-a0f3-5412-b456-dd815375baec', '90f89b9d-efe9-5ae8-b9ab-723eecc0410b', 'A', 'Thoracodorsal nerve', true, 0),
  ('8dd263ed-83f6-50f3-a510-7532ee0557e0', '90f89b9d-efe9-5ae8-b9ab-723eecc0410b', 'B', 'Long thoracic nerve', false, 1),
  ('7dfff6f4-83a6-52f2-bcaa-fb81eca509ea', '90f89b9d-efe9-5ae8-b9ab-723eecc0410b', 'C', 'Axillary nerve', false, 2),
  ('cf7897b2-082c-50c7-b047-4f5ebcf0e0f7', '90f89b9d-efe9-5ae8-b9ab-723eecc0410b', 'D', 'Intercostobrachial nerve', false, 3),
  ('5b097466-9113-517e-b604-f0b041577f82', '90f89b9d-efe9-5ae8-b9ab-723eecc0410b', 'E', 'Medial pectoral nerve', false, 4);

-- Q354
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('41ee4a9a-22bf-598e-9c00-14f602d8e9ec', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000022', 'sba', 'A 30 year old woman has had a tender breast lump during her period, which disappears afterwards. She has lumpy breasts. What is the SINGLE most likely diagnosis?', 'Fibrocystic changes cause cyclical breast pain and nodularity, worse before periods. Discrete lumps persisting after a period need triple assessment. Reassure once malignancy is excluded.', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v6')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = '41ee4a9a-22bf-598e-9c00-14f602d8e9ec';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('d606ca4d-8aa8-583d-bb36-ec7a1614ef6f', '41ee4a9a-22bf-598e-9c00-14f602d8e9ec', 'A', 'Fibroadenoma', false, 0),
  ('e2dd147e-2c8d-50fe-9097-d555e5f95363', '41ee4a9a-22bf-598e-9c00-14f602d8e9ec', 'B', 'Breast abscess', false, 1),
  ('2ad32fda-f765-5052-9c0a-b7b21326139f', '41ee4a9a-22bf-598e-9c00-14f602d8e9ec', 'C', 'Breast cancer', false, 2),
  ('049efcd3-6c72-5f2d-aa37-fe4c860358bb', '41ee4a9a-22bf-598e-9c00-14f602d8e9ec', 'D', 'Fibrocystic change (fibroadenosis)', true, 3),
  ('027da7ca-6b79-5e58-86db-8421a8c7da51', '41ee4a9a-22bf-598e-9c00-14f602d8e9ec', 'E', 'Phyllodes tumour', false, 4);

-- Q355
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('d8ccaa4b-e736-5d99-bac9-ff8d509ee58c', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000022', 'sba', 'A 68 year old woman has had a lump in her breast. She is frail with multiple comorbidities. Biopsy shows ER-positive invasive cancer. She declines surgery. What is the SINGLE most appropriate treatment?', 'Primary endocrine therapy is an option for older or frail women with ER-positive breast cancer who are unfit for or decline surgery. Monitor response; surgery can be reconsidered if disease progresses.', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v6')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = 'd8ccaa4b-e736-5d99-bac9-ff8d509ee58c';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('01eb5f71-3da2-569e-bdb1-a0ebe9981b7b', 'd8ccaa4b-e736-5d99-bac9-ff8d509ee58c', 'A', 'Trastuzumab', false, 0),
  ('7d9106e6-27c7-5b70-9500-3cd7ec9803a8', 'd8ccaa4b-e736-5d99-bac9-ff8d509ee58c', 'B', 'Primary endocrine therapy with an aromatase inhibitor', true, 1),
  ('5bb70ae4-9516-54b6-a4b4-a88c0403c7d1', 'd8ccaa4b-e736-5d99-bac9-ff8d509ee58c', 'C', 'Chemotherapy', false, 2),
  ('9f7bdf4c-877b-5373-b938-d7e0b823476f', 'd8ccaa4b-e736-5d99-bac9-ff8d509ee58c', 'D', 'No treatment', false, 3),
  ('52162cc1-db96-5605-8a4a-a48fd075af4c', 'd8ccaa4b-e736-5d99-bac9-ff8d509ee58c', 'E', 'Radiotherapy alone', false, 4);

-- Q356
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('63cef9ff-1c28-5e9d-80e6-c68c2d3ad831', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000022', 'sba', 'A 42 year old woman has a BRCA1 mutation. She has not had cancer. What risk-reducing options can be discussed?', 'BRCA1 carriers can choose enhanced breast screening (annual MRI from 30) or risk-reducing mastectomy (greatly reduces breast cancer risk), and risk-reducing salpingo-oophorectomy (about 35-40) to reduce ovarian cancer risk. Genetic counselling supports decisions.', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v6')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = '63cef9ff-1c28-5e9d-80e6-c68c2d3ad831';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('268ad445-9e94-56fb-8c75-1c93fe10456a', '63cef9ff-1c28-5e9d-80e6-c68c2d3ad831', 'A', 'Hysterectomy only', false, 0),
  ('56eced53-ff1f-5dfe-9de4-39d3bfeac9b2', '63cef9ff-1c28-5e9d-80e6-c68c2d3ad831', 'B', 'Annual chest X-ray', false, 1),
  ('5c326a95-faf6-5c05-9ce6-d6bcb904b691', '63cef9ff-1c28-5e9d-80e6-c68c2d3ad831', 'C', 'Risk-reducing bilateral mastectomy and bilateral salpingo-oophorectomy (after completing her family), or enhanced surveillance', true, 2),
  ('adb2a270-f43f-553d-ac02-f177aa4d17f0', '63cef9ff-1c28-5e9d-80e6-c68c2d3ad831', 'D', 'Tamoxifen is the only option', false, 3),
  ('5b3a1cc5-3be5-5625-b591-2e03222693c3', '63cef9ff-1c28-5e9d-80e6-c68c2d3ad831', 'E', 'No options exist', false, 4);

-- Q357
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('bfb78a9b-2882-5b73-ab8b-d2a61d818ba7', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000033', 'sba', 'Which muscle is the main flexor of the hip?', 'Iliopsoas (iliacus and psoas major) is the main hip flexor. Gluteus maximus extends the hip; gluteus medius and minimus abduct (weakness gives Trendelenburg gait). Psoas abscesses cause pain on hip extension.', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v6')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = 'bfb78a9b-2882-5b73-ab8b-d2a61d818ba7';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('a2d92d40-18b6-58f0-9e49-98f6578f1503', 'bfb78a9b-2882-5b73-ab8b-d2a61d818ba7', 'A', 'Gluteus maximus', false, 0),
  ('d7ea2381-2fda-572d-bd94-97d5a7e3a932', 'bfb78a9b-2882-5b73-ab8b-d2a61d818ba7', 'B', 'Adductor longus', false, 1),
  ('fba193cd-e84d-566e-9cbf-9d99ba154d37', 'bfb78a9b-2882-5b73-ab8b-d2a61d818ba7', 'C', 'Hamstrings', false, 2),
  ('488fc16f-8ffe-514f-85bc-4ae2b8762f18', 'bfb78a9b-2882-5b73-ab8b-d2a61d818ba7', 'D', 'Iliopsoas', true, 3),
  ('9955c9a3-f5c9-5335-9fb5-4ffa07bb0dad', 'bfb78a9b-2882-5b73-ab8b-d2a61d818ba7', 'E', 'Quadriceps', false, 4);

-- Q358
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('0fc0d078-f7e2-5078-bb09-0141a7ea70db', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000033', 'sba', 'A patient has a positive Trendelenburg sign on the right. Which nerve is MOST likely damaged?', 'The superior gluteal nerve supplies gluteus medius and minimus (hip abductors). Weakness causes the pelvis to drop on the opposite side when standing on the affected leg. It can be injured by IM injections in the wrong quadrant or hip surgery.', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v6')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = '0fc0d078-f7e2-5078-bb09-0141a7ea70db';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('f6ceab20-330e-5f72-a751-dd40554f1611', '0fc0d078-f7e2-5078-bb09-0141a7ea70db', 'A', 'Right inferior gluteal nerve', false, 0),
  ('aa3fae53-1875-5705-b839-47ada626f320', '0fc0d078-f7e2-5078-bb09-0141a7ea70db', 'B', 'Right sciatic nerve', false, 1),
  ('c3e9db4d-b19c-5206-bcdd-455a1727c94e', '0fc0d078-f7e2-5078-bb09-0141a7ea70db', 'C', 'Right obturator nerve', false, 2),
  ('d13e353b-6cb2-59e9-8273-5d2a56a76057', '0fc0d078-f7e2-5078-bb09-0141a7ea70db', 'D', 'Right superior gluteal nerve', true, 3),
  ('97eec81a-c7de-542c-8cfa-caad42a42766', '0fc0d078-f7e2-5078-bb09-0141a7ea70db', 'E', 'Right femoral nerve', false, 4);

-- Q359
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('74199a80-3615-5e2b-bc83-238e74636ebf', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000033', 'sba', 'Which cells produce surfactant in the lungs?', 'Type II pneumocytes produce surfactant, which reduces surface tension and prevents alveolar collapse. Preterm babies lack surfactant (respiratory distress syndrome); antenatal steroids increase production. Type I pneumocytes form most of the gas exchange surface.', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v6')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = '74199a80-3615-5e2b-bc83-238e74636ebf';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('cf9fc5a6-aeda-59f8-a4b9-ab39e1456768', '74199a80-3615-5e2b-bc83-238e74636ebf', 'A', 'Clara cells only', false, 0),
  ('e0abf8a6-5302-592c-b26a-9c4c1da46a36', '74199a80-3615-5e2b-bc83-238e74636ebf', 'B', 'Goblet cells', false, 1),
  ('f7b1eb67-3f4a-5e7b-8110-2643cf51d2ad', '74199a80-3615-5e2b-bc83-238e74636ebf', 'C', 'Alveolar macrophages', false, 2),
  ('fb95f7a0-c6f5-505b-ab4b-28bda84da1a3', '74199a80-3615-5e2b-bc83-238e74636ebf', 'D', 'Type II pneumocytes', true, 3),
  ('98f1c3d2-4693-50ea-a4ae-4b95bf441976', '74199a80-3615-5e2b-bc83-238e74636ebf', 'E', 'Type I pneumocytes', false, 4);

-- Q360
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('54261fff-3c26-5d3c-a079-4fce91a145ea', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000033', 'sba', 'A patient has a lesion of the left optic tract. What visual field defect is expected?', 'Lesions behind the chiasm cause contralateral homonymous defects. Optic tract: incongruous homonymous hemianopia. Temporal lobe (Meyer''s loop): contralateral superior quadrantanopia. Parietal: inferior quadrantanopia. Occipital: homonymous hemianopia with macular sparing.', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v6')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = '54261fff-3c26-5d3c-a079-4fce91a145ea';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('143bd0b1-08e1-5337-95ab-2bf048ea6e2a', '54261fff-3c26-5d3c-a079-4fce91a145ea', 'A', 'Left monocular blindness', false, 0),
  ('25b7fbdb-b50c-555f-bf16-1670c2d5339e', '54261fff-3c26-5d3c-a079-4fce91a145ea', 'B', 'Right homonymous hemianopia', true, 1),
  ('7138eda8-4aa2-55af-8d72-515aa5275871', '54261fff-3c26-5d3c-a079-4fce91a145ea', 'C', 'Bitemporal hemianopia', false, 2),
  ('3ceb9b73-9523-5be3-a093-1027342d1450', '54261fff-3c26-5d3c-a079-4fce91a145ea', 'D', 'Right superior quadrantanopia', false, 3),
  ('02b339ef-5952-5e07-8a9e-54a0951eeadc', '54261fff-3c26-5d3c-a079-4fce91a145ea', 'E', 'Left homonymous hemianopia', false, 4);

-- Q361
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('80032767-cd79-5445-910a-dfebd99b614d', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000033', 'sba', 'What is the main action of insulin on potassium?', 'Insulin stimulates Na+/K+-ATPase, shifting potassium into cells; this is used to treat hyperkalaemia (with glucose). Beta-agonists (salbutamol) do the same. Insulin deficiency in DKA causes total body potassium depletion despite normal or high serum levels.', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v6')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = '80032767-cd79-5445-910a-dfebd99b614d';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('90f9b912-5267-5667-8cfe-d94ca49b11d5', '80032767-cd79-5445-910a-dfebd99b614d', 'A', 'Increases renal potassium excretion only', false, 0),
  ('fa8b523f-f157-5d46-b0e7-833e0bdd165b', '80032767-cd79-5445-910a-dfebd99b614d', 'B', 'Raises serum potassium', false, 1),
  ('9a40b8ff-f090-57be-9d98-d4a188213c57', '80032767-cd79-5445-910a-dfebd99b614d', 'C', 'Blocks potassium channels', false, 2),
  ('2217b806-477d-5c38-83d0-1c6573efdff0', '80032767-cd79-5445-910a-dfebd99b614d', 'D', 'Drives potassium into cells (via Na+/K+-ATPase), lowering serum potassium', true, 3),
  ('cc875d32-c660-55d3-9301-c0d6e2acdc68', '80032767-cd79-5445-910a-dfebd99b614d', 'E', 'Has no effect', false, 4);

-- Q362
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('e121473e-1ede-5925-8929-4670383de7eb', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000001', 'sba', 'A 28 year old man has had sudden palpitations and dizziness. ECG shows a broad complex tachycardia that is irregularly irregular with varying QRS width, at 230 bpm. He has a known accessory pathway. What drug should be AVOIDED?', 'Pre-excited AF in WPW: blocking the AV node favours conduction down the accessory pathway, which can cause VF. Unstable: DC cardioversion. Stable: flecainide or procainamide. Definitive: catheter ablation.', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v6')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = 'e121473e-1ede-5925-8929-4670383de7eb';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('dda6b1d7-758d-52b5-80e8-beeec06d64a4', 'e121473e-1ede-5925-8929-4670383de7eb', 'A', 'DC cardioversion', false, 0),
  ('c3a8a948-478d-51bb-8fcd-48930d63b165', 'e121473e-1ede-5925-8929-4670383de7eb', 'B', 'Flecainide', false, 1),
  ('33bb2206-6dd4-5652-8c2e-7b7cd9e2c00e', 'e121473e-1ede-5925-8929-4670383de7eb', 'C', 'AV nodal blockers such as adenosine, verapamil, digoxin and beta-blockers', true, 2),
  ('04df49d2-eaaf-5d37-82bd-f4d59dbb57c7', 'e121473e-1ede-5925-8929-4670383de7eb', 'D', 'Procainamide', false, 3),
  ('756c2a90-cff6-5ee6-a7cc-eec51481262a', 'e121473e-1ede-5925-8929-4670383de7eb', 'E', 'Amiodarone in all', false, 4);

-- Q363
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('49e60d33-1cb2-5f03-a345-4e5043739918', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000001', 'sba', 'A 65 year old woman has had palpitations. Her ECG shows a QTc of 520 ms. She takes citalopram, ondansetron and clarithromycin. What is the SINGLE most appropriate action?', 'Many drugs prolong QT (macrolides, fluoroquinolones, antipsychotics, citalopram, ondansetron, methadone, amiodarone). Risk is higher with low potassium, low magnesium, bradycardia and female sex. Torsades de pointes is treated with IV magnesium.', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v6')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = '49e60d33-1cb2-5f03-a345-4e5043739918';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('c6df1433-6254-5788-ab5d-a421bb320345', '49e60d33-1cb2-5f03-a345-4e5043739918', 'A', 'No action', false, 0),
  ('409eb696-fe82-52f0-bad9-93f2cb927087', '49e60d33-1cb2-5f03-a345-4e5043739918', 'B', 'Add amiodarone', false, 1),
  ('50f4f34c-d658-580a-8099-7641775deb9b', '49e60d33-1cb2-5f03-a345-4e5043739918', 'C', 'Start sotalol', false, 2),
  ('d936cb2c-450d-5168-b127-cf991765c703', '49e60d33-1cb2-5f03-a345-4e5043739918', 'D', 'Double citalopram', false, 3),
  ('ed0d0032-5f55-51e0-bc41-667816bf6d86', '49e60d33-1cb2-5f03-a345-4e5043739918', 'E', 'Stop or replace QT-prolonging drugs, correct potassium and magnesium, and monitor ECG', true, 4);

-- Q364
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('043e827c-2fd2-5fef-84a6-f2f9c8ae3f69', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000001', 'sba', 'A 55 year old man has had an MI. Echo shows an ejection fraction of 30% 6 weeks after optimal therapy. He has had no arrhythmias. What device should be considered to prevent sudden cardiac death?', 'ICDs are recommended for primary prevention in people with LVEF of 35% or less despite optimal medical therapy (with additional criteria), and for secondary prevention after VF or sustained VT. Reassess LVEF after at least 6 weeks of therapy post-MI.', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v6')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = '043e827c-2fd2-5fef-84a6-f2f9c8ae3f69';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('4b2e3784-d720-542c-9d74-811bc4dc621b', '043e827c-2fd2-5fef-84a6-f2f9c8ae3f69', 'A', 'Implantable cardioverter-defibrillator (primary prevention)', true, 0),
  ('a00f7748-8fbb-5928-8ea9-863a9cf663f2', '043e827c-2fd2-5fef-84a6-f2f9c8ae3f69', 'B', 'No device', false, 1),
  ('19becaf6-e379-52ab-9787-e7b58c5d46c7', '043e827c-2fd2-5fef-84a6-f2f9c8ae3f69', 'C', 'Left ventricular assist device', false, 2),
  ('5727fcbb-ea6b-57b5-b828-ce18cd0d1027', '043e827c-2fd2-5fef-84a6-f2f9c8ae3f69', 'D', 'Loop recorder', false, 3),
  ('eb221353-de94-5194-9003-c10f68e26603', '043e827c-2fd2-5fef-84a6-f2f9c8ae3f69', 'E', 'Permanent pacemaker only', false, 4);

-- Q365
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('4d4c4642-e53e-5f75-9ff8-418cb0be96b3', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000001', 'sba', 'A 75 year old man has had increasing breathlessness and ankle swelling. Echo shows a normal ejection fraction with diastolic dysfunction and LVH. He has hypertension and AF. What is the SINGLE most likely diagnosis?', 'HFpEF is common in older people with hypertension, AF, obesity and diabetes. Treatment: diuretics for congestion, SGLT2 inhibitors (shown to reduce hospitalisation), and control BP, AF and comorbidities.', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v6')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = '4d4c4642-e53e-5f75-9ff8-418cb0be96b3';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('511e915c-f082-526a-a0b2-264df6dea8c2', '4d4c4642-e53e-5f75-9ff8-418cb0be96b3', 'A', 'Constrictive pericarditis', false, 0),
  ('fd539d5c-1c79-502a-a613-5561dde7281c', '4d4c4642-e53e-5f75-9ff8-418cb0be96b3', 'B', 'Pulmonary embolism', false, 1),
  ('d6263a1f-02b0-517f-95b1-eed11aa9e11c', '4d4c4642-e53e-5f75-9ff8-418cb0be96b3', 'C', 'COPD', false, 2),
  ('eaaee51a-3f96-5025-a842-a977c2550d71', '4d4c4642-e53e-5f75-9ff8-418cb0be96b3', 'D', 'Heart failure with reduced EF', false, 3),
  ('46cfbdd9-1878-518c-9755-30fe803c936f', '4d4c4642-e53e-5f75-9ff8-418cb0be96b3', 'E', 'Heart failure with preserved ejection fraction (HFpEF)', true, 4);

-- Q366
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('0f57eab5-80d8-54ce-b3b2-8572a4b2245b', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000001', 'sba', 'A 60 year old man has had a new heart murmur and fever 2 months after aortic valve replacement. Blood cultures grow Staphylococcus epidermidis. What is the SINGLE most likely diagnosis?', 'Early prosthetic valve endocarditis (within 1 year) is often caused by coagulase-negative staphylococci and S. aureus. Treatment: prolonged IV antibiotics (vancomycin, rifampicin, gentamicin) and often surgery. TOE is needed. Mortality is high.', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v6')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = '0f57eab5-80d8-54ce-b3b2-8572a4b2245b';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('19592807-c122-5749-93dc-7f64da04a4aa', '0f57eab5-80d8-54ce-b3b2-8572a4b2245b', 'A', 'Early prosthetic valve endocarditis', true, 0),
  ('0f403f24-6fdc-5439-8f4c-5aa88c626fb1', '0f57eab5-80d8-54ce-b3b2-8572a4b2245b', 'B', 'Rheumatic fever', false, 1),
  ('1791f135-7da0-5921-8702-cd2befd4b846', '0f57eab5-80d8-54ce-b3b2-8572a4b2245b', 'C', 'Pericarditis', false, 2),
  ('3793c4ad-1c8f-57df-8f73-2fdd81984154', '0f57eab5-80d8-54ce-b3b2-8572a4b2245b', 'D', 'Native valve endocarditis', false, 3),
  ('94a0944f-666c-5391-aaaf-3c5025685c19', '0f57eab5-80d8-54ce-b3b2-8572a4b2245b', 'E', 'Valve thrombosis', false, 4);

-- Q367
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('be21d585-2968-565a-9d58-6435e5c0e8c0', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000001', 'sba', 'A 72 year old man had a TAVI for aortic stenosis. Two days later he has a slow heart rate with a new LBBB and episodes of complete heart block. What is the SINGLE most appropriate management?', 'Conduction disturbances (LBBB, complete heart block) are common after TAVI because of the proximity of the conduction system to the aortic valve. High-grade AV block needs a permanent pacemaker.', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v6')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = 'be21d585-2968-565a-9d58-6435e5c0e8c0';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('cf8469c7-598b-584f-9d73-1a2e1029e365', 'be21d585-2968-565a-9d58-6435e5c0e8c0', 'A', 'Digoxin', false, 0),
  ('388c29f0-ddac-5fcc-a69b-4df90486a335', 'be21d585-2968-565a-9d58-6435e5c0e8c0', 'B', 'Watch and wait for 6 months', false, 1),
  ('cf7c5de5-e0fd-5f43-840c-447d0593a79e', 'be21d585-2968-565a-9d58-6435e5c0e8c0', 'C', 'Repeat TAVI', false, 2),
  ('6bd49fe6-1137-5582-9c6e-542d25e871b1', 'be21d585-2968-565a-9d58-6435e5c0e8c0', 'D', 'Permanent pacemaker insertion', true, 3),
  ('c23707e8-2672-5c54-b28a-472e4fbbe3ef', 'be21d585-2968-565a-9d58-6435e5c0e8c0', 'E', 'Beta-blocker', false, 4);

-- Q368
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('fcec8adc-e629-5f46-ba08-36ef36520e3e', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000001', 'sba', 'A 55 year old man has a total cholesterol of 7.8 and triglycerides of 22 mmol/L. He has abdominal pain. What is the MOST important risk of these lipid levels?', 'Triglycerides over 10 mmol/L risk acute pancreatitis. Look for secondary causes (alcohol, diabetes, hypothyroidism, obesity, drugs). Treatment: diet, alcohol avoidance, glycaemic control, fibrates and omega-3, and urgent referral if over 20 mmol/L.', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v6')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = 'fcec8adc-e629-5f46-ba08-36ef36520e3e';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('ec107bf6-e355-5374-af7f-8ad6b8c451d6', 'fcec8adc-e629-5f46-ba08-36ef36520e3e', 'A', 'Kidney stones', false, 0),
  ('f81cb4f9-09f8-508a-a1f5-5a6d0627d888', 'fcec8adc-e629-5f46-ba08-36ef36520e3e', 'B', 'Hypoglycaemia', false, 1),
  ('f17d78c9-ad7b-522e-a16c-d2bd63ac9318', 'fcec8adc-e629-5f46-ba08-36ef36520e3e', 'C', 'Gallstones', false, 2),
  ('c61d02f1-7b09-512b-8665-59f52b21f557', 'fcec8adc-e629-5f46-ba08-36ef36520e3e', 'D', 'Liver failure', false, 3),
  ('70b715e2-efb1-59a3-ba89-11d431d5ae3d', 'fcec8adc-e629-5f46-ba08-36ef36520e3e', 'E', 'Acute pancreatitis (from severe hypertriglyceridaemia)', true, 4);

-- Q369
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('ef137f31-d233-58a3-93a6-79e95c44ce57', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000002', 'sba', 'A 45 year old woman has had a cough and breathlessness. CT shows multiple thin-walled cysts in both lungs. She has had a pneumothorax. What is the SINGLE most likely diagnosis?', 'LAM is a rare disease of women of childbearing age (sporadic or with tuberous sclerosis), causing cystic lung disease, pneumothorax, chylous effusions and renal angiomyolipomas. Treatment: sirolimus (mTOR inhibitor).', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v6')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = 'ef137f31-d233-58a3-93a6-79e95c44ce57';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('6d9414d9-00dc-5ae9-822b-95c8226c91a2', 'ef137f31-d233-58a3-93a6-79e95c44ce57', 'A', 'Lymphangioleiomyomatosis', true, 0),
  ('f330433c-19bc-53a3-bf96-245c55f142f0', 'ef137f31-d233-58a3-93a6-79e95c44ce57', 'B', 'Emphysema', false, 1),
  ('55603a1f-33e0-5c10-9429-11b7ed7f855c', 'ef137f31-d233-58a3-93a6-79e95c44ce57', 'C', 'Sarcoidosis', false, 2),
  ('ee29b0c0-c700-531f-bca7-1ca86330cce3', 'ef137f31-d233-58a3-93a6-79e95c44ce57', 'D', 'Pulmonary fibrosis', false, 3),
  ('97c325a4-95b4-5882-b5f5-053902b02e3d', 'ef137f31-d233-58a3-93a6-79e95c44ce57', 'E', 'Bronchiectasis', false, 4);

-- Q370
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('eb2e104f-5c6b-556f-b95f-1e659ab2871a', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000002', 'sba', 'A 55 year old man has had a cough and fever. CXR shows a cavity with an air-fluid level in the right lower lobe. He is a heavy drinker with poor dentition. What is the SINGLE most likely diagnosis?', 'Lung abscesses often follow aspiration (alcohol, seizures, poor dentition), with mixed anaerobic infection. Features: swinging fever, foul sputum and cavity with an air-fluid level. Treatment: prolonged antibiotics (4-6 weeks). Exclude cavitating cancer and TB.', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v6')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = 'eb2e104f-5c6b-556f-b95f-1e659ab2871a';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('6f7aae63-a33a-5b30-8a23-1010fdb2db53', 'eb2e104f-5c6b-556f-b95f-1e659ab2871a', 'A', 'TB', false, 0),
  ('fd7accda-22b4-5807-b9c0-29747e1bb2ff', 'eb2e104f-5c6b-556f-b95f-1e659ab2871a', 'B', 'Lung abscess (from aspiration)', true, 1),
  ('43dc9026-d977-5aed-9b2b-d8463c18bcd5', 'eb2e104f-5c6b-556f-b95f-1e659ab2871a', 'C', 'Aspergilloma', false, 2),
  ('fecbf8cf-5c2f-54e4-bcd5-36e59fdd8dd6', 'eb2e104f-5c6b-556f-b95f-1e659ab2871a', 'D', 'Lung cancer only', false, 3),
  ('1c1d76e8-8916-5e3e-b08b-4c048d7cb92d', 'eb2e104f-5c6b-556f-b95f-1e659ab2871a', 'E', 'Bronchiectasis', false, 4);

-- Q371
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('b820bb42-7afe-5cf3-984c-9045e09f77ae', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000002', 'sba', 'A 30 year old man has had cough, wheeze and haemoptysis. Bronchoscopy shows a well-defined central endobronchial tumour. He is a non-smoker. Biopsy shows a neuroendocrine tumour. What is the SINGLE most likely diagnosis?', 'Bronchial carcinoids are low-grade neuroendocrine tumours in younger people, often central, causing wheeze, haemoptysis and recurrent pneumonia. Carcinoid syndrome is rare unless metastatic. Treatment: surgical resection with good prognosis.', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v6')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = 'b820bb42-7afe-5cf3-984c-9045e09f77ae';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('13b8ddbf-1874-521f-b082-714a2a4fa894', 'b820bb42-7afe-5cf3-984c-9045e09f77ae', 'A', 'Adenocarcinoma', false, 0),
  ('2f326826-f03e-56bb-807c-eb6bf42052bc', 'b820bb42-7afe-5cf3-984c-9045e09f77ae', 'B', 'Squamous cell carcinoma', false, 1),
  ('b0097118-4b92-55d6-8bc5-8fd9c3880ac9', 'b820bb42-7afe-5cf3-984c-9045e09f77ae', 'C', 'Bronchial carcinoid tumour', true, 2),
  ('3ad8ac2a-599e-5c69-8f04-f6970b7b552a', 'b820bb42-7afe-5cf3-984c-9045e09f77ae', 'D', 'Hamartoma', false, 3),
  ('c31c398b-124f-5def-b981-e7df4b67cbce', 'b820bb42-7afe-5cf3-984c-9045e09f77ae', 'E', 'Small cell lung cancer', false, 4);

-- Q372
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('fd5aa2c8-fea2-5b7b-a90a-a84c5060954e', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000002', 'sba', 'A 75 year old woman with severe COPD has had 3 exacerbations this year. She has had pulmonary rehabilitation. She is on triple therapy. She is a non-smoker. What additional treatment can be considered to reduce exacerbations?', 'Azithromycin prophylaxis reduces exacerbations in selected COPD patients who do not smoke and have optimised treatment. Check ECG (QT), LFTs and sputum culture for atypical mycobacteria. Roflumilast is another option for severe COPD with chronic bronchitis.', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v6')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = 'fd5aa2c8-fea2-5b7b-a90a-a84c5060954e';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('ad80f1b3-6630-54a4-b90a-eae84956fd9f', 'fd5aa2c8-fea2-5b7b-a90a-a84c5060954e', 'A', 'Long-term azithromycin prophylaxis (after ECG for QT and audiology checks, specialist decision)', true, 0),
  ('4bfde7d6-a8e4-5006-a257-a834bdd843d9', 'fd5aa2c8-fea2-5b7b-a90a-a84c5060954e', 'B', 'Inhaled beta-blocker', false, 1),
  ('23d0c7f2-34bc-533f-9c9a-6969e4ca6d72', 'fd5aa2c8-fea2-5b7b-a90a-a84c5060954e', 'C', 'Long-term oral steroids', false, 2),
  ('7ca5598c-71e7-57fb-aea1-6676641d3709', 'fd5aa2c8-fea2-5b7b-a90a-a84c5060954e', 'D', 'Theophylline as first choice', false, 3),
  ('22a39df1-7f83-52b8-964c-ca66d35456ad', 'fd5aa2c8-fea2-5b7b-a90a-a84c5060954e', 'E', 'Oral antibiotics for life in all', false, 4);

-- Q373
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('ffad43ac-311f-5b02-990a-c60ca30e42ce', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000002', 'sba', 'A 40 year old woman has had progressive breathlessness on lying flat and difficulty climbing stairs. She has myasthenia gravis. Her FVC falls significantly when lying supine. What is the MOST likely cause?', 'Diaphragmatic weakness causes orthopnoea and a fall in FVC of over 20% supine. Causes: neuromuscular disease (MND, myasthenia, muscular dystrophy) and phrenic nerve injury. Monitor FVC and consider NIV.', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v6')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = 'ffad43ac-311f-5b02-990a-c60ca30e42ce';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('46ff7107-5bf2-5492-893c-5c54c23c815a', 'ffad43ac-311f-5b02-990a-c60ca30e42ce', 'A', 'Pulmonary fibrosis', false, 0),
  ('71e2bb32-225a-5b8f-b131-e32a298fcd1e', 'ffad43ac-311f-5b02-990a-c60ca30e42ce', 'B', 'PE', false, 1),
  ('154417c7-a1bc-5360-a928-a32915315f35', 'ffad43ac-311f-5b02-990a-c60ca30e42ce', 'C', 'Heart failure', false, 2),
  ('271a7de3-486c-5a50-8450-a7d881ba6a2e', 'ffad43ac-311f-5b02-990a-c60ca30e42ce', 'D', 'Diaphragmatic weakness', true, 3),
  ('ebe9adac-4dcd-5716-aa2a-1d021c38b55b', 'ffad43ac-311f-5b02-990a-c60ca30e42ce', 'E', 'Asthma', false, 4);

-- Q374
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('34aeda67-ba46-53eb-bd58-a6689d67e6d3', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000003', 'sba', 'A 45 year old man has had dyspepsia. H. pylori stool antigen is positive. He has no penicillin allergy. What is the SINGLE most appropriate first-line eradication regimen?', 'NICE: first-line triple therapy for H. pylori: PPI twice daily, amoxicillin and either clarithromycin or metronidazole for 7 days. Penicillin allergy: PPI, clarithromycin and metronidazole. Retest (urea breath test) if symptoms persist, at least 4 weeks after treatment and 2 weeks off PPI.', null, true, true, jsonb_build_object('source', 'plab1-xlsx-v6', 'guidelines_text', 'NICE')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = '34aeda67-ba46-53eb-bd58-a6689d67e6d3';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('6c45bf43-2048-53f9-88f5-0e746e29bfdf', '34aeda67-ba46-53eb-bd58-a6689d67e6d3', 'A', 'Doxycycline alone', false, 0),
  ('1e82f7f4-8f23-5c36-a3e1-487f2d5b6900', '34aeda67-ba46-53eb-bd58-a6689d67e6d3', 'B', 'PPI alone for 8 weeks', false, 1),
  ('764cdd4c-8cfa-55c6-91a5-2942709c4738', '34aeda67-ba46-53eb-bd58-a6689d67e6d3', 'C', 'PPI plus amoxicillin plus clarithromycin (or metronidazole) for 7 days', true, 2),
  ('9f4188b8-c994-525b-bfd4-36cbec185a23', '34aeda67-ba46-53eb-bd58-a6689d67e6d3', 'D', 'Amoxicillin alone', false, 3),
  ('15b2295f-2876-5709-916b-a7d7d51598ac', '34aeda67-ba46-53eb-bd58-a6689d67e6d3', 'E', 'Ranitidine', false, 4);

-- Q375
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('ead8b162-bb39-5076-9537-ffac2a6e9b90', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000003', 'sba', 'A 28 year old woman with Crohn''s disease has had recurrent abdominal pain, distension and vomiting after meals. CT shows a short stricture in the terminal ileum without active inflammation. What is the SINGLE most appropriate management?', 'Fibrotic strictures in Crohn''s disease cause obstructive symptoms and do not respond to anti-inflammatory therapy. Short strictures may be dilated endoscopically; others need strictureplasty or limited resection. Inflammatory strictures respond to medical therapy.', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v6')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = 'ead8b162-bb39-5076-9537-ffac2a6e9b90';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('bb50d746-493b-557c-b592-7eb8c0ad8db8', 'ead8b162-bb39-5076-9537-ffac2a6e9b90', 'A', 'Antibiotics', false, 0),
  ('183905bb-9123-5804-9e6c-9ce552df3e56', 'ead8b162-bb39-5076-9537-ffac2a6e9b90', 'B', 'Endoscopic balloon dilatation or strictureplasty/limited resection (fibrotic stricture)', true, 1),
  ('59da8034-beb2-5129-8fab-700c72d69f2f', 'ead8b162-bb39-5076-9537-ffac2a6e9b90', 'C', 'No treatment', false, 2),
  ('7e431960-e25d-568b-abb8-9ff9695aef63', 'ead8b162-bb39-5076-9537-ffac2a6e9b90', 'D', 'High-dose steroids', false, 3),
  ('abdb7817-658d-59da-b49a-0a8d9cb0e3e9', 'ead8b162-bb39-5076-9537-ffac2a6e9b90', 'E', 'Increase mesalazine', false, 4);

-- Q376
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('01781d8b-c9b8-5780-8147-5c15939423a3', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000003', 'sba', 'A 60 year old man has had a change in bowel habit and weight loss. Colonoscopy shows a sigmoid tumour. CT shows no metastases. CEA is raised. What is the role of CEA here?', 'CEA is not specific or sensitive enough for screening or diagnosis, but a raised preoperative CEA that normalises after surgery can be used to detect recurrence.', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v6')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = '01781d8b-c9b8-5780-8147-5c15939423a3';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('617603d2-f661-5d2e-bd07-fb91fafc6ffc', '01781d8b-c9b8-5780-8147-5c15939423a3', 'A', 'A diagnostic test for cancer', false, 0),
  ('2736d411-3534-53fc-b08f-d5ec1ad0d553', '01781d8b-c9b8-5780-8147-5c15939423a3', 'B', 'It has no role', false, 1),
  ('e5844a98-c74d-5d22-a5fe-6ebce8db86ad', '01781d8b-c9b8-5780-8147-5c15939423a3', 'C', 'A baseline for monitoring for recurrence after treatment', true, 2),
  ('278d2bc0-9f46-583e-9fab-69bcadde6554', '01781d8b-c9b8-5780-8147-5c15939423a3', 'D', 'To decide on surgery', false, 3),
  ('13b42311-576f-5bd4-9742-635e4d16a700', '01781d8b-c9b8-5780-8147-5c15939423a3', 'E', 'A screening test', false, 4);

-- Q377
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('ce5e18df-952b-5af7-a81a-324d688415b7', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000003', 'sba', 'A 35 year old man has had loose stools, mucus and rectal bleeding for 6 weeks. Flexible sigmoidoscopy shows continuous mucosal inflammation limited to the rectum. Stool cultures are negative. What is the SINGLE most likely diagnosis?', 'Ulcerative colitis always involves the rectum and extends proximally continuously. Proctitis is limited to the rectum. First-line treatment: topical mesalazine (suppositories). Smoking appears protective in UC.', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v6')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = 'ce5e18df-952b-5af7-a81a-324d688415b7';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('bdbfebc0-5117-514c-bea9-325f757000ae', 'ce5e18df-952b-5af7-a81a-324d688415b7', 'A', 'Irritable bowel syndrome', false, 0),
  ('6719f047-0616-5043-ba4b-f606be1baf3f', 'ce5e18df-952b-5af7-a81a-324d688415b7', 'B', 'Haemorrhoids', false, 1),
  ('839ce2c5-9341-5ad3-890e-fc0031027005', 'ce5e18df-952b-5af7-a81a-324d688415b7', 'C', 'Infective colitis', false, 2),
  ('e0467ecc-f7b0-51f8-a38f-2eb0b71bcf71', 'ce5e18df-952b-5af7-a81a-324d688415b7', 'D', 'Crohn''s disease', false, 3),
  ('872a7c7d-6094-5338-8fd3-6dddbc6ad259', 'ce5e18df-952b-5af7-a81a-324d688415b7', 'E', 'Ulcerative proctitis', true, 4);

-- Q378
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('a294f9c1-82c0-5c83-a109-58a75910e5ac', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000003', 'sba', 'A 50 year old woman has had progressive dysphagia, Raynaud''s and tight skin. Manometry shows absent peristalsis in the lower oesophagus with a weak LOS. What is the SINGLE most likely diagnosis?', 'Systemic sclerosis causes oesophageal dysmotility and severe reflux (low LOS pressure), leading to strictures and Barrett''s. Achalasia has a high-pressure LOS that fails to relax. Treatment: PPIs and prokinetics.', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v6')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = 'a294f9c1-82c0-5c83-a109-58a75910e5ac';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('21307a9a-b0e1-5fc8-b150-bb823a20683b', 'a294f9c1-82c0-5c83-a109-58a75910e5ac', 'A', 'Eosinophilic oesophagitis', false, 0),
  ('c4928c1c-3f1c-5a35-a8c9-7fb0551f5f1b', 'a294f9c1-82c0-5c83-a109-58a75910e5ac', 'B', 'Systemic sclerosis with oesophageal involvement', true, 1),
  ('8129337f-205d-58c5-8f71-5608bbb42360', 'a294f9c1-82c0-5c83-a109-58a75910e5ac', 'C', 'Pharyngeal pouch', false, 2),
  ('0e07a3dd-c391-503f-8c8d-06b9b0232324', 'a294f9c1-82c0-5c83-a109-58a75910e5ac', 'D', 'Oesophageal cancer', false, 3),
  ('84ef4cda-57e3-5987-afb6-e74a5ed0dc42', 'a294f9c1-82c0-5c83-a109-58a75910e5ac', 'E', 'Achalasia', false, 4);

-- Q379
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('ebff4c78-3c93-5c0a-b6cc-d80f8ab29f23', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000003', 'sba', 'A 70 year old man has had melaena. Endoscopy shows a bleeding gastric ulcer, treated endoscopically. Biopsy is taken. What is the MOST important follow-up?', 'Gastric ulcers can be malignant; biopsy and repeat endoscopy confirm healing. Test and treat H. pylori. Stop NSAIDs where possible. Duodenal ulcers do not routinely need repeat endoscopy.', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v6')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = 'ebff4c78-3c93-5c0a-b6cc-d80f8ab29f23';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('d2cc07a8-266d-577d-9e13-248eb5e6440d', 'ebff4c78-3c93-5c0a-b6cc-d80f8ab29f23', 'A', 'Colonoscopy', false, 0),
  ('ba1f121a-049d-53c1-a9db-66a96e9ee239', 'ebff4c78-3c93-5c0a-b6cc-d80f8ab29f23', 'B', 'Repeat endoscopy (around 6-8 weeks) to check healing and exclude malignancy, plus H. pylori testing', true, 1),
  ('02178c0d-b55f-53e3-8292-2cfab13190da', 'ebff4c78-3c93-5c0a-b6cc-d80f8ab29f23', 'C', 'No follow-up needed', false, 2),
  ('483f9331-9b17-5062-9f9c-1a2a46bb1632', 'ebff4c78-3c93-5c0a-b6cc-d80f8ab29f23', 'D', 'Stop all PPIs', false, 3),
  ('12b17192-8eed-5184-86c4-054253f5af68', 'ebff4c78-3c93-5c0a-b6cc-d80f8ab29f23', 'E', 'CT abdomen only', false, 4);

-- Q380
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('339b5ff3-21a9-558b-8088-a43693cbfa06', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000004', 'sba', 'A 55 year old woman has had progressive tiredness, constipation and memory problems. Calcium is 2.8, PTH is high-normal, and 24-hour urinary calcium is very low. Her mother had similar results without symptoms. What is the SINGLE most likely diagnosis?', 'FHH (CASR mutation, autosomal dominant) causes mild hypercalcaemia with normal or slightly raised PTH and low urinary calcium (calcium:creatinine clearance ratio below 0.01). It is benign and does not need surgery. Distinguish from primary hyperparathyroidism before parathyroidectomy.', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v6')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = '339b5ff3-21a9-558b-8088-a43693cbfa06';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('8322db8a-596a-5303-a762-6881bc321ce4', '339b5ff3-21a9-558b-8088-a43693cbfa06', 'A', 'Primary hyperparathyroidism', false, 0),
  ('d50250b1-fb46-551b-8c56-1b71994c7936', '339b5ff3-21a9-558b-8088-a43693cbfa06', 'B', 'Vitamin D toxicity', false, 1),
  ('0015a501-0b1d-53d2-875a-625fa54223d4', '339b5ff3-21a9-558b-8088-a43693cbfa06', 'C', 'Malignancy', false, 2),
  ('3e7642ab-37dc-5511-ba0a-c8110274493d', '339b5ff3-21a9-558b-8088-a43693cbfa06', 'D', 'Familial hypocalciuric hypercalcaemia', true, 3),
  ('748d2d19-701b-5446-a28e-7c0a2c41e7a5', '339b5ff3-21a9-558b-8088-a43693cbfa06', 'E', 'Sarcoidosis', false, 4);

-- Q381
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('b2bf3538-c31f-57eb-b382-67ede20fbe83', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000004', 'sba', 'A 25 year old woman has had muscle cramps and tingling around her mouth. She had a thyroidectomy years ago. Calcium is 1.8 and PTH is low. What is the SINGLE most appropriate long-term treatment?', 'Hypoparathyroidism (most commonly after neck surgery) causes hypocalcaemia with low PTH. Treat with calcium and an activated vitamin D analogue (alfacalcidol or calcitriol), monitoring calcium and urinary calcium. Recombinant PTH is an option for some.', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v6')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = 'b2bf3538-c31f-57eb-b382-67ede20fbe83';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('bbcff21b-5fa2-5636-a8c6-5692c670c029', 'b2bf3538-c31f-57eb-b382-67ede20fbe83', 'A', 'Oral calcium and alfacalcidol (active vitamin D)', true, 0),
  ('0d83ca0e-05e3-5b83-b24a-77524649ca10', 'b2bf3538-c31f-57eb-b382-67ede20fbe83', 'B', 'Calcium alone', false, 1),
  ('85ee07cd-6301-5d7a-bb06-f6b6e16d6b23', 'b2bf3538-c31f-57eb-b382-67ede20fbe83', 'C', 'Cholecalciferol alone', false, 2),
  ('b5997385-09ca-5e25-afd2-3cb128fc12d8', 'b2bf3538-c31f-57eb-b382-67ede20fbe83', 'D', 'Bisphosphonates', false, 3),
  ('921135b4-2da0-5117-bf3a-75b4d63d2cd8', 'b2bf3538-c31f-57eb-b382-67ede20fbe83', 'E', 'Thyroxine', false, 4);

-- Q382
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('3f1a416a-20a6-5a78-98fc-98de1cb02370', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000004', 'sba', 'A 50 year old man has had fatigue and low libido. Ferritin is 2,500 and transferrin saturation is 85%. He also has diabetes and abnormal LFTs. What is the SINGLE most appropriate treatment?', 'Hereditary haemochromatosis is treated with venesection (weekly until ferritin about 50, then maintenance). Screen for cirrhosis (risk of HCC). Chelation is used if venesection is not possible. Avoid vitamin C supplements and iron-rich supplements.', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v6')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = '3f1a416a-20a6-5a78-98fc-98de1cb02370';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('8eb255d0-dafb-5299-aeb8-f02ffe877bc2', '3f1a416a-20a6-5a78-98fc-98de1cb02370', 'A', 'Regular venesection (hereditary haemochromatosis)', true, 0),
  ('6a1d08dd-5200-5d03-9f57-451a447a087e', '3f1a416a-20a6-5a78-98fc-98de1cb02370', 'B', 'Vitamin C', false, 1),
  ('353cbc32-4a99-55a3-96f2-d6f88415eea7', '3f1a416a-20a6-5a78-98fc-98de1cb02370', 'C', 'Desferrioxamine first-line', false, 2),
  ('ba0a5ccf-2873-54a7-b490-e51e5772283b', '3f1a416a-20a6-5a78-98fc-98de1cb02370', 'D', 'Oral iron', false, 3),
  ('b9805eda-2119-5e6e-b68a-514e8f82143a', '3f1a416a-20a6-5a78-98fc-98de1cb02370', 'E', 'Liver transplant immediately', false, 4);

-- Q383
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('6d02fddd-2cf6-51a2-b011-9ca8dc982021', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000004', 'sba', 'A 45 year old woman has had weight gain, hirsutism and irregular periods. Overnight dexamethasone suppression test shows unsuppressed cortisol. ACTH is high. High-dose dexamethasone suppresses cortisol. MRI shows a 6 mm pituitary lesion. What is the SINGLE most likely diagnosis?', 'Cushing''s disease is ACTH-dependent Cushing''s from a pituitary adenoma (most common endogenous cause). High-dose dexamethasone often suppresses it (ectopic ACTH usually does not). Inferior petrosal sinus sampling confirms. Treatment: trans-sphenoidal surgery.', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v6')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = '6d02fddd-2cf6-51a2-b011-9ca8dc982021';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('71347873-4925-5b36-91ce-6d2ff8000f1e', '6d02fddd-2cf6-51a2-b011-9ca8dc982021', 'A', 'Adrenal adenoma', false, 0),
  ('671d7e9b-3485-54eb-be15-61c481130f31', '6d02fddd-2cf6-51a2-b011-9ca8dc982021', 'B', 'Pseudo-Cushing''s', false, 1),
  ('a8a81855-3887-510c-8070-2f38e58f1f10', '6d02fddd-2cf6-51a2-b011-9ca8dc982021', 'C', 'Cushing''s disease (pituitary ACTH-secreting adenoma)', true, 2),
  ('4254e414-04a8-51f2-8d26-f11978176a3d', '6d02fddd-2cf6-51a2-b011-9ca8dc982021', 'D', 'PCOS', false, 3),
  ('48c52323-899c-59eb-9dcf-db340fa9af15', '6d02fddd-2cf6-51a2-b011-9ca8dc982021', 'E', 'Ectopic ACTH syndrome', false, 4);

-- Q384
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('42de63a9-2d78-5dd3-88dc-63cd56a86ca0', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000004', 'sba', 'A 70 year old man with type 2 diabetes takes gliclazide. He has CKD stage 4 and has had recurrent hypoglycaemia. What is the SINGLE most appropriate change?', 'Sulfonylureas cause hypoglycaemia, especially in older people and CKD. Relax HbA1c targets in frail older people. Linagliptin does not need dose adjustment in CKD. Insulin may be needed for higher glucose.', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v6')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = '42de63a9-2d78-5dd3-88dc-63cd56a86ca0';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('68c894a0-fe0e-5684-bc54-e5b2ea0c5936', '42de63a9-2d78-5dd3-88dc-63cd56a86ca0', 'A', 'Add pioglitazone', false, 0),
  ('8705ab7a-0eb7-5952-a334-906e4db8fe5d', '42de63a9-2d78-5dd3-88dc-63cd56a86ca0', 'B', 'Add metformin', false, 1),
  ('1e72d286-a57c-5e1f-829d-42842bb8f635', '42de63a9-2d78-5dd3-88dc-63cd56a86ca0', 'C', 'Increase gliclazide', false, 2),
  ('bb4b131f-dfee-5024-a918-35927832762d', '42de63a9-2d78-5dd3-88dc-63cd56a86ca0', 'D', 'Switch from gliclazide to a lower-risk option (e.g. a DPP-4 inhibitor such as linagliptin)', true, 3),
  ('07406428-d72f-5386-a5c5-dc4732cf09c5', '42de63a9-2d78-5dd3-88dc-63cd56a86ca0', 'E', 'Stop all diabetes treatment', false, 4);

-- Q385
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('d6c21e07-179c-58e2-96b6-3d2e47a3531b', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000004', 'sba', 'A 30 year old man has had lethargy and headaches. MRI shows a 2 cm pituitary macroadenoma compressing the optic chiasm. Prolactin is 1,200 mU/L (modestly raised). What is the MOST likely cause of the raised prolactin?', 'A macroprolactinoma usually has very high prolactin (often over 5,000 mU/L). A large tumour with only modest elevation suggests a non-functioning adenoma compressing the stalk (reducing dopamine inhibition). Surgery is usually needed for non-functioning adenomas with visual compromise.', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v6')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = 'd6c21e07-179c-58e2-96b6-3d2e47a3531b';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('b238e9b4-cf33-5470-984b-050a739ee11b', 'd6c21e07-179c-58e2-96b6-3d2e47a3531b', 'A', 'Stalk compression from a non-functioning adenoma (disconnection hyperprolactinaemia)', true, 0),
  ('12b4a3e0-9d12-52ae-bef2-7d485a87ceec', 'd6c21e07-179c-58e2-96b6-3d2e47a3531b', 'B', 'Drug effect', false, 1),
  ('22e12203-4806-590f-88f4-1b42707e5b8b', 'd6c21e07-179c-58e2-96b6-3d2e47a3531b', 'C', 'Prolactinoma', false, 2),
  ('759519cf-725a-5c8b-8cd6-178dfe730d7c', 'd6c21e07-179c-58e2-96b6-3d2e47a3531b', 'D', 'Pregnancy', false, 3),
  ('feb3af58-93ee-56d9-b646-39eb78b15b9b', 'd6c21e07-179c-58e2-96b6-3d2e47a3531b', 'E', 'Hypothyroidism', false, 4);

-- Q386
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('ad49498e-effc-5170-b310-89241f0591ba', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000010', 'sba', 'A 25 year old man had a needle-stick injury from a patient with hepatitis B (HBeAg positive). He was vaccinated but never checked his response. What is the SINGLE most appropriate management?', 'After needle-stick: wash the wound, encourage bleeding, report and assess risk. For hepatitis B exposure, check the recipient''s vaccine response; give booster and/or HBIG. HIV PEP if source HIV positive with detectable viral load. Follow up with testing for HBV, HCV and HIV.', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v6')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = 'ad49498e-effc-5170-b310-89241f0591ba';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('cd9b26e1-e3e0-5d4c-a3ed-0ec9229798c9', 'ad49498e-effc-5170-b310-89241f0591ba', 'A', 'Start tenofovir long-term', false, 0),
  ('a6686d31-0e4a-50f1-b0ce-54a2bf2c204d', 'ad49498e-effc-5170-b310-89241f0591ba', 'B', 'Hepatitis A vaccine', false, 1),
  ('723aea09-f53f-58d4-aa0b-4aff391d0bcd', 'ad49498e-effc-5170-b310-89241f0591ba', 'C', 'HIV PEP only', false, 2),
  ('e873ea9f-43e5-5a53-adf8-936e23507460', 'ad49498e-effc-5170-b310-89241f0591ba', 'D', 'No action needed', false, 3),
  ('dafa8c29-7a3a-5809-928c-173a69c388c2', 'ad49498e-effc-5170-b310-89241f0591ba', 'E', 'Check his anti-HBs level urgently; give a booster dose and HBIG if non-responder or level unknown', true, 4);

-- Q387
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('84585794-3474-55bc-a395-8a4b7a51eeb5', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000010', 'sba', 'A 70 year old woman has had diarrhoea for 3 days after a course of clindamycin. She has a temperature of 38.5°C, WCC of 18, and creatinine has doubled. What is the SINGLE most appropriate treatment?', 'Severe CDI (WCC over 15, raised creatinine, temperature over 38.5 or signs of colitis): oral vancomycin (fidaxomicin second-line). Life-threatening disease: oral vancomycin, IV metronidazole, and surgical review. Isolate and use soap and water for hand hygiene.', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v6')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = '84585794-3474-55bc-a395-8a4b7a51eeb5';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('701c583c-a4a1-5ad3-94de-ed2d8d6e7cba', '84585794-3474-55bc-a395-8a4b7a51eeb5', 'A', 'Probiotics alone', false, 0),
  ('1454e107-321f-5a25-a7c8-16a974e9a265', '84585794-3474-55bc-a395-8a4b7a51eeb5', 'B', 'Loperamide', false, 1),
  ('e7fc0f80-dbb7-5a4e-8df4-5ebf148bd604', '84585794-3474-55bc-a395-8a4b7a51eeb5', 'C', 'Oral vancomycin (severe C. difficile infection), with surgical review if deteriorating', true, 2),
  ('0c1f46ce-7de1-5f15-9b25-6f63ad53e14a', '84585794-3474-55bc-a395-8a4b7a51eeb5', 'D', 'IV vancomycin', false, 3),
  ('99d02978-2233-5f11-ab38-daeda768f7b2', '84585794-3474-55bc-a395-8a4b7a51eeb5', 'E', 'Oral metronidazole', false, 4);

-- Q388
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('4187eff3-59a7-5974-bf03-b5f1184ab4f8', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000010', 'sba', 'A 30 year old man has had fever, sore throat and a rash on his palms and soles. He had a painless genital ulcer 2 months ago. RPR and TPPA are positive. What stage of syphilis is this?', 'Secondary syphilis occurs weeks to months after the chancre, with rash (including palms and soles), lymphadenopathy, condylomata lata and mucosal lesions. Treponemal tests (TPPA) remain positive for life; non-treponemal tests (RPR) monitor treatment response.', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v6')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = '4187eff3-59a7-5974-bf03-b5f1184ab4f8';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('4ed8fc51-c859-520f-8c34-5faa5e062b5d', '4187eff3-59a7-5974-bf03-b5f1184ab4f8', 'A', 'Congenital syphilis', false, 0),
  ('8e39598c-60c9-59c6-8991-4aab771006ae', '4187eff3-59a7-5974-bf03-b5f1184ab4f8', 'B', 'Secondary syphilis', true, 1),
  ('3911d987-f0cd-596a-8bf2-9e1649837756', '4187eff3-59a7-5974-bf03-b5f1184ab4f8', 'C', 'Primary syphilis', false, 2),
  ('1f271f98-7349-5347-be45-01fae7e44211', '4187eff3-59a7-5974-bf03-b5f1184ab4f8', 'D', 'Tertiary syphilis', false, 3),
  ('58ecf13d-6aec-5870-82f3-510c5cfb0558', '4187eff3-59a7-5974-bf03-b5f1184ab4f8', 'E', 'Latent syphilis', false, 4);

-- Q389
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('c9db9639-4114-5f87-93dd-69c8946c97f2', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000010', 'sba', 'A 3 year old child has had fever and a petechial rash. Blood culture grows Neisseria meningitidis. What prophylaxis should household contacts receive?', 'Close contacts of meningococcal disease (household, kissing contacts) are offered ciprofloxacin (or rifampicin) as soon as possible, coordinated by UKHSA. Vaccination may be offered depending on the serogroup.', null, true, true, jsonb_build_object('source', 'plab1-xlsx-v6', 'guidelines_text', 'UKHSA')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = 'c9db9639-4114-5f87-93dd-69c8946c97f2';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('8f8e1eff-b8db-5779-80f3-8db68ffd0adc', 'c9db9639-4114-5f87-93dd-69c8946c97f2', 'A', 'Rifampicin for 2 months', false, 0),
  ('3c795b1f-89cb-524f-805d-fee6bc782b44', 'c9db9639-4114-5f87-93dd-69c8946c97f2', 'B', 'Penicillin for 2 weeks', false, 1),
  ('d80ba5d0-fcf8-5690-b677-500a47b6fdab', 'c9db9639-4114-5f87-93dd-69c8946c97f2', 'C', 'IV ceftriaxone for all', false, 2),
  ('f91522e0-448d-58a2-82c6-cde2ed154d64', 'c9db9639-4114-5f87-93dd-69c8946c97f2', 'D', 'Single dose of ciprofloxacin (and vaccination if serogroup is vaccine-preventable)', true, 3),
  ('1fc379c3-b187-5420-a8a2-5fc64d1a3dea', 'c9db9639-4114-5f87-93dd-69c8946c97f2', 'E', 'No prophylaxis', false, 4);

-- Q390
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('a760566b-2f27-54cb-8053-5d797471cf64', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000010', 'sba', 'A 40 year old man has had a fever and diarrhoea after returning from Southeast Asia. Blood cultures grow Salmonella Typhi resistant to ciprofloxacin. What is the SINGLE most appropriate antibiotic?', 'Fluoroquinolone resistance in Salmonella Typhi is common in South Asia. Treat with ceftriaxone or azithromycin; carbapenems for extensively drug-resistant strains. Typhoid is notifiable; food handlers are excluded until clear.', null, true, true, jsonb_build_object('source', 'plab1-xlsx-v6')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = 'a760566b-2f27-54cb-8053-5d797471cf64';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('14d64cee-7647-540f-8808-766ca3195409', 'a760566b-2f27-54cb-8053-5d797471cf64', 'A', 'Amoxicillin', false, 0),
  ('f65e1aa4-0e12-5711-a166-98f9d575d975', 'a760566b-2f27-54cb-8053-5d797471cf64', 'B', 'Ciprofloxacin', false, 1),
  ('845bc944-bda0-5451-841e-844c0a056747', 'a760566b-2f27-54cb-8053-5d797471cf64', 'C', 'Doxycycline', false, 2),
  ('5f641094-fb21-5fa6-9c79-7f1488b075cc', 'a760566b-2f27-54cb-8053-5d797471cf64', 'D', 'IV ceftriaxone (or azithromycin for uncomplicated disease, depending on sensitivities)', true, 3),
  ('b59f1d39-ea13-593c-884f-091f1ccc37f0', 'a760566b-2f27-54cb-8053-5d797471cf64', 'E', 'Metronidazole', false, 4);

-- Q391
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('53dec3bc-8c49-5b2d-8115-59710de06eb9', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000010', 'sba', 'A 25 year old woman has had a fever, rash and joint pains 5 days after returning from the Caribbean. She is pregnant. What MOST important infection must be considered because of fetal risk?', 'Zika virus causes a mild illness with rash, conjunctivitis and arthralgia, but infection in pregnancy can cause microcephaly and other congenital abnormalities. Pregnant women are advised to avoid travel to affected areas and use bite prevention. Serial fetal ultrasound if infected.', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v6')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = '53dec3bc-8c49-5b2d-8115-59710de06eb9';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('03d7c888-dbf7-5231-b602-b63508a51a2f', '53dec3bc-8c49-5b2d-8115-59710de06eb9', 'A', 'Chikungunya only', false, 0),
  ('6a9a3a48-7795-5a17-9632-0e0be2f7f63b', '53dec3bc-8c49-5b2d-8115-59710de06eb9', 'B', 'Yellow fever', false, 1),
  ('364cb11e-2051-5664-b47d-a1e74525e2a1', '53dec3bc-8c49-5b2d-8115-59710de06eb9', 'C', 'Zika virus (risk of microcephaly)', true, 2),
  ('6148f599-5ae3-51d7-a17e-4d3cebd45ad0', '53dec3bc-8c49-5b2d-8115-59710de06eb9', 'D', 'Malaria only', false, 3),
  ('53777d47-fe9d-5507-9a31-1f1ac371db83', '53dec3bc-8c49-5b2d-8115-59710de06eb9', 'E', 'Dengue only', false, 4);

-- Q392
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('b897df3d-df33-5be0-9c77-0c747f91986c', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000014', 'sba', 'A 20 year old man has had a severe sore throat and fatigue. Blood film shows many atypical lymphocytes. He has splenomegaly. Monospot is positive. He also has a low Hb with spherocytes and a positive DAT (cold agglutinins). What is the MOST likely explanation for the anaemia?', 'Cold AIHA (IgM, complement-mediated) is associated with Mycoplasma, EBV and lymphoproliferative disorders. It causes haemolysis, acrocyanosis and Raynaud''s in the cold. Infection-related cases are usually self-limiting. Keep warm; rituximab for chronic cases.', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v6')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = 'b897df3d-df33-5be0-9c77-0c747f91986c';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('bfee80e8-244e-54eb-8631-19b51fe93f5e', 'b897df3d-df33-5be0-9c77-0c747f91986c', 'A', 'Iron deficiency', false, 0),
  ('c9020453-bfc9-5584-89cd-02c8fd497a16', 'b897df3d-df33-5be0-9c77-0c747f91986c', 'B', 'Cold autoimmune haemolytic anaemia (IgM) associated with EBV infection', true, 1),
  ('b54377e0-7c21-5285-9de1-5c2bea8b876b', 'b897df3d-df33-5be0-9c77-0c747f91986c', 'C', 'G6PD deficiency', false, 2),
  ('e66ba518-4acc-5de5-961a-067836e96de9', 'b897df3d-df33-5be0-9c77-0c747f91986c', 'D', 'Warm AIHA from SLE', false, 3),
  ('56c09274-078d-5e68-845e-51c849f006e2', 'b897df3d-df33-5be0-9c77-0c747f91986c', 'E', 'Hereditary spherocytosis', false, 4);

-- Q393
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('efd658bc-cb2d-5dd5-b3a3-bfbe2614a238', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000014', 'sba', 'A 45 year old woman has had fatigue and a craving for ice. Her Hb is 95 with low MCV and low ferritin. She is vegetarian with heavy periods. Oral iron caused severe constipation. What is the SINGLE most appropriate next treatment?', 'Oral iron side effects (GI upset, constipation) can be reduced by alternate-day dosing or a different preparation. IV iron is used when oral iron fails or is not tolerated, in malabsorption or when rapid correction is needed. Investigate and treat the cause (menorrhagia).', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v6')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = 'efd658bc-cb2d-5dd5-b3a3-bfbe2614a238';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('8bbd2017-6e00-51b9-a783-896dcf74bdde', 'efd658bc-cb2d-5dd5-b3a3-bfbe2614a238', 'A', 'Vitamin B12 injections', false, 0),
  ('5f03ec00-913f-52ad-ac25-7b797550e37d', 'efd658bc-cb2d-5dd5-b3a3-bfbe2614a238', 'B', 'Folic acid only', false, 1),
  ('e2b5ed66-0a9d-5335-bad7-e0f057863519', 'efd658bc-cb2d-5dd5-b3a3-bfbe2614a238', 'C', 'No treatment', false, 2),
  ('72211972-8568-572a-9c3e-eaed2aa39b98', 'efd658bc-cb2d-5dd5-b3a3-bfbe2614a238', 'D', 'Try alternative oral iron (e.g. alternate-day dosing or a different salt), or IV iron if intolerant', true, 3),
  ('a5edffad-5b0a-54b3-9cc3-ab61dffc9ef3', 'efd658bc-cb2d-5dd5-b3a3-bfbe2614a238', 'E', 'Blood transfusion', false, 4);

-- Q394
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('12e7a7fb-8b87-57e1-bdc3-988bfc18282b', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000014', 'sba', 'A 30 year old man has had recurrent DVTs and thrombosis in unusual sites (mesenteric veins). He has haemolytic anaemia and pancytopenia. What is the SINGLE most likely diagnosis?', 'PNH causes complement-mediated haemolysis, thrombosis at unusual sites (hepatic, mesenteric, cerebral veins) and bone marrow failure. Flow cytometry shows loss of CD55 and CD59. Treatment: complement inhibitors and anticoagulation.', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v6')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = '12e7a7fb-8b87-57e1-bdc3-988bfc18282b';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('5ed9f44f-62b1-5671-9b1f-3e7089adddce', '12e7a7fb-8b87-57e1-bdc3-988bfc18282b', 'A', 'Antiphospholipid syndrome', false, 0),
  ('7f96b1e0-021f-51ae-b611-0de0aee652ea', '12e7a7fb-8b87-57e1-bdc3-988bfc18282b', 'B', 'Protein C deficiency', false, 1),
  ('f34341f5-1567-5bce-b62e-c98b23ed4e22', '12e7a7fb-8b87-57e1-bdc3-988bfc18282b', 'C', 'Myelofibrosis', false, 2),
  ('fdd8526a-e5d3-5e0e-950e-b4ec6b395905', '12e7a7fb-8b87-57e1-bdc3-988bfc18282b', 'D', 'Paroxysmal nocturnal haemoglobinuria', true, 3),
  ('7af4f22d-c8fa-56f4-ab72-94d21d823d30', '12e7a7fb-8b87-57e1-bdc3-988bfc18282b', 'E', 'Factor V Leiden', false, 4);

-- Q395
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('b3152285-1560-5b5f-badf-8b63a2e603fd', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000014', 'sba', 'A 75 year old man is on warfarin for AF with an INR target of 2.5. INR is 3.6. He has no bleeding. What is the SINGLE most appropriate management?', 'INR 3.0-6.0 without bleeding: reduce dose or omit 1-2 doses. INR 6-8 without bleeding: stop warfarin, restart when below 5. INR over 8: stop and give oral vitamin K. Major bleeding: stop, IV vitamin K and PCC. Look for interacting drugs and illness.', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v6')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = 'b3152285-1560-5b5f-badf-8b63a2e603fd';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('6baa5f8b-4bf6-53a1-9f18-2840078e3a30', 'b3152285-1560-5b5f-badf-8b63a2e603fd', 'A', 'Stop warfarin permanently', false, 0),
  ('5b50133f-58d6-5daf-b280-3bffbd7c89c5', 'b3152285-1560-5b5f-badf-8b63a2e603fd', 'B', 'No change', false, 1),
  ('6a476ffd-3b8d-5784-bc3f-00eabfe9bc91', 'b3152285-1560-5b5f-badf-8b63a2e603fd', 'C', 'Give vitamin K', false, 2),
  ('bcfda97a-64eb-590b-928c-80fc0dde4e6b', 'b3152285-1560-5b5f-badf-8b63a2e603fd', 'D', 'Reduce the warfarin dose or omit a dose, and recheck INR', true, 3),
  ('1358bf7c-378b-5068-9479-216446314c83', 'b3152285-1560-5b5f-badf-8b63a2e603fd', 'E', 'Give prothrombin complex concentrate', false, 4);

-- Q396
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('d288a40e-bfa8-5d6b-ad69-bc6480d982b5', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000014', 'sba', 'A 50 year old man on dabigatran for AF has a major GI bleed. What is the SINGLE most appropriate specific reversal agent?', 'Dabigatran (direct thrombin inhibitor) is reversed with idarucizumab and can be removed by dialysis. Factor Xa inhibitors (apixaban, rivaroxaban) are reversed with andexanet alfa or PCC. Heparin is reversed with protamine. Warfarin is reversed with vitamin K and PCC.', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v6')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = 'd288a40e-bfa8-5d6b-ad69-bc6480d982b5';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('264ee1b9-e8b8-5ea1-9a32-88726efaa06c', 'd288a40e-bfa8-5d6b-ad69-bc6480d982b5', 'A', 'Andexanet alfa', false, 0),
  ('231e8892-a7e2-5b93-802c-9d1f108dc5bd', 'd288a40e-bfa8-5d6b-ad69-bc6480d982b5', 'B', 'Prothrombin complex concentrate only', false, 1),
  ('b480bbd1-dfe4-56fd-88d8-ebed1de441ac', 'd288a40e-bfa8-5d6b-ad69-bc6480d982b5', 'C', 'Idarucizumab', true, 2),
  ('c336e228-9509-5a23-ae64-fd4d3ee0b911', 'd288a40e-bfa8-5d6b-ad69-bc6480d982b5', 'D', 'Vitamin K', false, 3),
  ('5637ca58-020f-5076-ba8f-d63ef9a5b668', 'd288a40e-bfa8-5d6b-ad69-bc6480d982b5', 'E', 'Protamine', false, 4);

-- Q397
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('f7438bc4-be22-5b08-a7f8-e4febca18385', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000006', 'sba', 'A 60 year old woman has had transient episodes of numbness in her right hand and face lasting 20 minutes. MRI shows no infarct. She is in AF. What is the SINGLE most appropriate secondary prevention?', 'TIA with AF is treated with anticoagulation to prevent cardioembolic stroke. DOACs are preferred. Start immediately after TIA once haemorrhage is excluded. Antiplatelets are not adequate for AF.', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v6')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = 'f7438bc4-be22-5b08-a7f8-e4febca18385';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('1c908350-3d76-5e8a-b0f3-23720063432e', 'f7438bc4-be22-5b08-a7f8-e4febca18385', 'A', 'Anticoagulation (DOAC) once intracranial haemorrhage is excluded', true, 0),
  ('ed710e78-ac85-5e7e-8317-d44677786843', 'f7438bc4-be22-5b08-a7f8-e4febca18385', 'B', 'Carotid endarterectomy', false, 1),
  ('92ca2028-f1f7-52df-bde8-085256d82a9d', 'f7438bc4-be22-5b08-a7f8-e4febca18385', 'C', 'Clopidogrel only', false, 2),
  ('e8a04990-fc0f-5f39-ad6d-7139677a6835', 'f7438bc4-be22-5b08-a7f8-e4febca18385', 'D', 'No treatment', false, 3),
  ('00182571-1b92-5ea5-b1ff-6febb5450359', 'f7438bc4-be22-5b08-a7f8-e4febca18385', 'E', 'Aspirin only', false, 4);

-- Q398
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('a4e211aa-0bc1-5451-a9f9-acf83dcbc085', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000006', 'sba', 'A 70 year old man has had progressive weakness of his legs and a sensory level at T6. MRI shows an intradural extramedullary mass. He has no cancer history. What is the SINGLE most likely diagnosis?', 'Intradural extramedullary tumours are usually benign meningiomas (often thoracic in women) or schwannomas. They cause slowly progressive myelopathy. Treatment is surgical excision with good outcomes.', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v6')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = 'a4e211aa-0bc1-5451-a9f9-acf83dcbc085';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('5be51930-e974-59d3-b721-cce6f69a3ae6', 'a4e211aa-0bc1-5451-a9f9-acf83dcbc085', 'A', 'Syringomyelia', false, 0),
  ('021ee57c-7cfd-57c5-9a6e-858263e73608', 'a4e211aa-0bc1-5451-a9f9-acf83dcbc085', 'B', 'Disc prolapse', false, 1),
  ('4bd248bb-7af5-5445-803b-8471932e7c4e', 'a4e211aa-0bc1-5451-a9f9-acf83dcbc085', 'C', 'Metastasis', false, 2),
  ('7e3d4ce6-b4e2-5046-93fb-edf031f34cb1', 'a4e211aa-0bc1-5451-a9f9-acf83dcbc085', 'D', 'Transverse myelitis', false, 3),
  ('d9d5c272-7db8-525f-8831-3a38e456bc6d', 'a4e211aa-0bc1-5451-a9f9-acf83dcbc085', 'E', 'Meningioma (or schwannoma)', true, 4);

-- Q399
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('078070d3-ad33-5567-8120-919c5c15644f', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000006', 'sba', 'A 35 year old man has had progressive spastic paraparesis, urinary symptoms and sensory ataxia. He has HIV. Vitamin B12 is normal. What is the SINGLE most likely diagnosis?', 'HIV can cause vacuolar myelopathy, distal sensory polyneuropathy, HIV-associated neurocognitive disorder, and opportunistic CNS infections. Exclude B12 deficiency, HTLV-1 and compression. ART is the main treatment.', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v6')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = '078070d3-ad33-5567-8120-919c5c15644f';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('809e329b-82cc-5335-844e-c21d8bcf8ca2', '078070d3-ad33-5567-8120-919c5c15644f', 'A', 'Cord compression', false, 0),
  ('e82f3833-e4b5-5e17-ab68-17984c20bf58', '078070d3-ad33-5567-8120-919c5c15644f', 'B', 'Guillain-Barré syndrome', false, 1),
  ('f40b0848-71ea-5de1-bac2-c675b718e285', '078070d3-ad33-5567-8120-919c5c15644f', 'C', 'HIV-associated vacuolar myelopathy', true, 2),
  ('5d18c4ea-939b-5b2e-a464-84b865975433', '078070d3-ad33-5567-8120-919c5c15644f', 'D', 'Syringomyelia', false, 3),
  ('95d25755-e64e-5644-911a-04668a11be7a', '078070d3-ad33-5567-8120-919c5c15644f', 'E', 'Multiple sclerosis', false, 4);

-- Q400
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('59e3fcd7-24f6-5881-b92b-9465afd00bd1', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000006', 'sba', 'A 28 year old woman has had worsening headache, nausea and blurred vision. She is postpartum. CT venogram shows thrombosis of the superior sagittal sinus. What is the SINGLE most appropriate treatment?', 'Cerebral venous sinus thrombosis is treated with anticoagulation (LMWH, then oral anticoagulant for 3-12 months), even with haemorrhagic venous infarction. Manage seizures and raised ICP. Endovascular therapy for deterioration.', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v6')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = '59e3fcd7-24f6-5881-b92b-9465afd00bd1';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('a6f65ec9-a9f5-5386-89a9-4e06b8dfcbb1', '59e3fcd7-24f6-5881-b92b-9465afd00bd1', 'A', 'Aspirin only', false, 0),
  ('a4fd1377-50ae-5ee6-a18c-85296a9b01b2', '59e3fcd7-24f6-5881-b92b-9465afd00bd1', 'B', 'Anticoagulation with LMWH (even if haemorrhage is present)', true, 1),
  ('9bfc003d-0fde-5247-b652-e735f5d8a618', '59e3fcd7-24f6-5881-b92b-9465afd00bd1', 'C', 'Steroids', false, 2),
  ('586bd4fe-6369-50f6-b236-01e323e11094', '59e3fcd7-24f6-5881-b92b-9465afd00bd1', 'D', 'Thrombolysis first-line', false, 3),
  ('4a295114-770c-5e4d-a53c-110f81e9d64b', '59e3fcd7-24f6-5881-b92b-9465afd00bd1', 'E', 'No treatment', false, 4);

