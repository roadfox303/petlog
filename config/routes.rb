Rails.application.routes.draw do
  root 'users#index'
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'

  resources :users do
    resources :bonds, only: [:create, :edit, :update, :destroy]
  end

  resources :pets do
    # member do
    #   get :bonds
    # end
    resources :bonds, only: [:create, :edit, :update, :destroy]
  end
end
