Rails.application.routes.draw do
  get 'users/index'
  resources :tags
  devise_for :users, controllers: {
    confirmations: 'confirmations'
  }
  resources :groups do
    member do
      post 'join'
      get 'leave'
    end
  end
  resources :comments
  #resources :recipes
  resources :meals do
    resources :comments
  end
  resources :dashboard

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  get 'home/index'
  root 'home#index'
  get '/search', to: "meals#search"
  match '/users',   to: 'users#index',   via: 'get'
  get '/users/:id/approve', to:'users#approve_user', as: 'approve_user'
  get '/users/:id/disapprove', to: 'users#disapprove_user', as: 'disapprove_user'



end
