module Users
  class SessionsController < Devise::SessionsController
    def create
      devise_create
    end

    def devise_create
      self.resource = warden.authenticate!(auth_options)
      set_flash_message!(:notice, :signed_in, name: resource.name)
      sign_in(resource_name, resource)
      yield resource if block_given?
      respond_with resource, location: after_sign_in_path_for(resource)
    end

    def guest_sign_in
      sign_in User.guest
      redirect_to root_path, notice: "ゲストユーザーとしてログインしました"
    end
  end
end
