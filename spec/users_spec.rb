require 'users'
require 'bcrypt'

describe 'Users' do

	let (:test_user) { Users.add_new(first_name: 'Shakira', last_name: 'Salazar', username:'srsalazar', email: 'shakira.r.salazar@gmail.com', password: 'password') }
	let (:result) { Users.select_user(username: test_user.username) }
	let (:compare_user) { Users.new(id: 1, first_name: 'Shakira', last_name: 'Salazar', username:'srsalazar', email: 'shakira.r.salazar@gmail.com', password: 'password') }

	it 'should add a new user to the user table' do
		expect(test_user).to be_a Users
		expect(test_user.email).to eq result.email 
	end

	it 'should check user password to verify account' do
		test_pwd = BCrypt::Password.new(test_user.password)
		expect(compare_user.email).to eq test_user.email
		expect(test_pwd).to eq ENV['PADDING'] + compare_user.password
	end

	it 'should find user by id' do
		id_result = Users.select_id(id: test_user.id)
		expect(id_result.id).to eq test_user.id
	end

end