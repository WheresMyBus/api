require 'test_helper'

class NeighborhoodTest < ActiveSupport::TestCase
  test "should not save neighborhood without name" do
    neighborhood = Neighborhood.new
    assert_not neighborhood.save, "Saved the neighborhood without a name"
  end
end
