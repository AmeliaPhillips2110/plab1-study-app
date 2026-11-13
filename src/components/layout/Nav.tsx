import { useEffect, useId, useRef, useState, type ReactNode } from 'react'
import { NavLink, useLocation } from 'react-router-dom'
import { STUDY_MODES, TEST_MODES } from '@/modules/plab1/modeRoutes'
import { cn } from '@/lib/cn'

type Props = {
  /** Banner chrome: pastel teal links on dark band. */
  onBanner?: boolean
}

const OPEN_DELAY_MS = 220
const CLOSE_DELAY_MS = 380

function navClass(onBanner: boolean, isActive: boolean) {
  if (onBanner) {
    return cn(
      'rounded-sm px-2 py-1 text-sm font-medium transition-colors',
      isActive
        ? 'bg-white/20 text-white'
        : 'text-brand-pastel hover:bg-white/10 hover:text-brand-pastel-hover',
    )
  }
  return cn(
    'rounded-sm px-2 py-1 text-sm font-medium transition-colors',
    isActive ? 'bg-accent-tint text-accent' : 'text-muted hover:bg-surface-2 hover:text-fg',
  )
}

function HubHoverMenu({
  hubTo,
  label,
  onBanner,
  active,
  children,
}: {
  hubTo: string
  label: string
  onBanner: boolean
  active?: boolean
  children: ReactNode
}) {
  const [open, setOpen] = useState(false)
  const panelId = useId()
  const openTimer = useRef<number | null>(null)
  const closeTimer = useRef<number | null>(null)

  function clearTimers() {
    if (openTimer.current) window.clearTimeout(openTimer.current)
    if (closeTimer.current) window.clearTimeout(closeTimer.current)
    openTimer.current = null
    closeTimer.current = null
  }

  function scheduleOpen() {
    clearTimers()
    openTimer.current = window.setTimeout(() => setOpen(true), OPEN_DELAY_MS)
  }

  function scheduleClose() {
    clearTimers()
    closeTimer.current = window.setTimeout(() => setOpen(false), CLOSE_DELAY_MS)
  }

  useEffect(() => () => clearTimers(), [])

  return (
    <div
      className="relative"
      onMouseEnter={scheduleOpen}
      onMouseLeave={scheduleClose}
      onFocus={scheduleOpen}
      onBlur={(e) => {
        if (!e.currentTarget.contains(e.relatedTarget as Node | null)) {
          scheduleClose()
        }
      }}
    >
      <NavLink
        to={hubTo}
        className={navClass(onBanner, Boolean(active))}
        aria-expanded={open}
        aria-haspopup="menu"
        aria-controls={panelId}
        onClick={() => {
          clearTimers()
          setOpen(false)
        }}
      >
        {label}
      </NavLink>
      {open ? (
        <div
          id={panelId}
          role="menu"
          className={cn(
            'absolute left-1/2 z-40 mt-1 min-w-[12rem] -translate-x-1/2 rounded-md border border-border bg-surface py-1 shadow-md',
            'before:absolute before:-top-2 before:left-0 before:h-2 before:w-full before:content-[""]',
          )}
          onMouseEnter={() => {
            clearTimers()
            setOpen(true)
          }}
          onMouseLeave={scheduleClose}
        >
          {children}
        </div>
      ) : null}
    </div>
  )
}

function MenuLink({
  to,
  children,
  onBanner,
}: {
  to: string
  children: ReactNode
  onBanner: boolean
}) {
  return (
    <NavLink
      to={to}
      role="menuitem"
      className={({ isActive }) =>
        cn(
          'block px-3 py-2 text-sm',
          onBanner
            ? isActive
              ? 'bg-accent-tint text-accent'
              : 'text-fg hover:bg-surface-2'
            : isActive
              ? 'bg-accent-tint text-accent'
              : 'text-fg hover:bg-surface-2',
        )
      }
    >
      {children}
    </NavLink>
  )
}

export function Nav({ onBanner = false }: Props) {
  const location = useLocation()
  const studyActive = location.pathname.startsWith('/study')
  const testsActive = location.pathname.startsWith('/tests') || location.pathname.startsWith('/mock')

  return (
    <nav aria-label="Main" className="flex flex-wrap items-center justify-center gap-1">
      <HubHoverMenu hubTo="/study" label="Study" onBanner={onBanner} active={studyActive}>
        {STUDY_MODES.map((m) => (
          <MenuLink key={m.slug} to={`/study/${m.slug}`} onBanner={onBanner}>
            {m.title}
          </MenuLink>
        ))}
      </HubHoverMenu>
      <HubHoverMenu hubTo="/tests" label="Tests" onBanner={onBanner} active={testsActive}>
        {TEST_MODES.map((m) => (
          <MenuLink key={m.slug} to={`/tests/${m.slug}`} onBanner={onBanner}>
            {m.title}
          </MenuLink>
        ))}
      </HubHoverMenu>
      <NavLink to="/attempts" className={({ isActive }) => navClass(onBanner, isActive)}>
        Attempts
      </NavLink>
      <NavLink to="/kpis" className={({ isActive }) => navClass(onBanner, isActive || location.pathname.startsWith('/kpis'))}>
        KPIs
      </NavLink>
      <NavLink
        to="/glossary"
        className={({ isActive }) => navClass(onBanner, isActive || location.pathname.startsWith('/glossary'))}
      >
        Glossary
      </NavLink>
    </nav>
  )
}
