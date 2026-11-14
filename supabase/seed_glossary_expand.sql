-- =============================================================================
-- Substantial PLAB / UK clinical glossary expansion (idempotent upsert).
-- Exam id matches seed.sql: a1000000-0000-4000-8000-000000000001
-- Run in Supabase SQL Editor after base seed.sql (or alone — on conflict updates).
-- =============================================================================

insert into public.glossary_terms (exam_id, term, definition, aliases, section, is_active) values
  -- Exam & systems
  ('a1000000-0000-4000-8000-000000000001', 'SJT', 'Situational Judgement Test — scored scenarios of professional judgement used in UK foundation / specialty selection.', array['situational judgement test'], 'Exam & PLAB', true),
  ('a1000000-0000-4000-8000-000000000001', 'PSA', 'Prescribing Safety Assessment — UK exam of safe prescribing for medical students / foundation.', array['Prescribing Safety Assessment'], 'Exam & PLAB', true),
  ('a1000000-0000-4000-8000-000000000001', 'MSRA', 'Multi-Specialty Recruitment Assessment — computer-based selection test for many UK specialty training programmes.', array['Multi-Specialty Recruitment Assessment'], 'Exam & PLAB', true),
  ('a1000000-0000-4000-8000-000000000001', 'CESR', 'Certificate of Eligibility for Specialist Registration — GMC route for doctors trained outside UK CCT pathways.', array['Certificate of Eligibility for Specialist Registration'], 'Exam & PLAB', true),
  ('a1000000-0000-4000-8000-000000000001', 'CCT', 'Certificate of Completion of Training — marks end of UK specialty training and eligibility for the specialist register.', array['Certificate of Completion of Training'], 'Exam & PLAB', true),
  ('a1000000-0000-4000-8000-000000000001', 'Good Medical Practice', 'GMC professional standards for UK doctors covering knowledge, skills, safety, communication, and integrity.', array['GMP', 'GMC guidance'], 'UK systems', true),
  ('a1000000-0000-4000-8000-000000000001', 'NICE NG', 'NICE guideline (numbered NG…) — evidence-based UK pathway recommendations for diagnosis and management.', array['NICE guideline', 'NG'], 'UK systems', true),
  ('a1000000-0000-4000-8000-000000000001', 'MHRA', 'Medicines and Healthcare products Regulatory Agency — UK regulator for medicines and devices; issues Yellow Card / safety alerts.', array['Medicines and Healthcare products Regulatory Agency'], 'UK systems', true),
  ('a1000000-0000-4000-8000-000000000001', 'Yellow Card', 'MHRA scheme for reporting suspected adverse drug reactions and device incidents.', array['Yellow Card Scheme'], 'UK systems', true),
  ('a1000000-0000-4000-8000-000000000001', '111', 'UK free urgent medical advice line (NHS 111) for non-life-threatening illness; 999 for emergencies.', array['NHS 111'], 'UK systems', true),
  ('a1000000-0000-4000-8000-000000000001', 'ICB', 'Integrated Care Board — NHS England organisation commissioning local health services within an ICS.', array['Integrated Care Board', 'ICS'], 'UK systems', true),
  ('a1000000-0000-4000-8000-000000000001', 'QOF', 'Quality and Outcomes Framework — GP contract indicators rewarding structured chronic disease care.', array['Quality and Outcomes Framework'], 'UK systems', true),
  ('a1000000-0000-4000-8000-000000000001', 'red flag', 'Symptom or sign suggesting serious pathology needing urgent exclusion (e.g. cauda equina, meningitis).', array['red-flag', 'red flags'], 'Acute care', true),
  ('a1000000-0000-4000-8000-000000000001', 'SIRS', 'Systemic inflammatory response syndrome — older infection severity criteria largely superseded by qSOFA/Sepsis-3 in UK pathways.', array['systemic inflammatory response'], 'Acute care', true),
  ('a1000000-0000-4000-8000-000000000001', 'qSOFA', 'Quick SOFA — bedside sepsis screen (RR ≥22, altered mentation, SBP ≤100); prompts further assessment.', array['quick SOFA'], 'Acute care', true),
  ('a1000000-0000-4000-8000-000000000001', 'RCEM', 'Royal College of Emergency Medicine — sets UK emergency care standards and guidance.', array['Royal College of Emergency Medicine'], 'Acute care', true),
  ('a1000000-0000-4000-8000-000000000001', 'ALS algorithm', 'Resuscitation Council UK Advanced Life Support algorithm for cardiac arrest (shockable vs non-shockable).', array['advanced life support', 'Resuscitation Council'], 'Acute care', true),
  ('a1000000-0000-4000-8000-000000000001', 'IO access', 'Intraosseous vascular access — emergency route when IV access fails (e.g. arrest, shock).', array['intraosseous', 'IO'], 'Acute care', true),

  -- Cardiology
  ('a1000000-0000-4000-8000-000000000001', 'NSTEMI', 'Non-ST-elevation myocardial infarction — troponin-positive ACS without persistent ST elevation; risk-stratify for angiography.', array['non-ST elevation MI'], 'Cardiology', true),
  ('a1000000-0000-4000-8000-000000000001', 'PCI', 'Percutaneous coronary intervention — catheter-based coronary revascularisation (primary PCI for STEMI).', array['percutaneous coronary intervention', 'angioplasty'], 'Cardiology', true),
  ('a1000000-0000-4000-8000-000000000001', 'GRACE score', 'Risk score after ACS predicting mortality; guides timing of invasive strategy in NSTE-ACS.', array['GRACE'], 'Cardiology', true),
  ('a1000000-0000-4000-8000-000000000001', 'HAS-BLED', 'Bleeding risk score in atrial fibrillation on anticoagulation (Hypertension, Abnormal renal/liver, Stroke, Bleeding, Labile INR, Elderly, Drugs/alcohol).', array[]::text[], 'Cardiology', true),
  ('a1000000-0000-4000-8000-000000000001', 'DOAC', 'Direct oral anticoagulant (e.g. apixaban, rivaroxaban, dabigatran, edoxaban) — preferred over warfarin for most non-valvular AF.', array['NOAC', 'direct oral anticoagulant'], 'Cardiology', true),
  ('a1000000-0000-4000-8000-000000000001', 'HFrEF', 'Heart failure with reduced ejection fraction — typically LVEF ≤40%; cornerstone therapy includes ACEi/ARB/ARNI, beta-blocker, MRA, SGLT2i.', array['heart failure reduced EF', 'systolic heart failure'], 'Cardiology', true),
  ('a1000000-0000-4000-8000-000000000001', 'HFpEF', 'Heart failure with preserved ejection fraction — symptoms of HF with LVEF ≥50%; treat comorbidities; SGLT2i often indicated.', array['heart failure preserved EF', 'diastolic heart failure'], 'Cardiology', true),
  ('a1000000-0000-4000-8000-000000000001', 'ORBITA', 'Landmark trial context often cited when discussing PCI for stable angina vs optimal medical therapy — focus on shared decisions and ischaemia evidence.', array[]::text[], 'Cardiology', true),
  ('a1000000-0000-4000-8000-000000000001', 'aortic stenosis', 'Left ventricular outflow obstruction at the aortic valve; severe AS with symptoms needs valve intervention assessment.', array['AS', 'severe aortic stenosis'], 'Cardiology', true),
  ('a1000000-0000-4000-8000-000000000001', 'infective endocarditis', 'Infection of endocardial surface/valves — Duke criteria; blood cultures before antibiotics when stable; consider urgent echo.', array['IE', 'bacterial endocarditis'], 'Cardiology', true),

  -- Respiratory
  ('a1000000-0000-4000-8000-000000000001', 'BTS', 'British Thoracic Society — UK respiratory guidelines (asthma, COPD, pneumonia, pleural disease).', array['British Thoracic Society'], 'Respiratory', true),
  ('a1000000-0000-4000-8000-000000000001', 'NIPPV', 'Non-invasive positive pressure ventilation (e.g. BiPAP) — key therapy in acidotic COPD exacerbation when indicated.', array['NIV', 'BiPAP', 'non-invasive ventilation'], 'Respiratory', true),
  ('a1000000-0000-4000-8000-000000000001', 'type 1 respiratory failure', 'Hypoxaemia (PaO2 <8 kPa) with normal or low PaCO2 — causes include pneumonia, PE, pulmonary oedema.', array['type I respiratory failure'], 'Respiratory', true),
  ('a1000000-0000-4000-8000-000000000001', 'type 2 respiratory failure', 'Hypoxaemia with hypercapnia (raised PaCO2) — e.g. COPD, neuromuscular weakness, severe asthma late.', array['type II respiratory failure', 'hypercapnic failure'], 'Respiratory', true),
  ('a1000000-0000-4000-8000-000000000001', 'pneumothorax', 'Air in the pleural space; tension pneumothorax is a clinical emergency (deviated trachea, shock) needing immediate decompression.', array['tension pneumothorax'], 'Respiratory', true),
  ('a1000000-0000-4000-8000-000000000001', 'pleural effusion', 'Fluid in the pleural space; Light''s criteria help separate exudate vs transudate.', array['Light''s criteria'], 'Respiratory', true),
  ('a1000000-0000-4000-8000-000000000001', 'TB', 'Tuberculosis — airborne Mycobacterium tuberculosis; notify, isolate if pulmonary, and follow UK TB pathways.', array['tuberculosis', 'pulmonary TB'], 'Respiratory', true),
  ('a1000000-0000-4000-8000-000000000001', 'obstructive sleep apnoea', 'Recurrent upper airway collapse in sleep causing apnoeas; associated with obesity, daytime somnolence, CV risk; CPAP is mainstay.', array['OSA', 'OSAS'], 'Respiratory', true),

  -- Endocrine / metabolic
  ('a1000000-0000-4000-8000-000000000001', 'SIADH', 'Syndrome of inappropriate ADH secretion — euvolaemic hyponatraemia with inappropriate urine concentration; treat underlying cause and fluid restrict carefully.', array['syndrome of inappropriate ADH'], 'Endocrine', true),
  ('a1000000-0000-4000-8000-000000000001', 'Addison''s disease', 'Primary adrenal insufficiency — cortisol ± aldosterone deficiency; crisis needs urgent IV hydrocortisone and fluids.', array['Addisons', 'primary adrenal insufficiency', 'adrenal crisis'], 'Endocrine', true),
  ('a1000000-0000-4000-8000-000000000001', 'Cushing''s syndrome', 'Chronic glucocorticoid excess — centripetal obesity, striae, hypertension, glucose intolerance; confirm then find source.', array['Cushings', 'hypercortisolism'], 'Endocrine', true),
  ('a1000000-0000-4000-8000-000000000001', 'myxoedema coma', 'Severe hypothyroidism with altered consciousness, hypothermia, and organ dysfunction — emergency thyroid replacement + supportive care.', array['myxedema coma'], 'Endocrine', true),
  ('a1000000-0000-4000-8000-000000000001', 'osteoporosis', 'Low bone mass with fracture risk; FRAX and DXA guide treatment (bisphosphonates, denosumab, etc.).', array['FRAX', 'DXA'], 'Endocrine', true),
  ('a1000000-0000-4000-8000-000000000001', 'hypoglycaemia', 'Low plasma glucose with symptoms; treat with rapid carbohydrate / glucagon / IV glucose per severity; review cause in diabetes.', array['hypo', 'hypoglycemia'], 'Endocrine', true),

  -- Renal / electrolytes
  ('a1000000-0000-4000-8000-000000000001', 'hyperkalaemia', 'Raised serum potassium — ECG changes and level guide urgency; protect heart (calcium), shift K+, remove K+.', array['hyperkalemia', 'high potassium'], 'Renal', true),
  ('a1000000-0000-4000-8000-000000000001', 'hyponatraemia', 'Low serum sodium — classify by volume status and osmolality; over-rapid correction risks osmotic demyelination.', array['hyponatremia', 'low sodium'], 'Renal', true),
  ('a1000000-0000-4000-8000-000000000001', 'nephrotic syndrome', 'Heavy proteinuria, hypoalbuminaemia, oedema (± hyperlipidaemia); investigate cause and complications (thrombosis, infection).', array['nephrotic'], 'Renal', true),
  ('a1000000-0000-4000-8000-000000000001', 'nephritic syndrome', 'Haematuria, oliguria, hypertension, and mild–moderate proteinuria — active urinary sediment; urgent nephrology if RPGN suspected.', array['nephritic', 'rapidly progressive GN', 'RPGN'], 'Renal', true),
  ('a1000000-0000-4000-8000-000000000001', 'rhabdomyolysis', 'Muscle breakdown releasing myoglobin — AKI risk; aggressive IV fluids and treat cause; watch K+ and CK.', array['rhabdo'], 'Renal', true),

  -- Neurology
  ('a1000000-0000-4000-8000-000000000001', 'FAST', 'Face, Arms, Speech, Time — public stroke recognition tool; activate stroke pathway urgently.', array['stroke FAST'], 'Neurology', true),
  ('a1000000-0000-4000-8000-000000000001', 'thrombolysis', 'IV alteplase for eligible acute ischaemic stroke within time/window criteria after imaging excludes haemorrhage.', array['IV tPA', 'alteplase'], 'Neurology', true),
  ('a1000000-0000-4000-8000-000000000001', 'status epilepticus', 'Prolonged or recurrent seizures without recovery — emergency benzodiazepines then protocol antiepileptics / anaesthesia.', array['status'], 'Neurology', true),
  ('a1000000-0000-4000-8000-000000000001', 'Guillain–Barré syndrome', 'Acute inflammatory demyelinating polyneuropathy — ascending weakness, areflexia; monitor FVC; IVIg or plasma exchange.', array['GBS', 'Guillain Barre', 'Guillain-Barre'], 'Neurology', true),
  ('a1000000-0000-4000-8000-000000000001', 'myasthenia gravis', 'Autoimmune neuromuscular junction disorder — fatigable weakness; crisis may need airway support and immunotherapy.', array['MG', 'myasthenic crisis'], 'Neurology', true),
  ('a1000000-0000-4000-8000-000000000001', 'cauda equina syndrome', 'Compression of lumbosacral roots — saddle anaesthesia, bowel/bladder dysfunction, bilateral leg signs; urgent MRI and surgical referral.', array['CES', 'cauda equina'], 'Neurology', true),
  ('a1000000-0000-4000-8000-000000000001', 'idiopathic intracranial hypertension', 'Raised ICP without mass lesion, often young women with obesity — headache, papilloedema; risk of visual loss.', array['IIH', 'benign intracranial hypertension', 'pseudotumor cerebri'], 'Neurology', true),
  ('a1000000-0000-4000-8000-000000000001', 'Parkinson''s disease', 'Neurodegenerative movement disorder — bradykinesia plus tremor/rigidity; dopaminergic therapy and MDT care.', array['Parkinsons', 'PD'], 'Neurology', true),

  -- GI / hepatology
  ('a1000000-0000-4000-8000-000000000001', 'UGIB', 'Upper gastrointestinal bleed — ABC, Rockall/Blatchford risk, endoscopy when indicated; variceal vs non-variceal pathways.', array['upper GI bleed', 'haematemesis', 'melaena'], 'Gastroenterology', true),
  ('a1000000-0000-4000-8000-000000000001', 'Blatchford score', 'Pre-endoscopy risk score for UGIB using urea, haemoglobin, BP, pulse, syncope, melaena, comorbidity.', array['Glasgow-Blatchford'], 'Gastroenterology', true),
  ('a1000000-0000-4000-8000-000000000001', 'acute pancreatitis', 'Pancreatic inflammation — usually gallstones or alcohol; Atlanta severity; supportive care, early feeding when possible.', array['pancreatitis'], 'Gastroenterology', true),
  ('a1000000-0000-4000-8000-000000000001', 'IBD', 'Inflammatory bowel disease — Crohn''s disease and ulcerative colitis; distinguish from IBS; flares need prompt treatment.', array['inflammatory bowel disease', 'Crohn''s', 'ulcerative colitis', 'UC'], 'Gastroenterology', true),
  ('a1000000-0000-4000-8000-000000000001', 'coeliac disease', 'Gluten-sensitive enteropathy — IgA tTG screening (check IgA), duodenal biopsy; lifelong gluten-free diet.', array['celiac', 'coeliac'], 'Gastroenterology', true),
  ('a1000000-0000-4000-8000-000000000001', 'hepatic encephalopathy', 'Brain dysfunction from liver failure / portosystemic shunting — reverse precipitants; lactulose ± rifaximin.', array['HE'], 'Gastroenterology', true),
  ('a1000000-0000-4000-8000-000000000001', 'SBP', 'Spontaneous bacterial peritonitis — infected ascitic fluid without surgical source; diagnose by ascitic WCC/culture; antibiotics.', array['spontaneous bacterial peritonitis'], 'Gastroenterology', true),

  -- Infectious disease / micro
  ('a1000000-0000-4000-8000-000000000001', 'meningitis', 'Infection/inflammation of meninges — urgent antibiotics after cultures when safe; do not delay for CT if no contraindications for LP pathway.', array['bacterial meningitis', 'viral meningitis'], 'Infectious Disease', true),
  ('a1000000-0000-4000-8000-000000000001', 'encephalitis', 'Brain parenchymal inflammation — altered mental status, fever, focal signs; aciclovir early if HSV suspected.', array['HSV encephalitis'], 'Infectious Disease', true),
  ('a1000000-0000-4000-8000-000000000001', 'C. difficile', 'Clostridioides difficile colitis after antibiotics — isolation, stop culprit antibiotics, vancomycin/fidaxomicin per severity.', array['Clostridioides difficile', 'CDI', 'C diff'], 'Infectious Disease', true),
  ('a1000000-0000-4000-8000-000000000001', 'neutropenic sepsis', 'Fever in neutropenia (often post-chemo) — door-to-needle antibiotics urgently; follow local oncology protocol.', array['febrile neutropenia'], 'Infectious Disease', true),
  ('a1000000-0000-4000-8000-000000000001', 'HIV', 'Human immunodeficiency virus — offer testing broadly; start ART promptly; consider opportunistic infection if low CD4.', array['human immunodeficiency virus', 'AIDS'], 'Infectious Disease', true),
  ('a1000000-0000-4000-8000-000000000001', 'malaria', 'Plasmodium infection — fever after travel to endemic area; urgent thick/thin films ± rapid antigen; treat by species/severity.', array['Plasmodium'], 'Infectious Disease', true),

  -- Obs/Gyn / sexual health
  ('a1000000-0000-4000-8000-000000000001', 'ectopic pregnancy', 'Pregnancy outside the uterus — consider in any woman of childbearing age with pain/bleeding; urgent β-hCG and TVUS.', array['ectopic'], 'Obstetrics & Gynaecology', true),
  ('a1000000-0000-4000-8000-000000000001', 'PPH', 'Postpartum haemorrhage — primary usually within 24h; 4 Ts (tone, trauma, tissue, thrombin); call for help and resuscitate.', array['postpartum haemorrhage', 'postpartum hemorrhage'], 'Obstetrics & Gynaecology', true),
  ('a1000000-0000-4000-8000-000000000001', 'shoulder dystocia', 'Obstetric emergency — fetal shoulders impact after head delivery; HELPERR manoeuvres; document timings.', array[]::text[], 'Obstetrics & Gynaecology', true),
  ('a1000000-0000-4000-8000-000000000001', 'PID', 'Pelvic inflammatory disease — ascending genital infection; treat empirically; consider ectopic and abscess.', array['pelvic inflammatory disease'], 'Obstetrics & Gynaecology', true),
  ('a1000000-0000-4000-8000-000000000001', 'mirena', 'Levonorgestrel intrauterine system — contraception and heavy menstrual bleeding treatment option.', array['LNG-IUS', 'IUS'], 'Obstetrics & Gynaecology', true),
  ('a1000000-0000-4000-8000-000000000001', 'FSRH', 'Faculty of Sexual and Reproductive Healthcare — UK contraception guidance including UKMEC categories.', array['UKMEC'], 'Obstetrics & Gynaecology', true),

  -- Paediatrics
  ('a1000000-0000-4000-8000-000000000001', 'NICE feverish child', 'NICE traffic-light system for assessing fever in under-5s — green/amber/red features guide urgency.', array['feverish child', 'traffic light fever'], 'Paediatrics', true),
  ('a1000000-0000-4000-8000-000000000001', 'Kawasaki disease', 'Medium-vessel vasculitis in children — prolonged fever, mucocutaneous signs; treat with IVIg to reduce coronary aneurysms.', array['Kawasaki'], 'Paediatrics', true),
  ('a1000000-0000-4000-8000-000000000001', 'intussusception', 'Telescoping of bowel — intermittent pain, redcurrant jelly stool late; ultrasound; air enema reduction.', array[]::text[], 'Paediatrics', true),
  ('a1000000-0000-4000-8000-000000000001', 'pyloric stenosis', 'Infantile hypertrophic pyloric stenosis — progressive projectile vomiting, olive mass; correct electrolytes then pyloromyotomy.', array['IHPS'], 'Paediatrics', true),
  ('a1000000-0000-4000-8000-000000000001', 'safeguarding children', 'Statutory duty to protect children from abuse/neglect — escalate via local safeguarding children partnership.', array['child protection'], 'Paediatrics', true),

  -- Psychiatry / ethics
  ('a1000000-0000-4000-8000-000000000001', 'MHA', 'Mental Health Act (England/Wales) — framework for assessment and detention of people with mental disorder when criteria met.', array['Mental Health Act', 'sectioning'], 'Ethics & law', true),
  ('a1000000-0000-4000-8000-000000000001', 'section 136', 'Police power to take a person from a public place to a place of safety for Mental Health Act assessment.', array['s136'], 'Ethics & law', true),
  ('a1000000-0000-4000-8000-000000000001', 'Gillick competence', 'A child under 16 may consent if they understand the nature, purpose, and consequences of treatment (Fraser guidelines for contraception).', array['Fraser guidelines', 'Gillick'], 'Ethics & law', true),
  ('a1000000-0000-4000-8000-000000000001', 'best interests', 'MCA decision-making standard for someone lacking capacity — consider wishes, beliefs, less restrictive option.', array[]::text[], 'Ethics & law', true),
  ('a1000000-0000-4000-8000-000000000001', 'duty of candour', 'Statutory/professional duty to be open and honest when care goes wrong causing harm or distress.', array['candour'], 'Ethics & law', true),
  ('a1000000-0000-4000-8000-000000000001', 'suicide risk', 'Assess ideas, intent, plan, protective factors; escalate and safety-plan; never rely on a single “contract”.', array['self-harm risk'], 'Psychiatry', true),
  ('a1000000-0000-4000-8000-000000000001', 'delirium', 'Acute fluctuating attention/cognition — treat cause, orientate, avoid restraints; distinguish from dementia.', array['acute confusional state'], 'Psychiatry', true),
  ('a1000000-0000-4000-8000-000000000001', 'serotonin syndrome', 'Excess serotonergic activity — clonus, hyperreflexia, fever, agitation; stop agents and support.', array['serotonin toxicity'], 'Psychiatry', true),

  -- Haematology / oncology
  ('a1000000-0000-4000-8000-000000000001', 'DVT', 'Deep vein thrombosis — Wells score, D-dimer, duplex ultrasound; anticoagulate when confirmed/high probability.', array['deep vein thrombosis'], 'Haematology', true),
  ('a1000000-0000-4000-8000-000000000001', 'DIC', 'Disseminated intravascular coagulation — consumptive coagulopathy with bleeding/thrombosis; treat underlying cause.', array['disseminated intravascular coagulation'], 'Haematology', true),
  ('a1000000-0000-4000-8000-000000000001', 'ITP', 'Immune thrombocytopenia — isolated low platelets; treat if bleeding or very low counts per haematology advice.', array['immune thrombocytopenia'], 'Haematology', true),
  ('a1000000-0000-4000-8000-000000000001', 'tumour lysis syndrome', 'Metabolic emergency after cell lysis (high K+, phosphate, uric acid, low calcium) — prevention and urgent treatment.', array['TLS'], 'Haematology', true),
  ('a1000000-0000-4000-8000-000000000001', 'SVC obstruction', 'Superior vena cava obstruction — facial/arm swelling, dyspnoea; often malignancy; urgent oncology/radiotherapy pathway.', array['SVCO', 'superior vena cava obstruction'], 'Haematology', true),

  -- MSK / rheumatology / ortho
  ('a1000000-0000-4000-8000-000000000001', 'septic arthritis', 'Joint infection — hot swollen joint; urgent aspiration before antibiotics when possible; ortho emergency.', array[]::text[], 'Musculoskeletal', true),
  ('a1000000-0000-4000-8000-000000000001', 'gout', 'Monosodium urate crystal arthritis — negatively birefringent needles; acute NSAID/colchicine/steroid; urate-lowering long term.', array['podagra'], 'Musculoskeletal', true),
  ('a1000000-0000-4000-8000-000000000001', 'polymyalgia rheumatica', 'Proximal stiffness/pain in older adults; associate with GCA risk; responsive to steroids with structured taper.', array['PMR'], 'Musculoskeletal', true),
  ('a1000000-0000-4000-8000-000000000001', 'giant cell arteritis', 'Large-vessel vasculitis — headache, jaw claudication, visual risk; urgent steroids and temporal artery pathway.', array['GCA', 'temporal arteritis'], 'Musculoskeletal', true),
  ('a1000000-0000-4000-8000-000000000001', 'NOF fracture', 'Neck of femur fracture — elderly fall; early surgery and orthogeriatric care; consider osteoporosis secondary prevention.', array['hip fracture', 'fractured neck of femur'], 'Musculoskeletal', true),

  -- Dermatology / ENT / eyes / misc PLAB favourites
  ('a1000000-0000-4000-8000-000000000001', 'erythroderma', 'Generalised skin redness involving ≥90% BSA — fluid/temperature loss, infection risk; admit if unwell.', array['exfoliative dermatitis'], 'Dermatology', true),
  ('a1000000-0000-4000-8000-000000000001', 'SJS/TEN', 'Stevens–Johnson syndrome / toxic epidermal necrolysis — severe cutaneous adverse drug reactions; stop culprit, burn-unit pathway.', array['Stevens-Johnson', 'toxic epidermal necrolysis'], 'Dermatology', true),
  ('a1000000-0000-4000-8000-000000000001', 'epiglottitis', 'Medical emergency — drooling, stridor, toxic child/adult; do not examine throat; secure airway, antibiotics.', array[]::text[], 'ENT', true),
  ('a1000000-0000-4000-8000-000000000001', 'quinsy', 'Peritonsillar abscess — unilateral tonsillar swelling, trismus; drainage + antibiotics.', array['peritonsillar abscess'], 'ENT', true),
  ('a1000000-0000-4000-8000-000000000001', 'acute angle-closure glaucoma', 'Painful red eye, haloes, fixed mid-dilated pupil, hard globe — urgent ophthalmology; lower IOP.', array['AACG', 'angle closure glaucoma'], 'Ophthalmology', true),
  ('a1000000-0000-4000-8000-000000000001', 'orbital cellulitis', 'Post-septal infection — painful eye movements, proptosis, systemic features; urgent imaging and IV antibiotics.', array[]::text[], 'Ophthalmology', true),
  ('a1000000-0000-4000-8000-000000000001', 'otitis media', 'Middle ear infection — common in children; analgesics; antibiotics if systemically unwell or prolonged.', array['AOM', 'acute otitis media'], 'ENT', true),
  ('a1000000-0000-4000-8000-000000000001', 'NICE traffic light', 'Colour-coded clinical risk tool (especially feverish child) separating reassure / intermediate / high-risk features.', array['traffic light system'], 'Paediatrics', true),
  ('a1000000-0000-4000-8000-000000000001', 'two-week wait', 'Urgent suspected cancer referral pathway in England (often ≤2 weeks to specialist).', array['2WW', 'urgent cancer referral'], 'UK systems', true),
  ('a1000000-0000-4000-8000-000000000001', 'DNACPR', 'Do Not Attempt Cardiopulmonary Resuscitation decision — discuss appropriately; document clearly; review when needed.', array['DNAR', 'DNR', 'ReSPECT'], 'Ethics & law', true)
on conflict (exam_id, term) do update
  set definition = excluded.definition,
      aliases = excluded.aliases,
      section = excluded.section,
      is_active = true,
      updated_at = now();
