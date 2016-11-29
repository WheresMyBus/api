# Models a bus stop.
class BusStop
  include ActiveModel::Serialization

  # generates getter methods for the specified attributes
  attr_reader :id,
              :location,
              :direction,
              :name,
              :routes

  # Constructs a new object from a OneBusAway bus stop object and a list of routes.
  def initialize(bus_stop, routes)
    @id = bus_stop&.id
    @location = bus_stop&.location
    @direction = bus_stop&.direction
    @name = bus_stop&.name
    @routes = routes
  end

  # Gets all bus stops near the given location. A search radius (in meters) can also be specified.
  def self.for_location(location, radius: nil)
    # gets the bus stop information from OneBusAway, including the referenced routes
    stops, routes = OneBusAway.stops_for_location(location,
                                                  radius: radius,
                                                  include_routes: true)

    stops.map do |stop|
      # gets the list of routes that corresponds to the bus stop object's list of route ids
      filtered_routes = routes.select do |route|
        stop.route_ids.include? route.id
      end

      # creates a list of routes from the list of OneBusAway route objects
      filtered_routes.map! do |route|
        Route.new route
      end

      # creates a new bus stop object from the OneBusAway bus stop object and list of routes
      new stop, filtered_routes
    end
  end
end
