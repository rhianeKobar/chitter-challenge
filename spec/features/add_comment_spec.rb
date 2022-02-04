require_relative 'feature_helper'

feature 'add a comment' do
	scenario 'registered user can comment on a peep' do
		signup_and_login
		create_peep
		within('#1') do 
			fill_in 'message', with: 'This is my first comment!'
		end
		click_button('Peep back!')
	end
end