# frozen_string_literal: true

require 'sinatra/base'
require 'sinatra/reloader'
require_relative './db/queries/pg_db.rb'
require_relative './lib/users'
require_relative './lib/peeps'

class Chitter < Sinatra::Base

	enable :sessions
	
	PGDB.select_db

	get '/' do
		erb :landing
	end

	get '/users/login' do
		erb :login
	end

	get '/users/signup' do
		erb :signup
	end

	post '/users/signup_newuser' do
		first_name = params[:first_name]
		last_name = params[:last_name]
		username = params[:username]
		email = params[:email]
		password = params[:password]
		Users.add_new(first_name: first_name,last_name: last_name,username: username,email: email, password: password)
		redirect '/users/login'
	end

	run! if app_file == $PROGRAM_NAME
end

#gem install pg -- --with-pg-config=/usr/lib/postgresql/13/bin/pg_config