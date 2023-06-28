Rails.application.routes.draw do
  get 'hike/index'
  devise_for :users

  root to: "pages#home"
  get 'home', to: 'pages#home'
  get 'dashboard', to: "pages#dashboard"
  get 'myevents', to: "events#myevents"

  resources :events, only: %i[index show new create edit update] do
    resources :chatrooms, only: %i[new create]
    resources :items, only: %i[show new create edit update destroy]
    resources :memories, only: %i[show new create edit update]
  end
end
