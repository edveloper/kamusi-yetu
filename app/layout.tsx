// app/layout.tsx
import type { Metadata } from 'next'
import { Inter, Playfair_Display } from 'next/font/google'
import './globals.css'
import Header from '@/components/layout/Header'
import { Footer } from '@/components/layout/Footer'
import { AuthProvider } from '@/lib/contexts/AuthContext' 

const inter = Inter({ subsets: ['latin'] })
const playfair = Playfair_Display({ 
  subsets: ['latin'],
  variable: '--font-playfair',
  display: 'swap',
})

const SITE_NAME = 'LughaKonnect'
const SITE_DESCRIPTION =
  "An open corpus of Kenya's languages, documented by the people who speak them. Words, phrases and recordings, so these languages are usable by the technology that is coming."

export const metadata: Metadata = {
  metadataBase: new URL('https://lughakonnect.co.ke'),
  title: {
    default: `${SITE_NAME} — Kenyan languages, documented by their speakers`,
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
    title: `${SITE_NAME} — Kenyan languages, documented by their speakers`,
    description: SITE_DESCRIPTION,
    locale: 'en_KE',
  },
  twitter: {
    card: 'summary_large_image',
    title: `${SITE_NAME} — Kenyan languages, documented by their speakers`,
    description: SITE_DESCRIPTION,
  },
}

export default function RootLayout({
  children,
}: {
  children: React.ReactNode
}) {
  return (
    <html lang="en" className={playfair.variable} data-scroll-behavior="smooth">
      <body className={`${inter.className} bg-neutral-100`}>
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
