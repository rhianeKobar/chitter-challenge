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

	run! if app_file == $PROGRAM_NAME
end