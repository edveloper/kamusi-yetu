import type { Metadata } from 'next'
import { SITE_URL } from '@/lib/constants/site'

export const metadata: Metadata = {
  title: 'Words Your Language Is Missing',
  description:
    'Pick a Kenyan language and see the meanings it has no word for yet, one at a time, so you can add them.',
  alternates: { canonical: `${SITE_URL}/contribute/gaps` },
}

export default function GapsLayout({ children }: { children: React.ReactNode }) {
  return children
}
