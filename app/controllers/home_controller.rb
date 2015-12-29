class HomeController < ApplicationController
  before_action :authenticate_user!
  def index
    @user = current_user
    @task_lists = current_user.task_lists
    @favorite_task_lists = current_user.favorite_task_lists 
  end
end
