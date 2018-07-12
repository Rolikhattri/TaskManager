Rails.application.routes.draw do

  root  "tasks#index"
  resources :tasks do
     get 'complete_task'
     get 'assign_task'
     
  end
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  devise_for :users
  
  resources :teams
  resources :employees

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
