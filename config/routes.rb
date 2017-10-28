Rails.application.routes.draw do
  root to: "home#index"
  resources :users, only: [:new, :create]
  resources :favorites, only: [:create, :destroy, :index]

  resources :gifs, only: [:index]

  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'

  namespace :admin do
    resources :categories, only: [:new, :create, :destroy, :index]
    resources :gifs, only: [:destroy, :index]
  end
end
