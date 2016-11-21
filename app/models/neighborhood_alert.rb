class NeighborhoodAlert < ApplicationRecord
  include Alertable

  has_many :affected_routes
  belongs_to :neighborhood

  validates :neighborhood, presence: true
end
