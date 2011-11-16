class Assignee < ActiveRecord::Base
	validates :assignee, presence: true
	validates :description, presence: true

	# Alias for <tt>acts_as_taggable_on :tags</tt>:
  acts_as_taggable
  acts_as_taggable_on :tasks
end
