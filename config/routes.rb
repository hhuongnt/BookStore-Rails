Rails.application.routes.draw do
  resource :cart, only: [:show]
  resources :order_items, only: %i[create update destroy]
  resources :books
  resources :shopping_carts
  root 'welcome#index'
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
