Rails.application.routes.draw do
  devise_for :users, controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }
  root to: 'static_pages#home'
  get 'static_pages/about'
  get 'static_pages/help'
  resources :goals
end
