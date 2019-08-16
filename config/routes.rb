Rails.application.routes.draw do


  get 'eventavatars/create'
  devise_for :users
  root "events#index"
  resources :events do 
    resources :attendances
  end
  resources :events do
    resources :eventavatars, only: [:create, :new]
  end
  resources :users

  namespace :admin do
    resources :users, :events 
  end
  

end
