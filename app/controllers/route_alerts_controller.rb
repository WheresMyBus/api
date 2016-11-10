class RouteAlertsController < ApplicationController
  before_action :set_route, only: %i(index create)
  before_action :set_alert, only: :show

  def index
    @alerts = @route.alerts
    render json: @alerts
  end

  def show
    render json: @alert
  end

  def create
    @alert = @route.alerts.new alert_params

    if @alert.save
      render json: @alert, status: :created, location: @alert
    else
      render json: @alert.errors, status: :unprocessable_entity
    end
  end

  private

  def set_route
    @route = Route.find params[:route_id]
  end

  def set_alert
    @alert = RouteAlert.find params[:id]
  end

  def alert_params
    params.permit :user_id, :alert_type, :description
  end
end
