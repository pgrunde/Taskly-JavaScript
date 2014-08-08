class TaskListsController < ApplicationController

  def index
    @task_lists = TaskList.order(:name)
    @tasks = Task.order(:due_date)

    @has_tasks_arr = []
    @task_lists.each do |task_list|
      @tasks.each do |task|
        if task_list.id == task.task_list_id
          @has_tasks_arr.push(task_list.name)
        end
      end
      @has_tasks_arr.uniq!
    end
  end

  def new
    @task_list = TaskList.new
  end

  def create
    @task_list = TaskList.new(:name => params[:task_list][:name])
    if @task_list.save
      flash[:notice] = "Task List was created successfully!"
      redirect_to "/"
    else
      render :new
    end
  end

  def edit
    @task_list = TaskList.find(params[:id])
  end

  def update
    @task_list = TaskList.find(params[:id])
    @task_list.name = params[:task_list][:name]
    if @task_list.save
      flash[:notice] = "Task list was updated successfully!"
      redirect_to "/"
    else
      render :edit
    end
  end

  def show
    @task_list = TaskList.find(params[:task_list_id])
    @task = Task.where(task_list_id: params[:task_list_id])
  end

  def delete
    @task_list = TaskList.find(params[:id])
    @task_list.destroy
    redirect_to "/"
  end

end