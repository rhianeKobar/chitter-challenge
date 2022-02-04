require 'pg'
require 'dotenv'
require 'time'

class PGDB

	def self.select_db
		Dotenv.load

		if ENV['ENVIRONMENT'] == 'test'
			connect_to('chitter_test')
		else
			connect_to('chitter')
		end

	end

	def self.connect_to(db)
		begin 
			@db_session = PG.connect(dbname: db)
		rescue
			@db_session = PG.connect('localhost','5432','','',db,ENV['DBUSER'],ENV['DBPASSWORD'])
		rescue
			@db_session = PG.connect :dbname => db, :user => ENV['DBUSER'], :password => 	ENV['DBPASSWORD']
		rescue PG::ERROR => e
			puts e.message
		end
	end

	def self.parse_datetime(date)
		if date 
      ruby_date = Time.parse(date)
      ruby_date.strftime("%d-%m-%y %H:%M")
    end
	end

	def self.truncate_tables
    @db_session.exec("TRUNCATE users, peeps, comments;")
  end

end

