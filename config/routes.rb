Rails.application.routes.draw do
  devise_for :users, controllers: {
    sessions: "users/sessions",
    registrations: "users/registrations",
    passwords: "users/passwords",
    confirmations: "users/confirmations",
    unlocks: "users/unlocks"
    # omniauth_callbacks: "users/omniauth_callbacks"
  }
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  namespace :api do
    namespace :v1 do

      # Public routes - accessible to everyone
      resources :portfolios, only: [ :index, :show ] do
        resources :projects, only: [ :index, :show ]
        resources :ideas, only: [ :index, :show ]
      end
      resources :projects, only: [ :index, :show ]
      resources :ideas, only: [ :index, :show ]

      # Protected routes - requires authentication
      namespace :me do
        # Current user's portfolio management
        resource :portfolio, only: [ :show, :update ] do
          resources :projects, only: [ :index, :create, :show, :update, :destroy ]
          resources :ideas, only: [ :index, :create, :show, :update, :destroy ]
        end

        # Current user's reactions to ideas
        resources :reactions, only: [ :create, :show, :update, :destroy ]

      end

      namespace :admin do

        # Admin-only routes
        resources :users, only: [ :index, :show, :update, :destroy ]
        resources :portfolios, only: [ :index, :show, :update ]
        resources :projects, only: [ :index, :show, :update, :destroy ]
        resources :ideas, only: [ :index, :show, :update, :destroy ]
        resources :reactions, only: [ :index, :show, :update, :destroy ]
      end

    end
  end

end
