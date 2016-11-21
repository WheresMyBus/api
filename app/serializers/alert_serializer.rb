class AlertSerializer < ActiveModel::Serializer
  attributes :id,
             :user_id,
             :issues,
             :description,
             :upvotes,
             :downvotes,
             :created_at

  def upvotes
    object.upvote_count
  end

  def downvotes
    object.downvote_count
  end
end
