'use client'

import { useEffect, useId, useRef, useState } from 'react'
import { useRouter } from 'next/navigation'
import { searchSuggestions, type EntrySuggestion } from '@/lib/api/entries'

type Props = {
  /** input name, so the box still submits inside a parent <form> */
  name?: string
  defaultValue?: string
  placeholder?: string
  /** optional language id to scope suggestions and the fallback search */
  language?: string
  /** when true, plain Enter (no highlighted suggestion) submits the parent form instead of navigating */
  formMode?: boolean
  /** called on plain Enter when not in formMode; if omitted, navigates to /search?q= */
  onPlainEnter?: (value: string) => void
  className?: string
  inputClassName?: string
}

export default function SearchAutocomplete({
  name = 'q',
  defaultValue = '',
  placeholder = 'Find a word, a phrase, a memory...',
  language,
  formMode = false,
  onPlainEnter,
  className = '',
  inputClassName = ''
}: Props) {
  const router = useRouter()
  const listboxId = useId()

  const [value, setValue] = useState(defaultValue)
  const [suggestions, setSuggestions] = useState<EntrySuggestion[]>([])
  const [open, setOpen] = useState(false)
  const [activeIndex, setActiveIndex] = useState(-1)
  const [loading, setLoading] = useState(false)

  const debounceRef = useRef<ReturnType<typeof setTimeout> | null>(null)
  const requestIdRef = useRef(0)
  const blurTimerRef = useRef<ReturnType<typeof setTimeout> | null>(null)

  useEffect(() => {
    const q = value.trim()
    if (debounceRef.current) clearTimeout(debounceRef.current)

    if (q.length < 1) {
      setSuggestions([])
      setActiveIndex(-1)
      setLoading(false)
      return
    }

    debounceRef.current = setTimeout(async () => {
      const requestId = ++requestIdRef.current
      setLoading(true)
      try {
        const results = await searchSuggestions(q, language, 7)
        if (requestId !== requestIdRef.current) return
        setSuggestions(results)
        setActiveIndex(-1)
        setOpen(true)
      } catch {
        if (requestId !== requestIdRef.current) return
        setSuggestions([])
      } finally {
        if (requestId === requestIdRef.current) setLoading(false)
      }
    }, 220)

    return () => {
      if (debounceRef.current) clearTimeout(debounceRef.current)
    }
  }, [value, language])

  useEffect(() => {
    return () => {
      if (blurTimerRef.current) clearTimeout(blurTimerRef.current)
    }
  }, [])

  const goToEntry = (id: string) => {
    setOpen(false)
    router.push(`/entry/${id}`)
  }

  const goToSearch = (q: string) => {
    const params = new URLSearchParams()
    if (q.trim()) params.set('q', q.trim())
    if (language && language !== 'all') params.set('language', language)
    const qs = params.toString()
    router.push(qs ? `/search?${qs}` : '/search')
  }

  const handleKeyDown = (e: React.KeyboardEvent<HTMLInputElement>) => {
    if (e.key === 'ArrowDown') {
      if (suggestions.length === 0) return
      e.preventDefault()
      setOpen(true)
      setActiveIndex((i) => (i + 1) % suggestions.length)
    } else if (e.key === 'ArrowUp') {
      if (suggestions.length === 0) return
      e.preventDefault()
      setActiveIndex((i) => (i <= 0 ? suggestions.length - 1 : i - 1))
    } else if (e.key === 'Enter') {
      if (activeIndex >= 0 && suggestions[activeIndex]) {
        e.preventDefault()
        goToEntry(suggestions[activeIndex].id)
        return
      }
      // No highlighted suggestion:
      if (formMode) return // let the parent <form> submit
      e.preventDefault()
      if (onPlainEnter) onPlainEnter(value)
      else goToSearch(value)
    } else if (e.key === 'Escape') {
      setOpen(false)
      setActiveIndex(-1)
    }
  }

  const showDropdown = open && value.trim().length > 0 && (suggestions.length > 0 || loading)

  return (
    <div className={`relative ${className}`}>
      <input
        type="text"
        name={name}
        value={value}
        onChange={(e) => setValue(e.target.value)}
        onKeyDown={handleKeyDown}
        onFocus={() => value.trim() && suggestions.length > 0 && setOpen(true)}
        onBlur={() => {
          blurTimerRef.current = setTimeout(() => setOpen(false), 120)
        }}
        placeholder={placeholder}
        autoComplete="off"
        role="combobox"
        aria-expanded={showDropdown}
        aria-controls={listboxId}
        aria-autocomplete="list"
        aria-activedescendant={activeIndex >= 0 ? `${listboxId}-opt-${activeIndex}` : undefined}
        className={inputClassName}
      />

      {showDropdown && (
        <ul
          id={listboxId}
          role="listbox"
          className="absolute left-0 right-0 top-full mt-2 z-50 max-h-80 overflow-auto rounded-xl border border-neutral-200 bg-white shadow-strong text-left"
        >
          {loading && suggestions.length === 0 && (
            <li className="px-4 py-3 text-xs font-black uppercase tracking-widest text-neutral-600">
              Searching...
            </li>
          )}
          {suggestions.map((s, i) => (
            <li
              key={s.id}
              id={`${listboxId}-opt-${i}`}
              role="option"
              aria-selected={i === activeIndex}
              // onMouseDown fires before input blur, so the click registers.
              onMouseDown={(e) => {
                e.preventDefault()
                goToEntry(s.id)
              }}
              onMouseEnter={() => setActiveIndex(i)}
              className={`cursor-pointer px-4 py-3 border-b border-neutral-100 last:border-b-0 ${
                i === activeIndex ? 'bg-accent-50' : 'bg-white'
              }`}
            >
              <div className="flex items-center justify-between gap-3">
                <span className="font-black text-neutral-900 truncate">{s.headword}</span>
                <span className="flex items-center gap-2 shrink-0">
                  {String(s.part_of_speech || '').toLowerCase() === 'phrase' && (
                    <span className="text-[8px] font-black uppercase tracking-widest text-neutral-500 bg-neutral-100 border border-neutral-200 px-2 py-0.5 rounded">
                      Phrase
                    </span>
                  )}
                  {s.language_name && (
                    <span className="text-[9px] font-black uppercase tracking-widest text-accent-700 bg-accent-50 border border-accent-100 px-2 py-0.5 rounded">
                      {s.language_name}
                    </span>
                  )}
                </span>
              </div>
              {s.primary_definition && (
                <p className="mt-1 text-xs text-neutral-500 font-medium line-clamp-1">{s.primary_definition}</p>
              )}
            </li>
          ))}
        </ul>
      )}
    </div>
  )
}
