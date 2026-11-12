import { useEffect, useId, useRef, useState, type ReactNode } from 'react'
import { Link, NavLink, useLocation } from 'react-router-dom'
import { useAuth } from '@/hooks/useAuth'
import { cn } from '@/lib/cn'

const linkClass = (onBanner: boolean) =>
  ({ isActive }: { isActive: boolean }) =>
    cn(
      'rounded-md px-3 py-2 text-sm font-medium transition',
      onBanner
        ? isActive
          ? 'bg-white/20 text-white'
          : 'text-white/85 hover:bg-white/10 hover:text-white'
        : isActive
          ? 'bg-accent-subtle text-accent'
          : 'text-muted hover:text-fg',
    )

type MenuItem = {
  to: string
  label: string
  hint?: string
}

const STUDY_ITEMS: MenuItem[] = [
  { to: '/study?sessionType=topic', label: 'Practice questions', hint: 'Topic practice' },
  { to: '/study?sessionType=flashcard', label: 'Flashcards', hint: 'Deck review' },
  { to: '/study?mode=open', label: 'Open quiz', hint: 'No time limit · Finish anytime' },
  { to: '/study?sessionType=random&unseenOnly=1', label: 'New questions', hint: 'Unseen only' },
  { to: '/study?sessionType=weakness&variant=by_topic', label: 'Weak topics', hint: 'Focus drills' },
  {
    to: '/study?sessionType=random&format=rapid_fire',
    label: 'Timed drill',
    hint: 'Rapid fire',
  },
  {
    to: '/study?sessionType=spaced_repetition',
    label: 'Spaced review',
    hint: 'Due cards / items',
  },
  {
    to: '/study?sessionType=weakness&variant=most_missed',
    label: 'Most missed',
    hint: 'Highest miss rate',
  },
]

const TEST_ITEMS: MenuItem[] = [
  { to: '/mock?mode=full_mock', label: 'Full Test', hint: 'Timed mock exam' },
  { to: '/mock?mode=as_many_as_you_can', label: 'Unlimited', hint: 'As many as you can' },
  { to: '/mock?mode=themed', label: 'Themed Test', hint: 'Pick a topic focus' },
  {
    to: '/study?sessionType=weakness&variant=recent_mistakes',
    label: 'Error tests',
    hint: 'Recent mistakes',
  },
]

type Props = {
  onBanner?: boolean
}

export function Nav({ onBanner = false }: Props) {
  const { isAdmin } = useAuth()
  const location = useLocation()
  const studyActive = location.pathname.startsWith('/study')
  const testsActive = location.pathname.startsWith('/mock')

  return (
    <nav className="flex max-w-full flex-wrap items-center justify-center gap-1" aria-label="Main">
      <HoverMenu
        onBanner={onBanner}
        label="Study"
        active={studyActive}
        items={STUDY_ITEMS}
      />
      <HoverMenu
        onBanner={onBanner}
        label="Tests"
        active={testsActive}
        items={TEST_ITEMS}
      />
      <NavLink to="/attempts" className={linkClass(onBanner)}>
        Attempts
      </NavLink>
      <NavLink to="/dashboard" className={linkClass(onBanner)}>
        KPIs
      </NavLink>
      <NavLink to="/glossary" className={linkClass(onBanner)}>
        Glossary
      </NavLink>
      {isAdmin ? (
        <>
          <NavLink to="/admin" end className={linkClass(onBanner)}>
            Admin
          </NavLink>
          <NavLink to="/admin/questions" className={linkClass(onBanner)}>
            Questions
          </NavLink>
          <NavLink to="/admin/glossary" className={linkClass(onBanner)}>
            Glossary edit
          </NavLink>
          <NavLink to="/admin/settings" className={linkClass(onBanner)}>
            Settings
          </NavLink>
          <NavLink to="/admin/users" className={linkClass(onBanner)}>
            Users
          </NavLink>
          <NavLink to="/admin/comparison" className={linkClass(onBanner)}>
            Comparison
          </NavLink>
        </>
      ) : null}
    </nav>
  )
}

function HoverMenu({
  label,
  items,
  active,
  onBanner,
}: {
  label: string
  items: MenuItem[]
  active: boolean
  onBanner: boolean
}) {
  const [open, setOpen] = useState(false)
  const ref = useRef<HTMLDivElement>(null)
  const menuId = useId()

  useEffect(() => {
    function onDoc(e: MouseEvent) {
      if (!ref.current?.contains(e.target as Node)) setOpen(false)
    }
    function onKey(e: KeyboardEvent) {
      if (e.key === 'Escape') setOpen(false)
    }
    document.addEventListener('mousedown', onDoc)
    document.addEventListener('keydown', onKey)
    return () => {
      document.removeEventListener('mousedown', onDoc)
      document.removeEventListener('keydown', onKey)
    }
  }, [])

  return (
    <div
      ref={ref}
      className="relative"
      onMouseEnter={() => setOpen(true)}
      onMouseLeave={() => setOpen(false)}
    >
      <button
        type="button"
        className={cn(
          'rounded-md px-3 py-2 text-sm font-medium transition',
          onBanner
            ? active || open
              ? 'bg-white/20 text-white'
              : 'text-white/85 hover:bg-white/10 hover:text-white'
            : active || open
              ? 'bg-accent-subtle text-accent'
              : 'text-muted hover:text-fg',
        )}
        aria-haspopup="menu"
        aria-expanded={open}
        aria-controls={menuId}
        onClick={() => setOpen((v) => !v)}
      >
        {label}
      </button>
      {open ? (
        <div
          id={menuId}
          role="menu"
          className="absolute left-1/2 top-full z-50 mt-1 w-56 -translate-x-1/2 rounded-md border border-border bg-surface py-1 text-fg shadow-md"
        >
          {items.map((item) => (
            <MenuLink key={item.to} to={item.to} onSelect={() => setOpen(false)}>
              <span className="block font-medium">{item.label}</span>
              {item.hint ? <span className="block text-xs text-muted">{item.hint}</span> : null}
            </MenuLink>
          ))}
        </div>
      ) : null}
    </div>
  )
}

function MenuLink({
  to,
  onSelect,
  children,
}: {
  to: string
  onSelect: () => void
  children: ReactNode
}) {
  return (
    <Link
      role="menuitem"
      to={to}
      className="block px-3 py-2 text-sm hover:bg-accent-subtle"
      onClick={onSelect}
    >
      {children}
    </Link>
  )
}
