import type { Metadata } from 'next'
import { SITE_URL } from '@/lib/constants/site'

export const metadata: Metadata = {
  title: 'Most Used Words Still Missing',
  description:
    'The words speakers use most in recorded Dholuo, Kikuyu, Swahili, Kalenjin, Taita and Somali speech that this dictionary does not have yet, one at a time, so you can add them.',
  alternates: { canonical: `${SITE_URL}/contribute/words` },
}

export default function WordsLayout({ children }: { children: React.ReactNode }) {
  return children
}
