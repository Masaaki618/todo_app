Rails.application.routes.draw do
  root to: 'tasks#index'
  resources :tasks

  get 'sign_up', to: 'users#new'
  post 'sign_up', to: 'users#create'
end
