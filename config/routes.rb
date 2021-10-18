Rails.application.routes.draw do
  devise_for :users
  resources :groups
  resources :comments
  #resources :recipes
  resources :meals
  resources :dashboard
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  get 'home/index'
  root 'home#index'

end
