class Contact < ActiveRecord::Base
	has_and_belongs_to_many :assignees

	validates :name, presence: true
	validates :email, :email => true

	# Model Definiton for the scoped search Gem
	scoped_search :on => [:name, :email, :phone]

	# Definition of the search method

	def self.search(search)
		results = search_for(search)
		contacts = Array.new
		results.each{
			|x|
			contacts.push(x.assignee)
		}

		return contacts
	end
end
