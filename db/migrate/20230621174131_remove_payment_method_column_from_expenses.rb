class RemovePaymentMethodColumnFromExpenses < ActiveRecord::Migration[6.1]
  def change
    remove_column :expenses, :payment_method
  end
end
