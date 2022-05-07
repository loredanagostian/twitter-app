Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"

  root 'application#helloblabla'

  # get 'alta_ruta', to: 'application#alta_ruta'
  # get 'create_user', to: 'application#create_user'
  # get 'main_menu', to: 'application#main_menu'
  #
  # get 'users', to: 'users#index'
  # get 'users/new', to: 'users#new'
  # get 'users/:id', to: 'users#show'
  # post 'users', to: 'users#create'

  resources :users

  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  get 'logout', to: 'sessions#destroy'
end
