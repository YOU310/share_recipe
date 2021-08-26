Rails.application.routes.draw do
  root "posts#index"

  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)

  devise_for :users, controllers: {
    registrations: "users/registrations"
  }

  devise_scope :user do
    post "users/guest_sign_in", to: "users/sessions#guest_sign_in"
  end

  resources :posts do
    resource :likes, only: %i[create destroy]
  end
  resources :posts do
    resources :comments
  end
end
