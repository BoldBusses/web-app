Rails.application.routes.draw do
  resources :students
  resources :boarding_actions
  resources :riderships
  resources :trips
  resources :routes
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
