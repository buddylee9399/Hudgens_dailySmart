require "test_helper"

class PostLinksControllerTest < ActionDispatch::IntegrationTest
  setup do
    @post_link = post_links(:one)
  end

  test "should get index" do
    get post_links_url
    assert_response :success
  end

  test "should get new" do
    get new_post_link_url
    assert_response :success
  end

  test "should create post_link" do
    assert_difference("PostLink.count") do
      post post_links_url, params: { post_link: { link_url: @post_link.link_url, post_id: @post_link.post_id } }
    end

    assert_redirected_to post_link_url(PostLink.last)
  end

  test "should show post_link" do
    get post_link_url(@post_link)
    assert_response :success
  end

  test "should get edit" do
    get edit_post_link_url(@post_link)
    assert_response :success
  end

  test "should update post_link" do
    patch post_link_url(@post_link), params: { post_link: { link_url: @post_link.link_url, post_id: @post_link.post_id } }
    assert_redirected_to post_link_url(@post_link)
  end

  test "should destroy post_link" do
    assert_difference("PostLink.count", -1) do
      delete post_link_url(@post_link)
    end

    assert_redirected_to post_links_url
  end
end
