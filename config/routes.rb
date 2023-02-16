Rails.application.routes.draw do
  authenticated :user, ->(user) { user.admin? } do
    get 'admin', to: 'admin#index'
    get 'admin/clients'
    get 'admin/users'
    get 'users/profile'
  end
  devise_for :users, path: 'users', controllers: {
    sessions: 'users/sessions',
    registrations: 'users/registrations'
  }

  get 'u/:id', to: 'users#profile', as: 'user'

  root 'pages#index'
  get '/stats', to: 'pages#stats'
  get '/user' => "clients#index", :as => :user_root
  resources :clients

end
