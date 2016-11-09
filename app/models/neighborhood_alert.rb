class NeighborhoodAlert < ApplicationRecord
  include Alertable

  belongs_to :neighborhood
end
