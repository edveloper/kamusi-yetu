'use client'

import { useEffect, useRef, useState } from 'react'

/**
 * Counts to a real figure when it scrolls into view.
 *
 * Worth doing here because these are the numbers the whole project is judged
 * on, and watching one climb to 4,839 lands differently from reading it. It
 * renders the final value on the server, so the number is correct before any
 * script runs and correct for anyone who never gets the script.
 */
export default function CountUp({
  value,
  duration = 1100,
  className,
}: {
  value: number
  duration?: number
  className?: string
}) {
  const [display, setDisplay] = useState(value)
  const ref = useRef<HTMLSpanElement | null>(null)
  const hasRun = useRef(false)

  useEffect(() => {
    const node = ref.current
    if (!node || hasRun.current) return

    const reduced = window.matchMedia('(prefers-reduced-motion: reduce)').matches
    if (reduced || value === 0) return

    const observer = new IntersectionObserver(
      (entries) => {
        const entry = entries[0]
        if (!entry?.isIntersecting || hasRun.current) return
        hasRun.current = true
        observer.disconnect()

        const start = performance.now()
        const tick = (now: number) => {
          const progress = Math.min(1, (now - start) / duration)
          // Ease out, so it decelerates into the true value rather than stopping.
          const eased = 1 - Math.pow(1 - progress, 3)
          setDisplay(Math.round(value * eased))
          if (progress < 1) requestAnimationFrame(tick)
          else setDisplay(value)
        }
        setDisplay(0)
        requestAnimationFrame(tick)
      },
      { threshold: 0.4 }
    )

    observer.observe(node)
    return () => observer.disconnect()
  }, [value, duration])

  return (
    <span ref={ref} className={className}>
      {display.toLocaleString()}
    </span>
  )
}
