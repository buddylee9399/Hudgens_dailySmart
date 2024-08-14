# == Schema Information
#
# Table name: topics
#
#  id           :integer          not null, primary key
#  deleted_at   :datetime
#  slug         :string
#  themes_count :integer          default(0)
#  title        :string
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#
require "test_helper"

class TopicTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
