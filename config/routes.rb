Rails.application.routes.draw do
  devise_for :users
  resources :proposals
  resources :projects
  resources :teams
  root 'home#index'
end