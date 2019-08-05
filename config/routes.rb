Rails.application.routes.draw do
  resources :sessions
  resources :posts, only: [:new, :create, :index]
  resources :users, only: [:new, :create]
  get 'sessions/delete'
end
