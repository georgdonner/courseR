Rails.application.routes.draw do
  devise_for :users
  resources :courses, only: [ :index, :show, :new, :delete, :edit ]
  resources :lecturers, only: [ :index ]
  resources :subjects, only: [ :index, :show ]
  root 'subjects#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
