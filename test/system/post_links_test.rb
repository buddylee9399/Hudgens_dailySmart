require "application_system_test_case"

class PostLinksTest < ApplicationSystemTestCase
  setup do
    @post_link = post_links(:one)
  end

  test "visiting the index" do
    visit post_links_url
    assert_selector "h1", text: "Post links"
  end

  test "should create post link" do
    visit post_links_url
    click_on "New post link"

    fill_in "Link url", with: @post_link.link_url
    fill_in "Post", with: @post_link.post_id
    click_on "Create Post link"

    assert_text "Post link was successfully created"
    click_on "Back"
  end

  test "should update Post link" do
    visit post_link_url(@post_link)
    click_on "Edit this post link", match: :first

    fill_in "Link url", with: @post_link.link_url
    fill_in "Post", with: @post_link.post_id
    click_on "Update Post link"

    assert_text "Post link was successfully updated"
    click_on "Back"
  end

  test "should destroy Post link" do
    visit post_link_url(@post_link)
    click_on "Destroy this post link", match: :first

    assert_text "Post link was successfully destroyed"
  end
end
