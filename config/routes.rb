Rails.application.routes.draw do
  resources :events
  resources :reservists
  resources :personnels do
    member do
      post :change_state
    end
  end
  resources :attachments
  resources :vehicles
  resources :franchises
  resources :authorize_routes
  devise_for :users

  get 'home/index'
  get 'home/vehicles_by_year'
  get "home/vehicles_by_status", to: "home#vehicles_by_status"
  get 'home/vehicles_by_full_status', to: 'home#vehicles_by_full_status'

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Defines the root path route ("/")
  root "home#index"
end
