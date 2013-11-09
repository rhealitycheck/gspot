class User < ActiveRecord::Base
	has_many :texts
	validates_presence_of :password_digest, :email
end