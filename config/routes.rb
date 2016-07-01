Rails.application.routes.draw do

  root "welcome#index"

  resources :sessions

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
