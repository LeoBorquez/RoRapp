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
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  get '/logout', to: 'sessions#destroy'

  resources :products
  resources :categorys
  resources :users

  root 'pages#index'

  #resource equal to model, is a rest resource is ALWAYS in PLURAL (resources)
end
