import type { AttemptResult, PresentationFormat } from '@/types/database'
import type { FlashcardGrade } from '@/types/quiz'

/** Canonical mistake tags shown in the Mistake dropdown. */
export const MISTAKE_TAG_DEFS = [
  { tag: 'guessed', label: 'Guessed', hint: 'Chose without a clear reason' },
  { tag: 'did_not_read', label: 'Did not read correctly', hint: 'Missed a key word or detail in the stem' },
  { tag: 'nice_guideline', label: 'NICE Guideline', hint: 'Missed or mixed up NICE guidance' },
  { tag: 'core_knowledge_gap', label: 'Core Knowledge Gap', hint: 'Did not know the core fact' },
  { tag: 'uk_practice_gap', label: 'UK Practice Gap', hint: 'UK pathway / service model unfamiliar' },
  { tag: 'calculation', label: 'Calculation', hint: 'Arithmetic or unit error' },
  { tag: 'rushed', label: 'Rushed', hint: 'Too fast or timed-out pressure' },
  { tag: 'elimination_error', label: 'Elimination Error', hint: 'Ruled out the right option' },
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
  isUkPractice?: boolean
  stemWordCount?: number
}): MistakeTagCode[] {
  if (input.result !== 'incorrect' && input.result !== 'partial') return []

  const suggestions = new Set<MistakeTagCode>()

  if (input.timedOut || input.format === 'rapid_fire') suggestions.add('rushed')
  if (input.timeSpentMs != null && input.timeSpentMs > 0 && input.timeSpentMs < 8000) {
    suggestions.add('rushed')
  }
  if (input.format === 'cover_the_options' || input.coverRevealed === false) {
    suggestions.add('did_not_read')
  }
  if (input.grade === 'again' || input.grade === 'hard') suggestions.add('core_knowledge_gap')
  if (input.isUkPractice) suggestions.add('uk_practice_gap')
  if (input.stemWordCount != null && input.stemWordCount >= 80) {
    suggestions.add('did_not_read')
  }

  if (suggestions.size === 0) suggestions.add('core_knowledge_gap')
  return [...suggestions]
}
