class TaskListsController < ApplicationController
  before_action :set_task_list, only: [:show, :edit, :update, :destroy, :favorite, :unfavorite]
  before_action :authenticate_user!

  def create
    @task_list = task_list_scope.build(task_list_params)
    @task_list.save
    redirect_to profile_path current_user
  end

  def show
  end

  def new 
    @task_list = TaskList.new
  end

  def edit
  end

  def update
    @task_list.update(task_list_params)
  end

  def destroy
    @task_list.destroy
    redirect_to profile_path current_user
  end

  def favorite
    current_user.favorites @task_list
    redirect_to profile_path @task_list.user
  end

  def unfavorite
    current_user.unfavorites @task_list
    redirect_to profile_path @task_list.user
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
