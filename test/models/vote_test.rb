require 'test_helper'

class VoteTest < ActiveSupport::TestCase
  test 'should not be valid without a votable association' do
    vote = build :vote
    assert_not vote.valid?
  end

  test 'should not be valid without a user id' do
    vote = build :route_alert_vote, user_id: nil
    assert_not vote.valid?
  end

  test 'should not be valid without a value' do
    vote = build :route_alert_vote, value: nil
    assert_not vote.valid?
  end
end
