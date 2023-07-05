Rails.application.routes.draw do
  devise_for :users
  resources :articles, only: %i[index show new create]
  resources :home, only: :index
  resources :posts
  root 'home#index'
end
