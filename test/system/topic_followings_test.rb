require "application_system_test_case"

class TopicFollowingsTest < ApplicationSystemTestCase
  setup do
    @topic_following = topic_followings(:one)
  end

  test "visiting the index" do
    visit topic_followings_url
    assert_selector "h1", text: "Topic followings"
  end

  test "should create topic following" do
    visit topic_followings_url
    click_on "New topic following"

    fill_in "Topic", with: @topic_following.topic_id
    fill_in "User", with: @topic_following.user_id
    click_on "Create Topic following"

    assert_text "Topic following was successfully created"
    click_on "Back"
  end

  test "should update Topic following" do
    visit topic_following_url(@topic_following)
    click_on "Edit this topic following", match: :first

    fill_in "Topic", with: @topic_following.topic_id
    fill_in "User", with: @topic_following.user_id
    click_on "Update Topic following"

    assert_text "Topic following was successfully updated"
    click_on "Back"
  end

  test "should destroy Topic following" do
    visit topic_following_url(@topic_following)
    click_on "Destroy this topic following", match: :first

    assert_text "Topic following was successfully destroyed"
  end
end
