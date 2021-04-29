Rails.application.routes.draw do
  
  resources :club_users
  resources :club_books
  resources :users
  get "/signup", to: "users#new" 
  post "/signup", to: "users#create"
  get "/login", to: "sessions#new" 
  post "/login", to: "sessions#create"
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root 'static#home'

  resources :clubs
  resources :books
  
end