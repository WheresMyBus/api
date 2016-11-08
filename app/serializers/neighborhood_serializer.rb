class NeighborhoodSerializer < ActiveModel::Serializer
  attributes :id, :name

  has_many :alerts
end
