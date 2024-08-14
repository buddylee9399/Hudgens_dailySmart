require "test_helper"

class VoteCountsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @vote_count = vote_counts(:one)
  end

  test "should get index" do
    get vote_counts_url
    assert_response :success
  end

  test "should get new" do
    get new_vote_count_url
    assert_response :success
  end

  test "should create vote_count" do
    assert_difference("VoteCount.count") do
      post vote_counts_url, params: { vote_count: { number_of_votes: @vote_count.number_of_votes, post_id: @vote_count.post_id } }
    end

    assert_redirected_to vote_count_url(VoteCount.last)
  end

  test "should show vote_count" do
    get vote_count_url(@vote_count)
    assert_response :success
  end

  test "should get edit" do
    get edit_vote_count_url(@vote_count)
    assert_response :success
  end

  test "should update vote_count" do
    patch vote_count_url(@vote_count), params: { vote_count: { number_of_votes: @vote_count.number_of_votes, post_id: @vote_count.post_id } }
    assert_redirected_to vote_count_url(@vote_count)
  end

  test "should destroy vote_count" do
    assert_difference("VoteCount.count", -1) do
      delete vote_count_url(@vote_count)
    end

    assert_redirected_to vote_counts_url
  end
end
