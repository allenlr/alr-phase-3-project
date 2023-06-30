# System Anaylsis Web App

System Analysis Web App is a web-based application developed as a demonstration 
of learned concepts and skills in Ruby and ActiveRecord. The purpose of the app
is to create a general interface for finance managers to oversee employee
expenses during work trips. The interface provides methods for managers to
create, view, edit, and delete certain expenses, as well as create and edit
existing users in the database.

## Requirements

This project requires the following gems:

- [sinatra](https://github.com/sinatra/sinatra) `~> 2.1`
- [thin](https://github.com/macournoyer/thin) `~> 1.8`
- [rack-contrib](https://github.com/rack/rack-contrib) `~> 2.3`
- [rack-cors](https://github.com/cyu/rack-cors) `~> 1.1`
- [activerecord](https://guides.rubyonrails.org/active_record_basics.html) `~> 6.1`
- [sinatra-activerecord](https://github.com/sinatra-activerecord/sinatra-activerecord) `~> 2.0`
- [rake](https://github.com/ruby/rake) `~> 13.0`
- [sqlite3](https://github.com/sparklemotion/sqlite3-ruby) `~> 1.4`
- [require_all](https://github.com/jarmo/require_all) `~> 3.0`

Please ensure that you have these gems installed before running the application.
You can do this by running `bundle install` in the root directory of this project.

## Installation

1. Clone the Repository: Firstly, you need to clone the repository to your local
machine. You can do this by running the following command in your terminal:
git clone git@github.com:allenlr/alr-phase-3-project-backend.git

2. Navigate to the project directory: After cloning the repository, navigate to
the project directory by running:
cd project-backend

3. Install Bundler: Bundler is a tool that manages gem dependencies for your ruby
application. You can install it by running:
gem install bundler

4. Install Necessary Gems: Now you can install all the necessary gems for the
project by running:
bundle install

5. Setup the Database: To setup the database, you can run the rake task by
running:
rake db:migrate

6. Run the Server: Finally, to start the server, you can run the following
command:
bundle exec rake server

## Configuration

This web application has no user-accessible settings or configuration panel. The
configuration can only be modified directly in the code.

## API Documentation

Our application provides a RESTful API which allows you to perform HTTP requests
against specific endpoints in order to obtain or manipulate data. Below you will
find a description of these endpoints.

Users

    GET /users: Get all users and their associated expenses.
    GET /users/:id: Get a specific user and their associated expenses.
    PATCH /users/:id: Update a specific user. Expects a JSON body with fields: 
    username, first_name, last_name, email.
    POST /users: Create a new user. Expects a JSON body with fields:
    username, first_name, last_name, email.
    DELETE /users/:id: Delete a specific user.

Expenses

    GET /users/:user_id/expenses: Get all expenses for a user.
    PATCH /users/:user_id/expenses/:id: Update a specific expense for a user.
    Expects a JSON body with fields: name, amount, date_incurred, category.
    POST /users/:user_id/expenses: Create a new expense for a user. Expects a JSON
    body with fields: name, amount, date_incurred, category.
    DELETE /users/:user_id/expenses/:id: Delete a specific expense for a user.