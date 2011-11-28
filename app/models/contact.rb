class Contact < ActiveRecord::Base
	has_and_belongs_to_many :assignees

	validates :name, presence: true
	#validates :email, :email => true

	# Model Definiton for the scoped search Gem
	scoped_search :on => [:name, :email, :phone]

	# Definition of the search method

	def self.search(search)
		results = search_for(search)
		contacts = Array.new
		results.each{ #Since the results is an array of contacts, we need to loop through each contact
			|x|
			x.assignees.each{ #and loop through each assignee tied to a specific contact
				|y|
				contacts.push(y)
			}
			
		}

		return contacts
	end
end
