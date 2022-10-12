Rails.application.routes.draw do
  get 'inquiries/index'
  devise_for :users
  root to: "cars#index"

  get 'home/index'
  get '/my_cars', to: 'cars#user_cars'

  resources :reviews, only: [:index]
  resources :cars, only: [:show, :new, :edit]

  resources :cars do
      resources :reviews
  end
  resources :inquiries
  resources :profiles
  resources :likes

  delete 'likes', to: "likes#destroy"

  end
