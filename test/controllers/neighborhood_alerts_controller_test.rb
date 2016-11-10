require 'test_helper'

class NeighborhoodAlertsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @neighborhood_alert = neighborhood_alerts(:one)
  end

  test "should get index" do
    get neighborhood_alerts_url, as: :json
    assert_response :success
  end

  test "should create neighborhood_alert" do
    assert_difference('NeighborhoodAlert.count') do
      post neighborhood_alerts_url, params: { neighborhood_alert: {  } }, as: :json
    end

    assert_response 201
  end

  test "should show neighborhood_alert" do
    get neighborhood_alert_url(@neighborhood_alert), as: :json
    assert_response :success
  end

  test "should update neighborhood_alert" do
    patch neighborhood_alert_url(@neighborhood_alert), params: { neighborhood_alert: {  } }, as: :json
    assert_response 200
  end

  test "should destroy neighborhood_alert" do
    assert_difference('NeighborhoodAlert.count', -1) do
      delete neighborhood_alert_url(@neighborhood_alert), as: :json
    end

    assert_response 204
  end
end
