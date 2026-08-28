'use client'

import { useCallback, useEffect, useRef, useState } from 'react'
import Link from 'next/link'
import { useRouter } from 'next/navigation'
import Dropdown, { type DropdownOption } from '@/components/ui/Dropdown'
import { searchSuggestions, type EntrySuggestion } from '@/lib/api/entries'
import type { TranslatableLanguage } from '@/lib/public-site'

/**
 * The controls, and a typeahead over the source language.
 *
 * The typeahead is not a convenience. Translating a word the source language
 * does not have runs the whole engine to arrive at nothing, and the miss then
 * gets attributed to the target language, which is wrong. Suggesting from the
 * source as you type answers that before a request is made, and when there is
 * genuinely nothing it says so at the point the person can still do something
 * about it.
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

  const [hints, setHints] = useState<EntrySuggestion[]>([])
  const [checking, setChecking] = useState(false)
  const [searched, setSearched] = useState(false)
  const [open, setOpen] = useState(false)
  const [active, setActive] = useState(-1)

  const boxRef = useRef<HTMLDivElement | null>(null)
  const requestRef = useRef(0)

  const sourceLanguage = languages.find((language) => language.code === source) ?? null
  const targetLanguage = languages.find((language) => language.code === target) ?? null

  const go = useCallback(
    (next: { from?: string; to?: string; q?: string }) => {
      const params = new URLSearchParams()
      const f = next.from ?? source
      const t = next.to ?? target
      const query = next.q ?? text
      if (f) params.set('from', f)
      if (t) params.set('to', t)
      if (query.trim()) params.set('q', query.trim())
      setOpen(false)
      router.push(`/translate?${params.toString()}`)
    },
    [router, source, target, text]
  )

  // Look the term up in the source language while it is being typed.
  useEffect(() => {
    const term = text.trim()
    if (!term || !sourceLanguage) {
      setHints([])
      setSearched(false)
      return
    }

    const id = ++requestRef.current
    setChecking(true)
    const timer = setTimeout(async () => {
      try {
        const found = await searchSuggestions(term, sourceLanguage.id, 6)
        if (id !== requestRef.current) return
        setHints(found)
        setSearched(true)
        setActive(-1)
      } catch {
        if (id === requestRef.current) setHints([])
      } finally {
        if (id === requestRef.current) setChecking(false)
      }
    }, 220)

    return () => clearTimeout(timer)
  }, [text, sourceLanguage])

  useEffect(() => {
    const onClick = (event: MouseEvent) => {
      if (boxRef.current && !boxRef.current.contains(event.target as Node)) setOpen(false)
    }
    document.addEventListener('mousedown', onClick)
    return () => document.removeEventListener('mousedown', onClick)
  }, [])

  const swap = () => {
    setSource(target)
    setTarget(source)
    go({ from: target, to: source })
  }

  const onKeyDown = (event: React.KeyboardEvent<HTMLInputElement>) => {
    if (!open || hints.length === 0) return
    if (event.key === 'ArrowDown') {
      event.preventDefault()
      setActive((index) => (index + 1) % hints.length)
    } else if (event.key === 'ArrowUp') {
      event.preventDefault()
      setActive((index) => (index <= 0 ? hints.length - 1 : index - 1))
    } else if (event.key === 'Enter' && active >= 0) {
      event.preventDefault()
      const chosen = hints[active]
      setText(chosen.headword)
      go({ q: chosen.headword })
    } else if (event.key === 'Escape') {
      setOpen(false)
    }
  }

  // Both pickers list the same languages, so the options are built once. The
  // native name is the second line, because someone looking for their own
  // language looks for the name they call it, not the English one. The count is
  // there so a language with nothing in it is visible before it is chosen
  // rather than after a translation comes back empty.
  const languageOptions: DropdownOption[] = languages.map((language) => ({
    value: language.code,
    label: language.name,
    hint: language.nativeName && language.nativeName !== language.name ? language.nativeName : undefined,
    meta: language.entries > 0 ? `${language.entries.toLocaleString()} words` : 'empty',
  }))

  const nothingFound = searched && !checking && hints.length === 0 && text.trim().length > 1

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
          <Dropdown
            id="from-lang"
            value={source}
            onChange={(next) => {
              setSource(next)
              go({ from: next })
            }}
            options={languageOptions}
            tone="dark"
            aria-label="Translate from"
            searchPlaceholder="Find a language"
          />
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
          <Dropdown
            id="to-lang"
            value={target}
            onChange={(next) => {
              setTarget(next)
              go({ to: next })
            }}
            options={languageOptions}
            tone="dark"
            aria-label="Translate into"
            searchPlaceholder="Find a language"
          />
        </div>
      </div>

      <div ref={boxRef} className="relative mt-4">
        <div className="flex gap-2">
          <label htmlFor="translate-q" className="sr-only">
            Word or phrase to translate
          </label>
          <input
            id="translate-q"
            type="text"
            value={text}
            onChange={(event) => {
              setText(event.target.value)
              setOpen(true)
            }}
            onFocus={() => setOpen(true)}
            onKeyDown={onKeyDown}
            autoComplete="off"
            autoCapitalize="none"
            spellCheck={false}
            role="combobox"
            aria-expanded={open && hints.length > 0}
            aria-controls="translate-hints"
            placeholder={
              sourceLanguage ? `A word in ${sourceLanguage.name}` : 'A word or a short phrase'
            }
            className="min-w-0 flex-1 border border-ink-700 bg-ink-800 px-4 py-3.5 text-lg text-paper outline-none placeholder:text-ink-500 focus:border-sand-300"
          />
          <button type="submit" className="btn-on-dark shrink-0">
            Translate
          </button>
        </div>

        {open && hints.length > 0 && (
          <ul
            id="translate-hints"
            role="listbox"
            className="absolute inset-x-0 top-full z-50 mt-1 max-h-72 overflow-y-auto border border-ink-700 bg-ink-900 shadow-strong"
          >
            {hints.map((hint, index) => (
              <li key={hint.id} role="option" aria-selected={index === active}>
                <button
                  type="button"
                  onMouseEnter={() => setActive(index)}
                  onClick={() => {
                    setText(hint.headword)
                    go({ q: hint.headword })
                  }}
                  className={`flex w-full items-baseline justify-between gap-4 border-b border-ink-800 px-4 py-2.5 text-left transition-colors ${
                    index === active ? 'bg-ink-800' : ''
                  }`}
                >
                  <span className="font-semibold text-paper">{hint.headword}</span>
                  <span className="truncate text-sm text-ink-400">{hint.primary_definition}</span>
                </button>
              </li>
            ))}
          </ul>
        )}
      </div>

      {/* The word is not in the source language at all. Say so here, before a
        * request is made, and ask for it in the language it is missing from. */}
      {nothingFound && sourceLanguage && (
        <div className="mt-4 border-l-2 border-signal-300 py-1 pl-4">
          <p className="text-[0.9375rem] text-ink-300">
            <strong className="text-paper">{sourceLanguage.name}</strong> has no entry for{' '}
            <strong className="text-paper">{text.trim()}</strong> yet, so there is nothing to
            translate from.
          </p>
          <div className="mt-2 flex flex-wrap gap-x-5 gap-y-1">
            <Link
              href={`/contribute?lang=${source}`}
              className="text-sm font-semibold text-signal-300 underline underline-offset-4"
            >
              Add it in {sourceLanguage.name}
            </Link>
            {targetLanguage && (
              <Link
                href={`/explore?q=${encodeURIComponent(text.trim())}`}
                className="text-sm font-semibold text-ink-300 underline underline-offset-4"
              >
                Look for it in every language
              </Link>
            )}
          </div>
        </div>
      )}
    </form>
  )
}
