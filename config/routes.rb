Rails.application.routes.draw do
  
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  root to: 'visitors#index'
  resources :matches, only: [:index] do 
  	get :refresh, on: :collection
  	get :select_matches, on: :collection
  end
  resources :posts, only: [:index]
  
  resources :teams, only: [:index, :show] do 
    get :select_region, on: :collection
    get :select_team, on: :collection
  end

  devise_for :users
end
