class UsersController < ApplicationController
  before_action :set_user, only: :show
  before_action :authenticate_user!

  def show
    @task_lists = is_profile_of_current_user? ? @user.task_lists : @user.public_task_lists
    @favorite_task_lists = @user.favorite_task_lists
    respond_with @user
  end

  private 

  def is_profile_of_current_user?
    current_user == @user
  end

  def set_user
    @user = User.friendly.find(params[:id])
  end
end
