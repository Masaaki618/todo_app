Rails.application.routes.draw do
  root to: 'tasks#index'
  resources :tasks do
    post :confirm, action: :confirm_new, on: :new
    post :import, on: :collection
  end

  get 'sign_up', to: 'users#new'
  post 'sign_up', to: 'users#create'

  get 'login', to: 'user_sessions#new'
  post 'login', to: 'user_sessions#create'

  delete 'logout', to: 'user_sessions#destroy' # 追記
end
