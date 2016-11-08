require 'test_helper'

class NeighborhoodsControllerTest < ActionDispatch::IntegrationTest
  test "should get all neighborhoods" do
    get neighborhoods_url, as: :json
    assert_response :success
  end

  test "should get neighborhood" do
    neighborhood = create :neighborhood
    get neighborhood_url(neighborhood), as: :json
    assert_response :success
  end

  test "should get filtered neighborhoods" do
    get filter_neighborhoods_url, as: :json
    assert_response :success
  end

  test "should get alerts for neighborhood" do
    neighborhood = create :neighborhood
    get alerts_neighborhood_url(neighborhood), as: :json
    assert_response :success
  end
end
