Rails.application.routes.draw do
  concern :filterable do
    get :filter, on: :collection
  end

  resources :neighborhood_alerts, only: :show
  resources :neighborhoods, only: %i(index show), concerns: :filterable do
    resources :neighborhood_alerts, only: %i(index create), path: :alerts, as: :alerts
  end

  resources :route_alerts, only: :show
  resources :routes, only: %i(index show), concerns: :filterable do
    resources :route_alerts, only: %i(index create), path: :alerts, as: :alerts
  end
end
