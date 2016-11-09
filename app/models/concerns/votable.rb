module Votable
  extend ActiveSupport::Concern

  included do
    has_many :votes, as: :votable
  end

  def upvotes
    votes.up
  end

  def downvotes
    votes.down
  end

  def upvote!(user_id = nil)
    upvotes.create user_id: user_id
  end

  def downvote!(user_id = nil)
    downvotes.create user_id: user_id
  end
end
