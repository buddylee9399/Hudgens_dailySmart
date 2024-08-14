require "test_helper"

class SocialConnectionsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @social_connection = social_connections(:one)
  end

  test "should get index" do
    get social_connections_url
    assert_response :success
  end

  test "should get new" do
    get new_social_connection_url
    assert_response :success
  end

  test "should create social_connection" do
    assert_difference("SocialConnection.count") do
      post social_connections_url, params: { social_connection: { provider: @social_connection.provider, uid: @social_connection.uid, user_id: @social_connection.user_id } }
    end

    assert_redirected_to social_connection_url(SocialConnection.last)
  end

  test "should show social_connection" do
    get social_connection_url(@social_connection)
    assert_response :success
  end

  test "should get edit" do
    get edit_social_connection_url(@social_connection)
    assert_response :success
  end

  test "should update social_connection" do
    patch social_connection_url(@social_connection), params: { social_connection: { provider: @social_connection.provider, uid: @social_connection.uid, user_id: @social_connection.user_id } }
    assert_redirected_to social_connection_url(@social_connection)
  end

  test "should destroy social_connection" do
    assert_difference("SocialConnection.count", -1) do
      delete social_connection_url(@social_connection)
    end

    assert_redirected_to social_connections_url
  end
end
