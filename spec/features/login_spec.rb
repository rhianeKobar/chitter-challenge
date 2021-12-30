require_relative 'feature_helper'

feature 'Login' do
	scenario 'registered user can login' do
		signup
		fill_in('username', with: 'rhianekobar')
		fill_in('password', with: 'password')
		click_button('Login')
		expect(page).to have_content 'View all peeps'
	end
end