class Assignee < ActiveRecord::Base
	validates :assignee, presence: true
	validates :description, presence: true

	# Model Definiton for The Tasks (has many Tasks)
	has_many :tasks, :dependent => :destroy

	# Model Definition for Contacts (has and belongs to many contacts)

	has_and_belongs_to_many :contacts

	# Allow us to create the subforms in the Assignees page
	accepts_nested_attributes_for :tasks, :reject_if => lambda { |a| a[:task].blank?}, :allow_destroy => true
	accepts_nested_attributes_for :contacts, :reject_if => lambda { |a| a[:name].blank?}, :allow_destroy => true

	# Model definiton for scoped_search gem
		scoped_search :on => [:assignee, :description]

  def self.search(search)
  	if search && !search.empty? # Only run the queries if we're given a search term
	  	# The array of all items that were successfully searched for using the scope search
	  		assigneesScoped = search_for(search) 
	  	# The array of all items retrieved by a Task Search
	  		tasksSearch = Task.search(search)
	  		#assigneesTagged = tagged_with(search.split(','), :any => true)
	  	
	  	# The array of all items retrieved by a Contact Search
	  		contactSearch = Contact.search(search)

	  		results = tasksSearch + assigneesScoped  + contactSearch

	  		if results.size > 0 #If we returned some results from the search, then set those as the current result and return them
	  			return results.uniq
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
