require 'user'
require 'peep'
require 'comment'

describe 'Comments' do

	let(:user){ User.add_new(first_name: 'Shakira', last_name: 'Salazar', username:'srsalazar', email: 'shakira.r.salazar@gmail.com', password: 'password') }
	let(:peep){ Peep.create_peep(message: "This is my first peep", user_id: user.id) }
	let(:comment){Comment.add_comment(message: "This is my first comment on a peep", user_id: user.id, peep_id: peep.id) }

	it 'should have a user id' do
		expect(comment.user_id).to eq user.id
	end
end