require 'test_helper'

class NeighborhoodTest < ActiveSupport::TestCase
  test "should not be valid with blank name" do
    neighborhood = build :neighborhood, name: nil
    assert_not neighborhood.valid?
  end

  test "should not be valid with duplicate name" do
    create :neighborhood
    neighborhood = build :neighborhood
    assert_not neighborhood.valid?
  end

  test "filter should return exact match" do
    neighborhood = create :neighborhood
    neighborhoods = Neighborhood.filter 'Ballard'
    assert_includes neighborhoods, neighborhood
  end

  test "filter should return partial match" do
    neighborhood = create :neighborhood
    neighborhoods = Neighborhood.filter 'Bal'
    assert_includes neighborhoods, neighborhood
  end

  test "filter should return all matches" do
    test1 = create :neighborhood, name: 'Test 1'
    test2 = create :neighborhood, name: 'Test 2'

    neighborhoods = Neighborhood.filter 'Test'

    assert_includes neighborhoods, test1
    assert_includes neighborhoods, test2
  end

  test "filter should not return non-match" do
    neighborhood = create :neighborhood
    neighborhoods = Neighborhood.filter 'Foo'
    assert_not_includes neighborhoods, neighborhood
  end
end
