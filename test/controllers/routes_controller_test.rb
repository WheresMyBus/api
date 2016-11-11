require 'test_helper'

class RoutesControllerTest < ActionDispatch::IntegrationTest
  ROUTE_ID = '1_100224'

  test 'should get all routes' do
    get routes_url, as: :json
    assert_response :success
  end

  test 'should get route' do
    get route_url(ROUTE_ID), as: :json
    assert_response :success
  end
end
