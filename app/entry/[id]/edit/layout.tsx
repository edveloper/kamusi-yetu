import type { Metadata } from 'next'

// The edit page is a client component, which cannot export metadata. It is a
// working surface, not something to find in search results.
export const metadata: Metadata = {
  title: 'Edit an Entry',
  robots: { index: false, follow: false },
}

export default function EditEntryLayout({ children }: { children: React.ReactNode }) {
  return children
}
