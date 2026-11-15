import { useEffect, useMemo, useState } from 'react'
import { Link } from 'react-router-dom'
import { AppShell } from '@/components/layout/AppShell'
import { EmptyBankHint } from '@/components/EmptyBankHint'
import { useAuth } from '@/hooks/useAuth'
import { useExam } from '@/hooks/useExam'
import { countdownTo, nextExamDate } from '@/lib/examCountdown'
import { computeStudyStreak } from '@/lib/streak'
import { fetchAttemptLog } from '@/modules/shared/analytics/attemptQueries'
import { formatDurationHours } from '@/modules/shared/analytics/kpiMetrics'
import { TopicProgressPanel } from '@/modules/shared/topics/TopicProgressPanel'
import { countActiveSba } from '@/modules/shared/quiz-engine/mock/mockPersist'

export function HomePage() {
  const { user } = useAuth()
  const { loading, exam, topics, error, schemaMissing } = useExam()
  const [bankCount, setBankCount] = useState<number | null>(null)
  const [timeSpentMs, setTimeSpentMs] = useState(0)
  const [studyStreak, setStudyStreak] = useState(0)

  const daysLeft = useMemo(() => countdownTo(nextExamDate(new Date()), new Date()).days, [])

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

        {exam ? (
          <div className="w-full max-w-5xl">
            <div className="mb-2 flex justify-end">
              <Link to="/study/topics" className="text-sm text-accent hover:underline">
                Practise by topic →
              </Link>
            </div>
            <TopicProgressPanel examId={exam.id} userId={user?.id ?? null} topics={topics} />
          </div>
        ) : loading ? (
          <p className="text-sm text-muted">Loading topics…</p>
        ) : (
          <p className="text-sm text-muted">
            No topics yet. Run <code className="text-xs">seed_topics_expand.sql</code> in Supabase,
            then hard-refresh.
          </p>
        )}
      </div>
    </AppShell>
  )
}
