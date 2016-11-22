# Contains functionality that allows a model to be commentable.
module Commentable
  extend ActiveSupport::Concern

  included do
    has_many :comments, as: :commentable
  end

  # creates a comment
  def comment!(message, user_id)
    comments.create message: message, user_id: user_id
  end
end
