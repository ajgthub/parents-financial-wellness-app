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
