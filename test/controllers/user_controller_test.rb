require 'test_helper'

class UserControllerTest < ActionDispatch::IntegrationTest
  setup do
    @user = users(:test_user)
  end

  test 'should get index' do
    get user_url(@user)
    assert_response :success
  end

  test 'should get channel' do
    get user_channel_url(@user)
    assert_response :success
  end

  test 'should get tagged' do
    get user_tagged_url(@user)
    assert_response :success
  end

  test 'should get saved' do
    get user_saved_url(@user)
    assert_response :success
  end
end
