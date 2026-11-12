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

/**
 * Banner layout avoids overlap at all widths:
 * - top row: brand left, controls right
 * - middle: large centered page title
 * - bottom: centered nav (wraps)
 */
export function AppShell({ children, title }: Props) {
  return (
    <div className="min-h-screen bg-bg text-fg">
      <header className="border-b border-black/20 bg-brand-banner text-white">
        <div className="mx-auto flex w-full max-w-6xl flex-col gap-2 px-4 py-3">
          <div className="flex items-center justify-between gap-3">
            <Link
              to="/"
              className="min-w-0 shrink font-display text-2xl font-normal tracking-tight text-white hover:opacity-95 sm:text-3xl md:text-4xl lg:text-5xl"
            >
              PLABoratory
            </Link>
            <div className="flex shrink-0 items-center gap-2">
              <ThemeToggle className="border border-white/30 text-white hover:bg-white/15 hover:text-white" />
              <UserMenu />
            </div>
          </div>

          {title ? (
            <p className="px-2 text-center font-display text-xl font-medium tracking-wide text-white sm:text-2xl md:text-3xl">
              {title}
            </p>
          ) : null}

          <div className="flex justify-center overflow-visible">
            <Nav onBanner />
          </div>
        </div>
      </header>
      <main className="mx-auto w-full max-w-6xl px-4 py-6">{children}</main>
    </div>
  )
}
