Rails.application.routes.draw do
  root "static_pages#home"

  get "/login", to: "sessions#new"
  post "/login", to: "sessions#create"
  delete "/logout", to: "sessions#destroy"
  post "/create_cart", to: "carts#create"
  post "/subscribe" => "subscriptions#create"
  post "/unsubscribe" => "subscriptions#destroy"
  post "/push" => "push_notifications#create"
  post "/deliveries" => "deliveries#create"
  resources :foods
  resources :order_details
  resources :users
  resources :orders
  resources :account_activations
  resources :password_resets, only: [:new, :create, :edit, :update]
  resources :food_categories
  resources :annoucements
  match "search(/:search)", :to => "static_pages#search", :as => :search, via: [:get, :post]
  patch "carts", to: "carts#update"
  resources :carts, only: [:destroy, :index]
  resources :votes, only: [:create, :update]
  resources :comments, only: [:create]
end
