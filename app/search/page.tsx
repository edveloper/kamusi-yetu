import { Suspense } from 'react'
import SearchContent from './SearchContent'

export default function SearchPage() {
  return (
    <Suspense fallback={
      <div className="min-h-screen bg-neutral-50 flex items-center justify-center font-sans">
        <div className="text-center">
          {/* Using heritage-dark for the spinner to match your header */}
          <div className="animate-spin rounded-full h-12 w-12 border-b-2 border-heritage-dark mx-auto mb-6"></div>
          {/* Using the subtle wide-tracked uppercase style for the text */}
          <p className="text-neutral-600 font-black uppercase tracking-[0.3em] text-[10px]">
            Accessing Archive...
          </p>
        </div>
      </div>
    }>
      <SearchContent />
    </Suspense>
  )
}