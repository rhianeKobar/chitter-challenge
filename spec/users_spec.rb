require 'users'
require 'bcrypt'

describe 'Users' do

	let (:compare_user) {Users.new(id: 1, first_name: 'Shakira', last_name: 'Salazar', username:'srsalazar', email: 'shakira.r.salazar@gmail.com', password: 'password')}

	it 'should add a new user to the user table' do
		test_user = Users.add_new(first_name: 'Shakira', last_name: 'Salazar', username:'srsalazar', email: 'shakira.r.salazar@gmail.com', password: 'password')
		result = Users.select_user(username: test_user.username)
		expect(test_user).to be_a Users
		expect(test_user.email).to eq result.email 
	end

	it 'should check user password to verify account' do
		test_user = Users.add_new(first_name: 'Shakira', last_name: 'Salazar', username:'srsalazar', email: 'shakira.r.salazar@gmail.com', password: 'password')
		result = Users.select_user(username: test_user.username)
		test_pwd = BCrypt::Password.new(test_user.password)
		expect(compare_user.email).to eq test_user.email
		expect(test_pwd).to eq ENV['PADDING'] + compare_user.password
	end

end