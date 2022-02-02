require 'pg'
require_relative './../db/queries/pg_db'

class Comment < PGDB

	def self.add_comment(message:, user_id:, peep_id:)
		select_db	
		result = @db_session.exec_params("INSERT INTO comments(message, user_id, peep_id) VALUES($1,$2,$3) RETURNING *;",[message, user_id, peep_id]).first
		Comment.new(id: result['id'],date: result['date'],message: result['message'],user_id: result['user_id'], peep_id: result['peep_id'])
	end

	private_class_method

	attr_accessor :id, :date, :message, :user_id, :peep_id

	def initialize(id:, date:, message:, user_id:, peep_id:)
		@id = id
		@date = date
		@message = message
		@user_id  = user_id
		@peep_id = peep_id
	end

end