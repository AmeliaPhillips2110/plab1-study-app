import { useEffect, useMemo, useState } from 'react'
import { AppShell } from '@/components/layout/AppShell'
import { EmptyBankHint } from '@/components/EmptyBankHint'
import { Badge } from '@/components/ui/Badge'
import { useAuth } from '@/hooks/useAuth'
import { useExam } from '@/hooks/useExam'
import {
  accuracyGradient,
  countdownTo,
  nextExamDate,
} from '@/lib/examCountdown'
import { fetchAttemptLog } from '@/modules/shared/analytics/attemptQueries'
import { computeTopicAccuracy } from '@/modules/shared/analytics/kpiMetrics'
import { countActiveSba } from '@/modules/shared/quiz-engine/mock/mockPersist'

export function HomePage() {
  const { user } = useAuth()
  const { loading, exam, settings, topics, error, schemaMissing } = useExam()
  const [bankCount, setBankCount] = useState<number | null>(null)
  const [topicAccuracy, setTopicAccuracy] = useState<
    Record<string, { accuracy: number; total: number }>
  >({})

  const examDay = useMemo(() => nextExamDate(new Date()), [])
  const daysLeft = useMemo(() => countdownTo(examDay, new Date()).days, [examDay])

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
    if (!user || !exam) {
      setTopicAccuracy({})
      return
    }
    void (async () => {
      const { rows } = await fetchAttemptLog({ userId: user.id, examId: exam.id, limit: 1000 })
      const rowsWithTopics = computeTopicAccuracy(rows, topics)
      const map: Record<string, { accuracy: number; total: number }> = {}
      for (const t of rowsWithTopics) {
        map[t.topicId] = { accuracy: t.accuracy, total: t.total }
      }
      setTopicAccuracy(map)
    })()
  }, [user, exam, topics])

  const examMissing = !loading && (!exam || schemaMissing)
  const bankEmpty = Boolean(exam) && bankCount === 0

  return (
    <AppShell title="Start a Study Session">
      <div className="flex flex-col items-center gap-8">
        {!schemaMissing && error ? (
          <p className="w-full max-w-3xl rounded-md border border-incorrect/40 bg-incorrect/10 px-3 py-2 text-center text-sm text-incorrect">
            {error}
          </p>
        ) : null}

        <EmptyBankHint examMissing={examMissing} bankEmpty={bankEmpty} />

        <section className="w-full max-w-3xl rounded-md border border-border bg-surface p-5 text-center">
          <h2 className="mb-1 font-display text-lg font-semibold">Exam Countdown</h2>
          <p className="mb-4 text-sm text-muted">
            Next exam date:{' '}
            {examDay.toLocaleDateString(undefined, {
              weekday: 'long',
              year: 'numeric',
              month: 'long',
              day: 'numeric',
            })}
          </p>
          <div className="mx-auto max-w-xs rounded-md border border-accent/30 bg-accent-subtle px-4 py-5">
            <p className="font-display text-4xl font-bold text-accent sm:text-5xl">{daysLeft}</p>
            <p className="mt-1 text-xs uppercase tracking-wide text-muted">
              {daysLeft === 1 ? 'Day' : 'Days'} remaining
            </p>
          </div>
        </section>

        <section className="w-full max-w-3xl rounded-md border border-border bg-surface p-4 text-center">
          <h2 className="mb-2 font-display text-lg font-semibold">Exam</h2>
          {loading ? (
            <p className="text-sm text-muted">Loading exam…</p>
          ) : exam ? (
            <div className="flex flex-col items-center gap-2 text-sm">
              <div className="flex flex-wrap items-center justify-center gap-2">
                <span className="font-medium">{exam.name}</span>
                <Badge tone="accent">{exam.slug}</Badge>
                {exam.is_active ? <Badge tone="correct">Active</Badge> : <Badge>Inactive</Badge>}
              </div>
              {exam.description ? <p className="text-muted">{exam.description}</p> : null}
              <p className="text-muted">
                Pass mark:{' '}
                <span className="font-medium text-fg">{settings?.pass_mark_percent ?? 65}%</span>
                {' · '}
                Mock default {settings?.default_mock_question_count ?? 180} Q /{' '}
                {settings?.default_mock_minutes ?? 180} min
              </p>
              {bankCount != null ? (
                <p className="text-muted">
                  Active SBA bank:{' '}
                  <span className="font-medium text-fg">{bankCount}</span>
                </p>
              ) : null}
            </div>
          ) : (
            <p className="text-sm text-muted">Exam not loaded yet.</p>
          )}
        </section>

        <section className="w-full max-w-3xl rounded-md border border-border bg-surface p-4 text-center">
          <h2 className="mb-2 font-display text-lg font-semibold">Topics</h2>
          <p className="mb-3 text-xs text-muted">
            % Correct bands: &gt;65% green · 50–65% yellow · 40–50% orange · &lt;40% red
          </p>
          {loading ? (
            <p className="text-sm text-muted">Loading topics…</p>
          ) : topics.length === 0 ? (
            <p className="text-sm text-muted">No topics yet.</p>
          ) : (
            <ul className="flex flex-col gap-2 text-left">
              {topics.map((t) => {
                const stats = topicAccuracy[t.id]
                const pct = stats && stats.total > 0 ? stats.accuracy : null
                return (
                  <li key={t.id} className="rounded border border-border px-3 py-2">
                    <div className="mb-1.5 flex items-center justify-between gap-2 text-sm">
                      <span className="font-medium">{t.name}</span>
                      <span className="tabular-nums text-muted">
                        {pct == null ? '—' : `${pct}%`}
                        {stats && stats.total > 0 ? (
                          <span className="ml-1 text-xs">({stats.total})</span>
                        ) : null}
                      </span>
                    </div>
                    <div className="h-2.5 overflow-hidden rounded-full bg-border/40">
                      <div
                        className="h-full rounded-full transition-all"
                        style={{
                          width: `${pct == null ? 0 : Math.min(100, Math.max(8, pct))}%`,
                          background: accuracyGradient(pct),
                        }}
                      />
                    </div>
                  </li>
                )
              })}
            </ul>
          )}
        </section>
      </div>
    </AppShell>
  )
}
