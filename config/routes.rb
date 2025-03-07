Rails.application.routes.draw do
  get 'reviews/new'
  devise_for :users
  root to: "pages#home"

  get 'dashboard', to: "pages#dashboard"
  get 'dreamsdashboard', to: "pages#dreamsdashboard"
  get 'bookingsdashboard', to: "pages#bookingsdashboard"


  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  resources :dreams do
    resources :bookings, only: [:create]
  end

  resources :bookings
  patch 'accept/:id', to: "bookings#accept", as: :accept
  patch 'decline/:id', to: "bookings#decline", as: :decline



  resources :dreams do
    resources :reviews, only: [:create, :new]
  end
  # Defines the root path route ("/")
  # root "posts#index"
end
