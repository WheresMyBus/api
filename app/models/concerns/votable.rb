# Contains functionality that allows a model to be votable.
module Votable
  extend ActiveSupport::Concern

  included do
    has_many :votes, as: :votable
  end

  # gets all upvotes
  def upvotes
    votes.up
  end

  # gets all downvotes
  def downvotes
    votes.down
  end

  # gets the number of upvotes
  def upvote_count
    upvotes.count
  end

  # gets the number of downvotes
  def downvote_count
    downvotes.count
  end

  # gets the number of upvotes and downvotes
  def vote_count
    {
      upvotes: upvote_count,
      downvotes: downvote_count
    }
  end

  # creates an upvote unless the given user has already voted
  def upvote!(user_id)
    upvotes.create user_id: user_id
  end

  # creates a downvote unless the given user has already voted
  def downvote!(user_id)
    downvotes.create user_id: user_id
  end

  # removes a vote if one exists
  def unvote!(user_id)
    votes.find_by(user_id: user_id)&.destroy
  end
end
