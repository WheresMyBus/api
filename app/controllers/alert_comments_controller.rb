class AlertCommentsController < ApplicationController
  before_action :set_alert

  def index
    @comments = @alert.comments
    render json: @comments
  end

  def create
    @comment = @alert.comment! params[:message], params[:user_id]
    render json: @comment
  end
end
