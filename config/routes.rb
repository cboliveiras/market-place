Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :places do
    resources :reservations, only: [:create]
  end
  resources :reservations, only: [:destroy]

  # FALTA ADICIONAR ROTA DO PROFILE
  get 'my_places', to: 'pages#test'
  # places#myplaces
  get 'my_reservations', to: 'pages#test'
  # reservations#myreservations
end
