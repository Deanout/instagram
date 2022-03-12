require "test_helper"

class UserControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get user_index_url
    assert_response :success
  end

  test "should get channelsaved" do
    get user_channelsaved_url
    assert_response :success
  end

  test "should get tagged" do
    get user_tagged_url
    assert_response :success
  end
end
