require 'test_helper'

class UserControllerTest < ActionDispatch::IntegrationTest
  setup do
    @user = users(:test_user)
    sign_in(@user)
  end

  test 'should get index when not signed in' do
    sign_out(@user)
    get user_url(@user)
    assert_response :success
  end

  test 'should get channel when not signed in' do
    sign_out(@user)
    get user_channel_url(@user)
    assert_response :success
  end

  test 'should get tagged when not signed in' do
    sign_out(@user)
    get user_tagged_url(@user)
    assert_response :success
  end

  test 'should not get saved when not signed in' do
    sign_out(@user)
    get user_saved_url(@user)
    assert_redirected_to new_user_session_url
  end

  test 'should get saved when signed in' do
    get user_saved_url(@user)
    assert_response :success
  end

  test 'should get tagged when signed in' do
    get user_tagged_url(@user)
    assert_response :success
  end

  test 'should get channel when signed in' do
    get user_channel_url(@user)
    assert_response :success
  end

  test 'should get index when signed in' do
    get user_url(@user)
    assert_response :success
  end
end
