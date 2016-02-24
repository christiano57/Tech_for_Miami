Rails.application.routes.draw do
  resources :proposals
  resources :projects
  resources :teams
  root 'home#index'
end