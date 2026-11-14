import { Link } from 'react-router-dom'
import { AppShell } from '@/components/layout/AppShell'
import { TEST_MODES } from '@/modules/plab1/modeRoutes'

export function TestHubPage() {
  return (
    <AppShell title="Tests">
      <div className="flex w-full flex-col gap-4">
        <p className="text-center text-sm text-muted">
          Choose a test format. Each type has its own setup page.
        </p>
        <ul className="flex flex-col gap-3">
          {TEST_MODES.map((m) => (
            <li key={m.slug}>
              <Link
                to={`/tests/${m.slug}`}
                className="flex w-full flex-col gap-1 rounded-md border border-border bg-surface px-4 py-3 text-left transition hover:border-accent hover:bg-accent-subtle"
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
