Rails.application.routes.draw do
  root 'home#show'
  resources :availabilities
  resources :bookings
  resources :services
  resources :categories
  resources :desks
  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end