/** Canonical topic slug → (seed uuid suffix, display name). Mirrors scripts/xlsx_to_seed_sql.py */
export const TOPIC_CATALOG: Record<string, { suffix: string; name: string }> = {
  'acute-emergency-medicine': { suffix: '023', name: 'Acute and Emergency Medicine' },
  'biomedical-sciences': { suffix: '033', name: 'Biomedical Sciences' },
  'breast-surgery': { suffix: '022', name: 'Breast Surgery' },
  cancer: { suffix: '024', name: 'Cancer' },
  cardiology: { suffix: '001', name: 'Cardiovascular' },
  'clinical-imaging': { suffix: '025', name: 'Clinical Imaging' },
  'clinical-pharmacology': { suffix: '034', name: 'Clinical Pharmacology and Therapeutics' },
  'critical-care': { suffix: '035', name: 'Critical Care' },
  dermatology: { suffix: '012', name: 'Dermatology' },
  ent: { suffix: '026', name: 'ENT' },
  endocrine: { suffix: '004', name: 'Endocrine, Diabetes and Metabolic' },
  'ethics-uk-practice': { suffix: '013', name: 'Ethics and UK Practice' },
  gastroenterology: { suffix: '003', name: 'Gastroenterology' },
  'general-practice-primary-healthcare': {
    suffix: '027',
    name: 'General Practice and Primary Healthcare',
  },
  'genetics-genomics': { suffix: '036', name: 'Genetics and Genomics' },
  haematology: { suffix: '014', name: 'Haematology' },
  'human-factors-quality-improvement': {
    suffix: '028',
    name: 'Human Factors and Quality Improvement',
  },
  'infectious-disease': { suffix: '010', name: 'Infectious Disease' },
  'maxillofacial-surgery': { suffix: '037', name: 'Maxillofacial Surgery' },
  'medicine-older-adult': { suffix: '029', name: 'Medicine of the Older Adult' },
  psychiatry: { suffix: '007', name: 'Mental Health' },
  musculoskeletal: { suffix: '011', name: 'Musculoskeletal' },
  neurology: { suffix: '006', name: 'Neurology' },
  'obstetrics-gynaecology': { suffix: '008', name: 'Obstetrics and Gynaecology' },
  ophthalmology: { suffix: '015', name: 'Ophthalmology' },
  orthopaedics: { suffix: '016', name: 'Orthopaedics' },
  paediatrics: { suffix: '009', name: 'Paediatrics' },
  'palliative-end-of-life-care': { suffix: '017', name: 'Palliative Care and End of Life' },
  'perioperative-anaesthesia': { suffix: '018', name: 'Perioperative and Anaesthesia' },
  renal: { suffix: '005', name: 'Renal' },
  respiratory: { suffix: '002', name: 'Respiratory' },
  rheumatology: { suffix: '019', name: 'Rheumatology' },
  'sexual-health': { suffix: '020', name: 'Sexual Health' },
  'social-population-health': { suffix: '021', name: 'Social and Population Health' },
  surgery: { suffix: '030', name: 'Surgery' },
  urology: { suffix: '031', name: 'Urology' },
  vascular: { suffix: '032', name: 'Vascular' },
}

/** Exact / near-exact specialty labels from Excel Category column (and common aliases). */
export const TOPIC_ALIASES: Record<string, string> = {
  'acute and emergency': 'acute-emergency-medicine',
  'acute and emergency medicine': 'acute-emergency-medicine',
  'biomedical sciences includes anatomy': 'biomedical-sciences',
  'biomedical sciences': 'biomedical-sciences',
  'breast surgery': 'breast-surgery',
  'cancer oncology': 'cancer',
  cancer: 'cancer',
  cardiology: 'cardiology',
  'child health paediatrics': 'paediatrics',
  'clinical imaging radiology': 'clinical-imaging',
  'clinical imaging': 'clinical-imaging',
  'clinical pharmacology and therapeutics': 'clinical-pharmacology',
  'critical care': 'critical-care',
  dermatology: 'dermatology',
  'ear nose and throat ent': 'ent',
  'endocrine diabetes and metabolic': 'endocrine',
  'gastrointestinal including liver': 'gastroenterology',
  'general practice and primary healthcare': 'general-practice-primary-healthcare',
  'genetics and genomics': 'genetics-genomics',
  haematology: 'haematology',
  'infectious diseases': 'infectious-disease',
  'medical ethics and law': 'ethics-uk-practice',
  'medicine of older adult': 'medicine-older-adult',
  'medicine of the older adult': 'medicine-older-adult',
  'mental health psychiatry': 'psychiatry',
  'musculoskeletal orthopaedics': 'musculoskeletal',
  'neurosciences neurology': 'neurology',
  'obstetrics and gynaecology': 'obstetrics-gynaecology',
  ophthalmology: 'ophthalmology',
  'palliative and end of life care': 'palliative-end-of-life-care',
  'perioperative medicine and anaesthesia': 'perioperative-anaesthesia',
  'renal and urology': 'renal',
  respiratory: 'respiratory',
  rheumatology: 'rheumatology',
  'sexual health genitourinary medicine': 'sexual-health',
  'social and population health epidemiology': 'social-population-health',
  surgery: 'surgery',
  'maxillofacial surgery': 'maxillofacial-surgery',
  'oral and maxillofacial surgery': 'maxillofacial-surgery',
  maxillofacial: 'maxillofacial-surgery',
  omfs: 'maxillofacial-surgery',
  // Extra aliases
  'acute medicine': 'acute-emergency-medicine',
  'emergency medicine': 'acute-emergency-medicine',
  anatomy: 'biomedical-sciences',
  oncology: 'cancer',
  cardiovascular: 'cardiology',
  radiology: 'clinical-imaging',
  pharmacology: 'clinical-pharmacology',
  therapeutics: 'clinical-pharmacology',
  icu: 'critical-care',
  'intensive care': 'critical-care',
  ent: 'ent',
  otolaryngology: 'ent',
  'ear nose throat': 'ent',
  endocrinology: 'endocrine',
  gastroenterology: 'gastroenterology',
  gastrointestinal: 'gastroenterology',
  genetics: 'genetics-genomics',
  genomics: 'genetics-genomics',
  hematology: 'haematology',
  'infectious disease': 'infectious-disease',
  ethics: 'ethics-uk-practice',
  'ethics and uk practice': 'ethics-uk-practice',
  geriatrics: 'medicine-older-adult',
  'mental health': 'psychiatry',
  psychiatry: 'psychiatry',
  musculoskeletal: 'musculoskeletal',
  orthopaedics: 'musculoskeletal',
  neurosciences: 'neurology',
  neurology: 'neurology',
  paediatrics: 'paediatrics',
  pediatrics: 'paediatrics',
  'child health': 'paediatrics',
  'palliative care': 'palliative-end-of-life-care',
  'palliative care and end of life': 'palliative-end-of-life-care',
  anaesthesia: 'perioperative-anaesthesia',
  perioperative: 'perioperative-anaesthesia',
  renal: 'renal',
  nephrology: 'renal',
  urology: 'urology',
  'sexual health': 'sexual-health',
  'social and population health': 'social-population-health',
  'public health': 'social-population-health',
  epidemiology: 'social-population-health',
  vascular: 'vascular',
}

export function topicIdForSlug(slug: string): string | null {
  const entry = TOPIC_CATALOG[slug]
  if (!entry) return null
  return `a2000000-0000-4000-8000-000000000${entry.suffix}`
}

export function normHeader(value: unknown): string {
  const s = String(value ?? '')
    .trim()
    .toLowerCase()
    .replace(/[^a-z0-9]+/g, ' ')
    .replace(/\s+/g, ' ')
    .trim()
  return s
}

export function resolveTopicSlug(raw: unknown): string | null {
  if (raw == null) return null
  const key = normHeader(raw)
  if (!key) return null
  if (TOPIC_ALIASES[key]) return TOPIC_ALIASES[key]
  let best: { score: number; slug: string } | null = null
  for (const [alias, slug] of Object.entries(TOPIC_ALIASES)) {
    if (alias.length < 8) continue
    if (alias === key || key.includes(alias) || alias.includes(key)) {
      const score = alias.length
      if (!best || score > best.score) best = { score, slug }
    }
  }
  return best?.slug ?? null
}
