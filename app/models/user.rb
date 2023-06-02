class User < ActiveRecord::Base
    has_many :expenses
    has_secure_password

    def monthly_spending(month)
        year, month = month.split('-').map(&:to_i)

        # selected_month_expenses = self.expenses.select do |expense|
        #     expense.date_incurred.month == month && expense.date_incurred.year == year
        # end

        selected_month_expenses = self.expenses.where('strftime("%Y", date_incurred) = ? AND strftime("%m", date_incurred) = ?', year, month)

        month_expenses = selected_month_expenses.sum(&:amount)

        month_expenses
    end
    
    def over_budget?(month)
        monthly_spending(month) > self.monthly_budget
    end
end