Rails.application.routes.draw do
  root to: 'static_pages#home'
  get 'static_pages/about'
  get 'static_pages/help'
  devise_for :users, controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }
  resources :users do
    resources :goals, only: [:new, :create, :show, :edit, :update, :destroy]
  end

  resources :goals, only: [:index] do
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

  resources :teams do
    resources :projects, only: [:new, :create, :show, :edit, :update, :destroy]
  end

  resources :projects, only: [:index] do
    resources :project_phases, only: [:index, :new, :create, :edit, :update, :destroy]
  end

  resources :project_phases, only: [:show] do
    resources :project_tasks
    resources :project_comments
  end
end
