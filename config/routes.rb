Rails.application.routes.draw do

  get 'auth/google_oauth2/callback', to: 'sessions#omniauth'
  
  root 'static#home'
  resources :users, :only => [:new]
  resources :clubs do 
    resources :books, :only => [:new, :index, :show]
  end
  resources :books
  resources :club_users
  
  get "/your_clubs", to: "clubs#your_clubs"
  get "/signup", to: "users#new"
  post "/signup", to: "users#create"
  get "/login", to: "sessions#new" 
  post "/login", to: "sessions#create"
  delete "/logout", to: "sessions#destroy", as: "destroy"
  get "/books/recent_books", to: "books#recent_books", as: "recent_books"
  
end