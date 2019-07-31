Rails.application.routes.draw do
  resources :sessions
  resources :post, only: [:new, :create, :index]
  get 'sessions/delete'
end
