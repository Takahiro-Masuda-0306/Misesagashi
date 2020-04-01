Rails.application.routes.draw do
  get 'likes/index'
  get 'likes/create'
  get 'likes/destroy'
  get 'favorites/create'
  get 'favorites/destroy'
  get 'users/show'
  get 'users/new'
  get 'users/create'
  get 'users/edit'
  get 'users/update'
  get 'sessions/new'
  get 'sessions/create'
  get 'sessions/destroy'
  get 'restaurants/index'
  get 'toppages/index'
  get 'toppages/show'
  root to: 'toppages#index'
  resources :toppages, only: [:index, :show]
  
  resources :restaurants, only: [:index] do
    resources :likes, only: [:new, :create, :destroy]
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
