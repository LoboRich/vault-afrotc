Rails.application.routes.draw do
  resources :inhouse_loan_items
  resources :inhouse_loans do
    collection do
      get 'compute_equity_monthly_amort'
    end
    member do
      get 'pay'
      post 'process_pay'
    end
  end
  resources :purchasers
  get 'histories', to: 'history#index', as: :histories
  resources :water_bills do
    member do
      get 'pay'
      post 'process_pay'
    end
    collection do
      get 'download_excel'
    end
  end
  resources :payment_histories
  resources :loans do
    collection do
      get 'compute_monthly_amort'
      get 'check_parcel_price'
    end
    member do
      get 'pay'
      post 'process_pay'
    end
  end

  resources :subdivisions
  resources :parcels do
    member do
      get 'new_purchaser'
    end
  end

  resources :clients
  devise_for :users, 
    path: 'auth', 
    path_names: {
      sign_in: 'login',
      sign_out: 'logout',
      password: 'secret',
      confirmation: 'verification',
      unlock: 'unblock',
      registration: 'register',
      sign_up: 'new_user'
    },
    controllers: {
      sessions: 'users/sessions'
    }

  get 'home/index'
  resources :manage_users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Defines the root path route ("/")
  root "home#index"
end
