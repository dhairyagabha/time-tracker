Rails.application.routes.draw do

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  # Devise Users
  devise_for :users
  authenticated :user do
    root 'timers#index', as: :authenticated_root
  end
  root to:'home#index'

  devise_scope :user do
    match 'users/:id' => 'registrations#show', via: :get
  end

  resources :projects
  resources :clients
  resources :workspaces
  resources :timers


end
