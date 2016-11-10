require 'test_helper'

class RouteAlertsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @route_alert = route_alerts(:one)
  end

  test "should get index" do
    get route_alerts_url, as: :json
    assert_response :success
  end

  test "should create route_alert" do
    assert_difference('RouteAlert.count') do
      post route_alerts_url, params: { route_alert: {  } }, as: :json
    end

    assert_response 201
  end

  test "should show route_alert" do
    get route_alert_url(@route_alert), as: :json
    assert_response :success
  end

  test "should update route_alert" do
    patch route_alert_url(@route_alert), params: { route_alert: {  } }, as: :json
    assert_response 200
  end

  test "should destroy route_alert" do
    assert_difference('RouteAlert.count', -1) do
      delete route_alert_url(@route_alert), as: :json
    end

    assert_response 204
  end
end
