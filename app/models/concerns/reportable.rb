module Reportable
  extend ActiveSupport::Concern

  included do
    has_many :reportings, as: :reportable
  end

  def report!(user_id)
    reports.create user_id: user_id
  end
end
