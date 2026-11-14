-- =============================================================================
-- PLAB 1 bank v3 import PART 2 (Q201–400 of 830)
-- Paste AFTER seed_topics_expand.sql. Additive to banks v1/v2 — do NOT clear.
-- =============================================================================

-- Q201
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('2434d33f-2b4a-5a34-9775-7cf0a41ab555', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000007', 'sba', 'A 35 year old woman believes her husband has been replaced by an identical-looking impostor. She has schizophrenia. What is the name of this delusion?', 'Capgras syndrome is the delusion that a familiar person has been replaced by an impostor. Fregoli: the belief that different people are actually one person in disguise. De Clérambault''s (erotomania): the belief that someone, often of higher status, is in love with them. Cotard''s: the belief that one is dead or rotting. Ekbom''s: delusional parasitosis.', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v3')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = '2434d33f-2b4a-5a34-9775-7cf0a41ab555';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('b2fa57f4-89e0-593d-bbc9-6d790e3e82c3', '2434d33f-2b4a-5a34-9775-7cf0a41ab555', 'A', 'Cotard''s syndrome', false, 0),
  ('ba0c8ed8-bd0e-5480-9742-79043b1403f5', '2434d33f-2b4a-5a34-9775-7cf0a41ab555', 'B', 'Fregoli syndrome', false, 1),
  ('281b27d2-1e81-535b-9fea-15816afab87a', '2434d33f-2b4a-5a34-9775-7cf0a41ab555', 'C', 'Capgras syndrome', true, 2),
  ('fd42337d-2487-5762-8ec7-9b2ede3488b8', '2434d33f-2b4a-5a34-9775-7cf0a41ab555', 'D', 'De Clérambault''s syndrome', false, 3),
  ('8941b9b6-d15c-5617-bce9-aa3763080998', '2434d33f-2b4a-5a34-9775-7cf0a41ab555', 'E', 'Ekbom syndrome', false, 4);

-- Q202
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('f094f2ca-4810-516f-ad67-51317ddbeb00', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000007', 'sba', 'A 22 year old man has been increasingly paranoid and has auditory hallucinations. He has smoked high-potency cannabis (''skunk'') daily for 4 years. What is the SINGLE most important advice?', 'Cannabis use, especially high-potency THC and starting young, increases the risk of psychotic disorders and worsens outcomes in schizophrenia (more relapses and admissions). Offer support to stop, and refer to an early intervention in psychosis service. Treat with antipsychotics and psychological therapy.', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v3')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = 'f094f2ca-4810-516f-ad67-51317ddbeb00';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('18e1dcc0-d0b6-5bce-9cab-01666e01a6ab', 'f094f2ca-4810-516f-ad67-51317ddbeb00', 'A', 'Start benzodiazepines long-term', false, 0),
  ('2bcba12b-580f-5976-a9fa-4ec45827ab41', 'f094f2ca-4810-516f-ad67-51317ddbeb00', 'B', 'Increase cannabis intake to help sleep', false, 1),
  ('0b8087a0-5b6f-5ed1-aec2-5b76dd94c5a3', 'f094f2ca-4810-516f-ad67-51317ddbeb00', 'C', 'Cannabis does not affect psychosis', false, 2),
  ('3f5623a0-1a03-5d1c-b86d-7fd9e0187c8c', 'f094f2ca-4810-516f-ad67-51317ddbeb00', 'D', 'Switch to occasional use only', false, 3),
  ('f2f618bb-01f8-5f70-8b84-817665186599', 'f094f2ca-4810-516f-ad67-51317ddbeb00', 'E', 'Stop using cannabis, as it increases the risk and worsens the course of psychosis', true, 4);

-- Q203
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('c514c6d6-7727-5117-b856-8481e671dabb', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000007', 'sba', 'A 45 year old man with alcohol dependence completed a detox. He wants a medicine that will make him feel unwell if he drinks. He has no heart disease or psychosis. Which drug is MOST appropriate?', 'Disulfiram inhibits aldehyde dehydrogenase, causing an unpleasant reaction with alcohol (flushing, nausea, palpitations, hypotension). It is a deterrent and requires motivation and supervision. Avoid it in heart disease, psychosis and stroke. Acamprosate reduces cravings, and naltrexone reduces the reward from drinking.', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v3')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = 'c514c6d6-7727-5117-b856-8481e671dabb';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('2f60d0d3-a182-523f-9cff-f29870007801', 'c514c6d6-7727-5117-b856-8481e671dabb', 'A', 'Acamprosate', false, 0),
  ('cd8f4074-5c81-5db6-9132-1d275846f2b8', 'c514c6d6-7727-5117-b856-8481e671dabb', 'B', 'Chlordiazepoxide', false, 1),
  ('546006be-c32b-59d4-9abf-62b6b66c22b1', 'c514c6d6-7727-5117-b856-8481e671dabb', 'C', 'Naltrexone', false, 2),
  ('93402c15-27da-597a-8d5a-01d6ed1d12f1', 'c514c6d6-7727-5117-b856-8481e671dabb', 'D', 'Baclofen', false, 3),
  ('b2c7a8a3-ce8b-5955-8ddd-dee3f8f3e607', 'c514c6d6-7727-5117-b856-8481e671dabb', 'E', 'Disulfiram', true, 4);

-- Q204
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('d8f1f12a-b12b-5d51-9609-a496616bf3aa', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000007', 'sba', 'A 38 year old woman has taken diazepam 20 mg a day for 4 years for anxiety and wants to stop. What is the SINGLE most appropriate approach?', 'Abrupt withdrawal of long-term benzodiazepines can cause severe anxiety, insomnia, perceptual disturbances, seizures and delirium. Withdraw gradually, often converting to diazepam (long half-life) first, with reductions tailored to the patient and slower at lower doses. Psychological support improves success.', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v3')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = 'd8f1f12a-b12b-5d51-9609-a496616bf3aa';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('67e1b1dd-e7d0-5a6b-8b68-0428dc0ed98f', 'd8f1f12a-b12b-5d51-9609-a496616bf3aa', 'A', 'Switch to zopiclone', false, 0),
  ('cb1b2af9-ef93-5925-8a5b-65d0683e5a9b', 'd8f1f12a-b12b-5d51-9609-a496616bf3aa', 'B', 'Gradual dose reduction over weeks to months (e.g. reduce by about 1/10-1/8 of the dose every 1-2 weeks)', true, 1),
  ('5384d251-53d0-5084-a297-b2c0cb725bbf', 'd8f1f12a-b12b-5d51-9609-a496616bf3aa', 'C', 'Admit for IV phenobarbitone', false, 2),
  ('2c36f62e-21e3-507f-bd11-5071dc4574b6', 'd8f1f12a-b12b-5d51-9609-a496616bf3aa', 'D', 'Stop immediately', false, 3),
  ('f703e702-a37f-5490-98fc-becceecdf025', 'd8f1f12a-b12b-5d51-9609-a496616bf3aa', 'E', 'Halve the dose every 2 days', false, 4);

-- Q205
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('fb1abd9a-0e43-55d9-83cc-edbce3ee0831', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000007', 'sba', 'A 50 year old smoker wants help to stop smoking. He has no history of seizures or psychiatric illness and wants to use medication. Which is generally the most effective single drug option?', 'Varenicline (a nicotine receptor partial agonist) is the most effective single drug for smoking cessation, ideally combined with behavioural support. Combination NRT (patch plus short-acting form) is similarly effective. Bupropion is an alternative (contraindicated in epilepsy and eating disorders). E-cigarettes are recognised as a cessation aid in the UK.', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v3')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = 'fb1abd9a-0e43-55d9-83cc-edbce3ee0831';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('3a5b3fae-9154-5bf1-8f46-b5947cc9db0b', 'fb1abd9a-0e43-55d9-83cc-edbce3ee0831', 'A', 'Varenicline, with behavioural support', true, 0),
  ('d91ac4b3-d6ae-59f4-9e46-c9d67c77bdf2', 'fb1abd9a-0e43-55d9-83cc-edbce3ee0831', 'B', 'Diazepam', false, 1),
  ('5ed605e5-5fc9-5f75-a7ae-29d109214acb', 'fb1abd9a-0e43-55d9-83cc-edbce3ee0831', 'C', 'Electronic cigarettes have no role', false, 2),
  ('c45fa800-4406-535e-a60f-e3b8e91b0900', 'fb1abd9a-0e43-55d9-83cc-edbce3ee0831', 'D', 'Nicotine patch alone without support', false, 3),
  ('f6a04f9a-bacc-5aa9-8074-6739ab3003e9', 'fb1abd9a-0e43-55d9-83cc-edbce3ee0831', 'E', 'Bupropion is contraindicated in all', false, 4);

-- Q206
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('75db0a9f-cef9-5d3b-8348-6176a3bbef15', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000007', 'sba', 'A 30 year old man has long-standing difficulty concentrating, impulsivity and disorganisation since childhood, affecting his work. He is diagnosed with ADHD by a specialist. Which drug is first-line for adults according to NICE?', 'NICE NG87 recommends lisdexamfetamine or methylphenidate as first-line drug treatment for adults with ADHD. Before starting, check height, weight, heart rate, BP and cardiovascular history. Monitor for side effects (appetite, sleep, BP, heart rate) and misuse. Atomoxetine is used if stimulants are not tolerated.', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v3')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = '75db0a9f-cef9-5d3b-8348-6176a3bbef15';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('dc2b62c1-d25f-5e8d-86f2-d47eaa8c1765', '75db0a9f-cef9-5d3b-8348-6176a3bbef15', 'A', 'Sertraline', false, 0),
  ('475f6c5f-d0ab-51d1-8d1f-1b2a7310de33', '75db0a9f-cef9-5d3b-8348-6176a3bbef15', 'B', 'Diazepam', false, 1),
  ('61a3d643-bbe2-5c94-a2fd-3df5b59a6240', '75db0a9f-cef9-5d3b-8348-6176a3bbef15', 'C', 'Risperidone', false, 2),
  ('d02a4e66-c26a-57be-aa5f-e0a2e57791c7', '75db0a9f-cef9-5d3b-8348-6176a3bbef15', 'D', 'Lisdexamfetamine or methylphenidate', true, 3),
  ('9b017d5a-4b40-5a49-a042-58f69df2bce1', '75db0a9f-cef9-5d3b-8348-6176a3bbef15', 'E', 'Atomoxetine always first-line', false, 4);

-- Q207
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('652aebeb-1ab0-5708-aa0d-c54fa0b1b69d', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000007', 'sba', 'A 14 year old boy has a 2-year history of repeatedly fighting, stealing, setting fires, staying out all night and cruelty to animals. What is the SINGLE most likely diagnosis?', 'Conduct disorder is a repetitive pattern of behaviour that violates others'' rights or age-appropriate rules (aggression, destruction of property, deceit, theft, serious rule violations). Oppositional defiant disorder is milder (defiant, angry, argumentative). Antisocial personality disorder can only be diagnosed at 18 or over. Parent training programmes and multisystemic therapy are used.', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v3')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = '652aebeb-1ab0-5708-aa0d-c54fa0b1b69d';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('47ac7db4-43b0-5902-91a4-76fc3840d375', '652aebeb-1ab0-5708-aa0d-c54fa0b1b69d', 'A', 'Antisocial personality disorder', false, 0),
  ('1868f1ee-4fd9-5a35-ad59-13c975763c47', '652aebeb-1ab0-5708-aa0d-c54fa0b1b69d', 'B', 'Oppositional defiant disorder', false, 1),
  ('ccf7dda4-523d-5040-a089-7df9e8271ad1', '652aebeb-1ab0-5708-aa0d-c54fa0b1b69d', 'C', 'Autism spectrum disorder', false, 2),
  ('8d8a4c8e-0a9e-5800-97bb-664a057f59fc', '652aebeb-1ab0-5708-aa0d-c54fa0b1b69d', 'D', 'Conduct disorder', true, 3),
  ('bf7b6472-8ca4-51e2-8226-4c8cba13aec7', '652aebeb-1ab0-5708-aa0d-c54fa0b1b69d', 'E', 'ADHD only', false, 4);

-- Q208
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('26b7f0e8-daf5-5372-81e2-cd3a44c0a6b3', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000007', 'sba', 'A 32 year old man has a long history of disregarding others'' rights, repeated criminal convictions, deceitfulness, impulsivity, aggression and lack of remorse. He had conduct disorder as a teenager. What is the SINGLE most likely diagnosis?', 'Antisocial personality disorder needs evidence of conduct disorder before 15. It is characterised by disregard for others, deceit, impulsivity, irritability and aggression, recklessness, irresponsibility and lack of remorse. NICE advises group-based cognitive and behavioural interventions. Drug treatment is used only for comorbid conditions.', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v3')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = '26b7f0e8-daf5-5372-81e2-cd3a44c0a6b3';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('698d2034-073d-54d2-a18e-546bb1055436', '26b7f0e8-daf5-5372-81e2-cd3a44c0a6b3', 'A', 'Paranoid personality disorder', false, 0),
  ('b1c55ca3-13f1-5a0b-853a-a1996fa38e95', '26b7f0e8-daf5-5372-81e2-cd3a44c0a6b3', 'B', 'Antisocial (dissocial) personality disorder', true, 1),
  ('999dd625-a19a-571a-9b4f-72cc0ad082d6', '26b7f0e8-daf5-5372-81e2-cd3a44c0a6b3', 'C', 'Narcissistic personality disorder', false, 2),
  ('7a627500-b37d-5a7a-98fe-2378864c9981', '26b7f0e8-daf5-5372-81e2-cd3a44c0a6b3', 'D', 'Schizoid personality disorder', false, 3),
  ('ebf86690-4e15-516d-b14d-d88d8470c161', '26b7f0e8-daf5-5372-81e2-cd3a44c0a6b3', 'E', 'Emotionally unstable personality disorder', false, 4);

-- Q209
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('e51e69be-bf3a-59d7-a1c3-263406ab82c5', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000007', 'sba', 'A 34 year old woman is extremely sensitive to criticism and avoids social contact and new activities because of fear of rejection, despite wanting relationships. What is the SINGLE most likely personality disorder?', 'Avoidant personality disorder: persistent tension, feelings of inferiority, fear of criticism and rejection, and avoidance of social contact despite wanting it. Schizoid personality disorder involves emotional coldness and a preference for solitary activity, with no desire for relationships. Dependent personality disorder involves excessive reliance on others to make decisions.', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v3')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = 'e51e69be-bf3a-59d7-a1c3-263406ab82c5';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('5907161f-0084-55b0-a097-37990cd3c65a', 'e51e69be-bf3a-59d7-a1c3-263406ab82c5', 'A', 'Schizoid personality disorder', false, 0),
  ('0fcb3300-5dda-58bb-b61e-b4f2e7a6504f', 'e51e69be-bf3a-59d7-a1c3-263406ab82c5', 'B', 'Avoidant (anxious) personality disorder', true, 1),
  ('34a5c5c9-a745-5db3-914c-5f474ce01f9f', 'e51e69be-bf3a-59d7-a1c3-263406ab82c5', 'C', 'Paranoid personality disorder', false, 2),
  ('03c9a5f8-e241-57f7-920a-0bdaf4765880', 'e51e69be-bf3a-59d7-a1c3-263406ab82c5', 'D', 'Dependent personality disorder', false, 3),
  ('171fd96c-427b-54e5-a868-6ede6a167c3f', 'e51e69be-bf3a-59d7-a1c3-263406ab82c5', 'E', 'Histrionic personality disorder', false, 4);

-- Q210
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('128961bf-b94b-5746-a03b-6e3c65370081', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000007', 'sba', 'A 40 year old man lost his job 6 weeks ago. Since then he has felt low, anxious and has had trouble sleeping, but he does not meet criteria for a depressive episode. His symptoms are improving. What is the SINGLE most likely diagnosis?', 'Adjustment disorder is emotional or behavioural distress in response to an identifiable stressor, starting within about 1 month (ICD-11), that does not meet criteria for another disorder, and usually resolves within 6 months as the person adapts. Management is supportive (problem-solving, counselling). Monitor for depression and suicide risk.', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v3')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = '128961bf-b94b-5746-a03b-6e3c65370081';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('334815d9-9cfc-5ad5-a9d7-36511384f962', '128961bf-b94b-5746-a03b-6e3c65370081', 'A', 'Major depressive disorder', false, 0),
  ('fe12df56-9302-534e-ae42-e6e978f8e226', '128961bf-b94b-5746-a03b-6e3c65370081', 'B', 'Adjustment disorder', true, 1),
  ('578d45b5-f5ce-516f-bf22-6e20be28a591', '128961bf-b94b-5746-a03b-6e3c65370081', 'C', 'Dysthymia', false, 2),
  ('b5a08683-9e58-5496-b3dc-a3bce6ebd6d7', '128961bf-b94b-5746-a03b-6e3c65370081', 'D', 'Generalised anxiety disorder', false, 3),
  ('67ce8b73-ef99-5b09-8f15-ed322a3aabfb', '128961bf-b94b-5746-a03b-6e3c65370081', 'E', 'Post-traumatic stress disorder', false, 4);

-- Q211
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('f898dce9-9763-5db8-98c4-2ed06e3d47bf', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000007', 'sba', 'A 26 year old woman has had low-grade low mood most days for over 2 years, never severe enough for a major depressive episode. She feels inadequate and has low energy. What is the SINGLE most likely diagnosis?', 'Dysthymia (persistent depressive disorder) is chronic, low-grade depressive symptoms for at least 2 years. Cyclothymia is chronic mood instability with periods of mild elation and mild depression. Treatment is psychological therapy and/or antidepressants. ''Double depression'' is a major depressive episode on top of dysthymia.', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v3')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = 'f898dce9-9763-5db8-98c4-2ed06e3d47bf';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('a4711555-762a-5524-9bc6-d9d2487467f7', 'f898dce9-9763-5db8-98c4-2ed06e3d47bf', 'A', 'Persistent depressive disorder (dysthymia)', true, 0),
  ('8b8cf7b5-5a82-54d3-8621-7b1af9746429', 'f898dce9-9763-5db8-98c4-2ed06e3d47bf', 'B', 'Adjustment disorder', false, 1),
  ('34f523e9-2549-5102-ae13-d07e46cfcb88', 'f898dce9-9763-5db8-98c4-2ed06e3d47bf', 'C', 'Cyclothymia', false, 2),
  ('d7983944-bf13-552f-882a-f20e8b0a3475', 'f898dce9-9763-5db8-98c4-2ed06e3d47bf', 'D', 'Bipolar II disorder', false, 3),
  ('452ec9cf-de4b-5add-bf2b-831c460da1ae', 'f898dce9-9763-5db8-98c4-2ed06e3d47bf', 'E', 'Seasonal affective disorder', false, 4);

-- Q212
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('e74db636-6f22-5bc9-b354-a56202427b8b', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000007', 'sba', 'A 32 year old woman with bipolar disorder has had several weeks of hypomania-like episodes alternating with depression, but has never had a full manic episode. What is the SINGLE most likely diagnosis?', 'Bipolar I requires at least one manic episode (severe, more than 1 week, or needing hospital admission, possibly with psychosis). Bipolar II has hypomanic episodes (less severe, at least 4 days, no psychosis) plus major depressive episodes. Depression is often the dominant phase in bipolar II. Antidepressant monotherapy risks switching into mania.', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v3')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = 'e74db636-6f22-5bc9-b354-a56202427b8b';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('cc26ea34-ad98-5345-81c1-fce75209466d', 'e74db636-6f22-5bc9-b354-a56202427b8b', 'A', 'Bipolar I disorder', false, 0),
  ('9b55cf78-9960-5fb6-8e62-994a2f471944', 'e74db636-6f22-5bc9-b354-a56202427b8b', 'B', 'Cyclothymia', false, 1),
  ('b1fdce28-e815-54ee-84c4-4b317bbf96c3', 'e74db636-6f22-5bc9-b354-a56202427b8b', 'C', 'Schizoaffective disorder', false, 2),
  ('4f483841-0117-59c2-aa4a-0dddd9882467', 'e74db636-6f22-5bc9-b354-a56202427b8b', 'D', 'Bipolar II disorder', true, 3),
  ('c5445a7e-deeb-54d4-846f-19c6ca235200', 'e74db636-6f22-5bc9-b354-a56202427b8b', 'E', 'Borderline personality disorder', false, 4);

-- Q213
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('9a4c24f2-c93a-5851-ae9c-28a7889026d4', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000007', 'sba', 'A 30 year old man with a first episode of psychosis is started on an antipsychotic. Which baseline investigation is MOST important before starting?', 'NICE CG178: before starting antipsychotics, record weight, waist circumference, pulse and BP, fasting glucose or HbA1c, lipids and prolactin, and do an ECG if there are cardiovascular risk factors or the drug''s SPC requires it. Monitor metabolic risks at 12 weeks and then annually. Antipsychotics cause weight gain, diabetes, dyslipidaemia, hyperprolactinaemia and QT prolongation.', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v3')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = '9a4c24f2-c93a-5851-ae9c-28a7889026d4';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('d9f74345-3a84-5180-998a-5fe03c7caf64', '9a4c24f2-c93a-5851-ae9c-28a7889026d4', 'A', 'MRI brain in all cases', false, 0),
  ('ec7ced07-6d58-54a3-a657-ded24e318255', '9a4c24f2-c93a-5851-ae9c-28a7889026d4', 'B', 'Lumbar puncture', false, 1),
  ('c54ab5b4-ac00-5b00-b0ab-b1fe66ab15d9', '9a4c24f2-c93a-5851-ae9c-28a7889026d4', 'C', 'EEG', false, 2),
  ('0aa9f046-176c-5998-8c87-63999738659a', '9a4c24f2-c93a-5851-ae9c-28a7889026d4', 'D', 'Thyroid ultrasound', false, 3),
  ('90f30f43-9ff2-559a-9139-1fc2cf45bbcc', '9a4c24f2-c93a-5851-ae9c-28a7889026d4', 'E', 'ECG, weight/BMI, waist circumference, BP, glucose/HbA1c, lipids and prolactin', true, 4);

-- Q214
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('f7007e7b-4d04-5fe3-83b9-3795486e681a', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000007', 'sba', 'A 28 year old woman with schizophrenia takes risperidone. She has had no periods for 6 months and has galactorrhoea. Her pregnancy test is negative. What is the SINGLE most likely cause?', 'Antipsychotics that block D2 receptors (especially risperidone, amisulpride and first-generation drugs) raise prolactin, causing amenorrhoea, galactorrhoea, sexual dysfunction and reduced bone density. Check prolactin and exclude other causes (pregnancy, hypothyroidism, prolactinoma if very high). Consider switching to a prolactin-sparing drug (aripiprazole, or adding low-dose aripiprazole).', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v3')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = 'f7007e7b-4d04-5fe3-83b9-3795486e681a';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('b81763b1-1c21-5c59-b871-5553d6c5b86f', 'f7007e7b-4d04-5fe3-83b9-3795486e681a', 'A', 'Hypothyroidism', false, 0),
  ('d98d690c-f68c-5711-8c80-be1787c8e494', 'f7007e7b-4d04-5fe3-83b9-3795486e681a', 'B', 'Premature ovarian insufficiency', false, 1),
  ('499f5363-b2db-51d3-ac42-6b874a342668', 'f7007e7b-4d04-5fe3-83b9-3795486e681a', 'C', 'Pituitary macroadenoma (most likely)', false, 2),
  ('ad0bc83f-8708-5611-891c-7ee8e5f4ef9c', 'f7007e7b-4d04-5fe3-83b9-3795486e681a', 'D', 'Polycystic ovary syndrome', false, 3),
  ('88c3e454-9594-5ec9-a23b-4e32b173ed16', 'f7007e7b-4d04-5fe3-83b9-3795486e681a', 'E', 'Antipsychotic-induced hyperprolactinaemia', true, 4);

-- Q215
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('8174b38e-90a1-5bd9-aea6-d77d41316f5c', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000007', 'sba', 'A 35 year old woman with depression is assessed after an overdose. Which factor is MOST strongly associated with an increased risk of eventual suicide?', 'Previous self-harm is one of the strongest predictors of suicide (risk is highest in the first year). Other risk factors include male sex, older age, living alone, unemployment, mental illness (especially depression, psychosis, substance misuse), chronic illness, recent loss, and access to means. NICE advises against risk scales to predict suicide. Focus on needs-based assessment and safety planning.', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v3')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = '8174b38e-90a1-5bd9-aea6-d77d41316f5c';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('bae648f8-bd71-5185-8691-7aa11eb262ac', '8174b38e-90a1-5bd9-aea6-d77d41316f5c', 'A', 'Female sex', false, 0),
  ('83fdfbe2-3814-5b0e-b5cf-70370a1e1f98', '8174b38e-90a1-5bd9-aea6-d77d41316f5c', 'B', 'Previous self-harm', true, 1),
  ('489be232-ba2f-5b12-afbb-b9fef636ebea', '8174b38e-90a1-5bd9-aea6-d77d41316f5c', 'C', 'Having children', false, 2),
  ('03d7a564-36a4-52e3-b617-a8e97895b83b', '8174b38e-90a1-5bd9-aea6-d77d41316f5c', 'D', 'Being in employment', false, 3),
  ('25302b6b-77ef-5ed4-835a-19e8b322c8e6', '8174b38e-90a1-5bd9-aea6-d77d41316f5c', 'E', 'Being married', false, 4);

-- Q216
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('391e8429-7a90-5eaa-8a08-4dbf5bba26b4', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000007', 'sba', 'A 72 year old man is in hospital after a hip fracture. On day 2 he is quiet, withdrawn, sleepy and has poor attention, but no agitation. His family say he is ''not himself''. What is the SINGLE most likely diagnosis?', 'Hypoactive delirium is common, often missed, and has a worse prognosis than hyperactive delirium. It presents with withdrawal, drowsiness, reduced activity and inattention. Screen with the 4AT. Look for causes (infection, pain, drugs, retention, constipation, electrolytes, hypoxia) and use non-drug management. Delirium is acute and fluctuating with inattention, whereas dementia is chronic.', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v3')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = '391e8429-7a90-5eaa-8a08-4dbf5bba26b4';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('d8b242b8-a13e-5a25-a8a3-8b8145b146fd', '391e8429-7a90-5eaa-8a08-4dbf5bba26b4', 'A', 'Hypoactive delirium', true, 0),
  ('c5d3f4c6-8ffb-5daf-bb8e-007c3d3ae1ce', '391e8429-7a90-5eaa-8a08-4dbf5bba26b4', 'B', 'Catatonic schizophrenia', false, 1),
  ('4a873341-94b2-521e-9fd5-b75ecbb6635f', '391e8429-7a90-5eaa-8a08-4dbf5bba26b4', 'C', 'Normal post-operative recovery', false, 2),
  ('f97c5ee7-ce6a-5437-832f-6263f6ccc6e4', '391e8429-7a90-5eaa-8a08-4dbf5bba26b4', 'D', 'Depression', false, 3),
  ('61c55c1c-ac4e-52d4-a781-21abcdc887ae', '391e8429-7a90-5eaa-8a08-4dbf5bba26b4', 'E', 'Dementia progression', false, 4);

-- Q217
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('34c1c1d1-11a1-59dc-8544-0bdb85d6cfa4', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000007', 'sba', 'A nurse on a psychiatric ward is concerned that a voluntary inpatient with severe depression wants to leave immediately and is a risk to himself. No doctor is available on the ward. Which power allows the nurse to hold him for up to 6 hours?', 'Section 5(4) allows a qualified mental health or learning disability nurse to detain a voluntary inpatient receiving treatment for mental disorder for up to 6 hours, until a doctor can assess. Section 5(2) is the doctor''s holding power (up to 72 hours). Section 4 is an emergency 72-hour admission when waiting for a second doctor would cause undesirable delay.', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v3')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = '34c1c1d1-11a1-59dc-8544-0bdb85d6cfa4';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('c169b17c-0185-590c-8cd7-031e454fbfbb', '34c1c1d1-11a1-59dc-8544-0bdb85d6cfa4', 'A', 'Section 5(4) of the Mental Health Act (nurse''s holding power)', true, 0),
  ('e27083a0-dbf6-51c4-98a2-c6544e985a0a', '34c1c1d1-11a1-59dc-8544-0bdb85d6cfa4', 'B', 'Section 5(2)', false, 1),
  ('c1396e09-439f-5e1e-842a-ae2596207f32', '34c1c1d1-11a1-59dc-8544-0bdb85d6cfa4', 'C', 'Section 4', false, 2),
  ('2007000a-90d9-5556-b8ef-9aa24d43708b', '34c1c1d1-11a1-59dc-8544-0bdb85d6cfa4', 'D', 'Section 136', false, 3),
  ('6afbe327-39c2-5640-ada0-14c5aa8fd65b', '34c1c1d1-11a1-59dc-8544-0bdb85d6cfa4', 'E', 'Section 2', false, 4);

-- Q218
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('c3b6fab5-0dd4-5766-b8b9-8a5b133fbcc7', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000007', 'sba', 'A man with schizophrenia is convicted of a serious offence. The court orders his detention in hospital for treatment instead of prison. Which section of the Mental Health Act applies?', 'Part III of the Mental Health Act covers patients involved in criminal proceedings. Section 37 is a hospital order made by a court for a convicted offender, often with a section 41 restriction order. Sections 35 and 36 allow remand to hospital for reports or treatment. Section 135 allows police to enter premises with a warrant to remove someone to a place of safety.', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v3')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = 'c3b6fab5-0dd4-5766-b8b9-8a5b133fbcc7';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('00c7090e-4f6e-5ab0-879a-6430a2cc5b9e', 'c3b6fab5-0dd4-5766-b8b9-8a5b133fbcc7', 'A', 'Section 136', false, 0),
  ('744568ff-a3c7-5bf1-8b13-24bc93be071a', 'c3b6fab5-0dd4-5766-b8b9-8a5b133fbcc7', 'B', 'Section 135', false, 1),
  ('8dbb094c-6320-5446-a382-46ca2e5e5a18', 'c3b6fab5-0dd4-5766-b8b9-8a5b133fbcc7', 'C', 'Section 2', false, 2),
  ('ac4db8a7-3e10-5b79-a01d-e70d1c30f861', 'c3b6fab5-0dd4-5766-b8b9-8a5b133fbcc7', 'D', 'Section 3', false, 3),
  ('3547cf9e-d13a-5469-9c31-9ac57945e196', 'c3b6fab5-0dd4-5766-b8b9-8a5b133fbcc7', 'E', 'Section 37 (hospital order)', true, 4);

-- Q219
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('9671049f-1c31-52e1-83ed-2e7df03ee4a6', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000007', 'sba', 'A 30 year old man with schizophrenia has had several admissions because he stops his medication after discharge. He is being discharged from a section 3. What can be used to require him to accept treatment in the community, with recall to hospital if needed?', 'A CTO can be used for patients discharged from section 3 (or some forensic sections). It sets conditions (such as taking medication and attending appointments) and allows recall to hospital for up to 72 hours if needed. It cannot force medication in the community. Guardianship (section 7) gives powers over where someone lives.', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v3')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = '9671049f-1c31-52e1-83ed-2e7df03ee4a6';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('90495276-d518-51b1-b9e4-42d1baa40137', '9671049f-1c31-52e1-83ed-2e7df03ee4a6', 'A', 'Section 5(2)', false, 0),
  ('eb5f2113-f967-537f-adc5-f816b0e727c3', '9671049f-1c31-52e1-83ed-2e7df03ee4a6', 'B', 'Guardianship under section 135', false, 1),
  ('05ea0bd1-a403-532b-b120-0e954d2e6761', '9671049f-1c31-52e1-83ed-2e7df03ee4a6', 'C', 'A Community Treatment Order (CTO, section 17A)', true, 2),
  ('ac3dedc7-4b15-55ff-b1c3-000bc3fb5d07', '9671049f-1c31-52e1-83ed-2e7df03ee4a6', 'D', 'Section 2', false, 3),
  ('3c399b24-758d-5879-9d0b-259138aea24e', '9671049f-1c31-52e1-83ed-2e7df03ee4a6', 'E', 'Section 136', false, 4);

-- Q220
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('2c4428d1-8f5e-5cf1-96ce-fa4568110248', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000002', 'sba', 'A 68 year old man with COPD has an exacerbation with increased breathlessness and increased purulent sputum. He is managed at home. What is the SINGLE most appropriate antibiotic choice, if indicated?', 'NICE NG114: consider antibiotics for a COPD exacerbation based on severity, sputum colour change and increased volume, previous cultures and risk of complications. First-line oral choices are amoxicillin, doxycycline or clarithromycin for 5 days. Also give oral prednisolone 30 mg for 5 days and increase bronchodilator use.', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v3')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = '2c4428d1-8f5e-5cf1-96ce-fa4568110248';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('2dd9c2c6-97db-5481-acd6-d7df80bd8731', '2c4428d1-8f5e-5cf1-96ce-fa4568110248', 'A', 'No antibiotics are ever needed', false, 0),
  ('3bcafb39-0131-5ed1-b9d5-dad2a8b9e168', '2c4428d1-8f5e-5cf1-96ce-fa4568110248', 'B', 'Nitrofurantoin', false, 1),
  ('88fa1108-093b-5444-ae23-fb71fdec7585', '2c4428d1-8f5e-5cf1-96ce-fa4568110248', 'C', 'Amoxicillin (or doxycycline or clarithromycin) for 5 days', true, 2),
  ('af7c41a0-e03d-50dc-8873-1268a0524812', '2c4428d1-8f5e-5cf1-96ce-fa4568110248', 'D', 'IV meropenem', false, 3),
  ('e6e44801-0969-5876-b9df-3bab213a79be', '2c4428d1-8f5e-5cf1-96ce-fa4568110248', 'E', 'Ciprofloxacin for all', false, 4);

-- Q221
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('19fc9fce-bc82-520c-a9cc-3c040db21a30', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000002', 'sba', 'A 72 year old man with known COPD and previous hypercapnic respiratory failure is brought in by ambulance breathless. What oxygen saturation target is MOST appropriate until blood gases are available?', 'BTS guidance: in patients at risk of hypercapnic respiratory failure (COPD, morbid obesity, neuromuscular disease, chest wall deformity), target 88-92% using controlled oxygen. Too much oxygen can worsen CO2 retention and acidosis. Check ABG. For most other acutely ill patients the target is 94-98%.', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v3')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = '19fc9fce-bc82-520c-a9cc-3c040db21a30';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('299d1267-f9d3-53dd-9d66-87808481ccc4', '19fc9fce-bc82-520c-a9cc-3c040db21a30', 'A', '94-98% with a non-rebreather mask', false, 0),
  ('f05a6ea0-6844-5f44-ba16-d6b85496e42b', '19fc9fce-bc82-520c-a9cc-3c040db21a30', 'B', '100% oxygen at 15 L/min', false, 1),
  ('0b013803-2b26-51c8-93f2-2acb16f43e1a', '19fc9fce-bc82-520c-a9cc-3c040db21a30', 'C', '88-92%, using controlled oxygen (e.g. Venturi mask 24-28%)', true, 2),
  ('9f695ee4-297a-5674-8456-d3eccb2cc35d', '19fc9fce-bc82-520c-a9cc-3c040db21a30', 'D', '80-85%', false, 3),
  ('6a05bc3e-d44a-5d14-bd27-3694e27cebae', '19fc9fce-bc82-520c-a9cc-3c040db21a30', 'E', 'No oxygen until the ABG is back', false, 4);

-- Q222
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('4181d15c-8ea5-5bc4-b613-fa47c0ae61d4', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000002', 'sba', 'A 40 year old man is on standard treatment for pulmonary TB. After 2 months he has numbness and tingling in his feet. Which drug is MOST likely responsible, and how could it have been prevented?', 'Isoniazid causes peripheral neuropathy (prevented with pyridoxine) and hepatitis. Rifampicin causes orange body fluids, hepatitis and enzyme induction (reducing the effect of the pill and warfarin). Pyrazinamide causes hepatitis, gout and arthralgia. Ethambutol causes optic neuritis (check visual acuity and colour vision before starting).', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v3')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = '4181d15c-8ea5-5bc4-b613-fa47c0ae61d4';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('bc0cf901-005e-5007-ab7d-25459be8e358', '4181d15c-8ea5-5bc4-b613-fa47c0ae61d4', 'A', 'Pyrazinamide; give vitamin D', false, 0),
  ('5f096d0a-2ee8-5d49-b7d6-ad75c211f648', '4181d15c-8ea5-5bc4-b613-fa47c0ae61d4', 'B', 'Rifampicin; give folic acid', false, 1),
  ('c3429757-8815-5c6c-80c3-25888152560e', '4181d15c-8ea5-5bc4-b613-fa47c0ae61d4', 'C', 'Isoniazid; give pyridoxine (vitamin B6) prophylaxis', true, 2),
  ('a97c282a-69a6-5aa4-be8b-ed268c5087d7', '4181d15c-8ea5-5bc4-b613-fa47c0ae61d4', 'D', 'Ethambutol; give vitamin B12', false, 3),
  ('e6d93e8c-d34a-5342-901f-96602124c21c', '4181d15c-8ea5-5bc4-b613-fa47c0ae61d4', 'E', 'Rifampicin; give vitamin K', false, 4);

-- Q223
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('5425e448-186f-58a3-97e0-b73d67c09361', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000002', 'sba', 'A 30 year old man starts TB treatment. Which drug requires a baseline check of visual acuity and colour vision?', 'Ethambutol can cause optic neuritis with reduced visual acuity and red-green colour blindness. Check visual acuity (Snellen) and colour vision before starting, and advise patients to stop and report any visual change. It is used with care in renal impairment and young children.', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v3')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = '5425e448-186f-58a3-97e0-b73d67c09361';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('4c053e8d-9935-55dc-80a8-e3ce07dc199b', '5425e448-186f-58a3-97e0-b73d67c09361', 'A', 'Pyrazinamide', false, 0),
  ('336bcf8b-2e7a-5b22-8c8e-a0cfb727c23b', '5425e448-186f-58a3-97e0-b73d67c09361', 'B', 'Ethambutol', true, 1),
  ('9f32c261-63f7-5e6f-8d5c-d3e32aa78c06', '5425e448-186f-58a3-97e0-b73d67c09361', 'C', 'Pyridoxine', false, 2),
  ('c0e8b20b-aaab-5095-bd9d-ba2debd249a6', '5425e448-186f-58a3-97e0-b73d67c09361', 'D', 'Rifampicin', false, 3),
  ('f8794dab-ef36-515c-8393-7c112732021e', '5425e448-186f-58a3-97e0-b73d67c09361', 'E', 'Isoniazid', false, 4);

-- Q224
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('959bc478-9853-563c-8ed3-83effca8571c', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000002', 'sba', 'A 64 year old man has a CT chest for weight loss. It shows multiple bilateral calcified pleural plaques. He worked with asbestos 30 years ago. Lung function is normal. What is the SINGLE most appropriate statement?', 'Pleural plaques are the most common sign of asbestos exposure. They are benign and asymptomatic, and do not turn into mesothelioma, but the exposure itself raises the risk of mesothelioma, lung cancer and asbestosis. Advise stopping smoking, as smoking and asbestos multiply lung cancer risk. In some cases, he may be eligible for compensation.', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v3')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = '959bc478-9853-563c-8ed3-83effca8571c';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('d45e57fb-1dec-5872-8cc2-3fba385b5833', '959bc478-9853-563c-8ed3-83effca8571c', 'A', 'He has mesothelioma', false, 0),
  ('a5825f1b-b27d-50c4-a3d3-d0f54ce33ee8', '959bc478-9853-563c-8ed3-83effca8571c', 'B', 'He has asbestosis requiring steroids', false, 1),
  ('2db032c0-d511-5dae-a765-93ed481e78f9', '959bc478-9853-563c-8ed3-83effca8571c', 'C', 'He needs long-term oxygen', false, 2),
  ('8f36442d-5d1a-5038-96d6-984d3d983214', '959bc478-9853-563c-8ed3-83effca8571c', 'D', 'Pleural plaques are premalignant and need resection', false, 3),
  ('0b5a00d8-5b9e-559b-8bd7-7333583e9b5c', '959bc478-9853-563c-8ed3-83effca8571c', 'E', 'Pleural plaques are benign and do not become malignant, but they indicate asbestos exposure', true, 4);

-- Q225
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('0fa87031-171e-574e-9119-39fe00eb9744', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000002', 'sba', 'A 66 year old man has a pleural infection. A pleural aspirate shows turbid fluid with pH 7.05, glucose low and Gram-positive cocci on staining. What is the SINGLE most appropriate management?', 'Complicated parapneumonic effusion or empyema (pus, positive Gram stain or culture, or pH below 7.2) needs chest drain insertion and antibiotics. Intrapleural tPA with DNase (MIST2) can help drainage. Surgery (VATS decortication) is used if drainage fails.', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v3')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = '0fa87031-171e-574e-9119-39fe00eb9744';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('3484082b-9c8f-54b5-a3cd-da2133650c6d', '0fa87031-171e-574e-9119-39fe00eb9744', 'A', 'Insert a chest drain for drainage, plus IV antibiotics', true, 0),
  ('b2f3866f-bbbd-518c-9eb8-c7aec64ba39a', '0fa87031-171e-574e-9119-39fe00eb9744', 'B', 'Therapeutic aspiration only and discharge', false, 1),
  ('9e569b11-446c-5764-988b-098eb6a7d57c', '0fa87031-171e-574e-9119-39fe00eb9744', 'C', 'Oral antibiotics alone', false, 2),
  ('e145dd1a-11a0-5301-8c8a-0d1b73db0765', '0fa87031-171e-574e-9119-39fe00eb9744', 'D', 'Talc pleurodesis now', false, 3),
  ('347d53ee-e4d9-5789-9452-e25e9d56d47b', '0fa87031-171e-574e-9119-39fe00eb9744', 'E', 'Observation', false, 4);

-- Q226
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('5428a1fb-ef9b-5dca-8d17-50d86e4b0cb9', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000002', 'sba', 'A 50 year old man with alcohol dependence has had fever, weight loss and a cough with foul-smelling sputum for 3 weeks. Chest X-ray shows a cavity with an air-fluid level in the right lower lobe. What is the SINGLE most likely diagnosis?', 'Lung abscesses often follow aspiration (alcohol, seizures, poor dentition), affecting the posterior segments of the upper lobes or the apical segments of the lower lobes (more often on the right). Organisms are mixed anaerobes and Staph aureus or Klebsiella. Treatment is prolonged antibiotics (co-amoxiclav or clindamycin) and postural drainage. Exclude TB and a cavitating tumour.', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v3')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = '5428a1fb-ef9b-5dca-8d17-50d86e4b0cb9';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('9f399a99-8714-54d0-b442-9b317cfb4e69', '5428a1fb-ef9b-5dca-8d17-50d86e4b0cb9', 'A', 'Lung abscess (often after aspiration)', true, 0),
  ('684a1e38-9584-59f7-a21d-cb55417676e6', '5428a1fb-ef9b-5dca-8d17-50d86e4b0cb9', 'B', 'Pneumothorax', false, 1),
  ('69f350d3-d2f5-5db9-9ccc-854a1a3fccf1', '5428a1fb-ef9b-5dca-8d17-50d86e4b0cb9', 'C', 'Bronchiectasis', false, 2),
  ('df2df773-4d27-5711-9a71-543c830bf86e', '5428a1fb-ef9b-5dca-8d17-50d86e4b0cb9', 'D', 'Pulmonary tuberculosis', false, 3),
  ('b9de1a20-14d7-54db-a947-3d47889e5619', '5428a1fb-ef9b-5dca-8d17-50d86e4b0cb9', 'E', 'Squamous cell carcinoma only', false, 4);

-- Q227
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('54418c07-9847-5ce0-a683-d7acd8e1a8b8', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000002', 'sba', 'A 70 year old woman with COPD has an ABG on air: pH 7.32, PaCO2 7.8 kPa, PaO2 7.2 kPa, bicarbonate 34 mmol/L. How should this be interpreted?', 'PaO2 below 8 kPa with raised PaCO2 is type 2 respiratory failure. The low pH with a raised bicarbonate shows chronic CO2 retention with renal compensation, plus an acute rise causing acidosis. NIV is indicated if pH is below 7.35 and PaCO2 above 6.5 kPa persists despite optimal medical treatment.', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v3')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = '54418c07-9847-5ce0-a683-d7acd8e1a8b8';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('2dfe0a99-0fc7-58d5-a93a-b4d643be65c8', '54418c07-9847-5ce0-a683-d7acd8e1a8b8', 'A', 'Type 1 respiratory failure', false, 0),
  ('5fcd836e-c47f-5525-893e-6e8b6e70ed67', '54418c07-9847-5ce0-a683-d7acd8e1a8b8', 'B', 'Metabolic alkalosis', false, 1),
  ('ad22f952-beac-547c-a485-d01d83a52af6', '54418c07-9847-5ce0-a683-d7acd8e1a8b8', 'C', 'Type 2 respiratory failure: acute-on-chronic respiratory acidosis (with partial metabolic compensation)', true, 2),
  ('78de8b34-c1f3-58d5-9a41-654134d03b26', '54418c07-9847-5ce0-a683-d7acd8e1a8b8', 'D', 'Metabolic acidosis', false, 3),
  ('f3dc70a7-9e7f-5247-9180-02829de8d8f4', '54418c07-9847-5ce0-a683-d7acd8e1a8b8', 'E', 'Fully compensated chronic respiratory acidosis', false, 4);

-- Q228
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('496b427e-8e4c-531e-a8eb-4165994ab484', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000002', 'sba', 'A 50 year old man has breathlessness. Spirometry shows FEV1 60% predicted, FVC 62% predicted and an FEV1/FVC ratio of 0.82. His transfer factor (TLCO) is reduced. What pattern does this suggest?', 'An FEV1/FVC ratio of 0.7 or more with a reduced FVC suggests restriction. Reduced TLCO points to interstitial lung disease (or pulmonary vascular disease). Extrapulmonary restriction (obesity, chest wall or neuromuscular disease) usually has a normal or high KCO. Obstruction gives a ratio below 0.7. TLCO is increased in pulmonary haemorrhage and asthma.', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v3')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = '496b427e-8e4c-531e-a8eb-4165994ab484';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('c1f08d29-7ad1-590e-8137-2a772bb8edcb', '496b427e-8e4c-531e-a8eb-4165994ab484', 'A', 'Normal spirometry', false, 0),
  ('2a2477f1-79c1-5f49-8ea6-66170f8b92ca', '496b427e-8e4c-531e-a8eb-4165994ab484', 'B', 'A restrictive pattern with normal gas transfer from obesity only', false, 1),
  ('a16a16d2-8b89-565b-b165-c1c0db60c93f', '496b427e-8e4c-531e-a8eb-4165994ab484', 'C', 'Upper airway obstruction', false, 2),
  ('1ada978e-eb89-58c1-bc11-4d647661a7af', '496b427e-8e4c-531e-a8eb-4165994ab484', 'D', 'A restrictive pattern with reduced gas transfer (e.g. interstitial lung disease)', true, 3),
  ('699b74d2-fb64-52a7-b540-e8b668388aa2', '496b427e-8e4c-531e-a8eb-4165994ab484', 'E', 'An obstructive pattern (e.g. COPD)', false, 4);

-- Q229
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('e2f14790-5544-5acf-892d-9d13f43c43dc', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000002', 'sba', 'A 60 year old man with lung cancer is coughing up large amounts of fresh blood (about 300 mL in an hour). He is maintaining his airway. What is the SINGLE most appropriate immediate step?', 'Massive haemoptysis is life-threatening because of asphyxiation. Position the patient with the bleeding side down to protect the good lung. Give oxygen, IV access, cross-match, correct clotting, and consider tranexamic acid. Urgent CT angiography, bronchoscopy and bronchial artery embolisation are needed. In palliative cases, use crisis medication (midazolam) and dark towels.', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v3')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = 'e2f14790-5544-5acf-892d-9d13f43c43dc';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('fc70767a-9951-59ef-b751-03eb3d32816d', 'e2f14790-5544-5acf-892d-9d13f43c43dc', 'A', 'Lie him on the unaffected side', false, 0),
  ('a57ab7e2-e7fd-5266-86ce-63937fe20d14', 'e2f14790-5544-5acf-892d-9d13f43c43dc', 'B', 'Give oral codeine only', false, 1),
  ('ba0c2f5d-6c66-5fbb-9e56-98a9d8de5940', 'e2f14790-5544-5acf-892d-9d13f43c43dc', 'C', 'Sit him upright and discharge', false, 2),
  ('1d8a2250-c945-54fd-95a3-0462e7831628', 'e2f14790-5544-5acf-892d-9d13f43c43dc', 'D', 'Nebulised salbutamol', false, 3),
  ('a72e4749-8699-5653-8de5-62c4057f589a', 'e2f14790-5544-5acf-892d-9d13f43c43dc', 'E', 'Lie him on the side of the bleeding lung (if known), give oxygen, secure IV access and arrange urgent bronchoscopy/bronchial artery embolisation', true, 4);

-- Q230
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('346b2a24-882d-5d08-afa2-860be802434b', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000002', 'sba', 'A 45 year old woman develops influenza in the community during a period when influenza is circulating. She is at high risk because of poorly controlled diabetes, and presents within 36 hours of symptom onset. What is the SINGLE most appropriate treatment?', 'NICE TA168 and UKHSA guidance: when influenza is circulating, offer antivirals (oseltamivir, or zanamivir) to people in at-risk groups (such as chronic illness, diabetes, immunosuppression, pregnancy, over 65s) within 48 hours of symptom onset. Annual vaccination is the main prevention.', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v3')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = '346b2a24-882d-5d08-afa2-860be802434b';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('4032f872-fc63-5d0c-a12c-618846eeb663', '346b2a24-882d-5d08-afa2-860be802434b', 'A', 'Oral oseltamivir (antiviral) for 5 days', true, 0),
  ('86901985-5874-5288-8af8-6d2c2eaaa8fc', '346b2a24-882d-5d08-afa2-860be802434b', 'B', 'Oral amoxicillin', false, 1),
  ('cf33e9d4-9765-5ac8-a135-f1223564557e', '346b2a24-882d-5d08-afa2-860be802434b', 'C', 'Aciclovir', false, 2),
  ('6a471d81-3889-5a50-b0f1-842fc5a63622', '346b2a24-882d-5d08-afa2-860be802434b', 'D', 'Oral prednisolone', false, 3),
  ('5c6d2d14-bf13-5b5e-a864-248c4b5cf99d', '346b2a24-882d-5d08-afa2-860be802434b', 'E', 'No treatment; antivirals only help healthy people', false, 4);

-- Q231
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('d24089f9-a83b-5b68-b30d-6d23de8f6a60', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000002', 'sba', 'A 34 year old baker has had wheeze and breathlessness for a year. His symptoms are worse at work and improve on holidays. What is the SINGLE most appropriate investigation to support the diagnosis?', 'Occupational asthma (flour, isocyanates in spray paint, latex, wood dust, laboratory animals) improves away from work. Confirm with serial peak flow readings (at least 4 times a day for 3-4 weeks), and refer to an occupational asthma specialist. Early removal from exposure gives the best outcome. Occupational asthma may be eligible for industrial injuries compensation.', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v3')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = 'd24089f9-a83b-5b68-b30d-6d23de8f6a60';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('9beba538-0343-553e-b72c-0a210caa02c4', 'd24089f9-a83b-5b68-b30d-6d23de8f6a60', 'A', 'Allergy skin testing only', false, 0),
  ('7d16aef0-f4ae-5978-b6cb-953eecfd69ec', 'd24089f9-a83b-5b68-b30d-6d23de8f6a60', 'B', 'Sweat test', false, 1),
  ('f220e563-a19f-52bf-ba10-85eb66539fcb', 'd24089f9-a83b-5b68-b30d-6d23de8f6a60', 'C', 'Chest X-ray only', false, 2),
  ('73ac0dc4-f080-5946-97b6-eaa24d4f43cc', 'd24089f9-a83b-5b68-b30d-6d23de8f6a60', 'D', 'CT chest', false, 3),
  ('b60577e2-fe03-50e7-b90c-e4f23b8e00dc', 'd24089f9-a83b-5b68-b30d-6d23de8f6a60', 'E', 'Serial peak expiratory flow measurements at and away from work', true, 4);

-- Q232
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('918aaf12-b645-54cf-8f3d-e5207e062c07', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000002', 'sba', 'A 28 year old man has chronic sinusitis, bronchiectasis and infertility. Chest X-ray shows the heart on the right side. What is the SINGLE most likely diagnosis?', 'Primary ciliary dyskinesia is an autosomal recessive disorder of ciliary function. It causes chronic rhinosinusitis, otitis media, bronchiectasis and subfertility (immotile sperm). Kartagener syndrome is PCD with situs inversus. Nasal nitric oxide is low. Diagnosis is by ciliary biopsy, high-speed video microscopy and genetic testing.', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v3')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = '918aaf12-b645-54cf-8f3d-e5207e062c07';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('61a3a841-b9cc-5d9b-be05-281fa403a1a4', '918aaf12-b645-54cf-8f3d-e5207e062c07', 'A', 'Cystic fibrosis', false, 0),
  ('1716ee21-42a4-57fd-831d-7e8483b09e5d', '918aaf12-b645-54cf-8f3d-e5207e062c07', 'B', 'Common variable immunodeficiency', false, 1),
  ('646ef47e-cf8c-5fa8-b7ed-a58f18441c0b', '918aaf12-b645-54cf-8f3d-e5207e062c07', 'C', 'Young''s syndrome', false, 2),
  ('e324c3e7-affd-5480-bffa-527dce23d0fa', '918aaf12-b645-54cf-8f3d-e5207e062c07', 'D', 'Primary ciliary dyskinesia (Kartagener syndrome)', true, 3),
  ('999de70a-7efc-5d02-af06-23464a8b4d2f', '918aaf12-b645-54cf-8f3d-e5207e062c07', 'E', 'Alpha-1 antitrypsin deficiency', false, 4);

-- Q233
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('fb5781b4-ecb1-5230-bbec-f6b5504d48ec', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000002', 'sba', 'A 66 year old man with pneumonia has a CURB-65 score of 3. Which management is MOST appropriate?', 'CURB-65: Confusion, Urea over 7 mmol/L, RR 30 or more, BP systolic below 90 or diastolic 60 or less, age 65 or over. A score of 0-1 is low severity (home treatment). A score of 2 is moderate (consider admission). A score of 3-5 is high severity (admit, consider ICU if 4-5). NICE high-severity treatment: co-amoxiclav plus clarithromycin.', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v3')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = 'fb5781b4-ecb1-5230-bbec-f6b5504d48ec';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('1a4a0034-1646-51f0-90ed-852d1f8eb664', 'fb5781b4-ecb1-5230-bbec-f6b5504d48ec', 'A', 'Hospital admission with IV antibiotics (e.g. co-amoxiclav plus clarithromycin), with assessment for ICU', true, 0),
  ('3f1a4127-234b-53c0-8ce6-5304dd375b26', 'fb5781b4-ecb1-5230-bbec-f6b5504d48ec', 'B', 'No antibiotics', false, 1),
  ('23a2048b-a44e-5cde-94cf-8f77d197db22', 'fb5781b4-ecb1-5230-bbec-f6b5504d48ec', 'C', 'Discharge with safety-netting', false, 2),
  ('b85052a2-3600-5d92-9208-810a022b00ef', 'fb5781b4-ecb1-5230-bbec-f6b5504d48ec', 'D', 'Oral doxycycline at home', false, 3),
  ('2fc1e10c-028a-536c-8438-303301103ba3', 'fb5781b4-ecb1-5230-bbec-f6b5504d48ec', 'E', 'Home treatment with oral amoxicillin', false, 4);

-- Q234
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('2f5072fc-0460-5a9d-94e4-97458159daab', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000002', 'sba', 'A 55 year old man was in hospital for 7 days after abdominal surgery. He develops pneumonia. Which organism is MORE likely than in community-acquired pneumonia?', 'Hospital-acquired pneumonia (developing 48 hours or more after admission) is more often caused by Gram-negatives (Pseudomonas, Klebsiella, E. coli) and Staph aureus (including MRSA). Antibiotic choice depends on severity, how long the patient has been in hospital and local resistance (often piperacillin-tazobactam).', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v3')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = '2f5072fc-0460-5a9d-94e4-97458159daab';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('6a223276-6a0b-52b6-be44-59501327834f', '2f5072fc-0460-5a9d-94e4-97458159daab', 'A', 'Mycoplasma pneumoniae', false, 0),
  ('c3dd2f54-03c1-57b4-a7e8-3a65d165493e', '2f5072fc-0460-5a9d-94e4-97458159daab', 'B', 'Chlamydia psittaci', false, 1),
  ('b70366f3-62d4-54f5-8df9-cf8518c76eee', '2f5072fc-0460-5a9d-94e4-97458159daab', 'C', 'Legionella pneumophila only', false, 2),
  ('2c5b01e7-2b09-54ac-80f3-eb14580fe317', '2f5072fc-0460-5a9d-94e4-97458159daab', 'D', 'Coxiella burnetii', false, 3),
  ('49f8d0f2-b4c9-54be-84de-27c51c0582c5', '2f5072fc-0460-5a9d-94e4-97458159daab', 'E', 'Gram-negative bacteria such as Pseudomonas aeruginosa (or MRSA)', true, 4);

-- Q235
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('33c90b62-e9b1-57e4-8c90-1b38ed7146d1', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000002', 'sba', 'A 35 year old woman with sarcoidosis has bilateral hilar lymphadenopathy and lung infiltrates on chest X-ray. She has no symptoms, and her lung function is normal. What is the SINGLE most appropriate management?', 'Asymptomatic pulmonary sarcoidosis with normal lung function often resolves and does not need treatment. Steroids are indicated for progressive or symptomatic lung disease, cardiac, neurological or eye involvement, or hypercalcaemia. Methotrexate is used as a steroid-sparing agent. Check calcium, ACE, eyes and an ECG.', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v3')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = '33c90b62-e9b1-57e4-8c90-1b38ed7146d1';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('d2d2c5af-c541-518c-96e4-0db5ac3e2d0c', '33c90b62-e9b1-57e4-8c90-1b38ed7146d1', 'A', 'Methotrexate', false, 0),
  ('a526c7ed-c651-56a7-977f-27334b978555', '33c90b62-e9b1-57e4-8c90-1b38ed7146d1', 'B', 'Monitoring without treatment (many cases resolve spontaneously)', true, 1),
  ('daeb794d-a64d-56d6-8fad-7df963a728c0', '33c90b62-e9b1-57e4-8c90-1b38ed7146d1', 'C', 'Lung transplant', false, 2),
  ('df8139c3-f259-54c3-94c3-a5c3c5adb3e2', '33c90b62-e9b1-57e4-8c90-1b38ed7146d1', 'D', 'Antituberculous therapy', false, 3),
  ('13f44981-db2a-528c-be33-221ae567d5e0', '33c90b62-e9b1-57e4-8c90-1b38ed7146d1', 'E', 'High-dose oral prednisolone', false, 4);

-- Q236
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('6812918e-3c08-51c0-8bd1-ce87400f6ff0', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000023', 'sba', 'A 35 year old man is brought in after a stabbing to the thigh. Blood is spurting from the wound, and he is drowsy. What is the FIRST priority in the primary survey?', 'The primary survey is <C>ABCDE: catastrophic external haemorrhage is controlled first (direct pressure, haemostatic dressings, tourniquet), followed by airway with C-spine control, breathing, circulation, disability and exposure. Give tranexamic acid within 3 hours of injury, and activate the major haemorrhage protocol.', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v3')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = '6812918e-3c08-51c0-8bd1-ce87400f6ff0';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('0e718c8f-2ded-59b2-9f8b-bcd55cacfc91', '6812918e-3c08-51c0-8bd1-ce87400f6ff0', 'A', 'Calculate GCS', false, 0),
  ('8029b36a-95a1-5ce0-97c6-e8e862665caa', '6812918e-3c08-51c0-8bd1-ce87400f6ff0', 'B', 'Insert two large-bore cannulae', false, 1),
  ('a5776458-74e5-51aa-9e39-379ac6378eeb', '6812918e-3c08-51c0-8bd1-ce87400f6ff0', 'C', 'Control catastrophic haemorrhage (direct pressure, tourniquet)', true, 2),
  ('6f751fde-583e-5681-94d3-4dc7459f3658', '6812918e-3c08-51c0-8bd1-ce87400f6ff0', 'D', 'Assess the airway', false, 3),
  ('a2265b4c-ece4-5f3f-a1c5-194fc8148707', '6812918e-3c08-51c0-8bd1-ce87400f6ff0', 'E', 'Assess breathing', false, 4);

-- Q237
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('689ec0a6-3a93-5226-8268-7f22421d8bf1', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000023', 'sba', 'A 28 year old man was in a road traffic collision 1 hour ago. He has signs of significant internal bleeding. Which drug should be given as early as possible to reduce mortality from trauma-related haemorrhage?', 'The CRASH-2 trial showed that tranexamic acid reduces death from bleeding in trauma when given within 3 hours, with the greatest benefit when given early. After 3 hours it may increase harm. It is also used in postpartum haemorrhage (WOMAN trial). CRASH-3 showed benefit in mild-moderate traumatic brain injury.', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v3')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = '689ec0a6-3a93-5226-8268-7f22421d8bf1';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('7d75207a-ca7f-5231-bab0-0d4e04709b31', '689ec0a6-3a93-5226-8268-7f22421d8bf1', 'A', 'Tranexamic acid 1 g IV over 10 minutes (within 3 hours of injury), then a 1 g infusion over 8 hours', true, 0),
  ('e53b2ebf-72f3-515e-a047-465cb084efcb', '689ec0a6-3a93-5226-8268-7f22421d8bf1', 'B', 'Recombinant factor VIIa as first-line', false, 1),
  ('cd146dd3-fabd-5add-8a04-daa298c63a64', '689ec0a6-3a93-5226-8268-7f22421d8bf1', 'C', 'IV vitamin K', false, 2),
  ('c9320178-9830-5327-8098-b7c5f32cf1c9', '689ec0a6-3a93-5226-8268-7f22421d8bf1', 'D', 'Protamine', false, 3),
  ('8a96278f-a817-5875-8d64-044721808578', '689ec0a6-3a93-5226-8268-7f22421d8bf1', 'E', 'IV desmopressin', false, 4);

-- Q238
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('908f60c9-683a-552a-80f8-54f0502b2ac6', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000023', 'sba', 'A 30 year old man was stabbed in the chest. He has a BP of 75/40 mmHg, HR 135 bpm, distended neck veins and muffled heart sounds. Breath sounds are equal. What is the SINGLE most likely diagnosis?', 'Beck''s triad (hypotension, raised JVP, muffled heart sounds) suggests cardiac tamponade, which is common with penetrating wounds to the ''cardiac box''. FAST or echo confirms it. Management is urgent thoracotomy (or pericardiocentesis as a temporary measure if surgery is not immediately available). Tension pneumothorax also causes raised JVP and hypotension but with absent breath sounds and tracheal deviation.', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v3')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = '908f60c9-683a-552a-80f8-54f0502b2ac6';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('bbf11ac7-43bb-5293-8b6f-b3b30ac4ad17', '908f60c9-683a-552a-80f8-54f0502b2ac6', 'A', 'Myocardial contusion', false, 0),
  ('897d0858-c754-5138-886b-7c2f618b306a', '908f60c9-683a-552a-80f8-54f0502b2ac6', 'B', 'Hypovolaemic shock only', false, 1),
  ('75c2b388-6594-5732-a012-69732c2ea24b', '908f60c9-683a-552a-80f8-54f0502b2ac6', 'C', 'Massive haemothorax', false, 2),
  ('3c40fedb-bef1-57d4-bbb5-0ea9d71951ab', '908f60c9-683a-552a-80f8-54f0502b2ac6', 'D', 'Cardiac tamponade', true, 3),
  ('fb37cedb-026b-5ad5-8639-7702b87d9789', '908f60c9-683a-552a-80f8-54f0502b2ac6', 'E', 'Tension pneumothorax', false, 4);

-- Q239
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('fa0a99e4-e118-5c4a-b977-06888eee6841', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000023', 'sba', 'A 25 year old man had a road traffic accident. He has HR 125 bpm, BP 110/80 mmHg (pulse pressure narrowed), RR 25/min, and is anxious, with a reduced urine output. According to ATLS classes of haemorrhagic shock, roughly how much blood has he lost?', 'ATLS haemorrhage classes: I (under 15%) has minimal changes. II (15-30%) has tachycardia, narrowed pulse pressure, anxiety and normal systolic BP. III (30-40%) has hypotension, marked tachycardia, confusion and oliguria. IV (over 40%) is life-threatening. Hypotension is a late sign in young patients. Give blood products early and control bleeding.', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v3')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = 'fa0a99e4-e118-5c4a-b977-06888eee6841';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('ff8ca081-9a09-5263-aba1-9bcfe772934f', 'fa0a99e4-e118-5c4a-b977-06888eee6841', 'A', 'Class III: 30-40% with low BP', false, 0),
  ('5a8bc7a2-f1b2-5d61-90c3-8bb8f6dbb700', 'fa0a99e4-e118-5c4a-b977-06888eee6841', 'B', 'Class II: 15-30% of blood volume (about 750-1500 mL in a 70 kg man)', true, 1),
  ('3a96a0f0-f23f-514f-8905-40423bd96c52', 'fa0a99e4-e118-5c4a-b977-06888eee6841', 'C', 'Class I: under 15%', false, 2),
  ('2eb1206f-02ab-58e7-9e59-fff353ec7a73', 'fa0a99e4-e118-5c4a-b977-06888eee6841', 'D', 'No blood loss', false, 3),
  ('6287d334-eb68-5f40-84fb-b035a3d809ae', 'fa0a99e4-e118-5c4a-b977-06888eee6841', 'E', 'Class IV: over 40%', false, 4);

-- Q240
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('ddca9822-5e29-5aa4-9b9a-6163319d907e', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000023', 'sba', 'A 60 year old man is in cardiac arrest with pulseless electrical activity. During CPR, which group of reversible causes should be actively considered?', 'In all cardiac arrests, especially PEA, look for reversible causes: Hypoxia, Hypovolaemia, Hypo/hyperkalaemia and metabolic disorders, Hypothermia (and hyperthermia), Thrombosis (coronary or pulmonary), Tension pneumothorax, Tamponade, Toxins. Point-of-care ultrasound can help, as long as it does not interrupt compressions.', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v3')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = 'ddca9822-5e29-5aa4-9b9a-6163319d907e';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('0661a6dc-c945-547b-843c-b7f0115c6172', 'ddca9822-5e29-5aa4-9b9a-6163319d907e', 'A', 'Only electrolyte problems', false, 0),
  ('d955d085-e4e8-5873-8f51-1b2c8c3e73cc', 'ddca9822-5e29-5aa4-9b9a-6163319d907e', 'B', 'Only anaphylaxis', false, 1),
  ('a08a4b00-e898-525d-9952-64313abbcbb3', 'ddca9822-5e29-5aa4-9b9a-6163319d907e', 'C', 'Only myocardial infarction', false, 2),
  ('8bbe14d3-57b7-5d3c-9129-0150fc768feb', 'ddca9822-5e29-5aa4-9b9a-6163319d907e', 'D', 'Only hypoglycaemia', false, 3),
  ('849fa87b-cb42-52ae-aeca-0a4e90a279c6', 'ddca9822-5e29-5aa4-9b9a-6163319d907e', 'E', 'The 4 Hs and 4 Ts (hypoxia, hypovolaemia, hypo/hyperkalaemia/metabolic, hypothermia; thrombosis, tension pneumothorax, tamponade, toxins)', true, 4);

-- Q241
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('39e7e95b-8e05-52af-8f8f-d0175aad8648', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000023', 'sba', 'A 52 year old man in hospital collapses and is in VF arrest. After the 3rd shock, which drugs should be given according to Resuscitation Council UK guidelines?', 'For shockable rhythms (VF or pulseless VT), give adrenaline 1 mg and amiodarone 300 mg after the 3rd shock, then adrenaline every 3-5 minutes (alternate cycles) and a further 150 mg amiodarone after the 5th shock. Minimise pauses in compressions. Atropine is no longer used in cardiac arrest.', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v3')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = '39e7e95b-8e05-52af-8f8f-d0175aad8648';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('13b30d97-4484-56b4-ae95-2ff0a8077c53', '39e7e95b-8e05-52af-8f8f-d0175aad8648', 'A', 'Calcium chloride routinely', false, 0),
  ('6b011736-d913-53a8-a8d9-69f36b3d4259', '39e7e95b-8e05-52af-8f8f-d0175aad8648', 'B', 'Adenosine 6 mg', false, 1),
  ('5bcf8e97-8392-5783-9865-4f8d3be336ae', '39e7e95b-8e05-52af-8f8f-d0175aad8648', 'C', 'IV adrenaline 1 mg and IV amiodarone 300 mg', true, 2),
  ('efab52a4-daa1-5de3-be42-4f6f3d2ed4b9', '39e7e95b-8e05-52af-8f8f-d0175aad8648', 'D', 'Amiodarone 150 mg before the first shock', false, 3),
  ('693866e4-8ace-5690-a610-e3542443386a', '39e7e95b-8e05-52af-8f8f-d0175aad8648', 'E', 'Atropine 3 mg', false, 4);

-- Q242
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('a32cc44f-49e6-5760-b09a-745a763d1c53', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000023', 'sba', 'A 70 year old man has had return of spontaneous circulation after VF arrest from a probable anterior STEMI. He remains comatose. What is the MOST appropriate post-resuscitation care?', 'Post-ROSC care: airway and ventilation (SpO2 94-98%, normocapnia), haemodynamic optimisation (MAP 65 or above), emergency angiography for STEMI, temperature control (prevent fever above 37.7°C for at least 72 hours), glucose control, seizure management, and delayed prognostication (at least 72 hours).', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v3')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = 'a32cc44f-49e6-5760-b09a-745a763d1c53';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('aa30d527-36dd-5168-84dc-179e9b78edd5', 'a32cc44f-49e6-5760-b09a-745a763d1c53', 'A', 'Discharge after 24 hours', false, 0),
  ('060f7c9d-36d4-57d8-932b-e05e40bbd611', 'a32cc44f-49e6-5760-b09a-745a763d1c53', 'B', 'Aggressive cooling to 28°C', false, 1),
  ('d72c611d-f89b-5a3c-9885-b4552d7abfc4', 'a32cc44f-49e6-5760-b09a-745a763d1c53', 'C', 'Emergency coronary angiography/PCI, avoid hypoxia and hyperoxia (SpO2 94-98%), avoid fever, and ICU care', true, 2),
  ('a2ede891-530d-555b-848e-671005895df7', 'a32cc44f-49e6-5760-b09a-745a763d1c53', 'D', 'High-flow oxygen to keep SpO2 at 100%', false, 3),
  ('583d6ac0-196f-5461-9922-f44d2b685975', 'a32cc44f-49e6-5760-b09a-745a763d1c53', 'E', 'Immediate extubation', false, 4);

-- Q243
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('058d19c6-6d6f-53e1-a4b0-e6c8afa22ca7', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000023', 'sba', 'An adult is choking on food in a restaurant. He cannot speak or cough effectively but is still conscious. What is the SINGLE most appropriate first action?', 'Severe airway obstruction in a conscious adult: up to 5 back blows, then up to 5 abdominal thrusts (Heimlich), alternating. If the person becomes unconscious, call for help and start CPR. Do not perform blind finger sweeps. After abdominal thrusts, the patient should be assessed for internal injury.', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v3')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = '058d19c6-6d6f-53e1-a4b0-e6c8afa22ca7';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('79f328a8-5781-5248-88a0-9dd3a1f8890e', '058d19c6-6d6f-53e1-a4b0-e6c8afa22ca7', 'A', 'Give water to drink', false, 0),
  ('a78fb836-f481-5ba2-9b9a-60cb3dcceb35', '058d19c6-6d6f-53e1-a4b0-e6c8afa22ca7', 'B', 'Give up to 5 back blows, then up to 5 abdominal thrusts if unsuccessful', true, 1),
  ('8255f811-265b-564e-9dfb-65d15de904cf', '058d19c6-6d6f-53e1-a4b0-e6c8afa22ca7', 'C', 'Start CPR immediately', false, 2),
  ('2f220317-5151-5395-93e1-c1c45eb036a4', '058d19c6-6d6f-53e1-a4b0-e6c8afa22ca7', 'D', 'Lie him flat and wait for an ambulance', false, 3),
  ('ff13a08a-dadc-5e48-adc1-39aee99c79a8', '058d19c6-6d6f-53e1-a4b0-e6c8afa22ca7', 'E', 'Blind finger sweep of the mouth', false, 4);

-- Q244
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('2967dbf5-fa8a-5c7e-8875-b45c7e2ef6a7', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000023', 'sba', 'A 30 year old electrician touched a high-voltage cable. He has small entry and exit burns on his hand and foot but feels well. What is the MOST important investigation?', 'Electrical injuries cause damage far greater than visible skin burns suggest: arrhythmias (VF with low-voltage AC, asystole with high-voltage injuries), deep muscle necrosis (rhabdomyolysis and AKI), compartment syndrome, fractures and neurological injury. High-voltage injuries need an ECG, cardiac monitoring, CK and fluid resuscitation.', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v3')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = '2967dbf5-fa8a-5c7e-8875-b45c7e2ef6a7';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('d0e1afa1-be27-5b63-a842-05ed0a3e5f4f', '2967dbf5-fa8a-5c7e-8875-b45c7e2ef6a7', 'A', 'Spirometry', false, 0),
  ('3d37d04d-f0fe-5189-9a6d-612eb919c2a7', '2967dbf5-fa8a-5c7e-8875-b45c7e2ef6a7', 'B', 'No investigation; discharge', false, 1),
  ('58ceae3d-765f-5c00-a7be-a0ca40273e94', '2967dbf5-fa8a-5c7e-8875-b45c7e2ef6a7', 'C', 'ECG and cardiac monitoring, with CK and urine myoglobin (deep tissue injury)', true, 2),
  ('cbf067de-405a-5e98-a66d-c1169b876c4e', '2967dbf5-fa8a-5c7e-8875-b45c7e2ef6a7', 'D', 'Skull X-ray', false, 3),
  ('f6d128ca-a6b9-518f-87ab-56980055f5a8', '2967dbf5-fa8a-5c7e-8875-b45c7e2ef6a7', 'E', 'Abdominal ultrasound only', false, 4);

-- Q245
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('345bcb48-cad8-595e-84f4-d598bdee4c78', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000023', 'sba', 'A 55 year old woman with chronic kidney disease takes lithium and is admitted with vomiting, diarrhoea, coarse tremor, ataxia and confusion. Her lithium level is 3.4 mmol/L. What is the SINGLE most appropriate management?', 'Severe lithium toxicity (especially with neurological features, levels over 2.5-4 mmol/L, or renal impairment) needs haemodialysis. Activated charcoal does not bind lithium. Whole bowel irrigation can be considered for modified-release overdose. Correct dehydration and avoid nephrotoxic drugs.', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v3')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = '345bcb48-cad8-595e-84f4-d598bdee4c78';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('f33af8b5-28dd-5e45-b204-af841cf7d3b4', '345bcb48-cad8-595e-84f4-d598bdee4c78', 'A', 'Continue lithium at a lower dose', false, 0),
  ('d62edc5f-0127-5adf-9bd7-c5f2096ff7ff', '345bcb48-cad8-595e-84f4-d598bdee4c78', 'B', 'Give oral sodium bicarbonate only', false, 1),
  ('66051359-194a-51de-a905-011499a4d6de', '345bcb48-cad8-595e-84f4-d598bdee4c78', 'C', 'Give activated charcoal', false, 2),
  ('f90a99b8-c776-5fe0-ba09-18203184af7b', '345bcb48-cad8-595e-84f4-d598bdee4c78', 'D', 'Stop lithium, give IV fluids, and arrange haemodialysis (severe toxicity with renal impairment)', true, 3),
  ('6fecf3d7-5724-542b-8f95-84c0628aa3cc', '345bcb48-cad8-595e-84f4-d598bdee4c78', 'E', 'Give IV furosemide', false, 4);

-- Q246
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('9e2df8ec-90a0-5a9d-a4ec-a3b7ee65b5ba', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000023', 'sba', 'A 34 year old man is brought out of a burning building with a reduced conscious level, severe lactic acidosis (lactate 12 mmol/L) and hypotension, with a normal SpO2. His carboxyhaemoglobin is only mildly raised. What should be given in addition to 100% oxygen?', 'Smoke from burning plastics, wool and silk can contain hydrogen cyanide, which blocks cellular respiration (cytochrome oxidase), causing severe lactic acidosis, reduced consciousness and cardiovascular collapse despite a normal oxygen saturation. Hydroxocobalamin binds cyanide to form cyanocobalamin, which is excreted in urine. It turns urine and skin red.', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v3')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = '9e2df8ec-90a0-5a9d-a4ec-a3b7ee65b5ba';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('0a2ba075-8eff-5236-899b-6f739ef64a10', '9e2df8ec-90a0-5a9d-a4ec-a3b7ee65b5ba', 'A', 'IV atropine', false, 0),
  ('091034d0-c2ca-5f9a-985f-908ae38f29b8', '9e2df8ec-90a0-5a9d-a4ec-a3b7ee65b5ba', 'B', 'IV hydroxocobalamin (for suspected cyanide poisoning)', true, 1),
  ('56bda403-6890-5d11-ac58-7e315c1f77e9', '9e2df8ec-90a0-5a9d-a4ec-a3b7ee65b5ba', 'C', 'IV naloxone', false, 2),
  ('1fee3578-63ce-5b59-b0ac-0a07dcb66db7', '9e2df8ec-90a0-5a9d-a4ec-a3b7ee65b5ba', 'D', 'IV flumazenil', false, 3),
  ('78f688a5-6612-5e2d-8723-b27bc3cd105f', '9e2df8ec-90a0-5a9d-a4ec-a3b7ee65b5ba', 'E', 'IV methylene blue for all smoke inhalation', false, 4);

-- Q247
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('339dc53d-ef85-5594-8a5d-e34cbf17fafb', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000023', 'sba', 'A 28 year old marathon runner collapses at the finish line on a hot day. He is confused, his core temperature is 41.2°C and he has stopped sweating. What is the SINGLE most appropriate treatment?', 'Exertional heatstroke (core temperature above 40°C with CNS dysfunction) is an emergency. Cool rapidly (''cool first, transport second''), ideally by cold water immersion, and also manage ABC, fluids, glucose and complications (rhabdomyolysis, AKI, DIC, liver failure). Antipyretics do not work. Heat exhaustion is milder, with no CNS dysfunction.', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v3')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = '339dc53d-ef85-5594-8a5d-e34cbf17fafb';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('656af2b1-2cec-5434-ae09-2f632509b442', '339dc53d-ef85-5594-8a5d-e34cbf17fafb', 'A', 'Oral paracetamol only', false, 0),
  ('a43ae2ac-f0c2-5f5c-8a3b-d031d5927835', '339dc53d-ef85-5594-8a5d-e34cbf17fafb', 'B', 'IV dantrolene as first-line', false, 1),
  ('807036ff-1cee-5fe6-8e28-57bc1cbb0e52', '339dc53d-ef85-5594-8a5d-e34cbf17fafb', 'C', 'Rapid cooling (cold water immersion or evaporative cooling) as quickly as possible', true, 2),
  ('e3056198-a1de-5d73-8915-13fbc46c62e7', '339dc53d-ef85-5594-8a5d-e34cbf17fafb', 'D', 'Give a hot drink', false, 3),
  ('595ac9f5-bd5c-58a0-bd3c-0d09aa4fc670', '339dc53d-ef85-5594-8a5d-e34cbf17fafb', 'E', 'Slow cooling over 24 hours', false, 4);

-- Q248
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('0a2fc219-8925-5fd9-bbd3-115b59847bbe', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000023', 'sba', 'A 4 year old boy weighing 16 kg has anaphylaxis to peanut. What is the correct IM adrenaline dose?', 'Resuscitation Council UK (2021) IM adrenaline doses (1 in 1,000): under 6 months 100-150 micrograms; 6 months to 6 years 150 micrograms; 6-12 years 300 micrograms; over 12 years and adults 500 micrograms (300 micrograms if small or prepubertal). Repeat after 5 minutes if there is no improvement. Give into the anterolateral thigh.', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v3')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = '0a2fc219-8925-5fd9-bbd3-115b59847bbe';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('4e354d6d-e57a-5410-9b51-1836ef6cd36d', '0a2fc219-8925-5fd9-bbd3-115b59847bbe', 'A', '1 mg', false, 0),
  ('2652fd5a-6a0d-5360-9acc-c29c7a5c4c97', '0a2fc219-8925-5fd9-bbd3-115b59847bbe', 'B', '50 micrograms', false, 1),
  ('d1f6693d-c190-55a7-a5d6-5a0728fc8596', '0a2fc219-8925-5fd9-bbd3-115b59847bbe', 'C', '150 micrograms (0.15 mL of 1 in 1,000)', true, 2),
  ('2d2f4647-3830-5f8f-b842-7b757848349f', '0a2fc219-8925-5fd9-bbd3-115b59847bbe', 'D', '300 micrograms', false, 3),
  ('5d18975f-b9d1-58dc-9529-37b381ff63b8', '0a2fc219-8925-5fd9-bbd3-115b59847bbe', 'E', '500 micrograms', false, 4);

-- Q249
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('1ce1967c-b84f-5888-acba-b7338431fe27', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000023', 'sba', 'A 70 year old woman on digoxin has nausea, vomiting, confusion and yellow vision. Her ECG shows a slow AF with frequent ventricular ectopics and runs of bigeminy. Her potassium is 5.9 mmol/L and digoxin level is high. What is the SINGLE most appropriate specific treatment?', 'Digoxin-specific antibody fragments are indicated for life-threatening digoxin toxicity (ventricular arrhythmias, haemodynamically significant bradyarrhythmias, hyperkalaemia above 5 mmol/L in acute toxicity, or end-organ dysfunction). Stop digoxin, correct electrolytes (especially low potassium and magnesium) and monitor. Calcium is traditionally avoided in digoxin toxicity.', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v3')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = '1ce1967c-b84f-5888-acba-b7338431fe27';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('9699888e-1d3e-5e58-9797-43bea4832134', '1ce1967c-b84f-5888-acba-b7338431fe27', 'A', 'IV calcium gluconate first-line', false, 0),
  ('ca967f6f-1ae6-5b64-93c5-47dcd3ed252c', '1ce1967c-b84f-5888-acba-b7338431fe27', 'B', 'IV amiodarone', false, 1),
  ('1bb18183-492d-50ff-932d-77a9c1283c72', '1ce1967c-b84f-5888-acba-b7338431fe27', 'C', 'IV adenosine', false, 2),
  ('e77d5b7a-3b04-5a56-b5c6-43f3637164a4', '1ce1967c-b84f-5888-acba-b7338431fe27', 'D', 'Digoxin-specific antibody fragments (DigiFab)', true, 3),
  ('8176c48a-40a6-5aec-83e4-a9802451171b', '1ce1967c-b84f-5888-acba-b7338431fe27', 'E', 'IV furosemide', false, 4);

-- Q250
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('42492454-9a86-51f4-8ceb-9c24ecc18972', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000023', 'sba', 'A 45 year old woman fell onto her outstretched hand. She now has severe forearm pain that is worsening despite strong opioids, pain on passive stretching of the fingers, and a tense forearm after a plaster cast was applied. Pulses are present. What is the SINGLE most likely diagnosis and immediate action?', 'Compartment syndrome: pain out of proportion to the injury and pain on passive stretch are the earliest signs. Pulses are often preserved until late. Remove or split all dressings and casts down to skin, keep the limb at heart level, and arrange urgent fasciotomy if symptoms persist. Delay causes muscle necrosis and Volkmann''s contracture.', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v3')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = '42492454-9a86-51f4-8ceb-9c24ecc18972';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('a579c516-8548-5f1c-a0c1-34d85a1575b6', '42492454-9a86-51f4-8ceb-9c24ecc18972', 'A', 'Acute compartment syndrome; split the cast to skin and urgent orthopaedic review for fasciotomy', true, 0),
  ('0132d0f9-7e4b-569c-b8ab-5e14cedf2aa4', '42492454-9a86-51f4-8ceb-9c24ecc18972', 'B', 'Infection; start antibiotics', false, 1),
  ('2e3b8c67-76df-5ba5-ad81-a5913ed529ee', '42492454-9a86-51f4-8ceb-9c24ecc18972', 'C', 'DVT; start anticoagulation', false, 2),
  ('caf8bf45-8ca4-5c31-88dc-3a7484897f93', '42492454-9a86-51f4-8ceb-9c24ecc18972', 'D', 'Complex regional pain syndrome; physiotherapy', false, 3),
  ('a6b5dabd-2877-59b8-ae5f-fe5940c5d3e7', '42492454-9a86-51f4-8ceb-9c24ecc18972', 'E', 'Normal post-fracture pain; increase opioids', false, 4);

-- Q251
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('612729ce-3485-59e4-808e-54d9792549de', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000004', 'sba', 'A 22 year old woman with DKA is being treated with IV fluids and a fixed-rate insulin infusion. After 6 hours, her capillary glucose has fallen to 13 mmol/L, ketones are 2.1 mmol/L and pH 7.28. What is the SINGLE most appropriate change?', 'JBDS guidance: the fixed-rate insulin infusion (0.1 units/kg/hour) is continued until ketones fall below 0.6 mmol/L and pH is above 7.3. When glucose falls below 14 mmol/L, add 10% glucose (125 mL/hour) to avoid hypoglycaemia while ketones are cleared. Continue basal insulin. Monitor potassium closely and replace it in the fluids.', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v3')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = '612729ce-3485-59e4-808e-54d9792549de';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('34296db5-6239-5782-ac1e-add68d212273', '612729ce-3485-59e4-808e-54d9792549de', 'A', 'Switch to subcutaneous insulin now', false, 0),
  ('b7cd1c12-0010-5ed3-85d8-12fa2a04b4b1', '612729ce-3485-59e4-808e-54d9792549de', 'B', 'Reduce insulin to 0.01 units/kg/hour', false, 1),
  ('336572dd-366d-5cda-b37b-ce81d606c338', '612729ce-3485-59e4-808e-54d9792549de', 'C', 'Stop the insulin infusion', false, 2),
  ('c57b599c-43df-57b3-8acd-a244cd6b5a24', '612729ce-3485-59e4-808e-54d9792549de', 'D', 'Give IV bicarbonate', false, 3),
  ('c6552fe9-9989-5e65-a7f3-34bbc6f03df5', '612729ce-3485-59e4-808e-54d9792549de', 'E', 'Add 10% glucose alongside the 0.9% saline and continue the fixed-rate insulin at 0.1 units/kg/hour', true, 4);

-- Q252
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('3f9306c5-f6bc-5bcb-a123-d87eec04e403', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000004', 'sba', 'A 25 year old man with DKA has a serum potassium of 4.2 mmol/L on admission. What potassium replacement is MOST appropriate in his IV fluids, assuming good urine output?', 'Total body potassium is depleted in DKA, and insulin drives potassium into cells. JBDS guidance: potassium above 5.5 mmol/L, give none; 3.5-5.5 mmol/L, add 40 mmol/L; below 3.5 mmol/L, senior review (extra potassium is needed, and insulin may need to be delayed). Never give a potassium bolus.', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v3')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = '3f9306c5-f6bc-5bcb-a123-d87eec04e403';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('f2db0a1c-2822-548a-8f9a-84ebf00846b7', '3f9306c5-f6bc-5bcb-a123-d87eec04e403', 'A', 'Potassium bolus IV push', false, 0),
  ('e3199377-2dc2-5e59-a37a-bbd6c80a5f4b', '3f9306c5-f6bc-5bcb-a123-d87eec04e403', 'B', '40 mmol/L potassium chloride in each litre of 0.9% saline', true, 1),
  ('6a4560e3-5f20-5ffc-bec2-ef7ab43f7506', '3f9306c5-f6bc-5bcb-a123-d87eec04e403', 'C', '20 mmol/L only after 24 hours', false, 2),
  ('2c33102d-ec40-5e2c-b55b-210c1d92ecbf', '3f9306c5-f6bc-5bcb-a123-d87eec04e403', 'D', 'No potassium, as his level is normal', false, 3),
  ('48109431-8747-5d1e-9bf1-21100aee167a', '3f9306c5-f6bc-5bcb-a123-d87eec04e403', 'E', '80 mmol/L in each litre', false, 4);

-- Q253
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('af642687-87dc-57f7-bcfd-111a54247bbd', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000004', 'sba', 'A 50 year old man with type 2 diabetes on metformin and dapagliflozin has gastroenteritis with vomiting and cannot eat or drink much. What ''sick day rule'' advice is MOST appropriate?', '''Sick day rules'' (SADMANS): temporarily stop SGLT2 inhibitors, ACE inhibitors/ARBs, diuretics, metformin, NSAIDs and sulfonylureas (hypoglycaemia risk) during dehydrating illness, to reduce the risk of AKI, lactic acidosis, DKA and hypoglycaemia. SGLT2 inhibitors can cause euglycaemic DKA. Restart once eating and drinking normally for 24-48 hours.', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v3')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = 'af642687-87dc-57f7-bcfd-111a54247bbd';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('57748838-6d43-587c-900d-f9db5b094d33', 'af642687-87dc-57f7-bcfd-111a54247bbd', 'A', 'Stop all diabetes medication permanently', false, 0),
  ('5303ad08-4562-576a-87e4-cc319aff8630', 'af642687-87dc-57f7-bcfd-111a54247bbd', 'B', 'Double his metformin dose', false, 1),
  ('a30914a0-e816-5424-bc1e-f97d67045c3d', 'af642687-87dc-57f7-bcfd-111a54247bbd', 'C', 'Temporarily stop metformin and the SGLT2 inhibitor until he is eating and drinking normally (24-48 hours)', true, 2),
  ('ce83f65c-48c2-54db-99bb-04ec3816233f', 'af642687-87dc-57f7-bcfd-111a54247bbd', 'D', 'Continue all medication as normal', false, 3),
  ('8442fa2b-354f-5c98-857c-c93ab368be23', 'af642687-87dc-57f7-bcfd-111a54247bbd', 'E', 'Start insulin immediately at home', false, 4);

-- Q254
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('18856df3-80cc-5dae-bd02-7c349b8b127b', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000004', 'sba', 'A 46 year old man has an HbA1c of 51 mmol/mol on a routine test. He has no symptoms. What is the SINGLE most appropriate next step to diagnose diabetes?', 'WHO and NICE: HbA1c 48 mmol/mol (6.5%) or above is diagnostic of diabetes. In asymptomatic people, confirm with a second test. HbA1c 42-47 mmol/mol is non-diabetic hyperglycaemia (prediabetes), which needs lifestyle intervention (NHS Diabetes Prevention Programme). HbA1c is unreliable in pregnancy, children, haemoglobinopathies, recent blood loss and type 1 diabetes.', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v3')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = '18856df3-80cc-5dae-bd02-7c349b8b127b';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('e5780660-7667-5d5c-b8ca-3116ee212f75', '18856df3-80cc-5dae-bd02-7c349b8b127b', 'A', 'Repeat the HbA1c (a second diagnostic-range result confirms type 2 diabetes in an asymptomatic person)', true, 0),
  ('7e3e1844-2d1b-59e5-a127-e6b7a67449b8', '18856df3-80cc-5dae-bd02-7c349b8b127b', 'B', 'Start insulin', false, 1),
  ('edcf99c5-470d-5d2d-8f28-930d8231c793', '18856df3-80cc-5dae-bd02-7c349b8b127b', 'C', 'No further action; it is prediabetes', false, 2),
  ('5b308d64-6788-58be-8991-81ab4c68e303', '18856df3-80cc-5dae-bd02-7c349b8b127b', 'D', 'Diagnose diabetes on this single result', false, 3),
  ('6ecea49a-7f97-5990-b9db-1caa2fc9c48f', '18856df3-80cc-5dae-bd02-7c349b8b127b', 'E', 'Do an OGTT in all cases', false, 4);

-- Q255
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('a74802ac-88e9-574c-ae29-ccac08d26fd3', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000004', 'sba', 'A 25 year old woman has had type 2 diabetes diagnosed at 20. Her mother, grandmother and uncle all developed diabetes before 25. She is not obese and has no ketones. Antibodies are negative and C-peptide is preserved. What is the SINGLE most likely diagnosis?', 'MODY is autosomal dominant monogenic diabetes presenting before 25, with a strong family history over generations, no autoantibodies and preserved C-peptide. HNF1A MODY (the commonest) is very sensitive to sulfonylureas, so many patients can stop insulin. GCK MODY causes mild stable hyperglycaemia that usually needs no treatment.', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v3')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = 'a74802ac-88e9-574c-ae29-ccac08d26fd3';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('5d3fba23-d096-51e5-aee2-a3cae8b49117', 'a74802ac-88e9-574c-ae29-ccac08d26fd3', 'A', 'Type 1 diabetes', false, 0),
  ('46ccc3d2-0872-5700-b536-8b94339c0236', 'a74802ac-88e9-574c-ae29-ccac08d26fd3', 'B', 'Maturity-onset diabetes of the young (MODY)', true, 1),
  ('73176c5e-8dce-5a9d-8599-952fae743e6b', 'a74802ac-88e9-574c-ae29-ccac08d26fd3', 'C', 'Type 2 diabetes related to obesity', false, 2),
  ('a7ca7284-11ca-549e-892e-383c5bc65d2f', 'a74802ac-88e9-574c-ae29-ccac08d26fd3', 'D', 'Gestational diabetes', false, 3),
  ('b8e5baf1-42a6-5228-a06b-e33c6f5bf4fd', 'a74802ac-88e9-574c-ae29-ccac08d26fd3', 'E', 'Latent autoimmune diabetes in adults', false, 4);

-- Q256
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('dc2c71cb-cf6e-5dca-bab8-af318bdd6fbe', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000004', 'sba', 'A 42 year old slim man was diagnosed with type 2 diabetes 1 year ago. Despite metformin and gliclazide, he is losing weight with rising HbA1c. GAD antibodies are positive. What is the SINGLE most likely diagnosis?', 'LADA is slowly progressive autoimmune diabetes in adults, initially often misdiagnosed as type 2. Clues are lower BMI, rapid failure of oral drugs, positive autoantibodies (GAD) and falling C-peptide. Insulin is needed earlier. Always consider pancreatic cancer in new-onset diabetes with weight loss in older people.', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v3')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = 'dc2c71cb-cf6e-5dca-bab8-af318bdd6fbe';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('a1145519-257d-518e-8ce6-ea9d8b2243aa', 'dc2c71cb-cf6e-5dca-bab8-af318bdd6fbe', 'A', 'Type 2 diabetes', false, 0),
  ('49db213d-6b26-5d21-926c-cdd759c326a2', 'dc2c71cb-cf6e-5dca-bab8-af318bdd6fbe', 'B', 'MODY', false, 1),
  ('f2b9d77f-ad60-51b7-96e0-8250306ae59d', 'dc2c71cb-cf6e-5dca-bab8-af318bdd6fbe', 'C', 'Latent autoimmune diabetes in adults (LADA)', true, 2),
  ('7072d79c-fc1d-5d6d-bcc0-f6559cfc7f34', 'dc2c71cb-cf6e-5dca-bab8-af318bdd6fbe', 'D', 'Cushing''s syndrome', false, 3),
  ('3fe580c1-f93d-53ba-9518-227b189969bb', 'dc2c71cb-cf6e-5dca-bab8-af318bdd6fbe', 'E', 'Pancreatic cancer causing diabetes', false, 4);

-- Q257
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('6271f4b8-4319-55f8-8f6a-111d75c944ca', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000004', 'sba', 'A 35 year old woman with type 1 diabetes drives a car. She had a severe hypoglycaemic episode needing help from another person while awake last month. What is the CORRECT DVLA advice?', 'DVLA: Group 1 drivers on insulin must notify the DVLA if they have more than one episode of severe hypoglycaemia (needing help from another person) while awake in 12 months, or if they have impaired awareness of hypoglycaemia. Test glucose within 2 hours before driving and every 2 hours during. Do not drive if below 5 mmol/L (''five to drive''). Group 2 rules are stricter.', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v3')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = '6271f4b8-4319-55f8-8f6a-111d75c944ca';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('de0dd6e8-86e1-5a80-8f04-727f118a251a', '6271f4b8-4319-55f8-8f6a-111d75c944ca', 'A', 'She can drive if she eats a snack', false, 0),
  ('9c1e4c61-f9f8-5301-96f0-5991b39b8e81', '6271f4b8-4319-55f8-8f6a-111d75c944ca', 'B', 'She must stop driving permanently', false, 1),
  ('28224149-85c7-5d27-b70a-c017b05a4322', '6271f4b8-4319-55f8-8f6a-111d75c944ca', 'C', 'No need to inform the DVLA', false, 2),
  ('30c6ee54-932a-51a8-8146-362d36d97507', '6271f4b8-4319-55f8-8f6a-111d75c944ca', 'D', 'Only lorry drivers need to report hypoglycaemia', false, 3),
  ('2a52d577-5a89-5929-87e8-729ab26f614a', '6271f4b8-4319-55f8-8f6a-111d75c944ca', 'E', 'She must inform the DVLA; a Group 1 licence may be revoked if there has been more than one episode of severe hypoglycaemia in 12 months', true, 4);

-- Q258
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('16fb7ed9-f9b7-503c-9438-a1dd0c2149f2', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000004', 'sba', 'A 78 year old woman with type 2 diabetes and CKD takes gliclazide 160 mg twice daily. Her HbA1c is 44 mmol/mol, and she has had episodes of confusion in the mornings. What is the SINGLE most appropriate action?', 'Sulfonylureas can cause hypoglycaemia, especially in older people and in CKD. A low HbA1c on a sulfonylurea in a frail older person suggests overtreatment. Relax targets (often 53-64 mmol/mol or individualised) and deprescribe. DPP-4 inhibitors rarely cause hypoglycaemia.', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v3')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = '16fb7ed9-f9b7-503c-9438-a1dd0c2149f2';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('05f5ff6b-49cf-5c7d-8464-051d86bc2774', '16fb7ed9-f9b7-503c-9438-a1dd0c2149f2', 'A', 'Check glucose during the episodes and reduce or stop gliclazide (risk of hypoglycaemia)', true, 0),
  ('e0fbf012-b2e6-5d49-a808-4e5450043802', '16fb7ed9-f9b7-503c-9438-a1dd0c2149f2', 'B', 'Increase gliclazide', false, 1),
  ('4b7ff584-ed0f-576c-a2e8-c08f913633a8', '16fb7ed9-f9b7-503c-9438-a1dd0c2149f2', 'C', 'Start a DPP-4 inhibitor and continue gliclazide unchanged', false, 2),
  ('98b84467-3a6d-5ffd-8538-e0502f7b1274', '16fb7ed9-f9b7-503c-9438-a1dd0c2149f2', 'D', 'Add insulin', false, 3),
  ('7847c8b8-53d2-517a-ac5a-a9843e045a98', '16fb7ed9-f9b7-503c-9438-a1dd0c2149f2', 'E', 'Arrange an urgent CT head and change nothing', false, 4);

-- Q259
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('52058f7d-3e4d-5c54-8b7e-20faee9102f9', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000004', 'sba', 'A 62 year old man with type 2 diabetes is on metformin. His HbA1c is 64 mmol/mol, his BMI is 38 and he has no cardiovascular disease. He wants to lose weight. Which add-on is MOST likely to help both glucose control and weight?', 'GLP-1 receptor agonists (semaglutide, dulaglutide, liraglutide) reduce glucose and cause weight loss. NICE NG28 criteria for adding them to triple therapy include BMI 35 or above. They also have cardiovascular benefit. Side effects include nausea and vomiting, and rarely pancreatitis. Sulfonylureas, pioglitazone and insulin cause weight gain.', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v3')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = '52058f7d-3e4d-5c54-8b7e-20faee9102f9';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('ca637bd7-38b4-5e5b-832a-e84d8de1505d', '52058f7d-3e4d-5c54-8b7e-20faee9102f9', 'A', 'A GLP-1 receptor agonist (e.g. semaglutide), if NICE criteria are met', true, 0),
  ('4a6a3d53-b32f-56aa-82b6-681ddd461984', '52058f7d-3e4d-5c54-8b7e-20faee9102f9', 'B', 'Gliclazide', false, 1),
  ('78c5a8fd-acf1-5ab1-93f1-0554987caea3', '52058f7d-3e4d-5c54-8b7e-20faee9102f9', 'C', 'Pioglitazone', false, 2),
  ('82e5ebe1-3b5c-5ab9-8782-acf533a8184b', '52058f7d-3e4d-5c54-8b7e-20faee9102f9', 'D', 'Insulin', false, 3),
  ('ea0ca82a-f92d-57a0-ac77-e8191c9ffa96', '52058f7d-3e4d-5c54-8b7e-20faee9102f9', 'E', 'A sulfonylurea plus insulin', false, 4);

-- Q260
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('f4748014-54dd-5bda-82e7-78a0a74753af', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000004', 'sba', 'A 68 year old man with type 2 diabetes and heart failure (NYHA III) is being considered for additional diabetes therapy. Which drug should be AVOIDED?', 'Pioglitazone causes fluid retention and can worsen heart failure, so it is contraindicated in heart failure. It is also linked to bladder cancer, fractures and weight gain. SGLT2 inhibitors improve heart failure outcomes. Saxagliptin and alogliptin should be used with caution in heart failure.', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v3')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = 'f4748014-54dd-5bda-82e7-78a0a74753af';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('f75167e4-20e5-5854-a5f5-81f41167106f', 'f4748014-54dd-5bda-82e7-78a0a74753af', 'A', 'Metformin', false, 0),
  ('c9104342-03be-561b-b884-b3aa7bc64c5c', 'f4748014-54dd-5bda-82e7-78a0a74753af', 'B', 'Pioglitazone', true, 1),
  ('b622418b-b826-5af4-99a2-46bfe807fd39', 'f4748014-54dd-5bda-82e7-78a0a74753af', 'C', 'An SGLT2 inhibitor', false, 2),
  ('e9dfe937-4670-5376-9cb0-eb5003fc5c7c', 'f4748014-54dd-5bda-82e7-78a0a74753af', 'D', 'A DPP-4 inhibitor (e.g. sitagliptin)', false, 3),
  ('f5b6ad89-b41a-56cb-a394-7d7e711c117a', 'f4748014-54dd-5bda-82e7-78a0a74753af', 'E', 'Insulin with monitoring', false, 4);

-- Q261
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('d292df59-d791-5eda-a7b4-19a3bdf659a4', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000004', 'sba', 'A 60 year old man takes amiodarone. He now has weight loss, palpitations and tremor. TSH is suppressed and free T4 high. Thyroid ultrasound shows a normal-sized gland with low vascularity, and technetium uptake is low. What is the SINGLE most likely diagnosis and treatment?', 'Amiodarone contains a lot of iodine. Type 1 AIT is excess hormone synthesis in an abnormal gland (nodular or Graves''), with increased vascularity, treated with thionamides. Type 2 AIT is a destructive thyroiditis in a normal gland, with low uptake and vascularity, treated with steroids. Mixed forms occur. Amiodarone more commonly causes hypothyroidism.', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v3')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = 'd292df59-d791-5eda-a7b4-19a3bdf659a4';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('23dbf1b1-ccd9-5114-8682-46995c4ae896', 'd292df59-d791-5eda-a7b4-19a3bdf659a4', 'A', 'Graves'' disease; radioiodine', false, 0),
  ('011e322d-7474-5b4f-ae99-e5a139c5df19', 'd292df59-d791-5eda-a7b4-19a3bdf659a4', 'B', 'Toxic multinodular goitre; radioiodine', false, 1),
  ('429f43cd-623b-5d89-a064-bb097bdbff8f', 'd292df59-d791-5eda-a7b4-19a3bdf659a4', 'C', 'Type 2 amiodarone-induced thyrotoxicosis (destructive thyroiditis); treat with oral steroids (prednisolone)', true, 2),
  ('e2d137ec-d919-5e72-82f3-3f73a207ff8f', 'd292df59-d791-5eda-a7b4-19a3bdf659a4', 'D', 'Hypothyroidism; levothyroxine', false, 3),
  ('e339c502-6c05-5328-9536-83eb931e78af', 'd292df59-d791-5eda-a7b4-19a3bdf659a4', 'E', 'Type 1 amiodarone-induced thyrotoxicosis; treat with carbimazole', false, 4);

-- Q262
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('b653c0d1-9eb8-5933-8809-9287eda80b10', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000004', 'sba', 'A 45 year old woman with Graves'' disease has gritty eyes, proptosis and lid retraction. She smokes 20 cigarettes a day. What is the MOST important modifiable risk factor to address?', 'Thyroid eye disease is associated with Graves'' disease. Smoking strongly increases its risk and severity and reduces the effect of treatment. Radioiodine can worsen eye disease (especially in smokers), so steroid cover may be needed. Moderate-severe active eye disease is treated with IV methylprednisolone. Refer to a specialist eye clinic. Sight-threatening optic neuropathy is an emergency.', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v3')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = 'b653c0d1-9eb8-5933-8809-9287eda80b10';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('0b415d59-085d-573b-b7d9-f4142260b41e', 'b653c0d1-9eb8-5933-8809-9287eda80b10', 'A', 'Low dietary iodine', false, 0),
  ('a429ff27-bb86-5aba-978f-4a1babe8a916', 'b653c0d1-9eb8-5933-8809-9287eda80b10', 'B', 'Exercise', false, 1),
  ('a9accbc6-1b74-54ba-b4e5-d04b04552137', 'b653c0d1-9eb8-5933-8809-9287eda80b10', 'C', 'Smoking cessation', true, 2),
  ('fbf0b8bc-6c68-55cb-90db-70c7dd3de0c6', 'b653c0d1-9eb8-5933-8809-9287eda80b10', 'D', 'Caffeine intake', false, 3),
  ('297b88ad-0592-5aef-9b06-0e04fa353f13', 'b653c0d1-9eb8-5933-8809-9287eda80b10', 'E', 'Alcohol intake', false, 4);

-- Q263
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('f1ba7747-eff9-590d-b922-153c99211d00', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000004', 'sba', 'A 52 year old woman has a TSH of 0.05 mU/L with normal free T4 and free T3 on two occasions over 3 months. She is asymptomatic. She is postmenopausal and has osteopenia. What is this?', 'Subclinical hyperthyroidism (low TSH, normal T4/T3) is associated with AF and osteoporosis, especially if TSH is below 0.1 mU/L in people over 65 or postmenopausal women. Check for a cause (toxic nodule, multinodular goitre, Graves''). Treatment is considered in those at high risk. Exclude over-replacement of levothyroxine.', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v3')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = 'f1ba7747-eff9-590d-b922-153c99211d00';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('fd81981e-33f8-5aaf-8278-d9e1843a9ad9', 'f1ba7747-eff9-590d-b922-153c99211d00', 'A', 'Overt hyperthyroidism', false, 0),
  ('2a672585-1057-5a97-9d56-48bc28d12bbd', 'f1ba7747-eff9-590d-b922-153c99211d00', 'B', 'Hypothyroidism', false, 1),
  ('738c8941-cc86-5891-ae0f-5a1f279d610d', 'f1ba7747-eff9-590d-b922-153c99211d00', 'C', 'Subclinical hyperthyroidism; consider treatment because of her age and bone risk (refer to endocrinology)', true, 2),
  ('20eae87c-17c6-52f6-90ff-8b2fa6fa7207', 'f1ba7747-eff9-590d-b922-153c99211d00', 'D', 'Euthyroid sick syndrome', false, 3),
  ('4f1285bf-e244-590b-9c4b-302a0b41d84c', 'f1ba7747-eff9-590d-b922-153c99211d00', 'E', 'Pituitary failure', false, 4);

-- Q264
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('aeb2e967-a19b-5a34-aa96-0dc5b9a0061c', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000004', 'sba', 'A 50 year old woman has had a total thyroidectomy. The next day she has tingling around her mouth and in her fingers. When the BP cuff is inflated above systolic pressure, her hand goes into spasm. What is this sign and the most likely cause?', 'Hypocalcaemia causes perioral and peripheral paraesthesia, muscle cramps, tetany, seizures and a long QT. Trousseau''s sign is carpopedal spasm with a BP cuff. Chvostek''s sign is facial twitching on tapping the facial nerve. Severe or symptomatic hypocalcaemia is treated with IV calcium gluconate. Check magnesium too, as low magnesium impairs PTH secretion.', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v3')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = 'aeb2e967-a19b-5a34-aa96-0dc5b9a0061c';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('d8fa99fd-2f30-52af-a739-68eaa10d3693', 'aeb2e967-a19b-5a34-aa96-0dc5b9a0061c', 'A', 'Trousseau''s sign; hypokalaemia', false, 0),
  ('d4367abb-c551-535d-9316-58bba6de6b88', 'aeb2e967-a19b-5a34-aa96-0dc5b9a0061c', 'B', 'Phalen''s sign; hypomagnesaemia', false, 1),
  ('3091cc04-13df-5bd0-a5a0-de0bc5b0bfb1', 'aeb2e967-a19b-5a34-aa96-0dc5b9a0061c', 'C', 'Chvostek''s sign; hypercalcaemia', false, 2),
  ('1854d3bf-9e38-50ec-b88a-df99dd3cf4eb', 'aeb2e967-a19b-5a34-aa96-0dc5b9a0061c', 'D', 'Tinel''s sign; carpal tunnel syndrome', false, 3),
  ('0328c60a-d2fe-5119-9e1d-7b69d610f9c9', 'aeb2e967-a19b-5a34-aa96-0dc5b9a0061c', 'E', 'Trousseau''s sign; hypocalcaemia from parathyroid damage', true, 4);

-- Q265
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('5412197c-ae34-5f07-aec9-12c41976ca09', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000004', 'sba', 'A 35 year old man has had kidney stones, peptic ulcers and hypercalcaemia. His brother had a pituitary tumour. What is the SINGLE most likely diagnosis?', 'MEN1 (menin gene, autosomal dominant): the ''3 Ps'' of parathyroid hyperplasia (95%, causing hypercalcaemia), pancreatic neuroendocrine tumours (gastrinoma, causing Zollinger-Ellison, or insulinoma), and pituitary adenomas (prolactinoma). MEN2A (RET): medullary thyroid cancer, phaeochromocytoma, parathyroid hyperplasia. MEN2B: medullary thyroid cancer, phaeochromocytoma, mucosal neuromas and a marfanoid habitus.', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v3')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = '5412197c-ae34-5f07-aec9-12c41976ca09';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('3ef20fae-1224-5777-a978-3773cd453341', '5412197c-ae34-5f07-aec9-12c41976ca09', 'A', 'Von Hippel-Lindau syndrome', false, 0),
  ('4586bcba-3bac-5d6b-a89d-c0b44ed93e4b', '5412197c-ae34-5f07-aec9-12c41976ca09', 'B', 'Neurofibromatosis type 1', false, 1),
  ('bc06cc25-461b-5c6e-b648-5c60c22ab5ce', '5412197c-ae34-5f07-aec9-12c41976ca09', 'C', 'Multiple endocrine neoplasia type 1 (MEN1)', true, 2),
  ('fd100792-aaa4-5d7f-bb00-f713f85bc834', '5412197c-ae34-5f07-aec9-12c41976ca09', 'D', 'MEN2A', false, 3),
  ('07f639e8-b57a-5f89-b44b-b7ff5b144be9', '5412197c-ae34-5f07-aec9-12c41976ca09', 'E', 'MEN2B', false, 4);

-- Q266
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('20eb3436-f0a9-5677-afe3-f9e3cd083765', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000004', 'sba', 'A 30 year old woman has a thyroid nodule. Her calcitonin is very high, and her father had a phaeochromocytoma. What is the SINGLE most likely diagnosis?', 'Medullary thyroid carcinoma comes from parafollicular C cells and secretes calcitonin (and CEA). About 25% are familial (MEN2A, MEN2B, or familial MTC, due to RET mutations). Exclude phaeochromocytoma before surgery. Family members are tested for RET mutations, and carriers have prophylactic thyroidectomy in childhood.', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v3')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = '20eb3436-f0a9-5677-afe3-f9e3cd083765';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('8d3c219f-cddc-539a-816a-456335162bd1', '20eb3436-f0a9-5677-afe3-f9e3cd083765', 'A', 'Anaplastic carcinoma', false, 0),
  ('f948622d-bd18-5daa-b69f-fb1816af2ed5', '20eb3436-f0a9-5677-afe3-f9e3cd083765', 'B', 'Follicular carcinoma', false, 1),
  ('c667a76b-6e52-558a-8837-6a0827b12bf8', '20eb3436-f0a9-5677-afe3-f9e3cd083765', 'C', 'Papillary carcinoma', false, 2),
  ('64a46e1f-6491-5574-8680-2cc4370db521', '20eb3436-f0a9-5677-afe3-f9e3cd083765', 'D', 'Thyroid lymphoma', false, 3),
  ('cb27bc2e-b579-5b71-bd9d-7bdd41a2dd8c', '20eb3436-f0a9-5677-afe3-f9e3cd083765', 'E', 'Medullary thyroid carcinoma (as part of MEN2)', true, 4);

-- Q267
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('71221860-6511-5697-8560-08878a500adc', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000004', 'sba', 'A 48 year old man has resistant hypertension and a potassium of 3.1 mmol/L. His aldosterone:renin ratio is high, and CT shows bilateral normal adrenals. What test helps decide whether surgery is appropriate?', 'Primary hyperaldosteronism is caused by an aldosterone-producing adenoma (Conn''s, unilateral, treated surgically) or bilateral adrenal hyperplasia (treated with spironolactone or eplerenone). CT can miss small adenomas or show incidental non-functioning nodules, so adrenal vein sampling is used to lateralise before adrenalectomy.', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v3')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = '71221860-6511-5697-8560-08878a500adc';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('623f514b-21a8-51d1-a7e7-0882eb32815e', '71221860-6511-5697-8560-08878a500adc', 'A', 'Short Synacthen test', false, 0),
  ('1a8e151a-ccb8-5ec3-81f9-6f3be0318f8b', '71221860-6511-5697-8560-08878a500adc', 'B', 'Plasma metanephrines', false, 1),
  ('b1430dc2-06e5-5d3d-9dd3-9536b846e532', '71221860-6511-5697-8560-08878a500adc', 'C', 'MIBG scan', false, 2),
  ('d691f438-1653-5dbb-b8ae-57fe0d2d0d5b', '71221860-6511-5697-8560-08878a500adc', 'D', 'Overnight dexamethasone suppression test', false, 3),
  ('4304b456-e15f-5029-947b-224995d79175', '71221860-6511-5697-8560-08878a500adc', 'E', 'Adrenal vein sampling to distinguish unilateral from bilateral aldosterone excess', true, 4);

-- Q268
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('cc0008e5-1d00-5c18-a557-48db8a1d35a0', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000004', 'sba', 'A 58 year old woman has a 2.5 cm adrenal mass found incidentally on CT for abdominal pain. It has a low attenuation (under 10 Hounsfield units). She has no hypertension or symptoms. What is the SINGLE most appropriate next step?', 'European guidelines on adrenal incidentalomas: assess for hormone excess (cortisol, catecholamines, aldosterone if hypertensive or hypokalaemic). A lipid-rich lesion (10 HU or less) under 4 cm is almost certainly benign and needs no further imaging if non-functioning. Large or indeterminate lesions need further imaging or surgery. Biopsy is rarely indicated.', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v3')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = 'cc0008e5-1d00-5c18-a557-48db8a1d35a0';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('8fcd2218-893b-5067-b325-1c15997f07e8', 'cc0008e5-1d00-5c18-a557-48db8a1d35a0', 'A', 'No further action at all', false, 0),
  ('dbc63122-1f1b-5d61-bc48-77c578c58703', 'cc0008e5-1d00-5c18-a557-48db8a1d35a0', 'B', 'Immediate adrenalectomy', false, 1),
  ('278c4a73-7f34-5d02-b6b3-319663b1193e', 'cc0008e5-1d00-5c18-a557-48db8a1d35a0', 'C', 'Hormonal work-up (dexamethasone suppression test, plasma metanephrines, and aldosterone:renin if hypertensive/hypokalaemic)', true, 2),
  ('6f1e2212-b2db-55bc-8d0e-26f35dd7b4c8', 'cc0008e5-1d00-5c18-a557-48db8a1d35a0', 'D', 'Repeat CT in 10 years', false, 3),
  ('6c6be517-1d85-50ef-a552-ab1b244ef56d', 'cc0008e5-1d00-5c18-a557-48db8a1d35a0', 'E', 'Adrenal biopsy', false, 4);

-- Q269
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('4b2578d7-7c75-5168-b7fd-d1f1668771da', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000004', 'sba', 'A 45 year old woman with Cushing''s syndrome has a raised ACTH. A high-dose dexamethasone suppression test suppresses cortisol, and corticotrophin-releasing hormone (CRH) testing shows an exaggerated ACTH rise. What is the SINGLE most likely cause?', 'ACTH-dependent Cushing''s comes from a pituitary adenoma (Cushing''s disease, about 80%) or ectopic ACTH. Pituitary adenomas usually suppress with high-dose dexamethasone and respond to CRH. Ectopic sources usually do not. Inferior petrosal sinus sampling confirms a pituitary source. ACTH-independent causes (adrenal adenoma or carcinoma, exogenous steroids) have a suppressed ACTH.', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v3')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = '4b2578d7-7c75-5168-b7fd-d1f1668771da';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('12ed9d03-61c3-5b92-a87a-894ff2a0f584', '4b2578d7-7c75-5168-b7fd-d1f1668771da', 'A', 'Exogenous steroid use', false, 0),
  ('935f8e94-bc83-59b8-8f49-c1562daa4d7a', '4b2578d7-7c75-5168-b7fd-d1f1668771da', 'B', 'Ectopic ACTH from small cell lung cancer', false, 1),
  ('9b89c93e-69a8-5ae3-ad2d-f3d5e4ffddb3', '4b2578d7-7c75-5168-b7fd-d1f1668771da', 'C', 'Cushing''s disease (pituitary ACTH-secreting adenoma)', true, 2),
  ('f96b6dfa-735b-51ef-a5fc-02443a417577', '4b2578d7-7c75-5168-b7fd-d1f1668771da', 'D', 'Adrenal carcinoma', false, 3),
  ('34c2a901-4d67-5a74-b77e-48e723c47ab0', '4b2578d7-7c75-5168-b7fd-d1f1668771da', 'E', 'Adrenal adenoma', false, 4);

-- Q270
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('7cd29066-7486-55d1-ad2e-c06f07909456', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000004', 'sba', 'A 30 year old man has gynaecomastia. He takes several medications. Which drug is MOST likely to cause it?', 'Drug causes of gynaecomastia include spironolactone, digoxin, cimetidine, finasteride, anti-androgens, oestrogens, anabolic steroids, cannabis, ketoconazole and some antipsychotics (via hyperprolactinaemia). Other causes are puberty, older age, liver cirrhosis, hypogonadism, hyperthyroidism, testicular tumours (hCG-secreting) and Klinefelter''s. Examine the testes.', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v3')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = '7cd29066-7486-55d1-ad2e-c06f07909456';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('17d38069-27cd-5f06-bbfd-009637449956', '7cd29066-7486-55d1-ad2e-c06f07909456', 'A', 'Amlodipine', false, 0),
  ('09dcc97b-07ec-5e1d-a63a-19f645e96810', '7cd29066-7486-55d1-ad2e-c06f07909456', 'B', 'Spironolactone', true, 1),
  ('22437b28-449f-5625-8a86-9e29c38bf082', '7cd29066-7486-55d1-ad2e-c06f07909456', 'C', 'Salbutamol', false, 2),
  ('7323b180-ebf6-569c-9815-95069fb0b75b', '7cd29066-7486-55d1-ad2e-c06f07909456', 'D', 'Metformin', false, 3),
  ('a7a0af50-238b-56a9-aecc-9ee2603e1f46', '7cd29066-7486-55d1-ad2e-c06f07909456', 'E', 'Paracetamol', false, 4);

-- Q271
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('872bc360-36d2-505e-8ab4-6dc2e0d21110', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000004', 'sba', 'A 52 year old man has a serum triglyceride of 24 mmol/L on a non-fasting sample, confirmed on repeat fasting. He drinks heavily and has poorly controlled diabetes. Which complication is he at particular risk of?', 'NICE: refer urgently if triglycerides are above 20 mmol/L (not caused by alcohol or poor glucose control) because of the risk of acute pancreatitis. Address secondary causes (alcohol, diabetes, hypothyroidism, drugs, renal disease). Fibrates and omega-3 fatty acids are used. Eruptive xanthomas and lipaemia retinalis can be seen.', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v3')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = '872bc360-36d2-505e-8ab4-6dc2e0d21110';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('0b6f9e6f-7c9c-5df9-b445-a6eeaae47b74', '872bc360-36d2-505e-8ab4-6dc2e0d21110', 'A', 'Myocarditis', false, 0),
  ('2b19e107-23a3-50c8-aa38-0ffcc73ea208', '872bc360-36d2-505e-8ab4-6dc2e0d21110', 'B', 'Hypocalcaemia only', false, 1),
  ('f295961c-097e-5b02-87f0-92da20fd1774', '872bc360-36d2-505e-8ab4-6dc2e0d21110', 'C', 'Gallstone ileus', false, 2),
  ('6ef26db1-6404-5f5d-9ea2-13b8c2f37019', '872bc360-36d2-505e-8ab4-6dc2e0d21110', 'D', 'Acute pancreatitis', true, 3),
  ('171b6aff-d250-5dce-98d4-a2f5ed10374d', '872bc360-36d2-505e-8ab4-6dc2e0d21110', 'E', 'Peptic ulcer', false, 4);

-- Q272
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('0d73333a-ecc4-51f5-971b-f22b13e35ad6', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000004', 'sba', 'A 45 year old woman has vitamin D deficiency (25-OH vitamin D 18 nmol/L) with aching bones and proximal weakness. Calcium is normal and renal function is normal. What is the SINGLE most appropriate treatment?', 'NOS/NICE CKS: vitamin D below 25 nmol/L is deficient. Treat with a loading regimen of colecalciferol (such as 50,000 IU weekly for 6 weeks), then maintenance (800-2000 IU daily). Check calcium 1 month after loading (it can unmask primary hyperparathyroidism). Calcitriol and alfacalcidol are used in renal failure and hypoparathyroidism.', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v3')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = '0d73333a-ecc4-51f5-971b-f22b13e35ad6';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('42cd6a5a-a1ce-5768-9059-004bfec792d3', '0d73333a-ecc4-51f5-971b-f22b13e35ad6', 'A', 'Bisphosphonate only', false, 0),
  ('bdde97e5-8e0e-5bcf-80e5-0bdef49e6f7b', '0d73333a-ecc4-51f5-971b-f22b13e35ad6', 'B', 'A loading course of colecalciferol (e.g. about 300,000 units total over 6-10 weeks), then maintenance', true, 1),
  ('1b60087c-69f6-5615-b1c5-ba581e5a5c9c', '0d73333a-ecc4-51f5-971b-f22b13e35ad6', 'C', 'IV calcium', false, 2),
  ('b8e117b9-12a1-588f-88d3-4391e1c626d6', '0d73333a-ecc4-51f5-971b-f22b13e35ad6', 'D', 'No treatment', false, 3),
  ('479ffeba-ef58-5d15-aab8-03ed6e6846e7', '0d73333a-ecc4-51f5-971b-f22b13e35ad6', 'E', 'Calcitriol (activated vitamin D) first-line', false, 4);

-- Q273
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('d546b57e-9310-5d8f-8fb5-bdb038f704bd', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000004', 'sba', 'A 34 year old woman with a BMI of 33 has tried diet and exercise without success. She asks about drug treatment for weight loss. She has no diabetes. Which statement about current NICE-approved options is CORRECT?', 'NICE technology appraisals for semaglutide and tirzepatide allow use for adults with at least one weight-related comorbidity and BMI above set thresholds, with diet and activity support, within defined services. Orlistat (lipase inhibitor) is also an option. Bariatric surgery is considered at BMI 40, or 35 with comorbidities (lower for some ethnic groups).', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v3')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = 'd546b57e-9310-5d8f-8fb5-bdb038f704bd';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('3d53a68c-25ec-50f1-9f96-e2ea22bd77d3', 'd546b57e-9310-5d8f-8fb5-bdb038f704bd', 'A', 'Phentermine is first-line in the UK', false, 0),
  ('bbdff8e5-997e-5991-adae-ea4c93979f15', 'd546b57e-9310-5d8f-8fb5-bdb038f704bd', 'B', 'Metformin is licensed for weight loss in non-diabetics', false, 1),
  ('2c262b60-a4a6-5c09-b4e2-5c8018bced44', 'd546b57e-9310-5d8f-8fb5-bdb038f704bd', 'C', 'Semaglutide or tirzepatide may be used within a specialist weight management service (or per NICE criteria), with diet and exercise', true, 2),
  ('557258fc-6823-57d3-8e06-5aba3ed88684', 'd546b57e-9310-5d8f-8fb5-bdb038f704bd', 'D', 'Sibutramine is recommended', false, 3),
  ('4c849eb5-d99a-5ab0-9cf9-26b62c479047', 'd546b57e-9310-5d8f-8fb5-bdb038f704bd', 'E', 'Bariatric surgery is first-line at BMI 30', false, 4);

-- Q274
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('27c09a94-bc1d-57f5-bb34-3bc0493d1eb5', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000004', 'sba', 'A 62 year old man with hypertension, hypokalaemia and metabolic alkalosis has dark skin pigmentation, rapid onset of weakness and weight loss. He has a 60 pack-year smoking history. ACTH and cortisol are very high and do not suppress with high-dose dexamethasone. What is the SINGLE most likely cause?', 'Ectopic ACTH syndrome (often small cell lung cancer or carcinoid) produces very high ACTH and cortisol, causing rapid onset of hypokalaemic alkalosis, hypertension, weakness, pigmentation and weight loss, sometimes without the classic Cushingoid appearance. It does not suppress with high-dose dexamethasone. Image the chest.', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v3')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = '27c09a94-bc1d-57f5-bb34-3bc0493d1eb5';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('bc7b152b-50cb-54a8-bd8b-189bdb44efc3', '27c09a94-bc1d-57f5-bb34-3bc0493d1eb5', 'A', 'Adrenal adenoma', false, 0),
  ('a9e38442-95ee-5261-af01-ae573b40de4d', '27c09a94-bc1d-57f5-bb34-3bc0493d1eb5', 'B', 'Cushing''s disease', false, 1),
  ('69ee8e42-a062-5ce6-b1d9-c0d6331863e3', '27c09a94-bc1d-57f5-bb34-3bc0493d1eb5', 'C', 'Exogenous steroids', false, 2),
  ('280fec84-8be0-59ac-acf4-2c4c0b029dbf', '27c09a94-bc1d-57f5-bb34-3bc0493d1eb5', 'D', 'Ectopic ACTH secretion from small cell lung cancer', true, 3),
  ('08d8c30a-8602-5b77-a369-af8e4b519233', '27c09a94-bc1d-57f5-bb34-3bc0493d1eb5', 'E', 'Conn''s syndrome', false, 4);

-- Q275
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('903eb5c9-198b-5be5-a8cf-e2fc69776004', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000004', 'sba', 'A 55 year old man on lithium for 15 years has polyuria and polydipsia. His sodium is 148 mmol/L, urine osmolality is low and does not rise after desmopressin. What is the SINGLE most likely diagnosis?', 'Nephrogenic DI is resistance of the kidney to ADH. Causes include lithium, hypercalcaemia, hypokalaemia and inherited forms. Urine stays dilute after desmopressin. In cranial DI, urine concentrates after desmopressin. Treatment is addressing the cause, adequate fluid intake, and thiazides or NSAIDs. In primary polydipsia, urine concentrates with water deprivation.', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v3')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = '903eb5c9-198b-5be5-a8cf-e2fc69776004';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('d63d3906-4a12-5b88-868e-cfb42ff95814', '903eb5c9-198b-5be5-a8cf-e2fc69776004', 'A', 'Cranial diabetes insipidus', false, 0),
  ('d61ba41c-4328-5646-8a71-cc968724357c', '903eb5c9-198b-5be5-a8cf-e2fc69776004', 'B', 'Primary polydipsia', false, 1),
  ('4bd51fc6-99b7-5daf-9da1-b49c4f50c836', '903eb5c9-198b-5be5-a8cf-e2fc69776004', 'C', 'Nephrogenic diabetes insipidus (arginine vasopressin resistance)', true, 2),
  ('4663dbae-e00d-57bd-81fd-e0d149e62dff', '903eb5c9-198b-5be5-a8cf-e2fc69776004', 'D', 'Diabetes mellitus', false, 3),
  ('74d933b3-fc45-5753-aba4-e08dcc91c111', '903eb5c9-198b-5be5-a8cf-e2fc69776004', 'E', 'SIADH', false, 4);

-- Q276
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('4fa7efd9-cb7d-51c2-903e-3368f79b531d', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000004', 'sba', 'A 40 year old woman with long-term alcohol misuse is being refed. Her phosphate is 0.3 mmol/L. She has muscle weakness and breathlessness. What is the SINGLE most appropriate treatment?', 'Severe hypophosphataemia (below 0.32 mmol/L) can cause respiratory muscle weakness, rhabdomyolysis, heart failure, haemolysis and confusion. It is common in refeeding, alcohol misuse and DKA recovery. Replace IV for severe or symptomatic cases, and orally for milder ones. Check calcium, magnesium and potassium too.', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v3')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = '4fa7efd9-cb7d-51c2-903e-3368f79b531d';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('0a43515e-a762-5933-9bf5-765b652f9faf', '4fa7efd9-cb7d-51c2-903e-3368f79b531d', 'A', 'Oral calcium carbonate', false, 0),
  ('9fe8559a-95f7-58ea-ba8a-178334f2e705', '4fa7efd9-cb7d-51c2-903e-3368f79b531d', 'B', 'IV calcium gluconate', false, 1),
  ('9f75d724-673d-53b0-9c90-9560b7c34883', '4fa7efd9-cb7d-51c2-903e-3368f79b531d', 'C', 'Stop all feeding permanently', false, 2),
  ('294d3c93-f6a9-515f-9607-c469dfefa121', '4fa7efd9-cb7d-51c2-903e-3368f79b531d', 'D', 'IV insulin', false, 3),
  ('c30f56c5-f153-5fc5-8414-d246345c7637', '4fa7efd9-cb7d-51c2-903e-3368f79b531d', 'E', 'IV phosphate replacement (e.g. phosphate polyfusor), with careful monitoring', true, 4);

-- Q277
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('dc49cb3a-29b0-5015-ab6e-d1525771b590', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000004', 'sba', 'A 30 year old man has low libido, erectile dysfunction and reduced shaving. Morning testosterone is low on 2 occasions, with low LH and FSH. He has no sense of smell. What is the SINGLE most likely diagnosis?', 'Hypogonadotropic hypogonadism (low testosterone with low or inappropriately normal LH/FSH) points to a hypothalamic or pituitary cause. Kallmann syndrome (failure of GnRH neurone migration) is linked to anosmia. Primary testicular failure (Klinefelter''s) gives high LH and FSH. Check prolactin and MRI pituitary. Treatment is testosterone, or gonadotrophins if fertility is wanted.', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v3')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = 'dc49cb3a-29b0-5015-ab6e-d1525771b590';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('70f37bd0-e6df-527e-bb96-8a9c081ec9db', 'dc49cb3a-29b0-5015-ab6e-d1525771b590', 'A', 'Klinefelter syndrome', false, 0),
  ('48bd5f05-9f7e-5955-b671-58bfd0939221', 'dc49cb3a-29b0-5015-ab6e-d1525771b590', 'B', 'Kallmann syndrome (hypogonadotropic hypogonadism with anosmia)', true, 1),
  ('c5928b77-1e15-5c57-86cb-2be32db10ba1', 'dc49cb3a-29b0-5015-ab6e-d1525771b590', 'C', 'Prolactinoma', false, 2),
  ('85d9ff40-3896-5513-84f6-1d1e164c65ff', 'dc49cb3a-29b0-5015-ab6e-d1525771b590', 'D', 'Primary testicular failure', false, 3),
  ('8747e662-57f7-50f0-b65f-23a91daa1d1b', 'dc49cb3a-29b0-5015-ab6e-d1525771b590', 'E', 'Androgen insensitivity', false, 4);

-- Q278
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('8658a7b0-f078-5320-8cbf-f01fc0401887', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000014', 'sba', 'A 62 year old man has iron-deficiency anaemia (Hb 102 g/L, low ferritin). He has no GI symptoms. What is the SINGLE most appropriate next step?', 'BSG guidance: unexplained iron-deficiency anaemia in men and postmenopausal women needs bidirectional endoscopy (or CT colonography) and coeliac serology, and urine dipstick for haematuria. NICE NG12: iron-deficiency anaemia at 60 or over warrants a suspected cancer referral for lower GI cancer. Start iron while investigating.', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v3')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = '8658a7b0-f078-5320-8cbf-f01fc0401887';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('bc7b8256-6985-5471-91e9-e36dfad755c5', '8658a7b0-f078-5320-8cbf-f01fc0401887', 'A', 'Reassure, as he has no symptoms', false, 0),
  ('572a59c1-db16-518b-b9eb-3a59908b6247', '8658a7b0-f078-5320-8cbf-f01fc0401887', 'B', 'Suspected cancer pathway referral for upper and lower GI investigation (endoscopy and colonoscopy), with coeliac serology', true, 1),
  ('86c13bd4-3c96-5acb-81de-da1c14a366b0', '8658a7b0-f078-5320-8cbf-f01fc0401887', 'C', 'Blood transfusion', false, 2),
  ('7e1d9a3f-a2ae-56ca-b79d-3fb21d7d3a29', '8658a7b0-f078-5320-8cbf-f01fc0401887', 'D', 'Oral iron and review in 1 year', false, 3),
  ('b3c5720a-fdf4-56ee-995d-47f18f6fc3f8', '8658a7b0-f078-5320-8cbf-f01fc0401887', 'E', 'Bone marrow biopsy', false, 4);

-- Q279
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('f425d842-ebf5-529d-8c8b-6ea6158be9a7', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000014', 'sba', 'A 60 year old woman with rheumatoid arthritis has Hb 104 g/L, MCV 84 fL, low serum iron, low TIBC and normal-to-high ferritin. What is the SINGLE most likely diagnosis?', 'Anaemia of chronic disease (hepcidin-mediated iron sequestration) is normocytic or mildly microcytic, with low serum iron, low or normal TIBC and normal or raised ferritin (an acute phase protein). In iron deficiency, TIBC is high and ferritin is low. Treat the underlying inflammation. Ferritin below about 100 µg/L may still mean iron deficiency when inflammation is present.', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v3')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = 'f425d842-ebf5-529d-8c8b-6ea6158be9a7';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('9234791c-0683-5b2c-a86c-2a2d310d4c31', 'f425d842-ebf5-529d-8c8b-6ea6158be9a7', 'A', 'Anaemia of chronic disease (inflammation)', true, 0),
  ('6a754ae6-8a9b-54f1-bf50-a9ad654fc18b', 'f425d842-ebf5-529d-8c8b-6ea6158be9a7', 'B', 'Thalassaemia trait', false, 1),
  ('f9605b7f-ed3b-59a1-81f9-ee8142f59286', 'f425d842-ebf5-529d-8c8b-6ea6158be9a7', 'C', 'Sideroblastic anaemia', false, 2),
  ('60e09b7d-1ea5-5270-a8c3-306d36b6d0df', 'f425d842-ebf5-529d-8c8b-6ea6158be9a7', 'D', 'Iron-deficiency anaemia', false, 3),
  ('c8ee04e6-0119-5be5-9969-de1d2571e548', 'f425d842-ebf5-529d-8c8b-6ea6158be9a7', 'E', 'B12 deficiency', false, 4);

-- Q280
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('8609d5e6-70f0-5b9d-9329-b98893df0915', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000014', 'sba', 'A 25 year old man had a Mycoplasma pneumonia 2 weeks ago. He now has anaemia, jaundice, and his fingers turn blue in the cold. DAT is positive for C3d only, and cold agglutinins are present. What is the SINGLE most likely diagnosis?', 'Cold AIHA is IgM-mediated and complement-fixing (DAT positive for C3). It is associated with Mycoplasma, EBV and lymphoproliferative disorders. Symptoms are worse in the cold (acrocyanosis). Management is keeping warm and treating the cause (rituximab in primary cold agglutinin disease). Warm AIHA (IgG, DAT IgG plus or minus C3) is linked to SLE, CLL and drugs, and is treated with steroids.', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v3')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = '8609d5e6-70f0-5b9d-9329-b98893df0915';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('48874a1c-fb9c-5c45-99f2-01ddc1323d48', '8609d5e6-70f0-5b9d-9329-b98893df0915', 'A', 'G6PD deficiency', false, 0),
  ('47572147-3238-5ef0-9313-ebdee82cc381', '8609d5e6-70f0-5b9d-9329-b98893df0915', 'B', 'Hereditary spherocytosis', false, 1),
  ('2bb3b54f-9aec-5901-b1d6-038733e08821', '8609d5e6-70f0-5b9d-9329-b98893df0915', 'C', 'Cold autoimmune haemolytic anaemia (IgM)', true, 2),
  ('3de33c86-dd98-5fbe-866f-ec9758b68633', '8609d5e6-70f0-5b9d-9329-b98893df0915', 'D', 'Paroxysmal nocturnal haemoglobinuria', false, 3),
  ('8e029e69-8037-531a-acd6-83c4b3b14000', '8609d5e6-70f0-5b9d-9329-b98893df0915', 'E', 'Warm autoimmune haemolytic anaemia (IgG)', false, 4);

-- Q281
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('c72fcaf4-1fff-5a1e-801d-03ecb8876315', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000014', 'sba', 'A 30 year old man has dark urine in the morning, fatigue and a recent hepatic vein thrombosis. Bloods show haemolysis with a negative DAT and pancytopenia. Flow cytometry shows loss of CD55 and CD59 on red cells. What is the SINGLE most likely diagnosis?', 'PNH is an acquired clonal disorder (PIGA mutation) where loss of GPI-anchored proteins (CD55, CD59) leaves red cells sensitive to complement-mediated lysis. It causes intravascular haemolysis (haemoglobinuria), thrombosis at unusual sites (Budd-Chiari, cerebral veins) and marrow failure. Treatment is complement inhibitors (eculizumab, ravulizumab) with meningococcal vaccination.', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v3')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = 'c72fcaf4-1fff-5a1e-801d-03ecb8876315';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('03fcf3fd-531b-5c1d-b842-7a57c5ff29f5', 'c72fcaf4-1fff-5a1e-801d-03ecb8876315', 'A', 'Sickle cell disease', false, 0),
  ('acbf460e-7897-5402-b7eb-c5cdb161b353', 'c72fcaf4-1fff-5a1e-801d-03ecb8876315', 'B', 'Thalassaemia', false, 1),
  ('f9013f9b-4a29-528d-8841-e4004f341382', 'c72fcaf4-1fff-5a1e-801d-03ecb8876315', 'C', 'Hereditary spherocytosis', false, 2),
  ('e0f69c46-6b81-53f3-8dad-ecacf4da3653', 'c72fcaf4-1fff-5a1e-801d-03ecb8876315', 'D', 'Autoimmune haemolytic anaemia', false, 3),
  ('4a8d5c3d-0ffc-5d9c-a9ad-c9dbb49e0d56', 'c72fcaf4-1fff-5a1e-801d-03ecb8876315', 'E', 'Paroxysmal nocturnal haemoglobinuria', true, 4);

-- Q282
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('0cb6f7b5-2b5f-5970-b72b-67f0596c37e5', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000014', 'sba', 'A 19 year old man with sickle cell disease has chest pain, fever, cough and SpO2 of 89% on air. Chest X-ray shows new bilateral infiltrates. What is the SINGLE most likely diagnosis?', 'Acute chest syndrome (new infiltrate plus chest pain, fever, respiratory symptoms or hypoxia) is a leading cause of death in sickle cell disease. Treatment: oxygen, analgesia, incentive spirometry, antibiotics (covering atypicals), fluids, and transfusion (simple or exchange), with early critical care input.', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v3')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = '0cb6f7b5-2b5f-5970-b72b-67f0596c37e5';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('4af7d78b-3e41-5eba-a612-15446a94dd87', '0cb6f7b5-2b5f-5970-b72b-67f0596c37e5', 'A', 'Simple community-acquired pneumonia only', false, 0),
  ('2a5bb878-4db8-5f89-83ab-280317d27f8d', '0cb6f7b5-2b5f-5970-b72b-67f0596c37e5', 'B', 'Aplastic crisis', false, 1),
  ('3f4166bf-a7d6-5240-aeed-0a59442be83c', '0cb6f7b5-2b5f-5970-b72b-67f0596c37e5', 'C', 'Splenic sequestration', false, 2),
  ('363ea061-6828-50e0-9c14-28da550e5670', '0cb6f7b5-2b5f-5970-b72b-67f0596c37e5', 'D', 'Acute chest syndrome', true, 3),
  ('6ed036f1-a4a7-5440-93e2-a048fdbeb698', '0cb6f7b5-2b5f-5970-b72b-67f0596c37e5', 'E', 'Pulmonary embolism', false, 4);

-- Q283
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('a5a5f9e0-6412-5038-8837-503f94f3e4ba', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000014', 'sba', 'A 16 year old with beta-thalassaemia major receives regular blood transfusions. His ferritin is 3,500 µg/L. What is the SINGLE most important additional treatment?', 'Regular transfusions cause iron overload, damaging the heart (cardiomyopathy, which is the main cause of death), liver and endocrine glands (diabetes, hypogonadism, hypothyroidism). Chelation therapy (desferrioxamine subcutaneous infusion, deferasirox or deferiprone orally) is essential. Cardiac T2* MRI monitors cardiac iron. Stem cell transplant can be curative.', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v3')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = 'a5a5f9e0-6412-5038-8837-503f94f3e4ba';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('db17c137-f32e-5c49-9bf9-501b545b61cf', 'a5a5f9e0-6412-5038-8837-503f94f3e4ba', 'A', 'Vitamin C high dose alone', false, 0),
  ('70275146-a6f7-5a2b-b03e-7098be01176f', 'a5a5f9e0-6412-5038-8837-503f94f3e4ba', 'B', 'Venesection', false, 1),
  ('be2e5d2c-ae65-5a31-a48b-c7d396bed5bc', 'a5a5f9e0-6412-5038-8837-503f94f3e4ba', 'C', 'Folic acid alone', false, 2),
  ('c6388e5d-9171-5583-b061-bdcb0773495e', 'a5a5f9e0-6412-5038-8837-503f94f3e4ba', 'D', 'Oral iron supplements', false, 3),
  ('82d78002-0fb8-524b-97f5-757c05035928', 'a5a5f9e0-6412-5038-8837-503f94f3e4ba', 'E', 'Iron chelation therapy (e.g. desferrioxamine, deferasirox)', true, 4);

-- Q284
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('3c7f7621-ec22-5d3f-8d6a-6a7ee56575bd', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000014', 'sba', 'A 45 year old man who drinks heavily has an MCV of 108 fL. B12 and folate are normal, and there is no anaemia. The blood film shows round macrocytes without hypersegmented neutrophils. LFTs show a raised GGT. What is the SINGLE most likely cause of the macrocytosis?', 'Alcohol is the commonest cause of macrocytosis without anaemia in the UK (often with a raised GGT). Other non-megaloblastic causes are liver disease, hypothyroidism, reticulocytosis, pregnancy, myelodysplasia and drugs (methotrexate, hydroxycarbamide, azathioprine). Megaloblastic causes (B12 or folate deficiency) give oval macrocytes and hypersegmented neutrophils.', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v3')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = '3c7f7621-ec22-5d3f-8d6a-6a7ee56575bd';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('c762a87c-25af-5279-9385-ab9de66bd903', '3c7f7621-ec22-5d3f-8d6a-6a7ee56575bd', 'A', 'Haemolysis', false, 0),
  ('edefbabd-7fef-587b-a1c8-d58b86a07a3b', '3c7f7621-ec22-5d3f-8d6a-6a7ee56575bd', 'B', 'Hypothyroidism only', false, 1),
  ('0ed900ce-dee6-54de-a5b1-8d1fae3d23dd', '3c7f7621-ec22-5d3f-8d6a-6a7ee56575bd', 'C', 'Pernicious anaemia', false, 2),
  ('3b621a57-7d5d-5449-80ab-0fe35991fb6f', '3c7f7621-ec22-5d3f-8d6a-6a7ee56575bd', 'D', 'Alcohol excess', true, 3),
  ('7bcb10e0-6603-58fa-bc82-bc68a257034f', '3c7f7621-ec22-5d3f-8d6a-6a7ee56575bd', 'E', 'Myelodysplasia', false, 4);

-- Q285
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('601cec1a-7dad-5df2-89ab-f8165ddd596a', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000014', 'sba', 'A 55 year old man has had a splenectomy. Which finding would MOST be expected on his blood film?', 'After splenectomy or with hyposplenism (sickle cell disease, coeliac disease), the film shows Howell-Jolly bodies (nuclear remnants), target cells, Pappenheimer bodies, acanthocytes and a raised platelet count. Smudge cells suggest CLL, schistocytes suggest MAHA, Auer rods suggest AML, and bite cells suggest G6PD deficiency.', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v3')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = '601cec1a-7dad-5df2-89ab-f8165ddd596a';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('87486789-00d7-5c54-b714-35d60d6b9852', '601cec1a-7dad-5df2-89ab-f8165ddd596a', 'A', 'Bite cells', false, 0),
  ('31cc7448-9a18-55fd-9b57-bdfdccbfb4e9', '601cec1a-7dad-5df2-89ab-f8165ddd596a', 'B', 'Schistocytes', false, 1),
  ('83e478e9-07c7-5bff-af92-7e2f8685c35e', '601cec1a-7dad-5df2-89ab-f8165ddd596a', 'C', 'Howell-Jolly bodies and target cells', true, 2),
  ('6d606a29-6ff2-57fa-8d92-c5b13a804a8b', '601cec1a-7dad-5df2-89ab-f8165ddd596a', 'D', 'Smudge cells', false, 3),
  ('d28fe917-af70-5958-83c4-fe78c028d586', '601cec1a-7dad-5df2-89ab-f8165ddd596a', 'E', 'Auer rods', false, 4);

-- Q286
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('4835a051-e162-52b7-b131-2928e5216d46', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000014', 'sba', 'A 70 year old man has fatigue and a massively enlarged spleen. His blood film shows teardrop red cells (dacrocytes) and a leucoerythroblastic picture. Bone marrow aspiration gives a ''dry tap''. What is the SINGLE most likely diagnosis?', 'Myelofibrosis is a myeloproliferative neoplasm (JAK2, CALR or MPL mutations) with marrow fibrosis, extramedullary haematopoiesis (massive splenomegaly), a leucoerythroblastic film and teardrop cells. Marrow aspiration is often a dry tap, so trephine biopsy is needed. Treatment includes JAK inhibitors (ruxolitinib), transfusion and stem cell transplant for selected patients.', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v3')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = '4835a051-e162-52b7-b131-2928e5216d46';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('f0f8d683-7ae3-5cf7-a2bd-38c659fa8cb7', '4835a051-e162-52b7-b131-2928e5216d46', 'A', 'Hairy cell leukaemia', false, 0),
  ('7de47ec3-1fd3-58d6-a8fa-7575efd92c98', '4835a051-e162-52b7-b131-2928e5216d46', 'B', 'Primary myelofibrosis', true, 1),
  ('f6103821-aca3-534f-819d-11c932d1d14b', '4835a051-e162-52b7-b131-2928e5216d46', 'C', 'Polycythaemia vera', false, 2),
  ('7f256611-0e09-54de-8d46-18d909f2e449', '4835a051-e162-52b7-b131-2928e5216d46', 'D', 'Iron-deficiency anaemia', false, 3),
  ('0dfade25-46e9-56a4-8c42-18d28e96ce9b', '4835a051-e162-52b7-b131-2928e5216d46', 'E', 'Chronic myeloid leukaemia', false, 4);

-- Q287
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('97b762d5-b999-5063-a26c-a64246bf5a6b', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000014', 'sba', 'A 35 year old woman has bruising, bleeding gums and fever. Blood tests show pancytopenia with abnormal promyelocytes containing many Auer rods, a prolonged PT and low fibrinogen. What is the SINGLE most likely diagnosis?', 'APL (AML M3, PML-RARA t(15;17)) presents with DIC and bleeding. It is a medical emergency, but with all-trans retinoic acid (ATRA) and arsenic trioxide it has a very high cure rate. Start ATRA immediately when APL is suspected, and support with platelets, cryoprecipitate and FFP. Watch for differentiation syndrome.', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v3')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = '97b762d5-b999-5063-a26c-a64246bf5a6b';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('2ab3a936-7564-5072-a76c-df2eeb12719d', '97b762d5-b999-5063-a26c-a64246bf5a6b', 'A', 'Acute promyelocytic leukaemia (APL, t(15;17))', true, 0),
  ('bfc0a95a-8219-5b60-a7e7-7b23067fa506', '97b762d5-b999-5063-a26c-a64246bf5a6b', 'B', 'Acute lymphoblastic leukaemia', false, 1),
  ('5191a2f0-58a1-591f-b43e-9e2a364b5040', '97b762d5-b999-5063-a26c-a64246bf5a6b', 'C', 'Immune thrombocytopenia', false, 2),
  ('14117380-fec2-5310-93b4-dd92e7bd2c5a', '97b762d5-b999-5063-a26c-a64246bf5a6b', 'D', 'Chronic myeloid leukaemia', false, 3),
  ('4282deab-bb4d-5a07-b468-47b0073a0a74', '97b762d5-b999-5063-a26c-a64246bf5a6b', 'E', 'Aplastic anaemia', false, 4);

-- Q288
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('6ec21713-6586-51ee-8417-5073e220615e', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000014', 'sba', 'A 68 year old man with myeloma has nephrotic-range proteinuria, peripheral neuropathy, an enlarged tongue, easy bruising around the eyes and heart failure. What is the SINGLE most likely complication?', 'AL amyloidosis is caused by deposits of misfolded immunoglobulin light chains in the kidney (nephrotic syndrome), heart (restrictive cardiomyopathy), nerves (neuropathy, carpal tunnel), tongue (macroglossia), liver and skin (periorbital purpura). Diagnose with Congo red staining (apple-green birefringence) on fat pad or organ biopsy. Treatment is chemotherapy targeting the plasma cell clone.', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v3')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = '6ec21713-6586-51ee-8417-5073e220615e';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('e1f85426-fa58-5f44-b4b7-95154434b0ac', '6ec21713-6586-51ee-8417-5073e220615e', 'A', 'Cast nephropathy only', false, 0),
  ('c16f94df-8156-5d0b-bd90-044ef9405f51', '6ec21713-6586-51ee-8417-5073e220615e', 'B', 'Hyperviscosity syndrome', false, 1),
  ('594552f6-2b8a-550a-85b6-b1db86cff406', '6ec21713-6586-51ee-8417-5073e220615e', 'C', 'Cryoglobulinaemia', false, 2),
  ('dec1abd1-6eac-52a0-ab0e-115b04b89328', '6ec21713-6586-51ee-8417-5073e220615e', 'D', 'Hypercalcaemia', false, 3),
  ('c490f4e1-12aa-50f1-8d7e-165a7552db4c', '6ec21713-6586-51ee-8417-5073e220615e', 'E', 'AL (light-chain) amyloidosis', true, 4);

-- Q289
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('1ec42fd6-aa2a-5710-ba7d-72e12775034a', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000014', 'sba', 'A 32 year old woman had a DVT 4 weeks after starting the combined pill. Her mother had a PE at 40. Testing shows she is heterozygous for a common inherited thrombophilia that causes resistance to activated protein C. What is it?', 'Factor V Leiden is the commonest inherited thrombophilia in Europeans (about 5% of people are heterozygous). It causes activated protein C resistance. The VTE risk is multiplied by oestrogens and pregnancy. Avoid combined hormonal contraception and oestrogen HRT. NICE does not recommend routine thrombophilia testing in most people with provoked VTE.', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v3')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = '1ec42fd6-aa2a-5710-ba7d-72e12775034a';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('0e54339f-2460-510e-b2ad-2acf76bdcf1a', '1ec42fd6-aa2a-5710-ba7d-72e12775034a', 'A', 'Antiphospholipid syndrome', false, 0),
  ('0996ff54-51d7-5a6a-ac10-9032cb43857f', '1ec42fd6-aa2a-5710-ba7d-72e12775034a', 'B', 'Protein C deficiency', false, 1),
  ('53091674-9c6d-528e-a91e-20b5e66f376b', '1ec42fd6-aa2a-5710-ba7d-72e12775034a', 'C', 'Factor V Leiden', true, 2),
  ('7bfd6965-e580-5cdd-b0e7-43af19e0b786', '1ec42fd6-aa2a-5710-ba7d-72e12775034a', 'D', 'Prothrombin G20210A mutation', false, 3),
  ('96add8f9-0782-5c48-999d-348fa6abfffe', '1ec42fd6-aa2a-5710-ba7d-72e12775034a', 'E', 'Antithrombin deficiency', false, 4);

-- Q290
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('cb29b726-30cc-5614-a087-62e718f6cbed', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000014', 'sba', 'A 64 year old man with active metastatic colorectal cancer has a new proximal DVT. What is the MOST appropriate anticoagulant, considering his low bleeding risk?', 'NICE NG158: for VTE with active cancer, offer a DOAC (apixaban or rivaroxaban) unless contraindicated (such as GI or genitourinary cancers with high bleeding risk, or drug interactions), otherwise LMWH. Treat for 3-6 months and review, continuing while the cancer is active. Warfarin is less effective in cancer.', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v3')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = 'cb29b726-30cc-5614-a087-62e718f6cbed';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('4fd99092-c532-55ff-bb30-701325c808b3', 'cb29b726-30cc-5614-a087-62e718f6cbed', 'A', 'A DOAC (apixaban or rivaroxaban/edoxaban), or LMWH, for at least 6 months', true, 0),
  ('780b89cf-6785-57a1-a83c-05c576072972', 'cb29b726-30cc-5614-a087-62e718f6cbed', 'B', 'Warfarin as first-line', false, 1),
  ('70f8c6c1-8663-5c80-b4d0-4f732b740f8b', 'cb29b726-30cc-5614-a087-62e718f6cbed', 'C', 'Aspirin', false, 2),
  ('c2a77cd3-319d-52fc-a993-f2eca0754186', 'cb29b726-30cc-5614-a087-62e718f6cbed', 'D', 'No anticoagulation', false, 3),
  ('d863e0c8-016a-5aed-b77c-6bcd51257db4', 'cb29b726-30cc-5614-a087-62e718f6cbed', 'E', 'IVC filter only', false, 4);

-- Q291
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('504980e8-a14e-590d-8810-ea16d01124d1', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000014', 'sba', 'A 72 year old man had a hip replacement. On day 3, he needs a blood transfusion. He has a history of Hodgkin lymphoma treated with purine analogues (fludarabine). Which special blood product requirement applies?', 'Irradiated products are needed for patients at risk of transfusion-associated GvHD: those treated with purine analogues (fludarabine, cladribine), patients with Hodgkin lymphoma, stem cell transplant recipients, and in congenital immunodeficiencies and intrauterine or neonatal exchange transfusions. TA-GvHD is almost always fatal.', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v3')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = '504980e8-a14e-590d-8810-ea16d01124d1';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('33d7ac67-c123-5455-a0ee-44658f027b92', '504980e8-a14e-590d-8810-ea16d01124d1', 'A', 'Group O blood only', false, 0),
  ('973ba867-939e-5f32-a4c3-88b4e158d1a6', '504980e8-a14e-590d-8810-ea16d01124d1', 'B', 'Irradiated blood components (to prevent transfusion-associated graft-versus-host disease)', true, 1),
  ('d8b7b9f5-d09e-5cc6-aefb-2e0db6cc8a6d', '504980e8-a14e-590d-8810-ea16d01124d1', 'C', 'Washed red cells only', false, 2),
  ('1de5fb25-1e9c-508b-a9de-97101d20cbcc', '504980e8-a14e-590d-8810-ea16d01124d1', 'D', 'CMV-negative only', false, 3),
  ('3396ad07-79c6-5709-bb29-21793678556f', '504980e8-a14e-590d-8810-ea16d01124d1', 'E', 'No special requirement', false, 4);

-- Q292
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('27dd8049-b1f7-5a64-ba37-168a22a7f46e', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000014', 'sba', 'A trauma patient is receiving a massive transfusion. Which approach is recommended in the early phase of major haemorrhage?', 'Major haemorrhage protocols use early balanced transfusion (red cells and plasma in about a 1:1 ratio), with platelets and cryoprecipitate guided by point-of-care tests or labs (keep fibrinogen above 1.5 g/L, platelets above 50 x10^9/L). Give tranexamic acid. Minimise crystalloids. Keep the patient warm and correct calcium.', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v3')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = '27dd8049-b1f7-5a64-ba37-168a22a7f46e';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('920d1a97-6de5-577e-b99b-7bcd33ef3054', '27dd8049-b1f7-5a64-ba37-168a22a7f46e', 'A', 'FFP only', false, 0),
  ('1a81af02-3125-590b-af81-5427f3f75b56', '27dd8049-b1f7-5a64-ba37-168a22a7f46e', 'B', 'Red cells only until the patient stops bleeding', false, 1),
  ('1eceff21-6bce-562e-b890-175e719c1bba', '27dd8049-b1f7-5a64-ba37-168a22a7f46e', 'C', 'Crystalloid only, up to 5 litres', false, 2),
  ('561704ac-a884-5cc4-bc4b-d08ce0004dba', '27dd8049-b1f7-5a64-ba37-168a22a7f46e', 'D', 'Platelets only', false, 3),
  ('5368bc2e-a6d5-5547-83e8-79ff7fd15b40', '27dd8049-b1f7-5a64-ba37-168a22a7f46e', 'E', 'Give red cells and FFP in a ratio of about 1:1 (with platelets and cryoprecipitate guided by tests), plus tranexamic acid', true, 4);

-- Q293
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('a011e25e-d546-58d5-aa32-583c31c01626', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000014', 'sba', 'A 60 year old man, 2 hours after receiving FFP, develops acute breathlessness, hypoxia, fever and hypotension. Chest X-ray shows bilateral infiltrates. JVP is not raised and there is no fluid overload. What is the SINGLE most likely diagnosis?', 'TRALI occurs within 6 hours of transfusion (often plasma-rich products) and is caused by donor antibodies against recipient leucocytes. It causes non-cardiogenic pulmonary oedema with hypoxia, fever and hypotension. Management is supportive (oxygen, ventilation), avoiding diuretics. TACO comes with hypertension, a raised JVP and responds to diuretics.', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v3')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = 'a011e25e-d546-58d5-aa32-583c31c01626';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('56ab8273-3e25-5197-a4fe-02d948489c35', 'a011e25e-d546-58d5-aa32-583c31c01626', 'A', 'Acute haemolytic transfusion reaction', false, 0),
  ('7e8b71cd-1954-54a7-b1d4-1145e0792c36', 'a011e25e-d546-58d5-aa32-583c31c01626', 'B', 'Anaphylaxis', false, 1),
  ('89626274-a567-5c5a-bfdb-2d4b2cf98567', 'a011e25e-d546-58d5-aa32-583c31c01626', 'C', 'Bacterial contamination', false, 2),
  ('a6bdb387-24c7-561d-9f91-918a8bee0f2c', 'a011e25e-d546-58d5-aa32-583c31c01626', 'D', 'Transfusion-associated circulatory overload (TACO)', false, 3),
  ('1d6a96d1-21c4-5b69-8746-95006fc21992', 'a011e25e-d546-58d5-aa32-583c31c01626', 'E', 'Transfusion-related acute lung injury (TRALI)', true, 4);

-- Q294
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('45ba189d-8ed0-57cd-8e77-78a8b857db04', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000014', 'sba', 'A 45 year old woman was transfused 7 days ago. She now has fever, jaundice and a falling Hb. DAT is positive, and a new red cell alloantibody (anti-Jk^a) is found. What is the SINGLE most likely diagnosis?', 'Delayed haemolytic transfusion reactions happen 5-14 days after transfusion in patients previously sensitised (by pregnancy or transfusion), whose antibody (often Kidd or Rh) was below detectable levels. Features are fever, jaundice, falling Hb and a positive DAT. Report to SHOT, and future blood must be antigen-negative.', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v3')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = '45ba189d-8ed0-57cd-8e77-78a8b857db04';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('dc78dba6-ec09-508a-880f-513372211838', '45ba189d-8ed0-57cd-8e77-78a8b857db04', 'A', 'Delayed haemolytic transfusion reaction', true, 0),
  ('6da3a834-e7fc-5543-b124-b5c9e772dd3b', '45ba189d-8ed0-57cd-8e77-78a8b857db04', 'B', 'Febrile non-haemolytic reaction', false, 1),
  ('391b0d58-3b64-52c7-864d-606f60b54672', '45ba189d-8ed0-57cd-8e77-78a8b857db04', 'C', 'Acute haemolytic transfusion reaction', false, 2),
  ('a2f9fc84-409d-55cf-b2b1-52fe83523f1f', '45ba189d-8ed0-57cd-8e77-78a8b857db04', 'D', 'TRALI', false, 3),
  ('105daca9-953e-5bad-a1be-0d58e6f5ec01', '45ba189d-8ed0-57cd-8e77-78a8b857db04', 'E', 'Post-transfusion purpura', false, 4);

-- Q295
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('c331f587-f462-585b-b1e4-0342922391db', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000014', 'sba', 'A 68 year old man has a platelet count of 8 x10^9/L from chemotherapy. He has no bleeding, and he is not febrile. Above what threshold is prophylactic platelet transfusion generally given?', 'NICE NG24: offer prophylactic platelets to patients with reversible bone marrow failure and a count below 10 x10^9/L (not for ITP, HIT or TTP). Higher thresholds apply before procedures (often 50 x10^9/L, or 100 x10^9/L for neurosurgery or posterior eye surgery) and with active bleeding.', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v3')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = 'c331f587-f462-585b-b1e4-0342922391db';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('c613149f-b86a-5443-bea6-627ec6efd464', 'c331f587-f462-585b-b1e4-0342922391db', 'A', 'Only if count is below 1 x10^9/L', false, 0),
  ('3bd2fe5f-0fab-5ca2-8b03-8cf242dc6b15', 'c331f587-f462-585b-b1e4-0342922391db', 'B', 'Never give prophylactic platelets', false, 1),
  ('08f55dcd-799e-5c84-8757-4f198d4b0381', 'c331f587-f462-585b-b1e4-0342922391db', 'C', 'Below 50 x10^9/L always', false, 2),
  ('5d3139c1-a2a9-56df-ba7a-9d56cf8c8846', 'c331f587-f462-585b-b1e4-0342922391db', 'D', 'Prophylactic platelet transfusion if count is below 10 x10^9/L (without bleeding or additional risk)', true, 3),
  ('7c7548bb-9270-5d18-a9a9-fbeabeb4e7b1', 'c331f587-f462-585b-b1e4-0342922391db', 'E', 'Below 100 x10^9/L', false, 4);

-- Q296
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('5c0e89c6-fe3d-596b-af26-1b3958bcb2cc', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000014', 'sba', 'A 4 year old girl has mild anaemia with microcytosis. Her blood film shows basophilic stippling. She has pica and lives in an old house with peeling paint. What is the SINGLE most likely diagnosis?', 'Lead poisoning inhibits haem synthesis, causing microcytic anaemia with basophilic stippling, and can cause abdominal pain, constipation, neuropathy and developmental and cognitive impairment in children. Measure blood lead level. Remove the source and use chelation if levels are high. Lead poisoning is notifiable to UKHSA.', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v3')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = '5c0e89c6-fe3d-596b-af26-1b3958bcb2cc';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('002179b6-69ee-57b3-b40a-050f78daf461', '5c0e89c6-fe3d-596b-af26-1b3958bcb2cc', 'A', 'Sideroblastic anaemia (congenital)', false, 0),
  ('48e30ae4-225d-5b9f-a3c2-e41218e03b4e', '5c0e89c6-fe3d-596b-af26-1b3958bcb2cc', 'B', 'Lead poisoning', true, 1),
  ('afd88ec2-892e-5baf-ad4c-ebe6d9104d2f', '5c0e89c6-fe3d-596b-af26-1b3958bcb2cc', 'C', 'Iron deficiency only', false, 2),
  ('a4fe3068-320d-5215-ad33-8e662f921724', '5c0e89c6-fe3d-596b-af26-1b3958bcb2cc', 'D', 'Beta-thalassaemia trait', false, 3),
  ('2d82c42a-5a69-5a88-af34-8909f850fa35', '5c0e89c6-fe3d-596b-af26-1b3958bcb2cc', 'E', 'Hereditary spherocytosis', false, 4);

-- Q297
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('435fdeb0-10a1-5779-b7ca-38720fed7f04', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000014', 'sba', 'A 28 year old woman with antiphospholipid syndrome has had a DVT. She is on long-term anticoagulation. Which anticoagulant is generally recommended?', 'In antiphospholipid syndrome, especially triple-positive patients or those with arterial events, DOACs (particularly rivaroxaban) have been associated with more thrombosis than warfarin. Warfarin remains first-line. In pregnancy, use LMWH plus aspirin (warfarin is teratogenic).', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v3')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = '435fdeb0-10a1-5779-b7ca-38720fed7f04';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('2557a73e-4d58-549c-ab33-5e80dcd5967c', '435fdeb0-10a1-5779-b7ca-38720fed7f04', 'A', 'Warfarin (target INR 2-3)', true, 0),
  ('e9cb94c2-61ba-5abc-b6b0-1eb79d1a20de', '435fdeb0-10a1-5779-b7ca-38720fed7f04', 'B', 'Apixaban as first-line in all', false, 1),
  ('d42080dd-ce7d-576f-9874-6864f785f50e', '435fdeb0-10a1-5779-b7ca-38720fed7f04', 'C', 'Aspirin alone', false, 2),
  ('d10e5d58-bdd5-5483-80f9-95663c5bdfa4', '435fdeb0-10a1-5779-b7ca-38720fed7f04', 'D', 'Dabigatran', false, 3),
  ('888eba39-7c4a-5d8a-a80d-62b1f253c5c7', '435fdeb0-10a1-5779-b7ca-38720fed7f04', 'E', 'Rivaroxaban as first-line in all', false, 4);

-- Q298
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('eaf8990a-3f0d-5b65-bf23-4e7b2ad3ded3', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000010', 'sba', 'A 25 year old man returned from Pakistan 2 weeks ago with a step-wise rising fever, headache, constipation, relative bradycardia and faint rose-coloured spots on his trunk. Blood cultures grow Salmonella Typhi. What is the SINGLE most appropriate treatment?', 'Enteric (typhoid) fever: fever, headache, abdominal pain, constipation or diarrhoea, relative bradycardia, rose spots and splenomegaly. Fluoroquinolone resistance is widespread in South Asia, and extensively drug-resistant strains exist in Pakistan (then use a carbapenem or azithromycin). Complications are GI perforation and bleeding. It is notifiable, and food handlers need clearance.', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v3')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = 'eaf8990a-3f0d-5b65-bf23-4e7b2ad3ded3';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('fd8e3430-1443-528e-abcc-3f298eb782d2', 'eaf8990a-3f0d-5b65-bf23-4e7b2ad3ded3', 'A', 'No antibiotics; it is self-limiting', false, 0),
  ('3917aaa0-c388-5301-b21f-fa743a5b6891', 'eaf8990a-3f0d-5b65-bf23-4e7b2ad3ded3', 'B', 'Metronidazole', false, 1),
  ('622f790e-5b5d-5474-966f-1ad7823b65c1', 'eaf8990a-3f0d-5b65-bf23-4e7b2ad3ded3', 'C', 'Oral ciprofloxacin, as resistance is rare in South Asia', false, 2),
  ('5a12baf2-c507-5252-8a37-e89cfb0b0f9b', 'eaf8990a-3f0d-5b65-bf23-4e7b2ad3ded3', 'D', 'Oral amoxicillin', false, 3),
  ('1245fae9-6255-53b3-83a4-56d332f57da0', 'eaf8990a-3f0d-5b65-bf23-4e7b2ad3ded3', 'E', 'IV ceftriaxone (or oral azithromycin if uncomplicated), guided by sensitivities', true, 4);

-- Q299
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('03022edb-8950-58fa-b109-ca83fbe321ac', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000010', 'sba', 'A 30 year old man returned from rural Bangladesh with profuse painless ''rice-water'' diarrhoea of several litres per day, and is severely dehydrated. What is the SINGLE most important treatment?', 'Cholera (Vibrio cholerae toxin) causes massive secretory diarrhoea and rapid dehydration. Rehydration is the key treatment: ORS for mild-moderate cases, IV Ringer''s lactate for severe ones. Antibiotics (single-dose doxycycline or azithromycin) shorten illness and shedding. It is notifiable. An oral vaccine is available for some travellers.', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v3')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = '03022edb-8950-58fa-b109-ca83fbe321ac';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('07e42e99-bc9f-5205-a921-164909a8f826', '03022edb-8950-58fa-b109-ca83fbe321ac', 'A', 'Oral vancomycin', false, 0),
  ('3abfb0ab-53ba-5ce4-b8aa-6507cfe9865c', '03022edb-8950-58fa-b109-ca83fbe321ac', 'B', 'Fluid restriction', false, 1),
  ('1a714e3a-c643-533e-bc06-30063634c6fb', '03022edb-8950-58fa-b109-ca83fbe321ac', 'C', 'Aggressive rehydration (IV Ringer''s lactate/oral rehydration solution), with a single dose of doxycycline or azithromycin', true, 2),
  ('70ff718e-d645-503b-a177-c11c547055d5', '03022edb-8950-58fa-b109-ca83fbe321ac', 'D', 'Loperamide only', false, 3),
  ('a3496d31-fcd8-5ae1-a65a-dbfa61ed256e', '03022edb-8950-58fa-b109-ca83fbe321ac', 'E', 'IV metronidazole', false, 4);

-- Q300
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('723828f2-5205-57f5-bfe8-c3d73b3cc77b', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000010', 'sba', 'A 24 year old man swam in Lake Malawi 3 months ago. He now has painless visible haematuria at the end of micturition and eosinophilia. What is the SINGLE most likely diagnosis?', 'Schistosomiasis is caught by freshwater exposure in Africa (Lake Malawi is classic). S. haematobium causes terminal haematuria and is a long-term risk factor for squamous cell bladder cancer. Diagnose with serology and urine microscopy for eggs (terminal urine, around midday). Treat with praziquantel. Katayama fever is an acute hypersensitivity reaction a few weeks after exposure.', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v3')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = '723828f2-5205-57f5-bfe8-c3d73b3cc77b';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('9fe5db13-d44c-564b-90ad-67f840cbd887', '723828f2-5205-57f5-bfe8-c3d73b3cc77b', 'A', 'Renal tuberculosis', false, 0),
  ('78b01d91-12f5-5c10-8cf8-6cbb7f25a85a', '723828f2-5205-57f5-bfe8-c3d73b3cc77b', 'B', 'Schistosomiasis (Schistosoma haematobium)', true, 1),
  ('595f1560-d603-5d23-b33a-7043a408f29b', '723828f2-5205-57f5-bfe8-c3d73b3cc77b', 'C', 'IgA nephropathy', false, 2),
  ('9ce99add-32f4-54e6-970b-a077d7b0d65c', '723828f2-5205-57f5-bfe8-c3d73b3cc77b', 'D', 'Kidney stones', false, 3),
  ('f087a526-fc7d-5e4c-bc6f-f4dbbd3bbfd3', '723828f2-5205-57f5-bfe8-c3d73b3cc77b', 'E', 'Bladder cancer', false, 4);

-- Q301
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('94d8d6eb-32b4-5da9-a870-267a765e309f', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000010', 'sba', 'A 35 year old woman was bitten by a stray dog in Thailand 2 days ago. She has never been vaccinated against rabies. What is the SINGLE most appropriate management?', 'Rabies is almost always fatal once symptoms start. After a bite or scratch from an animal in an endemic country, clean the wound thoroughly and seek urgent advice (UKHSA). Unvaccinated people need a course of vaccine plus rabies immunoglobulin infiltrated into the wound. Previously vaccinated people need booster doses only. Also give tetanus prophylaxis and consider antibiotics.', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v3')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = '94d8d6eb-32b4-5da9-a870-267a765e309f';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('5f4be65c-c2f3-57e3-978a-0b544ff05ca8', '94d8d6eb-32b4-5da9-a870-267a765e309f', 'A', 'Antibiotics only', false, 0),
  ('887b3bc9-7fef-5c13-8be4-eeca00eee04b', '94d8d6eb-32b4-5da9-a870-267a765e309f', 'B', 'Vaccine only after symptoms start', false, 1),
  ('e62c0a37-8974-56b7-a5e6-c42976ff8da4', '94d8d6eb-32b4-5da9-a870-267a765e309f', 'C', 'Reassure; rabies does not occur in Thailand', false, 2),
  ('06bbac2c-8b26-5384-933b-1065005cfab9', '94d8d6eb-32b4-5da9-a870-267a765e309f', 'D', 'Wound cleaning, rabies vaccine course and rabies immunoglobulin (post-exposure prophylaxis) urgently', true, 3),
  ('5b97ce8a-cec8-53d7-b575-be74be559646', '94d8d6eb-32b4-5da9-a870-267a765e309f', 'E', 'Wait to see if symptoms develop', false, 4);

-- Q302
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('18ecffc3-22ef-5eef-960a-341c6ccf46dc', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000010', 'sba', 'A 45 year old man is travelling to sub-Saharan Africa for 3 weeks and needs malaria prophylaxis. He has epilepsy controlled on carbamazepine. Which option is MOST appropriate?', 'Mefloquine and chloroquine lower the seizure threshold and are contraindicated in epilepsy. Carbamazepine (an enzyme inducer) reduces doxycycline levels, so atovaquone-proguanil is often preferred. All travellers should also use bite prevention (DEET, nets) and seek urgent testing for fever after returning. Mefloquine is also contraindicated in psychiatric illness.', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v3')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = '18ecffc3-22ef-5eef-960a-341c6ccf46dc';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('b4ad7907-b61a-5023-81ad-fec7036a83e8', '18ecffc3-22ef-5eef-960a-341c6ccf46dc', 'A', 'Chloroquine', false, 0),
  ('2f09df22-12f7-55c0-ad3a-e69e11c920be', '18ecffc3-22ef-5eef-960a-341c6ccf46dc', 'B', 'Mefloquine', false, 1),
  ('8a3c0628-17f0-583e-ba0b-479e87574a0a', '18ecffc3-22ef-5eef-960a-341c6ccf46dc', 'C', 'Atovaquone-proguanil or doxycycline (considering interactions), and avoid mefloquine and chloroquine', true, 2),
  ('e3aeeb5b-8adb-51de-b42d-a0dd15b324f3', '18ecffc3-22ef-5eef-960a-341c6ccf46dc', 'D', 'No prophylaxis needed if he uses repellent', false, 3),
  ('4c22dbbd-13ee-5864-83de-26437eefa70e', '18ecffc3-22ef-5eef-960a-341c6ccf46dc', 'E', 'Primaquine only', false, 4);

-- Q303
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('4e11a3fd-4dd8-5ffb-9bbd-830416262180', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000010', 'sba', 'A 38 year old woman returned from India with fever. Blood films confirm Plasmodium vivax malaria. After chloroquine treatment, what additional drug is needed to prevent relapse, and which test must be done first?', 'P. vivax and P. ovale form dormant liver hypnozoites that cause relapses. Radical cure needs primaquine (or tafenoquine) to eradicate them. These drugs cause haemolysis in G6PD deficiency, so test first. They are avoided in pregnancy and breastfeeding (unless the infant''s G6PD is known).', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v3')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = '4e11a3fd-4dd8-5ffb-9bbd-830416262180';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('22760c54-fb9f-56ef-8367-9ea351ae15e4', '4e11a3fd-4dd8-5ffb-9bbd-830416262180', 'A', 'Artesunate after checking renal function', false, 0),
  ('38957dc1-7c69-56df-8548-0bb6410a2f34', '4e11a3fd-4dd8-5ffb-9bbd-830416262180', 'B', 'Primaquine (or tafenoquine), after checking G6PD activity', true, 1),
  ('1d1850f7-6096-50d7-95e6-7b79a496292a', '4e11a3fd-4dd8-5ffb-9bbd-830416262180', 'C', 'No additional treatment is needed', false, 2),
  ('4ed56ad4-3b53-5484-8d96-e7e35f60a35e', '4e11a3fd-4dd8-5ffb-9bbd-830416262180', 'D', 'Doxycycline after checking HLA-B27', false, 3),
  ('440ab72f-4308-5831-8c25-6bd8196bbe8f', '4e11a3fd-4dd8-5ffb-9bbd-830416262180', 'E', 'Quinine after checking TPMT', false, 4);

-- Q304
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('75b46271-bacc-5b4a-a40f-005416376767', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000010', 'sba', 'A 30 year old man returned from Nigeria has falciparum malaria with 6% parasitaemia, confusion and jaundice. What is the SINGLE most appropriate treatment?', 'Severe falciparum malaria (impaired consciousness, seizures, parasitaemia above 2%, acidosis, hypoglycaemia, AKI, ARDS, severe anaemia, shock or jaundice) needs IV artesunate (better outcomes than quinine), with ICU support. Switch to a full oral ACT course once improving. Monitor glucose and watch for post-artesunate delayed haemolysis.', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v3')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = '75b46271-bacc-5b4a-a40f-005416376767';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('907a2d3f-0ff1-5861-9ad8-071b47dfd1e1', '75b46271-bacc-5b4a-a40f-005416376767', 'A', 'IV artesunate', true, 0),
  ('d78fbb63-a0d5-54e1-8395-b9bcf6ee1d64', '75b46271-bacc-5b4a-a40f-005416376767', 'B', 'Oral doxycycline only', false, 1),
  ('edde2e06-7188-5333-8c28-62c155086187', '75b46271-bacc-5b4a-a40f-005416376767', 'C', 'Oral chloroquine', false, 2),
  ('2aed85f5-845f-5113-8a4c-e2b0ccbc8317', '75b46271-bacc-5b4a-a40f-005416376767', 'D', 'Oral atovaquone-proguanil only', false, 3),
  ('3a38334f-ec4d-5fa4-8e4c-9e66e4af0f71', '75b46271-bacc-5b4a-a40f-005416376767', 'E', 'IV quinine first-line in all', false, 4);

-- Q305
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('e1f8da6e-a9cd-5dd4-8839-1bc5d07c0511', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000010', 'sba', 'A 6 year old unvaccinated boy had measles 2 weeks ago. He now has fever, headache, drowsiness and seizures. What is the SINGLE most likely complication?', 'Measles complications include otitis media, pneumonia (the commonest cause of death), diarrhoea, keratitis, acute encephalitis (about 1 in 1000 cases, days to weeks after the rash), and subacute sclerosing panencephalitis (rare, appearing years later). Measles is notifiable, and MMR uptake is key to prevention.', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v3')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = 'e1f8da6e-a9cd-5dd4-8839-1bc5d07c0511';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('c93f1f1e-b164-555e-b3ea-22e61314b49f', 'e1f8da6e-a9cd-5dd4-8839-1bc5d07c0511', 'A', 'Febrile convulsion only', false, 0),
  ('cd9465f9-b7fb-5217-b8b1-6fcbfd8cab6b', 'e1f8da6e-a9cd-5dd4-8839-1bc5d07c0511', 'B', 'Subacute sclerosing panencephalitis', false, 1),
  ('b2aa6a68-78cc-575d-9ff7-85d1b04077f1', 'e1f8da6e-a9cd-5dd4-8839-1bc5d07c0511', 'C', 'Bacterial meningitis always', false, 2),
  ('de42c83b-a29b-57be-ad2f-7f433608cd08', 'e1f8da6e-a9cd-5dd4-8839-1bc5d07c0511', 'D', 'Otitis media', false, 3),
  ('ef14cacf-4eca-5bcc-91a0-d0cc2a405a02', 'e1f8da6e-a9cd-5dd4-8839-1bc5d07c0511', 'E', 'Acute measles encephalitis', true, 4);

-- Q306
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('05d09dd0-473c-54e5-96e6-bb3bb78484a4', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000010', 'sba', 'A 23 year old man has mumps with parotid swelling. Five days later he has a painful, swollen right testis with fever. What is the SINGLE most likely diagnosis and management?', 'Mumps orchitis affects up to a third of post-pubertal males with mumps, usually within a week of parotitis. It is mostly unilateral, and can cause testicular atrophy but rarely infertility. Treatment is supportive. Other complications are meningitis, pancreatitis, oophoritis and deafness. Exclude torsion if there is any doubt.', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v3')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = '05d09dd0-473c-54e5-96e6-bb3bb78484a4';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('cc1c37f2-7691-59a9-be77-7c9c7dfb02e7', '05d09dd0-473c-54e5-96e6-bb3bb78484a4', 'A', 'Hydrocele; aspiration', false, 0),
  ('7567aa02-5e6b-5eeb-909a-bd5a4ec487fe', '05d09dd0-473c-54e5-96e6-bb3bb78484a4', 'B', 'Testicular torsion; emergency exploration', false, 1),
  ('8712d37e-e8bd-5084-b3ef-8d9283c8f17b', '05d09dd0-473c-54e5-96e6-bb3bb78484a4', 'C', 'Testicular cancer; urgent ultrasound and orchidectomy', false, 2),
  ('2f017d94-fb75-5050-b30b-6da245f3ec0b', '05d09dd0-473c-54e5-96e6-bb3bb78484a4', 'D', 'Mumps orchitis; analgesia, scrotal support and cold compresses', true, 3),
  ('2d26914b-ef8e-5150-a4d0-5eb51d77c657', '05d09dd0-473c-54e5-96e6-bb3bb78484a4', 'E', 'Chlamydial epididymitis; doxycycline', false, 4);

-- Q307
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('445c2fc6-42ac-54c4-beac-eb847c21f013', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000010', 'sba', 'A 19 year old woman with a sore throat, fever and lymphadenopathy was given amoxicillin by an out-of-hours doctor. Two days later she has a widespread itchy maculopapular rash. Which diagnosis is MOST likely?', 'Most people with EBV glandular fever who are given amoxicillin or ampicillin develop a maculopapular rash. This is not usually a true allergy. Confirm EBV with a heterophile antibody (monospot) test or EBV serology. Advise avoiding contact sports for at least 4 weeks because of the risk of splenic rupture.', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v3')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = '445c2fc6-42ac-54c4-beac-eb847c21f013';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('37d2b2ad-0dce-5e85-8dc3-fd62f8be9dc3', '445c2fc6-42ac-54c4-beac-eb847c21f013', 'A', 'Infectious mononucleosis (EBV) with amoxicillin-associated rash', true, 0),
  ('315ac5cf-68a9-5392-ad6f-ff9afb21c125', '445c2fc6-42ac-54c4-beac-eb847c21f013', 'B', 'Measles', false, 1),
  ('7189b0fa-9601-5bc7-b542-3e87247dfa75', '445c2fc6-42ac-54c4-beac-eb847c21f013', 'C', 'Stevens-Johnson syndrome', false, 2),
  ('0c828d01-bf29-521a-bd80-c6276267cef6', '445c2fc6-42ac-54c4-beac-eb847c21f013', 'D', 'Scarlet fever', false, 3),
  ('b0159b4f-040d-5085-92d0-85b3351195a5', '445c2fc6-42ac-54c4-beac-eb847c21f013', 'E', 'True penicillin allergy (lifelong)', false, 4);

-- Q308
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('1444c63e-ddfd-5810-830d-5614d0d5a545', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000010', 'sba', 'A 17 year old girl using tampons develops sudden high fever, vomiting, diarrhoea, a diffuse sunburn-like rash and hypotension. Her CK and creatinine are raised. What is the SINGLE most likely diagnosis?', 'Toxic shock syndrome is caused by staphylococcal (TSST-1) or streptococcal superantigen toxins. It causes fever, a diffuse erythematous rash (with desquamation later), hypotension and multi-organ involvement. Remove the source (tampon), and give IV fluids and antibiotics, including clindamycin to inhibit toxin production. IVIg is used in severe cases.', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v3')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = '1444c63e-ddfd-5810-830d-5614d0d5a545';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('2fb485a7-db1d-5bad-b6d2-3e4b582a5713', '1444c63e-ddfd-5810-830d-5614d0d5a545', 'A', 'Kawasaki disease', false, 0),
  ('248fdc13-c37d-5680-b5b6-7bb9dc0c90c6', '1444c63e-ddfd-5810-830d-5614d0d5a545', 'B', 'Meningococcal sepsis', false, 1),
  ('d542d7c6-f118-58e1-a98b-b1528ac2bba3', '1444c63e-ddfd-5810-830d-5614d0d5a545', 'C', 'Scarlet fever', false, 2),
  ('a12d4460-9911-5ad5-9749-37aec025e487', '1444c63e-ddfd-5810-830d-5614d0d5a545', 'D', 'Stevens-Johnson syndrome', false, 3),
  ('7b373b42-923c-56d3-b23d-91b6806f0bd4', '1444c63e-ddfd-5810-830d-5614d0d5a545', 'E', 'Toxic shock syndrome (Staphylococcus aureus)', true, 4);

-- Q309
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('0bca7389-3ec6-5f9c-a2ab-24907fcea77b', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000010', 'sba', 'A 60 year old man has a red, swollen, warm, well-demarcated raised rash on his face with fever. What is the SINGLE most likely diagnosis and organism?', 'Erysipelas is a superficial skin infection (upper dermis and lymphatics) with a sharply demarcated, raised edge, often on the face or legs, usually caused by group A streptococcus. Cellulitis involves the deeper dermis and subcutaneous tissue with less clear borders. Treat with penicillin or flucloxacillin, or clarithromycin if allergic. Facial infection near the eye needs urgent review.', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v3')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = '0bca7389-3ec6-5f9c-a2ab-24907fcea77b';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('d2d2abfd-18fb-5790-921e-e91b1f8f1f62', '0bca7389-3ec6-5f9c-a2ab-24907fcea77b', 'A', 'Herpes zoster; VZV', false, 0),
  ('1b4d3c8c-a295-52d4-be32-3d2b3b48df8c', '0bca7389-3ec6-5f9c-a2ab-24907fcea77b', 'B', 'Cellulitis; Pseudomonas', false, 1),
  ('95f97df4-e24d-5e2c-b319-12aa36dd6be5', '0bca7389-3ec6-5f9c-a2ab-24907fcea77b', 'C', 'Contact dermatitis; no organism', false, 2),
  ('b6799dc7-ed1b-596f-b0e6-08c9e6cbf9ae', '0bca7389-3ec6-5f9c-a2ab-24907fcea77b', 'D', 'Erysipelas; Streptococcus pyogenes', true, 3),
  ('cb9976cb-4733-5692-87ba-08b9b9cb9932', '0bca7389-3ec6-5f9c-a2ab-24907fcea77b', 'E', 'Impetigo; Candida', false, 4);

-- Q310
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('7e220f67-2f3c-56c1-a40f-658a7243ff12', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000010', 'sba', 'A 35 year old man is admitted to hospital for elective surgery. A screening nasal swab shows MRSA. What is the SINGLE most appropriate management?', 'Hospitals screen many patients for MRSA. Colonised patients are decolonised with intranasal mupirocin and antiseptic body washes (chlorhexidine or octenidine) for 5 days, and isolated where needed. Surgical antibiotic prophylaxis may need to include a glycopeptide. Treatment with systemic antibiotics is only for infection, not colonisation.', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v3')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = '7e220f67-2f3c-56c1-a40f-658a7243ff12';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('2f445f53-1c25-516d-b157-e75206ef6b9e', '7e220f67-2f3c-56c1-a40f-658a7243ff12', 'A', 'Oral ciprofloxacin', false, 0),
  ('82458bbd-0d9f-5571-b9fe-573d2c282c1d', '7e220f67-2f3c-56c1-a40f-658a7243ff12', 'B', 'Cancel the surgery permanently', false, 1),
  ('5a5e0685-0b2d-5ca0-9b98-dca1db3bc2b6', '7e220f67-2f3c-56c1-a40f-658a7243ff12', 'C', 'No action', false, 2),
  ('cb7356b9-5430-5359-8fe4-4144025cd97f', '7e220f67-2f3c-56c1-a40f-658a7243ff12', 'D', 'IV vancomycin for 2 weeks', false, 3),
  ('0e4f60f6-d95c-5862-b69f-618ed1e3e75a', '7e220f67-2f3c-56c1-a40f-658a7243ff12', 'E', 'Decolonisation: topical nasal mupirocin and chlorhexidine body wash for 5 days', true, 4);

-- Q311
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('17ba78be-0e68-5d4e-87c3-faebd5f206fd', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000010', 'sba', 'A 9 year old boy with sickle cell disease has fever and a painful, swollen tibia. MRI shows osteomyelitis. Which organism is particularly associated with osteomyelitis in sickle cell disease?', 'Staphylococcus aureus is the commonest cause of osteomyelitis overall. In sickle cell disease, Salmonella is a characteristic cause (because of hyposplenism and bowel infarcts). Pseudomonas is linked to puncture wounds through trainers. Treatment is prolonged IV then oral antibiotics, and sometimes surgery.', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v3')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = '17ba78be-0e68-5d4e-87c3-faebd5f206fd';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('68ff878e-ffc3-5d58-8471-405bbadb9600', '17ba78be-0e68-5d4e-87c3-faebd5f206fd', 'A', 'Neisseria gonorrhoeae', false, 0),
  ('4ff3a722-4657-51b0-a433-4c3952828c0a', '17ba78be-0e68-5d4e-87c3-faebd5f206fd', 'B', 'Streptococcus viridans', false, 1),
  ('734974f6-3603-5a5d-98f0-561840b712ff', '17ba78be-0e68-5d4e-87c3-faebd5f206fd', 'C', 'Pseudomonas aeruginosa', false, 2),
  ('40229823-d0c5-5776-817b-1617009df5d2', '17ba78be-0e68-5d4e-87c3-faebd5f206fd', 'D', 'Salmonella species (as well as Staphylococcus aureus)', true, 3),
  ('3b3d87e4-1d15-5b6c-819b-11914c4bd1f8', '17ba78be-0e68-5d4e-87c3-faebd5f206fd', 'E', 'Clostridium perfringens', false, 4);

-- Q312
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('b74699e3-9543-5a14-8a40-5f60bac3348d', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000010', 'sba', 'A 28 year old woman who is 20 weeks pregnant had flu-like symptoms after eating unpasteurised soft cheese. Blood cultures grow Gram-positive rods. What is the SINGLE most likely organism and treatment?', 'Listeriosis can cause a mild illness in the mother but miscarriage, stillbirth, preterm labour and neonatal sepsis or meningitis. Sources include unpasteurised dairy, soft cheeses, pâté and pre-packed meats. It is resistant to cephalosporins and is treated with amoxicillin/ampicillin (with gentamicin). Pregnant women should avoid high-risk foods.', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v3')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = 'b74699e3-9543-5a14-8a40-5f60bac3348d';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('e9ad1eed-fc5b-5502-ac3e-461813023732', 'b74699e3-9543-5a14-8a40-5f60bac3348d', 'A', 'Salmonella; ciprofloxacin', false, 0),
  ('a614a395-8dca-5b92-8400-1e79d72290b2', 'b74699e3-9543-5a14-8a40-5f60bac3348d', 'B', 'E. coli; ceftriaxone', false, 1),
  ('7ef69f08-62c8-5bea-b953-5ec302850059', 'b74699e3-9543-5a14-8a40-5f60bac3348d', 'C', 'Staphylococcus aureus; flucloxacillin', false, 2),
  ('769d5f27-c92e-5e56-ad4f-2cf9c4af461f', 'b74699e3-9543-5a14-8a40-5f60bac3348d', 'D', 'Clostridium difficile; vancomycin', false, 3),
  ('1ff1e46a-2baa-52b9-9fa1-509540c125eb', 'b74699e3-9543-5a14-8a40-5f60bac3348d', 'E', 'Listeria monocytogenes; IV amoxicillin (with gentamicin)', true, 4);

-- Q313
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('fcc3b2e1-1d94-5912-ac53-3292ca040529', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000010', 'sba', 'A 3 year old''s classmate was diagnosed with meningococcal meningitis yesterday. The child played with him at nursery. Who should receive antibiotic chemoprophylaxis?', 'UKHSA advises chemoprophylaxis (single-dose ciprofloxacin, or rifampicin) for household and household-type close contacts in the 7 days before onset, and healthcare workers exposed to respiratory droplets without PPE during airway procedures. Nursery or school contacts are usually only given information unless there is a cluster. Contacts may be offered vaccination depending on the strain.', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v3')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = 'fcc3b2e1-1d94-5912-ac53-3292ca040529';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('8831b029-0445-56bd-9b14-c79bc07fc301', 'fcc3b2e1-1d94-5912-ac53-3292ca040529', 'A', 'Close contacts such as household members and those with prolonged close contact in a household-type setting in the previous 7 days, as advised by UKHSA', true, 0),
  ('4153b36a-1cb4-5e0d-a3c3-ba4c43c049c8', 'fcc3b2e1-1d94-5912-ac53-3292ca040529', 'B', 'Only the healthcare staff who treated the patient', false, 1),
  ('c69b19f8-2c5f-509f-998d-0cf4ca2892e4', 'fcc3b2e1-1d94-5912-ac53-3292ca040529', 'C', 'Nobody', false, 2),
  ('28554ee6-716b-5d7c-92bd-d28737eb25cb', 'fcc3b2e1-1d94-5912-ac53-3292ca040529', 'D', 'All children in the school or nursery automatically', false, 3),
  ('dbc9292d-7319-5815-a414-b9d88e485451', 'fcc3b2e1-1d94-5912-ac53-3292ca040529', 'E', 'Anyone who has visited the hospital', false, 4);

-- Q314
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('2ea0c457-3c48-5ce2-bc08-dbc82464aa61', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000010', 'sba', 'A 50 year old gardener had a deep puncture wound 10 days ago. He now has stiffness of his jaw (trismus), painful muscle spasms and a fixed grin. He has never had a tetanus booster. What is the SINGLE most appropriate treatment?', 'Tetanus is caused by Clostridium tetani toxin (tetanospasmin), which blocks inhibitory neurotransmission and causes rigidity, trismus, risus sardonicus, opisthotonus and autonomic instability. Treatment is immunoglobulin, metronidazole (or penicillin), wound care, benzodiazepines or magnesium for spasms, and ventilation in ICU. Infection does not give immunity, so the patient must be vaccinated.', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v3')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = '2ea0c457-3c48-5ce2-bc08-dbc82464aa61';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('b8ef06fc-c6f6-5bb2-89b7-f5eb7d5747f6', '2ea0c457-3c48-5ce2-bc08-dbc82464aa61', 'A', 'Tetanus vaccine alone', false, 0),
  ('fb2111df-07c2-517b-8a66-ea89f3f8b802', '2ea0c457-3c48-5ce2-bc08-dbc82464aa61', 'B', 'Human tetanus immunoglobulin, metronidazole, wound debridement and ICU supportive care (with vaccination)', true, 1),
  ('4c6654aa-f6b3-59e2-998e-e16c04a35c78', '2ea0c457-3c48-5ce2-bc08-dbc82464aa61', 'C', 'Oral penicillin only', false, 2),
  ('3c7cf1df-1138-5a88-9558-78f8491d3c78', '2ea0c457-3c48-5ce2-bc08-dbc82464aa61', 'D', 'No treatment needed', false, 3),
  ('e2aa978b-08f9-5c79-ad55-faf16177a14b', '2ea0c457-3c48-5ce2-bc08-dbc82464aa61', 'E', 'Antihistamines', false, 4);

-- Q315
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('b523c691-14fd-5520-b63e-10c8625b6cd0', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000010', 'sba', 'A 30 year old man who injects heroin has developed blurred vision, drooping eyelids, difficulty swallowing and descending symmetrical flaccid weakness. He is alert and has no sensory loss. What is the SINGLE most likely diagnosis?', 'Botulism (Clostridium botulinum toxin blocking acetylcholine release) causes descending symmetrical flaccid paralysis starting with cranial nerves (diplopia, ptosis, dysphagia, dysarthria), with no sensory loss and a clear mind. In the UK, wound botulism is linked to injecting heroin. Give botulinum antitoxin urgently (via UKHSA), support breathing, and debride the wound. It is notifiable.', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v3')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = 'b523c691-14fd-5520-b63e-10c8625b6cd0';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('21c6c07d-74a3-5c52-bd93-c8532ebb8334', 'b523c691-14fd-5520-b63e-10c8625b6cd0', 'A', 'Stroke', false, 0),
  ('58575898-fee1-580c-8d83-9c90379a103c', 'b523c691-14fd-5520-b63e-10c8625b6cd0', 'B', 'Wound botulism', true, 1),
  ('cf3ae026-370f-5cae-ac7b-6c625b6dc468', 'b523c691-14fd-5520-b63e-10c8625b6cd0', 'C', 'Guillain-Barré syndrome', false, 2),
  ('5dbdff45-6899-5213-acc1-c8e9091571b0', 'b523c691-14fd-5520-b63e-10c8625b6cd0', 'D', 'Tetanus', false, 3),
  ('669867f8-7a59-5591-8d1c-66ebcef08df6', 'b523c691-14fd-5520-b63e-10c8625b6cd0', 'E', 'Myasthenia gravis', false, 4);

-- Q316
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('c4d0897e-169d-55b6-96b0-bb4ada85047a', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000010', 'sba', 'A 40 year old abattoir worker has fever, headache, pneumonia and raised LFTs. Serology is positive for phase II antibodies. What is the SINGLE most likely organism?', 'Q fever is caught by inhaling contaminated dust from farm animals (especially at lambing and in abattoirs). Acute illness causes fever, headache, atypical pneumonia and hepatitis. Chronic Q fever can cause culture-negative endocarditis. Treat with doxycycline.', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v3')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = 'c4d0897e-169d-55b6-96b0-bb4ada85047a';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('b96c8c27-0561-5f62-b3f9-4c9ae0959208', 'c4d0897e-169d-55b6-96b0-bb4ada85047a', 'A', 'Legionella pneumophila', false, 0),
  ('e9627a6f-6111-556a-81df-e2fc0a269031', 'c4d0897e-169d-55b6-96b0-bb4ada85047a', 'B', 'Brucella melitensis', false, 1),
  ('e3da0bc7-f0ac-5ac9-bc44-db1a319cc814', 'c4d0897e-169d-55b6-96b0-bb4ada85047a', 'C', 'Leptospira interrogans', false, 2),
  ('cede35e8-1bef-5d97-9655-19e3ec111467', 'c4d0897e-169d-55b6-96b0-bb4ada85047a', 'D', 'Coxiella burnetii (Q fever)', true, 3),
  ('d9e7c32c-8df2-5403-8f6a-87b8ca61f0cb', 'c4d0897e-169d-55b6-96b0-bb4ada85047a', 'E', 'Chlamydia psittaci', false, 4);

-- Q317
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('2178b01f-8981-5a8c-bee7-4d30ad61528a', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000010', 'sba', 'A 22 year old man has a fever and a new murmur. Three blood cultures grow Staphylococcus aureus, and echo shows a mitral valve vegetation. What are these findings according to the modified Duke criteria?', 'Modified Duke major criteria: positive blood cultures with typical organisms (S. aureus, viridans streptococci, Strep gallolyticus, HACEK, enterococci) on 2 separate cultures, and evidence of endocardial involvement (vegetation, abscess or new valvular regurgitation). Definite IE = 2 major, or 1 major plus 3 minor, or 5 minor. Minor criteria include predisposition, fever, vascular and immunological phenomena.', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v3')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = '2178b01f-8981-5a8c-bee7-4d30ad61528a';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('08765b18-8cbf-5b8c-ace3-a98cb1b1ba0e', '2178b01f-8981-5a8c-bee7-4d30ad61528a', 'A', 'Not consistent with endocarditis', false, 0),
  ('ce953293-0937-5943-9378-db7035268250', '2178b01f-8981-5a8c-bee7-4d30ad61528a', 'B', 'Two major criteria: definite infective endocarditis', true, 1),
  ('9642c6ce-b6d2-5275-ab8d-23085c221e12', '2178b01f-8981-5a8c-bee7-4d30ad61528a', 'C', 'Rejected diagnosis', false, 2),
  ('dfc9241b-0b7c-5629-b50a-8556ba0b56a3', '2178b01f-8981-5a8c-bee7-4d30ad61528a', 'D', 'One major and one minor criterion: possible endocarditis', false, 3),
  ('b8eb50e0-9293-5e6c-ae6e-27dbf1574dbf', '2178b01f-8981-5a8c-bee7-4d30ad61528a', 'E', 'Minor criteria only', false, 4);

-- Q318
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('51402b4c-e5b0-52a8-931d-a40ca3e08ddd', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000010', 'sba', 'A 28 year old woman from Bolivia has seizures. MRI shows multiple small cystic lesions with a visible scolex in the brain. What is the SINGLE most likely diagnosis?', 'Neurocysticercosis comes from swallowing T. solium eggs (faecal-oral spread from human carriers). It is the commonest cause of acquired epilepsy worldwide. Cysts with a scolex (''hole with a dot'') are characteristic. Treatment is antiparasitic drugs (albendazole with or without praziquantel) plus steroids for viable cysts, and anticonvulsants.', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v3')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = '51402b4c-e5b0-52a8-931d-a40ca3e08ddd';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('b7f59b80-1fdc-58f7-a4b0-34a468568043', '51402b4c-e5b0-52a8-931d-a40ca3e08ddd', 'A', 'Toxoplasmosis', false, 0),
  ('457ce5f3-a9d7-5bd6-acee-60434bfb4192', '51402b4c-e5b0-52a8-931d-a40ca3e08ddd', 'B', 'Tuberculoma', false, 1),
  ('b25d7ccc-52cf-5bbe-9403-948651387dd8', '51402b4c-e5b0-52a8-931d-a40ca3e08ddd', 'C', 'Brain abscess', false, 2),
  ('d4d9c0fb-c05a-5778-9e63-2c1f02e8a7bb', '51402b4c-e5b0-52a8-931d-a40ca3e08ddd', 'D', 'Glioblastoma', false, 3),
  ('c8406a7f-e60f-5522-b92e-b025d7365953', '51402b4c-e5b0-52a8-931d-a40ca3e08ddd', 'E', 'Neurocysticercosis (Taenia solium)', true, 4);

-- Q319
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('fff5641c-b1d4-5d2a-9eb0-eaa9f3214ff4', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000010', 'sba', 'A 70 year old man has had a urinary catheter for 3 months. A routine urine dipstick is positive for leucocytes and nitrites, but he is asymptomatic. What is the SINGLE most appropriate management?', 'Bacteriuria is almost universal in long-term catheters, and dipsticks are unreliable. Treat only symptomatic catheter-associated UTI (fever, rigors, suprapubic or loin pain, delirium). If treating, send a urine sample from a new catheter and replace the catheter if it has been in more than 7 days. Asymptomatic bacteriuria is treated in pregnancy and before urological procedures.', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v3')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = 'fff5641c-b1d4-5d2a-9eb0-eaa9f3214ff4';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('b879af1f-301a-5517-8357-db10e983cb4c', 'fff5641c-b1d4-5d2a-9eb0-eaa9f3214ff4', 'A', 'Start long-term antibiotic prophylaxis', false, 0),
  ('5abe55ef-2596-5aa1-af14-be249e970d49', 'fff5641c-b1d4-5d2a-9eb0-eaa9f3214ff4', 'B', 'Send repeated urine cultures weekly', false, 1),
  ('943c1ba6-5fd8-5807-89ff-c2c5326982fe', 'fff5641c-b1d4-5d2a-9eb0-eaa9f3214ff4', 'C', 'Give a 7-day course of trimethoprim', false, 2),
  ('9b6d4e7c-5678-52c0-a3db-404c24cf71fa', 'fff5641c-b1d4-5d2a-9eb0-eaa9f3214ff4', 'D', 'Change the catheter and give IV antibiotics', false, 3),
  ('3e9cdf3c-ea09-5fd2-a08d-4298f47dd3d0', 'fff5641c-b1d4-5d2a-9eb0-eaa9f3214ff4', 'E', 'Do not treat asymptomatic bacteriuria in a catheterised patient', true, 4);

-- Q320
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('28ab6877-3949-5741-813c-e05c809c78a2', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000010', 'sba', 'A 66 year old man on the ward develops a rash, flushing and hypotension during a rapid IV vancomycin infusion. What is the SINGLE most likely cause and action?', 'Vancomycin flushing syndrome is a non-immune histamine release related to infusion rate. It causes flushing of the face, neck and upper body, itching and sometimes hypotension. Stop or slow the infusion (over at least 60 minutes per gram) and give antihistamines. Vancomycin also needs trough level monitoring because of nephrotoxicity and ototoxicity.', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v3')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = '28ab6877-3949-5741-813c-e05c809c78a2';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('0d383469-8b0a-5f20-924d-2e2a62e441a2', '28ab6877-3949-5741-813c-e05c809c78a2', 'A', 'Stevens-Johnson syndrome', false, 0),
  ('43c24d41-6276-5fd9-b8a0-d8f6300e89c3', '28ab6877-3949-5741-813c-e05c809c78a2', 'B', 'Vancomycin infusion reaction (''red man syndrome''); slow the infusion rate and give an antihistamine', true, 1),
  ('30d744e2-2a0e-5763-bce5-7cb6fbb1bc92', '28ab6877-3949-5741-813c-e05c809c78a2', 'C', 'Sepsis', false, 2),
  ('6d9539ad-e5e0-5aa8-b22c-1210bae9a357', '28ab6877-3949-5741-813c-e05c809c78a2', 'D', 'Drug-induced lupus', false, 3),
  ('b563dbef-b5a9-58b6-970b-c2ef1cc96895', '28ab6877-3949-5741-813c-e05c809c78a2', 'E', 'Anaphylaxis; adrenaline and never use vancomycin again', false, 4);

-- Q321
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('545fc1a3-8386-5661-8de6-02b0f7a2cdc9', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000010', 'sba', 'A 30 year old woman with a history of penicillin allergy (an itchy rash as a child) needs treatment for a dental abscess. She has no history of anaphylaxis. What is the SINGLE most appropriate antibiotic choice?', 'People with a history of penicillin allergy should avoid all penicillins. Cephalosporins can be used with caution if the previous reaction was not immediate or severe (about 1-2% cross-reactivity). For dental infections, metronidazole or clarithromycin are alternatives. Many reported allergies are not true allergy, and penicillin allergy delabelling services can help.', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v3')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = '545fc1a3-8386-5661-8de6-02b0f7a2cdc9';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('deb714da-fc44-51c2-bcab-bd33343d2b82', '545fc1a3-8386-5661-8de6-02b0f7a2cdc9', 'A', 'Amoxicillin', false, 0),
  ('29dd146f-ae89-56c5-8299-95bbcd6b147c', '545fc1a3-8386-5661-8de6-02b0f7a2cdc9', 'B', 'Flucloxacillin', false, 1),
  ('9aacc0f3-3226-55fa-b1b0-4707bd6abebc', '545fc1a3-8386-5661-8de6-02b0f7a2cdc9', 'C', 'Metronidazole (or clarithromycin), avoiding penicillins', true, 2),
  ('015450b1-ce6d-5ccc-a111-7e1a23d84edb', '545fc1a3-8386-5661-8de6-02b0f7a2cdc9', 'D', 'Phenoxymethylpenicillin', false, 3),
  ('483de95f-c18a-540d-a05a-395547acddc1', '545fc1a3-8386-5661-8de6-02b0f7a2cdc9', 'E', 'Co-amoxiclav', false, 4);

-- Q322
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('8006a32e-a896-577c-9a2e-2424044798ad', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000010', 'sba', 'A 75 year old man has been given IV gentamicin for 6 days for pyelonephritis. Which adverse effects are MOST important to monitor for?', 'Aminoglycosides cause dose-related nephrotoxicity and ototoxicity (irreversible vestibular and cochlear damage, especially with prolonged courses). Use the once-daily dosing nomogram, monitor levels and creatinine, and limit duration (usually 72 hours or less). Avoid in myasthenia gravis.', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v3')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = '8006a32e-a896-577c-9a2e-2424044798ad';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('8186fabe-52fe-5230-ab6e-ddea30d80c50', '8006a32e-a896-577c-9a2e-2424044798ad', 'A', 'Optic neuritis', false, 0),
  ('d0bd5b1d-42c2-5c63-babb-de8272c1435a', '8006a32e-a896-577c-9a2e-2424044798ad', 'B', 'Peripheral neuropathy', false, 1),
  ('161f53a4-ab00-5d23-ba15-e58696695c57', '8006a32e-a896-577c-9a2e-2424044798ad', 'C', 'Nephrotoxicity and ototoxicity (monitor levels and renal function)', true, 2),
  ('7546a06f-954f-5759-8122-64edb49193f8', '8006a32e-a896-577c-9a2e-2424044798ad', 'D', 'Hepatotoxicity only', false, 3),
  ('df0fbcfc-fda5-500c-a050-607cdecb8cce', '8006a32e-a896-577c-9a2e-2424044798ad', 'E', 'Pancreatitis', false, 4);

-- Q323
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('8c44dd59-b2a4-512a-ac59-1edcbe5bb76e', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000010', 'sba', 'A 4 year old girl had a non-blanching rash and was treated for meningococcal sepsis. Several weeks later, she has a routine hearing check. Why is this important?', 'NICE recommends a formal audiological assessment within 4 weeks of recovery from bacterial meningitis, as sensorineural hearing loss is a common complication (especially pneumococcal). Early detection allows cochlear implantation before cochlear ossification. Other complications are seizures, developmental delay, limb loss and scarring.', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v3')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = '8c44dd59-b2a4-512a-ac59-1edcbe5bb76e';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('984c90d7-43dd-536e-bc0c-ac72f9a06f70', '8c44dd59-b2a4-512a-ac59-1edcbe5bb76e', 'A', 'Only if the child had a seizure', false, 0),
  ('f0004eb6-9daa-5d27-a6fc-d2cc25515849', '8c44dd59-b2a4-512a-ac59-1edcbe5bb76e', 'B', 'Because of ototoxic paracetamol', false, 1),
  ('d0d8508a-764d-5d60-9622-a7b332e2a7a8', '8c44dd59-b2a4-512a-ac59-1edcbe5bb76e', 'C', 'Only to check for glue ear', false, 2),
  ('138f84de-3f34-57dc-8fb2-705d362d293e', '8c44dd59-b2a4-512a-ac59-1edcbe5bb76e', 'D', 'It is not needed after meningitis', false, 3),
  ('85f33cca-f4d4-5e7b-b1f5-c0927d558c90', '8c44dd59-b2a4-512a-ac59-1edcbe5bb76e', 'E', 'Sensorineural hearing loss is a common complication of bacterial meningitis, so audiology assessment is recommended within 4 weeks', true, 4);

-- Q324
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('5d367614-64e0-5bc8-913b-01138b5f8d3e', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000010', 'sba', 'A 45 year old woman with HIV has a CD4 count of 650 cells/µL and is not taking any treatment. What is the CURRENT recommendation regarding ART?', 'BHIVA recommends offering ART to all people with HIV regardless of CD4 count (START trial showed benefit). An undetectable viral load means HIV cannot be sexually transmitted (U=U). Check baseline resistance, HLA-B*5701 (before abacavir), renal function and coinfections. Prophylaxis against opportunistic infections depends on CD4 count.', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v3')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = '5d367614-64e0-5bc8-913b-01138b5f8d3e';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('b9f607b1-7a2b-5274-827b-898749fc7f59', '5d367614-64e0-5bc8-913b-01138b5f8d3e', 'A', 'ART is not needed with a high CD4 count', false, 0),
  ('7f617571-8a6a-5990-927a-582b035c244e', '5d367614-64e0-5bc8-913b-01138b5f8d3e', 'B', 'Start ART only if she becomes pregnant', false, 1),
  ('d9d41ccf-555c-5ae4-827d-61a3d3cc44e3', '5d367614-64e0-5bc8-913b-01138b5f8d3e', 'C', 'Start ART only when CD4 falls below 200', false, 2),
  ('f57677f7-341b-580d-8a7c-23ee4bf9922f', '5d367614-64e0-5bc8-913b-01138b5f8d3e', 'D', 'Start ART as soon as possible for all people with HIV, regardless of CD4 count', true, 3),
  ('5dbb0270-01e1-5750-938c-00a4eeeda400', '5d367614-64e0-5bc8-913b-01138b5f8d3e', 'E', 'Start ART only if viral load is very high', false, 4);

-- Q325
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('e575cc21-578f-5b4f-9047-f3eb5654d622', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000020', 'sba', 'A 22 year old woman has had a vaginal discharge and intermenstrual bleeding. A NAAT test confirms gonorrhoea. Which test should also be done before treatment?', 'Gonorrhoea resistance is a growing problem. BASHH advises taking cultures before treatment to test sensitivity. First-line treatment is ceftriaxone 1 g IM. Offer a test of cure 2 weeks later, notify partners, and screen for other STIs including HIV and syphilis.', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v3')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = 'e575cc21-578f-5b4f-9047-f3eb5654d622';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('101a80ca-37d9-5040-b3de-33454eb6503d', 'e575cc21-578f-5b4f-9047-f3eb5654d622', 'A', 'Culture of the endocervix (for antibiotic sensitivity)', true, 0),
  ('6b8dae75-b3ca-5701-82df-17ae32271bcb', 'e575cc21-578f-5b4f-9047-f3eb5654d622', 'B', 'Liver function tests', false, 1),
  ('9414e16b-70c2-5218-bc6e-9c05ccef0832', 'e575cc21-578f-5b4f-9047-f3eb5654d622', 'C', 'Chest X-ray', false, 2),
  ('95eb52e5-3e0a-5c51-9442-7e257f55e0cb', 'e575cc21-578f-5b4f-9047-f3eb5654d622', 'D', 'Blood cultures in all cases', false, 3),
  ('b16525f4-8180-5cb7-a1d4-1b56327fb5ab', 'e575cc21-578f-5b4f-9047-f3eb5654d622', 'E', 'Pregnancy test is never needed', false, 4);

-- Q326
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('040451c3-6948-5e8e-b7f0-e2e8d7ffd5f2', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000020', 'sba', 'A 30 year old woman has a positive NAAT for chlamydia at 10 weeks of pregnancy. What is the SINGLE most appropriate treatment?', 'Doxycycline is contraindicated in pregnancy (tooth and bone effects). BASHH recommends azithromycin (1 g single dose, then 500 mg daily for 2 days), erythromycin or amoxicillin in pregnancy. Do a test of cure (at least 3 weeks after treatment) in pregnancy. Untreated chlamydia can cause neonatal conjunctivitis and pneumonia.', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v3')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = '040451c3-6948-5e8e-b7f0-e2e8d7ffd5f2';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('a0e69b2a-f8cc-5626-ae28-b94c211f0dc6', '040451c3-6948-5e8e-b7f0-e2e8d7ffd5f2', 'A', 'No treatment until after delivery', false, 0),
  ('b4e03c9e-d984-5f92-b948-ec4e0a8a08d1', '040451c3-6948-5e8e-b7f0-e2e8d7ffd5f2', 'B', 'Doxycycline 100 mg twice daily for 7 days', false, 1),
  ('bff19cac-49ad-5564-b5ae-b119664227b3', '040451c3-6948-5e8e-b7f0-e2e8d7ffd5f2', 'C', 'Ciprofloxacin', false, 2),
  ('ac88911e-813b-5fba-9f28-66371e1a0662', '040451c3-6948-5e8e-b7f0-e2e8d7ffd5f2', 'D', 'Azithromycin (or amoxicillin or erythromycin), avoiding doxycycline', true, 3),
  ('bdb7221f-ecbe-548b-a256-c0a921f679b0', '040451c3-6948-5e8e-b7f0-e2e8d7ffd5f2', 'E', 'Metronidazole', false, 4);

-- Q327
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('74cbe664-10a2-5b9e-9386-e2eb63e31bc0', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000020', 'sba', 'A 35 year old man who has sex with men has painful, flu-like illness, then a rash with umbilicated pustules on his genitals and anus, and proctitis. What is the SINGLE most likely diagnosis?', 'Mpox causes fever, lymphadenopathy and a rash progressing from macules to papules, vesicles and umbilicated pustules, often in the anogenital area, with proctitis. Diagnose with a PCR swab of a lesion. Management is supportive, with isolation and contact tracing. Vaccination (MVA-BN) is offered to eligible groups, such as GBMSM at higher risk.', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v3')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = '74cbe664-10a2-5b9e-9386-e2eb63e31bc0';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('b23fedd6-63af-5121-9ab7-9d1fb8a15b4b', '74cbe664-10a2-5b9e-9386-e2eb63e31bc0', 'A', 'Mpox (monkeypox)', true, 0),
  ('04e10326-04ff-52a1-b13d-691a42ecbeb0', '74cbe664-10a2-5b9e-9386-e2eb63e31bc0', 'B', 'Herpes simplex', false, 1),
  ('113d6e57-1d53-584e-8c86-6dfd8f7ddfb5', '74cbe664-10a2-5b9e-9386-e2eb63e31bc0', 'C', 'Chickenpox', false, 2),
  ('036d21b6-a9c8-5488-81e2-9c460edbfc94', '74cbe664-10a2-5b9e-9386-e2eb63e31bc0', 'D', 'Molluscum contagiosum', false, 3),
  ('cd96bd0a-492f-5c5b-a865-470ead6ce59e', '74cbe664-10a2-5b9e-9386-e2eb63e31bc0', 'E', 'Syphilis', false, 4);

-- Q328
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('8e886805-6f2d-5039-9115-15518dc18e3d', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000005', 'sba', 'A 70 year old man has a creatinine rise from 110 to 280 µmol/L after starting ramipril 2 weeks ago. He has resistant hypertension, flash pulmonary oedema and an abdominal bruit. What is the SINGLE most likely underlying diagnosis?', 'In bilateral renal artery stenosis (or stenosis to a single kidney), glomerular filtration depends on angiotensin II constricting the efferent arteriole. ACE inhibitors and ARBs cause a sharp fall in GFR. Clues: resistant hypertension, flash pulmonary oedema, peripheral vascular disease, renal bruit, and kidneys of unequal size. Investigate with CT or MR angiography or duplex. Treatment is usually medical (statin, antiplatelet, BP control).', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v3')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = '8e886805-6f2d-5039-9115-15518dc18e3d';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('c07bc1fe-170a-5e4d-b5bb-6089e3abb1b4', '8e886805-6f2d-5039-9115-15518dc18e3d', 'A', 'Diabetic nephropathy', false, 0),
  ('9e743258-ff4e-5a33-885e-2733f6fb908b', '8e886805-6f2d-5039-9115-15518dc18e3d', 'B', 'Bilateral renal artery stenosis (atherosclerotic)', true, 1),
  ('99b7022f-103e-5062-bafd-55d0a7c7092b', '8e886805-6f2d-5039-9115-15518dc18e3d', 'C', 'Post-renal obstruction', false, 2),
  ('8fedaa4f-464b-5fc8-ac8d-f83b03792b39', '8e886805-6f2d-5039-9115-15518dc18e3d', 'D', 'IgA nephropathy', false, 3),
  ('4658e4bf-a616-500a-8538-06a090d7d623', '8e886805-6f2d-5039-9115-15518dc18e3d', 'E', 'Acute interstitial nephritis', false, 4);

-- Q329
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('e941903e-6771-5d6a-a13a-4056bf852e35', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000005', 'sba', 'A 45 year old woman with nephrotic syndrome (albumin 18 g/L, proteinuria 9 g/day) develops sudden flank pain, haematuria and a rise in creatinine. What is the SINGLE most likely complication?', 'Nephrotic syndrome causes a hypercoagulable state from urinary loss of antithrombin and raised clotting factors. It leads to VTE, including renal vein thrombosis (especially in membranous nephropathy). Other complications are infection (loss of immunoglobulin), hyperlipidaemia and AKI. Prophylactic anticoagulation is considered when albumin is very low.', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v3')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = 'e941903e-6771-5d6a-a13a-4056bf852e35';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('c243c408-8a55-5bb0-8da1-049842286f1b', 'e941903e-6771-5d6a-a13a-4056bf852e35', 'A', 'Pyelonephritis', false, 0),
  ('e3c4be48-60d5-5d8a-b300-a0106b5cb14d', 'e941903e-6771-5d6a-a13a-4056bf852e35', 'B', 'Renal stones', false, 1),
  ('9c62c3ca-e386-5997-a24e-15178716e346', 'e941903e-6771-5d6a-a13a-4056bf852e35', 'C', 'Renal cell carcinoma', false, 2),
  ('c0762ae9-20eb-59e1-9f36-de4282e46be0', 'e941903e-6771-5d6a-a13a-4056bf852e35', 'D', 'Acute tubular necrosis', false, 3),
  ('ba81e0ce-f473-5d10-b9b4-60f65bceb78d', 'e941903e-6771-5d6a-a13a-4056bf852e35', 'E', 'Renal vein thrombosis', true, 4);

-- Q330
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('dca84e6a-f393-544e-80c1-62afe499580f', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000005', 'sba', 'A 10 year old boy has haematuria, progressive kidney disease and sensorineural hearing loss. His maternal uncle needed dialysis at 30. What is the SINGLE most likely diagnosis?', 'Alport syndrome is mostly X-linked (COL4A5, type IV collagen), causing haematuria, progressive renal failure, sensorineural deafness and eye abnormalities (anterior lenticonus). Males are more severely affected. Renal biopsy shows a split, laminated basement membrane. ACE inhibitors slow progression. After transplantation, anti-GBM disease can occur.', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v3')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = 'dca84e6a-f393-544e-80c1-62afe499580f';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('55a88a5b-9015-505c-88d2-b4e1fc5fd94c', 'dca84e6a-f393-544e-80c1-62afe499580f', 'A', 'Fabry disease', false, 0),
  ('9bd845b0-9d42-586e-99e3-f07c0d2121ab', 'dca84e6a-f393-544e-80c1-62afe499580f', 'B', 'Thin basement membrane disease', false, 1),
  ('e2834a30-ac12-5afe-8950-be1c4d1b3389', 'dca84e6a-f393-544e-80c1-62afe499580f', 'C', 'Polycystic kidney disease', false, 2),
  ('5eeb7ea6-8085-5a19-b5eb-b299863d30e9', 'dca84e6a-f393-544e-80c1-62afe499580f', 'D', 'Alport syndrome', true, 3),
  ('91752ebf-d3bb-5c15-a32a-685590d5791f', 'dca84e6a-f393-544e-80c1-62afe499580f', 'E', 'IgA nephropathy', false, 4);

-- Q331
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('7798b1dd-8653-5d51-8de8-832cca3f1679', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000005', 'sba', 'A 30 year old woman has recurrent kidney stones, a normal anion gap metabolic acidosis, hypokalaemia and an inability to acidify her urine (urine pH stays above 5.5). What is the SINGLE most likely diagnosis?', 'Distal RTA (type 1) is a failure of hydrogen ion secretion in the collecting duct. It causes hypokalaemia, urine pH above 5.5 despite acidosis, and nephrocalcinosis or calcium phosphate stones. It is linked to Sjögren''s, SLE and drugs. Proximal RTA (type 2) is bicarbonate wasting, often with Fanconi syndrome. Type 4 RTA (hypoaldosteronism) causes hyperkalaemia.', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v3')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = '7798b1dd-8653-5d51-8de8-832cca3f1679';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('f78b80de-c999-5ea0-93b7-7e88782e7e0a', '7798b1dd-8653-5d51-8de8-832cca3f1679', 'A', 'Distal (type 1) renal tubular acidosis', true, 0),
  ('4ffd8085-975b-56ee-b7f9-c75996c69309', '7798b1dd-8653-5d51-8de8-832cca3f1679', 'B', 'Type 4 renal tubular acidosis', false, 1),
  ('8241a78a-e42e-5f49-9fa3-0db1456c2e2f', '7798b1dd-8653-5d51-8de8-832cca3f1679', 'C', 'Proximal (type 2) renal tubular acidosis', false, 2),
  ('587329d5-99f8-51ad-b999-cacb4a891ab3', '7798b1dd-8653-5d51-8de8-832cca3f1679', 'D', 'Diabetic ketoacidosis', false, 3),
  ('a60b2ffe-864e-5171-abe4-f994012cd9db', '7798b1dd-8653-5d51-8de8-832cca3f1679', 'E', 'Primary hyperaldosteronism', false, 4);

-- Q332
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('a8e94491-2613-5bb6-bf9d-79b5f34e9d5b', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000005', 'sba', 'A 66 year old man on peritoneal dialysis has abdominal pain and his drained dialysate is cloudy. Effluent white cell count is 300/µL with more than 50% neutrophils. What is the SINGLE most appropriate management?', 'PD peritonitis is diagnosed by cloudy effluent, abdominal pain and an effluent WCC above 100/µL with over 50% neutrophils. Coagulase-negative staph and S. aureus are common (from touch contamination). Treat with intraperitoneal antibiotics (such as vancomycin plus a Gram-negative agent), then adjust to culture results. Recurrent or fungal infection needs catheter removal.', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v3')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = 'a8e94491-2613-5bb6-bf9d-79b5f34e9d5b';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('2e43e2d5-e562-5087-a8f3-14e3769c4eb6', 'a8e94491-2613-5bb6-bf9d-79b5f34e9d5b', 'A', 'Emergency laparotomy', false, 0),
  ('661c6421-c18b-5e80-a33b-46004c580f4a', 'a8e94491-2613-5bb6-bf9d-79b5f34e9d5b', 'B', 'IV antibiotics only with no culture', false, 1),
  ('5b2c4dcc-f714-55c7-b51c-30de85d58f52', 'a8e94491-2613-5bb6-bf9d-79b5f34e9d5b', 'C', 'Analgesia only', false, 2),
  ('b39b19ad-9aed-5265-8fb8-cd73922ff0d8', 'a8e94491-2613-5bb6-bf9d-79b5f34e9d5b', 'D', 'Stop dialysis permanently', false, 3),
  ('59e68736-446e-5b9a-af61-0b241915a937', 'a8e94491-2613-5bb6-bf9d-79b5f34e9d5b', 'E', 'Intraperitoneal antibiotics (covering Gram-positive and Gram-negative organisms) after sending effluent for culture', true, 4);

-- Q333
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('865a5693-3f36-54bd-bb5e-109eef3eefe8', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000005', 'sba', 'A 45 year old man had a kidney transplant 2 years ago. He is on tacrolimus and mycophenolate. He is started on clarithromycin for a chest infection, and his creatinine rises. What is the SINGLE most likely explanation?', 'Calcineurin inhibitors (tacrolimus, ciclosporin) are metabolised by CYP3A4. Inhibitors (macrolides, azole antifungals, diltiazem, grapefruit) raise levels and cause nephrotoxicity. Inducers (rifampicin, carbamazepine, St John''s wort) lower levels and risk rejection. Check tacrolimus levels and seek advice from the transplant team.', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v3')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = '865a5693-3f36-54bd-bb5e-109eef3eefe8';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('dd8c7725-1a82-5551-94ac-ec927044543d', '865a5693-3f36-54bd-bb5e-109eef3eefe8', 'A', 'Clarithromycin inhibits CYP3A4, raising tacrolimus levels and causing nephrotoxicity', true, 0),
  ('b0638113-bd00-5a66-82d3-6c933cd2d8be', '865a5693-3f36-54bd-bb5e-109eef3eefe8', 'B', 'Dehydration only', false, 1),
  ('1e9e0fa9-914b-5cad-a3c7-9de5effd693e', '865a5693-3f36-54bd-bb5e-109eef3eefe8', 'C', 'Clarithromycin is directly nephrotoxic at standard doses', false, 2),
  ('6b951f9b-1016-57b0-9a47-d727921878aa', '865a5693-3f36-54bd-bb5e-109eef3eefe8', 'D', 'Acute rejection only', false, 3),
  ('16a4e644-b11a-5f3d-a895-93a22aff32d3', '865a5693-3f36-54bd-bb5e-109eef3eefe8', 'E', 'Mycophenolate toxicity', false, 4);

-- Q334
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('8833e017-8a85-5b5e-a78b-27fdec282210', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000005', 'sba', 'A 35 year old man has fever, rigors, perineal pain, dysuria and a very tender, boggy prostate on rectal examination. What is the SINGLE most appropriate treatment?', 'Acute bacterial prostatitis is usually caused by E. coli and other Gram-negatives. NICE NG110 recommends a fluoroquinolone (ciprofloxacin or ofloxacin) or trimethoprim for 14 days, then reassess. Admit if septic or in urinary retention (a suprapubic catheter may be preferred). Avoid prostatic massage.', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v3')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = '8833e017-8a85-5b5e-a78b-27fdec282210';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('7576c724-b41d-5a26-96b1-c3f9e0be7346', '8833e017-8a85-5b5e-a78b-27fdec282210', 'A', 'Oral ciprofloxacin (or ofloxacin) for 14 days, after sending urine culture', true, 0),
  ('3d8fce1b-9000-5b8b-b866-249de4eaf4b4', '8833e017-8a85-5b5e-a78b-27fdec282210', 'B', 'Urgent prostate biopsy', false, 1),
  ('f2c648e7-c762-5d0b-895a-f55bca20fa8f', '8833e017-8a85-5b5e-a78b-27fdec282210', 'C', 'Vigorous prostatic massage', false, 2),
  ('996ad509-ac37-5f9f-9db5-c6827c7093a1', '8833e017-8a85-5b5e-a78b-27fdec282210', 'D', 'Oral amoxicillin for 3 days', false, 3),
  ('a301b1e4-0ed7-5505-b993-9d6ea37862cd', '8833e017-8a85-5b5e-a78b-27fdec282210', 'E', 'Single dose of trimethoprim', false, 4);

-- Q335
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('2c43f078-cc77-50bb-982e-e024920ccc66', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000005', 'sba', 'A 70 year old man with diabetes has a rapidly spreading, painful, dusky swelling of his scrotum and perineum with crepitus, fever and hypotension. What is the SINGLE most likely diagnosis?', 'Fournier''s gangrene is a polymicrobial necrotising fasciitis of the perineum and genitalia, more common in men with diabetes, immunosuppression or alcohol misuse. Pain out of proportion, crepitus and rapid spread with systemic toxicity are typical. Management is resuscitation, broad-spectrum IV antibiotics and urgent extensive surgical debridement.', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v3')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = '2c43f078-cc77-50bb-982e-e024920ccc66';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('0907f08d-e8cf-5f1a-ad5e-588e3c372b78', '2c43f078-cc77-50bb-982e-e024920ccc66', 'A', 'Cellulitis only', false, 0),
  ('61a5b952-9f6b-5005-8668-5af25d12fd07', '2c43f078-cc77-50bb-982e-e024920ccc66', 'B', 'Testicular torsion', false, 1),
  ('128aded9-811b-5c3d-aadd-c745a994ecf8', '2c43f078-cc77-50bb-982e-e024920ccc66', 'C', 'Strangulated inguinal hernia', false, 2),
  ('b89694e4-e278-5626-823e-75d2b4da078f', '2c43f078-cc77-50bb-982e-e024920ccc66', 'D', 'Epididymo-orchitis', false, 3),
  ('522ffe77-674f-5d01-b861-30c072b34f15', '2c43f078-cc77-50bb-982e-e024920ccc66', 'E', 'Fournier''s gangrene (necrotising fasciitis of the perineum)', true, 4);

-- Q336
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('32287434-a04a-587e-929e-7853f10fc002', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000005', 'sba', 'A 25 year old uncircumcised man has a painful swollen glans after his foreskin was retracted for catheterisation and not returned. The foreskin is stuck behind the glans. What is the SINGLE most likely diagnosis and first step?', 'Paraphimosis is a urological emergency: a retracted foreskin forms a constricting band, causing oedema of the glans and risking ischaemia. Reduce it manually after analgesia and measures to reduce swelling. A dorsal slit is needed if this fails. Always return the foreskin after catheterisation or examination.', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v3')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = '32287434-a04a-587e-929e-7853f10fc002';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('6f8a9eb2-dcd5-5a19-97f3-e772868d08ec', '32287434-a04a-587e-929e-7853f10fc002', 'A', 'Priapism; aspiration', false, 0),
  ('bed3aabe-ff92-5c77-8ff9-002215416b19', '32287434-a04a-587e-929e-7853f10fc002', 'B', 'Penile fracture; surgery', false, 1),
  ('1a0b3ace-e560-514f-898c-2e93c535919d', '32287434-a04a-587e-929e-7853f10fc002', 'C', 'Paraphimosis; analgesia/local anaesthetic, reduce swelling (ice, compression) and manually reduce the foreskin', true, 2),
  ('528a156f-cea8-5ca8-8442-b0e0a9b4b8b7', '32287434-a04a-587e-929e-7853f10fc002', 'D', 'Phimosis; topical steroids', false, 3),
  ('f0465916-6c15-5246-bf3c-030bf09bb7f1', '32287434-a04a-587e-929e-7853f10fc002', 'E', 'Balanitis; topical clotrimazole', false, 4);

-- Q337
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('be7a5d45-2fb1-5b28-a5ce-865b3b78662c', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000005', 'sba', 'A 45 year old man has had a slow urinary stream, spraying and straining for 6 months. He had a urethral injury after a straddle fall years ago. Flow rate testing shows a flattened plateau curve. What is the SINGLE most likely diagnosis?', 'Urethral strictures follow trauma (such as a straddle injury or catheterisation), infection (gonorrhoea) or lichen sclerosus. Uroflowmetry shows a flat ''plateau'' curve. Diagnosis is by urethroscopy or urethrography. Treatment is dilatation, urethrotomy or urethroplasty. BPH is more common in older men and gives a reduced peak flow with a prolonged curve.', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v3')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = 'be7a5d45-2fb1-5b28-a5ce-865b3b78662c';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('afabe1d1-6793-5776-891f-cc9fea3fd2f3', 'be7a5d45-2fb1-5b28-a5ce-865b3b78662c', 'A', 'Bladder stone', false, 0),
  ('ec7aad95-c16a-5ffd-bfd9-142ceea50bc6', 'be7a5d45-2fb1-5b28-a5ce-865b3b78662c', 'B', 'Neurogenic bladder', false, 1),
  ('e6b7cc4d-2336-5479-a86f-df1339de45a7', 'be7a5d45-2fb1-5b28-a5ce-865b3b78662c', 'C', 'Urethral stricture', true, 2),
  ('9e08e818-e722-584e-b7fc-c2f60f20f1e2', 'be7a5d45-2fb1-5b28-a5ce-865b3b78662c', 'D', 'Benign prostatic hyperplasia', false, 3),
  ('5e59d4a9-a05f-5e55-86d2-f88280c37139', 'be7a5d45-2fb1-5b28-a5ce-865b3b78662c', 'E', 'Detrusor overactivity', false, 4);

-- Q338
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('0976b9f6-a36c-51cf-9de0-9cba03893134', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000005', 'sba', 'A 55 year old woman has had recurrent calcium oxalate kidney stones. 24-hour urine shows hypercalciuria with a normal serum calcium and PTH. Which drug can reduce her urinary calcium?', 'Thiazides reduce urinary calcium excretion and are used for idiopathic hypercalciuria with recurrent calcium stones. General advice: high fluid intake (over 2.5 L urine a day), normal dietary calcium (low calcium diets increase oxalate absorption), reduced salt and animal protein. Potassium citrate is used for hypocitraturia. Allopurinol is used for hyperuricosuria.', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v3')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = '0976b9f6-a36c-51cf-9de0-9cba03893134';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('05ead9da-e5ef-5a7a-9368-1bfafb5520c2', '0976b9f6-a36c-51cf-9de0-9cba03893134', 'A', 'Vitamin D supplements at high dose', false, 0),
  ('7986679d-ffc8-53e6-a69f-3bbae2116b13', '0976b9f6-a36c-51cf-9de0-9cba03893134', 'B', 'Calcium supplements at high dose', false, 1),
  ('9fc6f3b1-bb32-5bf6-9aa8-af145d599276', '0976b9f6-a36c-51cf-9de0-9cba03893134', 'C', 'Furosemide', false, 2),
  ('65a67708-dd44-54e9-97ed-880be9670b1d', '0976b9f6-a36c-51cf-9de0-9cba03893134', 'D', 'A thiazide diuretic (e.g. bendroflumethiazide or indapamide)', true, 3),
  ('9cba14e5-0d0a-538b-b570-c7c521c87455', '0976b9f6-a36c-51cf-9de0-9cba03893134', 'E', 'Allopurinol', false, 4);

-- Q339
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('fd2a5b0e-a114-5028-8d26-c6a09e81811e', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000005', 'sba', 'A 42 year old man with gout has a radiolucent stone in his kidney on CT, with acidic urine (pH 5.0). What is the SINGLE most likely stone type and treatment?', 'Uric acid stones are radiolucent on plain X-ray (but visible on CT). They form in acidic urine and are linked to gout, myeloproliferative disorders and tumour lysis. They can dissolve with urinary alkalinisation (target pH 6.5-7). Struvite (staghorn) stones are linked to urease-producing bacteria (Proteus). Cystine stones are hexagonal crystals in cystinuria.', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v3')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = 'fd2a5b0e-a114-5028-8d26-c6a09e81811e';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('af0dff58-8f65-5ce6-8a27-f38f562c6f3b', 'fd2a5b0e-a114-5028-8d26-c6a09e81811e', 'A', 'Calcium phosphate; acidification', false, 0),
  ('7b11f843-3b33-5ab9-aa60-27fc3deb11d2', 'fd2a5b0e-a114-5028-8d26-c6a09e81811e', 'B', 'Cystine; penicillamine', false, 1),
  ('37b45c2e-782b-5162-b0e6-fa008d5cee91', 'fd2a5b0e-a114-5028-8d26-c6a09e81811e', 'C', 'Struvite; antibiotics', false, 2),
  ('12e256d1-34d2-520d-908e-6cff7fe4b6b7', 'fd2a5b0e-a114-5028-8d26-c6a09e81811e', 'D', 'Calcium oxalate; thiazide', false, 3),
  ('5ea981d4-b168-506a-b2c8-cc1db0821cd3', 'fd2a5b0e-a114-5028-8d26-c6a09e81811e', 'E', 'Uric acid stone; urinary alkalinisation (potassium citrate) and allopurinol', true, 4);

-- Q340
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('5079f032-bbe0-5870-99f1-bf96bd5ef444', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000005', 'sba', 'A 28 year old woman who is 20 weeks pregnant has a routine urine culture showing more than 10^5 E. coli/mL, sensitive to nitrofurantoin. She has no symptoms. What is the SINGLE most appropriate management?', 'Asymptomatic bacteriuria in pregnancy should be treated because it increases the risk of pyelonephritis, preterm birth and low birth weight. NICE NG109: treat with nitrofurantoin (avoid at term), amoxicillin or cefalexin based on sensitivities, for 7 days, and send a culture for test of cure. Trimethoprim is avoided in the first trimester (folate antagonist).', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v3')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = '5079f032-bbe0-5870-99f1-bf96bd5ef444';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('418ad7a7-5548-5ddd-8853-f944d07edb22', '5079f032-bbe0-5870-99f1-bf96bd5ef444', 'A', 'Treat only after delivery', false, 0),
  ('f3d7149b-88bb-5dbc-bfcd-66f0392b4d6d', '5079f032-bbe0-5870-99f1-bf96bd5ef444', 'B', 'No treatment for asymptomatic bacteriuria', false, 1),
  ('28e9521b-5b49-599b-ba48-ad2490f6639c', '5079f032-bbe0-5870-99f1-bf96bd5ef444', 'C', 'Treat with an antibiotic (e.g. nitrofurantoin for 7 days), then send a test of cure', true, 2),
  ('5a62f687-4a92-5a0c-a8b2-d4826def58c6', '5079f032-bbe0-5870-99f1-bf96bd5ef444', 'D', 'Wait until symptoms develop', false, 3),
  ('b57b929f-64f8-56ee-b582-8a6c2bb1292d', '5079f032-bbe0-5870-99f1-bf96bd5ef444', 'E', 'Oral trimethoprim in the first trimester as first choice', false, 4);

-- Q341
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('be4a9221-e750-594a-958f-39587ead58fb', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000005', 'sba', 'A 70 year old man with prostate cancer starts hormone therapy. Which treatment is used to suppress testosterone?', 'Androgen deprivation therapy uses GnRH agonists (goserelin, leuprorelin), which first cause a testosterone surge (''flare''), so an anti-androgen (bicalutamide) is given at the start. GnRH antagonists (degarelix) avoid the flare. Side effects include hot flushes, sexual dysfunction, osteoporosis, metabolic syndrome and cardiovascular risk.', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v3')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = 'be4a9221-e750-594a-958f-39587ead58fb';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('3a04844b-f0a7-5e88-9596-3ed9f6f97b74', 'be4a9221-e750-594a-958f-39587ead58fb', 'A', 'A GnRH (LHRH) agonist such as goserelin, with initial anti-androgen cover', true, 0),
  ('4e78802f-e05a-5fa6-ad22-669e41ba335d', 'be4a9221-e750-594a-958f-39587ead58fb', 'B', 'Testosterone injections', false, 1),
  ('0c4d1768-6d40-5864-a62a-b02488449ad7', 'be4a9221-e750-594a-958f-39587ead58fb', 'C', 'Finasteride', false, 2),
  ('0c2cc040-b7b6-5d33-b56c-4e19eeca28ed', 'be4a9221-e750-594a-958f-39587ead58fb', 'D', 'Spironolactone only', false, 3),
  ('481f480d-b46d-5acc-bb50-e2d7f8dab719', 'be4a9221-e750-594a-958f-39587ead58fb', 'E', 'Tamsulosin', false, 4);

-- Q342
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('52ac2417-7d29-568f-b9c6-b273873e7af7', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000005', 'sba', 'A 60 year old man has a PSA test. Which of the following is MOST likely to cause a falsely raised PSA?', 'PSA can be raised by BPH, prostatitis, UTI (wait at least 6 weeks after treatment), recent ejaculation or vigorous exercise (48 hours), urinary retention, catheterisation and prostate biopsy. 5-alpha reductase inhibitors (finasteride) roughly halve PSA. Men should be counselled about the benefits and harms of testing (Prostate Cancer Risk Management Programme).', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v3')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = '52ac2417-7d29-568f-b9c6-b273873e7af7';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('79a7a644-f23e-592f-a7ac-ef8a825fcd7d', '52ac2417-7d29-568f-b9c6-b273873e7af7', 'A', 'Drinking coffee', false, 0),
  ('6389597d-8d37-569c-aed4-66573329d24b', '52ac2417-7d29-568f-b9c6-b273873e7af7', 'B', 'Fasting', false, 1),
  ('10aa9ec6-a0e1-5b62-8595-b9c8086457dd', '52ac2417-7d29-568f-b9c6-b273873e7af7', 'C', 'Taking finasteride', false, 2),
  ('1645834e-13a2-58a3-a8b6-98aa126fe9ed', '52ac2417-7d29-568f-b9c6-b273873e7af7', 'D', 'Recent ejaculation, urinary tract infection, or vigorous exercise/cycling within 48 hours', true, 3),
  ('1bdaa313-d6d7-5bf5-95c1-4cc226d34f7d', '52ac2417-7d29-568f-b9c6-b273873e7af7', 'E', 'Taking paracetamol', false, 4);

-- Q343
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('65a91db6-037f-5f3a-92b6-ac601ec3d9ca', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000005', 'sba', 'A 58 year old woman has CKD stage 3b with an eGFR of 38. She has hypertension with an ACR of 80 mg/mmol. What is the BP target recommended by NICE?', 'NICE NG203: in CKD with an ACR of 70 mg/mmol or more, aim for a clinic systolic BP below 130 mmHg (range 120-129) and diastolic below 80 mmHg. If ACR is below 70, the target is systolic below 140 (range 120-139) and diastolic below 90. ACE inhibitors or ARBs are first-line when ACR is 3 mg/mmol or more with diabetes, or 70 or more without.', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v3')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = '65a91db6-037f-5f3a-92b6-ac601ec3d9ca';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('927cbd4f-7ad6-584d-a9a0-eb793b361d22', '65a91db6-037f-5f3a-92b6-ac601ec3d9ca', 'A', 'Below 110/60 mmHg', false, 0),
  ('d7df6385-0484-5a7a-9c6b-374b2b355a9c', '65a91db6-037f-5f3a-92b6-ac601ec3d9ca', 'B', 'Systolic below 130 mmHg (target range 120-129) and diastolic below 80 mmHg', true, 1),
  ('780f8af0-8087-5ecc-a2a2-c9a940ed3e5a', '65a91db6-037f-5f3a-92b6-ac601ec3d9ca', 'C', 'Below 150/90 mmHg', false, 2),
  ('7f5d17c9-2bdf-5b40-9c62-c96ca160c4eb', '65a91db6-037f-5f3a-92b6-ac601ec3d9ca', 'D', 'Below 140/90 mmHg', false, 3),
  ('ae3a8af1-b5c4-5113-abf6-0f86f5f2cc85', '65a91db6-037f-5f3a-92b6-ac601ec3d9ca', 'E', 'No specific target', false, 4);

-- Q344
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('4243b2ee-a714-5078-95ea-c5a441ea0145', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000019', 'sba', 'A 34 year old woman with rheumatoid arthritis on methotrexate wants to try for a baby. What is the SINGLE most appropriate advice?', 'Methotrexate is teratogenic and abortifacient. Women should stop at least 3 months before conception (BSR guidance now allows stopping when pregnancy is planned in some cases), and take folic acid. Hydroxychloroquine, sulfasalazine, azathioprine and some biologics (such as certolizumab) are compatible with pregnancy. Leflunomide needs a washout procedure.', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v3')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = '4243b2ee-a714-5078-95ea-c5a441ea0145';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('bcbd2e56-f12e-514f-ace4-bf45f24c4578', '4243b2ee-a714-5078-95ea-c5a441ea0145', 'A', 'Continue methotrexate in pregnancy', false, 0),
  ('9a423e72-7525-5192-848f-2491c82e1160', '4243b2ee-a714-5078-95ea-c5a441ea0145', 'B', 'Stop all treatment and accept flares', false, 1),
  ('b146679c-7290-5b80-8a85-f4d23d09b045', '4243b2ee-a714-5078-95ea-c5a441ea0145', 'C', 'Stop methotrexate only once pregnant', false, 2),
  ('44b20110-ab83-54f6-a3fb-6d588faf7b6d', '4243b2ee-a714-5078-95ea-c5a441ea0145', 'D', 'Switch to leflunomide', false, 3),
  ('cae4d5c9-22b6-54af-a194-d52e00eec682', '4243b2ee-a714-5078-95ea-c5a441ea0145', 'E', 'Stop methotrexate at least 3 months before trying to conceive (it is teratogenic), with specialist advice on alternatives', true, 4);

-- Q345
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('66b3da41-3687-5080-b1a6-dfa11c28e2fb', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000019', 'sba', 'A 60 year old woman with RA takes methotrexate 15 mg weekly. Which monitoring and co-prescription is MOST appropriate?', 'Methotrexate can cause bone marrow suppression, hepatotoxicity, pneumonitis and mucositis. Monitor FBC, LFTs and renal function every 2 weeks until stable, then every 3 months. Give folic acid (often 5 mg once weekly, not on the methotrexate day) to reduce side effects. Avoid trimethoprim and co-trimoxazole (marrow toxicity). Dosing is once WEEKLY, and errors can be fatal.', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v3')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = '66b3da41-3687-5080-b1a6-dfa11c28e2fb';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('859124ce-41c0-5af2-82f7-22d68e31c4eb', '66b3da41-3687-5080-b1a6-dfa11c28e2fb', 'A', 'No monitoring needed', false, 0),
  ('bf2aa4d3-2988-5c20-9506-f08a1227a0f8', '66b3da41-3687-5080-b1a6-dfa11c28e2fb', 'B', 'Annual chest X-ray only', false, 1),
  ('68bdf2c9-a2f3-5c07-958f-a1732167131d', '66b3da41-3687-5080-b1a6-dfa11c28e2fb', 'C', 'Monthly eye examinations', false, 2),
  ('84e4ad8b-b88d-5e21-a11a-78508afdd9e1', '66b3da41-3687-5080-b1a6-dfa11c28e2fb', 'D', 'Regular FBC, LFTs and U&Es, with folic acid on a different day from methotrexate', true, 3),
  ('7e2729c4-a9d2-5a1f-94ef-a4497890417f', '66b3da41-3687-5080-b1a6-dfa11c28e2fb', 'E', 'Daily folic acid on the same day', false, 4);

-- Q346
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('e9e4f01f-03ad-50d5-964c-03134bdff969', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000019', 'sba', 'A 45 year old woman starts hydroxychloroquine for lupus. Which long-term monitoring is required?', 'Hydroxychloroquine can cause irreversible retinopathy, with risk rising with duration and dose (above 5 mg/kg/day). The Royal College of Ophthalmologists recommends annual retinal screening (OCT and visual fields) after 5 years of use, or after 1 year with risk factors (such as renal impairment or tamoxifen).', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v3')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = 'e9e4f01f-03ad-50d5-964c-03134bdff969';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('d82fed92-5725-5080-b51f-6abf312b50d2', 'e9e4f01f-03ad-50d5-964c-03134bdff969', 'A', 'Weekly LFTs', false, 0),
  ('a17898f7-c82f-5b52-9c3c-fe1a0f3af8a0', 'e9e4f01f-03ad-50d5-964c-03134bdff969', 'B', 'Lung function every 3 months', false, 1),
  ('ef15c805-ea7f-5262-ad3c-e42138a69c35', 'e9e4f01f-03ad-50d5-964c-03134bdff969', 'C', 'Monthly FBC', false, 2),
  ('3140e966-9144-5001-8808-58018134489e', 'e9e4f01f-03ad-50d5-964c-03134bdff969', 'D', 'Annual eye screening (retinal toxicity) after 5 years (sooner if risk factors), with baseline assessment', true, 3),
  ('7a141fc7-8fb5-52cf-962f-00f5c6d89289', 'e9e4f01f-03ad-50d5-964c-03134bdff969', 'E', 'Annual hearing test', false, 4);

-- Q347
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('a8e96ad3-2e29-53e4-aeee-43640b6daa57', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000019', 'sba', 'A 66 year old woman with long-standing RA is to have a general anaesthetic for hip replacement. She has neck pain. What should be specifically assessed before surgery?', 'Long-standing RA can cause atlantoaxial instability (erosion of the transverse ligament and odontoid peg). Neck manipulation during intubation risks cord compression. Assess with flexion-extension cervical X-rays (or MRI) before anaesthesia. Symptoms include neck pain, occipital headache and myelopathy.', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v3')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = 'a8e96ad3-2e29-53e4-aeee-43640b6daa57';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('3e1578ad-7aaa-5f6d-ae2c-2d4f16e10e46', 'a8e96ad3-2e29-53e4-aeee-43640b6daa57', 'A', 'Flexion-extension cervical spine X-rays to look for atlantoaxial subluxation', true, 0),
  ('7c65b6dc-d0e2-55ec-a3f6-b1b84dbe935d', 'a8e96ad3-2e29-53e4-aeee-43640b6daa57', 'B', 'Temporomandibular joint ultrasound', false, 1),
  ('dace5128-d78d-5a3a-a139-bf0dabc21b7d', 'a8e96ad3-2e29-53e4-aeee-43640b6daa57', 'C', 'Lumbar spine MRI', false, 2),
  ('1193ff4f-bd57-5273-8271-80eff93c947a', 'a8e96ad3-2e29-53e4-aeee-43640b6daa57', 'D', 'Shoulder X-ray', false, 3),
  ('fb8cf4af-3eda-52ed-aa17-fd6580067ccb', 'a8e96ad3-2e29-53e4-aeee-43640b6daa57', 'E', 'Bone scan', false, 4);

-- Q348
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('82fdd38e-2f76-5c55-a0ed-532ff9b00efb', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000019', 'sba', 'A 72 year old man with CKD (eGFR 25) has an acute attack of gout in his knee. NSAIDs are contraindicated. What is the SINGLE most appropriate treatment?', 'In CKD, NSAIDs are avoided and colchicine needs dose reduction or avoidance (toxicity: diarrhoea, myopathy). Oral steroids or intra-articular steroid injection are good options. Urate-lowering therapy (allopurinol) is started at a low dose and titrated, ideally after the flare settles (or continued if already taking it).', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v3')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = '82fdd38e-2f76-5c55-a0ed-532ff9b00efb';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('b2aaf60a-91ef-5de8-8f98-c1d574788bd5', '82fdd38e-2f76-5c55-a0ed-532ff9b00efb', 'A', 'High-dose naproxen', false, 0),
  ('d124b1b1-a24f-5944-bdc5-acaba4a984c3', '82fdd38e-2f76-5c55-a0ed-532ff9b00efb', 'B', 'Start allopurinol during the attack at a high dose', false, 1),
  ('62ac33d6-d13d-58c4-916f-983dbfe31b89', '82fdd38e-2f76-5c55-a0ed-532ff9b00efb', 'C', 'Aspirin', false, 2),
  ('f95f0d1a-52f4-55af-bac7-c0ffa4891707', '82fdd38e-2f76-5c55-a0ed-532ff9b00efb', 'D', 'Intra-articular corticosteroid injection (or oral prednisolone), with care using colchicine at reduced dose', true, 3),
  ('29b3fcfd-b53f-5225-ab56-dbfb088bb111', '82fdd38e-2f76-5c55-a0ed-532ff9b00efb', 'E', 'Full-dose colchicine', false, 4);

-- Q349
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('fb04c449-7eb2-5747-8d7f-52573e11bb8b', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000019', 'sba', 'A 50 year old woman has bilateral leg weakness that has come on over 2 months, with difficulty climbing stairs and rising from a chair. CK is raised at 4000 U/L. There is no rash. EMG is myopathic, and muscle biopsy shows endomysial inflammation. What is the SINGLE most likely diagnosis?', 'Polymyositis causes symmetrical proximal weakness with raised CK, without the skin features of dermatomyositis. Anti-Jo-1 antibodies are associated with interstitial lung disease (antisynthetase syndrome). Treatment is high-dose steroids and steroid-sparing agents. Dermatomyositis (with heliotrope rash and Gottron''s papules) is strongly linked to underlying malignancy in adults, so screen for cancer.', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v3')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = 'fb04c449-7eb2-5747-8d7f-52573e11bb8b';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('296a792b-f9a7-5cd3-956b-7e0dde3de627', 'fb04c449-7eb2-5747-8d7f-52573e11bb8b', 'A', 'Dermatomyositis', false, 0),
  ('c0d3926e-dbaa-511b-955b-8f715d30122b', 'fb04c449-7eb2-5747-8d7f-52573e11bb8b', 'B', 'Polymyalgia rheumatica', false, 1),
  ('0b61162f-1c85-5a8b-85ec-6532e7a99878', 'fb04c449-7eb2-5747-8d7f-52573e11bb8b', 'C', 'Motor neurone disease', false, 2),
  ('12132f36-7f98-5e60-ba65-448c24d60790', 'fb04c449-7eb2-5747-8d7f-52573e11bb8b', 'D', 'Myasthenia gravis', false, 3),
  ('1e82c300-edda-5d5d-9e11-6d4d021f7bc1', 'fb04c449-7eb2-5747-8d7f-52573e11bb8b', 'E', 'Polymyositis', true, 4);

-- Q350
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('fe3c2d7c-24bf-5b2a-92f9-929ad4b81f8b', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000019', 'sba', 'A 68 year old woman with known systemic sclerosis has a sudden severe headache, BP 210/120 mmHg, and creatinine rising from 80 to 260 µmol/L over 4 days. What is the SINGLE most appropriate treatment?', 'Scleroderma renal crisis (more common in diffuse disease, anti-RNA polymerase III, and with high-dose steroids) causes sudden hypertension and AKI. ACE inhibitors are the treatment of choice even if creatinine is rising. Avoid high-dose steroids in systemic sclerosis, as they can trigger renal crisis.', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v3')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = 'fe3c2d7c-24bf-5b2a-92f9-929ad4b81f8b';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('617903c2-066b-5df9-b312-81c6c4743698', 'fe3c2d7c-24bf-5b2a-92f9-929ad4b81f8b', 'A', 'High-dose prednisolone', false, 0),
  ('ea182466-65ac-50ba-bfc0-48699935505f', 'fe3c2d7c-24bf-5b2a-92f9-929ad4b81f8b', 'B', 'Plasma exchange', false, 1),
  ('9377776d-bc2c-577c-90c3-f7a7fb575a81', 'fe3c2d7c-24bf-5b2a-92f9-929ad4b81f8b', 'C', 'ACE inhibitor (e.g. captopril), titrated rapidly', true, 2),
  ('55b8b9d5-9290-58ea-a2eb-c410dad632cb', 'fe3c2d7c-24bf-5b2a-92f9-929ad4b81f8b', 'D', 'IV labetalol only and avoid ACE inhibitors', false, 3),
  ('5525cf36-65a2-5d7d-9f2c-8a69fcc3eca2', 'fe3c2d7c-24bf-5b2a-92f9-929ad4b81f8b', 'E', 'Methotrexate', false, 4);

-- Q351
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('3945a6aa-4e74-56e0-a1ed-eb2a74a1543f', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000019', 'sba', 'A 70 year old man has had progressive breathlessness, sinusitis and haematuria. Bloods show raised creatinine and positive p-ANCA (MPO). Renal biopsy shows pauci-immune necrotising glomerulonephritis. He has no asthma or granulomas. What is the SINGLE most likely diagnosis?', 'MPA is a small vessel ANCA-associated vasculitis, usually p-ANCA/MPO, affecting kidneys (rapidly progressive GN) and lungs (alveolar haemorrhage), without granulomas. GPA is usually c-ANCA/PR3 with granulomatous ENT and lung disease. EGPA has asthma and eosinophilia. Treatment is steroids plus rituximab or cyclophosphamide, with plasma exchange in severe cases.', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v3')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = '3945a6aa-4e74-56e0-a1ed-eb2a74a1543f';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('a85c774b-a12a-5b90-b1a0-8ae5aa42c94b', '3945a6aa-4e74-56e0-a1ed-eb2a74a1543f', 'A', 'Eosinophilic granulomatosis with polyangiitis', false, 0),
  ('abb0fb3f-c523-5880-a709-7a961c8fdaee', '3945a6aa-4e74-56e0-a1ed-eb2a74a1543f', 'B', 'Goodpasture''s disease', false, 1),
  ('f3b5e4e6-1a61-59e9-94c9-ebb888b334cc', '3945a6aa-4e74-56e0-a1ed-eb2a74a1543f', 'C', 'Microscopic polyangiitis', true, 2),
  ('d454cbc9-65f9-5727-84aa-8da3e7921659', '3945a6aa-4e74-56e0-a1ed-eb2a74a1543f', 'D', 'IgA vasculitis', false, 3),
  ('dfc17693-c22d-541a-af87-ec2642570723', '3945a6aa-4e74-56e0-a1ed-eb2a74a1543f', 'E', 'Granulomatosis with polyangiitis', false, 4);

-- Q352
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('2311ddc1-e1d9-5c4e-a877-f13030fbe1d4', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000019', 'sba', 'A 65 year old man has been on procainamide for an arrhythmia. He now has arthralgia, pleurisy and a positive ANA. Anti-dsDNA is negative. Which antibody is MOST likely to be positive?', 'Drug-induced lupus is caused by procainamide, hydralazine, isoniazid, minocycline, anti-TNF agents and others. It mainly causes arthralgia, myalgia, serositis and rash. Renal and CNS involvement are rare. Anti-histone antibodies are typical, and anti-dsDNA is usually negative (except with anti-TNF). It resolves after stopping the drug.', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v3')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = '2311ddc1-e1d9-5c4e-a877-f13030fbe1d4';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('57a1773f-377d-5787-992a-76f13842b072', '2311ddc1-e1d9-5c4e-a877-f13030fbe1d4', 'A', 'Anti-centromere antibodies', false, 0),
  ('16376a34-f328-5bef-8d98-7f8fdcfae8e6', '2311ddc1-e1d9-5c4e-a877-f13030fbe1d4', 'B', 'Anti-histone antibodies (drug-induced lupus)', true, 1),
  ('6df700ab-cac9-5217-95cb-3036f0d10849', '2311ddc1-e1d9-5c4e-a877-f13030fbe1d4', 'C', 'Anti-Ro antibodies', false, 2),
  ('18404895-a845-50fd-a496-e01e5c183ef1', '2311ddc1-e1d9-5c4e-a877-f13030fbe1d4', 'D', 'Anti-CCP antibodies', false, 3),
  ('b17979e8-f156-51df-bf37-a17c85a066ec', '2311ddc1-e1d9-5c4e-a877-f13030fbe1d4', 'E', 'Anti-Smith antibodies', false, 4);

-- Q353
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('cd8d3f71-9f49-5f56-bafd-ed3df2019109', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000019', 'sba', 'A 24 year old woman has fingers that turn white, then blue, then red in the cold. She has no other symptoms, no digital ulcers, and her ANA and capillaroscopy are normal. What is the SINGLE most appropriate management?', 'Primary Raynaud''s is common in young women, symmetrical, without ulcers or tissue loss, with normal capillaroscopy and negative autoantibodies. Management is keeping warm, gloves and stopping smoking. Nifedipine (a calcium channel blocker) is first-line drug treatment. Secondary Raynaud''s (connective tissue disease) starts later, is often asymmetrical, and causes ulcers. Avoid beta-blockers.', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v3')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = 'cd8d3f71-9f49-5f56-bafd-ed3df2019109';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('7aa686db-9463-5e5d-8310-f932dfbed214', 'cd8d3f71-9f49-5f56-bafd-ed3df2019109', 'A', 'Lifestyle measures (keeping warm, stopping smoking), with nifedipine if symptoms are severe', true, 0),
  ('48b606cf-1ff9-5163-a8e7-45c7ee4b4943', 'cd8d3f71-9f49-5f56-bafd-ed3df2019109', 'B', 'Urgent rheumatology referral for systemic sclerosis', false, 1),
  ('32c9c672-45fc-549d-81ca-9ab9d844fc00', 'cd8d3f71-9f49-5f56-bafd-ed3df2019109', 'C', 'IV iloprost', false, 2),
  ('a30eeaaa-a3da-5686-9d11-0ac08d76740e', 'cd8d3f71-9f49-5f56-bafd-ed3df2019109', 'D', 'Sympathectomy', false, 3),
  ('0f5e9b05-14b3-5135-8622-a9c4147093dd', 'cd8d3f71-9f49-5f56-bafd-ed3df2019109', 'E', 'Beta-blocker', false, 4);

-- Q354
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('09e6f6bb-734b-5a4a-aabc-39a04a5e85dc', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000019', 'sba', 'A 72 year old woman has a DEXA scan showing a T-score of -2.9 at the hip after a vertebral fragility fracture. She cannot take oral bisphosphonates because of oesophageal stricture. What is a suitable alternative?', 'Osteoporosis is a T-score of -2.5 or lower. Oral bisphosphonates (alendronic acid) are first-line, but are contraindicated with oesophageal disorders and inability to sit upright. Alternatives include annual IV zoledronic acid or 6-monthly denosumab. Stopping denosumab can cause rebound vertebral fractures, so plan a transition to a bisphosphonate. Teriparatide or romosozumab are used for very high fracture risk.', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v3')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = '09e6f6bb-734b-5a4a-aabc-39a04a5e85dc';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('991e658b-1d5f-526e-b4bd-9645e3ab4726', '09e6f6bb-734b-5a4a-aabc-39a04a5e85dc', 'A', 'No treatment', false, 0),
  ('cc8983be-c1aa-54d2-b5bb-363c5c5591cd', '09e6f6bb-734b-5a4a-aabc-39a04a5e85dc', 'B', 'HRT as first-line at 72', false, 1),
  ('5c69f61e-958d-589c-a540-0dd7ae3955ed', '09e6f6bb-734b-5a4a-aabc-39a04a5e85dc', 'C', 'Calcium only', false, 2),
  ('53e12bae-b8e1-5884-8b55-7fc1484d100e', '09e6f6bb-734b-5a4a-aabc-39a04a5e85dc', 'D', 'Vitamin D only', false, 3),
  ('a97963bc-6962-5da6-9733-5234937ab302', '09e6f6bb-734b-5a4a-aabc-39a04a5e85dc', 'E', 'IV zoledronic acid (or subcutaneous denosumab)', true, 4);

-- Q355
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('a49b3d07-4a86-5abd-8def-db94601e5d03', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000019', 'sba', 'A 68 year old woman has taken alendronic acid for 7 years. She now has thigh pain for 2 months and X-ray shows lateral cortical thickening in her femoral shaft. What is the SINGLE most likely diagnosis?', 'Long-term bisphosphonate use is associated with atypical subtrochanteric or femoral shaft fractures, often preceded by thigh or groin pain, and sometimes bilateral. Image both femurs, stop the bisphosphonate and refer to orthopaedics. Other rare complications are osteonecrosis of the jaw (good dental care before starting) and external auditory canal osteonecrosis. Consider a drug holiday after 5 years (10 years for high risk).', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v3')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = 'a49b3d07-4a86-5abd-8def-db94601e5d03';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('b5a70afc-0167-5d3f-bb49-276849b83715', 'a49b3d07-4a86-5abd-8def-db94601e5d03', 'A', 'Bone metastasis', false, 0),
  ('f455f636-839b-5db8-b267-cb8fe5a138cd', 'a49b3d07-4a86-5abd-8def-db94601e5d03', 'B', 'Osteomalacia', false, 1),
  ('82912009-31af-5ef3-88eb-daf5e4a72878', 'a49b3d07-4a86-5abd-8def-db94601e5d03', 'C', 'Atypical femoral fracture (bisphosphonate-associated)', true, 2),
  ('5a9aecf6-d410-5823-8407-7b848654b7a4', 'a49b3d07-4a86-5abd-8def-db94601e5d03', 'D', 'Paget''s disease', false, 3),
  ('65346bfc-a62f-5c39-ba1a-4868433a95f5', 'a49b3d07-4a86-5abd-8def-db94601e5d03', 'E', 'Osteoarthritis of the hip', false, 4);

-- Q356
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('528de5c5-9b78-53b6-8a01-121db73b2f92', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000019', 'sba', 'A 19 year old woman has very flexible joints, recurrent shoulder dislocations, easy bruising, soft stretchy skin and wide atrophic scars. Her Beighton score is 7/9. What is the SINGLE most likely diagnosis?', 'Ehlers-Danlos syndromes are connective tissue disorders with joint hypermobility, skin hyperextensibility and tissue fragility. Classical EDS has atrophic scarring and is linked to COL5A1/2. Vascular EDS (COL3A1) carries a risk of arterial and organ rupture. Management is physiotherapy, pain management and genetic counselling. Marfan''s has tall stature, lens dislocation and aortic root dilatation.', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v3')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = '528de5c5-9b78-53b6-8a01-121db73b2f92';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('48b1bd24-bb5c-5538-b9ca-3383ca478381', '528de5c5-9b78-53b6-8a01-121db73b2f92', 'A', 'Ehlers-Danlos syndrome (hypermobile or classical type)', true, 0),
  ('16557a45-b5d5-5be4-9dc1-23c6bb062ca9', '528de5c5-9b78-53b6-8a01-121db73b2f92', 'B', 'Rheumatoid arthritis', false, 1),
  ('3f0798a9-4c87-556f-9ac9-f4a63f45ec80', '528de5c5-9b78-53b6-8a01-121db73b2f92', 'C', 'Systemic lupus erythematosus', false, 2),
  ('fd67b5ce-1dd1-588c-a2e2-8d2f6fbbd75e', '528de5c5-9b78-53b6-8a01-121db73b2f92', 'D', 'Osteogenesis imperfecta', false, 3),
  ('d76aabf9-2708-5b8d-b3c6-c9dbd4a0a5c3', '528de5c5-9b78-53b6-8a01-121db73b2f92', 'E', 'Marfan syndrome', false, 4);

-- Q357
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('1af1618c-4946-5417-bd0c-122542a58190', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000019', 'sba', 'A 70 year old man has Paget''s disease of bone with bone pain in his pelvis despite analgesia. His ALP is 650 U/L. What is the SINGLE most appropriate treatment?', 'In Paget''s disease (excessive, disorganised bone remodelling, raised ALP, normal calcium), bisphosphonates (especially IV zoledronic acid) are used for bone pain. They do not prevent long-term complications in asymptomatic patients. Complications include deformity, fractures, deafness (skull involvement), nerve compression, high-output heart failure and, rarely, osteosarcoma.', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v3')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = '1af1618c-4946-5417-bd0c-122542a58190';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('dffa5c0d-4b87-56b0-a08f-32f1d4e1d1c7', '1af1618c-4946-5417-bd0c-122542a58190', 'A', 'Oral vitamin D only', false, 0),
  ('6c298b0c-cc75-53f3-b84d-bf253e501148', '1af1618c-4946-5417-bd0c-122542a58190', 'B', 'A bisphosphonate (e.g. a single IV infusion of zoledronic acid)', true, 1),
  ('56812702-41e4-5a8b-a8e9-ddb68dfc01d7', '1af1618c-4946-5417-bd0c-122542a58190', 'C', 'Calcitonin first-line', false, 2),
  ('f193cba5-7a64-5f51-bc7c-fda9087c09d4', '1af1618c-4946-5417-bd0c-122542a58190', 'D', 'Radiotherapy', false, 3),
  ('2e2cf7c4-197d-5170-8bdd-ad4c0e8ffde3', '1af1618c-4946-5417-bd0c-122542a58190', 'E', 'Surgery for all patients', false, 4);

-- Q358
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('72d30279-040a-5838-a6ae-29ac1a06d0fc', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000019', 'sba', 'A 32 year old woman with Crohn''s disease has lower back stiffness that is worse in the morning, and pain in the buttocks. MRI shows bilateral sacroiliitis. HLA-B27 is positive. What is the SINGLE most likely diagnosis?', 'IBD-associated (enteropathic) arthritis can be peripheral (often tracking bowel activity) or axial (sacroiliitis and spondylitis, independent of bowel activity). NSAIDs can worsen IBD, so anti-TNF therapy (infliximab or adalimumab) is often used, as it treats both bowel and joint disease.', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v3')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = '72d30279-040a-5838-a6ae-29ac1a06d0fc';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('96e2018d-4f04-55b4-a120-b961a424a05b', '72d30279-040a-5838-a6ae-29ac1a06d0fc', 'A', 'Enteropathic spondyloarthritis (IBD-associated axial spondyloarthritis)', true, 0),
  ('5d9f5eb4-3fda-5798-b718-de58e16bad5f', '72d30279-040a-5838-a6ae-29ac1a06d0fc', 'B', 'Reactive arthritis', false, 1),
  ('282b95f5-8677-5725-9d70-e3a86e6abe7a', '72d30279-040a-5838-a6ae-29ac1a06d0fc', 'C', 'Rheumatoid arthritis', false, 2),
  ('f0a00565-c755-5675-ad48-a315ab2fd1f6', '72d30279-040a-5838-a6ae-29ac1a06d0fc', 'D', 'Fibromyalgia', false, 3),
  ('12c0cc6e-f38b-58ff-bc70-2f7f883fc50e', '72d30279-040a-5838-a6ae-29ac1a06d0fc', 'E', 'Psoriatic arthritis', false, 4);

-- Q359
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('d06691a4-a6b8-5fa3-ba86-54018c994519', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000012', 'sba', 'A 30 year old woman has moderate atopic eczema on her arms. How much topical corticosteroid should be applied to cover an area of skin equivalent to two adult palms?', 'One fingertip unit (cream squeezed from the tip to the first crease of an adult index finger, about 0.5 g) covers an area equal to 2 adult palms with fingers. Apply steroids once or twice daily to inflamed areas, with emollients used liberally and often. Choose potency based on severity and site (mild on the face and in children). Steroid phobia often leads to undertreatment.', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v3')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = 'd06691a4-a6b8-5fa3-ba86-54018c994519';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('d0cdb862-1785-59ef-8a6a-b717e7bd4a5c', 'd06691a4-a6b8-5fa3-ba86-54018c994519', 'A', '1 fingertip unit (about 0.5 g)', true, 0),
  ('6711f42b-e61d-56f4-8acd-a1f418330b90', 'd06691a4-a6b8-5fa3-ba86-54018c994519', 'B', 'A pea-sized amount for the whole body', false, 1),
  ('b02d6fd5-184d-5d60-971f-a4dd6ccdc7f9', 'd06691a4-a6b8-5fa3-ba86-54018c994519', 'C', 'Half a tube', false, 2),
  ('10917f61-f979-5451-8d73-94d9d519c27b', 'd06691a4-a6b8-5fa3-ba86-54018c994519', 'D', '10 g per application', false, 3),
  ('4936870e-6a9d-5c02-9067-4f82970a6166', 'd06691a4-a6b8-5fa3-ba86-54018c994519', 'E', '5 fingertip units', false, 4);

-- Q360
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('9c5d7ade-113c-58c0-8740-0d66ee2c28de', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000012', 'sba', 'A 4 year old boy with atopic eczema has a flare with weeping, crusted, golden lesions on his arms and is otherwise well. What is the SINGLE most appropriate treatment?', 'Secondarily infected eczema is usually caused by Staphylococcus aureus. NICE NG190 recommends an oral antibiotic (flucloxacillin, or clarithromycin if allergic) if widespread or unwell, or topical fusidic acid for localised infection (short course, to limit resistance). Replace emollients that may be contaminated. Punched-out erosions with fever suggest eczema herpeticum, which needs aciclovir.', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v3')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = '9c5d7ade-113c-58c0-8740-0d66ee2c28de';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('96a05c38-bcb6-57bd-a5bc-3fc7fbecc646', '9c5d7ade-113c-58c0-8740-0d66ee2c28de', 'A', 'Topical steroid only', false, 0),
  ('2d8ac811-b6a4-5556-87bf-b2c6b76eff2a', '9c5d7ade-113c-58c0-8740-0d66ee2c28de', 'B', 'Oral aciclovir', false, 1),
  ('a8d9ef78-428b-5efa-af03-1ae7cbf9a90a', '9c5d7ade-113c-58c0-8740-0d66ee2c28de', 'C', 'Oral prednisolone', false, 2),
  ('1fde0266-b9b9-5b4e-9695-f66025d42a2e', '9c5d7ade-113c-58c0-8740-0d66ee2c28de', 'D', 'Oral flucloxacillin (or topical fusidic acid if localised), alongside eczema treatment', true, 3),
  ('a1c8af42-46bf-5f0f-9a4d-2d1d899e17e7', '9c5d7ade-113c-58c0-8740-0d66ee2c28de', 'E', 'Stop emollients', false, 4);

-- Q361
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('67cd630c-177b-5d08-bda1-c89c4ab57366', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000012', 'sba', 'A 2 month old baby has thick, yellow, greasy scales on her scalp, and some on her eyebrows. She is feeding well and not distressed. What is the SINGLE most appropriate advice?', 'Infantile seborrhoeic dermatitis is common, harmless and usually resolves by 6-12 months. Soften scales with emollient or vegetable oil, then wash and gently brush. If persistent, topical imidazole cream or a mild steroid on inflamed areas can be used. Ketoconazole shampoo is not licensed for infants.', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v3')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = '67cd630c-177b-5d08-bda1-c89c4ab57366';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('8cb5beb4-8a8b-548a-b3f9-589311034b7b', '67cd630c-177b-5d08-bda1-c89c4ab57366', 'A', 'Seborrhoeic dermatitis (cradle cap): regular washing with baby shampoo, softening with emollient or oil and gentle brushing', true, 0),
  ('167f0450-7d36-5818-a9fa-d5add2374c5f', '67cd630c-177b-5d08-bda1-c89c4ab57366', 'B', 'Antibiotic cream', false, 1),
  ('0148d90e-969f-5160-b355-48cdfbf1668f', '67cd630c-177b-5d08-bda1-c89c4ab57366', 'C', 'Oral antifungal', false, 2),
  ('2ff5a894-7c5d-5c46-accd-b8d8a51cc976', '67cd630c-177b-5d08-bda1-c89c4ab57366', 'D', 'Potent topical steroid', false, 3),
  ('452b6509-9cad-5485-9085-ae4af47e1ca8', '67cd630c-177b-5d08-bda1-c89c4ab57366', 'E', 'Urgent dermatology referral', false, 4);

-- Q362
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('f5c6ea75-64a6-5d01-b14b-2288311b10ab', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000012', 'sba', 'A 9 month old baby has a red rash in the nappy area involving the skin folds, with satellite lesions beyond the edge. What is the SINGLE most likely diagnosis and treatment?', 'Irritant napkin dermatitis spares the skin folds. Candidal infection involves the folds and has satellite lesions or pustules. Treat with a topical imidazole, frequent nappy changes, nappy-free time and a barrier preparation. Avoid potent steroids. Oral thrush may also be present.', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v3')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = 'f5c6ea75-64a6-5d01-b14b-2288311b10ab';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('35c3fe90-dd82-5cc3-ae4d-1093b48fd2e7', 'f5c6ea75-64a6-5d01-b14b-2288311b10ab', 'A', 'Irritant nappy dermatitis; barrier cream only', false, 0),
  ('09769576-c8bb-5009-bbc3-ac43827fb6fd', 'f5c6ea75-64a6-5d01-b14b-2288311b10ab', 'B', 'Psoriasis; topical vitamin D', false, 1),
  ('fed0b0bc-7406-52d2-b4e0-48366acce6be', 'f5c6ea75-64a6-5d01-b14b-2288311b10ab', 'C', 'Seborrhoeic dermatitis; ketoconazole shampoo', false, 2),
  ('f6df3fbe-1d4f-5f29-999e-a05252bd4490', 'f5c6ea75-64a6-5d01-b14b-2288311b10ab', 'D', 'Impetigo; oral flucloxacillin', false, 3),
  ('34de0ac3-dd9e-5a26-8d1c-7127f1469f5c', 'f5c6ea75-64a6-5d01-b14b-2288311b10ab', 'E', 'Candidal nappy rash; topical imidazole (e.g. clotrimazole)', true, 4);

-- Q363
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('27624250-39d6-5632-a1ea-0aa370d031c8', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000012', 'sba', 'A 40 year old hairdresser has itchy, red, scaly hands with fissures, worse at work. She uses gloves only sometimes. Which test helps identify an allergic cause?', 'Hand dermatitis can be irritant (water, detergents) or allergic contact dermatitis (type IV hypersensitivity to hair dyes such as PPD, nickel, rubber, fragrances or preservatives). Patch testing identifies contact allergens. Skin prick testing is for immediate (type I) allergy. Management is avoiding triggers, gloves, emollients and topical steroids.', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v3')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = '27624250-39d6-5632-a1ea-0aa370d031c8';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('34ec97b5-0da3-5bc4-8597-43af78f6e69a', '27624250-39d6-5632-a1ea-0aa370d031c8', 'A', 'Patch testing', true, 0),
  ('b0527084-f095-5628-94ac-4c861c07373f', '27624250-39d6-5632-a1ea-0aa370d031c8', 'B', 'Skin prick testing', false, 1),
  ('e7babf33-9a5f-5eb6-9e8c-6d68e6ffb1a7', '27624250-39d6-5632-a1ea-0aa370d031c8', 'C', 'Skin biopsy as first-line', false, 2),
  ('24f7713a-03a7-57d4-aefe-5a4dc811aa40', '27624250-39d6-5632-a1ea-0aa370d031c8', 'D', 'Fungal scrapings only', false, 3),
  ('3f85913d-433c-5686-9fda-84a20ef3ebe0', '27624250-39d6-5632-a1ea-0aa370d031c8', 'E', 'Serum total IgE', false, 4);

-- Q364
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('ccc54218-f24f-597a-beee-ffacb214f00f', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000012', 'sba', 'A 35 year old woman has recurrent intensely itchy, deep-seated small blisters on her palms and the sides of her fingers, worse in hot weather. What is the SINGLE most likely diagnosis?', 'Pompholyx is a type of eczema with tense vesicles on the palms, fingers and soles, often triggered by heat, sweating or stress. Treatment is a potent topical steroid, cool compresses, emollients and avoiding irritants. Palmoplantar pustulosis has sterile pustules and is associated with smoking.', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v3')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = 'ccc54218-f24f-597a-beee-ffacb214f00f';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('987b6d1e-63a7-5526-9a10-a74ef9917835', 'ccc54218-f24f-597a-beee-ffacb214f00f', 'A', 'Bullous pemphigoid', false, 0),
  ('a4a8e9c3-1a08-509b-8c9d-fb2eed4efb89', 'ccc54218-f24f-597a-beee-ffacb214f00f', 'B', 'Hand, foot and mouth disease', false, 1),
  ('b20d5142-21d9-5726-90ce-da3e195d3c73', 'ccc54218-f24f-597a-beee-ffacb214f00f', 'C', 'Pompholyx (dyshidrotic eczema)', true, 2),
  ('ab65d1ea-978b-5c0b-b12c-ba6148204e0e', 'ccc54218-f24f-597a-beee-ffacb214f00f', 'D', 'Palmoplantar pustulosis', false, 3),
  ('b676b3b5-bd78-59af-9f46-39ec228fd147', 'ccc54218-f24f-597a-beee-ffacb214f00f', 'E', 'Scabies', false, 4);

-- Q365
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('15442a8d-9e0d-59b9-9227-2c78df5baf01', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000012', 'sba', 'A 40 year old man was started on allopurinol 4 weeks ago. He now has fever, a widespread rash, facial swelling, lymphadenopathy, eosinophilia and raised LFTs. What is the SINGLE most likely diagnosis?', 'DRESS typically starts 2-8 weeks after starting a drug (anticonvulsants, allopurinol, sulfonamides, minocycline). It causes fever, rash, facial oedema, lymphadenopathy, eosinophilia and organ involvement (liver, kidney, lung, heart). Stop the drug immediately and treat with systemic steroids. It can be fatal. HLA-B*5801 increases allopurinol risk in some ethnic groups.', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v3')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = '15442a8d-9e0d-59b9-9227-2c78df5baf01';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('fb802d4c-716b-5979-a299-40577b0c73e5', '15442a8d-9e0d-59b9-9227-2c78df5baf01', 'A', 'Psoriasis flare', false, 0),
  ('8dca62ea-11fc-5a08-a1ee-0961514420a8', '15442a8d-9e0d-59b9-9227-2c78df5baf01', 'B', 'Urticaria', false, 1),
  ('80556679-ce72-596d-8ab4-2092bfab247e', '15442a8d-9e0d-59b9-9227-2c78df5baf01', 'C', 'Stevens-Johnson syndrome', false, 2),
  ('03304486-9f2a-52fb-ba71-272ec7f38741', '15442a8d-9e0d-59b9-9227-2c78df5baf01', 'D', 'Drug reaction with eosinophilia and systemic symptoms (DRESS)', true, 3),
  ('2a04ae0f-5e46-56db-9743-314e18ef0750', '15442a8d-9e0d-59b9-9227-2c78df5baf01', 'E', 'Viral exanthem', false, 4);

-- Q366
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('e0ea6bdd-1cc8-5f6c-9b5c-d2ec7e4ea965', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000012', 'sba', 'A 50 year old woman has painful erosions in her mouth for 2 months, followed by flaccid blisters on her trunk that rupture easily. Gentle pressure on normal skin makes the epidermis slide off (positive Nikolsky sign). What is the SINGLE most likely diagnosis?', 'Pemphigus vulgaris is caused by autoantibodies against desmoglein 3 (intraepidermal split). It causes mucosal erosions, flaccid blisters, erosions and a positive Nikolsky sign. Biopsy shows intercellular IgG (''chicken wire''). It is potentially fatal, and is treated with high-dose steroids and rituximab. Bullous pemphigoid (older people) has tense blisters, rarely affects mucosa and is subepidermal.', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v3')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = 'e0ea6bdd-1cc8-5f6c-9b5c-d2ec7e4ea965';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('09544f5c-5b9c-52b0-b009-9e82596afdb2', 'e0ea6bdd-1cc8-5f6c-9b5c-d2ec7e4ea965', 'A', 'Erythema multiforme', false, 0),
  ('6201166a-7185-559e-a408-15093ca63cf1', 'e0ea6bdd-1cc8-5f6c-9b5c-d2ec7e4ea965', 'B', 'Bullous pemphigoid', false, 1),
  ('86725f26-73a4-577d-a65f-c166cf7c065a', 'e0ea6bdd-1cc8-5f6c-9b5c-d2ec7e4ea965', 'C', 'Pemphigus vulgaris', true, 2),
  ('cd1c83bf-9d3e-57b4-b19f-97dffcd3058a', 'e0ea6bdd-1cc8-5f6c-9b5c-d2ec7e4ea965', 'D', 'Dermatitis herpetiformis', false, 3),
  ('091b8f17-a53d-5c52-896f-d2883ad90d69', 'e0ea6bdd-1cc8-5f6c-9b5c-d2ec7e4ea965', 'E', 'Impetigo', false, 4);

-- Q367
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('f5e48a9e-6f23-52e3-849e-282e9e6cb7ba', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000012', 'sba', 'A 17 year old boy has severe nodulocystic acne with scarring on his face and back despite 3 months of oral lymecycline plus a topical treatment. What is the SINGLE most appropriate next step?', 'NICE NG198: refer to consultant-led dermatology for isotretinoin in severe acne, acne with scarring or pigmentation, or acne not responding to treatment. Isotretinoin is teratogenic (pregnancy prevention programme for those who could become pregnant), and also causes dry skin and lips, raised lipids and LFTs, and possible mood changes. Do not use oral antibiotics for more than 6 months.', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v3')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = 'f5e48a9e-6f23-52e3-849e-282e9e6cb7ba';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('7cd902e5-72be-5049-a808-585e98144ea8', 'f5e48a9e-6f23-52e3-849e-282e9e6cb7ba', 'A', 'Topical steroid', false, 0),
  ('9eac12c2-878e-5461-8eb1-4786152cdfbd', 'f5e48a9e-6f23-52e3-849e-282e9e6cb7ba', 'B', 'Refer to a consultant dermatologist for oral isotretinoin', true, 1),
  ('d806d544-b06f-5cf5-8895-7857bb778b0e', 'f5e48a9e-6f23-52e3-849e-282e9e6cb7ba', 'C', 'Continue lymecycline for another year', false, 2),
  ('dce8894a-51e1-5aee-ab96-d3b5de42ad9c', 'f5e48a9e-6f23-52e3-849e-282e9e6cb7ba', 'D', 'Oral prednisolone', false, 3),
  ('6304197b-2c46-5fdc-ad41-170a5f53433f', 'f5e48a9e-6f23-52e3-849e-282e9e6cb7ba', 'E', 'Combined pill', false, 4);

-- Q368
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('e06558fc-35bb-5857-a709-0d894bfdc5d2', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000012', 'sba', 'A 14 year old girl had a streptococcal sore throat 2 weeks ago. She now has many small, scattered, scaly, ''raindrop'' plaques on her trunk. What is the SINGLE most likely diagnosis?', 'Guttate psoriasis causes many small ''drop-like'' plaques on the trunk and limbs, typically 2-4 weeks after streptococcal throat infection in children and young adults. It often resolves within 3-4 months. Treatment is emollients and topical treatments, or phototherapy (narrowband UVB) if widespread. Some go on to develop chronic plaque psoriasis.', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v3')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = 'e06558fc-35bb-5857-a709-0d894bfdc5d2';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('973a1856-6fcf-50de-8af4-8c57fd007a12', 'e06558fc-35bb-5857-a709-0d894bfdc5d2', 'A', 'Pityriasis rosea', false, 0),
  ('e0933b22-92c1-5e22-8920-b5f23a583643', 'e06558fc-35bb-5857-a709-0d894bfdc5d2', 'B', 'Secondary syphilis', false, 1),
  ('525cea0b-aad4-5b08-b559-6df961c0007d', 'e06558fc-35bb-5857-a709-0d894bfdc5d2', 'C', 'Guttate psoriasis', true, 2),
  ('9e81197a-1f61-5107-bfc8-a8dcc064dcb7', 'e06558fc-35bb-5857-a709-0d894bfdc5d2', 'D', 'Discoid eczema', false, 3),
  ('a0c933f4-95f2-51d8-970d-d4bcca3ed4e6', 'e06558fc-35bb-5857-a709-0d894bfdc5d2', 'E', 'Tinea corporis', false, 4);

-- Q369
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('040df56a-801b-5b89-94e3-bf0c2c6a2f59', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000012', 'sba', 'A 55 year old man with known psoriasis is unwell with widespread redness covering over 90% of his body surface, fever and shivering. What is the SINGLE most appropriate management?', 'Erythroderma (over 90% of the skin red) is a dermatological emergency because of the risk of heat loss, fluid and protein loss, high-output heart failure and sepsis. Causes include psoriasis, eczema, drugs and cutaneous T-cell lymphoma. Admit for supportive care (warm environment, fluids, emollients) and specialist treatment. Avoid systemic steroids in psoriasis (rebound pustular flare).', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v3')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = '040df56a-801b-5b89-94e3-bf0c2c6a2f59';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('27984f96-dd88-54a9-834b-528b2e583ee8', '040df56a-801b-5b89-94e3-bf0c2c6a2f59', 'A', 'Phototherapy next week', false, 0),
  ('6a04142c-07cf-5baa-b168-f2f8eb2cacda', '040df56a-801b-5b89-94e3-bf0c2c6a2f59', 'B', 'Start systemic steroids at home', false, 1),
  ('0a91981d-fa36-5f3b-aa9a-cb4dcac427b1', '040df56a-801b-5b89-94e3-bf0c2c6a2f59', 'C', 'Admit to hospital: erythrodermic psoriasis needs fluid, temperature and electrolyte management, emollients and dermatology input', true, 2),
  ('323100e8-f0b3-59e6-89c7-41d2df2354d6', '040df56a-801b-5b89-94e3-bf0c2c6a2f59', 'D', 'Topical calcipotriol only', false, 3),
  ('a9ec4045-b9f3-5831-b9bb-a62f6fd74a46', '040df56a-801b-5b89-94e3-bf0c2c6a2f59', 'E', 'Outpatient potent topical steroid', false, 4);

-- Q370
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('7e2659e6-1831-55b7-99cc-991e6457b4f0', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000012', 'sba', 'A 70 year old woman has a slowly enlarging, well-defined, red, scaly plaque on her shin for 2 years. Biopsy shows full-thickness epidermal dysplasia without invasion. What is the SINGLE most likely diagnosis?', 'Bowen''s disease is SCC in situ, presenting as a slowly growing, red scaly patch, often on the lower legs of older women. The risk of progression to invasive SCC is about 3-5%. Treatments include topical 5-fluorouracil, imiquimod, cryotherapy, photodynamic therapy, curettage or excision.', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v3')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = '7e2659e6-1831-55b7-99cc-991e6457b4f0';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('ffab668b-6ee1-583b-a4d1-8af4197e6623', '7e2659e6-1831-55b7-99cc-991e6457b4f0', 'A', 'Discoid eczema', false, 0),
  ('33981de0-370d-5236-84a9-0fcd01706790', '7e2659e6-1831-55b7-99cc-991e6457b4f0', 'B', 'Bowen''s disease (squamous cell carcinoma in situ)', true, 1),
  ('df1c239e-fcb6-5f06-86f5-c3b9212d825c', '7e2659e6-1831-55b7-99cc-991e6457b4f0', 'C', 'Actinic keratosis', false, 2),
  ('c6ac280a-9036-5259-a0f3-b8c68f355462', '7e2659e6-1831-55b7-99cc-991e6457b4f0', 'D', 'Basal cell carcinoma', false, 3),
  ('56952d27-2f28-5c8c-9e67-ca50c0c733d2', '7e2659e6-1831-55b7-99cc-991e6457b4f0', 'E', 'Psoriasis', false, 4);

-- Q371
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('6417195a-92a5-5d5f-86c6-0aa89c4e6cad', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000012', 'sba', 'A 46 year old man has had a malignant melanoma excised. Which feature is the MOST important prognostic factor?', 'Breslow thickness (depth from the granular layer to the deepest tumour cells) is the most important prognostic factor in primary melanoma. Ulceration and mitotic rate also matter. Stage (AJCC) guides wider excision margins, sentinel node biopsy and adjuvant therapy (immunotherapy, BRAF/MEK inhibitors).', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v3')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = '6417195a-92a5-5d5f-86c6-0aa89c4e6cad';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('eb8994bd-b517-5c42-8eee-398962428064', '6417195a-92a5-5d5f-86c6-0aa89c4e6cad', 'A', 'Breslow thickness (depth of invasion in mm)', true, 0),
  ('7b719b16-4536-52ce-bbad-d18e39391a14', '6417195a-92a5-5d5f-86c6-0aa89c4e6cad', 'B', 'Diameter of the lesion', false, 1),
  ('64d03685-5255-59c5-aaa9-f42a9f1c173d', '6417195a-92a5-5d5f-86c6-0aa89c4e6cad', 'C', 'Age at diagnosis', false, 2),
  ('7257130b-338e-5feb-b186-fae3ce27a5dc', '6417195a-92a5-5d5f-86c6-0aa89c4e6cad', 'D', 'Colour of the lesion', false, 3),
  ('b30139a9-56c9-5ea2-8572-17376984e8f2', '6417195a-92a5-5d5f-86c6-0aa89c4e6cad', 'E', 'Site of the lesion', false, 4);

-- Q372
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('bfda8f81-79e4-552e-b7bb-bfaf9b14bdd0', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000012', 'sba', 'A 40 year old man with HIV (CD4 50) has purple, raised, non-blanching plaques on his legs and hard palate. What is the SINGLE most likely diagnosis?', 'Kaposi''s sarcoma is a vascular tumour caused by human herpesvirus 8, an AIDS-defining illness. It causes purple plaques or nodules on skin, mucosa (palate), and the GI tract or lungs. Treatment is ART (immune reconstitution), with chemotherapy for extensive disease. Biopsy confirms it.', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v3')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = 'bfda8f81-79e4-552e-b7bb-bfaf9b14bdd0';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('677feb86-21cc-574b-a7c6-beefc3d4f01a', 'bfda8f81-79e4-552e-b7bb-bfaf9b14bdd0', 'A', 'Purpura from thrombocytopenia', false, 0),
  ('1558804a-94d1-5d65-bc87-c732a199b1f1', 'bfda8f81-79e4-552e-b7bb-bfaf9b14bdd0', 'B', 'Bacillary angiomatosis', false, 1),
  ('512a740b-1644-5ab0-a4c6-b11c0338ab77', 'bfda8f81-79e4-552e-b7bb-bfaf9b14bdd0', 'C', 'Melanoma', false, 2),
  ('622172be-81f2-58ad-b64e-90546b7b2ba0', 'bfda8f81-79e4-552e-b7bb-bfaf9b14bdd0', 'D', 'Haemangioma', false, 3),
  ('827ea746-bc36-57b0-8505-4d1b773f7e7e', 'bfda8f81-79e4-552e-b7bb-bfaf9b14bdd0', 'E', 'Kaposi''s sarcoma (HHV-8)', true, 4);

-- Q373
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('6f90f087-667a-5706-8939-d8e3e40efecf', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000012', 'sba', 'A 7 year old boy has a boggy, tender, pus-filled swelling on his scalp with hair loss and cervical lymphadenopathy. Scrapings show a fungal infection. What is the SINGLE most appropriate treatment?', 'A kerion is a severe inflammatory reaction to tinea capitis (often Trichophyton tonsurans). It can scar and cause permanent hair loss. Tinea capitis always needs oral antifungal treatment (topical agents do not reach the hair follicle), with ketoconazole or selenium shampoo to reduce spread. Incision is not needed. Check family members.', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v3')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = '6f90f087-667a-5706-8939-d8e3e40efecf';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('5c6a5f92-37cf-560e-86f5-29ac72ef3794', '6f90f087-667a-5706-8939-d8e3e40efecf', 'A', 'Oral antifungal (e.g. terbinafine or griseofulvin), with an antifungal shampoo', true, 0),
  ('e05b4523-85d5-5b65-9dec-233573bd248d', '6f90f087-667a-5706-8939-d8e3e40efecf', 'B', 'Topical clotrimazole alone', false, 1),
  ('e7af8eda-8f29-5891-a844-1679cae12e66', '6f90f087-667a-5706-8939-d8e3e40efecf', 'C', 'Incision and drainage', false, 2),
  ('803add61-d9ed-5c83-a841-9b3e54191bee', '6f90f087-667a-5706-8939-d8e3e40efecf', 'D', 'Oral flucloxacillin only', false, 3),
  ('da36c1e8-5ee0-51d5-b491-b60ea591d63b', '6f90f087-667a-5706-8939-d8e3e40efecf', 'E', 'Topical steroids only', false, 4);

-- Q374
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('af1e3524-c9d2-529b-ac67-769080814775', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000012', 'sba', 'A 34 year old pregnant woman has symmetrical brown patches on her cheeks, forehead and upper lip that appeared during pregnancy. What is the SINGLE most likely diagnosis?', 'Melasma is acquired symmetrical facial hyperpigmentation, linked to pregnancy, the combined pill and sun exposure, and more common in darker skin types. Management includes strict sun protection, stopping hormonal triggers if possible, and topical agents (hydroquinone, azelaic acid). It often improves after pregnancy.', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v3')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = 'af1e3524-c9d2-529b-ac67-769080814775';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('743039d7-8302-5f3b-9e39-c88bcdff9c59', 'af1e3524-c9d2-529b-ac67-769080814775', 'A', 'Pityriasis versicolor', false, 0),
  ('8188568a-5607-5e34-9f1b-9aaca4a2e2f0', 'af1e3524-c9d2-529b-ac67-769080814775', 'B', 'Seborrhoeic keratosis', false, 1),
  ('bc96fb1e-fd8e-5290-a23a-dd41884d94e3', 'af1e3524-c9d2-529b-ac67-769080814775', 'C', 'Vitiligo', false, 2),
  ('54948cab-ba64-5519-b372-4b02dcae44a8', 'af1e3524-c9d2-529b-ac67-769080814775', 'D', 'Melasma', true, 3),
  ('af9dae28-2eae-5acd-8a3e-b0018fc37b58', 'af1e3524-c9d2-529b-ac67-769080814775', 'E', 'Lupus rash', false, 4);

-- Q375
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('70304e66-6d8b-5dce-9cfe-d005e5efae8c', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000012', 'sba', 'A 25 year old woman has a rapidly growing, bright red, friable nodule on her finger that bleeds easily, which appeared 3 weeks after a minor injury. What is the SINGLE most likely diagnosis?', 'Pyogenic granuloma is a benign vascular lesion that grows rapidly over weeks, often after trauma or in pregnancy. It bleeds easily. Treatment is curettage and cautery or excision, with histology to exclude amelanotic melanoma.', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v3')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = '70304e66-6d8b-5dce-9cfe-d005e5efae8c';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('058d94f3-22ea-5622-9ecf-e0cdb3f79033', '70304e66-6d8b-5dce-9cfe-d005e5efae8c', 'A', 'Amelanotic melanoma (most likely)', false, 0),
  ('ba3989fb-64f4-5005-84a1-1d10afa01b5c', '70304e66-6d8b-5dce-9cfe-d005e5efae8c', 'B', 'Wart', false, 1),
  ('fda36e5e-5a85-54d1-b445-1f50f35a5a83', '70304e66-6d8b-5dce-9cfe-d005e5efae8c', 'C', 'Pyogenic granuloma', true, 2),
  ('4ede2903-5285-58be-b1e4-afe869ecbd86', '70304e66-6d8b-5dce-9cfe-d005e5efae8c', 'D', 'Keratoacanthoma', false, 3),
  ('14099b00-98f5-5be5-a8b0-d148be09d16f', '70304e66-6d8b-5dce-9cfe-d005e5efae8c', 'E', 'Basal cell carcinoma', false, 4);

-- Q376
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('32ffdc35-42d5-5255-b728-f994ff76e898', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000012', 'sba', 'A newborn has a red, flat, sharply demarcated patch over the right forehead and eyelid (ophthalmic distribution of the trigeminal nerve). Which associated condition should be considered?', 'A port-wine stain (capillary malformation) is present at birth and persists. When it involves the ophthalmic (V1) distribution, it may be part of Sturge-Weber syndrome (leptomeningeal angiomatosis causing seizures and learning difficulties, plus glaucoma). Refer for neurological and eye assessment. Pulsed dye laser can lighten it.', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v3')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = '32ffdc35-42d5-5255-b728-f994ff76e898';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('bab47cd6-9c85-5e14-8a6a-a15e2e462100', '32ffdc35-42d5-5255-b728-f994ff76e898', 'A', 'Down syndrome', false, 0),
  ('747b0162-c4fd-5a61-b078-ca9f6729790b', '32ffdc35-42d5-5255-b728-f994ff76e898', 'B', 'Marfan syndrome', false, 1),
  ('a260fe73-2bdb-513f-847a-f3e07917bfb4', '32ffdc35-42d5-5255-b728-f994ff76e898', 'C', 'Neurofibromatosis type 1', false, 2),
  ('671d2f46-c380-549e-b2db-5cfeb4eca15c', '32ffdc35-42d5-5255-b728-f994ff76e898', 'D', 'Sturge-Weber syndrome (with risk of seizures and glaucoma)', true, 3),
  ('890717e7-8ba5-5ad4-815a-8ef1b3614b58', '32ffdc35-42d5-5255-b728-f994ff76e898', 'E', 'Tuberous sclerosis', false, 4);

-- Q377
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('6c5e54f9-63bb-556e-8ef3-e861b83357b5', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000012', 'sba', 'A 6 week old baby has a rapidly growing, raised, bright red lesion on her eyelid that is beginning to cover her eye. What is the SINGLE most appropriate management?', 'Infantile haemangiomas appear in the first weeks, grow over months and usually regress over years. Most need no treatment. Those threatening function (vision, airway, feeding), ulcerated ones, or large facial ones need urgent specialist referral for oral propranolol. Periocular haemangiomas can cause amblyopia.', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v3')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = '6c5e54f9-63bb-556e-8ef3-e861b83357b5';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('c52716d6-90fb-5d31-9a94-1b51edf1559d', '6c5e54f9-63bb-556e-8ef3-e861b83357b5', 'A', 'Reassure; it will disappear without treatment', false, 0),
  ('786e5eb0-0304-5693-99d8-21b52d709420', '6c5e54f9-63bb-556e-8ef3-e861b83357b5', 'B', 'Laser in primary care', false, 1),
  ('8dbfb50c-fb2c-50bf-9837-2cab60b8c95c', '6c5e54f9-63bb-556e-8ef3-e861b83357b5', 'C', 'Topical steroid cream only', false, 2),
  ('c7ae6b69-d09b-5324-bc76-6c2c5546782f', '6c5e54f9-63bb-556e-8ef3-e861b83357b5', 'D', 'Urgent referral for oral propranolol (infantile haemangioma threatening vision)', true, 3),
  ('083e51d1-117c-5778-acd7-c237019f194d', '6c5e54f9-63bb-556e-8ef3-e861b83357b5', 'E', 'Surgical excision immediately', false, 4);

-- Q378
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('eb00acff-d6e1-5291-b55e-efc9261acc8c', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000012', 'sba', 'A 72 year old man has a chronic punched-out, painful ulcer on his toe with a pale base. His foot is cold, and pulses are absent. Pain is worse at night when lying flat. What type of ulcer is this?', 'Arterial ulcers are painful, punched-out, on the toes or pressure points, with a pale or necrotic base, absent pulses, cool skin and a low ABPI. Venous ulcers are usually above the medial malleolus, shallow, with sloping edges, varicose eczema and haemosiderin staining. Neuropathic ulcers are painless and on pressure points of the sole. Refer arterial ulcers to vascular surgery and avoid compression.', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v3')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = 'eb00acff-d6e1-5291-b55e-efc9261acc8c';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('94cc4224-9422-5085-832f-cb0b9e356000', 'eb00acff-d6e1-5291-b55e-efc9261acc8c', 'A', 'Arterial ulcer', true, 0),
  ('94ca7cf0-9c33-5ae5-9987-eb9cac278cf1', 'eb00acff-d6e1-5291-b55e-efc9261acc8c', 'B', 'Pyoderma gangrenosum', false, 1),
  ('906e0a4e-73ed-5920-bc7e-f5c4a36a56a1', 'eb00acff-d6e1-5291-b55e-efc9261acc8c', 'C', 'Neuropathic ulcer', false, 2),
  ('c9a6b957-a51a-504b-8ec3-9e2ab518c9a5', 'eb00acff-d6e1-5291-b55e-efc9261acc8c', 'D', 'Venous ulcer', false, 3),
  ('426b5204-b629-5fe3-8d07-9879fb36aa7a', 'eb00acff-d6e1-5291-b55e-efc9261acc8c', 'E', 'Pressure ulcer', false, 4);

-- Q379
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('9437b863-b0f1-5694-92aa-4f1c611e941c', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000026', 'sba', 'A 65 year old man has had a nosebleed for 2 hours from the back of his nose. Blood is running down his throat despite anterior nasal packing. He is haemodynamically stable. What is the SINGLE most appropriate next step?', 'Posterior epistaxis (from the sphenopalatine artery) is more common in older people with hypertension or on anticoagulants. If anterior packing fails, use posterior packing (Foley catheter or dual-balloon device) and admit under ENT. Persistent bleeding may need endoscopic sphenopalatine artery ligation or embolisation. Correct coagulopathy.', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v3')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = '9437b863-b0f1-5694-92aa-4f1c611e941c';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('4da9d4bc-9c3f-5109-a6f1-d3bf247ff32a', '9437b863-b0f1-5694-92aa-4f1c611e941c', 'A', 'Ice packs only', false, 0),
  ('788ab898-1069-52fa-9bff-29362cb2ef1d', '9437b863-b0f1-5694-92aa-4f1c611e941c', 'B', 'Posterior nasal packing (e.g. a balloon device) and ENT admission', true, 1),
  ('019122a8-d3b2-5c3d-b6bd-87e409930edd', '9437b863-b0f1-5694-92aa-4f1c611e941c', 'C', 'Silver nitrate cautery of the back of the nose in A&E', false, 2),
  ('a6137d82-f38b-5733-ab24-ef3f1717a0d3', '9437b863-b0f1-5694-92aa-4f1c611e941c', 'D', 'Tranexamic acid only and discharge', false, 3),
  ('91bc5e02-d53c-5611-b966-5e894f9bd86d', '9437b863-b0f1-5694-92aa-4f1c611e941c', 'E', 'Discharge with nasal cream', false, 4);

-- Q380
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('95f8481b-d985-5e78-936f-08b8796710f1', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000026', 'sba', 'A 20 year old man had a punch to his nose 2 hours ago. His nose is swollen and slightly deviated. On examination, there is a tender, fluctuant, purple swelling of the nasal septum. What is the SINGLE most appropriate management?', 'A septal haematoma must be drained urgently because it can cause cartilage necrosis (saddle nose deformity) and septal abscess. Always examine the septum after nasal trauma. Simple displaced nasal fractures without a septal haematoma are reassessed at 5-7 days (after swelling settles) for manipulation within 2-3 weeks.', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v3')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = '95f8481b-d985-5e78-936f-08b8796710f1';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('b6e667fc-3464-55ff-ab01-5b69dd0460f9', '95f8481b-d985-5e78-936f-08b8796710f1', 'A', 'Ice and analgesia only', false, 0),
  ('bd7482c9-0005-5553-9675-c55fe22b078f', '95f8481b-d985-5e78-936f-08b8796710f1', 'B', 'Same-day ENT referral for incision and drainage of a septal haematoma', true, 1),
  ('1b3487e4-15b2-5c57-98c9-470ecde65118', '95f8481b-d985-5e78-936f-08b8796710f1', 'C', 'Nasal steroid spray', false, 2),
  ('800bddc0-c86c-5c30-9d5c-ec8dfc9adcf9', '95f8481b-d985-5e78-936f-08b8796710f1', 'D', 'Nasal X-ray', false, 3),
  ('31599871-5b87-5a03-9d3b-351b9ca39b05', '95f8481b-d985-5e78-936f-08b8796710f1', 'E', 'Review in 5-7 days for nasal fracture manipulation only', false, 4);

-- Q381
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('e2cc3244-df2f-597d-8ad9-3d68ff2ed5dc', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000026', 'sba', 'A 7 year old boy with sinusitis has a swollen, red upper eyelid, proptosis, painful and reduced eye movements and reduced visual acuity. What is the SINGLE most appropriate management?', 'Orbital (post-septal) cellulitis is an emergency, often a complication of ethmoid sinusitis in children. Proptosis, painful or limited eye movement, reduced vision or colour vision and a RAPD are red flags. Admit for IV antibiotics and CT of the orbits and sinuses (to look for subperiosteal abscess). Surgical drainage may be needed. Complications include vision loss, cavernous sinus thrombosis and intracranial abscess.', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v3')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = 'e2cc3244-df2f-597d-8ad9-3d68ff2ed5dc';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('cf0af726-b5f9-5a64-8a66-695592b199ec', 'e2cc3244-df2f-597d-8ad9-3d68ff2ed5dc', 'A', 'Topical chloramphenicol', false, 0),
  ('5d8e3a43-e4a1-5bde-bcfd-392be34b34b7', 'e2cc3244-df2f-597d-8ad9-3d68ff2ed5dc', 'B', 'Antihistamines', false, 1),
  ('21191eca-dbd3-52a1-8278-1b086abbe499', 'e2cc3244-df2f-597d-8ad9-3d68ff2ed5dc', 'C', 'Admit for IV antibiotics, urgent CT and ENT/ophthalmology review (orbital cellulitis)', true, 2),
  ('a41ac664-93b4-5cbd-a5c3-c3f166d96586', 'e2cc3244-df2f-597d-8ad9-3d68ff2ed5dc', 'D', 'Oral antibiotics at home', false, 3),
  ('2bc0d6b1-55a3-5eb9-8fd0-57c802c428c3', 'e2cc3244-df2f-597d-8ad9-3d68ff2ed5dc', 'E', 'Warm compresses only', false, 4);

-- Q382
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('8563786f-4b73-528b-99aa-d97f78cf2ccd', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000026', 'sba', 'A 55 year old man of Chinese origin has a unilateral middle ear effusion (glue ear) in his right ear for 2 months, with a neck lump and blocked nose. What is the SINGLE most important diagnosis to exclude?', 'A new unilateral middle ear effusion in an adult needs examination of the postnasal space to exclude nasopharyngeal carcinoma, which can block the Eustachian tube. It is more common in people of southern Chinese origin and linked to EBV. Refer to ENT for endoscopy and biopsy.', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v3')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = '8563786f-4b73-528b-99aa-d97f78cf2ccd';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('450ece96-169b-5b31-8f61-678c1443c406', '8563786f-4b73-528b-99aa-d97f78cf2ccd', 'A', 'Allergic rhinitis', false, 0),
  ('5da5bf42-e771-51e5-84a1-cb7955ebf40f', '8563786f-4b73-528b-99aa-d97f78cf2ccd', 'B', 'Nasopharyngeal carcinoma', true, 1),
  ('88c3646d-9a4a-5341-9dec-235bdd91a4dd', '8563786f-4b73-528b-99aa-d97f78cf2ccd', 'C', 'Otosclerosis', false, 2),
  ('d0c96aa1-c8c4-57e8-a01a-151b0f47c724', '8563786f-4b73-528b-99aa-d97f78cf2ccd', 'D', 'Acoustic neuroma', false, 3),
  ('66e545d9-4924-5a0e-9c68-add0ec3a0c93', '8563786f-4b73-528b-99aa-d97f78cf2ccd', 'E', 'Cholesteatoma', false, 4);

-- Q383
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('c6194e76-9d28-58fc-b29c-00211c4ee0da', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000026', 'sba', 'A 25 year old woman has had a sudden sharp pain in her ear during a flight, followed by hearing loss and a feeling of fullness. Otoscopy shows a red, bulging, retracted drum with some blood behind it. What is the SINGLE most likely diagnosis?', 'Barotrauma is caused by failure to equalise middle ear pressure (Eustachian tube dysfunction, especially with a cold) during flying or diving. It can cause pain, hearing loss, haemotympanum and perforation. Most resolve spontaneously. Advise decongestants and auto-inflation. Vertigo or severe hearing loss suggests inner ear injury and needs urgent ENT review.', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v3')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = 'c6194e76-9d28-58fc-b29c-00211c4ee0da';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('fc226c99-dec9-583a-9a84-3afee52c36d6', 'c6194e76-9d28-58fc-b29c-00211c4ee0da', 'A', 'Acute otitis media', false, 0),
  ('30f17f03-c0ec-573f-b036-31e52866cedd', 'c6194e76-9d28-58fc-b29c-00211c4ee0da', 'B', 'Ménière''s disease', false, 1),
  ('ca32ccb1-2b75-5f1e-8b53-f1073bc9ddc4', 'c6194e76-9d28-58fc-b29c-00211c4ee0da', 'C', 'Otic barotrauma', true, 2),
  ('d4c89b8a-6166-5ad9-8f87-d1645dd6e51e', 'c6194e76-9d28-58fc-b29c-00211c4ee0da', 'D', 'Cholesteatoma', false, 3),
  ('3efff5a6-4a45-5c7b-9bf3-5a7c55cc5f85', 'c6194e76-9d28-58fc-b29c-00211c4ee0da', 'E', 'Otitis externa', false, 4);

-- Q384
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('de638cf9-90d9-507f-aa70-d889ea0d6f36', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000026', 'sba', 'A 35 year old man has a small dry central perforation of his eardrum after an infection 3 months ago. His hearing is slightly reduced. What is the MOST appropriate advice?', 'Most traumatic or infective perforations heal within weeks. Keep water out of the ear to prevent infection. Persistent perforations (over about 6 weeks to 3 months) need ENT referral for possible myringoplasty. Avoid ototoxic drops (such as aminoglycosides) with a perforation unless there is clear infection. Microsuction is preferred to syringing.', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v3')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = 'de638cf9-90d9-507f-aa70-d889ea0d6f36';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('7111a016-39b0-538b-ab67-0719212f074e', 'de638cf9-90d9-507f-aa70-d889ea0d6f36', 'A', 'Use oil-based drops daily', false, 0),
  ('c449e652-4d7c-5572-bd83-97818cf90075', 'de638cf9-90d9-507f-aa70-d889ea0d6f36', 'B', 'Syringe the ear', false, 1),
  ('38298b3e-119f-50a0-a239-d40e7e3dcce1', 'de638cf9-90d9-507f-aa70-d889ea0d6f36', 'C', 'Keep the ear dry (avoid swimming without protection); refer to ENT if the perforation has not healed in 6 weeks to 3 months (possible myringoplasty)', true, 2),
  ('a71f6252-367b-5b0a-b131-1e23bca6d421', 'de638cf9-90d9-507f-aa70-d889ea0d6f36', 'D', 'No follow-up is ever needed', false, 3),
  ('238548cb-34de-5279-a97f-34bd3f86e5eb', 'de638cf9-90d9-507f-aa70-d889ea0d6f36', 'E', 'Insert a grommet', false, 4);

-- Q385
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('d55d1185-dad9-5e75-8712-d1d6fe733d3e', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000026', 'sba', 'A 55 year old factory worker has gradual bilateral hearing loss and tinnitus. His audiogram shows a dip in hearing thresholds at 4 kHz in both ears. What is the SINGLE most likely diagnosis?', 'Noise-induced hearing loss causes a bilateral sensorineural loss with a characteristic notch at 3-6 kHz (often 4 kHz). Presbycusis causes a bilateral, high-frequency sloping loss. Prevent it with hearing protection and noise limits at work. Hearing aids help, and it may be an industrial injury.', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v3')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = 'd55d1185-dad9-5e75-8712-d1d6fe733d3e';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('918b026b-98db-511f-b5c9-9e67437cfccf', 'd55d1185-dad9-5e75-8712-d1d6fe733d3e', 'A', 'Ménière''s disease', false, 0),
  ('1e4e6238-86ba-5eaf-98b0-76e219415e7b', 'd55d1185-dad9-5e75-8712-d1d6fe733d3e', 'B', 'Presbycusis', false, 1),
  ('330eb151-55a8-5851-a173-a6c920e35d85', 'd55d1185-dad9-5e75-8712-d1d6fe733d3e', 'C', 'Acoustic neuroma', false, 2),
  ('8fe09766-fd1d-579f-8116-e4c6accecb47', 'd55d1185-dad9-5e75-8712-d1d6fe733d3e', 'D', 'Otosclerosis', false, 3),
  ('1ad06bbb-d1d4-5e95-94fc-bbfb4e4a2095', 'd55d1185-dad9-5e75-8712-d1d6fe733d3e', 'E', 'Noise-induced hearing loss', true, 4);

-- Q386
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('d4c8bf86-5a01-5cf5-bcaa-523c95414d53', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000026', 'sba', 'A 45 year old woman has a pulsatile whooshing sound in her right ear in time with her heartbeat. What is the SINGLE most appropriate investigation?', 'Unilateral pulsatile tinnitus needs investigation for a vascular cause (such as a glomus tumour, dural arteriovenous fistula, carotid stenosis or dissection, venous sinus stenosis, or idiopathic intracranial hypertension). Refer to ENT. Unilateral non-pulsatile tinnitus with hearing loss needs MRI to look for a vestibular schwannoma.', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v3')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = 'd4c8bf86-5a01-5cf5-bcaa-523c95414d53';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('a1091012-c855-5968-b2ab-e64fbdaf5e03', 'd4c8bf86-5a01-5cf5-bcaa-523c95414d53', 'A', 'Ear syringing', false, 0),
  ('7d16652a-238d-5b16-843e-53dd3ade5b55', 'd4c8bf86-5a01-5cf5-bcaa-523c95414d53', 'B', 'Tympanometry only', false, 1),
  ('1b5006de-f916-5210-a10d-577ef938978c', 'd4c8bf86-5a01-5cf5-bcaa-523c95414d53', 'C', 'Imaging (MR/CT angiography) to look for a vascular cause', true, 2),
  ('d0305b6e-f9ff-5a7c-bf05-b37e77356398', 'd4c8bf86-5a01-5cf5-bcaa-523c95414d53', 'D', 'Audiogram only', false, 3),
  ('39040c31-d0e7-54ef-9e66-60dcb8902ebf', 'd4c8bf86-5a01-5cf5-bcaa-523c95414d53', 'E', 'No investigation needed', false, 4);

-- Q387
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('e3325587-da4e-547d-9b39-6636dd95eac4', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000026', 'sba', 'A 3 month old baby has had noisy, high-pitched breathing on inspiration since 2 weeks of age. It is worse when feeding, crying or lying on her back. She is feeding well and gaining weight. What is the SINGLE most likely diagnosis?', 'Laryngomalacia is the commonest cause of stridor in infants. Floppy supraglottic tissues collapse on inspiration, causing stridor that is worse on feeding, crying and lying supine. Most cases resolve by 12-24 months. Refer if there is poor feeding, faltering growth, apnoeas or cyanosis (supraglottoplasty may be needed).', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v3')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = 'e3325587-da4e-547d-9b39-6636dd95eac4';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('46cd7368-7463-5d54-a66c-034064eafdf4', 'e3325587-da4e-547d-9b39-6636dd95eac4', 'A', 'Vascular ring', false, 0),
  ('fa7a10eb-5b4e-5e97-99a0-98ae4eebe530', 'e3325587-da4e-547d-9b39-6636dd95eac4', 'B', 'Laryngomalacia', true, 1),
  ('bee059c4-b5e2-57de-be22-cbeb40d01862', 'e3325587-da4e-547d-9b39-6636dd95eac4', 'C', 'Inhaled foreign body', false, 2),
  ('77c77c5f-9f7f-5edc-b12b-075521ac935e', 'e3325587-da4e-547d-9b39-6636dd95eac4', 'D', 'Croup', false, 3),
  ('baf69283-3ced-58b2-a868-248b0dbb2989', 'e3325587-da4e-547d-9b39-6636dd95eac4', 'E', 'Epiglottitis', false, 4);

-- Q388
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('78731ee8-3481-5402-8cd2-8e01912ea38b', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000026', 'sba', 'A 45 year old man has had a rapidly worsening sore throat, painful swallowing, drooling and a muffled voice for 12 hours. He is sitting forward. Examination of his oropharynx is unremarkable. What is the SINGLE most likely diagnosis?', 'Adult epiglottitis presents with severe sore throat and painful swallowing disproportionate to the oropharyngeal findings, plus drooling, muffled voice and stridor. Airway obstruction can happen suddenly. Call senior ENT and anaesthetic help, keep the patient upright, give IV antibiotics (ceftriaxone) and steroids, and have airway equipment ready. Flexible nasendoscopy is done cautiously.', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v3')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = '78731ee8-3481-5402-8cd2-8e01912ea38b';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('23477cc8-43a2-59e2-965b-9f68d634e7c7', '78731ee8-3481-5402-8cd2-8e01912ea38b', 'A', 'Viral pharyngitis', false, 0),
  ('9c3b9956-0e41-56d8-8fe1-8a05f0b30a46', '78731ee8-3481-5402-8cd2-8e01912ea38b', 'B', 'Croup', false, 1),
  ('41cff2d2-96c4-5c89-8ec6-3df4ca4c71a1', '78731ee8-3481-5402-8cd2-8e01912ea38b', 'C', 'Peritonsillar abscess', false, 2),
  ('c99e1d05-01c3-518c-84c9-1a3d809d7e37', '78731ee8-3481-5402-8cd2-8e01912ea38b', 'D', 'Acute epiglottitis (supraglottitis)', true, 3),
  ('92a11409-07fb-5bfd-a311-7849a22a462d', '78731ee8-3481-5402-8cd2-8e01912ea38b', 'E', 'Infectious mononucleosis', false, 4);

-- Q389
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('70eb65cf-3e4c-52d9-8761-aba8db8538c9', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000026', 'sba', 'A 25 year old man had a tonsillectomy 7 days ago. He now has bleeding from his throat. What is the SINGLE most appropriate management?', 'Post-tonsillectomy haemorrhage can be primary (within 24 hours, from surgical causes) or secondary (5-10 days, usually from infection of the tonsillar bed). Any bleed needs ENT assessment. Treat with IV antibiotics, hydrogen peroxide gargles and IV access. Return to theatre if bleeding is significant.', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v3')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = '70eb65cf-3e4c-52d9-8761-aba8db8538c9';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('ff7f7839-15c6-5451-8c8d-f924e056a8af', '70eb65cf-3e4c-52d9-8761-aba8db8538c9', 'A', 'Oral painkillers only', false, 0),
  ('434f66e3-8d6a-501c-8af7-18217aac8f90', '70eb65cf-3e4c-52d9-8761-aba8db8538c9', 'B', 'Hospital admission (ENT) for assessment; secondary haemorrhage is often due to infection, so give IV antibiotics', true, 1),
  ('0c39e151-03d8-5eea-9463-0fed0d444b49', '70eb65cf-3e4c-52d9-8761-aba8db8538c9', 'C', 'Wait 24 hours', false, 2),
  ('20a10c2c-884e-5e10-8268-45fd6bbe9c51', '70eb65cf-3e4c-52d9-8761-aba8db8538c9', 'D', 'Discharge with mouthwash', false, 3),
  ('129e4aee-95f1-5e7f-904a-f782a202f5f2', '70eb65cf-3e4c-52d9-8761-aba8db8538c9', 'E', 'Nasal packing', false, 4);

-- Q390
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('c34e9f8f-388b-5c43-9c9e-2a1478a37dea', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000026', 'sba', 'A 70 year old man has had a painless, hard, fixed lump in his upper neck for 6 weeks. He is a heavy smoker and drinker, and has had a sore throat and ear pain on the same side. What is the SINGLE most appropriate management?', 'NICE NG12: refer unexplained neck lumps that persist or grow, particularly in people over 45, and persistent unexplained oral or throat symptoms (ulcer, hoarseness, dysphagia, referred otalgia) on a suspected cancer pathway. Risk factors for head and neck SCC are smoking, alcohol and HPV (oropharyngeal cancer). Assessment includes endoscopy, ultrasound-guided FNA and imaging.', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v3')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = 'c34e9f8f-388b-5c43-9c9e-2a1478a37dea';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('f55834a4-1387-52db-a213-e610aa503969', 'c34e9f8f-388b-5c43-9c9e-2a1478a37dea', 'A', 'Reassure; it is a reactive node', false, 0),
  ('c916ee32-89a0-5e74-a5ec-cafaff71380f', 'c34e9f8f-388b-5c43-9c9e-2a1478a37dea', 'B', 'Ultrasound in 3 months', false, 1),
  ('526d4fd8-676a-50cf-a783-d96ae2c8e0e3', 'c34e9f8f-388b-5c43-9c9e-2a1478a37dea', 'C', 'Suspected cancer pathway referral to ENT (head and neck cancer)', true, 2),
  ('adeeb6ec-636c-5fa1-8cb9-e93ce002a8f6', 'c34e9f8f-388b-5c43-9c9e-2a1478a37dea', 'D', 'Antibiotics and review in 2 weeks', false, 3),
  ('79f6e7b1-9fdf-5458-ae2b-72cd7c5bc115', 'c34e9f8f-388b-5c43-9c9e-2a1478a37dea', 'E', 'Fine needle aspiration in primary care', false, 4);

-- Q391
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('28b6784c-c744-5bac-9642-61d0f4da2483', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000026', 'sba', 'A 75 year old man with dehydration after surgery has a painful, swollen, red parotid gland with pus from Stensen''s duct when the gland is massaged. What is the SINGLE most likely diagnosis?', 'Acute bacterial parotitis (usually Staphylococcus aureus) occurs in dehydrated, older or postoperative patients and those with poor oral hygiene. Treatment is hydration, sialogogues, massage, oral hygiene and antibiotics (flucloxacillin). An abscess needs drainage. Mumps causes bilateral swelling without pus.', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v3')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = '28b6784c-c744-5bac-9642-61d0f4da2483';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('3a6a5d99-5ea7-53f4-8742-dc36d4523db0', '28b6784c-c744-5bac-9642-61d0f4da2483', 'A', 'Acute suppurative (bacterial) parotitis', true, 0),
  ('e12c0fc3-b860-59c2-9d66-aa226fcf98e1', '28b6784c-c744-5bac-9642-61d0f4da2483', 'B', 'Sjögren''s syndrome', false, 1),
  ('a38f5b5d-1677-5198-b2dd-03a2be00f553', '28b6784c-c744-5bac-9642-61d0f4da2483', 'C', 'Pleomorphic adenoma', false, 2),
  ('1a1aa763-f45e-57f9-a08e-627b23138af8', '28b6784c-c744-5bac-9642-61d0f4da2483', 'D', 'Mumps', false, 3),
  ('08633f81-d2ae-59c3-9f62-f63909043a73', '28b6784c-c744-5bac-9642-61d0f4da2483', 'E', 'Parotid stone only', false, 4);

-- Q392
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('d2e141d4-5a89-5a93-b2e0-14bd0fee2ae1', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000026', 'sba', 'A 40 year old woman has sudden ear pain and an insect in her ear canal that is still moving. What is the SINGLE most appropriate first step?', 'A live insect in the ear causes distress and can damage the drum. First kill it with oil or lidocaine, then remove it by microsuction or forceps. Batteries in the ear (and nose) are an emergency because of the risk of caustic injury. Refer foreign bodies to ENT if removal is difficult or the patient is uncooperative.', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v3')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = 'd2e141d4-5a89-5a93-b2e0-14bd0fee2ae1';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('95ead87d-ad98-522e-8bba-6d643c70e0f9', 'd2e141d4-5a89-5a93-b2e0-14bd0fee2ae1', 'A', 'Push it in further with a cotton bud', false, 0),
  ('66c5d3dc-c657-56a9-ba79-b065001886f7', 'd2e141d4-5a89-5a93-b2e0-14bd0fee2ae1', 'B', 'Syringe immediately with water while it is alive', false, 1),
  ('caceee62-c859-59e3-a149-12985a118842', 'd2e141d4-5a89-5a93-b2e0-14bd0fee2ae1', 'C', 'Leave it for a week', false, 2),
  ('9c431191-c723-55fa-a60d-241044dd9795', 'd2e141d4-5a89-5a93-b2e0-14bd0fee2ae1', 'D', 'Give oral antibiotics only', false, 3),
  ('e64645b3-3652-56c7-a6a6-a5e92c22b0f6', 'd2e141d4-5a89-5a93-b2e0-14bd0fee2ae1', 'E', 'Kill the insect by instilling olive oil (or lidocaine), then remove it', true, 4);

-- Q393
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('1f4bd296-c4f0-51d0-b520-2a7505e4243e', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000026', 'sba', 'A 35 year old man has a blocked nose and unilateral nasal polyp on the left, with blood-stained discharge. What is the SINGLE most appropriate management?', 'Bilateral nasal polyps are usually benign (often with chronic rhinosinusitis and asthma) and are treated with intranasal steroids. Unilateral polyps, bleeding, crusting, pain or facial swelling are red flags for malignancy (or inverted papilloma) and need urgent ENT referral.', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v3')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = '1f4bd296-c4f0-51d0-b520-2a7505e4243e';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('95883944-0b5e-5588-952d-43b326f541f9', '1f4bd296-c4f0-51d0-b520-2a7505e4243e', 'A', 'Antihistamines only', false, 0),
  ('718cf68a-9e0c-5eba-886e-8d9de9af8205', '1f4bd296-c4f0-51d0-b520-2a7505e4243e', 'B', 'Polypectomy in primary care', false, 1),
  ('b4b7c9f7-0e70-5c26-abff-ca63d5b0757f', '1f4bd296-c4f0-51d0-b520-2a7505e4243e', 'C', 'Intranasal steroids and review in 3 months', false, 2),
  ('7c71007d-d87d-5b3b-a3a3-8055e8a4fb3c', '1f4bd296-c4f0-51d0-b520-2a7505e4243e', 'D', 'Urgent ENT referral to exclude malignancy (unilateral polyps are a red flag)', true, 3),
  ('e00c5a71-700b-533d-a9d4-9abb5b67c411', '1f4bd296-c4f0-51d0-b520-2a7505e4243e', 'E', 'Oral antibiotics', false, 4);

-- Q394
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('3d8c8c65-a1d3-5e03-a533-55862d386d1b', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000026', 'sba', 'A 5 year old boy snores loudly, has pauses in breathing during sleep and is restless at night. He is tired and inattentive at school. He has large tonsils. What is the SINGLE most appropriate management?', 'In children, obstructive sleep apnoea is usually caused by adenotonsillar hypertrophy. It can cause behavioural problems, poor concentration, faltering growth and, rarely, pulmonary hypertension. Adenotonsillectomy is usually curative. CPAP is used if surgery is not suitable or there are other risk factors (obesity, craniofacial anomalies).', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v3')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = '3d8c8c65-a1d3-5e03-a533-55862d386d1b';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('85ce858a-7116-56f3-8e0e-25a59769b304', '3d8c8c65-a1d3-5e03-a533-55862d386d1b', 'A', 'CPAP as first-line', false, 0),
  ('a0b4f888-2d63-544e-a445-8bc8fd2ccd1d', '3d8c8c65-a1d3-5e03-a533-55862d386d1b', 'B', 'Antibiotics', false, 1),
  ('1ebea42d-1935-5563-9d68-4124608c12ff', '3d8c8c65-a1d3-5e03-a533-55862d386d1b', 'C', 'Refer to ENT for assessment for adenotonsillectomy (obstructive sleep apnoea)', true, 2),
  ('4102e2cb-21eb-5d2a-810a-8466187592a9', '3d8c8c65-a1d3-5e03-a533-55862d386d1b', 'D', 'Reassure; snoring is normal in children', false, 3),
  ('78baf500-ac8a-5a8c-a4e1-d213a189769b', '3d8c8c65-a1d3-5e03-a533-55862d386d1b', 'E', 'Oral steroids for 6 months', false, 4);

-- Q395
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('2d91148a-9fef-5845-8d28-6e29bfa0e5cc', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000026', 'sba', 'A 25 year old man has a smooth, painless, mobile swelling under his tongue on the floor of his mouth. It is bluish and translucent. What is the SINGLE most likely diagnosis?', 'A ranula is a mucus extravasation cyst from the sublingual gland, appearing as a bluish translucent swelling in the floor of the mouth (''frog''s belly''). A plunging ranula extends into the neck. Treatment is excision of the sublingual gland (marsupialisation alone often recurs).', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v3')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = '2d91148a-9fef-5845-8d28-6e29bfa0e5cc';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('bd9fae70-76d6-54f5-a424-ed1d8ae2dcb6', '2d91148a-9fef-5845-8d28-6e29bfa0e5cc', 'A', 'Thyroglossal cyst', false, 0),
  ('3783ec43-1a9d-53c0-8aad-99ccb3117f90', '2d91148a-9fef-5845-8d28-6e29bfa0e5cc', 'B', 'Ranula (mucous retention cyst of the sublingual gland)', true, 1),
  ('df598586-c178-5789-956a-efd0a9abd912', '2d91148a-9fef-5845-8d28-6e29bfa0e5cc', 'C', 'Pleomorphic adenoma', false, 2),
  ('2b7a57e8-6cba-572a-ae69-da38079f18f7', '2d91148a-9fef-5845-8d28-6e29bfa0e5cc', 'D', 'Dermoid cyst', false, 3),
  ('b56126e3-b86c-5b04-a5e3-f99af0429c17', '2d91148a-9fef-5845-8d28-6e29bfa0e5cc', 'E', 'Submandibular stone', false, 4);

-- Q396
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('44478ce5-0f58-5013-b6c8-91a5b4171a8b', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000015', 'sba', 'A 30 year old man has a red, gritty, watery eye with a pre-auricular lymph node after a cold. His colleague had the same. Vision is normal. What is the SINGLE most appropriate management?', 'Adenoviral conjunctivitis is highly contagious. It causes a watery discharge, follicles and a tender pre-auricular node, often after an URTI. It resolves in 1-3 weeks. Advise hand hygiene and not sharing towels. Antibiotics do not help. Refer if vision falls or there is severe pain or photophobia (keratitis).', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v3')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = '44478ce5-0f58-5013-b6c8-91a5b4171a8b';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('6e4d6bfd-8bfc-5363-82b6-44e3a95fc176', '44478ce5-0f58-5013-b6c8-91a5b4171a8b', 'A', 'Viral (adenoviral) conjunctivitis: hygiene advice to prevent spread, cool compresses and lubricants', true, 0),
  ('e60c8a8f-94c2-563f-ab57-bad1054a7fde', '44478ce5-0f58-5013-b6c8-91a5b4171a8b', 'B', 'Topical steroid', false, 1),
  ('ca93cff6-3335-589f-a9ab-972aa067a8db', '44478ce5-0f58-5013-b6c8-91a5b4171a8b', 'C', 'Topical chloramphenicol', false, 2),
  ('42884cf5-95e1-533f-b4a3-6a01f0c08518', '44478ce5-0f58-5013-b6c8-91a5b4171a8b', 'D', 'Oral aciclovir', false, 3),
  ('4e824455-0115-571c-a3eb-eaba181e80f0', '44478ce5-0f58-5013-b6c8-91a5b4171a8b', 'E', 'Urgent ophthalmology referral', false, 4);

-- Q397
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('2e2c246b-bc7d-5814-a9c7-a091d6a41f76', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000015', 'sba', 'A 25 year old woman with hay fever has itchy, red, watery eyes with swollen eyelids every spring. What is the SINGLE most appropriate first-line treatment?', 'Seasonal allergic conjunctivitis causes bilateral itchy, watery eyes, often with rhinitis. Treat with allergen avoidance, oral antihistamines and topical antihistamines (antazoline, olopatadine) or mast cell stabilisers (sodium cromoglicate, which work best when used regularly). Steroid drops should only be used under specialist supervision.', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v3')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = '2e2c246b-bc7d-5814-a9c7-a091d6a41f76';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('b8bd6f9b-4b04-5387-bda0-99d6b5464dc9', '2e2c246b-bc7d-5814-a9c7-a091d6a41f76', 'A', 'Topical chloramphenicol', false, 0),
  ('6bdf45fe-597d-5719-9412-56bd8a6a8621', '2e2c246b-bc7d-5814-a9c7-a091d6a41f76', 'B', 'Oral prednisolone', false, 1),
  ('6f40d43b-9a10-5961-888f-e5e7374073c0', '2e2c246b-bc7d-5814-a9c7-a091d6a41f76', 'C', 'Topical antihistamine or mast cell stabiliser eye drops (e.g. sodium cromoglicate), with oral antihistamine', true, 2),
  ('b20974ce-016a-5697-8e93-6678c546bfd4', '2e2c246b-bc7d-5814-a9c7-a091d6a41f76', 'D', 'Topical steroid drops in primary care', false, 3),
  ('d584b771-4a5f-58f5-a710-6a9173815749', '2e2c246b-bc7d-5814-a9c7-a091d6a41f76', 'E', 'Oral aciclovir', false, 4);

-- Q398
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('d097d0ff-70b0-5113-a0f7-d33a599ae33b', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000015', 'sba', 'A 3 day old baby has profuse purulent discharge from both eyes with swollen lids. The mother had an untreated STI. What is the SINGLE most likely diagnosis and management?', 'Ophthalmia neonatorum (conjunctivitis in the first 28 days) is notifiable. Gonococcal infection presents early (2-5 days) with hyperacute purulent discharge and can perforate the cornea. It needs urgent admission and IV ceftriaxone or cefotaxime. Chlamydia presents later (5-14 days) and is treated with oral erythromycin (it can also cause pneumonia). Treat the parents.', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v3')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = 'd097d0ff-70b0-5113-a0f7-d33a599ae33b';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('52a7eccf-3eb0-5735-9ca0-f9016ce6b441', 'd097d0ff-70b0-5113-a0f7-d33a599ae33b', 'A', 'Chlamydial conjunctivitis; topical antibiotics only', false, 0),
  ('958fc16b-266f-5726-bf05-20bc99678668', 'd097d0ff-70b0-5113-a0f7-d33a599ae33b', 'B', 'Neonatal gonococcal conjunctivitis (ophthalmia neonatorum); urgent admission for IV cephalosporin, swabs and treatment of the mother', true, 1),
  ('22bb975c-6f4e-54cd-b4e1-867db5de72d1', 'd097d0ff-70b0-5113-a0f7-d33a599ae33b', 'C', 'Allergic conjunctivitis; antihistamines', false, 2),
  ('1d986772-4705-5fa8-a0a1-3d6d42e6b2be', 'd097d0ff-70b0-5113-a0f7-d33a599ae33b', 'D', 'Blocked tear duct; massage only', false, 3),
  ('3de736d5-64fc-59b1-b26e-346d84361210', 'd097d0ff-70b0-5113-a0f7-d33a599ae33b', 'E', 'Viral conjunctivitis; reassure', false, 4);

-- Q399
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('722fbf94-26ef-56c4-bac0-88b076cc1802', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000015', 'sba', 'A 32 year old man was scratched in the eye by a twig. He has pain, watering and photophobia. Fluorescein shows a small linear corneal abrasion. Vision is normal, and there is no foreign body. What is the SINGLE most appropriate management?', 'Corneal abrasions usually heal within 24-72 hours. Give topical antibiotic prophylaxis and oral analgesia. Do not give topical anaesthetic for home use (it delays healing and hides damage). Contact lens wearers need anti-Pseudomonas cover and no lenses. Refer if there is reduced vision, infiltrate, a large abrasion or a penetrating injury.', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v3')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = '722fbf94-26ef-56c4-bac0-88b076cc1802';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('94ff773d-758e-5d32-b64a-1cb4479a8d14', '722fbf94-26ef-56c4-bac0-88b076cc1802', 'A', 'Eye pad for 1 week', false, 0),
  ('46bf0f8f-6325-54ea-8783-ae00b3bee0ae', '722fbf94-26ef-56c4-bac0-88b076cc1802', 'B', 'Topical antibiotic (e.g. chloramphenicol ointment) and analgesia, with review if not improving in 24-48 hours', true, 1),
  ('f6a8bb5f-b65a-571a-a4ae-59e8420e1c72', '722fbf94-26ef-56c4-bac0-88b076cc1802', 'C', 'Urgent surgery', false, 2),
  ('e2f017a3-33c1-5bd6-a9a9-86ed70b04261', '722fbf94-26ef-56c4-bac0-88b076cc1802', 'D', 'Topical anaesthetic drops to use at home', false, 3),
  ('9e3106ab-6467-55bf-8a0a-a6a3c592d66a', '722fbf94-26ef-56c4-bac0-88b076cc1802', 'E', 'Topical steroid drops', false, 4);

-- Q400
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('0e5b6768-c439-5130-b2f8-792adec68b57', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000015', 'sba', 'A 28 year old man was welding without a mask. Several hours later he has severe bilateral eye pain, watering and photophobia. Fluorescein shows multiple small punctate staining spots on both corneas. What is the SINGLE most likely diagnosis?', 'UV keratitis (welder''s flash or snow blindness) causes intense pain 6-12 hours after exposure, with punctate epithelial erosions. It usually resolves in 24-48 hours. Treat with cycloplegic drops, lubricants, oral analgesia and a topical antibiotic. Prevent with UV-protective eyewear.', null, true, false, jsonb_build_object('source', 'plab1-xlsx-v3')) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, is_active = true, updated_at = now();
delete from public.question_options where question_id = '0e5b6768-c439-5130-b2f8-792adec68b57';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('52b7e218-49fa-58d7-b615-15e4921ba08c', '0e5b6768-c439-5130-b2f8-792adec68b57', 'A', 'Bacterial keratitis', false, 0),
  ('c83798ff-39fe-5967-909a-a2392ef4c7f9', '0e5b6768-c439-5130-b2f8-792adec68b57', 'B', 'Chemical injury', false, 1),
  ('70b01d6e-b34b-5c06-9630-087e66568a6f', '0e5b6768-c439-5130-b2f8-792adec68b57', 'C', 'Acute angle-closure glaucoma', false, 2),
  ('1aaa65a0-12b5-5e17-881e-3d0bd3010488', '0e5b6768-c439-5130-b2f8-792adec68b57', 'D', 'Retinal detachment', false, 3),
  ('6970f2b6-a5fb-5f70-b964-4ca6ec0be453', '0e5b6768-c439-5130-b2f8-792adec68b57', 'E', 'Ultraviolet keratitis (arc eye)', true, 4);

