class RoutesController < ApplicationController
  before_action :set_route, only: [:show, :alerts]

  def index
    @routes = Route.all
    render json: @routes
  end

  def show
    render json: @route
  end

  def filter
    @routes = Route.filter params[:query]
    render json: @routes
  end

  def alerts
    @alerts = @route.alerts
    render json: @alerts
  end

  private

  def set_route
    @route = Route.find params[:id]
  end
end
