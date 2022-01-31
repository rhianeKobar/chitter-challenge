# frozen_string_literal: true

require 'sinatra/base'
require 'sinatra/reloader'
require_relative './db/queries/pg_db.rb'
require_relative './lib/user'
require_relative './lib/peep'

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
		current_user = User.auth(username: params[:username], password: params[:password])
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
		User.add_new(first_name: first_name, last_name: last_name, username: username, email: email, password: password)
		redirect '/users/login'
	end

	post '/users/signout' do
		session.delete(:id)
		redirect 'chitter/feed'
	end

	# I want to add a delay before continuing. will work this out later
	# get '/users/login_successful' do
	# 	erb :login_successful
	# 	redirect '/chitter/feed'
	# end

	get '/chitter/feed' do
		if session[:id]
			current_user =  User.select_id(id: session[:id])
			@first_name = current_user.first_name
			@username = current_user.username
		else
			@first_name = "Guest"
			@username = "Guest"
		end
		
		@peeps = Peep.all
		erb :chitterFeed
	end

	post '/peeps/create' do
		message = params[:message]
		user_id = session[:id]
		Peep.create_peep(message: message, user_id: user_id)
		redirect '/chitter/feed'
	end


	run! if app_file == $PROGRAM_NAME
end
