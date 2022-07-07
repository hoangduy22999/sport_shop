Rails.application.routes.draw do
  root to: 'user/home_page#index'
  
  namespace :user do
    resources :products, only: [:index, :show]
    resources :shopping_sessions, only: [:show, :update]
    resources :orders, only: [:new, :create]
    resources :cart_items, only: [:create, :show, :destroy]
  end
  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
