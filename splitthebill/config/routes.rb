Rails.application.routes.draw do
  # resources :expenses
  resources :trips do 
    resources :expenses
  end
  resources :home

  # Devise routes for user authentication
  devise_for :users

  # Optionally, only if you need a specific user route, modify this
  # resources :users, only: [:show] # Keep it simple, and don't duplicate routes
  
  # Root route
  root "home#index"
end
