class RouteAlert < ApplicationRecord
  include Alertable

  # enum issue_type: [
  #   :construction,
  #   :traffic,
  #   :other
  # ]
end
