class NeighborhoodAlert < ApplicationRecord
  include Alertable

  serialize :affected_routes, Array

  belongs_to :neighborhood

  validates :neighborhood, presence: true

  def routes_affected
    affected_routes.map do |route_id|
      Route.find route_id
    end
  end
end
