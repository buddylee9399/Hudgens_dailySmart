require "application_system_test_case"

class VoteCountsTest < ApplicationSystemTestCase
  setup do
    @vote_count = vote_counts(:one)
  end

  test "visiting the index" do
    visit vote_counts_url
    assert_selector "h1", text: "Vote counts"
  end

  test "should create vote count" do
    visit vote_counts_url
    click_on "New vote count"

    fill_in "Number of votes", with: @vote_count.number_of_votes
    fill_in "Post", with: @vote_count.post_id
    click_on "Create Vote count"

    assert_text "Vote count was successfully created"
    click_on "Back"
  end

  test "should update Vote count" do
    visit vote_count_url(@vote_count)
    click_on "Edit this vote count", match: :first

    fill_in "Number of votes", with: @vote_count.number_of_votes
    fill_in "Post", with: @vote_count.post_id
    click_on "Update Vote count"

    assert_text "Vote count was successfully updated"
    click_on "Back"
  end

  test "should destroy Vote count" do
    visit vote_count_url(@vote_count)
    click_on "Destroy this vote count", match: :first

    assert_text "Vote count was successfully destroyed"
  end
end
