import type { ReactNode } from 'react'
import { Link } from 'react-router-dom'
import { Nav } from '@/components/layout/Nav'
import { ThemeToggle } from '@/components/layout/ThemeToggle'
import { UserMenu } from '@/components/layout/UserMenu'

type Props = {
  children: ReactNode
  /** Shown in the banner (Title Case). Not repeated as a main H1. */
  title?: string
}

export function AppShell({ children, title }: Props) {
  return (
    <div className="min-h-screen bg-bg text-fg">
      <header className="border-b border-black/20 bg-brand-banner text-white">
        <div className="mx-auto w-full max-w-6xl px-4 py-3">
          <div className="grid grid-cols-1 items-start gap-3 md:grid-cols-[minmax(0,1fr)_auto_minmax(0,1fr)] md:items-center">
            <div className="flex justify-start">
              <Link
                to="/"
                className="font-display text-3xl font-normal tracking-tight text-white hover:opacity-95 sm:text-4xl md:text-5xl"
              >
                PLABoratory
              </Link>
            </div>

            <div className="flex flex-col items-center gap-2">
              {title ? (
                <p className="text-center font-display text-base font-medium tracking-wide text-white sm:text-lg">
                  {title}
                </p>
              ) : null}
              <Nav onBanner />
            </div>

            <div className="flex items-center justify-center gap-2 md:justify-end">
              <ThemeToggle className="border border-white/30 text-white hover:bg-white/15 hover:text-white" />
              <UserMenu />
            </div>
          </div>
        </div>
      </header>
      <main className="mx-auto w-full max-w-6xl px-4 py-6">{children}</main>
    </div>
  )
}
