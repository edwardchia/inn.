Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :sessions
  resources :bookings
  resources :listings 
  resources :users, only: [:new, :create]
  get("/", to: "welcome#home", as: :root)
end
