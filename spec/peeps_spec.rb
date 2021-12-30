require 'users'
require 'peeps'

describe 'Peeps' do

	it 'should have the ID of a registered user attached' do
		user = Users.add_new(first_name: 'Shakira', last_name: 'Salazar', username:'srsalazar', email: 'shakira.r.salazar@gmail.com', password: 'password')
		peep = Peep.create_peep(message: "This is my first peep", user_id: user.id)
		expect(peep.user_id).to eq user.id
	end

end