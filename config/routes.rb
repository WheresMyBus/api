Rails.application.routes.draw do
  resources :neighborhoods do
    get :filter, on: :collection
  end
end
