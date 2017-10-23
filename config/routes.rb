Rails.application.routes.draw do
  root to: "home#index"
  resources :users, only: [:new, :create, :show]

  get '/login', to: 'sessions#new'
end
