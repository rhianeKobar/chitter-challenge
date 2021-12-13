require 'capybara/rspec'

feature 'Sign up' do
	scenario 'user signs up for an account' do
		visit('/')
		click_button('Sign up')
		fill_in('first_name', with: 'Shakira')
		fill_in('last_name', with: 'Salazar')
		fill_in('username', with: 'rhianekobar')
		fill_in('email', with: 'shakira.r.salazar@gmail.com')
		fill_in('password', with: 'password')
		click_button('Sign up')
	end
end