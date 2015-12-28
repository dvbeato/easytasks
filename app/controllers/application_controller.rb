class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  respond_to :html, :js

  before_action :configure_permitted_parameters, if: :devise_controller?
  
  layout :layout_by_resource   

  private

  def layout_by_resource
    if devise_controller?
      "authentication"
    else
      "application"
    end
  end

  def configure_permitted_parameters
    devise_parameter_sanitizer.for(:sign_up).push  :name, :slug
    devise_parameter_sanitizer.for(:account_update).push  :name, :slug
  end


end
