require 'test_helper'

class NeighborhoodAlertsControllerTest < ActionDispatch::IntegrationTest
  ALERT_PARAMS = {
    issue_type: 'construction',
    description: 'Alert description goes here...',
  }

  setup do
    @alert = create :neighborhood_alert
    @neighborhood = @alert.neighborhood
  end

  test 'should get all alerts for neighborhood' do
    get neighborhood_alerts_url(@neighborhood), as: :json
    assert_response :success
  end

  test 'should create neighborhood alert' do
    assert_difference 'NeighborhoodAlert.count' do
      post neighborhood_alerts_url(@neighborhood), params: ALERT_PARAMS, as: :json
    end

    assert_response 201
  end

  test 'should show neighborhood alert' do
    get neighborhood_alert_url(@alert), as: :json
    assert_response :success
  end

  test 'should upvote neighborhood alert' do
    assert_difference 'Vote.count' do
      post upvote_neighborhood_alert_url(@alert), as: :json
    end
  end

  test 'should downvote neighborhood alert' do
    assert_difference 'Vote.count' do
      post downvote_neighborhood_alert_url(@alert), as: :json
    end
  end
end
