Rails.application.routes.draw do
  get "users/new"

  root "static_pages#index"
  get "contact", to: "static_pages#contact"
end
