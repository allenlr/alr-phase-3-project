require 'faker'

puts "🌱 Seeding"

expense_categories = [
    "Rent/Mortgage",
    "Utilities",
    "Groceries",
    "Eating Out",
    "Transportation",
    "Healthcare",
    "Entertainment",
    "Personal Care",
    "Education",
    "Clothing",
    "Savings",
    "Investments",
    "Debt Repayment",
    "Miscellaneous"
]

payment_methods = [
    "Credit Card",
    "Debit Card",
    "Gift Card",
    "Cash"
]

# User.destroy_all
# Expense.destroy_all
[User, Expense].each do |model|
    model.destroy_all
    ActiveRecord::Base.connection.execute("DELETE FROM sqlite_sequence WHERE name='#{model.table_name}'")
end

10.times do
    User.create(
        username: Faker::Internet.username,
        password: 'password',
        email: Faker::Internet.email,
        first_name: Faker::Name.first_name,
        last_name: Faker::Name.last_name
    )
end

User.all.each do |user|
    20.times do
        Expense.create(
            name: Faker::Commerce.product_name,
            amount: Faker::Commerce.price(range: 10.00..200.00),
            date_incurred: Faker::Date.between(from: user.created_at, to: Date.today),
            category: expense_categories.sample,
            payment_method: payment_methods.sample,
            user_id: user.id
        )
    end
end

puts "✅ Done seeding!"
