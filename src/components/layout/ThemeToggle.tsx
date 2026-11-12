import { useTheme } from '@/hooks/useTheme'
import { Button } from '@/components/ui/Button'
import { cn } from '@/lib/cn'

type Props = {
  className?: string
}

export function ThemeToggle({ className }: Props) {
  const { resolved, toggleLightDark } = useTheme()
  return (
    <Button
      variant="ghost"
      className={cn(className)}
      onClick={toggleLightDark}
      aria-label={resolved === 'dark' ? 'Switch to light mode' : 'Switch to dark mode'}
    >
      {resolved === 'dark' ? 'Light' : 'Dark'}
    </Button>
  )
}
