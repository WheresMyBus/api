class Vote < ApplicationRecord
  enum value: %i(up down)

  belongs_to :votable, polymorphic: true

  validates :votable, :value, presence: true
end
