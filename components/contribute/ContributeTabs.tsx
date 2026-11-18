import Link from 'next/link'

// The three ways in to contributing, side by side so nobody has to guess which
// page they are on or where the others are.

const TABS = [
  { href: '/contribute/gaps', label: 'Missing Meanings', hint: 'Meanings other languages have and yours does not' },
  { href: '/contribute/words', label: 'Most Used Words', hint: 'Words speakers use often that are not here yet' },
  { href: '/contribute', label: 'Any Word', hint: 'Something nobody thought to ask about' },
] as const

export default function ContributeTabs({ active }: { active: (typeof TABS)[number]['href'] }) {
  return (
    <nav aria-label="Ways to contribute" className="mb-10 grid gap-2 sm:grid-cols-3">
      {TABS.map((tab) => {
        const on = tab.href === active
        return (
          <Link
            key={tab.href}
            href={tab.href}
            aria-current={on ? 'page' : undefined}
            className={`border px-4 py-3 transition-colors ${
              on ? 'border-ink-900 bg-ink-900 text-paper' : 'border-ink-300 text-ink-700 hover:border-ink-900'
            }`}
          >
            <span className="block text-[0.9375rem] font-semibold">{tab.label}</span>
            <span className={`mt-0.5 block text-xs ${on ? 'text-ink-300' : 'text-ink-500'}`}>{tab.hint}</span>
          </Link>
        )
      })}
    </nav>
  )
}
