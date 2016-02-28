Rails.application.routes.draw do
  devise_scope :user do
    get '/users/sign_up/:role' => 'devise/registrations#new'
  end

  devise_for :users, controllers: {registrations: "users/registrations"}
  resources :proposals
  resources :projects
  resources :teams
  root 'home#index'
  get 'proposals/:id/approve' => 'proposals#approve'
  get 'proposals/:id/deny' => 'proposals#deny'
  get 'proposals/:id/reset' => 'proposals#reset'

  scope '/api' do
  	resources :proposals, controller: 'proposal_api'
  	resources :projects, controller: 'project_api'
  	resources :teams, controller: 'team_api'
  end
end