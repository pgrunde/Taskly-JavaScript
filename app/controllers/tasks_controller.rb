class TasksController < ApplicationController
  def new
    @task = Task.new
  end

  def create
    @task = Task.new(:task => params[:task][:task], :due_date => params[:task][:due_date], :task_list_id => params[:task_list_id])
    if @task.save
      flash[:notice] = "Task added!"
      redirect_to "/"
    else
      render :new
    end
  end
end