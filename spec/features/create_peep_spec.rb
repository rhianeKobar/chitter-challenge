require_relative 'feature_helper'

feature 'create a peep' do
	scenario 'register user can create a peep' do
		signup
		login
		within('#create_peep') do 
			fill_in 'message', with: 'This is my first peep!'
		end
		click_button('Make a peep!')
		expect(page).to have_content 'This is my first peep!'
	end
end