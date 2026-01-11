'use client'

import { useParams } from 'next/navigation'
import Link from 'next/link'
import { useEffect, useState } from 'react'
import { useAuth } from '@/lib/contexts/AuthContext'
import { getEntryById } from '@/lib/api/entries'
import { voteOnContext } from '@/lib/api/users'
import UsageContextForm from '@/components/UsageContextForm'

export default function EntryPage() {
  const params = useParams()
  const id = params.id as string
  const { user } = useAuth()
  
  const [entry, setEntry] = useState<any>(null)
  const [loading, setLoading] = useState(true)
  const [error, setError] = useState(false)
  const [showUsageForm, setShowUsageForm] = useState(false)
  const [votingId, setVotingId] = useState<string | null>(null)

  useEffect(() => {
    loadEntry()
  }, [id])

  async function loadEntry() {
    try {
      const data = await getEntryById(id)
      setEntry(data)
    } catch (err) {
      console.error('Failed to load entry:', err)
      setError(true)
    } finally {
      setLoading(false)
    }
  }

  const handleVote = async (contextId: string, voteType: 'upvote' | 'downvote') => {
    if (!user) {
      alert('Please sign in to vote')
      return
    }

    setVotingId(contextId)
    try {
      await voteOnContext(contextId, voteType)
      // Reload entry to get updated votes
      await loadEntry()
    } catch (err) {
      console.error('Vote failed:', err)
      alert('Failed to record vote. Please try again.')
    } finally {
      setVotingId(null)
    }
  }

  const handleUsageAdded = () => {
    setShowUsageForm(false)
    loadEntry() // Refresh to show new usage context
  }

  if (loading) {
    return (
      <div className="min-h-screen bg-gray-50 flex items-center justify-center">
        <div className="text-center">
          <div className="animate-spin rounded-full h-12 w-12 border-b-2 border-primary-500 mx-auto mb-4"></div>
          <p className="text-gray-600">Loading...</p>
        </div>
      </div>
    )
  }

  if (error || !entry) {
    return (
      <div className="min-h-screen flex items-center justify-center px-4">
        <div className="text-center">
          <h1 className="text-2xl md:text-4xl font-bold text-gray-900 mb-4">Word Not Found</h1>
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
        <div className="max-w-4xl mx-auto px-4 sm:px-6 lg:px-8 py-3">
          <div className="flex items-center gap-2 text-xs md:text-sm text-gray-600 overflow-x-auto">
            <Link href="/" className="hover:text-primary-600 whitespace-nowrap">Home</Link>
            <span>›</span>
            <Link href="/search" className="hover:text-primary-600 whitespace-nowrap">Search</Link>
            <span>›</span>
            <span className="text-gray-900 font-medium truncate">{entry.headword}</span>
          </div>
        </div>
      </div>

      {/* Main Content */}
      <div className="max-w-4xl mx-auto px-4 sm:px-6 lg:px-8 py-6 md:py-12">
        {/* Header */}
        <div className="bg-white rounded-2xl shadow-lg p-4 md:p-8 mb-4 md:mb-6">
          <div className="mb-4 md:mb-6">
            <div className="flex items-start gap-2 md:gap-3 mb-2">
              <h1 className="text-3xl md:text-5xl font-bold text-gray-900 flex-1 break-words">
                {entry.headword}
              </h1>
              {entry.audio_url && (
                <button className="text-primary-600 hover:text-primary-700 text-xl md:text-2xl flex-shrink-0 mt-1">
                  🔊
                </button>
              )}
            </div>
            <p className="text-sm md:text-lg text-gray-600">
              {entry.language?.name || 'Unknown'} {entry.part_of_speech && `• ${entry.part_of_speech}`}
            </p>
          </div>

          {/* Badges */}
          <div className="flex flex-wrap gap-2 mb-4 md:mb-6">
            {entry.validation_status === 'verified' && (
              <span className="bg-green-100 text-green-700 px-3 py-1.5 rounded-full text-xs md:text-sm font-bold whitespace-nowrap">
                ✓ Verified
              </span>
            )}
            {entry.validation_status === 'pending' && (
              <span className="bg-yellow-100 text-yellow-700 px-3 py-1.5 rounded-full text-xs md:text-sm font-bold whitespace-nowrap">
                ⏳ Pending Review
              </span>
            )}
            {entry.validation_status === 'flagged' && (
              <span className="bg-red-100 text-red-700 px-3 py-1.5 rounded-full text-xs md:text-sm font-bold whitespace-nowrap">
                🚩 Flagged
              </span>
            )}
            <span className="bg-gray-100 text-gray-700 px-3 py-1.5 rounded-full text-xs md:text-sm font-medium whitespace-nowrap">
              {entry.trust_score}% trust
            </span>
            {entry.dialect_variant && (
              <span className="bg-blue-100 text-blue-700 px-3 py-1.5 rounded-full text-xs md:text-sm font-medium whitespace-nowrap">
                {entry.dialect_variant}
              </span>
            )}
          </div>

          {/* Primary Definition */}
          <div className="border-t border-gray-200 pt-4 md:pt-6">
            <h2 className="text-xs md:text-sm font-bold text-gray-500 uppercase tracking-wide mb-2 md:mb-3">
              Definition
            </h2>
            <p className="text-base md:text-xl text-gray-800 leading-relaxed">
              {entry.primary_definition}
            </p>
          </div>
        </div>

        {/* Translations */}
        {entry.translations && entry.translations.length > 0 && (
          <div className="bg-white rounded-2xl shadow-lg p-4 md:p-8 mb-4 md:mb-6">
            <h2 className="text-xl md:text-2xl font-bold text-gray-900 mb-4 md:mb-6 flex items-center gap-2">
              🌍 Translations
            </h2>
            <div className="space-y-3 md:space-y-4">
              {entry.translations.map((trans: any, idx: number) => (
                <div key={idx} className="flex items-start gap-3 md:gap-4 pb-3 md:pb-4 border-b border-gray-100 last:border-0">
                  <div className="flex-1 min-w-0">
                    <p className="text-xs md:text-sm font-medium text-gray-500 mb-1">{trans.language}</p>
                    <p className="text-lg md:text-2xl font-semibold text-gray-900 break-words">{trans.word}</p>
                  </div>
                  <button className="text-primary-600 hover:text-primary-700 flex-shrink-0">
                    🔊
                  </button>
                </div>
              ))}
            </div>
            <button className="mt-4 md:mt-6 text-primary-600 hover:text-primary-700 font-medium text-sm">
              + Add translation
            </button>
          </div>
        )}

        {/* Usage & Context */}
        <div className="bg-white rounded-2xl shadow-lg p-4 md:p-8 mb-4 md:mb-6">
          <h2 className="text-xl md:text-2xl font-bold text-gray-900 mb-4 md:mb-6 flex items-center gap-2">
            💬 Usage & Context
          </h2>
          
          {entry.usage_contexts && entry.usage_contexts.length > 0 ? (
            <div className="space-y-4 md:space-y-6">
              {entry.usage_contexts.map((context: any) => (
                <div key={context.id} className="border border-gray-200 rounded-xl p-4 md:p-6 hover:border-primary-300 transition">
                  <div className="flex flex-col sm:flex-row sm:items-start sm:justify-between gap-3 mb-3 md:mb-4">
                    {context.context_type && (
                      <span className="bg-primary-100 text-primary-700 px-3 py-1 rounded-full text-xs font-bold uppercase w-fit">
                        {context.context_type}
                      </span>
                    )}
                    <div className="flex items-center gap-3 md:gap-4">
                      <button 
                        onClick={() => handleVote(context.id, 'upvote')}
                        disabled={votingId === context.id}
                        className="flex items-center gap-1 text-gray-600 hover:text-primary-600 disabled:opacity-50"
                      >
                        <span>👍</span>
                        <span className="font-medium text-sm">{context.upvotes || 0}</span>
                      </button>
                      <button 
                        onClick={() => handleVote(context.id, 'downvote')}
                        disabled={votingId === context.id}
                        className="flex items-center gap-1 text-gray-600 hover:text-gray-700 disabled:opacity-50"
                      >
                        <span>👎</span>
                        <span className="font-medium text-sm">{context.downvotes || 0}</span>
                      </button>
                    </div>
                  </div>
                  <p className="text-sm md:text-base text-gray-700 mb-3 leading-relaxed">{context.usage_text}</p>
                  {context.example_sentence && (
                    <div className="bg-gray-50 rounded-lg p-3 md:p-4 border-l-4 border-primary-500">
                      <p className="text-sm md:text-base text-gray-800 italic break-words">
                        &quot;{context.example_sentence}&quot;
                      </p>
                    </div>
                  )}
                </div>
              ))}
            </div>
          ) : (
            <div className="text-center py-8 text-gray-600">
              <p className="mb-4">No usage examples yet. Be the first to add one!</p>
            </div>
          )}
          
          <button 
            onClick={() => user ? setShowUsageForm(true) : alert('Please sign in to add examples')}
            className="mt-4 md:mt-6 text-primary-600 hover:text-primary-700 font-medium text-sm"
          >
            + Add your usage example
          </button>
        </div>

        {/* Etymology */}
        {entry.etymology && (
          <div className="bg-white rounded-2xl shadow-lg p-4 md:p-8 mb-4 md:mb-6">
            <h2 className="text-xl md:text-2xl font-bold text-gray-900 mb-4 flex items-center gap-2">
              📚 Etymology
            </h2>
            <p className="text-sm md:text-base text-gray-700 leading-relaxed">{entry.etymology}</p>
          </div>
        )}

        {/* Actions */}
        <div className="grid grid-cols-2 md:flex md:items-center gap-2 md:gap-4">
          <button className="col-span-2 md:col-span-1 md:flex-1 bg-primary-500 text-white px-4 py-3 rounded-xl hover:bg-primary-600 transition font-medium text-sm md:text-base">
            ✏️ Suggest Edit
          </button>
          <button className="col-span-2 md:col-span-1 md:flex-1 border-2 border-gray-300 text-gray-700 px-4 py-3 rounded-xl hover:border-primary-500 hover:text-primary-600 transition font-medium text-sm md:text-base">
            🚩 Report Issue
          </button>
          <button className="border-2 border-gray-300 text-gray-700 px-4 py-3 rounded-xl hover:border-primary-500 hover:text-primary-600 transition text-sm md:text-base">
            🔗
          </button>
          <button className="border-2 border-gray-300 text-gray-700 px-4 py-3 rounded-xl hover:border-primary-500 hover:text-primary-600 transition text-sm md:text-base">
            ⭐
          </button>
        </div>
      </div>

      {/* Usage Context Form Modal */}
      {showUsageForm && user && (
        <UsageContextForm
          entryId={id}
          userId={user.id}
          onSuccess={handleUsageAdded}
          onCancel={() => setShowUsageForm(false)}
        />
      )}
    </div>
  )
}