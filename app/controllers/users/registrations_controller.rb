module Users
  class RegistrationsController < Devise::RegistrationsController
    before_action :ensure_normal_user, only: :destroy

    def ensure_normal_user
      redirect_to posts_path, alert: "ゲストユーザーは削除できません。" if resource.email == "guest@example.com"
    end
  end
end
