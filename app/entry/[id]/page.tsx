'use client'

import { useParams, useRouter } from 'next/navigation'
import { useEffect, useState } from 'react'
import Link from 'next/link'
import { useAuth } from '@/lib/contexts/AuthContext'
import { getCommentVotes } from '@/lib/api/entries'

import {
  getEntry,
  getRelatedEntries,
  submitEditSuggestion,
  reportEntry,
  toggleSaveWord,
  toggleLike,
  getLikes,
  addComment,
  getComments,
  updateComment,
  deleteComment,
  toggleCommentVote
} from '@/lib/api/entries'
import { supabase } from '@/lib/supabase'
import EntryActionModal from '@/components/EntryActionModal'

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

  // Likes + comments state
  const [likesCount, setLikesCount] = useState(0)
  const [comments, setComments] = useState<any[]>([])
  const [newComment, setNewComment] = useState('')
  const [replyingTo, setReplyingTo] = useState<string | null>(null)
  const [replyText, setReplyText] = useState('')
  const [editingComment, setEditingComment] = useState<string | null>(null)
  const [editText, setEditText] = useState('')

  useEffect(() => {
    async function loadEntryData() {
      if (!id) return
      try {
        const data = await getEntry(id)
        setEntry(data)

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

        const count = await getLikes(id)
        setLikesCount(count)

        // Fetch comments
        const comms = await getComments(id)

        // Attach vote counts to each comment
        const withVotes = await Promise.all(
          comms.map(async (c) => {
            const { likes, dislikes } = await getCommentVotes(c.id)
            return { ...c, likesCount: likes, dislikesCount: dislikes }
          })
        )

        setComments(withVotes)
      } catch (err) {
        console.error('Entry load failed:', err)
      } finally {
        setLoading(false)
      }
    }
    loadEntryData()
  }, [id, user])

  const handleSaveToggle = async () => {
    if (!user || !id) {
      alert('Please sign in to save words.')
      return
    }
    try {
      const savedStatus = await toggleSaveWord(user.id, id as string)
      setIsSaved(savedStatus)
    } catch (err) {
      console.error('Save action failed:', err)
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

  // Likes + comments handlers
  const handleLike = async () => {
    if (!user) return alert('Sign in to like')
    const liked = await toggleLike(id, user.id)
    setLikesCount(prev => liked ? prev + 1 : prev - 1)
  }

  const handleAddComment = async () => {
    if (!user || !newComment.trim()) return
    const c = await addComment(id, user.id, newComment.trim())
    setComments([...comments, c])
    setNewComment('')
  }

  const handleReply = async (parentId: string) => {
    if (!user || !replyText.trim()) return
    const c = await addComment(id, user.id, replyText.trim(), parentId)
    setComments([...comments, c])
    setReplyingTo(null)
    setReplyText('')
  }

  const handleEdit = async (commentId: string) => {
    if (!user || !editText.trim()) return
    const updated = await updateComment(commentId, editText.trim())
    setComments(comments.map(c => (c.id === commentId ? updated : c)))
    setEditingComment(null)
    setEditText('')
  }

  const handleDelete = async (commentId: string) => {
    if (!user) return
    if (!confirm('Delete this comment?')) return
    await deleteComment(commentId)
    setComments(comments.filter(c => c.id !== commentId))
  }

  // Helper: render text with links
  const renderContent = (text: string) =>
    text.split(/(https?:\/\/[^\s]+)/g).map((part, i) =>
      part.match(/^https?:\/\//)
        ? (
          <a
            key={i}
            href={part}
            target="_blank"
            rel="noopener noreferrer"
            className="text-emerald-600 underline break-words"
          >
            {part}
          </a>
        )
        : part
    )

  // Recursive comment renderer
  const renderComments = (parentId: string | null = null) => {
    const children = comments.filter(c => c.parent_id === parentId)
    return children.map(c => (
      <div key={c.id} className="ml-0 md:ml-6 mt-4">
        <div className="bg-stone-50 p-4 md:p-6 rounded-xl border border-stone-200 max-w-full break-words">
          <div className="flex items-center gap-2 mb-2">
            <div className="w-6 h-6 rounded-full bg-stone-200 overflow-hidden">
              {c.user?.avatar_url && (
                <img
                  src={c.user.avatar_url}
                  alt=""
                  className="w-full h-full object-cover"
                  />
                )}
            </div>
            <span className="text-xs font-bold">
              {c.user?.display_name || 'Anonymous'}
            </span>
          </div>

          {editingComment === c.id ? (
            <div className="mt-2 flex gap-2">
              <input
                type="text"
                value={editText}
                onChange={(e) => setEditText(e.target.value)}
                className="flex-1 min-w-0 px-3 py-2 border rounded-lg text-sm"
              />
              <button
                onClick={() => handleEdit(c.id)}
                className="bg-emerald-600 text-white px-3 py-2 rounded-lg text-sm"
              >
                Save
              </button>
              <button
                onClick={() => {
                  setEditingComment(null)
                  setEditText('')
                }}
                className="bg-stone-200 px-3 py-2 rounded-lg text-sm"
              >
                Cancel
              </button>
            </div>
          ) : (
            <p className="text-stone-700 break-words whitespace-pre-wrap">
              {renderContent(c.content)}
            </p>
          )}

          <div className="flex gap-3 mt-2 text-xs items-center">
            {user && (
              <>
                {/* Like / Dislike buttons with state update */}
                <button
                  onClick={async () => {
                    await toggleCommentVote(c.id, user.id, 'like')
                    const { likes, dislikes } = await getCommentVotes(c.id)
                    setComments(prev =>
                      prev.map(comment =>
                        comment.id === c.id
                          ? { ...comment, likesCount: likes, dislikesCount: dislikes }
                          : comment
                      )
                    )
                  }}
                  className="text-emerald-600"
                >
                  👍 {c.likesCount || 0}
                </button>
                <button
                  onClick={async () => {
                    await toggleCommentVote(c.id, user.id, 'dislike')
                    const { likes, dislikes } = await getCommentVotes(c.id)
                    setComments(prev =>
                      prev.map(comment =>
                        comment.id === c.id
                          ? { ...comment, likesCount: likes, dislikesCount: dislikes }
                          : comment
                      )
                    )
                  }}
                  className="text-red-600"
                >
                  👎 {c.dislikesCount || 0}
                </button>

                {/* Reply button */}
                <button
                  onClick={() => setReplyingTo(c.id)}
                  className="text-emerald-600"
                >
                  Reply
                </button>
              </>
            )}

            {user?.id === c.user_id && (
              <>
                <button
                  onClick={() => {
                    setEditingComment(c.id)
                    setEditText(c.content)
                  }}
                  className="text-blue-600"
                >
                  Edit
                </button>
                <button
                  onClick={() => handleDelete(c.id)}
                  className="text-red-600"
                >
                  Delete
                </button>
              </>
            )}
          </div>

          {replyingTo === c.id && (
            <div className="mt-2 flex gap-2">
              <input
                type="text"
                value={replyText}
                onChange={(e) => setReplyText(e.target.value)}
                placeholder="Write a reply..."
                className="flex-1 min-w-0 px-3 py-2 border rounded-lg text-sm"
              />
              <button
                onClick={() => handleReply(c.id)}
                className="bg-emerald-600 text-white px-3 py-2 rounded-lg text-sm"
              >
                Post
              </button>
            </div>
          )}
        </div>
        {/* Render nested replies (only indent on md+) */}
        <div className="md:ml-6">{renderComments(c.id)}</div>
      </div>
    ))
  }


  if (loading)
    return (
      <div className="min-h-screen bg-stone-50 flex items-center justify-center font-logo animate-pulse text-stone-400">
        RECONSTRUCTING...
      </div>
    )
  if (!entry)
    return (
      <div className="min-h-screen bg-stone-50 flex items-center justify-center font-logo text-stone-400 uppercase">
        Entry Not Found
      </div>
    )

  return (
    <div className="entry-root min-h-screen bg-stone-50 pb-20 font-sans">
      {/* Header Navigation */}
      <div className="max-w-7xl mx-auto px-4 py-8 flex justify-between items-center">
        <button
          onClick={() => router.back()}
          className="text-[10px] font-black uppercase tracking-[0.3em] text-stone-400 hover:text-emerald-600 transition-colors"
        >
          ← Back
        </button>
        <div className="flex gap-4">
          <div className="relative">
            <button
              onClick={() => setShowShareMenu(!showShareMenu)}
              className="bg-white border border-stone-200 p-4 rounded-2xl hover:border-emerald-500 transition-all"
            >
              🔗
            </button>
            {showShareMenu && (
              <div className="absolute top-full right-0 mt-2 w-48 bg-white border border-stone-200 shadow-2xl rounded-2xl overflow-hidden z-[50]">
                {['x', 'wa', 'fb'].map((p) => (
                  <button
                    key={p}
                    onClick={() => handleShare(p as any)}
                    className="w-full text-left px-4 py-3 text-[10px] font-black uppercase tracking-widest hover:bg-stone-50 border-b border-stone-100 italic"
                  >
                    Share on {p === 'wa' ? 'WhatsApp' : p.toUpperCase()}
                  </button>
                ))}
                <button
                  onClick={() => handleShare('copy')}
                  className="w-full text-left px-4 py-3 text-[10px] font-black uppercase tracking-widest hover:bg-stone-50"
                >
                  Copy Link
                </button>
              </div>
            )}
          </div>
          {/* Star = saved words */}
          <button
            onClick={handleSaveToggle}
            className={`p-4 rounded-2xl border transition-all ${isSaved
              ? 'bg-amber-50 border-amber-400 text-amber-600'
              : 'bg-white border-stone-200 text-stone-400 hover:border-amber-400'
              }`}
          >
            {isSaved ? '★' : '☆'}
          </button>
        </div>
      </div>

      <main className="max-w-4xl mx-auto px-4 mt-8">
        <div className="bg-white rounded-[3rem] border border-stone-200 p-8 md:p-14 shadow-xl shadow-stone-900/5">
          {/* Word Heading */}
          <div className="flex flex-col md:flex-row md:items-end gap-3 mb-10">
            <h1 className="text-4xl md:text-6xl font-black font-logo text-stone-900 uppercase tracking-tight">
              {entry.headword}
            </h1>
            <span className="text-emerald-600 font-logo text-lg italic mb-1 md:mb-3">
              / {entry.part_of_speech || 'word'} /
            </span>
          </div>

          <div className="space-y-10">
            {/* Definition */}
            <section>
              <h2 className="text-[10px] font-black text-stone-400 uppercase tracking-[0.3em] mb-4">
                Definition
              </h2>
              <p className="text-lg md:text-2xl font-medium text-stone-800 leading-relaxed font-serif">
                {entry.primary_definition}
              </p>
            </section>

            {/* English Translation */}
            {entry.english_translation && (
              <section>
                <h2 className="text-[10px] font-black text-stone-400 uppercase tracking-[0.3em] mb-4">
                  English Translation
                </h2>
                <p className="text-lg font-medium text-stone-700 italic">
                  {entry.english_translation}
                </p>
              </section>
            )}

            {/* Swahili Translation */}
            {entry.swahili_translation && (
              <section>
                <h2 className="text-[10px] font-black text-stone-400 uppercase tracking-[0.3em] mb-4">
                  Swahili Translation
                </h2>
                <p className="text-lg font-medium text-stone-700 italic">
                  {entry.swahili_translation}
                </p>
              </section>
            )}

            {/* Usage Examples */}
            {entry.usage_examples?.length > 0 && (
              <section>
                <h2 className="text-[10px] font-black text-stone-400 uppercase tracking-[0.3em] mb-6">
                  In Context
                </h2>
                <div className="space-y-6">
                  {entry.usage_examples.map((ex: any, i: number) => (
                    <div
                      key={i}
                      className="bg-stone-50 p-4 md:p-8 rounded-[2rem] border-l-4 border-emerald-500 italic text-stone-600 text-lg break-words"
                    >
                      "{ex.context_text}"
                    </div>
                  ))}
                </div>
              </section>
            )}

            {/* Likes */}
            <section className="pt-8 border-t border-stone-100">
              <button
                onClick={handleLike}
                className="flex items-center gap-2 text-emerald-600 font-bold"
              >
                👍 Like
              </button>
              <span className="ml-2 text-stone-500">
                {likesCount} {likesCount === 1 ? 'like' : 'likes'}
              </span>
            </section>

            {/* Comments */}
            <section className="pt-8 border-t border-stone-100">
              <h2 className="text-[10px] font-black text-stone-400 uppercase tracking-[0.3em] mb-4">
                Discussion
              </h2>
              <div className="space-y-4">{renderComments(null)}</div>
              {user && (
                <div className="mt-4 flex gap-2 min-w-0">
                  <input
                    type="text"
                    value={newComment}
                    onChange={(e) => setNewComment(e.target.value)}
                    placeholder="Add a comment..."
                    className="flex-1 min-w-0 px-3 py-2 border rounded-lg"
                  />
                  <button
                    onClick={handleAddComment}
                    className="bg-emerald-600 text-white px-3 py-2 rounded-lg flex-shrink-0 whitespace-nowrap"
                  >
                    Post
                  </button>
                </div>
              )}
            </section>

            {/* Related Words */}
            {relatedWords.length > 0 && (
              <section className="pt-8 border-t border-stone-100">
                <h2 className="text-[10px] font-black text-stone-400 uppercase tracking-[0.3em] mb-6">
                  See Also
                </h2>
                <div className="grid grid-cols-1 md:grid-cols-3 gap-4">
                  {relatedWords.map((word) => (
                    <Link
                      key={word.id}
                      href={`/entry/${word.id}`}
                      className="group p-4 md:p-5 bg-stone-50 rounded-2xl hover:bg-emerald-50 transition-all border border-transparent hover:border-emerald-200 max-w-full min-w-0"
                    >
                      <p className="font-logo font-black text-stone-900 group-hover:text-emerald-700 uppercase text-sm mb-1">
                        {word.headword}
                      </p>
                      <p className="text-[10px] text-stone-500 line-clamp-1 italic">
                        {word.language?.name}
                      </p>
                    </Link>
                  ))}
                </div>
              </section>
            )}
          </div>

          {/* Action Buttons */}
          <div className="mt-16 pt-12 border-t border-stone-100 grid md:grid-cols-2 gap-4">
            <button
              onClick={() => setActiveModal('edit')}
              className="bg-emerald-600 text-white py-6 rounded-2xl font-black text-[11px] uppercase tracking-[0.3em] hover:bg-emerald-700 shadow-lg shadow-emerald-900/10 transition-all"
            >
              Suggest Amendment
            </button>
            <button
              onClick={() => setActiveModal('report')}
              className="bg-stone-50 text-stone-400 py-6 rounded-2xl font-black text-[11px] uppercase tracking-[0.3em] hover:bg-red-50 hover:text-red-500 transition-all"
            >
              Report Issue
            </button>
          </div>
        </div>

        {/* Footer Credits */}
        <div className="mt-8 flex items-center justify-between px-8 text-stone-400">
          <div className="flex items-center gap-3">
            <div className="w-8 h-8 rounded-full bg-stone-200 overflow-hidden border border-stone-300">
              {entry.contributor_avatar && (
                <img
                  src={entry.contributor_avatar}
                  className="w-full h-full object-cover"
                  alt=""
                />
              )}
            </div>
            <span className="text-[9px] font-black uppercase tracking-widest">
              Archived by{' '}
              <span className="text-stone-600 underline cursor-pointer">
                {entry.contributor_name}
              </span>
            </span>
          </div>
          <span className="text-[9px] font-black uppercase tracking-widest">
            Status: {entry.validation_status}
          </span>
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
