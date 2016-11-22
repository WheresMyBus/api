# Contains functionality that allows a model to be reportable.
module Reportable
  extend ActiveSupport::Concern

  included do
    has_many :reports, as: :reportable
  end

  # creates a report
  def report!(user_id)
    reports.create user_id: user_id
  end
end
