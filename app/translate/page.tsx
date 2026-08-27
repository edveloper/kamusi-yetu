 'use client'

import { useCallback, useEffect, useRef, useState } from 'react'
import Link from 'next/link'
import { getLanguages } from '@/lib/api/languages'
import {
  translateText,
  submitTranslationFeedback,
  type TranslationCandidate,
  type TranslationFeedbackVerdict
} from '@/lib/api/translate'
import { groupLanguages } from '@/lib/constants/languageGroups'

type LanguageOption = {
  id: string
  name: string
  code?: string | null
  language_group_key?: string | null
  language_group_label?: string | null
}

function confidenceLabel(score: number) {
  if (score >= 0.85) return 'Strong'
  if (score >= 0.6) return 'Moderate'
  return 'Weak'
}

function pathLabel(path: TranslationCandidate['path_type']) {
  if (path === 'concept') return 'Same meaning'
  if (path === 'direct_edge') return 'Direct'
  if (path === 'direct_bridge') return 'Bridge'
  if (path === 'pivot_sw') return 'Via Swahili'
  if (path === 'pivot_sw_en') return 'Via Swahili->English'
  if (path === 'pivot_en_sw') return 'Via English->Swahili'
  return 'Via English'
}

function matchKindLabel(kind?: TranslationCandidate['match_kind']) {
  if (kind === 'phrase') return 'Phrase Match'
  return 'Word Match'
}

const MAX_CHARS = 500

const translationExamples = [
  { sourceText: 'salama', sourceLabel: 'Swahili', targetText: 'peace; safety', targetLabel: 'English' },
  { sourceText: 'poisho?', sourceLabel: 'Pokot', targetText: 'hello', targetLabel: 'English' },
  { sourceText: 'Milembe', sourceLabel: 'Logooli', targetText: 'hello', targetLabel: 'English' },
]

export default function TranslatePage() {
  const [languages, setLanguages] = useState<LanguageOption[]>([])
  const [sourceLanguageId, setSourceLanguageId] = useState('')
  const [targetLanguageId, setTargetLanguageId] = useState('')
  const [text, setText] = useState('')
  const [loading, setLoading] = useState(false)
  const [error, setError] = useState('')
  const [results, setResults] = useState<TranslationCandidate[]>([])
  const [copied, setCopied] = useState(false)
  const [showMore, setShowMore] = useState(false)
  const [feedbackMap, setFeedbackMap] = useState<Record<string, TranslationFeedbackVerdict>>({})
  const [feedbackPending, setFeedbackPending] = useState<Record<string, boolean>>({})

  const groupedLanguages = groupLanguages(languages)
  const debounceRef = useRef<ReturnType<typeof setTimeout> | null>(null)
  const requestIdRef = useRef(0)

  useEffect(() => {
    async function load() {
      try {
        const data = await getLanguages()
        const list = (data || []) as LanguageOption[]
        setLanguages(list)

        const sw = list.find((l) => (l.code || '').toLowerCase() === 'sw')
        const en = list.find((l) => (l.code || '').toLowerCase() === 'en')
        if (sw?.id) setSourceLanguageId(sw.id)
        if (en?.id) setTargetLanguageId(en.id)
      } catch {
        setError('Failed to load languages.')
      }
    }
    load()
  }, [])

  const runTranslation = useCallback(
    async (value: string, sourceId: string, targetId: string) => {
      const trimmed = value.trim()
      if (!trimmed || !sourceId || !targetId) {
        setResults([])
        setLoading(false)
        return
      }

      const requestId = ++requestIdRef.current
      setLoading(true)
      setError('')
      try {
        const data = await translateText({ text: trimmed, sourceLanguageId: sourceId, targetLanguageId: targetId, limit: 10 })
        // Ignore stale responses if a newer request has started.
        if (requestId !== requestIdRef.current) return
        setResults(data)
        setFeedbackMap({})
        setShowMore(false)
      } catch (err) {
        if (requestId !== requestIdRef.current) return
        setError(err instanceof Error ? err.message : 'Translation failed.')
        setResults([])
      } finally {
        if (requestId === requestIdRef.current) setLoading(false)
      }
    },
    []
  )

  // Debounced, instant translation as the user types or changes languages.
  useEffect(() => {
    if (debounceRef.current) clearTimeout(debounceRef.current)
    if (!text.trim() || !sourceLanguageId || !targetLanguageId) {
      setResults([])
      setLoading(false)
      return
    }
    debounceRef.current = setTimeout(() => {
      runTranslation(text, sourceLanguageId, targetLanguageId)
    }, 450)
    return () => {
      if (debounceRef.current) clearTimeout(debounceRef.current)
    }
  }, [text, sourceLanguageId, targetLanguageId, runTranslation])

  const topResult = results[0]
  const moreResults = results.slice(1)

  const onSwap = () => {
    const prevTop = topResult?.translation ?? ''
    setSourceLanguageId(targetLanguageId)
    setTargetLanguageId(sourceLanguageId)
    // Round-trip the visible translation back into the input, DeepL-style.
    if (prevTop) setText(prevTop)
  }

  const onCopy = async () => {
    if (!topResult?.translation) return
    try {
      await navigator.clipboard.writeText(topResult.translation)
      setCopied(true)
      setTimeout(() => setCopied(false), 1500)
    } catch {
      setError('Could not copy to clipboard.')
    }
  }

  const candidateKey = (r: TranslationCandidate, index: number) =>
    `${r.source_entry_id}-${r.target_entry_id || 'none'}-${index}`

  const onFeedback = async (candidate: TranslationCandidate, verdict: TranslationFeedbackVerdict, index: number) => {
    const key = candidateKey(candidate, index)
    if (!candidate.target_entry_id) {
      setError('This result cannot be rated yet because it is not mapped to a target entry.')
      return
    }
    setFeedbackPending((prev) => ({ ...prev, [key]: true }))
    setError('')
    try {
      await submitTranslationFeedback({
        sourceEntryId: candidate.source_entry_id,
        targetEntryId: candidate.target_entry_id,
        sourceLanguageId,
        targetLanguageId,
        pathType: candidate.path_type,
        confidence: candidate.confidence,
        verdict
      })
      setFeedbackMap((prev) => ({ ...prev, [key]: verdict }))
    } catch (err) {
      setError(err instanceof Error ? err.message : 'Could not submit feedback.')
    } finally {
      setFeedbackPending((prev) => ({ ...prev, [key]: false }))
    }
  }

  const languageOptions = (
    <>
      {groupedLanguages.map((group) => (
        <optgroup key={group.key} label={group.label}>
          {group.languages.map((l) => (
            <option key={l.id} value={l.id}>{l.name}</option>
          ))}
        </optgroup>
      ))}
    </>
  )

  const renderMeta = (r: TranslationCandidate) => (
    <div className="flex flex-wrap items-center gap-2">
      <span className="text-[10px] font-black uppercase tracking-widest px-2 py-1 rounded bg-neutral-900 text-white">
        {matchKindLabel(r.match_kind)}
      </span>
      <span className="text-[10px] font-black uppercase tracking-widest px-2 py-1 rounded bg-accent-50 text-accent-700 border border-accent-100">
        {pathLabel(r.path_type)}
      </span>
      {(r.via_paths ?? []).slice(1).map((path) => (
        <span
          key={path}
          title="An independent route that produced the same result"
          className="text-[10px] font-black uppercase tracking-widest px-2 py-1 rounded bg-neutral-100 text-neutral-600 border border-neutral-200"
        >
          + {pathLabel(path)}
        </span>
      ))}
      <span className="text-[10px] font-black uppercase tracking-widest px-2 py-1 rounded bg-neutral-100 text-neutral-600 border border-neutral-200">
        {confidenceLabel(r.confidence)} match
      </span>
    </div>
  )

  const renderFeedback = (r: TranslationCandidate, index: number) => {
    const key = candidateKey(r, index)
    const hasFeedback = !!feedbackMap[key]
    const pending = !!feedbackPending[key]
    const canRate = !!r.target_entry_id
    return (
      <div className="flex flex-wrap items-center gap-2">
        <span className="text-[10px] font-black uppercase tracking-widest text-neutral-600 mr-1">Rate:</span>
        <button type="button" onClick={() => onFeedback(r, 'correct', index)} disabled={!canRate || pending}
          className="px-3 py-1.5 rounded-lg text-[10px] font-black uppercase tracking-widest border border-accent-200 bg-accent-50 text-accent-700 disabled:opacity-50">
          Correct
        </button>
        <button type="button" onClick={() => onFeedback(r, 'partially_correct', index)} disabled={!canRate || pending}
          className="px-3 py-1.5 rounded-lg text-[10px] font-black uppercase tracking-widest border border-amber-200 bg-amber-50 text-amber-700 disabled:opacity-50">
          Partly
        </button>
        <button type="button" onClick={() => onFeedback(r, 'incorrect', index)} disabled={!canRate || pending}
          className="px-3 py-1.5 rounded-lg text-[10px] font-black uppercase tracking-widest border border-red-200 bg-red-50 text-red-700 disabled:opacity-50">
          Incorrect
        </button>
        {hasFeedback && (
          <span className="text-[10px] font-black uppercase tracking-widest text-neutral-500">
            Saved: {feedbackMap[key].replace('_', ' ')}
          </span>
        )}
        {!canRate && (
          <span className="text-[10px] font-black uppercase tracking-widest text-neutral-600">Not rateable yet</span>
        )}
      </div>
    )
  }

  return (
    <div className="min-h-screen bg-neutral-100 pb-20">
      <div className="relative overflow-hidden bg-heritage-dark text-white py-20 md:py-24 px-4 sm:px-6">
        <div className="relative max-w-5xl mx-auto text-center">
          <p className="text-xs uppercase tracking-[0.35em] text-accent-300 mb-4 font-semibold">Across Kenya&apos;s languages</p>
          <h1 className="text-5xl md:text-6xl lg:text-7xl font-black leading-tight max-w-3xl mx-auto font-display">Translate</h1>
          <p className="mt-6 text-base md:text-lg text-white max-w-2xl mx-auto leading-8">
            Move between Kenya's languages. Find verified meanings and see how communities speak across language boundaries.
          </p>
        </div>
      </div>

      <div className="max-w-5xl mx-auto px-4 -mt-12 relative z-20">
        {/* Two-panel translator */}
        <div className="relative grid md:grid-cols-2 gap-4">
          {/* Source panel */}
          <div className="surface-card p-5 md:p-6 shadow-medium flex flex-col">
            <div className="flex items-center justify-between gap-3 mb-3 pb-3 border-b border-neutral-200">
              <select
                aria-label="Source language"
                value={sourceLanguageId}
                onChange={(e) => setSourceLanguageId(e.target.value)}
                className="font-black text-heritage-dark bg-transparent text-sm uppercase tracking-wide outline-none cursor-pointer"
              >
                <option value="">Select source...</option>
                {languageOptions}
              </select>
            </div>
            <textarea
              value={text}
              onChange={(e) => setText(e.target.value.slice(0, MAX_CHARS))}
              placeholder="Type a word or phrase..."
              rows={6}
              className="w-full flex-1 resize-none bg-transparent text-2xl font-semibold text-neutral-900 placeholder:text-neutral-300 outline-none leading-relaxed"
            />
            <div className="flex items-center justify-between gap-3 mt-3 pt-3 border-t border-neutral-100">
              <span className="text-[10px] font-black uppercase tracking-widest text-neutral-600">
                {text.length}/{MAX_CHARS}
              </span>
              {text && (
                <button type="button" onClick={() => setText('')}
                  className="text-[10px] font-black uppercase tracking-widest text-neutral-600 hover:text-heritage-dark transition-colors">
                  Clear
                </button>
              )}
            </div>
          </div>

          {/* Swap button */}
          <button
            type="button"
            onClick={onSwap}
            aria-label="Swap source and target languages"
            className="absolute left-1/2 top-1/2 -translate-x-1/2 -translate-y-1/2 z-10 w-11 h-11 rounded-full bg-heritage-dark text-white shadow-strong flex items-center justify-center hover:bg-heritage-darker transition-colors rotate-90 md:rotate-0"
          >
            <span className="text-lg font-black" aria-hidden>⇄</span>
          </button>

          {/* Target panel */}
          <div className="surface-card p-5 md:p-6 shadow-medium bg-accent-50/40 flex flex-col">
            <div className="flex items-center justify-between gap-3 mb-3 pb-3 border-b border-neutral-200">
              <select
                aria-label="Target language"
                value={targetLanguageId}
                onChange={(e) => setTargetLanguageId(e.target.value)}
                className="font-black text-heritage-dark bg-transparent text-sm uppercase tracking-wide outline-none cursor-pointer"
              >
                <option value="">Select target...</option>
                {languageOptions}
              </select>
              {topResult && (
                <button type="button" onClick={onCopy}
                  className="text-[10px] font-black uppercase tracking-widest text-accent-700 hover:text-heritage-dark transition-colors">
                  {copied ? 'Copied' : 'Copy'}
                </button>
              )}
            </div>

            <div className="flex-1 min-h-[150px] flex flex-col">
              {loading && !topResult ? (
                <p className="text-2xl font-semibold text-neutral-300 animate-pulse">Translating...</p>
              ) : topResult ? (
                <div className="flex flex-col h-full">
                  <p className="text-2xl md:text-3xl font-black font-display text-heritage-dark leading-snug">
                    {topResult.translation}
                  </p>
                  <div className="mt-4">{renderMeta(topResult)}</div>
                  <div className="mt-4 flex flex-wrap items-center gap-3">
                    {topResult.target_entry_id && (
                      <Link href={`/entry/${topResult.target_entry_id}`}
                        className="text-[11px] font-black uppercase tracking-widest text-heritage-dark hover:text-heritage-darker transition-colors">
                        View full entry →
                      </Link>
                    )}
                  </div>
                  <div className="mt-auto pt-4">{renderFeedback(topResult, 0)}</div>
                </div>
              ) : (
                <p className="text-2xl font-semibold text-neutral-300">
                  {text.trim() ? 'No verified match yet.' : 'Translation appears here.'}
                </p>
              )}
            </div>
          </div>
        </div>

        {error && (
          <div className="mt-4 rounded-xl border border-red-200 bg-red-50 px-4 py-3 text-sm text-red-700 font-bold">
            {error}
          </div>
        )}

        {/* More matches */}
        {moreResults.length > 0 && (
          <div className="mt-6">
            <button type="button" onClick={() => setShowMore((s) => !s)}
              className="rounded-full border border-accent-200 bg-white px-4 py-2 text-[10px] font-black uppercase tracking-[0.2em] text-accent-700 hover:bg-accent-50 transition">
              {showMore ? 'Hide other matches' : `Show ${moreResults.length} other match${moreResults.length > 1 ? 'es' : ''}`}
            </button>
            {showMore && (
              <div className="mt-4 space-y-4">
                {moreResults.map((r, i) => {
                  const index = i + 1
                  return (
                    <div key={candidateKey(r, index)} className="bg-white p-5 rounded-2xl border border-neutral-200">
                      <div className="flex flex-wrap items-start justify-between gap-3">
                        <p className="text-xl font-black font-display text-heritage-dark">{r.translation}</p>
                        {r.target_entry_id && (
                          <Link href={`/entry/${r.target_entry_id}`}
                            className="text-[10px] font-black uppercase tracking-widest text-heritage-dark hover:text-heritage-darker whitespace-nowrap">
                            View entry →
                          </Link>
                        )}
                      </div>
                      <div className="mt-3">{renderMeta(r)}</div>
                      <div className="mt-3">{renderFeedback(r, index)}</div>
                    </div>
                  )
                })}
              </div>
            )}
          </div>
        )}

        {/* Quick examples */}
        <section className="mt-12">
          <h3 className="text-sm font-black uppercase tracking-[0.2em] text-neutral-600 mb-4">Try these examples</h3>
          <div className="grid sm:grid-cols-3 gap-4">
            {translationExamples.map((example) => (
              <button
                key={`${example.sourceText}-${example.sourceLabel}`}
                type="button"
                onClick={() => setText(example.sourceText)}
                className="text-left rounded-2xl border border-accent-200 bg-neutral-100 p-5 shadow-soft hover:border-accent-300 hover:bg-accent-50 transition-all"
              >
                <p className="text-xl font-black text-neutral-900">{example.sourceText}</p>
                <p className="text-[10px] font-black uppercase tracking-[0.2em] text-neutral-600 mt-1">{example.sourceLabel}</p>
                <div className="my-3 h-px bg-neutral-200" />
                <p className="text-lg font-black text-accent-700">{example.targetText}</p>
                <p className="text-[10px] font-black uppercase tracking-[0.2em] text-neutral-600 mt-1">{example.targetLabel}</p>
              </button>
            ))}
          </div>
        </section>

        {/* How to read results */}
        <section className="mt-12">
          <div className="bg-white border border-neutral-200 rounded-2xl p-6 md:p-8">
            <p className="text-xs font-semibold uppercase tracking-[0.35em] text-heritage-dark mb-2">How to Read Results</p>
            <h2 className="text-2xl font-black text-heritage-dark font-display mb-4">Understanding translation confidence</h2>
            <div className="grid md:grid-cols-3 gap-4 text-sm text-neutral-700">
              <div><strong>Match strength</strong> reflects how the result was found, not how many people have reviewed it. A direct match is the strongest; each additional language a result is routed through weakens it.</div>
              <div><strong>Direct:</strong> Both languages have a verified entry for this word. <strong>Bridge:</strong> Found through the entry&apos;s English or Swahili translation. <strong>Pivot:</strong> Routed through a second language to get here.</div>
              <div><strong>Found more than one way:</strong> when a result lists several routes, independent paths agreed on it. That is corroboration, and a good sign.</div>
              <div><strong>Phrase vs Word:</strong> Phrase matches are multi-word expressions with specific meaning. Word matches are single lexical units.</div>
            </div>
          </div>
        </section>

        <section className="mt-12">
          <div className="bg-heritage-dark rounded-2xl p-12 md:p-16 text-white shadow-strong">
            <div className="text-center">
              <h2 className="text-4xl font-black font-display mb-4">Help Strengthen Translations</h2>
              <p className="text-white text-lg font-medium mb-8 max-w-3xl mx-auto">
                Your contributions improve translation accuracy across all languages. Add verified entries and help bridge language gaps.
              </p>
              <div className="flex flex-wrap justify-center gap-4">
                <Link href="/contribute" className="px-8 py-4 rounded-lg bg-accent-300 text-heritage-dark font-black text-lg hover:bg-accent-400 transition shadow-soft">
                  Add an Entry
                </Link>
                <Link href="/explore" className="px-8 py-4 rounded-lg border-2 border-accent-300 text-white font-black text-lg hover:bg-ink-800 transition">
                  Explore Languages
                </Link>
              </div>
            </div>
          </div>
        </section>
      </div>
    </div>
  )
}
