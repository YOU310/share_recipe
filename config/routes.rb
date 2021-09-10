Rails.application.routes.draw do
  devise_for :users, controllers: {
    registrations: "users/registrations",
    sessions: "users/sessions"
  }
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  devise_scope :user do
    post "users/guest_sign_in", to: "users/sessions#guest_sign_in"
  end

  root "pages#top"
  get "/posts/list", to: "posts#list"
  get "/pages/top", to: "pages#top"

  resources :posts do
    resources :comments
    resource :likes, only: %i[create destroy]
  end
end
