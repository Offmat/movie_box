Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'movies#index'
  resources :movies
  resources :directors, only: [:create, :destroy]
  resources :writers, only: [:create, :destroy]
end
