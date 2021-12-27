require 'capybara/rspec'

def signup
	visit('/')
	click_button(id:'signup')
	fill_in('first_name', with: 'Shakira')
	fill_in('last_name', with: 'Salazar')
	fill_in('username', with: 'rhianekobar')
	fill_in('email', with: 'shakira.r.salazar@gmail.com')
	fill_in('password', with: 'password')
	click_button('Sign up')
end