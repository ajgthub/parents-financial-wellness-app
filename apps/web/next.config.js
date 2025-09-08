/** @type {import('next').NextConfig} */
const nextConfig = {
  experimental: {
    transpilePackages: ['shared', 'database']
  },
  images: {
    domains: ['images.unsplash.com', 'avatars.githubusercontent.com'],
  },
  env: {
    CUSTOM_KEY: process.env.CUSTOM_KEY,
  },
}

module.exports = nextConfig
