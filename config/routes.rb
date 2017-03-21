Rails.application.routes.draw do
  # Root path goes to home/index
  root 'home#index'

  # Routes for basic pages
  get 'home/about'
  get 'home/faq'
  get 'home/contact'

  # User routes
  resources :users, only: [:new, :create, :show]
end
