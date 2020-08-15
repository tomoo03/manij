Rails.application.routes.draw do
  devise_for :users, controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }
  root 'goals#index'
  resources :static_pages do
    collection do
      get 'about'
      get 'help'
    end
  end

  resources :users do
    resources :goals, only: [:create, :show, :edit, :update, :destroy]
  end

  resources :goals, only: [:new, :index] do
    resources :phases, only: [:index, :new, :create, :edit, :update, :destroy]
    resources :minds
  end

  resources :phases, only: [:show] do
    resources :tasks
    resources :comments
  end

  resources :tasks do
    collection do
      get 'change_task_flg'
    end
  end

  namespace :api do
    resources :phases, only: [:index, :edit, :update], defaults: { format: 'json' }
  end

  resources :teams do
    resources :projects, only: [:new, :create, :show, :edit, :update, :destroy]
  end

  resources :projects, only: [:index] do
    resources :project_phases, only: [:index, :new, :create, :edit, :update, :destroy]
    resources :project_minds
  end

  resources :project_phases, only: [:show] do
    resources :project_tasks
    resources :project_comments
  end

  resources :project_tasks do
    collection do
      get 'change_task_flg'
    end
  end

  namespace :api do
    resources :project_phases, only: :index, defaults: { format: 'json' }
  end
end
