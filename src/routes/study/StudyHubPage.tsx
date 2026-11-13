import { Link } from 'react-router-dom'
import { AppShell } from '@/components/layout/AppShell'
import { STUDY_MODES } from '@/modules/plab1/modeRoutes'

export function StudyHubPage() {
  return (
    <AppShell title="Practice">
      <div className="mx-auto flex w-full max-w-4xl flex-col gap-4">
        <p className="text-center text-sm text-muted">
          Choose a practice mode. Each option opens ready to start.
        </p>
        <ul className="grid grid-cols-1 gap-3 sm:grid-cols-2">
          {STUDY_MODES.map((m) => (
            <li key={m.slug} className="min-h-0">
              <Link
                to={`/study/${m.slug}`}
                className="flex h-full w-full flex-col gap-1 rounded-md border border-border bg-surface px-4 py-3 text-left transition hover:border-accent hover:bg-accent-subtle"
              >
                <span className="font-display text-base font-semibold text-accent">{m.title}</span>
                <span className="text-sm text-muted">{m.description}</span>
              </Link>
            </li>
          ))}
        </ul>
      </div>
    </AppShell>
  )
}
