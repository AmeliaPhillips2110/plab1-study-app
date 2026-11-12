import type { PresentationFormat, SessionType, WeaknessVariant } from '@/types/database'
import type { TimedMode } from '@/types/quiz'

export type StudyModeDef = {
  slug: string
  title: string
  sessionType: SessionType
  presentationFormat?: PresentationFormat
  weaknessVariant?: WeaknessVariant
  unseenOnly?: boolean
  openEnded?: boolean
  autostart?: boolean
  questionLimit?: number
}

export type TestModeDef = {
  slug: string
  title: string
  uiMode: TimedMode | 'themed'
}

export const STUDY_MODES: StudyModeDef[] = [
  {
    slug: 'practice-questions',
    title: 'Practice Questions',
    sessionType: 'topic',
    presentationFormat: 'sba',
  },
  {
    slug: 'flashcards',
    title: 'Flashcards',
    sessionType: 'flashcard',
    presentationFormat: 'flashcard',
    autostart: true,
  },
  {
    slug: 'open-quiz',
    title: 'Open Quiz',
    sessionType: 'random',
    presentationFormat: 'sba',
    openEnded: true,
    autostart: true,
    questionLimit: 40,
  },
  {
    slug: 'new-questions',
    title: 'New Questions',
    sessionType: 'random',
    presentationFormat: 'sba',
    unseenOnly: true,
    autostart: true,
  },
  {
    slug: 'weak-topics',
    title: 'Weak Topics',
    sessionType: 'weakness',
    weaknessVariant: 'by_topic',
    presentationFormat: 'sba',
    autostart: true,
  },
  {
    slug: 'timed-drill',
    title: 'Timed Drill',
    sessionType: 'random',
    presentationFormat: 'rapid_fire',
    autostart: true,
  },
  {
    slug: 'spaced-review',
    title: 'Spaced Review',
    sessionType: 'spaced_repetition',
    presentationFormat: 'sba',
    autostart: true,
  },
  {
    slug: 'most-missed',
    title: 'Most Missed',
    sessionType: 'weakness',
    weaknessVariant: 'most_missed',
    presentationFormat: 'sba',
    autostart: true,
  },
  {
    slug: 'error-tests',
    title: 'Error Tests',
    sessionType: 'weakness',
    weaknessVariant: 'recent_mistakes',
    presentationFormat: 'sba',
    autostart: true,
  },
]

export const TEST_MODES: TestModeDef[] = [
  { slug: 'full-test', title: 'Full Test', uiMode: 'full_mock' },
  { slug: 'unlimited', title: 'Unlimited', uiMode: 'as_many_as_you_can' },
  { slug: 'themed-test', title: 'Themed Test', uiMode: 'themed' },
]

export function studyModeBySlug(slug: string): StudyModeDef | undefined {
  return STUDY_MODES.find((m) => m.slug === slug)
}

export function testModeBySlug(slug: string): TestModeDef | undefined {
  return TEST_MODES.find((m) => m.slug === slug)
}
