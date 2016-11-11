class NeighborhoodAlertSerializer < ActiveModel::Serializer
  attributes :id,
             :user_id,
             :issue_type,
             :description,
             :upvotes,
             :downvotes,
             :neighborhood_id,
             :created_at

  def upvotes
    object.upvote_count
  end

  def downvotes
    object.downvote_count
  end
end
