Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  get 'log_out', to: 'sessions#destroy', as: 'log_out'
  get 'log_in', to: 'sessions#new', as: 'log_in'
  get 'sign_up', to: 'users#new', as: 'sign_up'
  root 'movies#index'
  resources :users, only: [:create]
  resources :sessions, only: [:create]
  resources :movies do
    resources :opinions, only: [:create]
  end
  resources :directors, except: [:show, :new]
  resources :writers, except: [:show, :new]
end
