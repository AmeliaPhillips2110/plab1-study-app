import { Link } from 'react-router-dom'
import { AppShell } from '@/components/layout/AppShell'
import { Badge } from '@/components/ui/Badge'
import { Button } from '@/components/ui/Button'
import { useAuth } from '@/hooks/useAuth'
import { useExam } from '@/hooks/useExam'

const OPTIONS = [
  { to: '/study', label: 'Study' },
  { to: '/mock', label: 'Tests' },
  { to: '/dashboard', label: 'KPIs' },
  { to: '/attempts', label: 'Attempts' },
  { to: '/glossary', label: 'Glossary' },
  { to: '/account', label: 'Account' },
]

export function HomePage() {
  const { isAdmin } = useAuth()
  const { loading, exam, settings, topics, error, schemaMissing } = useExam()

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
          ) : (
            <p className="text-sm text-muted">Exam not available yet.</p>
          )}
        </section>

        <section className="w-full max-w-3xl rounded-md border border-border bg-surface p-4 text-center">
          <h2 className="mb-2 font-display text-lg font-semibold">Topics</h2>
          {loading ? (
            <p className="text-sm text-muted">Loading topics…</p>
          ) : topics.length === 0 ? (
            <p className="text-sm text-muted">No topics yet.</p>
          ) : (
            <ul className="grid gap-2 sm:grid-cols-2 lg:grid-cols-3">
              {topics.map((t) => (
                <li key={t.id} className="rounded border border-border px-3 py-2 text-sm">
                  {t.name}
                </li>
              ))}
            </ul>
          )}
        </section>
      </div>
    </AppShell>
  )
}
