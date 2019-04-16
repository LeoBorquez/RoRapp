Rails.application.routes.draw do
  get 'sessions/new'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  #
  get 'pages/index'
  get 'products/index'  #GET because is a get request
  get 'users/index'

  get 'contact', to: 'pages#contact' #admin layout, pages only for admin
  get 'signup', to: 'users#new'
  post 'signup', to: 'users#create'

  get 'login', to: 'sessions#new'
  get 'logout', to: 'sessions#destroy'
  post 'login', to: 'sessions#create'




  resources :products
  resources :categorys
  resources :users
  resources :sessions

  root 'pages#index'

  #resource equal to model, is a rest resource is ALWAYS in PLURAL (resources)
end
