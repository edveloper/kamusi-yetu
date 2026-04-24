 'use client'

import { useEffect, useState } from 'react'
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
  if (score >= 0.85) return 'High'
  if (score >= 0.6) return 'Medium'
  return 'Low'
}

function pathLabel(path: TranslationCandidate['path_type']) {
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

const translationExamples = [
  {
    sourceText: 'salama',
    sourceLabel: 'Swahili',
    targetText: 'peace; safety',
    targetLabel: 'English',
  },
  {
    sourceText: 'poisho?',
    sourceLabel: 'Pokot',
    targetText: 'hello',
    targetLabel: 'English',
  },
  {
    sourceText: 'Milembe',
    sourceLabel: 'Logooli',
    targetText: 'hello',
    targetLabel: 'English',
  },
]

export default function TranslatePage() {
  const [languages, setLanguages] = useState<LanguageOption[]>([])
  const [sourceLanguageId, setSourceLanguageId] = useState('')
  const [targetLanguageId, setTargetLanguageId] = useState('')
  const [text, setText] = useState('')
  const [loading, setLoading] = useState(false)
  const [error, setError] = useState('')
  const [results, setResults] = useState<TranslationCandidate[]>([])
  const [feedbackMap, setFeedbackMap] = useState<Record<string, TranslationFeedbackVerdict>>({})
  const [feedbackPending, setFeedbackPending] = useState<Record<string, boolean>>({})
  const groupedLanguages = groupLanguages(languages)

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

  const onSubmit = async (e: React.FormEvent) => {
    e.preventDefault()
    setError('')

    if (!text.trim() || !sourceLanguageId || !targetLanguageId) {
      setError('Enter text and choose both source and target languages.')
      return
    }

    setLoading(true)
    try {
      const data = await translateText({
        text: text.trim(),
        sourceLanguageId,
        targetLanguageId,
        limit: 10
      })
      setResults(data)
      setFeedbackMap({})
    } catch (err) {
      const message = err instanceof Error ? err.message : 'Translation failed.'
      setError(message)
      setResults([])
    } finally {
      setLoading(false)
    }
  }

  const candidateKey = (r: TranslationCandidate, index: number) =>
    `${r.source_entry_id}-${r.target_entry_id || 'none'}-${index}`

  const onFeedback = async (
    candidate: TranslationCandidate,
    verdict: TranslationFeedbackVerdict,
    index: number
  ) => {
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
      const message = err instanceof Error ? err.message : 'Could not submit feedback.'
      setError(message)
    } finally {
      setFeedbackPending((prev) => ({ ...prev, [key]: false }))
    }
  }

  return (
    <div className="min-h-screen bg-stone-50 pb-20">
      <div className="bg-emerald-900 text-white py-20 border-b border-emerald-800">
        <div className="max-w-4xl mx-auto px-4">
          <h1 className="text-5xl md:text-6xl font-black font-logo tracking-tight">Translate</h1>
          <p className="text-emerald-100/80 mt-4 text-lg">
            Find verified dictionary translations and bridge-assisted candidates across Kenyan languages.
          </p>
        </div>
      </div>

      <div className="max-w-4xl mx-auto px-4 -mt-10">
        <div className="mb-6 bg-emerald-50 border border-emerald-100 rounded-2xl p-5">
          <p className="text-sm text-emerald-900 font-semibold mb-3"><strong>How to read results:</strong></p>
          <div className="grid md:grid-cols-3 gap-4 text-sm text-emerald-800">
            <div><strong>Confidence:</strong> High = verified by multiple reviewers; Medium = likely correct; Low = preliminary match.</div>
            <div><strong>Direct:</strong> Found in our verified dictionary for this language pair. <strong>Bridge:</strong> Found via English or Swahili translation. <strong>Pivot:</strong> Routed through multiple languages.</div>
            <div><strong>Phrase vs Word:</strong> Phrase matches indicate multi-word expressions with specific meaning. Word matches are single lexical units.</div>
          </div>
        </div>
        <div className="mb-6 grid md:grid-cols-3 gap-4">
          {translationExamples.map((example) => (
            <button
              key={`${example.sourceText}-${example.sourceLabel}`}
              type="button"
              onClick={() => setText(example.sourceText)}
              className="text-left rounded-[1.5rem] border border-stone-200 bg-white p-5 shadow-sm hover:border-emerald-200 hover:bg-emerald-50/40 transition-all"
            >
              <p className="text-[10px] font-black uppercase tracking-[0.2em] text-stone-400 mb-2">Example</p>
              <p className="text-xl font-black text-stone-900">{example.sourceText}</p>
              <p className="text-[10px] font-black uppercase tracking-[0.2em] text-stone-400 mt-1">{example.sourceLabel}</p>
              <div className="my-3 h-px bg-stone-100"></div>
              <p className="text-lg font-black text-emerald-700">{example.targetText}</p>
              <p className="text-[10px] font-black uppercase tracking-[0.2em] text-stone-400 mt-1">{example.targetLabel}</p>
            </button>
          ))}
        </div>

        <form onSubmit={onSubmit} className="bg-white p-8 rounded-[2rem] border border-stone-200 shadow-xl space-y-6">
          <div className="grid md:grid-cols-2 gap-4">
            <div>
              <label className="block text-[10px] font-black text-stone-400 uppercase tracking-widest mb-2">Source Language</label>
              <select
                value={sourceLanguageId}
                onChange={(e) => setSourceLanguageId(e.target.value)}
                className="w-full px-4 py-3 rounded-xl border border-stone-200 bg-stone-50"
              >
                <option value="">Select source...</option>
                {groupedLanguages.map((group) => (
                  <optgroup key={group.key} label={group.label}>
                    {group.languages.map((l) => (
                      <option key={l.id} value={l.id}>{l.name}</option>
                    ))}
                  </optgroup>
                ))}
              </select>
            </div>

            <div>
              <label className="block text-[10px] font-black text-stone-400 uppercase tracking-widest mb-2">Target Language</label>
              <select
                value={targetLanguageId}
                onChange={(e) => setTargetLanguageId(e.target.value)}
                className="w-full px-4 py-3 rounded-xl border border-stone-200 bg-stone-50"
              >
                <option value="">Select target...</option>
                {groupedLanguages.map((group) => (
                  <optgroup key={group.key} label={group.label}>
                    {group.languages.map((l) => (
                      <option key={l.id} value={l.id}>{l.name}</option>
                    ))}
                  </optgroup>
                ))}
              </select>
            </div>
          </div>

          <div>
            <label className="block text-[10px] font-black text-stone-400 uppercase tracking-widest mb-2">Text</label>
            <input
              value={text}
              onChange={(e) => setText(e.target.value)}
              placeholder="Type a word or phrase..."
              className="w-full px-4 py-4 rounded-xl border border-stone-200 bg-stone-50"
            />
            <p className="mt-3 text-sm text-stone-500 font-medium">
              Try one of the examples above, or enter a word or short phrase from any active language.
            </p>
          </div>

          {error && (
            <div className="rounded-xl border border-red-200 bg-red-50 px-4 py-3 text-sm text-red-700 font-bold">
              {error}
            </div>
          )}

          <button
            type="submit"
            disabled={loading}
            className="bg-emerald-700 text-white px-6 py-3 rounded-xl font-black text-xs uppercase tracking-widest disabled:opacity-60"
          >
            {loading ? 'Translating...' : 'Translate'}
          </button>
        </form>

        <div className="mt-8 space-y-4">
          {results.map((r, index) => {
            const key = candidateKey(r, index)
            const hasFeedback = !!feedbackMap[key]
            const pending = !!feedbackPending[key]
            const canRate = !!r.target_entry_id
            return (
            <div key={key} className="bg-white p-6 rounded-2xl border border-stone-200">
              <div className="flex flex-wrap items-center gap-2 mb-2">
                <span className="text-[10px] font-black uppercase tracking-widest px-2 py-1 rounded bg-stone-900 text-white border border-stone-800">
                  {matchKindLabel(r.match_kind)}
                </span>
                <span className="text-[10px] font-black uppercase tracking-widest px-2 py-1 rounded bg-emerald-50 text-emerald-700 border border-emerald-100">
                  {pathLabel(r.path_type)}
                </span>
                <span className="text-[10px] font-black uppercase tracking-widest px-2 py-1 rounded bg-stone-100 text-stone-600 border border-stone-200">
                  Confidence {confidenceLabel(r.confidence)} ({Math.round(r.confidence * 100)}%)
                </span>
              </div>
              <p className="text-2xl font-black font-logo text-stone-900">{r.translation}</p>

              <div className="mt-4 flex flex-wrap items-center gap-2">
                <button
                  type="button"
                  onClick={() => onFeedback(r, 'correct', index)}
                  disabled={!canRate || pending}
                  className="px-3 py-2 rounded-lg text-[10px] font-black uppercase tracking-widest border border-emerald-200 bg-emerald-50 text-emerald-700 disabled:opacity-50"
                >
                  Correct
                </button>
                <button
                  type="button"
                  onClick={() => onFeedback(r, 'partially_correct', index)}
                  disabled={!canRate || pending}
                  className="px-3 py-2 rounded-lg text-[10px] font-black uppercase tracking-widest border border-amber-200 bg-amber-50 text-amber-700 disabled:opacity-50"
                >
                  Partly
                </button>
                <button
                  type="button"
                  onClick={() => onFeedback(r, 'incorrect', index)}
                  disabled={!canRate || pending}
                  className="px-3 py-2 rounded-lg text-[10px] font-black uppercase tracking-widest border border-red-200 bg-red-50 text-red-700 disabled:opacity-50"
                >
                  Incorrect
                </button>
                {hasFeedback && (
                  <span className="text-[10px] font-black uppercase tracking-widest text-stone-500">
                    Feedback saved: {feedbackMap[key].replace('_', ' ')}
                  </span>
                )}
                {!canRate && (
                  <span className="text-[10px] font-black uppercase tracking-widest text-stone-400">
                    Not rateable yet
                  </span>
                )}
              </div>
            </div>
          )})}

          {!loading && results.length === 0 && (
            <div className="text-center text-stone-400 text-sm py-10">No translation candidates yet.</div>
          )}
        </div>

        <section className="mt-16 mb-0">
          <div className="bg-gradient-to-r from-emerald-600 to-emerald-700 rounded-3xl p-12 md:p-16 text-white shadow-xl">
            <div className="text-center">
              <h2 className="text-4xl font-black font-logo mb-4">Help Strengthen Translations</h2>
              <p className="text-emerald-100 text-lg font-medium mb-8 max-w-3xl mx-auto">
                Your contributions improve translation accuracy across all languages. Add verified entries and help bridge language gaps.
              </p>
              <div className="flex flex-wrap justify-center gap-4">
                <Link href="/contribute" className="px-8 py-4 rounded-2xl bg-white text-emerald-900 font-black text-lg hover:bg-emerald-50 transition">
                  Add an Entry
                </Link>
                <Link href="/explore" className="px-8 py-4 rounded-2xl border-2 border-white text-white font-black text-lg hover:bg-white/10 transition">
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
