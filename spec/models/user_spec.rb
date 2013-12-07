require 'spec_helper'

describe User do
	let (:user){User.new(firstname: 'rhea', lastname: 'ghosh', password_digest: 'blah', email: 'rhea.ghosh@gmail.com', admin: true)}


	it 'validates the presence of email' do
		user.email = nil

		expect(user.valid?).to be_false

	end

	it 'validates the presence of password_digest' do
		user.password_digest = nil

		expect(user.valid?).to be_false
	end

	it 'is valid with an email and password_digest' do
		expect(user.valid?).to be_true
	end

	it 'does not require presence of firstname' do
		user.firstname = nil

		expect(user.valid?).to be_true
	end

	it 'does not allow mass assignment of admin role' do
		user.save
		expect(user.admin).to be_false
		user.admin = true
		user.save
		expect(user.admin).to be_true
	end

end