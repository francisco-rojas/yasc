Rails.application.routes.draw do
  devise_for :users
  root to: "home#index"

  resources :items
  get '/checkout', to: "orders#checkout"
  delete '/remove_item/:id', to: "orders#remove_item", as: :remove_item
end