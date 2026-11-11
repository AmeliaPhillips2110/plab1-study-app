import { Link } from 'react-router-dom'
import { ThemeToggle } from '@/components/layout/ThemeToggle'

export function SetupHintPage() {
  return (
    <div className="min-h-screen bg-bg text-fg">
      <div className="mx-auto max-w-2xl px-4 py-10">
        <div className="mb-6 flex items-center justify-between">
          <h1 className="text-2xl font-semibold">Setup</h1>
          <ThemeToggle />
        </div>
        <p className="mb-4 text-sm text-muted">
          Full step-by-step instructions live in the repository file <code>SETUP.md</code> (create
          Supabase project, run SQL migrations, set env vars, promote Amelia to admin, run locally,
          and push to GitHub for later Pages deploy).
        </p>
        <Link className="text-sm text-accent hover:underline" to="/login">
          Back to sign in
        </Link>
      </div>
    </div>
  )
}
