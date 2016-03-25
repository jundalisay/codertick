Rails.application.routes.draw do

  resources :ticket_types
  resources :venues
  root 'events#index'
  resources :events
  resources :orders #was :tickets
  
  resources :users

  resources :sessions, only: [:new, :create, :destroy]
  get 'login', to: 'sessions#new', as: 'login'
  get 'logout', to: 'sessions#destroy', as: 'logout'
  delete 'logout' => 'sessions#destroy'

end
