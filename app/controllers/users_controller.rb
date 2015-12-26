class UsersController < ApplicationController
  before_action :set_user, only: :show

  def show
    respond_with @user
  end

  private 

  def set_user
    @user = User.friendly.find(params[:id])
  end
end
