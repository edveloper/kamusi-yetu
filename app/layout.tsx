// app/layout.tsx
import type { Metadata } from 'next'
import { Archivo, Literata, IBM_Plex_Mono } from 'next/font/google'
import './globals.css'
import Header from '@/components/layout/Header'
import { Footer } from '@/components/layout/Footer'
import { AuthProvider } from '@/lib/contexts/AuthContext' 

// Archivo carries a width axis, which is what gives headwords real presence
// without reaching for the editorial serif every generated site uses.
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

const SITE_NAME = 'LughaKonnect'
const SITE_DESCRIPTION =
  "An open corpus of Kenya's languages, documented by the people who speak them. Words, phrases and recordings, so these languages are usable by the technology that is coming."

export const metadata: Metadata = {
  metadataBase: new URL('https://lughakonnect.co.ke'),
  title: {
    default: `${SITE_NAME}. Kenyan languages, documented by their speakers`,
    template: `%s | ${SITE_NAME}`,
  },
  description: SITE_DESCRIPTION,
  applicationName: SITE_NAME,
  icons: {
    icon: '/favicon.ico',
    shortcut: '/favicon.ico',
  },
  openGraph: {
    type: 'website',
    siteName: SITE_NAME,
    title: `${SITE_NAME}. Kenyan languages, documented by their speakers`,
    description: SITE_DESCRIPTION,
    locale: 'en_KE',
  },
  twitter: {
    card: 'summary_large_image',
    title: `${SITE_NAME}. Kenyan languages, documented by their speakers`,
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
      className={`${archivo.variable} ${literata.variable} ${plexMono.variable}`}
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
      </body>
    </html>
  )
}
