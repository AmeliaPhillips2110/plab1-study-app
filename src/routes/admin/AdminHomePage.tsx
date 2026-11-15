import { useEffect, useState } from 'react'
import { Link } from 'react-router-dom'
import { AppShell } from '@/components/layout/AppShell'
import { useExam } from '@/hooks/useExam'
import { countActiveSba } from '@/modules/shared/quiz-engine/mock/mockPersist'

export function AdminHomePage() {
  const { loading, exam, error, schemaMissing } = useExam()
  const [bankCount, setBankCount] = useState<number | null>(null)

  useEffect(() => {
    if (!exam) {
      setBankCount(null)
      return
    }
    void (async () => {
      setBankCount(await countActiveSba(exam.id))
    })()
  }, [exam])

  return (
    <AppShell title="Admin">
      <div className="flex flex-col gap-4">
        <p className="max-w-2xl text-sm text-muted">
          Manage the question bank, glossary, pass mark, users, and opted-in peer comparison.
        </p>

        <div className="max-w-sm rounded-md border border-accent/30 bg-accent-subtle px-4 py-4">
          <p className="font-display text-3xl font-bold text-accent">
            {loading || bankCount === null ? '…' : bankCount.toLocaleString()}
          </p>
          <p className="mt-1 text-xs uppercase tracking-wide text-muted">Questions in bank</p>
          {!loading && !exam ? (
            <p className="mt-2 text-xs text-muted">No exam loaded yet — count appears after setup.</p>
          ) : null}
          {!schemaMissing && error ? (
            <p className="mt-2 text-xs text-incorrect">{error}</p>
          ) : null}
        </div>

        <ul className="grid gap-3 sm:grid-cols-2 lg:grid-cols-3">
          <li>
            <Link
              to="/admin/questions"
              className="block rounded-md border border-border bg-surface px-4 py-3 text-sm font-medium hover:border-accent"
            >
              Questions
            </Link>
          </li>
          <li>
            <Link
              to="/admin/glossary"
              className="block rounded-md border border-border bg-surface px-4 py-3 text-sm font-medium hover:border-accent"
            >
              Glossary editor
            </Link>
          </li>
          <li>
            <Link
              to="/admin/settings"
              className="block rounded-md border border-border bg-surface px-4 py-3 text-sm font-medium hover:border-accent"
            >
              Exam settings
            </Link>
          </li>
          <li>
            <Link
              to="/admin/users"
              className="block rounded-md border border-border bg-surface px-4 py-3 text-sm font-medium hover:border-accent"
            >
              Users / invite
            </Link>
          </li>
          <li>
            <Link
              to="/admin/comparison"
              className="block rounded-md border border-border bg-surface px-4 py-3 text-sm font-medium hover:border-accent"
            >
              Group comparison
            </Link>
          </li>
        </ul>
      </div>
    </AppShell>
  )
}
