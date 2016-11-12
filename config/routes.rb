Rails.application.routes.draw do
  devise_for :guardians
  devise_for :school_admins
  devise_for :drivers
  resources :students
  resources :boarding_actions
  resources :riderships
  resources :trips
  resources :routes

  root to: "trips#index"
end
