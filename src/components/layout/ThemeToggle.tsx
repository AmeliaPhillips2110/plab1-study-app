import { useTheme } from '@/hooks/useTheme'
import { Button } from '@/components/ui/Button'

export function ThemeToggle() {
  const { resolved, toggleLightDark } = useTheme()
  return (
    <Button
      variant="ghost"
      onClick={toggleLightDark}
      aria-label={resolved === 'dark' ? 'Switch to light mode' : 'Switch to dark mode'}
    >
      {resolved === 'dark' ? 'Light' : 'Dark'}
    </Button>
  )
}
