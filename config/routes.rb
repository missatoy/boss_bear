Rails.application.routes.draw do
  devise_for :users
  root to: "pages#home"
  resources :bears
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  get "profiles/:id", to: "profiles#show"
  # Defines the root path route ("/")
  # root "articles#index"
end
