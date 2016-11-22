class BusStop
  attr_reader :id,
              :location,
              :direction,
              :name,
              :route_ids

  def initialize(bus_stop)
    @id = bus_stop.id
    @location = bus_stop.location
    @direction = bus_stop.direction
    @name = bus_stop.name
    @route_ids = bus_stop.route_ids
  end

  def self.for_location(location, radius: nil)
    OneBusAway.stops_for_location(location, radius: radius).map do |stop|
      new stop
    end
  end

  def routes
    route_ids.map do |route_id|
      Route.new OneBusAway.route(route_id)
    end
  end
end
