require_relative 'feature_helper'

feature 'Login' do
	scenario 'registered user can login' do
		signup_and_login
		expect(page).to have_content 'Shakira'
	end
end