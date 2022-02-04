require_relative 'feature_helper'

feature 'create a peep' do
	scenario 'register user can create a peep' do
		signup_and_login
		create_peep
		expect(page).to have_content 'This is my first peep!'
	end
end