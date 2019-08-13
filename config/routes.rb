Rails.application.routes.draw do
  devise_for :users
  root "event#index"
  resources :events
end
