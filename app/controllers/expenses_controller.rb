class ExpensesController < Sinatra::Base
    set :default_content_type, 'application/json'

    get "/" do
        expenses = Expense.all
        expenses.to_json
      end

    get '/:id' do
    expense = Expense.find_by(id: params[:id])
    expense.to_json
    end

    get '/by_user/:id' do
        expenses = Expense.where(user_id: params[:id])
        expenses.to_json
      end
    
    get '/by_user/:id/:category' do
        user = User.find_by(id: params[:id])
        category = params[:category].gsub('_', '/')
        expenses = user.expenses.where(category: category)
        expenses.to_json
    end

    get '/by_price' do
        expenses = Expense.order(amount: :desc)
        expenses.to_json
      end
    
    get '/most_expensive' do
        expenses = Expense.order(amount: :desc).limit(10)
        expenses.to_json
    end

    patch '/:id' do
        expense = Expense.find_by(id: params[:id])
        expense.update(
          name: params[:name],
          amount: params[:amount],
          date_incurred: params[:date_incurred],
          category: params[:category],
          payment_method: params[:payment_method]
        )
        expense.to_json
    end

    post '/' do
        user = User.find_by(id: params[:user_id])
        expense = user.expenses.create(
          name: params[:name],
          amount: params[:amount],
          date_incurred: params[:date_incurred],
          category: params[:category],
          payment_method: params[:payment_method]
        )
        expense.to_json
    end

    delete '/:id' do
        expense = Expense.find_by(id: params[:id])
        expense.destroy
        expense.to_json
    end
end