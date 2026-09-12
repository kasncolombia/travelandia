Rails.application.routes.draw do
  root "home#dashboard"

  get "landing", to: "home#landing"
  get "destinos", to: "destinations#index"
  get "destinos/:slug", to: "destinations#show", as: :destination
  get "planificador", to: "planner#index"

  # Auth Routes
  get "login", to: "sessions#new", as: :login
  post "login", to: "sessions#create"
  get "login/guest", to: "sessions#guest", as: :guest_login
  post "login/guest", to: "sessions#guest"
  get "logout", to: "sessions#destroy", as: :logout
  delete "logout", to: "sessions#destroy"

  get "registro", to: "registrations#new", as: :registro
  post "registro", to: "registrations#create"

  get "hoteles", to: "hotels#index"
  get "hoteles/:slug", to: "hotels#show", as: :hotel

  # Profile
  get "perfil", to: "profile#show"

  # Blog
  get "blog", to: "blog#index"
  get "blog/:slug", to: "blog#show", as: :article

  resources :categories, only: [:index, :show], param: :slug do
    get ":slug", to: "categories#subcategory", as: :subcategory
  end

  get "up" => "rails/health#show", as: :rails_health_check
end
