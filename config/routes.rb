Rails.application.routes.draw do
  devise_for :users
  resources :pacients
  resources :card_pacients
  resources :specials
  resources :vraches
  resources :otdelenies
  resources :klinikas
  get "/", to: "mains#main"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
