class NeighborhoodAlert < ApplicationRecord
  include Alertable

  enum issue_type: [
    :construction,
    :traffic,
    :other
  ]

  belongs_to :neighborhood
end
