import type { NextConfig } from "next";

const nextConfig: NextConfig = {
  // The social card routes read the brand fonts off disk at request time.
  // Next's tracer does not always follow a runtime join(process.cwd(), ...),
  // and when it misses, the routes work locally and then throw on Vercel
  // because the .ttf files were never bundled. Naming them here is the fix.
  outputFileTracingIncludes: {
    '/opengraph-image': ['./assets/fonts/**'],
    '/entry/[id]/opengraph-image': ['./assets/fonts/**'],
  },
};

export default nextConfig;
