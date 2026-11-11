import type { AttemptResult, PresentationFormat } from '@/types/database'
import type { FlashcardGrade } from '@/types/quiz'

/** Canonical mistake tags (Stage 0 examples + UK-study practical set). */
export const MISTAKE_TAG_DEFS = [
  { tag: 'knowledge_gap', label: 'Knowledge gap', hint: 'Did not know / recall the fact' },
  { tag: 'misread', label: 'Misread stem', hint: 'Missed a key word or detail' },
  { tag: 'rush', label: 'Rushed', hint: 'Too fast / timed out pressure' },
  { tag: 'calculation', label: 'Calculation', hint: 'Arithmetic or unit error' },
  { tag: 'guideline_mixup', label: 'Guideline mix-up', hint: 'Wrong protocol / UK practice' },
  { tag: 'elimination_error', label: 'Elimination error', hint: 'Ruled out the right option' },
  { tag: 'other', label: 'Other', hint: 'Something else — add a note' },
] as const

export type MistakeTagCode = (typeof MISTAKE_TAG_DEFS)[number]['tag']

export const MISTAKE_TAG_LABELS: Record<MistakeTagCode, string> = Object.fromEntries(
  MISTAKE_TAG_DEFS.map((d) => [d.tag, d.label]),
) as Record<MistakeTagCode, string>

export function suggestMistakeTags(input: {
  result: AttemptResult
  format?: PresentationFormat
  timedOut?: boolean
  timeSpentMs?: number | null
  grade?: FlashcardGrade
  coverRevealed?: boolean
}): MistakeTagCode[] {
  if (input.result !== 'incorrect' && input.result !== 'partial') return []

  const suggestions = new Set<MistakeTagCode>()

  if (input.timedOut || input.format === 'rapid_fire') suggestions.add('rush')
  if (input.timeSpentMs != null && input.timeSpentMs > 0 && input.timeSpentMs < 8000) {
    suggestions.add('rush')
  }
  if (input.format === 'cover_the_options' || input.coverRevealed === false) {
    suggestions.add('misread')
  }
  if (input.grade === 'again' || input.grade === 'hard') suggestions.add('knowledge_gap')

  if (suggestions.size === 0) suggestions.add('knowledge_gap')
  return [...suggestions]
}
