Rails.application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  resource :cart, only: [:show]
  resources :order_items, only: %i[create update destroy] do
    post :add_to_cart, on: :collection
  end
  resources :books, only: %i[show index]
  root 'welcome#index'
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
