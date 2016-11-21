class Neighborhood < ApplicationRecord
  has_many :alerts, class_name: 'NeighborhoodAlert'

  validates :name, presence: true,
                   uniqueness: true

  scope :filter, -> (query) { where 'LOWER(name) LIKE ?', "%#{query&.downcase}%" }
end
