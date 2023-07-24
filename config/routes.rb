Rails.application.routes.draw do
  devise_for :users, controllers: { registrations: 'users/registrations' }
  resources :posts, only: %i[index show new create destroy]
  resources :home, only: :index
  resource :profile, only: %i[show edit]
  root 'home#index'
end
