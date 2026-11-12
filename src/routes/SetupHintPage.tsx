import { Link } from 'react-router-dom'
import { ThemeToggle } from '@/components/layout/ThemeToggle'

export function SetupHintPage() {
  return (
    <div className="min-h-screen bg-bg text-fg">
      <header className="border-b border-black/20 bg-brand-banner text-white">
        <div className="mx-auto flex w-full max-w-2xl items-center justify-between gap-4 px-4 py-4">
          <p className="font-display text-3xl font-normal tracking-tight">PLABoratory</p>
          <ThemeToggle className="border border-white/30 text-white hover:bg-white/15 hover:text-white" />
        </div>
      </header>
      <div className="mx-auto max-w-2xl px-4 py-10">
        <h1 className="mb-4 text-center font-display text-2xl font-semibold">Setup</h1>
        <p className="mb-4 text-center text-sm text-muted">
          If you see a missing <code className="text-fg">public.exams</code> error, paste the entire
          file <code className="text-fg">supabase/APPLY_ALL.sql</code> into Supabase → SQL → New
          query → Run. After creating the <code className="text-fg">amelia</code> account, run{' '}
          <code className="text-fg">supabase/PROMOTE_AMELIA.sql</code>. Full steps are in{' '}
          <code className="text-fg">SETUP.md</code>.
        </p>
        <p className="text-center">
          <Link className="text-sm text-accent hover:underline" to="/login">
            Back to sign in
          </Link>
        </p>
      </div>
    </div>
  )
}
