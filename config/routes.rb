Rails.application.routes.draw do
  resources :club_users
  resources :club_books
  resources :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root 'static#home'

  resources :clubs
  resources :books
  
end