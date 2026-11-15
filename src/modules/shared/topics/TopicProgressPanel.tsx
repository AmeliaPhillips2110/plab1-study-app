import { useEffect, useMemo, useState } from 'react'
import { fetchAttemptLog } from '@/modules/shared/analytics/attemptQueries'
import { fetchActiveSbaTopicIds } from '@/lib/pagedQuery'
import { sortTopicsByName } from '@/lib/topics'
import type { Topic } from '@/types/database'

export type TopicStack = {
  correct: number
  incorrect: number
  skipped: number
  unanswered: number
  bank: number
  pctCorrect: number | null
}

type Props = {
  examId: string
  userId: string | null
  topics: Topic[]
  /** Optional wrapper class for the outer section. */
  className?: string
}

export function TopicProgressPanel({ examId, userId, topics, className }: Props) {
  const [topicStacks, setTopicStacks] = useState<Record<string, TopicStack>>({})
  const [loading, setLoading] = useState(true)
  const [error, setError] = useState<string | null>(null)
  const topicsAz = useMemo(() => sortTopicsByName(topics), [topics])

  useEffect(() => {
    let cancelled = false
    void (async () => {
      setLoading(true)
      setError(null)
      const { rows: qRows, error: qErr } = await fetchActiveSbaTopicIds(examId)
      if (cancelled) return
      if (qErr) {
        setError(qErr)
        setTopicStacks({})
        setLoading(false)
        return
      }

      const bankByTopic: Record<string, number> = {}
      for (const q of qRows) {
        if (!q.topic_id) continue
        bankByTopic[q.topic_id] = (bankByTopic[q.topic_id] ?? 0) + 1
      }

      const latestByQuestion = new Map<string, { topicId: string; result: string }>()
      if (userId) {
        const { rows } = await fetchAttemptLog({ userId, examId, limit: 5000 })
        if (cancelled) return
        for (const row of rows) {
          const qid = row.question_id
          const tid = row.questions?.topic_id
          if (!qid || !tid || latestByQuestion.has(qid)) continue
          latestByQuestion.set(qid, { topicId: tid, result: row.result })
        }
      }

      const stacks: Record<string, TopicStack> = {}
      for (const t of topics) {
        const bank = bankByTopic[t.id] ?? 0
        let correct = 0
        let incorrect = 0
        let skipped = 0
        for (const v of latestByQuestion.values()) {
          if (v.topicId !== t.id) continue
          if (v.result === 'correct') correct += 1
          else if (v.result === 'incorrect' || v.result === 'partial') incorrect += 1
          else if (v.result === 'skipped') skipped += 1
        }
        const answered = correct + incorrect + skipped
        const unanswered = bank > 0 ? Math.max(0, bank - answered) : 1
        const graded = correct + incorrect
        stacks[t.id] = {
          correct,
          incorrect,
          skipped,
          unanswered,
          bank,
          pctCorrect: graded > 0 ? Math.round((correct / graded) * 100) : null,
        }
      }
      setTopicStacks(stacks)
      setLoading(false)
    })()
    return () => {
      cancelled = true
    }
  }, [examId, userId, topics])

  return (
    <section className={className ?? 'w-full max-w-5xl rounded-md border border-border bg-surface p-4'}>
      <div className="mb-3 flex flex-wrap items-start justify-between gap-3">
        <h2 className="font-display text-lg font-semibold">Topics</h2>
        <ul className="flex flex-col gap-1 text-xs text-muted sm:items-end">
          <li className="inline-flex items-center gap-1.5">
            <span className="inline-block h-2.5 w-2.5 rounded-sm bg-[#3d8b5a]" aria-hidden />
            Correct
          </li>
          <li className="inline-flex items-center gap-1.5">
            <span className="inline-block h-2.5 w-2.5 rounded-sm bg-[#b54a4a]" aria-hidden />
            Incorrect
          </li>
          <li className="inline-flex items-center gap-1.5">
            <span className="inline-block h-2.5 w-2.5 rounded-sm bg-[#eab308]" aria-hidden />
            Skipped
          </li>
          <li className="inline-flex items-center gap-1.5">
            <span className="inline-block h-2.5 w-2.5 rounded-sm bg-[#737373]" aria-hidden />
            Unanswered
          </li>
        </ul>
      </div>
      {loading ? <p className="text-sm text-muted">Loading topics…</p> : null}
      {error ? <p className="text-sm text-incorrect">{error}</p> : null}
      {!loading && topicsAz.length === 0 ? (
        <p className="text-sm text-muted">No topics yet.</p>
      ) : null}
      {!loading && topicsAz.length > 0 ? (
        <>
          <p className="mb-3 text-xs text-muted">
            {topicsAz.length} specialties · A–Z · empty topics still listed
          </p>
          <ul className="grid grid-cols-1 gap-3 sm:grid-cols-2">
            {topicsAz.map((t) => {
              const s = topicStacks[t.id]
              const total =
                (s?.correct ?? 0) +
                (s?.incorrect ?? 0) +
                (s?.skipped ?? 0) +
                (s?.unanswered ?? 1)
              const pct = (n: number) => (total > 0 ? (n / total) * 100 : 0)
              return (
                <li key={t.id} className="rounded border border-border px-3 py-2">
                  <div className="mb-1.5 flex items-center justify-between gap-2 text-sm">
                    <span className="font-medium">{t.name}</span>
                    <span className="tabular-nums text-muted">
                      {s?.pctCorrect == null ? '—' : `${s.pctCorrect}%`}
                    </span>
                  </div>
                  <div className="flex h-2.5 overflow-hidden rounded-full border border-border/60 bg-[#ece7df]">
                    <div
                      className="h-full"
                      style={{ width: `${pct(s?.correct ?? 0)}%`, backgroundColor: '#3d8b5a' }}
                      title="Correct"
                    />
                    <div
                      className="h-full"
                      style={{ width: `${pct(s?.incorrect ?? 0)}%`, backgroundColor: '#b54a4a' }}
                      title="Incorrect"
                    />
                    <div
                      className="h-full"
                      style={{ width: `${pct(s?.skipped ?? 0)}%`, backgroundColor: '#eab308' }}
                      title="Skipped"
                    />
                    <div
                      className="h-full"
                      style={{ width: `${pct(s?.unanswered ?? 1)}%`, backgroundColor: '#737373' }}
                      title="Unanswered"
                    />
                  </div>
                </li>
              )
            })}
          </ul>
        </>
      ) : null}
    </section>
  )
}
