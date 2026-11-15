import { Link } from 'react-router-dom'
import { AppShell } from '@/components/layout/AppShell'
import { STUDY_MODES } from '@/modules/plab1/modeRoutes'
import { modeIcon } from '@/modules/plab1/modeIcons'

export function StudyHubPage() {
  return (
    <AppShell title="Practice">
      <div className="mx-auto flex w-full max-w-2xl flex-col gap-4">
        <p className="text-center text-sm text-muted">
          Choose a practice mode. Each option opens ready to start.
        </p>
        <ul className="flex flex-col gap-3">
          {STUDY_MODES.map((m) => (
            <li key={m.slug}>
              <Link
                to={`/study/${m.slug}`}
                className="flex w-full items-start gap-3 rounded-md border border-border bg-surface px-4 py-3 text-left transition hover:border-accent hover:bg-accent-subtle"
              >
                <span className="mt-0.5">{modeIcon(m.slug)}</span>
                <span className="flex min-w-0 flex-col gap-1">
                  <span className="font-display text-base font-semibold text-accent">{m.title}</span>
                  <span className="text-sm text-muted">{m.description}</span>
                </span>
              </Link>
            </li>
          ))}
        </ul>
      </div>
    </AppShell>
  )
}
