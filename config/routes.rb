Rails.application.routes.draw do
  get 'sessions/new'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html


  get 'contact', to: 'pages#contact' #admin layout, pages only for admin
  get 'help', to: 'pages#help' #GET because is a get request

  get 'signup', to: 'users#new'

  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy'


  resources :users
  resources :sessions
  resources :account_activations, only: [:edit]

  root 'pages#index'


  #resource equal to model, is a rest resource is ALWAYS in PLURAL (resources)
end

