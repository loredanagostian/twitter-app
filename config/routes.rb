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

  resources :users do
    member do
      get :following, :followers
    end
  end
  resources :posts

  resources :posts do
    resources :comments
  end

  resources :relationships, only: [:create, :destroy]

  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy'

  get 'users/:id/following', to: 'users#following'
  get 'users/:id/followers', to: 'users#followers'

  get 'statistics', to: 'users#statistics'
  post 'update/:id', to: 'users#update'
end
