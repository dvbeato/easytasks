class TasksController < ApplicationController
  before_action :set_task_list, only: [:create]
  before_action :set_task, only: [:update, :destroy]

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

  private

  def set_task
    @task = Task.find(params[:id])
  end

  def set_task_list
    @task_list = TaskList.find(params[:task_list_id])
  end

  def task_params
    params.require(:task).permit(:name, :done)
  end
end
