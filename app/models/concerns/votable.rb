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

  def upvote_count
    upvotes.count
  end

  def downvote_count
    downvotes.count
  end

  def upvote!(user_id)
    upvotes.create user_id: user_id
  end

  def downvote!(user_id)
    downvotes.create user_id: user_id
  end

  def unvote!(user_id)
    votes.find_by(user_id: user_id).destroy
  end
end
