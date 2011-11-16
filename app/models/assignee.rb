class Assignee < ActiveRecord::Base
	validates :assignee, presence: true
	validates :description, presence: true

	acts_as_taggable
end
