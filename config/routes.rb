Rails.application.routes.draw do
  resources :neighborhoods, :routes, only: [:index, :show] do
    get :filter, on: :collection
    get :alerts, on: :member
  end
end
