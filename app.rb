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

	post '/users/login' do
		current_user = Users.auth(username: params[:username], password: params[:password])
		if current_user
			session[:id] = current_user.id
			redirect 'chitter/feed'
		else
			redirect back
		end
	end

	get '/users/signup' do
		erb :signup
	end

	post '/users/signup' do
		first_name = params[:first_name]
		last_name = params[:last_name]
		username = params[:username]
		email = params[:email]
		password = params[:password]
		Users.add_new(first_name: first_name, last_name: last_name,username: username,email: email, password: password)
		redirect '/users/login'
	end

	# I want to add a delay before continuing. will work this out later
	# get '/users/login_successful' do
	# 	erb :login_successful
	# 	redirect '/chitter/feed'
	# end

	get '/chitter/feed' do
		erb :chitterFeed
	end


	run! if app_file == $PROGRAM_NAME
end
