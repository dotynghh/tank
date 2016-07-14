Rails.application.routes.draw do

  mount ChinaCity::Engine => '/china_city'

  resources :orders, only: [:index, :create, :destroy]

  resources :addresses do
    get :be_addr_default, on: :member
  end

  resources :carts
  get 'products/index'

  root "welcome#index"

  resources :sessions 
  delete "logout" => "sessions#destroy"

  resources :products

  resources :carts 

  resources :users do
    get :user_active, on: :member
  end

  namespace :admin do
    root "sessions#new"
    #resources :bases
    #resources :users
    resources :sessions, only: [:index, :create]
    resources :products
  end
end
