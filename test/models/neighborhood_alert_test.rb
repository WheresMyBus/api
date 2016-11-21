require 'test_helper'

class NeighborhoodAlertTest < ActiveSupport::TestCase
  test 'should not be valid without issues' do
    alert = build :neighborhood_alert, issues: nil
    assert_not alert.valid?
  end

  test 'should not be valid without description' do
    alert = build :neighborhood_alert, description: nil
    assert_not alert.valid?
  end

  test 'should not be valid without user id' do
    alert = build :neighborhood_alert, user_id: nil
    assert_not alert.valid?
  end

  test 'should not be valid without neighborhood' do
    alert = build :neighborhood_alert, neighborhood: nil
    assert_not alert.valid?
  end
end
