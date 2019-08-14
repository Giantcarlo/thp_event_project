Rails.application.routes.draw do

  get 'attendances/new'
  get 'attendances/create'
  get 'attendances/show'
  devise_for :users
  root "events#index"
  resources :events
  resources :users

end
