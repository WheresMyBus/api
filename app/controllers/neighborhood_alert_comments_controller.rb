class NeighborhoodAlertCommentsController < ApplicationController
  before_action :set_alert, only: %i(index create)
  before_action :set_comment, only: %i(show upvote downvote)

  def index
    @comments = @alert.comments
    render json: @comments
  end

  def show
    render json: @comment
  end

  def create
    @comment = @alert.comment! params[:message], params[:user_id]
    render json: @comment
  end

  def upvote
    @vote = @comment.upvote! params[:user_id]
    render json: @vote
  end

  def downvote
    @vote = @comment.downvote! params[:user_id]
    render json: @vote
  end

  private

  def set_alert
    @alert = NeighborhoodAlert.find params[:neighborhood_alert_id]
  end

  def set_comment
    @comment = Comment.find params[:id]
  end
end