Rails.application.routes.draw do
  resources :quotes
  
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
  delete "u/:id", to: "users#destroy"
  get '/user' => "clients#index", :as => :user_root
  resources :clients

  root 'pages#index'
  get '/stats', to: 'pages#stats'
  get 'quote', to: "pages#quote"
  get 'download', to: "pages#download"
  get 'preview', to: "pages#preview"
  get 'quote/pdf/:id', to: "quotes#pdf", as: 'quote_pdf'

end
