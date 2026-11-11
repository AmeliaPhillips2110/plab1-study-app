import { Link } from 'react-router-dom'
import { AppShell } from '@/components/layout/AppShell'
import { Badge } from '@/components/ui/Badge'
import { useAuth } from '@/hooks/useAuth'
import { useExam } from '@/hooks/useExam'
import { PLAB1_NAME } from '@/modules/plab1/config'

export function HomePage() {
  const { profile, isAdmin } = useAuth()
  const { loading, exam, settings, topics, error } = useExam()

  return (
    <AppShell title={`${PLAB1_NAME} study home`}>
      <div className="flex flex-col gap-6">
        <p className="max-w-2xl text-muted">
          Welcome{profile?.display_name ? `, ${profile.display_name}` : ''}. Quiz modes, mocks, and
          KPIs arrive in later stages. For now you can sign in, switch theme, and admins can manage
          the question bank.
        </p>

        {error ? (
          <p className="rounded-md border border-incorrect/40 bg-incorrect/10 px-3 py-2 text-sm text-incorrect">
            {error}
          </p>
        ) : null}

        <section className="rounded-md border border-border bg-surface p-4">
          <h2 className="mb-2 text-lg font-semibold">Exam</h2>
          {loading ? (
            <p className="text-sm text-muted">Loading exam…</p>
          ) : exam ? (
            <div className="flex flex-col gap-2 text-sm">
              <div className="flex flex-wrap items-center gap-2">
                <span className="font-medium">{exam.name}</span>
                <Badge tone="accent">{exam.slug}</Badge>
                {exam.is_active ? <Badge tone="correct">Active</Badge> : <Badge>Inactive</Badge>}
              </div>
              {exam.description ? <p className="text-muted">{exam.description}</p> : null}
              <p className="text-muted">
                Pass mark:{' '}
                <span className="font-medium text-fg">
                  {settings?.pass_mark_percent ?? 65}%
                </span>
              </p>
            </div>
          ) : (
            <p className="text-sm text-muted">No exam loaded.</p>
          )}
        </section>

        <section className="rounded-md border border-border bg-surface p-4">
          <h2 className="mb-2 text-lg font-semibold">Topics</h2>
          {loading ? (
            <p className="text-sm text-muted">Loading topics…</p>
          ) : topics.length === 0 ? (
            <p className="text-sm text-muted">No topics yet. Run the seed SQL.</p>
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

        <section className="rounded-md border border-dashed border-border bg-surface/60 p-4">
          <h2 className="mb-2 text-lg font-semibold">Coming next</h2>
          <p className="text-sm text-muted">
            Stage b will unlock the quiz engine (topic, random, weakness, spaced repetition,
            flashcards). This home page is intentionally a placeholder so you can verify auth and
            data wiring first.
          </p>
        </section>

        {isAdmin ? (
          <p className="text-sm">
            Admin shortcut:{' '}
            <Link className="text-accent hover:underline" to="/admin/questions">
              Manage questions
            </Link>
          </p>
        ) : null}
      </div>
    </AppShell>
  )
}
