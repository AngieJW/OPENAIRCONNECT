Rails.application.routes.draw do
  devise_for :users

  root to: "pages#home"
  get 'home', to: 'pages#home'
  get 'dashboard', to: "pages#dashboard"
  get 'myevents', to: "events#myevents"
  get "hikes", to: "hikes#index"
  get 'pages/apiconnection', to: 'pages#apiconnection'
  get 'pages/indexstrava', to: 'pages#indexstrava'
  get 'pages/indexstrava.html/exchange_token', to: 'pages#indexstrava'

  resources :events, only: %i[index show new create edit update] do
    resources :bookings, only: %i[create]
    resources :chatrooms, only: :show do
      resources :messages, only: %i[create destroy show]
    end
    resources :items, only: %i[index show new create edit update destroy]
    resources :memories, only: %i[show new create edit update]
  end
<<<<<<< HEAD
=======

>>>>>>> 97b2eace0d6f16c53fc25ae03d3e70e63115b6f5
  patch 'create_brings', to: "item_brings#create_brings", as: :update_items
  resources :bookings, only: %i[destroy]
end
