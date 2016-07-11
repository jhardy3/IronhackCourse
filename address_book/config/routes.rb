Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get '/contact/new', to: 'contact#new', as: :new_contact

  get '/contacts', to: 'contact#index'

  get '/contact/show/:id', to: 'contact#show', as: :show_contact

  post '/contacts', to: 'contact#create'
end
