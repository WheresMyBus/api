class BusStop
  include ActiveModel::Serialization

  attr_reader :id,
              :location,
              :direction,
              :name,
              :routes

  def initialize(bus_stop, routes)
    @id = bus_stop.id
    @location = bus_stop.location
    @direction = bus_stop.direction
    @name = bus_stop.name
    @routes = routes
  end

  def self.for_location(location, radius: nil)
    stops, routes = OneBusAway.stops_for_location(location,
                                                  radius: radius,
                                                  include_routes: true)

    stops.map do |stop|
      filtered_routes = routes.select do |route|
        stop.route_ids.include? route.id
      end

      filtered_routes.map! do |route|
        Route.new route
      end

      new stop, filtered_routes
    end
  end
end
