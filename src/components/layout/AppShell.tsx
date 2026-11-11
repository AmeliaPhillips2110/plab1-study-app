import type { ReactNode } from 'react'
import { Link } from 'react-router-dom'
import { Nav } from '@/components/layout/Nav'
import { ThemeToggle } from '@/components/layout/ThemeToggle'
import { Button } from '@/components/ui/Button'
import { useAuth } from '@/hooks/useAuth'

export function AppShell({ children, title }: { children: ReactNode; title?: string }) {
  const { signOut, profile } = useAuth()

  return (
    <div className="min-h-screen bg-bg text-fg">
      <header className="border-b border-border bg-surface">
        <div className="mx-auto flex max-w-6xl flex-wrap items-center justify-between gap-3 px-4 py-3">
          <div className="flex items-center gap-4">
            <Link to="/" className="text-lg font-semibold tracking-tight text-fg">
              PLABoratory
            </Link>
            <Nav />
          </div>
          <div className="flex items-center gap-2">
            <ThemeToggle />
            {profile ? (
              <Button variant="secondary" onClick={() => void signOut()}>
                Sign out
              </Button>
            ) : null}
          </div>
        </div>
      </header>
      <main className="mx-auto max-w-6xl px-4 py-6">
        {title ? <h1 className="mb-4 text-2xl font-semibold">{title}</h1> : null}
        {children}
      </main>
    </div>
  )
}
