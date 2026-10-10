// app/layout.tsx
import type { Metadata } from 'next'
import { Anton, Archivo, Literata, IBM_Plex_Mono } from 'next/font/google'
import './globals.css'
import Header from '@/components/layout/Header'
import { Footer } from '@/components/layout/Footer'
import { GoogleAnalytics } from '@/components/google-analytics'
import { AuthProvider } from '@/lib/contexts/AuthContext' 
import { SITE_DESCRIPTION, SITE_NAME, SITE_TITLE, SITE_URL } from '@/lib/constants/site'

// Anton is the voice of the thing. Heavy, condensed, poster-loud. Archivo at a
// wide width axis was respectable but polite, and polite is not the brief.
const anton = Anton({
  subsets: ['latin'],
  weight: '400',
  variable: '--font-anton',
  display: 'swap',
})

// Archivo does the work everywhere Anton would shout: navigation, buttons,
// running text, form labels.
const archivo = Archivo({
  subsets: ['latin'],
  variable: '--font-archivo',
  axes: ['wdth'],
  display: 'swap',
})

// Definitions are reference material and read better set in a serif built for
// sustained reading.
const literata = Literata({
  subsets: ['latin'],
  variable: '--font-literata',
  display: 'swap',
})

// Counts, language codes, IPA and metadata.
const plexMono = IBM_Plex_Mono({
  subsets: ['latin'],
  weight: ['400', '500', '600'],
  variable: '--font-mono',
  display: 'swap',
})


export const metadata: Metadata = {
  metadataBase: new URL(SITE_URL),
  title: {
    default: SITE_TITLE,
    template: `%s | ${SITE_NAME}`,
  },
  description: SITE_DESCRIPTION,
  applicationName: SITE_NAME,
  openGraph: {
    type: 'website',
    siteName: SITE_NAME,
    title: SITE_TITLE,
    description: SITE_DESCRIPTION,
    locale: 'en_KE',
  },
  twitter: {
    card: 'summary_large_image',
    title: SITE_TITLE,
    description: SITE_DESCRIPTION,
  },
}

export default function RootLayout({
  children,
}: {
  children: React.ReactNode
}) {
  return (
    <html
      lang="en"
      className={`${anton.variable} ${archivo.variable} ${literata.variable} ${plexMono.variable}`}
      data-scroll-behavior="smooth"
    >
      <body className="font-sans bg-paper text-ink-900 antialiased">
        {/* Wrap the layout content in the Provider */}
        <AuthProvider>
          <Header />
          <main>
            {children}
          </main>
          <Footer />
        </AuthProvider>
        <GoogleAnalytics />
      </body>
    </html>
  )
}
