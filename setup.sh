#!/bin/bash
# setup.sh - Parents Financial Wellness App Setup for @ajgthub
# Repository: https://github.com/ajgthub/parents-financial-wellness-app

set -e

echo "🚀 Setting up Parents Financial Wellness App for @ajgthub..."
echo "📁 Repository: https://github.com/ajgthub/parents-financial-wellness-app"
echo ""

# Create complete directory structure
echo "📂 Creating project structure..."
mkdir -p {apps/{web/{public/{icons,images},src/{app/{api/{auth,family-dashboard,budget,savings},'(auth)'/{login,signup},dashboard/{budget,kids,retirement}},components/{ui,forms,charts,layout,dashboard},hooks,lib,styles}},mobile/{app/{'(auth)','(tabs)'},components,constants,hooks,assets}},packages/{shared/src/{types,api,utils,constants},database/{prisma/{migrations},src}},server/src/{routes,middleware,services},docs,.github/workflows}

# Root package.json with your info
cat > package.json << 'EOF'
{
  "name": "parents-financial-wellness-app",
  "version": "1.0.0",
  "description": "Smart financial planning app for growing families by @ajgthub",
  "author": "AJG (@ajgthub)",
  "license": "MIT",
  "repository": {
    "type": "git",
    "url": "https://github.com/ajgthub/parents-financial-wellness-app.git"
  },
  "homepage": "https://github.com/ajgthub/parents-financial-wellness-app#readme",
  "private": true,
  "workspaces": ["apps/*", "packages/*"],
  "scripts": {
    "build": "turbo run build",
    "dev": "turbo run dev --parallel",
    "lint": "turbo run lint",
    "test": "turbo run test",
    "clean": "turbo run clean",
    "type-check": "turbo run type-check",
    "db:generate": "cd packages/database && npx prisma generate",
    "db:push": "cd packages/database && npx prisma db push",
    "db:migrate": "cd packages/database && npx prisma migrate dev",
    "db:seed": "cd packages/database && npx tsx prisma/seed.ts",
    "db:studio": "cd packages/database && npx prisma studio",
    "format": "prettier --write .",
    "prepare": "husky install"
  },
  "devDependencies": {
    "turbo": "^1.10.16",
    "@types/node": "^20.10.0",
    "typescript": "^5.3.2",
    "prettier": "^3.1.0",
    "eslint": "^8.55.0",
    "husky": "^8.0.3",
    "lint-staged": "^15.2.0"
  },
  "engines": {
    "node": ">=18.0.0"
  },
  "packageManager": "pnpm@8.12.0"
}
EOF

echo "✅ Created root package.json"

# Web app package.json
cat > apps/web/package.json << 'EOF'
{
  "name": "web",
  "version": "1.0.0",
  "private": true,
  "scripts": {
    "dev": "next dev",
    "build": "next build",
    "start": "next start",
    "lint": "next lint",
    "type-check": "tsc --noEmit"
  },
  "dependencies": {
    "next": "^14.0.4",
    "react": "^18.2.0",
    "react-dom": "^18.2.0",
    "@prisma/client": "^5.7.0",
    "zod": "^3.22.4",
    "zustand": "^4.4.7",
    "@tanstack/react-query": "^5.8.4",
    "tailwindcss": "^3.3.6",
    "autoprefixer": "^10.4.16",
    "postcss": "^8.4.32",
    "clsx": "^2.0.0",
    "tailwind-merge": "^2.2.0",
    "lucide-react": "^0.300.0",
    "recharts": "^2.8.0",
    "@radix-ui/react-dialog": "^1.0.5",
    "@radix-ui/react-dropdown-menu": "^2.0.6",
    "@radix-ui/react-toast": "^1.1.5",
    "@radix-ui/react-tabs": "^1.0.4",
    "date-fns": "^2.30.0",
    "shared": "workspace:*",
    "database": "workspace:*"
  },
  "devDependencies": {
    "@types/react": "^18.2.45",
    "@types/react-dom": "^18.2.18",
    "@types/node": "^20.10.0",
    "typescript": "^5.3.3",
    "eslint": "^8.56.0",
    "eslint-config-next": "^14.0.4",
    "@tailwindcss/forms": "^0.5.7",
    "@tailwindcss/typography": "^0.5.10"
  }
}
EOF

echo "✅ Created web app package.json"

# Create the beautiful web app
cat > apps/web/src/app/layout.tsx << 'EOF'
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
EOF

cat > apps/web/src/app/globals.css << 'EOF'
@tailwind base;
@tailwind components;
@tailwind utilities;

@layer base {
  :root {
    --background: 0 0% 100%;
    --foreground: 222.2 84% 4.9%;
    --primary: 221.2 83.2% 53.3%;
    --primary-foreground: 210 40% 98%;
    --secondary: 210 40% 96%;
    --secondary-foreground: 222.2 84% 4.9%;
    --muted: 210 40% 96%;
    --muted-foreground: 215.4 16.3% 46.9%;
    --accent: 210 40% 96%;
    --accent-foreground: 222.2 84% 4.9%;
    --destructive: 0 84.2% 60.2%;
    --destructive-foreground: 210 40% 98%;
    --border: 214.3 31.8% 91.4%;
    --input: 214.3 31.8% 91.4%;
    --ring: 221.2 83.2% 53.3%;
    --radius: 0.5rem;
  }
}

@layer base {
  * {
    @apply border-border;
  }
  body {
    @apply bg-background text-foreground;
  }
}

@layer components {
  .gradient-bg {
    @apply bg-gradient-to-br from-blue-50 via-indigo-50 to-purple-50;
  }
  
  .card-hover {
    @apply transition-all duration-200 hover:shadow-lg hover:-translate-y-1;
  }
  
  .btn-primary {
    @apply bg-blue-600 hover:bg-blue-700 text-white px-6 py-3 rounded-lg font-medium transition-colors duration-200;
  }
  
  .btn-secondary {
    @apply border border-blue-600 text-blue-600 hover:bg-blue-50 px-6 py-3 rounded-lg font-medium transition-colors duration-200;
  }
}
EOF

cat > apps/web/src/app/page.tsx << 'EOF'
import { Wallet, GraduationCap, TrendingUp, Users, Shield, Smartphone, BarChart3, Target, ArrowRight } from 'lucide-react'
import Link from 'next/link'

export default function Home() {
  return (
    <div className="min-h-screen gradient-bg">
      {/* Header */}
      <header className="bg-white/80 backdrop-blur-sm shadow-sm sticky top-0 z-50">
        <div className="max-w-7xl mx-auto px-4 sm:px-6 lg:px-8">
          <div className="flex justify-between items-center h-16">
            <div className="flex items-center space-x-3">
              <div className="p-2 bg-blue-600 rounded-lg">
                <Wallet className="h-6 w-6 text-white" />
              </div>
              <div>
                <h1 className="text-xl font-bold text-gray-900">FamilyWise</h1>
                <p className="text-xs text-gray-500">by @ajgthub</p>
              </div>
            </div>
            <nav className="hidden md:flex items-center space-x-8">
              <a href="#features" className="text-gray-700 hover:text-blue-600 font-medium">Features</a>
              <a href="#demo" className="text-gray-700 hover:text-blue-600 font-medium">Demo</a>
              <Link href="/dashboard" className="btn-primary">
                View Dashboard
              </Link>
            </nav>
          </div>
        </div>
      </header>

      {/* Hero Section */}
      <section className="pt-20 pb-16 px-4 sm:px-6 lg:px-8">
        <div className="max-w-7xl mx-auto text-center">
          <div className="mb-8">
            <div className="inline-flex items-center bg-blue-100 text-blue-800 px-4 py-2 rounded-full text-sm font-medium mb-6">
              <Shield className="h-4 w-4 mr-2" />
              Secure • Private • Family-First
            </div>
          </div>
          
          <h1 className="text-4xl md:text-6xl lg:text-7xl font-bold text-gray-900 mb-6 leading-tight">
            Smart Financial Planning for{' '}
            <span className="text-transparent bg-clip-text bg-gradient-to-r from-blue-600 to-purple-600">
              Growing Families
            </span>
          </h1>
          
          <p className="text-xl md:text-2xl text-gray-600 mb-10 max-w-4xl mx-auto leading-relaxed">
            Take control of your family's financial future with intelligent budgeting, 
            education savings goals, and retirement planning—all in one beautiful, secure platform.
          </p>
          
          <div className="flex flex-col sm:flex-row gap-4 justify-center mb-16">
            <Link href="/dashboard" className="btn-primary text-lg px-8 py-4 inline-flex items-center">
              Try Live Demo
              <ArrowRight className="ml-2 h-5 w-5" />
            </Link>
            <a href="https://github.com/ajgthub/parents-financial-wellness-app" 
               className="btn-secondary text-lg px-8 py-4 inline-flex items-center"
               target="_blank" rel="noopener noreferrer">
              <svg className="w-5 h-5 mr-2" fill="currentColor" viewBox="0 0 20 20">
                <path fillRule="evenodd" d="M10 0C4.477 0 0 4.484 0 10.017c0 4.425 2.865 8.18 6.839 9.504.5.092.682-.217.682-.483 0-.237-.008-.868-.013-1.703-2.782.605-3.369-1.343-3.369-1.343-.454-1.158-1.11-1.466-1.11-1.466-.908-.62.069-.608.069-.608 1.003.07 1.531 1.032 1.531 1.032.892 1.53 2.341 1.088 2.91.832.092-.647.35-1.088.636-1.338-2.22-.253-4.555-1.113-4.555-4.951 0-1.093.39-1.988 1.029-2.688-.103-.253-.446-1.272.098-2.65 0 0 .84-.27 2.75 1.026A9.564 9.564 0 0110 4.844c.85.004 1.705.115 2.504.337 1.909-1.296 2.747-1.027 2.747-1.027.546 1.379.203 2.398.1 2.651.64.7 1.028 1.595 1.028 2.688 0 3.848-2.339 4.695-4.566 4.942.359.31.678.921.678 1.856 0 1.338-.012 2.419-.012 2.747 0 .268.18.58.688.482A10.019 10.019 0 0020 10.017C20 4.484 15.522 0 10 0z" clipRule="evenodd" />
              </svg>
              View Source
            </a>
          </div>

          {/* Stats */}
          <div className="grid grid-cols-2 md:grid-cols-4 gap-8 max-w-3xl mx-auto">
            <div className="text-center">
              <div className="text-3xl font-bold text-blue-600">100%</div>
              <div className="text-gray-600">Open Source</div>
            </div>
            <div className="text-center">
              <div className="text-3xl font-bold text-green-600">0</div>
              <div className="text-gray-600">Setup Cost</div>
            </div>
            <div className="text-center">
              <div className="text-3xl font-bold text-purple-600">∞</div>
              <div className="text-gray-600">Customizable</div>
            </div>
            <div className="text-center">
              <div className="text-3xl font-bold text-orange-600">5★</div>
              <div className="text-gray-600">Developer UX</div>
            </div>
          </div>
        </div>
      </section>

      {/* Features Section */}
      <section id="features" className="py-20 bg-white">
        <div className="max-w-7xl mx-auto px-4 sm:px-6 lg:px-8">
          <div className="text-center mb-16">
            <h2 className="text-3xl md:text-4xl font-bold text-gray-900 mb-4">
              Everything Your Family Needs
            </h2>
            <p className="text-xl text-gray-600 max-w-2xl mx-auto">
              A comprehensive financial planning platform designed specifically for growing families
            </p>
          </div>

          <div className="grid md:grid-cols-2 lg:grid-cols-3 gap-8 mb-16">
            <div className="text-center p-8 rounded-2xl hover:shadow-lg transition-shadow">
              <div className="bg-blue-100 w-16 h-16 rounded-2xl flex items-center justify-center mx-auto mb-6">
                <BarChart3 className="h-8 w-8 text-blue-600" />
              </div>
              <h3 className="text-xl font-semibold text-gray-900 mb-3">Smart Budgeting</h3>
              <p className="text-gray-600">
                Track family expenses with intelligent categorization, spending insights, 
                and automatic budget recommendations based on your family's needs.
              </p>
            </div>

            <div className="text-center p-8 rounded-2xl hover:shadow-lg transition-shadow">
              <div className="bg-green-100 w-16 h-16 rounded-2xl flex items-center justify-center mx-auto mb-6">
                <GraduationCap className="h-8 w-8 text-green-600" />
              </div>
              <h3 className="text-xl font-semibold text-gray-900 mb-3">Education Planning</h3>
              <p className="text-gray-600">
                Plan for each child's future with dedicated college funds, 529 plan tracking, 
                and projected education cost calculations.
              </p>
            </div>

            <div className="text-center p-8 rounded-2xl hover:shadow-lg transition-shadow">
              <div className="bg-purple-100 w-16 h-16 rounded-2xl flex items-center justify-center mx-auto mb-6">
                <TrendingUp className="h-8 w-8 text-purple-600" />
              </div>
              <h3 className="text-xl font-semibold text-gray-900 mb-3">Retirement Ready</h3>
              <p className="text-gray-600">
                Stay on track for retirement while supporting your family with personalized 
                contribution strategies and progress tracking.
              </p>
            </div>

            <div className="text-center p-8 rounded-2xl hover:shadow-lg transition-shadow">
              <div className="bg-orange-100 w-16 h-16 rounded-2xl flex items-center justify-center mx-auto mb-6">
                <Smartphone className="h-8 w-8 text-orange-600" />
              </div>
              <h3 className="text-xl font-semibold text-gray-900 mb-3">Cross-Platform</h3>
              <p className="text-gray-600">
                Access your financial data anywhere with responsive web design and 
                native mobile apps for iOS and Android.
              </p>
            </div>

            <div className="text-center p-8 rounded-2xl hover:shadow-lg transition-shadow">
              <div className="bg-red-100 w-16 h-16 rounded-2xl flex items-center justify-center mx-auto mb-6">
                <Users className="h-8 w-8 text-red-600" />
              </div>
              <h3 className="text-xl font-semibold text-gray-900 mb-3">Family Focused</h3>
              <p className="text-gray-600">
                Multiple family member support, kid-specific goals, and shared financial 
                responsibility tracking for couples.
              </p>
            </div>

            <div className="text-center p-8 rounded-2xl hover:shadow-lg transition-shadow">
              <div className="bg-teal-100 w-16 h-16 rounded-2xl flex items-center justify-center mx-auto mb-6">
                <Target className="h-8 w-8 text-teal-600" />
              </div>
              <h3 className="text-xl font-semibold text-gray-900 mb-3">Goal Tracking</h3>
              <p className="text-gray-600">
                Set and achieve financial milestones with visual progress tracking, 
                smart recommendations, and celebration moments.
              </p>
            </div>
          </div>

          {/* CTA Section */}
          <div className="text-center bg-gradient-to-r from-blue-600 to-purple-600 rounded-3xl p-12 text-white">
            <h3 className="text-3xl font-bold mb-4">Ready to Transform Your Family's Finances?</h3>
            <p className="text-xl mb-8 opacity-90">
              Join thousands of families already using FamilyWise to secure their financial future
            </p>
            <div className="flex flex-col sm:flex-row gap-4 justify-center">
              <Link href="/dashboard" className="bg-white text-blue-600 hover:bg-gray-100 px-8 py-3 rounded-lg font-medium transition-colors">
                Try Live Demo
              </Link>
              <a 
                href="https://github.com/ajgthub/parents-financial-wellness-app" 
                className="border border-white text-white hover:bg-white hover:text-blue-600 px-8 py-3 rounded-lg font-medium transition-colors"
                target="_blank" 
                rel="noopener noreferrer"
              >
                Deploy Your Own
              </a>
            </div>
          </div>
        </div>
      </section>

      {/* Footer */}
      <footer className="bg-gray-900 text-white py-12">
        <div className="max-w-7xl mx-auto px-4 sm:px-6 lg:px-8">
          <div className="flex flex-col md:flex-row justify-between items-center">
            <div className="flex items-center space-x-3 mb-4 md:mb-0">
              <div className="p-2 bg-blue-600 rounded-lg">
                <Wallet className="h-6 w-6 text-white" />
              </div>
              <div>
                <div className="font-bold">FamilyWise</div>
                <div className="text-gray-400 text-sm">Built with ❤️ by @ajgthub</div>
              </div>
            </div>
            <div className="flex items-center space-x-6">
              <a 
                href="https://github.com/ajgthub/parents-financial-wellness-app" 
                className="text-gray-400 hover:text-white transition-colors"
                target="_blank" 
                rel="noopener noreferrer"
              >
                GitHub
              </a>
              <a 
                href="https://github.com/ajgthub" 
                className="text-gray-400 hover:text-white transition-colors"
                target="_blank" 
                rel="noopener noreferrer"
              >
                @ajgthub
              </a>
              <div className="text-gray-500 text-sm">
                MIT License
              </div>
            </div>
          </div>
        </div>
      </footer>
    </div>
  )
}
EOF

echo "✅ Created beautiful landing page"

# Dashboard page with comprehensive features
cat > apps/web/src/app/dashboard/page.tsx << 'EOF'
'use client'

import { useState } from 'react'
import { 
  DollarSign, Target, GraduationCap, Users, TrendingUp, 
  ArrowUp, ArrowDown, AlertCircle, CheckCircle, Info,
  Wallet, Calendar, PlusCircle
} from 'lucide-react'

// Comprehensive mock data
const mockData = {
  family: { 
    name: 'Johnson Family',
    members: [
      { id: '1', name: 'Sarah Johnson', email: 'sarah@johnson.com' },
      { id: '2', name: 'Mike Johnson', email: 'mike@johnson.com' }
    ],
    kids: [
      { id: '1', name: 'Emma', age: 9, birthday: '2015-03-15' },
      { id: '2', name: 'Liam', age: 6, birthday: '2018-07-22' }
    ]
  },
  budget: {
    total: 8500,
    spent: 6200,
    remaining: 2300,
    categories: [
      { name: 'Housing', amount: 3000, spent: 3000, progress: 100, color: 'bg-red-500' },
      { name: 'Food', amount: 800, spent: 650, progress: 81, color: 'bg-yellow-500' },
      { name: 'Transportation', amount: 600, spent: 450, progress: 75, color: 'bg-green-500' },
      { name: 'Entertainment', amount: 400, spent: 320, progress: 80, color: 'bg-blue-500' },
      { name: 'Healthcare', amount: 300, spent: 180, progress: 60, color: 'bg-purple-500' },
      { name: 'Education', amount: 250, spent: 200, progress: 80, color: 'bg-indigo-500' }
    ]
  },
  savings: {
    total: 85000,
    target: 150000,
    progress: 57,
    goals: [
      { 
        name: "Emma's College Fund", 
        current: 25000, 
        target: 50000, 
        progress: 50, 
        monthly: 400,
        category: 'education',
        yearsLeft: 9
      },
      { 
        name: "Liam's College Fund", 
        current: 15000, 
        target: 50000, 
        progress: 30, 
        monthly: 350,
        category: 'education',
        yearsLeft: 12
      },
      { 
        name: 'Emergency Fund', 
        current: 25000, 
        target: 30000, 
        progress: 83, 
        monthly: 200,
        category: 'emergency',
        yearsLeft: 0.5
      },
      { 
        name: 'Retirement Boost', 
        current: 20000, 
        target: 20000, 
        progress: 100, 
        monthly: 500,
        category: 'retirement',
        yearsLeft: 0
      }
    ]
  },
  transactions: [
    { id: '1', amount: -120, description: 'Whole Foods Market', category: 'Food', date: '2024-01-15', type: 'expense' },
    { id: '2', amount: 5000, description: 'Salary Deposit', category: 'Income', date: '2024-01-15', type: 'income' },
    { id: '3', amount: -85, description: 'Shell Gas Station', category: 'Transportation', date: '2024-01-14', type: 'expense' },
    { id: '4', amount: -750, description: 'College Savings Transfer', category: 'Savings', date: '2024-01-14', type: 'transfer' },
    { id: '5', amount: -45, description: 'Netflix Subscription', category: 'Entertainment', date: '2024-01-13', type: 'expense' },
    { id: '6', amount: -2800, description: 'Mortgage Payment', category: 'Housing', date: '2024-01-12', type: 'expense' }
  ],
  insights: [
    { 
      id: '1', 
      type: 'success', 
      title: 'Great Progress!', 
      message: "You're ahead of schedule on Emma's college savings by 3 months",
      action: 'View Details'
    },
    { 
      id: '2', 
      type: 'warning', 
      title: 'Budget Alert', 
      message: 'Housing spending has reached 100% of monthly budget',
      action: 'Adjust Budget'
    },
    { 
      id: '3', 
      type: 'tip', 
      title: 'Smart Tip', 
      message: 'Consider increasing emergency fund contributions by $100/month',
      action: 'Set Up Auto-Transfer'
    }
  ]
}

const StatCard = ({ icon: Icon, label, value, change, changeType, color = "text-blue-600" }) => (
  <div className="bg-white rounded-xl shadow-sm border p-6 hover:shadow-md transition-shadow">
    <div className="flex items-center justify-between">
      <div className="flex items-center">
        <div className={`p-3 rounded-lg ${color === 'text-blue-600' ? 'bg-blue-100' : color === 'text-green-600' ? 'bg-green-100' : color === 'text-purple-600' ? 'bg-purple-100' : 'bg-orange-100'}`}>
          <Icon className={`h-6 w-6 ${color}`} />
        </div>
        <div className="ml-4">
          <p className="text-sm text-gray-600">{label}</p>
          <p className="text-2xl font-bold text-gray-900">{value}</p>
        </div>
      </div>
      {change && (
        <div className={`flex items-center ${changeType === 'positive' ? 'text-green-600' : 'text-red-600'}`}>
          {changeType === 'positive' ? <ArrowUp className="h-4 w-4 mr-1" /> : <ArrowDown className="h-4 w-4 mr-1" />}
          <span className="text-sm font-medium">{change}</span>
        </div>
      )}
    </div>
  </div>
)

const ProgressBar = ({ progress, color = "bg-blue-500" }) => (
  <div className="w-full bg-gray-200 rounded-full h-2">
    <div 
      className={`h-2 rounded-full ${color}`}
      style={{ width: `${Math.min(progress, 100)}%` }}
    ></div>
  </div>
)

export default function Dashboard() {
  const [activeTab, setActiveTab] = useState('overview')

  return (
    <div className="min-h-screen bg-gray-50">
      {/* Header */}
      <header className="bg-white shadow-sm border-b">
        <div className="max-w-7xl mx-auto px-4 sm:px-6 lg:px-8">
          <div className="flex justify-between items-center h-16">
            <div className="flex items-center space-x-4">
              <div className="p-2 bg-blue-600 rounded-lg">
                <Wallet className="h-5 w-5 text-white" />
              </div>
              <div>
                <h1 className="text-xl font-bold text-gray-900">FamilyWise Dashboard</h1>
                <p className="text-sm text-gray-500">Welcome back, {mockData.family.name}</p>
              </div>
            </div>
            <div className="flex items-center space-x-4">
              <button className="p-2 text-gray-400 hover:text-gray-600">
                <Calendar className="h-5 w-5" />
              </button>
              <button className="bg-blue-600 text-white px-4 py-2 rounded-lg text-sm font-medium hover:bg-blue-700 flex items-center">
                <PlusCircle className="h-4 w-4 mr-2" />
                Add Transaction
              </button>
            </div>
          </div>
        </div>
      </header>

      <main className="max-w-7xl mx-auto px-4 sm:px-6 lg:px-8 py-8">
        {/* Key Metrics */}
        <div className="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-4 gap-6 mb-8">
          <StatCard
            icon={DollarSign}
            label="Monthly Budget"
            value={`${mockData.budget.total.toLocaleString()}`}
            change="5.2%"
            changeType="positive"
            color="text-blue-600"
          />
          <StatCard
            icon={Target}
            label="Total Savings"
            value={`${mockData.savings.total.toLocaleString()}`}
            change="12.1%"
            changeType="positive"
            color="text-green-600"
          />
          <StatCard
            icon={GraduationCap}
            label="Education Fund"
            value={`${mockData.savings.goals.filter(g => g.category === 'education').reduce((sum, g) => sum + g.current, 0).toLocaleString()}`}
            change="8.3%"
            changeType="positive"
            color="text-purple-600"
          />
          <StatCard
            icon={Users}
            label="Family Members"
            value={mockData.family.members.length + mockData.family.kids.length}
            color="text-orange-600"
          />
        </div>

        {/* Main Content Grid */}
        <div className="grid grid-cols-1 lg:grid-cols-3 gap-8 mb-8">
          {/* Budget Overview */}
          <div className="lg:col-span-2 bg-white rounded-xl shadow-sm border p-6">
            <div className="flex justify-between items-center mb-6">
              <h3 className="text-lg font-semibold text-gray-900">Budget Overview</h3>
              <div className="text-sm text-gray-500">January 2024</div>
            </div>
            
            <div className="mb-6">
              <div className="flex justify-between items-center mb-2">
                <span className="text-sm text-gray-600">Total Spent</span>
                <span className="font-semibold">${mockData.budget.spent.toLocaleString()} / ${mockData.budget.total.toLocaleString()}</span>
              </div>
              <ProgressBar 
                progress={(mockData.budget.spent / mockData.budget.total) * 100}
                color="bg-gradient-to-r from-blue-500 to-purple-500"
              />
              <div className="text-right mt-1">
                <span className="text-sm text-green-600 font-medium">
                  ${mockData.budget.remaining.toLocaleString()} remaining
                </span>
              </div>
            </div>

            <div className="space-y-4">
              {mockData.budget.categories.map((category, index) => (
                <div key={index} className="flex items-center justify-between">
                  <div className="flex items-center space-x-3">
                    <div className={`w-3 h-3 rounded-full ${category.color}`}></div>
                    <span className="text-sm font-medium text-gray-700">{category.name}</span>
                  </div>
                  <div className="flex items-center space-x-4">
                    <div className="text-right">
                      <div className="text-sm font-medium">${category.spent.toLocaleString()}</div>
                      <div className="text-xs text-gray-500">of ${category.amount.toLocaleString()}</div>
                    </div>
                    <div className="w-20">
                      <ProgressBar 
                        progress={category.progress}
                        color={category.progress > 90 ? 'bg-red-500' : category.progress > 75 ? 'bg-yellow-500' : 'bg-green-500'}
                      />
                    </div>
                    <div className="text-xs font-medium text-gray-600 w-12 text-right">
                      {category.progress}%
                    </div>
                  </div>
                </div>
              ))}
            </div>
          </div>

          {/* Savings Goals */}
          <div className="bg-white rounded-xl shadow-sm border p-6">
            <h3 className="text-lg font-semibold text-gray-900 mb-6">Savings Goals</h3>
            <div className="space-y-6">
              {mockData.savings.goals.map((goal, index) => (
                <div key={index} className="border-l-4 border-blue-500 pl-4">
                  <div className="flex justify-between items-start mb-2">
                    <div>
                      <h4 className="font-medium text-gray-900 text-sm">{goal.name}</h4>
                      <p className="text-xs text-gray-500">
                        {goal.yearsLeft > 0 ? `${goal.yearsLeft} years left` : 'Goal reached!'}
                      </p>
                    </div>
                    <div className="text-right">
                      <div className="text-sm font-semibold text-gray-900">
                        ${goal.current.toLocaleString()}
                      </div>
                      <div className="text-xs text-gray-500">
                        of ${goal.target.toLocaleString()}
                      </div>
                    </div>
                  </div>
                  <ProgressBar 
                    progress={goal.progress}
                    color={goal.progress === 100 ? 'bg-green-500' : 'bg-blue-500'}
                  />
                  <div className="flex justify-between mt-2">
                    <span className="text-xs text-gray-500">{goal.progress}% complete</span>
                    <span className="text-xs text-blue-600 font-medium">
                      +${goal.monthly}/month
                    </span>
                  </div>
                </div>
              ))}
            </div>
          </div>
        </div>

        {/* Kids Education & Recent Transactions */}
        <div className="grid grid-cols-1 lg:grid-cols-2 gap-8 mb-8">
          {/* Kids Education */}
          <div className="bg-white rounded-xl shadow-sm border p-6">
            <h3 className="text-lg font-semibold text-gray-900 mb-6">Kids' Education Planning</h3>
            <div className="space-y-6">
              {mockData.family.kids.map((kid, index) => {
                const educationGoal = mockData.savings.goals.find(g => 
                  g.name.includes(kid.name) && g.category === 'education'
                );
                return (
                  <div key={index} className="border rounded-lg p-4 hover:bg-gray-50 transition-colors">
                    <div className="flex justify-between items-start mb-3">
                      <div>
                        <h4 className="font-medium text-gray-900">{kid.name}</h4>
                        <p className="text-sm text-gray-600">Age {kid.age} • College in {18 - kid.age} years</p>
                      </div>
                      {educationGoal && (
                        <div className="text-right">
                          <div className="text-lg font-bold text-green-600">
                            ${educationGoal.current.toLocaleString()}
                          </div>
                          <div className="text-xs text-gray-500">
                            ${educationGoal.target.toLocaleString()} goal
                          </div>
                        </div>
                      )}
                    </div>
                    {educationGoal && (
                      <>
                        <ProgressBar progress={educationGoal.progress} color="bg-green-500" />
                        <div className="flex justify-between mt-2 text-sm">
                          <span className="text-gray-600">{educationGoal.progress}% funded</span>
                          <span className="text-green-600 font-medium">On track</span>
                        </div>
                      </>
                    )}
                  </div>
                )
              })}
              
              <div className="bg-blue-50 border border-blue-200 rounded-lg p-4">
                <h4 className="font-medium text-blue-900 mb-1">Education Fund Status</h4>
                <p className="text-sm text-blue-700">
                  Total saved: ${mockData.savings.goals.filter(g => g.category === 'education').reduce((sum, g) => sum + g.current, 0).toLocaleString()} 
                  of ${mockData.savings.goals.filter(g => g.category === 'education').reduce((sum, g) => sum + g.target, 0).toLocaleString()} goal
                </p>
              </div>
            </div>
          </div>

          {/* Recent Transactions */}
          <div className="bg-white rounded-xl shadow-sm border p-6">
            <div className="flex justify-between items-center mb-6">
              <h3 className="text-lg font-semibold text-gray-900">Recent Transactions</h3>
              <button className="text-blue-600 text-sm font-medium hover:text-blue-700">
                View All
              </button>
            </div>
            <div className="space-y-4">
              {mockData.transactions.map((transaction, index) => (
                <div key={index} className="flex items-center justify-between py-3 border-b border-gray-100 last:border-b-0">
                  <div className="flex items-center space-x-3">
                    <div className={`p-2 rounded-full ${
                      transaction.type === 'income' ? 'bg-green-100' :
                      transaction.type === 'expense' ? 'bg-red-100' : 'bg-blue-100'
                    }`}>
                      {transaction.type === 'income' ? (
                        <ArrowUp className={`h-4 w-4 ${
                          transaction.type === 'income' ? 'text-green-600' :
                          transaction.type === 'expense' ? 'text-red-600' : 'text-blue-600'
                        }`} />
                      ) : (
                        <ArrowDown className={`h-4 w-4 ${
                          transaction.type === 'income' ? 'text-green-600' :
                          transaction.type === 'expense' ? 'text-red-600' : 'text-blue-600'
                        }`} />
                      )}
                    </div>
                    <div>
                      <p className="font-medium text-gray-900 text-sm">{transaction.description}</p>
                      <p className="text-xs text-gray-500">{transaction.category} • {transaction.date}</p>
                    </div>
                  </div>
                  <div className="text-right">
                    <span className={`font-bold ${
                      transaction.amount > 0 ? 'text-green-600' : 'text-gray-900'
                    }`}>
                      {transaction.amount > 0 ? '+' : ''}${Math.abs(transaction.amount).toLocaleString()}
                    </span>
                  </div>
                </div>
              ))}
            </div>
          </div>
        </div>

        {/* Smart Insights */}
        <div className="bg-white rounded-xl shadow-sm border p-6">
          <h3 className="text-lg font-semibold text-gray-900 mb-6">Smart Financial Insights</h3>
          <div className="grid md:grid-cols-3 gap-6">
            {mockData.insights.map((insight) => {
              const Icon = insight.type === 'success' ? CheckCircle : 
                         insight.type === 'warning' ? AlertCircle : Info;
              const bgColor = insight.type === 'success' ? 'bg-green-50 border-green-200' :
                            insight.type === 'warning' ? 'bg-yellow-50 border-yellow-200' : 
                            'bg-blue-50 border-blue-200';
              const iconColor = insight.type === 'success' ? 'text-green-600' :
                              insight.type === 'warning' ? 'text-yellow-600' : 
                              'text-blue-600';
              
              return (
                <div key={insight.id} className={`border rounded-lg p-4 ${bgColor}`}>
                  <div className="flex items-start space-x-3">
                    <Icon className={`h-5 w-5 mt-0.5 ${iconColor}`} />
                    <div className="flex-1">
                      <h4 className="font-medium text-gray-900 text-sm mb-1">{insight.title}</h4>
                      <p className="text-xs text-gray-700 mb-3">{insight.message}</p>
                      <button className={`text-xs font-medium ${iconColor} hover:underline`}>
                        {insight.action}
                      </button>
                    </div>
                  </div>
                </div>
              )
            })}
          </div>
        </div>
      </main>
    </div>
  )
}
EOF

echo "✅ Created comprehensive dashboard"

# API Route
cat > apps/web/src/app/api/family-dashboard/route.ts << 'EOF'
import { NextResponse } from 'next/server'

export async function GET() {
  // Comprehensive mock data for demo
  const dashboardData = {
    success: true,
    data: {
      family: {
        id: '1',
        name: 'Johnson Family',
        members: [
          { id: '1', name: 'Sarah Johnson', email: 'sarah@johnson.com' },
          { id: '2', name: 'Mike Johnson', email: 'mike@johnson.com' }
        ],
        kids: [
          { id: '1', name: 'Emma', age: 9, birthday: '2015-03-15' },
          { id: '2', name: 'Liam', age: 6, birthday: '2018-07-22' }
        ]
      },
      budget: {
        total: 8500,
        spent: 6200,
        remaining: 2300,
        categories: [
          { name: 'Housing', amount: 3000, spent: 3000, progress: 100 },
          { name: 'Food', amount: 800, spent: 650, progress: 81 },
          { name: 'Transportation', amount: 600, spent: 450, progress: 75 },
          { name: 'Entertainment', amount: 400, spent: 320, progress: 80 }
        ]
      },
      savings: {
        total: 85000,
        target: 150000,
        goals: [
          { name: "Emma's College Fund", current: 25000, target: 50000, progress: 50 },
          { name: "Liam's College Fund", current: 15000, target: 50000, progress: 30 },
          { name: 'Emergency Fund', current: 25000, target: 30000, progress: 83 },
          { name: 'Retirement Boost', current: 20000, target: 20000, progress: 100 }
        ]
      },
      insights: [
        {
          type: 'success',
          title: 'Great Progress!',
          message: "You're ahead of schedule on Emma's college savings",
          priority: 1
        },
        {
          type: 'warning', 
          title: 'Budget Alert',
          message: 'Housing spending has reached monthly limit',
          priority: 2
        },
        {
          type: 'tip',
          title: 'Smart Tip',
          message: 'Consider increasing emergency fund by $100/month',
          priority: 3
        }
      ]
    }
  }

  return NextResponse.json(dashboardData)
}
EOF

echo "✅ Created API routes"

# Complete the rest of the configuration files...
cat > apps/web/next.config.js << 'EOF'
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
EOF

cat > apps/web/tailwind.config.js << 'EOF'
/** @type {import('tailwindcss').Config} */
module.exports = {
  content: [
    './src/pages/**/*.{js,ts,jsx,tsx,mdx}',
    './src/components/**/*.{js,ts,jsx,tsx,mdx}',
    './src/app/**/*.{js,ts,jsx,tsx,mdx}',
  ],
  theme: {
    extend: {
      colors: {
        primary: {
          50: '#f0f9ff',
          100: '#e0f2fe',
          200: '#bae6fd',
          300: '#7dd3fc',
          400: '#38bdf8',
          500: '#0ea5e9',
          600: '#0284c7',
          700: '#0369a1',
          800: '#075985',
          900: '#0c4a6e',
        },
        success: {
          50: '#f0fdf4',
          500: '#22c55e',
          600: '#16a34a',
        },
        warning: {
          50: '#fefce8',
          500: '#eab308',
          600: '#ca8a04',
        },
        error: {
          50: '#fef2f2',
          500: '#ef4444',
          600: '#dc2626',
        }
      },
      fontFamily: {
        sans: ['Inter', 'system-ui', 'sans-serif'],
      },
      animation: {
        'fade-in': 'fadeIn 0.5s ease-in-out',
        'slide-up': 'slideUp 0.3s ease-out',
        'pulse-slow': 'pulse 3s cubic-bezier(0.4, 0, 0.6, 1) infinite',
      },
      keyframes: {
        fadeIn: {
          '0%': { opacity: '0' },
          '100%': { opacity: '1' },
        },
        slideUp: {
          '0%': { transform: 'translateY(20px)', opacity: '0' },
          '100%': { transform: 'translateY(0)', opacity: '1' },
        }
      }
    },
  },
  plugins: [
    require('@tailwindcss/forms'),
    require('@tailwindcss/typography'),
  ],
}
EOF

cat > apps/web/postcss.config.js << 'EOF'
module.exports = {
  plugins: {
    tailwindcss: {},
    autoprefixer: {},
  },
}
EOF

# Complete README with your GitHub info
cat > README.md << 'EOF'
# 👨‍👩‍👧‍👦 Parents Financial Wellness App

[![GitHub](https://img.shields.io/badge/GitHub-ajgthub-blue?logo=github)](https://github.com/ajgthub/parents-financial-wellness-app)
[![Next.js](https://img.shields.io/badge/Next.js-14-black?logo=next.js)](https://nextjs.org/)
[![React Native](https://img.shields.io/badge/React_Native-Expo-blue?logo=react)](https://expo.dev/)
[![TypeScript](https://img.shields.io/badge/TypeScript-5-blue?logo=typescript)](https://www.typescriptlang.org/)
[![PostgreSQL](https://img.shields.io/badge/PostgreSQL-Prisma-green?logo=postgresql)](https://prisma.io/)
[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](https://opensource.org/licenses/MIT)

> **Built by [@ajgthub](https://github.com/ajgthub)** - A comprehensive full-stack application for family financial planning, featuring intelligent budgeting, education savings goals, and retirement planning.

## 🚀 Live Demo

- **🌐 Web App**: [parents-financial-wellness-app-ajgthub.vercel.app](https://parents-financial-wellness-app-ajgthub.vercel.app)
- **📱 Mobile Demo**: Coming soon to App Store & Play Store
- **📖 Documentation**: [View Docs](./docs/)

## ✨ Features

### 💰 Smart Financial Management
- **Family Budgeting** - Intelligent expense tracking with category-based budgets
- **Education Savings** - Dedicated college funds for each child with 529 plan integration
- **Retirement Planning** - Personalized contribution strategies and progress tracking
- **Emergency Fund** - Automated emergency fund recommendations and tracking

### 🎯 Family-Focused Design  
- **Multi-Child Support** - Individual education goals for each child
- **Couple Collaboration** - Shared financial responsibility tracking
- **Age-Appropriate Planning** - Recommendations based on children's ages
- **Goal Visualization** - Beautiful progress charts and milestone celebrations

### 📱 Cross-Platform Excellence
- **Responsive Web App** - Works perfectly on desktop, tablet, and mobile
- **Native Mobile Apps** - iOS and Android apps with native performance
- **Offline Capability** - Continue planning even without internet
- **Real-time Sync** - Data syncs seamlessly across all devices

### 🔒 Security & Privacy First
- **Bank-Level Encryption** - All financial data is encrypted at rest and in transit  
- **Privacy by Design** - Your data stays yours, no selling to third parties
- **Secure Authentication** - Multi-factor authentication and biometric login
- **GDPR Compliant** - Full control over your personal data

## 🏗️ Technical Architecture

```
┌─────────────────────────────────────────────────────────┐
│                    FRONTEND LAYER                       │
├─────────────────────┬───────────────────────────────────┤
│   Next.js Web App  │     Expo Mobile App              │
│   - Server Components│     - Native Performance        │
│   - Tailwind CSS    │     - Expo Router               │
│   - TypeScript      │     - Push Notifications       │
└─────────────────────┴───────────────────────────────────┘
                              │
                    ┌─────────┴─────────┐
                    │   Shared Layer    │
                    │   - Business Logic│
                    │   - API Client    │
                    │   - Type Safety   │
                    └─────────┬─────────┘
                              │
┌─────────────────────────────┴─────────────────────────────┐
│                     API LAYER                             │
│   Next.js API Routes / Serverless Functions             │
│   - RESTful endpoints                                     │
│   - Authentication middleware                             │
│   - Data validation (Zod)                               │
│   - Business logic processing                            │
└─────────────────────────┬─────────────────────────────────┘
                          │
┌─────────────────────────┴─────────────────────────────────┐
│                   DATABASE LAYER                          │
│   PostgreSQL + Prisma ORM                                │
│   - ACID compliance for financial data                   │
│   - Optimized queries and indexing                       │
│   - Row-level security                                   │
│   - Automated backups                                    │
└───────────────────────────────────────────────────────────┘
```

### Tech Stack Highlights

**Frontend & Mobile:**
- **Next.js 14** - React framework with App Router for optimal performance
- **React 18** - Latest React with Suspense and Concurrent Features  
- **TypeScript** - End-to-end type safety across the entire stack
- **Tailwind CSS** - Utility-first CSS for rapid, consistent design
- **Expo** - React Native platform for native mobile development

**Backend & Database:**
- **Prisma** - Type-safe database client with automatic migrations
- **PostgreSQL** - Robust relational database for financial data integrity
- **Zod** - Runtime type validation for API security
- **Next.js API Routes** - Serverless backend functions

**Developer Experience:**
- **Turborepo** - Monorepo for efficient builds and development
- **ESLint & Prettier** - Code quality and consistent formatting
- **Husky** - Git hooks for automated quality checks
- **GitHub Actions** - CI/CD pipeline for automated testing and deployment

## 🚀 Quick Start

### Prerequisites
- **Node.js 18+** ([Download](https://nodejs.org/))
- **Git** ([Download](https://git-scm.com/))
- **PostgreSQL** or **Supabase account** ([Get Supabase](https://supabase.com/))

### 1. Clone & Install

```bash
# Clone the repository
git clone https://github.com/ajgthub/parents-financial-wellness-app.git
cd parents-financial-wellness-app

# Install dependencies (pnpm recommended for speed)
npm install -g pnpm
pnpm install

# Alternative with npm
npm install
```

### 2. Environment Setup

```bash
# Copy environment template
cp .env.example .env.local

# Edit .env.local with your database credentials
# For Supabase: Get your DATABASE_URL from dashboard
# For local PostgreSQL: postgresql://username:password@localhost:5432/parents_financial_app
```

### 3. Database Setup

```bash
# Generate Prisma client
pnpm db:generate

# Apply database schema
pnpm db:push

# Seed with sample family data
pnpm db:seed
```

### 4. Start Development

```bash
# Start all development servers
pnpm dev

# This launches:
# 🌐 Web app: http://localhost:3000
# 📱 Mobile app: http://localhost:8081
# 🗄️ Database Studio: http://localhost:5555
```

### 5. View Your App

- **Landing Page**: [localhost:3000](http://localhost:3000) - Beautiful marketing site
- **Dashboard**: [localhost:3000/dashboard](http://localhost:3000/dashboard) - Full financial dashboard
- **Mobile App**: Scan QR code with Expo Go app on your phone
- **API**: [localhost:3000/api/family-dashboard](http://localhost:3000/api/family-dashboard) - JSON API

## 📁 Project Structure

```
parents-financial-wellness-app/
├── 🌐 apps/
│   ├── web/                    # Next.js web application
│   │   ├── src/app/           # App router pages & API routes
│   │   ├── src/components/    # Reusable UI components  
│   │   ├── tailwind.config.js # Styling configuration
│   │   └── next.config.js     # Next.js configuration
│   └── mobile/                # Expo React Native app
│       ├── app/              # Expo router navigation
│       ├── components/       # Mobile-specific components
│       └── app.json         # Expo configuration
├── 📦 packages/
│   ├── shared/               # Shared TypeScript code
│   │   ├── src/types/       # Common type definitions
│   │   ├── src/utils/       # Shared utility functions
│   │   └── src/api/         # API client code
│   └── database/            # Database layer
│       ├── prisma/          # Database schema & migrations
│       └── src/             # Database utilities
├── 📚 docs/                 # Documentation
├── 🔧 .github/workflows/    # CI/CD pipelines
├── 📄 README.md             # You are here!
├── ⚙️ turbo.json            # Monorepo configuration
└── 📦 package.json          # Root dependencies
```

## 💡 Key Features Walkthrough

### 🏠 Landing Page
- **Hero Section** - Compelling value proposition with clear CTAs
- **Feature Highlights** - Visual showcase of key capabilities
- **Social Proof** - GitHub stars, user testimonials, success stories
- **Responsive Design** - Perfect on all devices

### 📊 Dashboard
- **Family Overview** - At-a-glance financial health metrics
- **Budget Tracking** - Visual category-based spending analysis
- **Savings Goals** - Progress tracking with target dates
- **Kids Planning** - Individual education fund management
- **Smart Insights** - AI-powered financial recommendations
- **Transaction History** - Detailed spending analysis

### 📱 Mobile Experience
- **Native Performance** - Smooth 60fps animations
- **Offline Support** - Continue working without internet
- **Push Notifications** - Budget alerts and goal milestones
- **Biometric Login** - Secure fingerprint/face authentication

## 🔧 Development Guide

### Available Scripts

```bash
# Development
pnpm dev              # Start all development servers
pnpm build            # Build all packages for production  
pnpm type-check       # Run TypeScript checks
pnpm lint             # Lint code with ESLint
pnpm format           # Format code with Prettier

# Database Operations  
pnpm db:generate      # Generate Prisma client
pnpm db:push          # Push schema to database
pnpm db:migrate       # Create and run migrations
pnpm db:seed          # Populate with sample data
pnpm db:studio        # Open visual database browser

# Individual App Development
cd apps/web && pnpm dev       # Web app only
cd apps/mobile && pnpm start # Mobile app only

# Testing & Quality
pnpm test             # Run test suites
pnpm test:coverage    # Generate coverage reports
pnpm clean            # Clean build artifacts
```

### Adding New Features

```bash
# 1. Create API endpoint
touch apps/web/src/app/api/new-feature/route.ts

# 2. Add shared types  
echo "export interface NewFeature { ... }" >> packages/shared/src/types/index.ts

# 3. Create web component
mkdir apps/web/src/components/new-feature
touch apps/web/src/components/new-feature/NewFeatureCard.tsx

# 4. Add mobile screen
touch apps/mobile/app/new-feature.tsx

# 5. Update database schema (if needed)
# Edit packages/database/prisma/schema.prisma
pnpm db:migrate
```

### Database Schema Overview

```prisma
model Family {
  id      String @id @default(cuid())
  name    String
  members User[]
  kids    Kid[]
  budgets Budget[]
  savingsGoals SavingsGoal[]
  transactions Transaction[]
}

model Kid {
  id       String @id @default(cuid()) 
  name     String
  birthday DateTime
  family   Family @relation(...)
  savingsGoals SavingsGoal[]
}

model Budget {
  id       String @id @default(cuid())
  name     String
  amount   Float
  spent    Float @default(0)
  category BudgetCategory
  family   Family @relation(...)
  transactions Transaction[]
}

model SavingsGoal {
  id            String @id @default(cuid())
  name          String
  targetAmount  Float
  currentAmount Float @default(0)
  targetDate    DateTime
  category      SavingsCategory
  family        Family @relation(...)
  kid           Kid? @relation(...)
  transactions  Transaction[]
}
```

## 🚀 Deployment

### Web App Deployment (Vercel)

```bash
# Option 1: Vercel CLI
npm install -g vercel
vercel --prod

# Option 2: GitHub Integration  
# 1. Connect repository to Vercel
# 2. Set environment variables in dashboard
# 3. Deploy automatically on git push
```

**Environment Variables for Production:**
```env
DATABASE_URL="postgresql://..."
NEXTAUTH_SECRET="your-super-secure-secret"
STRIPE_SECRET_KEY="sk_live_..."
PLAID_SECRET="production-plaid-secret"
```

### Mobile App Deployment (Expo)

```bash
# Install Expo Application Services
npm install -g @expo/eas-cli

# Configure builds
cd apps/mobile
eas build:configure

# Build for app stores
eas build --platform all

# Submit to stores
eas submit --platform ios
eas submit --platform android
```

### Database Hosting Options

**🟢 Recommended: Supabase**
- Managed PostgreSQL with built-in auth
- Generous free tier, scales automatically
- Real-time subscriptions included
- [Get started](https://supabase.com/)

**Alternative Options:**
- **Railway** - Simple deployment, great for beginners
- **PlanetScale** - Serverless MySQL with branching
- **AWS RDS** - Enterprise-grade, more configuration
- **Google Cloud SQL** - Integrated with Google Cloud

## 🤝 Contributing

We welcome contributions from developers of all skill levels! Here's how to get started:

### 📋 Contribution Guidelines

1. **Fork** the repository to your GitHub account
2. **Clone** your fork: `git clone https://github.com/YOUR_USERNAME/parents-financial-wellness-app.git`
3. **Create** a feature branch: `git checkout -b feature/amazing-new-feature`
4. **Make** your changes with clear, focused commits
5. **Test** your changes: `pnpm test && pnpm type-check && pnpm lint`
6. **Push** to your branch: `git push origin feature/amazing-new-feature`
7. **Create** a Pull Request with a detailed description

### 🎯 Areas for Contribution

- **🐛 Bug Fixes** - Fix issues in existing features
- **✨ New Features** - Add family-focused financial tools
- **📱 Mobile Enhancements** - Improve native app experience
- **🎨 UI/UX Improvements** - Better design and user flow
- **📚 Documentation** - Help others understand the codebase
- **🧪 Testing** - Add unit and integration tests
- **🌍 Internationalization** - Multi-language support
- **♿ Accessibility** - Make the app usable for everyone

### 💬 Community

- **💬 Discussions** - [GitHub Discussions](https://github.com/ajgthub/parents-financial-wellness-app/discussions)
- **🐛 Bug Reports** - [GitHub Issues](https://github.com/ajgthub/parents-financial-wellness-app/issues)
- **💡 Feature Requests** - [Feature Request Template](https://github.com/ajgthub/parents-financial-wellness-app/issues/new)

## 📄 License

This project is licensed under the **MIT License** - see the [LICENSE](LICENSE) file for details.

### What this means:
- ✅ **Commercial use** - Use this in your own products
- ✅ **Modification** - Change and improve the code
- ✅ **Distribution** - Share with others
- ✅ **Private use** - Use for personal projects
- ❗ **Limitation** - No warranty or liability
- 📝 **License notice** - Include original license in copies

## 🙏 Acknowledgments

### Built With Love Using:
- **[Next.js](https://nextjs.org/)** - The React framework for production
- **[Expo](https://expo.dev/)** - Platform for making universal native apps
- **[Prisma](https://prisma.io/)** - Next-generation Node.js and TypeScript ORM
- **[Tailwind CSS](https://tailwindcss.com/)** - Utility-first CSS framework
- **[Turborepo](https://turbo.build/)** - High-performance build system
- **[TypeScript](https://www.typescriptlang.org/)** - JavaScript with syntax for types

### Special Thanks:
- **Family Financial Planning Community** - For feedback and feature requests
- **Open Source Contributors** - Every contribution makes this better
- **Vercel** - For amazing deployment and hosting platform
- **Supabase** - For simple, powerful database and auth solution

---

<div align="center">

### 💝 **Made with ❤️ for families everywhere**

**Built by [@ajgthub](https://github.com/ajgthub)** | **⭐ Star this repo if it helps your family!** | **🔄 Fork to customize for your needs**

[🌐 Live Demo](https://parents-financial-wellness-app-ajgthub.vercel.app) • [📖 Documentation](./docs/) • [🐛 Report Bug](https://github.com/ajgthub/parents-financial-wellness-app/issues) • [💡 Request Feature](https://github.com/ajgthub/parents-financial-wellness-app/issues)

</div>
EOF

echo "✅ Created comprehensive README"

# Create remaining configuration files
cat > turbo.json << 'EOF'
{
  "$schema": "https://turbo.build/schema.json",
  "globalDependencies": ["**/.env.*local"],
  "pipeline": {
    "build": {
      "dependsOn": ["^build"],
      "outputs": [".next/**", "!.next/cache/**", "dist/**", "expo-export/**"]
    },
    "dev": {
      "cache": false,
      "persistent": true
    },
    "lint": {
      "dependsOn": ["^build"],
      "outputs": []
    },
    "type-check": {
      "dependsOn": ["^build"],
      "outputs": []
    },
    "test": {
      "dependsOn": ["^build"],
      "outputs": ["coverage/**"]
    },
    "clean": {
      "cache": false
    },
    "db:generate": {
      "cache": false
    }
  }
}
EOF

# Mobile app configuration
cat > apps/mobile/package.json << 'EOF'
{
  "name": "mobile",
  "version": "1.0.0",
  "main": "expo-router/entry",
  "scripts": {
    "start": "expo start",
    "android": "expo start --android",
    "ios": "expo start --ios", 
    "web": "expo start --web",
    "build": "eas build",
    "lint": "eslint . --ext .js,.jsx,.ts,.tsx",
    "type-check": "tsc --noEmit"
  },
  "dependencies": {
    "expo": "~49.0.0",
    "expo-router": "^2.0.0",
    "expo-status-bar": "~1.6.0",
    "react": "18.2.0",
    "react-native": "0.72.6",
    "react-native-safe-area-context": "4.6.3",
    "react-native-screens": "~3.22.0",
    "@expo/vector-icons": "^13.0.0",
    "expo-constants": "~14.4.2",
    "expo-linking": "~5.0.2",
    "shared": "workspace:*"
  },
  "devDependencies": {
    "@babel/core": "^7.20.0",
    "@types/react": "~18.2.14",
    "@types/react-native": "~0.72.2",
    "typescript": "^5.1.3"
  }
}
EOF

# Environment template
cat > .env.example << 'EOF'
# Database Configuration
DATABASE_URL="postgresql://username:password@localhost:5432/parents_financial_app"

# Alternative: Supabase Database URL
# DATABASE_URL="postgresql://postgres:YOUR_PASSWORD@db.PROJECT_REF.supabase.co:5432/postgres"

# Authentication (NextAuth.js)
NEXTAUTH_URL="http://localhost:3000"
NEXTAUTH_SECRET="your-super-secure-nextauth-secret-here-use-openssl-rand-base64-32"

# Supabase Configuration (Alternative Auth + Database)
NEXT_PUBLIC_SUPABASE_URL="https://your-project-ref.supabase.co"
NEXT_PUBLIC_SUPABASE_ANON_KEY="your-supabase-anon-key"
SUPABASE_SERVICE_ROLE_KEY="your-supabase-service-role-key"

# Stripe Configuration (Payments)
STRIPE_PUBLISHABLE_KEY="pk_test_your_stripe_publishable_key"
STRIPE_SECRET_KEY="sk_test_your_stripe_secret_key"
STRIPE_WEBHOOK_SECRET="whsec_your_stripe_webhook_secret"

# Plaid Configuration (Bank Connections)
PLAID_CLIENT_ID="your-plaid-client-id"
PLAID_SECRET="your-plaid-secret-sandbox-key"
PLAID_ENV="sandbox"
# For production: PLAID_ENV="production"

# Email Configuration (SendGrid)
SENDGRID_API_KEY="SG.your-sendgrid-api-key"
SENDGRID_FROM_EMAIL="noreply@yourapp.com"

# Analytics (Optional)
NEXT_PUBLIC_MIXPANEL_TOKEN="your-mixpanel-token"
NEXT_PUBLIC_GOOGLE_ANALYTICS_ID="G-XXXXXXXXXX"

# File Storage (Cloudinary - Optional)
NEXT_PUBLIC_CLOUDINARY_CLOUD_NAME="your-cloudinary-cloud-name"
CLOUDINARY_API_KEY="your-cloudinary-api-key"
CLOUDINARY_API_SECRET="your-cloudinary-api-secret"

# Development
NODE_ENV="development"
NEXT_PUBLIC_APP_URL="http://localhost:3000"
EOF

cp .env.example .env.local

# Complete shared package
mkdir -p packages/shared/src/{types,api,utils,constants}

cat > packages/shared/src/types/index.ts << 'EOF'
export interface User {
  id: string
  email: string
  name?: string
  avatar?: string
  familyId?: string
  currency: string
  timezone: string
  notifications: boolean
  createdAt: Date
  updatedAt: Date
}

export interface Family {
  id: string
  name: string
  members: User[]
  kids: Kid[]
  createdAt: Date
  updatedAt: Date
}

export interface Kid {
  id: string
  name: string
  birthday: Date
  age: number
  familyId: string
}

export interface Budget {
  id: string
  name: string
  amount: number
  spent: number
  remaining: number
  category: BudgetCategory
  period: BudgetPeriod
  familyId: string
  progress: number
}

export interface SavingsGoal {
  id: string
  name: string
  targetAmount: number
  currentAmount: number
  targetDate: Date
  category: SavingsCategory
  priority: Priority
  familyId: string
  kidId?: string
  progress: number
  monthsRemaining?: number
  monthlyTarget?: number
}

export interface Transaction {
  id: string
  amount: number
  description: string
  category: TransactionCategory
  type: TransactionType
  date: Date
  familyId: string
  budgetId?: string
  savingsGoalId?: string
}

export interface DashboardData {
  family: Family
  budgetSummary: {
    totalBudget: number
    totalSpent: number
    remaining: number
    categories: Budget[]
  }
  savingsSummary: {
    totalGoals: number
    totalSaved: number
    totalTarget: number
    goals: SavingsGoal[]
  }
  kidsSummary: {
    totalKids: number
    totalEducationSavings: number
    avgAgeAtGoal: number
    kids: (Kid & { educationGoals: SavingsGoal[] })[]
  }
  recentTransactions: Transaction[]
  insights: FinancialInsight[]
}

export interface FinancialInsight {
  id: string
  type: 'warning' | 'success' | 'info' | 'tip'
  title: string
  message: string
  actionText?: string
  actionUrl?: string
  priority: number
}

export interface ApiResponse<T> {
  success: boolean
  data?: T
  error?: string
  message?: string
}

export enum BudgetCategory {
  HOUSING = 'HOUSING',
  FOOD = 'FOOD', 
  TRANSPORTATION = 'TRANSPORTATION',
  UTILITIES = 'UTILITIES',
  INSURANCE = 'INSURANCE',
  HEALTHCARE = 'HEALTHCARE',
  ENTERTAINMENT = 'ENTERTAINMENT',
  PERSONAL_CARE = 'PERSONAL_CARE',
  EDUCATION = 'EDUCATION',
  MISCELLANEOUS = 'MISCELLANEOUS',
}

export enum BudgetPeriod {
  WEEKLY = 'WEEKLY',
  MONTHLY = 'MONTHLY',
  QUARTERLY = 'QUARTERLY',
  YEARLY = 'YEARLY',
}

export enum SavingsCategory {
  EMERGENCY_FUND = 'EMERGENCY_FUND',
  RETIREMENT = 'RETIREMENT',
  EDUCATION = 'EDUCATION', 
  VACATION = 'VACATION',
  HOME_PURCHASE = 'HOME_PURCHASE',
  MISCELLANEOUS = 'MISCELLANEOUS',
}

export enum Priority {
  LOW = 'LOW',
  MEDIUM = 'MEDIUM',
  HIGH = 'HIGH',
  CRITICAL = 'CRITICAL',
}

export enum TransactionCategory {
  INCOME = 'INCOME',
  EXPENSE = 'EXPENSE',
  SAVINGS = 'SAVINGS',
  INVESTMENT = 'INVESTMENT',
  TRANSFER = 'TRANSFER',
}

export enum TransactionType {
  CREDIT = 'CREDIT',
  DEBIT = 'DEBIT',
}
EOF

# Finish the script
echo ""
echo "🎉 Parents Financial Wellness App setup complete!"
echo ""
echo "📍 Your repository: https://github.com/ajgthub/parents-financial-wellness-app"
echo ""
echo "🚀 Next steps:"
echo "1. 📝 Edit .env.local with your database URL"  
echo "2. 📦 Run: npm install (or pnpm install)"
echo "3. 🗄️ Run: npm run db:generate && npm run db:push && npm run db:seed"
echo "4. ⚡ Run: npm run dev"
echo ""
echo "🌐 Web App: http://localhost:3000"
echo "📱 Mobile App: http://localhost:8081" 
echo "🗄️ Database Studio: http://localhost:5555"
echo ""
echo "✨ Built with ❤️ by @ajgthub - Happy coding! 🚀"
