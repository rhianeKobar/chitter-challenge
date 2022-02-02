require_relative 'feature_helper'

feature 'sign out' do
	scenario 'registered user can signout' do
		signup
		login
		click_button('signout')
		expect(page).to have_content 'Please Log in to post a peep'
	end
end