Rails.application.routes.draw do
  devise_for :users
  root to: "bears#index"

  resources :profiles
  resources :bears do
    resources :bookings, only: %i[create destroy]
    resources :favourites, only: %i[create]
  end

  resources :favourites, only: :destroy

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  # Defines the root path route ("/")
  # root "articles#index"
end
