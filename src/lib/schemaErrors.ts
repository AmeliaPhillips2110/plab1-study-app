/** Detect PostgREST / Postgres “relation missing” style errors from unapplied SQL. */
export function isMissingSchemaError(message: string | null | undefined): boolean {
  if (!message) return false
  const m = message.toLowerCase()
  return (
    m.includes('could not find the table') ||
    m.includes('schema cache') ||
    m.includes('does not exist') ||
    (m.includes('relation') && m.includes('does not exist')) ||
    m.includes('public.exams')
  )
}

export const SETUP_SQL_CTA =
  'Database tables are not set up yet. In Supabase → SQL → New query, paste the entire file supabase/APPLY_ALL.sql from the repo, click Run, then refresh this page.'
