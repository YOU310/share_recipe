class UsersController < ApplicationController
  private

  def user_params
    params_require(:user).permit(:id, :name, :email, :password, :password_comfirmation)
  end
end
