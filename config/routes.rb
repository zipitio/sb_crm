Rails.application.routes.draw do
  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root 'pages#index'
  get '/stats', to: 'pages#stats'
  get '/user' => "clients#index", :as => :user_root
  resources :clients

end
