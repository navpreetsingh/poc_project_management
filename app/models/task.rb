class Task < ActiveRecord::Base
	has_and_belongs_to_many :users
	belongs_to :project
	belongs_to :milestone
	has_many :to_do_lists
end
