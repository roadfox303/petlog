Rails.application.routes.draw do
  root 'pets#index'
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'
  # post '/users/:id/follower', to: 'users#follower'

  resources :users, except: [:index] do
    member do
      get :bonds
      get :follower
      get :following
    end
  end

  resources :relationships, only: [:create, :update, :destroy]

  resources :pets do
    member do
      get :bonds
    end
    resources :contents, only: [:index] do
      resources :records, only: [:new, :create, :destroy]
    end
    resources :record_categories, except: [:show]
  end


  resources :bonds, only: [:create, :edit, :update, :destroy]
end
