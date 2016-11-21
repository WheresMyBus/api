class Vote < ApplicationRecord
  enum value: %i(up down)

  belongs_to :votable, polymorphic: true

  validates :user_id, :value, :votable, presence: true
  validates :user_id, uniqueness: { scope: :votable }
end
