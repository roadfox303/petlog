Rails.application.routes.draw do
  root 'pets#index'
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'

  resources :users do
    member do
      get :bonds
    end
    member do
      get :relationships
    end
  end

  resources :relationships, only: [:create, :destroy]

  resources :pets do
    member do
      get :bonds
    end
  end

  resources :bonds, only: [:create, :edit, :update, :destroy]
end
