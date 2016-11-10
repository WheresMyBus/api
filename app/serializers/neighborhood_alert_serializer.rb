class NeighborhoodAlertSerializer < ActiveModel::Serializer
  attributes :id, :user_id, :alert_type, :description, :neighborhood_id, :created_at
end
