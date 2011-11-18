require 'spec_helper'

describe "Assignees" do
	before do
		@assignee = Assignee.create(:assignee => "Test Assignee" , :description => "Simple Description", :task_list => "Sample Task, Other Tasks")
	end

  describe "GET /assignees" do
	    it "displays some assignees" do
	      # Run the generator again with the --webrat flag if you want to use webrat methods/matchers
	      visit assignees_path
	      page.should have_content "Test Assignee"
	    end


	    it "displays some Tasks" do
	      # Run the generator again with the --webrat flag if you want to use webrat methods/matchers
	      visit assignees_path

	      page.should have_content "Sample Task"

	      #save_and_open_page

	    end

	    it "creates a new assignee" do
	    	visit assignees_path
	    	fill_in 'Assignee', :with => 'Another Assignee'
	    	fill_in 'Description', :with => 'Some more content'
	    	fill_in 'Tasks', :with => 'Sample Task'
	    	
	    	click_button 'Create Assignee'
	    	current_path.should == assignees_path
	    	page.should have_content 'Another Assignee'

	    	# save_and_open_page 
	    end

	    it "searches for An Assignee based on Title" do
	    	visit search_assignee_path
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
