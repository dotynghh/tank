Rails.application.routes.draw do

  resources :carts
  get 'products/index'

  root "welcome#index"

  resources :sessions

  resources :products

  resources :carts do
    get :add_number, on: :member
    get :minus_number, on: :member
  end

  resources :users do
    get :user_active, on: :member
  end

  namespace :admin do
    root "sessions#new"
    resources :users
    resources :sessions
    resources :products
  end
end
