Rails.application.routes.draw do
  get 'users/profile'
  devise_for :users, controllers: {
    sessions: 'users/sessions',
    registrations: 'users/registrations'
  }

  get 'u/:id', to: 'users#profile', as: 'user'

  root 'pages#index'
  get '/stats', to: 'pages#stats'
  get '/user' => "clients#index", :as => :user_root
  resources :clients

end
