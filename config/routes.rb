Rails.application.routes.draw do
  resources :tags
  devise_for :users, controllers: {
    confirmations: 'confirmations'
  }
  resources :groups do
    member do
      get 'join'
      get 'leave'
    end
  end
  resources :comments
  #resources :recipes
  resources :meals
  resources :dashboard
  resources :tags
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  get 'home/index'
  root 'home#index'
  get '/search', to: "meals#search"

end
