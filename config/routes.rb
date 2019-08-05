Rails.application.routes.draw do
  root 'posts#index'
  resources :sessions, only: [:new, :create, :destroy]
  resources :posts, only: [:new, :create, :index, :edit, :destroy, :update]
  resources :users, only: [:new, :create]
end
