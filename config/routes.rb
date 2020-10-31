Rails.application.routes.draw do
  devise_for :users
  root to: 'places#home'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :places do
    resources :reservations, only: [:create]
    resources :reviews, only: [:new, :create]
  end
  resources :reservations, only: [:destroy]

  get 'my_places', to: 'places#my_places'
  get 'my_reservations', to: 'reservations#my_reservations'
end
