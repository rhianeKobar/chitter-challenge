require_relative 'feature_helper'

feature 'Login' do
	scenario 'registered user can login' do
		signup
		login
		expect(page).to have_content 'Shakira'
	end
end