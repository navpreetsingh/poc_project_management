class User < ActiveRecord::Base
	has_and_belongs_to_many :projects
	has_and_belongs_to_many :milestones
	has_and_belongs_to_many :tasks
	has_many :discussions
end
