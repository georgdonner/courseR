Rails.application.routes.draw do
  devise_for :users
  resources :courses, only: [ :index, :show, :new ]
  resources :lecturers, only: [ :index ]
  resources :subjects, only: [ :index, :show, :new ]
  resources :ratings, only: [ :index, :show, :new, :edit ]
  root 'subjects#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
