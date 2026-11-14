import { useEffect, useMemo, useState } from 'react'
import { Link } from 'react-router-dom'
import { AppShell } from '@/components/layout/AppShell'
import { EmptyBankHint } from '@/components/EmptyBankHint'
import { useAuth } from '@/hooks/useAuth'
import { useExam } from '@/hooks/useExam'
import { countdownTo, nextExamDate } from '@/lib/examCountdown'
import { computeStudyStreak } from '@/lib/streak'
import { supabase } from '@/lib/supabase'
import { sortTopicsByName } from '@/lib/topics'
import { fetchAttemptLog } from '@/modules/shared/analytics/attemptQueries'
import { formatDurationHours } from '@/modules/shared/analytics/kpiMetrics'
import { DueTodayPanel } from '@/modules/shared/quiz-engine/DueTodayPanel'
import { countActiveSba } from '@/modules/shared/quiz-engine/mock/mockPersist'

type TopicStack = {
  correct: number
  incorrect: number
  skipped: number
  unanswered: number
  bank: number
  pctCorrect: number | null
}

export function HomePage() {
  const { user } = useAuth()
  const { loading, exam, topics, error, schemaMissing } = useExam()
  const [bankCount, setBankCount] = useState<number | null>(null)
  const [topicStacks, setTopicStacks] = useState<Record<string, TopicStack>>({})
  const [timeSpentMs, setTimeSpentMs] = useState(0)
  const [studyStreak, setStudyStreak] = useState(0)

  const daysLeft = useMemo(() => countdownTo(nextExamDate(new Date()), new Date()).days, [])
  /** Always show every seeded topic (including 0-question banks), A→Z. */
  const topicsAz = useMemo(() => sortTopicsByName(topics), [topics])

  useEffect(() => {
    if (!exam) {
      setBankCount(null)
      return
    }
    void (async () => {
      setBankCount(await countActiveSba(exam.id))
    })()
  }, [exam])

  useEffect(() => {
    if (!exam || !user) {
      setTimeSpentMs(0)
      setStudyStreak(0)
      return
    }
    void (async () => {
      const { rows } = await fetchAttemptLog({ userId: user.id, examId: exam.id, limit: 5000 })
      const ms = rows.reduce((sum, r) => sum + (r.time_spent_ms ?? 0), 0)
      setTimeSpentMs(ms)
      setStudyStreak(
        computeStudyStreak(rows.map((r) => r.answered_at).filter(Boolean) as string[]),
      )
    })()
  }, [exam, user])

  useEffect(() => {
    if (!exam) {
      setTopicStacks({})
      return
    }
    void (async () => {
      const { data: qRows } = await supabase
        .from('questions')
        .select('id, topic_id')
        .eq('exam_id', exam.id)
        .eq('is_active', true)
        .eq('question_type', 'sba')

      const bankByTopic: Record<string, number> = {}
      for (const q of qRows ?? []) {
        const tid = (q as { topic_id: string | null }).topic_id
        if (!tid) continue
        bankByTopic[tid] = (bankByTopic[tid] ?? 0) + 1
      }

      const latestByQuestion = new Map<string, { topicId: string; result: string }>()
      if (user) {
        const { rows } = await fetchAttemptLog({ userId: user.id, examId: exam.id, limit: 2000 })
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
        // Empty banks still render as fully unanswered (grey) — never hide the topic.
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
    })()
  }, [user, exam, topics])

  const examMissing = !loading && (!exam || schemaMissing)
  const bankEmpty = Boolean(exam) && bankCount === 0

  return (
    <AppShell title="Home">
      <div className="flex flex-col items-center gap-8">
        {!schemaMissing && error ? (
          <p className="w-full max-w-5xl rounded-md border border-incorrect/40 bg-incorrect/10 px-3 py-2 text-center text-sm text-incorrect">
            {error}
          </p>
        ) : null}

        <EmptyBankHint examMissing={examMissing} bankEmpty={bankEmpty} />

        <section className="w-full max-w-5xl" aria-label="Study overview">
          <div className="grid w-full gap-3 sm:grid-cols-3">
            <div className="rounded-md border border-accent/30 bg-accent-subtle px-4 py-5 text-center">
              <p className="font-display text-4xl font-bold text-accent sm:text-5xl">{daysLeft}</p>
              <p className="mt-1 text-xs uppercase tracking-wide text-muted">
                {daysLeft === 1 ? 'Day' : 'Days'} remaining
              </p>
            </div>
            <div className="rounded-md border border-accent/30 bg-accent-subtle px-4 py-5 text-center">
              <p className="font-display text-4xl font-bold text-accent sm:text-5xl">
                {user ? formatDurationHours(timeSpentMs) : '—'}
              </p>
              <p className="mt-1 text-xs uppercase tracking-wide text-muted">Time Spent</p>
            </div>
            <div className="rounded-md border border-accent/30 bg-accent-subtle px-4 py-5 text-center">
              <p className="font-display text-4xl font-bold text-accent sm:text-5xl">
                {user ? studyStreak : '—'}
              </p>
              <p className="mt-1 text-xs uppercase tracking-wide text-muted">Study streak</p>
            </div>
          </div>
        </section>

        <DueTodayPanel />

        <section className="w-full max-w-5xl rounded-md border border-border bg-surface p-4">
          <div className="mb-3 flex flex-wrap items-start justify-between gap-3">
            <div className="flex flex-wrap items-center gap-x-3 gap-y-1">
              <h2 className="font-display text-lg font-semibold">Topics</h2>
              <Link to="/study/topics" className="text-sm text-accent hover:underline">
                Practise by topic →
              </Link>
            </div>
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
          {loading ? (
            <p className="text-sm text-muted">Loading topics…</p>
          ) : topicsAz.length === 0 ? (
            <p className="text-sm text-muted">
              No topics yet. Run <code className="text-xs">seed_topics_expand.sql</code> in
              Supabase, then hard-refresh.
            </p>
          ) : (
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
          )}
        </section>
      </div>
    </AppShell>
  )
}
