Rails.application.routes.draw do
  # get 'relationships/create'
  # get 'relationships/destroy'

  root to: 'users#index'
  devise_for :users
  resources :users

  resources :users do
    resource :relationships, only: [:create, :destroy, :index]
    get :follows, on: :member
    get :followers, on: :member
  end

  resources :rooms, only: [:new, :create]
  
end
