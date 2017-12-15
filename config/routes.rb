Rails.application.routes.draw do
  get "/login", to: "sessions#new"
  post "/login", to: "sessions#create"
  get "/logout", to: "sessions#destroy"
  resources :foods
  resources :users
  resources :account_activations
  resources :password_resets,     only: [:new, :create, :edit, :update]
  match "search(/:search)", :to => "static_pages#search", :as => :search, via: [:get, :post]
end
