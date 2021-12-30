require_relative 'feature_helper'

feature 'Login' do
	scenario 'registered user can login' do
		signup
		login
		expect(page).to have_content 'View all peeps'
	end
end