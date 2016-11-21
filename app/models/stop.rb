class Stop
  attr_reader :id,
              :location,
              :direction,
              :name
              :route_ids

  def initialize(stop)
    @id = stop.id
    @location = stop.location
    @direction = stop.direction
    @name = stop.name
    @route_ids = stop.route_ids
  end

  def self.for_location(location, radius: nil)
    OneBusAway.stops_for_location(location, radius: radius).map do |stop|
      new stop
    end
  end

  def routes
    route_ids.map do |route_id|

    end
  end
end
