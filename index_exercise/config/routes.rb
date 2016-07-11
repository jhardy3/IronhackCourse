Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  get '/ironhack/'

  get '/ironhack/new', to: 'project#new'
  get '/ironhack/:id', to: 'project#show'

  post '/ironhack' to: 'project#create'
end
