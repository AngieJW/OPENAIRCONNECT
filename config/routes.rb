Rails.application.routes.draw do
  devise_for :users

  root to: "pages#home"
  get 'home', to: 'pages#home'
  get 'dashboard', to: "pages#dashboard"

  resources :events, only: %i[index show new create edit update] do
    resources :chatrooms, only: %i[new create]
    resources :lists, only: %i[show new create edit update destroy]
    resources :memories, only: %i[show new create edit update]
  end
end
