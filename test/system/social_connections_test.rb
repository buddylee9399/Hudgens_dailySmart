require "application_system_test_case"

class SocialConnectionsTest < ApplicationSystemTestCase
  setup do
    @social_connection = social_connections(:one)
  end

  test "visiting the index" do
    visit social_connections_url
    assert_selector "h1", text: "Social connections"
  end

  test "should create social connection" do
    visit social_connections_url
    click_on "New social connection"

    fill_in "Provider", with: @social_connection.provider
    fill_in "Uid", with: @social_connection.uid
    fill_in "User", with: @social_connection.user_id
    click_on "Create Social connection"

    assert_text "Social connection was successfully created"
    click_on "Back"
  end

  test "should update Social connection" do
    visit social_connection_url(@social_connection)
    click_on "Edit this social connection", match: :first

    fill_in "Provider", with: @social_connection.provider
    fill_in "Uid", with: @social_connection.uid
    fill_in "User", with: @social_connection.user_id
    click_on "Update Social connection"

    assert_text "Social connection was successfully updated"
    click_on "Back"
  end

  test "should destroy Social connection" do
    visit social_connection_url(@social_connection)
    click_on "Destroy this social connection", match: :first

    assert_text "Social connection was successfully destroyed"
  end
end
