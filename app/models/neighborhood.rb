class Neighborhood < ApplicationRecord
  has_many :alerts, class_name: 'NeighborhoodAlert',
                    dependent: :destroy

  validates :name, presence: true

  scope :filter, -> (query) { where 'LOWER(name) LIKE ?', "%#{query.downcase}%" }
end
