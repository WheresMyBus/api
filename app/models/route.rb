# Models a bus route.
class Route

  # generates getter methods for the specified attributes
  attr_reader :id,
              :number,
              :name

  # Constructs a new object from a OneBusAway route object.
  def initialize(route)
    @id = route&.id
    @number = route&.short_name.presence
    @name = route&.description.presence ||
            route&.long_name.presence
  end

  # Gets all routes for the supported transit agencies. The results are cached for one week in
  # order to limit the number of calls to the OneBusAway API.
  def self.all
    Rails.cache.fetch 'routes', expires_in: 1.week do
      SUPPORTED_AGENCIES.map do |id|
        OneBusAway.routes_for_agency(id).map do |route| # gets routes from OneBusAway
          new route
        end.reject do |route| # filters out the bus routes with no route number
          route.number.nil?
        end
      end.flatten
    end
  end

  # Gets all routes where the given query matches either a route's name or number, ignoring case.
  def self.filter(query)
    query = query.to_s.downcase

    all.select do |route|
      %i(number name).any? do |attribute|
        route.send(attribute)
             .try(:downcase)
             .try(:include?, query)
      end
    end
  end

  # Gets the route corresponding to the given id. The result is cached for one week in order to
  # limit the number of calls to the OneBusAway API.
  def self.find(id)
    Rails.cache.fetch "routes/#{id}", expires_in: 1.week do
      new OneBusAway.route(id)
    end
  end

  # Gets all of the alerts belonging to the route.
  def alerts
    RouteAlert.where route_id: id
  end

  # Gets the current latitude, longitude, and direction for each bus on the route.
  def bus_locations
    OneBusAway.trips_for_route(id, include_status: true).map do |trip|
      {
        lat: trip&.status&.position&.lat,
        lon: trip&.status&.position&.lon,
        direction: degrees_to_direction(trip&.status&.orientation)
      }
    end
  end

  private

  # All transit agencies supported by OneBusAway:
  #
  #   ID  | NAME
  #   ----+------------------------------------
  #   1   | Metro Transit
  #   3   | Pierce Transit
  #   19  | Intercity Transit
  #   23  | City of Seattle
  #   29  | Community Transit
  #   40  | Sound Transit
  #   95  | Washington State Ferries
  #   97  | Everett Transit
  #   98  | Seattle Children's Hospital Shuttle
  #   99  | GO Transit
  #   KMD | Kingcounty Marine Division

  # list of transit agencies to get route information about
  SUPPORTED_AGENCIES = %w(1 29 40).freeze

  # Translates a number of degrees into the corresponding cardinal direction.
  def degrees_to_direction(degrees)
    %i(N NW W SW S SE E NE)[((degrees / 45.0) + 0.5).floor % 8]
  end
end
