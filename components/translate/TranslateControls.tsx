'use client'

import { useRouter } from 'next/navigation'
import { useState } from 'react'
import type { TranslatableLanguage } from '@/lib/public-site'

/**
 * The controls only. The answer is rendered on the server, so this exists to
 * change the URL, not to hold the result.
 *
 * That is the point of the rewrite: a translation is now a location. It can be
 * linked, sent to someone, bookmarked, and read by a crawler.
 */
export default function TranslateControls({
  languages,
  from,
  to,
  q,
}: {
  languages: TranslatableLanguage[]
  from: string
  to: string
  q: string
}) {
  const router = useRouter()
  const [text, setText] = useState(q)
  const [source, setSource] = useState(from)
  const [target, setTarget] = useState(to)

  const go = (next: { from?: string; to?: string; q?: string }) => {
    const params = new URLSearchParams()
    const f = next.from ?? source
    const t = next.to ?? target
    const query = next.q ?? text
    if (f) params.set('from', f)
    if (t) params.set('to', t)
    if (query.trim()) params.set('q', query.trim())
    router.push(`/translate?${params.toString()}`)
  }

  const swap = () => {
    setSource(target)
    setTarget(source)
    go({ from: target, to: source })
  }

  const selectClass =
    'w-full border border-ink-700 bg-ink-800 px-4 py-3 text-paper outline-none focus:border-sand-300'

  return (
    <form
      onSubmit={(event) => {
        event.preventDefault()
        go({})
      }}
    >
      <div className="grid gap-3 sm:grid-cols-[1fr_auto_1fr] sm:items-end">
        <div>
          <label htmlFor="from-lang" className="label mb-2 block text-ink-400">
            From
          </label>
          <select
            id="from-lang"
            value={source}
            onChange={(event) => {
              setSource(event.target.value)
              go({ from: event.target.value })
            }}
            className={selectClass}
          >
            {languages.map((language) => (
              <option key={language.id} value={language.code}>
                {language.name}
              </option>
            ))}
          </select>
        </div>

        <button
          type="button"
          onClick={swap}
          aria-label="Swap languages"
          title="Swap languages"
          className="mb-0.5 hidden h-11 w-11 shrink-0 items-center justify-center border border-ink-700 text-paper transition-colors hover:border-sand-300 hover:text-sand-300 sm:flex"
        >
          <svg width="17" height="17" viewBox="0 0 18 18" aria-hidden="true" fill="none">
            <path
              d="M2 6h13m0 0-3.5-3.5M15 6l-3.5 3.5M16 12H3m0 0 3.5-3.5M3 12l3.5 3.5"
              stroke="currentColor"
              strokeWidth="1.6"
              strokeLinecap="round"
              strokeLinejoin="round"
            />
          </svg>
        </button>

        <div>
          <label htmlFor="to-lang" className="label mb-2 block text-ink-400">
            Into
          </label>
          <select
            id="to-lang"
            value={target}
            onChange={(event) => {
              setTarget(event.target.value)
              go({ to: event.target.value })
            }}
            className={selectClass}
          >
            {languages.map((language) => (
              <option key={language.id} value={language.code}>
                {language.name}
              </option>
            ))}
          </select>
        </div>
      </div>

      <div className="mt-4 flex gap-2">
        <label htmlFor="translate-q" className="sr-only">
          Word or phrase to translate
        </label>
        <input
          id="translate-q"
          type="text"
          value={text}
          onChange={(event) => setText(event.target.value)}
          autoComplete="off"
          autoCapitalize="none"
          spellCheck={false}
          placeholder="A word or a short phrase"
          className="min-w-0 flex-1 border border-ink-700 bg-ink-800 px-4 py-3.5 text-lg text-paper outline-none placeholder:text-ink-500 focus:border-sand-300"
        />
        <button type="submit" className="btn-on-dark shrink-0">
          Translate
        </button>
      </div>
    </form>
  )
}
