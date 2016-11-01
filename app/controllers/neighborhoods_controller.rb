class NeighborhoodsController < ApplicationController
  def index
    @neighborhoods = Neighborhood.all
    render json: @neighborhoods
  end

  def show
    @neighborhood = Neighborhood.find params[:id]
    render json: @neighborhood
  end

  def filter
    @neighborhoods = Neighborhood.filter params[:query]
    render json: @neighborhoods
  end
end
