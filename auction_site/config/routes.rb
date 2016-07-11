Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get 'user/:id/', to: 'user#show'

  get 'user/new/', to: 'user#new'
  post 'user/new/', to: 'user#create'

  get "user/:id/product/new", to: 'product#new'
  get "user/:id/product/:product_id", to: 'product#new'

  post 'user/:id/product/new', to: 'product#create', as: :new_product
end
