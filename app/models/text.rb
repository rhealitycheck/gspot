class Text < ActiveRecord::Base
	belongs_to :user
	validates_presence_of :name, :user_id, :text
end