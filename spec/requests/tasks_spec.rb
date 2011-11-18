require 'spec_helper'

describe "Tasks" do

	before do
		#Since the Task model has a many to one relationship with the Assignee model, we need to create an Assignee model 
			# To establish the relationship.
		@assignee = Assignee.new #Create a New Assignee
		@assignee.assignee = "Test Assignee Tasks"
		@assignee.description = "A Very Simple Description for Assignee Tasks"
		@assignee.save()

		@task = Task.new #Create a new task for the assignee
		@task.task = "Sample Task"
		@task.assignee = @assignee
		@task.save()
	end

  describe "GET /tasks" do
    it "displays some Tasks" do
      # Run the generator again with the --webrat flag if you want to use webrat methods/matchers
      visit assignees_path
      page.should have_content "Sample Task"
      #save_and_open_page
    end

    it "searches for An Assignee based on a Tag" do
    	visit assignees_search_path

    	fill_in 'search', :with => 'Other Tasks'

    	click_button 'Search Assignee'

    	current_path.should == assignees_search_path
    
    	# Look for:
    		# The Description.
    		# the other Tags
    		# The Title

    	page.should have_content 'Test Assignee'
    	page.should have_content 'A Very Simple Description' 
    	page.should have_content 'Sample Task'
    end
  end

  describe "PUT /tasks" do
	it "edits an assignee's task" do
		visit assignees_path
		click_link 'Edit'

		current_path.should == edit_assignee_path(@assignee)

		find_field('Tasks').value.should have_content 'Sample Task'

		fill_in 'Tasks', :with => 'Sample Task, More Tasks'

		click_button 'Update Assignee'

		current_path.should == assignees_path

		page.should have_content 'Assignee has been updated'
	end
  end

  describe "DELETE /tasks" do

 #  	it "should delete a Task" do
	# 	visit assignees_path
	# 	find("#assignee_#{@assignee.id}").click_link 'Delete'
	# 	page.should have_content 'Assignee has been deleted'
	# 	page.should have_no_content 'Test Assignee'
	# end

  end

end
