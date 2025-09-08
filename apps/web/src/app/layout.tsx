import type { Metadata } from 'next'
import { Inter } from 'next/font/google'
import './globals.css'

const inter = Inter({ subsets: ['latin'] })

export const metadata: Metadata = {
  title: 'FamilyWise - Smart Financial Planning for Growing Families',
  description: 'Take control of your family\'s financial future with intelligent budgeting, education savings goals, and retirement planning. Built by @ajgthub',
  keywords: 'family finance, budgeting, education savings, retirement planning, financial wellness',
  authors: [{ name: 'AJG', url: 'https://github.com/ajgthub' }],
  creator: 'AJG (@ajgthub)',
  openGraph: {
    title: 'FamilyWise - Smart Financial Planning',
    description: 'The complete financial planning solution for growing families',
    url: 'https://parents-financial-wellness-app-ajgthub.vercel.app',
    siteName: 'FamilyWise',
    type: 'website',
  },
  twitter: {
    card: 'summary_large_image',
    title: 'FamilyWise - Smart Financial Planning',
    description: 'Complete financial planning for growing families',
    creator: '@ajgthub',
  },
}

export default function RootLayout({
  children,
}: {
  children: React.ReactNode
}) {
  return (
    <html lang="en">
      <body className={inter.className}>{children}</body>
    </html>
  )
}
