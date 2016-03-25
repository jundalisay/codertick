Rails.application.routes.draw do

  resources :users
  root 'events#index'

  resources :events do
    resources :tickets
  end

  resources :sessions, only: [:new, :create, :destroy]
  get 'login', to: 'sessions#new', as: 'login'
  get 'logout', to: 'sessions#destroy', as: 'logout'
  delete 'logout' => 'sessions#destroy'

end
