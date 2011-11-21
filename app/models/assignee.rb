class Assignee < ActiveRecord::Base
	validates :assignee, presence: true
	validates :description, presence: true

	# Model Definiton for The Tasks (has many Tasks)
	has_many :tasks, :dependent => :destroy

	# Allow us to create the subforms in the Assignees page
	accepts_nested_attributes_for :tasks, :reject_if => lambda { |a| a[:task].blank?}, :allow_destroy => true

	# Model definiton for scoped_search gem
		scoped_search :on => [:assignee, :description]

  def self.search(search)
  	if search # Only run the queries if we're given a search term
	  	# The hash of all items that were successfully searched for using the scope search
	  		assigneesScoped = search_for(search) 
	  	# The hash of all items retrieved by a tag search
	  		#assigneesTagged = tagged_with(search.split(','), :any => true)
	  		results = assigneesScoped #+ assigneesTagged

	  		if results.size > 0 #If we returned some results from the search, then set those as the current result and return them
	  			return results
	  		end
	end

	# If there was no query string, or the query yielded no results, we need to notify the user.
	 	assignee = Assignee.new
	 	assignee.assignee = "No Assignees were Found"
	 	assignee.description = "No Assignees were found using the current query"

	 	results = Array[assignee]

	 	return results
  end 
end
