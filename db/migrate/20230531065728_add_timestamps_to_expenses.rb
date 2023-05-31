class AddTimestampsToExpenses < ActiveRecord::Migration[6.1]
  def change
    add_timestamps :expenses, default: -> { 'CURRENT_TIMESTAMPS' }
  end
end
