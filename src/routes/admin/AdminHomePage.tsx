import { Link } from 'react-router-dom'
import { AppShell } from '@/components/layout/AppShell'

export function AdminHomePage() {
  return (
    <AppShell title="Admin">
      <div className="flex flex-col gap-4">
        <p className="max-w-2xl text-sm text-muted">
          Manage the question bank, glossary, pass mark, users, and opted-in peer comparison.
        </p>
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
