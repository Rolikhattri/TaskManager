Rails.application.routes.draw do
  resources :tasks
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  devise_for :users
  root  "tasks#index"
  resources :teams
  resources :employees

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
