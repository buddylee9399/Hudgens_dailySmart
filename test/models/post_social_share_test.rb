# == Schema Information
#
# Table name: post_social_shares
#
#  id         :integer          not null, primary key
#  provider   :string
#  status     :integer          default("not_to_export")
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  post_id    :integer          not null
#
# Indexes
#
#  index_post_social_shares_on_post_id  (post_id)
#
# Foreign Keys
#
#  post_id  (post_id => posts.id)
#
require "test_helper"

class PostSocialShareTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
