BabyNamer::Application.routes.draw do
  root to: 'baby_names#index'

  resources :baby_names
  resources :users, except: :destroy
  resources :sessions, only: [:new, :create]
  delete    '/sessions/', to: 'sessions#destroy', as: :session
end
