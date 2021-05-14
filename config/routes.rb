Rails.application.routes.draw do

  get "/your_clubs", to: "clubs#your_clubs"
  get "/signup", to: "users#new"
  post "/signup", to: "users#create"
  get "/login", to: "sessions#new" 
  post "/login", to: "sessions#create"
  delete "/logout", to: "sessions#destroy", as: "destroy"
  get "/books/recent_books", to: "books#recent_books", as: "recent_books"
  get 'auth/google_oauth2/callback', to: 'sessions#omniauth'
  
  root 'static#home'
  resources :sessions
  resources :users
  resources :clubs do
    resources :books
  end
  resources :books
  resources :club_users
  
end