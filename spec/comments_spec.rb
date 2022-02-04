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
	
	it 'should have a peep id' do
		expect(comment.peep_id).to eq peep.id
	end

	it 'should have a date, message and ID' do
		expect(comment.id).not_to be_nil
		expect(comment.date).not_to be_nil
		expect(comment.message).not_to be_nil
	end

	describe 'find comment' do

		it 'should return comments' do
			results = Comment.find_comments(peep_id: peep.id)
			expect(results[0].message).to eq "This is my first comment on a peep"
		end
	
	end

	
end