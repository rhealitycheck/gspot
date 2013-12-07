class Text < ActiveRecord::Base
	belongs_to :user
	validates_presence_of :name, :user_id, :body

	attr_accessible :name, :body
	attr_protected :user_id
end