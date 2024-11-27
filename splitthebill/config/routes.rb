Rails.application.routes.draw do
  resources :expenses
  resources :trips
  resources :home

  # Devise routes
  devise_for :users
  
  resources :users, only: [:index, :show] # Note, I left out a few! 
  #, :new, :create these left out because it conflicts with devise
  
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  root "home#index"
end
