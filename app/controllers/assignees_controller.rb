class AssigneesController < ApplicationController
	def index
		@assignees = Assignee.all
		@assignee = Assignee.new
	end

	def create
		Assignee.create params[:assignee]

		redirect_to :back, :notice => "Assignee has been created"
	end

	def edit
		@assignee = Assignee.find params[:id] #find the Assignee currently being looked for
	end

	def update
		assignee = Assignee.find params[:id] #find the Assignee currently being looked for

		if assignee.update_attributes params[:assignee]
			# the update was successful, redirect to the main page and inform the user 
			redirect_to assignees_path, :notice =>"Assignee has been updated"
		else
			# the update was not successful, rediret back to the editing page
			redirect_to :back, :notice => "There was an error updating the Assignee"
		end
	end

	def destroy
		Assignee.destroy params[:id]
		redirect_to :back, :notice => "Assignee has been deleted"
	end
end
