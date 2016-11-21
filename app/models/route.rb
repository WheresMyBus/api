class Route
  attr_reader :id,
              :number,
              :name

  def initialize(route)
    @id = route.id
    @number = route.short_name.presence
    @name = route.description.presence ||
            route.long_name.presence
  end

  def self.all
    Rails.cache.fetch 'routes', expires_in: 1.week do
      SUPPORTED_AGENCIES.map do |id|
        OneBusAway.routes_for_agency(id).map do |route|
          new route
        end.reject do |route|
          route.number.nil?
        end
      end.flatten
    end
  end

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

  def self.find(id)
    Rails.cache.fetch 'routes/#{id}', expires_in: 1.week do
      new OneBusAway.route(id)
    end
  end

  def alerts
    RouteAlert.where route_id: id
  end

  def bus_locations
    OneBusAway.trips_for_route(id, include_status: true).map do |trip|
      {
        lat: trip.status.position.lat,
        lon: trip.status.position.lon,
        direction: degrees_to_direction(trip.status.orientation)
      }
    end
  end

  private

  # 1   - Metro Transit
  # 3   - Pierce Transit
  # 19  - Intercity Transit
  # 23  - City of Seattle
  # 29  - Community Transit
  # 40  - Sound Transit
  # 95  - Washington State Ferries
  # 97  - Everett Transit
  # 98  - Seattle Children's Hospital Shuttle
  # 99  - GO Transit
  # KMD - Kingcounty Marine Division
  SUPPORTED_AGENCIES = %w(1 29 40).freeze

  def degrees_to_direction(degrees)
    %i(N NW W SW S SE E NE)[((degrees / 45.0) + 0.5).floor % 8]
  end
end
