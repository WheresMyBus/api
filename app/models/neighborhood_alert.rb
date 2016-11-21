class NeighborhoodAlert < ApplicationRecord
  include Alertable

  serialize :affected_routes, Array

  belongs_to :neighborhood

  validates :neighborhood, presence: true
end
