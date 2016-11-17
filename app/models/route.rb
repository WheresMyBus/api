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
    SUPPORTED_AGENCIES.map do |id|
      OneBusAway.routes_for_agency(id).map do |route|
        new route
      end.reject do |route|
        route.number.nil?
      end
    end.flatten
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
    new OneBusAway.route(id)
  end

  def alerts
    RouteAlert.where route_id: id
  end

  def bus_locations
    OneBusAway.trips_for_route(id, include_status: true).map do |trip|
      trip.status.position
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
end
