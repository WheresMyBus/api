class NeighborhoodAlert < ApplicationRecord
  include Alertable

  belongs_to :neighborhood

  validates :neighborhood, presence: true
end
