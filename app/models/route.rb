class Route
  attr_reader :id,
              :number,
              :name

  def initialize(route)
    @id = route.id
    @number = route.short_name.presence
    @name = route.description.presence || route.long_name.presence
  end

  def self.all
    SUPPORTED_AGENCIES.map do |id|
      OneBusAway.routes_for_agency(id).map do |route|
        new route
      end
    end.flatten
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