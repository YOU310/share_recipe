Rails.application.routes.draw do
  devise_for :users
  root 'posts#index'

  #---   略   ---
  
  resources :posts do
    resources :comments
  end
end
