Rails.application.routes.draw do

  root "static_pages#index"
  get "contact", to: "static_pages#contact"
  get "signup", to: "users#new"
  get "login", to: "sessions#new"
  post "login", to: "sessions#create"
  delete "logout", to: "sessions#destroy"
  resources :users, expect: [:destroy]
  namespace :admin do
    root "home#index", as: "root"
  end
end
