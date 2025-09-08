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
