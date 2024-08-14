# == Schema Information
#
# Table name: social_connections
#
#  id                   :integer          not null, primary key
#  provider             :string
#  token                :text
#  twitter_token_secret :text
#  uid                  :text
#  created_at           :datetime         not null
#  updated_at           :datetime         not null
#  user_id              :integer          not null
#
# Indexes
#
#  index_social_connections_on_user_id  (user_id)
#
# Foreign Keys
#
#  user_id  (user_id => users.id)
#
require "test_helper"

class SocialConnectionTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
