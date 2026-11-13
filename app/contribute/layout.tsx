import type { Metadata } from 'next'
import { SITE_URL } from '@/lib/constants/site'

// The form is a client component, which cannot export metadata, so the title
// lives here. Without it the page inherited the home page's title.
export const metadata: Metadata = {
  title: 'Add a Word in Your Language',
  description:
    'Add a word or phrase in any Kenyan language, with its meaning and, if you can, a recording of how it is said.',
  alternates: { canonical: `${SITE_URL}/contribute` },
}

export default function ContributeLayout({ children }: { children: React.ReactNode }) {
  return children
}
