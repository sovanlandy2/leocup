Rails.application.routes.draw do
  
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  root to: 'visitors#index'
  resources :matches, only: [:index] do 
  	get :refresh, on: :collection
  	get :select_matches, on: :collection
  end
  resources :posts, only: [:index, :show]
  
  resources :teams, only: [:index, :show] do 
    get :select_region, on: :collection
    get :select_team, on: :collection
  end

  devise_for :users

  resources :team_votes, only: [:create] do 
    get :winner, on: :collection
    get :winner_picture, on: :collection
  end

  match 'winner', to: 'team_votes#winner', via: [:get]
  match 'auth/:provider/callback', to: 'sessions#create', via: [:get]
  match 'auth/failure', to: redirect('/'), via: [:get]
  match 'signout', to: 'sessions#destroy', as: 'signout', via: [:get]
  match 'wallets', to: 'wallets#index', via: [:get]
  match 'wallets/getpass', to: 'wallets#getpass', via: [:get]
end
