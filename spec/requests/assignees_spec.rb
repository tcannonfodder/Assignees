require 'spec_helper'

describe "Assignees" do
	before do
		@assignee = Assignee.new #Create a New Assignee
		@assignee.assignee = "Test Assignee"
		@assignee.description = "A Very Simple Description"
		@assignee.save()

		@task = Task.new #Create a new task for the assignee
		@task.task = "Sample Task"
		@task.assignee = @assignee
		@task.save()
	end

  describe "GET /assignees" do
	    it "displays some assignees" do
	      # Run the generator again with the --webrat flag if you want to use webrat methods/matchers
	      visit assignees_path
	      page.should have_content "Test Assignee"
	    end

	    it "creates a new assignee" do
	    	visit assignees_path
	    	fill_in 'Assignee', :with => 'Another Assignee'
	    	fill_in 'Description', :with => 'Some more content'
	    	fill_in 'assignee[tasks_attributes][0][task]', :with => 'Sample Task'
	    	
	    	click_button 'Create Assignee'
	    	current_path.should == assignees_path
	    	page.should have_content 'Another Assignee'

	    	# save_and_open_page 
	    end

	    it "searches for An Assignee based on Title" do
	    	visit assignees_search_path

	    	fill_in 'search', :with => 'Test Assignee'

	    	click_button 'Search Assignee'

	    	current_path.should == assignees_search_path
	    
	    	# Look for:
	    		# the Description (We are not looking for the title, because it will be a false positive in the field perhaps).
	    		# One of the tags

	    	page.should have_content 'A Very Simple Description' 
	    	page.should have_content 'Sample Task'
	    end

	    it "searches for An Assignee based on a snippet of the Description" do
	    	visit assignees_search_path

	    	fill_in 'search', :with => 'A Very Simple'

	    	click_button 'Search Assignee'

	    	current_path.should == assignees_search_path
	    
	    	# Look for:
	    		# The Description (We are not looking for just the snippet, because it will be a false positive in the field perhaps).
	    		# One of the tags
	    		# The Title

	    	page.should have_content 'Test Assignee'
	    	page.should have_content 'A Very Simple Description' 
	    	page.should have_content 'Sample Task'
	    end
	end

	describe "PUT /assignees" do
		it "edits an assignee" do
			visit assignees_path
			click_link 'Edit'

			current_path.should == edit_assignee_path(@assignee)

			find_field('Assignee').value.should == 'Test Assignee'

			fill_in 'Assignee', :with => 'updated Assignee'

			click_button 'Update Assignee'
			current_path.should == assignees_path

			page.should have_content 'Assignee has been updated'
			#save_and_open_page
		end

		it 'should not update an empty assignee' do
			visit assignees_path
			click_link 'Edit'
			current_path.should == edit_assignee_path(@assignee)

			find_field('Assignee').value.should == 'Test Assignee'
			fill_in 'Assignee', :with => ''
			click_button 'Update Assignee'

			current_path.should == edit_assignee_path(@assignee)
			page.should have_content 'There was an error updating the Assignee'
		end
	end

	describe "DELETE /assignees" do
		it "should delete an assignee" do
			visit assignees_path
			find("#assignee_#{@assignee.id}").click_link 'Delete'
			page.should have_content 'Assignee has been deleted'
			page.should have_no_content 'Test Assignee'
		end
	end
end
