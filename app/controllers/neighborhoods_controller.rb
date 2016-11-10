class NeighborhoodsController < ApplicationController
  before_action :set_neighborhood, only: [:show, :alerts]

  def index
    @neighborhoods = Neighborhood.all
    render json: @neighborhoods
  end

  def show
    render json: @neighborhood
  end

  def filter
    @neighborhoods = Neighborhood.filter params[:query]
    render json: @neighborhoods
  end

  def alerts
    @alerts = @neighborhood.alerts
    render json: @alerts
  end

  private

  def set_neighborhood
    @neighborhood = Neighborhood.find params[:id]
  end
end
