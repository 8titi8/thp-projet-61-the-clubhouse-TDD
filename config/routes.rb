Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: 'static_pages#home', as: :home
  get 'signup', to: 'users#new', as: :signup
  post 'signup', to: 'users#create', as: :signin
  get 'users/:id/edit', to: 'users#edit', as: :edit_user
  patch 'users/:id/edit', to: 'users#update', as: :update_user
  get 'login', to: 'sessions#new', as: :login
  post 'login', to: 'sessions#create', as: :loggedin
  delete 'logout', to: 'sessions#destroy', as: :logout
  resources :users
end
