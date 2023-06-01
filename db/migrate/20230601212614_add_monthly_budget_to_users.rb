class AddMonthlyBudgetToUsers < ActiveRecord::Migration[6.1]
  def change
    add_column :users, :monthly_budget, :decimal
  end
end
