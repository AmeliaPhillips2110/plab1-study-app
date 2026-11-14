import { useEffect, useState } from 'react'
import { Link } from 'react-router-dom'
import { useAuth } from '@/hooks/useAuth'
import { useExam } from '@/hooks/useExam'
import {
  fetchDueTodayBreakdown,
  formatDueTodayCounts,
  type DueTodayBreakdown,
} from '@/modules/shared/quiz-engine/dueTodayQueue'

type Props = {
  /** Compact = practice hub strip; default = home block. */
  compact?: boolean
}

const EMPTY: DueTodayBreakdown = { daily: 0, flagged: 0, weak: 0, unique: 0 }

export function DueTodayPanel({ compact = false }: Props) {
  const { user } = useAuth()
  const { exam } = useExam()
  const [breakdown, setBreakdown] = useState<DueTodayBreakdown>(EMPTY)
  const [loading, setLoading] = useState(true)
  const [error, setError] = useState<string | null>(null)

  useEffect(() => {
    if (!exam || !user) {
      setBreakdown(EMPTY)
      setLoading(false)
      return
    }
    let cancelled = false
    setLoading(true)
    void (async () => {
      const { breakdown: next, error: err } = await fetchDueTodayBreakdown(exam.id, user.id)
      if (cancelled) return
      setBreakdown(next)
      setError(err)
      setLoading(false)
    })()
    return () => {
      cancelled = true
    }
  }, [exam, user])

  if (!user) {
    return (
      <section
        className={
          compact
            ? 'rounded-md border border-border bg-surface px-4 py-3'
            : 'w-full max-w-5xl rounded-md border border-accent/25 bg-accent-subtle/60 px-4 py-5'
        }
        aria-label="Due today"
      >
        <p className="text-sm text-muted">Sign in to see what is due today.</p>
      </section>
    )
  }

  const empty = !loading && breakdown.unique === 0 && !error

  return (
    <section
      className={
        compact
          ? 'rounded-md border border-border bg-surface px-4 py-3'
          : 'w-full max-w-5xl rounded-md border border-accent/25 bg-gradient-to-br from-accent-subtle via-surface to-accent-subtle/40 px-4 py-5 sm:px-5'
      }
      aria-label="Due today"
    >
      <div className="flex flex-wrap items-end justify-between gap-3">
        <div className="min-w-0 flex-1">
          <h2 className="font-display text-lg font-semibold text-accent sm:text-xl">Due today</h2>
          {loading ? (
            <p className="mt-1 text-sm text-muted">Checking your queue…</p>
          ) : error ? (
            <p className="mt-1 text-sm text-incorrect">{error}</p>
          ) : empty ? (
            <p className="mt-1 text-sm text-muted">
              Nothing due — no spaced reviews, flags, or weak-topic items waiting.
            </p>
          ) : (
            <p className="mt-1 text-sm text-muted">
              <span className="tabular-nums font-medium text-fg">
                {formatDueTodayCounts(breakdown)}
              </span>
              <span className="text-muted">
                {' '}
                · {breakdown.unique} unique in queue
              </span>
            </p>
          )}
        </div>
        {!loading && !error && !empty ? (
          <Link
            to="/study/due-today"
            className="inline-flex shrink-0 items-center rounded-md bg-accent px-4 py-2 text-sm font-semibold text-white transition hover:bg-accent-hover"
          >
            Start
          </Link>
        ) : null}
      </div>
    </section>
  )
}
