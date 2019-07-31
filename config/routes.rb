Rails.application.routes.draw do
  resources :sessions
  get 'sessions/delete'
end
