require 'test_helper'

class CommentableTest < ActiveSupport::TestCase
  setup do
    Temping.create :thing do
      include Commentable
    end

    @user_id = SecureRandom.uuid
    @thing = Thing.create
  end

  teardown do
    Temping.teardown
  end

  test 'should be commentable' do
    assert_difference 'Comment.count' do
      @thing.comment! 'test', @user_id
    end
  end
end
