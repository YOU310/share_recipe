Rails.application.routes.draw do
  # get 'comments/index'
  # get 'comments/show'
  # get 'comments/new'
  # get 'comments/create'
  # get 'comments/edit'
  # get 'comments/update'
  # get 'comments/destroy'
  devise_for :users

  root "posts#index"
  resources :posts

  resources :comments

end
