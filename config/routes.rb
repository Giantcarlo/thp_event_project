Rails.application.routes.draw do
  devise_for :users
  root "event#index"
  # get 'event/index'
  resources :events

end
