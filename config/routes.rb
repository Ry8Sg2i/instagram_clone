Rails.application.routes.draw do
  devise_for :users, controllers: { registrations: 'users/registrations' }
  resources :posts, only: %i[index show new create destroy] do
    scope module: :posts do
      resource :likes, only: %i[create destroy]
      resources :comments, only: %i[new create]
    end
  end
  resources :home, only: :index
  resource :profile, only: %i[show edit]
  root 'home#index'
end