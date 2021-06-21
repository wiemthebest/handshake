class ApplicationController < ActionController::Base
before_action :configure_permitted_parameters, if:  :devise_controller?
include UsersHelper

protect_from_forgery with: :exception
protected
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:first_name, :last_name, :classification, :description, :phone, :address, :zip_code, :date_of_birth])
    devise_parameter_sanitizer.permit(:account_update, keys: [:first_name, :last_name, :classification, :description, :phone, :address, :zip_code, :date_of_birth])
  end
    
end
