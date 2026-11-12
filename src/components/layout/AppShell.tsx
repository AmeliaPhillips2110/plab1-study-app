import type { ReactNode } from 'react'
import { Link } from 'react-router-dom'
import { Nav } from '@/components/layout/Nav'
import { ThemeToggle } from '@/components/layout/ThemeToggle'
import { Button } from '@/components/ui/Button'
import { useAuth } from '@/hooks/useAuth'

export function AppShell({ children, title }: { children: ReactNode; title?: string }) {
  const { signOut, user, profile } = useAuth()
  const signedIn = Boolean(user)
  const label =
    profile?.display_name ||
    profile?.email?.split('@')[0] ||
    user?.email?.split('@')[0] ||
    'Account'

  return (
    <div className="min-h-screen bg-bg text-fg">
      <header className="border-b border-black/10 bg-brand-banner text-white">
        <div className="mx-auto flex w-full max-w-6xl flex-col items-center gap-3 px-4 py-3">
          <Link
            to="/"
            className="font-display text-xl font-bold tracking-tight text-white hover:opacity-95"
          >
            PLABoratory
          </Link>
          <div className="flex w-full flex-wrap items-center justify-center gap-2">
            <Nav onBanner />
            <ThemeToggle
              className="border border-white/30 text-white hover:bg-white/15 hover:text-white"
            />
            {signedIn ? (
              <>
                <span className="hidden text-xs text-white/80 sm:inline">
                  {label}
                  {profile?.role ? ` · ${profile.role}` : ''}
                </span>
                <Button
                  variant="secondary"
                  className="border-white/40 bg-white/15 text-white hover:bg-white/25"
                  onClick={() => void signOut()}
                >
                  Sign out
                </Button>
              </>
            ) : null}
          </div>
        </div>
      </header>
      <main className="mx-auto w-full max-w-6xl px-4 py-6">
        {title ? (
          <h1 className="mb-4 text-center font-display text-2xl font-bold tracking-tight">{title}</h1>
        ) : null}
        {children}
      </main>
    </div>
  )
}
