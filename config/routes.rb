Rails.application.routes.draw do
  get 'toppages_show', to: 'toppages#show'
  
  root to: 'toppages#index'
  resources :toppages, only: [:index, :show]
  
  resources :restaurants, only: [:index] do
    resources :likes, only: [:show, :new, :create, :destroy]
    member do 
      get :followers
      get :reviewers
    end
  end
  
  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy'
  
  resources :users, only: [:index, :show, :new, :create, :edit, :update] do
    member do
      get :approvings
      get :reviewings
    end
  end
  
  resources :favorites, only: [:create, :destroy]
  
end
