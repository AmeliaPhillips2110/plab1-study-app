import { SETUP_SQL_CTA } from '@/lib/schemaErrors'

type Props = {
  detail?: string | null
}

export function SetupMissingNotice({ detail }: Props) {
  return (
    <div
      role="status"
      className="mx-auto mb-6 w-full max-w-3xl rounded-md border border-accent/40 bg-accent-subtle px-4 py-3 text-center text-sm text-fg"
    >
      <p className="font-display font-semibold text-accent">Finish database setup</p>
      <p className="mt-1 text-muted">{SETUP_SQL_CTA}</p>
      <p className="mt-2 text-xs text-muted">
        File:{' '}
        <code className="text-fg">supabase/APPLY_ALL.sql</code>
        {' · '}
        Then promote Amelia with <code className="text-fg">supabase/PROMOTE_AMELIA.sql</code>
      </p>
      {detail && !detail.toLowerCase().includes('could not find the table') ? (
        <p className="mt-2 text-xs text-muted">{detail}</p>
      ) : null}
    </div>
  )
}
