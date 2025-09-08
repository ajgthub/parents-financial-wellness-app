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
