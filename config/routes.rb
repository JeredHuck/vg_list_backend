Rails.application.routes.draw do
  resources :lists, only: [:show, :update, :destroy]

  resources :users do
    resources :lists, only: :[:index, :create]
  end
end
