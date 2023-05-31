class CreateExpenses < ActiveRecord::Migration[6.1]
  def change
    create_table :expenses do |t|
      t.string :name
      t.decimal :amount, precision :8, scale :2
      t.date :date_incurred
      t.string :category
      t.string :payment_method
      t.integer :user_id
    end
  end
end
