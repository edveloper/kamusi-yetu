import { ROADMAP } from '@/lib/constants/roadmap'

// Done, now, next, later, as a line with the present marked. Compact shows only
// the first point of each phase, for the home page.
export default function Roadmap({ compact = false }: { compact?: boolean }) {
  return (
    <ol className="reveal-rows grid gap-y-10 md:grid-cols-4 md:gap-x-8">
      {ROADMAP.map((phase) => {
        const current = phase.key === 'now'
        const past = phase.key === 'done'
        return (
          <li key={phase.key} className="relative">
            {/* The line runs across the top on wide screens, down the side on narrow ones. */}
            <div className="mb-5 flex items-center gap-3">
              <span
                aria-hidden="true"
                className={`h-3.5 w-3.5 shrink-0 border ${
                  past
                    ? 'border-petrol-500 bg-petrol-500'
                    : current
                      ? 'border-signal-500 bg-signal-500 ring-4 ring-signal-100'
                      : 'border-ink-400 bg-paper'
                }`}
              />
              <span aria-hidden="true" className={`hidden h-px flex-1 md:block ${past ? 'bg-petrol-500' : 'bg-ink-200'}`} />
            </div>
            <h3 className={`label mb-3 ${current ? 'text-signal-500' : past ? 'text-petrol-500' : 'text-ink-600'}`}>
              {phase.title}
              {current && <span className="sr-only">, where we are</span>}
            </h3>
            <ul className="space-y-3">
              {(compact ? phase.items.slice(0, 1) : phase.items).map((item) => (
                <li key={item} className={`text-[0.9375rem] ${past ? 'text-ink-600' : 'text-ink-800'}`}>
                  {item}
                </li>
              ))}
            </ul>
          </li>
        )
      })}
    </ol>
  )
}
