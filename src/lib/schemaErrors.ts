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
