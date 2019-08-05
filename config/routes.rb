Rails.application.routes.draw do
  resources :sessions
  resources :post, only: [:new, :create, :index]
  resources :user, only: [:new, :create]
  get 'sessions/delete'
end
