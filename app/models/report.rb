class Report < ApplicationRecord
  belongs_to :reportable, polymorphic: true

  validates :user_id, :reportable, presence: true
  validates :user_id, uniqueness: { scope: :reportable }
end
