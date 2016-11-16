class CommentsController < ApplicationController
  before_action :set_comment

  def show
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

  def set_comment
    @comment = Comment.find params[:id]
  end
end
