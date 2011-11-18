class TasksController < ApplicationController
  
  def index
    @Title = "Tasks"
    @tasks = Task.all
    @task = Task.new
  end

  def create
    @Title = "New Task"

  end

  def edit
  end

  def update
  end

  def destroy
  end

  def search
  end

end
