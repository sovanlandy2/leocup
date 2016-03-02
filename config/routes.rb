Rails.application.routes.draw do
  
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  root to: 'visitors#index'
  resources :matches, only: [:index]
  resources :posts, only: [:index]
  resources :teams, only: [:index]
  devise_for :users
end
