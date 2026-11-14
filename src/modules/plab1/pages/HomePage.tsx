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
import { TopicMasteryRings } from '@/modules/shared/analytics/TopicMasteryRings'
import {
  computeTopicMastery,
  type TopicMastery,
} from '@/modules/shared/analytics/topicMastery'
import { countActiveSba } from '@/modules/shared/quiz-engine/mock/mockPersist'

export function HomePage() {
  const { user } = useAuth()
  const { loading, exam, settings, topics, error, schemaMissing } = useExam()
  const [bankCount, setBankCount] = useState<number | null>(null)
  const [mastery, setMastery] = useState<TopicMastery[]>([])
  const [masteryLoading, setMasteryLoading] = useState(false)
  const [timeSpentMs, setTimeSpentMs] = useState(0)
  const [studyStreak, setStudyStreak] = useState(0)

  const daysLeft = useMemo(() => countdownTo(nextExamDate(new Date()), new Date()).days, [])
  const topicsAz = useMemo(() => sortTopicsByName(topics), [topics])
  const passMark = Number(settings?.pass_mark_percent ?? 65)

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
      setMastery([])
      return
    }
    void (async () => {
      setMasteryLoading(true)
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

      let attempts: Awaited<ReturnType<typeof fetchAttemptLog>>['rows'] = []
      if (user) {
        const res = await fetchAttemptLog({ userId: user.id, examId: exam.id, limit: 2000 })
        attempts = res.rows
      }

      setMastery(
        computeTopicMastery({
          attempts,
          topics: topicsAz,
          bankByTopic,
          passMarkPercent: passMark,
        }),
      )
      setMasteryLoading(false)
    })()
  }, [user, exam, topicsAz, passMark])

  const examMissing = !loading && (!exam || schemaMissing)
  const bankEmpty = Boolean(exam) && bankCount === 0
  const statusCounts = useMemo(() => {
    const c = { ready: 0, close: 0, weak: 0 }
    for (const m of mastery) c[m.status] += 1
    return c
  }, [mastery])

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

        <section className="w-full max-w-5xl rounded-md border border-border bg-surface p-4">
          <div className="mb-3 flex flex-wrap items-start justify-between gap-3">
            <div className="flex flex-wrap items-center gap-x-3 gap-y-1">
              <h2 className="font-display text-lg font-semibold">Topic mastery</h2>
              <Link to="/study/topics" className="text-sm text-accent hover:underline">
                Practise by topic →
              </Link>
            </div>
            {mastery.length > 0 ? (
              <p className="text-xs text-muted">
                Pass {passMark}% · {statusCounts.ready} ready · {statusCounts.close} close ·{' '}
                {statusCounts.weak} weak
              </p>
            ) : null}
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
                {topicsAz.length} specialties · coverage + accuracy vs {passMark}% · tap a ring to
                start
              </p>
              <TopicMasteryRings items={mastery} loading={masteryLoading} size="sm" />
            </>
          )}
        </section>
      </div>
    </AppShell>
  )
}
