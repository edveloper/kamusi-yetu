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
    loadEntry()
  }

  if (loading) {
    return (
      <div className="min-h-screen bg-stone-50 flex items-center justify-center">
        <div className="text-center">
          <div className="animate-spin rounded-full h-12 w-12 border-b-2 border-emerald-600 mx-auto mb-4"></div>
          <p className="text-stone-600 font-medium">Loading entry...</p>
        </div>
      </div>
    )
  }

  if (error || !entry) {
    return (
      <div className="min-h-screen bg-stone-50 flex items-center justify-center px-4">
        <div className="text-center">
          <h1 className="text-4xl font-black text-gray-900 mb-4 font-logo">Word Not Found</h1>
          <p className="text-stone-600 mb-8 max-w-sm">This entry doesn&apos;t exist yet or may have been moved.</p>
          <Link href="/">
            <button className="bg-emerald-600 text-white px-8 py-3 rounded-xl hover:bg-emerald-700 transition font-bold shadow-lg">
              ← Back to Home
            </button>
          </Link>
        </div>
      </div>
    )
  }

  return (
    <div className="min-h-screen bg-stone-50 pb-20">
      {/* Breadcrumb Navigation */}
      <div className="bg-white border-b border-stone-200">
        <div className="max-w-4xl mx-auto px-4 sm:px-6 lg:px-8 py-4">
          <div className="flex items-center gap-2 text-sm font-medium text-stone-500 overflow-x-auto whitespace-nowrap">
            <Link href="/" className="hover:text-emerald-600">Home</Link>
            <span className="text-stone-300">/</span>
            <Link href="/search" className="hover:text-emerald-600">Dictionary</Link>
            <span className="text-stone-300">/</span>
            <span className="text-emerald-900 font-bold">{entry.headword}</span>
          </div>
        </div>
      </div>

      <div className="max-w-4xl mx-auto px-4 sm:px-6 lg:px-8 mt-8 md:mt-12">
        {/* Main Header Card */}
        <div className="bg-white rounded-[2.5rem] shadow-sm border border-stone-200 p-8 md:p-12 mb-8">
          <div className="flex flex-col md:flex-row md:items-end justify-between gap-6 mb-10">
            <div>
              <div className="flex items-center gap-4 mb-3">
                <h1 className="text-5xl md:text-7xl font-black text-gray-900 font-logo tracking-tight">
                  {entry.headword}
                </h1>
                {entry.audio_url && (
                  <button className="p-3 bg-emerald-50 text-emerald-600 rounded-2xl hover:bg-emerald-100 transition shadow-sm">
                    <span className="text-2xl">🔊</span>
                  </button>
                )}
              </div>
              <p className="text-xl md:text-2xl text-stone-500 font-medium italic">
                {entry.language?.name || 'Unknown Language'} 
                <span className="text-stone-300 mx-3">|</span> 
                {entry.part_of_speech}
              </p>
            </div>

            <div className="flex flex-wrap gap-2">
              {entry.validation_status === 'verified' && (
                <span className="bg-emerald-600 text-white px-4 py-2 rounded-full text-xs font-black uppercase tracking-widest shadow-md shadow-emerald-900/10">
                  ✓ Verified
                </span>
              )}
              {entry.validation_status === 'pending' && (
                <span className="bg-amber-100 text-amber-700 px-4 py-2 rounded-full text-xs font-black uppercase tracking-widest border border-amber-200">
                  ⏳ Review Pending
                </span>
              )}
              <span className="bg-stone-100 text-stone-600 px-4 py-2 rounded-full text-xs font-black uppercase tracking-widest border border-stone-200">
                {entry.trust_score}% Trust
              </span>
            </div>
          </div>

          <div className="pt-8 border-t border-stone-100">
            <h2 className="text-xs font-black text-emerald-600 uppercase tracking-[0.2em] mb-4">Definition</h2>
            <p className="text-2xl md:text-3xl text-stone-800 leading-snug font-medium">
              {entry.primary_definition}
            </p>
          </div>
        </div>

        {/* Usage & Contexts */}
        <div className="bg-white rounded-[2.5rem] shadow-sm border border-stone-200 p-8 md:p-12 mb-8">
          <div className="flex justify-between items-center mb-10">
            <h2 className="text-3xl font-black text-gray-900 font-logo">Usage & Context</h2>
            <button 
              onClick={() => user ? setShowUsageForm(true) : alert('Please sign in to add examples')}
              className="bg-emerald-50 text-emerald-700 px-5 py-2 rounded-xl font-bold text-sm hover:bg-emerald-100 transition"
            >
              + Add Example
            </button>
          </div>

          {entry.usage_contexts && entry.usage_contexts.length > 0 ? (
            <div className="space-y-6">
              {entry.usage_contexts.map((context: any) => (
                <div key={context.id} className="group p-6 md:p-8 rounded-[2rem] border border-stone-100 bg-stone-50/50 hover:bg-white hover:border-emerald-200 hover:shadow-xl transition-all duration-300">
                  <div className="flex flex-col sm:flex-row sm:items-start sm:justify-between gap-4 mb-6">
                    <span className="bg-white px-4 py-1.5 rounded-full text-[10px] font-black text-emerald-700 uppercase tracking-widest shadow-sm border border-stone-100">
                      {context.context_type || 'General'}
                    </span>
                    <div className="flex items-center gap-2 bg-white rounded-full px-4 py-2 shadow-sm border border-stone-50">
                      <button 
                        onClick={() => handleVote(context.id, 'upvote')}
                        disabled={votingId === context.id}
                        className="flex items-center gap-2 text-stone-400 hover:text-emerald-600 transition-colors disabled:opacity-50"
                      >
                        <span className="text-sm">👍</span>
                        <span className="font-bold text-sm text-stone-700">{context.upvotes || 0}</span>
                      </button>
                      <div className="w-px h-4 bg-stone-200 mx-1"></div>
                      <button 
                        onClick={() => handleVote(context.id, 'downvote')}
                        disabled={votingId === context.id}
                        className="flex items-center text-stone-400 hover:text-red-500 transition-colors disabled:opacity-50"
                      >
                        <span className="text-sm">👎</span>
                      </button>
                    </div>
                  </div>
                  
                  <p className="text-xl text-stone-800 font-semibold mb-4 leading-relaxed italic">
                    &quot;{context.example_sentence}&quot;
                  </p>
                  <p className="text-stone-500 leading-relaxed">
                    {context.usage_text}
                  </p>
                </div>
              ))}
            </div>
          ) : (
            <div className="text-center py-12 bg-stone-50 rounded-[2rem] border-2 border-dashed border-stone-200">
              <p className="text-stone-500 font-medium">No usage examples yet. Be the first to contribute!</p>
            </div>
          )}
        </div>

        {/* Translations if available */}
        {entry.translations && entry.translations.length > 0 && (
          <div className="bg-white rounded-[2.5rem] shadow-sm border border-stone-200 p-8 md:p-12 mb-8">
            <h2 className="text-3xl font-black text-gray-900 font-logo mb-8">Translations</h2>
            <div className="grid grid-cols-1 md:grid-cols-2 gap-4">
              {entry.translations.map((trans: any, idx: number) => (
                <div key={idx} className="flex items-center justify-between p-6 bg-stone-50 rounded-2xl border border-stone-100">
                  <div>
                    <p className="text-[10px] font-black text-stone-400 uppercase tracking-widest mb-1">{trans.language}</p>
                    <p className="text-xl font-bold text-gray-900">{trans.word}</p>
                  </div>
                  <span className="text-xl opacity-50">🗣️</span>
                </div>
              ))}
            </div>
          </div>
        )}

        {/* Etymology */}
        {entry.etymology && (
          <div className="bg-white rounded-[2.5rem] shadow-sm border border-stone-200 p-8 md:p-12 mb-8">
            <h2 className="text-3xl font-black text-gray-900 mb-6 font-logo flex items-center gap-3">
              <span className="text-2xl">📚</span> Origin & Etymology
            </h2>
            <p className="text-lg text-stone-700 leading-relaxed font-medium">
              {entry.etymology}
            </p>
          </div>
        )}

        {/* Community Actions Restored */}
        <div className="flex flex-col md:flex-row items-center gap-4">
          <button className="w-full md:flex-[2] bg-emerald-600 text-white px-8 py-5 rounded-2xl hover:bg-emerald-700 transition-all font-black text-lg shadow-lg shadow-emerald-900/10 flex items-center justify-center gap-3">
            <span>✏️</span> Suggest an Edit
          </button>
          
          <button className="w-full md:flex-1 bg-white border-2 border-stone-200 text-stone-600 px-6 py-5 rounded-2xl hover:border-red-200 hover:text-red-600 hover:bg-red-50 transition-all font-bold flex items-center justify-center gap-3">
            <span>🚩</span> Report Issue
          </button>

          <div className="flex w-full md:w-auto gap-4">
            <button title="Share link" className="flex-1 md:flex-none bg-white border-2 border-stone-200 text-stone-600 p-5 rounded-2xl hover:border-emerald-500 hover:text-emerald-600 transition-all">
              🔗
            </button>
            <button title="Save word" className="flex-1 md:flex-none bg-white border-2 border-stone-200 text-stone-600 p-5 rounded-2xl hover:border-yellow-500 hover:text-yellow-600 transition-all">
              ⭐
            </button>
          </div>
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