class ApplicationController < ActionController::Base
  before_action :authenticate_user!
  before_action :configure_permitted_parametars, if: :devise_controller?
end

def configure_permitted_parametars
  added_attrs = [:email, :name, :password, :password_comfirmation]
  devise_parameter_sanitizer.permit :sign_up, keys: added_attrs
  devise_parameter_sanitizer.permit :account_update, keys: added_attrs
  devise_parameter_sanitizer.permit :sign_in, keys: added_attrs
end