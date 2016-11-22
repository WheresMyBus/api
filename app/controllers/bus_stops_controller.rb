class BusStopsController < ApplicationController
  def index
    location = OneBusAway::Location.new 'lat' => params[:lat], 'lon' => params[:lon]

    @bus_stops = BusStop.for_location location, radius: params[:radius]
    render json: @bus_stops
  end
end
