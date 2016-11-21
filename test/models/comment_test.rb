require 'test_helper'

class CommentTest < ActiveSupport::TestCase
  test 'should not be valid without commentable association' do
    comment = build :comment
    assert_not comment.valid?
  end

  test 'should not be valid without a message' do
    comment = build :route_alert_comment, message: nil
    assert_not comment.valid?
  end

  test 'should not be valid without a user id' do
    comment = build :route_alert_comment, user_id: nil
    assert_not comment.valid?
  end
end
