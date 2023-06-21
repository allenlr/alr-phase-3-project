class RemoveBudgetColumnFromUsers < ActiveRecord::Migration[6.1]
  def change
    remove_column :users, :monthly_budget
  end
end
