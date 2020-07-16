Rails.application.routes.draw do
  devise_for :users, controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }
  root to: 'static_pages#home'
  get 'static_pages/about'
  get 'static_pages/help'
  resources :goals do
    resources :phases, only: [:index, :new, :create, :edit, :update, :destroy]
    resources :minds
  end
  resources :phases, only: [:show] do
    resources :tasks
    resources :comments
  end
  namespace :api do
    resources :tasks, only: :index, defaults: { format: 'json' }
  end
  namespace :api do
    resources :phases, only: :index, defaults: { format: 'json' }
  end
end
