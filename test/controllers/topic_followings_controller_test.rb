require "test_helper"

class TopicFollowingsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @topic_following = topic_followings(:one)
  end

  test "should get index" do
    get topic_followings_url
    assert_response :success
  end

  test "should get new" do
    get new_topic_following_url
    assert_response :success
  end

  test "should create topic_following" do
    assert_difference("TopicFollowing.count") do
      post topic_followings_url, params: { topic_following: { topic_id: @topic_following.topic_id, user_id: @topic_following.user_id } }
    end

    assert_redirected_to topic_following_url(TopicFollowing.last)
  end

  test "should show topic_following" do
    get topic_following_url(@topic_following)
    assert_response :success
  end

  test "should get edit" do
    get edit_topic_following_url(@topic_following)
    assert_response :success
  end

  test "should update topic_following" do
    patch topic_following_url(@topic_following), params: { topic_following: { topic_id: @topic_following.topic_id, user_id: @topic_following.user_id } }
    assert_redirected_to topic_following_url(@topic_following)
  end

  test "should destroy topic_following" do
    assert_difference("TopicFollowing.count", -1) do
      delete topic_following_url(@topic_following)
    end

    assert_redirected_to topic_followings_url
  end
end
