class NeighborhoodsController < ApplicationController
  before_action :set_neighborhood, only: :show

  def index
    @neighborhoods =
      if params[:filter]
        Neighborhood.filter params[:filter]
      else
        Neighborhood.all
      end

    render json: @neighborhoods
  end

  def show
    render json: @neighborhood
  end

  private

  def set_neighborhood
    @neighborhood = Neighborhood.find params[:id]
  end
end
