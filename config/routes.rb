Rails.application.routes.draw do
  resources :quotes
  
  authenticated :user, ->(user) { user.admin? } do
    get 'admin', to: 'admin#index'
    get 'admin/clients'
    get 'admin/users'
    get 'users/profile'
    get 'acc/:id/edit', to: 'admin_company_contacts#edit', as: "edit_acc"
    patch 'acc/:id', to: 'admin_company_contacts#update'
  end

  devise_for :users, path: 'users', controllers: {
    sessions: 'users/sessions',
    registrations: 'users/registrations'
  }

  get 'u/:id', to: 'users#profile', as: 'user'
  delete "u/:id", to: 'users#destroy'
  get '/user' => "clients#index", :as => :user_root

  #created to filter clients in the table
  resources :clients do
    collection do
      get 'list'
    end
  end

  #send emails to clients
  get 'clients/:id/send_welcome', to: 'clients#welcome'
  get 'clients/:id/send_quote', to: 'clients#send_quote'

  #pages roots with quotes
  root 'pages#index'
  get '/stats', to: 'pages#stats'
  get 'quote', to: "pages#quote"
  get 'download', to: "pages#download"
  get 'preview', to: "pages#preview"
  get 'quote/pdf/:id', to: "quotes#pdf", as: 'quote_pdf'

end
