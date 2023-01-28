Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root 'pages#index'
  get '/stats', to: 'pages#stats'

  resources :clients, only: [:show, :index]
end
