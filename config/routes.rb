Rails.application.routes.draw do
  devise_for :users

  root to: "pages#home"
  get 'home', to: 'pages#home'
  get 'dashboard', to: "pages#dashboard"
  get 'myevents', to: "events#myevents"
  get "hikes", to: "hikes#index"
  resources :events, only: %i[index show new create edit update] do
    resources :bookings, only: %i[create]
    resources :chatrooms, only: %i[new create]
    resources :items, only: %i[index show new create edit update destroy]
    resources :memories, only: %i[show new create edit update]
  end


  patch 'create_brings', to: "item_brings#create_brings", as: :update_items

  resources :bookings, only: :destroy

end
