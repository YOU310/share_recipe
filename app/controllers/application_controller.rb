class ApplicationController < ActionController::Base
  before_action :authenticate_user!
  before_action :configure_permitted_parametars, if: :devise_controller?

  # def after_sign_in_path_for(_resource)
  #   posts_path
  # end

  def after_sign_in_path_for(resource)
    if resource.is_a?(AdminUser)
      admin_root_path
    else
      posts_path
    end
  end
end

def configure_permitted_parametars
  added_attrs = %i[email name password password_comfirmation]
  devise_parameter_sanitizer.permit :sign_up, keys: added_attrs
  devise_parameter_sanitizer.permit :account_update, keys: added_attrs
  devise_parameter_sanitizer.permit :sign_in, keys: added_attrs
end
