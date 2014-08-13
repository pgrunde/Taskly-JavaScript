class TasksController < ApplicationController
  def new
    @task = Task.new
  end

  def create
    date_arr = params[:task][:due_date].split("/")
    date_arr.map! {|d|d.to_i}
    date = Date.new(date_arr[2], date_arr[0],date_arr[1])
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