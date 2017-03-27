Rails.application.routes.draw do
  devise_for :users
  # Route root path thru the home controller to the index page
  root 'home#index'

  # Other HomeController routes
  get 'about' => 'home#about'
  get 'faq' => 'home#faq'
  get 'contact' => 'home#contact'

  # Wiki routes, standard CRUD routes
  resources :wikis
end
