Rails.application.routes.draw do
  devise_for :users, controllers: {
    omniauth_callbacks: 'users/omniauth_callbacks',
    registrations: 'users/registrations'
  }
  
  get 'messages/new'
  root to: 'users#index'
  resources :users

  resources :users do
    resource :relationships, only: [:create, :destroy, :index]
    get :follows, on: :member
    get :followers, on: :member
    resources :rooms
    resources :messages
  end

  resources :rooms do
    resources :messages
  end
end
