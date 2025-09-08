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
