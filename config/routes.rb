Rails.application.routes.draw do
  get 'goals/new'
  get 'goals/index'
  get 'goals/show'
  devise_for :users, controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }
  root 'static_pages#home'
  get 'static_pages/about'
  get 'static_pages/help'
end
