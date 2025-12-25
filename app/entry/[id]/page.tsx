'use client'

import { useParams } from 'next/navigation'
import Link from 'next/link'
import { mockEntries, mockLanguages } from '@/lib/mockData'

export default function EntryPage() {
  const params = useParams()
  const id = params.id as string
  
  const entry = mockEntries.find(e => e.id === id)
  const language = entry ? mockLanguages.find(l => l.id === entry.language_id) : null

  if (!entry || !language) {
    return (
      <div className="min-h-screen flex items-center justify-center">
        <div className="text-center">
          <h1 className="text-4xl font-bold text-gray-900 mb-4">Word Not Found</h1>
          <p className="text-gray-600 mb-6">This entry doesn&apos;t exist yet.</p>
          <Link href="/">
            <button className="bg-primary-500 text-white px-6 py-3 rounded-lg hover:bg-primary-600 transition">
              ← Back to Home
            </button>
          </Link>
        </div>
      </div>
    )
  }

  return (
    <div className="min-h-screen bg-gray-50">
      {/* Breadcrumb */}
      <div className="bg-white border-b border-gray-200">
        <div className="max-w-4xl mx-auto px-4 sm:px-6 lg:px-8 py-4">
          <div className="flex items-center gap-2 text-sm text-gray-600">
            <Link href="/" className="hover:text-primary-600">Home</Link>
            <span>›</span>
            <Link href="/search" className="hover:text-primary-600">Search</Link>
            <span>›</span>
            <span className="text-gray-900 font-medium">{entry.headword}</span>
          </div>
        </div>
      </div>

      {/* Main Content */}
      <div className="max-w-4xl mx-auto px-4 sm:px-6 lg:px-8 py-12">
        {/* Header */}
        <div className="bg-white rounded-2xl shadow-lg p-8 mb-6">
          <div className="flex items-start justify-between mb-6">
            <div>
              <div className="flex items-center gap-3 mb-2">
                <h1 className="text-5xl font-bold text-gray-900">{entry.headword}</h1>
                <button className="text-primary-600 hover:text-primary-700 text-2xl">
                  🔊
                </button>
              </div>
              <p className="text-lg text-gray-600">
                {language.name} • {entry.part_of_speech}
              </p>
            </div>
            <div className="flex items-center gap-2">
              <span className="bg-green-100 text-green-700 px-4 py-2 rounded-full text-sm font-bold">
                ✓ Verified
              </span>
              <span className="bg-gray-100 text-gray-700 px-4 py-2 rounded-full text-sm font-medium">
                {entry.trust_score}% trust
              </span>
            </div>
          </div>

          {/* Primary Definition */}
          <div className="border-t border-gray-200 pt-6">
            <h2 className="text-sm font-bold text-gray-500 uppercase tracking-wide mb-3">
              Definition
            </h2>
            <p className="text-xl text-gray-800 leading-relaxed">
              {entry.primary_definition}
            </p>
          </div>
        </div>

        {/* Translations */}
        {entry.translations && entry.translations.length > 0 && (
          <div className="bg-white rounded-2xl shadow-lg p-8 mb-6">
            <h2 className="text-2xl font-bold text-gray-900 mb-6 flex items-center gap-2">
              🌍 Translations
            </h2>
            <div className="space-y-4">
              {entry.translations.map((trans, idx) => (
                <div key={idx} className="flex items-start gap-4 pb-4 border-b border-gray-100 last:border-0">
                  <div className="flex-1">
                    <p className="text-sm font-medium text-gray-500 mb-1">{trans.language}</p>
                    <p className="text-2xl font-semibold text-gray-900">{trans.word}</p>
                  </div>
                  <button className="text-primary-600 hover:text-primary-700 mt-2">
                    🔊
                  </button>
                </div>
              ))}
            </div>
            <button className="mt-6 text-primary-600 hover:text-primary-700 font-medium text-sm">
              + Add translation
            </button>
          </div>
        )}

        {/* Usage & Context */}
        {entry.contexts && entry.contexts.length > 0 && (
          <div className="bg-white rounded-2xl shadow-lg p-8 mb-6">
            <h2 className="text-2xl font-bold text-gray-900 mb-6 flex items-center gap-2">
              💬 Usage & Context
            </h2>
            <div className="space-y-6">
              {entry.contexts.map((context, idx) => (
                <div key={idx} className="border border-gray-200 rounded-xl p-6 hover:border-primary-300 transition">
                  <div className="flex items-start justify-between mb-4">
                    <span className="bg-primary-100 text-primary-700 px-3 py-1 rounded-full text-xs font-bold uppercase">
                      {context.type}
                    </span>
                    <div className="flex items-center gap-4">
                      <button className="flex items-center gap-1 text-gray-600 hover:text-primary-600">
                        <span>👍</span>
                        <span className="font-medium">{context.upvotes}</span>
                      </button>
                      <button className="flex items-center gap-1 text-gray-600 hover:text-gray-700">
                        <span>👎</span>
                      </button>
                    </div>
                  </div>
                  <p className="text-gray-700 mb-3 leading-relaxed">{context.text}</p>
                  {context.example && (
                    <div className="bg-gray-50 rounded-lg p-4 border-l-4 border-primary-500">
                      <p className="text-gray-800 italic">&quot;{context.example}&quot;</p>
                    </div>
                  )}
                </div>
              ))}
            </div>
            <button className="mt-6 text-primary-600 hover:text-primary-700 font-medium text-sm">
              + Add your usage example
            </button>
          </div>
        )}

        {/* Actions */}
        <div className="flex items-center gap-4">
          <button className="flex-1 bg-primary-500 text-white px-6 py-3 rounded-xl hover:bg-primary-600 transition font-medium">
            ✏️ Suggest Edit
          </button>
          <button className="flex-1 border-2 border-gray-300 text-gray-700 px-6 py-3 rounded-xl hover:border-primary-500 hover:text-primary-600 transition font-medium">
            🚩 Report Issue
          </button>
          <button className="border-2 border-gray-300 text-gray-700 px-6 py-3 rounded-xl hover:border-primary-500 hover:text-primary-600 transition">
            🔗
          </button>
          <button className="border-2 border-gray-300 text-gray-700 px-6 py-3 rounded-xl hover:border-primary-500 hover:text-primary-600 transition">
            ⭐
          </button>
        </div>
      </div>
    </div>
  )
}