class TaskListsController < ApplicationController
  before_action :set_task_list, only: [:show, :update, :destroy, :favorite, :unfavorite]
  before_action :authenticate_user!
  before_action :validate_hack, only: [:update, :destroy]

  def create
    @task_list = task_list_scope.build(task_list_params)
    @task_list.save
    redirect_to profile_path current_user
  end

  def show
  end

  def update
    @task_list.update(task_list_params)
    render :update
  end

  def destroy
    @task_list.destroy
    @totalTaskLists = task_list_scope.reload.size
  end

  def favorite
    current_user.favorites @task_list
    render :update
  end

  def unfavorite
    current_user.unfavorites @task_list
    @totalFavoriteTaskLists = current_user.favorite_task_lists.reload.size
  end

  private

  def task_list_scope
    current_user.task_lists
  end

  def validate_hack
    raise "This task list not belongs to you!" if @task_list.user != current_user
  end

  def set_task_list
    @task_list = TaskList.find(params[:id])
  end

  def task_list_params
    params.require(:task_list).permit(:name, :public)
  end

end
