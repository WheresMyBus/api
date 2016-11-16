class AffectedRoute < ApplicationRecord
  belongs_to :neighborhood_alert

  validates :neighborhood_alert, :route_id, presence: true
end
