Rails.application.routes.draw do
  root to: "home#index"
  resources :users, only: [:new, :create, :show]

  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'

  namespace :admin do
    resources :categories, only: [:new, :create, :destroy, :index]
    resources :gifs, only: [:new, :create, :destroy, :index]
  end
end
