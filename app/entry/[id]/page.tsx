'use client'

import { useParams, useRouter } from 'next/navigation'
import { useEffect, useState } from 'react'
import { useAuth } from '@/lib/contexts/AuthContext'
import { getEntry, submitEditSuggestion, reportEntry, toggleSaveWord, getRelatedEntries } from '@/lib/api/entries'
import { supabase } from '@/lib/supabase'
import EntryActionModal from '@/components/EntryActionModal'
import Link from 'next/link'

export default function EntryPage() {
  const params = useParams()
  const id = Array.isArray(params?.id) ? params.id[0] : (params?.id as string)
  
  const { user } = useAuth()
  const router = useRouter()
  
  const [entry, setEntry] = useState<any>(null)
  const [relatedWords, setRelatedWords] = useState<any[]>([])
  const [loading, setLoading] = useState(true)
  const [isSaved, setIsSaved] = useState(false)
  const [activeModal, setActiveModal] = useState<'edit' | 'report' | null>(null)
  const [showShareMenu, setShowShareMenu] = useState(false)

  useEffect(() => {
    async function loadEntryData() {
      if (!id) return
      try {
        const data = await getEntry(id)
        setEntry(data)
        
        // Fetch related words based on category
        if (data.category) {
          const related = await getRelatedEntries(data.category, id)
          setRelatedWords(related)
        }

        if (user) {
          const { data: saved } = await supabase
            .from('saved_words')
            .select()
            .eq('user_id', user.id)
            .eq('entry_id', id)
            .single()
          setIsSaved(!!saved)
        }
      } catch (err) {
        console.error('Entry load failed:', err)
      } finally {
        setLoading(false)
      }
    }
    loadEntryData()
  }, [id, user])

  const handleSaveToggle = async () => {
    if (!user || !id) return alert('Please sign in to save words.')
    try {
      const savedStatus = await toggleSaveWord(user.id, id)
      setIsSaved(savedStatus)
    } catch (err) {
      console.error('Save action failed')
    }
  }

  const handleShare = (platform: 'x' | 'fb' | 'wa' | 'copy') => {
    const url = typeof window !== 'undefined' ? window.location.href : ''
    const text = `Check out "${entry?.headword}" in the Archive: `
    const links = {
      x: `https://twitter.com/intent/tweet?text=${encodeURIComponent(text)}&url=${encodeURIComponent(url)}`,
      fb: `https://www.facebook.com/sharer/sharer.php?u=${encodeURIComponent(url)}`,
      wa: `https://api.whatsapp.com/send?text=${encodeURIComponent(text + url)}`,
    }

    if (platform === 'copy') {
      navigator.clipboard.writeText(url)
      alert('Link copied to clipboard!')
    } else {
      window.open(links[platform as keyof typeof links], '_blank')
    }
    setShowShareMenu(false)
  }

  const onActionSubmit = async (data: any) => {
    if (!user || !id) return
    try {
      if (activeModal === 'edit') {
        await submitEditSuggestion({
          entry_id: id,
          suggested_by: user.id,
          headword: data.headword,
          primary_definition: data.primary_definition,
          reason_for_change: `${data.reason}: ${data.details}`
        })
      } else {
        await reportEntry({
          entry_id: id,
          reported_by: user.id,
          reason: data.reason,
          details: data.details
        })
      }
      alert('Submission received by the Guardian Authority.')
      setActiveModal(null)
    } catch (err) {
      alert('Could not process submission.')
    }
  }

  if (loading) return <div className="min-h-screen bg-stone-50 flex items-center justify-center font-logo animate-pulse text-stone-400">RECONSTRUCTING...</div>
  if (!entry) return <div className="min-h-screen bg-stone-50 flex items-center justify-center font-logo text-stone-400 uppercase">Entry Not Found</div>

  return (
    <div className="min-h-screen bg-stone-50 pb-20 font-sans">
      {/* Header Navigation */}
      <div className="max-w-7xl mx-auto px-4 py-8 flex justify-between items-center">
        <button onClick={() => router.back()} className="text-[10px] font-black uppercase tracking-[0.3em] text-stone-400 hover:text-emerald-600 transition-colors">
          ← Back
        </button>
        <div className="flex gap-4">
          <div className="relative">
            <button onClick={() => setShowShareMenu(!showShareMenu)} className="bg-white border border-stone-200 p-4 rounded-2xl hover:border-emerald-500 transition-all">🔗</button>
            {showShareMenu && (
              <div className="absolute top-full right-0 mt-2 w-48 bg-white border border-stone-200 shadow-2xl rounded-2xl overflow-hidden z-[50]">
                {['x', 'wa', 'fb'].map((p) => (
                  <button key={p} onClick={() => handleShare(p as any)} className="w-full text-left px-4 py-3 text-[10px] font-black uppercase tracking-widest hover:bg-stone-50 border-b border-stone-100 italic">Share on {p === 'wa' ? 'WhatsApp' : p.toUpperCase()}</button>
                ))}
                <button onClick={() => handleShare('copy')} className="w-full text-left px-4 py-3 text-[10px] font-black uppercase tracking-widest hover:bg-stone-50">Copy Link</button>
              </div>
            )}
          </div>
          <button onClick={handleSaveToggle} className={`p-4 rounded-2xl border transition-all ${isSaved ? 'bg-amber-50 border-amber-400 text-amber-600' : 'bg-white border-stone-200 text-stone-400 hover:border-amber-400'}`}>
            {isSaved ? '★' : '☆'}
          </button>
        </div>
      </div>

      <main className="max-w-4xl mx-auto px-4 mt-8">
        <div className="bg-white rounded-[3rem] border border-stone-200 p-8 md:p-14 shadow-xl shadow-stone-900/5">
          {/* Refined Typography for Word */}
          <div className="flex flex-col md:flex-row md:items-end gap-3 mb-10">
            <h1 className="text-4xl md:text-6xl font-black font-logo text-stone-900 uppercase tracking-tight">{entry.headword}</h1>
            <span className="text-emerald-600 font-logo text-lg italic mb-1 md:mb-3">/ {entry.part_of_speech || 'word'} /</span>
          </div>

          <div className="space-y-10">
            {/* Refined Typography for Definition */}
            <section>
              <h2 className="text-[10px] font-black text-stone-400 uppercase tracking-[0.3em] mb-4">Definition</h2>
              <p className="text-lg md:text-2xl font-medium text-stone-800 leading-relaxed font-serif">{entry.primary_definition}</p>
            </section>

            {entry.usage_examples?.length > 0 && (
              <section>
                <h2 className="text-[10px] font-black text-stone-400 uppercase tracking-[0.3em] mb-6">In Context</h2>
                <div className="space-y-6">
                  {entry.usage_examples.map((ex: any, i: number) => (
                    <div key={i} className="bg-stone-50 p-8 rounded-[2rem] border-l-4 border-emerald-500 italic text-stone-600 text-lg">"{ex.context_text}"</div>
                  ))}
                </div>
              </section>
            )}

            {/* Restored Related Words Section */}
            {relatedWords.length > 0 && (
              <section className="pt-8 border-t border-stone-100">
                <h2 className="text-[10px] font-black text-stone-400 uppercase tracking-[0.3em] mb-6">See Also</h2>
                <div className="grid grid-cols-1 md:grid-cols-3 gap-4">
                  {relatedWords.map((word) => (
                    <Link key={word.id} href={`/entry/${word.id}`} className="group p-5 bg-stone-50 rounded-2xl hover:bg-emerald-50 transition-all border border-transparent hover:border-emerald-200">
                      <p className="font-logo font-black text-stone-900 group-hover:text-emerald-700 uppercase text-sm mb-1">{word.headword}</p>
                      <p className="text-[10px] text-stone-500 line-clamp-1 italic">{word.language?.name}</p>
                    </Link>
                  ))}
                </div>
              </section>
            )}
          </div>

          {/* Action Buttons */}
          <div className="mt-16 pt-12 border-t border-stone-100 grid md:grid-cols-2 gap-4">
            <button onClick={() => setActiveModal('edit')} className="bg-emerald-600 text-white py-6 rounded-2xl font-black text-[11px] uppercase tracking-[0.3em] hover:bg-emerald-700 shadow-lg shadow-emerald-900/10 transition-all">Suggest Amendment</button>
            <button onClick={() => setActiveModal('report')} className="bg-stone-50 text-stone-400 py-6 rounded-2xl font-black text-[11px] uppercase tracking-[0.3em] hover:bg-red-50 hover:text-red-500 transition-all">Report Issue</button>
          </div>
        </div>

        {/* Footer Credits */}
        <div className="mt-8 flex items-center justify-between px-8 text-stone-400">
          <div className="flex items-center gap-3">
             <div className="w-8 h-8 rounded-full bg-stone-200 overflow-hidden border border-stone-300">
               {entry.contributor_avatar && <img src={entry.contributor_avatar} className="w-full h-full object-cover" alt="" />}
             </div>
             <span className="text-[9px] font-black uppercase tracking-widest">Archived by <span className="text-stone-600 underline cursor-pointer">{entry.contributor_name}</span></span>
          </div>
          <span className="text-[9px] font-black uppercase tracking-widest">Status: {entry.validation_status}</span>
        </div>
      </main>

      {activeModal && (
        <EntryActionModal 
          type={activeModal} 
          entry={entry} 
          onClose={() => setActiveModal(null)} 
          onSubmit={onActionSubmit}
        />
      )}
    </div>
  )
}