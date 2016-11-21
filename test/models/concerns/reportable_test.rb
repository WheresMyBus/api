require 'test_helper'

class ReportableTest < ActiveSupport::TestCase
  setup do
    Temping.create :thing do
      include Reportable
    end

    @user_id = SecureRandom.uuid
    @thing = Thing.create
  end

  teardown do
    Temping.teardown
  end

  test 'should be reportable' do
    assert_difference 'Report.count' do
      @thing.report! @user_id
    end
  end

  test 'should not be reportable more than once by the same user' do
    @thing.report! @user_id
    assert_no_difference 'Report.count' do
      @thing.report! @user_id
    end
  end
end
