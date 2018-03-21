Rails.application.routes.draw do

  get 'home/index', to: 'home#index', as: 'home'
  root to: 'home#index'

  resources :users, :except => [:index]
  resources :projects
  resources :sessions, :only => [:new, :create, :destroy]
  resources :bugs

  #put 'solve/:id', to: 'bugs#solve', as: 'solve'

  get 'signup', to: 'users#new', as: 'signup'
  get 'login', to: 'sessions#new', as: 'login'
  get 'logout', to: 'sessions#destroy', as: 'logout'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
