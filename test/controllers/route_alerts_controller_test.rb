require 'test_helper'

class RouteAlertsControllerTest < ActionDispatch::IntegrationTest
  ROUTE_ID = '1_100224'
  ALERT_PARAMS = {
    issue_type: 'construction',
    description: 'Alert description goes here...',
  }

  setup do
    @alert = create :route_alert
  end

  test 'should get all alerts for route' do
    get route_alerts_url(ROUTE_ID), as: :json
    assert_response :success
  end

  test 'should create route alert' do
    assert_difference 'RouteAlert.count' do
      post route_alerts_url(ROUTE_ID), params: ALERT_PARAMS, as: :json
    end

    assert_response 201
  end

  test 'should show route alert' do
    get route_alert_url(@alert), as: :json
    assert_response :success
  end

  test 'should upvote route alert' do
    assert_difference 'Vote.count' do
      post upvote_route_alert_url(@alert), as: :json
    end
  end

  test 'should downvote route alert' do
    assert_difference 'Vote.count' do
      post downvote_route_alert_url(@alert), as: :json
    end
  end
end
