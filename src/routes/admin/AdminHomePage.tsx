import { Link } from 'react-router-dom'
import { AppShell } from '@/components/layout/AppShell'

export function AdminHomePage() {
  return (
    <AppShell title="Admin">
      <div className="flex flex-col gap-4">
        <p className="max-w-2xl text-sm text-muted">
          Stage a admin shell: manage the question bank, edit the pass mark, and follow the user
          invite path. Quiz analytics and glossary tools come later.
        </p>
        <ul className="grid gap-3 sm:grid-cols-3">
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
        </ul>
      </div>
    </AppShell>
  )
}
