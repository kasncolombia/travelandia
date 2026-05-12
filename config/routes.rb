Rails.application.routes.draw do
  root "home#dashboard"

  get "landing", to: "home#landing"
  get "destinos", to: "destinations#index"
  get "destinos/:slug", to: "destinations#show", as: :destination
  get "planificador", to: "planner#index"

  # Auth
  get "login", to: "sessions#new"
  get "registro", to: "registrations#new"

  # Profile
  get "perfil", to: "profile#show"

  # Blog
  get "blog", to: "blog#index"
  get "blog/:slug", to: "blog#show", as: :article

  resources :categories, only: [:index, :show], param: :slug
  get "up" => "rails/health#show", as: :rails_health_check
end
