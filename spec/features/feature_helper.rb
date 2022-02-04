require 'capybara/rspec'

def signup_and_login
	signup
	login
end

def create_peep
	within('#create_peep') do 
			fill_in 'message', with: 'This is my first peep!'
		end
	click_button('Peep it!')
end

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

def login
	fill_in('username', with: 'rhianekobar')
	fill_in('password', with: 'password')
	click_button('Login')
end