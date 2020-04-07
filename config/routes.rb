Rails.application.routes.draw do
  devise_for :users

  root to: 'pages#home'
  root to: 'pages#dashboard'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :companies

  resources :users do
    resources :friends
  end

  resources :games

  resources :plays do
    resources :messages
  end

end
