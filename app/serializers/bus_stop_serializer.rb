class BusStopSerializer < ActiveModel::Serializer
  attributes :id,
             :lat,
             :lon,
             :direction,
             :name,
             :routes

  def lat
    object.location.lat
  end

  def lon
    object.location.lon
  end
end
