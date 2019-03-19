Rails.application.routes.draw do
  get 'sessions/new'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  #
  get 'pages/index'
  get 'products/index'  #GET because is a get request
  get 'users/index'

  get 'admin/contact', to: 'pages#contact' #admin layout, pages only for admin
  get 'admin/signup', to: 'users#new'
  post 'admin/signup', to: 'users#create'

  get 'admin/login', to: 'sessions#new'
  get 'admin/logout', to: 'sessions#destroy'
  post 'admin/login', to: 'sessions#create'




  resources :products
  resources :categorys
  resources :users
  resources :sessions

  root 'pages#index'

  #resource equal to model, is a rest resource is ALWAYS in PLURAL (resources)
end
