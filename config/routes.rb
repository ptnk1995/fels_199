Rails.application.routes.draw do
  root "static_pages#index"
  get "contact", to: "static_pages#contact"
end
