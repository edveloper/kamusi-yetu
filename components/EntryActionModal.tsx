'use client'

import { useState } from 'react'

interface ActionModalProps {
  type: 'edit' | 'report'
  entry: any
  onClose: () => void
  onSubmit: (data: any) => Promise<void>
}

export default function EntryActionModal({ type, entry, onClose, onSubmit }: ActionModalProps) {
  const [loading, setLoading] = useState(false)
  const [formData, setFormData] = useState({
    headword: entry.headword,
    primary_definition: entry.primary_definition,
    reason: '',
    details: ''
  })

  const handleSubmit = async (e: React.FormEvent) => {
    e.preventDefault()
    setLoading(true)
    try {
      await onSubmit(formData)
      onClose()
    } catch (err) {
      alert('Submission failed. Please try again.')
    } finally {
      setLoading(false)
    }
  }

  const isEdit = type === 'edit'

  return (
    <div className="fixed inset-0 bg-stone-900/60 backdrop-blur-md z-[100] flex items-center justify-center p-4 overflow-y-auto">
      <div className="bg-white rounded-[2.5rem] max-w-2xl w-full p-8 md:p-12 shadow-2xl relative">
        <button onClick={onClose} className="absolute top-8 right-8 text-stone-400 hover:text-stone-900 font-black text-xl">✕</button>
        
        <h2 className="text-3xl font-black font-logo mb-2 uppercase tracking-tight">
          {isEdit ? 'Suggest an Amendment' : 'Report an Issue'}
        </h2>
        <p className="text-stone-500 text-sm mb-8 font-medium">
          {isEdit 
            ? `Your contribution will be reviewed by the Guardian Authority before the stone is updated.` 
            : `Help us maintain the integrity of the Archive. What is wrong with this record?`}
        </p>

        <form onSubmit={handleSubmit} className="space-y-6">
          {isEdit && (
            <>
              <div>
                <label className="block text-[10px] font-black text-stone-400 uppercase tracking-widest mb-2">Headword</label>
                <input 
                  type="text" 
                  value={formData.headword}
                  onChange={(e) => setFormData({...formData, headword: e.target.value})}
                  className="w-full p-4 bg-stone-50 border-2 border-stone-100 rounded-2xl focus:border-emerald-500 outline-none font-bold"
                />
              </div>
              <div>
                <label className="block text-[10px] font-black text-stone-400 uppercase tracking-widest mb-2">Corrected Definition</label>
                <textarea 
                  rows={4}
                  value={formData.primary_definition}
                  onChange={(e) => setFormData({...formData, primary_definition: e.target.value})}
                  className="w-full p-4 bg-stone-50 border-2 border-stone-100 rounded-2xl focus:border-emerald-500 outline-none font-medium text-sm"
                />
              </div>
            </>
          )}

          <div>
            <label className="block text-[10px] font-black text-stone-400 uppercase tracking-widest mb-2">
              {isEdit ? 'Reason for Change' : 'Nature of Issue'}
            </label>
            <select 
              className="w-full p-4 bg-stone-50 border-2 border-stone-100 rounded-2xl focus:border-emerald-500 outline-none font-bold text-sm"
              onChange={(e) => setFormData({...formData, reason: e.target.value})}
              required
            >
              <option value="">Select a reason...</option>
              {isEdit ? (
                <>
                  <option value="typo">Spelling/Grammar correction</option>
                  <option value="accuracy">Factually incorrect definition</option>
                  <option value="missing">Missing critical context</option>
                </>
              ) : (
                <>
                  <option value="spam">Spam or Nonsense</option>
                  <option value="offensive">Inappropriate/Offensive content</option>
                  <option value="duplicate">Duplicate of another entry</option>
                </>
              )}
            </select>
          </div>

          <div>
            <label className="block text-[10px] font-black text-stone-400 uppercase tracking-widest mb-2">Additional Details</label>
            <textarea 
              rows={3}
              placeholder={isEdit ? "Provide sources or more context..." : "Please explain the problem..."}
              onChange={(e) => setFormData({...formData, details: e.target.value})}
              className="w-full p-4 bg-stone-50 border-2 border-stone-100 rounded-2xl focus:border-emerald-500 outline-none font-medium text-sm"
            />
          </div>

          <button 
            type="submit" 
            disabled={loading}
            className="w-full py-5 bg-stone-900 text-white rounded-2xl font-black text-[10px] uppercase tracking-[0.3em] hover:bg-emerald-700 transition-all disabled:opacity-50"
          >
            {loading ? 'Submitting...' : 'Send to Guardian Authority'}
          </button>
        </form>
      </div>
    </div>
  )
}