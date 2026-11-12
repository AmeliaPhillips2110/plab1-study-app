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
          Deploying the website does <span className="text-fg">not</span> create the question bank. Load
          SQL in Supabase, then hard-refresh the live site.
        </p>

        <section className="mb-6 rounded-md border border-border bg-surface p-4 text-sm">
          <h2 className="mb-2 font-display font-semibold">Usual (schema already applied)</h2>
          <ol className="list-decimal space-y-2 pl-5 text-muted">
            <li>
              Open{' '}
              <a
                className="text-accent hover:underline"
                href="https://github.com/AmeliaPhillips2110/plab1-study-app/blob/main/supabase/seed_example_pack.sql"
                target="_blank"
                rel="noreferrer"
              >
                seed_example_pack.sql
              </a>{' '}
              → Raw → Select all → Copy.
            </li>
            <li>Supabase dashboard → SQL → New query → Paste → Run.</li>
            <li>
              Confirm 10 rows (Q42–Q51):
              <pre className="mt-2 overflow-x-auto rounded bg-bg p-2 text-xs text-fg">{`select count(*) from public.questions
where id between 'a4000000-0000-4000-8000-000000000042'
  and 'a4000000-0000-4000-8000-000000000051';`}</pre>
            </li>
            <li>Hard-refresh https://ameliaphillips2110.github.io/plab1-study-app/</li>
          </ol>
        </section>

        <section className="mb-6 rounded-md border border-border bg-surface p-4 text-sm">
          <h2 className="mb-2 font-display font-semibold">Fresh project / missing tables</h2>
          <p className="mb-2 text-muted">
            Paste entire{' '}
            <a
              className="text-accent hover:underline"
              href="https://github.com/AmeliaPhillips2110/plab1-study-app/blob/main/supabase/APPLY_ALL.sql"
              target="_blank"
              rel="noreferrer"
            >
              APPLY_ALL.sql
            </a>{' '}
            once, then optionally{' '}
            <a
              className="text-accent hover:underline"
              href="https://github.com/AmeliaPhillips2110/plab1-study-app/blob/main/supabase/PROMOTE_AMELIA.sql"
              target="_blank"
              rel="noreferrer"
            >
              PROMOTE_AMELIA.sql
            </a>
            . Full notes: <code className="text-fg">SETUP.md</code>.
          </p>
        </section>

        <p className="text-center">
          <Link className="text-sm text-accent hover:underline" to="/login">
            Back to sign in
          </Link>
        </p>
      </div>
    </div>
  )
}
