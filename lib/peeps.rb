require 'dotenv'
require 'pg'
require_relative './../db/queries/pg_db'

class Peep < PGDB

	Dotenv.load

	def self.create_peep(message:, user_id:)
		select_db
		result = @db_session.exec_params("INSERT INTO peeps (message, user_id) 	VALUES ($1,$2) RETURNING *;",[message, user_id]).first
		Peep.new(id: result['id'], date: result['date'], message: result['message'], user_id: result['user_id'])
	end

	private_class_method

	attr_accessor :id, :date, :message, :user_id

	def initialize(id:, date:, message:, user_id:)
		@id = id
		@date = date
		@message = message
		@user_id  = user_id
	end

end