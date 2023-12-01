Rails.application.routes.draw do
  devise_for :users, controllers: {      
    omniauth_callbacks: 'users/omniauth_callbacks'
    # registrations: 'users/registrations',
    # confirmations: 'users/confirmations'
  }
  
  # namespace :users do
  #   resources :confirmation_codes, only: [:new, :create]
  # end

  # get 'confirmation_codes/new', to: 'confirmation_codes#new', as: :new_confirmation

  resources :events do
    get 'expire_events', on: :collection
    resources :enrollments
    resources :reviews 
  end

  # get '/user' => "welcome#index", :as => :user_root
  resources :users
  resources :reviews 
  resources :enrollments
  resources :reviews, only: [:new, :create]

  # Sidekiq
  require 'sidekiq/web'
  mount Sidekiq::Web => '/sidekiq'

  root 'home#index'
  get '/search', to: 'events#search'
  get 'home/eventing', to: 'home#eventing'
  get 'home/email_code_verification', to: 'home#email_code_verification'

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check
end



