class UsersController < ApplicationController
    set :default_content_type, 'application/json'

    get '/users' do
        users = User.all
        users.to_json(include: :expenses)
      end

    get '/users/:id' do
        user = User.find_by(id: params[:id])
        user.to_json(include: :expenses)
    end

    patch '/users/:id' do
        user = User.find_by(id: params[:id])
        user.update(
          username: params[:username],
          first_name: params[:first_name],
          last_name: params[:last_name],
          email: params[:email]
        )
        user.to_json
    end

    post '/users' do
        user = User.create(params)
        user.to_json
    end

    delete '/users/:id' do
        user = User.find_by(id: params[:id])
        user.destroy
        user.to_json
    end

    
end