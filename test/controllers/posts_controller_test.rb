require 'test_helper'

class PostsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @post = posts(:one)
    @user = users(:test_user)
    sign_in(@user)
  end

  test 'should get index when signed in' do
    get posts_url
    assert_response :success
  end

  test 'should get new when signed in' do
    get new_post_url
    assert_response :success
  end

  test 'should create post when signed in' do
    assert_difference('Post.count') do
      post posts_url, params: { post: { body: @post.body, user_id: @post.user_id } }
    end

    assert_redirected_to post_url(Post.last)
  end

  test 'should show post when signed in' do
    get post_url(@post)
    assert_response :success
  end

  test 'should get edit when signed in' do
    get edit_post_url(@post)
    assert_response :success
  end

  test 'should update post when signed in' do
    patch post_url(@post), params: { post: { body: @post.body, user_id: @post.user_id } }
    assert_redirected_to post_url(@post)
  end

  test 'should destroy post when signed in' do
    assert_difference('Post.count', -1) do
      delete post_url(@post)
    end

    assert_redirected_to posts_url
  end

  test 'should not get index when not signed in' do
    sign_out(@user)
    get posts_url
    assert_redirected_to new_user_session_url
  end

  test 'should not get new when not signed in' do
    sign_out(@user)
    get new_post_url
    assert_redirected_to new_user_session_url
  end

  test 'should not create post when not signed in' do
    sign_out(@user)
    assert_no_difference('Post.count') do
      post posts_url, params: { post: { body: @post.body, user_id: @post.user_id } }
    end

    assert_redirected_to new_user_session_url
  end

  test 'should show post when not signed in' do
    sign_out(@user)
    get post_url(@post)
    assert_response :success
  end

  test 'should not get edit when not signed in' do
    sign_out(@user)
    get edit_post_url(@post)
    assert_redirected_to new_user_session_url
  end

  test 'should not update post when not signed in' do
    sign_out(@user)
    patch post_url(@post), params: { post: { body: @post.body, user_id: @post.user_id } }
    assert_redirected_to new_user_session_url
  end

  test 'should not destroy post when not signed in' do
    sign_out(@user)
    assert_no_difference('Post.count') do
      delete post_url(@post)
    end

    assert_redirected_to new_user_session_url
  end

  test 'should not destroy post when current user is different than post user' do
    sign_out(@user)
    sign_in(users(:test_user_2))
    assert_no_difference('Post.count') do
      delete post_url(@post)
    end

    assert_redirected_to root_url
  end

  test 'should not update post when current user is different than post user' do
    sign_out(@user)
    sign_in(users(:test_user_2))
    patch post_url(@post), params: { post: { body: @post.body, user_id: @post.user_id } }
    assert_redirected_to root_url
  end
end
