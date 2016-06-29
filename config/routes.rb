Rails.application.routes.draw do

  root "welcome#index"

  resources :sessions

  resources :users do
    get :user_active, on: :member 
  end
 
end
