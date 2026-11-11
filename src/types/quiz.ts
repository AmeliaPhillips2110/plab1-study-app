import type {
  AttemptResult,
  PresentationFormat,
  QuestionWithOptions,
  SessionType,
  WeaknessVariant,
} from '@/types/database'

export type FlashcardGrade = 'again' | 'hard' | 'good' | 'easy'

export type SessionSetupConfig = {
  examId: string
  sessionType: SessionType
  presentationFormat: PresentationFormat
  topicId?: string | null
  weaknessVariant?: WeaknessVariant | null
  unseenOnly?: boolean
  questionLimit?: number
  rapidFireSeconds?: number
}

export type QuizAnswerPayload = {
  selectedOptionId?: string | null
  grade?: FlashcardGrade
  revealedOptions?: boolean
  timedOut?: boolean
  coverRevealed?: boolean
}

export type LocalAttempt = {
  questionId: string
  selectedOptionId: string | null
  result: AttemptResult
  responsePayload: QuizAnswerPayload
  timeSpentMs: number | null
}

export type SessionProgress = {
  index: number
  total: number
  correct: number
  incorrect: number
  skipped: number
}

export type BankQuestion = QuestionWithOptions

export const SESSION_TYPE_LABELS: Record<SessionType, string> = {
  topic: 'Topic practice',
  random: 'Random mix',
  weakness: 'Weakness drill',
  spaced_repetition: 'Spaced repetition',
  full_mock: 'Full mock',
  as_many_as_you_can: 'As many as you can',
  flashcard: 'Flashcard deck',
}

export const FORMAT_LABELS: Record<PresentationFormat, string> = {
  sba: 'SBA (options visible)',
  flashcard: 'Flashcard',
  cover_the_options: 'Cover the options',
  rapid_fire: 'Rapid fire',
}

export const WEAKNESS_LABELS: Record<WeaknessVariant, string> = {
  by_topic: 'Weakest topics',
  by_tag: 'Weakest tags',
  recent_mistakes: 'Recent mistakes',
  most_missed: 'Most missed overall',
}

export const STAGE_B_SESSION_TYPES: SessionType[] = [
  'topic',
  'random',
  'weakness',
  'spaced_repetition',
  'flashcard',
]

export const STAGE_B_FORMATS: PresentationFormat[] = [
  'sba',
  'flashcard',
  'cover_the_options',
  'rapid_fire',
]
