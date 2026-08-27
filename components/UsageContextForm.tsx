'use client'

import { useState } from 'react'
import { createUsageContext, CreateUsageContextData } from '@/lib/api/users'

interface UsageContextFormProps {
  entryId: string
  userId: string
  onSuccess: () => void
  onCancel: () => void
}

export default function UsageContextForm({ 
  entryId, 
  userId, 
  onSuccess, 
  onCancel 
}: UsageContextFormProps) {
  const [contextType, setContextType] = useState('')
  const [usageText, setUsageText] = useState('')
  const [exampleSentence, setExampleSentence] = useState('')
  const [submitting, setSubmitting] = useState(false)

  const handleSubmit = async (e: React.FormEvent) => {
    e.preventDefault()
    
    if (!usageText.trim()) {
      alert('Please describe how this word is used')
      return
    }

    setSubmitting(true)
    try {
      await createUsageContext({
        entry_id: entryId,
        context_type: contextType || undefined,
        usage_text: usageText,
        example_sentence: exampleSentence || undefined,
        created_by: userId
      })
      
      alert('Usage example added successfully!')
      onSuccess()
    } catch (err) {
      console.error('Failed to add usage context:', err)
      alert('Failed to add usage example. Please try again.')
    } finally {
      setSubmitting(false)
    }
  }

  return (
    <div className="fixed inset-0 bg-black/50 flex items-center justify-center z-50 p-4">
      <div className="bg-white rounded-2xl shadow-2xl max-w-2xl w-full max-h-[90vh] overflow-y-auto">
        <div className="p-6 border-b border-ink-200">
          <div className="flex items-center justify-between">
            <h2 className="text-2xl font-bold text-ink-900">Add Usage Example</h2>
            <button 
              onClick={onCancel}
              className="text-ink-600 hover:text-ink-600 text-2xl"
            >
              ×
            </button>
          </div>
        </div>

        <form onSubmit={handleSubmit} className="p-6 space-y-6">
          {/* Context Type */}
          <div>
            <label className="block text-sm font-bold text-ink-700 mb-2">
              Context Type (Optional)
            </label>
            <select
              value={contextType}
              onChange={(e) => setContextType(e.target.value)}
              className="w-full px-4 py-2 border border-ink-300 rounded-lg focus:outline-none focus:ring-2 focus:ring-primary-500"
            >
              <option value="">Choose context...</option>
              <option value="formal">Formal</option>
              <option value="informal">Informal</option>
              <option value="traditional">Traditional</option>
              <option value="modern">Modern</option>
              <option value="urban">Urban</option>
              <option value="rural">Rural</option>
            </select>
          </div>

          {/* Usage Description */}
          <div>
            <label className="block text-sm font-bold text-ink-700 mb-2">
              How is this word used? <span className="text-signal-500">*</span>
            </label>
            <textarea
              value={usageText}
              onChange={(e) => setUsageText(e.target.value)}
              placeholder="Describe when and how this word is typically used..."
              className="w-full px-4 py-3 border border-ink-300 rounded-lg focus:outline-none focus:ring-2 focus:ring-primary-500"
              rows={3}
              required
            />
            <p className="text-xs text-ink-600 mt-1">
              Example: "Used when greeting elders" or "Common in casual conversations"
            </p>
          </div>

          {/* Example Sentence */}
          <div>
            <label className="block text-sm font-bold text-ink-700 mb-2">
              Example Sentence (Optional)
            </label>
            <textarea
              value={exampleSentence}
              onChange={(e) => setExampleSentence(e.target.value)}
              placeholder="Show this word in a complete sentence..."
              className="w-full px-4 py-3 border border-ink-300 rounded-lg focus:outline-none focus:ring-2 focus:ring-primary-500"
              rows={2}
            />
            <p className="text-xs text-ink-600 mt-1">
              A real-world example helps others understand better
            </p>
          </div>

          {/* Actions */}
          <div className="flex gap-3 pt-4">
            <button
              type="submit"
              disabled={submitting}
              className="flex-1 bg-primary-500 text-white px-6 py-3 rounded-lg hover:bg-primary-600 transition font-medium disabled:opacity-50"
            >
              {submitting ? 'Adding...' : 'Add Example'}
            </button>
            <button
              type="button"
              onClick={onCancel}
              className="px-6 py-3 border-2 border-ink-300 text-ink-700 rounded-lg hover:border-ink-300 transition font-medium"
            >
              Cancel
            </button>
          </div>
        </form>
      </div>
    </div>
  )
}