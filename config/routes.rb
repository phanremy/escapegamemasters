Rails.application.routes.draw do
  devise_for :users

  root to: 'pages#home'


  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :companies
  resources :participations, only: :destroy


  resources :users do
    resources :friends
  end

  resources :games

  resources :plays do
    patch 'add_players', to: "plays#add_players"
    patch 'add_photos', to: "plays#add_photos"
    member do
      delete 'delete_photo'
    end
    resources :messages
  end

end
