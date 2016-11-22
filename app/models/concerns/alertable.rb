# Contains functionality that allows a model to be alertable.
module Alertable
  extend ActiveSupport::Concern

  include Votable
  include Commentable
  include Reportable

  included do
    # makes issues, description, and user id required fields
    validates :issues, :description, :user_id, presence: true
  end
end

