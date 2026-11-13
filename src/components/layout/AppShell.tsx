import type { ReactNode } from 'react'
import { Link } from 'react-router-dom'
import { Nav } from '@/components/layout/Nav'
import { ThemeToggle } from '@/components/layout/ThemeToggle'
import { UserMenu } from '@/components/layout/UserMenu'

type Props = {
  children: ReactNode
  /** Title Case page / mode name — same row as brand + account. */
  title?: string
}

/**
 * Top row: bold PLABoratory | centered heading | Light + account.
 * Nav sits on a slightly darker teal band (no white bottom border).
 */
export function AppShell({ children, title }: Props) {
  return (
    <div className="min-h-screen bg-bg text-fg">
      <header className="bg-brand-banner text-white">
        <div className="mx-auto flex w-full max-w-6xl items-center gap-3 px-4 py-3">
          <Link
            to="/"
            className="inline-flex min-w-0 shrink items-center gap-2 font-display text-xl font-bold tracking-tight text-white hover:opacity-95 sm:gap-2.5 sm:text-2xl md:text-3xl"
          >
            <img
              src={`${import.meta.env.BASE_URL}lab-coat.svg`}
              alt=""
              width={36}
              height={36}
              className="h-7 w-7 shrink-0 sm:h-8 sm:w-8 md:h-9 md:w-9"
              aria-hidden
            />
            <span>PLABoratory</span>
          </Link>
          {title ? (
            <p className="min-w-0 flex-1 truncate text-center font-display text-lg font-medium tracking-wide text-white sm:text-xl md:text-2xl">
              {title}
            </p>
          ) : (
            <div className="flex-1" />
          )}
          <div className="flex shrink-0 items-center gap-2">
            <ThemeToggle className="border border-white/30 text-white hover:bg-white/15 hover:text-white" />
            <UserMenu />
          </div>
        </div>
        <div className="bg-brand-nav">
          <div className="mx-auto flex w-full max-w-6xl justify-center px-4 py-2">
            <Nav onBanner />
          </div>
        </div>
      </header>
      <main className="mx-auto w-full max-w-6xl px-4 py-6">{children}</main>
    </div>
  )
}
