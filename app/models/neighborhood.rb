class Neighborhood < ApplicationRecord
  scope :filter, -> (query) { where 'LOWER(name) LIKE ?', "%#{query.downcase}%" }
end
