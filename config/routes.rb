Rails.application.routes.draw do
  devise_for :guardians
  devise_for :school_admins
  devise_for :drivers

  resources :routes, shallow: true do
    resources :trips, only: [:show, :create, :update, :destroy] do
      patch :complete, to: "trips#complete", on: :member
      resources :boarding_actions, only: [:create, :update]
    end
  end
  resources :students

  root to: "routes#index"
end
