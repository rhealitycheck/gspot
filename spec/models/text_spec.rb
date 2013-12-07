require 'spec_helper'

describe Text do 
	let (:user){User.create(firstname: 'rhea', lastname: 'ghosh', password_digest: 'blah', email: 'rhea.ghosh@gmail.com', admin: true)}
	let(:text){user.texts.build(name:'new text', body: 'lots of things to say here')}

	it 'requires user_id to be valid' do
		text.user_id = nil
		expect(text.valid?).to be_false
	end

	it 'requires name to be valid' do
		text.name = nil
		expect(text.valid?).to be_false
	end

	it 'requires body to be valid' do
		text.body = nil
		expect(text.valid?).to be_false
	end

	it 'uses correct user_id' do
		expect(text.user).to eq(user)
	end

end
