import { useEffect, useState } from 'react'
import { AppShell } from '@/components/layout/AppShell'
import { Badge } from '@/components/ui/Badge'
import { supabase } from '@/lib/supabase'
import { formatDateTime } from '@/lib/dates'
import type { Profile } from '@/types/database'

export function AdminUsersPage() {
  const [profiles, setProfiles] = useState<Profile[]>([])
  const [error, setError] = useState<string | null>(null)
  const [loading, setLoading] = useState(true)

  useEffect(() => {
    void (async () => {
      setLoading(true)
      const { data, error: err } = await supabase
        .from('profiles')
        .select('*')
        .order('created_at', { ascending: true })
      if (err) setError(err.message)
      else setProfiles((data as Profile[]) ?? [])
      setLoading(false)
    })()
  }, [])

  return (
    <AppShell title="Users">
      <div className="flex flex-col gap-6">
        <section className="rounded-md border border-border bg-surface p-4 text-sm">
          <h2 className="mb-2 text-base font-semibold">How to invite / add a user</h2>
          <ol className="list-decimal space-y-2 pl-5 text-muted">
            <li>
              Ask them to open the app and use <strong className="text-fg">Create account</strong> with
              email/password (or create the user in Supabase Auth → Users → Add user).
            </li>
            <li>
              A <code className="text-fg">profiles</code> row is created automatically as{' '}
              <strong className="text-fg">student</strong> via the auth trigger.
            </li>
            <li>
              To make someone an admin (Amelia), run in the Supabase SQL editor:
              <pre className="mt-2 overflow-x-auto rounded bg-bg p-3 text-xs text-fg">{`update public.profiles
set role = 'admin'
where email = 'their-email@example.com';`}</pre>
            </li>
            <li>
              Do not put passwords or service-role keys in the app. Only the anon key belongs in{' '}
              <code className="text-fg">.env.local</code>.
            </li>
          </ol>
        </section>

        {loading ? <p className="text-sm text-muted">Loading profiles…</p> : null}
        {error ? <p className="text-sm text-incorrect">{error}</p> : null}

        <ul className="flex flex-col gap-2">
          {profiles.map((p) => (
            <li
              key={p.id}
              className="flex flex-wrap items-center justify-between gap-2 rounded-md border border-border bg-surface px-4 py-3 text-sm"
            >
              <div>
                <p className="font-medium">{p.display_name || p.email}</p>
                <p className="text-xs text-muted">{p.email}</p>
              </div>
              <div className="flex items-center gap-2">
                <Badge tone={p.role === 'admin' ? 'accent' : 'neutral'}>{p.role}</Badge>
                <span className="text-xs text-muted">{formatDateTime(p.created_at)}</span>
              </div>
            </li>
          ))}
        </ul>
      </div>
    </AppShell>
  )
}
