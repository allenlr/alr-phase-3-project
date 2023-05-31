require 'faker'

puts "🌱 Seeding spices..."

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
            category: expense_categories.sample,
            user_id: user.id
        )
    end
end

puts "✅ Done seeding!"
