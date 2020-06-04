Rails.application.routes.draw do
  devise_for :users

  root to: 'pages#home'

  mount ActionCable.server => "/cable"

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :companies
  resources :participations, only: :destroy
  resources :messages, only: :destroy
  resources :tops, only: :destroy

  resources :users do
    get :autocomplete_user_full_name, on: :collection
    resources :friends
    resources :tops, only: [:new, :create, :edit, :update]
  end

  resources :games

  resources :plays do
    get :autocomplete_game_name, on: :collection
    patch 'add_players', to: "plays#add_players"
    patch 'add_photos', to: "plays#add_photos"
    member do
      delete 'delete_photo'
    end
    resources :messages, only: :create
  end

end
