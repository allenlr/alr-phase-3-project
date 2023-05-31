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

  patch '/users/:id' do
    user = User.find(params[:id])
    user.update(
      username: params[:username],
      password_digest: params[:password_digest],
      email: params[:email],
    )
  end

end
