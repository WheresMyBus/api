Rails.application.routes.draw do
  concern :votable do
    member do
      post :upvote
      post :downvote
    end
  end

  resources :neighborhoods, only: %i(index show) do
    resources :neighborhood_alerts, only: %i(index create),
                                    path: :alerts,
                                    as: :alerts
  end

  resources :neighborhood_alerts, only: :show, concerns: :votable do
    resources :neighborhood_alert_comments, only: %i(index create),
                                            path: :comments,
                                            as: :comments
  end

  resources :routes, only: %i(index show) do
    get :bus_locations, on: :member

    resources :route_alerts, only: %i(index create),
                             path: :alerts,
                             as: :alerts
  end

  resources :route_alerts, only: :show, concerns: :votable do
    resources :route_alert_comments, only: %i(index create),
                                     path: :comments,
                                     as: :comments
  end

  resources :comments, only: :show, concerns: :votable
end
