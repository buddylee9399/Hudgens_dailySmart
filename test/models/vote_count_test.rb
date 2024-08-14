# == Schema Information
#
# Table name: vote_counts
#
#  id              :integer          not null, primary key
#  number_of_votes :integer
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#  post_id         :integer          not null
#
# Indexes
#
#  index_vote_counts_on_post_id  (post_id)
#
# Foreign Keys
#
#  post_id  (post_id => posts.id)
#
require "test_helper"

class VoteCountTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
