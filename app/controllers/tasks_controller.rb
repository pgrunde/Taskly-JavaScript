class TasksController < ApplicationController
  def new
    @task = Task.new
  end

  def create
    date = Date.new(params[:task]["due_date(1i)"].to_i,params[:task]["due_date(2i)"].to_i,params[:task]["due_date(3i)"].to_i)
    @task = Task.new(:task => params[:task][:task], :due_date => date, :task_list_id => params[:task_list_id], :completed => false)
    if @task.save
      join = TaskUser.new
      join.user_id = params[:user_join]
      join.task_id = @task.id
      join.save
      flash[:notice] = "Task added!"
      redirect_to "/"
    else
      render :new
    end
  end

  def destroy
    @task = Task.find(params[:task_id])
    @task.destroy
    redirect_to "/"
  end

  def complete
    @task = Task.find(params[:task_id])
    @task.completed = true
    @task.save
    redirect_to :show_tasks
  end

  def completed_tasks
    @task_list = TaskList.find(params[:task_list_id])
    @task = Task.where(task_list_id: params[:task_list_id])
    render :completed_tasks
  end


end