Rails.application.routes.draw do
  root 'users#index'
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'
  resources :users, only: [:index, :create, :new]
  resources :users, path: '/', only: [:show, :edit, :update, :destroy]
end
