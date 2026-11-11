import { Link } from 'react-router-dom'
import { AppShell } from '@/components/layout/AppShell'
import { Badge } from '@/components/ui/Badge'
import { Button } from '@/components/ui/Button'
import { useAuth } from '@/hooks/useAuth'
import { useExam } from '@/hooks/useExam'
import { PLAB1_NAME } from '@/modules/plab1/config'

export function HomePage() {
  const { profile, isAdmin } = useAuth()
  const { loading, exam, settings, topics, error } = useExam()

  return (
    <AppShell title={`${PLAB1_NAME} study home`}>
      <div className="flex flex-col gap-6">
        <div className="flex flex-col gap-3 sm:flex-row sm:items-center sm:justify-between">
          <p className="max-w-2xl text-muted">
            Welcome{profile?.display_name ? `, ${profile.display_name}` : ''}. Practice, sit timed
            mocks, track attempts, and watch KPIs / weaknesses on the dashboard.
          </p>
          <div className="flex flex-wrap gap-2">
            <Link to="/study">
              <Button>Start quiz</Button>
            </Link>
            <Link to="/dashboard">
              <Button variant="secondary">KPIs</Button>
            </Link>
            <Link to="/mock">
              <Button variant="ghost">Timed mock</Button>
            </Link>
            <Link to="/glossary">
              <Button variant="ghost">Glossary</Button>
            </Link>
          </div>
        </div>

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
                <span className="font-medium text-fg">{settings?.pass_mark_percent ?? 65}%</span>
                {' · '}
                Mock default {settings?.default_mock_question_count ?? 180} Q /{' '}
                {settings?.default_mock_minutes ?? 180} min
              </p>
            </div>
          ) : (
            <p className="text-sm text-muted">No exam loaded.</p>
          )}
        </section>

        <section className="rounded-md border border-border bg-surface p-4">
          <h2 className="mb-2 text-lg font-semibold">Glossary & UK reading (Stage f)</h2>
          <ul className="grid gap-2 text-sm text-muted sm:grid-cols-2">
            <li>Editable glossary with tap/hover definitions in stems</li>
            <li>UK-practice & patient-centred quiz filters</li>
            <li>Long-stem practice + reading tip (WPM preference)</li>
            <li>Pace vs stem length; language / UK-practice mistake tags</li>
          </ul>
          <p className="mt-3">
            <Link className="text-sm text-accent hover:underline" to="/glossary">
              Open glossary →
            </Link>
          </p>
        </section>

        <section className="rounded-md border border-border bg-surface p-4">
          <h2 className="mb-2 text-lg font-semibold">KPIs & weakness (Stage e)</h2>
          <ul className="grid gap-2 text-sm text-muted sm:grid-cols-2">
            <li>Headline tiles, score trend with pass-mark line</li>
            <li>Accuracy by specialty, mistake mix, QPM, coverage</li>
            <li>Activity + topic×weekday heatmaps</li>
            <li>Focus next with one-click drills; admin group comparison</li>
          </ul>
          <p className="mt-3">
            <Link className="text-sm text-accent hover:underline" to="/dashboard">
              Open KPI dashboard →
            </Link>
          </p>
        </section>

        <section className="rounded-md border border-border bg-surface p-4">
          <h2 className="mb-2 text-lg font-semibold">Attempts & mistakes (Stage d)</h2>
          <ul className="grid gap-2 text-sm text-muted sm:grid-cols-2">
            <li>Filterable / sortable attempt log</li>
            <li>Per-question timeline</li>
            <li>Mistake tags on wrong answers (tutor + mock review)</li>
            <li>CSV export for attempts and sessions</li>
          </ul>
          <p className="mt-3">
            <Link className="text-sm text-accent hover:underline" to="/attempts">
              Open attempt log →
            </Link>
          </p>
        </section>

        <section className="rounded-md border border-border bg-surface p-4">
          <h2 className="mb-2 text-lg font-semibold">Timed tests (Stage c)</h2>
          <ul className="grid gap-2 text-sm text-muted sm:grid-cols-2">
            <li>Full mock — no feedback until the end</li>
            <li>As many as you can — stop anytime</li>
            <li>Navigator, flag, countdown, auto-save / resume</li>
            <li>Pace widget + end-of-test pace report and answer review</li>
          </ul>
          <p className="mt-3">
            <Link className="text-sm text-accent hover:underline" to="/mock">
              Open mocks →
            </Link>
          </p>
        </section>

        <section className="rounded-md border border-border bg-surface p-4">
          <h2 className="mb-2 text-lg font-semibold">Quiz modes (Stage b)</h2>
          <ul className="grid gap-2 text-sm text-muted sm:grid-cols-2">
            <li>Topic / random / weakness / spaced repetition / flashcard deck</li>
            <li>Formats: SBA, flashcard, cover-the-options, rapid fire</li>
            <li>Immediate tutor feedback after each item</li>
            <li>Attempts + spaced-repetition schedule saved to Supabase</li>
          </ul>
          <p className="mt-3">
            <Link className="text-sm text-accent hover:underline" to="/study">
              Open study setup →
            </Link>
          </p>
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

        {isAdmin ? (
          <p className="text-sm">
            Admin shortcuts:{' '}
            <Link className="text-accent hover:underline" to="/admin/questions">
              Questions
            </Link>
            {' · '}
            <Link className="text-accent hover:underline" to="/admin/glossary">
              Glossary
            </Link>
          </p>
        ) : null}
      </div>
    </AppShell>
  )
}
