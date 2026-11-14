import type { PresentationFormat, SessionType, WeaknessVariant } from '@/types/database'
import type { TimedMode } from '@/types/quiz'

export type StudyModeDef = {
  slug: string
  title: string
  description: string
  sessionType: SessionType
  presentationFormat?: PresentationFormat
  weaknessVariant?: WeaknessVariant
  unseenOnly?: boolean
  openEnded?: boolean
  flaggedOnly?: boolean
  dailyQueue?: boolean
  dueTodayQueue?: boolean
  /** Hidden from hub grids; reachable via deep link (e.g. redo-wrongs). */
  hidden?: boolean
  autostart?: boolean
  questionLimit?: number
  longStemOnly?: boolean
  /** Hub/dropdown only — uses a dedicated page rather than SessionRunner autostart. */
  hubOnly?: boolean
}

export type TestModeDef = {
  slug: string
  title: string
  description: string
  uiMode: TimedMode | 'themed'
}

/** Modes shown in Practice dropdown + Practice hub (Topics is separate page). */
export const STUDY_MODES: StudyModeDef[] = [
  {
    slug: 'topics',
    title: 'Topics',
    description: 'Pick a specialty topic and practise SBAs for that theme.',
    sessionType: 'topic',
    presentationFormat: 'sba',
    hubOnly: true,
  },
  {
    slug: 'flashcards',
    title: 'Flashcards',
    description: 'Flip cards and self-grade with Again / Hard / Good / Easy.',
    sessionType: 'flashcard',
    presentationFormat: 'flashcard',
    autostart: true,
  },
  {
    slug: 'open-quiz',
    title: 'Open Quiz',
    description: 'Untimed free practice — finish whenever you like.',
    sessionType: 'random',
    presentationFormat: 'sba',
    openEnded: true,
    autostart: true,
    questionLimit: 40,
  },
  {
    slug: 'new-questions',
    title: 'New Questions',
    description: 'Unseen items from the bank you have not answered yet.',
    sessionType: 'random',
    presentationFormat: 'sba',
    unseenOnly: true,
    openEnded: true,
    autostart: true,
    questionLimit: 10_000,
  },
  {
    slug: 'due-today',
    title: 'Due Today',
    description: 'One queue: due daily reviews, flagged revise, and weak-topic items.',
    sessionType: 'spaced_repetition',
    presentationFormat: 'sba',
    dueTodayQueue: true,
    autostart: true,
    questionLimit: 40,
  },
  {
    slug: 'daily-questions',
    title: 'Daily Questions',
    description:
      'Spaced queue — due reviews first (missed days roll forward), mixed with recent mistakes.',
    sessionType: 'spaced_repetition',
    presentationFormat: 'sba',
    dailyQueue: true,
    autostart: true,
    questionLimit: 30,
  },
  {
    slug: 'revise-flagged',
    title: 'Revise Flagged Questions',
    description: 'Revisit only items you flagged for review in Practice or Tests.',
    sessionType: 'random',
    presentationFormat: 'sba',
    flaggedOnly: true,
    autostart: true,
    questionLimit: 40,
  },
  {
    slug: 'redo-wrongs',
    title: 'Redo Wrongs',
    description: 'Follow-up session with only the incorrect items from your last attempt.',
    sessionType: 'random',
    presentationFormat: 'sba',
    hidden: true,
    autostart: true,
    questionLimit: 40,
  },
  {
    slug: 'timed-drill',
    title: 'Timed Drill',
    description: 'Rapid-fire SBAs with a short countdown per item.',
    sessionType: 'random',
    presentationFormat: 'rapid_fire',
    autostart: true,
  },
  {
    slug: 'spaced-review',
    title: 'Spaced Review',
    description: 'Previously wrong items, or wrong then correct fewer than 3 times since.',
    sessionType: 'spaced_repetition',
    presentationFormat: 'sba',
    autostart: true,
  },
  {
    slug: 'most-missed',
    title: 'Most Missed',
    description: 'Focus on questions you get wrong most often overall.',
    sessionType: 'weakness',
    weaknessVariant: 'most_missed',
    presentationFormat: 'sba',
    autostart: true,
  },
  {
    slug: 'error-tests',
    title: 'Error Tests',
    description: 'Revisit your recent mistakes until they stick.',
    sessionType: 'weakness',
    weaknessVariant: 'recent_mistakes',
    presentationFormat: 'sba',
    autostart: true,
  },
  {
    slug: 'long-questions',
    title: 'Long Questions',
    description: 'Longer stems (≥80 words) for reading stamina practice.',
    sessionType: 'random',
    presentationFormat: 'sba',
    longStemOnly: true,
    autostart: true,
  },
]

export const TEST_MODES: TestModeDef[] = [
  {
    slug: 'full-test',
    title: 'Full Test',
    description: 'Timed mock with a question target under exam conditions.',
    uiMode: 'full_mock',
  },
  {
    slug: 'unlimited',
    title: 'Unlimited',
    description: 'Work through the bank freely and finish when ready.',
    uiMode: 'as_many_as_you_can',
  },
  {
    slug: 'themed-test',
    title: 'Themed Test',
    description: 'Timed set filtered by topic theme or weakness.',
    uiMode: 'themed',
  },
]

export function studyModeBySlug(slug: string): StudyModeDef | undefined {
  return STUDY_MODES.find((m) => m.slug === slug)
}

export function testModeBySlug(slug: string): TestModeDef | undefined {
  return TEST_MODES.find((m) => m.slug === slug)
}
