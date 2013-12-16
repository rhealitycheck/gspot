require 'spec_helper'

describe 'signing into the site' do 
	before do
		visit root_path
	end

	it 'says welcome to gspot in homepage' do
		expect(page).to have_content 'welcome to gspot'
	end

	xit 'says sign in to gspot' do
		expect(page).to have_content 'sign in'
	end
end