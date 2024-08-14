require "test_helper"

class PostSocialSharesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @post_social_share = post_social_shares(:one)
  end

  test "should get index" do
    get post_social_shares_url
    assert_response :success
  end

  test "should get new" do
    get new_post_social_share_url
    assert_response :success
  end

  test "should create post_social_share" do
    assert_difference("PostSocialShare.count") do
      post post_social_shares_url, params: { post_social_share: { post_id: @post_social_share.post_id, provider: @post_social_share.provider } }
    end

    assert_redirected_to post_social_share_url(PostSocialShare.last)
  end

  test "should show post_social_share" do
    get post_social_share_url(@post_social_share)
    assert_response :success
  end

  test "should get edit" do
    get edit_post_social_share_url(@post_social_share)
    assert_response :success
  end

  test "should update post_social_share" do
    patch post_social_share_url(@post_social_share), params: { post_social_share: { post_id: @post_social_share.post_id, provider: @post_social_share.provider } }
    assert_redirected_to post_social_share_url(@post_social_share)
  end

  test "should destroy post_social_share" do
    assert_difference("PostSocialShare.count", -1) do
      delete post_social_share_url(@post_social_share)
    end

    assert_redirected_to post_social_shares_url
  end
end
