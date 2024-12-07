Rails.application.routes.draw do
  # resources :expenses
  resources :trips do 
    resources :expenses
  end
  resources :home
  #resources :users, only: [:index, :show, :new, :create] # Note, a few are left out, because we use Devise

  devise_for :users

   #Custom route for marking an individual contribution as paid!
   patch 'contributions/:id/mark_paid', to: 'contributions#mark_paid', as: 'mark_contribution_paid'

   #Custom route for marking all contributions for a user as paid!
   patch 'users/:id/pay_all_contributions', to: 'contributions#pay_all_contributions', as: 'pay_all_contributions'

  # Defines the root path route ("/")
  root "home#index"

  get "/terms_of_service", to: "pages#terms", as: :terms_of_service
end
