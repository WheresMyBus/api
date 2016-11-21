class RouteAlert < ApplicationRecord
  include Alertable

  validates :route_id, presence: true
end
