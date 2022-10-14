Rails.application.routes.draw do
  
  devise_for :users
  root to: "cars#index"

  get 'inquiries/index'
  get 'home/index'
  get '/my_cars', to: 'cars#user_cars'
  get '/brand/:brand', to: 'cars#buy_cars'
  get '/brand', to: 'cars#buy_cars'
  get '/buy_cars', to: 'cars#buy_cars'

  resources :reviews, only: [:index]
  resources :cars, only: [:show, :new, :edit]

  resources :cars do
      resources :reviews
  end
  resources :inquiries
  resources :profiles
  resources :likes
  resources :unlikes

  delete 'likes', to: "likes#destroy"
  # delete 'unlikes', to: "unlikes#destroy"

  end
