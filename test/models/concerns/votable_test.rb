require 'test_helper'

class VotableTest < ActiveSupport::TestCase
  setup do
    Temping.create :thing do
      include Votable
    end

    @user_id = SecureRandom.uuid
    @thing = Thing.create
  end

  teardown do
    Temping.teardown
  end

  test 'should be upvotable' do
    assert_difference 'Vote.up.count' do
      @thing.upvote! @user_id
    end
  end

  test 'should be downvotable' do
    assert_difference 'Vote.down.count' do
      @thing.downvote! @user_id
    end
  end

  test 'should be unupvotable' do
    @thing.upvote! @user_id
    assert_difference 'Vote.up.count', -1 do
      @thing.unvote! @user_id
    end
  end

  test 'should be undownvotable' do
    @thing.downvote! @user_id
    assert_difference 'Vote.down.count', -1 do
      @thing.unvote! @user_id
    end
  end

  test 'same user should not be able to upvote more than once' do
    @thing.upvote! @user_id
    assert_no_difference 'Vote.up.count' do
      @thing.upvote! @user_id
    end
  end

  test 'same user should not be able to downvote more than once' do
    @thing.downvote! @user_id
    assert_no_difference 'Vote.down.count' do
      @thing.downvote! @user_id
    end
  end

  test 'same user should not be able to downvote after upvoting' do
    @thing.upvote! @user_id
    assert_no_difference 'Vote.count' do
      @thing.downvote! @user_id
    end
  end

  test 'same user should not be able to upvote after downvoting' do
    @thing.downvote! @user_id
    assert_no_difference 'Vote.count' do
      @thing.upvote! @user_id
    end
  end
end
