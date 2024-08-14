require "application_system_test_case"

class PostSocialSharesTest < ApplicationSystemTestCase
  setup do
    @post_social_share = post_social_shares(:one)
  end

  test "visiting the index" do
    visit post_social_shares_url
    assert_selector "h1", text: "Post social shares"
  end

  test "should create post social share" do
    visit post_social_shares_url
    click_on "New post social share"

    fill_in "Post", with: @post_social_share.post_id
    fill_in "Provider", with: @post_social_share.provider
    click_on "Create Post social share"

    assert_text "Post social share was successfully created"
    click_on "Back"
  end

  test "should update Post social share" do
    visit post_social_share_url(@post_social_share)
    click_on "Edit this post social share", match: :first

    fill_in "Post", with: @post_social_share.post_id
    fill_in "Provider", with: @post_social_share.provider
    click_on "Update Post social share"

    assert_text "Post social share was successfully updated"
    click_on "Back"
  end

  test "should destroy Post social share" do
    visit post_social_share_url(@post_social_share)
    click_on "Destroy this post social share", match: :first

    assert_text "Post social share was successfully destroyed"
  end
end
