class CommentsController < ApplicationController
  before_action :set_comment, only: %i(show upvote downvote unvote report)

  def show
    render json: @comment
  end

  def upvote
    @comment.upvote! params[:user_id]
    render json: @comment.vote_count
  end

  def downvote
    @comment.downvote! params[:user_id]
    render json: @comment.vote_count
  end

  def unvote
    @comment.unvote! params[:user_id]
    render json: @comment.vote_count
  end

  def report
    @report = @comment.report! params[:user_id]
    render json: @report
  end

  private

  def set_comment
    @comment = Comment.find params[:id]
  end
end
