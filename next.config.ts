import type { NextConfig } from "next";

// Headers every response carries. The Content-Security-Policy is deliberately
// narrow: it blocks framing, plugins and <base> hijacking without restricting
// scripts, because a script policy needs nonces for Next's inline scripts and
// GA4, and a wrong one breaks the site. Tighten it in its own change.
const securityHeaders = [
  { key: 'X-Content-Type-Options', value: 'nosniff' },
  { key: 'X-Frame-Options', value: 'DENY' },
  { key: 'Referrer-Policy', value: 'strict-origin-when-cross-origin' },
  // Microphone stays available to this site for entry recordings.
  { key: 'Permissions-Policy', value: 'camera=(), geolocation=(), microphone=(self)' },
  { key: 'Content-Security-Policy', value: "frame-ancestors 'none'; base-uri 'self'; object-src 'none'" },
];

const nextConfig: NextConfig = {
  poweredByHeader: false,

  // The social card routes read the brand fonts off disk at request time.
  // Next's tracer does not always follow a runtime join(process.cwd(), ...),
  // and when it misses, the routes work locally and then throw on Vercel
  // because the .ttf files were never bundled. Naming them here is the fix.
  outputFileTracingIncludes: {
    '/opengraph-image': ['./assets/fonts/**'],
    '/entry/[id]/opengraph-image': ['./assets/fonts/**'],
  },

  async headers() {
    return [{ source: '/:path*', headers: securityHeaders }];
  },

  // Retired pages. Permanent (308) so search engines move their ranking to
  // the new address; query strings such as /search?q=maji carry across.
  async redirects() {
    return [
      { source: '/search', destination: '/explore', permanent: true },
      { source: '/languages', destination: '/explore', permanent: true },
      { source: '/categories', destination: '/explore', permanent: true },
      { source: '/team', destination: '/about', permanent: true },
    ];
  },
};

export default nextConfig;
