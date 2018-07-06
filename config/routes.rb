Rails.application.routes.draw do
  root to: 'home#index'
  resources :users, only: %i[create]
  get '/create-account', to: 'users#new', as: 'new_user'
  resources :sessions, only: %i[create new]
  get '/logout', to: 'sessions#destroy', as: 'logout'
  get '/chatroom', to: 'chatroom#index', as: 'chatroom'
end
