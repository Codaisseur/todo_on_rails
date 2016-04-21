Rails.application.routes.draw do
  root 'todos#index'
  resources :todos, only: [:create, :update, :destroy]
end
