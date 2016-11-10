class RouteAlertSerializer < ActiveModel::Serializer
  attributes :id, :user_id, :alert_type, :description, :route_id, :created_at
end
