module Commentable
  extend ActiveSupport::Concern

  included do
    has_many :comments, as: :commentable
  end

  def comment!(message, user_id = nil)
    comments.create message: message, user_id: user_id
  end
end
