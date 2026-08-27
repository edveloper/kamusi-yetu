'use client'

import { useEffect, useState } from 'react'
import Link from 'next/link'
import { useAuth } from '@/lib/contexts/AuthContext'
import { getCommentVotes } from '@/lib/api/entries'

import {
  getEntry,
  getRelatedEntries,
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
import { submitSuggestion } from '@/lib/api/suggestions'
import { supabase } from '@/lib/supabase'
import EntryActionModal from '@/components/EntryActionModal'

export default function EntryCommunity({ entryId }: { entryId: string }) {
  const id = entryId

  const { user } = useAuth()

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
            .maybeSingle()
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
        await submitSuggestion({
          entry_id: id,
          user_id: user.id as any,
          type: 'edit',
          headword: data.headword,
          primary_definition: data.primary_definition,
          english_translation: data.english_translation,
          swahili_translation: data.swahili_translation,
          part_of_speech: data.part_of_speech,
          dialect_variant: data.dialect_variant,
          pronunciation_ipa: data.pronunciation_ipa,
          etymology: data.etymology,
          audio_url: data.audio_url,
          category: data.category,
          register: data.register,
          reason: data.reason,
          details: data.details,
          source_type: data.source_type,
          source_reference: data.source_reference,
          confidence: String(data.confidence)
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
    setLikesCount(prev => (typeof liked === 'boolean' && liked) ? prev + 1 : prev - 1)
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
            className="text-accent-600 underline break-words"
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
        <div className="bg-neutral-50 p-4 md:p-6 rounded-xl border border-neutral-200 max-w-full break-words">
          <div className="flex items-center gap-2 mb-2">
            <div className="w-6 h-6 rounded-full bg-neutral-200 overflow-hidden">
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
                className="bg-heritage-dark text-white px-3 py-2 rounded-lg text-sm"
              >
                Save
              </button>
              <button
                onClick={() => {
                  setEditingComment(null)
                  setEditText('')
                }}
                className="bg-neutral-200 px-3 py-2 rounded-lg text-sm"
              >
                Cancel
              </button>
            </div>
          ) : (
            <p className="text-neutral-700 break-words whitespace-pre-wrap">
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
                  className="text-accent-600"
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
                  className="text-accent-600"
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
                className="bg-heritage-dark text-white px-3 py-2 rounded-lg text-sm"
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
      <div className="min-h-screen bg-neutral-100 flex items-center justify-center font-display animate-pulse text-neutral-600">
        RECONSTRUCTING...
      </div>
    )
  if (!entry)
    return (
      <div className="min-h-screen bg-neutral-100 flex items-center justify-center font-display text-neutral-600 uppercase">
        Entry Not Found
      </div>
    )

  return (
    <section aria-labelledby="community-heading" className="border-t border-ink-200 bg-paper-warm">
      <div className="mx-auto max-w-4xl px-4 py-12 sm:px-6">
        <div className="mb-8 flex flex-wrap items-center justify-between gap-4">
          <h2 id="community-heading" className="label text-ink-600">
            Discussion
          </h2>
          <div className="flex items-center gap-2">
            <div className="relative">
              <button
                onClick={() => setShowShareMenu(!showShareMenu)}
                className="border border-ink-300 px-3 py-2 text-sm font-semibold text-ink-700 transition-colors hover:border-ink-900 hover:text-ink-900"
              >
                Share
              </button>
              {showShareMenu && (
                <div className="absolute right-0 top-full z-50 mt-1 w-44 border border-ink-300 bg-card shadow-medium">
                  {(['x', 'wa', 'fb'] as const).map((platform) => (
                    <button
                      key={platform}
                      onClick={() => handleShare(platform)}
                      className="block w-full border-b border-ink-200 px-4 py-2.5 text-left text-sm text-ink-700 hover:bg-paper-warm"
                    >
                      {platform === 'wa' ? 'WhatsApp' : platform.toUpperCase()}
                    </button>
                  ))}
                  <button
                    onClick={() => handleShare('copy')}
                    className="block w-full px-4 py-2.5 text-left text-sm text-ink-700 hover:bg-paper-warm"
                  >
                    Copy link
                  </button>
                </div>
              )}
            </div>
            <button
              onClick={handleSaveToggle}
              aria-pressed={isSaved}
              className={`border px-3 py-2 text-sm font-semibold transition-colors ${
                isSaved
                  ? 'border-signal-500 bg-signal-50 text-signal-700'
                  : 'border-ink-300 text-ink-700 hover:border-ink-900 hover:text-ink-900'
              }`}
            >
              {isSaved ? 'Saved' : 'Save'}
            </button>
          </div>
        </div>

        <div>
          <div className="space-y-10">
            {/* Likes */}
            <section className="border-t border-ink-200 pt-8">
              <button
                onClick={handleLike}
                className="flex items-center gap-2 text-accent-600 font-bold"
              >
                👍 Like
              </button>
              <span className="ml-2 text-neutral-500">
                {likesCount} {likesCount === 1 ? 'like' : 'likes'}
              </span>
            </section>

            {/* Comments */}
            <section className="border-t border-ink-200 pt-8">
              <h2 className="text-[10px] font-black text-neutral-600 uppercase tracking-[0.3em] mb-4">
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
                    className="bg-heritage-dark text-white px-3 py-2 rounded-lg flex-shrink-0 whitespace-nowrap"
                  >
                    Post
                  </button>
                </div>
              )}
            </section>

            {/* Related Words */}
            {relatedWords.length > 0 && (
              <section className="border-t border-ink-200 pt-8">
                <h2 className="text-[10px] font-black text-neutral-600 uppercase tracking-[0.3em] mb-6">
                  See Also
                </h2>
                <div className="grid grid-cols-1 md:grid-cols-3 gap-4">
                  {relatedWords.map((word) => (
                    <Link
                      key={word.id}
                      href={`/entry/${word.id}`}
                      className="group p-4 md:p-5 bg-accent-50 rounded-2xl hover:bg-accent-100 transition-all border border-transparent hover:border-accent-300 max-w-full min-w-0"
                    >
                      <p className="font-display font-black text-heritage-dark group-hover:text-accent-700 uppercase text-sm mb-1">
                        {word.headword}
                      </p>
                      <p className="text-[10px] text-neutral-500 line-clamp-1 italic">
                        {word.language?.name}
                      </p>
                    </Link>
                  ))}
                </div>
              </section>
            )}
          </div>

          {/* Action Buttons */}
          <div className="mt-12 grid gap-3 border-t border-ink-200 pt-10 md:grid-cols-2">
            <button onClick={() => setActiveModal('edit')} className="btn-secondary">
              Suggest a correction
            </button>
            <button
              onClick={() => setActiveModal('report')}
              className="border border-ink-300 px-5 py-3 text-[0.9375rem] font-semibold text-ink-600 transition-colors hover:border-signal-500 hover:text-signal-600"
            >
              Report a problem
            </button>
          </div>
        </div>

      </div>
    </section>
  )
}
