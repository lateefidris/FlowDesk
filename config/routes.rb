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

  get '/client_bookings/:id', to: 'bookings#client_show', as: 'client_booking'


  resources :desks, except: :show

  
  get "$/:desk_name", to: "desks#store", as: :desk_profile
  #, constraints: { desk_name: /[a-zA-Z0-9_-]+/ }
  get "$/:desk_name/:service_name", to: "desks#service", as: :desk_service

  #, constraints: { desk_name: /[a-zA-Z0-9_-]+/, service_name: /[a-zA-Z0-9_-]+/ }

  # This ensures these routes do not interfere with other paths that could be added later
end
