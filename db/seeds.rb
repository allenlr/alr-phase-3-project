require 'faker'

puts "🌱 Seeding"

expense_categories = [
    "All",
    "Hotel",
    "Meal",
    "Miscellaneous food and beverage",
    "Telecommunication",
    "Transportation",
    "Other"
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
        email: Faker::Internet.email,
        first_name: Faker::Name.first_name,
        last_name: Faker::Name.last_name,
    )
end

User.all.each do |user|
    20.times do
        Expense.create(
            name: Faker::Commerce.product_name,
            amount: Faker::Commerce.price(range: 10.00..200.00),
            # date_incurred: Faker::Date.between(from: user.created_at, to: Date.today),
            date_incurred: Faker::Date.between(from: Faker::Date.between(from: 2.year.ago, to: Date.today), to: Date.today),
            category: expense_categories.sample,
            user_id: user.id
        )
    end
end

puts "✅ Done seeding!"
