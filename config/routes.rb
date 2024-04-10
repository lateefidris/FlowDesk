Rails.application.routes.draw do
  root "home#show"
  devise_for :users

  resources :availabilities
  resources :services
  resources :categories do
    member do
      get "services", to: "categories#services", as: "category_services"
    end
  end
  
  resources :bookings do
    member do
      patch "confirm"
      patch "complete"
    end
  end

  resources :desks, except: :show

  # Place this wildcard route at the very end to prevent it from hijacking other routes
  get "/:desk_name", to: "desks#store", as: :desk_profile
end
