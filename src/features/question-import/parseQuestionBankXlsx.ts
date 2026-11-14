import { toEmbeddableImageUrl } from '@/components/ui/QuestionImage'
import { normHeader, resolveTopicSlug } from '@/features/question-import/topicAliases'
import { sha1Hex, uuid5 } from '@/features/question-import/uuid5'

export type ParsedOption = {
  id: string
  label: string
  body: string
  is_correct: boolean
  sort_order: number
}

export type ParsedQuestion = {
  id: string
  row: number
  stem: string
  explanation: string | null
  topicSlug: string | null
  topicRaw: string | null
  isUkPractice: boolean
  imageUrl: string | null
  guidelinesText: string | null
  options: ParsedOption[]
  correct: string
}

export type ParseError = {
  row: number
  message: string
}

export type ParsePreview = {
  fileName: string
  sheetName: string
  suggestedSourceTag: string
  questions: ParsedQuestion[]
  skipped: number
  errors: ParseError[]
  topicCounts: Record<string, number>
  unmappedTopics: Record<string, number>
  imageCount: number
  headers: string[]
}

function pickCol(headers: string[], ...candidates: string[]): number | null {
  for (const cand of candidates) {
    const c = normHeader(cand)
    for (let i = 0; i < headers.length; i++) {
      if (headers[i] === c) return i
    }
  }
  for (const cand of candidates) {
    const c = normHeader(cand)
    for (let i = 0; i < headers.length; i++) {
      const h = headers[i] ?? ''
      if (c && (h.includes(c) || c.includes(h))) return i
    }
  }
  return null
}

function cell(row: unknown[], idx: number | null): unknown {
  if (idx == null || idx >= row.length) return null
  return row[idx]
}

function parseCorrect(raw: unknown, options: Record<string, string>): string | null {
  if (raw == null) return null
  const s = String(raw).trim()
  if (!s) return null
  const letter = s.match(/^([A-Ea-e])\b/)
  if (letter) return letter[1]!.toUpperCase()
  const low = s.toLowerCase()
  for (const [lab, body] of Object.entries(options)) {
    if (body && body.trim().toLowerCase() === low) return lab
  }
  const embedded = s.match(/\b([A-Ea-e])\b/)
  if (embedded) return embedded[1]!.toUpperCase()
  return null
}

function isUkPracticeValue(raw: unknown): boolean {
  if (raw == null) return false
  return ['1', 'true', 'yes', 'y', 'uk', 'uk practice'].includes(String(raw).trim().toLowerCase())
}

function normalizeImage(raw: unknown): string | null {
  if (raw == null) return null
  const s = String(raw).trim()
  if (!s) return null
  // data URLs / bare base64 → keep as data URL for <img src>
  if (s.startsWith('data:image/')) return s
  if (/^[A-Za-z0-9+/=\s]+$/.test(s) && s.replace(/\s/g, '').length > 200) {
    return `data:image/png;base64,${s.replace(/\s/g, '')}`
  }
  return toEmbeddableImageUrl(s)
}

export function suggestSourceTag(fileName: string): string {
  const lower = fileName.toLowerCase()
  if (lower.includes('bank_3') || /[_\-\s]3\.xlsx$/.test(lower) || lower.includes('v3')) {
    return 'plab1-xlsx-v3'
  }
  if (lower.includes('bank_2') || /[_\-\s]2\.xlsx$/.test(lower) || lower.includes('v2')) {
    return 'plab1-xlsx-v2'
  }
  return 'plab1-xlsx'
}

export async function parseQuestionBankXlsx(
  buffer: ArrayBuffer,
  fileName: string,
  sourceTagOverride?: string,
): Promise<ParsePreview> {
  const XLSX = await import('xlsx')
  const workbook = XLSX.read(buffer, { type: 'array', cellDates: false })
  const sheetName =
    workbook.SheetNames.find((n) => n.toLowerCase() === 'question bank') ?? workbook.SheetNames[0]
  if (!sheetName) {
    throw new Error('Workbook has no sheets.')
  }
  const sheet = workbook.Sheets[sheetName]
  if (!sheet) throw new Error(`Sheet "${sheetName}" missing.`)

  const rows = XLSX.utils.sheet_to_json<(string | number | boolean | null)[]>(sheet, {
    header: 1,
    defval: null,
    raw: false,
  }) as unknown[][]

  if (rows.length === 0) throw new Error('Empty workbook.')

  const headerRow = rows[0] ?? []
  const headers = headerRow.map((h) => normHeader(h))
  const iStem = pickCol(headers, 'stem', 'question', 'question text', 'question stem', 'sba', 'vignette')
  const iA = pickCol(headers, 'option a', 'a', 'answer a', 'choice a')
  const iB = pickCol(headers, 'option b', 'b', 'answer b', 'choice b')
  const iC = pickCol(headers, 'option c', 'c', 'answer c', 'choice c')
  const iD = pickCol(headers, 'option d', 'd', 'answer d', 'choice d')
  const iE = pickCol(headers, 'option e', 'e', 'answer e', 'choice e')
  const iCorrect = pickCol(headers, 'correct', 'correct answer', 'answer', 'correct option', 'key', 'ans')
  const iExpl = pickCol(headers, 'explanation', 'explain', 'rationale', 'feedback', 'notes')
  const iTopic = pickCol(
    headers,
    'topic',
    'specialty',
    'speciality',
    'subject',
    'category',
    'system',
    'theme',
  )
  const iUk = pickCol(headers, 'uk practice', 'uk', 'is uk practice', 'uk_practice')
  const iGuidelines = pickCol(headers, 'guidelines', 'guideline', 'nice', 'refs', 'references')
  const iImage = pickCol(headers, 'image', 'image url', 'figure', 'img', 'picture')

  if (iStem == null || iA == null || iB == null || iC == null || iD == null || iE == null) {
    throw new Error(
      `Could not map required columns (stem + options A–E). Headers: ${headers.join(', ')}`,
    )
  }

  const sourceTag = (sourceTagOverride?.trim() || suggestSourceTag(fileName)).trim()
  const questions: ParsedQuestion[] = []
  const errors: ParseError[] = []
  const topicCounts: Record<string, number> = {}
  const unmappedTopics: Record<string, number> = {}
  let skipped = 0
  let imageCount = 0

  for (let n = 1; n < rows.length; n++) {
    const row = rows[n] ?? []
    const rowNum = n + 1
    const stemRaw = cell(row, iStem)
    if (stemRaw == null || !String(stemRaw).trim()) {
      skipped += 1
      continue
    }

    const opts: Record<string, string> = {
      A: String(cell(row, iA) ?? '').trim(),
      B: String(cell(row, iB) ?? '').trim(),
      C: String(cell(row, iC) ?? '').trim(),
      D: String(cell(row, iD) ?? '').trim(),
      E: String(cell(row, iE) ?? '').trim(),
    }
    if (Object.values(opts).filter(Boolean).length < 2) {
      skipped += 1
      continue
    }

    const correct = parseCorrect(cell(row, iCorrect), opts)
    if (!correct || !opts[correct]) {
      skipped += 1
      errors.push({
        row: rowNum,
        message: `Could not resolve correct answer (${String(cell(row, iCorrect) ?? '')})`,
      })
      continue
    }

    const topicRawVal = cell(row, iTopic)
    const topicRaw =
      topicRawVal == null || !String(topicRawVal).trim() ? null : String(topicRawVal).trim()
    const topicSlug = resolveTopicSlug(topicRawVal)
    if (topicSlug) {
      topicCounts[topicSlug] = (topicCounts[topicSlug] ?? 0) + 1
    } else {
      const key = topicRaw || '(blank)'
      unmappedTopics[key] = (unmappedTopics[key] ?? 0) + 1
    }

    let explanation =
      cell(row, iExpl) == null || !String(cell(row, iExpl)).trim()
        ? null
        : String(cell(row, iExpl)).trim()
    const guidelinesRaw = cell(row, iGuidelines)
    const guidelinesText =
      guidelinesRaw != null && String(guidelinesRaw).trim() ? String(guidelinesRaw).trim() : null
    if (!explanation && guidelinesText) explanation = guidelinesText

    const imageUrl = normalizeImage(cell(row, iImage))
    if (imageUrl) imageCount += 1

    const stem = String(stemRaw).trim()
    const seed = [sourceTag, stem, opts.A, opts.B, opts.C, opts.D, opts.E, correct].join('|')
    const digest = await sha1Hex(seed)
    const id = await uuid5(`q:${digest}`)

    const options: ParsedOption[] = []
    for (const [sort, lab] of ['A', 'B', 'C', 'D', 'E'].entries()) {
      const body = opts[lab]
      if (!body) continue
      const oid = await uuid5(`o:${id}:${lab}`)
      options.push({
        id: oid,
        label: lab,
        body,
        is_correct: lab === correct,
        sort_order: sort,
      })
    }

    questions.push({
      id,
      row: rowNum,
      stem,
      explanation,
      topicSlug,
      topicRaw,
      isUkPractice: isUkPracticeValue(cell(row, iUk)),
      imageUrl,
      guidelinesText,
      options,
      correct,
    })
  }

  return {
    fileName,
    sheetName,
    suggestedSourceTag: sourceTag,
    questions,
    skipped,
    errors,
    topicCounts,
    unmappedTopics,
    imageCount,
    headers,
  }
}
