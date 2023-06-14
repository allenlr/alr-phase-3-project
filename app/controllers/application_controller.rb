require 'pry'

class ApplicationController < Sinatra::Base
  set :default_content_type, 'application/json'
  
  # Add your routes here
  get "/expenses" do
    expenses = Expense.all
    expenses.to_json
  end

  get '/users' do
    users = User.all
    users.to_json
  end

  get '/users/:id' do
    user = User.find(params[:id])
    user.to_json
  end

  get '/expenses/:id' do
    expense = Expense.find(params[:id])
    expense.to_json
  end

  get '/expenses/by_user/:id' do
    expenses = Expense.where(user_id: params[:id])
    expenses.to_json
  end

  get '/expenses/by_user/:id/:category' do
    user = User.find(params[:id])
    category = params[:category].gsub('_', '/')
    expenses = user.expenses.where(category: category)
    expenses.to_json
  end

  post '/users/login' do
    user = User.find_by(username: params[:username])
    if user && user.authenticate(params[:password])
      user.to_json
    else
      halt 401, { error: "Invalid username or password" }.to_json
    end
  end

  get '/expenses/by_price' do
    expenses = Expense.order(amount: :desc)
    expenses.to_json
  end

  get '/expenses/most_expensive' do
    expenses = Expense.order(amount: :desc).limit(10)
    expenses.to_json
  end

  get '/users/budget/:id' do
    user_budget = User.find(params[:id]).monthly_budget
    user_budget.to_json
  end

  patch '/users/:id' do
    user = User.find(params[:id])
    user.update(
      username: params[:username],
      password: params[:password],
      email: params[:email]
    )
    user.to_json
  end

  patch '/expenses/:id' do
    expense = Expense.find(params[:id])
    expense.update(
      name: params[:name],
      amount: params[:amount],
      date_incurred: params[:date_incurred],
      category: params[:category],
      payment_method: params[:payment_method]
    )
    expense.to_json
  end

  post '/users' do
    user = User.create(
      username: params[:username],
      password: params[:password],
      email: params[:email],
      first_name: params[:first_name],
      last_name: params[:last_name],
      monthly_budget: params[:monthly_budget]
    )
    user.to_json
  end

  post '/expenses' do
    user = User.find(params[:user_id])
    expense = user.expenses.create(
      name: params[:name],
      amount: params[:amount],
      date_incurred: params[:date_incurred],
      category: params[:category],
      payment_method: params[:payment_method]
    )
    expense.to_json
  end

  delete '/users/:id' do
    user = User.find(params[:id])
    user.destroy
    user.to_json
  end

  delete '/expenses/:id' do
    expense = Expense.find(params[:id])
    expense.destroy
    expense.to_json
  end
end
