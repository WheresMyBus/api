require 'test_helper'

class VoteTest < ActiveSupport::TestCase
  test 'should not be valid without a votable association' do
    vote = build :vote
    assert_not vote.valid?
  end
end
