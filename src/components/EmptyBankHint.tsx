import { Link } from 'react-router-dom'
import { useAuth } from '@/hooks/useAuth'

type Props = {
  /** Soft empty when the SBA bank has zero rows (or exam/schema not ready). */
  bankEmpty?: boolean
  /** Soft empty when exam/schema is missing. */
  examMissing?: boolean
  className?: string
}

/**
 * Soft empty-state for missing exam/questions. Students see calm copy;
 * admins get crystal-clear Supabase SQL steps (no raw PostgREST errors).
 */
export function EmptyBankHint({ bankEmpty, examMissing, className }: Props) {
  const { isAdmin } = useAuth()
  if (!bankEmpty && !examMissing) return null

  return (
    <div
      className={
        className ??
        'w-full rounded-md border border-border bg-surface px-4 py-3 text-sm text-muted'
      }
    >
      {examMissing ? (
        <p>Exam data is not ready yet. The rest of the app still loads — study modes will stay empty until setup finishes.</p>
      ) : (
        <p>No questions in the bank yet. You can still browse KPIs, Attempts, Glossary, and Account.</p>
      )}
      {isAdmin ? (
        <div className="mt-3 space-y-2 text-left text-fg">
          <p className="font-medium">Admin — load questions (Supabase SQL editor)</p>
          <ol className="list-decimal space-y-1 pl-5 text-sm text-muted">
            <li>
              Open{' '}
              <a
                className="text-accent hover:underline"
                href="https://github.com/AmeliaPhillips2110/plab1-study-app/blob/main/supabase/seed_example_pack.sql"
                target="_blank"
                rel="noreferrer"
              >
                supabase/seed_example_pack.sql
              </a>{' '}
              → Raw → select all → copy.
            </li>
            <li>Supabase → SQL → New query → paste → Run (safe to re-run).</li>
            <li>
              Confirm:{' '}
              <code className="text-fg">
                select count(*) from public.questions where id::text like
                &apos;a4000000-0000-4000-8000-00000000004%&apos;;
              </code>{' '}
              → expect <span className="text-fg">10</span> (Q42–Q51).
            </li>
            <li>Hard-refresh the live site.</li>
          </ol>
          <p className="text-xs text-muted">
            Fresh project / missing tables: paste entire{' '}
            <a
              className="text-accent hover:underline"
              href="https://github.com/AmeliaPhillips2110/plab1-study-app/blob/main/supabase/APPLY_ALL.sql"
              target="_blank"
              rel="noreferrer"
            >
              APPLY_ALL.sql
            </a>{' '}
            once instead. Then{' '}
            <Link className="text-accent hover:underline" to="/admin/questions">
              Admin → Questions
            </Link>
            .
          </p>
        </div>
      ) : (
        <p className="mt-2 text-xs">Ask your admin to run the example question pack in Supabase if this persists.</p>
      )}
    </div>
  )
}
