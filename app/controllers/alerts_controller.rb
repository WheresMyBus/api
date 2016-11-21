class AlertsController < ApplicationController
  before_action :set_alert, only: %i(show upvote downvote unvote report)

  def show
    render json: @alert
  end

  def upvote
    @vote = @alert.upvote! params[:user_id]
    render json: @vote
  end

  def downvote
    @vote = @alert.downvote! params[:user_id]
    render json: @vote
  end

  def unvote
    @vote = @alert.unvote! params[:user_id]
    render json: @vote
  end

  def report
    @report = @alert.report! params[:user_id]
    render json: @report
  end

  private

  def alert_params
    params.permit :user_id, :issues, :description, affected_routes: []
  end
end
