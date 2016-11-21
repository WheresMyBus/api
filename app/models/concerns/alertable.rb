module Alertable
  extend ActiveSupport::Concern

  include Votable
  include Commentable
  include Reportable

  included do
    validates :issues, :description, :user_id, presence: true
  end
end

