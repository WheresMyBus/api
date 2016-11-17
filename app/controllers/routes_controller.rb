class RoutesController < ApplicationController
  before_action :set_route, only: %i(show bus_locations)

  def index
    @routes =
      if params[:filter]
        Route.filter params[:filter]
      else
        Route.all
      end

    render json: @routes
  end

  def show
    render json: @route
  end

  def bus_locations
    render json: @route.bus_locations
  end

  private

  def set_route
    @route = Route.find params[:id]
  end
end
