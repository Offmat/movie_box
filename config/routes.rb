Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'movies#index'
  resources :movies do
    resources :movies_directors, only: [:destroy]
  end
  resources :directors, only: [:create]
end
