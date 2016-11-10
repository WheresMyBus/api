class VoteSerializer < ActiveModel::Serializer
  attributes :id, :user_id, :value
end
