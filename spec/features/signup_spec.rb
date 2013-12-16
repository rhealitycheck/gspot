require 'spec_helper'

describe 'signup for gspot access' do
	before do
		visit signup_path
	end

	it 'has a link to signup on home page' do
		visit root_path
		expect(page).to have_link 'sign up'
	end

	it 'takes you to a signup page when you click signup link' do
		expect(current_path).to eq signup_path
	end
	
	it 'has fields to enter user information' do
		expect(page).to have_field 'user_firstname'
		expect(page).to have_field 'user_lastname'
		expect(page).to have_field 'user_email'
		expect(page).to have_field 'user_password'
	end

	context 'with valid inputs' do
		it 'creates a new user' do
			valid_user_inputs
			expect{click_button 'Create User'}.to change(User, :count).by(1)
		end

		it 'redirects to homepage upon user creation' do
			valid_user_inputs
			click_button 'Create User'
			expect(current_path).to eq root_path
		end
	end

	context 'with invalid inputs' do
		it 'does not create a new user' do
			invalid_user_inputs
			expect{click_button 'Create User'}.to change(User, :count).by(0)
		end
		it 're-renders page with invalid inputs identified' do
			invalid_user_inputs
			click_button 'Create User'
			expect(page).to have_content "Password confirmation doesn't match Password"
		end
	end

	def invalid_user_inputs
		valid_user_inputs
		fill_in 'user_password_confirmation', :with => 'flakes'
	end

	def valid_user_inputs
		fill_in 'user_firstname', :with => 'rhea'
		fill_in 'user_lastname', :with => 'ghosh'
		fill_in 'user_email', :with => 'rhea@rhealitycheck.com'
		fill_in 'user_password', :with => 'password'
		fill_in 'user_password_confirmation', :with => 'password'
	end

end