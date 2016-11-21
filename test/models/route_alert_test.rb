require 'test_helper'

class RouteAlertTest < ActiveSupport::TestCase
  test 'should not be valid without issues' do
    alert = build :route_alert, issues: nil
    assert_not alert.valid?
  end

  test 'should not be valid without description' do
    alert = build :route_alert, description: nil
    assert_not alert.valid?
  end

  test 'should not be valid without user id' do
    alert = build :route_alert, user_id: nil
    assert_not alert.valid?
  end

  test 'should not be valid without route id' do
    alert = build :route_alert, route_id: nil
    assert_not alert.valid?
  end
end
