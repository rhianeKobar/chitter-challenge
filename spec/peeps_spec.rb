require 'user'
require 'peep'

describe 'Peep' do

	let(:user){ User.add_new(first_name: 'Shakira', last_name: 'Salazar', username:'srsalazar', email: 'shakira.r.salazar@gmail.com', password: 'password') }
	let(:peep){ Peep.create_peep(message: "This is my first peep", user_id: user.id) }

	it 'should have the ID of a registered user attached' do
		expect(peep.user_id).to eq user.id
	end

	it 'should have a date, message and ID' do
		expect(peep.id).not_to be_nil
		expect(peep.date).not_to be_nil
		expect(peep.message).not_to be_nil
	end

end