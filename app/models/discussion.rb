class Discussion < ActiveRecord::Base
	belongs_to :user
	has_many :replies, class_name: "Discussion", foreign_key: "main_discussion_id"
	belongs_to :main_discussion, class_name: "Discussion"
end
