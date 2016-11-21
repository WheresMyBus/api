class RouteAlertsController < ApplicationController
  before_action :set_route, only: %i(index create)
  before_action :set_alert, only: %i(show upvote downvote)

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

  def upvote
    @vote = @alert.upvote! params[:user_id]
    render json: @vote
  end

  def downvote
    @vote = @alert.downvote! params[:user_id]
    render json: @vote
  end

  private

  def set_route
    @route = Route.find params[:route_id]
  end

  def set_alert
    @alert = RouteAlert.find params[:id]
  end

  def alert_params
    params.permit :user_id, :issues, :description
  end
end
