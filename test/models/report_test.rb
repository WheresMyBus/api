require 'test_helper'

class ReportTest < ActiveSupport::TestCase
  test 'should not be valid without user id' do
    report = build :route_alert_report, user_id: nil
    assert_not report.valid?
  end
end
