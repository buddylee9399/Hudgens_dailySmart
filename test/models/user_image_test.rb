# == Schema Information
#
# Table name: user_images
#
#  id         :integer          not null, primary key
#  img        :text
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  user_id    :integer          not null
#
# Indexes
#
#  index_user_images_on_user_id  (user_id)
#
# Foreign Keys
#
#  user_id  (user_id => users.id)
#
require "test_helper"

class UserImageTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
