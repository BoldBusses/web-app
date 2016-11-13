Rails.application.routes.draw do
  get 'static/index'

  devise_for :guardians
  devise_for :school_admins
  devise_for :drivers

  resources :routes, shallow: true do
    resources :riderships, only: [:new, :create, :edit, :update, :destroy]
    resources :trips, only: [:index, :show, :create, :update, :destroy] do
      patch :complete, to: "trips#complete", on: :member
      resources :boarding_actions, only: [:create, :update]
    end
  end
  resources :students

  root to: "static#index"
end
