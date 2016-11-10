class RoutesController < ApplicationController
  before_action :set_route, only: :show

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

  private

  def set_route
    @route = Route.find params[:id]
  end
end
