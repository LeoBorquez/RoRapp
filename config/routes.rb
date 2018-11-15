Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  #
  get 'pages/index'
  get 'products/index'

  resources :products
  resources :categorys
  resources :users

  root 'pages#index'

  #resource equal to model, is a rest resource is ALWAYS in PLURAL (resources)
end
