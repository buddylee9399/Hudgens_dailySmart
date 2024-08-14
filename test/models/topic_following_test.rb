# == Schema Information
#
# Table name: topic_followings
#
#  id         :integer          not null, primary key
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  topic_id   :integer          not null
#  user_id    :integer          not null
#
# Indexes
#
#  index_topic_followings_on_topic_id  (topic_id)
#  index_topic_followings_on_user_id   (user_id)
#
# Foreign Keys
#
#  topic_id  (topic_id => topics.id)
#  user_id   (user_id => users.id)
#
require "test_helper"

class TopicFollowingTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
