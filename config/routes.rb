Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'pages#index'

  get 'pages/index'
  get 'products/new'
  get 'products/show'


  resource :products
  resource :products_comment
  resource :categorys


  #resource equal to model, is a rest resource
end
