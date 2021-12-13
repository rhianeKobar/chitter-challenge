require 'users'

describe 'Users' do

	it 'should add a new user to the user table' do
		test_user = Users.add_new(first_name: 'Shakira', last_name: 'Salazar', username:'srsalazar', email: 'shakira.r.salazar@gmail.com', password: 'password')
		result = Users.select_user(id: test_user.id)
		expect(test_user).to be_a Users
		expect(test_user.email).to eq result.email 
	end

end