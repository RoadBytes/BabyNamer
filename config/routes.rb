BabyNamer::Application.routes.draw do
  root to: 'baby_names#index'

  resources :baby_names
  resources :users, except: :destroy
end
