Rails.application.routes.draw do
  get '/lists', to: 'lists#index'
  get '/users/:id/lists'. to 'list#show'
  get 
end
