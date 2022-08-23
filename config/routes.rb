Rails.application.routes.draw do
  devise_for :users
  root to: "pages#home"

  resources :profiles
  resources :bears do
    resources :bookings, only: %i[create destroy]
  end

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  # Defines the root path route ("/")
  # root "articles#index"
end
