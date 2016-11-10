Rails.application.routes.draw do
  concern :filterable do
    get :filter, on: :collection
  end

  resources :neighborhoods, only: %i(index show), concerns: :filterable do
    resources :neighborhood_alerts, only: %i(index create),
                                    path: :alerts,
                                    as: :alerts
  end

  resources :neighborhood_alerts, only: :show do
    resources :neighborhood_alert_comments, only: %i(index create),
                                            path: :comments,
                                            as: :comments
  end

  resources :neighborhood_alert_comments, only: :show

  resources :routes, only: %i(index show), concerns: :filterable do
    resources :route_alerts, only: %i(index create),
                             path: :alerts,
                             as: :alerts
  end

  resources :route_alerts, only: :show do
    resources :route_alert_comments, only: %i(index create),
                                     path: :comments,
                                     as: :comments
  end

  resources :route_alert_comments, only: :show
end
