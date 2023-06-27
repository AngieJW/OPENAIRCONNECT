Rails.application.routes.draw do
  get 'event/index'
  get 'event/show'
  get 'event/new'
  get 'event/edit'
  devise_for :users

  root to: "pages#home"
  get 'home', to: 'pages#home'
  get 'dashboard', to: "pages#dashboard"

  # resources :bookings do
  #   resources :chatrooms, only: %i[new create]
  #   resources :lists, only: %i[show new create edit update destroy]
  #   resources :memories, only: %i[show new create edit update]
  # end
end
