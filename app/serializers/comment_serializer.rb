class CommentSerializer < ActiveModel::Serializer
  attributes :id,
             :user_id,
             :message,
             :upvotes,
             :downvotes

  def upvotes
    object.upvote_count
  end

  def downvotes
    object.downvote_count
  end
end
