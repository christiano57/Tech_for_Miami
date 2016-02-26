Rails.application.routes.draw do
  devise_for :users
  resources :proposals
  resources :projects
  resources :teams
  root 'home#index'
  get 'proposals/:id/approve' => 'proposals#approve'
  get 'proposals/:id/deny' => 'proposals#deny'
  get 'proposals/:id/reset' => 'proposals#reset'
end