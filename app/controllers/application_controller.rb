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
      last_name: params[:last_name]
    )
    user.to_json
  end

  post '/expenses' do
    expense = Expense.create(
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
