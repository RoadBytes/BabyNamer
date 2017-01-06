BabyNamer::Application.routes.draw do
  get 'baby_name_users/create'

  get 'baby_name_users/destroy'

  root to: 'baby_names#index'

  resources :baby_names
  resources :users, except: :destroy
  resources :sessions, only: [:new, :create]
  resources :votes, only: :create
  resources :comments, only: :create
  delete    '/sessions/', to: 'sessions#destroy', as: :session
end
