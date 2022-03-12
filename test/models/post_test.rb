require 'test_helper'

class PostTest < ActiveSupport::TestCase
  # Body can be up to 2,200 characters long
  test 'body should be at most 2,200 characters' do
    post = Post.new(body: 'a' * 2201, user: users(:test_user))
    assert_not post.valid?
  end
end
