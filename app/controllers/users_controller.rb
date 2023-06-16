class UsersController < Sinatra::Base
    set :default_content_type, 'application/json'

    get '/' do
        users = User.all
        users.to_json(include: :expenses)
      end
    
    get '/:id' do
        user = User.find_by(id: params[:id])
        user.to_json(include: :expenses)
    end

    post '/login' do
        user = User.find_by(username: params[:username])
        if user && user.authenticate(params[:password])
            user.to_json
        else
            halt 401, { error: "Invalid username or password" }.to_json
        end
    end

    get '/budget/:id' do
        user_budget = User.find_by(id: params[:id]).monthly_budget
        user_budget.to_json
    end

    patch '/:id' do
        user = User.find_by(id: params[:id])
        user.update(
          username: params[:username],
          password: params[:password],
          email: params[:email]
        )
        user.to_json
    end

    post '/' do
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

    delete '/:id' do
        user = User.find_by(id: params[:id])
        user.destroy
        user.to_json
    end

    
end