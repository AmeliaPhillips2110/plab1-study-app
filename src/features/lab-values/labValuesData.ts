/**
 * Embedded adult lab reference ranges for in-app study (not scraped).
 * Individual laboratories set their own reference ranges.
 */

export type LabValueRow = {
  name: string
  range: string
  unit: string
  note?: string
}

export type LabValueSection = {
  id: string
  title: string
  rows: LabValueRow[]
}

export const LAB_VALUE_SECTIONS: LabValueSection[] = [
  {
    id: 'haematology',
    title: 'Haematology',
    rows: [
      { name: 'Haemoglobin (male)', range: '130–180', unit: 'g/L' },
      { name: 'Haemoglobin (female)', range: '115–165', unit: 'g/L' },
      { name: 'Haematocrit (male)', range: '0.40–0.52', unit: 'L/L' },
      { name: 'Haematocrit (female)', range: '0.36–0.46', unit: 'L/L' },
      { name: 'MCV', range: '80–100', unit: 'fL' },
      { name: 'MCH', range: '27–32', unit: 'pg' },
      { name: 'WBC', range: '4.0–11.0', unit: '×10⁹/L' },
      { name: 'Neutrophils', range: '2.0–7.5', unit: '×10⁹/L' },
      { name: 'Lymphocytes', range: '1.0–4.0', unit: '×10⁹/L' },
      { name: 'Eosinophils', range: '0.04–0.40', unit: '×10⁹/L' },
      { name: 'Platelets', range: '150–400', unit: '×10⁹/L' },
      { name: 'Reticulocytes', range: '0.5–1.5', unit: '%' },
      { name: 'ESR (male)', range: '<20', unit: 'mm/h', note: 'Age-dependent' },
      { name: 'ESR (female)', range: '<30', unit: 'mm/h', note: 'Age-dependent' },
    ],
  },
  {
    id: 'coagulation',
    title: 'Coagulation',
    rows: [
      { name: 'PT', range: '10–14', unit: 's' },
      { name: 'APTT', range: '25–35', unit: 's' },
      { name: 'INR', range: '0.8–1.2', unit: '' },
      { name: 'Fibrinogen', range: '1.5–4.0', unit: 'g/L' },
      { name: 'D-dimer', range: 'Assay-specific', unit: '', note: 'Use local cut-off' },
    ],
  },
  {
    id: 'biochemistry',
    title: 'Biochemistry (U&E / bone)',
    rows: [
      { name: 'Sodium', range: '135–145', unit: 'mmol/L' },
      { name: 'Potassium', range: '3.5–5.0', unit: 'mmol/L' },
      { name: 'Chloride', range: '95–105', unit: 'mmol/L' },
      { name: 'Bicarbonate', range: '22–26', unit: 'mmol/L' },
      { name: 'Urea', range: '2.5–7.8', unit: 'mmol/L' },
      { name: 'Creatinine (male)', range: '59–104', unit: 'µmol/L' },
      { name: 'Creatinine (female)', range: '45–84', unit: 'µmol/L' },
      { name: 'eGFR', range: '>90', unit: 'mL/min/1.73m²', note: 'Normal adult' },
      { name: 'Calcium (adjusted)', range: '2.20–2.60', unit: 'mmol/L' },
      { name: 'Phosphate', range: '0.80–1.50', unit: 'mmol/L' },
      { name: 'Magnesium', range: '0.70–1.00', unit: 'mmol/L' },
      { name: 'Albumin', range: '35–50', unit: 'g/L' },
      { name: 'Total protein', range: '60–80', unit: 'g/L' },
      { name: 'Urate (male)', range: '200–430', unit: 'µmol/L' },
      { name: 'Urate (female)', range: '140–360', unit: 'µmol/L' },
    ],
  },
  {
    id: 'liver',
    title: 'Liver / pancreas',
    rows: [
      { name: 'Bilirubin (total)', range: '<21', unit: 'µmol/L' },
      { name: 'ALT', range: '10–50', unit: 'U/L' },
      { name: 'AST', range: '10–40', unit: 'U/L' },
      { name: 'ALP', range: '30–130', unit: 'U/L' },
      { name: 'GGT (male)', range: '<70', unit: 'U/L' },
      { name: 'GGT (female)', range: '<40', unit: 'U/L' },
      { name: 'Amylase', range: '30–110', unit: 'U/L' },
      { name: 'Lipase', range: 'Assay-specific', unit: 'U/L' },
    ],
  },
  {
    id: 'glucose-lipids',
    title: 'Glucose & lipids',
    rows: [
      { name: 'Glucose (fasting)', range: '3.5–5.5', unit: 'mmol/L' },
      { name: 'HbA1c', range: '<42', unit: 'mmol/mol', note: 'Non-diabetic' },
      { name: 'Total cholesterol', range: '<5.0', unit: 'mmol/L' },
      { name: 'LDL cholesterol', range: '<3.0', unit: 'mmol/L' },
      { name: 'HDL cholesterol', range: '>1.0', unit: 'mmol/L' },
      { name: 'Triglycerides', range: '<1.7', unit: 'mmol/L' },
    ],
  },
  {
    id: 'thyroid',
    title: 'Thyroid',
    rows: [
      { name: 'TSH', range: '0.4–4.0', unit: 'mU/L' },
      { name: 'Free T4', range: '9–25', unit: 'pmol/L' },
      { name: 'Free T3', range: '3.5–7.8', unit: 'pmol/L' },
    ],
  },
  {
    id: 'abg',
    title: 'Arterial blood gas',
    rows: [
      { name: 'pH', range: '7.35–7.45', unit: '' },
      { name: 'PaO₂', range: '10–13', unit: 'kPa' },
      { name: 'PaCO₂', range: '4.7–6.0', unit: 'kPa' },
      { name: 'HCO₃⁻', range: '22–26', unit: 'mmol/L' },
      { name: 'Base excess', range: '−2 to +2', unit: 'mmol/L' },
      { name: 'Lactate', range: '0.5–2.2', unit: 'mmol/L' },
    ],
  },
  {
    id: 'cardiac-inflam',
    title: 'Cardiac & inflammation',
    rows: [
      { name: 'Troponin', range: 'Assay-specific', unit: '', note: 'Use 99th centile cut-off' },
      { name: 'BNP / NT-proBNP', range: 'Assay-specific', unit: 'ng/L' },
      { name: 'CRP', range: '<5', unit: 'mg/L' },
      { name: 'Procalcitonin', range: 'Assay-specific', unit: 'µg/L' },
    ],
  },
  {
    id: 'csf',
    title: 'CSF (adult)',
    rows: [
      { name: 'Opening pressure', range: '10–20', unit: 'cm H₂O' },
      { name: 'WBC', range: '<5', unit: '×10⁶/L' },
      { name: 'Protein', range: '0.15–0.45', unit: 'g/L' },
      { name: 'Glucose', range: '2.5–4.5', unit: 'mmol/L', note: '≈⅔ plasma' },
    ],
  },
]
