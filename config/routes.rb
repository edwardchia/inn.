Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  
  resources :charges
  resources :sessions
  resources :bookings
  resources :listings 
  resources :users, only: [:new, :show, :create, :edit, :update, :index]
  get("/", to: "welcome#home", as: :root)
end
