class ExpensesController < ApplicationController
    set :default_content_type, 'application/json'

    get '/users/:user_id/expenses' do
      user = User.find_by(id: params[:user_id])
      if user
        expenses = user.expenses
        expenses.to_json
      else
        {error: "User not found"}.to_json
      end
    end

    # get '/users/:user_id/expenses/:id' do
    #   user = User.find_by(id: params[:user_id])
    #   if user
    #     expense = user.expenses.find_by(id: params[:id])
    #     if expense
    #       expense.to_json
    #     else 
    #       {error: "Expense not found"}.to_json
    #     end
    #   else
    #     {error: "User not found"}.to_json
    #   end
    # end

    patch '/users/:user_id/expenses/:id' do
        user = User.find_by(id: params[:user_id])
        expense = user.expenses.find_by(id: params[:id])
        expense.update(
          name: params[:name],
          amount: params[:amount],
          date_incurred: params[:date_incurred],
          category: params[:category]
        )
        expense.to_json
    end

    post '/users/:user_id/expenses' do
        user = User.find_by(id: params[:user_id])
        if user
          expense = user.expenses.create(
            name: params[:name],
            amount: params[:amount],
            date_incurred: params[:date_incurred],
            category: params[:category]
          )
          expense.to_json
        else
          { error: "User Not Found" }.to_json
        end
    end

    delete '/users/:user_id/expenses/:id' do
        user = User.find_by(id: params[:user_id])
        expense = user.expenses.find_by(id: params[:id])
        expense.destroy
        expense.to_json
    end
end