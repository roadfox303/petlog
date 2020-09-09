Rails.application.routes.draw do
  root 'pets#index'
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'
  # post '/users/:id/follower', to: 'users#follower'

  resources :users do
    member do
      get :bonds
      get :follower
      # post :follower
      get :following
      # post :follow_create
    end
  end

  resources :relationships, only: [:create, :update, :destroy]

  resources :pets do
    member do
      get :bonds
    end
    resources :contents do
      member do
        get :create_records
      end
      resources :records
    end
  end
  resources :record_categories

  resources :bonds, only: [:create, :edit, :update, :destroy]
end
