require 'bcrypt'
require 'dotenv'
require 'pg'
require_relative './../db/queries/pg_db'

class User < PGDB

	Dotenv.load

	def self.add_new(first_name:, last_name:, username:, email:, password:)
		select_db
		result = @db_session.exec_params("INSERT INTO users (first_name, last_name, username, email, password) VALUES ($1,$2,$3,$4,$5) RETURNING *;", [first_name, last_name, username, email, encrypt(password)]).first
		User.new(id: result['id'], first_name: result['first_name'], last_name: result['last_name'], username: result['username'], email: result['email'], password: result['password'])
	end

	def self.select_user(username:)
		return nil unless username
		select_db
		result = @db_session.query("SELECT * FROM users WHERE username = '#{username}';")
		User.new(id: result[0]['id'], first_name: result[0]['first_name'], last_name: result[0]['last_name'], username: result[0]['username'], email: result[0]['email'], password: result[0]['password'])
	end

	def self.select_id(id:)
		return nil unless id
		select_db
		result = @db_session.query("SELECT * FROM users WHERE id = #{id};")
		User.new(id: result[0]['id'], first_name: result[0]['first_name'], last_name: result[0]['last_name'], username: result[0]['username'], email: result[0]['email'], password: result[0]['password'])
	end

	def self.auth(username:, password:)
		user = select_user(username: username)
		user_pwd = BCrypt::Password.new(user.password)
		input_pwd = ENV['PADDING'] + password
		if user_pwd == input_pwd 
			User.new(id:user.id, first_name:user.first_name, last_name: user.last_name, username: user.username, email: user.email, password: user.password)
		else
			return
		end
	end

	private_class_method

	attr_accessor :id, :first_name, :last_name, :username, :email, :password

	def initialize(id:, first_name:, last_name:, username:, email:, password:)
		@id = id
		@first_name = first_name
		@last_name = last_name 
		@username = username
		@email = email
		@password = password
	end

	def self.encrypt(password)
		BCrypt::Password.create(ENV['PADDING'] + password)
	end

end