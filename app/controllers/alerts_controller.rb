class AlertsController < ApplicationController
  before_action :set_alert, only: %i(show upvote downvote unvote report)

  def show
    render json: @alert
  end

  def upvote
    @alert.upvote! params[:user_id]
    render json: @alert.vote_count
  end

  def downvote
    @alert.downvote! params[:user_id]
    render json: @alert.vote_count
  end

  def unvote
    @alert.unvote! params[:user_id]
    render json: @alert.vote_count
  end

  def report
    @report = @alert.report! params[:user_id]
    render json: @report
  end
end
