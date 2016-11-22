class BusStopSerializer < ActiveModel::Serializer
  attributes :id,
             :location,
             :direction,
             :name,
             :route
end
