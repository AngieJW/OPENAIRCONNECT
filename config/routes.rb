Rails.application.routes.draw do
  devise_for :users

  root to: "pages#home"
  get 'home', to: 'pages#home'
  get 'dashboard', to: "pages#dashboard"
  get 'myevents', to: "events#myevents"

<<<<<<< HEAD
  get "strava", to: "pages#strava"
  get "hikes", to: "hikes#index"
=======
>>>>>>> master

  resources :events, only: %i[index show new create edit update] do
    resources :chatrooms, only: %i[new create]
    resources :items, only: %i[index show new create edit update destroy]
    resources :memories, only: %i[show new create edit update]
  end

  patch 'update_all', to: "items#update_all", as: :update_items
end
