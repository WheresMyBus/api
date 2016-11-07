Rails.application.routes.draw do
  resources :neighborhoods, only: [:index, :show] do
    get :filter, on: :collection
  end

  resources :routes, only: [:index]
end
