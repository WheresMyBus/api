class RouteAlertSerializer < ActiveModel::Serializer
  attributes :id,
             :user_id,
             :alert_type,
             :description,
             :upvotes,
             :downvotes,
             :route_id,
             :created_at

  def upvotes
    object.upvote_count
  end

  def downvotes
    object.downvote_count
  end
end
