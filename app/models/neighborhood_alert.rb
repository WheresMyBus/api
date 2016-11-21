class NeighborhoodAlert < ApplicationRecord
  include Alertable

  serialize :affected_routes, Array

  belongs_to :neighborhood

  validates :neighborhood, presence: true

  def affected_routes
    read_attribute(:affected_routes).uniq.map do |route_id|
      Route.find route_id
    end
  end
end
