import { Link } from 'react-router-dom'
import { ThemeToggle } from '@/components/layout/ThemeToggle'
import { LoginForm } from '@/features/auth'

export function LoginPage() {
  return (
    <div className="min-h-screen bg-bg text-fg">
      <div className="mx-auto flex min-h-screen max-w-lg flex-col justify-center gap-8 px-4 py-10">
        <div className="flex items-start justify-between gap-4">
          <div>
            <p className="text-2xl font-semibold tracking-tight">PLABoratory</p>
            <p className="mt-1 text-sm text-muted">PLAB 1 study app — sign in to continue</p>
          </div>
          <ThemeToggle />
        </div>
        <LoginForm />
        <p className="text-xs text-muted">
          New students get a student role automatically. Admins are promoted in Supabase SQL — see{' '}
          <Link className="text-accent hover:underline" to="/setup-hint">
            SETUP.md
          </Link>{' '}
          in the repo.
        </p>
      </div>
    </div>
  )
}
