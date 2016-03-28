Rails.application.routes.draw do

  root 'events#index'
  
  resources :venues
  
  # Nested Routes https://www.youtube.com/watch?v=vrH5UVcruyM
  resources :events do
    resources :ticket_types
  end

  get 'list', to: 'events#list'
  get 'myevents', to: 'events#myevents'

  resources :orders #was :tickets
  
  resources :users

  resources :sessions, only: [:new, :create, :destroy]
  get 'login', to: 'sessions#new', as: 'login'
  get 'logout', to: 'sessions#destroy', as: 'logout'
  delete 'logout' => 'sessions#destroy'

  # Omniauth stuff
  get 'auth/:provider/callback', to: 'sessions#create'
  get 'auth/failure', to: redirect('/')
  # get 'logout', to: 'sessions#destroy', as: 'logout'
  # get 'auth/:provider/callback', to: "sessions#create"
  # delete 'logout', to: "sessions#destroy", as: 'logout'

end
