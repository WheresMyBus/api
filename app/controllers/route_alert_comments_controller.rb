class RouteAlertCommentsController < ApplicationController
  before_action :set_alert, only: %i(index create)
  before_action :set_comment, only: :show

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

  private

  def set_alert
    @alert = RouteAlert.find params[:route_alert_id]
  end

  def set_comment
    @comment = Comment.find params[:id]
  end
end
