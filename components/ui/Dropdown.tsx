'use client'

import { useCallback, useEffect, useId, useMemo, useRef, useState } from 'react'
import { createPortal } from 'react-dom'

/**
 * The dropdown.
 *
 * The native select was kept for a long time on the argument that the system
 * picker beats anything reimplemented in JavaScript. That argument holds for a
 * short list. It stops holding at thirty-six languages, where the native
 * control offers no search, no native name beside the English one, no word
 * count, and no way to tell a language with a corpus from one with nothing in
 * it. People were being asked to scroll a flat alphabetical list to find their
 * own language, which is a poor first interaction on a site about their
 * language.
 *
 * So this is a real listbox. It keeps the parts of the native control that were
 * doing actual work, which are the keyboard behaviour and the screen reader
 * semantics, and adds what the native control cannot express.
 *
 * On a phone it opens as a sheet from the bottom rather than a floating panel,
 * because a panel anchored to a trigger near the fold ends up half off screen,
 * and because the thumb is already at the bottom of the device.
 */

export type DropdownOption = {
  value: string
  label: string
  /** Second line. The native name, usually. */
  hint?: string
  /** Right aligned, mono. A count, usually. */
  meta?: string
  disabled?: boolean
}

export type DropdownGroup = {
  label: string
  options: DropdownOption[]
}

type DropdownProps = {
  id?: string
  value: string
  onChange: (value: string) => void
  options: DropdownOption[] | DropdownGroup[]
  /** Shown when nothing is selected. */
  placeholder?: string
  /** 'auto' turns search on once the list is long enough to need it. */
  searchable?: boolean | 'auto'
  searchPlaceholder?: string
  tone?: 'light' | 'dark'
  size?: 'md' | 'lg'
  className?: string
  disabled?: boolean
  'aria-label'?: string
}

/** Below this a list is quicker to scan by eye than to filter by typing. */
const SEARCH_THRESHOLD = 8

function isGrouped(
  options: DropdownOption[] | DropdownGroup[]
): options is DropdownGroup[] {
  return options.length > 0 && 'options' in options[0]
}

/** Kenyan language names carry diacritics that nobody types into a search box. */
function fold(text: string) {
  return text
    .normalize('NFD')
    .replace(/[̀-ͯ]/g, '')
    .toLowerCase()
}

export default function Dropdown({
  id,
  value,
  onChange,
  options,
  placeholder = 'Choose one',
  searchable = 'auto',
  searchPlaceholder = 'Type to filter',
  tone = 'light',
  size = 'md',
  className = '',
  disabled = false,
  'aria-label': ariaLabel,
}: DropdownProps) {
  const reactId = useId()
  const listId = `${id ?? reactId}-list`

  const [open, setOpen] = useState(false)
  const [query, setQuery] = useState('')
  const [activeIndex, setActiveIndex] = useState(-1)
  const [mounted, setMounted] = useState(false)
  const [rect, setRect] = useState<{
    left: number
    top: number
    width: number
    flip: boolean
    maxHeight: number
  } | null>(null)

  const triggerRef = useRef<HTMLButtonElement | null>(null)
  const panelRef = useRef<HTMLDivElement | null>(null)
  const searchRef = useRef<HTMLInputElement | null>(null)
  const activeRef = useRef<HTMLLIElement | null>(null)
  /** Buffer for type-to-find on the lists that have no search field. */
  const typedRef = useRef({ text: '', at: 0 })

  useEffect(() => setMounted(true), [])

  const groups: DropdownGroup[] = useMemo(
    () => (isGrouped(options) ? options : [{ label: '', options }]),
    [options]
  )

  const allOptions = useMemo(() => groups.flatMap((group) => group.options), [groups])

  const useSearch =
    searchable === 'auto' ? allOptions.length >= SEARCH_THRESHOLD : searchable

  const filtered: DropdownGroup[] = useMemo(() => {
    const term = fold(query.trim())
    if (!term) return groups
    return groups
      .map((group) => ({
        ...group,
        options: group.options.filter(
          (option) =>
            fold(option.label).includes(term) ||
            (option.hint ? fold(option.hint).includes(term) : false)
        ),
      }))
      .filter((group) => group.options.length > 0)
  }, [groups, query])

  /** Flat, in render order, so the arrows walk across group borders. */
  const flat = useMemo(() => filtered.flatMap((group) => group.options), [filtered])

  const selected = allOptions.find((option) => option.value === value) ?? null

  const place = useCallback(() => {
    const trigger = triggerRef.current
    if (!trigger) return
    const box = trigger.getBoundingClientRect()
    const below = window.innerHeight - box.bottom
    const above = box.top
    // Open upwards when there is not enough room below and more room above.
    // A list anchored near the fold is otherwise unreachable.
    const flip = below < 260 && above > below
    setRect({
      left: box.left,
      top: flip ? box.top : box.bottom,
      width: box.width,
      flip,
      maxHeight: Math.max(180, Math.min(360, (flip ? above : below) - 16)),
    })
  }, [])

  useEffect(() => {
    if (!open) return
    place()
    const reposition = () => place()
    window.addEventListener('scroll', reposition, true)
    window.addEventListener('resize', reposition)
    return () => {
      window.removeEventListener('scroll', reposition, true)
      window.removeEventListener('resize', reposition)
    }
  }, [open, place])

  // Open on the current selection, so the list starts where it was left.
  useEffect(() => {
    if (!open) return
    setQuery('')
    setActiveIndex(allOptions.findIndex((option) => option.value === value))
    const focus = window.setTimeout(() => {
      if (useSearch) searchRef.current?.focus()
      else panelRef.current?.focus()
    }, 0)
    return () => window.clearTimeout(focus)
  }, [open, useSearch, value, allOptions])

  // Filtering shortens the list, so an index taken from the longer one dangles.
  useEffect(() => {
    if (open && activeIndex >= flat.length) setActiveIndex(flat.length - 1)
  }, [flat.length, activeIndex, open])

  useEffect(() => {
    activeRef.current?.scrollIntoView({ block: 'nearest' })
  }, [activeIndex])

  useEffect(() => {
    if (!open) return
    const onPointer = (event: PointerEvent) => {
      const target = event.target as Node
      if (panelRef.current?.contains(target)) return
      if (triggerRef.current?.contains(target)) return
      setOpen(false)
    }
    document.addEventListener('pointerdown', onPointer)
    return () => document.removeEventListener('pointerdown', onPointer)
  }, [open])

  const close = useCallback((refocus = true) => {
    setOpen(false)
    setQuery('')
    if (refocus) triggerRef.current?.focus()
  }, [])

  const commit = useCallback(
    (option: DropdownOption) => {
      if (option.disabled) return
      onChange(option.value)
      close()
    },
    [onChange, close]
  )

  const step = useCallback(
    (delta: number) => {
      if (flat.length === 0) return
      setActiveIndex((current) => {
        let next = current
        // Walk past disabled rows rather than parking the highlight on one.
        for (let hop = 0; hop < flat.length; hop += 1) {
          next = (next + delta + flat.length) % flat.length
          if (!flat[next].disabled) return next
        }
        return current
      })
    },
    [flat]
  )

  const onKeyDown = (event: React.KeyboardEvent) => {
    switch (event.key) {
      case 'ArrowDown':
        event.preventDefault()
        step(1)
        break
      case 'ArrowUp':
        event.preventDefault()
        step(-1)
        break
      case 'Home':
        event.preventDefault()
        setActiveIndex(0)
        break
      case 'End':
        event.preventDefault()
        setActiveIndex(flat.length - 1)
        break
      case 'Enter':
        event.preventDefault()
        if (activeIndex >= 0 && flat[activeIndex]) commit(flat[activeIndex])
        break
      case 'Tab':
        close(false)
        break
      case 'Escape':
        event.preventDefault()
        close()
        break
      default:
        // Type-to-find, for the lists with no search field. The native control
        // does this, and losing it would be a regression.
        if (!useSearch && event.key.length === 1 && !event.metaKey && !event.ctrlKey) {
          const now = Date.now()
          const buffer = now - typedRef.current.at > 900 ? '' : typedRef.current.text
          typedRef.current = { text: buffer + event.key, at: now }
          const at = flat.findIndex((option) =>
            fold(option.label).startsWith(fold(typedRef.current.text))
          )
          if (at >= 0) setActiveIndex(at)
        }
    }
  }

  const triggerKeyDown = (event: React.KeyboardEvent) => {
    if (['ArrowDown', 'ArrowUp', 'Enter', ' '].includes(event.key)) {
      event.preventDefault()
      setOpen(true)
    }
  }

  const pad = size === 'lg' ? 'px-4 py-[0.9375rem] text-lg' : 'px-4 py-3 text-base'

  const triggerClass = [
    'dropdown-trigger flex w-full items-center justify-between gap-3 text-left',
    pad,
    tone === 'dark' ? 'dropdown-trigger-dark' : '',
    open ? 'is-open' : '',
    className,
  ]
    .filter(Boolean)
    .join(' ')

  // Rendered rows are nested inside their groups, but the keyboard walks a flat
  // list, so the two have to agree on an index. This counts as it renders.
  let cursor = -1

  const panel = (
    <div
      ref={panelRef}
      tabIndex={-1}
      onKeyDown={onKeyDown}
      className="dropdown-panel"
      data-flip={rect?.flip ? 'up' : 'down'}
      style={
        rect
          ? ({
              '--dd-left': `${rect.left}px`,
              '--dd-top': `${rect.top}px`,
              '--dd-width': `${rect.width}px`,
              '--dd-max': `${rect.maxHeight}px`,
            } as React.CSSProperties)
          : undefined
      }
    >
      {useSearch && (
        <div className="dropdown-search">
          <svg width="15" height="15" viewBox="0 0 16 16" aria-hidden="true" fill="none">
            <circle cx="7" cy="7" r="4.6" stroke="currentColor" strokeWidth="1.7" />
            <path
              d="M10.6 10.6 14 14"
              stroke="currentColor"
              strokeWidth="1.7"
              strokeLinecap="round"
            />
          </svg>
          <input
            ref={searchRef}
            type="text"
            role="combobox"
            aria-expanded="true"
            aria-controls={listId}
            aria-autocomplete="list"
            aria-activedescendant={
              activeIndex >= 0 && flat[activeIndex] ? `${listId}-${activeIndex}` : undefined
            }
            value={query}
            onChange={(event) => {
              setQuery(event.target.value)
              setActiveIndex(0)
            }}
            placeholder={searchPlaceholder}
            autoComplete="off"
            spellCheck={false}
          />
          {query && (
            <button type="button" onClick={() => setQuery('')} aria-label="Clear the filter">
              Clear
            </button>
          )}
        </div>
      )}

      <ul id={listId} role="listbox" aria-label={ariaLabel} className="dropdown-list">
        {flat.length === 0 && (
          <li className="dropdown-empty" role="presentation">
            Nothing here matches <strong>{query}</strong>.
          </li>
        )}

        {filtered.map((group) => (
          <li key={group.label || 'ungrouped'} role="presentation">
            {group.label && <p className="dropdown-group">{group.label}</p>}
            <ul role="group" aria-label={group.label || undefined}>
              {group.options.map((option) => {
                cursor += 1
                const index = cursor
                const isSelected = option.value === value
                return (
                  <li
                    key={option.value}
                    id={`${listId}-${index}`}
                    ref={index === activeIndex ? activeRef : undefined}
                    role="option"
                    aria-selected={isSelected}
                    aria-disabled={option.disabled || undefined}
                    data-active={index === activeIndex || undefined}
                    data-selected={isSelected || undefined}
                    data-disabled={option.disabled || undefined}
                    onPointerMove={() => !option.disabled && setActiveIndex(index)}
                    onClick={() => commit(option)}
                    className="dropdown-option"
                    style={{ '--i': Math.min(index, 14) } as React.CSSProperties}
                  >
                    <span className="dropdown-tick" aria-hidden="true">
                      {isSelected ? '◉' : ''}
                    </span>
                    <span className="dropdown-body">
                      <span className="dropdown-label">{option.label}</span>
                      {option.hint && <span className="dropdown-hint">{option.hint}</span>}
                    </span>
                    {option.meta && <span className="dropdown-meta">{option.meta}</span>}
                  </li>
                )
              })}
            </ul>
          </li>
        ))}
      </ul>
    </div>
  )

  return (
    <>
      <button
        ref={triggerRef}
        id={id}
        type="button"
        role="combobox"
        aria-haspopup="listbox"
        aria-expanded={open}
        aria-controls={open ? listId : undefined}
        aria-label={ariaLabel}
        disabled={disabled}
        onClick={() => (open ? close() : setOpen(true))}
        onKeyDown={triggerKeyDown}
        className={triggerClass}
      >
        <span className={selected ? 'truncate' : 'dropdown-placeholder truncate'}>
          {selected ? selected.label : placeholder}
        </span>
        <svg
          width="12"
          height="8"
          viewBox="0 0 12 8"
          aria-hidden="true"
          className="dropdown-chevron shrink-0"
        >
          <path d="M1 1l5 5 5-5" fill="none" stroke="currentColor" strokeWidth="1.8" />
        </svg>
      </button>

      {mounted &&
        open &&
        createPortal(
          <div className="dropdown-layer">
            <div className="dropdown-scrim" onClick={() => close()} aria-hidden="true" />
            {panel}
          </div>,
          document.body
        )}
    </>
  )
}
