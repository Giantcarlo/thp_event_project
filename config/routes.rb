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

  scope 'superadmin', module: 'admin', as: 'admin' do
    resources :users
    resources :events
  end
  

end
