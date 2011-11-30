class Contact < ActiveRecord::Base
	belongs_to :assignee

	validates :name, presence: true
	validates :email, :email => true

	# Model Definiton for the scoped search Gem
	scoped_search :on => [:name, :email, :phone]

	# Definition of the search method

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
