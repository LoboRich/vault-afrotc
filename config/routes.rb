Rails.application.routes.draw do
  resources :announcemnts do
    collection do
      get :search
    end
  end
  get 'mapping/index'
  resources :events
  resources :reservists do
    collection do
      get :search
    end
    member do
      get :export_pdf
    end
  end

  # devise_for :users
  devise_for :users, controllers: {
  sessions: 'users/sessions'
  }
  get  "verify_otp", to: "otp#new"
  post "verify_otp", to: "otp#create"

  get 'home/index'


  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Defines the root path route ("/")
  root "announcemnts#index"
end
