class User < ActiveRecord::Base
	has_many :texts
	validates_presence_of :password_digest, :email

	attr_accessible :firstname, :lastname, :email, :password_digest
	attr_protected :admin
end