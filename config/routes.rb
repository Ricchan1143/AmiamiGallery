Rails.application.routes.draw do
  devise_for :users
  resources :users do
    member do
      get :likes
    end
  end

  resources :users, only: [:destroy]
  
  resources :items do
    resources :likes, only: [:create, :destroy]
    resources :comments, only: [:create, :destroy]
    
  end
   get 'users/show' => 'users#show'

  resources :blogs

  get 'pages'=> 'pages#index'
  get 'pages/about' => 'pages#about'
  root 'pages#index'
end
