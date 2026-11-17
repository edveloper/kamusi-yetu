'use client'

import { useSyncExternalStore } from 'react'
import Script from 'next/script'
import {
  GA_ID,
  getServerChoiceSnapshot,
  readAnalyticsChoice,
  subscribeAnalyticsChoice,
} from '@/lib/analytics-consent'

// GA4 for LughaKonnect. Preview deploys are skipped so test traffic stays out
// of the reports. Nothing loads until the visitor accepts analytics in the
// cookie banner.

const ENABLED =
  process.env.NODE_ENV === 'production' && process.env.NEXT_PUBLIC_VERCEL_ENV !== 'preview'

export function GoogleAnalytics() {
  const choice = useSyncExternalStore(
    subscribeAnalyticsChoice,
    readAnalyticsChoice,
    getServerChoiceSnapshot
  )

  if (!ENABLED || choice !== 'granted') return null

  return (
    <>
      <Script src={`https://www.googletagmanager.com/gtag/js?id=${GA_ID}`} strategy="afterInteractive" />
      <Script id="ga4-init" strategy="afterInteractive">
        {`window.dataLayer = window.dataLayer || [];
function gtag(){dataLayer.push(arguments);}
gtag('js', new Date());
gtag('config', '${GA_ID}');`}
      </Script>
    </>
  )
}
