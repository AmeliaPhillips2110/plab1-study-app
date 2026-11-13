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
  /** Untimed open quiz — track time per question; Finish ends early. */
  openEnded?: boolean
  /** Only questions the user previously flagged. */
  flaggedOnly?: boolean
  /** Daily Questions queue: due SR reviews + recent mistakes (missed days roll forward). */
  dailyQueue?: boolean
  /** Stage f filters */
  ukPracticeOnly?: boolean
  patientCentredOnly?: boolean
  longStemOnly?: boolean
  minStemWords?: number
}

export type QuizAnswerPayload = {
  selectedOptionId?: string | null
  grade?: FlashcardGrade
  revealedOptions?: boolean
  timedOut?: boolean
  coverRevealed?: boolean
  mistakeTags?: string[]
  mistakeNote?: string | null
  /** Flag for later review (Practice SBA/flashcard + Tests). */
  flagged?: boolean
  /** How many times the selected option changed before Submit. */
  answerChanges?: number
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
  topic: 'Topic Practice',
  random: 'Random Mix',
  weakness: 'Weakness Drill',
  spaced_repetition: 'Spaced Repetition',
  full_mock: 'Full Mock',
  as_many_as_you_can: 'As Many As You Can',
  flashcard: 'Flashcard Deck',
}

export const FORMAT_LABELS: Record<PresentationFormat, string> = {
  sba: 'SBA (Options Visible)',
  flashcard: 'Flashcard',
  cover_the_options: 'Cover The Options',
  rapid_fire: 'Rapid Fire',
}

export const WEAKNESS_LABELS: Record<WeaknessVariant, string> = {
  by_topic: 'Weakest Topics',
  by_tag: 'Weakest Tags',
  recent_mistakes: 'Recent Mistakes',
  most_missed: 'Most Missed Overall',
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

export type TimedMode = 'full_mock' | 'as_many_as_you_can'

export type MockStartConfig = {
  examId: string
  mode: TimedMode
  targetQuestionCount: number
  timeLimitSec: number
  /** When bank is smaller than target, use all available SBAs. */
  useAvailableBank: boolean
}

export type PaceSample = {
  elapsedSec: number
  answeredCount: number
}

export type MockProgressState = {
  version: 1
  mode: TimedMode
  questionIds: string[]
  answers: Record<string, string>
  flagged: string[]
  currentIndex: number
  targetCount: number
  timeLimitSec: number
  deadlineAt: string
  startedAt: string
  paceSamples: PaceSample[]
  autosavedAt: string
}

export type MockReviewItem = {
  question: QuestionWithOptions
  selectedOptionId: string | null
  result: AttemptResult
  flagged: boolean
}
