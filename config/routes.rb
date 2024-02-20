Rails.application.routes.draw do  
  resources :shop_addresses
  devise_for :users
  root "categories#index"
  resources :categories
  resources :products do
    resources :variants
    post :import, on: :collection
  end
  resources :user_roles    
end
