class BusStopSerializer < ActiveModel::Serializer
  attributes :id,
             :lat,
             :lon,
             :direction,
             :name,
             :routes

  def lat
    location.lat
  end

  def lon
    location.lon
  end
end
