class NeighborhoodAlertSerializer < ActiveModel::Serializer
  attributes :id, :user_id, :alert_type, :description, :created_at

  belongs_to :neighborhood
end
