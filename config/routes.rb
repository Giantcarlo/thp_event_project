Rails.application.routes.draw do
  root "event#index"
  # get 'event/index'
  resources :events

end
