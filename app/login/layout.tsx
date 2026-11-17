import type { Metadata } from 'next'

// The page is a client component, which cannot export metadata, so the title
// lives here. Account pages are personal and have nothing for a search engine,
// so they are kept out of the index as well as out of robots.txt.
export const metadata: Metadata = {
  title: 'Sign In',
  robots: { index: false, follow: false },
}

export default function LoginLayout({ children }: { children: React.ReactNode }) {
  return children
}
