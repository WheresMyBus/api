class Comment < ApplicationRecord
  include Votable
  include Reportable

  belongs_to :commentable, polymorphic: true

  validates :message, :user_id, :commentable, presence: true
end
