import { useEffect, useMemo, useState } from 'react'
import { Link } from 'react-router-dom'
import { AppShell } from '@/components/layout/AppShell'
import { Badge } from '@/components/ui/Badge'
import { Button } from '@/components/ui/Button'
import { useAuth } from '@/hooks/useAuth'
import { useExam } from '@/hooks/useExam'
import {
  accuracyGradient,
  countdownTo,
  nextExamDate,
} from '@/lib/examCountdown'
import { fetchAttemptLog } from '@/modules/shared/analytics/attemptQueries'
import { computeTopicAccuracy } from '@/modules/shared/analytics/kpiMetrics'

const OPTIONS = [
  { to: '/study/practice-questions', label: 'Study' },
  { to: '/tests/full-test', label: 'Tests' },
  { to: '/kpis', label: 'KPIs' },
  { to: '/attempts', label: 'Attempts' },
  { to: '/glossary', label: 'Glossary' },
  { to: '/account', label: 'Account' },
]

export function HomePage() {
  const { user, isAdmin } = useAuth()
  const { loading, exam, settings, topics, error, schemaMissing } = useExam()
  const [now, setNow] = useState(() => new Date())
  const [topicAccuracy, setTopicAccuracy] = useState<
    Record<string, { accuracy: number; total: number }>
  >({})

  const examDay = useMemo(() => nextExamDate(now), [now])
  const cd = useMemo(() => countdownTo(examDay, now), [examDay, now])

  useEffect(() => {
    const id = window.setInterval(() => setNow(new Date()), 1000)
    return () => window.clearInterval(id)
  }, [])

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

  return (
    <AppShell title="Start a Study Session">
      <div className="flex flex-col items-center gap-8">
        <div className="flex w-full max-w-3xl flex-wrap items-center justify-center gap-2">
          {OPTIONS.map((opt) => (
            <Link key={opt.to} to={opt.to}>
              <Button variant="primary">{opt.label}</Button>
            </Link>
          ))}
          {isAdmin ? (
            <>
              <Link to="/admin/questions">
                <Button variant="primary">Questions</Button>
              </Link>
              <Link to="/admin/glossary">
                <Button variant="primary">Glossary Edit</Button>
              </Link>
            </>
          ) : null}
        </div>

        {!schemaMissing && error ? (
          <p className="w-full max-w-3xl rounded-md border border-incorrect/40 bg-incorrect/10 px-3 py-2 text-center text-sm text-incorrect">
            {error}
          </p>
        ) : null}

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
          <div className="grid grid-cols-4 gap-2 sm:gap-3">
            {[
              { label: 'Days', value: cd.days },
              { label: 'Hours', value: cd.hours },
              { label: 'Minutes', value: cd.minutes },
              { label: 'Seconds', value: cd.seconds },
            ].map((cell) => (
              <div
                key={cell.label}
                className="rounded-md border border-accent/30 bg-accent-subtle px-2 py-3"
              >
                <p className="font-display text-2xl font-bold text-accent sm:text-3xl">
                  {String(cell.value).padStart(2, '0')}
                </p>
                <p className="mt-1 text-xs uppercase tracking-wide text-muted">{cell.label}</p>
              </div>
            ))}
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
            </div>
          ) : null}
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
