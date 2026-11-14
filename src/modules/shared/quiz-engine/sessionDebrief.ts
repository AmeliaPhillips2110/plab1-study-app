import { MISTAKE_TAG_LABELS, type MistakeTagCode } from '@/features/mistakes/tags'
import type { QuestionWithOptions } from '@/types/database'
import type { LocalAttempt } from '@/types/quiz'

export type SessionTakeaway = {
  key: 'topics' | 'tags' | 'pass'
  text: string
}

export type SessionDebriefModel = {
  takeaways: SessionTakeaway[]
  wrongQuestionIds: string[]
  percent: number
  passMark: number
  deltaPts: number
  passed: boolean
}

type SoftAttempt = {
  questionId: string
  result: string
  mistakeTags?: string[] | null
}

export function buildSessionDebrief(args: {
  attempts: SoftAttempt[] | LocalAttempt[]
  questions: QuestionWithOptions[]
  topicNameById: Record<string, string>
  percent: number
  passMark?: number
}): SessionDebriefModel {
  const passMark = args.passMark ?? 65
  const percent = Math.round(args.percent * 10) / 10
  const deltaPts = Math.round((percent - passMark) * 10) / 10
  const passed = percent >= passMark

  const topicByQ = new Map(args.questions.map((q) => [q.id, q.topic_id]))
  const wrongs = args.attempts.filter(
    (a) => a.result === 'incorrect' || a.result === 'partial',
  )
  const wrongQuestionIds = [...new Set(wrongs.map((a) => a.questionId))]

  // 1) Topic misses
  const missByTopic = new Map<string, number>()
  for (const a of wrongs) {
    const tid = topicByQ.get(a.questionId)
    const name = tid ? args.topicNameById[tid] ?? 'Untagged' : 'Untagged'
    missByTopic.set(name, (missByTopic.get(name) ?? 0) + 1)
  }
  const topTopics = [...missByTopic.entries()].sort((a, b) => b[1] - a[1])
  let topicsText: string
  if (wrongs.length === 0) {
    topicsText = 'No topic misses this session.'
  } else if (topTopics.length === 1) {
    const [name, n] = topTopics[0]!
    topicsText = `Missed most in ${name} (${n}).`
  } else {
    const [a, b] = topTopics
    topicsText = `Missed most in ${a![0]} (${a![1]}) · then ${b![0]} (${b![1]}).`
  }

  // 2) Recurring mistake tags (if any)
  const tagCounts = new Map<string, number>()
  for (const a of args.attempts) {
    const tags =
      'mistakeTags' in a && a.mistakeTags
        ? a.mistakeTags
        : 'responsePayload' in a
          ? ((a as LocalAttempt).responsePayload.mistakeTags ?? [])
          : []
    for (const tag of tags) {
      tagCounts.set(tag, (tagCounts.get(tag) ?? 0) + 1)
    }
  }
  const topTags = [...tagCounts.entries()].sort((a, b) => b[1] - a[1])
  let tagsText: string
  if (topTags.length === 0) {
    tagsText =
      wrongs.length > 0
        ? 'No mistake tags logged — tag a miss next time to spot patterns.'
        : 'No recurring mistake tags.'
  } else {
    const labelled = topTags.slice(0, 2).map(([tag, n]) => {
      const label =
        (MISTAKE_TAG_LABELS as Record<string, string>)[tag as MistakeTagCode] ?? tag
      return `${label} (${n})`
    })
    tagsText =
      labelled.length === 1
        ? `Recurring tag: ${labelled[0]}.`
        : `Recurring tags: ${labelled.join(' · ')}.`
  }

  // 3) Accuracy vs pass mark
  const passText = passed
    ? `${percent}% — ${deltaPts === 0 ? 'at' : `${deltaPts} pts above`} the ${passMark}% pass mark.`
    : `${percent}% — ${Math.abs(deltaPts)} pts below the ${passMark}% pass mark.`

  return {
    takeaways: [
      { key: 'topics', text: topicsText },
      { key: 'tags', text: tagsText },
      { key: 'pass', text: passText },
    ],
    wrongQuestionIds,
    percent,
    passMark,
    deltaPts,
    passed,
  }
}

export const REDO_QUESTION_IDS_KEY = 'plaboratory-redo-question-ids'

export function stashRedoQuestionIds(ids: string[]): void {
  try {
    sessionStorage.setItem(REDO_QUESTION_IDS_KEY, JSON.stringify(ids))
  } catch {
    /* ignore quota */
  }
}

export function takeRedoQuestionIds(): string[] {
  try {
    const raw = sessionStorage.getItem(REDO_QUESTION_IDS_KEY)
    sessionStorage.removeItem(REDO_QUESTION_IDS_KEY)
    if (!raw) return []
    const parsed = JSON.parse(raw) as unknown
    if (!Array.isArray(parsed)) return []
    return parsed.filter((x): x is string => typeof x === 'string' && x.length > 0)
  } catch {
    return []
  }
}
