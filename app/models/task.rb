class Task < ActiveRecord::Base
	belongs_to :assignee


	# Model Definition for the scoped_search gem
	scoped_search :on => :task

	def self.search(search)
		#Returns all of the Assignees found by the scoped search
		results = search_for(search)
		assignees= Array.new
		results.each{
			|x|
			assignees.push(x.assignee)
		}
		return assignees
	end 


end
