Rails.application.routes.draw do
  devise_for :users
  root to: "cocktails#index"
  resources :cocktails, only: %i[index show new create destroy] do
    resources :bookings, only: %i[new create]
  end
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  resources :bookings, only: %i[destroy show]
end
