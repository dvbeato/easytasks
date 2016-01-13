class TasksController < ApplicationController
  before_action :set_task_list, only: [:create, :update, :destroy]
  
  before_action :set_task, only: [:update, :destroy, :done, :undone]
  
  before_action :validate_hack, only: [:create, :update, :destroy]

  before_action :authenticate_user!

  def create
    @task = @task_list.tasks.build(task_params)
    @task.save
  end

  def update
    @task.update(task_params)
  end

  def destroy
    @task.destroy
  end

  def done
    current_user.completes @task
    render :update
  end

  def undone
    current_user.uncompletes @task
    render :update
  end

  private

  def validate_hack
    raise "This task list not belongs to you!" if @task_list.user != current_user
  end

  def set_task
    @task = Task.find(params[:id])
  end

  def set_task_list
    @task_list = TaskList.find(params[:task_list_id])
  end

  def task_params
    params.require(:task).permit(:name)
  end
end
