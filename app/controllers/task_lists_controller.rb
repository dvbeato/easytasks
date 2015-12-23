class TaskListsController < ApplicationController
  before_action :set_task_list, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!
  
  respond_to :html

  def create
    @task_list = task_list_scope.build(task_list_params)
    @task_list.save
    respond_with(@task_list)  
  end

  def show
    respond_with(@task_list)
  end

  def new 
    @task_list = TaskList.new
    respond_with(@task_list)
  end

  def edit
  end

  def update
    @task_list.update(task_list_params)
    respond_with(@task_list)
  end

  def destroy
    @task_list.destroy
    respond_with(@task_list)
  end

  private

  def task_list_scope
    current_user.task_lists
  end

  def set_task_list
    @task_list = TaskList.find(params[:id])
  end

  def task_list_params
    params.require(:task_list).permit(:name, :public)
  end

end
