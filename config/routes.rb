Rails.application.routes.draw do
  root "static_pages#index"
  get "contact", to: "static_pages#contact"
  get "signup", to: "users#new"
  resources :users, only: [:show, :create]
  namespace :admin do
    root "home#index", as: "root"
  end
end
