class ApplicationController < ActionController::Base
  protect_from_forgery 

  before_action :authenticate_user!
	before_action :set_user


  
  def set_user
  	@current_user = current_user
  end


  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :lname])
    devise_parameter_sanitizer.permit(:account_update, keys: [:name, :lname])
  end


end
