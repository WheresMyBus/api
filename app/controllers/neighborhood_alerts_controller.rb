class NeighborhoodAlertsController < ApplicationController
  before_action :set_neighborhood, only: %i(index create)
  before_action :set_alert, only: :show

  def index
    @alerts = @neighborhood.alerts
    render json: @alerts
  end

  def show
    render json: @alert
  end

  def create
    @alert = @neighborhood.alerts.new alert_params

    if @alert.save
      render json: @alert, status: :created, location: @alert
    else
      render json: @alert.errors, status: :unprocessable_entity
    end
  end

  private

  def set_neighborhood
    @neighborhood = Neighborhood.find params[:neighborhood_id]
  end

  def set_alert
    @alert = NeighborhoodAlert.find params[:id]
  end

  def alert_params
    params.permit :user_id, :alert_type, :description
  end
end